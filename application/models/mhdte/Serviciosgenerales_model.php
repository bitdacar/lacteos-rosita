<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Serviciosgenerales_model extends CI_Model {

	
	public function save($data){
		return $this->db->insert("Cuerpodocumento",$data);
	}
    
    	public function saveM($data){
		return $this->db->insert("seccionesxdoc",$data);
	}
    public function ListProducto($data,$tienda){
		$this->db->select("id,codigo,descripcion,precio,UnidadMedida");
        $this->db->where( "codCobol", $data );
        $this->db->where( "tienda", $tienda );
		$this->db->from("productos");
        //$this->db->order_by('estado','ASC');
        $resultados = $this->db->get();
		return $resultados->result();
	}
     public function verificarComRete($numeroControl,$codigoGeneracion){
         $this->db->select("numeroControl,codigoGeneracion,fechaGendoc");
		
		$this->db->where("numDocRelacionado",$codigoGeneracion);
        $resultados = $this->db->get("Cuerpodocumento");
		return $resultados->result();
	}
    
    public function getParaResumen($numeroControl,$codigoGeneracion){

		$this->db->where("numeroControl",$numeroControl);
		$this->db->where("codigoGeneracion",$codigoGeneracion);
        $resultados = $this->db->get("resumen");
		return $resultados->result();
	}
    
    public function getParaResumenrete($numeroControl,$codigoGeneracion){

		$this->db->where("numeroControl",$numeroControl);
		$this->db->where("codigoGeneracion",$codigoGeneracion);
        $resultados = $this->db->get("Cuerpodocumento");
		return $resultados->result();
	}
    
    public function agregarAbonos($numeroControl,$codigoGeneracion){
        $this->db->where("numeroControl",$numeroControl);
		$this->db->where("codigoGeneracion",$codigoGeneracion);
        $resultados = $this->db->get("Cuerpodocumento");
		return $resultados->result();
    } 
    
    public function cargarPeriodo($añio){
        $this->db->where("anio",$añio);
		$this->db->where("estado","1");
        $resultados = $this->db->get("periodos");
		return $resultados->result();
    }
        public function MenusxUsuario($usuario){
        
        $query="select s.tipoDte,m.nombre ,m.icono  from seccionesxdoc s
inner join menus m on m.id =s.tipoDte 
where seccion='".$usuario."'
group by s.tipoDte ";
        
        $resultados = $this->db->query( $query );
        return $resultados->result();

    }  
        public function subMenusxUsuario($usuario){
        
        $query="select s.*  from seccionesxdoc s2 
inner join submenus s on s.id =s2.items 
where seccion='".$usuario."' ";
        
        $resultados = $this->db->query( $query );
        return $resultados->result();

    }     
    public function getUsuarios(){
        
        $query="select * from tblusuario ";
        
        $resultados = $this->db->query( $query );
        return $resultados->result();

    }
    
       public function item153Menus(){
        
        $query="select * from menus ";
        
        $resultados = $this->db->query( $query );
        return $resultados->result();

    }
     public function item153subMenus($menu,$usuario){
        
        $query="select * from submenus s where s.id_menuPrin ='".$menu."'  and 
s.id not in(select a.items from seccionesxdoc a where a.seccion ='".$usuario."')   ";
        
        $resultados = $this->db->query( $query );
        return $resultados->result();

    }
    public function codestab(){
        $cual = $this->session->userdata("codestab");
        $area = $this->session->userdata("tipuser");
        if($area!='admin'){
            $query="select * from emisor where codestab='".$cual."'";
        }else{
            $query="select * from emisor";
        }
       
        
        $resultados = $this->db->query( $query );
        return $resultados->result();

    }
    public function tienda($area ){
        
        $query="select * from tbltienda where codestab='".$area."' and estado='ACT'";
        
        $resultados = $this->db->query( $query );
        return $resultados->result();

    }

    
    
    public function Departamentos(){
        $query="select * from cat012";        
        $resultados = $this->db->query( $query );
        return $resultados->result();
    } 
    
    public function Minicipios($departamento){
        $query="select * from cat013 where codigo_depto = '".$departamento."'";
        $resultados = $this->db->query( $query );
        return $resultados->result();        
    }
    
}