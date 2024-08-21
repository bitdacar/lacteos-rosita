<?php
use Mpdf\HTMLParserMode;
defined( 'BASEPATH' ) OR exit( 'No direct script access allowed' );
require FCPATH.'vendor/autoload.php';
class facCons extends CI_Controller {

    public function __construct(){
        parent::__construct();
        if (!$this->session->userdata("login")) {
            redirect(base_url());
        }
        $this->load->model( "mhdte/Cuerpodocumento_model" );
        $this->load->model( "mhdte/Emisor_model" );
        $this->load->model( "mhdte/Receptor_model" );
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
                     
                        <div class="col-xs-5 col-sm-5 col-md-5 text-left">
                            <div class="receipt-right">
                               <p><small>Nombre : '.$receptor[0]->codigo.' - '.$receptor[0]->NomDenominacion.'</small></p>
                        <p><small>Tipo Doc: '.$txtDoc .'</small></p>
                       <p><small>N°: '. $docVisto .'</small></p>
                    
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
                                <td class="text-right"><label class="fa fa-inr">$ </label> '.$respuesta[$i]->subtotal.'</td>
                            </tr>';
                            $ivaResumen += $respuesta[$i]->ivaItem;
                            $ivaRetenido+= $respuesta[$i]->ivaRetenido;
                            $totalGravado += $respuesta[$i]->subtotal;
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


    function facCons(){

        sleep(2);
        //$numeroControl='DTE-01-CMPV0202-000000000060002';
        //$codigoGeneracion='BB158454-450B-48F4-9988-AC77EAC6C7BA';
        $numeroControl = $this->input->post( "numeroControl" );
        $codigoGeneracion = $this->input->post( "codigoGeneracion" );
       $escorreo = $this->input->post( "area" );

        $respuesta = $this->Cuerpodocumento_model->getParaResumen2( $numeroControl, $codigoGeneracion );
        $emisor = $this->Emisor_model->getEmisor($this->session->userdata( "codestab" ));
        $receptor = $this->Receptor_model->getreceptor($numeroControl ,$codigoGeneracion);
        $impuestos =  $this->Cuerpodocumento_model->getImpuestos();
       $respuestaMH= $this->Receptor_model->getMH($numeroControl ,$codigoGeneracion);
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
        $jsonCodigos = array(
            'numero' =>$numeroControl,
            'codigo' => $codigoGeneracion,
            'fecha'=>$fecha= date('Y-d-m'),
            'dte'=>'FACTURA CONSUMIDOR FINAL'
        );
     
        
        $this->Receptor_model->updateReporte($numeroControl,$codigoGeneracion,$jsonFin);


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
        $css2=file_get_contents(base_url().'assets/template/bootstrap/dist/css/bootstrapReport.min.css');
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

}