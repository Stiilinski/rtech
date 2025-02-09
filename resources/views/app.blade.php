<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title inertia>{{ config('app.name', 'Laravel') }}</title>
        <link href="/images/logo.png" rel="icon" />
        <style>
            html 
            {
                scroll-behavior: smooth!important;
            }
            .active-link 
            {
                color: #ffba08!important;
            }
        </style>

        <!-- Fonts -->
        <link rel="preconnect" href="https://fonts.bunny.net">
        <link href="https://fonts.bunny.net/css?family=figtree:400,500,600&display=swap" rel="stylesheet" />

        <!-- Scripts -->
        @routes
        @vite(['resources/js/app.js', "resources/js/Pages/{$page['component']}.vue"])
        @inertiaHead
    </head>
    <script>
        window.authUserId = @json(auth()->id()); // Pass the logged-in user's ID to the frontend
    </script>
    <body class="font-sans antialiased">
        @inertia
    </body>
</html>
