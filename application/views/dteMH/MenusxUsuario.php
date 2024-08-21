<!-- =============================================== -->
<div class="content-wrapper"><br>
    <section class="content">

        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <!-- Default box -->
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Ingreso de <small>Menus por Usuario</small></h3>

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
                            <form id="demo-form2" data-parsley-validate="" class="form-horizontal form-label-left"
                                novalidate="">

                                <div class="item form-group">
                                    <label class="col-form-label col-md-3 col-sm-3 label-align" for="first-name">Usuario
                                        <span class="required">*</span>
                                    </label>
                                    <div class="col-md-6 col-sm-6 ">
                                        <select class="form-control " id="item153">

                                        </select>
                                    </div>
                                </div>
                                <div class="item form-group">
                                    <label class="col-form-label col-md-3 col-sm-3 label-align" for="last-name">Menu
                                        Principal<span class="required">*</span>
                                    </label>
                                    <div class="col-md-6 col-sm-6 ">
                                        <select class="form-control " id="item153menu">

                                        </select>
                                    </div>
                                </div>
                                <div class="item form-group">
                                    <label for="middle-name" class="col-form-label col-md-3 col-sm-3 label-align">Menu
                                        Secundario</label>
                                    <div class="col-md-6 col-sm-6 ">
                                        <select class="form-control " id="item153submenu">

                                        </select>
                                    </div>
                                </div>
                                <div class="ln_solid"></div>
                                <div class="item form-group">
                                    <div class="col-md-6 col-sm-6 offset-md-3">
                                        <button class="btn btn-primary" type="button"
                                            onclick="ingresos()">Guardar</button>

                                    </div>
                                </div>

                            </form>

                        </div>
                        <!-- /.card-body -->
                        <div class="card-footer">

                        </div>
                        <!-- /.card-footer-->
                    </div>
                    <!-- /.card -->
                </div>
            </div>
        </div>

        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <!-- Default box -->
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Ingreso/Actualizaciones <small>de Usuarios del sistema</small></h3>

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

                            <form id="demo-form3" data-parsley-validate="" class="form-horizontal"
                                novalidate="">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="card card-primary card-outline">
                                            <div class="card-tools"><br>
                                                <div class="form-group row">
                                                    <label class="col-form-label col-md-3 col-sm-3 label-align"
                                                        for="first-name">Usuario
                                                        <span class="required">*</span>
                                                    </label>
                                                    <div class="col-md-4">
                                                        <input type="text" class="form-control " id="uname" />
                                                    </div>
                                                    <div class="col-md-4">
                                                        <button class="btn btn-info" type="button"
                                                            onclick="buscarUsuarios()">Buscar Usuario</button>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                                <div class="item form-group">
                                    <label class="col-form-label col-md-3 col-sm-3 label-align"
                                        for="last-name">Nombre<span class="required">*</span>
                                    </label>
                                    <div class="col-md-6 col-sm-6 ">
                                        <input type="text" class="form-control " id="nombre" />
                                    </div>
                                </div>
                                <div class="item form-group">
                                    <label for="middle-name"
                                        class="col-form-label col-md-3 col-sm-3 label-align">contraseña</label>
                                    <div class="col-md-6 col-sm-6 ">
                                        <input type="password" class="form-control " id="password" />

                                    </div>
                                </div>
                                <div class="item form-group">
                                    <label for="middle-name"
                                        class="col-form-label col-md-3 col-sm-3 label-align">Sucursal de Trabajo</label>
                                    <div class="col-md-6 col-sm-6 ">
                                        <select class="form-control " id="codestab">

                                        </select>
                                    </div>
                                </div>
                                <div class="item form-group">
                                    <label for="middle-name"
                                        class="col-form-label col-md-3 col-sm-3 label-align">Tienda</label>
                                    <div class="col-md-6 col-sm-6 ">
                                        <select class="form-control " id="tienda">

                                        </select>
                                    </div>
                                </div>
                                <div class="item form-group">
                                    <label for="middle-name" class="col-form-label col-md-3 col-sm-3 label-align">Estado
                                        de Usuario</label>
                                    <div class="col-md-6 col-sm-6 ">
                                        <select class="form-control " id="activo">
                                            <option value="1">Activo</option>
                                            <option value="0">Inactivo</option>
                                        </select>

                                    </div>
                                </div>

                                <div class="ln_solid"></div>
                                <div class="item form-group">
                                    <div class="col-md-6 col-sm-6 ">
                                        <button class="btn btn-primary" type="button"
                                            onclick="ingresosUsuarios()">Guardar</button>
                                        <button class="btn btn-danger" type="button"
                                            onclick="limpiarForm();">Limpiar</button>

                                    </div>

                                </div>

                            </form>


                        </div>
                        <!-- /.card-body -->
                        <div class="card-footer">

                        </div>
                        <!-- /.card-footer-->
                    </div>
                    <!-- /.card -->
                </div>
            </div>
        </div>

    </section>


</div>


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
$(document).ready(function() {

    llenacombos();

});

