
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
                    <h2>La carga documentos a enviar a Hacienda</h2>
                    <ul class="nav navbar-right panel_toolbox">
                        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                        </li>
                        <li><a class="close-link"><i class="fa fa-close"></i></a>
                        </li>
                    </ul>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">


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

                        <th>Serie</th>
                        <th>Numnero</th>
                        <th>Fecha Doc</th>
                        <th>Tipo Doc</th>
                        <th>Cliente</th>
                        <th></th>
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
                        <th></th>
                        <th></th>
                    </tr>
                </tfoot>
            </table>



        </div>
    </div>

</div>


<script>
    var numeroControl='';
    var codigoGeneracion='';
    var recepcionmh='';
    $(document).ready(function() {
        // llenarTabla(codigoGeneracion,'7D0D4B57-A121-4E2D-AE3F-7552A3AC5A45');
        tableDetalle = $('#example').DataTable({

            scrollY: '40vh',
            scrollCollapse: true,
            paging: false,
            searching: true,


        });


    });


   
    $('#consultalsto').submit(function() {

        var Datos = {
            "fini":$('#fini').val(),
            "ffin":$('#ffin').val(),

        };
        $("#cargainteres").prop( "disabled", true );

        mensaje('success', 'DOCUMENTOS EN PROCESO DE GENERACION', 'success');

        var url = "<?php echo base_url("mhdte/Integracion/leerArchivo");?>";
        $.ajax({
            type: "POST",
            url: url,
            data: Datos,

            success: function(data) {
                respuesta = JSON.parse(data);
                console.log(respuesta);
                llenadoTabla(respuesta)
                /*  $('#codigoIntereses').val(respuesta.codigoGeneracion);
                llenarTabla(respuesta.ok,respuesta.codigoGeneracion);
                contar=respuesta.ok.length
                espera=(contar*8/60);*/
                // mensaje('success', 'Documentos Se estan enviando..! ESPERE Aprox '+espera+' min', 'success');
            },
            error: function(jqXHR, textStatus, errorThrown) {

            }
        });

        return false;


    });

    function enviar(codigoGeneracion,numeroControl){

        var Datos = {
            "codigoGeneracion":codigoGeneracion,
            "numeroControl":numeroControl,

        };

        var url = "<?php echo base_url("mhdte/Integracion/envioDespensaFac");?>";
        $.ajax({
            type: "POST",
            url: url,
            data: Datos,

            success: function(data) {
                respuesta = JSON.parse(data);
                
              
                
               
                enviarDte(respuesta.codigoGeneracion,respuesta.numeroControl);

            },
            error: function(jqXHR, textStatus, errorThrown) {

            }
        });

           
    }

    function llenadoTabla(respuesta){

        tableDetalle = $('#example').DataTable({
            "processing": true,
            "destroy": true,
            paging: false,
            scrollY: '40vh',
            scrollCollapse: true,

            searching: true,
            "data": respuesta,
            "columns": [

                {
                    data: "seriefac"
                },
                {
                    data: "numdoc",

                },
                {
                    data: "fecmov",

                },
                {
                    data: "tipdoc",

                },{
                    data: "codcli",

                },
                {
                    "data": null,
                    "mRender": function(data, type, value) {

                        cod="'"+value["seriefac"] +"'";
                        num="'"+value["numdoc"] +"'";

                        return '<a class="btn" href="#" onclick="enviar(' +  cod+ ',' +  num+ ')"><i class="fa fa-save"></i></a>'
                    },
                }
            ],
        });

    }

    function imprimir(codigoGeneracion,numeroControl) {
        if ($('#tipodocSelect').val() == "store") {
            url = '<?=base_url()?>reportes/facCons/facCons';

        } else {

            url = '<?=base_url()?>reportes/CcFe/CcFe';
        }
        alert(codigoGeneracion+' ---- '+numeroControl);
        $.ajax({
            type: 'POST',
            url: url,
            xhrFields: {
                responseType: 'blob'
            },
            data: {
                ajax: true,
                numeroControl: numeroControl,
                codigoGeneracion: codigoGeneracion,
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
</script>

<!-- /.content-wrapper -->
