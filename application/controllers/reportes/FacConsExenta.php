<?php

use Mpdf\HTMLParserMode;
defined( 'BASEPATH' ) OR exit( 'No direct script access allowed' );
require FCPATH.'vendor/autoload.php';
class facConsExenta extends CI_Controller {

    public function __construct(){
        parent::__construct();
        if (!$this->session->userdata("login")) {
            redirect(base_url());
        }
        $this->load->model( "mhdte/cuerpodocumento_model" );
        $this->load->model( "mhdte/emisor_model" );
        $this->load->model( "mhdte/receptor_model" );
         $this->load->library('Encabezados');
    }

    public function index() {

    }

    function cliente($receptor){
    //$emisor[0]->desactEco
    if( $receptor[0]->tipDoc==36){
        $txtDoc="NIT";
        $docVisto=$receptor[0]->nit;
    }else if ($receptor[0]->tipDoc==13){
        $txtDoc="DUI";
        $docVisto=$receptor[0]->numDoc;
    }else{
        $txtDoc="OTRO";
        $docVisto=$receptor[0]->numDoc;

    }
 
    $cliente=' <hr> <div class="row">
                    <div class="col-md-12">
                    
                        <div class="col-xs-7 col-sm-7 col-md-7 text-left">
                            <div class="receipt-right">
                               <p><small>Nombre : '.$receptor[0]->codigo.' - '.$receptor[0]->NomDenominacion.'</small></p>
                        <p><small>Doc: '.$txtDoc .' N°: '. $docVisto.'</small> <small>    NCR:'.$receptor[0]->ncr.'</small></p>
                                      
                    <p><small>Giro: '.$receptor[0]->actEco.'</small></p>
                            </div>
                        </div>
                        
                         <div class="col-xs-4 col-sm-4 col-md-4  text-left">
                            <div class="receipt-right">
                       
                      
                       <p><small>'."Teléfono: ".$receptor[0]->telReceptor .'</small></p>
                       <p><small>'. "Email: ". $receptor[0]->correoReceptor .'</small></p>
                       <p><small>'.  "Direccion: ".$receptor[0]->dirComplemento.'</small></p>
                            </div>
                        </div>       
                     </div>
                </div>  
                <div><hr>';
     return $cliente;           

}

    function detalleTabla( $respuesta, $impuestos ){


    $iva13 =    $impuestos[2]->valor;
    $ivaResumen = 0.00;
    $totalGravado = 0.00; 
    $ivaRetenido = 0.0;
    $fovialRet = 0.0;
    $cotransRet = 0.0;


    $detalleTablaFilas='';

    $detalleTablaenca='<div class="row">
                    <div class="col-md-12"><table class="table table-bordered text-center table-responsive" style="100%">
                        <thead class="text-center">
                            <tr>
                                <th>Item</th>
                                <th>Cant</th>
                                <th>Descripción</th>
                                <th>Precio</th>
                                <th>Promo</th>
                                <th class="text-right">Subtotal</th>
                            </tr>
                        </thead>
                        <tbody>';
                        for ( $i = 0; $i<count( $respuesta ); $i++ ) {
                            $detalleTablaFilas.='<tr>
                                <td >'.$respuesta[$i]->item.'</td>
                                <td >'.$respuesta[$i]->cantidad.'</td>
                                <td >'.$respuesta[$i]->codigo.' '.$respuesta[$i]->descripcion.''.$respuesta[$i]->observacionesItem.'</td>
                                <td >'.$respuesta[$i]->precioUnitario.'</td>
                                <td >'.$respuesta[$i]->promo.'</td>
                                <td class="text-right"><label class="fa fa-inr">$ </label> '.$respuesta[$i]->ventasExentas.'</td>
                            </tr>';
                            $ivaResumen += $respuesta[$i]->ivaItem;
                            $ivaRetenido+= $respuesta[$i]->ivaRetenido;
                            $totalGravado += $respuesta[$i]->ventasExentas;
                        }
                            $detalleTablasubtotales='<tr>
                                <td colspan="4"></td>
                                <td class="text-right">
                                    <p>
                                        <strong>SUBTOTAL: </strong>
                                    </p>
                                    <p>
                                        <strong>IVA 13%: </strong>
                                    </p>
                                   
                                    
                                </td>
                                <td class="text-right">
                                    <p>
                                        $ '.$totalGravado.'
                                    </p>
                                    <p>
                                        $ '.$ivaResumen.'
                                    </p>                                    
                                   
                                </td>
                            </tr>';
    
     $totalAPagar = bcdiv( ( $totalGravado-$ivaRetenido+$respuesta[0]->ivaPercibido), '1', 2 );
      $this->load->helper('numeros');
        $valorletras = array(
            'leyenda' => num_to_letras($totalAPagar)
            , 'cantidad' => $totalAPagar
        );
                            $detalleTablaTotal='<tr>
                            <td colspan="4"> <p><strong>'. $valorletras['leyenda'].'</strong></p></td>
                                <td class="text-right">
                                    <p><strong>Total: </strong></p>
                                </td>
                                <td class="text-right text-danger">
                                    <p>$  '.$totalAPagar.'</p>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                     </div>
                    </div>
                </div>
               
            </div>
        </div>';

        return $detalleTablaenca.$detalleTablaFilas.$detalleTablasubtotales.$detalleTablaTotal;

}