function llenacombos() {

    //usuarios

    var Datos = {};

    var url = "<?php echo base_url("mhdte/Generales/item153v2");?>";
    $.ajax({
        type: "POST",
        url: url,
        data: Datos,
        success: function(data) {

            cat016 = JSON.parse(data);

            $("#item153").empty();
            for (i = 0; i < cat016.length; i++) {
                $("#item153").append($("<option>", {
                    value: cat016[i]['cUname'],
                    text: cat016[i]['cNombre']
                }));

            }

        }
    });
    var url = "<?php echo base_url("mhdte/Generales/item153Menus");?>";
    $.ajax({
        type: "POST",
        url: url,
        data: Datos,
        success: function(data) {

            cat016 = JSON.parse(data);

            $("#item153menu").empty();
            for (i = 0; i < cat016.length; i++) {
                $("#item153menu").append($("<option>", {
                    value: cat016[i]['id'],
                    text: cat016[i]['nombre']
                }));

            }

        }
    });

    var url = "<?php echo base_url("mhdte/Generales/codestab");?>";
    $.ajax({
        type: "POST",
        url: url,
        data: Datos,
        success: function(data) {

            cat016 = JSON.parse(data);

            $("#codestab").empty();
            for (i = 0; i < cat016.length; i++) {
                $("#codestab").append($("<option>", {
                    value: cat016[i]['codestab'],
                    text: cat016[i]['nomComercial']
                }));

            }

        }
    });

}

$("#codestab").change(function() {

    cambioTienda($('#codestab').val());

});

function cambioTienda(codigo) {
    var Datos = {
        'codestab': codigo,
    };

    var url = "<?php echo base_url("mhdte/Generales/tienda");?>";
    $.ajax({
        type: "POST",
        url: url,
        data: Datos,
        success: function(data) {

            cat016 = JSON.parse(data);

            $("#tienda").empty();
            for (i = 0; i < cat016.length; i++) {
                $("#tienda").append($("<option>", {
                    value: cat016[i]['id'],
                    text: cat016[i]['descripcion']
                }));

            }

        }
    });
}

$('#item153menu').on('change', function() {
    var Datos = {
        "codigo": $('#item153menu').val(),
        "usuario": $('#item153').val()

    };

    var url = "<?php echo base_url("mhdte/Generales/item153subMenus");?>";
    $.ajax({
        type: "POST",
        url: url,
        data: Datos,
        success: function(data) {

            cat016 = JSON.parse(data);

            $("#item153submenu").empty();
            for (i = 0; i < cat016.length; i++) {
                $("#item153submenu").append($("<option>", {
                    value: cat016[i]['id'],
                    text: cat016[i]['Nombre']
                }));

            }

        }
    });

})


function ingresos() {



    var Datos = {
        "usuario": $('#item153').val(),
        "menu": $('#item153menu').val(),
        "submenu": $('#item153submenu').val(),
    };

    var url = "<?php echo base_url("mhdte/Generales/ingresosMenus");?>";
    $.ajax({
        type: "POST",
        url: url,
        data: Datos,
        success: function(data) {
            cat016 = JSON.parse(data);
            mensaje('Corecto', 'Se agrego el menu ' + $("#item153menu option:selected").text() + ' -- ' + $(
                "#item153submenu option:selected").text(), 'success');

        }


    });



}


function ingresosUsuarios() {

    var Datos = {
        "uname": $('#uname').val(),
        "nombre": $('#nombre').val(),
        "password": $('#password').val(),
        "activo": $('#activo').val(),
        "tienda": $('#tienda').val(),
        "busqueda": busqueda,

    };
    var url = "<?php echo base_url("mhdte/Usuarios/ingresosUsuarios");?>";
    $.ajax({
        type: "POST",
        url: url,
        data: Datos,
        success: function(data) {
            cat016 = JSON.parse(data);
            if (cat016.tipo) {
                mensaje('Corecto', cat016.respuesta, 'success');
            } else {
                mensaje('Error', cat016.respuesta, 'error');
            }
            busqueda = 0;
            limpiarForm();

        }


    });

}

function buscarUsuarios() {
    busqueda = 1;
    var Datos = {
        "uname": $('#uname').val(),



    };
    var url = "<?php echo base_url("mhdte/Usuarios/BuscarUsuarios");?>";
    $.ajax({
        type: "POST",
        url: url,
        data: Datos,
        success: function(data) {
            cat016 = JSON.parse(data);
            $('#uname').val(cat016[0].cUname);
            $('#nombre').val(cat016[0].cNombre);
            $('#activo').val(cat016[0].cEstatus);
            $('#uname').attr("readonly", true);
            $('#nombre').attr("readonly", true);
            cambioTienda(cat016[0].codestab);


        }


    });

}

function limpiarForm() {
    $('#demo-form3')[0].reset();
    $('#uname').attr("readonly", false);
    $('#nombre').attr("readonly", false);
}


function mensaje(t, txt, stilo) {

    new PNotify({
        title: t,
        text: txt,
        type: stilo,
        styling: 'bootstrap3'
    });
}


// *********************************************************************************************** ******************
</script>

<!-- /.content-wrapper -->