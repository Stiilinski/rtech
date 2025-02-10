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
- Go to ".env" file
- UNCOMMENT the "# APP_MAINTENANCE_STORE=database"
- UNCOMMENT the Following:
    " DB_HOST=127.0.0.1
      DB_PORT=3306
      DB_DATABASE=laravel
      DB_USERNAME=root
      DB_PASSWORD= "

- Then change those to this following:
    " APP_NAME=R-Tech "

    " DB_CONNECTION=mysql
      DB_HOST=127.0.0.1
      DB_PORT=3306
      DB_DATABASE=rtech
      DB_USERNAME=root
      DB_PASSWORD="

    " MAIL_MAILER=smtp
      MAIL_SCHEME=null
      MAIL_HOST=smtp.gmail.com
      MAIL_PORT=465
      MAIL_USERNAME=example@gmail.com
      MAIL_PASSWORD= (You can get this in the App Password of your Gmail)
      MAIL_ENCRYTION=ssl
      MAIL_FROM_ADDRESS="example@gmail.com"
      MAIL_FROM_NAME="${APP_NAME}" "

- Open your XAMPP
- Click "Start" for both Apache and MySQL.
- Open localhost/phpmyadmin in your browser.
- Go to "import" and click "choose file" under "File to Import".
- Locate the SQL dump file.
- Go To "database folder" There you can see a SQL dump file called "rtech.sql"
- Then go back to the terminal where you run the "php artisan serve" command
- press CTRL and click the "http://127.0.0.1:8000"


## License

The Laravel framework is open-sourced software licensed under the [MIT license](https://opensource.org/licenses/MIT).
#