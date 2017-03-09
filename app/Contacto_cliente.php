<?php

namespace Drogueria;

use Illuminate\Database\Eloquent\Model;

class Contacto_cliente extends Model
{
    protected $fillable = ['nombre','telefono','email','clientes_id']; 
}
