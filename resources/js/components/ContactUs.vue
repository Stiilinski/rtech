<template>
    <section id="contact" class="py-12 bg-white text-center p-10">
        <div class="w-full mx-auto flex flex-col gap-10">
            <h2 class="text-4xl font-bold text-gray-800">Contact Us</h2>

            <div class="w-full mx-auto p-6">
                <form action="#" method="POST">
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        <!-- Left Form Fields -->
                        <div class="space-y-4">
                            <div>
                                <label for="full-name" class="block text-left text-sm font-semibold text-gray-700">Full Name</label>
                                <input type="text" id="full-name" name="full-name" class="w-full mt-2 p-3 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" placeholder="Your Full Name" required>
                            </div>

                            <div>
                                <label for="email" class="block text-left text-sm font-semibold text-gray-700">Email</label>
                                <input type="email" id="email" name="email" class="w-full mt-2 p-3 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" placeholder="Your Email Address" required>
                            </div>

                            <div>
                                <label for="phone" class="block text-left text-sm font-semibold text-gray-700">Phone Number</label>
                                <input type="tel" id="phone" name="phone" class="w-full mt-2 p-3 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" placeholder="Your Phone Number" required>
                            </div>
                        </div>

                        <!-- Right Textarea -->
                        <div>
                            <div>
                                <label for="concern" class="block text-left text-sm font-semibold text-gray-700">Concern/Question</label>
                                <textarea id="concern" name="concern" rows="6" class="w-full mt-2 p-3 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" placeholder="Enter your concern or question here" required></textarea>
                            </div>
                        </div>
                    </div>

                    <!-- Submit Button -->
                    <div class="mt-6 text-center">
                        <button type="submit" class="w-full md:w-auto px-6 py-3 bg-[#e09f3e] text-white font-semibold rounded-md hover:bg-[#C98F38] focus:outline-none focus:ring-2 focus:ring-blue-500">
                            Submit
                        </button>
                    </div>
                </form>
            </div>

        </div>
    </section>
</template>

<script>
    export default {
        mounted() {
            console.log('Contact mounted.')
        }
    }
</script>