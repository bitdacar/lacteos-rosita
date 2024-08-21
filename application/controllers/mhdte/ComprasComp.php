<?php
defined('BASEPATH') or exit('No direct script access allowed');

class comprasComp extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model("mhdte/Get_cat_model");
        $this->load->model("mhdte/Cuerpodocumento_model");
        $this->load->model("mhdte/resumen_model");
        $this->load->model("mhdte/Identificacion_model");
        $this->load->model("mhdte/Serviciosgenerales_model");
        $this->load->model("mhdte/receptor_model");
        $this->load->model("mhdte/docrelacionados_model");
        $this->load->model("mhdte/Integracion_model");
        $this->load->library('Uuid');
        $this->load->library('Lrenta');

    }


    public function agregar()
    {

        $codTdoc = "07";
        $version = "1";


        $TipCompra = $this->input->post("TipCompra");
        $fecha = $this->input->post("fecha");
        $mes = $this->input->post("mes");
        $cmbTipDteFis = $this->input->post("cmbTipDteFis");
        $cliente = $this->input->post("cliente");
        $selectCo = $this->input->post("selectCo");
        $ctrlInterno = $this->input->post("ctrlInterno");
        $seriedoc = $this->input->post("seriedoc");
        $numControl = $this->input->post("numControl");
        $SelloValida = $this->input->post("SelloValida");
        $codGeneracion = $this->input->post("codGeneracion");
        $item153 = $this->input->post("item153");
        $item154 = $this->input->post("item154");
        $item157 = $this->input->post("item157");
        $Calcular1 = $this->input->post("Calcular1");



        /* insertando encabezado de compra*/
        $dataCompras = array
        (
            'codCompra' => $TipCompra,
            'tipDocumento ' => $cmbTipDteFis,
            'fecha' => $fecha,
            'emisor' => $cliente,
            'mes' => $mes,
            'dteInterno' => $ctrlInterno,
            'serie' => $seriedoc,
            'numeroControl' => $numControl,
            'codGeneracion' => $codGeneracion,
            'sellovalidacion' => $SelloValida,
            'tipcompra' => $selectCo,
            'tipPago' => '',
            'concalculo' => $Calcular1,
        );



        // ingresoEcompras


        if ($this->Integracion_model->ingresoEcompras($dataCompras)) {
            $datasave = array(
                'ok' => true
            );
            echo json_encode($datasave);
        } else {

            $datasave = array(
                'error' => $this->session->set_flashdata("error", "No se pudo guardar la informacion"),
            );
            echo json_encode($datasave);
        }



    }

    public function store()
    {


        $numControl = $this->input->post("numControl");
        $codGeneracion = $this->input->post("codGeneracion");
        $cantidad = $this->input->post("cantidad");
        $descripcion = $this->input->post("descripcion");
        $precio = $this->input->post("precio");
        $item = $this->input->post("item");
        $TvtaExenta = $this->input->post("TvtaExenta");
        $TvtaGravada = $this->input->post("TvtaGravada");

        $iva13 = $this->input->post("iva13");
        $ctrlInterno = $this->input->post("ctrlInterno");
        $seriedoc = $this->input->post("seriedoc");
        $Calcular1 = $this->input->post("Calcular1");
        $cmbTipDteFis = $this->input->post("cmbTipDteFis");
        $ctrlInterno = $this->input->post("ctrlInterno");
        $seriedoc = $this->input->post("seriedoc");
        $subTotalIva1 = $this->input->post("subTotalIva1");
        $impuestos = $this->Cuerpodocumento_model->getImpuestos();

        // $iva13 =    $impuestos[2]->valor;
        $iva1 = $impuestos[5]->valor;
        $Iva1 = 0;
        if ($Calcular1 == 'S') {
            $Iva1 = $this->input->post("Iva1");
        } else {
            $Iva1 = 0;
        }


        if ($cmbTipDteFis != 3) {
            $numControl = $ctrlInterno;
            $codGeneracion = $seriedoc;
        }



        $dataCompras = array
        (

            'numControl' => $numControl,
            'codGeneracion' => $codGeneracion,
            'cantidad' => $cantidad,
            'descripcion' => $descripcion,
            'precio' => $precio,
            'item' => $item,
            'TvtaExenta' => $TvtaExenta,
            'TvtaGravada' => $TvtaGravada,
            'subTotalIva1' => $subTotalIva1,
            'Iva1' => $Iva1,
            'iva13' => $iva13,

        );




        if ($this->Integracion_model->ingresoDcompras($dataCompras)) {

            $data = array(
                'OK' => 1,
            );
            echo json_encode($data);
        } else {

            $datasave = array(
                'error' => $this->session->set_flashdata("error", "No se pudo guardar la informacion"),
            );
            echo json_encode($data);
        }
        //echo json_encode( $dataCompras );

    }

    public function llenarTabla()
    {

        $numeroControl2 = $this->input->post("numControl");
        $codigoGeneracion2 = $this->input->post("codGeneracion");

        $impuestos = $this->Cuerpodocumento_model->getImpuestos();
        $fovial = $impuestos[0]->valor;
        $cotrans = $impuestos[1]->valor;
        $iva13 = $impuestos[2]->valor;
        $iva1 = $impuestos[5]->valor;
        $ivaPercibido = 0;
        $totalGravado = 0;
        $ivaResumen = 0;
        $TvtaExenta = 0;
        $TvtaGravada = 0;

        $respuesta = $this->Integracion_model->Rcompras($numeroControl2, $codigoGeneracion2);

        for ($i = 0; $i < count($respuesta); $i++) {
            $totalGravado += $respuesta[$i]->precio;
            $ivaResumen += $respuesta[$i]->Iva13;
            if ($respuesta[$i]->Iva1 > 0) {
                $ivaPercibido += $respuesta[$i]->Iva1;
            }
            $TvtaExenta += $respuesta[$i]->TvtaExenta;
            $TvtaGravada += $respuesta[$i]->TvtaGravada;
        }

        $dataCompras = array
        (
            'iva13' => number_format($ivaResumen, 2, '.', ''),
            'ivaPercibido' => number_format($ivaPercibido, 2, '.', ''),
            'montoPorFormaPag' => number_format($totalGravado + $ivaResumen - $ivaPercibido, 2, '.', ''),
            'TvtaExenta' => number_format($TvtaExenta, 2, '.', ''),
            'TvtaGravada' => number_format($TvtaGravada, 2, '.', '')
        );
        $data = array
        (
            'OK' => '1',
            'data' => $respuesta,
            'totales' => $dataCompras
        );
        echo json_encode($data);
    }

    public function listaBuscarCliente()
    {
        $codigo = $this->input->post("codigo");
        $area = $this->session->userdata("areafact");

        $response = $this->receptor_model->listareceptorCompras($codigo, $area);
        echo json_encode($response);
    }

    public function cargarPeriodo()
    {
        $codigo = $this->input->post("codigo");

        $anio = date("Y");

        $response = $this->Serviciosgenerales_model->cargarPeriodo($anio);
        echo json_encode($response);
    }

    public function creacomprorete()
    {
        $codTdoc = "07";
        $version = "1";
        $montoretencion = 0;
        $ivaretenido = 0;

        $numeroControl = $this->input->post("numeroControl");
        $codigoGeneracion = $this->input->post("codigoGeneracion");

        $txt1 = $this->input->post("txt1");
        $select1 = $this->input->post("select1");
        $txt2 = $this->input->post("txt2");
        $txt3 = $this->input->post("txt3");
        $txt4 = $this->input->post("txt4");
        $ctrlInterno = $this->input->post("ctrlInterno");
        $txt5 = $this->input->post("txt5");

        $SelloValida = $this->input->post("SelloValida");

        $select2 = $this->input->post("select2");
        $cmbTipDteFis = $this->input->post("cmbTipDteFis");
        $fechaemi = $this->input->post("fechaemi");

        $numeroControl2 = $this->input->post("numControl");
        $codigoGeneracion2 = $this->input->post("codGeneracion");


        $impuestos = $this->Cuerpodocumento_model->getImpuestos();
        $fovial = $impuestos[0]->valor;
        $cotrans = $impuestos[1]->valor;
        $iva13 = $impuestos[2]->valor;
        $iva1 = $impuestos[5]->valor;
        $ivaPercibido = 0.00;
        $totalGravado = 0.00;
        $ivaResumen = 0.00;
        $TvtaExenta = 0;
        $TvtaGravada = 0;
        $codtx = '';

        $respuesta = $this->Integracion_model->Rcompras($numeroControl2, $codigoGeneracion2);
        if ($cmbTipDteFis == 'S') {

        }

        for ($i = 0; $i < count($respuesta); $i++) {
            $totalGravado += $respuesta[$i]->precio;
            $ivaResumen += $respuesta[$i]->Iva13;
            if ($respuesta[$i]->Iva1 > 0) {
                $ivaPercibido += $respuesta[$i]->Iva1;
            }
            $TvtaExenta += $respuesta[$i]->TvtaExenta;
            $TvtaGravada += $respuesta[$i]->TvtaGravada;
            $subTotalIva1 = $respuesta[$i]->subTotalIva1;
        }


        /* insertando cuerpo documento*/
        //S$traedetalleRete

        $montoretencion = $totalGravado;
        $ivaretenido = $ivaResumen;
        if (is_numeric($select1)) {
            $tipoGenera = 2;
            $codigoGeneracion2 = $codigoGeneracion2;
        } else {
            $tipoGenera = 1;
            $codigoGeneracion2 = $txt5;
        }

        // IDENTIFICACION DOCUMENTO

        $codigoGeneracionInterno = strtoupper($this->uuid->v4());

        $anio = date("Y");
        $numeroControl = $this->Identificacion_model->corelativo($anio, $this->session->userdata("codestab"));

        $data = array(
            'numeroControl' => $numeroControl->numeroControl + 1,
        );
        $this->Identificacion_model->corelativoUpdate($anio, $data);

        $secuencia = str_pad(($numeroControl->numeroControl + 1), 15, "0", STR_PAD_LEFT);

        $numeroControlInterno = 'DTE-' . $codTdoc . '-' . $this->session->userdata("codestab") . '-' . $secuencia;
        $horaactual = date("H:i:s");
        $fecha = date("Y-m-d");
        if ($fechaemi == '') {
            $fechaemi = $fecha;
        } else {
            $fechaemi = date("Y-m-d", strtotime($fechaemi));
        };
        $Identificacion = array(

            'version' => $version,
            'ambDestino' => $this->session->userdata('ambiente'),
            'tipoDoc' => $codTdoc,
            'numeroControl' => $numeroControlInterno,
            'codigoGeneracion' => $codigoGeneracionInterno,
            'modFacturacion' => 1,
            'tipTransmicion' => 1,
            'fecha' => $fecha,
            'hora' => $horaactual,

            'tipMoneda' => 'USD'
        );

        $dataDireccion = array(

            'destino' => 'S/N',
            'direccionCli' => 'S/N'

        );
        $receptorDoc = array(
            'fecha' => $fecha,
            'idReceptor' => $txt1,
            'numeroControl' => $numeroControlInterno,
            'codigoGeneracion' => $codigoGeneracionInterno,
            'destino' => json_encode($dataDireccion),
            'cuentaArea' => '',
            'cuentavende' => ''
        );


        $data3 = array(

            'numeroControl' => $numeroControlInterno,
            'codigoGeneracion' => $codigoGeneracionInterno,
            'item' => 1,
            'tipDTRelacionado' => "03",
            'tipGenDoc' => $tipoGenera,
            'numDocRelacionado' => $codigoGeneracion,
            'fechaGendoc' => $fechaemi,
            'montoretencion' => number_format($subTotalIva1, 2, '.', ''),
            'codRetencion' => '22',
            'ivaRetenido' => number_format($ivaPercibido, 2, '.', ''),
            'descripcion' => $respuesta[0]->descripcion,

        );

        /* ingresando resumen*/
        # procedemos a covertir la cantidad en letras
        $this->load->helper('numeros');
        $valorletras = array(
            'leyenda' => num_to_letras($ivaPercibido)
            ,
            'cantidad' => $ivaretenido
        );
        // echo json_encode($valorletras);
        //$valorletras['leyenda']


        $data4 = array(

            'numeroControl' => $numeroControlInterno,
            'codigoGeneracion' => $codigoGeneracionInterno,
            'totalMonSujRet' => $subTotalIva1,
            'totalIvaRetenido' => $ivaPercibido,
            'valorLetrasIvaRet' => $valorletras['leyenda'],

        );

        $dataCompras = array
        (
            'numeroControl' => $numeroControlInterno,
            'codigoGeneracion' => $codigoGeneracionInterno,
            'iva13' => number_format($ivaResumen, 2, '.', ''),
            'ivaPercibido' => number_format($ivaPercibido, 2, '.', ''),
            'montoPorFormaPag' => number_format($totalGravado + $ivaResumen - $ivaPercibido, 2, '.', '')
        );
        $data = array
        (
            'OK' => '1',
            'data' => '',
            'numeroControl' => $numeroControlInterno,
            'codigoGeneracion' => $codigoGeneracionInterno,
            'totales' => $dataCompras
        );


        if (
            $this->Cuerpodocumento_model->save($data3) && $this->resumen_model->savetho($data4, $numeroControlInterno, $codigoGeneracionInterno)
            && $this->Identificacion_model->save($Identificacion) && $this->Identificacion_model->save2($receptorDoc)
        ) {
            $datasave = array(

                'cuerpo' => 1,
                'resumen' => 1,

            );
            echo json_encode($data);
        } else {

            $datasave = array(
                'error' => $this->session->set_flashdata("error", "No se pudo guardar la informacion"),
            );
            echo json_encode($datasave);
        }


    }

    public function EliminarComp()
    {
        $numeroControl = $this->input->post("numeroControl");
        $codigoGeneracion = $this->input->post("codigoGeneracion");
        $id = $this->input->post("id");

        $data = array
        (
            'id' => $id,
            'numControl' => $numeroControl,
            'codGeneracion' => $codigoGeneracion
        );
        if ($this->Integracion_model->delete($data)) {
            $datasave = array(

                'ok' => '1',
                'resumen' => '',

            );
            echo json_encode($datasave);
        } else {

            $datasave = array(
                'error' => $this->session->set_flashdata("error", "No se pudo guardar la informacion"),
            );
            echo json_encode($datasave);
        }

    }

}
