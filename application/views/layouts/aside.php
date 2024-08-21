<body class="hold-transition sidebar-mini">
<div class="wrapper">
	
    
     <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
     <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
      
    </ul>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
      <!-- Navbar Search -->
    

      <!-- Messages Dropdown Menu -->
      <li class="nav-item dropdown">
        <a class="nav-link" data-toggle="dropdown" href="#">
          <i class="far fa-user"></i>
          <span class="badge badge-danger navbar-badge"></span>
        </a>
        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
          <a href="<?php echo base_url(); ?>auth/logout" class="dropdown-item">
            <!-- Message Start -->
            <div class="media">
             
              <div class="media-body">
                <h3 class="dropdown-item-title">
                 Cerrar Sesion
                  <span class="float-right text-sm text-danger"><i class="fas fa-sign-out-alt"></i></span>
                </h3>
              
              </div>
            </div>
            <!-- Message End -->
          </a>
          <div class="dropdown-divider"></div>
    
          <div class="dropdown-divider"></div>
      
          <div class="dropdown-divider"></div>
        
        </div>
      </li>
      <!-- Notifications Dropdown Menu -->
      
      <li class="nav-item">
        <a class="nav-link" data-widget="fullscreen" href="#" role="button">
          <i class="fas fa-expand-arrows-alt"></i>
        </a>
      </li>
         </ul>
  </nav>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="<?php echo base_url(); ?>dashboard" class="brand-link">
   	<img src="<?php echo base_url(); ?>assets/build/images/favico.png" alt="Natural" class="brand-image img-circle elevation-3" style="opacity: .8">
			<span class="brand-text font-weight-light">Lacteos Rosita</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
         
        </div>
        <div class="info">
       <a href="#" class="d-block"><?php echo $this->session->userdata("nombre")." ".$this->session->userdata("codestab");?></a>
        </div>
      </div>

      <!-- SidebarSearch Form -->
     

      <!-- Sidebar Menu -->
      <?php echo $this->session->userdata("menu")?>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>
