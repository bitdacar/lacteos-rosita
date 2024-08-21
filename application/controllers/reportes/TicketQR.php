<?php
defined( 'BASEPATH' ) OR exit( 'No direct script access allowed' );
require FCPATH.'vendor/autoload.php';
class TicketQR extends CI_Controller {

    public function __construct(){
        parent::__construct();
        if (!$this->session->userdata("login")) {
            redirect(base_url());
        }
        $this->load->model( "mhdte/Cuerpodocumento_model" );
        $this->load->model( "mhdte/Emisor_model" );
        $this->load->model( "mhdte/Receptor_model" );
        $this->load->model( "mhdte/Identificacion_model" );
        $this->load->model( "mhdte/Integracion_model" );
        $this->load->library( 'Lrenta' );

    }

    public function index() {

    }
public function pruebaTi(){


//Path y nombre del archivo
$files         = '/home/david/Documentos/PDF_Lacteos/archivo.pdf';

//nombre de la impresora en el sistema operativo
$printer       = 'TIKECTI';

//numero de copias
$copias        = (!isset($cop)) ? 1 : $cop;

// Comando para imprimir el archivo PDF en la impresora especificada
$print_command = "lp -d $printer -n $copias $files -o notify 2>&1";
exec($print_command, $output, $return_var);

}

