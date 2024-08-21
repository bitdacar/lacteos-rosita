<script>
    $(document).ready(function() {
        llenacombos();
        modalPro();
        //modalPartida();
        limpiar();

        $('#item81').on("input", function() {
            var dInput = this.value;


            BucarCodigo(dInput, areafact);

        });

        function BucarCodigo(dInput, areafact) {
            var Datos = {
                "codigo": dInput,
                "area": areafact,

            };
            var url = "<?php echo base_url("mhdte/generales/listaProducto"); ?>";
            $.ajax({
                type: "POST",
                url: url,
                data: Datos,
                success: function(data) {

                    arregleProducto = JSON.parse(data);
                    $("#item84").empty();
                    $('#item85').val('');
                    $('#item85').val('');

                    for (i = 0; i < arregleProducto.length; i++) {
                        $("#item84").append($("<option>", {
                            value: i,
                            text: arregleProducto[i]['descripcion']
                        }));

                    }
                    if (arregleProducto.length == 1) {
                        llenartext(0);
                        
                    }



                }
            });
        }

        $('#item84').on('click', function() {

            llenartext($(this).val());

        });

        function llenartext(num) {

            fila = num;

            $('#item81').val(arregleProducto[fila].codigo);

            if ($('#tipodocSelect').val() == "store") {
                $('#item85').val(arregleProducto[fila].precio);

            } else {

                $('#item85').val(arregleProducto[fila].precioPub);
            }

            $('#item83').val(arregleProducto[fila].UnidadMedida);
            areafact=arregleProducto[fila].area;
        console.log(areafact);
        $("#real").val(arregleProducto[fila].id);
        }
       
        // document

    });

    function limpiar2() {
        tableDetalle.clear().draw();
        tableDetalle2.clear().draw();
        tableDetalle3.clear().draw();
    }

    function limpiar() {

         tableDetalle =  $("#example").DataTable({
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

        })  ;
        tableDetalle =  $("#detallefact").DataTable({
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

        tableDetalle2 = $('#example2').DataTable({

             "responsive": true,
            "lengthChange": false,
            "autoWidth": true,
            "paging": true,
            "searching": false,
            "destroy": true,
            "ordering": false,
            "info": false,
            "responsive": true,


        });
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

        tableDetalle4 = $('#tablaPartida').DataTable({

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
        numeroControl = '';
codigoGeneracion = '';
grancontribuyente = '';

}

    function modalPro() {

        var Datos = {
            "codigo": "",
            "area": areafact,

        };

        var url = "<?php echo base_url("mhdte/serviciosgenerales/buscarProductos"); ?>";
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

                  
                    searching: true,
                    "data": datos_tabla_new,
                    "columns": [{
                            data: "id"
                        },

                        {
                            data: "descripcion"
                        },
                        {
                            data: "precio"
                        },
                        {
                            data: "null",
                            "mRender": function(data, type, value) {
                                cod = "'" + value["id"] + "'";
                                item = "'" + value["precio"] + "'";
                                num = "'" + value["descripcion"] + "'";
                                um = "'" + value["UnidadMedida"] + "'";

                                return '<a class="btn" href="#" onclick="AgregoPro(' + cod + ',' + num + ',' + item + ',' + um + ')"><i class="fas fa-cart-plus"></i></i></a>'
                            },


                        }

                    ],



                });


            }
        });



    }

    function AgregoPro(cod, num, item, um) {
        $('#item81').val(cod);
        $('#item85').val(item);
        $('#item83').val(um);
        $("#item84").append($("<option>", {
            value: cod,
            text: num
        }));
        $('#Bpro').modal('hide');
    }

    function modalPartida() {

        var Datos = {
            "numeroControl": numeroControl,
            "codigoGeneracion": codigoGeneracion,
        };

        var url = "<?php echo base_url("mhdte/generales/agregarAbonos"); ?>";
        $.ajax({
            type: "POST",
            url: url,
            data: Datos,
            success: function(data) {

                consultaPartida();



            }
        });

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
                                                    <th style="width: 50px;">Precio</th>
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
