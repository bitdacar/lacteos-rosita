<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Auth extends CI_Controller {

	public function __construct(){
		parent::__construct();
		$this->load->model("Usuarios_model");
		 $this->load->model( "mhdte/identificacion_model" );
		 $this->load->library('Uuid');
	}
	public function index()
	{


		if ($this->session->userdata("login")) {

			
			redirect(base_url()."dashboard");
		}
		else{
			$this->load->view("admin/login");
		}
		

	}

	public function login(){
		$username = $this->input->post("username");
		$password = $this->input->post("password");
		$codigoGeneracion = strtoupper($this->uuid->v4());
$vista='';
		$res = $this->Usuarios_model->login($username, sha1($password),$codigoGeneracion);

		if (!$res) {
			$this->session->set_flashdata("error","El usuario y/o contraseña son incorrectos");
			redirect(base_url());
		}
		else{
			$data  = array(
				'id' => $res->cUsuario, 
				'nombre' => $res->cNombre,
				'uname' => $res->cUname,
				'estatus' => $res->cEstatus,
				'areafact' => $res->areafact,
                'codestab'=> $res->codestab,
				'tienda'=> $res->tienda,
				'tipuser'=> $res->tipuser,
				'vista'=> $res->vista,
				'login' =>true,
				'tokenlogin'=>$codigoGeneracion
			);

		
            //$tipoIdentificacion=$this->identificacion_model->TipoTrabajo("act");
       
             $dataMH  = array(
				'urlRecepcion' => 'https://apitest.dtes.mh.gob.sv/fesv/recepciondte', 
				
				//'urlFirma' => 'http://192.168.1.15:8113/firmardocumento/',
				'urlFirma' => 'http://192.168.1.16:8113/firmardocumento/',                
				'urlAnula' => 'https://apitest.dtes.mh.gob.sv/fesv/anulardte',
				'urlConti' => 'https://apitest.dtes.mh.gob.sv/fesv/contingencia',
				'urlLote' =>  'https://apitest.dtes.mh.gob.sv/fesv/recepcionlote',
				'token' => '',
				'palabra' => $res->palabrafirma,//'contacuzcaDet23*',
				'nit' => '02033110660019',
				'ambiente' => '00',
                'NomDemo' => $res->nomComercial,//'COOPERATIVA CUZCACHAPA DE R.L',
				'autenticamh'=>$res->autenticamh,
				'dtearea'=>''
								
			);
			$this->session->set_userdata($data);
			$this->session->set_userdata($dataMH);
			redirect(base_url()."dashboard");
		}
	}

	public function logout(){
		$this->session->sess_destroy();
		redirect(base_url());
	}
}