      public function facConsExenta() {

        $this->load->library( 'pdf/pdfCI' );
    sleep(2);
        //$numeroControl='DTE-01-CMPV0202-000000000005468';
        //$codigoGeneracion='26DE2ACD-8559-4449-AC7C-70554CFBD23C';
        $numeroControl = $this->input->post( "numeroControl" );
        $codigoGeneracion = $this->input->post( "codigoGeneracion" );
        $escorreo = $this->input->post( "area" );

        $respuesta = $this->cuerpodocumento_model->getParaResumen2( $numeroControl, $codigoGeneracion );
        $emisor = $this->emisor_model->getEmisor();
        $receptor = $this->receptor_model->getreceptor($numeroControl ,$codigoGeneracion);
        $impuestos =  $this->cuerpodocumento_model->getImpuestos();
        $respuestaMH= $this->receptor_model->getMH($numeroControl ,$codigoGeneracion);
        $iva13 =    $impuestos[2]->valor;
        $ivaResumen = 0.00;
        $totalGravado = 0.00; 
        $ivaRetenido = 0.0;
        $fovialRet = 0.0;
        $cotransRet = 0.0;

// insertar el reporte utilizado
        $jsonFin = array(
            'reporte' =>"facConsExenta",
        );
        
        $this->receptor_model->updateReporte($numeroControl,$codigoGeneracion,$jsonFin);
       
          
         $jsonCodigos = array(
            'numero' =>$numeroControl,
            'codigo' => $codigoGeneracion,
            'fecha'=>$fecha= date('Y-d-m'),
            'dte'=>'FACTURA CONSUMIDOR EXENTA'
        );  
          
          $css=$this->encabezados->css();
        
        $encabezado= $this->encabezados->encabezado($jsonCodigos,$emisor, $respuestaMH);
        $cliente=$this->cliente($receptor);
        $detaTabla=$this-> detalleTabla( $respuesta, $impuestos );
        $datos['encabezado']=$encabezado;
        $datos['cliente']=$cliente;
        $datos['tabla']= $detaTabla;
        $html = $this->load->view('reportes/receipt_pdf',$datos,true);
        $final=$this->encabezados->final( );
          
            $mpdf = new \Mpdf\Mpdf([
            'mode' => 'utf-8','format' => 'LETTER-P',
            'margin_top'=>1,
            'margin_right'=>1,
            'margin_left'=>1,
            'margin_bottom'=>1,
        ]);
        $css2=file_get_contents(base_url().'assets/template/bootstrap/dist/css/bootstrapreport.min.css');
        $mpdf->WriteHTML($css);
        $mpdf->WriteHTML($css2,\Mpdf\HTMLParserMode::HEADER_CSS);
       
       
        $mpdf->WriteHTML($html);
        $mpdf->WriteHTML($final);
        $pdf64=$mpdf->Output('', 'S');
        $mpdf->Output();
          
          
        $parte=json_decode($receptor[0]->estado);
		$envio= array(
                    'dtejson' => $parte->Nofirmado,
                    'sellorecepcion' => $respuestaMH,
                );
        $json_string =json_encode($envio);
       

        # Nombre del archivo PDF #
        sleep(2);
        //$this->load->library('email');
         $this->load->library('phpmailer_lib');
        
       if($escorreo==''){
            // PHPMailer object
        $mail = $this->phpmailer_lib->load();
            
        // Add a recipient
        $mail->addAddress($receptor[0]->correoReceptor);
        $mail->AddStringAttachment($pdf64, substr($codigoGeneracion, -16).'.pdf', 'base64', 'application/pdf');// attachment
        $mail->AddStringAttachment($json_string , substr($codigoGeneracion, -16).'.json', 'base64', 'application/json');// attachment

     
        
        // Email subject
        $mail->Subject = 'Cuzcachapa de R.L';
        
        // Set email format to HTML
        $mail->isHTML(true);
        
        // Email body content
        $mailContent = "<h1>Mensaje enviado con su Documento Tributario Electrónico</h1>
            <p>No responda a este mensaje, solamente es de caracter informativo</p><br>
            <h1>Message sent with your Electronic Tax Document</h1>
            <p>Do not reply to this message, it is for informational purposes only</p>
            
            
            ";
        $mail->Body = $mailContent;
        
        // Send email
        if(!$mail->send()){
            echo 'Message could not be sent.';
            echo 'Mailer Error: ' . $mail->ErrorInfo;
        }else{
            $mpdf->Output();
      
        }
           
       }else{
        $mpdf->Output();
       } 
      
        
        
    }

    
    public function facConsExentaOri() {

        $this->load->library( 'pdf/pdfCI' );
    sleep(2);
        //$numeroControl='DTE-01-CMPV0202-000000000005468';
        //$codigoGeneracion='26DE2ACD-8559-4449-AC7C-70554CFBD23C';
        $numeroControl = $this->input->post( "numeroControl" );
        $codigoGeneracion = $this->input->post( "codigoGeneracion" );
        $escorreo = $this->input->post( "area" );

        $respuesta = $this->cuerpodocumento_model->getParaResumen2( $numeroControl, $codigoGeneracion );
        $emisor = $this->emisor_model->getEmisor();
        $receptor = $this->receptor_model->getreceptor($numeroControl ,$codigoGeneracion);
        $impuestos =  $this->cuerpodocumento_model->getImpuestos();
        $respuestaMH= $this->receptor_model->getMH($numeroControl ,$codigoGeneracion);
        $iva13 =    $impuestos[2]->valor;
        $ivaResumen = 0.00;
        $totalGravado = 0.00; 
        $ivaRetenido = 0.0;
        $fovialRet = 0.0;
        $cotransRet = 0.0;

// insertar el reporte utilizado
        $jsonFin = array(
            'reporte' =>"facCons",
        );
        
        $this->receptor_model->updateReporte($numeroControl,$codigoGeneracion,$jsonFin);
        // $pdf = new PDF_Code128( 'P', 'mm', array( 140, 210 ) );
        $pdf = new PDF_Code128( 'P', 'mm', 'letter' );
        $pdf->SetMargins( 15, 15, 15 );
        $pdf->AddPage();

        $nameFile=$codigoGeneracion;
        # Logo de la empresa formato png #
        //$pdf->Image( './img/logo.png', 165, 12, 35, 35, 'PNG' );
        $fecha= date('Y-d-m',strtotime($respuestaMH[0]->fhProcesamiento));
        $pdf->Image( index_page()."?code=https://webapp.dtes.mh.gob.sv/consultaPublica?ambiente=01&codGen=".$codigoGeneracion."&fechaEmi=".$fecha, 170, 17.5, 27, 27, "png" );
        $pdf->Image( base_url()."/assets/build/images/cuzlogo.png", 20, 8, 14, 14, "png" );

        # Encabezado y datos de la empresa #
        $pdf->SetFont( 'Arial', 'B', 8 );
        $pdf->SetTextColor( 32, 100, 210 );

        $pdf->Cell( 25 );
        $pdf->Cell( 59, 2, utf8_decode( strtoupper( $emisor[0]->nombre ) ), 0, 0, 'L' );
        $pdf->SetFont( 'Arial', 'B', 6 );
		$pdf->SetFillColor( 255,255,255 );
        $pdf->Cell( 97,4, utf8_decode( strtoupper( "DOCUMENTO TRIBUTARIO ELECTRÓNICO - FACTURA EXENTA" ) ), 1, 0, 'C' );
        $pdf->SetTextColor( 39, 39, 51);
        $pdf->Ln( 4 );$pdf->Cell( 10);
        $pdf->Cell( 63, 9, utf8_decode( "NIT: ".$emisor[0]->nit ), 0, 0, 'L' );
        $pdf->Cell( 11 );
        $pdf->Cell( 97, 9, utf8_decode( "Cód. Generación: ".$codigoGeneracion ), 'LR', 0, 'L' );
        $pdf->Ln( 3 );
        $pdf->Cell( 10 );
        $pdf->Cell( 63, 9, utf8_decode( "NCR: ".$emisor[0]->ncr ), 0, 0, 'L' );
        $pdf->Cell( 11 );
        $pdf->Cell( 97, 9, utf8_decode( "Núm. Control: ".$numeroControl ), 'LR', 0, 'L' );
        $pdf->Ln( 3 );
        $pdf->Cell( 10 );
        $pdf->Cell( 63, 9, utf8_decode( "Actividad económica: ".$emisor[0]->desactEco ), 0, 0, 'L' );
        $pdf->Cell( 11 );
        $pdf->Cell( 97, 9, utf8_decode( "Sello de Recepción:".$respuestaMH[0]->selloRecibido ), 'LR', 0, 'L' );
        $pdf->Ln( 3 );
        $pdf->Cell( 10 );$pdf->SetFont( 'Arial', 'B', 5.5 );
        $pdf->Cell( 63, 9, utf8_decode( "Dirección: ".$emisor[0]->Direccion ), 0, 0, 'L' );
        $pdf->Cell( 11 );$pdf->SetFont( 'Arial', 'B', 6 );
        $pdf->Cell( 97, 9, utf8_decode( "Módelo de Facturación: Mod. facturación Previo" ), 'LR', 0, 'L' );
        $pdf->Ln( 3 );
        $pdf->Cell( 10 );
        $pdf->Cell( 63, 9, utf8_decode( "Teléfono: ".$emisor[0]->telefono ), 0, 0, 'L' );
        $pdf->Cell( 11 );
        $pdf->Cell( 97, 9, utf8_decode( "Tipo de Transmisión: Normal" ), 'LR', 0, 'L' );
        $pdf->Ln( 3 );
        $pdf->Cell( 10 );
        $pdf->Cell( 63, 9, utf8_decode( "Email: ".$emisor[0]->correo ), 0, 0, 'L' );
        $pdf->Cell( 11 );
        $pdf->Cell( 97, 9, utf8_decode( "Fecha y Hora de Generación:".$respuestaMH[0]->fhProcesamiento ), 'LRB', 0, 'L' );
        $pdf->Ln( 3 );
        $pdf->Cell( 10 );
        $pdf->Cell( 63, 9, utf8_decode( "Establecimiento: Casa Matriz" ), 0, 0, 'L' );

        $pdf->Cell( 11 );
        $pdf->Cell( 97 );
        $pdf->SetFont( 'Arial', 'B', 5.5 );
        $pdf->Ln( 3 );
        $pdf->Cell( 10 );
        $pdf->Cell( 63, 9, utf8_decode( "Nombre Comercial: ".$emisor[0]->nomComercial ), 0, 0, 'L' );
        $pdf->Cell( 11 );
        $pdf->Cell( 97, 9, utf8_decode( '' ), 0, 0, 'L' );
        $pdf->Cell( 15 );

        $pdf->SetFont( 'Arial', '', 8 );
        $pdf->SetTextColor( 39, 39, 51 );
        $pdf->Cell( 10 );
        $pdf->Cell( 150, 2, utf8_decode( "" ), 0, 0, 'L' );

        // espacio de identificacion cliente
        $pdf->Ln( 10 );

        $pdf->SetFont( 'Arial', '', 8 );
        $pdf->SetTextColor( 39, 39, 51 );
        $pdf->Cell( 13, 7, utf8_decode( "Cliente:" ), 'LRT', 0 );
        $pdf->SetTextColor( 97, 97, 97 );
        if (strlen( $receptor[0]->NomDenominacion  )>30){
            $pdf->SetFont( 'Arial', '', 7 );
        }
        $pdf->Cell( 60, 7, utf8_decode( $receptor[0]->NomDenominacion  ), 'LRT', 0, 'L' );
        $pdf->SetFont( 'Arial', '', 8 );
        $pdf->SetTextColor( 39, 39, 51 );
        if( $receptor[0]->tipDoc==36){
            $txtDoc="NIT";
            $docVisto=$receptor[0]->nit;
        }else if ($receptor[0]->tipDoc==13){
            $txtDoc="DUI";
            $docVisto=$receptor[0]->numDoc;
        }else{
            $txtDoc="OTRO";
            $docVisto=$receptor[0]->numDoc;

        }
        $pdf->Cell( 28, 7, utf8_decode( "Tipo Doc: ".$txtDoc ), 'LRT', 0, 'L' );
        $pdf->SetTextColor( 97, 97, 97 );
        $pdf->Cell( 40, 7, utf8_decode( "N°: ". $docVisto ), 'LRT', 0, 'L' );
        $pdf->SetTextColor( 39, 39, 51 );
        $pdf->Cell( 7, 7, utf8_decode( "Tel:" ), 'LRT', 0, 'L' );
        $pdf->SetTextColor( 97, 97, 97 );
        $pdf->Cell( 33, 7, utf8_decode( $receptor[0]->telReceptor ), 'LRT', 0 );
        $pdf->SetTextColor( 39, 39, 51 );

        $pdf->Ln( 7 );

        $pdf->SetTextColor( 39, 39, 51 );
        $pdf->Cell( 13, 7, utf8_decode( "email:" ), 'LRTB', 0 );
        $pdf->SetTextColor( 97, 97, 97 );
        $pdf->Cell( 60, 7, utf8_decode( $receptor[0]->correoReceptor ), 'LRTB', 0 );
        $pdf->Cell( 108, 7, utf8_decode( "Direccion: ".$receptor[0]->dirComplemento ), 'LRTB', 0 );


        $pdf->Ln( 7 );

        # Tabla de productos #
        $pdf->SetFont( 'Arial', '', 8 );
        $pdf->SetFillColor( 23, 83, 201 );
        $pdf->SetDrawColor( 23, 83, 201 );
        $pdf->SetTextColor( 255, 255, 255 );
        $pdf->Cell( 7, 8, utf8_decode( "item" ), 1, 0, 'C', true );
        $pdf->Cell( 12, 8, utf8_decode( "Cant." ), 1, 0, 'C', true );
        $pdf->Cell( 86, 8, utf8_decode( "Descripción" ), 1, 0, 'C', true );
        $pdf->Cell( 25, 8, utf8_decode( "Precio" ), 1, 0, 'C', true );
        $pdf->Cell( 19, 8, utf8_decode( "Promo." ), 1, 0, 'C', true );
        $pdf->Cell( 32, 8, utf8_decode( "Subtotal" ), 1, 0, 'C', true );

        $pdf->Ln( 8 );

        $pdf->SetTextColor( 39, 39, 51 );
        $pdf->SetFont( 'Arial', '', 7 );
        /*----------  Detalles de la tabla  ----------*/
        for ( $i = 0; $i<count( $respuesta ); $i++ ) {
            $pdf->Cell( 7, 6, $respuesta[$i]->item, 'L', 0, 'C' );
            $pdf->Cell( 12, 6, $respuesta[$i]->cantidad, 'L', 0, 'C' );
            $pdf->Cell( 86, 6, utf8_decode( $respuesta[$i]->codigo." ".$respuesta[$i]->descripcion )." ".utf8_decode($respuesta[$i]->observacionesItem), 'L', 0, 'C' );
            $pdf->Cell( 25, 6, utf8_decode( $respuesta[$i]->precioUnitario ), 'L', 0, 'C' );
            $pdf->Cell( 19, 6, utf8_decode( $respuesta[$i]->promo ), 'L', 0, 'C' );
            $pdf->Cell( 32, 6, utf8_decode( $respuesta[$i]->ventasExentas ), 'LR', 0, 'C' );
            $pdf->Ln( 6 );
            $ivaResumen += $respuesta[$i]->ivaItem;
            $ivaRetenido+= $respuesta[$i]->ivaRetenido;
            $totalGravado += $respuesta[$i]->ventasExentas;
        }
        /*----------  Fin Detalles de la tabla  ----------*/

        $pdf->SetFont( 'Arial', 'B', 7 );

        # Impuestos & totales #
        $pdf->Cell( 100, 7, utf8_decode( '' ), 'T', 0, 'C' );
        $pdf->Cell( 25, 7, utf8_decode( '' ), 'T', 0, 'C' );
        $pdf->Cell( 22, 7, utf8_decode( "SUBTOTAL" ), 'T', 0, 'C' );
        $pdf->Cell( 34, 7, utf8_decode( "$ ".$totalGravado ), 'T', 0, 'C' );

        $pdf->Ln( 5 );



         $pdf->Cell( 100, 7, utf8_decode( '' ), '', 0, 'C' );
        $pdf->Cell( 25, 7, utf8_decode( '' ), '', 0, 'C' );
        $pdf->Cell( 22, 7, utf8_decode( "+/- Iva 1%" ), 'T', 0, 'C' );
        $pdf->Cell( 34, 7, utf8_decode( $ivaRetenido ), 'T', 0, 'C' );
        $pdf->Ln( 5 );
        $pdf->Cell( 100, 7, utf8_decode( '' ), '', 0, 'C' );
        $pdf->Cell( 25, 7, utf8_decode( '' ), '', 0, 'C' );
        $pdf->Cell( 22, 7, utf8_decode( "TOTAL A PAGAR" ), 'T', 0, 'C' );
        $pdf->Cell( 34, 7, utf8_decode( "$ ".$totalGravado -$ivaRetenido+$respuesta[0]->ivaPercibido), 'T', 0, 'C' );
         $pdf->Ln( 5 );
         $this->load->helper('numeros');
        $valorletras = array(
            'leyenda' => num_to_letras($totalGravado -$ivaRetenido+$respuesta[0]->ivaPercibido)
            , 'cantidad' => $totalGravado -$ivaRetenido+$respuesta[0]->ivaPercibido
        );
        $pdf->Cell( 80, 7, utf8_decode( '' ), '', 0, 'C' );
        $pdf->Cell( 120, 7, utf8_decode( $valorletras['leyenda'] ), '', 0, 'C' );

        $parte=json_decode($receptor[0]->estado);
		$envio= array(
                    'dtejson' => $parte->Nofirmado,
                    'sellorecepcion' => $respuestaMH,
                );
        $json_string =json_encode($envio);
        $file = './assets/pdf_tmp/'.substr($codigoGeneracion, -8).'.json';
        file_put_contents($file, $json_string);
       

  $pdf->Output('./assets/pdf_tmp/'.substr($codigoGeneracion, -8).'.pdf',"F");  

        # Codigo de barras #
        //$pdf->SetFillColor( 39, 39, 51 );
        //$pdf->SetDrawColor( 23, 83, 201 );
        //$pdf->Code128( 72, $pdf->GetY(), "COD000001V0001", 70, 20 );
        //$pdf->SetXY( 12, $pdf->GetY()+21 );
        //$pdf->SetFont( 'Arial', '', 12 );
        //$pdf->MultiCell( 0, 5, utf8_decode( "COD000001V0001" ), 0, 'C', false );

        # Nombre del archivo PDF #
     sleep(2);
        //$this->load->library('email');
         $this->load->library('phpmailer_lib');
        
       if($escorreo==''){
            // PHPMailer object
        $mail = $this->phpmailer_lib->load();
            
        // Add a recipient
        $mail->addAddress($receptor[0]->correoReceptor);
        
        $mail ->addAttachment('./assets/pdf_tmp/'.substr($codigoGeneracion, -8).'.pdf');
        $mail ->addAttachment('./assets/pdf_tmp/'.substr($codigoGeneracion, -8).'.json');
        // Add cc or bcc 
       // $mail->addCC('cc@example.com');
        //$mail->addBCC('bcc@example.com');
        
        // Email subject
        $mail->Subject = 'Cuzcachapa de R.L';
        
        // Set email format to HTML
        $mail->isHTML(true);
        
        // Email body content
        $mailContent = "<h1>Mensaje enviado con su Documento Tributario Electrónico</h1>
            <p>No responda a este mensaje, solamente es de caracter informativo</p><br>
            <h1>Message sent with your Electronic Tax Document</h1>
            <p>Do not reply to this message, it is for informational purposes only</p>
            
            
            ";
        $mail->Body = $mailContent;
        
        // Send email
        if(!$mail->send()){
            echo 'Message could not be sent.';
            echo 'Mailer Error: ' . $mail->ErrorInfo;
        }else{
        $pdf->Output( "I", substr($codigoGeneracion, -8).".pdf", true );
      
        }
           
       }else{
           $pdf->Output( "I", substr($codigoGeneracion, -8).".pdf", true ); 
       } 
        
        
    }


}

