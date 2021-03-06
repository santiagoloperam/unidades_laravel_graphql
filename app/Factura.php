<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\BelongsTo;


use App\Apto;

class Factura extends Model
{
    protected $fillable = [
        'apto_id','consecutivo','monto_total_fact','mes_ano','nota','estado'
    ];

    public function apto():BelongsTo
    {
       return $this->belongsTo(Apto::class,'apto_id');
    }

    //PENDIENTE RELACION DOBLE CON PAGO


    public function fileTypesItCanBeExported(): BelongsToMany
	{
	    // laravel assumes table1_table2 as name of the intermediate table (ordered alphabetically)
	    // laravel assumes the intermediate table has the same primary key names of them parents
	    // return $this->belongsToMany('App\File', 'middle_table', 'local_key', 'foreign_key');
	    return $this->belongsToMany('TipoPago', 'pagos_tipo_pagos', 'pagos_id', 'tipo_pagos_id');
	}
}
