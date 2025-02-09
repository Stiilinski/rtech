<script setup>
    import { ref, onMounted, onUnmounted } from 'vue';
    import { Head, Link } from '@inertiajs/vue3';

    const isMobileMenuOpen = ref(false);
    const currentHash = ref(window.location.hash || '#home');

    const scrollToSection = (hash) => {
        const section = document.querySelector(hash);
        if (section) {
            section.scrollIntoView({ behavior: 'smooth', block: 'start' });
        }
        currentHash.value = hash;
    };


    const updateHash = () => {
        if (window.location.hash) {
            scrollToSection(window.location.hash);
        }
    };

    const scrollPageDown = () => {
        window.scrollBy(0, 50);
    };

    onMounted(() => {
        window.addEventListener('hashchange', updateHash);
        
        setTimeout(() => {
            scrollPageDown();

            if (window.location.hash) {
                scrollToSection(window.location.hash);
            }
        }, 200);
    });

    onUnmounted(() => {
        window.removeEventListener('hashchange', updateHash);
    });

    const getActiveClass = (linkHash) => {
        return currentHash.value === linkHash ? 'active-link' : '';
    };
</script>

<template>
    <header class="bg-red-800 shadow-lg sticky top-0 z-50 transition-colors duration-300">
        <nav class="max-w-7xl mx-auto px-2 sm:px-6 lg:px-8" aria-label="Global">
            <div class="relative flex items-center justify-between h-16">

                <div class="absolute inset-y-0 right-0 flex items-center sm:hidden">
                    <button 
                        type="button" 
                        class="inline-flex items-center justify-center p-2 rounded-md text-white-400 hover:text-white hover:bg-[#e09f3e] focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-gray-800 focus:ring-white" 
                        aria-controls="mobile-menu" 
                        aria-expanded="false"
                        @click="isMobileMenuOpen = !isMobileMenuOpen">
                        <span class="sr-only">Open main menu</span>
                        <svg class="block h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="white" aria-hidden="true">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"></path>
                        </svg>
                    </button>
                </div>

                <div class="flex-1 flex items-center justify-between sm:items-stretch sm:justify-between">
                    <div class="flex-shrink-0 flex items-center gap-2">
                        <a href="/"><img class="h-10" src="/images/logo.png" alt="Logo"></a>
                        <h1 class="text-2xl font-extrabold text-[#fff]">R-Tech</h1>
                    </div>
                    <div class="hidden sm:block sm:ml-6">
                        <div class="flex space-x-4">
                            <a href="#home" 
                               :class="getActiveClass('#home')" 
                               class="text-white hover:bg-red-600 px-3 py-2 rounded-md text-sm font-medium">Home</a>
                            <a href="#services" 
                               :class="getActiveClass('#services')" 
                               class="text-white hover:bg-red-600 px-3 py-2 rounded-md text-sm font-medium">Services</a>
                            <a href="#contact" 
                               :class="getActiveClass('#contact')" 
                               class="text-white hover:bg-red-600 px-3 py-2 rounded-md text-sm font-medium">Contact Us</a>
                            <Link :href="route('login')" 
                                  class="text-white hover:bg-red-600 px-3 py-2 rounded-md text-sm font-medium">Login</Link>
                            <Link :href="route('register')" 
                                  class="text-white hover:bg-red-600 px-3 py-2 rounded-md text-sm font-medium">Register</Link>
                       </div>
                    </div>
                </div>
            </div>
        </nav>

        <div v-show="isMobileMenuOpen" class="sm:hidden" id="mobile-menu">
            <div class="space-y-1 px-2 pt-2 pb-3">
                <a href="#home" 
                   :class="getActiveClass('#home')" 
                   class="text-white hover:bg-red-600 hover:text-white block px-3 py-2 rounded-md text-base font-medium">Home</a>
                <a href="#services" 
                   :class="getActiveClass('#services')" 
                   class="text-white hover:bg-red-600 hover:text-white block px-3 py-2 rounded-md text-base font-medium">Services</a>
                <a href="#contact" 
                   :class="getActiveClass('#contact')" 
                   class="text-white hover:bg-red-600 hover:text-white block px-3 py-2 rounded-md text-base font-medium">Contact Us</a>
                <Link :href="route('login')" 
                      class="text-white hover:bg-red-600 hover:text-white block px-3 py-2 rounded-md text-base font-medium">Login</Link>
                <Link :href="route('register')" 
                      class="text-white hover:bg-red-600 hover:text-white block px-3 py-2 rounded-md text-base font-medium">Register</Link>
            </div>
        </div>
    </header>
</template>

<script>
export default {
    mounted() {
        console.log('Header mounted.');
    }
}
</script>
