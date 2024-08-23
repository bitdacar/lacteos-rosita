<?php
defined( 'BASEPATH' ) OR exit( 'No direct script access allowed' );

class vistas extends CI_Controller {

    public function __construct() {
        parent::__construct();
      
        if (!$this->session->userdata("nombre")) {
            redirect(base_url());
        }
    }

      public function index() {
        $this->session->set_userdata( "dtearea",$this->input->get('Cat')) ;//$this->input->get('Cat');
        if($this->input->get('Cat')=='CF'){
            $texto="Catalogo Ferreteria";
        }else if($this->input->get('Cat')=='CC'){
            $texto="Catalogo Cafe";
        }else if($this->input->get('Cat')=='CO'){
            $texto="Catalogo Consignacion";
        }else{
            $texto="Catalogo Combustible";
        }
        $this->session->set_userdata( "dtearea","CT") ;
        $datos['titulo']=$texto;
        $this->load->view( "layouts/header" );
        $this->load->view( "layouts/aside" );
        
        $this->load->view( "dteMH/Factura",$datos );
        $this->load->view( "dteMH/modalCliente");
        $this->load->view( "dteMH/modalPro");
        
        $this->load->view( "dteMH/envioDte");
        $this->load->view( "layouts/footer" );
    }
    public function Facturatiendas() {
        $this->session->set_userdata( "dtearea","CT") ;
        
        $this->load->view( "layouts/header" );
        $this->load->view( "layouts/aside" );
        
        $this->load->view( "dteMH/Facturatiendas" );
        $this->load->view( "dteMH/modalCliente");
        $this->load->view( "dteMH/modalPro");
        
        $this->load->view( "dteMH/envioDtetienda");
        $this->load->view( "layouts/footer" );
    }

    public function fgas() {
        $this->session->set_userdata( "dtearea","CT") ;//$this->input->get('Cat');
        if($this->input->get('Cat')=='CG'){
            $texto="Catalogo Combustible";
        }
        $datos['titulo']=$texto;
        $this->load->view( "layouts/header" );
        $this->load->view( "layouts/aside" );
        $this->load->view( "dteMH/FacturaGas" ,$datos);
        $this->load->view( "dteMH/envioDte");
        $this->load->view( "layouts/footer" );
    }
    public function fsexe() {
        $this->session->set_userdata( "dtearea","CS") ;
        $this->session->set_userdata( "area","CC") ;
        $this->load->view( "layouts/header" );
        $this->load->view( "layouts/aside" );
        $this->load->view( "dteMH/SujetoEx" );
        $this->load->view( "dteMH/envioDte");
        $this->load->view( "layouts/footer" );
    } 


    public function fcof() {
        $this->session->set_userdata( "dtearea","CT") ;
        $texto="Catalogo Oficina";

        $datos['titulo']=$texto;
        $this->load->view( "layouts/header" );
        $this->load->view( "layouts/aside" );
        $this->load->view( "dteMH/FacturaOficina",$datos);
        $this->load->view( "dteMH/modalPro");
        $this->load->view( "dteMH/envioDte");
        $this->load->view( "layouts/footer" );
    } 
    public function FacturaExp() {
        $this->session->set_userdata( "dtearea","CT") ;
        $this->session->set_userdata( "area","EX") ;

        $texto="fACTURA exportacion";

        $datos['titulo']=$texto;
        $this->load->view( "layouts/header" );
        $this->load->view( "layouts/aside" );
        $this->load->view( "dteMH/FacturaExp",$datos );
        $this->load->view( "dteMH/envioDte");
        $this->load->view( "layouts/footer" );
    }

      public function comrete() {
        $this->session->set_userdata( "dtearea","CT") ;
        $this->load->view( "layouts/header" );
        $this->load->view( "layouts/aside" );
       
        $this->load->view( "dteMH/ComReteV2" );
        $this->load->view( "dteMH/envioDte");
        $this->load->view( "layouts/footer" );
    } 

    public function Notcredit() {

        $this->load->view( "layouts/header" );
        $this->load->view( "layouts/aside" );
        $this->load->view( "dteMH/NotCredit" );
        $this->load->view( "dteMH/modalPro");
        $this->load->view( "dteMH/envioDte");
        $this->load->view( "layouts/footer" );
    } 

