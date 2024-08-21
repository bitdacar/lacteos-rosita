<!-- =============================================== -->
<!-- =============================================== -->
<div class="content-wrapper"><br>



    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <!-- Default box -->
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Reportes de DTE Por Catalogos (Productos) para <?php echo $this->session->userdata("codestab");?></h3>

                            <div class="card-tools">
                                <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                                    <i class="fas fa-minus"></i>
                                </button>
                                <button type="button" class="btn btn-tool" data-card-widget="remove" title="Remove">
                                    <i class="fas fa-times"></i>
                                </button>
                            </div>
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
                                    <div class="col-md-3 ">

                                        <label>Area Catalogo</label><br>
                                        <select class="form-control-sm col-md-8" id="area">
                                           
                                        </select>

                                    </div>
                                    <div class="col-md-3">
                                        <br>
                                        <button type="submit" class="btn btn-success" id="cargainteres">Vista
                                            Previa</button>
                                        <button type="button" class="btn btn-danger" id="impresion"
                                            onclick="PDFimprime()">PDF</button>

                                    </div>
                                </div>

                                <div class="ln_solid"></div>

                            </form>

                            <div class="row">

<div class="col-md-12">
    <table id="tbAnulados"
        class="table table-striped table-bordered dt-responsive nowrap dataTable no-footer dtr-inline collapsed"
        cellspacing="0" width="100%" aria-describedby="datatable-responsive_info" style="width: 100%;">
        <thead>
            <tr>


                <th>Cod DTE</th>
                <th>numero Control</th>
                <th>Venta</th>
                <th>Iva</th>
                <th>Fecha</th>
                <th>hora</th>


            </tr>
        </thead>


        <tbody>



        </tbody>

    </table>



</div>
</div>

                        </div>
                        <!-- /.card-body -->
                        <div class="card-footer">
                            Footer
                        </div>
                        <!-- /.card-footer-->
                    </div>
                    <!-- /.card -->
                </div>
            </div>
        </div>
    </section>

</div>


<script>
var numeroControl = '';
var codigoGeneracion = '';
var recepcionmh = '';
$(document).ready(function() {
    CategoriasPost();

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
                data: "ventasGravadas",

            }, {
                data: "ivaItem",

            }, {
                data: "fecha",

            }, {
                data: "hora",

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

    var url = "<?php echo base_url("mhdte/Integracion/ConsultasGenerales");?>";
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



function CategoriasPost(){
    var Datos = {};

var url = "<?php echo base_url("mhdte/generales/CategoriasPost");?>";
$.ajax({
    type: "POST",
    url: url,
    data: Datos,
    success: function(data) {

        cat016 = JSON.parse(data);

        $("#area").empty();
        for (i = 0; i < cat016.length; i++) {
            $("#area").append($("<option>", {
                value: cat016[i]['id'],
                text: cat016[i]['nombre']
            }));

        }
        $("#area").append($("<option>", {
                value: "TO",
                text: "TODOS"
            }));

    }
});

}


function PDFimprime() {

    url = '<?=base_url()?>reportes/RepEvCobolGen/RepEvCobolGen';

    $.ajax({
        type: 'POST',
        url: url,
        xhrFields: {
            responseType: 'blob'
        },
        data: {
            ajax: true,
            numeroControl: '',
            codigoGeneracion: '',
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