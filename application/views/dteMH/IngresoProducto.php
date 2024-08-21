<!-- =============================================== -->
<div class="content-wrapper"><br>
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <!-- Default box -->
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Ingreso de <small>Productos</small></h3>
                            <div class="card-tools">
                                <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                                    <i class="fas fa-minus"></i>
                                </button>
                                <button type="button" class="btn btn-tool" data-card-widget="remove" title="Remove">
                                    <i class="fas fa-times"></i>
                                </button>
                            </div>
                        </div>
                        <form id="formproductos" class="form-horizontal">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="card card-primary card-outline">
                                            <div class="card-header">
                                              
                                                <div class="card-tools">
                                                    
                                        <div class="item form-group">
                                            <label class="col-form-label col-md-12 col-sm-12 label-align"
                                                for="first-name">Codigo
                                                <span class="required">*</span>
                                            </label>
                                            <div class="col-md-12 col-sm-12">
                                                <input type="text" class="form-control " id="uname" required>


                                            </div>
                                        </div>
                                        <div class="item form-group">
                                            <label class="col-form-label col-md-12 col-sm-12 label-align"
                                                for="last-name">Descripcion<span class="required">*</span>
                                            </label>
                                            <div class="col-md-12 col-sm-12 ">
                                                <input type="text" class="form-control " id="nombre" required>


                                            </div>
                                        </div>
                                        <div class="item form-group">
                                            <label for="middle-name"
                                                class="col-form-label col-md-12 col-sm-12 label-align">Sucursal del
                                                producto</label>
                                            <div class="col-md-12 col-sm-12 ">
                                                <select class="form-control " id="codestab">

                                                </select>
                                            </div>
                                        </div>
                                        <div class="item form-group">
                                            <label for="middle-name"
                                                class="col-form-label col-md-12 col-sm-12 label-align">Tienda</label>
                                            <div class="col-md-12 col-sm-12 ">
                                                <select class="form-control " id="tienda">

                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-12 col-sm-12">
                                        <button class="btn btn-info" type="button" onclick="buscarUsuarios()">Buscar
                                            Producto</button>
                                    </div>   

                                                </div>
                                            </div>
                                        </div>


                                    </div>

                                    <div class="col-md-3">
                                        <div class="item form-group">
                                            <div class="col-md-12 col-sm-12 ">
                                                <label for="middle-name"
                                                    class="col-form-label col-md-12 col-sm-12 label-align">Precio
                                                    Público</label>
                                                <input type="number" step="0.001" class="form-control " id="PrecCCF"
                                                    required />

                                            </div>
                                            <div class="col-md-12 col-sm-12 "><br>
                                                <label for="middle-name"
                                                    class="col-form-label col-md-12 col-sm-12 label-align">Precio Sin
                                                    Iva
                                                    CCF</label>
                                                <input type="number" step="0.001" class="form-control " id="PrecPub"
                                                    required />

                                            </div>
                                            <div class="col-md-12 col-sm-12 "><br>
                                                <label for="middle-name"
                                                    class="col-form-label col-md-12 col-sm-12 label-align">Precio
                                                    Mayoreo </label>
                                                <input type="number" step="0.001" class="form-control " id="mayoreo"
                                                    required />

                                            </div>
                                        </div>

                                        <div class="item form-group">
                                            <label for="middle-name"
                                                class="col-form-label col-md-12 col-sm-12 label-align">Factura
                                                asignada</label>
                                            <div class="col-md-12 col-sm-12 ">
                                                <select class="form-control " id="detarea">

                                                </select>
                                            </div>
                                        </div>
                                        <div class="item form-group">
                                            <label for="middle-name"
                                                class="col-form-label col-md-12 col-sm-12 label-align">Estado
                                                Producto</label>
                                            <div class="col-md-12 col-sm-12 ">
                                                <select class="form-control " id="activo" required>
                                                    <option value="ACT">Activo</option>
                                                    <option value="INA">Inactivo</option>
                                                </select>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="item form-group">
                                            <label class="col-form-label col-md-12 col-sm-12 label-align"
                                                for="last-name">Existencia Minimo<span class="required">*</span>
                                            </label>
                                            <div class="col-md-12 col-sm-12 ">
                                                <input type="text" class="form-control " id="minimo" required>


                                            </div>
                                        </div>
                                        <div class="item form-group">
                                            <label class="col-form-label col-md-12 col-sm-12 label-align"
                                                for="last-name">Exitencia Maximo<span class="required">*</span>
                                            </label>
                                            <div class="col-md-12 col-sm-12 ">
                                                <input type="text" class="form-control " id="maximo" required>


                                            </div>
                                        </div>
                                        <div class="item form-group">
                                            <label class="col-form-label col-md-12 col-sm-12 label-align"
                                                for="last-name">Unidad Medida<span class="required">*</span>
                                            </label>
                                            <div class="col-md-12 col-sm-12 ">
                                                <select class="form-control " id="umedida" required> </select>


                                            </div>
                                        </div>


                                    </div>
                                </div>

                                <div class="ln_solid"></div>

                            </div>
                            <!-- /.card-body -->
                            <div class="card-footer">
                                <div class="row">
                                    <div class="col-md-3 col-sm-3 ">
                                        <button class="btn btn-primary" type="submit">Guardar Producto</button>
                                       

                                    </div>
                                     <div class="col-md-3 col-sm-3 ">
                                        
                                        <button class="btn btn-danger" type="button" onclick="limpiarForm();">Limpiar</button>

                                    </div>
                                    
                                </div>
                            </div>
                            <!-- /.card-footer-->
                        </form>
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

    llenarCombos();

});


