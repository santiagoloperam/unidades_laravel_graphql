<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\Factura;


class Impuesto extends Model
{
    protected $fillable = [
        'valor'
    ];

    public function filesFromItCanBeExported(): BelongsToMany
	{
		// laravel assumes table1_table2 as name of the intermediate table (ordered alphabetically)
	    // laravel assumes the intermediate table has the same primary key names of them parents
	    // return $this->belongsToMany('App\File', 'middle_table', 'local_key', 'foreign_key');
	    return $this->belongsToMany('Factura', 'factura_impuestos', 'impuesto_id', 'factura_id');
	}
}
