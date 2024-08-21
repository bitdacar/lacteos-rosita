<?php
defined('BASEPATH') or exit('No direct script access allowed');

class iniciar_hacienda extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		if (!$this->session->userdata("nombre")) {
			redirect(base_url());
		}
	}

	public function index()
	{
		$datos['titulo'] = 'Ticket Sucursal 1';
		$this->load->view("layouts/header");
		$this->load->view("layouts/aside");
		$this->load->view("dteMH/AutenticaMH", $datos);
		$this->load->view("layouts/footer");
	}
}
