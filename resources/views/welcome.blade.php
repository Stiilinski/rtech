<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>R-Tech</title>

        <!-- Fonts -->
        <link rel="preconnect" href="https://fonts.bunny.net">
        <link href="https://fonts.bunny.net/css?family=figtree:400,500,600&display=swap" rel="stylesheet" />

        <!-- Styles-->
        @vite(['resources/css/app.css', 'resources/js/app.js'])
    </head>
    <body>
        <div id="app">
            <header-component></header-component>
            <banner-component></banner-component>
            <servicesinfo-component></servicesinfo-component>
            <servicesoffer-component></servicesoffer-component>
            <contact-component></contact-component>
            <footer-component></footer-component>
        </div>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const mobileMenuButton = document.querySelector('button[aria-controls="mobile-menu"]');
                const mobileMenu = document.getElementById('mobile-menu');
                
                mobileMenuButton.addEventListener('click', function() {
                    mobileMenu.classList.toggle('hidden');
                });
            });

        </script>
    </body>
    
</html>
