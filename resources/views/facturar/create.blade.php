@extends('layouts.app')
@section('content')
 @php
    $clientes = DB::table('clientes')->get();  
    $productos = DB::table('productos')->orderBy('nombre')->get();
    $usuarios = DB::table('users')->orderBy('name')->get();
    #Es para saber si ya existen datos de esta factura en la BD
    $datosflag = (DB::table('facturas')->where('folio',$oc)->count());
    if($datosflag>0){
        $datos_factura = DB::table('facturas')->where('folio',$oc)->get();
        #print_r($datos_factura[0]->clientes_id);
    }

@endphp
<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading">Facturar</div>

                <div class="panel-body">
                   {!!Form::open(['route'=>'facturar.store'])!!}
                 <table class="table table-striped"> 

                <tbody> 

                <tr> 
                    <th>Folio Factura</th> 
                    <th><a href="/facturar/{{$oc-1}}"><span class="glyphicon glyphicon-triangle-left" aria-hidden="true"></a>
                    <input type="text" name="folio" step="1" min="2016-01-01"  value="{{$oc}}" readonly> <a href="/facturar/{{$oc+1}}"><span class="glyphicon glyphicon-triangle-right" aria-hidden="true"></span></a></th> 
                </tr> 

                <tr>
                    <th>Fecha Factura</th>
                    <th>
                    
                    @if($datosflag>0)
                     <input type="date" name="fecha" step="1" min="2016-01-01"  value="{{$datos_factura[0]->fecha}}">
                    @else
                     <input type="date" name="fecha" step="1" min="2016-01-01"  value="{{date("Y-m-d")}}">
                    @endif
                       
                    </th>
                </tr>
                <tr>
                    <th>Vendedor</th>
                    <th>
                        <select name="users_id">
                        <option disabled selected value>Seleccione un Vendedor</option>

                        @foreach($usuarios as $user)
                        @if(isset($datos_factura))
                            @if($datos_factura[0]->users_id == $user->id)
                            <option selected value="{{$user->id}}">{{$user->name}} {{$user->last_name}}</option>
                            @else
                            <option value="{{$user->id}}">{{$user->name}} {{$user->last_name}}</option>
                            @endif
                        @else
                            <option value="{{$user->id}}">{{$user->name}} {{$user->last_name}}</option>
                        @endif
                        @endforeach

                        </select>
                    </th>
                </tr>
                 <tr> 
                    <th>Cliente</th> 
                    <th>
                    <select name="clientes_id">
                    <option disabled selected value>Seleccione un Cliente</option>
                        @foreach($clientes as $cliente)

                        @if(isset($datos_factura))
                        @if($datos_factura[0]->clientes_id == $cliente->id)
                         <option selected value="{{$cliente->id}}">{{$cliente->id}} {{$cliente->nombre}}</option>
                        @else
                         <option value="{{$cliente->id}}">{{$cliente->id}} {{$cliente->nombre}}</option>
                        @endif
                        @else
                        <option value="{{$cliente->id}}">{{$cliente->id}} {{$cliente->nombre}}</option>
                         @endif
                               
                        @endforeach
                    </select>
                    </th> 
                </tr> 
                <tr>
                    <td></td>
                    <td></td>
                </tr>
                 <tr> 
                    <th>Producto</th> 
                    <th>
                   <select name="productos_id">
                    <option disabled selected value>Seleccione un Producto</option>
                        @foreach($productos as $producto)
                        @if($producto->id == 999999)
                         <option selected value="{{$producto->id}}">{{$producto->nombre}}</option>
                        @elseif($producto->unidad_empaque > 1)

                        @php
                            $nombre = DB::table('presentaciones_farmacologicas')->select('nombre')->where('id', $producto->presentaciones_farmacologicas_id)->get();
                        @endphp                        
                        @foreach($nombre as $nomb)
                            <option value="{{$producto->id}}">{{ucwords($producto->nombre)}} {{$producto->concentracion}} - Caja x {{$producto->unidad_empaque}} {{ucwords($nomb->nombre)}}</option>
                         @endforeach
                         @else
                         <option value="{{$producto->id}}">{{ucwords($producto->nombre)}} {{$producto->concentracion}} </option>
                        @endif
                               
                        @endforeach
                    </select>
                </th> 
                </tr> 

                
                 <tr> 
                    <th>{!!Form::label('cantidad')!!}</th> 
                    <th>{!!Form::text('cantidad',null,['class'=>'form-control', 'placeholder'=>'Ingrese la cantidad'])!!}</th> 
                </tr> 

                 <tr> 
                    <th>{!!Form::label('precio')!!}</th> 
                    <th>{!!Form::text('precio',null,['class'=>'form-control', 'placeholder'=>'Ingrese el precio'])!!}</th> 
                </tr> 




                 <tr> 
                    <th>{!!Form::submit('Registrar!')!!}</th> 
                    <th></th> 
                </tr> 
                
                </tbody> 
                </table>
                
              
                {!!Form::close()!!}

                <hr><hr>
               
                @if($datosflag>0)
                @php
                $cantidad = 0 ;
                $precio = 0 ;
                $total = 0 ;
                $total_neto = 0;
                @endphp

                <table class="table table-striped">
                 <tr> 
                    <th>Descripción</th> 
                    <th>Cantidad</th> 
                    <th>Precio</th> 
                    <th>Valor</th> 
                    <th>Acciones</th> 
                 </tr> 
                 @foreach($datos_factura as $item_factura)
                 <tr> 
                 @php $nombre_producto =  DB::table('productos')->where('id',$item_factura->productos_id)->get();@endphp
                 @foreach($nombre_producto as $np)
                 @php $presentacion = DB::table('presentaciones_farmacologicas')->where('id',$np->presentaciones_farmacologicas_id)->get(); @endphp
                    <th>{{ucwords($np->nombre)}} {{ucwords($np->concentracion)}} {{$np->unidad_empaque}} @foreach($presentacion as $pre) {{$pre->nombre}} @endforeach</th> 
                    <th>{{$item_factura->cantidad}}</th> 
                    <th>$ {{$item_factura->precio}}</th> 
                    @php 
                        $total_neto = $total_neto +($item_factura->cantidad * $item_factura->precio);
                    @endphp
                    <th>$ {{number_format($item_factura->cantidad * $item_factura->precio, 0, ',', '.')}}</th> 
                    <th><a href="#">Editar</a> | <a href="#">Eliminar</a> </th> 
                    @endforeach
                 </tr>
                 @endforeach
                 </table>
                <table class="table table-striped">
                 <tr> 
                    <th>Total Neto</th> 
                    <th>{{$total_neto}}</th> 
                    <th>| IVA</th> 
                    <th>{{$total_neto * 0.19}}</</th> 
                    <th>| Total</th> 
                    <th>{{$total_neto * 1.19}}</th> 
                 </tr> 
                 </table>
                  @endif
                  

                </div>

            



                <div class="panel-body">

            </div>
        </div>
    </div>
</div>
@endsection
