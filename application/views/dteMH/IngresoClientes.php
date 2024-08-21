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
                                    <div class="col-md-3">
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
                                        <div class="item form-group">
                                            <label class="col-form-label col-md-12 col-sm-12 label-align"
                                                for="first-name">DUI/NIT
                                                <span class="required">*</span>
                                            </label>
                                            <div class="col-md-12 col-sm-12">
                                                <input type="text" id="duinit" name="duinit" required
                                                    class="form-control ">
                                            </div>
                                        </div>
                                        <div class="item form-group">
                                            <label for="middle-name"
                                                class="col-form-label col-md-12 col-sm-12 label-align">NCR</label>
                                            <div class="col-md-12 col-sm-12">
                                                <input id="ncr" class="form-control" type="text">
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
                                    </div>
                                    <div class="col-md-3">
                                        <div class="item form-group">
                                            <label for="middle-name"
                                                class="col-form-label col-md-12 col-sm-12 label-align">Telefono</label>
                                            <div class="col-md-12 col-sm-12">
                                                <input id="telefono" class="form-control" type="number" required>
                                            </div>
                                        </div>
                                        <div class="item form-group">
                                            <label for="middle-name"
                                                class="col-form-label col-md-12 col-sm-12 label-align">Departamento</label>
                                            <div class="col-md-12 col-sm-12">
                                                <select id="departamento" class="form-control" required>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="item form-group">
                                            <label for="middle-name"
                                                class="col-form-label col-md-12 col-sm-12 label-align">Municipio</label>
                                            <div class="col-md-12 col-sm-12">
                                                <select id="municipio" class="form-control" required>
                                                </select>
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
        "duinit": $('#duinit').val(),
        "ncr": $('#ncr').val(),
        "email": $('#email').val(),
        "telefono": $('#telefono').val(),
        "ActEco": $('#ActEco').val(),
        "departamento": $('#departamento').val(),
        "municipio": $('#municipio').val(),
    };

    var url = "<?php echo base_url("mhdte/Integracion/IngresoCliente");?>";
    $.ajax({
        type: "POST",
        url: url,
        data: Datos,
        success: function(data) {
            respuesta = JSON.parse(data);


            if (respuesta.Erro != '' || respuesta.Error != null) {
                mensaje('success', 'Ingreso Correcto ..! ', 'success');
            } else {
                mensaje('danger', 'Error al Ingresar Datos', 'danger');
            }
        },
        error: function(jqXHR, textStatus, errorThrown) {}
    });
    $('#FormIngresoCliente')[0].reset();
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