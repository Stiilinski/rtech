<p align="center"><a href="https://laravel.com" target="_blank"><img src="https://raw.githubusercontent.com/laravel/art/master/logo-lockup/5%20SVG/2%20CMYK/1%20Full%20Color/laravel-logolockup-cmyk-red.svg" width="400" alt="Laravel Logo"></a></p>

<p align="center">
<a href="https://github.com/laravel/framework/actions"><img src="https://github.com/laravel/framework/workflows/tests/badge.svg" alt="Build Status"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/dt/laravel/framework" alt="Total Downloads"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/v/laravel/framework" alt="Latest Stable Version"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/l/laravel/framework" alt="License"></a>
</p>

## Installation

- Extract the zip folder and put it in your desired folder.
- Open VS Code or any IDE fit for Laravel/Vue or website in general.
- Install composer using the command "composer install". Ensure Composer is installed and available in your system's path.
- Create new terminal and install NPM using the command "npm install" (NOTE: Node.js must be installed before running npm install).
- Run the command "npm run dev".
- Open a new terminal and then run the command "cp .env.example .env".
- After that you run "php artisan key:generate".
- Open the .env file and change 'SESSION_DRIVER=database' to 'SESSION_DRIVER=file' to avoid database dependencies, as this is just a design template.
- Then go back to the terminal where you run the "php artisan serve" command
- press CTRL and click the "http://127.0.0.1:8000"


## License

The Laravel framework is open-sourced software licensed under the [MIT license](https://opensource.org/licenses/MIT).
#