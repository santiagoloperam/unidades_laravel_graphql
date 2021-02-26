<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\Pago;

class TipoPago extends Model
{
	protected $fillable = [
        'tipo'
    ];

    public function filesFromItCanBeExported(): BelongsToMany
	{
		// laravel assumes table1_table2 as name of the intermediate table (ordered alphabetically)
	    // laravel assumes the intermediate table has the same primary key names of them parents
	    // return $this->belongsToMany('App\File', 'middle_table', 'local_key', 'foreign_key');
	    return $this->belongsToMany('Pago', 'pagos_tipo_pagos', 'tipo_pagos_id', 'pago_id');
	}
}
