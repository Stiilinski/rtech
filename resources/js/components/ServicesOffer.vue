<template>
    <section class="py-12 bg-gray-100 text-center p-10">
        <div class="max-w-5xl mx-auto flex flex-col gap-10">
            <h2 class="text-4xl font-bold text-gray-800">Services Offer Information</h2>

            <p class="text-lg text-gray-600 mt-4">
                R-Tech delivers cutting-edge IT solutions to empower businesses in a digital-first world. From infrastructure to innovation, we’ve got you covered.
            </p>

            <!-- Icons Section -->
            <div class="grid grid-cols-1 md:grid-cols-3 gap-8 mt-8">
                <!-- Service 1 -->
                <div class="text-center bg-red-700 shadow-lg hover:shadow-xl hover:scale-105 transition transform duration-300 rounded-lg p-6 cursor-pointer">
                    <img src="/images/service1.png" alt="Web Development" class="w-16 mx-auto">
                    <h3 class="text-xl text-[#fff3b0] font-semibold mt-4">Web Development</h3>
                    <p class="text-[#F5AE44] mt-2">We create tailored web solutions that deliver exceptional user experiences and help drive business growth by utilizing the latest technologies.</p>
                </div>
                <!-- Service 2 -->
                <div class="text-center bg-red-700 shadow-lg hover:shadow-xl hover:scale-105 transition transform duration-300 rounded-lg p-6 cursor-pointer">
                    <img src="/images/service2.png" alt="Mobile Development" class="w-16 mx-auto">
                    <h3 class="text-xl font-semibold text-[#fff3b0] mt-4">Mobile Development</h3>
                    <p class="text-[#F5AE44] mt-2">We design and develop mobile applications for both iOS and Android, focusing on performance, user experience, and seamless integration with your business operations.</p>
                </div>
                <!-- Service 3 -->
                <div class="text-center bg-red-700 shadow-xl shadow-lg hover:shadow-xl hover:scale-105 transition transform duration-300 rounded-lg p-6 cursor-pointer">
                    <img src="/images/service3.png" alt="Project Management" class="w-16 mx-auto">
                    <h3 class="text-xl font-semibold text-[#fff3b0] mt-4">Project Management</h3>
                    <p class="text-[#F5AE44] mt-2">Our project management services ensure that your projects are completed on time, within budget, and to the highest quality standards, with constant communication and transparency.</p>
                </div>
            </div>
        </div>
    </section>
</template>

<script>
    export default {
        mounted() {
            console.log('Services Information mounted.')
        }
    }
</script>
