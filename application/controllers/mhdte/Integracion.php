<?php
defined( 'BASEPATH' ) OR exit( 'No direct script access allowed' );

class integracion extends CI_Controller {

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
        $this->load->model('mhdte/emisor_model');
        $this->load->model('mhdte/json_model');
        $this->load->model('mhdte/receptor_model');


        $this->load->library( 'Uuid' );
        $this->load->library( 'Lrenta' );

    }

 



 
    public function llenarTabla() {

        $numeroControl = $this->input->post( "numeroControl" );
        $codigoGeneracion = $this->input->post( "codigoGeneracion" );
        $fecha='2023-05-04';

        $tablaResumen = $this->resumen_model->traedetallelee( $numeroControl,$fecha );

        echo json_encode( $tablaResumen );

    }

    public function archivotxt(){
        $codigoGeneracion = $this->input->post( "numeroControl" );
        $fini = $this->input->post( "fini" );
        $ffin = $this->input->post( "ffin" );
        $fechatxt ="Integracion";

        $estado = 1;
        $arch="";
        $fecha=date("Y-m-d");
        $hora = date("h:i:s");
        // variable $arc está vacia

        //$arch = fopen("//192.120.55.195/sys2000/ACCESORIOS/FAUSTO/Facturacion Electronica/Integracion/".$fechatxt.".txt", "w+");
        $arch = fopen("C:/Users/Public/".$fechatxt.".txt", "w+");

        fwrite($arch, "");

        fclose($arch);

        $respuesta = $this->resumen_model->consultaArchivo( $estado, $fechatxt,$fini,$ffin );


        //$ar = fopen("//192.120.55.195/sys2000/ACCESORIOS/FAUSTO/Facturacion Electronica/Integracion/".$fechatxt.".txt", "a") or       
        $ar = fopen("C:/Users/Public/".$fechatxt.".txt", "a") or   
            fputs($ar,str_pad(substr ("topodoc", 0, 2),'2', " ", STR_PAD_LEFT ));
        fputs($ar,str_pad(substr ("tipodoc", 0, 2),'2', " ", STR_PAD_LEFT ));
        fputs($ar,str_pad('','1', " ", STR_PAD_LEFT ));
        fputs($ar,str_pad(substr ("numeroControl", 0, 31),'32', " ", STR_PAD_RIGHT ));
        fputs($ar,str_pad(substr ("codigoGeneracion", 0, 36),'37', " ", STR_PAD_RIGHT ));
        fputs($ar,str_pad(substr ("numrecepcionMH", 0, 40),'41', " ", STR_PAD_RIGHT ));
        fputs($ar,str_pad(substr ("Numerocontrolint", 0, 20),'21', " ", STR_PAD_LEFT ));
        fputs($ar,str_pad(substr ("fecha", 0, 10),'11', " ", STR_PAD_RIGHT ));
        fputs($ar,str_pad(substr ("hora", 0, 8),'9', " ", STR_PAD_RIGHT ));
        fputs($ar,str_pad(substr ("cliente", 0, 8),'9', " ", STR_PAD_RIGHT ));
        fputs($ar,str_pad(substr ("nit", 0, 17),'18', " ", STR_PAD_RIGHT ));
        fputs($ar,str_pad(substr ("numDoc", 0, 10),'11', " ", STR_PAD_RIGHT ));
        fputs($ar,str_pad(substr ("ncr", 0, 9),'10', " ", STR_PAD_RIGHT ));
        fputs($ar,str_pad(substr ("dirComplemento", 0, 40),'41', " ", STR_PAD_RIGHT ));
        fputs($ar,str_pad(substr ("Departamento", 0, 2),'3', " ", STR_PAD_RIGHT ));
        fputs($ar,str_pad(substr ("Municipio", 0, 2),'3', " ", STR_PAD_LEFT ));
        fputs($ar,str_pad(substr ("condicionOpera", 0, 2),'3', " ", STR_PAD_LEFT ));
        fputs($ar,str_pad(substr ("codFormaPago", 0, 2),'3', " ", STR_PAD_LEFT ));
        fputs($ar,str_pad(substr ("montoPorFormaPag", 0, 2),'3', " ", STR_PAD_LEFT ));
        fputs($ar,str_pad(substr ("refModalidadPago", 0, 2),'3', " ", STR_PAD_LEFT ));
        fputs($ar,str_pad(substr ("plazo", 0, 2),'3', " ", STR_PAD_LEFT ));
        fputs($ar,str_pad(substr ("periodoPlazo", 0, 2),'3', " ", STR_PAD_LEFT ));
        fputs($ar,str_pad(substr ("numPagoElecNPE", 0, 20),'21', " ", STR_PAD_LEFT ));
        fputs($ar,str_pad(substr ("incoterms", 0, 2),'3', " ", STR_PAD_LEFT ));
        fputs($ar,str_pad('','1', " ", STR_PAD_LEFT ));
        fputs($ar,str_pad(substr ("descincoterms", 0, 20),'21', " ", STR_PAD_RIGHT ));
        fputs($ar,str_pad(substr ("ConsumoInterno", 0, 2),'3', " ", STR_PAD_LEFT ));
        fputs($ar,str_pad(substr ("item", 0, 4),'5', " ", STR_PAD_LEFT ));
        fputs($ar,str_pad(substr ("tipDTRelacionado", 0, 2),'3', " ", STR_PAD_LEFT ));
        fputs($ar,str_pad(substr ("numDocRelacionado", 0, 36),'37', " ", STR_PAD_RIGHT ));
        fputs($ar,str_pad(substr ("fechaGendoc", 0, 10),'11', " ", STR_PAD_RIGHT ));
        fputs($ar,str_pad(substr ("cantidad", 0, 14),'15', " ", STR_PAD_LEFT ));
        fputs($ar,str_pad('','1', " ", STR_PAD_LEFT ));
        fputs($ar,str_pad(substr ("codigo", 0, 20),'21', " ", STR_PAD_RIGHT ));
        fputs($ar,str_pad(substr ("areafact", 0, 3),'4', " ", STR_PAD_RIGHT ));
        fputs($ar,str_pad(substr ("descripcion", 0, 40),'41', " ", STR_PAD_RIGHT ));
        fputs($ar,str_pad(substr ("precioUnitario", 0, 14),'15', " ", STR_PAD_LEFT ));
        fputs($ar,str_pad(substr ("ventasGravadas", 0, 14),'15', " ", STR_PAD_LEFT ));
        fputs($ar,str_pad(substr ("ivaItem", 0, 14),'15', " ", STR_PAD_LEFT ));
        fputs($ar,str_pad(substr ("montoretencion", 0, 14),'15', " ", STR_PAD_LEFT ));
        fputs($ar,str_pad(substr ("codRetencion", 0, 2),'3', " ", STR_PAD_LEFT ));
        fputs($ar,str_pad(substr ("ivaRetenido", 0, 14),'15', " ", STR_PAD_LEFT ));
        fputs($ar,str_pad('','1', " ", STR_PAD_LEFT ));
        fputs($ar,str_pad(substr ("observacionesItem", 0, 100),'101', " ", STR_PAD_RIGHT ));
        fputs($ar,str_pad(substr ("observacionesItems", 0, 100),'101', " ", STR_PAD_RIGHT ));
        fputs($ar,str_pad(substr ("ivaPercibido", 0, 14),'15', " ", STR_PAD_LEFT ));
        fputs($ar,str_pad(substr ("sacos", 0, 4),'4', " ", STR_PAD_LEFT ));
        fputs($ar,str_pad('','1', " ", STR_PAD_LEFT ));
        fputs($ar,str_pad(substr ("fexDestino", 0, 100),'101', " ", STR_PAD_RIGHT ));
        fputs($ar,str_pad(substr ("Contrato", 0, 15),'16', " ", STR_PAD_RIGHT ));
        fputs($ar,str_pad(substr ("fovial", 0, 14),'15', " ", STR_PAD_LEFT ));
        fputs($ar,str_pad(substr ("cotrans", 0, 14),'15', " ", STR_PAD_LEFT ));              
        fputs($ar,str_pad(substr ("promo", 0, 14),'15', " ", STR_PAD_LEFT ));              
        fputs($ar,str_pad(substr ("montoFormaPag", 0, 14),'15', " ", STR_PAD_LEFT ));              
        fputs($ar,str_pad(substr ("cuentaxA", 0, 14),'15', " ", STR_PAD_LEFT ));              
        fputs($ar,str_pad(substr ("cuentaxV", 0, 14),'15', " ", STR_PAD_LEFT ));              
        fputs($ar,str_pad(substr ("CodVendedor", 0, 14),'15', " ", STR_PAD_LEFT ));   
         fputs($ar,str_pad(substr ("Renta", 0, 14),'15', " ", STR_PAD_LEFT )); 
        fputs($ar,str_pad(substr ("tipOperaExc", 0, 2),'3', " ", STR_PAD_LEFT )); 
        fputs($ar,str_pad(substr ("clasificacion", 0, 2),'3', " ", STR_PAD_LEFT )); 
         fputs($ar,str_pad(substr ("sector", 0, 2),'3', " ", STR_PAD_LEFT )); 
         fputs($ar,str_pad(substr ("tipo", 0, 2),'3', " ", STR_PAD_LEFT )); 
        fputs($ar, "\n");
        fclose($ar);            
        for ( $i = 0; $i<count( $respuesta ); $i++ ) {

            $response = $this->resumen_model->traedetalle( $respuesta[$i]->numeroControl, $respuesta[$i]->codigoGeneracion );

            if($response){
                $total=0;
                for ( $j = 0; $j<count( $response ); $j++ ) {
                    $area='';


                    //$ar = fopen("//192.120.55.195/sys2000/ACCESORIOS/FAUSTO/Facturacion Electronica/Integracion/".$fechatxt.".txt", "a") or
                    $ar = fopen("C:/Users/Public/".$fechatxt.".txt", "a") or
                        //  $ar = fopen("C:/Users/LENOVO/Documents".$fechatxt.".txt", "a") or
                        die("Problemas en la creacion");


                    fputs($ar,str_pad(substr ($response[$j]->tipodoc, 0, 2),'2', "0", STR_PAD_LEFT ));
                    fputs($ar,str_pad('','1', " ", STR_PAD_LEFT ));
                    fputs($ar,str_pad(substr ($response[$j]->numeroControl, 0, 31),'32', " ", STR_PAD_RIGHT ));
                    fputs($ar,str_pad(substr ($response[$j]->codigoGeneracion, 0, 36),'37', " ", STR_PAD_RIGHT ));
                    fputs($ar,str_pad(substr ($response[$j]->numrecepcionMH, 0, 40),'41', " ", STR_PAD_RIGHT ));
                    fputs($ar,str_pad(substr ($response[$j]->Numerocontrolint, 0, 20),'21', " ", STR_PAD_LEFT ));
                    fputs($ar,str_pad(substr ($response[$j]->fecha, 0, 10),'11', " ", STR_PAD_RIGHT ));
                    fputs($ar,str_pad(substr ($response[$j]->hora, 0, 8),'9', " ", STR_PAD_RIGHT ));
                    fputs($ar,str_pad(substr ($response[$j]->cliente, 0, 8),'9', " ", STR_PAD_RIGHT ));
                    fputs($ar,str_pad(substr ($response[$j]->nit, 0, 17),'18', " ", STR_PAD_RIGHT ));
                    fputs($ar,str_pad(substr ($response[$j]->numDoc, 0, 10),'11', " ", STR_PAD_RIGHT ));
                    fputs($ar,str_pad(substr ($response[$j]->ncr, 0, 9),'10', " ", STR_PAD_RIGHT ));
                    fputs($ar,str_pad(substr (utf8_decode($response[$j]->dirComplemento), 0, 40),'41', " ", STR_PAD_RIGHT ));
                    fputs($ar,str_pad(substr ($response[$j]->Departamento, 0, 2),'3', " ", STR_PAD_LEFT ));
                    fputs($ar,str_pad(substr ($response[$j]->Municipio, 0, 2),'3', " ", STR_PAD_LEFT ));
                    fputs($ar,str_pad(substr ($response[$j]->condicionOpera, 0, 2),'3', " ", STR_PAD_LEFT ));
                    fputs($ar,str_pad(substr ($response[$j]->codFormaPago, 0, 2),'3', " ", STR_PAD_LEFT ));
                    fputs($ar,str_pad(substr ($response[$j]->montoPorFormaPag, 0, 2),'3', " ", STR_PAD_LEFT ));
                    fputs($ar,str_pad(substr ($response[$j]->refModalidadPago, 0, 2),'3', " ", STR_PAD_LEFT ));
                    fputs($ar,str_pad(substr ($response[$j]->plazo, 0, 2),'3', " ", STR_PAD_LEFT ));
                    fputs($ar,str_pad(substr ($response[$j]->periodoPlazo, 0, 2),'3', " ", STR_PAD_LEFT ));
                    fputs($ar,str_pad(substr ($response[$j]->numPagoElecNPE, 0, 20),'21', " ", STR_PAD_LEFT ));
                    fputs($ar,str_pad(substr ($response[$j]->incoterms, 0, 2),'3', " ", STR_PAD_LEFT ));
                    fputs($ar,str_pad('','1', " ", STR_PAD_LEFT ));
                    fputs($ar,str_pad(substr ($response[$j]->descincoterms, 0, 20),'21', " ", STR_PAD_RIGHT ));
                    fputs($ar,str_pad(substr ($response[$j]->ConsumoInterno, 0, 2),'3', " ", STR_PAD_LEFT ));
                    fputs($ar,str_pad(substr ($response[$j]->item, 0, 4),'5', " ", STR_PAD_LEFT ));
                    fputs($ar,str_pad(substr ($response[$j]->tipDTRelacionado, 0, 2),'3', " ", STR_PAD_LEFT ));
                    fputs($ar,str_pad(substr ($response[$j]->numDocRelacionado, 0, 36),'37', " ", STR_PAD_RIGHT ));
                    fputs($ar,str_pad(substr ($response[$j]->fechaGendoc, 0, 10),'11', " ", STR_PAD_RIGHT ));
                    fputs($ar,str_pad(substr (number_format( $response[$j]->cantidad, 2, '.', '' ), 0, 14),'15', " ", STR_PAD_LEFT ));
                    fputs($ar,str_pad('','1', " ", STR_PAD_LEFT ));
                    fputs($ar,str_pad(substr ($response[$j]->codigo, 0, 20),'21', " ", STR_PAD_RIGHT ));

                    if($response[$j]->codCobol==12){
                        $area= $response[$j]->codClicobol;
                    }else{
                        $area=$response[$j]->codCobol;
                    }

                    fputs($ar,str_pad(substr ($area, 0, 3),'4', " ", STR_PAD_RIGHT ));
                    fputs($ar,str_pad(substr ( preg_replace("/[\r\n|\n|\r]+/", " ",$response[$j]->descripcion), 0, 40),'41', " ", STR_PAD_RIGHT ));
                    fputs($ar,str_pad(substr (number_format($response[$j]->precioUnitario, 2, '.', '' ), 0, 14),'15', " ", STR_PAD_LEFT ));
                    fputs($ar,str_pad(substr (number_format($response[$j]->ventasGravadas, 2, '.', '' ), 0, 14),'15', " ", STR_PAD_LEFT ));
                    fputs($ar,str_pad(substr (number_format($response[$j]->ivaItem, 2, '.', '' ), 0, 14),'15', " ", STR_PAD_LEFT ));
                    fputs($ar,str_pad(substr (number_format($response[$j]->montoretencion, 2, '.', '' ), 0, 14),'15', " ", STR_PAD_LEFT ));
                    fputs($ar,str_pad(substr ($response[$j]->codRetencion, 0, 2),'3', " ", STR_PAD_LEFT ));
                    fputs($ar,str_pad(substr (number_format($response[$j]->ivaRetenido, 2, '.', '' ), 0, 14),'15', " ", STR_PAD_LEFT ));
                    fputs($ar,str_pad('','1', " ", STR_PAD_LEFT ));
                    fputs($ar,str_pad(substr (utf8_decode($response[$j]->observacionesItem), 0, 100),'101', " ", STR_PAD_RIGHT ));
                    fputs($ar,str_pad(substr (utf8_decode($response[$j]->observacionesItems), 0, 100),'101', " ", STR_PAD_RIGHT ));
                    fputs($ar,str_pad(substr (number_format($response[$j]->ivaPercibido, 2, '.', '' ), 0, 14),'15', " ", STR_PAD_LEFT ));
                    fputs($ar,str_pad(substr ($response[$j]->sacos, 0, 4),'4', " ", STR_PAD_LEFT ));
                    fputs($ar,str_pad('','1', " ", STR_PAD_LEFT ));
                    $parte=json_decode($response[$j]->fexDestino);
                    $remplazo= array('"','\/');
                    $remplazos= array('',' ');
                    fputs($ar,str_pad(substr (str_replace($remplazo,$remplazos,json_encode($parte->destino)." * ".json_encode($parte->direccionCli)), 0, 100),'101', " ", STR_PAD_RIGHT ));
                    fputs($ar,str_pad(substr ($response[$j]->Contrato, 0, 15),'16', " ", STR_PAD_RIGHT ));
                    fputs($ar,str_pad(substr (number_format($response[$j]->fovial, 2, '.', '' ), 0, 14),'15', " ", STR_PAD_LEFT ));
                    fputs($ar,str_pad(substr (number_format($response[$j]->cotrans, 2, '.', '' ), 0, 14),'15', " ", STR_PAD_LEFT ));
                    fputs($ar,str_pad(substr ($response[$j]->promo, 0, 14),'15', " ", STR_PAD_LEFT ));
                    fputs($ar,str_pad(substr ($response[$j]->montoPorFormaPag, 0, 14),'15', " ", STR_PAD_LEFT ));

                    fputs($ar,str_pad(substr ($response[$j]->cuentaArea, 0, 14),'15', " ", STR_PAD_LEFT ));
                    fputs($ar,str_pad(substr ($response[$j]->cuentaVende, 0, 14),'15', " ", STR_PAD_LEFT ));
                    fputs($ar,str_pad(substr ($response[$j]->CodVendedor, 0, 14),'15', " ", STR_PAD_LEFT ));
                     fputs($ar,str_pad(substr ($response[$j]->retencionRenta==''?'0.00':($response[$j]->retencionRenta==0?'0.00':number_format($response[$j]->retencionRenta,2,'.','')), 0, 14),'15', " ", STR_PAD_LEFT ));
                    fputs($ar,str_pad(substr ($response[$j]->c1, 0, 2),'3', " ", STR_PAD_LEFT ));
                    fputs($ar,str_pad(substr ($response[$j]->c2, 0, 2),'3', " ", STR_PAD_LEFT ));
                    fputs($ar,str_pad(substr ($response[$j]->c3, 0, 2),'3', " ", STR_PAD_LEFT ));
                    fputs($ar,str_pad(substr ($response[$j]->c4, 0, 2),'3', " ", STR_PAD_LEFT ));

                    fputs($ar, "\n");
                    fclose($ar);
                    $total=$response[$j]->totalAPagar;
                }
                $dataAnula = array(
                    'estado' => 2,//luego cambiar a estado 2 que es enviado a cobol
                );

                // $rAnulaEstado = $this->json_model->modificarEstadoDte($respuesta[$i]->numeroControl, $respuesta[$i]->codigoGeneracion, $dataAnula);

                $listaActualizar[]= $data  = array(
                    'numeroControl' => $respuesta[$i]->numeroControl,
                    'codigoGeneracion' => $respuesta[$i]->codigoGeneracion,
                    'interno' =>  $respuesta[$i]->fecha,
                    'valor' =>  $total,
                    'recepcionmh' =>  $respuesta[$i]->hora,
                );
            }


        }

        $codigoGeneracion = strtoupper( $this->uuid->v4() );
        $this->guardaenvioCobol( $listaActualizar,$codigoGeneracion,$fecha);

        $dataAnula = array(
            'tabla' => $listaActualizar,
            'codigo' => $codigoGeneracion,
        );
        echo json_encode($dataAnula);

    }

    public function archivotxtReimprimir(){
        $codigoGeneracion = $this->input->post( "numeroControl" );
        $fechatxt ="REIntegracion";

        $estado = 1;
        $arch="";
        $fecha=date("Y-m-d");
        $hora = date("h:i:s");
        // variable $arc está vacia

        //$arch = fopen("//192.120.55.195/sys2000/ACCESORIOS/FAUSTO/Facturacion Electronica/Integracion/".$fechatxt.".txt", "w+");
        $arch = fopen("F:/Integracion/".$fechatxt.".txt", "w+");

        fwrite($arch, "");

        fclose($arch);

        $respuestas=$this->integracion_model->consultaEnviCobolRep($codigoGeneracion);

        $listas= json_decode($respuestas[0]->archivo,true);$i=0;

        foreach ($listas as $lista) {
            $respuesta[$i]["numeroControl"]=$lista['numeroControl'];
            $respuesta[$i]["codigoGeneracion"]=$lista['codigoGeneracion'];
            $i++;
        }

        //echo json_encode($respuesta);
        //$ar = fopen("//192.120.55.195/sys2000/ACCESORIOS/FAUSTO/Facturacion Electronica/Integracion/".$fechatxt.".txt", "a") or       
        $ar = fopen("F:/Integracion/".$fechatxt.".txt", "a") or   
            fputs($ar,str_pad(substr ("topodoc", 0, 2),'2', " ", STR_PAD_LEFT ));
        fputs($ar,str_pad(substr ("tipodoc", 0, 2),'2', " ", STR_PAD_LEFT ));
        fputs($ar,str_pad('','1', " ", STR_PAD_LEFT ));
        fputs($ar,str_pad(substr ("numeroControl", 0, 31),'32', " ", STR_PAD_RIGHT ));
        fputs($ar,str_pad(substr ("codigoGeneracion", 0, 36),'37', " ", STR_PAD_RIGHT ));
        fputs($ar,str_pad(substr ("numrecepcionMH", 0, 40),'41', " ", STR_PAD_RIGHT ));
        fputs($ar,str_pad(substr ("Numerocontrolint", 0, 20),'21', " ", STR_PAD_LEFT ));
        fputs($ar,str_pad(substr ("fecha", 0, 10),'11', " ", STR_PAD_RIGHT ));
        fputs($ar,str_pad(substr ("hora", 0, 8),'9', " ", STR_PAD_RIGHT ));
        fputs($ar,str_pad(substr ("cliente", 0, 8),'9', " ", STR_PAD_RIGHT ));
        fputs($ar,str_pad(substr ("nit", 0, 17),'18', " ", STR_PAD_RIGHT ));
        fputs($ar,str_pad(substr ("numDoc", 0, 10),'11', " ", STR_PAD_RIGHT ));
        fputs($ar,str_pad(substr ("ncr", 0, 9),'10', " ", STR_PAD_RIGHT ));
        fputs($ar,str_pad(substr ("dirComplemento", 0, 40),'41', " ", STR_PAD_RIGHT ));
        fputs($ar,str_pad(substr ("Departamento", 0, 2),'3', " ", STR_PAD_RIGHT ));
        fputs($ar,str_pad(substr ("Municipio", 0, 2),'3', " ", STR_PAD_LEFT ));
        fputs($ar,str_pad(substr ("condicionOpera", 0, 2),'3', " ", STR_PAD_LEFT ));
        fputs($ar,str_pad(substr ("codFormaPago", 0, 2),'3', " ", STR_PAD_LEFT ));
        fputs($ar,str_pad(substr ("montoPorFormaPag", 0, 2),'3', " ", STR_PAD_LEFT ));
        fputs($ar,str_pad(substr ("refModalidadPago", 0, 2),'3', " ", STR_PAD_LEFT ));
        fputs($ar,str_pad(substr ("plazo", 0, 2),'3', " ", STR_PAD_LEFT ));
        fputs($ar,str_pad(substr ("periodoPlazo", 0, 2),'3', " ", STR_PAD_LEFT ));
        fputs($ar,str_pad(substr ("numPagoElecNPE", 0, 20),'21', " ", STR_PAD_LEFT ));
        fputs($ar,str_pad(substr ("incoterms", 0, 2),'3', " ", STR_PAD_LEFT ));
        fputs($ar,str_pad('','1', " ", STR_PAD_LEFT ));
        fputs($ar,str_pad(substr ("descincoterms", 0, 20),'21', " ", STR_PAD_RIGHT ));
        fputs($ar,str_pad(substr ("ConsumoInterno", 0, 2),'3', " ", STR_PAD_LEFT ));
        fputs($ar,str_pad(substr ("item", 0, 4),'5', " ", STR_PAD_LEFT ));
        fputs($ar,str_pad(substr ("tipDTRelacionado", 0, 2),'3', " ", STR_PAD_LEFT ));
        fputs($ar,str_pad(substr ("numDocRelacionado", 0, 36),'37', " ", STR_PAD_RIGHT ));
        fputs($ar,str_pad(substr ("fechaGendoc", 0, 10),'11', " ", STR_PAD_RIGHT ));
        fputs($ar,str_pad(substr ("cantidad", 0, 14),'15', " ", STR_PAD_LEFT ));
        fputs($ar,str_pad('','1', " ", STR_PAD_LEFT ));
        fputs($ar,str_pad(substr ("codigo", 0, 20),'21', " ", STR_PAD_RIGHT ));
        fputs($ar,str_pad(substr ("areafact", 0, 3),'4', " ", STR_PAD_RIGHT ));
        fputs($ar,str_pad(substr ("descripcion", 0, 40),'41', " ", STR_PAD_RIGHT ));
        fputs($ar,str_pad(substr ("precioUnitario", 0, 14),'15', " ", STR_PAD_LEFT ));
        fputs($ar,str_pad(substr ("ventasGravadas", 0, 14),'15', " ", STR_PAD_LEFT ));
        fputs($ar,str_pad(substr ("ivaItem", 0, 14),'15', " ", STR_PAD_LEFT ));
        fputs($ar,str_pad(substr ("montoretencion", 0, 14),'15', " ", STR_PAD_LEFT ));
        fputs($ar,str_pad(substr ("codRetencion", 0, 2),'3', " ", STR_PAD_LEFT ));
        fputs($ar,str_pad(substr ("ivaRetenido", 0, 14),'15', " ", STR_PAD_LEFT ));
        fputs($ar,str_pad('','1', " ", STR_PAD_LEFT ));
        fputs($ar,str_pad(substr ("observacionesItem", 0, 100),'101', " ", STR_PAD_RIGHT ));
        fputs($ar,str_pad(substr ("observacionesItems", 0, 100),'101', " ", STR_PAD_RIGHT ));
        fputs($ar,str_pad(substr ("ivaPercibido", 0, 14),'15', " ", STR_PAD_LEFT ));
        fputs($ar,str_pad(substr ("sacos", 0, 4),'4', " ", STR_PAD_LEFT ));
        fputs($ar,str_pad('','1', " ", STR_PAD_LEFT ));
        fputs($ar,str_pad(substr ("fexDestino", 0, 100),'101', " ", STR_PAD_RIGHT ));
        fputs($ar,str_pad(substr ("Contrato", 0, 15),'16', " ", STR_PAD_RIGHT ));
        fputs($ar,str_pad(substr ("fovial", 0, 14),'15', " ", STR_PAD_LEFT ));
        fputs($ar,str_pad(substr ("cotrans", 0, 14),'15', " ", STR_PAD_LEFT ));              
        fputs($ar,str_pad(substr ("promo", 0, 14),'15', " ", STR_PAD_LEFT ));              
        fputs($ar,str_pad(substr ("montoFormaPag", 0, 14),'15', " ", STR_PAD_LEFT ));   
        fputs($ar,str_pad(substr ("cuentaxA", 0, 14),'15', " ", STR_PAD_LEFT ));              
        fputs($ar,str_pad(substr ("cuentaxV", 0, 14),'15', " ", STR_PAD_LEFT ));    
        fputs($ar, "\n");
        fclose($ar);            
        for ( $i = 0; $i<count( $respuesta ); $i++ ) {

            $response = $this->resumen_model->traedetalle( $respuesta[$i]["numeroControl"], $respuesta[$i]["codigoGeneracion"] );
            if($response){
                $total=0;
                for ( $j = 0; $j<count( $response ); $j++ ) {
                    $area='';


                    //$ar = fopen("//192.120.55.195/sys2000/ACCESORIOS/FAUSTO/Facturacion Electronica/Integracion/".$fechatxt.".txt", "a") or
                    $ar = fopen("F:/Integracion/".$fechatxt.".txt", "a") or
                        //  $ar = fopen("C:/Users/LENOVO/Documents".$fechatxt.".txt", "a") or
                        die("Problemas en la creacion");

                    fputs($ar,str_pad(substr ($response[$j]->tipodoc, 0, 2),'2', "0", STR_PAD_LEFT ));
                    fputs($ar,str_pad('','1', " ", STR_PAD_LEFT ));
                    fputs($ar,str_pad(substr ($response[$j]->numeroControl, 0, 31),'32', " ", STR_PAD_RIGHT ));
                    fputs($ar,str_pad(substr ($response[$j]->codigoGeneracion, 0, 36),'37', " ", STR_PAD_RIGHT ));
                    fputs($ar,str_pad(substr ($response[$j]->numrecepcionMH, 0, 40),'41', " ", STR_PAD_RIGHT ));
                    fputs($ar,str_pad(substr ($response[$j]->Numerocontrolint, 0, 20),'21', " ", STR_PAD_LEFT ));
                    fputs($ar,str_pad(substr ($response[$j]->fecha, 0, 10),'11', " ", STR_PAD_RIGHT ));
                    fputs($ar,str_pad(substr ($response[$j]->hora, 0, 8),'9', " ", STR_PAD_RIGHT ));
                    fputs($ar,str_pad(substr ($response[$j]->cliente, 0, 8),'9', " ", STR_PAD_RIGHT ));
                    fputs($ar,str_pad(substr ($response[$j]->nit, 0, 17),'18', " ", STR_PAD_RIGHT ));
                    fputs($ar,str_pad(substr ($response[$j]->numDoc, 0, 10),'11', " ", STR_PAD_RIGHT ));
                    fputs($ar,str_pad(substr ($response[$j]->ncr, 0, 9),'10', " ", STR_PAD_RIGHT ));
                    fputs($ar,str_pad(substr ($response[$j]->dirComplemento, 0, 40),'41', " ", STR_PAD_RIGHT ));
                    fputs($ar,str_pad(substr ($response[$j]->Departamento, 0, 2),'3', " ", STR_PAD_LEFT ));
                    fputs($ar,str_pad(substr ($response[$j]->Municipio, 0, 2),'3', " ", STR_PAD_LEFT ));
                    fputs($ar,str_pad(substr ($response[$j]->condicionOpera, 0, 2),'3', " ", STR_PAD_LEFT ));
                    fputs($ar,str_pad(substr ($response[$j]->codFormaPago, 0, 2),'3', " ", STR_PAD_LEFT ));
                    fputs($ar,str_pad(substr ($response[$j]->montoPorFormaPag, 0, 2),'3', " ", STR_PAD_LEFT ));
                    fputs($ar,str_pad(substr ($response[$j]->refModalidadPago, 0, 2),'3', " ", STR_PAD_LEFT ));
                    fputs($ar,str_pad(substr ($response[$j]->plazo, 0, 2),'3', " ", STR_PAD_LEFT ));
                    fputs($ar,str_pad(substr ($response[$j]->periodoPlazo, 0, 2),'3', " ", STR_PAD_LEFT ));
                    fputs($ar,str_pad(substr ($response[$j]->numPagoElecNPE, 0, 20),'21', " ", STR_PAD_LEFT ));
                    fputs($ar,str_pad(substr ($response[$j]->incoterms, 0, 2),'3', " ", STR_PAD_LEFT ));
                    fputs($ar,str_pad('','1', " ", STR_PAD_LEFT ));
                    fputs($ar,str_pad(substr ($response[$j]->descincoterms, 0, 20),'21', " ", STR_PAD_RIGHT ));
                    fputs($ar,str_pad(substr ($response[$j]->ConsumoInterno, 0, 2),'3', " ", STR_PAD_LEFT ));
                    fputs($ar,str_pad(substr ($response[$j]->item, 0, 4),'5', " ", STR_PAD_LEFT ));
                    fputs($ar,str_pad(substr ($response[$j]->tipDTRelacionado, 0, 2),'3', " ", STR_PAD_LEFT ));
                    fputs($ar,str_pad(substr ($response[$j]->numDocRelacionado, 0, 36),'37', " ", STR_PAD_RIGHT ));
                    fputs($ar,str_pad(substr ($response[$j]->fechaGendoc, 0, 10),'11', " ", STR_PAD_RIGHT ));
                    fputs($ar,str_pad(substr (number_format( $response[$j]->cantidad, 2, '.', '' ), 0, 14),'15', " ", STR_PAD_LEFT ));
                    fputs($ar,str_pad('','1', " ", STR_PAD_LEFT ));
                    fputs($ar,str_pad(substr ($response[$j]->codigo, 0, 20),'21', " ", STR_PAD_RIGHT ));

                    if($response[$j]->codCobol==12){
                        $area= $response[$j]->codClicobol;
                    }else{
                        $area=$response[$j]->codCobol;
                    }

                    fputs($ar,str_pad(substr ($area, 0, 3),'4', " ", STR_PAD_RIGHT ));
                    fputs($ar,str_pad(substr ($response[$j]->descripcion, 0, 40),'41', " ", STR_PAD_RIGHT ));
                    fputs($ar,str_pad(substr (number_format($response[$j]->precioUnitario, 2, '.', '' ), 0, 14),'15', " ", STR_PAD_LEFT ));
                    fputs($ar,str_pad(substr (number_format($response[$j]->ventasGravadas, 2, '.', '' ), 0, 14),'15', " ", STR_PAD_LEFT ));
                    fputs($ar,str_pad(substr (number_format($response[$j]->ivaItem, 2, '.', '' ), 0, 14),'15', " ", STR_PAD_LEFT ));
                    fputs($ar,str_pad(substr (number_format($response[$j]->montoretencion, 2, '.', '' ), 0, 14),'15', " ", STR_PAD_LEFT ));
                    fputs($ar,str_pad(substr ($response[$j]->codRetencion, 0, 2),'3', " ", STR_PAD_LEFT ));
                    fputs($ar,str_pad(substr (number_format($response[$j]->ivaRetenido, 2, '.', '' ), 0, 14),'15', " ", STR_PAD_LEFT ));
                    fputs($ar,str_pad('','1', " ", STR_PAD_LEFT ));
                    fputs($ar,str_pad(substr ($response[$j]->observacionesItem, 0, 100),'101', " ", STR_PAD_RIGHT ));
                    fputs($ar,str_pad(substr ($response[$j]->observacionesItems, 0, 100),'101', " ", STR_PAD_RIGHT ));
                    fputs($ar,str_pad(substr (number_format($response[$j]->ivaPercibido, 2, '.', '' ), 0, 14),'15', " ", STR_PAD_LEFT ));
                    fputs($ar,str_pad(substr ($response[$j]->sacos, 0, 4),'4', " ", STR_PAD_LEFT ));
                    fputs($ar,str_pad('','1', " ", STR_PAD_LEFT ));
                    fputs($ar,str_pad(substr ($response[$j]->fexDestino, 0, 100),'101', " ", STR_PAD_RIGHT ));
                    fputs($ar,str_pad(substr ($response[$j]->Contrato, 0, 15),'16', " ", STR_PAD_RIGHT ));
                    fputs($ar,str_pad(substr (number_format($response[$j]->fovial, 2, '.', '' ), 0, 14),'15', " ", STR_PAD_LEFT ));
                    fputs($ar,str_pad(substr (number_format($response[$j]->cotrans, 2, '.', '' ), 0, 14),'15', " ", STR_PAD_LEFT ));
                    fputs($ar,str_pad(substr ($response[$j]->promo, 0, 14),'15', " ", STR_PAD_LEFT ));
                    fputs($ar,str_pad(substr ($response[$j]->montoPorFormaPag, 0, 14),'15', " ", STR_PAD_LEFT ));
                    fputs($ar,str_pad(substr ($response[$j]->cuentaArea, 0, 14),'15', " ", STR_PAD_LEFT ));
                    fputs($ar,str_pad(substr ($response[$j]->cuentaVende, 0, 14),'15', " ", STR_PAD_LEFT ));


                    fputs($ar, "\n");
                    fclose($ar);
                    $total=$response[$j]->totalAPagar;
                }
            }
        }
    }

    public function leerArchivo(){

        $fechatxt = $this->input->post( "fechatxt" );

        //$fp = fopen("F:/CobolEnvio/".$fechatxt.".txt", "r");
        $fp = fopen("F:/Integracion/pagInteres.txt", "r");
        fseek($fp, 28);
        $data  = array();
        $row = array();

        // $this->integracion_model->BorrarTabla(  );

        while(!feof($fp)){
            $linea = fgets($fp);
            $linea = preg_replace("/[\r\n|\n|\r]+/", " ", $linea);
            // echo $linea."<br>";
            $linea =str_replace("¦",'',utf8_decode($linea));
            $porciones = explode("*", utf8_decode($linea));
            if($porciones[0]!=''){
               // if($porciones[0]=='03'){
                 //   $porciones[7]='10-'.substr ($porciones[7] , 2, 7);//'10-00010';
                //}else{
                  //  $porciones[7]='10-'.substr ($porciones[7] , 2, 7);//'30-00001';
                //}

                $row  = array(
                    'c1'=>$porciones[1],// numero control
                    'c2'=>$porciones[2],//codigo generacion
                    'c3'=>$porciones[3], // recepcion mh
                    'c4'=>$porciones[4], //control cobol
                    'c5'=>$porciones[5], //fecha
                    'c6'=>json_encode($porciones),
                    'c7'=>$porciones[7],
                );
                if ( $this->integracion_model->InArchivo( $row ) ) {
                    $data  = array(
                        'OK' => '1',
                    );

                }
            }




        }
        fclose($fp);

      $this->integracion_model->BorrarTabla2();
       $this->agrupainsertar();

      $this->integracion_model->BorrarTabla();


    }

    public function agrupainsertar(){
        $agrupado=  $this->integracion_model->agrupa();

        $anio = date( "Y" );
        $fecha=date("Y-m-d");
        $hora = date("H:i:s");
        $impuestos =  $this->Cuerpodocumento_model->getImpuestos();

        $iva13 =    $impuestos[2]->valor;
$dataDireccion=array(
         
    'destino'=>'S/N',
    'direccionCli'=>'S/N'

        ); 
		$Reporte='';
        for ( $i = 0; $i<count( $agrupado ); $i++ ) {

            $c4 =json_encode( $agrupado[$i]->c4 );
            $c6 = json_decode($agrupado[$i]->c6 );
            $codigoGeneracion = strtoupper( $this->uuid->v4() );

            $numeroControl = $this->identificacion_model->corelativo( $anio );

            $data = array(
                'numeroControl' => $numeroControl->numeroControl+1,
            );
            $this->identificacion_model->corelativoUpdate( $anio, $data );

            $tipodocSelect = $this->input->post( "tipodocSelect" );
            $item11 = $hora;
            $item10 = $fecha;
           // echo json_encode($c6)." -- ".$i."<br>";
            $txt1 = str_replace(' ', '',$c6[7] );  //$c6[7]
            $codTdoc=str_replace(' ', '', $c6[0]);
            $version="";
            if($codTdoc=='01'){
$Reporte='facCons';
                $version=1;
            }else{
$Reporte='Ccfe';
                $version=3;
            }


            // IDENTIFICACION DOCUMENTO
            $secuencia=str_pad( ( $numeroControl->numeroControl+1 ), 15, "0", STR_PAD_LEFT );

            $numeroControlFin='DTE-'.$codTdoc.'-CMPV0202-'.$secuencia;

            $data  = array(

                'version'=>$version,
                'ambDestino'=>'01',
                'tipoDoc'=>$codTdoc,
                'numeroControl' =>$numeroControlFin  ,
                'codigoGeneracion' => $codigoGeneracion,
                'modFacturacion' => 1,
                'tipTransmicion' => 1,
                'fecha' => $item10,
                'hora' => $item11,
                'tipMoneda' => 'USD'

            );
			
            $data2  = array(
                'fecha' => $item10,
                'idReceptor'=>$txt1,
                'numeroControl' =>$numeroControlFin  ,
                'codigoGeneracion' => $codigoGeneracion,
				'destino'=> json_encode($dataDireccion),
				'reporte'=>$Reporte
            );


            if ( $this->identificacion_model->save( $data ) && $this->identificacion_model->save2( $data2 ) ) {
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


            /**********************************    Ingreso Cuerpodocumento          ***************************************/         
            $iva=0.00;
            $ivaCuerpo=0.00;
            $totalGravada=0.00;
            $data  = array();
            if($codTdoc=='01'|| $codTdoc=='03' ){ 

                $tablaResumen = $this->integracion_model->selectTodo( $c4 );  
                $correlativo=1;
                for ( $j = 0; $j<count( $tablaResumen ); $j++ ) { 
                    $c6 = json_decode($tablaResumen[$j]->c6 );

                    $c6[31]= floatval(ltrim(ltrim($c6[31], ' ') , '0'));
                   // if($codTdoc=='01'){
                    $ivaCuerpo=ltrim(ltrim($c6[33], ' ') , '0');//$this->lrenta->caliva13fc(  $c6[31], 1, $iva13 );
                    //}else{
                      //  $iva= $c6[33];//$this->lrenta->caliva13(  $c6[31], 1, $iva13 );
                    //}
                    $totalGravada+=$c6[31];
                    $data  = array(

                        'numeroControl'=>$numeroControlFin,
                        'codigoGeneracion'=>$codigoGeneracion,
                        'item'=>$correlativo , //$c6[14]
                        'tipoItem'=>3,
                        'tipoDonacion'=>'',
                        'depreciacion'=>'',
                        'numDocRelacionado'=>'',
                        'cantidad'=>1 ,
                        'codigo'=>5140212,
                        'codTributo'=>'',
                        'unidadMedida'=>'59', //hacerel join
                        'descripcion'=>ltrim(ltrim($c6[30], ' ') , '0'),
                        'precioUnitario'=>$c6[31],
                        'valorUnitario'=>'',
                        'descuentos'=>'0.00',
                        'ventasNSujetas'=>'0.00',
                        'ventasExentas'=>'0.00',
                        'ventasGravadas'=>$c6[31],
                        'exportaciones'=>'0.00',
                        'valorDonado'=>'0.00',
                        'ventas'=>$c6[31],
                        'codigoTributo'=>'20',
                        'precSugVenta'=>$c6[31],
                        'CargosAbono'=>'0.00',
                        'ivaItem'=>$ivaCuerpo,
                        'montoretencion'=>'0.00',
                        'areafact'=>'IT'
                    );
                    $correlativo+=1;
                    $iva+=floatval($ivaCuerpo);
                    if ( $this->Cuerpodocumento_model->save( $data ) ) {


                    } else {

                        $data  = array(
                            'OK' => $this->session->set_flashdata( "error", "No se pudo guardar la informacion" ),
                        );
                        echo json_encode( $data );
                    }

                }

            }
            $c6[31]=$totalGravada;
            $this->load->helper('numeros');
            $valorletras = array(
                'leyenda' => num_to_letras($c6[31])
                , 'cantidad' => $c6[31]
            );



            //resumenes
            if($codTdoc=='01' ){          
                $dataResumen  = array(
                    'totalNoSuj'=>'0.00',
                    'totalExenta'=>'0.00',
                    'totalGravada'=>$c6[31],
                    'sumOpSinImpu'=>$c6[31],
                    'subTotal'=>$c6[31],
                    'montoGloDescNS'=>'0.00',
                    'montoGloDescVE'=>'0.00',
                    'montoGloDescVG'=>'0.00',
                    'porcMontoGloDesc'=>'0.00',
                    'totalDescBonRev'=>'0.00',
                    'ivaPercibido'=> '0.00',
                    'ivaRetenido'=> '0.00',
                    'retencionRenta'=>'',
                    'montoTotalOp'=> $c6[31],
                    'totalCargoBasImpon'=>'0.00',
                    'totalAPagar'=> $c6[31],
                    'valorLetras'=>$valorletras['leyenda'],
                    'iva13'=>$iva,
                    'saldoAFavor'=>'0.00',
                    'condicionOpera'=>1,
                    'codFormaPago'=>'01',
                    'montoPorFormaPag'=>$c6[31],
                    'refModalidadPago'=>'',
                    'plazo'=>'01',
                    'periodoPlazo'=>'',
                    'numPagoElecNPE'=>'',
                    'numeroControl'=>$numeroControlFin,
                    'codigoGeneracion'=>$codigoGeneracion,
                    'observaciones'=>''
                );  

            }

            if($codTdoc=='03' ){   
                $dataResumen  = array(
                    'totalNoSuj'=>'0.00',
                    'totalExenta'=>'0.00',
                    'totalGravada'=>$c6[31],
                    'sumOpSinImpu'=>$c6[31],
                    'montoGloDescNS'=>'0.00',
                    'montoGloDescVE'=>'0.00',
                    'montoGloDescVG'=>'0.00',
                    'porcMontoGloDesc'=>'0.00',
                    'totalDescBonRev'=>'0.00',
                    'nombreTributo'=> '[{"codigo":"20","descripcion":"Impuesto al Valor Agregado 13%","valor":'.$iva.'}]',
                    'subTotal'=>$c6[31],
                    'ivaRetenido'=>0.00,
                    'ivaPercibido'=>0.00,
                    'retencionRenta'=>'0.00',
                    'montoTotalOp'=> $c6[31]+$iva,
                    'totalCargoBasImpon'=>'0.00',
                    'totalAPagar'=>  $c6[31]+$iva,
                    'valorLetras'=> $valorletras['leyenda'],
                    'saldoAFavor'=>'0.00',
                    'condicionOpera'=>1,
                    'codFormaPago'=>'01',
                    'montoPorFormaPag'=> $c6[31]+$iva,
                    'refModalidadPago'=>'',
                    'plazo'=>'01',
                    'periodoPlazo'=>'',
                    'numPagoElecNPE'=>'',
                    'iva13'=>$iva,
                    'numeroControl'=>$numeroControlFin,
                    'codigoGeneracion'=>$codigoGeneracion
                );


            }       

            if ( $this->resumen_model->savetho( $dataResumen ,$numeroControlFin,$codigoGeneracion ) ) {

            } 
            else {

                $data  = array(
                    'OK' => $this->session->set_flashdata( "error", "No se pudo guardar la informacion" ),
                );
                echo json_encode( $data );
            }      


            $listaActualizar[$i]= $data  = array(
                'numeroControl' => $numeroControlFin,
                'codigoGeneracion' => $codigoGeneracion,
                'interno' => str_replace('"','',$c4),
                'valor' => $c6[31]<0?$c6[31]:str_pad($c6[31],'4', "0", STR_PAD_LEFT ),
                'recepcionmh' => '',
            );
        } //fin for

        $codigoGeneracion = strtoupper( $this->uuid->v4() );
        $this->guardaIntereses( $listaActualizar,$codigoGeneracion,$fecha);

    }

    public function ingresomasivo(){


        $fecha=date("Y-m-d");


        for($i=0;$i<51;$i++){
            $hora = date("h:i:s");
            $codTdoc='14';

            $codigoGeneracion = strtoupper( $this->uuid->v4() );

            $anio = date( "Y" );
            $numeroControl = $this->identificacion_model->corelativo( $anio );

            $data = array(
                'numeroControl' => $numeroControl->numeroControl+1,
            );
            $this->identificacion_model->corelativoUpdate( $anio, $data );

            // IDENTIFICACION DOCUMENTO
            $secuencia=str_pad( ( $numeroControl->numeroControl+1 ), 41, "0", STR_PAD_LEFT );
            //$numeroControlFin='DTE-'.$codTdoc.'-123456789-'.$secuencia;
            $numeroControlFin='DTE-'.$codTdoc.'-CMPV0202-'.$secuencia;
            $horaactual= date("h:i:s");


            /********* otro documento*******/

            $codTdoc='07';

            $codigoGeneracion2 = strtoupper( $this->uuid->v4() );

            $anio = date( "Y" );
            $numeroControl2 = $this->identificacion_model->corelativo( $anio );

            $data = array(
                'numeroControl' => $numeroControl2->numeroControl+1,
            );
            $this->identificacion_model->corelativoUpdate( $anio, $data );

            // IDENTIFICACION DOCUMENTO
            $secuencia2=str_pad( ( $numeroControl2->numeroControl+1 ), 41, "0", STR_PAD_LEFT );
            //$numeroControlFin='DTE-'.$codTdoc.'-123456789-'.$secuencia;
            $numeroControlFin2='DTE-'.$codTdoc.'-CMPV0202-'.$secuencia2;
            $horaactual= date("h:i:s");


            $data  = array(
                'OK' => $numeroControlFin,
            );
            echo json_encode( $data );

            echo json_encode($this->integracion_model->ingresocuerpo( $numeroControlFin, $codigoGeneracion ,$numeroControlFin2,$codigoGeneracion2));
            echo json_encode($this->integracion_model->ingresoresumen( $numeroControlFin, $codigoGeneracion ,$numeroControlFin2,$codigoGeneracion2));
            echo json_encode($this->integracion_model->ingresoidentificador( $numeroControlFin, $codigoGeneracion,$numeroControlFin2,$codigoGeneracion2,$fecha, $hora));
            echo json_encode($this->integracion_model->ingresoreceptordoc( $numeroControlFin, $codigoGeneracion ,$numeroControlFin2,$codigoGeneracion2,$fecha));
            // falta docurelacionado    


            sleep(1);
        }
    }

    public function buscarDteAnular(){
        $codigoGeneracion = $this->input->post( "user" );
        $respuesta=$this->integracion_model->MbuscarDteAnular($codigoGeneracion);

        if($respuesta){
            $array = [];
            $array[] =  ['0' => 'Tipo DTE', '1' =>$respuesta[0]->tipodoc];
            $array[] =  ['0' => 'Num Control', '1' =>$respuesta[0]->numeroControl];
            $array[] =  ['0' => 'Cod Generacion', '1' =>$respuesta[0]->codigoGeneracion];
            $array[] =  ['0' => 'Sello Recepcion', '1' =>$respuesta[0]->numrecepcionMH];
            $array[] =  ['0' => 'Fecha ', '1' =>$respuesta[0]->fecha];
            $array[] =  ['0' => 'Hora', '1' =>$respuesta[0]->hora];
            $array[] =  ['0' => 'NIT', '1' =>$respuesta[0]->nit];
            $array[] =  ['0' => 'Doc Identidad', '1' =>$respuesta[0]->numDoc];
            $array[] =  ['0' => 'Cod.Identidad', '1' =>$respuesta[0]->tipDoc];
            $array[] =  ['0' => 'Correo', '1' =>$respuesta[0]->correoReceptor];
            $array[] =  ['0' => 'Telefono', '1' =>$respuesta[0]->telReceptor];
            $array[] =  ['0' => 'Iva total', '1' =>$respuesta[0]->iva13];
            $array[] =  ['0' => 'Nombre Cliente', '1' =>$respuesta[0]->NomDenominacion];
        }else{ $array[] =  ['0' => '', '1' =>''];}

        echo json_encode($array);
    }

    public function enviarDteAnular(){
        $codigoGeneracion = $this->input->post( "user" );
        $cat024 = $this->input->post( "cat024" );
        $motivoAnulacion = $this->input->post( "motivoAnulacion" );
        $nombreSolicita = $this->input->post( "nombreSolicita" );
        $tipDocSolicita = $this->input->post( "tipDocSolicita" );
        $numDocSolicita = $this->input->post( "numDocSolicita" );
        $codigoGeneracionR = $this->input->post( "codigoGeneracionR" );

        $respuesta=$this->integracion_model->MbuscarDteAnular($codigoGeneracion);

        $fecha=date("Y-m-d");
        $hora = date("H:i:s");
        $codigoGeneracion = strtoupper( $this->uuid->v4() );

        $identificacion= array(
            'version' => 2,
            'ambiente' => $this->session->userdata('ambiente'),
            'codigoGeneracion' => $codigoGeneracion,
            'fecAnula' => $fecha,
            'horAnula' => $hora,
        );

        $emisor=$this->emisor_model->getEmisor($this->session->userdata( "codestab" ));
        $emi=array(
            'nit'=>str_replace("-","",$emisor[0]->nit),
            'nombre'=>$emisor[0]->nomComercial,
            'tipoEstablecimiento'=>$emisor[0]->tipEstablecimiento,
            'nomEstablecimiento'=>$emisor[0]->nombre,
            'codEstableMH'=>$emisor[0]->codEstableMH,
            'codEstable'=>$emisor[0]->codEstable,
            'codPuntoVentaMH'=>$emisor[0]->codPuntoVentaMH,
            'codPuntoVenta'=>$emisor[0]->codPuntoVenta,
            'telefono'=>$emisor[0]->telefono,
            'correo'=>$emisor[0]->correo
        );

        $respuesta[0]->codigoGeneracionR = $codigoGeneracionR;

        //    if($respuesta[0]->tipodoc==1){
        //  $respuesta[0]->tipDoc='13';
        //}else{
        //  $respuesta[0]->numDoc=$respuesta[0]->nit;
        //}


        $motivo= array(
            'tipoAnulacion'=>intval($cat024),
            'motivoAnulacion'=>$motivoAnulacion,
            'nombreResponsable'=>$emi['nomEstablecimiento'],
            'tipDocResponsable'=>"36",
            'numDocResponsable'=>$emi['nit'],
            'nombreSolicita'=>$nombreSolicita,
            'tipDocSolicita'=>$tipDocSolicita,
            'numDocSolicita'=>$numDocSolicita
        );
        if($respuesta[0]->tipDoc=="36"){
            $respuesta[0]->numDoc=$respuesta[0]->nit;
        }
        $documento=array(
            'tipoDte'=> str_pad($respuesta[0]->tipodoc,'2', "0", STR_PAD_LEFT ),
            'codigoGeneracion'=>$respuesta[0]->codigoGeneracion,
            'selloRecibido'=>$respuesta[0]->numrecepcionMH,
            'numeroControl'=>$respuesta[0]->numeroControl,
            'fecEmi'=>$respuesta[0]->fecha,
            'montoIva'=>floatval($respuesta[0]->iva13),
            'codigoGeneracionR'=>$respuesta[0]->codigoGeneracionR==''? null:$respuesta[0]->codigoGeneracionR,
            'tipoDocumento'=>$respuesta[0]->tipDoc,
            'numDocumento' =>$respuesta[0]->numDoc,
            'nombre'=>$respuesta[0]->NomDenominacion,
            'telefono'=>$respuesta[0]->telReceptor,
            'correo'=>$respuesta[0]->correoReceptor
        );
        $anulacionTotal=array(
            'emisor'=>$emi,
            'identificacion'=>$identificacion,
            'documento'=>$documento,
            'motivo'=>$motivo
        );

        $guardar=array(
            'archivo'=>json_encode($anulacionTotal),
            'codGeneracion'=>$codigoGeneracion,
            'fecha'=>$fecha,
            'respuestaMH'=>'hh',
        );
        $dataAnula = array(
            'estado' => 4,
        );
        //cambiar de estado a 4 Anulado para que no aparezca en conta.
        if ( $this->integracion_model->GuardarAnulacion( $anulacionTotal,$codigoGeneracion,$fecha ) ) {
          //  $rAnulaEstado = $this->json_model->modificarEstadoDte($respuesta[0]->numeroControl, $respuesta[0]->codigoGeneracion, $dataAnula);

            $dataJson  = array(
                'ok' => '1',
                'EstadoAnulado' => '',
                'jsonAnu' => $anulacionTotal
            );
            echo json_encode($dataJson);

        }else{
            $dataJson  = array(
                'error' => '1'
            );
            echo json_encode($dataJson);
        }


    }

    public function guardarJsonFirma(){
        $jsonDte=$this->input->post( "jsonDte" );
        $jsonDtef=$this->input->post( "jsonDtef" );
        $numeroControl = $this->input->post( "numeroControl" );
        $codigoGeneracion = $this->input->post( "codigoGeneracion" );

        $jsondos = array(
            'Nofirmado' =>$jsonDte,
            'firmado' =>'',//$jsonDtef,
        );

        $jsonFin = array(
            'estado' =>json_encode($jsondos),
        );
        $respuesta= $this->integracion_model->guardarJsonFirma($numeroControl,$codigoGeneracion,$jsonFin);
        //$num,$cod,$jsondte
        echo json_encode($jsonDte);

    }

    public function creaContingencia(){

        $fInicio = $this->input->post( "fInicio" );
        $fFin = $this->input->post( "fFin" );
        $hInicio = $this->input->post( "hInicio" );
        $hFin = $this->input->post( "hFin" );
        $tipoContingencia = $this->input->post( "tipoContingencia" );
        $motivoContingencia = $this->input->post( "motivoContingencia" );
        $nombreRes = $this->input->post( "nombreRes" );
        $tipoRes = $this->input->post( "tipoRes" );
        $Numdoc = $this->input->post( "Numdoc" );

        $x=0;
        $respuesta=$this->integracion_model->creaContingencia();

        $fecha=date("Y-m-d");
        $hora = date("H:i:s");
        $codigoGeneracion = strtoupper( $this->uuid->v4() );

        $identificacion= array(
            'version' => 3,
            'ambiente' => $this->session->userdata('ambiente'),
            'codigoGeneracion' => $codigoGeneracion,
            'fTransmision' => $fecha,
            'hTransmision' => $hora,
        );
        $emisor=$this->emisor_model->getEmisor();
        $emi=array(
            'nit'=>str_replace("-","",$emisor[0]->nit),
            'nombre'=>$emisor[0]->nomComercial,
            'nombreResponsable'=>$nombreRes,
            'tipoDocResponsable'=>$tipoRes,
            'numeroDocResponsable'=>str_replace("-","",$Numdoc),
            'tipoEstablecimiento'=>$emisor[0]->tipEstablecimiento,
            'telefono'=>$emisor[0]->telefono,
            'correo'=>$emisor[0]->correo
        ); 

        $motivo=array(
            'fInicio'=>$fInicio,
            'fFin'=>$fFin,
            'hInicio'=>$hInicio.':00',
            'hFin'=>$hFin.':00',
            'tipoContingencia'=>intval($tipoContingencia),
            'motivoContingencia'=>$motivoContingencia           
        );

        $detalleDTE= [];
        $detalleDTEtabla= [];


        for ( $i = 0; $i<count( $respuesta ); $i++ ) {

            $detalleDTE[$i]['noItem']=$x+=1;
            $detalleDTE[$i]['codigoGeneracion']=$respuesta[$i]->codigoGeneracion;
            $detalleDTE[$i]['tipoDoc']=str_pad($respuesta[$i]->tipoDoc,'2', "0", STR_PAD_LEFT );
        }
        $x=0;
        for ( $i = 0; $i<count( $respuesta ); $i++ ) {

            $detalleDTEtabla[$i]['noItem']=$x+=1;
            $detalleDTEtabla[$i]['codigoGeneracion']=$respuesta[$i]->codigoGeneracion;
            $detalleDTEtabla[$i]['numeroControl']=$respuesta[$i]->numeroControl;
            $detalleDTEtabla[$i]['tipoDoc']=$respuesta[$i]->tipoDoc;
            $detalleDTEtabla[$i]['fecha']=$respuesta[$i]->fecha;
            $detalleDTEtabla[$i]['hora']=$respuesta[$i]->hora;
        }


        $contingenciaJson=array(
            'identificacion'=>$identificacion,
            'emisor'=>$emi,
            'detalleDTE'=>$detalleDTE,
            'motivo'=>$motivo,

        ); 



        $jsonFin=array(

            'documento'=>$detalleDTE,
            'motivo'=>$motivo
        );



        $contingenciaJson=array(
            'jsonAnu'=>$contingenciaJson,
            'ok'=>1,            
            'tabla'=>$detalleDTEtabla,
            'codigoGeneracion' => $codigoGeneracion,
            'JsonGruardar'=>$jsonFin

        );

        if(empty($respuesta)){
            $contingenciaJson=array(
                'jsonAnu'=>$contingenciaJson,
                'ok'=>'No hay Documentos para Enviar',            
                'tabla'=>$detalleDTEtabla,
                'codigoGeneracion' => $codigoGeneracion,
                'JsonGruardar'=>$jsonFin

            );
        }
        echo json_encode($contingenciaJson);

    }

    public function guardaContingencia(){
        $DteJson = $this->input->post( "DteJson" );
        $codigoGeneracion = $this->input->post( "codigoGeneracion" );
        $fecha=date("Y-m-d");

        $respuesta= $this->integracion_model->guardarcontingencia($codigoGeneracion,$fecha,$DteJson);
        if ($respuesta){
            $contingenciaJson=array(
                'ok'=>1,            
                'tabla'=>''                
            );

            echo json_encode($contingenciaJson);
        } else {

            $data  = array(
                'ok' => $this->session->set_flashdata( "error", "No se pudo guardar la informacion" ),
            );
            echo json_encode( $data );
        }


    }

    public function crealoteConti(){
        //$DteJson = $this->input->post( "DteJson" );
        $codigoGeneracion =$this->input->post("codigoGeneracion" );


        $respuesta=$this->integracion_model->crealoteConti($codigoGeneracion);
        //   echo json_encode($respuesta);
        $listas= json_decode($respuesta[0]->archivo,true);
        $detalleDTE= [];

        foreach ($listas as $lista) {

            $var1=$lista['codigoGeneracion'];
            $var2=$lista['numeroControl'];

            $receptor = $this->receptor_model->getreceptor($var2 ,$var1);
            $parte=json_decode($receptor[0]->estado);
            $json_string =json_encode($parte->firmado);
            $detalleDTE[]=$json_string;


        }
        $codigoGeneracion = strtoupper( $this->uuid->v4() );
        $jsonFin=array(

            'codgeneracion'=>$codigoGeneracion,
            'lote'=>$detalleDTE
        );



        echo json_encode($jsonFin);
    }

    public function guardaIntereses($ListaInteres,$codigoGeneracion,$fecha){
        if ( $this->integracion_model->GuardaIntereses( $ListaInteres,$codigoGeneracion,$fecha) ) {
            $data  = array(
                'ok' => $ListaInteres,
                'codigoGeneracion' => $codigoGeneracion
            );
        }
        echo json_encode( $data );

    }

    public function guardaenvioCobol($Listacobol,$codigoGeneracion,$fecha){
        if ( $this->integracion_model->guardaenvioCobol( $Listacobol,$codigoGeneracion,$fecha) ) {
            $data  = array(
                'ok' => $Listacobol,
                'codigoGeneracion' => $codigoGeneracion
            );
        }
        // echo json_encode( $data );

    }

    public function ReporteCobol(){
        $fini = $this->input->post( "fini" );
        $ffin = $this->input->post( "ffin" );


        $respuesta=$this->integracion_model->consultaEnviCobol($fini,$ffin);



        echo json_encode($respuesta);

    }

    public function partidaContable(){

        $respuesta=$this->integracion_model->partidaContable();

        $fechatxt='PartidaContable';
        $arch = fopen("F:/Integracion/".$fechatxt.".txt", "w+");
        fwrite($arch, "");
        fclose($arch);

        echo json_encode($respuesta);

        for ( $j = 0; $j<count($respuesta )  ; $j++ ) { 
            $ar = fopen("F:/Integracion/".$fechatxt.".txt", "a") or   die("Problemas en la creacion");

            fputs($ar,str_pad(substr ($respuesta[$j]->numControlFact, 0, 31),'32', " ", STR_PAD_RIGHT ));
            fputs($ar,str_pad(substr ($respuesta[$j]->codigoGeneracion, 0,36),'37', " ", STR_PAD_RIGHT ));
            fputs($ar,str_pad(substr ($respuesta[$j]->cuentaContable, 0, 4),'5', " ", STR_PAD_RIGHT ));
            fputs($ar,str_pad(substr ($respuesta[$j]->debeHaber, 0, 1),'1', " ", STR_PAD_RIGHT ));
            fputs($ar,str_pad(substr (number_format($respuesta[$j]->monto, 2, '.', '' ), 0, 14),'15', " ", STR_PAD_LEFT ));
            fputs($ar,str_pad('','1', " ", STR_PAD_LEFT ));
            fputs($ar,str_pad(substr ($respuesta[$j]->descripcion, 0, 125),'125', " ", STR_PAD_RIGHT ));

            fputs($ar, "\n");
            fclose($ar);  
            $this->integracion_model->partidaContableActualiza($respuesta[$j]->numControlFact,$respuesta[$j]->codigoGeneracion);

        }

    }

    public function verificacionInteres(){
        $codigoGeneracion =$this->input->post( "codigoGeneracion" );

        $respuesta=$this->integracion_model->verificacionInteres($codigoGeneracion);
        $fechatxt='InteresRetorno';
        $lista=json_decode($respuesta[0]->archivo);
        $arch = fopen("F:/Integracion/".$fechatxt.".txt", "w+");
        fwrite($arch, "");
        fclose($arch);

        for ( $j = 0; $j<count($lista )  ; $j++ ) { 
            $ar = fopen("F:/Integracion/".$fechatxt.".txt", "a") or   die("Problemas en la creacion");

            $lista[$j]->numeroControl; //echo " -- ";
            $lista[$j]->codigoGeneracion; //echo " -- <br>";
            $campo= $this->integracion_model->traesello($lista[$j]->codigoGeneracion);
            if(empty($campo)){
                // $lista[$j]->recepcionmh='RECHAZADO '+ $campo[0]->observaciones;
            }else{
                $lista[$j]->recepcionmh=$campo[0]->selloRecibido;
                if($campo[0]->selloRecibido==''){
                    $lista[$j]->recepcionmh='RECHAZADO '.$campo[0]->observaciones;
                }
            }

            fputs($ar,str_pad(substr ($lista[$j]->numeroControl, 0, 31),'32', " ", STR_PAD_RIGHT ));
            fputs($ar,str_pad(substr ($lista[$j]->codigoGeneracion, 0,36),'37', " ", STR_PAD_RIGHT ));
            fputs($ar,str_pad(substr ($lista[$j]->interno, 0, 14),'15', " ", STR_PAD_RIGHT ));
            fputs($ar,str_pad(substr ($lista[$j]->recepcionmh, 0, 45),'46', " ", STR_PAD_RIGHT ));
            fputs($ar, "\n");
            fclose($ar);  

            // echo json_encode($campo);
        }
        echo json_encode( $lista );







    }

    public function actualizarCatalogos(){

        $fechatxt = $this->input->post( "fechatxt" );

        //$fp = fopen("F:/CobolEnvio/".$fechatxt.".txt", "r");
        $fp = fopen("F:/Integracion/pagInteres.txt", "r");
        fseek($fp, 28);
        $data  = array();
        $row = array();


        // $this->integracion_model->BorrarTabla(  );

        while(!feof($fp)){
            $linea = fgets($fp);
            $linea = preg_replace("/[\r\n|\n|\r]+/", " ", $linea);
            // echo $linea."<br>";
            $porciones = explode("*", utf8_decode($linea));

            /* $row  = array(
                'c1'=>$porciones[1],
                'c2'=>$porciones[2],
                'c3'=>$porciones[3],
                'c4'=>'DTE'.$porciones[4],
                'c5'=>$porciones[5],
                'c6'=>json_encode($porciones),
                'c7'=>$porciones[0],
            );*/
            //  array_push($data,$row);
            //   $rows = array();
            //InArchivo
            echo json_encode( $porciones ); echo "<br>";

            /* if ( $this->integracion_model->InArchivo( $row ) ) {
                $data  = array(
                    'OK' => '1',
                );

            }*/

        }
        fclose($fp);

        $this->integracion_model->BorrarTabla2();





    }

    public function DesAnulacion(){
        $fini = $this->input->post( "fini" );
        $ffin = $this->input->post( "ffin" );
        $txt = $this->input->post( "txt" );

        $anulaciones=  $this->integracion_model->DescargaAnulacion($fini,$ffin);

        if($txt=='N'){
            $anulacione = [];
            for( $i=0;$i<count($anulaciones);$i++){
                $listas= json_decode($anulaciones[$i]->archivo,true);

                $motivo=$listas['motivo'];
                $identificacion=$listas['identificacion'];
                $documento=$listas['documento'];

                $anulacione[$i]['codGeneracion'] =$identificacion['codigoGeneracion'];
                $anulacione[$i]['codigoGeneracion'] =$documento['codigoGeneracion'];
                $anulacione[$i]['motivoAnulacion'] =$motivo['motivoAnulacion'];
                $anulacione[$i]['nombreSolicita'] =$motivo['nombreSolicita'];
                $anulacione[$i]['selloRecibido'] =$documento['selloRecibido'];
                $anulacione[$i]['numeroControl'] =$documento['numeroControl'];
                $anulacione[$i]['fecEmi'] =$documento['fecEmi'];
                $anulacione[$i]['codigoGeneracionR'] =$documento['codigoGeneracionR']==''? 'No posee':$documento['codigoGeneracionR'];
                $anulacione[$i]['fecha'] =$anulaciones[$i]->fecha;


            }

            echo json_encode($anulacione );
        }else{

            $arch = fopen("F:/Integracion/Anulaciones.txt", "w+");
            fwrite($arch, "");
            fclose($arch);

            $ar = fopen("F:/Integracion/Anulaciones.txt", "a") or   
                fputs($ar,str_pad(substr ("numeroControl", 0, 31),'32', " ", STR_PAD_RIGHT ));
            fputs($ar,str_pad(substr ("numeroControl", 0, 31),'32', " ", STR_PAD_RIGHT ));
            fputs($ar,str_pad(substr ("codigoGeneracion", 0, 36),'37', " ", STR_PAD_RIGHT ));
            fputs($ar,str_pad(substr ("codigoAnulacion", 0, 36),'37', " ", STR_PAD_RIGHT ));
            fputs($ar,str_pad(substr ("fecha", 0, 10),'11', " ", STR_PAD_RIGHT ));
            fputs($ar, "\n");
            fclose($ar);    


            for( $i=0;$i<count($anulaciones);$i++){

                $listas= json_decode($anulaciones[$i]->archivo,true);

                $motivo=$listas['motivo'];
                $identificacion=$listas['identificacion'];
                $documento=$listas['documento'];


                $ar = fopen("F:/Integracion/Anulaciones.txt", "a") or
                    //  $ar = fopen("C:/Users/LENOVO/Documents".$fechatxt.".txt", "a") or
                    die("Problemas en la creacion");
                fputs($ar,str_pad(substr ($documento['numeroControl'], 0, 31),'32', " ", STR_PAD_RIGHT ));
                fputs($ar,str_pad(substr ($documento['codigoGeneracion'], 0, 36),'37', " ", STR_PAD_RIGHT ));
                fputs($ar,str_pad(substr ($identificacion['codigoGeneracion'], 0, 36),'37', " ", STR_PAD_RIGHT ));
                fputs($ar,str_pad(substr ($anulaciones[$i]->fecha, 0, 10),'11', " ", STR_PAD_RIGHT ));
                fputs($ar, "\n");
                fclose($ar);


            }

        }

    }

    public function ConsultasGenerales(){
        $fini = $this->input->post( "fini" );
        $ffin = $this->input->post( "ffin" );
        $txt = "";
        $area = $this->input->post( "area" );
        $id=1;
        if($area!='TO'){
            $txt = " and c.areafact ='".$area."' ";
        }

        $codestab=$this->session->userdata("codestab");
        
        $DTEs=  $this->integracion_model->ConsultasGenerales($fini,$ffin,$area,$txt,$id,$codestab);
        echo json_encode($DTEs);

    }

    public function ConsultasXusuarios(){
        $fini = $this->input->post( "fini" );
        $ffin = $this->input->post( "ffin" );
        $txt = "";
        $area = $this->input->post( "area" );
        $tipdte = $this->input->post( "tipdte" );
        $id="'";
        $text='';

        for($i=0; $i<count($tipdte);$i++){

            $text=$text.','.$id.$tipdte[$i].$id.'';

        }


        $DTEs=  $this->integracion_model->ConsultasXusuarios($fini,$ffin,$area,substr($text, 1),$id);
        echo json_encode($DTEs);

    }

    public function Reimpresion(){
        $fini = $this->input->post( "fini" );
        $ffin = $this->input->post( "ffin" );
        $estado=1;
        $respuesta = $this->integracion_model->consultaReimpresion( $estado,$fini,$ffin );
        echo json_encode($respuesta);


    }

    public function CargaUnoUno(){
        
        $TipDteER = $this->input->post( "TipDteER" );
        $fechaEvento = $this->input->post( "fechaEvento" );
      
        $respuesta = $this->integracion_model->CargaUnoUno( $TipDteER,$fechaEvento );
        echo json_encode($respuesta);
        
        
    }
    
    public function CargaRenvio(){
        
        $TipDteRen = $this->input->post( "TipDteRen" );
        $fechaenvio = $this->input->post( "fechaenvio" );
        $codestab=$this->session->userdata("codestab");

        $respuesta = $this->integracion_model->CargaRenvio( $TipDteRen,$fechaenvio,$codestab );
        echo json_encode($respuesta);
    }
    public function TraeReimp(){
        
        $TipDteRen = $this->input->post( "TipDteReImp" );
        $fechaenvio = $this->input->post( "fechaReimpresiones" );

        $respuesta = $this->integracion_model->TraeReimp( $TipDteRen,$fechaenvio );
        
        
        
        
        echo json_encode($respuesta);
    }
    
    
}
