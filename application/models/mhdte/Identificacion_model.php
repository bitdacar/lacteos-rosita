<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Identificacion_model extends CI_Model {


    public function save($data){
		return $this->db->insert("identificacion",$data);
	}
    public function save2($data){
		return $this->db->insert("receptordocumen",$data);
	}
    public function corelativo($anio,$codestab){
        $this->db->select("numeroControl");
		$this->db->where("fechanio",$anio);
		$this->db->where("codigoGeneracion",$codestab);
		$resultado = $this->db->get("controlcodigos");
		return $resultado->row();
	}
    
   public function corelativoUpdate($anio,$codestab,$data){
		$this->db->where("fechanio",$anio);
		$this->db->where("codigoGeneracion",$codestab);
		return $this->db->update("controlcodigos",$data);
	}
      
    /**        consultas    **/
   public function verificarComRete($numeroControl, $codigoGeneracion){
       
       
    //  $this->db->where("numeroControl",$numeroControl);
		$this->db->where("numDocRelacion",$codigoGeneracion);
        $resultados = $this->db->get("docrelacionados");
		return $resultados->result();
       
   } 
    public function verificarComReteCD($numeroControl, $codigoGeneracion){
       
       
    //  $this->db->where("numeroControl",$numeroControl);
		$this->db->where("numDocRelacion",$codigoGeneracion);
        $resultados = $this->db->get("Cuerpodocumento");
		return $resultados->result();
       
   }
   
}