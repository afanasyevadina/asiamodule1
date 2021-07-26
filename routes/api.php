<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('/login', 'Api\AuthController@login');
Route::post('/register', 'Api\AuthController@register'); ###

Route::group(['middleware' => 'auth:api'], function() {
    Route::post('/staffs', 'Api\StaffController@store');
    Route::post('/access', 'Api\AccessController@check');
    Route::get('/logs', 'Api\LogController@index'); ###
});