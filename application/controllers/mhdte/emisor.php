<?php
defined( 'BASEPATH' ) OR exit( 'No direct script access allowed' );

class emisor extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model( "mhdte/emisor_model" );

    }

   
}