<?php
defined( 'BASEPATH' ) OR exit( 'No direct script access allowed' );

class Libros extends CI_Controller {

    public function __construct() {
        parent::__construct();
        if ( !$this->session->userdata( "login" ) ) {
            redirect( base_url() );
        }
        $this->load->model( "mhdte/Reporte_Libro_model" );

    }

    public function index() {

    }

    public function LBCT() {

        $this->load->library( 'pdf/pdfCI' );
        sleep( 2 );

        //$codigoGeneracion = $this->input->post( "codigoGeneracion" );
        $fechini = $this->input->post( "fini" );
        $fechfin = $this->input->post( "ffin" );

        $area = $this->input->post( "area" );
        $id = 1;
        $txt = "";

        $respuesta = $this->Reporte_Libro_model->LBCT( $fechini, $fechfin );

        $fecha = date( "Y-m-d" );
        // $pdf = new PDF_Code128( 'P', 'mm', array( 140, 210 ) );
        $pdf = new PDF_Code128( 'L', 'mm', 'legal' );
        $pdf->SetMargins( 15, 11, 15 );
        $pdf->AddPage();

        $nameFile = "DTE-Enviados";
        # Logo de la empresa formato png #
        //$pdf->Image( './img/logo.png', 165, 12, 35, 35, 'PNG' );
        $fecha = date( 'Y-m-d' );
        $hora = date( "h:i:s" );

        $pdf->Image( base_url()."/assets/build/images/cuzlogo.png", 20, 8, 14, 14, "png" );

        # Encabezado y datos de la empresa #
        $pdf->SetFont( 'Arial', 'B', 8 );
        $pdf->SetTextColor( 32, 100, 210 );

        $pdf->Cell( 35 );
        $pdf->Cell( 175, 2, utf8_decode( strtoupper( $this->session->userdata( "NomDemo" ) ) ), 0, 0, 'C' );

        $pdf->Ln( 4 );
        $pdf->Cell( 35 );
        $pdf->Cell( 175, 2, utf8_decode( strtoupper( "REPORTE LIBRO DE VENTAS A CONTRIBUYENTES: ".date( 'd/m/Y', strtotime( $fechini ) )." Hasta: ".date( 'd/m/Y', strtotime( $fechfin ) ) ) ), 0, 0, 'C' );
        $pdf->SetFont( 'Arial', 'B', 6 );
        $pdf->Ln( 4 );
        $pdf->Cell( 35 );
        $pdf->Cell( 175, 2, utf8_decode( strtoupper( "Fecha de consulta: ".date( 'd/m/Y', strtotime( $fecha ) )." ".$hora ) ), 0, 0, 'C' );
        $pdf->SetFont( 'Arial', 'B', 6 );

        $pdf->Ln( 4 );

        # Tabla de productos #
        $pdf->SetFont( 'Arial', '', 8 );
        $pdf->SetFillColor( 23, 83, 201 );
        $pdf->SetDrawColor( 23, 83, 201 );
        $pdf->SetTextColor( 0,0,0 );
        // $pdf->Cell( 7, 8, utf8_decode( "item" ), 0, 0, 'C', false );
        $pdf->Cell( 15, 8, utf8_decode( "fecha" ), 0, 0, 'C', false );
        $pdf->Cell( 49, 8, utf8_decode( "DTE" ), 0, 0, 'C', false );
        $pdf->Cell( 54, 8, utf8_decode( "Generacion" ), 0, 0, 'C', false );
        $pdf->Cell( 70, 8, utf8_decode( "Nombre Cliente" ), 0, 0, 'C', false );
        $pdf->Cell( 15, 8, utf8_decode( "NRC" ), 0, 0, 'C', false );
        $pdf->Cell( 10, 8, utf8_decode( "Exenta" ), 0, 0, 'C', false );

        $pdf->Cell( 20, 8, utf8_decode( "Gravada" ), 0, 0, 'C', false );
        $pdf->Cell( 15, 8, utf8_decode( "IVA" ), 0, 0, 'C', false );
        $pdf->Cell( 14, 8, utf8_decode( "Percibido" ), 0, 0, 'C', false );
        $pdf->Cell( 13, 8, utf8_decode( "Perc. 2 %" ), 0, 0, 'C', false );
        $pdf->Cell( 26, 8, utf8_decode( "Total " ), 0, 0, 'R', false );

        $pdf->Ln( 8 );

        $pdf->SetTextColor( 39, 39, 51 );
        $pdf->SetFont( 'Arial', '', 7 );
        /*----------  Detalles de la tabla  ----------*/

        $totalfila = 0.00;

        $totalGravado = 0.00;
        $totalIva13 = 0.00;
        $totalIva13nota = 0.00;
        $totalExenta = 0.00;
        $totalPercibido = 0.00;
        $totalPercibidonota = 0.00;
        $totalNotas = 0.00;
        $contador = 0;
        $dospc=0;

        for ( $i = 0; $i<count( $respuesta );
        $i++ ) {
            $signo = '';
            $pdf->SetTextColor( 39, 39, 51 );
            $totalfila += $totalfila+$respuesta[$i]->totalGravada+$respuesta[$i]->totalExenta+$respuesta[$i]->iva13+$respuesta[$i]->ivaPercibido;
            if ( $respuesta[$i]->tipo == '05' ) {
                $totalNotas +=  $respuesta[$i]->totalGravada;
                $totalIva13nota += $respuesta[$i]->iva13;
                $totalPercibidonota += $respuesta[$i]->ivaPercibido;
                $signo = '-';
                $pdf->SetTextColor( 200, 100, 0 );
            } else {
                $totalGravado +=  $respuesta[$i]->totalGravada;
                $totalIva13 += $respuesta[$i]->iva13;
                $totalPercibido += $respuesta[$i]->ivaPercibido;
            }

            $pdf->Cell( 15, 5.5, $respuesta[$i]->fecha, '', 0, 'R' );
            $pdf->Cell( 49, 5.5, str_replace("'",'',$respuesta[$i]->TipoDocumento), '', 0, 'R' );
            $pdf->Cell( 54, 5.5, str_replace("'",'',$respuesta[$i]->codigoGeneracion), '', 0, 'L' );
            $pdf->Cell( 70, 5.5, utf8_decode( $respuesta[$i]->codigo.' - '.substr ( $respuesta[$i]->NomDenominacion, 0, 74 ) ), '', 0, 'L' );
            $pdf->Cell( 15, 5.5, $respuesta[$i]->ncr, '', 0, 'R' );
            $pdf->Cell( 10, 5.5, number_format( $respuesta[$i]->totalExenta, 2, '.', ',' ), '', 0, 'R' );

            $pdf->Cell( 20, 5.5, $signo.' '.number_format( $respuesta[$i]->totalGravada, 2, '.', ',' ), '', 0, 'R' );
            $pdf->Cell( 15, 5.5, $signo.' '.number_format( $respuesta[$i]->iva13, 2, '.', ',' ), '', 0, 'R' );

            $pdf->Cell( 14, 5.5, $signo.' '. number_format( $respuesta[$i]->ivaPercibido, 2, '.', ',' ), '', 0, 'R' );
            $pdf->Cell( 13, 5.5, $signo.' '. number_format( $respuesta[$i]->dospc, 2, '.', ',' ), '', 0, 'R' );
            // $pdf->Cell( 10, 5.5, utf8_decode( $lista['fecha'] ), 'L', 0, 'C' );
            $pdf->Cell( 26, 5.5, $signo.' '.number_format( $totalfila, 2, '.', ',' ), '', 0, 'R' );

            $pdf->Ln( 4 );

            $totalExenta +=  $respuesta[$i]->totalExenta;
$dospc+=$respuesta[$i]->dospc;
            $totalfila = 0.00;

            if ( $i == ( $contador +38 ) ) {
                $contador = $i;
                $pdf->Ln( 1.5 );
                $pdf->Cell( 255, 5.5, '', '', 0, 'C' );
                $pdf->AddPage();
                $pdf->SetFont( 'Arial', '', 8 );
                $pdf->SetFillColor( 23, 83, 201 );
                $pdf->SetDrawColor( 23, 83, 201 );
                $pdf->SetTextColor( 0,0,0 );
                $pdf->Cell( 15, 8, utf8_decode( "fecha" ), 0, 0, 'C', false );
                $pdf->Cell( 49, 8, utf8_decode( "DTE" ), 0, 0, 'C', false );
                $pdf->Cell( 54, 8, utf8_decode( "Generacion" ), 0, 0, 'C', false );
                $pdf->Cell( 70, 8, utf8_decode( "Nombre Cliente" ), 0, 0, 'C', false );
                $pdf->Cell( 15, 8, utf8_decode( "NRC" ), 0, 0, 'C', false );
                $pdf->Cell( 10, 8, utf8_decode( "Exenta" ), 0, 0, 'C', false );

                $pdf->Cell( 20, 8, utf8_decode( "Gravada" ), 0, 0, 'C', false );
                $pdf->Cell( 15, 8, utf8_decode( "IVA" ), 0, 0, 'C', false );
                $pdf->Cell( 14, 8, utf8_decode( "Percibido" ), 0, 0, 'C', false );
                 $pdf->Cell( 13, 8, utf8_decode( "Perc. 2 %" ), 0, 0, 'C', false );

                $pdf->Cell( 26, 8, utf8_decode( "Total " ), 0, 0, 'R', false );

                $pdf->Ln( 8 );

                $pdf->SetTextColor( 39, 39, 51 );
                $pdf->SetFont( 'Arial', '', 7 );

            }

        }

        /*----------  Fin Detalles de la tabla  ----------*/
        $pdf->Ln( 1.5 );
        $pdf->Cell( 301, 5.5, '', '', 0, 'C' );
        $pdf->Ln( 5 );

        $respuestaResumen = $this->Reporte_Libro_model->resumenesLibros( $fechini, $fechfin );

        $totalfacturas = $respuestaResumen[0]->gravada;
        $totalIvafactura = $respuestaResumen[0]->iva;
        $totalexportaciones = $respuestaResumen[1]->gravada;

        $pdf->Cell( 80, 5.5, '', 'RLT', 0, 'C' );
        $pdf->Cell( 25, 5.5, 'VALOR NETO', 'RLT', 0, 'C' );
        $pdf->Cell( 25, 5.5, 'DEBITO FISCAL', 'RLT', 0, 'C' );
        $pdf->Cell( 25, 5.5, 'IVA PERCIBIDO 1%', 'RLT', 0, 'C' );
        $pdf->Cell( 10, 5.5, '', '', 0, 'C' );
        $pdf->Cell( 25, 5.5, 'IVA PERCIBIDO 2%', 'RLT', 0, 'C' );

        $pdf->Ln( 4 );
        $pdf->Cell( 80, 5.5, 'VENTAS NETAS INTERNAS GRAVADAS A CONTRIBUYENTES', 'RLT', 0, 'L' );
        $pdf->Cell( 25, 5.5, number_format( $totalGravado-$totalNotas, 2, '.', ',' ), 'RLT', 0, 'R' );
        $pdf->Cell( 25, 5.5, number_format( $totalIva13-$totalIva13nota, 2, '.', ',' ), 'RLT', 0, 'R' );
        $pdf->Cell( 25, 5.5, number_format( $totalPercibido, 2, '.', ',' ), 'RLT', 0, 'R' );
        $pdf->Cell( 10, 5.5, '', '', 0, 'C' );
        $pdf->Cell( 25, 5.5, '0.00', 'RLT', 0, 'R' );

        $pdf->Ln( 4 );
        $pdf->Cell( 80, 5.5, "TOTAL NETAS INTERNAS GRABADAS A CONSUMIDORES", 'RLT', 0, 'L' );
        $pdf->Cell( 25, 5.5, number_format( $totalfacturas, 2, '.', ',' ), 'RLT', 0, 'R' );
        $pdf->Cell( 25, 5.5, number_format( $totalIvafactura, 2, '.', ',' ), 'RLT', 0, 'R' );
        $pdf->Cell( 25, 5.5, '0.00', 'RLT', 0, 'R' );
        $pdf->Cell( 10, 5.5, '', '', 0, 'C' );
        $pdf->Cell( 25, 5.5, '0.00', 'RLT', 0, 'R' );

        $pdf->Ln( 4 );
        $pdf->Cell( 80, 5.5, "TOTAL OPERACIONES INTERNAS GRAVADAS", 'RLT', 0, 'L' );
        $pdf->Cell( 25, 5.5, number_format( $totalfacturas+$totalGravado-$totalNotas, 2, '.', ',' ), 'RLT', 0, 'R' );
        $pdf->Cell( 25, 5.5, number_format( $totalIvafactura+$totalIva13-$totalIva13nota, 2, '.', ',' ), 'RLT', 0, 'R' );
        $pdf->Cell( 25, 5.5, number_format( $totalPercibido, 2, '.', ',' ), 'RLT', 0, 'R' );
        $pdf->Cell( 10, 5.5, '', '', 0, 'C' );
        $pdf->Cell( 25, 5.5, '0.00', 'RLT', 0, 'R' );

        $pdf->Ln( 4 );
        $pdf->Cell( 80, 5.5, "EXPORTACIONES SEGUN FACTURAS DE EXPORTACION ", 'RLTB', 0, 'L' );
        $pdf->Cell( 25, 5.5, number_format( $totalexportaciones, 2, '.', ',' ), 'RLTB', 0, 'R' );
        $pdf->Cell( 25, 5.5, '0.00', 'RLTB', 0, 'R' );
        $pdf->Cell( 25, 5.5, '0.00', 'RLTB', 0, 'R' );
        $pdf->Cell( 10, 5.5, '', '', 0, 'C' );
        $pdf->Cell( 25, 5.5,  number_format($dospc, 2, '.', ',' ), 'RLTB', 0, 'R' );

        $pdf->Output( "I", substr( $nameFile, -8 ).".pdf", true );

    }

