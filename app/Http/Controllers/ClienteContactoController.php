<?php

namespace Drogueria\Http\Controllers;

use Illuminate\Http\Request;
use Drogueria\Contacto_cliente;
use Illuminate\Support\Facades\DB;

class ClienteContactoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return "index";
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return "create";
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $parametros = $request->all();
        Contacto_cliente::create($parametros);
        return $parametros;
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $ticket="0E1DFD13-C558-47B7-9E29-A07D8632FCC0";
        $consulta="http://api.mercadopublico.cl/servicios/v1/publico/ordenesdecompra.json?codigo=".$id."&ticket=".$ticket;
        $ocs = file_get_contents($consulta);
        
        $json = json_decode($ocs, true);
        return view('cliente.contacto.create', ['json' => $json]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        return "edit";
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
        return "update";
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        return "destroy";
    }
}
