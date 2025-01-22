<template>
    <section class="py-12 bg-gray-100 text-center p-10 ">
        <div class="w-full mx-auto flex flex-col gap-10">
            <div class="mx-auto flex gap-10">
                <a href="#"><img src="/images/social1.png" class="w-8" alt="facebook"></a>
                <a href="#"><img src="/images/social2.png" class="w-8" alt="Instagram"></a>
                <a href="#"><img src="/images/social3.png" class="w-8" alt="X"></a>
                <a href="#"><img src="/images/social4.png" class="w-8" alt="LinkedIn"></a>
            </div>
            <div class="mx-auto flex gap-10">
                <a href="#" class="hover:text-[#e09f3e]">Home</a>
                <a href="#" class="hover:text-[#e09f3e]">Services</a>
                <a href="#" class="hover:text-[#e09f3e]">About Us</a>
                <a href="#" class="hover:text-[#e09f3e]">Contact Us</a>
            </div>
            <hr>
            <h1>All Rights Reserved</h1>
        </div>
    </section>
</template>

<script>
    export default {
        mounted() {
            console.log('Footer mounted.')
        }
    }
</script>