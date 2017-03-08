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
                    {!!Form::label('id')!!}
                    {!!Form::text('id',null,['class'=>'form-control', 'placeholder'=>'Ingrese el id'])!!}
                </div>
                 <div class="form-group">
                    {!!Form::label('rut')!!}
                    {!!Form::text('rut',null,['class'=>'form-control', 'placeholder'=>'Ingrese el rut'])!!}
                </div>
                <div class="form-group">
                    {!!Form::label('dv')!!}
                    {!!Form::text('dv',null,['class'=>'form-control', 'placeholder'=>'Ingrese el dv'])!!}
                </div>
                 <div class="form-group">
                    {!!Form::label('nombre')!!}
                    {!!Form::text('nombre',null,['class'=>'form-control', 'placeholder'=>'Ingrese el nombre'])!!}
                </div>
                 <div class="form-group">
                    {!!Form::label('direccion_factura')!!}
                    {!!Form::text('direccion_factura',null,['class'=>'form-control', 'placeholder'=>'Ingrese el direccion_factura'])!!}
                </div>
                 <div class="form-group">
                    {!!Form::label('direccion_despacho')!!}
                    {!!Form::text('direccion_despacho',null,['class'=>'form-control', 'placeholder'=>'Ingrese el direccion_despacho'])!!}
                </div>

               
                <div class="form-group">
                            <select name="comunas_id">
                            <option>Seleccione una comuna...</option>
                                @foreach($comunas as $comuna)
                                    <option value="{{$comuna->id}}">{{$comuna->nombre}}</option>
                                @endforeach
                            </select>
                        </div>

                        {!!Form::submit('Click Me!')!!}
              
                {!!Form::close()!!}
                    
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