    public function TicketQR() {

        $this->load->library('pdf/Pdf_html');


        //$pdf = new PDF_Code128( $orientation='P',$unit='mm', array(50,105) );
        $pdf=new PDF_HTML( $orientation='P',$unit='mm', array(50,200) );
        $pdf->SetMargins( 1, 1, 1,);
        $pdf->AddPage();



        //$numeroControl='DTE-01-PRRO0202-000000000020032';
       // $codigoGeneracion='315BA899-E2F8-4D85-9EDB-0B1B78D90D83';
       $numeroControl = $this->input->post( "numeroControl" );
       $codigoGeneracion = $this->input->post( "codigoGeneracion" );
       $efectivo = $this->input->post( "efectivo" );
        $emisor = $this->Emisor_model->getEmisor($this->session->userdata( "codestab" ));
        $respuesta = $this->Cuerpodocumento_model->getParaResumen( $numeroControl, $codigoGeneracion );
        $impuestos =  $this->Cuerpodocumento_model->getImpuestos();
        $iva13 =    $impuestos[2]->valor;
        $horaparqueo =    0.00;

        $fecha= date('d-m-Y');
        $hora= date('h:m:s');
        $horaSalida = date( "H:i:s" );
       
        $pdf->SetFont( 'Arial', '', 6 );
      

        $pdf->Image( index_page()."?code=https://admin.factura.gob.sv/consultaPublica?ambiente=".$this->session->userdata('ambiente')."&codGen=".$codigoGeneracion."&fechaEmi=".$fecha, 12, 0, 26, 26, "png" );
        # Impuestos & totales #

        $pdf->Ln( 25);
        $pdf->Cell( 45, 3, utf8_decode( $emisor[0]->nombre ), '', 0, 'C' );

        
        $pdf->Ln( 3);
        $pdf->MultiCell( 50, 3, utf8_decode( trim($emisor[0]->Direccion , '"' ) ),0, 1, 0 );
        //$pdf->MultiCell( 45, 3, utf8_decode( ' '.$parte[1] ),0, '', 'C' );
        $pdf->Ln( 1);
        $pdf->Cell( 45, 3, utf8_decode( 'NIT: '.$emisor[0]->nit ), '', 0, 'C' );
        $pdf->Ln( 3);
        $pdf->Cell( 45, 3, utf8_decode( 'NCR: '.$emisor[0]->ncr ), '', 0, 'C' );
        $pdf->SetFont( 'Arial', 'B', 5.5 );
        $pdf->Ln( 4);
        $pdf->Cell( 45, 3, utf8_decode( 'COD: '.$codigoGeneracion ), '', 0, 'C' );
        $pdf->Ln( 3);
        $pdf->Cell( 45, 3, utf8_decode( 'N°: '.$numeroControl ), '', 0, 'C' );
        $pdf->SetFont( 'Arial', '', 6 );
        $pdf->Ln( 3 );

        /* detalle */


       /* $pdf->Cell( 45, 3, utf8_decode( "Fecha/Hora Ingreso ".$ticket[0]->fecha." - ".$ticket[0]->horaEntrada ), '', 0, 'C' );
        $pdf->Ln( 3 );
        $pdf->Cell( 45, 3, utf8_decode( "Fecha/Hora Salida  ".$ticket[0]->fechaSalida." - ".$ticket[0]->horaSalida  ), 'B', 0, 'C' );
       */ $pdf->Ln( 4 );

      //  $cantidad= $this->lrenta->cantidadhoras( $ticket[0]->horaEntrada, $ticket[0]->horaSalida  );

        $pdf->Cell( 10, 3, utf8_decode( "Cant. "), '', 0, 'C' );
        $pdf->Cell( 25, 3, utf8_decode( "descripcion  "  ), '', 0, 'C' );
        $pdf->Cell( 13, 3, utf8_decode( "total "  ), '', 0, 'C' );
        $pdf->Ln( 3 );
        $ivaResumen = 0.00;
        $totalGravado = 0.00; 
        $ivaRetenido = 0.0;
        for ( $i = 0; $i<count( $respuesta ); $i++ ) {
        $pdf->Cell( 10, 4, utf8_decode( $respuesta[$i]->cantidad), 'B', 0, 'C' );
        $pdf->Cell( 25, 4, substr (utf8_decode($respuesta[$i]->descripcion  ) ,0,20 ), 'B', 0, 'C' );
        $pdf->Cell( 13, 4, utf8_decode('$'.$respuesta[$i]->subtotal   ), 'B', 0, 'C' );

        $ivaResumen += $respuesta[$i]->ivaItem;
            $ivaRetenido+= $respuesta[$i]->ivaRetenido;
            $totalGravado += $respuesta[$i]->subtotal;
            $pdf->Ln( 5 );
        }
        $pdf->Ln( 5 );
        $impuesto=$ivaResumen;
        $pdf->Cell( 6, 3, utf8_decode( ""), '', 0, 'C' );
        $pdf->Cell( 24, 4, utf8_decode( "Sub-Total  "  ), '', 0, 'C' );
        $pdf->Cell( 15, 4, utf8_decode('$ '.number_format($totalGravado, 2, '.', '')   ), '', 0, 'C' );
        $pdf->Ln( 5 );
        $pdf->Cell( 6, 3, utf8_decode( ""), '', 0, 'C' );
        $pdf->Cell( 24, 4, utf8_decode( "IVA 13%  "  ), 'B', 0, 'C' );
        $pdf->Cell( 15, 4, utf8_decode('$ '.number_format($impuesto, 2, '.', '')   ), 'B', 0, 'C' ); 
        $pdf->Ln( 5 );
        $pdf->Cell( 6, 3, utf8_decode( ""), '', 0, 'C' );
        $pdf->Cell( 24, 4, utf8_decode( "Total a Pagar: "  ), '', 0, 'C' );
        $pdf->Cell( 15, 4, utf8_decode('$ '.number_format($totalGravado, 2, '.', '')  ), '', 0, 'C' );
   
        $pdf->Ln( 5 );
        $pdf->Cell( 6, 3, utf8_decode( ""), '', 0, 'C' );
        $pdf->Cell( 24, 4, utf8_decode( "Total Efectivo:"  ), 'B', 0, 'C' );
        
        $pdf->Cell( 15, 4, utf8_decode('$ '.$efectivo  ), 'B', 0, 'C' );
        

        $pdf->Ln( 5 );
        $pdf->Cell( 6, 3, utf8_decode( ""), '', 0, 'C' );
        $pdf->Cell( 24, 4, utf8_decode( "Cambio: "  ), 'B', 0, 'C' );
        $pdf->Cell( 15, 4, utf8_decode('$ '.number_format($efectivo -$totalGravado, 2, '.', '')  ), 'B', 0, 'C' ); 
        $pdf->Ln( 5 );
        
        $pdf->Ln( 5 );

        $pdf->Cell( 20, 3, utf8_decode( "Hora Impresion" ), '', 0, 'C' );
        $pdf->Cell( 25, 3, utf8_decode( $fecha." -- ".$horaSalida), '', 0, 'C' );
        $pdf->Ln( 5 );

        $pdf->Cell( 50, 3, utf8_decode( "Presentar Ticket para Devolucion/Reclamo" ), '', 0, 'C' );
        
        $pdf->Ln( 3 );

        $pdf->SetFont( 'Arial', '', 6 );

        $pdf->Ln( 5 );

        $pdf->Cell( 45, 3, utf8_decode( "!.. Gracias Por Su visita ..!" ), '', 0, 'C' );
        $pdf->Ln( 5 );
        $pdf->Cell( 45, 3, utf8_decode( "Lo esperamos Pronto" ), '', 0, 'C' );
 $pdf->Ln( 30);
$pdf->SetFont( 'Arial', '', 1 );

 $pdf->Cell( 45, 3, utf8_decode( " " ), '', 0, 'C' );
 $pdf->Ln( 30);
        $pdf->Output( "I", substr($codigoGeneracion, -8).".pdf", true );





    }
}