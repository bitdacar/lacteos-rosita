<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class receptor_model extends CI_Model {

    public function getreceptor($num,$cod){
        $area = $this->session->userdata( "area");
        $this->db->select("p.*, c.*");
        $this->db->from("receptordocumen c");
        $this->db->join("receptor p"," p.codigo =c.idReceptor ", 'left');
        $this->db->where("c.numeroControl",$num);
        $this->db->where("c.codigoGeneracion",$cod);
        if($area=="EX"){
            $this->db->where("p.area",$area);
        }else {
            $this->db->where_not_in( "p.area", "EX" );
        }

        $resultados = $this->db->get();
        return $resultados->result();
    } 
    public function getreceptorMes($num,$cod){
        $area = $this->session->userdata( "areafact");
        $this->db->select("r.idReceptor ,IFNULL(r2.codigo,'') codigo,IFNULL(r2.NomDenominacion,' ') NomDenominacion,IFNULL(r2.tipDoc,' ') tipDoc ,
IFNULL(r2.numDoc,' ') numDoc ,IFNULL(r2.nit,' ') nit ,IFNULL(r2.telReceptor,' ') telReceptor ,
IFNULL(r2.correoReceptor,' ') correoReceptor ,IFNULL(r2.dirComplemento,' ') dirComplemento");
        $this->db->from("receptordocumen r");
        $this->db->join("receptor r2"," r2.codigo =r.idReceptor ", 'left');
        $this->db->where("r.numeroControl",$num);
        $this->db->where("r.codigoGeneracion",$cod);
        if($area=="EX"){
            $this->db->where("r2.area",$area);
        }else {
            $this->db->where_not_in( "r2.area", "EX" );
        }

        $resultados = $this->db->get();
        return $resultados->result();
    }
    public function getdatosReceptor($num,$cod){
        $this->db->where("id",$id);
        $resultado = $this->db->get("receptor");
        return $resultado->row();
    }


    public function save($data){
        return $this->db->insert("receptor",$data);
    }

    public function update($id,$data){
        $this->db->where("id",$id);
        return $this->db->update("receptor",$data);
    }
    public function listareceptor($estado,$area){
        //$this->db->where("codigo",$estado);
        $this->db->like('codigo', $estado, 'after'); 
        if($area=="EX"){
            $this->db->where( "area", $area );
        }else {
            $this->db->where_not_in( "area", "EX" );
        }

        $resultados = $this->db->get("receptor");
        return $resultados->result();
    }  
    
    public function listareceptorCompras($estado,$area){
        //$this->db->where("codigo",$estado);
        $this->db->like('ncr', $estado, 'after'); 
       

        $resultados = $this->db->get("receptor");
        return $resultados->result();
    }


    public function getMH($num,$cod){
        
        $query="select * from bitacorafactura  b 
where b.codigoGeneracion ='".$cod."' and b.estado =(select t.BusquedaRep  from tipotrabajo t where t.estado='act')";

        $resultados = $this->db->query( $query );
        return $resultados->result();
      
       

    } 
    public function updateReporte  ($num,$cod,$nomRep){
        $this->db->where("numeroControl",$num);
        $this->db->where("codigoGeneracion",$cod);
        $resultado = $this->db->update("receptordocumen",$nomRep);
        return $this->db->affected_rows();

    } 
}