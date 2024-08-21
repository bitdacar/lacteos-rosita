<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Usuariosgenerales_model extends CI_Model {

	 /* ingreso de usuarios */

     public function ingresoUsuarios( $nombre, $password, $uname,$estado,$busqueda,$tienda ) {

        $data  = array(
            'cNombre' => $nombre,
            'cClave' =>sha1( $password ),
            'cUname' =>$uname,
            'cEstatus' => $estado,
            'tienda' => $tienda,
            'areafact' => 'CC',
        );

        $this->db->where( 'cUname', $uname );

        $q = $this->db->get( 'tblusuario' );

        if ( $q->num_rows() > 0 )  {
           
            if($busqueda){
                 $this->db->where( "cUname", $uname );
				 $this->db->update( 'tblusuario', $data ) ;
                 return    $dataR  = array(
                'cNombre' => $uname,
                'tipo' => true,
                'respuesta' =>"Usuario Actualizado"
            );
            }else{
                 return    $dataR  = array(
                'cNombre' => $uname,
                'tipo' => false,
                'respuesta' =>"Usuario Repetido"
            );
            }
           
            
        } else {

            if ( $this->db->insert( 'tblusuario', $data ) ) {
                return    $dataR  = array(
                    'cNombre' => $uname,
                    'tipo' => true,
                    'respuesta' =>"Usuario ingresado"
                );
            }

        }
    }

    public function BuscarUsuarios( $uname ) {

        $query = " select * from tblusuario i where 
         cUname ='".$uname."'";
        $resultados = $this->db->query( $query );
        return $resultados->result();
    } 
    
   
    public function ingresotblcxvendedor($data){
        $this->db->insert( 'tblcxvendedor', $data );
    }
}