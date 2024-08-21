<?php
defined( 'BASEPATH' ) OR exit( 'No direct script access allowed' );

class usuarios extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model( "mhdte/productos_model" );
        $this->load->model( "mhdte/integracion_model" );
        $this->load->model( "mhdte/usuariosgenerales_model" );
        $this->load->model( "mhdte/Productosotrabase_model" );

    }
    public function ingresosUsuarios(){
        $uname=$this->input->post( "uname" );
        $nombre=$this->input->post( "nombre" );
        $password=$this->input->post( "password" );
        $estado=$this->input->post( "activo" );
      $busqueda=$this->input->post( "busqueda" );
      $tienda=$this->input->post( "tienda" );
      
  
      
       $tablaUsuarios = $this->usuariosgenerales_model->ingresoUsuarios( $nombre,$password,$uname,$estado,$busqueda ,$tienda);  
       
       if($tablaUsuarios["tipo"]=="Usuario ingresado"){
        $this->ingresotblcxvendedor();
       }
       
      echo json_encode( $tablaUsuarios);
      
      }
  
   public function BuscarUsuarios(){
        $uname=$this->input->post( "uname" );
$tablaUsuarios = $this->usuariosgenerales_model->BuscarUsuarios($uname );  
      echo json_encode( $tablaUsuarios );
      
      }
  


      function ingresotblcxvendedor(){

        $data = array(
            "cod_usuario" => $this->input->post( "uname" ),
            "cuentaEfe" =>"0000000",
            "cuentaCred" =>"0000000",
            "codCobol" =>"00",

        );
       $this->usuariosgenerales_model->ingresotblcxvendedor($data );  
      }
  
}