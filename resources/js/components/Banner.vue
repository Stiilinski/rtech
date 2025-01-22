<template>
    <section id="home" class="relative w-full bg-cover bg-center flex flex-col items-center justify-center p-12" style="background-image: url('/images/banner.png');">
        <div class="absolute inset-0 bg-red-900 bg-opacity-75"></div>

        <div class="relative flex flex-col items-center justify-center w-full max-w-4xl w-full mt-20">
            <h1 class="text-white text-6xl font-extrabold tracking-wide leading-tight text-center">Your All-in-One IT Service Partner.</h1>
            <p class="text-white text-lg text-center mt-4">
                At R-Tech, we provide comprehensive IT solutions tailored to meet your business needs. From web and mobile development to IT support, cloud services, and cybersecurity, we are here to drive your success with innovative technology and expert support.
            </p>
        </div>

        <div class="relative flex flex-col items-center justify-center w-full max-w-4xl w-full mt-20">
            <button class="px-6 py-3 bg-[#e09f3e] text-white text-sm font-medium rounded-lg hover:bg-[#C98F38] transition duration-200">
                Click Me
            </button>
        </div>
    </section>
</template>
  
<script>
    export default {
        mounted() {
            console.log('Banner mounted.')
        }
    }
</script>
