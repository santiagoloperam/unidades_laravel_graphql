<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

use App\Unidade;
use App\TipoApto;
use App\User;
use App\Bloque;

class Apto extends Model
{
    protected $fillable = [
        'nomenclatura','unidad_id','bloque_id','tipo_apto_id','propietario_id','arrendatario_id','admin_id'
    ];

    public function admin()
    {
       return $this->belongsTo(User::class,'admin_id');
    }
    public function unidad()
    {
       return $this->belongsTo(Unidade::class,'unidad_id');
    }
    public function tipoapto()
    {
       return $this->belongsTo(TipoApto::class,'tipo_apto_id');
    }

    public function bloque()
    {
       return $this->belongsTo(Bloque::class,'bloque_id');
    }

    public function propietario()
    {
       return $this->belongsTo(User::class,'propietario_id');
    }

    public function arrendatario()
    {
       return $this->belongsTo(User::class,'arrendatario_id');
    }
    
}
