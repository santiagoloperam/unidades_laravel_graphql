<?php

use Illuminate\Foundation\Inspiring;

/*
|--------------------------------------------------------------------------
| Console Routes
|--------------------------------------------------------------------------
|
| This file is where you may define all of your Closure based console
| commands. Each Closure is bound to a command instance allowing a
| simple approach to interacting with each command's IO methods.
|
*/

Artisan::command('inspire', function () {
    $this->comment(Inspiring::quote());
})->describe('Display an inspiring quote');

Artisan::command('user', function () {
    \App\User::create([
        'name' => 'Santi Dev',
        'email' => 'santideveloper@email.com',
        'password' => Hash::make('123456789', ['rounds' => 10])	
    ]);
})->describe('Create sample user');
