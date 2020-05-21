<?php

namespace App;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

use App\User;

class TipoUsuario extends Model
{
    protected $fillable = [
        'tipo_usuarios'
    ];

    public function users()
    {
       return $this->hasMany(User::class);
    }
}


