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
    Route::get('/staff', 'Api\StaffController@index');
    Route::post('/staff', 'Api\StaffController@store');
    Route::post('/staff/{id}/access', 'Api\StaffController@access');

    Route::get('/points', 'Api\PointController@index');
    Route::post('/points', 'Api\PointController@store');

    Route::get('/groups', 'Api\GroupController@index');
    Route::post('/groups', 'Api\GroupController@store');
    Route::post('/groups/{id}/points', 'Api\GroupController@points');
    Route::post('/groups/{id}/staff', 'Api\GroupController@staff');

    Route::post('/access', 'Api\AccessController@check');
    Route::get('/logs', 'Api\LogController@index'); ###
});