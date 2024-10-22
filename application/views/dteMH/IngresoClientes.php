<!-- =============================================== -->
<div class="content-wrapper"><br>
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <!-- Default box -->
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Ingreso/Actualizaciones <small>de Clientes</small></h3>
                            <div class="card-tools">
                                <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                                    <i class="fas fa-minus"></i>
                                </button>
                                <button type="button" class="btn btn-tool" data-card-widget="remove" title="Remove">
                                    <i class="fas fa-times"></i>
                                </button>
                            </div>
                        </div>
                        <form id="FormIngresoCliente" class="form-horizontal">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="item form-group">
                                            <label class="col-form-label col-md-12 col-sm-12 label-align"
                                                for="first-name">Nombre
                                                <span class="required">*</span>
                                            </label>
                                            <div class="col-md-12 col-sm-12 ">
                                                <input type="text" id="nombreclt" name="nombreclt" required
                                                    class="form-control ">
                                            </div>
                                        </div>
                                        <div class="item form-group row">
                                           
                                            <div class="col-md-6 col-sm-6">
                                            <label class="col-form-label col-md-12 col-sm-12 label-align"
                                                for="first-name">DUI
                                                <span class="required">*</span>
                                            </label>
                                                <input type="text" id="dui" name="dui" required
                                                    class="form-control " maxlength="10" placeholder="02030400-0">
                                            </div>
                                            <div class="col-md-6 col-sm-6">
                                            <label class="col-form-label col-md-12 col-sm-12 label-align"
                                                for="first-name">NIT
                                                <span class="required">*</span>
                                            </label>
                                                <input type="text" id="nit" name="nit" required
                                                    class="form-control " maxlength="16" placeholder="101-010203-102-2">
                                            </div>
                                        </div>
                                        <div class="item form-group form-group row">
                                            
                                            <div class="col-md-4 col-sm-4">
                                            <label for="middle-name"
                                            class="col-form-label col-md-12 col-sm-12 label-align">NCR</label>
                                                <input id="ncr" class="form-control" type="text">
                                            </div>
                                            <div class="col-md-8 col-sm-8">
                                            <label for="middle-name"
                                            class="col-form-label col-md-12 col-sm-12 label-align">Clase de Contibuyente</label>
                                                <select id="contribuyente"class="form-control">
                                                    <option value="N"> No Contribuyente</option>
                                                    <option value="S"> Gran Contritubente</option>
                                                    <option value="R"> Empresas de Servicio</option>
                                                    <option value="P"> Pequeño Contritubente</option>
                                                    <option value="M"> Mediano Contribuyente</option>
                                                    <option value="go"> Gobierno</option>
                                                    <option value="sa"> Gobierno - Salud</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="item form-group">
                                            <label class="col-form-label col-md-12 col-sm-12 label-align"
                                                for="last-name">email
                                                <span class="required">*</span>
                                            </label>
                                            <div class="col-md-12 col-sm-12">
                                                <input type="email" id="email" required class="form-control ">
                                            </div>
                                        </div>
                                        <div class="item form-group">

                                            <label class="col-form-label col-md-12 col-sm-12 label-align"
                                                for="last-name"> Cliente <span id="clienteretro"></span> con codigo
                                              
                                            </label>
                                            <div class="col-md-12 col-sm-12">
                                                <input type="text" id="retrocodigo" readonly class="form-control ">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="item form-group">
                                            <label for="middle-name"
                                                class="col-form-label col-md-12 col-sm-12 label-align">Telefono</label>
                                            <div class="col-md-12 col-sm-12">
                                                <input id="telefono" class="form-control" type="number" required>
                                            </div>
                                        </div>
                                        <div class="item form-group form-group row">
                                          
                                            <div class="col-md-6 col-sm-6">
                                            <label for="middle-name"
                                            class="col-form-label col-md-12 col-sm-12 label-align">Departamento</label>
                                                <select id="departamento" class="form-control" required>
                                                </select>
                                            </div>
                                            <div class="col-md-6 col-sm-6">
                                            <label for="middle-name"
                                                class="col-form-label col-md-12 col-sm-12 label-align">Municipio</label>
                                           
                                                <select id="municipio" class="form-control" required>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="item form-group">
                                        <div class="col-md-12 col-sm-12">
                                            <label for="middle-name"
                                            class="col-form-label col-md-12 col-sm-12 label-align">Direccion Complementaria</label>
                                               <textarea id="dircomplemento" rows="3" class="col-md-12 col-sm-12 "></textarea>
                                            </div>
                                        </div>
                                        <div class="item form-group form-group row">
                                            <label for="middle-name"
                                                class="col-form-label col-md-12 col-sm-12 label-align">codigo
                                                Actividad Eco.</label>
                                            <div class="col-md-3 col-sm-3">
                                                <input id="ActEco" class="form-control" type="number" value="10005">
                                            </div> 
                                            <div class="col-md-9 col-sm-9">
                                               <select id="act_eco" class="form-control"></select>
                                            </div>
                                        </div>
                                        <div class="item form-group form-group row">
                                           
                                            
                                            <div class="col-md-6 col-sm-6">
                                            <label for="middle-name"
                                            class="col-form-label col-md-12 col-sm-12 label-align">Area de Facturacion</label>
                                               <select id="area_factura" class="form-control">
                                                <option value="EX"> Exportaciones</option>
                                                <option value="CC"> Facturacion General</option>
                                               </select>
                                            </div>
                                            
                                           
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div class="ln_solid"></div>
                            <div class="item form-group">
                                <label for="middle-name" class="col-form-label col-md-12 col-sm-12">* Codigo de
                                    Actividad
                                    Economica: 10005</label>

                                <div class="col-md-12 col-sm-12offset-md-3">

                                    <button type="submit" class="btn btn-success">Guardar cliente</button>
                                </div>

                            </div>

                        </form>

                    </div>
                    <!-- /.card -->
                </div>
            </div>
        </div>
    </section>
