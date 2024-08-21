<?php
defined( 'BASEPATH' ) OR exit( 'No direct script access allowed' );

class generales extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model( "mhdte/productos_model" );
        $this->load->model( "mhdte/integracion_model" );
        $this->load->model( "mhdte/Serviciosgenerales_model" );
        $this->load->model( "mhdte/Productosotrabase_model" );

    }

    public function listaProducto() {

        $codigo = $this->input->post( "codigo" );
        $area = $this->session->userdata("codestab");//$this->input->post( "area" );
        $tienda = $this->session->userdata("tienda");


        $response=$this->productos_model->listaProductos($area,$codigo,$tienda);
        echo  json_encode($response);


    }

    public function listaServicioGen() {

        $codigo = $this->input->post( "codigo" );

        $area = $this->session->userdata("codestab");//$this->input->post( "area" ); $this->session->userdata("dtearea"); 

        $tienda = $this->session->userdata("tienda");

        $response=$this->productos_model->listaServicioGen($area,$codigo,$tienda);
        echo  json_encode($response);


    }  
    public function listaServicioGen2() {

        $codigo = $this->input->post( "codigo" );

        $area = "RT";

        $response=$this->productos_model->listaServicioGen2($area,$codigo);
        echo  json_encode($response);


    }    
    public function item153() {

        $response=$this->productos_model->item153();
        echo  json_encode($response);


    }  
    public function item154() {

        $response=$this->productos_model->item154();
        echo  json_encode($response);


    }
    public function item83() {

        $response=$this->productos_model->item83();
        echo  json_encode($response);


    } 
    public function regFiscal() {

        $response=$this->productos_model->regFiscal();
        echo  json_encode($response);


    }

    public function consultaPartida() {

        $numeroControl = $this->input->post( "numeroControl" );

        $codigoGeneracion = $this->input->post("codigoGeneracion");

        $response=$this->integracion_model->consultaPartida($numeroControl,$codigoGeneracion);
        
        echo  json_encode($response);


    }  
    public function partConta(){

        $numeroControl=$this->input->post( "numeroControl" );
        $codigoGeneracion=$this->input->post( "codigoGeneracion" );
        $cuentaContable=$this->input->post( "cuentaContable" );
        $debehaber=$this->input->post( "debehaber" );
        $monto=$this->input->post( "monto" );
        $descripcion=$this->input->post( "descripcion" );


        $data  = array(

            'numControlFact'=>$numeroControl,
            'codigoGeneracion'=>$codigoGeneracion,
            'cuentaContable'=>$cuentaContable,
            'debeHaber'=>$debehaber,
            'monto'=>$monto ,          
            'descripcion'=>$descripcion           

        );



        if ( $this->integracion_model->savePartida($data) ) {

            echo json_encode( $data );
        } else {

            $data  = array(
                'OK' => $this->session->set_flashdata( "error", "No se pudo guardar la informacion" ),
            );
            echo json_encode( $data );
        } 
    }

    public function agregarAbonos(){
        $numeroControl = $this->input->post( "numeroControl" );
        $codigoGeneracion = $this->input->post("codigoGeneracion");
        $response=$this->Serviciosgenerales_model->agregarAbonos($numeroControl,$codigoGeneracion);

        if(empty($response)){
            $data  = array();
        }else{
            $ivatotal=0;
            for ( $i = 0; $i<count( $response ); $i++ ) {
               $ivatotal+= $response[$i]->ivaItem;
                if(substr ($numeroControl, 4, 2)=="01"){
                    $precio=$response[$i]->precioUnitario-$response[$i]->ivaItem;
                }else{
                    $precio=$response[$i]->precioUnitario;
                }
                $data  = array(

                    'numControlFact'=>$numeroControl,
                    'codigoGeneracion'=>$codigoGeneracion,
                    'cuentaContable'=>$response[$i]->codigo,
                    'debeHaber'=>2,
                    'monto'=>number_format($precio, 2, '.', '' )  ,          
                    'descripcion'=>$response[$i]->descripcion.' '.$response[$i]->observacionesItem           

                );
                if ( $this->integracion_model->savePartida($data) ) {

                    echo json_encode( $data );
                } else {

                    $data  = array(
                        'OK' => $this->session->set_flashdata( "error", "No se pudo guardar la informacion" ),
                    );
                    echo json_encode( $data );
                } 

            }

        }
        $data  = array(

                    'numControlFact'=>$numeroControl,
                    'codigoGeneracion'=>$codigoGeneracion,
                    'cuentaContable'=>'21501',
                    'debeHaber'=>2,
                    'monto'=>number_format($ivatotal, 2, '.', '' )  ,          
                    'descripcion'=>$response[0]->observacionesItem           

                );
        $this->integracion_model->savePartida($data);
        echo  json_encode($data);

    }

    public function FalsaContingencia(){
        $numeroControl = $this->input->post( "numeroControl" );
        $codigoGeneracion = $this->input->post("codigoGeneracion");
          $fecha=date("Y-m-d");
        $hora = date("H:i:s");
         $data  = array(

             'version'=> 2,
             'ambiente' => '01', 
             'versionApp' => 2, 
             'estado' => 'PROCESADO', 
             'codigoGeneracion' => $codigoGeneracion, 
             'selloRecibido' => 'ContingenciaInterna',
             'fhProcesamiento' => $fecha.' '.$hora,
             'clasificaMsg' => '999', 
             'codigoMsg'=> '001', 
             'descripcionMsg'=> 'CONTINGENCIA F', 
             'observaciones'=> []
         

                );
   
         echo json_encode ($data ); 
    }
    
         public function item153v2(){
         $tablaResumen = $this->Serviciosgenerales_model->getUsuarios( );
        echo json_encode( $tablaResumen );
    }  
    public function item153Menus(){
         $tablaResumen = $this->Serviciosgenerales_model->item153Menus( );
        echo json_encode( $tablaResumen );
    }
    public function item153subMenus(){
         $codigo = $this->input->post( "codigo" );
         $usuario = $this->input->post( "usuario" );
         $tablaResumen = $this->Serviciosgenerales_model->item153subMenus($codigo,$usuario );
        echo json_encode( $tablaResumen );
    }

    public function codestab(){
       
        $tablaResumen = $this->Serviciosgenerales_model->codestab();
       echo json_encode( $tablaResumen );
   }

   public function tienda(){

    if($this->session->userdata("tipuser")=='admin'){
        $area = $this->input->post( "codestab" );
    }
   else{
    $area = $this->session->userdata("codestab");
   }
    

    $tablaResumen = $this->Serviciosgenerales_model->tienda($area);
   echo json_encode( $tablaResumen );
}
   public function ingresosMenus(){
      
        $data  = array(

            'seccion'=>$this->input->post( "usuario" ),
            'tipoDte'=>$this->input->post( "menu" ),
            'items'=>$this->input->post( "submenu" )     
        );
       
        if (  $this->Serviciosgenerales_model->saveM( $data )){
           
            echo json_encode( $data);
        } else {

            $datasave  = array(
                'error' => $this->session->set_flashdata( "error", "No se pudo guardar la informacion" ),
            );
            echo json_encode( $datasave );
        }
    }


    public function CategoriasPost(){
      
        $tablaResumen = $this->Productosotrabase_model->listaProductos();
       echo json_encode( $tablaResumen );
   }
   
public function Departamentos(){
    
    $response=$this->Serviciosgenerales_model->Departamentos();
    echo  json_encode($response);
}    
    
public function Municipios(){
    
    $departamento=$this->input->post( "departamento" );
        $response=$this->Serviciosgenerales_model->Minicipios($departamento);
    echo  json_encode($response);
    
}    
    

}