
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
                    <h2>La carga documentos a pagar por pago de interes Fin de Mes</h2>
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

                        <div class="form-group row">
                            <div class="col-md-4 col-sm-4  form-group has-feedback">
                                <label>Codigo de Identificacion de Intereses</label>
                                <input type="text" id="codigoIntereses" class="form-control-sm col-md-12" readonly >

                            </div>
                            <div class="col-md-3 col-sm-3  form-group has-feedback">
                                <br>
                                <button type="submit" class="btn btn-success " id="cargainteres">cargar Archivo</button>
                            </div>
                            <div class="col-md-3 col-sm-3  form-group has-feedback">
                            <br>
                            <input type="button" id="actualizatabla" onclick="actualizaTabla()" value="Generar TXT y actualizar tabla" class="btn btn-success" >
                            <label>Son <span id="cantidadconteo"></span> Documentos</label>
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
                        <th>control cobol</th>
                        <th>Valor</th>
                        <th>Sello</th>

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


    function llenarTabla(datos_tabla_new,codigoGeneracionIT) {

        var ultimo=datos_tabla_new.length;
        //mensaje('Generando Archivo a Cobol', 'Se Generara El archivo Actualizado para Cobol son '+ultimo+'Documentos', 'info');
        $('#cantidadconteo').html(ultimo) ;
        for (var i = 0; i <datos_tabla_new.length; i++) (function(t) {
            var rowNum = i;
            var listVal = rowNum;
            var  codigoGeneracion=datos_tabla_new[i].codigoGeneracion;
            var  numeroControl=datos_tabla_new[i].numeroControl;
            var  interno=datos_tabla_new[i].interno;
            var  valor=datos_tabla_new[i].valor;

            //agrega al DOM una fila con el titulo de la canción (title), artista (artist) y un número (listVal)
            setTimeout(function() {
                console.log(codigoGeneracion+' ++++ '+numeroControl);
                tableDetalle.row.add( [
                    numeroControl,

                    codigoGeneracion,interno,valor,'En ESPERA'

                ] ).draw( false );  
                enviarDte(codigoGeneracion,numeroControl);
            }, t*2500)

        }(i))


    }

    function actualizaTabla(){


        mensaje('Generando Archivo a Cobol', 'Se Generara El archivo Actualizado para Cobol', 'info');

        var Datos = {
            "codigoGeneracion": $('#codigoIntereses').val()

        };


        var url = "<?php echo base_url("mhdte/Integracion/verificacionInteres");?>";
        $.ajax({
            type: "POST",
            url: url,
            data: Datos,

            success: function(data) {
                respuesta = JSON.parse(data);

                console.log(respuesta);

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
                            data: "numeroControl"
                        },
                        {
                            data: "codigoGeneracion",

                        },
                        {
                            data: "interno",

                        },
                        {
                            data: "valor",

                        },{
                            data: "recepcionmh",

                        }
                    ],
                });


            },
            error: function(jqXHR, textStatus, errorThrown) {

            }
        });
    }

    $('#consultalsto').submit(function() {

        var Datos = {
            "fechatxt":$('#fecha').val(),

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
                $('#codigoIntereses').val(respuesta.codigoGeneracion);
                llenarTabla(respuesta.ok,respuesta.codigoGeneracion);
                contar=respuesta.ok.length
                espera=(contar*8/60);
                mensaje('success', 'Documentos Se estan enviando..! ESPERE Aprox '+espera+' min', 'success');
            },
            error: function(jqXHR, textStatus, errorThrown) {

            }
        });

        return false;


    });




</script>

<!-- /.content-wrapper -->
