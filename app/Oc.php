<?php

namespace Drogueria;

use Illuminate\Database\Eloquent\Model;

class Oc extends Model
{
    protected $table = 'facturas';
    protected $fillable = ['folio','users_id','fecha','clientes_id','productos_id','cantidad','precio']; 

}
