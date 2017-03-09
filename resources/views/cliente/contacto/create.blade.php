@extends('layouts.app')

@php

$idxs = DB::table('contacto_clientes')->pluck('clientes_id');

$codigo = print_r($json['Listado']['0']['Codigo'],true);
$pos = strpos($codigo, "-");
$codigo = substr($codigo, 0, $pos);


foreach($idxs as $idx){
    if($idx == $codigo){
        echo "<h1>Contacto ya registrado</h1>";
    }
}

@endphp


@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading">Agregando contacto - cliente...</div>
                <div class="panel-body">
                {!!Form::open(['route'=>'contacto.store'])!!}

                 @php
                    $codigo = print_r($json['Listado']['0']['Codigo'],true);
                    $pos = strpos($codigo, "-");
                    $codigo = substr($codigo, 0, $pos);
                    @endphp


                <div class="form-group">
                    {!!Form::label('ID Cliente')!!}
                    {!!Form::text('clientes_id',$codigo,['class'=>'form-control', 'placeholder'=>'Ingrese el id del cliente'])!!}
                </div>
               
               
                 <div class="form-group">
                    {!!Form::label('nombre')!!}
                    {!!Form::text('nombre',print_r($json['Listado']['0']['Comprador']['NombreContacto'],true),['class'=>'form-control', 'placeholder'=>'Ingrese el nombre'])!!}
                </div>
                 <div class="form-group">
                    {!!Form::label('telefono')!!}
                    {!!Form::text('telefono',print_r($json['Listado']['0']['Comprador']['FonoContacto'],true),['class'=>'form-control', 'placeholder'=>'Ingrese el telefono'])!!}
                </div>
                 <div class="form-group">
                    {!!Form::label('email')!!}
                    {!!Form::text('email',print_r($json['Listado']['0']['Comprador']['MailContacto'],true),['class'=>'form-control', 'placeholder'=>'Ingrese el email'])!!}
                </div>

           
             

                        {!!Form::submit('Click Me!')!!}
              
                {!!Form::close()!!}

               

                <br>

              
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
