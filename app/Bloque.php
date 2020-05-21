<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

use App\Unidade;
use App\Apto;

class Bloque extends Model
{
    protected $fillable = [
        'nombre','unidad_id'
    ];

    public function unidad()
    {
       return $this->belongsTo(Unidade::class,'unidad_id');
    }

    public function aptos()
    {
       return $this->hasMany(Apto::class);
    }
}
