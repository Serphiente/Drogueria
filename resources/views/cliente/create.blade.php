@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading">Agregando clientes...</div>

                <div class="panel-body">
                {!!Form::open(['route'=>'cliente.store'])!!}
                <div class="form-group">
                    {!!Form::label('id')!!}<br>

                    @php
                    $codigo = print_r($json['Listado']['0']['Codigo'],true);
                    $pos = strpos($codigo, "-");
                    $codigo = substr($codigo, 0, $pos);
                    @endphp

                    {!!Form::text('id',$codigo,['class'=>'form-control', 'placeholder'=>'Ingrese el id'])!!}
                </div>
                 <div class="form-group">
                  
                    {!!Form::label('rut')!!}
                    {{--Pasando a string el valor del rut para poder trabajarlo luego--}}
                    @php 
                    $rut = (string)print_r($json['Listado']['0']['Comprador']['RutUnidad'],true);
                    $dv = $rest = substr($rut, -1);
                    $rut=substr($rut, 0, -2);
                    $rut= str_replace(".","",$rut);
                    @endphp

                    {!!Form::text('rut',$rut,['class'=>'form-control', 'placeholder'=>'Ingrese el rut'])!!}
                </div>
                <div class="form-group">
                    {!!Form::label('dv')!!}
                    {!!Form::text('dv',$dv,['class'=>'form-control', 'placeholder'=>'Ingrese el dv'])!!}
                </div>
                 <div class="form-group">
                    {!!Form::label('nombre')!!}
                    {!!Form::text('nombre',print_r($json['Listado']['0']['Comprador']['NombreOrganismo'],true),['class'=>'form-control', 'placeholder'=>'Ingrese el nombre'])!!}
                </div>
                 <div class="form-group">
                    {!!Form::label('direccion_factura')!!}
                    {!!Form::text('direccion_factura',print_r($json['Listado']['0']['Comprador']['DireccionUnidad'],true),['class'=>'form-control', 'placeholder'=>'Ingrese el direccion_factura'])!!}
                </div>
                 <div class="form-group">
                    {!!Form::label('direccion_despacho')!!}
                    {!!Form::text('direccion_despacho',print_r($json['Listado']['0']['Comprador']['DireccionUnidad'],true),['class'=>'form-control', 'placeholder'=>'Ingrese el direccion_despacho'])!!}
                </div>

           
                <div class="form-group">
                            <select name="comunas_id">
                            <option>Seleccione una comuna...</option>
                                @foreach($comunas as $comuna)
                                  
                                    @if ($comuna->nombre == print_r($json['Listado']['0']['Comprador']['ComunaUnidad'],true))
                                       <option selected="selected" value="{{$comuna->id}}">{{$comuna->nombre}}</option>
                                    @else
                                       <option value="{{$comuna->id}}">{{$comuna->nombre}}</option>
                                    @endif

                                @endforeach
                            </select>
                        </div>

                        {!!Form::submit('Click Me!')!!}
              
                {!!Form::close()!!}



                <br>

               <pre>
                {{print_r($json)}}
               </pre>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
