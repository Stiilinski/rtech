<template>
    <!-- bg-gray-100 -->
    <div class="min-h-screen flex flex-col sm:justify-center items-center pt-6 sm:pt-0">
        <div>
            <slot name="logo" />
        </div>

        <div class="w-full sm:max-w-xl mt-6 px-6 py-4 overflow-hidden sm:rounded-lg">
            <slot name="content"/>
        </div>
    </div>
</template>