    public function LBCF() {

        $this->load->library( 'pdf/pdfCI' );
        sleep( 2 );

        //$codigoGeneracion = $this->input->post( "codigoGeneracion" );
        $fechini = $this->input->post( "fini" );
        $fechfin = $this->input->post( "ffin" );

        $area = $this->input->post( "area" );
        $id = 1;
        $txt = "";

        $respuesta = $this->Reporte_Libro_model->LBCF( $fechini, $fechfin );

        $fecha = date( "Y-m-d" );
        // $pdf = new PDF_Code128( 'P', 'mm', array( 140, 210 ) );
        $pdf = new PDF_Code128( 'L', 'mm', 'letter' );
        $pdf->SetMargins( 10, 10, 10 );
        $pdf->AddPage();

        $nameFile = "DTE-Enviados";
        # Logo de la empresa formato png #
        //$pdf->Image( './img/logo.png', 165, 12, 35, 35, 'PNG' );
        $fecha = date( 'Y-m-d' );
        $hora = date( "h:i:s" );

        $pdf->Image( base_url()."/assets/build/images/cuzlogo.png", 20, 8, 14, 14, "png" );

        # Encabezado y datos de la empresa #
        $pdf->SetFont( 'Arial', 'B', 8 );
        $pdf->SetTextColor( 32, 100, 210 );

        $pdf->Cell( 35 );
        $pdf->Cell( 175, 2, utf8_decode( strtoupper( $this->session->userdata( "NomDemo" ) ) ), 0, 0, 'C' );

        $pdf->Ln( 4 );
        $pdf->Cell( 35 );
        $pdf->Cell( 175, 2, utf8_decode( strtoupper( "REPORTE DETALLE LIBRO DE VENTAS A CONSUMIDOR FINAL: ".date( 'd/m/Y', strtotime( $fechini ) )." Hasta: ".date( 'd/m/Y', strtotime( $fechfin ) ) ) ), 0, 0, 'C' );
        $pdf->SetFont( 'Arial', 'B', 6 );
        $pdf->Ln( 4 );
        $pdf->Cell( 35 );
        $pdf->Cell( 175, 2, utf8_decode( strtoupper( "Fecha de consulta: ".date( 'd/m/Y', strtotime( $fecha ) )." ".$hora ) ), 0, 0, 'C' );
        $pdf->SetFont( 'Arial', 'B', 6 );

        $pdf->Ln( 4 );

        # Tabla de productos #
        $pdf->SetFont( 'Arial', '', 8 );
        $pdf->SetFillColor( 23, 83, 201 );
        $pdf->SetDrawColor( 23, 83, 201 );
        $pdf->SetTextColor( 0, 0, 0 );
        // $pdf->Cell( 7, 8, utf8_decode( "item" ), 0, 0, 'C', false );
        $pdf->Cell( 15, 8, utf8_decode( "fecha" ), 0, 0, 'C', false );
        $pdf->Cell( 20, 8, utf8_decode( "DTE" ), 0, 0, 'C', false );
        $pdf->Cell( 55, 8, utf8_decode( "Generacion" ), 0, 0, 'C', false );
        $pdf->Cell( 75, 8, utf8_decode( "Nombre Cliente" ), 0, 0, 'C', false );
        $pdf->Cell( 15, 8, utf8_decode( "NRC" ), 0, 0, 'C', false );
        $pdf->Cell( 10, 8, utf8_decode( "Exenta" ), 0, 0, 'C', false );

        $pdf->Cell( 20, 8, utf8_decode( "Gravada" ), 0, 0, 'C', false );
        $pdf->Cell( 15, 8, utf8_decode( "IVA" ), 0, 0, 'R', false );
        $pdf->Cell( 10, 8, utf8_decode( "Perc." ), 0, 0, 'R', false );

        $pdf->Cell( 22, 8, utf8_decode( "Total " ), 0, 0, 'R', false );

        $pdf->Ln( 8 );

        $pdf->SetTextColor( 39, 39, 51 );
        $pdf->SetFont( 'Arial', '', 7 );
        /*----------  Detalles de la tabla  ----------*/

        $totalfila = 0.00;

        $totalGravado = 0.00;
        $totalIva13 = 0.00;
        $totalExenta = 0.00;
        $totalPercibido = 0.00;
        $totalNotas = 0.00;
        $contador = 0;

        for ( $i = 0; $i<count( $respuesta );
        $i++ ) {

            $totalfila += $totalfila+$respuesta[$i]->totalGravada+$respuesta[$i]->totalExenta+$respuesta[$i]->iva13+$respuesta[$i]->ivaPercibido;

            $pdf->Cell( 15, 5.5, $respuesta[$i]->fecha, '', 0, 'R' );
            $pdf->Cell( 20, 5.5, $respuesta[$i]->TipoDocumento, '', 0, 'L' );
            $pdf->Cell( 55, 5.5, $respuesta[$i]->codigoGeneracion, '', 0, 'L' );
            $pdf->Cell( 75, 5.5, utf8_decode( $respuesta[$i]->codigo.' - '.substr ( $respuesta[$i]->NomDenominacion, 0, 67 ) ), '', 0, 'L' );
            $pdf->Cell( 15, 5.5, $respuesta[$i]->ncr, '', 0, 'R' );
            $pdf->Cell( 10, 5.5, number_format( $respuesta[$i]->totalExenta, 2, '.', ',' ), '', 0, 'R' );

            $pdf->Cell( 20, 5.5, number_format( $respuesta[$i]->totalGravada, 2, '.', ',' ), '', 0, 'R' );
            $pdf->Cell( 15, 5.5, number_format( $respuesta[$i]->iva13, 2, '.', ',' ), '', 0, 'R' );

            $pdf->Cell( 10, 5.5, number_format( $respuesta[$i]->ivaPercibido, 2, '.', ',' ), '', 0, 'R' );
            // $pdf->Cell( 10, 5.5, utf8_decode( $lista['fecha'] ), 'L', 0, 'C' );
            $pdf->Cell( 22, 5.5, number_format( $totalfila, 2, '.', ',' ), '', 0, 'R' );

            $pdf->Ln( 4 );

            if ( $respuesta[$i]->tipo == '11' ) {
                $totalNotas +=  $respuesta[$i]->totalGravada;
            } else {
                $totalGravado +=  $respuesta[$i]->totalGravada;
            }

            $totalIva13 += $respuesta[$i]->iva13;
            $totalExenta +=  $respuesta[$i]->totalExenta;
            $totalPercibido += $respuesta[$i]->ivaPercibido;
            $totalfila = 0.00;

            if ( $i == ( $contador +38 ) ) {
                $contador = $i;
                $pdf->Ln( 1.5 );
                $pdf->Cell( 255, 5.5, '', '', 0, 'C' );
                $pdf->AddPage();
                $pdf->SetFont( 'Arial', '', 8 );
                $pdf->SetFillColor( 23, 83, 201 );
                $pdf->SetDrawColor( 23, 83, 201 );
                $pdf->SetTextColor( 0,0,0 );
                $pdf->Cell( 15, 8, utf8_decode( "fecha" ), 0, 0, 'C', false );
                $pdf->Cell( 20, 8, utf8_decode( "DTE" ), 0, 0, 'C', false );
                $pdf->Cell( 55, 8, utf8_decode( "Generacion" ), 0, 0, 'C', false );
                $pdf->Cell( 75, 8, utf8_decode( "Nombre Cliente" ), 0, 0, 'C', false );
                $pdf->Cell( 15, 8, utf8_decode( "NRC" ), 0, 0, 'C', false );
                $pdf->Cell( 10, 8, utf8_decode( "Exenta" ), 0, 0, 'C', false );

                $pdf->Cell( 20, 8, utf8_decode( "Gravada" ), 0, 0, 'C', false );
                $pdf->Cell( 15, 8, utf8_decode( "IVA" ), 0, 0, 'R', false );
                $pdf->Cell( 10, 8, utf8_decode( "Perc." ), 0, 0, 'R', false );

                $pdf->Cell( 22, 8, utf8_decode( "Total " ), 0, 0, 'R', false );

                $pdf->Ln( 8 );

                $pdf->SetTextColor( 39, 39, 51 );
                $pdf->SetFont( 'Arial', '', 7 );

            }

        }

        /*----------  Fin Detalles de la tabla  ----------*/
        $pdf->Ln( 1.5 );
        $pdf->Cell( 255, 5.5, '', '', 0, 'C' );
        $pdf->Ln( 5 );

        $respuestaResumen = $this->Reporte_Libro_model->resumenesLibros( $fechini, $fechfin );

        $totalfacturas = $respuestaResumen[0]->gravada;
        $totalIvafactura = $respuestaResumen[0]->iva;
        $totalexportaciones = $respuestaResumen[1]->gravada;

        $pdf->Cell( 80, 5.5, '', 'RLT', 0, 'C' );
        $pdf->Cell( 25, 5.5, 'VALOR NETO', 'RLT', 0, 'C' );
        $pdf->Cell( 25, 5.5, 'DEBITO FISCAL', 'RLT', 0, 'C' );
        $pdf->Cell( 25, 5.5, 'IVA PERCIBIDO 1%', 'RLT', 0, 'C' );

        /*$pdf->Ln( 4 );
        $pdf->Cell( 80, 5.5, 'VENTAS NETAS INTERNAS GRAVADAS A CONTRIBUYENTES', 'RLT', 0, 'L' );
        $pdf->Cell( 25, 5.5, number_format( $totalGravado, 2, '.', ',' ), 'RLTb', 0, 'R' );

        $pdf->Cell( 25, 5.5, number_format( $totalIva13, 2, '.', ',' ), 'RLT', 0, 'R' );
        $pdf->Cell( 25, 5.5, number_format( $totalPercibido, 2, '.', ',' ), 'RLT', 0, 'R' );
        */
        $pdf->Ln( 4 );
        $pdf->Cell( 80, 5.5, "TOTAL NETAS INTERNAS GRABADAS A CONSUMIDORES", 'RLT', 0, 'L' );
        $pdf->Cell( 25, 5.5, number_format( $totalfacturas, 2, '.', ',' ), 'RLTb', 0, 'R' );
        $pdf->Cell( 25, 5.5, number_format( $totalIvafactura, 2, '.', ',' ), 'RLT', 0, 'R' );
        $pdf->Cell( 25, 5.5, '0.00', 'RLT', 0, 'R' );

        $pdf->Ln( 4 );
        $pdf->Cell( 80, 5.5, "TOTAL OPERACIONES INTERNAS GRAVADAS", 'RLT', 0, 'L' );
        $pdf->Cell( 25, 5.5, number_format( $totalfacturas, 2, '.', ',' ), 'RLT', 0, 'R' );
        $pdf->Cell( 25, 5.5, number_format( $totalIvafactura, 2, '.', ',' ), 'RLT', 0, 'R' );
        $pdf->Cell( 25, 5.5, number_format( $totalPercibido, 2, '.', ',' ), 'RLT', 0, 'R' );

        $pdf->Ln( 4 );
        $pdf->Cell( 80, 5.5, "EXPORTACIONES SEGUN FACTURAS DE EXPORTACION ", 'RLTB', 0, 'L' );
        $pdf->Cell( 25, 5.5, number_format( $totalexportaciones, 2, '.', ',' ), 'RLTB', 0, 'R' );
        $pdf->Cell( 25, 5.5, '0.00', 'RLTB', 0, 'R' );
        $pdf->Cell( 25, 5.5, '0.00', 'RLTB', 0, 'R' );

        $pdf->Output( "I", substr( $nameFile, -8 ).".pdf", true );

    }

