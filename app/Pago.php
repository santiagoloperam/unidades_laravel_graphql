<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\TipoPago;
use App\PagoTipoPago;
use App\Apto;

class Pago extends Model
{
    protected $fillable = [
        'factura_id','apto_id','valor','fecha_pago','estado','modo'
    ];

    public function apto():BelongsTo 
    {
       return $this->belongsTo(Apto::class,'apto_id');
    }

    //PENDIENTE RELACION DOBLE CON FACTURA


    public function fileTypesItCanBeExported(): BelongsToMany
	{
	    // laravel assumes table1_table2 as name of the intermediate table (ordered alphabetically)
	    // laravel assumes the intermediate table has the same primary key names of them parents
	    // return $this->belongsToMany('App\File', 'middle_table', 'local_key', 'foreign_key');
	    return $this->belongsToMany('TipoPago', 'pagos_tipo_pagos', 'pago_id', 'tipo_pagos_id');
	}
}
