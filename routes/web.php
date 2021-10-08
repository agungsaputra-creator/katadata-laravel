<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


// Route::get('/dashboard', function () {
//     return view('dashboard');
// })->middleware(['auth'])->name('dashboard');


Route::get(
    '/',
    [
        'uses' => 'HomeController@index',
        'as' => 'home.index'
    ]
);

Route::post(
    '/newslatter',
    [
        'uses' => 'NewslatterController@store',
        'as' => 'newslatter'
    ]
);



Route::prefix('admin')->group(function () {
    Route::group(['middleware' => 'auth'], function () {
        Route::prefix('dashboard')->group(function () {
            Route::get(
                '/',
                [
                    'uses' => 'Admin\DashboardController@index',
                    'as' => 'dashboard.index'
                ]
            );
        });

        Route::prefix('user')->group(
            function () {
                Route::get(
                    '/data',
                    [
                        'uses' => 'Admin\UserController@data',
                        'as' => 'user.data'
                    ]
                );
                Route::get(
                    '/',
                    [
                        'uses' => 'Admin\UserController@index',
                        'as' => 'user.index'
                    ]
                );
                Route::get(
                    '/create',
                    [
                        'uses' => 'Admin\UserController@create',
                        'as' => 'user.create'
                    ]
                );
                Route::post(
                    '/store',
                    [
                        'uses' => 'Admin\UserController@store',
                        'as' => 'user.store'
                    ]
                );
                Route::get(
                    '/{id}/edit',
                    [
                        'uses' => 'Admin\UserController@edit',
                        'as' => 'user.edit'
                    ]
                );
                Route::post(
                    '/update/{id}',
                    [
                        'uses' => 'Admin\UserController@update',
                        'as' => 'user.update'
                    ]
                );
                Route::get(
                    '/editprofile',
                    [
                        'uses' => 'Admin\UserController@editprofile',
                        'as' => 'user.editprofile'
                    ]
                );
                Route::post(
                    '/updateprofile/{id}',
                    [
                        'uses' => 'Admin\UserController@proseseditprofile',
                        'as' => 'user.updateprofile'
                    ]
                );
                Route::get(
                    '/{id}/delete',
                    [
                        'uses' => 'Admin\UserController@destroy',
                        'as' => 'user.destroy'
                    ]
                );
            }
        );

        Route::prefix('speaker')->group(
            function () {
                Route::get(
                    '/data',
                    [
                        'uses' => 'Admin\SpeakerController@data',
                        'as' => 'speaker.data'
                    ]
                );
                Route::get(
                    '/',
                    [
                        'uses' => 'Admin\SpeakerController@index',
                        'as' => 'speaker.index'
                    ]
                );
                Route::get(
                    '/create',
                    [
                        'uses' => 'Admin\SpeakerController@create',
                        'as' => 'speaker.create'
                    ]
                );
                Route::post(
                    '/store',
                    [
                        'uses' => 'Admin\SpeakerController@store',
                        'as' => 'speaker.store'
                    ]
                );
                Route::get(
                    '/{id}/edit',
                    [
                        'uses' => 'Admin\SpeakerController@edit',
                        'as' => 'speaker.edit'
                    ]
                );
                Route::post(
                    '/update/{id}',
                    [
                        'uses' => 'Admin\SpeakerController@update',
                        'as' => 'speaker.update'
                    ]
                );
                Route::get(
                    '/{id}/delete',
                    [
                        'uses' => 'Admin\SpeakerController@destroy',
                        'as' => 'speaker.destroy'
                    ]
                );
            }
        );

        Route::prefix('schedule')->group(
            function () {
                Route::get(
                    '/data',
                    [
                        'uses' => 'Admin\ScheduleController@data',
                        'as' => 'schedule.data'
                    ]
                );
                Route::get(
                    '/',
                    [
                        'uses' => 'Admin\ScheduleController@index',
                        'as' => 'schedule.index'
                    ]
                );
                Route::get(
                    '/create',
                    [
                        'uses' => 'Admin\ScheduleController@create',
                        'as' => 'schedule.create'
                    ]
                );
                Route::post(
                    '/store',
                    [
                        'uses' => 'Admin\ScheduleController@store',
                        'as' => 'schedule.store'
                    ]
                );
                Route::get(
                    '/{id}/edit',
                    [
                        'uses' => 'Admin\ScheduleController@edit',
                        'as' => 'schedule.edit'
                    ]
                );
                Route::post(
                    '/update/{id}',
                    [
                        'uses' => 'Admin\ScheduleController@update',
                        'as' => 'schedule.update'
                    ]
                );
                Route::get(
                    '/{id}/delete',
                    [
                        'uses' => 'Admin\ScheduleController@destroy',
                        'as' => 'schedule.destroy'
                    ]
                );
            }
        );

        Route::prefix('schedule_detail')->group(
            function () {
                Route::get(
                    '/data',
                    [
                        'uses' => 'Admin\DetailScheduleController@data',
                        'as' => 'detailschedule.data'
                    ]
                );
                Route::get(
                    '/',
                    [
                        'uses' => 'Admin\DetailScheduleController@index',
                        'as' => 'detailschedule.index'
                    ]
                );
                Route::get(
                    '/create',
                    [
                        'uses' => 'Admin\DetailScheduleController@create',
                        'as' => 'detailschedule.create'
                    ]
                );
                Route::post(
                    '/store',
                    [
                        'uses' => 'Admin\DetailScheduleController@store',
                        'as' => 'detailschedule.store'
                    ]
                );
                Route::get(
                    '/{id}/edit',
                    [
                        'uses' => 'Admin\DetailScheduleController@edit',
                        'as' => 'detailschedule.edit'
                    ]
                );
                Route::post(
                    '/update/{id}',
                    [
                        'uses' => 'Admin\DetailScheduleController@update',
                        'as' => 'detailschedule.update'
                    ]
                );
                Route::get(
                    '/{id}/delete',
                    [
                        'uses' => 'Admin\DetailScheduleController@destroy',
                        'as' => 'detailschedule.destroy'
                    ]
                );
            }
        );
    });
});

require __DIR__.'/auth.php';
