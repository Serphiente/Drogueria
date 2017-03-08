@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading">Datos OC</div>
                <pre>
                {{print_r($json['Listado']['0']['Fechas']['FechaCreacion'],true)}}
               </pre>
               <br>
                <pre>
                {{print_r($json)}}
               </pre>
            </div>
        </div>
    </div>
</div>
@endsection
