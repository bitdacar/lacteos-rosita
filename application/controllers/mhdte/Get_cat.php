<?php
defined( 'BASEPATH' ) OR exit( 'No direct script access allowed' );

class Get_cat extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model( "mhdte/Get_cat_model" );
         $this->load->model( "mhdte/Serviciosgenerales_model" );

    }

    public function index() {
        $data  = array(
            'productos' => $this->Productos_model->getProductos(),
        );
        $this->load->view( "layouts/header" );
        $this->load->view( "layouts/aside" );
        $this->load->view( "admin/productos/list", $data );
        $this->load->view( "layouts/footer" );

    }

    public function getCat002() {
        $response = $this->Get_cat_model->getCat002();
        echo  json_encode($response); 
       
    }

    public function getCat024() {
        $response = $this->Get_cat_model->getCat024();
        echo  json_encode($response); 
       
    }
    
    public function getCat003() {
        $data = array(
            "categorias" => $this->Get_cat_model->getCat003()
        );
       
    }
    public function getCat004() {
        $data = array(
            "categorias" => $this->Get_cat_model->getCat004()
        );
       
    }
    public function getCat005() {
         $response=$this->Get_cat_model->getCat005();
 echo  json_encode($response); 
       
    }
    public function getCat006() {
        $data = array(
            "categorias" => $this->Get_cat_model->getCat006()
        );
       
    }
    public function getCat007() {
        $data = array(
            "categorias" => $this->Get_cat_model->getCat007()
        );
       
    }
    public function getCat008() {
        $data = array(
            "categorias" => $this->Get_cat_model->getCat008()
        );
       
    }
   public function getCat009() {
        $data = array(
            "categorias" => $this->Get_cat_model->getCat009()
        );
       
    }
   public function getCat0010() {
        $data = array(
            "categorias" => $this->Get_cat_model->getCat0010()
        );
       
    }
   public function getCat0011() {
        $data = array(
            "categorias" => $this->Get_cat_model->getCat0011()
        );
       
    }
   public function getCat0012() {
        $data = array(
            "categorias" => $this->Get_cat_model->getCat0012()
        );
       
    }

    public function getCat019() {
    
        $estado=$this->input->post( "codigo" );
        echo  json_encode($this->Get_cat_model->getCat019($estado)); 
    }

 public function getEstablecimientos() {
    $response = $this->Serviciosgenerales_model->codestab();
    
    if($this->session->userdata("tipuser")!="admin"){
       
      for($i=0;$i<count($response);$i++){
        if($response[$i]->codestab == $this->session->userdata("codestab")){
            $data[0] = array(
                "codestab" => $response[$i]->codestab ,
                "nombre" => $response[$i]->nombre,
            );
            $response =  $data;
        }
    
}

       
    }
   
    echo  json_encode($response); 
      
       
    }


}