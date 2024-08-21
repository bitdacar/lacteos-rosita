<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Clientes extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		$this->load->model("Cliente_model");
		$this->load->library('pagination');
	}

	public function index()
	{

		$offset = ($this->uri->segment(4)) ? $this->uri->segment(4) : 0;
		$per_page = 15;
		$total_rows = $this->Cliente_model->countClientes();
		$pagination = $this->buildPagination($total_rows, $per_page, $offset);

		$data  = array(
			'clientes' => $this->Cliente_model->getClientes($per_page, $offset),
			'pagination' => $pagination,
		);

		$this->load->view("layouts/header");
		$this->load->view("layouts/aside");
		$this->load->view("admin/clientes/list", $data);
		$this->load->view("layouts/footer");

		$this->load->library('pagination');
	}


	public function buildPagination($total_rows, $per_page = 15, $offset = 0)
	{

		$config['base_url'] = base_url() . 'mantenimiento/clientes/index';
		$config['total_rows'] = $total_rows;
		$config['per_page'] = $per_page;

		$config['num_links'] = 3;
		$config['full_tag_open'] = '<ul class="pagination justify-content-center">';
		$config['full_tag_close'] = '</ul>';
		$config['first_link'] = '<i class="fa fa-angle-double-left"></i>';
		$config['last_link'] = '<i class="fa fa-angle-double-right"></i>';
		$config['first_tag_open'] = '<li class="page-item"><a class="page-link"';
		$config['first_tag_close'] = '</li>';
		$config['prev_link'] = '<i class="fa fa-chevron-left"></i>';
		$config['prev_tag_open'] = '<li class="page-item prev"><a class="page-link"';
		$config['prev_tag_close'] = '</a></li>';
		$config['next_link'] = '<i class="fa fa-angle-right"></i>';
		$config['next_tag_open'] = '<li class="page-item"> <a class="page-link"';
		$config['next_tag_close'] = '</li>';
		$config['last_tag_open'] = '<li class="page-item"><a class="page-link"';
		$config['last_tag_close'] = '</a></li>';
		$config['cur_tag_open'] = '<li class="page-item active"><a class="page-link">';
		$config['cur_tag_close'] = '</a></li>';
		$config['num_tag_open'] = '<li class="page-item"><a class="page-link"';
		$config['num_tag_close'] = '</a></li>';

		$this->pagination->initialize($config);

		return $this->pagination->create_links();
	}


	public function add()
	{

		$this->load->view("layouts/header");
		$this->load->view("layouts/aside");
		$this->load->view("admin/clientes/add");
		$this->load->view("layouts/footer");
	}

	public function store()
	{
		$nombres = $this->input->post("nombres");
		$apellidos = $this->input->post("apellidos");
		$telefono = $this->input->post("telefono");
		$direccion = $this->input->post("direccion");
		$empresa = $this->input->post("sucursal");

		$data  = array(
			'nombre' => $nombres,
			'apellido' => $apellidos,
			'tel_fijo' => $telefono,
			'direccion' => $direccion,
			'sucursal' => $empresa,
			'estado' => "ACT",
		);

		if ($this->Clientes_model->save($data)) {
			redirect(base_url() . "mantenimiento/clientes");
		} else {
			$this->session->set_flashdata("error", "No se pudo guardar la informacion");
			redirect(base_url() . "mantenimiento/clientes/add");
		}
	}

	public function edit($id)
	{
		$data  = array(
			'cliente' => $this->Cliente_model->getCliente($id),
		);
		$this->load->view("layouts/header");
		$this->load->view("layouts/aside");
		$this->load->view("admin/clientes/edit", $data);
		$this->load->view("layouts/footer");
	}

	public function update()
	{
		$idcliente = $this->input->post("idcliente");
		$nombres = $this->input->post("nombres");
		$apellidos = $this->input->post("apellidos");
		$telefono = $this->input->post("telefono");
		$direccion = $this->input->post("direccion");
		$ruc = $this->input->post("ruc");
		$empresa = $this->input->post("empresa");

		$data = array(
			'nombres' => $nombres,
			'apellidos' => $apellidos,
			'telefono' => $telefono,
			'direccion' => $direccion,
			'ruc' => $ruc,
			'empresa' => $empresa,
		);

		if ($this->Clientes_model->update($idcliente, $data)) {
			redirect(base_url() . "mantenimiento/clientes");
		} else {
			$this->session->set_flashdata("error", "No se pudo actualizar la informacion");
			redirect(base_url() . "mantenimiento/clientes/edit/" . $idcliente);
		}
	}

	public function delete($id)
	{
		$data  = array(
			'estado' => "0",
		);
		$this->Clientes_model->update($id, $data);
		echo "mantenimiento/clientes";
	}
}
