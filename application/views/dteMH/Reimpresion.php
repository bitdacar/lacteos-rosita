<!-- =============================================== -->

<!-- Content Wrapper. Contains page content -->

<div class="content-wrapper">
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <!-- form input mask -->
                    <div class="card card-warning">
                        <div class="card-header">
                            <h3 class="card-title">Reimpresion de DTE</h3>
                        </div>

                        <div class="card-body">

                            <form class="form-horizontal form-label-left" id="consultalsto">

                                <div class="form-group row">

                                </div>
                                <div class="form-group row">
                                    <div class="col-md-3">
                                        <label>DESDE</label><br>
                                        <input type="date" id="fini" class="form-control-sm col-md-8">


                                    </div>
                                    <div class="col-md-3">

                                        <label>HASTA</label><br>
                                        <input type="date" id="ffin" class="form-control-sm col-md-8">

                                    </div>

                                    <div class="col-md-3">
                                        <br>
                                        <button type="submit" class="btn btn-success" id="cargaReimpresion">Vista
                                            Previa</button>
                                        <input type="hidden" id="area" value="N">

                                    </div>
                                </div>

                                <div class="ln_solid"></div>

                            </form>

                            <div class="row">
                                <div class="col-md-12">
                                <div class="x_content">
                                    <table id="tbAnulados"
                                        class="table table-striped table-bordered dt-responsive nowrap dataTable no-footer dtr-inline collapsed"
                                        cellspacing="0" width="100%" aria-describedby="datatable-responsive_info"
                                        style="width: 100%;">
                                        <thead>
                                            <tr>
                                                <th>Cod DTE</th>
                                                <th>numero Control</th>
                                                <th>codigo</th>
                                                <th>cliente</th>
                                                <th>Total</th>
                                                <th>Fecha</th>
                                                <th>hora</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>

                                    </table>
                                </div>
                                </div>
                            </div>
                        </div>

                        <!-- /form input mask -->
                    </div>
                    <!-- /.card -->
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->
    </section>
</div>

<script>
var numeroControl = '';
var codigoGeneracion = '';
var recepcionmh = '';
$(document).ready(function() {

    var tableDetalle = $('#tbAnulados').DataTable({

        scrollY: '40vh',
        scrollCollapse: true,
        paging: false,
        searching: true,


    });



});



function actualizaTabla(datos_tabla_new) {

    tableDetalle = $('#tbAnulados').DataTable({
        "processing": true,
        "destroy": true,
        paging: true,
        searching: true,
        "data": datos_tabla_new,
        "columns": [


            {
                data: "codigoGeneracion",

            }, {
                data: "numeroControl",

            }, {
                data: "codigo",

            }, {
                data: "nomComercial",

            }, {
                data: "totalGravada",

            }, {
                data: "fecha",

            }, {
                data: "hora",

            }, {
                "data": null,

                "mRender": function(data, type, value) {
                    cod = "'" + value["codigoGeneracion"] + "'";
                    num = "'" + value["numeroControl"] + "'";
                    item = "'" + value["reporte"] + "'";

                    return '<a class="btn" href="#" onclick="PDFimprime(' + cod + ',' + num + ',' +
                        item + ')"><i class="fa fa-print"></i></a>'
                },
                width: "170px",

            }

        ],
    });



}

$('#consultalsto').submit(function() {

    var Datos = {
        "fini": $('#fini').val(),
        "ffin": $('#ffin').val(),
        "area": $('#area').val(),
        "txt": 'N'
    };


    // mensaje('success', 'DOCUMENTOS EN PROCESO DE GENERACION', 'success');

    var url = "<?php echo base_url("mhdte/Integracion/Reimpresion");?>";
    $.ajax({
        type: "POST",
        url: url,
        data: Datos,
        success: function(data) {
            respuesta = JSON.parse(data);
            console.log(respuesta);
            actualizaTabla(respuesta)
        },
        error: function(jqXHR, textStatus, errorThrown) {

        }
    });

    return false;


});






function PDFimprime(cod, num, item) {

    url = '<?=base_url()?>reportes/' + item + '/' + item;

    $.ajax({
        type: 'POST',
        url: url,
        xhrFields: {
            responseType: 'blob'
        },
        data: {
            ajax: true,
            numeroControl: num,
            codigoGeneracion: cod,
            "fini": $('#fini').val(),
            "ffin": $('#ffin').val(),
            "area": $('#area').val()
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