<?php
defined( 'BASEPATH' ) OR exit( 'No direct script access allowed' );

class RepEvCobolGenTodos extends CI_Controller {

    public function __construct(){
        parent::__construct();
        if (!$this->session->userdata("login")) {
            redirect(base_url());
        }
        $this->load->model( "mhdte/cuerpodocumento_model" );
        $this->load->model( "mhdte/emisor_model" );
        $this->load->model( "mhdte/receptor_model" );
        $this->load->model( "mhdte/integracion_model" );
    }

    public function index() {



    }

    public function RepEvCobolGenTodos() {
        $this->load->library('pdf/pdf_html');

	
 sleep(2);

        //$codigoGeneracion = $this->input->post( "codigoGeneracion" );
        $fechini = $this->input->post( "fini" );
        $fechfin = $this->input->post( "ffin" );
       
        $area = $this->input->post( "area" );
        $id=1;
        $txt ="";
        
           
        $respuesta=$this->integracion_model->ConsultasGeneralesTodos($fechini,$fechfin,$area,$txt,$id);

         $fecha=date("Y-m-d");
        // $pdf = new PDF_Code128( 'P', 'mm', array( 140, 210 ) );
        $pdf=new PDF_HTML();
        $pdf->SetMargins( 15, 11, 15 );
		$pdf->AddPage('L','letter',0);
        $nameFile="DTE-Enviados";
        # Logo de la empresa formato png #
        //$pdf->Image( './img/logo.png', 165, 12, 35, 35, 'PNG' );
        $fecha= date('Y-m-d');$hora = date("h:i:s");

        $pdf->Image( base_url()."/assets/build/images/cuzlogo.png", 20, 8, 14, 14, "png" );

        # Encabezado y datos de la empresa #
        $pdf->SetFont( 'Arial', 'B', 8 );
        $pdf->SetTextColor( 32, 100, 210 );

        $pdf->Cell( 35 );
        $pdf->Cell( 175, 2, utf8_decode( strtoupper( $this->session->userdata("NomDemo") ) ), 0, 0, 'C' );


        $pdf->Ln( 4 );
        $pdf->Cell( 35 );
        $pdf->Cell( 175, 2, utf8_decode( strtoupper( "REPORTE DTE RECEPCIONADOS, NO ENVIADO, ANULADOS De: ".date('d/m/Y', strtotime($fechini) )." Hasta: ".date('d/m/Y', strtotime($fechfin) ) ) ), 0, 0, 'C' );
        $pdf->SetFont( 'Arial', 'B', 6 );
        $pdf->Ln( 4 );
        $pdf->Cell( 35 );
        $pdf->Cell( 175, 2, utf8_decode( strtoupper( "Fecha de descarga: ".date('d/m/Y', strtotime($fecha) )." ".$hora)), 0, 0, 'C' );
        $pdf->SetFont( 'Arial', 'B', 6 );

        $pdf->Ln( 4 );

        # Tabla de productos #
        $pdf->SetFont( 'Arial', '', 8 );
        $pdf->SetFillColor( 23, 83, 201 );
        $pdf->SetDrawColor( 23, 83, 201 );
        $pdf->SetTextColor( 255, 255, 255 );
        // $pdf->Cell( 7, 8, utf8_decode( "item" ), 1, 0, 'C', true );
        $pdf->Cell( 32, 8, utf8_decode( "fecha" ), 1, 0, 'L', true );
        $pdf->Cell( 46, 8, utf8_decode( "DTE" ), 1, 0, 'C', true );
        $pdf->Cell( 53, 8, utf8_decode( "Codigo Generacion" ), 1, 0, 'C', true );
        $pdf->Cell( 55, 8, utf8_decode( "Nombre Cliente" ), 1, 0, 'C', true );
        $pdf->Cell( 5, 8, utf8_decode( "I" ), 1, 0, 'C', true );
        $pdf->Cell( 5, 8, utf8_decode( "A" ), 1, 0, 'C', true );
        
        $pdf->Cell( 10, 8, utf8_decode( "T.Pago" ), 1, 0, 'C', true );
        $pdf->Cell( 10, 8, utf8_decode( "IVA" ), 1, 0, 'C', true );
        $pdf->Cell( 12, 8, utf8_decode( "Per/Ret" ), 1, 0, 'C', true );
        //  $pdf->Cell( 10, 8, utf8_decode( "ivaRetenido" ), 1, 0, 'C', true );
        $pdf->Cell( 15, 8, utf8_decode( "Gravada" ), 1, 0, 'C', true );
        $pdf->Cell( 18, 8, utf8_decode( "Valor $" ), 1, 0, 'C', true );


        $pdf->Ln( 8 );

        $pdf->SetTextColor( 39, 39, 51 );
        $pdf->SetFont( 'Arial', '', 6.8 );
        /*----------  Detalles de la tabla  ----------*/



        $totalGravado=0;      


        for ( $i = 0; $i<count( $respuesta ); $i++ ) {

           

              //  echo json_encode($repExtras);echo "<br>";
                $listasOrder[]=$data  = array(
                    'numeroControl' => $respuesta[$i]->numeroControl,
                    'codigoGeneracion' => $respuesta[$i]->codigoGeneracion,
                    'NomDenominacion' => $respuesta[$i]->nombre,
                    'item' =>  $respuesta[$i]->item,
                    'areafact' => $respuesta[$i]->areafact ,
                    'fecha' => $respuesta[$i]->fecha,
                    'hora' =>'' ,
                    'valor' =>$respuesta[$i]->montoPorFormaPag==null?$respuesta[$i]->montoretencion:$respuesta[$i]->montoTotalOp,
                    'tpago' => '' ,  
				    'condicionOpera' =>  $respuesta[$i]->tipo_pago ,
                    'iva13' => $respuesta[$i]->ivaItem ,
                    'ivaPercibido' => $respuesta[$i]->ivaPercibido ,
                    'ivaRetenido' => $respuesta[$i]->ivaRetenido ,
                    'totalGravada' =>$respuesta[$i]->ventasGravadas ,
                    'estado' =>$respuesta[$i]->estado ,
                    'montoretencion' =>$respuesta[$i]->montoretencion ,
                    'codRetencion' =>$respuesta[$i]->codRetencion ,
                    
                );
            

        }


      
        
        $totalEfectivo=$totalCredito=$IvaR=$IvaP=$IVA=0;
        $formaPag='';
        $estado='Recepcionado';
        $contador=0;
          $i=0;
        $segunda=0;
        foreach ($listasOrder as $lista) {

          
            if($lista['condicionOpera']=='Cont'){
                $formaPag='Cont';
                $totalEfectivo+=$lista['valor'];
            }elseif(   $lista['condicionOpera']=='Cred'){
                $totalCredito+=$lista['valor'];
                $formaPag='Cred';
            }else{
				 $totalCredito+=$lista['valor'];
                $formaPag='Otro';
			}
				
            if($lista['estado']==0){
                $estado='No enviado';
                             $lista['iva13'] ="0.00";
$lista['ivaPercibido']="0.00";
$lista['ivaRetenido']="0.00";
$lista['totalGravada']="0.00";
$lista['valor']="0.00";
$lista['montoretencion']="0.00";
                
               }elseif($lista['estado']==4){
                $estado='Invalidado';
                             $lista['iva13'] ="0.00";
$lista['ivaPercibido']="0.00";
$lista['ivaRetenido']="0.00";
$lista['totalGravada']="0.00";
$lista['valor']="0.00";
$lista['montoretencion']="0.00";
                
               }else{$estado='Recepcionado';};
            $pdf->Cell( 32, 5.5, utf8_decode($lista['fecha'].' - '.$estado ), 'L', 0, 'L' );
            $pdf->Cell( 46, 5.5, $lista['numeroControl'], 'L', 0, 'C' );
            $pdf->Cell( 53, 5.5, utf8_decode( $lista['codigoGeneracion']), 'L', 0, 'L' );
            $pdf->Cell( 55, 5.5, utf8_decode( substr ($lista['NomDenominacion'], 0, 35) ), 'L', 0, 'L' );
            $pdf->Cell( 5, 5.5, utf8_decode($lista['item'] ), 'L', 0, 'C' );
            $pdf->Cell( 5, 5.5, utf8_decode($lista['areafact'] ), 'L', 0, 'C' );
            
            $pdf->Cell( 10, 5.5, utf8_decode($formaPag ), 'L', 0, 'C' );
            $pdf->Cell( 10, 5.5, utf8_decode($lista['iva13'] ), 'L', 0, 'C' );
            $IVA+=$lista['iva13'];
            if($lista['ivaPercibido']>0){
                $pdf->Cell( 12, 5.5, utf8_decode($lista['ivaPercibido'] ), 'L', 0, 'C' );
                $IvaP+= $lista['ivaPercibido'];
            }else if ($lista['ivaRetenido']>0) {
                $pdf->Cell( 12, 5.5, utf8_decode("/".$lista['ivaRetenido'] ), 'L', 0, 'C' );
                $IvaR+=$lista['ivaRetenido'];
            }else{
                $pdf->Cell( 12, 5.5, utf8_decode("0.00" ), 'L', 0, 'C' );

            }
            
            if($lista['codRetencion']=="22"){
                $pdf->Cell( 15, 5.5, utf8_decode($lista['totalGravada'] ), 'L', 0, 'C' );
            $pdf->Cell( 18, 5.5, utf8_decode($lista['montoretencion']), 'RL', 0, 'R' );
                  $totalGravado += $lista['montoretencion'];
            }else{
                  $pdf->Cell( 15, 5.5, utf8_decode($lista['totalGravada'] ), 'L', 0, 'C' );
            $pdf->Cell( 18, 5.5, utf8_decode($lista['valor']), 'RL', 0, 'R' );
                  $totalGravado += $lista['valor'];
            }
          
   
            

          

                
                        
            $pdf->Ln( 4 );
                     
            if ( $i == ($contador +38+$segunda)  ) {
                $contador=$i;
                $pdf->Ln( 1.5 );
        $pdf->Cell( 261, 5.5, '', 'T', 0, 'C' );
                 
                $pdf->AddPage();
                $pdf->SetFont( 'Arial', '', 8 );
        $pdf->SetFillColor( 23, 83, 201 );
        $pdf->SetDrawColor( 23, 83, 201 );
        $pdf->SetTextColor( 255, 255, 255 );
              
       $pdf->Cell( 32, 8, utf8_decode( "fecha" ), 1, 0, 'L', true );
        $pdf->Cell( 46, 8, utf8_decode( "DTE" ), 1, 0, 'C', true );
        $pdf->Cell( 53, 8, utf8_decode( "Codigo Generacion" ), 1, 0, 'C', true );
        $pdf->Cell( 55, 8, utf8_decode( "Nombre Cliente" ), 1, 0, 'C', true );
        $pdf->Cell( 5, 8, utf8_decode( "I" ), 1, 0, 'C', true );
        $pdf->Cell( 5, 8, utf8_decode( "A" ), 1, 0, 'C', true );
        
        $pdf->Cell( 10, 8, utf8_decode( "T.Pago" ), 1, 0, 'C', true );
        $pdf->Cell( 10, 8, utf8_decode( "IVA" ), 1, 0, 'C', true );
        $pdf->Cell( 12, 8, utf8_decode( "Per/Ret" ), 1, 0, 'C', true );
        //  $pdf->Cell( 10, 8, utf8_decode( "ivaRetenido" ), 1, 0, 'C', true );
        $pdf->Cell( 15, 8, utf8_decode( "Gravada" ), 1, 0, 'C', true );
        $pdf->Cell( 18, 8, utf8_decode( "Valor $" ), 1, 0, 'C', true );

        $pdf->Ln( 8 );

        $pdf->SetTextColor( 39, 39, 51 );
        $pdf->SetFont( 'Arial', '', 6.8 );
                
                $segunda=4;
                
            }
$i++;
        }
        /*----------  Fin Detalles de la tabla  ----------*/
        $pdf->Ln( 1.5 );
        $pdf->SetFont( 'Arial', 'B', 7 );
$pdf->Cell( 261, 5.5, utf8_decode( "" ), 'T', 0, 'C' );
        # Impuestos & totales #
 $pdf->Ln( 5 );
        $pdf->Cell( 65, 5.5, utf8_decode( "" ), 'T', 0, 'C' );

        $pdf->Cell( 65, 5.5, utf8_decode( "" ), 'T', 0, 'R' );
        $pdf->Cell( 80, 5.5, utf8_decode( "TOTAL ENVIADO" ), 'T', 0, 'R' );
        $pdf->Cell( 29, 5.5, number_format( $totalGravado, 2, '.', ','), 'T', 0, 'R' );

        $pdf->Ln( 4 );

        $pdf->SetFont( 'Arial', 'B', 7 );

        # Impuestos & totales #
        //
        //$IvaP
        //$IvaR
        $pdf->Cell( 35, 5.5, utf8_decode( "Total Iva retenido:" ), 'T', 0, 'C' );
        $pdf->Cell( 22, 5.5, number_format( $IvaR , 2, '.', ','), 'T', 0, 'L' ); 
        $pdf->Cell( 35, 5.5, utf8_decode( "Total Iva Percibido:" ), 'T', 0, 'C' );
        $pdf->Cell( 22, 5.5, number_format( $IvaP, 2, '.', ',' ), 'T', 0, 'L' );
        $pdf->Cell( 35, 5.5, utf8_decode( "Total IVA:" ), 'T', 0, 'C' );

        $pdf->Cell( 22, 5.5, number_format( $IVA, 2, '.', ',' ), 'T', 0, 'L' );
        $pdf->Cell( 39, 5.5, utf8_decode( "TOTAL EFECTIVO" ), 'T', 0, 'R' );
        $pdf->Cell( 29, 5.5, number_format( $totalEfectivo, 2, '.', ','), 'T', 0, 'R' );

        $pdf->Ln( 4 );
        $pdf->SetFont( 'Arial', 'B', 7 );

        # Impuestos & totales #

        $pdf->Cell( 65, 5.5, utf8_decode( "" ), 'T', 0, 'C' );

        $pdf->Cell( 65, 5.5, utf8_decode( "" ), 'T', 0, 'R' );
        $pdf->Cell( 80, 5.5, utf8_decode( "TOTAL CREDITO" ), 'T', 0, 'R' );
        $pdf->Cell( 29, 5.5, number_format( $totalCredito, 2, '.', ','), 'T', 0, 'R' );

        $pdf->Ln( 4 );



        $pdf->Output( "I", substr($nameFile, -8).".pdf", true );



    }


}