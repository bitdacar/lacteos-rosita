<!-- =============================================== -->
<div class="content-wrapper">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-4">
                    <h4><?php echo strtoupper($titulo);?></h4>
                    <input type="hidden" value="04" class="form-control-sm" id="tipodocSelect">
                </div>

                <div class="col-md-2 col-sm-2  form-group pull-right top_search">
                    <div class="input-group">
                        <span class="input-group-btn">
                            <input type="time" class="form-control-sm" id="item11">
                        </span>
                    </div>
                </div>
                <div class="col-md-2 col-sm-2 form-group pull-right top_search">
                    <div class="input-group">
                        <span class="input-group-btn">
                            <input type="date" class="form-control-sm" id="item10">
                        </span>
                    </div>
                </div>
            </div>
        </div><!-- /.container-fluid -->
    </section>

    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <!-- form input mask -->
                    <div class="card card-warning">
                        <div class="card-header">
                            <h3 class="card-title">Datos del Cliente</h3>
                        </div>
                        <div class="card-body">

                            <form class="form-horizontal" id="receptor">
                                <!-- form input mask -->
                                <div class="row">
                                    <div class="col-md-12 col-sm-12  form-group ">
                                        <input type="text" id="txt1" required="required"
                                            class="form-control-sm col-md-4" placeholder="Codigo Cliente">
                                        <select class="form-control-sm col-md-12" id="select1">

                                        </select>
                                    </div>

                                    <div class="col-md-6 col-sm-6  form-group ">
                                        <input type="text" class="form-control " id="Motorista" placeholder="Motorista">
                                    </div>



                                    <div class="col-md-6 col-sm-6  form-group ">
                                        <input type="text" class="form-control " id="Licencia" placeholder="Licencia">
                                    </div>
                                    <div class="col-md-6 col-sm-6  form-group ">
                                        <input type="text" class="form-control " id="Placa" placeholder="Placa">
                                    </div>



                                    <div class="col-md-6 col-sm-6  form-group ">
                                        <input type="text" class="form-control " id="Marcavehi"
                                            placeholder="Marca Vehiculo">
                                    </div>
                                    <div class="col-md-6 col-sm-6  form-group ">
                                        <input type="text" class="form-control " id="contenedor"
                                            placeholder="contenedor">
                                    </div>
                                    <div class="col-md-6 col-sm-6  form-group ">
                                        <input type="text" class="form-control " id="marchamo" placeholder="Marchamo">
                                    </div>

                                    <div class="col-md-2 col-sm-2  form-group ">
                                        <select class="form-control" id="tipoDoc">
                                            <option value="store">DTE-Factura</option>
                                            <option value="storeCCF">DTE - Crédito Fiscal</option>
                                            <option value="store">Fisico Factura</option>
                                            <option value="storeCCF">Fisico Credito Fiscal</option>
                                        </select>
                                    </div>
                                    <div class="col-md-2 col-sm-2  form-group ">
                                        <input type="date" class="form-control " id="fechaFisico" placeholder="Fecha ">
                                    </div>
                                    <div class="col-md-4 col-sm-4  form-group ">
                                        <input type="text" class="form-control " id="dtevincontrol"
                                            placeholder="DTE vinculado">
                                    </div>
                                    <div class="col-md-4 col-sm-4  form-group ">
                                        <input type="text" class="form-control " id="dtevincodgen"
                                            placeholder="Codigo Generacion / serie">
                                    </div>



                                    <div class="form-group">
                                        <button type="submit" id="btnReceptor"
                                            class="btn btn-secondary btn-sm">Guardar</button>
                                    </div>
                                </div>
                            </form>


                        </div>
                    </div>
                    <div class="card card-success">
                        <div class="card-header">
                            <h3 class="card-title">
                                <label>Detalle de Factura <i class="fa fa-arrow-right"> &nbsp;&nbsp;&nbsp;</i></label>
                                <label>Correlativo: <small id="Vnumcontrol"></small> &nbsp;&nbsp;&nbsp;</label>
                                <label>Codigo: <small id="Vcodcontrol"></small> </label>
                            </h3>
                        </div>

                        <div class="card-body">
                            <form class="form-horizontal" id="Cuerpodocumento">





                                <table class=" table-bordered" style="width:100%">

                                    <tr>
                                        <td>
                                            <div class="col-md-6 col-sm-6  form-group has-feedback">
                                                <textarea id="marcas" rows="5" required="required" class="form-control"
                                                    placeholder="Marcas"></textarea>
                                            </div>
                                            <div class="col-md-6 col-sm-6  form-group has-feedback">

                                                <input type="text" class="form-control " id="sacos" placeholder="Sacos">

                                            </div>

                                        </td>
                                        <td>


                                            <div class="col-md-12 col-sm-12  form-group has-feedback">
                                                <input type="text" class="form-control-sm col-md-4" id="item80"
                                                    placeholder="cantidad">

                                                <select class="form-control-sm col-md-4" id="item83">
                                                    <option value="59">Unidad</option>
                                                    <option value="58">Kilogramos</option>
                                                    <option value="57">Libras</option>
                                                    <option value="39">Gramos</option>
                                                    <option value="32">Quintal</option>
                                                    <option value="22">Gramos</option>
                                                    <option value="23">Gramos</option>
                                                    <option value="24">Gramos</option>
                                                    <option value="99">OTROS</option>
                                                </select>
                                            </div>


                                            <div class="col-md-12 col-sm-12  form-group has-feedback">
                                                <input type="text" id="item81" required="required"
                                                    class="form-control-sm col-md-4" placeholder="Codigo producto">
                                                <select class="form-control-sm col-md-8" id="item84">
                                                </select>
                                            </div>

                                            <br>
                                            <textarea id="observacionesItem" rows="5" required="required"
                                                class="form-control" placeholder="Descripcion"></textarea>
                                        </td>
                                        <td>
                                            <div class="col-md-12 col-sm-12  form-group has-feedback">
                                                <input type="number" step="any" class="form-control-sm " id="item85"
                                                    placeholder="precio" required>

                                            </div>
                                            <div class="col-md-12 col-sm-12  form-group has-feedback">

                                                <button type="submit" class="btn-sm btn-secondary">Agregar</button>
                                            </div>
                                        </td>

                                    </tr>
                                </table>
                            </form>
                            <div class="row">
                                <div class="col-md-12">
                                    <div id="example1_wrapper" class="dataTables_wrapper dt-bootstrap4">

                                        <div class="row">
                                            <div class="col-sm-12">
                                                <table id="example" class="display table table-striped table-bordered"
                                                    style="width:100%">
                                                    <thead>
                                                        <tr>
                                                            <th>Item</th>
                                                            <th>Marca</th>
                                                            <th>Sacos</th>
                                                            <th>Q. Esp</th>
                                                            <th>Cantidad</th>
                                                            <th style="width:40%">Descripcion</th>

                                                            <th>Precio</th>

                                                            <th>Subtotal</th>
                                                            <th>
                                                                <button type="button" id="Resumen"
                                                                    class="btn btn-success btn-sm">Guardar y Enviar
                                                                    MH</button>

                                                            </th>
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
                                                            <th></th>
                                                            <th></th>
                                                            <th></th>

                                                        </tr>
                                                    </tfoot>
                                                </table>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>

                            <div class="row">

                                <div class="col-md-6"></div>

                                <div class="col-md-3">
                                    Total:
                                    <div class="form-group">
                                        <div class="input-group date" id="myDatepicker3">
                                            <input type="text" id="totalon" class="form-control-sm col-sm-12"
                                                disabled />
                                        </div>
                                    </div>
                                </div>

                            </div>


                        </div>

                        <!-- /form input mask -->
                    </div>
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->
    </section>

