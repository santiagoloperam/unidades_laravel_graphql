<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\BelongsTo;


use App\Apto;

class Factura extends Model
{
    protected $fillable = [
        'numero','saldo','fecha','apto_id','pagada'
    ];

    public function apto():BelongsTo
    {
       return $this->belongsTo(Apto::class,'apto_id');
    }
}