    public function LBCFRecorte() {

        $this->load->library( 'pdf/pdfCI' );
       

        //$codigoGeneracion = $this->input->post( "codigoGeneracion" );
        $fechini = $this->input->post( "fini" );
        $fechfin = $this->input->post( "ffin" );

        $area = $this->input->post( "area" );
        $id = 1;
        $txt = "";

        $respuesta = $this->Reporte_Libro_model->LBCF_recorte( $fechini, $fechfin );

        $fecha = date( "Y-m-d" );
        // $pdf = new PDF_Code128( 'P', 'mm', array( 140, 210 ) );
        $pdf = new PDF_Code128( 'P', 'mm', 'letter' );
        $pdf->SetMargins( 15, 11, 15 );
        $pdf->AddPage();

        $nameFile = "DTE-Enviados";
        # Logo de la empresa formato png #
        //$pdf->Image( './img/logo.png', 165, 12, 35, 35, 'PNG' );
        $fecha = date( 'Y-m-d' );
        $hora = date( "h:i:s" );

        $pdf->Image( base_url()."/assets/build/images/cuzlogo.png", 20, 8, 14, 14, "png" );

        # Encabezado y datos de la empresa #
        $pdf->SetFont( 'Arial', 'B', 8 );
        $pdf->SetTextColor( 32, 100, 210 );

        $pdf->Cell( 35 );
        $pdf->Cell( 150, 2, utf8_decode( strtoupper( $this->session->userdata( "NomDemo" ) ) ), 0, 0, 'C' );

        $pdf->Ln( 4 );
        $pdf->Cell( 35 );
        $pdf->Cell( 150, 2, utf8_decode( strtoupper( "REPORTE LIBRO DE VENTAS CONSUMIDOR FINAL: ".date( 'd/m/Y', strtotime( $fechini ) )." Hasta: ".date( 'd/m/Y', strtotime( $fechfin ) ) ) ), 0, 0, 'C' );
        $pdf->SetFont( 'Arial', 'B', 6 );
        $pdf->Ln( 4 );
        $pdf->Cell( 35 );
        $pdf->Cell( 150, 2, utf8_decode( strtoupper( "Fecha de consulta: ".date( 'd/m/Y', strtotime( $fecha ) )." ".$hora ) ), 0, 0, 'C' );
        $pdf->SetFont( 'Arial', 'B', 6 );

        $pdf->Ln( 4 );

        # Tabla de productos #
        $pdf->SetFont( 'Arial', '', 8 );
        $pdf->SetFillColor( 23, 83, 201 );
        $pdf->SetDrawColor( 23, 83, 201 );
        $pdf->SetTextColor( 0,0,0 );
        // $pdf->Cell( 7, 8, utf8_decode( "item" ), 0, 0, 'C', false );
        $pdf->Cell( 15, 8, utf8_decode( "fecha" ), 0, 0, 'C', false );
        $pdf->Cell( 53, 8, utf8_decode( "COD. INICIO" ), 0, 0, 'C', false );
        $pdf->Cell( 53, 8, utf8_decode( "COD. FINAL" ), 0, 0, 'C', false );
        
        $pdf->Cell( 10, 8, utf8_decode( "Exenta" ), 0, 0, 'C', false );

        $pdf->Cell( 20, 8, utf8_decode( "Gravada" ), 0, 0, 'R', false );
        $pdf->Cell( 20, 8, utf8_decode( "Export." ), 0, 0, 'R', false );
        

        $pdf->Cell( 22, 8, utf8_decode( "Total " ), 0, 0, 'R', false );

        $pdf->Ln( 8 );

        $pdf->SetTextColor( 39, 39, 51 );
        $pdf->SetFont( 'Arial', '', 7 );
        /*----------  Detalles de la tabla  ----------*/

        $totalfila = 0.00;

        $totalGravado = 0.00;
        $totalIva13 = 0.00;
        $totalExenta = 0.00;
        $totalPercibido = 0.00;
        $totalNotas = 0.00;
        $contador = 0;

        for ( $i = 0; $i<count( $respuesta );
        $i++ ) {

            $totalfila += $totalfila+$respuesta[$i]->totalGravada+$respuesta[$i]->totalExenta+$respuesta[$i]->totalOperaciones;

            $pdf->Cell( 15, 5.5, $respuesta[$i]->fecha, '', 0, 'R' );
            $pdf->Cell( 53, 5.5, $respuesta[$i]->cod_inicio, '', 0, 'R' );
            $pdf->Cell( 53, 5.5, $respuesta[$i]->cod_final, '', 0, 'R' );
            //$pdf->Cell( 70, 5.5, utf8_decode( $respuesta[$i]->codigo.' - '.substr ( $respuesta[$i]->NomDenominacion, 0, 74 ) ), 'L', 0, 'L' );
            //$pdf->Cell( 15, 5.5, $respuesta[$i]->ncr, 'L', 0, 'R' );
            $pdf->Cell( 10, 5.5, number_format( $respuesta[$i]->totalExenta, 2, '.', ',' ), '', 0, 'R' );
            $pdf->Cell( 20, 5.5, number_format( $respuesta[$i]->totalGravada, 2, '.', ',' ), '', 0, 'R' );
                $pdf->Cell( 20, 5.5, number_format( $respuesta[$i]->totalOperaciones, 2, '.', ',' ), '', 0, 'R' );
            if ( $respuesta[$i]->tipo == '11' ) {
                
                
                $totalNotas +=  $respuesta[$i]->totalOperaciones;

            } else {
               
                
                $totalGravado +=  $respuesta[$i]->totalGravada;
            }
            //$pdf->Cell( 10, 5.5, number_format( $respuesta[$i]->ivaPercibido, 2, '.', ',' ), 'L', 0, 'R' );
            // $pdf->Cell( 10, 5.5, utf8_decode( $lista['fecha'] ), 'L', 0, 'C' );
            $pdf->Cell( 22, 5.5, number_format( $totalfila, 2, '.', ',' ), '', 0, 'R' );

            $pdf->Ln( 4 );

            //$totalIva13 += $respuesta[$i]->iva13;
            $totalExenta +=  $respuesta[$i]->totalExenta;
            //$totalPercibido += $respuesta[$i]->ivaPercibido;
            $totalfila = 0.00;

            if ( $i == ( $contador +38 ) ) {
                $contador = $i;
                $pdf->Ln( 1.5 );
                $pdf->Cell( 255, 5.5, '', 'T', 0, 'C' );
                $pdf->AddPage();
                $pdf->SetFont( 'Arial', '', 8 );
                $pdf->SetFillColor( 23, 83, 201 );
                $pdf->SetDrawColor( 23, 83, 201 );
                $pdf->SetTextColor( 0,0,0 );
               $pdf->Cell( 15, 8, utf8_decode( "fecha" ), 0, 0, 'C', false );
        $pdf->Cell( 53, 8, utf8_decode( "COD. INICIO" ), 0, 0, 'C', false );
        $pdf->Cell( 53, 8, utf8_decode( "COD. FINAL" ), 0, 0, 'C', false );
        
        $pdf->Cell( 10, 8, utf8_decode( "Exenta" ), 0, 0, 'C', false );

        $pdf->Cell( 20, 8, utf8_decode( "Gravada" ), 0, 0, 'C', false );
        $pdf->Cell( 20, 8, utf8_decode( "Export." ), 0, 0, 'C', false );
        

        $pdf->Cell( 22, 8, utf8_decode( "Total " ), 0, 0, 'R', false );
                $pdf->Ln( 8 );

                $pdf->SetTextColor( 39, 39, 51 );
                $pdf->SetFont( 'Arial', '', 7 );

            }

        }

        /*----------  Fin Detalles de la tabla  ----------*/
        $pdf->Ln( 1.5 );
        $pdf->Cell( 193, 5.5, '', '', 0, 'C' );
        $pdf->Ln( 5 );

        $respuestaResumen = $this->Reporte_Libro_model->resumenesLibros( $fechini, $fechfin );

        $totalfacturas = $respuestaResumen[0]->gravada;
        $totalIvafactura = $respuestaResumen[0]->iva;
        $totalexportaciones = $respuestaResumen[1]->gravada;

        $pdf->Cell( 80, 5.5, '', 'RLT', 0, 'C' );
        $pdf->Cell( 25, 5.5, 'VALOR NETO', 'RLT', 0, 'C' );
        $pdf->Cell( 25, 5.5, 'IMPUESTO 13%', 'RLT', 0, 'C' );
       
        $pdf->Ln( 4 );
        $pdf->Cell( 80, 5.5, "VENTAS NETAS GRABADAS", 'RLT', 0, 'L' );
        $pdf->Cell( 25, 5.5, number_format( $totalfacturas-$totalIvafactura, 2, '.', ',' ), 'RLTb', 0, 'R' );
        $pdf->Cell( 25, 5.5, number_format( $totalIvafactura, 2, '.', ',' ), 'RLT', 0, 'R' );
        

        $pdf->Ln( 4 );
        $pdf->Cell( 80, 5.5, "TOTAL VENTAS GRAVADAS", 'RLT', 0, 'L' );
        $pdf->Cell( 25, 5.5, number_format( $totalfacturas, 2, '.', ',' ), 'RLT', 0, 'R' );
        $pdf->Cell( 25, 5.5, '', 'RLT', 0, 'R' );
       // $pdf->Cell( 25, 5.5, number_format( $totalPercibido, 2, '.', ',' ), 'RLT', 0, 'R' );

        $pdf->Ln( 4 );
        $pdf->Cell( 80, 5.5, "EXPORTACIONES SEGUN FACTURAS DE EXPORTACION ", 'RLTB', 0, 'L' );
        $pdf->Cell( 25, 5.5, number_format( $totalexportaciones, 2, '.', ',' ), 'RLTB', 0, 'R' );
        $pdf->Cell( 25, 5.5, '', 'RLTB', 0, 'R' );
       // $pdf->Cell( 25, 5.5, '0.00', 'RLTB', 0, 'R' );
        
        
        /* exportaciones      */
         $pdf->AddPage();
         $respuesta = $this->Reporte_Libro_model->soloExportaciones( $fechini, $fechfin );
           $pdf->Image( base_url()."/assets/build/images/cuzlogo.png", 20, 8, 14, 14, "png" );

        # Encabezado y datos de la empresa #
        $pdf->SetFont( 'Arial', 'B', 8 );
        $pdf->SetTextColor( 32, 100, 210 );

        $pdf->Cell( 35 );
        $pdf->Cell( 125, 2, utf8_decode( strtoupper( $this->session->userdata( "NomDemo" ) ) ), 0, 0, 'C' );

        $pdf->Ln( 4 );
        $pdf->Cell( 35 );
        $pdf->Cell( 125, 2, utf8_decode( strtoupper( "REPORTE DE EXPORTACIONES " ) ), 0, 0, 'C' );
        $pdf->SetFont( 'Arial', 'B', 6 );
        $pdf->Ln( 4 );
        $pdf->Cell( 35 );
        $pdf->Cell( 125, 2, 'ANEXO A LIBRO CONSUMIDORES  Desde:' .date( 'd/m/Y', strtotime( $fechini ) )." Hasta: ".date( 'd/m/Y', strtotime( $fechfin ) ), 0, 0, 'C' );
        $pdf->SetFont( 'Arial', 'B', 6 );
        $pdf->Ln( 4 );
        $pdf->Cell( 35 );
        $pdf->Cell( 125, 2, utf8_decode( strtoupper( "Fecha de consulta: ".date( 'd/m/Y', strtotime( $fecha ) )." ".$hora ) ), 0, 0, 'C' );
        $pdf->SetFont( 'Arial', 'B', 6 );

        $pdf->Ln( 4 );
         $pdf->SetFont( 'Arial', '', 8 );
                $pdf->SetFillColor( 23, 83, 201 );
                $pdf->SetDrawColor( 23, 83, 201 );
                $pdf->SetTextColor( 0,0,0 );
               $pdf->Cell( 15, 8, utf8_decode( "fecha" ), 0, 0, 'C', false );
        $pdf->Cell( 53, 8, utf8_decode( "COD. INICIO" ), 0, 0, 'C', false );
        $pdf->Cell( 83, 8, utf8_decode( "Nombre del Cliente" ), 0, 0, 'C', false );
        
        $pdf->Cell( 20, 8, utf8_decode( "Export." ), 0, 0, 'C', false );
        

        $pdf->Cell( 22, 8, utf8_decode( "Total " ), 0, 0, 'R', false );

                $pdf->Ln( 8 );

                $pdf->SetTextColor( 39, 39, 51 );
                $pdf->SetFont( 'Arial', '', 7 );
        
       $totalfacturas= $totalNotas=$totalGravado=$totalExenta=0;
        
           for ( $i = 0; $i<count( $respuesta );
        $i++ ) {

            $totalfila += $totalfila+$respuesta[$i]->totalGravada+$respuesta[$i]->totalExenta+$respuesta[$i]->totalOperaciones;

            $pdf->Cell( 15, 5.5, $respuesta[$i]->fecha, 'L', 0, 'R' );
            $pdf->Cell( 53, 5.5, $respuesta[$i]->cod_inicio, 'L', 0, 'R' );
            $pdf->Cell( 83, 5.5, $respuesta[$i]->Nombre, 'L', 0, 'L' );
            
                $pdf->Cell( 20, 5.5, number_format( $respuesta[$i]->totalOperaciones, 2, '.', ',' ), 'L', 0, 'R' );
            if ( $respuesta[$i]->tipo == '11' ) {
                
                
                $totalNotas +=  $respuesta[$i]->totalOperaciones;

            } else {
               
                
                $totalGravado +=  $respuesta[$i]->totalGravada;
            }
            //$pdf->Cell( 10, 5.5, number_format( $respuesta[$i]->ivaPercibido, 2, '.', ',' ), 'L', 0, 'R' );
            // $pdf->Cell( 10, 5.5, utf8_decode( $lista['fecha'] ), 'L', 0, 'C' );
            $pdf->Cell( 22, 5.5, number_format( $totalfila, 2, '.', ',' ), 'LR', 0, 'R' );

            $pdf->Ln( 4 );

            //$totalIva13 += $respuesta[$i]->iva13;
            $totalExenta +=  $respuesta[$i]->totalExenta;
            //$totalPercibido += $respuesta[$i]->ivaPercibido;
            $totalfila = 0.00;

            

        }
          $pdf->Ln( 1.5 );
        $pdf->Cell( 193, 5.5, '', 'T', 0, 'C' );

        $pdf->Ln( 4 );
        $pdf->Cell( 100, 5.5, '', '', 0, 'R' );
        $pdf->Cell( 50, 5.5, "TOTAL EXPORTACIONES", 'RLTB', 0, 'R' );
        $pdf->Cell( 42, 5.5, number_format( $totalfacturas+$totalNotas, 2, '.', ',' ), 'RLTB', 0, 'R' );
        
        
        
        
        

        $pdf->Output( "I", substr( $nameFile, -8 ).".pdf", true );

    }

