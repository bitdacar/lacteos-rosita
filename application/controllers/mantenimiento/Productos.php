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
  $umedidaloc=$this->input->post("umedidaloc");
  $minimo=$this->input->post("minimo");
  $maximo=$this->input->post("maximo");
  
  $data  = array(
	'codigo' => $uname,
	'descripcion' =>$nombre,
	'precio' =>$PrecCCF,
	'precioPub' =>$PrecPub,
	'area' => $estado,
	'CtaInv' => 0,
	'CtaIng' => 0,
	'CtaGas' => 0,
	'UnidadMedida' =>$umedida,      
	'precio_mayoreo' =>$mayoreo,
	'codCobol' =>$codestab,
	'tienda' =>$tienda,
	'dtearea'=> $detarea,
	'minimo'=> $minimo,
	'maximo'=> $maximo,    
	"uniInterna"=>$umedidaloc
);

$tablaUsuarios = $this->Productos_model->ingresoProducto($uname,$codestab,$tienda,$busqueda,$data );  
  echo json_encode( $tablaUsuarios );
  
  }

public function BuscarProductos(){
	$uname=$this->input->post( "uname" );
$tablaUsuarios = $this->Productos_model->BuscarProductos($uname );  
  echo json_encode( $tablaUsuarios );
  
  }

  function listarproducto(){
	$tienda=$this->input->post( "tienda" );
	$codestab=$this->input->post( "codestab" );
$tablaUsuarios = $this->Productos_model->listarproducto($tienda,$codestab );  
  echo json_encode( $tablaUsuarios );
  
  }

}
