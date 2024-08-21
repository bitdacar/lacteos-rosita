  <div class="content-wrapper">
      <!-- Content Header (Page header) -->
      <section class="content-header">
          <div class="container-fluid">
              <div class="row mb-2">
                  <div class="col-sm-1">
                      <select class="form-control" id="tipodocSelect" hidden>
                          <option value="store">FACTURA ELECTRONICA</option>
                          <option value="storeCCF">FACTURA CRED. FISCAL</option>
                      </select>
                  </div>
                  <div class="col-sm-6">
                      <h3 id='infoFactura'>FACTURA TIENDAS <?php echo  $this->session->userdata("codestab");?></h3>
                  </div>
                  <div class="col-sm-2">
                      <div class="col-md-2   form-group pull-right top_search">
                          <div class="input-group">
                              <span class="input-group-btn">
                                  <input type="date" class="form-control-sm" id="item10">
                              </span>
                          </div>
                      </div>

                  </div>
                  <div class="col-sm-2">
                      <div class="col-md-1 form-group pull-right top_search">
                          <div class="input-group">
                              <span class="input-group-btn">
                                  <input type="time" class="form-control-sm" id="item11">
                              </span>
                          </div>
                      </div>

                  </div>
              </div>
          </div><!-- /.container-fluid -->
      </section>

      <!-- Main content -->
      <section class="content">
          <div class="container-fluid">
              <div class="row">
                  <div class="col-4">
                      <!-- form input mask -->
                      <div class="card card-warning">
                          <div class="card-header">
                              <h3 class="card-title">Datos del Cliente: Cliente Contado</h3>
                          </div>

                          <div class="card-body">
                              <form class="form-horizontal" id="receptor">
                                  <div class="row">
                                      <div class="col-sm-6" hidden>
                                          <label>Cliente</label>
                                          <div class="form-group">

                                              <input type="text" id="txt1" required="required"
                                                  class="form-control-sm col-md-4 col-sm-4" placeholder="Codigo Cliente"
                                                  value="9999-01">
                                              <button type="button" class="btn-sm btn-primary" data-toggle="modal"
                                                  data-target=".bs-example-modal-lgCliente">Cliente</button>
                                              <select class="form-control-sm  col-sm-9" id="select_cliente">
                                              </select>
                                          </div>
                                      </div>
                                      <div class="col-sm-4" hidden>
                                          <label>Tipo de Pago</label>
                                          <div class="form-group">

                                              <select class="form-control-sm" id="item153">
                                                  <option value="1">Contado</option>
                                                  <option value="2">Crédito</option>
                                                  <option value="3">Otro</option>
                                                  <option value="Ci">Consumo Interno</option>
                                              </select>
                                              <select class="form-control-sm" id="item154">
                                                  <option value="01">Billetes y monedas</option>
                                                  <option value="02">Tarjeta Debito</option>
                                                  <option value="03">Tarjeta Credito</option>
                                              </select>
                                              <input class="form-control-sm" id="numPagoElecNPE"
                                                  placeholder="NPE de Pago" />
                                              <input class="form-control-sm" id="cuentaArea"
                                                  placeholder="Cuenta Libre" />
                                          </div>
                                      </div>
                                      <div class="col-sm-2" hidden>
                                          <label>Periodos</label>
                                          <div class="form-group">

                                              <select class="form-control-sm" id="item157">
                                                  <option value="01">Dias</option>
                                                  <option value="02">Mes</option>
                                                  <option value="03">anio</option>
                                              </select>
                                              <input type="text" id="item158" class="form-control-sm col-md-12"
                                                  placeholder="">
                                          </div>
                                      </div>
                                      <div class="col-sm-6">

                                          <div class="form-group">

                                              <button type="submit" id="btnReceptor" class="btn btn-secondary">Nuevo
                                                  Ticket</button>
                                          </div>
                                      </div>
                                      <div class="col-sm-6">

                                          <div class="form-group">
                                              <button type="button" class="btn btn-primary" data-toggle="modal"
                                                  data-target=".bs-example-modal-lg">consultar Productos</button>

                                          </div>
                                      </div>
                                  </div>

                              </form>
                              <div class="row">
                                  <form class="form-horizontal" id="Cuerpodocumento">
                                      <div class="row">
                                          <div class="col-md-6">


                                          </div>
                                      </div>
                                      <div class="row">
                                          <div class="col-md-6">
                                              <label>cantidad</label>
                                              <div class="form-group">
                                                  <input type="text" class="form-control" id="item80"
                                                      placeholder="Cantidad" required>
                                              </div>
                                          </div>
                                          <div class="col-md-12">
                                              <label>Producto</label>
                                              <div class="form-group">

                                                  <input type="text" id="item81" required="required"
                                                      class="form-control" placeholder="Codigo producto">

                                              </div>
                                              <div class="form-group">
                                                  <input type="hidden" id="observacionesItem" class="form-control"
                                                      placeholder="Serie" hidden />
                                              </div>
                                          </div>
                                          <div class="col-md-12">

                                              <div class="form-group">
                                                  <select class="form-control" id="item84">

                                                  </select>
                                              </div>
                                              <div class="form-group">
                                                  <input type="hidden" id="observacionesItem" class="form-control"
                                                      placeholder="Serie" hidden />
                                              </div>
                                          </div>
                                          <div class="col-md-1" hidden>
                                              <label>U. Medida</label>
                                              <div class="form-group">


                                                  <select class="form-control  col-md-12" id="item83" disabled>

                                                  </select>

                                              </div>
                                          </div>
                                          <div class="col-md-6">
                                              <label>Precio</label>
                                              <div class="form-group">

                                                  <input type="number" class="form-control col-md-12" id="item85"
                                                      placeholder="precio" step="0.0001">
                                                  <input type="hidden" id="promo" class="form-controlcol-md-12"
                                                      placeholder="Promociones" />

                                              </div>
                                          </div>
                                          <div class="col-md-4">
                                              <label> &nbsp;</label>
                                              <div class="form-group">

                                                  <input type="hidden" id="item78" />
                                                  <input type="hidden" id="destino" />
                                                  <button type="submit" class="btn btn-secondary">Agregar
                                                      Producto</button>
                                              </div>
                                          </div>
                                          <div class="col-md-3"></div>
                                      </div>

                                  </form>

                              </div>
                          </div>

                          <!-- /form input mask -->
                      </div>

                      <!-- /.card -->
                  </div>
                  <div class="col-8">
                      <div class="card card-success">
                          <div class="card-header">
                              <h3 class="card-title"> <label>Detalle de Factura <i class="fa fa-arrow-right">
                                          &nbsp;&nbsp;&nbsp;</i></label>
                                  <label>Correlativo: <small id="Vnumcontrol"></small> &nbsp;&nbsp;&nbsp;</label>
                                  <label>Codigo: <small id="Vcodcontrol"></small> </label>
                              </h3>
                          </div>

                          <div class="card-body">

                              <div class="row">
                                  <div class="col-md-12">
                                      <div id="example1_wrapper" class="dataTables_wrapper dt-bootstrap4">

                                          <div class="row">
                                              <div class="col-sm-12">
                                                  <table id="detallefact" class="table table-bordered table-striped"
                                                      aria-describedby="example1_info">
                                                      <thead>
                                                          <tr>
                                                              <th>Item</th>

                                                              <th>Descripcion</th>
                                                              <th>Cantidad</th>
                                                              <th>promo</th>
                                                              <th>Precio</th>
                                                              <th>Subtotal</th>
                                                              <th> 

                                                              </th>
                                                          </tr>
                                                      </thead>
                                                      <tbody>

                                                      </tbody>
                                                      <tfoot>
                                                          <tr>
                                                              <th rowspan="1" colspan="1"> </th>
                                                              <th rowspan="1" colspan="1"> </th>
                                                              <th rowspan="1" colspan="1"> </th>
                                                              <th rowspan="1" colspan="1"> </th>
                                                              <th rowspan="1" colspan="1"> </th>
                                                              <th rowspan="1" colspan="1"> </th>
                                                              <th rowspan="1" colspan="1"> </th>
                                                          </tr>
                                                      </tfoot>
                                                  </table>
                                              </div>
                                          </div>

                                      </div>
                                  </div>
                              </div>

                              <div class="row">
                                  <div class="col-md-2">
                                      iva(13%):
                                      <div class="form-group">
                                          <div class="input-group date" id="myDatepicker">
                                              <input type="text" id="riva" class="form-control-sm col-sm-12" disabled />

                                          </div>
                                      </div>
                                  </div>

                                  <div class="col-md-2">
                                      iva(1%):
                                      <div class="form-group">
                                          <div class="input-group date" id="myDatepicker2">
                                              <input type="text" id="riva1" class="form-control-sm col-sm-12"
                                                  disabled />
                                          </div>
                                      </div>
                                  </div>

                                  <div class="col-md-2">
                                  <label>Total:</label>
                                      <div class="form-group">
                                          <div class="input-group date" id="myDatepicker3">
                                              <input type="text" id="totalon" class="form-control-lg col-sm-12"
                                                  disabled />
                                          </div>
                                      </div>
                                  </div>
                                  <div class="col-md-6">

                                      <div class="form-group">
                                          <label>Efectivo:</label>
                                          <div class="input-group date" id="myDatepicker3">
                                              <input type="text" id="efectivo" class="form-control-lg col-sm-12" />
                                          </div>
                                      </div>
                                      <div class="form-group">
                                          <label>cambio/vuelto:</label>
                                          <div class="input-group date" id="myDatepicker3">
                                              <input type="text" id="vuelto" class="form-control-lg col-sm-12"
                                                  disabled />
                                          </div>
                                      </div>
                                      <button type="button" id="Resumen"
                                                                      class="btn btn-success btn-sm">Guardar y
                                                                      Ticket</button>
                                                                      
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
      <!-- /.content -->
  </div>




  <!-- /page content -->

  <script>
