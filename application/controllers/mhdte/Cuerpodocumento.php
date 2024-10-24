<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Cuerpodocumento extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        if (!$this->session->userdata("nombre")) {
            redirect(base_url());
        }
        $this->load->model("mhdte/Cuerpodocumento_model");
        $this->load->model("mhdte/resumen_model");
        $this->load->model("mhdte/identificacion_model");
        $this->load->model("mhdte/emisor_model");
        $this->load->model("mhdte/docrelacionados_model");

        $this->load->library('Uuid');
        $this->load->library('Lrenta');
    }

    public function add()
    {

        $codigoGeneracion = strtoupper($this->uuid->v4());

        $anio = date("Y");
        $numeroControl = $this->identificacion_model->corelativo($anio, $this->session->userdata("codestab"));

        $data = array(
            'numeroControl' => $numeroControl->numeroControl + 1,
            );
        $this->identificacion_model->corelativoUpdate($anio,$this->session->userdata("codestab"), $data);


        $tipodocSelect = $this->input->post("tipodocSelect");

        $item11 = $this->input->post("item11");
        $item10 = $this->input->post("item10");
        $txt1 = $this->input->post("txt1");
        $codTdoc = "";
        $version = "";
        if ($tipodocSelect == 'store') {
            $codTdoc = "01";
            $version = 1;
        } else if ($tipodocSelect == 'storeCCF') {
            $codTdoc = "03";
            $version = 3;
        } else {
            $codTdoc = $tipodocSelect;
            $version = $this->input->post("version");
        }


        // IDENTIFICACION DOCUMENTO
        $secuencia = str_pad(($numeroControl->numeroControl + 1), 15, "0", STR_PAD_LEFT);
        //$numeroControlFin='DTE-'.$codTdoc.'-123456789-'.$secuencia;
        // $numeroControlFin='DTE-'.$codTdoc.'-CMPV0202-'.$secuencia;
        $numeroControlFin = 'DTE-' . $codTdoc . '-' . $this->session->userdata("codestab") . '-' . $secuencia;
        $horaactual = date("h:i:s");

        $data  = array(

            'version' => $version,
            'ambDestino' => $this->session->userdata('ambiente'),
            'tipoDoc' => $codTdoc,
            'numeroControl' => $numeroControlFin,
            'codigoGeneracion' => $codigoGeneracion,
            'modFacturacion' => 1,
            'tipTransmicion' => 1,
            'fecha' => $item10,
            'hora' =>  $horaactual,

            'tipMoneda' => 'USD'
        );
        $dataDireccion = array(

            'destino' => $this->input->post("destino") == null ? 'S/N' : $this->input->post("destino"),
            'direccionCli' => $this->input->post("direccionCli") == null ? 'S/N' : $this->input->post("destino")

        );
        $cuentaXArea = "";
        if ($this->input->post("cuentaArea") != '') {
            $cuentaXArea = $this->input->post("cuentaArea");
        } else {
            // echo $this->input->post( "item154" ); echo "---" ; echo $this->session->userdata( "areafact" );
            $cuentasxArea = $this->resumen_model->cuentasxArea($this->input->post("item154"), $this->session->userdata("areafact"));
            $cuentaXArea = $cuentasxArea[0]->cuentaxpago;
        }
        if ($this->input->post("item154") == '01' || $this->input->post("item154") == '02') {
            $cuentaVende = 'cuentaEfe';
        } else {
            $cuentaVende = 'cuentaCred';
        }
        $cuentavendedor = $this->resumen_model->cuentavendedor($cuentaVende, $this->session->userdata("uname"));
        
        $data2  = array(
            'fecha' => $item10,
            'idReceptor' => $txt1,
            'numeroControl' => $numeroControlFin,
            'codigoGeneracion' => $codigoGeneracion,
            'destino' => json_encode($dataDireccion),
            'cuentaArea' => $cuentaXArea,
            'cuentaVende' => $cuentavendedor[0]->cuenta
        );



        if ($this->identificacion_model->save($data) && $this->identificacion_model->save2($data2)) {
            $datasave  = array(
                'identificacion' => $this->session->userdata("areafact"),
                'receptordocumen' => $this->session->userdata("areafact"),
            );
            echo json_encode($data);
        } else {

            $datasave  = array(
                'error' => $this->session->set_flashdata("error", "No se pudo guardar la informacion"),
            );
            echo json_encode($data);
        }



        //  echo json_encode( $data );

    }

    public function store()
    {

        $numeroControl = $this->input->post("numeroControl");
        $codigoGeneracion = $this->input->post("codigoGeneracion");
        $cantidad = $this->input->post("item80");
        $precio = $this->input->post("item85");
        $tipodocSelect = $this->input->post("tipodocSelect");
        $observacionesItem = $this->input->post("observacionesItem");
        $promo = $this->input->post("promo");
        $serieProd = $this->input->post("serieProd");
        $areafact = $this->input->post("areafact");
        $impuestos =  $this->Cuerpodocumento_model->getImpuestos();
        $fovial =    $impuestos[0]->valor;
        $cotrans =   $impuestos[1]->valor;
        $iva13 =    $impuestos[2]->valor;
        $numDocRelacionado = '';
        $montoDescu=0.00;



        /* if ( ( $this->session->userdata( "areafact" ) == 'CO' or $this->session->userdata( "areafact" ) == 'CF' )  && $tipodocSelect == 'storeCCF' ) {
            $precio = $this->lrenta->precioSinIva( $precio, $iva13 ) ;

        }*/
        if($promo >=0){
            $montoDescu=($this->input->post("item85")*($promo/100));
            $precio = $this->input->post("item85")-($montoDescu);
        }

        if ($tipodocSelect == 'storeCCF') {
            $ivaxitem = $this->lrenta->caliva13($precio, $cantidad, $iva13);
        } else {
            $ivaxitem = $this->lrenta->caliva13fc($precio, $cantidad, $iva13);
        }

        if ($numDocRelacionado != null) {
            $numDocRelacionado = $this->input->post("item78");
        }
        $gravadas = floatval($cantidad) * floatval($precio);
        // $ivaxitem = bcdiv( ( ( $gravadas*1.13 )-( $gravadas ) ), '1', 4 );

        $data  = array(

            'numeroControl' => $numeroControl,
            'codigoGeneracion' => $codigoGeneracion,
            'item' => $this->input->post("item72"),
            'tipoItem' => 3,
            'tipoDonacion' => '',
            'depreciacion' => '',
            'numDocRelacionado' => $this->input->post("item78"),           
            'cantidad' => $this->input->post("item80"),
            'codigo' => $this->input->post("item81"),
            'codTributo' => '',
            'unidadMedida' => $this->input->post("item83"),
            'descripcion' => $this->input->post("item84"),
            'precioUnitario' => $this->input->post("item85"),
            'valorUnitario' => $promo,
            'descuentos' => number_format($montoDescu*$cantidad, 2, '.', ''),
            'ventasNSujetas' => '0.00',
            'ventasExentas' => '0.00',
            'ventasGravadas' => $gravadas,
            'exportaciones' => '0.00',
            'valorDonado' => '0.00',
            'ventas' => $gravadas,
            'codigoTributo' => '20',
            'precSugVenta' => $this->input->post("item85"),
            'CargosAbono' => '0.00',
            'ivaItem' => number_format($ivaxitem, 2, '.', ''),
            'montoretencion' => '0.00',
            'observacionesItem' => $observacionesItem,
            'areafact' =>  $areafact,
            'serieProd' => $serieProd,
            'cantint' =>$this->input->post("cantint"),
            'umedida'=>$this->input->post("umedida")

        );

        if ($this->Cuerpodocumento_model->save($data)) {
            $data  = array(
                'OK' => '1',
            );
            echo json_encode($data);
        } else {

            $data  = array(
                'OK' => $this->session->set_flashdata("error", "No se pudo guardar la informacion"),
            );
            echo json_encode($data);
        }
    }
    public function storeOf()
    {

        $numeroControl = $this->input->post("numeroControl");
        $codigoGeneracion = $this->input->post("codigoGeneracion");
        $cantidad = $this->input->post("item80");
        $precio = $this->input->post("item85");
        $tipodocSelect = $this->input->post("tipodocSelect");
        $observacionesItem = $this->input->post("observacionesItem");
        $promo = $this->input->post("promo");

        $impuestos =  $this->Cuerpodocumento_model->getImpuestos();
        $fovial =    $impuestos[0]->valor;
        $cotrans =   $impuestos[1]->valor;
        $iva13 =    $impuestos[2]->valor;
        $numDocRelacionado = '';



        /* if ( ( $this->session->userdata( "areafact" ) == 'CO' or $this->session->userdata( "areafact" ) == 'CF' )  && $tipodocSelect == 'storeCCF' ) {
            $precio = $this->lrenta->precioSinIva( $precio, $iva13 ) ;

        }*/
        if ($tipodocSelect == 'storeCCF') {
            $ivaxitem = $this->lrenta->caliva13fc($precio, $cantidad, $iva13);
            $precio = ($precio) - $this->lrenta->caliva13fc($precio, 1, $iva13);
        } else {

            $ivaxitem = $this->lrenta->caliva13fc($precio, $cantidad, $iva13);
        }

        if ($numDocRelacionado != null) {
            $numDocRelacionado = $this->input->post("item78");
        }
        $gravadas = number_format(floatval($cantidad) * floatval($precio), 2, '.', '');;
        // $ivaxitem = bcdiv( ( ( $gravadas*1.13 )-( $gravadas ) ), '1', 4 );
        //$precio = $this->input->post( "item85" );
        $data  = array(

            'numeroControl' => $numeroControl,
            'codigoGeneracion' => $codigoGeneracion,
            'item' => $this->input->post("item72"),
            'tipoItem' => 3,
            'tipoDonacion' => '',
            'depreciacion' => '',
            'numDocRelacionado' => $this->input->post("item78"),
            /*
            'tipDTRelacionado'=>$this->input->post( "item76" ),
            'tipGenDoc'=>$this->input->post( "item77" ),
            'fechaGendoc'=>$this->input->post( "item79" ),
            */
            'cantidad' => $this->input->post("item80"),
            'codigo' => $this->input->post("item81"),
            'codTributo' => '',
            'unidadMedida' => $this->input->post("item83"),
            'descripcion' => $this->input->post("item84"),
            'precioUnitario' => $precio,
            'valorUnitario' => $promo,
            'descuentos' => '0.00',
            'ventasNSujetas' => '0.00',
            'ventasExentas' => '0.00',
            'ventasGravadas' => $gravadas,
            'exportaciones' => '0.00',
            'valorDonado' => '0.00',
            'ventas' => $gravadas,
            'codigoTributo' => '20',
            'precSugVenta' => $this->input->post("item85"),
            'CargosAbono' => '0.00',
            'ivaItem' => number_format($ivaxitem, 2, '.', ''),
            'montoretencion' => '0.00',
            'observacionesItem' => $observacionesItem,
            'areafact' => $this->session->userdata("areafact"),

        );

        if ($this->Cuerpodocumento_model->save($data)) {
            $data  = array(
                'OK' => '1',
            );
            echo json_encode($data);
        } else {

            $data  = array(
                'OK' => $this->session->set_flashdata("error", "No se pudo guardar la informacion"),
            );
            echo json_encode($data);
        }
    }

    public function storegasccf()
    {

        $numeroControl = $this->input->post("numeroControl");
        $codigoGeneracion = $this->input->post("codigoGeneracion");

        $cantidad = $this->lrenta->calculoGalones($this->input->post("item80"), $this->input->post("item85"));
        $precio = $this->input->post("item85");
        $impuestos =  $this->Cuerpodocumento_model->getImpuestos();
        $fovial =    $impuestos[0]->valor;
        $cotrans =   $impuestos[1]->valor;
        $iva13 =    $impuestos[2]->valor;

        $fovialRet = 0.0;
        $cotransRet = 0.0;

        $precio = number_format(($precio - $fovial - $cotrans) / (1 + $iva13), 4, '.', '');

        $gravadas = floatval($cantidad) * floatval($precio);

        /* $precio = $this->input->post( "item85" );
        $impuestos =  $this->Cuerpodocumento_model->getImpuestos();
        $fovial =    $impuestos[0]->valor;
        $cotrans =   $impuestos[1]->valor;
        $iva13 =    $impuestos[2]->valor;
        $factor=0.00;

        $precio2 = number_format( ( $precio-$fovial-$cotrans ), 2, '.', '' ) ;
        $cantidad=$this->lrenta->calculoGalones($this->input->post( "item80" ),$this->input->post( "item85" ));
        $factor=(($cantidad*$fovial)+($cantidad*$cotrans))/$this->input->post( "item80" );
        $gravadas = number_format( $this->input->post( "item80" )/(1+$factor), 2, '.', '' );  
        $cantidad=number_format($gravadas /$precio, 2, '.', '' ) ;
        $ivaxitem = $this->lrenta->caliva13fc( $precio, $cantidad, $iva13 );
      */

        $ivaxitem = number_format($this->lrenta->caliva13($precio, $cantidad, $iva13), 3, '.', '');

        $data  = array(

            'numeroControl' => $numeroControl,
            'codigoGeneracion' => $codigoGeneracion,
            'item' => $this->input->post("item72"),
            'tipoItem' => 3,
            'tipoDonacion' => '',
            'depreciacion' => '',
            'cantidad' => $cantidad,
            'codigo' => $this->input->post("item81"),
            'codTributo' => '',
            'unidadMedida' => $this->input->post("item83"),
            'descripcion' => $this->input->post("item84"),
            'precioUnitario' => $precio,
            'valorUnitario' => '',
            'descuentos' => '0.00',
            'ventasNSujetas' => '0.00',
            'ventasExentas' => '0.00',
            'ventasGravadas' => bcdiv($gravadas, '1', 2),
            'exportaciones' => '0.00',
            'valorDonado' => '0.00',
            'ventas' => bcdiv($gravadas, '1', 2),
            'codigoTributo' => '20,D1,C8',
            'precSugVenta' => $this->input->post("item85"),
            'CargosAbono' => '0.00',
            'ivaItem' => number_format($ivaxitem, 2, '.', ''),
            'montoretencion' => '0.00',
            'areafact' => $this->session->userdata("areafact"),

        );

        if ($this->Cuerpodocumento_model->save($data)) {
            $data  = array(
                'OK' => '1',
            );
            echo json_encode($data);
        } else {

            $data  = array(
                'OK' => $this->session->set_flashdata("error", "No se pudo guardar la informacion"),
            );
            echo json_encode($data);
        }
    }

    public function llenarTabla()
    {

        $numeroControl = $this->input->post("numeroControl");
        $codigoGeneracion = $this->input->post("codigoGeneracion");

        $tablaResumen = $this->Cuerpodocumento_model->getParaResumen($numeroControl, $codigoGeneracion);
        echo json_encode($tablaResumen);
    }

    public function ingresoResumen()
    {

        $numeroControl = $this->input->post("numeroControl");
        $codigoGeneracion = $this->input->post("codigoGeneracion");
        $ClienteExcluido = $this->input->post("excluido");
        $condicionOpera = $this->input->post("item153");
        $codFormaPago = $this->input->post("item154");
        $Plazo = $this->input->post("item157");
        $periodoPlazo = $this->input->post("item158");
        $numPagoElecNPE = '';
        $areafact = $this->input->post("areafact");
        $grancontribuyente = $this->input->post("grancontribuyente");
        $tipodocElec = $this->input->post("tipodocElec");
        $resumenConsulta = $this->input->post("tipoConsulta");

        $respuesta = $this->Cuerpodocumento_model->getParaResumen($numeroControl, $codigoGeneracion);
        $impuestos =  $this->Cuerpodocumento_model->getImpuestos();
        $fovial =    $impuestos[0]->valor;
        $cotrans =   $impuestos[1]->valor;
        $iva13 =    $impuestos[2]->valor;
        $iva1 =    $impuestos[5]->valor;
        $totalGravado = 0.00;
        $ivaResumen = 0.00;
        $subTotal = 0.00;
        $sumdescuentos=0.00;
        $sumadeprecioxcantidad = 0.00;
        $ivaRetenido = 0.0;
        if ($condicionOpera == "Ci") {
            $condicionOpera = 1;
        }
       

        for ($i = 0; $i < count($respuesta); $i++) {
            $totalGravado += $respuesta[$i]->subtotal;
            $ivaResumen += $respuesta[$i]->ivaItem;
            $sumadeprecioxcantidad += ($respuesta[$i]->precioUnitario * $respuesta[$i]->cantidad);
            $subTotal = $totalGravado;
            $sumdescuentos+=$respuesta[$i]->descuentos;
        }

        $totalGravado = number_format($totalGravado, 2, '.', '');
        $ivaResumen = number_format($ivaResumen, 2, '.', '');
        if ($grancontribuyente == 'R') {
            $ivaRetenido = number_format((($totalGravado - $ivaResumen) * $iva1), 2, '.', '');
        }
        if (($grancontribuyente == "R" || $grancontribuyente == "Sa" || $grancontribuyente == "go") ) {

            $ivaRetenido =  $this->lrenta->IvaPercibido(($totalGravado - $ivaResumen), $iva1);
            //( $totalGravado*( 1/100 ) );
        }
        $totalAPagar = ($totalGravado - $ivaRetenido);
        # procedemos a covertir la cantidad en letras
        $this->load->helper('numeros');
        $valorletras = array(
            'leyenda' => num_to_letras($totalAPagar), 'cantidad' => $totalAPagar
        );


        // echo json_encode($valorletras);
        // ingreso a resumen
        $data  = array(
            'totalNoSuj' => '0.00',
            'totalExenta' => '0.00',
            'totalGravada' => $totalGravado,
            //'totalOperaciones'=>$totalGravado,
            'sumOpSinImpu' => ($totalGravado),
            'subTotal' => $subTotal,
            'montoGloDescNS' => '0.00',
            'montoGloDescVE' => '0.00',
            'montoGloDescVG' => '0.00',
            'porcMontoGloDesc' => '0.00',
            'totalDescBonRev' =>   number_format($sumdescuentos, 2, '.', ''),
            //'nombreTributo'=> '[{"codigo":"20","descripcion":"Impuesto al Valor Agregado 13%","valor":'.$ivaResumen.'}]',
            'ivaPercibido' => '0.00',
            'ivaRetenido' => $ivaRetenido,
            'retencionRenta' => '',
            'montoTotalOp' => $totalGravado,
            'totalCargoBasImpon' => '0.00',
            'totalAPagar' => $totalAPagar,
            'valorLetras' => $valorletras['leyenda'],
            'iva13' => $ivaResumen,
            'saldoAFavor' => '0.00',
            'condicionOpera' => $condicionOpera,
            'codFormaPago' => $codFormaPago,
            'montoPorFormaPag' => $totalAPagar,
            'refModalidadPago' => '',
            'plazo' => $Plazo,
            'periodoPlazo' => $periodoPlazo,
            'numPagoElecNPE' => $numPagoElecNPE,
            'numeroControl' => $numeroControl,
            'codigoGeneracion' => $codigoGeneracion,
            'observaciones' => $condicionOpera
        );

        //

        if ($resumenConsulta == 'fin') {
            if ($this->resumen_model->savetho($data, $numeroControl, $codigoGeneracion)) {
                $data  = array(
                    'OK' => '1',
                );
                echo json_encode($data);
            } else {

                $data  = array(
                    'OK' => $this->session->set_flashdata("error", "No se pudo guardar la informacion"),
                );
                echo json_encode($data);
            }
        } else {
            echo json_encode($data);
        }
    }

    public function ingresoResumenCCF()
    {

        $numeroControl = $this->input->post("numeroControl");
        $codigoGeneracion = $this->input->post("codigoGeneracion");
        $ClienteExcluido = $this->input->post("excluido");
        $condicionOpera = $this->input->post("item153");
        $codFormaPago = $this->input->post("item154");
        $Plazo = $this->input->post("item157");
        $periodoPlazo = $this->input->post("item158");
        $numPagoElecNPE = $this->input->post("item158");
        $item78 = $this->input->post("item78");

        $grancontribuyente = $this->input->post("grancontribuyente");
        $tipodocElec = $this->input->post("tipodocElec");
        $areafact = $this->input->post("areafact");
        $resumenConsulta = $this->input->post("tipoConsulta");

        $respuesta = $this->Cuerpodocumento_model->getParaResumen($numeroControl, $codigoGeneracion);
        $impuestos =  $this->Cuerpodocumento_model->getImpuestos();
        $fovial =    $impuestos[0]->valor;
        $cotrans =   $impuestos[1]->valor;
        $iva13 =    $impuestos[2]->valor;
        $iva1 =    $impuestos[5]->valor;
        $totalGravado = 0.00;
        $ivaResumen = 0.00;
        $sumadeprecioxcantidad = 0.00;
        $ivaRetenido = 0.0;
        $retencionRenta = 0.00;
        $ivaPercibido = 0.00;
        $sumdescuentos=0.00;

        for ($i = 0; $i < count($respuesta); $i++) {
            $totalGravado += $respuesta[$i]->subtotal;
            $ivaResumen += $respuesta[$i]->ivaItem;
            $sumadeprecioxcantidad += ($respuesta[$i]->precioUnitario * $respuesta[$i]->cantidad);
            $sumdescuentos+=$respuesta[$i]->descuentos;
        }

        $totalGravado = bcdiv($totalGravado, '1', 2);
        $ivaResumen = $ivaResumen;

        if ($totalGravado >= 100 && ($grancontribuyente == "P" || $grancontribuyente == "M" || $grancontribuyente == 'S') ) {
            $ivaPercibido =  $this->lrenta->IvaPercibido($totalGravado, $iva1);
        }

        if ($totalGravado >= 100 && ($grancontribuyente == "R" || $grancontribuyente == "Sa" || $grancontribuyente == "go")) {

            $ivaRetenido =  $this->lrenta->IvaPercibido($totalGravado, $iva1);
            //( $totalGravado*( 1/100 ) );
        }

        $totalAPagar = bcdiv(($totalGravado + $ivaPercibido + $retencionRenta + $ivaResumen - $ivaRetenido), '1', 2);;

        $this->load->helper('numeros');
        $valorletras = array(
            'leyenda' => num_to_letras($totalAPagar), 'cantidad' => $totalAPagar
        );
        // echo json_encode($valorletras);

        // ingreso a resumen
        $data  = array(
            'totalNoSuj' => '0.00',
            'totalExenta' => '0.00',
            'totalGravada' => $totalGravado,
            'sumOpSinImpu' => $totalGravado,
            'montoGloDescNS' => '0.00',
            'montoGloDescVE' => '0.00',
            'montoGloDescVG' => '0.00',
            'porcMontoGloDesc' => '0.00',
            'totalDescBonRev' => number_format($sumdescuentos, 2, '.', ''),
            'nombreTributo' => '[{"codigo":"20","descripcion":"Impuesto al Valor Agregado 13%","valor":' . $ivaResumen . '}]',
            'subTotal' => $totalGravado,
            'ivaRetenido' => $ivaRetenido,
            'ivaPercibido' => $ivaPercibido,
            'retencionRenta' => '0.00',
            'montoTotalOp' => $totalGravado + $ivaResumen,
            'totalCargoBasImpon' => '0.00',
            'totalAPagar' => $totalAPagar,
            'valorLetras' => $valorletras['leyenda'],
            'saldoAFavor' => '0.00',
            'condicionOpera' => $condicionOpera,
            'codFormaPago' => $codFormaPago,
            'montoPorFormaPag' => $totalAPagar,
            'refModalidadPago' => '',
            'plazo' => $Plazo,
            'periodoPlazo' => $periodoPlazo,
            'numPagoElecNPE' => $numPagoElecNPE,
            'iva13' => $ivaResumen,
            'numeroControl' => $numeroControl,
            'codigoGeneracion' => $codigoGeneracion
        );
        $data2  = array(
            'ivaRetenido' => $ivaRetenido,
            'ivaPercibido' => $ivaPercibido
        );
        //
        if ($resumenConsulta == 'fin') {
            $this->Cuerpodocumento_model->update($numeroControl, $codigoGeneracion, $data2);
            if ($this->resumen_model->savetho($data, $numeroControl, $codigoGeneracion)) {
                $data  = array(
                    'OK' => '1',
                );
                echo json_encode($data);
            } else {

                $data  = array(
                    'OK' => $this->session->set_flashdata("error", "No se pudo guardar la informacion"),
                );
                echo json_encode($data);
            }
        } else {
            echo json_encode($data);
        }
    }

    public function ingresoResumengasCCF()
    {

        $numeroControl = $this->input->post("numeroControl");
        $codigoGeneracion = $this->input->post("codigoGeneracion");
        $ClienteExcluido = $this->input->post("excluido");
        $condicionOpera = $this->input->post("item153");
        $codFormaPago = $this->input->post("item154");
        $Plazo = $this->input->post("item157");
        $periodoPlazo = $this->input->post("item158");
        $numPagoElecNPE = ''; // $this->input->post( "numPagoElecNPE" );

        $grancontribuyente = $this->input->post("grancontribuyente");
        $tipodocElec = $this->input->post("tipodocElec");
        $areafact = $this->input->post("areafact");
        $resumenConsulta = $this->input->post("tipoConsulta");

        $respuesta = $this->Cuerpodocumento_model->getParaResumen($numeroControl, $codigoGeneracion);

        $impuestos =  $this->Cuerpodocumento_model->getImpuestos();
        $fovial =    $impuestos[0]->valor;
        $calfovial = $impuestos[0]->noseva;
        $cotrans =   $impuestos[1]->valor;
        $calCotrans = $impuestos[1]->noseva;
        $iva13 =    $impuestos[2]->valor;
        $totalGravado = 0.00;
        $ivaResumen = 0.00;
        $sumadeprecioxcantidad = 0.00;
        $ivaRetenido = 0.0;
        $retencionRenta = 0.00;
        $ivaPercibido = 0.00;
        $fovialRet = 0.0;
        $cotransRet = 0.0;

        for (
            $i = 0;
            $i < count($respuesta);
            $i++
        ) {
            $totalGravado +=  number_format($respuesta[$i]->subtotal, 2, '.', '');
            $ivaResumen += $respuesta[$i]->ivaItem;
            $sumadeprecioxcantidad += ($respuesta[$i]->precioUnitario * $respuesta[$i]->cantidad);
            $fovialRet += number_format($respuesta[$i]->cantidad * $fovial, 2, '.', '');
            $cotransRet += number_format($respuesta[$i]->cantidad * $cotrans, 2, '.', '');
        }

        $totalGravado = bcdiv($totalGravado, '1', 2);
        $ivaResumen = number_format($ivaResumen, 2, '.', '');
        if ($calfovial && $calCotrans) {
            $totalAPagar = bcdiv(($totalGravado + $ivaResumen + $fovialRet + $cotransRet), '1', 2);
        } else if ($calfovial == 1 &&  $calCotrans == 0) {
            $totalAPagar = bcdiv(($totalGravado + $ivaResumen + $fovialRet + 0), '1', 2);
        } else if ($calCotrans == 1 && $calfovial == 0) {
            $totalAPagar = bcdiv(($totalGravado + $ivaResumen + 0 + $cotransRet), '1', 2);
        };
        $this->load->helper('numeros');
        $valorletras = array(
            'leyenda' => num_to_letras($totalAPagar), 'cantidad' => $totalAPagar
        );
        // echo json_encode($valorletras);

        // ingreso a resumen
        $data  = array(
            'totalNoSuj' => '0.00',
            'totalExenta' => 0.00,
            'totalGravada' => $totalGravado,
            //'totalOperaciones'=>$totalGravado,
            'sumOpSinImpu' => $totalGravado,
            'montoGloDescNS' => '0.00',
            'montoGloDescVE' => '0.00',
            'montoGloDescVG' => '0.00',
            'porcMontoGloDesc' => '0.00',
            'totalDescBonRev' => '0.00',
            'nombreTributo' => '[{"codigo":"20","descripcion":"Impuesto al Valor Agregado 13%","valor":' . $ivaResumen . '},{"codigo":"D1","descripcion":"FOVIAL ($0.20 Ctvs. por galón)","valor":' . $fovialRet . '},{"codigo":"C8","descripcion":"COTRANS ($0.10 Ctvs. por galón)","valor":' . $cotransRet . '}]',
            'subTotal' => ($totalGravado),
            'ivaRetenido' => '0.00',
            'retencionRenta' => $retencionRenta,
            'montoTotalOp' => $totalAPagar,
            'totalCargoBasImpon' => '0.00',
            'totalAPagar' => $totalAPagar,
            'valorLetras' => $valorletras['leyenda'],
            'ivaPercibido' => '0.00',
            'saldoAFavor' => '0.00',
            'condicionOpera' => $condicionOpera,
            'codFormaPago' => $codFormaPago,
            'montoPorFormaPag' => $totalAPagar,
            'refModalidadPago' => '', // null sea billetes y monedas o creditos
            'plazo' => $Plazo,
            'periodoPlazo' => $periodoPlazo,
            'numPagoElecNPE' => $numPagoElecNPE,
            'iva13' => $ivaResumen,
            'numeroControl' => $numeroControl,
            //'fovialRet'=>$fovialRet,
            //'cotransRet'=>$cotransRet,
            'codigoGeneracion' => $codigoGeneracion
        );

        //

        if ($resumenConsulta == 'fin') {
            if ($this->resumen_model->savetho($data, $numeroControl, $codigoGeneracion)) {
                $data  = array(
                    'OK' => '1',
                );
                echo json_encode($data);
            } else {

                $data  = array(
                    'OK' => $this->session->set_flashdata("error", "No se pudo guardar la informacion"),
                );
                echo json_encode($data);
            }
        } else {

            echo json_encode($data);
        }
    }

    public function fcgas()
    {

        $numeroControl = $this->input->post("numeroControl");
        $codigoGeneracion = $this->input->post("codigoGeneracion");

        $precio = $this->input->post("item85");
        $impuestos =  $this->Cuerpodocumento_model->getImpuestos();
        $fovial =    $impuestos[0]->valor;
        $cotrans =   $impuestos[1]->valor;
        $iva13 =    $impuestos[2]->valor;
        $factor = 0.00;

        $precio2 = number_format(($precio - $fovial - $cotrans), 2, '.', '');
        $cantidad = $this->lrenta->calculoGalones($this->input->post("item80"), $this->input->post("item85"));
        //$factor=(($cantidad*$fovial)+($cantidad*$cotrans))/$this->input->post( "item80" );

        // $cantidad=number_format($gravadas /$precio, 2, '.', '' ) ;
        $gravadas = number_format(($precio2 * $cantidad), 2, '.', '');
        $ivaxitem = $this->lrenta->caliva13fc($precio2, $cantidad, $iva13);
        //$ivaxitem =number_format( $this->lrenta->caliva13( $precio, $cantidad, $iva13 ), 2, '.', '' );

        $data  = array(

            'numeroControl' => $numeroControl,
            'codigoGeneracion' => $codigoGeneracion,
            'item' => $this->input->post("item72"),
            'tipoItem' => 3,
            'tipoDonacion' => '',
            'depreciacion' => '',
            'cantidad' => $cantidad,
            'codigo' => $this->input->post("item81"),
            'codTributo' => '',
            'unidadMedida' => $this->input->post("item83"),
            'descripcion' => $this->input->post("item84"),
            'precioUnitario' => $precio2,
            'valorUnitario' => '',
            'descuentos' => '0.00',
            'ventasNSujetas' => '0.00',
            'ventasExentas' => '0.00',
            'ventasGravadas' => $gravadas,
            'exportaciones' => '0.00',
            'valorDonado' => '0.00',
            'ventas' => $gravadas,
            'codigoTributo' => '20',
            'precSugVenta' => $this->input->post("item85"),
            'CargosAbono' => '0.00',
            'ivaItem' => number_format($ivaxitem, 2, '.', ''),
            'montoretencion' => '0.00',
            'areafact' => $this->session->userdata("areafact"),

        );

        if ($this->Cuerpodocumento_model->save($data)) {
            $data  = array(
                'OK' => '1',
            );
            echo json_encode($data);
        } else {

            $data  = array(
                'OK' => $this->session->set_flashdata("error", "No se pudo guardar la informacion"),
            );

            echo json_encode($data);
        }
    }

    public function ingresoResumenGasFC()
    {

        $numeroControl = $this->input->post("numeroControl");
        $codigoGeneracion = $this->input->post("codigoGeneracion");
        $ClienteExcluido = $this->input->post("excluido");
        $condicionOpera = $this->input->post("item153");
        $codFormaPago = $this->input->post("item154");
        $Plazo = $this->input->post("item157");
        $periodoPlazo = $this->input->post("item158");
        $numPagoElecNPE = '';

        $grancontribuyente = $this->input->post("grancontribuyente");
        $tipodocElec = $this->input->post("tipodocElec");
        $resumenConsulta = $this->input->post("tipoConsulta");

        $respuesta = $this->Cuerpodocumento_model->getParaResumen($numeroControl, $codigoGeneracion);
        $impuestos =  $this->Cuerpodocumento_model->getImpuestos();
        $fovial =    $impuestos[0]->valor;
        $cotrans =   $impuestos[1]->valor;
        $iva13 =    $impuestos[2]->valor;
        $totalGravado = 0.00;
        $ivaResumen = 0.00;
        $sumadeprecioxcantidad = 0.00;
        $ivaRetenido = 0.0;
        $fovialRet = 0.0;
        $cotransRet = 0.0;

        for ($i = 0; $i < count($respuesta); $i++) {
            $totalGravado += $respuesta[$i]->subtotal;
            $ivaResumen += $respuesta[$i]->ivaItem;
            $sumadeprecioxcantidad += ($respuesta[$i]->precioUnitario * $respuesta[$i]->cantidad);
            $fovialRet += number_format($respuesta[$i]->cantidad * $fovial, 2, '.', '');
            $cotransRet += number_format($respuesta[$i]->cantidad * $cotrans, 2, '.', '');
        }

        $totalGravado = number_format($totalGravado, 2, '.', '');
        $ivaResumen = number_format($ivaResumen, 2, '.', '');

        $totalAPagar = number_format(($totalGravado), 2, '.', '');
        $this->load->helper('numeros');
        $valorletras = array(
            'leyenda' => num_to_letras($totalAPagar), 'cantidad' => $totalAPagar
        );
        // echo json_encode($valorletras);

        // ingreso a resumen
        $data  = array(
            'totalNoSuj' => '0.00',
            'totalExenta' => '0.00',
            'totalGravada' => $totalGravado,
            //'totalOperaciones'=>$totalGravado,
            'sumOpSinImpu' => $totalGravado,
            'subTotal' => $totalGravado,
            'montoGloDescNS' => '0.00',
            'montoGloDescVE' => '0.00',
            'montoGloDescVG' => '0.00',
            'porcMontoGloDesc' => '0.00',
            'totalDescBonRev' => '0.00',
            // 'nombreTributo'=> '[{"codigo":"20","descripcion":"Impuesto al Valor Agregado 13%","valor":'.$ivaResumen.'},{"codigo":"D1","descripcion":"FOVIAL ($0.20 Ctvs. por galón)","valor":'.$fovialRet.'},{"codigo":"C8","descripcion":"COTRANS ($0.10 Ctvs. por galón)","valor":'.$cotransRet.'}]',
            'ivaRetenido' => '0.00',
            'retencionRenta' => '',
            'montoTotalOp' => $totalAPagar,
            'totalCargoBasImpon' => '0.00',
            'totalAPagar' => $totalAPagar,
            'valorLetras' => $valorletras['leyenda'],
            'iva13' => $ivaResumen,
            'saldoAFavor' => '0.00',
            'condicionOpera' => $condicionOpera,
            'codFormaPago' => $codFormaPago,
            'montoPorFormaPag' => $totalAPagar,
            'refModalidadPago' => '',
            'plazo' => $Plazo,
            'periodoPlazo' => $periodoPlazo,
            'numPagoElecNPE' => $numPagoElecNPE,
            'numeroControl' => $numeroControl,
            'codigoGeneracion' => $codigoGeneracion
        );

        //

        if ($resumenConsulta == 'fin') {
            if ($this->resumen_model->savetho($data, $numeroControl, $codigoGeneracion)) {
                $data  = array(
                    'OK' => '1',
                );
                echo json_encode($data);
            } else {

                $data  = array(
                    'OK' => $this->session->set_flashdata("error", "No se pudo guardar la informacion"),
                );
                echo json_encode($data);
            }
        } else {

            $key = "nombreTributo";
            $value = '[{"codigo":"20","descripcion":"Impuesto al Valor Agregado 13%","valor":' . $ivaResumen . '},{"codigo":"D1","descripcion":"FOVIAL ($0.20 Ctvs. por galón)","valor":' . $fovialRet . '},{"codigo":"C8","descripcion":"COTRANS ($0.10 Ctvs. por galón)","valor":' . $cotransRet . '}]';

            $data[$key] = $value;
            $key = "montoPorFormaPag";
            $data[$key] = $totalAPagar + $fovialRet + $cotransRet;
            echo json_encode($data);
        }
    }

    public function cFacturaExp()
    {
        $numeroControl = $this->input->post("numeroControl");
        $codigoGeneracion = $this->input->post("codigoGeneracion");
        $cantidad = $this->input->post("item80");
        $resfiscal = $this->input->post("resfiscal");

        $precio = $this->input->post("item85");

        $dataPost  = array(
            'Qesp' => $this->input->post("Qesp"),
            'sacos' => $this->input->post("Sacos"),
            'contrato' => $this->input->post("contrato"),
        );
        $data  = array(
            'numeroControl' => $numeroControl,
            'codigoGeneracion' => $codigoGeneracion,
            'item' => $this->input->post("item72"),
            'cantidad' => $this->input->post("item80"),
            'codigo' => $this->input->post("item81"),
            'unidadMedida' => $this->input->post("item83"),
            'descripcion' => $this->input->post("item84"),
            'precioUnitario' => $precio,
            'descuentos' => '0.00',
            'ventasGravadas' => $precio * $cantidad,
            'codigoTributo' => '',
            'CargosAbono' => '0.00',
            //'observacionesItem'=>preg_replace('/\<br(\s*)?\/?\>/i', "\n",$this->input->post( "observacionesItem" ))
            'observacionesItem' => $this->input->post("observacionesItem"),
            'observacionesItems' => '{"rentaMenos":"550","ivaRetenido":"PA-0624 BB-609"}',
            'areafact' => $this->session->userdata("areafact"),
            'sacosEsp' =>   json_encode($dataPost),
            'cantint' =>$this->input->post("cantint"),
            'umedida'=>$this->input->post("umedida")


        );

        if ($this->Cuerpodocumento_model->save($data)) {

            $data  = array(
                'recintoFiscal' => $resfiscal,
            );
            $this->emisor_model->update($data);
            $data  = array(
                'OK' => '1',
            );
            echo json_encode($data);
        } else {

            $data  = array(
                'OK' => $this->session->set_flashdata("error", "No se pudo guardar la informacion"),
            );
            echo json_encode($data);
        }
    } // fin cFacturaExp 

    public function addnotaRemi()
    {

        $codigoGeneracion = strtoupper($this->uuid->v4());

        $anio = date("Y");
        $numeroControl = $this->identificacion_model->corelativo($anio, $this->session->userdata("codestab"));

        $data = array(
            'numeroControl' => $numeroControl->numeroControl + 1,
            );
        $this->identificacion_model->corelativoUpdate($anio,$this->session->userdata("codestab"), $data);


        $tipodocSelect = $this->input->post("tipodocSelect");

        $item11 = $this->input->post("item11");
        $item10 = $this->input->post("item10");
        $txt1 = $this->input->post("txt1");
        $numeroControl2 = $this->input->post("dtevincontrol");
        $codigoGeneracion2 = $this->input->post("dtevincodgen");
        $codTdoc = "";
        $version = "";
        if ($tipodocSelect == 'store') {
            $codTdoc = "01";
            $version = 1;
        } else if ($tipodocSelect == 'storeCCF') {
            $codTdoc = "03";
            $version = 3;
        } else {
            $codTdoc = $tipodocSelect;
            $version = $this->input->post("version");
        }


        // IDENTIFICACION DOCUMENTO
        $secuencia = str_pad(($numeroControl->numeroControl + 1), 15, "0", STR_PAD_LEFT);
        //$numeroControlFin='DTE-'.$codTdoc.'-123456789-'.$secuencia;
        $numeroControlFin = 'DTE-' . $codTdoc . '-' . $this->session->userdata("codestab") . '-' . $secuencia;
        $horaactual = date("h:i:s");

        $data  = array(

            'version' => $version,
            'ambDestino' => '01',
            'tipoDoc' => $codTdoc,
            'numeroControl' => $numeroControlFin,
            'codigoGeneracion' => $codigoGeneracion,
            'modFacturacion' => 1,
            'tipTransmicion' => 1,
            'fecha' => $item10,
            'hora' =>  $horaactual,

            'tipMoneda' => 'USD'
        );

        $data2  = array(
            'fecha' => $item10,
            'idReceptor' => $txt1,
            'numeroControl' => $numeroControlFin,
            'codigoGeneracion' => $codigoGeneracion,
            'destino' => $this->input->post("destino")

        );

        if ($this->input->post("tipoDoc") == "E") {

            $traedetalleRete = $this->resumen_model->traedetalleRete($numeroControl2, $codigoGeneracion2);


            $dicVin = array(
                'numeroControl' => $numeroControlFin,
                'codigoGeneracion' => $codigoGeneracion,
                //'tipoDoc'=>$traedetalleRete[0]->tipoDoc,
                'tipoDoc' => str_pad($traedetalleRete[0]->tipoDoc, '2', "0", STR_PAD_LEFT),
                'tipoGenera' => '2',
                'numDocRelacion' => $codigoGeneracion2,
                'fechaGeneracion' => $traedetalleRete[0]->fecha,
            );
        } else {
            $dicVin = array(
                'numeroControl' => $numeroControlFin,
                'codigoGeneracion' => $codigoGeneracion,
                //'tipoDoc'=>$traedetalleRete[0]->tipoDoc,
                'tipoDoc' => str_pad("01", '2', "0", STR_PAD_LEFT),
                'tipoGenera' => '1',
                'numDocRelacion' => $codigoGeneracion2,
                'fechaGeneracion' => $this->input->post("fechaFisico"),
            );
        }


        if ($this->docrelacionados_model->save($dicVin) && $this->identificacion_model->save($data) && $this->identificacion_model->save2($data2)) {
            $datasave  = array(
                'identificacion' => $this->session->userdata("areafact"),
                'receptordocumen' => $this->session->userdata("areafact"),
            );
            echo json_encode($data);
        } else {

            $datasave  = array(
                'error' => $this->session->set_flashdata("error", "No se pudo guardar la informacion"),
            );
            echo json_encode($data);
        }



        //  echo json_encode( $data );

    }

    public function NotRemicionIng()
    {
        $numeroControl = $this->input->post("numeroControl");
        $codigoGeneracion = $this->input->post("codigoGeneracion");
        $cantidad = $this->input->post("item80");
        $areafact = $this->input->post("areafact");
        $tipoDte = '';
        $codigoTributo = "";
        $precio = $this->input->post("item85");


        if ($this->input->post("tipoDoc") == "store") {
            $tipoDoc = "E";
            $codigoTributo = '';
        } elseif ($this->input->post("tipoDoc") == "storeCCF") {
            $tipoDoc = "E";
            $codigoTributo = '20';
        } else {
            $tipoDoc = 'F';
        }
        $dataPost  = array(
            "Motorista" => $this->input->post("Motorista"),
            "Licencia" => $this->input->post("Licencia"),
            "Placa" => $this->input->post("Placa"),
            "Marcavehi" => $this->input->post("Marcavehi"),
            "contenedor" => $this->input->post("contenedor"),
            "marchamo" => $this->input->post("marchamo"),
            "tipoDoc" => $tipoDoc,
            "dtevincontrol" => $this->input->post("dtevincontrol"),
            "dtevincodgen" => $this->input->post("dtevincodgen"),
            'sacos' => $this->input->post("Sacos"),
            'contrato' => $this->input->post("contrato"),
        );



        $data  = array(
            'numeroControl' => $numeroControl,
            'codigoGeneracion' => $codigoGeneracion,
            'item' => $this->input->post("item72"),
            'tipoItem' => 3,
            'cantidad' => $this->input->post("item80"),
            'codigo' => $this->input->post("item81"),
            'unidadMedida' => $this->input->post("item83"),
            'descripcion' => $this->input->post("item84"),
            'precioUnitario' => $precio,
            'descuentos' => '0.00',
            'ventasGravadas' => $precio * $cantidad,
            'codigoTributo' => $codigoTributo,
            'CargosAbono' => '0.00',
            'areafact' => $areafact,
            //'observacionesItem'=>preg_replace('/\<br(\s*)?\/?\>/i', "\n",$this->input->post( "observacionesItem" ))
            'observacionesItem' => $this->input->post("observacionesItem"),
            'observacionesItems' => $this->input->post("Marcas"),
            'sacosEsp' =>   json_encode($dataPost)

        );

        if ($this->Cuerpodocumento_model->save($data)) {


            $data  = array(
                'OK' => '1',
            );
            echo json_encode($data);
        } else {

            $data  = array(
                'OK' => $this->session->set_flashdata("error", "No se pudo guardar la informacion"),
            );
            echo json_encode($data);
        }
    } // fin cFacturaExp
    public function extrasDTE()
    {
        $numeroControl = $this->input->post("numeroControl");
        $codigoGeneracion = $this->input->post("codigoGeneracion");
        $tipOpera = $this->input->post("tipOpera");
        $clasificacion = $this->input->post("clasificacion");
        $sector = $this->input->post("sector");
        $tipo = $this->input->post("tipo");

        $data  = array(
            'numeroControl' => $numeroControl,
            'codigoGeneracion' => $codigoGeneracion,
            'c1' => $tipOpera,
            'c2' => $clasificacion,
            'c3' => $sector,
            'c4' => $tipo,

        );
        $this->Cuerpodocumento_model->extrasDTE($data);
    }
}
