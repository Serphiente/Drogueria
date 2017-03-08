@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading">Datos de la BD</div>

                <div class="panel-body">
             <table class="table">
                 <thead>
                     <th>Nombre Comuna</th>                   
                 </thead>
                 <tbody>
                      @foreach($comunas as $comuna)
                     <tr><th>{{$comuna->nombre}}</th>
                      @endforeach
                 </tbody>
             </table>
           
              
               
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
