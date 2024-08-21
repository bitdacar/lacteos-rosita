<?php
defined( 'BASEPATH' ) OR exit( 'No direct script access allowed' );

class vistas extends CI_Controller {

    public function __construct() {
        parent::__construct();
        if ( !$this->session->userdata( "nombre" ) ) {
            redirect( base_url() );

        }

        $this->load->model( "mhdte/resumen_model" );
        $this->load->model( "mhdte/integracion_model" );
        $this->load->model( "mhdte/Cuerpodocumento_model" );
        $this->load->model( "mhdte/identificacion_model" );
        $this->load->model( "mhdte/Get_cat_model" );
        $this->load->model( 'mhdte/emisor_model' );
        $this->load->model( 'mhdte/json_model' );
        $this->load->model( 'mhdte/receptor_model' );

        $this->load->library( 'Uuid' );
        $this->load->library( 'Lrenta' );

    }

    public function index() {
 $datos['titulo']='Ticket Sucursal 1';
        $this->load->view( "layouts/header" );
        $this->load->view( "layouts/aside" );
        $this->load->view( "ventas/factura");
        $this->load->view( "layouts/footer" );

    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    public function NuevaEntrada() {
        $placa = $this->input->post( "placa" );
        $nombre = $this->input->post( "nombre" );
        $documento = $this->input->post( "documento" );
        $observaciones = $this->input->post( "observaciones" );

        $fecha = date( "Y-m-d" );
        $hora = date( "H:i:s" );
     $codigoGeneracion = strtoupper( $this->uuid->v4() );

        $anio = date( "Y" );
        $numeroControl = $this->identificacion_model->corelativo( $anio );

        $data = array(
            'numeroControl' => $numeroControl->numeroControl+1,
        );
        $this->identificacion_model->corelativoUpdate( $anio, $data );
        
        // IDENTIFICACION DOCUMENTO
        $codTdoc="01";
        $secuencia=str_pad( ( $numeroControl->numeroControl+1 ), 15, "0", STR_PAD_LEFT );
        //$numeroControlFin='DTE-'.$codTdoc.'-123456789-'.$secuencia;
        $numeroControl='DTE-'.$codTdoc.'-PCSP0202-'.$secuencia;
       

        $tbl_ticket  = array(

            'dui'=>$documento,
            'nombreTitular'=>$nombre,
            'placa'=>$placa,
            'fecha'=>$fecha,
            'horaEntrada'=>$hora,
            'observaciones'=>$observaciones,
            'codigoGeneracion'=>$codigoGeneracion,
            'numeroControl'=>$numeroControl

        );


        if( $this->integracion_model->ingresoTickets(  $tbl_ticket  ) ) {

            $data  = array(

                'respuesta'=>'',
                'Error'=>''

            );

            echo json_encode($data);

        }else{
            $data  = array(

                'respuesta'=>'',
                'Error'=>$this->session->set_flashdata( "error", "No se pudo guardar la informacion" ),

            );

            echo json_encode($data);
        }




    }

    public function Retorno(){
        $fecha = date( "Y-m-d" );
        $respuesta=$this->integracion_model->Retorno($fecha);

        $data  = array(

            'respuesta'=>$respuesta,
            'Error'=>''

        );

        echo json_encode($data);


    }



    public function Salida(){
        $id = $this->input->post( "id" );
        $placa = $this->input->post( "placa" );
        $fecha = date( "Y-m-d" );
        $hora = date( "H:i:s" );
        $respuesta=$this->integracion_model->IngresoSalida($id,$placa);

        

        //$tiempo=(-);

        $fechaUno=new DateTime($respuesta[0]->horaEntrada);
        $fechaDos=new DateTime($hora);

        $dateInterval = $fechaUno->diff($fechaDos);
        $cobroH= $dateInterval->format('%H').PHP_EOL;
        $cobroM= $dateInterval->format('%i').PHP_EOL;
        $cobroS= $dateInterval->format('%s').PHP_EOL;

        $data  = array(

            'placaR'=>$respuesta[0]->placa ,
            'horaIn'=>$respuesta[0]->horaEntrada,
            'horaOut'=>$hora,
            'TotalPago'=>number_format(( (60*$cobroH+$cobroM)/60 )*1 , 2, '.', '' )

        );


        echo json_encode($data);


    }


    public function envioDespensaFac() {

        $numdoc = $this->input->post( "numeroControl" );
        $seriefac = $this->input->post( "codigoGeneracion" );

        $anio = date( "Y" );
        $fecha = date( "Y-m-d" );
        $hora = date( "h:i:s" );

        $selectTodo = $this->integracion_model->selectTodo( $seriefac, $numdoc );

        $codigoGeneracion = strtoupper( $this->uuid->v4() );

        $numeroControl = $this->identificacion_model->corelativo( $anio );

        $data = array(
            'numeroControl' => $numeroControl->numeroControl+1,
        );
        $this->identificacion_model->corelativoUpdate( $anio, $data );

        $tipodocSelect = $this->input->post( "tipodocSelect" );
        $item11 = $hora;
        $item10 = $fecha;
        $txt1 = $selectTodo[0]->codigo ;
        // idreceptor
        $codTdoc = $selectTodo[0]->tipdoc;
        //tipoDoc
        $version = "";
        if ( $codTdoc == 'CF' ) {
            $codTdoc = '01';
            $version = 1;
        } else {
            $codTdoc = '03';
            $version = 3;
        }

        // IDENTIFICACION DOCUMENTO
        $secuencia = str_pad( ( $numeroControl->numeroControl+1 ), 15, "0", STR_PAD_LEFT );

        $numeroControl = 'DTE-'.$codTdoc.'-CMPV0202-'.$secuencia;

        $tbl_Identificacion  = array(

            'version'=>$version,
            'ambDestino'=>'00',
            'tipoDoc'=>$codTdoc,
            'numeroControl' =>$numeroControl  ,
            'codigoGeneracion' => $codigoGeneracion,
            'modFacturacion' => 1,
            'tipTransmicion' => 1,
            'fecha' => $item10,
            'hora' => $item11,
            'tipMoneda' => 'USD'

        );

        $tbl_ReceptorDoc  = array(
            'fecha' => $item10,
            'idReceptor'=>$txt1,
            'numeroControl' =>$numeroControl  ,
            'codigoGeneracion' => $codigoGeneracion,
            'seriefac' => $seriefac,
            'serienumfac' => $numdoc,
            'fechaseriefact' => $selectTodo[0]->fecmov,

        );

        if ( $this->identificacion_model->save( $tbl_Identificacion ) && $this->identificacion_model->save2( $tbl_ReceptorDoc ) ) {
            $datasave  = array(
                'identificacion' => 'ok',
                'receptordocumen' => 'ok',
            );

        } else {

            $datasave  = array(
                'error' => $this->session->set_flashdata( "error", "No se pudo guardar la informacion" ),
            );
            echo json_encode( $data );
        }

        // CUERPO DE DOCUMENTO
        $totalGravado = 0;
        $ResumenIva13 = 0;
        $j = 0;
        for ( $i = 0; $i<count( $selectTodo );
             $i++ ) {

            $totalGravado += ( floatval( $selectTodo[$i]->canfac )* floatval( bcdiv( $selectTodo[$i]->preuni, '1', 2 ) ) );

            $ResumenIva13 += floatval( $selectTodo[$i]->debfis );
            // echo $selectTodo[$i]->codigo.'/n';

            $tbl_cuerpoDoc  = array(

                'numeroControl'=>$numeroControl,
                'codigoGeneracion'=>$codigoGeneracion,
                'item'=>$j += 1, //$c6[14]
                'tipoItem'=>3,
                'tipoDonacion'=>'',
                'depreciacion'=>'',
                'numDocRelacionado'=>'',
                'cantidad'=>$selectTodo[$i]->canfac ,
                'codigo'=>$selectTodo[$i]->codinv,
                'codTributo'=>'',
                'unidadMedida'=>'59', //hacerel join
                'descripcion'=>$selectTodo[$i]->confac,
                'precioUnitario'=> bcdiv( $selectTodo[$i]->preuni, '1', 2 ),
                'valorUnitario'=>'',
                'descuentos'=>'0.00',
                'ventasNSujetas'=>'0.00',
                'ventasExentas'=>'0.00',
                'ventasGravadas'=>( floatval( $selectTodo[$i]->canfac )* floatval( bcdiv( $selectTodo[$i]->preuni, '1', 2 ) ) ),
                'exportaciones'=>'0.00',
                'valorDonado'=>'0.00',
                'ventas'=>$selectTodo[$i]->preuni,
                'codigoTributo'=>'20',
                'precSugVenta'=>$selectTodo[$i]->preuni,
                'CargosAbono'=>'0.00',
                'ivaItem'=>$selectTodo[$i]->debfis,
                'montoretencion'=>'0.00',
                'areafact'=>'IT'
            );

            if ( $this->Cuerpodocumento_model->save( $tbl_cuerpoDoc ) ) {

            } else {

                $data  = array(
                    'OK' => $this->session->set_flashdata( "error", "No se pudo guardar la informacion" ),
                );
                echo json_encode( $data );
            }

        }
        $this->load->helper( 'numeros' );
        $valorletras = array(
            'leyenda' => num_to_letras( $totalGravado )
            , 'cantidad' =>$totalGravado
        );

        //resumenes
        if ( $codTdoc == '01' ) {

            $tbl_Resumen  = array(
                'totalNoSuj'=>'0.00',
                'totalExenta'=>'0.00',
                'totalGravada'=>$totalGravado,
                'sumOpSinImpu'=>$totalGravado,
                'subTotal'=>$totalGravado,
                'montoGloDescNS'=>'0.00',
                'montoGloDescVE'=>'0.00',
                'montoGloDescVG'=>'0.00',
                'porcMontoGloDesc'=>'0.00',
                'totalDescBonRev'=>'0.00',
                'ivaPercibido'=> '0.00',
                'ivaRetenido'=> '0.00',
                'retencionRenta'=>'',
                'montoTotalOp'=> $totalGravado,
                'totalCargoBasImpon'=>'0.00',
                'totalAPagar'=> $totalGravado,
                'valorLetras'=>$valorletras['leyenda'],
                'iva13'=>$ResumenIva13,
                'saldoAFavor'=>'0.00',
                'condicionOpera'=>1,
                'codFormaPago'=>'01',
                'montoPorFormaPag'=>$totalGravado,
                'refModalidadPago'=>'',
                'plazo'=>'01',
                // 'periodoPlazo'=>null,
                'numPagoElecNPE'=>'',
                'numeroControl'=>$numeroControl,
                'codigoGeneracion'=>$codigoGeneracion,
                'observaciones'=>''
            );

        }

        $iva = $ResumenIva13;
        if ( $codTdoc == '03' ) {

            $tbl_Resumen  = array(
                'totalNoSuj'=>'0.00',
                'totalExenta'=>'0.00',
                'totalGravada'=>$totalGravado,
                'sumOpSinImpu'=>$totalGravado,
                'montoGloDescNS'=>'0.00',
                'montoGloDescVE'=>'0.00',
                'montoGloDescVG'=>'0.00',
                'porcMontoGloDesc'=>'0.00',
                'totalDescBonRev'=>'0.00',
                'nombreTributo'=> '[{"codigo":"20","descripcion":"Impuesto al Valor Agregado 13%","valor":'.$iva.'}]',
                'subTotal'=>$totalGravado,
                'ivaRetenido'=>0.00,
                'ivaPercibido'=>0.00,
                'retencionRenta'=>'0.00',
                'montoTotalOp'=>$totalGravado+$iva,
                'totalCargoBasImpon'=>'0.00',
                'totalAPagar'=>  $totalGravado+$iva,
                'valorLetras'=> $valorletras['leyenda'],
                'saldoAFavor'=>'0.00',
                'condicionOpera'=>1,
                'codFormaPago'=>'01',
                'montoPorFormaPag'=> $totalGravado,
                'refModalidadPago'=>'',
                'plazo'=>'01',
                'periodoPlazo'=>'',
                'numPagoElecNPE'=>'',
                'iva13'=>$iva,
                'numeroControl'=>$numeroControl,
                'codigoGeneracion'=>$codigoGeneracion
            );

        }

        if ( $this->resumen_model->savetho( $tbl_Resumen, $numeroControl, $codigoGeneracion ) ) {

        } else {

            $data  = array(
                'OK' => $this->session->set_flashdata( "error", "No se pudo guardar la informacion" ),
            );
            echo json_encode( $data );
        }

        $datasave  = array(
            'numeroControl' => $numeroControl,
            'codigoGeneracion' => $codigoGeneracion,
        );

        echo json_encode( $datasave );

    }

}
