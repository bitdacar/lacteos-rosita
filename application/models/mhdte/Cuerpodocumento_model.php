<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Cuerpodocumento_model extends CI_Model {

	public function getProductos(){
		$this->db->select("p.*,c.nombre as categoria");
		$this->db->from("productos p");
		$this->db->join("categorias c","p.categoria_id = c.id");
		$this->db->where("p.estado","1");
		$resultados = $this->db->get();
		return $resultados->result();
	}
    
	public function getParaResumen2($numeroControl,$codigoGeneracion){
        $query="select codigo,item,identificador,(select valor from cat014 where codigo=unidadMedida) unidadMedida,descripcion,precioUnitario,cantidad,ventasGravadas subtotal,ivaItem,r.ivaRetenido,r.ivaPercibido,observacionesItem,valorUnitario promo, JSON_EXTRACT(observacionesItems,  '$.rentaMenos') retencionRenta, JSON_EXTRACT(observacionesItems,  '$.ivaRetenido') ivaRetenidoJson
        from Cuerpodocumento c
        join resumen r on r.numeroControl =c.numeroControl and r.codigoGeneracion =c.codigoGeneracion 
        where c.numeroControl= '".$numeroControl."' and
        c.codigoGeneracion='".$codigoGeneracion."'";
		/*$this->db->where("numeroControl",$numeroControl);
		$this->db->where("codigoGeneracion",$codigoGeneracion);
		$resultados = $this->db->get("Cuerpodocumento");
		return $resultados->result();*/
         $resultados = $this->db->query( $query );
        return $resultados->result();
	}
    public function getParaResumen($numeroControl,$codigoGeneracion){
        $this->db->select("codigo,item,identificador,(select valor from cat014 where codigo=unidadMedida) unidadMedida,descripcion,precioUnitario,cantidad,ventasGravadas subtotal,ivaItem,ivaRetenido,ivaPercibido,observacionesItem,valorUnitario promo, JSON_EXTRACT(observacionesItems,  '$.rentaMenos') retencionRenta, JSON_EXTRACT(observacionesItems,  '$.ivaRetenido') ivaRetenido");
		$this->db->where("numeroControl",$numeroControl);
		$this->db->where("codigoGeneracion",$codigoGeneracion);
		$resultados = $this->db->get("Cuerpodocumento");
		return $resultados->result();
	}
    public function getParaResumenExp($numeroControl,$codigoGeneracion){
        $this->db->select("item,identificador,(select valor from cat014 where codigo=unidadMedida) unidadMedida,descripcion,precioUnitario,cantidad,ventasGravadas subtotal,ivaItem,ivaRetenido,ivaPercibido,observacionesItem,observacionesItems,JSON_EXTRACT(sacosEsp,  '$.Qesp') Qesp,
JSON_EXTRACT(sacosEsp,  '$.sacos') sacos, JSON_EXTRACT(sacosEsp,  '$.contrato') contrato, '' retencionRenta");
		$this->db->where("numeroControl",$numeroControl);
		$this->db->where("codigoGeneracion",$codigoGeneracion);
		$resultados = $this->db->get("Cuerpodocumento");
		return $resultados->result();
	}
    
    public function getImpuestos(){
      
        $this->db->from("tblimpuestosvariables");
        $this->db->order_by('estado','ASC');
        $resultados = $this->db->get();
		return $resultados->result();
	}
    
    
    
    
	public function save($data){
		return $this->db->insert("Cuerpodocumento",$data);
	}

	public function update($num,$cod,$data){
		$this->db->where("numeroControl",$num);
		$this->db->where("codigoGeneracion",$cod);
		return $this->db->update("Cuerpodocumento",$data);
	}

    public function extrasDTE($data){
        return $this->db->insert("tblExtras_DTE",$data);
    }
    
}