var arregleProducto;
var arregleclientes;
var tableDetalle;
var tableDetalle2;
var tableDetalle3;
var tableDetalle4;
var numeroControl = '';
var codigoGeneracion = '';
var grancontribuyente = '';
var areafact = '<?php echo $this->session->userdata("areafact")?>';
$('#efectivo').on("input", function() {
    var dInput = this.value;
    var vuelto = 0.00;
    if (isNaN(dInput) || dInput == "") {
        vuelto = 0.00;
    } else {
        vuelto = parseFloat(dInput) - parseFloat($('#totalon').val());
    }


    $('#vuelto').val(vuelto.toFixed(2));


});

$('#item154').on('change', function() {

})
$('#tipodocSelect').on('change', function() {
    var arregleProducto = '';

    var numeroControl = '';
    var codigoGeneracion = '';
    var grancontribuyente = '';
    $('#Vnumcontrol').html('');
    $('#Vcodcontrol').html('');

    $('#Cuerpodocumento')[0].reset();
    $('#receptor')[0].reset();
    $("#select1").empty();
    $('#item84').val('');
    limpiar2();
    modalPro();
})


$('#select1').on('change', function() {

    separar = $(this).val().split(',');

    $('#txt1').val(separar[0]);
    grancontribuyente = (separar[1]);

})

