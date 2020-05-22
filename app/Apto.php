<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

use App\Unidade;
use App\TipoApto;
use App\User;
use App\Bloque;

class Apto extends Model
{
    protected $fillable = [
        'nomenclatura','unidad_id','bloque_id','tipo_apto_id','propietario_id','arrendatario_id','admin_id'
    ];

    public function admin():BelongsTo
    {
       return $this->belongsTo(User::class,'admin_id');
    }
    public function unidad():BelongsTo
    {
       return $this->belongsTo(Unidade::class,'unidad_id');
    }
    public function tipoapto():BelongsTo
    {
       return $this->belongsTo(TipoApto::class,'tipo_apto_id');
    }

    public function bloque():BelongsTo
    {
       return $this->belongsTo(Bloque::class,'bloque_id');
    }

    public function propietario():BelongsTo
    {
       return $this->belongsTo(User::class,'propietario_id');
    }

    public function arrendatario():BelongsTo
    {
       return $this->belongsTo(User::class,'arrendatario_id');
    }
    
}
