<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

use App\Unidade;
use App\Apto;

class Bloque extends Model
{
    protected $fillable = [
        'nombre','unidad_id'
    ];

    public function unidad():BelongsTo
    {
       return $this->belongsTo(Unidade::class,'unidad_id');
    }

    public function aptos():HasMany
    {
       return $this->hasMany(Apto::class,'bloque_id');
    }
}