       public function NotRemicion() {
        $this->session->set_userdata( "dtearea","CE") ;
        $texto="Nota de Remisión";

        $datos['titulo']=$texto;

        $this->load->view( "layouts/header" );
        $this->load->view( "layouts/aside" );
        $this->load->view( "dteMH/NotRemicion",$datos );
        $this->load->view( "dteMH/envioDte");
        $this->load->view( "layouts/footer" );
    } 

    public function fsep() {
        $this->session->set_userdata( "dtearea","SG") ;


        $this->load->view( "layouts/header" );
        $this->load->view( "layouts/aside" );
        $this->load->view( "dteMH/SujetoExPagos" );
          $this->load->view( "dteMH/modalCliente");
        $this->load->view( "dteMH/envioDte");
        $this->load->view( "layouts/footer" );
    }
    

    public function comprasComp() {
        $this->load->view( "layouts/header" );
        $this->load->view( "layouts/aside" );
        $this->load->view( "dteMH/ComprasComp" );
        $this->load->view( "dteMH/modalPro" );
        $this->load->view( "dteMH/envioDte" );
        $this->load->view( "layouts/footer" );
    }

    public function Contingencia() {

        $this->load->view( "layouts/header" );
        $this->load->view( "layouts/aside" );
        $this->load->view( "dteMH/envioDte");
        $this->load->view( "dteMH/envioContingencia");
        $this->load->view( "layouts/footer" );
    }
    
    public function MenusxUsuario(){
        
        $this->load->view( "layouts/header" );
        $this->load->view( "layouts/aside" );
        $this->load->view( "dteMH/MenusxUsuario" );
         $this->load->view( "layouts/footer" );
    }

    public function ConsultasGen() {

        $this->load->view( "layouts/header" );
        $this->load->view( "layouts/aside" );
        $this->load->view( "dteMH/ConsultasGen" );
        $this->load->view( "layouts/footer" );


    }

    public function AnulacionDte() {

        $this->load->view( "layouts/header" );
        $this->load->view( "layouts/aside" );
        $this->load->view( "dteMH/envioDte");
        $this->load->view( "dteMH/anulacionDte" );

        $this->load->view( "layouts/footer" );

    } 

    
    public function DescargaAnulacion() {

        $this->load->view( "layouts/header" );
        $this->load->view( "layouts/aside" );
        $this->load->view( "dteMH/DescargaAnulacion" );
        $this->load->view( "layouts/footer" );

    }

    public function envioUnoUno() {

        $this->load->view( "layouts/header" );
        $this->load->view( "layouts/aside" );
        $this->load->view( "dteMH/EnvioUnoUno");
        $this->load->view( "dteMH/envioDteIntereses");
        $this->load->view( "layouts/footer" );
    }

    public function ConsultasGenUser() {

        $this->load->view( "layouts/header" );
        $this->load->view( "layouts/aside" );
        $this->load->view( "dteMH/ConsultasGenUser" );
        $this->load->view( "layouts/footer" );

    }
    public function AutenticaMh() {

        $this->load->view( "layouts/header" );
        $this->load->view( "layouts/aside" );
        $this->load->view( "dteMH/AutenticaMH" );
        $this->load->view( "layouts/footer" );

    }   
    public function Ingresosproductos() {

        $this->load->view( "layouts/header" );
        $this->load->view( "layouts/aside" );
        $this->load->view( "dteMH/IngresoProducto" );
        $this->load->view( "dteMH/modalinPro");
        $this->load->view( "layouts/footer" );

    }
    public function Reimpresion() {

        $this->load->view( "layouts/header" );
        $this->load->view( "layouts/aside" );
        $this->load->view( "dteMH/Reimpresion" );
        $this->load->view( "layouts/footer" );

    }

    public function IngresosClientes() {

        $this->load->view( "layouts/header" );
        $this->load->view( "layouts/aside" );
        $this->load->view( "dteMH/IngresoClientes" );
        $this->load->view( "layouts/footer" );

    }
}