function llenarCombos() {
    var Datos = {};
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
            cambioTienda(cat016[0]['codestab']);
        }
    });

    //detarea

    var Datos = {};
    var url = "<?php echo base_url("mhdte/Get_cat/getCat002");?>";
    $.ajax({
        type: "POST",
        url: url,
        data: Datos,
        success: function(data) {

            cat016 = JSON.parse(data);

            $("#detarea").empty();
            for (i = 0; i < cat016.length; i++) {
                $("#detarea").append($("<option>", {
                    value: cat016[i]['dtearea'],
                    text: cat016[i]['valores']
                }));

            }

        }
    });

    var url = "<?php echo base_url("mhdte/generales/item83");?>";
    $.ajax({
        type: "POST",
        url: url,
        data: Datos,
        success: function(data) {

            cat014 = JSON.parse(data);

            $("#umedida").empty();
            for (i = 0; i < cat014.length; i++) {
                $("#umedida").append($("<option>", {
                    value: cat014[i]['codigo'],
                    text: cat014[i]['valor']
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

$('#formproductos').submit(function() {


    var Datos = {
        "uname": $('#uname').val(),
        "nombre": $('#nombre').val(),
        "PrecPub": $('#PrecPub').val(),
        "PrecCCF": $('#PrecCCF').val(),
        "activo": $('#activo').val(),
        "mayoreo": $('#mayoreo').val(),
        "codestab": $('#codestab').val(),
        "tienda": $('#tienda').val(),
        "detarea": $('#detarea').val(),
        "umedida": $('#umedida').val(),
        "maximo": $('#maximo').val(),
        "minimo": $('#minimo').val(),
        "busqueda": busqueda,

    };
    var url = "<?php echo base_url("mantenimiento/Productos/ingresosProducto");?>";
    $.ajax({
        type: "POST",
        url: url,
        data: Datos,
        success: function(data) {
            cat016 = JSON.parse(data);
            if (cat016.tipo) {
                mensaje('Corecto', cat016.respuesta, 'success');
                $('#formproductos')[0].reset();
                $('#uname').attr("readonly", false);
                $('#nombre').attr("readonly", false);
                $('#maximo').attr("readonly", false);
                $('#minimo').attr("readonly", false);
                $('#codestab').attr("readonly", false);
                $('#tienda').attr("readonly", false);
            } else {
                mensaje('Error', cat016.respuesta, 'error');
            }
            busqueda = 0;
            limpiarForm();

        }


    });

    return false;
});

function buscarUsuarios() {
    busqueda = 1;
    var Datos = {
        "uname": $('#uname').val(),



    };
    var url = "<?php echo base_url("mantenimiento/Productos/BuscarProductos");?>";
    $.ajax({
        type: "POST",
        url: url,
        data: Datos,
        success: function(data) {
            cat016 = JSON.parse(data);
            if (cat016.length == 0) {
                $('#uname').attr("readonly", false);
                $('#nombre').attr("readonly", false);
                $('#maximo').attr("readonly", false);
                $('#minimo').attr("readonly", false);
                $('#codestab').attr("readonly", false);
                $('#tienda').attr("readonly", false);
                mensaje('Mensaje', 'NO SE ENCONTRO PRODUCTO', 'info');
            } else {
                $('#uname').val(cat016[0].codigo);
                $('#nombre').val(cat016[0].descripcion);
                $('#PrecPub').val(cat016[0].precioPub);
                $('#PrecCCF').val(cat016[0].precio);
                $('#activo').val(cat016[0].area);
                $('#detarea').val(cat016[0].dtearea);
                $('#umedida').val(cat016[0].UnidadMedida);
                $('#maximo').val(cat016[0].maximo);
                $('#minimo').val(cat016[0].minimo);
                $('#mayoreo').val(cat016[0].precio_mayoreo);

                $('#codestab').attr("readonly", true);
                $('#tienda').attr("readonly", true);
                $('#uname').attr("readonly", true);
                $('#nombre').attr("readonly", true);
                $('#maximo').attr("readonly", true);
                $('#minimo').attr("readonly", true);

            }


        }


    });

}

function limpiarForm() {
    $('#formproductos')[0].reset();
                $('#uname').attr("readonly", false);
                $('#nombre').attr("readonly", false);
                $('#maximo').attr("readonly", false);
                $('#minimo').attr("readonly", false);
                $('#codestab').attr("readonly", false);
                $('#tienda').attr("readonly", false);
                busqueda = 0;
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