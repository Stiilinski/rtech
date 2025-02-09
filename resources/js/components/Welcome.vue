<script setup>
    import { ref, defineProps, computed } from 'vue';
    import { useForm } from '@inertiajs/vue3';
    import Card from '@/components/Card.vue';
    import Modal from '@/Components/Modal.vue';
    import ConfirmationModal from '@/Components/ConfirmationModal.vue';
    import InputLabel from '@/Components/InputLabel.vue';
    import InputError from '@/Components/InputError.vue';
    import TextInput from '@/Components/TextInput.vue';
    import PrimaryButton from '@/components/PrimaryButton.vue';
    import ActionMessage from '@/Components/ActionMessage.vue';

    const props = defineProps({
        posts: Array,
    });

    // Search query ref
    const searchQuery = ref('');
    const filteredPosts = computed(() => {
        if (!searchQuery.value) {
            return props.posts;
        }
        return props.posts.filter(post => {
            const titleMatch = post.title.toLowerCase().includes(searchQuery.value.toLowerCase());
            const authorMatch = post.users?.firstname.toLowerCase().includes(searchQuery.value.toLowerCase()) ||
                                post.users?.lastname.toLowerCase().includes(searchQuery.value.toLowerCase());
            return titleMatch || authorMatch;
        });
    });

    // States for viewing and editing modals
    const showModal = ref(false);
    const showEditModal = ref(false);
    const showDeleteModal = ref(false);
    const showArchiveModal = ref(false);
    const selectedPost = ref(null);

    // Open View Modal
    const openModal = (post) => {
        selectedPost.value = post;
        showModal.value = true;
    };

    // Close All Modal
    const closeModal = () => {
        showModal.value = false;
        showEditModal.value = false;
        showDeleteModal.value = false;
        showArchiveModal.value = false;
    };

    // Open Edit Modal
    const editPost = (post) => {
        selectedPost.value = { ...post };
        form.title = post.title;
        form.message = post.message;
        form.type = post.type;
        showEditModal.value = true;
    };

    // Open Delete Modal
    const confirmDeletePost = (post) => {
        selectedPost.value = post;
        showDeleteModal.value = true;
    };

    // Open Archive Modal
    const confirmArchivePost = (post) => {
        selectedPost.value = post;
        showArchiveModal.value = true;
    };


    // Form for submitting data
    const form = useForm({
        title: '',
        message: '',
        type: '',
    });

    // Submit edited post
    const submit = () => {
        form.put(route('posts.update', selectedPost.value.id), {
            preserveScroll: true,
            onSuccess: () => closeModal(),
        });
    };

    // Delete post function
    const deletePost = () => {
        form.delete(route('posts.destroy', selectedPost.value.id), {
            preserveScroll: true,
            onSuccess: () => closeModal(),
            onError: (errors) => console.error(errors),
        });
    };

    const archivePost = () => {
        form.put(route('posts.archive', selectedPost.value.id), {
            preserveScroll: true,
            onSuccess: () => closeModal(),
            onError: (errors) => console.error(errors),
        });
    };

</script>

<template>
    <div class="p-2">
        <div class="flex justify-end items-center gap-4 p-4">
            <h2 class="text-md">Search</h2>
            <TextInput 
                id="search" 
                type="text" 
                v-model="searchQuery"
                class="block border-red-800 focus:border-red-800 focus:ring-2 focus:ring-red-800 focus:outline-none" 
                placeholder="Search by Title or Author" 
                autocomplete="off"
            />
        </div>

        <!-- Filtered Posts -->
        <div v-if="filteredPosts.length" class="grid lg:grid-cols-3 gap-2 justify-items-center">
            <Card 
                v-for="post in filteredPosts" 
                :key="post.id" 
                :post="post"
                @open-modal="openModal(post)"
                @edit-post="editPost(post)"
                @delete-post="confirmDeletePost(post)"
                @archive-post="confirmArchivePost(post)"
            />
        </div>

        <p v-else class="text-gray-500">No matching posts found.</p>
        

        <!-- View Post Modal -->
        <Modal :show="showModal" @close="closeModal">
            <template v-slot:default>
                <div>
                    <img src="/images/logo.png" alt="Card Image" class="w-full h-[300px] object-fill rounded-t-lg" />
                </div>
                <div class="p-4 flex gap-2 flex-col">
                    <p><span class="text-xl font-semibold">{{ selectedPost?.title }}</span></p>
                    <hr>
                    <div class="h-[250px] flex gap-2 flex-col overflow-y-auto">
                        <p>{{ selectedPost?.message }}</p>
                    </div>
                    <hr>
                    <div class="footer flex justify-between">
                        <span><b>Author:</b> {{ selectedPost?.users?.firstname }} {{ selectedPost?.users?.lastname }}</span>
                        <span><b>Type:</b> {{ selectedPost?.type }}</span>
                    </div>
                </div>
            </template>
        </Modal>

        <!-- Edit/Update Post Modal -->
        <Modal :show="showEditModal" @close="closeModal">
            <template v-slot:default>
                <div class="p-4">
                    <h2 class="text-xl font-bold mb-4">Edit Post</h2>
                    <form @submit.prevent="submit">    
                        <InputLabel for="title" value="Title" />
                        <TextInput id="title" v-model="form.title" type="text" class="mt-1 block w-full" placeholder="Title" />
                        <InputError class="mt-2" :message="form?.errors?.title" />

                        <InputLabel for="message" value="Message" class="mt-2" />
                        <textarea id="message" v-model="form.message" rows="6" class="w-full border p-2 mt-2 rounded" placeholder="Message"></textarea>
                        <InputError class="mt-2" :message="form?.errors?.message" />

                        <InputLabel for="type" value="Type" />
                        <select id="type" v-model="form.type" class="mt-1 block w-full border p-2 rounded">
                            <option value="Task">Task</option>
                            <option value="News">News</option>
                            <option value="Update">Update</option>
                        </select>
                        <InputError class="mt-2" :message="form?.errors?.type" />

                        <div class="flex justify-end mt-4">
                            <ActionMessage :on="form.recentlySuccessful" class="me-3">
                                Saved.
                            </ActionMessage>

                            <PrimaryButton :class="{ 'opacity-25': form.processing }" :disabled="form.processing">
                                Save
                            </PrimaryButton>
                        </div>
                    </form>
                </div>
            </template>
        </Modal>

        <!-- Delete Post Confimation -->
        <ConfirmationModal :show="showDeleteModal" @close="closeModal">
            <template v-slot:title> Delete Post </template>
            <template v-slot:content>
                Are you sure you want to delete this post? This action cannot be undone.
            </template>
            <template v-slot:footer>
                <button @click="closeModal" class="mr-3 bg-gray-200 text-gray-800 px-4 py-2 rounded">Cancel</button>
                <button @click="deletePost" class="bg-red-600 text-white px-4 py-2 rounded">Delete</button>
            </template>
        </ConfirmationModal>

        <!-- Archive Post Confimation -->
        <ConfirmationModal :show="showArchiveModal" @close="closeModal">
            <template v-slot:title> Archive Post </template>
            <template v-slot:content>
                Are you sure you want to archive this post?
            </template>
            <template v-slot:footer>
                <button @click="closeModal" class="mr-3 bg-gray-200 text-gray-800 px-4 py-2 rounded">Cancel</button>
                <button @click="archivePost" class="bg-yellow-600 text-white px-4 py-2 rounded">Archive</button>
            </template>
        </ConfirmationModal>
    </div>
</template>
