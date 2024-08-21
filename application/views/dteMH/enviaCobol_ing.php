
<!-- =============================================== -->

<!-- Content Wrapper. Contains page content -->

<div class="right_col" role="main">
    <!-- top tiles -->

    <!-- /top tiles -->


    <!-- form input mask -->
    <div class="row">
        <div class="col-md-12 col-sm-12  ">
            <div class="x_panel">
                <div class="x_title">
  <h2>La carga de los DTE son los Recepcionados por Hacienda..!aaa</h2>
                    <ul class="nav navbar-right panel_toolbox">
                        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                        </li>
                        <li><a class="close-link"><i class="fa fa-close"></i></a>
                        </li>
                    </ul>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  

                    <br>
                    <form class="form-horizontal form-label-left" id="consultalsto">
                        <div class="row">
                            <div class="col-md-3 col-sm-3  form-group has-feedback">
                                <label>DESDE</label><br>
                                <input type="date" id="fini" class="form-control-sm col-md-8"  >


                            </div> 
                            <div class="col-md-3 col-sm-3  form-group has-feedback">

                                <label>HASTA</label><br>
                                <input type="date" id="ffin" class="form-control-sm col-md-8"  >

                            </div>

                            <div class="col-md-4 col-sm-4  form-group has-feedback">
                                <label>Identificacion de Descarga a COBOL</label>
                                <input type="text" id="codigoIntereses" class="form-control-sm col-md-12" readonly >

                            </div>
                            <div class="col-md-2 col-sm-2  form-group has-feedback">
                                <br>
                                <button type="submit" class="btn btn-success ">Crear Archivo</button>
                            </div>
                        </div>
                        <div class="ln_solid"></div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- /form input mask -->


    <div class="row">

        <div class="x_content">
            <table id="example" class="table table-striped table-bordered" style="width:100%">
                <thead>
                    <tr>

                        <th>Num. control</th>

                        <th>Cod. DTE</th>

                        <th>Valor $</th>
                        <th>Fecha</th>

                    </tr>
                </thead>


                <tbody>



                </tbody>
                <tfoot align="right">
                    <tr>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>

                    </tr>
                </tfoot>
            </table>



        </div>
    </div>

</div>


<script>

    $(document).ready(function() {
        // partidasContables('');
        tableDetalle = $('#example').DataTable({

            scrollY: '40vh',
            scrollCollapse: true,
            paging: false,
            searching: true,


        });


    });


    function llenarTabla(datos_tabla_new) {
        // datos_tabla_new = JSON.parse(datos_tabla_new);
        console.log(datos_tabla_new);
        tableDetalle = $('#example').DataTable({
            "processing": true,
            "destroy": true,
            paging: false,
            scrollY: '40vh',
            scrollCollapse: true,

            searching: true,
            "data": datos_tabla_new,
            "columns": [

                {
                    data: "numeroControl"
                },
                {
                    data: "codigoGeneracion",

                },
                {
                    data: "valor",

                },
                {
                    data: "interno",

                }
            ],
        });

    }

    $('#consultalsto').submit(function() {

        var Datos = {
            "fini":$('#fini').val(),
            "ffin":$('#ffin').val(),
            "fechatxt":$('#fecha').val()          
        };
        mensaje('Envio a Cobol', 'Generando Archivo TXT...!', 'success');
        var url = "<?php echo base_url("mhdte/Integracion/archivotxt");?>";

        $.ajax({
            type: "POST",
            url: url,
            data: Datos,

            success: function(data) {
                respuesta = JSON.parse(data);

                console.log(respuesta);
                llenarTabla(respuesta.tabla);
                $('#codigoIntereses').val(respuesta.codigo);
                partidasContables();
                imprimir(respuesta.codigo)

            },
            error: function(jqXHR, textStatus, errorThrown) {

            }
        });

        return false;


    });

    function partidasContables(){
        var Datos = {
            "fechatxt":$('#fecha').val(),

        };
        mensaje('Partida Contable', 'Generando archivo Partidas Contables TXT...!', 'info');
        var url = "<?php echo base_url("mhdte/Integracion/partidaContable");?>";

        $.ajax({
            type: "POST",
            url: url,
            data: Datos,

            success: function(data) {
                respuesta = JSON.parse(data);

                console.log(respuesta);
                //llenarTabla(respuesta.tabla);
                //$('#codigoIntereses').val(respuesta.codigo);


            },
            error: function(jqXHR, textStatus, errorThrown) {

            }
        });


    }
    function imprimir(item) {

        url = '<?=base_url()?>reportes/RepEvCobol/RepEvCobol';

        $.ajax({
            type: 'POST',
            url: url,
            xhrFields: {
                responseType: 'blob'
            },
            data: {
                ajax: true,
                numeroControl: item,
                codigoGeneracion: item,
                 "fini":$('#fini').val(),
            "ffin":$('#ffin').val(),
            },
            success: function(json) {
                var blob = new Blob([json], {
                    type: 'application/pdf'
                });
                var URL = window.URL || window.webkitURL;
                //Creamos objeto URL
                var downloadUrl = URL.createObjectURL(blob);
                //Abrir en una nueva pestaña
                window.open(downloadUrl);
            },
            error: function() {
                console.log("Error");
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

<!-- /.content-wrapper -->
