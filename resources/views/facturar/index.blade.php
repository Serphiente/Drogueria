@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading">Ingrese el ID de La OC</div>

                <div class="panel-body">
                  <span>ID</span>
                  <input type="text">
                   <button class="btn btn-default" id="myBtn">Go!</button>
  <script>
   var btn = document.getElementById('myBtn');
btn.addEventListener('click', function() {
  document.location.href = 'some/page';
});
    });
  </script>
            </div>
        </div>
    </div>
</div>
@endsection
