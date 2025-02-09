<script setup>
import { Head, Link, useForm } from '@inertiajs/vue3';
import AuthenticationCard from '@/Components/AuthenticationCard.vue';
import AuthenticationCardLogo from '@/Components/AuthenticationCardLogo.vue';
import Checkbox from '@/Components/Checkbox.vue';
import InputError from '@/Components/InputError.vue';
import InputLabel from '@/Components/InputLabel.vue';
import PrimaryButton from '@/Components/PrimaryButton.vue';
import TextInput from '@/Components/TextInput.vue';
import BannerLogin from '@/components/BannerLogin.vue';

defineProps({
    canResetPassword: Boolean,
    status: String,
});

const form = useForm({
    email: '',
    password: '',
    remember: false,
});

const submit = () => {
    form.transform(data => ({
        ...data,
        remember: form.remember ? 'on' : '',
    })).post(route('login'), {
        onFinish: () => form.reset('password'),
    });
};
</script>

<template>
    <Head title="Log in" />
    <div class="relative bg-cover bg-center" style="background-image: url('/images/banner.png');">
        
        <!-- Overlay -->
        <div class="absolute inset-0 bg-red-800 bg-opacity-60"></div>

        <!-- Centered Content -->
        <div class="relative w-full flex justify-end mx-auto">
            <BannerLogin class="hidden lg:flex"/>
            <AuthenticationCard class="w-full sm:w-[100%] md:w-[100%] lg:w-[50%] bg-gray-100 p-4">
                <template #logo>
                    <AuthenticationCardLogo class="w-full flex justify-center"/>
                    <div class="flex flex-col items-center pt-5">
                        <h1 class="text-2xl font-extrabold">Hello!</h1>
                        <span>It's Great To See You Again!</span>
                    </div>
                </template>



                <div v-if="status" class="mb-4 font-medium text-sm text-green-600">
                    {{ status }}
                </div>
                <template #content>
                    <div>
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

                            <div class="mt-4">
                                <InputLabel for="password" value="Password" />
                                <TextInput
                                    id="password"
                                    v-model="form.password"
                                    type="password"
                                    class="mt-1 block w-full border-red-800 focus:border-red-800 focus:ring-2 focus:ring-red-800 focus:outline-none"
                                    required
                                    autocomplete="current-password"
                                />
                                <InputError class="mt-2" :message="form.errors.password" />
                            </div>

                            <div class="block mt-4 flex justify-between">
                                <label class="flex items-center">
                                    <Checkbox v-model:checked="form.remember" name="remember" />
                                    <span class="ms-2 text-sm text-gray-600">Remember me</span>
                                </label>

                                <Link v-if="canResetPassword" :href="route('password.request')" class="underline text-sm text-gray-600 hover:text-gray-900 rounded-md focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                                    Forgot your password?
                                </Link>
                            </div>

                            <div class="flex items-center justify-end mt-4">
                                <PrimaryButton class="ms-4 w-full mx-auto bg-red-800 hover:bg-red-700 focus:bg-red-700 active:bg-red-900" :class="{ 'opacity-25': form.processing }" :disabled="form.processing">
                                    Log in
                                </PrimaryButton>
                            </div>
                        </form>
                    </div>
                </template>
            </AuthenticationCard>
        </div>
    </div>
</template>

<style scoped>
.bg-transparent {
    background-color: transparent!important;
}
</style>
