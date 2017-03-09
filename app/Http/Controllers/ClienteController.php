<?php

namespace Drogueria\Http\Controllers;

use Illuminate\Http\Request;
use Drogueria\Cliente;
use Illuminate\Support\Facades\DB;

class ClienteController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }



    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
         $comunas = DB::table('comunas')->get();
        return view('cliente.create', ['comunas' => $comunas]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
         /*Cliente::create([
            'id' => $request['id'],
            'rut' => $request['rut'],
            'nombre' => $request['nombre'],
            'direccion_factura' => $request['direccion_factura'],
            'direccion_despacho' => $request['direccion_despacho'],
            'comunas_id' => $request['comunas_id']
        ]);*/

     
        $parametros = $request->all();
        Cliente::create($parametros);

        return "done";
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        
        $comunas = DB::table('comunas')->get();
        
        $ticket="0E1DFD13-C558-47B7-9E29-A07D8632FCC0";
        $consulta="http://api.mercadopublico.cl/servicios/v1/publico/ordenesdecompra.json?codigo=".$id."&ticket=".$ticket;
        $ocs = file_get_contents($consulta);
        
        $json = json_decode($ocs, true);
        
        return view('cliente.create', ['json' => $json],['comunas' => $comunas]);
        
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
