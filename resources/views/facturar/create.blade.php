@extends('layouts.app')

@section('content')
 @php
    $clientes = DB::table('clientes')->get();  
    $productos = DB::table('productos')->get();   
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
                    <th>ID Factura</th> 
                    <th>{{$oc}}</th> 
                </tr> 

                 <tr> 
                    <th>Cliente</th> 
                    <th>
                    <select name="clientes_id">
                    <option disabled selected value>Seleccione un Proveedor</option>
                        @foreach($clientes as $cliente)
                        @if($cliente->id == 999999)
                         <option selected value="{{$cliente->id}}">{{$cliente->nombre}}</option>
                        @else
                         <option value="{{$cliente->id}}">{{$cliente->id}} {{$cliente->nombre}}</option>
                        @endif
                               
                        @endforeach
                    </select>
                    </th> 
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
                <table class="table table-striped"> 
                 <tr> 
                    <th>Total Neto</th> 
                    <th>$$$$$</th> 
                    <th>| IVA</th> 
                    <th>$$$$$</</th> 
                    <th>| Total</th> 
                    <th>$$$$$</</th> 
                </tr> 
                </table>

                </div>

            



                <div class="panel-body">

            </div>
        </div>
    </div>
</div>
@endsection
