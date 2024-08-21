<!-- =============================================== -->
<div class="content-wrapper"><br>

    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <!-- Default box -->
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Reportes de DTE Anulados para <?php echo $this->session->userdata("codestab");?></h3>

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
                                    <div class="col-md-3">
                                        <br>
                                        <button type="submit" class="btn btn-success " id="cargainteres">Buscar
                                            Invalidados</button>

                                    </div>
                                    <div class="col-md-3">
                                        <br>

                                    </div>
                                </div>

                                <div class="ln_solid"></div>

                            </form>
                            <div class="row">

                                <div class="col-md-12">
                                    <table id="tbAnulados" class="table table-striped table-hover" style="width:100%">
                                        <thead>
                                            <tr>
                                                <th>Cod de anulacion</th>
                                                <th>Cod DTE anulado</th>
                                                <th>numero Control</th>
                                                <th>motivo Anulacion</th>
                                                <th>nombre Solicito</th>
                                                <th>sello Recibido</th>
                                                <th>fecEmi</th>
                                                <th>cod Reemplazo</th>
                                                <th>Fecha Anulacion</th>

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

    var tableDetalle = $('#tbAnulados').DataTable({
            dom: "Blfrtip",
            buttons: [

                {
                    extend: "excel",
                    className: "btn-sm"
                },
                {
                    extend: "pdfHtml5",
                    filename: function() {
                        return "<?php echo $this->session->userdata("nombre")?>"      
                    }, title: function() {
                        var searchString = tableDetalle.search();        
                        return "Reportes de DTE Anulados de <?php echo $this->session->userdata("NomDemo")?> a fecha de "+$('#fini').val()+" a la fecha "+$('#ffin').val()
                    },
                    footer: true,
                    className: "btn-sm"
                },
                {
                    extend: "print",
                    className: "btn-sm"
                },
            ],
            "processing": true,
            "destroy": true,
            paging: false,
            scrollY: '30vh',
            scrollCollapse: true,

            searching: false,


    });



});



function actualizaTabla(datos_tabla_new) {

    tableDetalle = $('#tbAnulados').DataTable({
            dom: "Blfrtip",
            buttons: [
        {
            extend: 'pdfHtml5',
            orientation: 'landscape',
            pageSize: 'TABLOID',
            filename: function() {
                        return "<?php echo $this->session->userdata("codestab")?>"      
                    }, title: function() {
                        var searchString = tableDetalle.search();        
                        return "Reportes de DTE Anulados de <?php echo $this->session->userdata("NomDemo")?> a fecha de "+$('#fini').val()+" a la fecha "+$('#ffin').val()
                    },
            customize: function (doc) {
                var tblBody = doc.content[1].table.body;
                doc.content[1].layout = {
                hLineWidth: function(i, node) {
                    return (i === 0 || i === node.table.body.length) ? 2 : 1;},
                vLineWidth: function(i, node) {
                    return (i === 0 || i === node.table.widths.length) ? 2 : 1;},
                hLineColor: function(i, node) {
                    return (i === 0 || i === node.table.body.length) ? 'black' : 'gray';},
                vLineColor: function(i, node) {
                    return (i === 0 || i === node.table.widths.length) ? 'black' : 'gray';}
                };
                $('#gridID').find('tr').each(function (ix, row) {
                    var index = ix;
                    var rowElt = row;
                    $(row).find('td').each(function (ind, elt) {
                        tblBody[index][ind].border
                        if (tblBody[index][1].text == '' && tblBody[index][2].text == '') {
                            delete tblBody[index][ind].style;
                            tblBody[index][ind].fillColor = '#FFF9C4';
                        }
                        else
                        {
                            if (tblBody[index][2].text == '') {
                                delete tblBody[index][ind].style;
                                tblBody[index][ind].fillColor = '#FFFDE7';
                            }
                        }
                    });
                });
            }
        },
        'excelHtml5'],
            "processing": true,
            "destroy": true,
            paging: false,
            scrollY: '30vh',
            scrollCollapse: true,

            searching: false,
        "data": datos_tabla_new,
        "columns": [


            {
                data: "codGeneracion",
                width: "20px",

            }, {
                data: "codigoGeneracion",
                width: "20px",

            }, {
                data: "numeroControl",
                width: "20px",

            }, {
                data: "motivoAnulacion",

            }, {
                data: "nombreSolicita",

            }, {
                data: "selloRecibido",
                width: "20px",

            }, {
                data: "fecEmi",
                width: "20px",

            }, {
                data: "codigoGeneracionR",
                width: "20px",

            },
            {
                data: "fecha",
                width: "20px",

            }

        ],
    });



}

$('#consultalsto').submit(function() {

    var Datos = {
        "fini": $('#fini').val(),
        "ffin": $('#ffin').val(),
        "txt": 'N'

    };


    // mensaje('success', 'DOCUMENTOS EN PROCESO DE GENERACION', 'success');

    var url = "<?php echo base_url("mhdte/Integracion/DesAnulacion");?>";
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






function PDFimprime(item) {

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

function creaTxt() {
    var Datos = {
        "fini": $('#fini').val(),
        "ffin": $('#ffin').val(),
        "txt": 'S'

    };


    // mensaje('success', 'DOCUMENTOS EN PROCESO DE GENERACION', 'success');

    var url = "<?php echo base_url("mhdte/Integracion/DesAnulacion");?>";
    $.ajax({
        type: "POST",
        url: url,
        data: Datos,
        success: function(data) {
            respuesta = JSON.parse(data);
            console.log(respuesta);

        },
        error: function(jqXHR, textStatus, errorThrown) {

        }
    });


}
</script>

<!-- /.content-wrapper -->