<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

use App\User;
use App\Bloque;
use App\Apto;

class Unidade extends Model
{
     protected $fillable = [
        'nombre','direccion','telefono','admin_id','active'
    ];

    public function admin(): BelongsTo
    {
        return $this->belongsTo(User::class,'admin_id');
    }    

    public function bloques(): HasMany
    {
       return $this->hasMany(Bloque::class,'unidad_id');
    }

    public function aptos(): HasMany
    {
       return $this->hasMany(Apto::class);
    }
}
