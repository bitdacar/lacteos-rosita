<!-- =============================================== -->

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
<section class="content-header"> 
<!-- form input mask -->

<div class="row">
<div class="col-12">

<div class="card">
<div class="card-header">
<h3 class="card-title"> Consultas DTE No Enviados/Contingencia UNO a UNO para <?php echo $this->session->userdata("codestab");?></h3>
<div class="card-tools">
<button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
<i class="fas fa-minus"></i>
</button>
<button type="button" class="btn btn-tool" data-card-widget="remove" title="Remove">
<i class="fas fa-times"></i>
</button>
</div>
</div>
<div class="card-body" style="display: block;">

<form class="form-horizontal form-label-left" id="consultaUnoCont">

<div class="form-group row">
    <div class="col-md-4 col-sm-4  form-group has-feedback">
        <label>Tipo de DTE no enviado y Rechazado</label>
        <select class="form-control" id="TipDteRen">
            <option value="3"> CONTINGENCIA </option>
            <option value="0"> HECHO - NO ENVIADO - </option>
        </select>

    </div>

    <div class="col-md-3 col-sm-3  form-group has-feedback">
        <label>. </label>
        <input type="date" class="form-control" id="fechaenvio" />
    </div>
    <div class="col-md-3 col-sm-3  form-group has-feedback">
        <br>
        <button type="submit" class="btn btn-success " id="cargainteres">cargar Archivo</button>
    </div>
</div>

<div class="ln_solid"></div>

</form>

<div class="row">

<div class="col-md-12">
    <table id="example2" class="table table-striped table-bordered" style="width:100%">
        <thead>
            <tr>

                <th>Num. control</th>
                <th>Cod. DTE</th>
                <th>control cobol</th>
                <th>Valor</th>
                <th>Sello</th>
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

<div class="card-footer" style="display: block;">
Footer
</div>

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
  

        tableDetalle2 = $('#example2').DataTable({

            scrollY: '40vh',
            scrollCollapse: true,
            paging: false,
            searching: true,


        });
        

    });


    function cargaTabla(datos_tabla_new) {


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
                    data: "descripcionMsg",

                },
                {
                    data: "observaciones",
                   // "mRender": function(data, type, value) {
                     //   return JSON.parse(value["observaciones"]);
                   // },
                   // width: "170px",

                },
                {
                    data: "NomDenominacion",

                }, {
                    data: "codigo",

                }, {
                    data: "null",
                    "mRender": function(data, type, value) {
                        cod = "'" + value["codigoGeneracion"] + "'";
                        num = "'" + value["numeroControl"] + "'";
                        return '<a class="btn" href="#" onclick="reenviar(' + num + ',' + cod + ')"><i class="fa fa-send"></i></a>'
                    },
                    width: "170px",

                }
            ],
        });
    }

    function cargaTablaRe(datos_tabla_new) {


        tableDetalle2 = $('#example2').DataTable({
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
                    data: "fecha",

                },
                {
                    data: "hora",


                },
                {
                    data: "ventasGravadas",

                }, 
                {
                    data: "null",
                    "mRender": function(data, type, value) {
                        cod = "'" + value["codigoGeneracion"] + "'";
                        num = "'" + value["numeroControl"] + "'";
                        return '<a class="btn" href="#" onclick="reenviar(' + num + ',' + cod + ')"><i class="fas fa-arrow-circle-right"></i></a>'
                    },
                    width: "170px",

                }
            ],
        });
    }
    
    
    function cargaTablaReimpre(datos_tabla_new) {


        tableDetalle3 = $('#example3').DataTable({
            "processing": true,
            "destroy": true,
            paging: false,
            scrollY: '40vh',
            scrollCollapse: true,

            searching: true,
            "data": datos_tabla_new,
            "columns": [

                {
                    data: "id"
                },
                {
                    data: "codGeneracion",

                },
                {
                    data: "fecha",

                }, {
                    data: "null",
                    "mRender": function(data, type, value) {
                        cod = "'" + value["codGeneracion"] + "'";
                        num = "'" + value["id"] + "'";
                        return '<a class="btn" href="#" onclick="ReimpresionMes(' + num + ',' + cod + ')"><i class="fa fa-send"></i></a>'
                    },
                    width: "170px",

                }
                
            ],
        });
    }

    function reenviar(numeroControl, codigoGeneracion) {
        actualizarEstadoDte(0, numeroControl, codigoGeneracion);
        setTimeout(function() {
            enviarDte(codigoGeneracion, numeroControl);
        }, 1500)
    }

 
    function ReimpresionMes(id, codigoGeneracion) {
           
             url = '<?=base_url()?>reportes/ReimpInteMes/ReimpInteMes';

            $.ajax({
                type: 'POST',
                url: url,
                xhrFields: {
                    responseType: 'blob'
                },
                data: {
                    ajax: true,
                    id: id,
                    codGeneracion: codigoGeneracion,
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

    
    $('#consultaUnoCont').submit(function() {

        var Datos = {
            "TipDteRen": $('#TipDteRen').val(),
            "fechaenvio": $('#fechaenvio').val(),

        };
        // $("#cargainteres").prop( "disabled", true );

        mensaje('success', 'BUSCANDO DTEs.....! ', 'success');

        var url = "<?php echo base_url("mhdte/Integracion/CargaRenvio");?>";
        $.ajax({
            type: "POST",
            url: url,
            data: Datos,

            success: function(data) {
                respuesta = JSON.parse(data);
                console.log();
                // $('#codigoIntereses').val(respuesta.codigoGeneracion);
                cargaTablaRe(respuesta);
                // llenarTabla(respuesta.ok,respuesta.codigoGeneracion);
                // contar=respuesta.ok.length
                // espera=(contar*8/60);
                // mensaje('success', 'Documentos Se estan enviando..! ESPERE Aprox '+espera+' min', 'success');
            },
            error: function(jqXHR, textStatus, errorThrown) {

            }
        });

        return false;


    });
  
</script>

<!-- /.content-wrapper -->
