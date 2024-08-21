<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Productos extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		$this->load->model("mhdte/Productos_model");
		
	}

 /* Ingresos Productos */
    
    
 public function ingresosProducto(){
	$uname=$this->input->post( "uname" );
	$nombre=$this->input->post( "nombre" );
	$PrecPub=$this->input->post( "PrecPub" );
	$PrecCCF=$this->input->post( "PrecCCF" );
	$estado=$this->input->post( "activo" );
	$mayoreo=$this->input->post( "mayoreo" );
	$codestab=$this->input->post( "codestab" );
	$tienda=$this->input->post( "tienda" );
  $busqueda=$this->input->post( "busqueda" );
  $detarea=$this->input->post("detarea");
  $umedida=$this->input->post("umedida");
  $minimo=$this->input->post("minimo");
  $maximo=$this->input->post("maximo");
  
$tablaUsuarios = $this->Productos_model->ingresoProducto($nombre,$PrecPub,$PrecCCF,$uname,$estado,$busqueda,$mayoreo,$codestab,$tienda,$detarea,$umedida,$minimo,$maximo );  
  echo json_encode( $tablaUsuarios );
  
  }

public function BuscarProductos(){
	$uname=$this->input->post( "uname" );
$tablaUsuarios = $this->Productos_model->BuscarProductos($uname );  
  echo json_encode( $tablaUsuarios );
  
  }

}
