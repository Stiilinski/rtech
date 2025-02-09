<script setup>
    import { defineProps, ref, computed  } from 'vue';
    import { Link, router, useForm, usePage } from '@inertiajs/vue3';
    import AppLayout from '@/Layouts/AppLayout.vue';
    import Welcome from '@/components/Welcome.vue';
    import PrimaryButton from '@/components/PrimaryButton.vue';
    import DialogModal from '@/Components/DialogModal.vue';
    import InputLabel from '@/Components/InputLabel.vue';
    import SecondaryButton from '@/Components/SecondaryButton.vue';
    import TextInput from '@/Components/TextInput.vue';
    import ActionMessage from '@/Components/ActionMessage.vue';
    import FormCustom from '@/components/FormCustom.vue';
    import InputError from '@/Components/InputError.vue';

    const page = usePage();
    const authUser = computed(() => page.props.authUser);
    const loggedInUserId = computed(() => authUser.value?.id || null);

    const props = defineProps({
        posts: Array,
    });

    const showModal = ref(false);

    const openModal = () => {
        showModal.value = true;
    };

    const closeModal = () => {
        showModal.value = false;
    };

    const form = useForm({
        title: '',
        message: '',
        type: '',
        author: loggedInUserId,
    });

    const submit = () => {
        form.post(route('save'), {
            onSuccess: () => {
                closeModal(); 
                form.reset();
            }
        });
    };
</script>

<template>
    <AppLayout title="Tasks">
        <template #header>
            <h2 class="font-semibold text-xl text-red-800 leading-tight">
                Posts
            </h2>
            <PrimaryButton @click="openModal()" class="ms-4 bg-red-800 hover:bg-red-700 focus:bg-red-700 active:bg-red-900">
                CREATE +
            </PrimaryButton>
        </template>

        <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
                <div class="bg-white overflow-hidden shadow-2xl sm:rounded-lg">
                    <Welcome :posts="props.posts" />

                    <DialogModal :show="showModal" @close="closeModal" >
                        <template #title>
                            Create Post
                        </template>

                        <template #content>
                            <form @submit.prevent="submit">
                                <div class="flex flex-col gap-4">            
                                    <div>
                                        <InputLabel for="title" value="Title" />
                                        <TextInput
                                            id="email"
                                            v-model="form.title"
                                            type="text"
                                            class="mt-1 block w-full"
                                            required
                                            autofocus
                                            autocomplete="off"
                                        />
                                        <InputError class="mt-2" :message="form.errors.title" />
                                    </div>

                                    <div>
                                        <InputLabel for="message" value="Message" />
                                        <textarea
                                            id="message"
                                            v-model="form.message"
                                            class="mt-1 block w-full"
                                            required
                                            autofocus
                                            autocomplete="off"
                                            rows="4">
                                        </textarea>
                                        <InputError class="mt-2" :message="form.errors.message" />
                                    </div>

                                    <div>
                                        <InputLabel for="type" value="Type" />
                                        <select
                                            id="type"
                                            v-model="form.type"
                                            class="mt-1 block w-full"
                                            required>

                                            <option value="">Select Type</option>
                                            <option value="News">News</option>
                                            <option value="Task">Task</option>
                                            <option value="Update">Update</option>
                                        </select>

                                        <InputError class="mt-2" :message="form.errors.type" />
                                    </div>
                                </div>
                                <div class="flex items-center justify-end mt-4">
                                    <ActionMessage :on="form.recentlySuccessful" class="me-3">
                                        Saved.
                                    </ActionMessage>

                                    <PrimaryButton :disabled="form.processing" @click="submit">
                                        <span v-if="form.processing">Saving...</span>
                                        <span v-else>Save</span>
                                    </PrimaryButton>
                                </div>
                            </form>
                        </template>
                    </DialogModal>
                </div>
            </div>
        </div>
    </AppLayout>
</template>

<style>

</style>