$('#select1').on('click', function() {

    separar = $(this).val().split(',');

    $('#txt1').val(separar[0]);
    grancontribuyente = (separar[1]);

})

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
            $("#item154").append($("<option>", {
                value: 01,
                text: 'Cuenta Libre'
            }));
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
}


window.onload = function() {
    var fecha = new Date(); //Fecha actual
    var mes = fecha.getMonth() + 1; //obteniendo mes
    var dia = fecha.getDate(); //obteniendo dia
    var ano = fecha.getFullYear(); //obteniendo año
    var minutos;
    var hora;
    if (dia < 10)
        dia = '0' + dia; //agrega cero si el menor de 10
    if (mes < 10)
        mes = '0' + mes //agrega cero si el menor de 10
    $('#item10').val(ano + '-' + mes + '-' + dia);
    if (fecha.getMinutes() < 9) {
        minutos = '0' + fecha.getMinutes();
    } else {
        minutos = fecha.getMinutes();
    }
    if (fecha.getHours() <= 9) {
        hora = '0' + fecha.getHours();
    } else {
        hora = fecha.getHours();
    }

    $('#item11').val(hora + ':' + minutos);
}

$('#receptor').submit(function() {


    var Datos = {
        "tipodocSelect": $('#tipodocSelect').val(),
        "item11": $('#item11').val(),
        "item10": $('#item10').val(),
        "txt1": $('#txt1').val(),
        "destino": $('#destino').val(),
        "cuentaArea": $('#cuentaArea').val(),
        "item154": $('#item154').val(),
        "version": ""
    };

    var url = "<?php echo base_url("mhdte/Cuerpodocumento/add");?>";
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
            $('#btnReceptor').prop("disabled", true);
        }
    });

    return false;
});

