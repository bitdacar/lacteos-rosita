<?php
defined( 'BASEPATH' ) OR exit( 'No direct script access allowed' );

class Productos_model extends CI_Model {

    public function listaProductos( $area, $estado,$tienda ) {
        // $this->db->like( 'codigo', $estado, 'after' );

        $this->db->from( "productos" );
        $this->db->like( 'codigo', $estado, 'after' );
        $this->db->where( "codCobol", $area );
        $this->db->where( "tienda", $tienda );
        $this->db->where( "dtearea", $this->session->userdata("dtearea") );
        $this->db->where( "estado", "ACT" );

        $resultados = $this->db->get();
        return $resultados->result();
    }

    public function listaServicioGen($area, $estado ,$tienda) {
        $this->db->from( "productos" );
        $this->db->like( 'codigo', $estado,'after' );
        $this->db->where( "codCobol", $area );
        $this->db->where( "tienda", $tienda );
        $resultados = $this->db->get();
        return $resultados->result();
       
    }  
    
    public function listaServicioGen2($area, $estado ) {
        /*$this->db->from( "Productos" );
        $this->db->like( 'codigo', $estado,'after' );
        $this->db->where( "area", $area );
        $resultados = $this->db->get();
        return $resultados->result();*/
        
        $query="select * from productos where codigo like '".$estado."%' and (area = '".$area."')";
        // colocar de identificacion aquellos dn estado '2' cuandoya ha sido enviado a conta
        //c.codigoGeneracion='".$fecha."')";

        $resultados = $this->db->query( $query );
        return $resultados->result();
    }

    public function item153() {
        $this->db->from( "cat016" );
        $resultados = $this->db->get();
        return $resultados->result();
    }

    public function item154() {
        $this->db->from( "cat017" );
        $resultados = $this->db->get();
        return $resultados->result();
    }
    public function item83() {
        $this->db->from( "cat014" );
        $resultados = $this->db->get();
        return $resultados->result();
    } 
    public function regFiscal() {
        $this->db->from( "cat027" );
        $resultados = $this->db->get();
        return $resultados->result();
    }

  /* ingresos productos*/
    
    
  public function ingresoProducto( $uname,$codestab,$tienda,$busqueda,$data ) {

   

    $this->db->where( 'codigo', $uname );
    $this->db->where( 'codCobol', $codestab);
    $this->db->where( 'tienda', $tienda);

    $q = $this->db->get( 'productos' );

    if ( $q->num_rows() > 0 )  {
       
        if($busqueda){
             $this->db->where( "codigo", $uname );
             $this->db->update( 'productos', $data ) ;
             return    $dataR  = array(
            'cNombre' => $uname,
            'tipo' => true,
            'respuesta' =>"Producto Actualizado"
        );
        }else{
             return    $dataR  = array(
            'cNombre' => $uname,
            'tipo' => false,
            'respuesta' =>"Producto Repetido"
        );
        }
       
        
    } else {

        if ( $this->db->insert( 'productos', $data ) ) {
            return    $dataR  = array(
                'cNombre' => $uname,
                'tipo' => true,
                'respuesta' =>"Producto Ingresado"
            );
        }

    }
}
    public function BuscarProductos( $uname ) {

    $query = " select * from productos i where 
     codigo ='".$uname."'";
    $resultados = $this->db->query( $query );
    return $resultados->result();
} 

public function listarproducto($tienda,$codestab ) {

    $query = " select * from productos i where 
     tienda ='".$tienda."' and codCobol ='".$codestab."'";
    $resultados = $this->db->query( $query );
    return $resultados->result();
} 

}