</div>



<!-- Content Wrapper. Contains page content -->



<style>
.modal-header,
h4,
.close {
    background-color: #5cb85c;
    color: white !important;
    text-align: center;
    font-size: 30px;
}

.modal-footer {
    background-color: #f9f9f9;
}
</style>

<script>
var busqueda = 0;
var arregleProducto;
$(document).ready(function() {
    select_depto();
});



$('#ActEco').on("input", function() {
            var dInput = this.value;


            BucarCodigo(dInput);

        });

        function BucarCodigo(dInput) {
            var Datos = {
                "codigo": dInput 

            };
            var url = "<?php echo base_url("mhdte/Get_cat/getCat019"); ?>";
            $.ajax({
                type: "POST",
                url: url,
                data: Datos,
                success: function(data) {

                    arregleProducto = JSON.parse(data);
                    $("#act_eco").empty();
                   
                    for (i = 0; i < arregleProducto.length; i++) {
                        $("#act_eco").append($("<option>", {
                            value: i,
                            text: arregleProducto[i]['codigo']+' - '+arregleProducto[i]['valor']
                        }));

                    }
                    if (arregleProducto.length == 1) {
                        llenartext(0);
                        
                    }



                }
            });
        }

        $('#act_eco').on('click', function() {

            llenartext($(this).val());

        });

        function llenartext(num) {

            fila = num;

            $('#ActEco').val(arregleProducto[fila].codigo);
        }
       
        // document



$('#FormIngresoCliente').submit(function() {
    var Datos = {
        "nombreclt": $('#nombreclt').val(),
        "dui": $('#dui').val(),
        "nit": $('#nit').val(),
        "ncr": $('#ncr').val(),
        "email": $('#email').val(),
        "telefono": $('#telefono').val(),
        "ActEco": $('#ActEco').val(),
        "departamento": $('#departamento').val(),
        "municipio": $('#municipio').val(),
        "dtearea": $('#area_factura').val(),
        "dircomplemento": $('#dircomplemento').val(),
        "contribuyente": $('#contribuyente').val(),
        
    };

    var url = "<?php echo base_url("mhdte/Integracion/IngresoCliente");?>";
    $.ajax({
        type: "POST",
        url: url,
        data: Datos,
        success: function(data) {
            respuesta = JSON.parse(data);

            
            if (respuesta.Erro != '' || respuesta.Error != null) {
                $('#FormIngresoCliente')[0].reset();

                mensaje('success', 'Ingreso Correcto ..! ', 'success');
                $('#retrocodigo').val(respuesta.respuesta);
                $('#clienteretro').html(respuesta.nombre);
                
            } else {
                mensaje('danger', 'Error al Ingresar Datos', 'danger');
            }
        },
        error: function(jqXHR, textStatus, errorThrown) {}
    });
   
    return false;

});


function mensaje(t, txt, stilo) {

    new PNotify({
        title: t,
        text: txt,
        type: stilo,
        styling: 'bootstrap3'
    });
}


function select_depto() {

    var Datos = {
        "departamento": $('#departamento').val(),
    };

    var url = "<?php echo base_url("mhdte/generales/Departamentos");?>";
    $.ajax({
        type: "POST",
        url: url,
        data: Datos,
        success: function(data) {

            cat016 = JSON.parse(data);

            $("#departamento").empty();
            $("#departamento").append($("<option>", {
                value: '',
                text: 'Seleccione un Departamento'
            }));
            for (i = 0; i < cat016.length; i++) {
                $("#departamento").append($("<option>", {
                    value: cat016[i]['codigo'],
                    text: cat016[i]['valores']
                }));
            }
        }
    });

}


$('#departamento').on('change', function() {

    separar = $(this).val();

    var Datos = {
        "departamento": separar,
    };

    var url = "<?php echo base_url("mhdte/generales/Municipios");?>";
    $.ajax({
        type: "POST",
        url: url,
        data: Datos,
        success: function(data) {

            cat016 = JSON.parse(data);

            $("#municipio").empty();

            for (i = 0; i < cat016.length; i++) {
                $("#municipio").append($("<option>", {
                    value: cat016[i]['codigo'],
                    text: cat016[i]['valor']
                }));

            }

        }
    });

})
// *********************************************************************************************** ******************
</script>

<!-- /.content-wrapper -->