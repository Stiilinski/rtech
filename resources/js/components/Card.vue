<script setup>
  import { defineProps, ref, computed, defineEmits, onMounted, onBeforeUnmount } from 'vue';
  import { usePage } from '@inertiajs/vue3';

  const props = defineProps({
      post: Object,
  });

  const emit = defineEmits(['open-modal', 'edit-post', 'archive-post', 'delete-post']);

  const menuVisible = ref(false);
  const menuRef = ref(null);

  const authUser = computed(() => usePage().props.authUser);
  const isOwner = computed(() => authUser.value?.id === props.post.author);

  const toggleMenu = () => {
      menuVisible.value = !menuVisible.value;
  };

  // Function to close the menu when clicking outside
  const closeMenu = (event) => {
      if (menuRef.value && !menuRef.value.contains(event.target)) {
          menuVisible.value = false;
      }
  };

  // Add event listener when component is mounted
  onMounted(() => {
      document.addEventListener('click', closeMenu);
  });

  // Remove event listener when component is unmounted
  onBeforeUnmount(() => {
      document.removeEventListener('click', closeMenu);
  });

    const openModal = () => {
        emit('open-modal', props.post);
    };

    const editCard = () => {
        emit('edit-post', props.post);
    };

    const archiveCard = () => {
        emit('archive-post', props.post);
    };

    const confirmDelete = () => {
        emit('delete-post', props.post.id);
    };


  // Truncate message
  const truncatedMessage = computed(() => {
    const maxLength = 70;
    const message = props.post.message || '';
      
    if (message.length > maxLength) {
        return message.substring(0, maxLength) + '... See more';
    }
    
    return message;
  });
</script>

<template>
  <div 
    class="card border rounded-lg shadow-lg p-4 bg-white relative w-full cursor-pointer transform transition-transform duration-300 ease-in-out hover:scale-95"
    @click="openModal">
    
    <div class="relative">
        <img src="/images/logo.png" alt="Card Image" class="w-full h-24 object-cover rounded-t-lg" />
        
        <div v-if="isOwner" class="absolute top-2 right-2" ref="menuRef">
            <button @click.stop="toggleMenu" class="text-gray-600 hover:text-gray-800 focus:outline-none">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" class="w-6 h-6">
                    <path fill="#FFF3B0" d="M12 5a1.5 1.5 0 110-3 1.5 1.5 0 010 3zm0 8a1.5 1.5 0 110-3 1.5 1.5 0 010 3zm0 8a1.5 1.5 0 110-3 1.5 1.5 0 010 3z"/>
                </svg>
            </button>

            <!-- Dropdown Menu -->
            <div v-if="menuVisible" class="absolute top-8 right-0 bg-white shadow-md rounded-md w-40 z-10">
                <button @click.stop="editCard" class="block w-full text-left px-4 py-2 hover:bg-gray-100">Edit</button>
                <button @click.stop="archiveCard" class="block w-full text-left px-4 py-2 hover:bg-gray-100">Archive</button>
                <button @click.stop="confirmDelete" class="block w-full text-left px-4 py-2 hover:bg-gray-100 text-red-600">Delete</button>
            </div>
        </div>
    </div>
    
    <div class="p-4">
        <h3 class="text-lg font-semibold text-gray-900">{{ post.title }}</h3>
        <p class="text-gray-600 text-sm mt-1">{{ truncatedMessage }}</p>
    </div>

    <div class="border-t mt-3 pt-2 text-sm text-gray-500 flex justify-between">
        <span>Author: <b>{{ post.users?.firstname }} {{ post.users?.lastname }}</b></span>
        <span>Type: <b>{{ post.type }}</b></span>
    </div>
  </div>
</template>

