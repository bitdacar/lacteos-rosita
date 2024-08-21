<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Dashboard extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model("Usuarios_model");
        $this->load->model('mhdte/Serviciosgenerales_model');
    }
    public function index()
    {

        if ($this->session->userdata("login")) {

            $res = $this->Usuarios_model->loginVer($this->session->userdata("tokenlogin"));

            if ($res) {
                $datos['menu'] = $this->MenusxUsuario();
                $datosEstab['datosEstab'] = $this->codestabSelect();
                $this->load->view("layouts/header");
                $this->load->view("layouts/aside", $datos);

                $this->load->view("admin/" . $this->session->userdata("vista"), $datosEstab);


                $this->load->view("layouts/footer");
            } else {
                $this->session->sess_destroy();
                redirect(base_url());
            }

        } else {
            $this->session->sess_destroy();
            redirect(base_url());
        }




    }

    public function MenusxUsuario()
    {
        $usuario = $this->session->userdata("uname");

        $menus = $this->Serviciosgenerales_model->MenusxUsuario($usuario);
        $Submenus = $this->Serviciosgenerales_model->subMenusxUsuario($usuario);

        $html = '<nav class="mt-2"><ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">';

        for ($i = 0; $i < count($menus); $i++) {

            $html = $html . ' <li class="nav-item">';

            $html = $html . '<a  href="#" class="nav-link"><i class="fa ' . $menus[$i]->icono . '"></i><p> ' . $menus[$i]->nombre . '<i class="fas fa-angle-left right"></i>	</p></a>';
            $html = $html . '  <ul class="nav nav-treeview" >';
            for ($j = 0; $j < count($Submenus); $j++) {
                if ($menus[$i]->tipoDte == $Submenus[$j]->id_menuPrin) {
                    $html = $html . ' <li class="nav-item"><a class="nav-link" href="' . base_url() . '' . $Submenus[$j]->url . '">' . $Submenus[$j]->Nombre . '</a></li>';
                }

            }
            $html = $html . '</ul>';
            $html = $html . ' </li>';

        }
        $html = $html . ' </ul> </nav>';
        $this->session->set_userdata("menu", $html);//$this->input->get('Cat');

        return $html;


    }


    public function codestabSelect()
    {


        $codestabs = $this->Serviciosgenerales_model->codestab();

        $html = '';
        for ($i = 0; $i < count($codestabs); $i++) {
            $estab = "'" . $codestabs[$i]->codestab . "'";
            $html = $html . '
                <div class="col-md-4">

<div class="card card-widget widget-user">

<div class="widget-user-header bg-info">
<h3 class="widget-user-username">' . $codestabs[$i]->nombre . ' </h3>
</div>
<div class="widget-user-image">
<a href="#" onclick="codestab(' . $estab . ')"><img class="img-circle elevation-2" src="' . base_url() . 'assets/build/images/' . $codestabs[$i]->icono . '.jpg"  
width="100" height="100" alt="User Avatar"></a>
</div>
<div class="card-footer">
<div class="row">



</div>

</div>
</div>

</div>';
        }


        return $html;



    }

    public function cambioEstab()
    {
        $codigoEstab = $this->input->post("codestab");
        sleep(2);
      
        $data  = array(
            'ok' =>   $this->session->set_userdata("codestab", $codigoEstab),
            'nuevastab'=>$this->session->userdata("codestab")
        );
        echo json_encode($data);
    }
}