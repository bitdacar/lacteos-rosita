<script>
    $(document).ready(function() {
    

    });

    function limpiar() {

       
        tableDetalle3 = $('#examplePro').DataTable({

             "responsive": true,
            "lengthChange": false,
            "autoWidth": false,
            "paging": false,
            "searching": false,
            "destroy": true,
            "ordering": false,
            "info": false,
            "autoWidth": false,
            "responsive": true,

        });
        $('#promo2').prop("disabled", false);
     

}

    function modalPro() {
       
        
        var Datos = {
            "tienda":  $('#tienda').val(),
            "codestab": $('#codestab').val(),

        };

        var url = "<?php echo base_url("mantenimiento/Productos/listarproducto"); ?>";
        $.ajax({
            type: "POST",
            url: url,
            data: Datos,
            success: function(data) {

                datos_tabla_new = JSON.parse(data);

                tableDetalle3 = $('#examplePro').DataTable({
                    "processing": true,
                    "destroy": true,
                    paging: true,
                    scrool:true,                  
                    pageLength : 5,
                scrollCollapse: true,
                    "data": datos_tabla_new,
                    "columns": [{
                            data: "codigo"
                        },

                        {
                            data: "descripcion"
                        },                       
                        {
                            data: "null",
                            "mRender": function(data, type, value) {
                                cod = "'" + value["codigo"] + "'";
                                item = "'" + value["codCobol"] + "'";
                                num = "'" + value["tienda"] + "'";
                                um="1";
                                return '<a class="btn" href="#" onclick="AgregoPro(' + cod + ',' + num + ',' + item + ',' + um + ')"><i class="fas fa-edit"></i></i></a>'
                            },


                        }

                    ],



                });


            }
        });



    }

    function AgregoPro(cod, num, item, um) {
        $('#uname').val(cod);
        $('#codestab').val(item);
        $('#tienda').val(num);
        buscarUsuarios();
        $('#Bpro').modal('hide');

    }
function listarProd(){
    modalPro();

    $('#Bpro').modal('show');
}
 
</script>



<!-- /page content -->
<div id="Bpro" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">

            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">Buscar Producto</h4>
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="col-md-12 col-sm-12 ">
                    <div class="x_panel">
                        <div class="x_title">

                        </div>
                        <div class="x_content">
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="card-box table-responsive">
                                        <table id="examplePro" class="table table-striped table-bordered" width="100%">
                                            <thead>
                                                <tr>
                                                    <th style="width: 50px;">Codigo</th>
                                                    <th style="width: 50px;">Nombre del Producto</th>                                                   
                                                    <th style="width: 50px;">Agregar</th>
                                                </tr>
                                            </thead>
                                            <tbody>

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

            </div>

        </div>
    </div>
</div>

<!-- /page content -->