    public function LCCS() {

        $this->load->library( 'pdf/pdfCI' );
        sleep( 2 );

        //$codigoGeneracion = $this->input->post( "codigoGeneracion" );
        $fechini = $this->input->post( "fini" );
        $fechfin = $this->input->post( "ffin" );

        $area = $this->input->post( "area" );
        $id = 1;
        $txt = "";

        $respuesta = $this->Reporte_Libro_model->LCCS( $fechini, $fechfin );

        $fecha = date( "Y-m-d" );
        // $pdf = new PDF_Code128( 'P', 'mm', array( 140, 210 ) );
        $pdf = new PDF_Code128( 'L', 'mm', 'letter' );
        $pdf->SetMargins( 15, 11, 15 );
        $pdf->AddPage();

        $nameFile = "DTE-Enviados";
        # Logo de la empresa formato png #
        //$pdf->Image( './img/logo.png', 165, 12, 35, 35, 'PNG' );
        $fecha = date( 'Y-m-d' );
        $hora = date( "h:i:s" );

        $pdf->Image( base_url()."/assets/build/images/cuzlogo.png", 20, 8, 14, 14, "png" );

        # Encabezado y datos de la empresa #
        $pdf->SetFont( 'Arial', 'B', 8 );
        $pdf->SetTextColor( 32, 100, 210 );

        $pdf->Cell( 35 );
        $pdf->Cell( 175, 2, utf8_decode( strtoupper( $this->session->userdata( "NomDemo" ) ) ), 0, 0, 'C' );

        $pdf->Ln( 4 );
        $pdf->Cell( 35 );
        $pdf->Cell( 175, 2, utf8_decode( strtoupper( "REPORTE  LIBRO DE COMPRAS A NO CONTRIBUYENTES / SUJETOS EXCLUIDOS: ".date( 'd/m/Y', strtotime( $fechini ) )." Hasta: ".date( 'd/m/Y', strtotime( $fechfin ) ) ) ), 0, 0, 'C' );
        $pdf->SetFont( 'Arial', 'B', 6 );
        $pdf->Ln( 4 );
        $pdf->Cell( 35 );
        $pdf->Cell( 175, 2, utf8_decode( strtoupper( "Fecha de consulta: ".date( 'd/m/Y', strtotime( $fecha ) )." ".$hora ) ), 0, 0, 'C' );
        $pdf->SetFont( 'Arial', 'B', 6 );

        $pdf->Ln( 4 );

        # Tabla de productos #
        $pdf->SetFont( 'Arial', '', 8 );
        $pdf->SetFillColor( 23, 83, 201 );
        $pdf->SetDrawColor( 23, 83, 201 );
        $pdf->SetTextColor( 0,0,0 );
        // $pdf->Cell( 7, 8, utf8_decode( "item" ), 0, 0, 'C', false );
        $pdf->Cell( 15, 8, utf8_decode( "fecha" ), 0, 0, 'C', false );
        $pdf->Cell( 25, 8, utf8_decode( "DTE" ), 0, 0, 'C', false );
        $pdf->Cell( 53, 8, utf8_decode( "Generacion" ), 0, 0, 'C', false );
        $pdf->Cell( 70, 8, utf8_decode( "Nombre Cliente" ), 0, 0, 'C', false );
        $pdf->Cell( 15, 8, utf8_decode( "NRC" ), 0, 0, 'C', false );
        $pdf->Cell( 10, 8, utf8_decode( "Exenta" ), 0, 0, 'C', false );

        $pdf->Cell( 20, 8, utf8_decode( "Gravada" ), 0, 0, 'C', false );
        $pdf->Cell( 15, 8, utf8_decode( "IVA" ), 0, 0, 'R', false );
        $pdf->Cell( 10, 8, utf8_decode( "Perc." ), 0, 0, 'R', false );

        $pdf->Cell( 22, 8, utf8_decode( "Total " ), 0, 0, 'R', false );

        $pdf->Ln( 8 );

        $pdf->SetTextColor( 39, 39, 51 );
        $pdf->SetFont( 'Arial', '', 7 );
        /*----------  Detalles de la tabla  ----------*/

        $totalfila = 0.00;

        $totalGravado = 0.00;
        $totalIva13 = 0.00;
        $totalExenta = 0.00;
        $totalPercibido = 0.00;
        $totalNotas = 0.00;
        $contador = 0;

        for ( $i = 0; $i<count( $respuesta );
        $i++ ) {

            $totalfila += $totalfila+$respuesta[$i]->totalGravada+$respuesta[$i]->totalExenta+$respuesta[$i]->iva13+$respuesta[$i]->ivaPercibido;

            $pdf->Cell( 15, 5.5, $respuesta[$i]->fecha, '', 0, 'R' );
            $pdf->Cell( 25, 5.5, $respuesta[$i]->TipoDocumento, '', 0, 'R' );
            $pdf->Cell( 53, 5.5, $respuesta[$i]->codigoGeneracion, '', 0, 'L' );
            $pdf->Cell( 70, 5.5, utf8_decode( $respuesta[$i]->codigo.' - '.substr ( $respuesta[$i]->NomDenominacion, 0, 69 ) ), '', 0, 'L' );
            $pdf->Cell( 15, 5.5, $respuesta[$i]->ncr, '', 0, 'R' );
            $pdf->Cell( 10, 5.5, number_format( $respuesta[$i]->totalExenta, 2, '.', ',' ), '', 0, 'R' );

            $pdf->Cell( 20, 5.5, number_format( $respuesta[$i]->totalGravada, 2, '.', ',' ), '', 0, 'R' );
            $pdf->Cell( 15, 5.5, number_format( $respuesta[$i]->iva13, 2, '.', ',' ), '', 0, 'R' );

            $pdf->Cell( 10, 5.5, number_format( $respuesta[$i]->ivaPercibido, 2, '.', ',' ), '', 0, 'R' );
            // $pdf->Cell( 10, 5.5, utf8_decode( $lista['fecha'] ), 'L', 0, 'C' );
            $pdf->Cell( 22, 5.5, number_format( $totalfila, 2, '.', ',' ), '', 0, 'R' );

            $pdf->Ln( 4 );

            if ( $respuesta[$i]->tipo == '14' ) {
                $totalNotas +=  $respuesta[$i]->totalGravada;
            } else {
                $totalGravado +=  $respuesta[$i]->totalGravada;
            }

            $totalIva13 += $respuesta[$i]->iva13;
            $totalExenta +=  $respuesta[$i]->totalExenta;
            $totalPercibido += $respuesta[$i]->ivaPercibido;
            $totalfila = 0.00;

            if ( $i == ( $contador +38 ) ) {
                $contador = $i;
                $pdf->Ln( 1.5 );
                $pdf->Cell( 255, 5.5, '', '', 0, 'C' );
                $pdf->AddPage();
                $pdf->SetFont( 'Arial', '', 8 );
                $pdf->SetFillColor( 23, 83, 201 );
                $pdf->SetDrawColor( 23, 83, 201 );
                $pdf->SetTextColor( 0,0,0 );
                $pdf->Cell( 15, 8, utf8_decode( "fecha" ), 0, 0, 'C', false );
                $pdf->Cell( 25, 8, utf8_decode( "DTE" ), 0, 0, 'C', false );
                $pdf->Cell( 53, 8, utf8_decode( "Generacion" ), 0, 0, 'C', false );
                $pdf->Cell( 70, 8, utf8_decode( "Nombre Cliente" ), 0, 0, 'C', false );
                $pdf->Cell( 15, 8, utf8_decode( "NRC" ), 0, 0, 'C', false );
                $pdf->Cell( 10, 8, utf8_decode( "Exenta" ), 0, 0, 'C', false );

                $pdf->Cell( 20, 8, utf8_decode( "Gravada" ), 0, 0, 'C', false );
                $pdf->Cell( 15, 8, utf8_decode( "IVA" ), 0, 0, 'C', false );
                $pdf->Cell( 10, 8, utf8_decode( "Percibido" ), 0, 0, 'C', false );

                $pdf->Cell( 22, 8, utf8_decode( "Total " ), 0, 0, 'R', false );

                $pdf->Ln( 8 );

                $pdf->SetTextColor( 39, 39, 51 );
                $pdf->SetFont( 'Arial', '', 7 );

            }

        }

        /*----------  Fin Detalles de la tabla  ----------*/
        $pdf->Ln( 1.5 );
        $pdf->Cell( 255, 5.5, '', '', 0, 'C' );
        $pdf->Ln( 5 );

        $respuestaResumen = $this->Reporte_Libro_model->resumenesLibros( $fechini, $fechfin );

        $totalfacturas = $respuestaResumen[0]->gravada;
        $totalIvafactura = $respuestaResumen[0]->iva;
        $totalexportaciones = $respuestaResumen[1]->gravada;

        $pdf->Cell( 80, 5.5, '', 'RLT', 0, 'C' );
        $pdf->Cell( 25, 5.5, 'VALOR NETO', 'RLT', 0, 'C' );
        $pdf->Cell( 25, 5.5, 'DEBITO FISCAL', 'RLT', 0, 'C' );
        $pdf->Cell( 25, 5.5, 'IVA PERCIBIDO 1%', 'RLT', 0, 'C' );

        $pdf->Ln( 4 );
        $pdf->Cell( 80, 5.5, 'TOTAL NOTAS DE RETENCION', 'RLT', 0, 'L' );
        $pdf->Cell( 25, 5.5, number_format( $totalGravado, 2, '.', ',' ), 'RLTb', 0, 'R' );

        $pdf->Cell( 25, 5.5, number_format( $totalIva13, 2, '.', ',' ), 'RLT', 0, 'R' );
        $pdf->Cell( 25, 5.5, number_format( $totalPercibido, 2, '.', ',' ), 'RLT', 0, 'R' );

        $pdf->Ln( 4 );
        $pdf->Cell( 80, 5.5, "TOTAL NETAS INTERNAS GRABADAS A CONSUMIDORES", 'RLT', 0, 'L' );
        $pdf->Cell( 25, 5.5, number_format( $totalfacturas, 2, '.', ',' ), 'RLTb', 0, 'R' );
        $pdf->Cell( 25, 5.5, number_format( $totalIvafactura, 2, '.', ',' ), 'RLT', 0, 'R' );
        $pdf->Cell( 25, 5.5, '0.00', 'RLT', 0, 'R' );

        $pdf->Ln( 4 );
        $pdf->Cell( 80, 5.5, "TOTAL SUJETO EXCLUICO", 'RLT', 0, 'L' );
        $pdf->Cell( 25, 5.5, number_format( $totalNotas, 2, '.', ',' ), 'RLT', 0, 'R' );
        $pdf->Cell( 25, 5.5, number_format( 0, 2, '.', ',' ), 'RLT', 0, 'R' );
        $pdf->Cell( 25, 5.5, number_format( 0, 2, '.', ',' ), 'RLT', 0, 'R' );

        $pdf->Ln( 4 );
        $pdf->Cell( 80, 5.5, "EXPORTACIONES SEGUN FACTURAS DE EXPORTACION ", 'RLTB', 0, 'L' );
        $pdf->Cell( 25, 5.5, number_format( $totalexportaciones, 2, '.', ',' ), 'RLTB', 0, 'R' );
        $pdf->Cell( 25, 5.5, '0.00', 'RLTB', 0, 'R' );
        $pdf->Cell( 25, 5.5, '0.00', 'RLTB', 0, 'R' );

        $pdf->Output( "I", substr( $nameFile, -8 ).".pdf", true );

    }

}
