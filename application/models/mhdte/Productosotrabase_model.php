<?php
defined( 'BASEPATH' ) OR exit( 'No direct script access allowed' );

class Productosotrabase_model extends CI_Model {

    public function listaProductos() {
       
   //     $this->db = $this->load->database('default2', TRUE);
       
$this->db->select("*");
$this->db->from("tblprodcat");
$resultados = $this->db->get();
return $resultados->result();

    }

}