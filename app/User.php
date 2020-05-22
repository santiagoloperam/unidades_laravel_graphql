<?php

namespace App;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;

use App\TipoUsuario;
use App\Unidade;
use App\Bloque;
//use App\User;


class User extends Authenticatable
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */

    protected $fillable = [
        'name','last_name', 'email','dni','telefono', 'password','active','tipo_usuarios_id','admin_id','unidade_id'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function tipo_usuario(): BelongsTo
    {
        return $this->belongsTo(TipoUsuario::class,'tipo_usuario_id');
    }

    public function unidad(): BelongsTo
    {
        return $this->belongsTo(Unidade::class,'unidade_id');
    }

    public function bloques(): HasMany
    {
        return $this->hasManyThrough('Bloque', 'Unidade', 'admin_id', 'unidade_id');
    }

    public function admin(): BelongsTo
    {
        return $this->belongsTo(this::class, 'admin_id');
    }

    public function unidades_admin():HasMany
    {
        return $this->hasMany(Unidade::class, "admin_id");
    }

}