</div>


<script>
var arregleProducto;
var arregleclientes;
var tableDetalle;
var numeroControl = '';
var codigoGeneracion = '';
var grancontribuyente = '';
var areafact = '';

$('#item154').on('change', function() {

})
$('#tipodocSelect').on('change', function() {
    // $('#item85').removeAttr('disabled');
})


$('#select1').on('change', function() {

    separar = $(this).val().split(',');

    $('#txt1').val(separar[0]);
    grancontribuyente = (separar[1]);

})


$(document).ready(function() {
    llenacombos();
    tableDetalle = $('#example').DataTable({

        scrollY: '30vh',
        scrollCollapse: true,
        paging: false,
        searching: false,


    });


    $('#item81').on("input", function() {
        var dInput = this.value;
        var Datos = {
            "codigo": dInput,
            "area": areafact,

        };
        console.log(Datos);
        var url = "<?php echo base_url("mhdte/generales/listaServicioGen");?>";
        $.ajax({
            type: "POST",
            url: url,
            data: Datos,
            success: function(data) {

                arregleProducto = JSON.parse(data);
                $("#item84").empty();
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

    });



    $('#item84').on('click', function() {

        llenartext($(this).val());

    });


    function llenartext(num) {

        fila = num;

        $('#item81').val(arregleProducto[fila].codigo);
        $('#item83').val(arregleProducto[fila].UnidadMedida);
    }


    $('#txt1').on("input", function() {

        if ($('#txt1').val().length > 0) {

            var Datos = {
                "codigo": $('#txt1').val(),

            };

            var url = "<?php echo base_url("mhdte/receptor/listaBuscarCliente");?>";
            $.ajax({
                type: "POST",
                url: url,
                data: Datos,
                success: function(data) {

                    arregleclientes = JSON.parse(data);
                    $("#select1").empty();

                    grancontribuyente = '';

                    for (i = 0; i < arregleclientes.length; i++) {
                        $("#select1").append($("<option>", {
                            value: arregleclientes[i]['codigo'] + ',' +
                                arregleclientes[i]['granContribuyente'],
                            text: arregleclientes[i]['codigo'] + ' -- ' +
                                arregleclientes[i]['NomDenominacion']
                        }));

                    }
                    if (arregleclientes.length == 1) {
                        grancontribuyente = arregleclientes[0]['granContribuyente'];
                    }

                }
            });

        }


    });

    // document

});

window.onload = function() {
    var fecha = new Date(); //Fecha actual
    var mes = fecha.getMonth() + 1; //obteniendo mes
    var dia = fecha.getDate(); //obteniendo dia
    var ano = fecha.getFullYear(); //obteniendo año
    var minutos;
    var horas;
    if (dia < 10)
        dia = '0' + dia; //agrega cero si el menor de 10
    if (mes < 10)
        mes = '0' + mes //agrega cero si el menor de 10
    $('#item10').val(ano + '-' + mes + '-' + dia);
    if (fecha.getMinutes() < 10) {
        minutos = '0' + fecha.getMinutes();
    } else {
        minutos = fecha.getMinutes();
    }
    if (fecha.getHours() < 10) {
        horas = '0' + fecha.getHours();
    } else {
        horas = fecha.getHours();
    }
    console.log(horas + ':' + minutos);
    $('#item11').val(horas + ':' + minutos);
}

$('#receptor').submit(function() {


    var Datos = {

        "tipodocSelect": "04",
        "dtevincontrol": $('#dtevincontrol').val(),
        "dtevincodgen": $('#dtevincodgen').val(),
        "item11": $('#item11').val(),
        "item10": $('#item10').val(),
        "txt1": $('#txt1').val(),
        "destino": $('#destino').val(),
        "version": "3",
        "fechaFisico": $('#fechaFisico').val()
    };

    var url = "<?php echo base_url("mhdte/Cuerpodocumento/addnotaRemi");?>";
    $.ajax({
        type: "POST",
        url: url,
        data: Datos,
        success: function(data) {
            respuesta = JSON.parse(data);

            numeroControl = respuesta.numeroControl;
            codigoGeneracion = respuesta.codigoGeneracion;
            $('#Vnumcontrol').html(numeroControl);
            $('#Vcodcontrol').html(codigoGeneracion);
            $('#consin').prop("disabled", true);
            $('#btnReceptor').prop("disabled", true);


        }
    });

    return false;
});


$('#Cuerpodocumento').submit(function() {
    var filas = tableDetalle.rows().count() + 1;
    var tipodocSelect = $('#tipodocSelect').val();

    var Datos = {
        "numeroControl": numeroControl,
        "codigoGeneracion": codigoGeneracion,
        "tipodocSelect": tipodocSelect,
        "grancontribuyente": grancontribuyente,
        "item80": $('#item80').val(),
        "item84": $('#item84 option:selected').html(),
        "item81": $('#item81').val(),
        "item85": $('#item85').val(),
        "item83": $('#item83').val(),
        "observacionesItem": $('#observacionesItem').val(),
        "item72": filas,
        "item73": tableDetalle.rows().count(),
        "Marcas": $('#marcas').val(),
        "Sacos": $('#sacos').val(),

        "Motorista": $('#Motorista').val(),
        "Licencia": $('#Licencia').val(),
        "Placa": $('#Placa').val(),
        "Marcavehi": $('#Marcavehi').val(),
        "contenedor": $('#contenedor').val(),
        "marchamo": $('#marchamo').val(),
        "tipoDoc": $('#tipoDoc').val(),
        "dtevincontrol": $('#dtevincontrol').val(),
        "dtevincodgen": $('#dtevincodgen').val(),

    };

    console.log(Datos);

    if (numeroControl != '' || codigoGeneracion != '') {

        var url = '<?=base_url()?>mhdte/Cuerpodocumento/NotRemicionIng'
        $.ajax({
            type: "POST",
            url: url,
            data: Datos,
            async: false,
            success: function(data) {
                respuesta = JSON.parse(data);
                if (respuesta.OK == 1) {

                    setTimeout(llenarTabla(numeroControl, codigoGeneracion), 1000);

                } else {
                    mensaje('error', respuesta.OK, 'error');
                }

            }
        });

    } else {

        mensaje('Campos Requeridos', 'Verifique ingresar un Cliente a la factura', 'info');

    }

    $('#Cuerpodocumento')[0].reset();
    resumenConsulta("con");
    return false;
    $('#item80').focus();

});

$("#Resumen").click(function() {


    resumenConsulta("fin");


});

$("#ResumenCon").click(function() {


    resumenConsulta("con");


});

function imprimir() {


    url = '<?=base_url()?>reportes/facEx/facEx';



    $.ajax({
        type: 'POST',
        url: url,
        xhrFields: {
            responseType: 'blob'
        },
        data: {
            ajax: true,
            numeroControl: numeroControl,
            codigoGeneracion: codigoGeneracion,
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

function resumenConsulta(tipoConsulta) {
    var Datos = {
        "numeroControl": numeroControl,
        "codigoGeneracion": codigoGeneracion,
        // "excluido": $('#excluido').val(),
        "grancontribuyente": grancontribuyente,
        "tipodocElec": $('#tipodocSelect').val(),
        "areafact": areafact,
        "tipoConsulta": tipoConsulta,
        "item153": $('#item153').val(),
        "item154": $('#item154').val(),
        "item157": $('#item157').val(),
        "item158": $('#item158').val(),
        "item158": $('#item158').val(),
        "consin": $('#consin').val(),
        "dtevincontrol": $('#dtevincontrol').val(),
        "dtevincodgen": $('#dtevincodgen').val(),
        "consinDes": $('#consin option:selected').html()

    };


    if ($('#tipoDoc').val() == 'store') {
        var url = '<?=base_url()?>mhdte/Cuerpodocumento/ingresoResumen';
    } else {
        var url = '<?=base_url()?>mhdte/Cuerpodocumento/ingresoResumenCCF';
    }


    $.ajax({
        type: "POST",
        url: url,
        data: Datos,
        async: false,
        success: function(data) {
            respuesta = JSON.parse(data);


            $('#totalon').val(respuesta.montoPorFormaPag);
            if (tipoConsulta == "fin") {
                enviarDte(codigoGeneracion, numeroControl);
                $('#btnReceptor').prop("disabled", false);
            }
        }
    });

}

function llenarTabla(numeroControl, codigoGeneracion) {

    var Datos = {
        "numeroControl": numeroControl,
        "codigoGeneracion": codigoGeneracion
    };

    var url = "<?php echo base_url("mhdte/serviciosgenerales/llenarTablaExp");?>";
    $.ajax({
        type: "POST",
        url: url,
        data: Datos,
        success: function(data) {

            datos_tabla_new = JSON.parse(data);

            tableDetalle = $('#example').DataTable({
                "processing": true,
                "destroy": true,
                paging: false,
                scrollY: '30vh',
                scrollCollapse: true,
                "language": {
                    "decimal": ".", //separador decimales
                    "thousands": "," //Separador miles
                },
                searching: false,
                "data": datos_tabla_new,
                "columns": [{
                        data: "item"
                    },
                    {
                        data: "observacionesItems"
                    },
                    {
                        data: "sacos"
                    },
                    {
                        data: "Qesp"
                    },
                    {
                        data: "cantidad",
                        width: "20px",
                    },

                    {
                        "render": function(data, type, row) {
                            return (row['descripcion'] + ' ' + row['observacionesItem']);


                        },
                        // data: "descripcion" + " " +"observacionesItem" 
                    },

                    {
                        data: "precioUnitario",
                        width: "20px",
                    },

                    {
                        data: "subtotal",
                        width: "20px",
                        render: $.fn.dataTable.render.number(',', '.', 2)
                    },
                    {
                        "data": null,

                        "mRender": function(data, type, value) {
                            cod = "'" + codigoGeneracion + "'";
                            num = "'" + numeroControl + "'";
                            item = "'" + value["identificador"] + "'";
                            return '<a class="btn" href="#" onclick="EliminarCD(' + cod +
                                ',' + num + ',' + item +
                                ')"><i class="fa fa-trash"></i></a>'
                        },
                        width: "170px",
                        width: "170px",

                    }

                ],

                "footerCallback": function(row, data, start, end, display) {
                    var api = this.api(),
                        data;

                    // converting to interger to find total
                    var intVal = function(i) {
                        return typeof i === 'string' ?
                            i.replace(/[\$,]/g, '') * 1 :
                            typeof i === 'number' ?
                            i : 0;
                    };



                    var friTotal = api
                        .column(7)
                        .data()
                        .reduce(function(a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);

                    // Update footer by showing the total with the reference of the column index 
                    $(api.column(4).footer()).html('SubTotal');

                    $(api.column(5).footer()).html(friTotal.toFixed(3));
                },

            });


        }
    });


}

function mensaje(t, txt, stilo) {

    new PNotify({
        title: t,
        text: txt,
        type: stilo,
        styling: 'bootstrap3'
    });
}

function llenacombos() {
    // alert();

    if (areafact != "OF") {

        $("#partidaBtn").prop("disabled", true);
    }

    var Datos = {};

    var url = "<?php echo base_url("mhdte/generales/item153");?>";
    $.ajax({
        type: "POST",
        url: url,
        data: Datos,
        success: function(data) {

            cat016 = JSON.parse(data);

            $("#item153").empty();
            for (i = 0; i < cat016.length; i++) {
                $("#item153").append($("<option>", {
                    value: cat016[i]['codigo'],
                    text: cat016[i]['valor']
                }));

            }

        }
    });
    var url = "<?php echo base_url("mhdte/generales/item154");?>";
    $.ajax({
        type: "POST",
        url: url,
        data: Datos,
        success: function(data) {

            cat017 = JSON.parse(data);

            $("#item154").empty();
            for (i = 0; i < cat017.length; i++) {
                $("#item154").append($("<option>", {
                    value: cat017[i]['codigo'],
                    text: cat017[i]['valor']
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

            $("#item83").empty();
            for (i = 0; i < cat014.length; i++) {
                $("#item83").append($("<option>", {
                    value: cat014[i]['codigo'],
                    text: cat014[i]['valor']
                }));

            }

        }
    });

    var url = "<?php echo base_url("mhdte/generales/regFiscal");?>";
    $.ajax({
        type: "POST",
        url: url,
        data: Datos,
        success: function(data) {

            cat014 = JSON.parse(data);

            $("#resfiscal").empty();
            for (i = 0; i < cat014.length; i++) {
                $("#resfiscal").append($("<option>", {
                    value: cat014[i]['codigo'],
                    text: cat014[i]['valor']
                }));

            }

        }
    });
}

function EliminarCD(a, b, c) {


    var Datos = {
        "numeroControl": a,
        "codigoGeneracion": b,
        "item": c,

    };

    var url = "<?php echo base_url("mhdte/otrosdocumentos/EliminarCD");?>";
    $.ajax({
        type: "POST",
        url: url,
        data: Datos,
        success: function(data) {
            respuesta = JSON.parse(data);
            if (respuesta.OK == 1) {

                mensaje('info', 'Eliminacion Correcta', 'Detalle de Documento');
                llenarTabla(numeroControl, codigoGeneracion);
                resumenConsulta("con");
            } else {
                mensaje('error', respuesta.OK, 'error');
            }

        }
    });

}

function limpiar2() {
    tableDetalle.clear().draw();
    tableDetalle2.clear().draw();
    tableDetalle3.clear().draw();
}
</script>