$('#PartContable').submit(function() {


    var Datos = {
        "numeroControl": numeroControl,
        "codigoGeneracion": codigoGeneracion,
        "cuentaContable": $('#cuentaContable').val(),
        "debehaber": $('#debehaber').val(),
        "monto": $('#monto').val(),
        "descripcion": $('#descripcion').val()

    };

    var url = "<?php echo base_url("mhdte/generales/partConta");?>";
    $.ajax({
        type: "POST",
        url: url,
        data: Datos,
        success: function(data) {
            respuesta = JSON.parse(data);
            $('#PartContable')[0].reset();

            consultaPartida();

        }
    });

    return false;
});


$('#Cuerpodocumento').submit(function() {

    var tipodocSelect = $('#tipodocSelect').val();

    var filas = tableDetalle.rows().count() + 1;


    var Datos = {
        "numeroControl": numeroControl,
        "codigoGeneracion": codigoGeneracion,
        "tipodocSelect": tipodocSelect,
        "item80": $('#item80').val(),
        "item84": $('#item84 option:selected').html(),
        "item81": $('#item81').val(),
        "item85": $('#item85').val(),
        "item83": $('#item83').val(),
        "item78": $('#item78').val(),
        "item153": $('#item153').val(),
        "promo": $('#promo').val(),

        "observacionesItem": $('#observacionesItem').val(),
        "item72": filas,
        "item73": tableDetalle.rows().count()

    };

    if (numeroControl != '' || codigoGeneracion != '') {

        var url = '<?=base_url()?>mhdte/Cuerpodocumento/store'
        $.ajax({
            type: "POST",
            url: url,
            data: Datos,
            async: false,
            success: function(data) {
                respuesta = JSON.parse(data);
                if (respuesta.OK == 1) {
                    llenarTabla(numeroControl, codigoGeneracion)
                    // setTimeout(llenarTabla(numeroControl, codigoGeneracion), 2000);
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
    filas = 0;
    return false;


});

$("#Resumen").click(function() {


    resumenConsulta("fin");


    imprimirTicket("ticketQR");
    //setTimeout(imprimir(), 2000);
    limpiar2();
    limpiar();
    $('#efectivo').val('');
    $('#vuelto').val('');

});

$("#ResumenCon").click(function() {

    resumenConsulta("con");
    
    //actualizarEstadoDte(7);
    
    //imprimirTicket("ticketQR");
    limpiar2();
    limpiar();

    $('#Vnumcontrol').html(numeroControl);
    $('#Vcodcontrol').html(codigoGeneracion);
    $('#btnReceptor').prop("disabled", false);
});

function imprimirTicket(reporte) {
    if (reporte == "ticketQR") {
        url = '<?=base_url()?>reportes/TicketQR/' + reporte;

    } else {

        url = '<?=base_url()?>reportes/TicketQR/' + reporte;
    }
   // url = '<?=base_url()?>reportes/TicketQR/pruebaTi';
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
            efectivo: $('#efectivo').val(),
        },
        success: function(json) {
            var blob = new Blob([json], {
                type: 'application/pdf'
            });
            var URL = window.URL || window.webkitURL;
            //Creamos objeto URL
            var downloadUrl = URL.createObjectURL(blob);
            //Abrir en una nueva pestaña
            // window.open(downloadUrl);
            console.log(downloadUrl);
            var printWindow = window.open(downloadUrl, 'Print',
                'left=1, top=1, width=250, height=250, toolbar=0, resizable=0');
            
            setTimeout(function() {
            printWindow.print();
            }, 5000);
        },
        error: function() {
            console.log("Error");
        }
    });

}

function imprimir() {
    if ($('#tipodocSelect').val() == "store") {
        url = '<?=base_url()?>reportes/facCons/facCons';

    } else {

        url = '<?=base_url()?>reportes/CcFe/CcFe';
    }
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

    };

    if ($('#tipodocSelect').val() == 'store') {
        var url = '<?=base_url()?>mhdte/Cuerpodocumento/ingresoResumen';
    } else {
        var url = '<?=base_url()?>mhdte/Cuerpodocumento/ingresoResumenCCF';
    }
    borrarTotales();

    $.ajax({
        type: "POST",
        url: url,
        data: Datos,
        async: false,
        success: function(data) {

            respuesta = JSON.parse(data);

            $('#riva').val(respuesta.iva13);
            if (respuesta.ivaPercibido > 0) {
                $('#riva1').val(respuesta.ivaPercibido);
            }
            if (respuesta.ivaRetenido > 0) {
                $('#riva1').val(respuesta.ivaRetenido);
            }

            $('#totalon').val(respuesta.montoPorFormaPag);
            if (codigoGeneracion != "") {
                enviarDte(codigoGeneracion, numeroControl);
                $('#btnReceptor').prop("disabled", false);
            }

        }
    });

}

function borrarTotales() {

    $('#riva').val('');
    $('#riva1').val('');
    $('#totalon').val('');
}

function llenarTabla(numeroControl, codigoGeneracion) {

    var Datos = {
        "numeroControl": numeroControl,
        "codigoGeneracion": codigoGeneracion
    };

    var url = "<?php echo base_url("mhdte/Cuerpodocumento/llenarTabla");?>";
    $.ajax({
        type: "POST",
        url: url,
        data: Datos,
        success: function(data) {

            datos_tabla_new = JSON.parse(data);

            tableDetalle = $('#detallefact').DataTable({
                "processing": true,
                "destroy": true,
                paging: false,
                scrollY: '30vh',
                scrollCollapse: true,

                searching: false,
                "data": datos_tabla_new,
                "columns": [{
                        data: "item"
                    },

                    {
                        data: "descripcion"
                    },
                    {
                        data: "cantidad",
                        width: "20px",
                    }, {
                        data: "promo",
                        width: "10px",
                    },
                    {
                        data: "precioUnitario",
                        width: "20px",
                    },
                    {
                        data: "subtotal",
                        width: "20px",
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
                        .column(5)
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

function consultaPartida() {

    var Datos = {
        "numeroControl": numeroControl,
        "codigoGeneracion": codigoGeneracion
    };

    var url = "<?php echo base_url("mhdte/generales/consultaPartida");?>";
    $.ajax({
        type: "POST",
        url: url,
        data: Datos,
        success: function(data) {

            datos_tabla_new = JSON.parse(data);

            tableDetalle4 = $('#tablaPartida').DataTable({
                "processing": true,
                "destroy": true,
                paging: false,
                scrollY: '30vh',
                scrollCollapse: true,

                searching: false,
                "data": datos_tabla_new,
                "columns": [{
                        data: "cuentaContable"
                    },

                    {
                        data: "descripcion"
                    }, {
                        data: "debeHaber"
                    },
                    {
                        data: "monto",
                        width: "20px",
                    },
                    {
                        "data": null,

                        "mRender": function(data, type, value) {
                            doc = "'" + value["numControl"] + "'";
                            doc2 = "'" + value["codigoGeneracion"] + "'";
                            return '<a class="btn" href="#" onclick="EliminarPC(' + doc +
                                ',' + doc2 + ',' + doc2 +
                                ')"><i class="fa fa-trash"></i></a>'
                        },
                        width: "170px",

                    }

                ]


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

function EliminarPC(a, b, c) {


    var Datos = {
        "numeroControl": a,
        "codigoGeneracion": b,
        "item": c,

    };

    var url = "<?php echo base_url("mhdte/otrosdocumentos/EliminarPC");?>";
    $.ajax({
        type: "POST",
        url: url,
        data: Datos,
        success: function(data) {
            respuesta = JSON.parse(data);
            if (respuesta.OK == 1) {

                mensaje('info', 'Eliminacion Correcta', 'Partida Contable');
                consultaPartida();
                resumenConsulta("con");
            } else {
                mensaje('error', respuesta.OK, 'error');
            }

        }
    });

}
  </script>