<?php

use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;
use App\Http\Controllers\PostingController;


Route::get('/', function () {
    return Inertia::render('Welcome', [
        'canLogin' => Route::has('login'),
        'canRegister' => Route::has('register'),
        'loginRoute' => route('login'),
        'registerRoute' => route('register'),
        'laravelVersion' => Application::VERSION,
        'phpVersion' => PHP_VERSION,
    ]);
});

Route::middleware([
    'auth:sanctum',
    config('jetstream.auth_session'),
    'verified',
])->group(function () {
    Route::get('/dashboard', [PostingController::class, 'index'])->name('dashboard');
    Route::post('/posts', [PostingController::class, 'store'])->name('save');
    Route::put('/posts/{id}', [PostingController::class, 'update'])->name('posts.update');
    Route::put('/posts/{id}/archive', [PostingController::class, 'archive'])->name('posts.archive');
    Route::delete('/posts/{id}', [PostingController::class, 'destroy'])->name('posts.destroy');    
});



