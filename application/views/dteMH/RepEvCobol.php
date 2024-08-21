
<!-- =============================================== -->

<!-- Content Wrapper. Contains page content -->

<div class="right_col" role="main">
    <!-- top tiles -->

    <!-- /top tiles -->


    <!-- form input mask -->
    <div class="row">
        <div class="col-md-6 col-sm-12  ">
            <div class="x_panel">
                <div class="x_title">

                    <ul class="nav navbar-right panel_toolbox">
                        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                        </li>
                        <li><a class="close-link"><i class="fa fa-close"></i></a>
                        </li>
                    </ul>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <h2>Reportes de Descargas a Cobol</h2>

                    <form class="form-horizontal form-label-left" id="consultalsto">

                        <div class="form-group row">

                        </div>
                        <div class="form-group row">
                            <div class="col-md-6 ">
                                <label>DESDE</label><br>
                                <input type="date" id="fini" class="form-control-sm col-md-8"  >
                                

                            </div> <div class="col-md-6 ">
                               
                                <label>HASTA</label><br>
                                <input type="date" id="ffin" class="form-control-sm col-md-8"  >

                            </div>
                           
                        </div>

                        <div class="ln_solid"></div>
 <div class="col-md-4 ">
                            <br>
                            <button type="submit" class="btn btn-success " id="cargainteres">cargar Archivo</button>
                            </div>
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

                       
                        <th>Cod. DTE</th>
                      
                        
                          <th>Fecha de envio</th>
                        <th>Pdf y Generación</th>

                    </tr>
                </thead>


                <tbody>



                </tbody>
                <tfoot align="right">
                    <tr>
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
      
        tableDetalle = $('#example').DataTable({

            scrollY: '40vh',
            scrollCollapse: true,
            paging: false,
            searching: true,


        });


    });


   
    function actualizaTabla(datos_tabla_new){
        
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
                                        data: "codGeneracion",

                                    },
                                    {
                                        data: "fecha",

                                    },
                                    {
                                        data: null,
                                         "mRender": function(data, type, value) {
                                
                                item="'"+value["codGeneracion"]+"'";
                                return '<a class="btn" href="#" onclick="PDFimprime(' +item+ ')"><i class="fa fa-file-pdf-o"></i></a>'
                                    +'<a class="btn" href="#" onclick="TxtCrear(' +item+ ')"><i class="fa fa-file-text-o"></i></a>'
                            },

                                    }
                                ],
                            });


                 
                }

    $('#consultalsto').submit(function() {

        var Datos = {
            "fini":$('#fini').val(),
            "ffin":$('#ffin').val(),

        };
       // $("#cargainteres").prop( "disabled", true );

        mensaje('success', 'DOCUMENTOS EN PROCESO DE GENERACION', 'success');

        var url = "<?php echo base_url("mhdte/Integracion/ReporteCobol");?>";
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
    
    function TxtCrear(item){
        
          var Datos = {
            "numeroControl":item,
          
        };
         mensaje('Envio a Cobol', 'Generando Archivo TXT...!', 'success');
        var url = "<?php echo base_url("mhdte/Integracion/archivotxtReimprimir");?>";
       
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
    }

</script>

<!-- /.content-wrapper -->
