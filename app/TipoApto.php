<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\Unidade;


class TipoApto extends Model
{
    protected $fillable = [
        'tipo_apto','cobro','vigencia','metros','unidad_id'
    ];

    public function unidad(): BelongsTo
    {
       return $this->belongsTo(Unidade::class);
    }
}
