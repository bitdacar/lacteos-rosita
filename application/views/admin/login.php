<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Lacteos Rosita | Log in</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  
  <!-- base_url() = http://localhost/ventas_ci/-->

  <!-- Bootstrap 3.3.7 -->
    <link href="<?php echo base_url();?>assets/template/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
   <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="<?php echo base_url();?>assets/plugins/fontawesome-free/css/all.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="<?php echo base_url();?>assets/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<?php echo base_url();?>assets/dist/css/adminlte.min.css">
</head>


<body class="hold-transition login-page">
<div class="login-box">
  <!-- /.login-logo -->
  <div class="card card-outline card-primary">
    <div class="card-header text-center">
      <span class="h1"><b>Ingreso al Sistema</b></span>
    </div>
    <div class="card-body">
     
      <form action="<?php echo base_url();?>auth/login" method="post">
        <div class="input-group mb-3">
          <input type="text" class="form-control"  placeholder="Usuario" name="username" required>
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-user"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="password" class="form-control" placeholder="Password" name="password" required>
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        <div class="row">
       
          <!-- /.col -->
          <div class="col-12">
            <button type="submit" class="btn btn-primary btn-block">Ingresar</button>
          </div>
          <!-- /.col -->
        </div>
      </form>

   
      <!-- /.social-auth-links -->
<p class="mb-1">
       <h1 class="text-center"> VENTA DE LACTEOS ROSITA </h1>
     
      <p class="mb-0">
         © 2024 All Rights Reserved
      </p>
    
    </div>
    <!-- /.card-body -->
  </div>
  <!-- /.card -->
</div>
    
  </body>
</html>
