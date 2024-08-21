  <!-- Content Wrapper. Contains page content -->
  <!-- Preloader -->
  <div class="preloader flex-column justify-content-center align-items-center">
  	<img src="<?php echo base_url(); ?>assets/template/favico.png" alt="Rosita" height="60" width="60">
  </div>

  <div class="content-wrapper">
  	<!-- Main content -->
  	<section class="content">
  		<div class="container-fluid">
  			<!-- Small boxes (Stat box) -->
  			<div class="row">
				
			  <?php echo $datosEstab;?>
  				<!-- ./col -->
  			</div>
  			<!-- /.row -->
  			<!-- Main row -->
  			<div class="row">


  			</div>
  			<!-- /.row (main row) -->
  		</div><!-- /.container-fluid -->
  	</section>
  	<!-- /.content -->
  </div>
<script>


function codestab(codestab){

var Datos = {
        "codestab": codestab,
        };

    var url = "<?php echo base_url("Dashboard/cambioEstab");?>";
    $.ajax({
        type: "POST",
        url: url,
        data: Datos,
        success: function(data) {
            respuesta=JSON.parse(data);
            if (!respuesta.ok) {

                mensaje('informacion', 'CAMBIO CORRECTO '+respuesta.nuevastab, '');
                
            } else {
                mensaje('error', data, 'error');
            }

        }
    });



}

	function mensaje(t, txt, stilo) {

new PNotify({
	title: t,
	text: txt,
	type: stilo,
	styling: 'bootstrap3'
});
}
</script>