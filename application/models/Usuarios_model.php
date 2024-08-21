<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Usuarios_model extends CI_Model
{

	public function login($username, $password,$control)
	{
		$query = "select * from tblusuario t 
				join emisor e on t.codestab =e.codestab where cUname='" . $username . "' and 
				cClave='" . $password . "'  ";
		$resultados = $this->db->query($query);
		// return $resultados->result();

		if ($resultados->num_rows() > 0) {

			//ingreso token de sesion para ser verificado posterior

			$controlup = array(
				'sesion' => $control,
				);
			
			$this->db->where("cUname",$username);
			$update= $this->db->update("tblusuario",$controlup);

			return $resultados->row();
		} else {
			return false;
		}
	}

	public function loginVer($verificacion){
		$query = "select * from tblusuario where sesion='" . $verificacion . "'";
$resultados = $this->db->query($query);
// return $resultados->result();

if ($resultados->num_rows() > 0) {
	return true;
} else {
	return false;
}

		
	}
}