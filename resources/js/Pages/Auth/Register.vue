<script setup>
import { Head, Link, useForm } from '@inertiajs/vue3';
import AuthenticationCard from '@/Components/AuthenticationCard.vue';
import AuthenticationCardLogo from '@/Components/AuthenticationCardLogo.vue';
import Checkbox from '@/Components/Checkbox.vue';
import InputError from '@/Components/InputError.vue';
import InputLabel from '@/Components/InputLabel.vue';
import PrimaryButton from '@/Components/PrimaryButton.vue';
import TextInput from '@/Components/TextInput.vue';

const form = useForm({
    name: '',
    firstname: '',
    lastname: '',
    address: '',
    email: '',
    password: '',
    password_confirmation: '',
    terms: false,
});

const submit = () => {
    form.post(route('register'), {
        onFinish: () => form.reset('password', 'password_confirmation'),
    });
};
</script>

<template>
    <Head title="Register" />

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
                    <div class="bg-white w-full sm:max-w-xl mt-6 px-6 py-4 shadow-md overflow-hidden sm:rounded-lg">
                        <form @submit.prevent="submit">
                            <h1 class="flex items-center justify-center pb-8 font-bold text-xl text-red-700">REGISTRATION FORM</h1>

                            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">  <!-- Grid container -->

                                <!-- Username Field -->
                                <div>
                                    <InputLabel for="name" value="Username" />
                                    <TextInput
                                        id="name"
                                        v-model="form.name"
                                        type="text"
                                        class="mt-1 block w-full border-red-800 focus:border-red-800 focus:ring-2 focus:ring-red-800 focus:outline-none"
                                        required
                                        autofocus
                                        autocomplete="name"
                                    />
                                    <InputError class="mt-2" :message="form.errors.name" />
                                </div>

                                <!-- Firstname Field -->
                                <div>
                                    <InputLabel for="firstname" value="Firstname" />
                                    <TextInput
                                        id="firstname"
                                        v-model="form.firstname"
                                        type="text"
                                        class="mt-1 block w-full border-red-800 focus:border-red-800 focus:ring-2 focus:ring-red-800 focus:outline-none"
                                        required
                                        autofocus
                                        autocomplete="firstname"
                                    />
                                    <InputError class="mt-2" :message="form.errors.firstname" />
                                </div>

                                <!-- Lastname Field -->
                                <div>
                                    <InputLabel for="lastname" value="Lastname" />
                                    <TextInput
                                        id="lastname"
                                        v-model="form.lastname"
                                        type="text"
                                        class="mt-1 block w-full border-red-800 focus:border-red-800 focus:ring-2 focus:ring-red-800 focus:outline-none"
                                        required
                                        autofocus
                                        autocomplete="lastname"
                                    />
                                    <InputError class="mt-2" :message="form.errors.lastname" />
                                </div>

                                <!-- Address Field -->
                                <div>
                                    <InputLabel for="address" value="Address" />
                                    <TextInput
                                        id="address"
                                        v-model="form.address"
                                        type="text"
                                        class="mt-1 block w-full border-red-800 focus:border-red-800 focus:ring-2 focus:ring-red-800 focus:outline-none"
                                        required
                                        autofocus
                                        autocomplete="address"
                                    />
                                    <InputError class="mt-2" :message="form.errors.address" />
                                </div>

                                <!-- Email Field -->
                                <div>
                                    <InputLabel for="email" value="Email" />
                                    <TextInput
                                        id="email"
                                        v-model="form.email"
                                        type="email"
                                        class="mt-1 block w-full border-red-800 focus:border-red-800 focus:ring-2 focus:ring-red-800 focus:outline-none"
                                        required
                                        autocomplete="username"
                                    />
                                    <InputError class="mt-2" :message="form.errors.email" />
                                </div>

                                <!-- Password Field -->
                                <div>
                                    <InputLabel for="password" value="Password" />
                                    <TextInput
                                        id="password"
                                        v-model="form.password"
                                        type="password"
                                        class="mt-1 block w-full border-red-800 focus:border-red-800 focus:ring-2 focus:ring-red-800 focus:outline-none"
                                        required
                                        autocomplete="new-password"
                                    />
                                    <InputError class="mt-2" :message="form.errors.password" />
                                </div>

                                <!-- Password Confirmation Field -->
                                <div>
                                    <InputLabel for="password_confirmation" value="Confirm Password" />
                                    <TextInput
                                        id="password_confirmation"
                                        v-model="form.password_confirmation"
                                        type="password"
                                        class="mt-1 block w-full border-red-800 focus:border-red-800 focus:ring-2 focus:ring-red-800 focus:outline-none"
                                        required
                                        autocomplete="new-password"
                                    />
                                    <InputError class="mt-2" :message="form.errors.password_confirmation" />
                                </div>
                            
                                <div v-if="$page.props.jetstream.hasTermsAndPrivacyPolicyFeature" class="col-span-2">
                                    <InputLabel for="terms">
                                        <div class="flex items-center">
                                            <Checkbox id="terms" v-model:checked="form.terms" name="terms" required />
                                            <div class="ms-2 text-white">
                                                I agree to the
                                                <a target="_blank" :href="route('terms.show')" class="underline text-sm hover:text-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">Terms of Service</a>
                                                and
                                                <a target="_blank" :href="route('policy.show')" class="underline text-sm hover:text-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">Privacy Policy</a>
                                            </div>
                                        </div>
                                        <InputError class="mt-2" :message="form.errors.terms" />
                                    </InputLabel>
                                </div>      
                            </div>

                            <!-- Submit Button -->
                            <div class="flex items-center justify-end mt-4">
                                <Link :href="route('login')" class="underline text-sm text-red-800 hover:text-red-500 rounded-md focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                                    Already registered?
                                </Link>

                                <PrimaryButton class="ms-4 bg-red-800 hover:bg-red-700 focus:bg-red-700 active:bg-red-900" :class="{ 'opacity-25': form.processing }" :disabled="form.processing">
                                    Register
                                </PrimaryButton>
                            </div>
                        </form>
                    </div>
                </template>
            </AuthenticationCard>
        </div>
    </div>
</template>

