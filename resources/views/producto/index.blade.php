@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading">ADD Producto</div>

                <div class="panel-body">
                   {!!Form::open(['route'=>'producto.store'])!!}

                <div class="form-group">
                    {!!Form::label('nombre')!!}<br>

                    {!!Form::text('nombre',null,['class'=>'form-control', 'placeholder'=>'Ingrese el nombre'])!!}
                </div>

                 <div class="form-group">               
                    {!!Form::label('concentracion')!!}
                    {!!Form::text('concentracion',null,['class'=>'form-control', 'placeholder'=>'Ingrese el concentracion'])!!}
                </div>

                <div class="form-group">
                @php
                    $tipos_concentraciones = DB::table('tipos_concentraciones')->get();
                   
                @endphp
                        <select name="tipos_concentraciones_id">
                        <option disabled selected value>Seleccione una via de administración...</option>
                            @foreach($tipos_concentraciones as $lab)

                                    <option value="{{$lab->id}}">{{ucwords($lab->nombre)}}</option>

                            @endforeach
                        </select>
                    </div>

                <div class="form-group">
                    {!!Form::label('precio_bodega')!!}
                    {!!Form::text('precio_bodega',null,['class'=>'form-control', 'placeholder'=>'Ingrese el precio_bodega'])!!}
                </div>
                        
                <div class="form-group">
                    @php
                        $laboratorios = DB::table('laboratorios')->get();
                    
                    @endphp
                    <select name="laboratorios_id">
                    <option disabled selected value>Seleccione un Laboratorio..</option>
                        @foreach($laboratorios as $lab)
                                <option value="{{$lab->id}}">{{$lab->nombre}}</option>
                        @endforeach
                    </select>
                </div>


                 <div class="form-group">
                    @php
                        $presentaciones = DB::table('presentaciones_farmacologicas')->get();
                    
                    @endphp
                    <select name="presentaciones_farmacologicas_id">
                    <option disabled selected value>Seleccione un Presentación..</option>
                        @foreach($presentaciones as $pre)
                                <option value="{{$pre->id}}">{{ucwords($pre->nombre)}}</option>
                        @endforeach
                    </select>
                </div>

                        {!!Form::submit('Click Me!')!!}
              
                {!!Form::close()!!}
                </div>

                <hr>

                @php
                    $medicamentos = DB::table('productos')->orderBy('nombre')->get();
                @endphp

                <table class="table table-striped"> 
                <thead> 
                <tr> 
                    <th>#</th> 
                    <th>Nombre</th> 
                    <th>Concentración</th> 
                    <th>Precio Bodega</th> 
                </tr> 
                </thead> 
                <tbody> 

                
                
                @foreach($medicamentos as $med)
                <tr> 
                    <th scope="row">{{$med->id}}</th> 
                    <td>{{$med->nombre}}</td> 
                    <td>{{$med->concentracion}}</td> 
                    <td>{{$med->precio_bodega}}</td> 
                    </tr> 
                @endforeach
                
                
                
                </tbody> 
                </table>
            </div>
        </div>
    </div>
</div>
@endsection
