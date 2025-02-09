<script setup>
import { Head, useForm } from '@inertiajs/vue3';
import AuthenticationCard from '@/Components/AuthenticationCard.vue';
import AuthenticationCardLogo from '@/Components/AuthenticationCardLogo.vue';
import InputError from '@/Components/InputError.vue';
import InputLabel from '@/Components/InputLabel.vue';
import PrimaryButton from '@/Components/PrimaryButton.vue';
import TextInput from '@/Components/TextInput.vue';

defineProps({
    status: String,
});

const form = useForm({
    email: '',
});

const submit = () => {
    form.post(route('password.email'));
};
</script>

<template>
    <Head title="Forgot Password" />

    <div class="relative bg-cover bg-center" style="background-image: url('/images/banner.png');">
        <!-- Overlay -->
        <div class="absolute inset-0 bg-red-800 bg-opacity-50"></div>

        <!-- Centered Content -->
        <div class="relative w-full">

            <AuthenticationCard>
                <template #logo>
                    <AuthenticationCardLogo />
                </template>


                <template #content>
                    <div class="bg-gray-100 w-full sm:max-w-xl mt-6 px-6 py-4 shadow-md overflow-hidden sm:rounded-lg">
                        <div class="mb-4 text-sm text-gray-600">
                            Forgot your password? No problem. Just let us know your email address and we will email you a password reset link that will allow you to choose a new one.
                        </div>

                        <div v-if="status" class="mb-4 font-medium text-sm text-green-600">
                            {{ status }}
                        </div>
                    
                        <form @submit.prevent="submit">
                            <div>
                                <InputLabel for="email" value="Email" />
                                <TextInput
                                    id="email"
                                    v-model="form.email"
                                    type="email"
                                    class="mt-1 block w-full border-red-800 focus:border-red-800 focus:ring-2 focus:ring-red-800 focus:outline-none"
                                    required
                                    autofocus
                                    autocomplete="username"
                                />
                                <InputError class="mt-2" :message="form.errors.email" />
                            </div>

                            <div class="flex items-center justify-end mt-4">
                                <PrimaryButton class="ms-4 w-full mx-auto bg-red-800 hover:bg-red-700 focus:bg-red-700 active:bg-red-900" :class="{ 'opacity-25': form.processing }" :disabled="form.processing">
                                    Email Password Reset Link
                                </PrimaryButton>
                            </div>
                        </form>
                    </div>
                </template>
            </AuthenticationCard>
        </div>
    </div>
</template>
