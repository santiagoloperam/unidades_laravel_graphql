<?php

use Illuminate\Http\Request;

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
/*Route::group(['prefix' => '',
  'middleware' => Fruitcake\Cors\HandleCors::class],
   function()
{*/

	Route::apiResource('users','UsersController');
	Route::apiResource('unidades','unidadesController');
	Route::apiResource('bloques','bloquesController');
	Route::apiResource('tipoaptos','TipoAptosController');
	Route::apiResource('aptos','AptosController');
	Route::apiResource('facturas','facturasController');
   
/*});*/