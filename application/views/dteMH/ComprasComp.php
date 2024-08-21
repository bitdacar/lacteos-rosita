<!-- =============================================== -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
               
            <div class="col-md-12 col-sm-12 ">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>Ingresos de Compras</h2>
                           
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                            <br />
                            <form class="form-label-left input_mask" id="C_ComprasIng">
                                <div class="row">
                                    <div class="col-md-2 col-sm-3  form-group has-feedback"> 
                                        <input type="text" class="form-control has-feedback-left" id="TipCompra" placeholder="Tipo de compra" required>

                                    </div>
                                    <div class="col-md-2 col-sm-3  form-group has-feedback">
                                        <input type="date" class="form-control" id="fecha" placeholder="Fecha" required>

                                    </div>
                                    <div class="col-md-2 col-sm-3  form-group has-feedback">
                                        <input type="text" class="form-control has-feedback-left" id="mes" placeholder="PERIODO (01,02,etc)" readonly required>

                                    </div>

                                    <div class="col-md-2 col-sm-3  form-group has-feedback">
                                        <select class="form-control" id="cmbTipDteFis">
                                            <option value="N">Seleccione el Tipo Doc</option>
                                            <option value="3">Comprobante Fiscal Electronico</option>
                                            <option value="S">Comprobante Fiscal Fisico</option>
                                        </select>
                                    </div>
                                 <div class="col-md-2 col-sm-3  form-group has-feedback">
                                        <select class="form-control" id="Calcular1"  >
                                              <option value="N">SIN 1%</option>
                                            <option value="S">1 %</option>
                                        
                                        </select>
                                    </div> 

                                    <div class="col-md-3 col-sm-3  form-group has-feedback">
                                        <select class="form-control" id="selectCo" >
                                            <option value="A">Compras exentas internas</option>
                                            <option value="B">Importaciones exentas</option>
                                            <option value="C">Internaciones exentas</option>
                                            <option value="D">Compras gravadas internas</option>
                                            <option value="E">Importaciones gravadas</option>
                                            <option value="F">Internaciones gravadas</option>
                                            <option value="G">13 %</option>
                                        </select>
                                    </div> 

                                </div>
                                <div class="row">
                                    <div class="col-md-4 col-sm-3  form-group has-feedback">
                                        <input type="text" class="form-control" id="cliente" placeholder="Número de registro del cliente NCR completo" required><br>
                                        <select class="form-control" id="clienteNom" placeholder="Nombre / Razon Social"></select>
                                        
                                    </div>
                                    <div class="col-md-2 col-sm-3 form-group has-feedback">
                                        <div class="x_panel" id="panel1">
                                            <div class="x_title">
                                                <h2>DOCUMENTO FISICO <small></small></h2>

                                                <div class="clearfix"></div>
                                            </div>
                                            <div class="x_content">
                                                <h4></h4>
                                                <div class="col-md-12 col-sm-12  form-group has-feedback">
                                                    <input type="text" class="form-control" id="ctrlInterno" placeholder="Num. CCF">


                                                </div>
                                                <div class="col-md-12 col-sm-12  form-group has-feedback">
                                                    <input type="text" class="form-control" id="seriedoc" placeholder="serie">

                                                </div>
                                                <div class="col-md-12 col-sm-12  form-group has-feedback">
                                                     <input type="date" class="form-control" id="fechaemi" placeholder="" required><br>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-sm-6 form-group has-feedback">
                                        <div class="x_panel" id="panel2">
                                            <div class="x_title">
                                                <h2>DOCUMENTO ELECTRONICO <small></small></h2>

                                                <div class="clearfix"></div>
                                            </div>
                                            <div class="x_content">
                                                <h4></h4>
                                                <div class="col-md-6 col-sm-8  form-group has-feedback">
                                                    <input type="text" class="form-control" id="numControl" placeholder="Numero Control DTE">

                                                </div>
                                                <div class="col-md-6 col-sm-8  form-group has-feedback">
                                                    <input type="text" class="form-control" id="SelloValida" placeholder="Sello Validacion">

                                                </div>
                                                <div class="col-md-6 col-sm-8  form-group has-feedback">
                                                    <input type="text" class="form-control" id="codGeneracion" placeholder="Codigo Generacion">

                                                </div> 
                                                <div class="col-md-6 col-sm-8 form-group has-feedback">
                                                    <input type="file" id="file-input" class="form-control btn btn-secondary"/>
                                                </div>



                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                                <!-- Separacion 1-->
                                <div class="row">
                                    <div class="col-md-6 ">

                                        <select class="form-control-sm" id="item153">

                                        </select>
                                        <select class="form-control-sm" id="item154">

                                        </select>
                                        <input class="form-control-sm" id="numPagoElecNPE" placeholder="NPE de Pago" />

                                        <select class="form-control-sm" id="item157">
                                            <option value="01">Dias</option>
                                            <option value="02">Mes</option>
                                            <option value="03">anio</option>
                                        </select>

                                    </div>
                                    <div class="col-md-4 col-sm-4  form-group has-feedback">
                                        <button type="submit" id="btnComprasIng" class="btn btn-secondary">Guardar</button>

                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>



            </div>
        </div><!-- /.container-fluid -->
    </section>

    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                 
                    <div class="card card-success">
                        <div class="card-header">
                            <h3 class="card-title">  
                            <input type="hidden" class="form-control-sm col-md-3 col-sm-3" id="item78" />
                    <label>Correlativo: <small id="Vnumcontrol"></small> &nbsp;&nbsp;&nbsp;</label>
                    <label>Codigo: <small id="Vcodcontrol"></small> </label>
                            </h3>
                        </div>

                        <div class="card-body">
                        <form class="form-horizontal" id="Cuerpodocumento">


<div class="col-md-12 col-sm-12 ">
    <div class="x_panel" id="panel2">
        <div class="x_title">

        </div>
        <div class="row">
            
            <div class="col-md-5 form-group ">
                <input type="text" class="form-control-sm col-md-2" id="item80" placeholder="cantidad">
                <br>
                <br>
                <textarea id="observacionesItem" rows="5" required="required" class="form-control" placeholder="Descripcion"></textarea>

            </div>

            <div class="col-md-2  form-group has-feedback">
                <input type="text" class="form-control-sm" id="item85" placeholder="precio"> <br><br>

                <select class="form-control-sm" id="item83" >
                    <option value="59">Unidad</option>
                    <option value="99">Otros</option>
                </select>
            </div> 

            <div class="col-md-4  form-group has-feedback">
                <input type="number" step="0.01" class="form-control-sm"  id="TvtaExenta" placeholder="Compras Exentas" />
                <input type="number" step="0.01" class="form-control-sm"  id="TvtaGravada" placeholder="Compras Grabadas" />
                <input type="number" step="0.01" class="form-control-sm"  id="subTotalIva1" placeholder="Sub Total" readonly />
                <input type="number" step="0.01" class="form-control-sm"  id="TotalDesc" placeholder="Descuento" />
                <input type="number" step="0.01" class="form-control-sm"  id="iva13" placeholder="IVA 13%" />
                <input type="number" step="0.01" class="form-control-sm"  id="iva1" placeholder="IVA 1%" /><br><br>
                <button type="submit" class="btn-sm btn-secondary" id="agregar">Agregar</button>
            </div> 

        </div>
    </div>
</div>
</form>
                            <div class="row">
                                <div class="col-md-12">
                                    <div id="example1_wrapper" class="dataTables_wrapper dt-bootstrap4">

                                        <div class="row">
                                            <div class="col-sm-12">
                                            <table id="example" class="display table table-striped table-bordered" style="width:100%">
                        <thead>
                            <tr>
                                <th>Item</th>
                                <th>Descripcion</th>
                                <th>Cantidad</th>
                                <th>Precio</th>
                                <th>Subtotal</th>
                                <th> <button type="button" id="Resumen" class="btn btn-success btn-sm">Realizar DTE Retención 1%</button>

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
                                        <input type="text" id="riva1" class="form-control-sm col-sm-12" disabled />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2">
                                Total:
                                <div class="form-group">
                                    <div class="input-group date" id="myDatepicker3">
                                        <input type="text" id="totalon" class="form-control-sm col-sm-12" disabled />
                                    </div>
                                </div>
                            </div> 
                            <div class="col-md-2">
                                Exenta:
                                <div class="form-group">
                                    <div class="input-group date" id="myDatepicker3">
                                        <input type="text" id="Texenta" class="form-control-sm col-sm-12" disabled />
                                    </div>
                                </div>
                            </div> 
                            <div class="col-md-2">
                                Gravada:
                                <div class="form-group">
                                    <div class="input-group date" id="myDatepicker3">
                                        <input type="text" id="Tgrabada" class="form-control-sm col-sm-12" disabled />
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


<!-- /.content-wrapper -->


<script>
    var DTEenvio =false;
    var arregleProducto;
    var tableDetalle2;
    var tableDetalle;
    var numeroControl = '';
    var codigoGeneracion = '';
    var grancontribuyente = 'S';
    var areafact = '<?php echo $this->session->userdata("areafact")?>';
    var condicionOpera = '01';
    var codFormaPago = '';
    var Plazo = '';
    var periodoPlazo = '';
    var arregleclientes='';
    var fechaemi;
    
    // calcular total
    var descripciones=''; var TvtaExenta=0; var TvtaGravada=0; var iva13 =0; var iva1=0;
    var TotalItems=0;
    function financial(x) {
    return Number.parseFloat(x).toFixed(2);
  }
     $(document).ready(function() {
    cargarPeriodo();
      });
    
$('#TvtaGravada').on('input', function(){
    $('#subTotalIva1').val(  $('#TvtaGravada').val()-$('#TotalDesc').val());
    $('#iva13').val( financial (($('#subTotalIva1').val()*1.13)-$('#subTotalIva1').val()));
    if($('#Calcular1').val()=='S'){
     $('#iva1').val(  financial (($('#subTotalIva1').val()*1.01)-$('#subTotalIva1').val()));
    }
    
});
    
$('#TotalDesc').on('input', function(){
    $('#subTotalIva1').val(  $('#TvtaGravada').val()-$('#TotalDesc').val());
    $('#iva13').val( financial (($('#subTotalIva1').val()*1.13)-$('#subTotalIva1').val()));
      if($('#Calcular1').val()=='S'){
     $('#iva1').val(  financial (($('#subTotalIva1').val()*1.01)-$('#subTotalIva1').val()));
    }
});
    
    $('#cmbTipDteFis').on('change', function() {
        if( this.value =="3"){
            $('#panel2').addClass("alert alert-info alert-dismissible");
            $('#panel1').removeClass("alert alert-info alert-dismissible");

        } else{
            $('#panel1').addClass("alert alert-info alert-dismissible");
            $('#panel2').removeClass("alert alert-info alert-dismissible");
            $('#agregar').prop("disabled", false );
        }
    });

    $('#C_ComprasIng').submit(function() {

        var Datos = {
            "TipCompra": $('#TipCompra').val(),
            "fecha": $('#fecha').val(),
            "mes": $('#mes').val(),
            "cmbTipDteFis": $('#cmbTipDteFis').val(),
            "cliente": $('#cliente').val(),
            "selectCo": $('#selectCo').val(),
            "ctrlInterno": $('#ctrlInterno').val(),
            "seriedoc": $('#seriedoc').val(),
            "numControl": $('#numControl').val(),
            "SelloValida": $('#SelloValida').val(),
            "codGeneracion": $('#codGeneracion').val(),
            "item153": $('#item153').val(),
            "item154": $('#item154').val(),
            "item157": $('#item157').val(),
            "Calcular1":$('#Calcular1').val(),

        };

        if($('#cmbTipDteFis').val()==3 ){

            numeroControl=$('#numControl').val();
            codigoGeneracion= $('#codGeneracion').val();
            $('#Vnumcontrol').val(numeroControl);
            $('#Vcodcontrol').val(codigoGeneracion);
        } else if($('#cmbTipDteFis').val()=='S' ){
            numeroControl=$('#ctrlInterno').val();
            codigoGeneracion=$('#seriedoc').val();
            $('#Vnumcontrol').html(numeroControl);
            $('#Vcodcontrol').html(codigoGeneracion);
        } else {
            mensaje('Mensaje Informativo','Seleccione un tipo de Documento FISICO o DTE...! ','info');
        }
        var url = "<?php echo base_url("mhdte/ComprasComp/agregar");?>";

        if (numeroControl != '' || codigoGeneracion != '') {
            if(DTEenvio){
                guardarDetalle();
            }
            $.ajax({
                type: "POST",
                url: url,
                data: Datos,
                success: function(data) {
                    respuesta = JSON.parse(data);

                    if(respuesta.ok){
                        if(DTEenvio){
                            mensaje('DTE Guardado', 'DTE en proceso de ser enviado', 'info');
                        } else{
                            mensaje('Documento fisico', 'Documento Fisico Guardado, coloque los detalles necesarios', 'info');
                        }

                        // $('#btnComprasIng').prop( "disabled", true );
                    }else{
                        mensaje('Error',respuesta.error,'danger');
                    }


                }
            });

        }else {

            mensaje('Campos Requeridos', 'Verifique ingresar un Codigos y Serie del CCF', 'info');

        }
        return false;
    });

    function llenacombos() {
        // alert();
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

    }

    $('#Cuerpodocumento').submit(function() {

        if ($('#cliente').val()!='' || ('#clienteNom').val()!=''){
            guardarDetalle();
        }else{
            mensaje('Falta Cliente que agregar','No se Encontro CLiente','danger');
        }

        return false;

    });

    function guardarDetalle(){
        var filas = tableDetalle.rows().count() + 1;
        var tipodocSelect = "storeCCF";

        var Datos = {  
            "numControl":numeroControl,
            "codGeneracion": codigoGeneracion,
            "cantidad": $('#item80').val(),
            "descripcion": $('#observacionesItem').val(),
            "precio": $('#item85').val(),
            "item": tableDetalle.rows().count(),
            "TvtaExenta":$('#TvtaExenta').val(),
            "TvtaGravada":$('#TvtaGravada').val(),
            "Iva1":$('#iva1').val(),
            "iva13":$('#iva13').val(),
            "ctrlInterno": $('#ctrlInterno').val(),
            "seriedoc": $('#seriedoc').val(),
            "Calcular1": $('#Calcular1').val(),
            "cmbTipDteFis": $('#cmbTipDteFis').val(),
            "ctrlInterno": $('#ctrlInterno').val(),
            "seriedoc": $('#seriedoc').val(),
              "subTotalIva1":$('#subTotalIva1').val()
        };

        if (numeroControl != '' || codigoGeneracion != '') {


            var url = '<?=base_url()?>mhdte/ComprasComp/store'
            $.ajax({
                type: "POST",
                url: url,
                data: Datos,
                async: false,
                success: function(data) {
                    respuesta = JSON.parse(data);
                    if (respuesta.OK == 1) {
                        llenarTabla(numeroControl, codigoGeneracion);
                       
                    } else {
                        mensaje('error', respuesta.OK, 'error');
                    }

                }
            });
            $('#Cuerpodocumento')[0].reset();
            DTEenvio=false;
        } else {

            mensaje('Campos Requeridos', 'Verifique ingresar un Cliente a la factura', 'info');

        }
        return false;
    }

    $("#Resumen").click(function() {

        resumenConsulta("fin");
    });

    $("#ResumenCon").click(function() {

        resumenConsulta("con");

    });

    function imprimir() {
        if ($('#tipodocSelect').val() == "store") {
            url = '<?=base_url()?>reportes/compRet/compRet';

        } else {

            url = '<?=base_url()?>reportes/compRet/compRet';
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
        var filas = tableDetalle.rows().count() + 1;

        var Datos = {
            "numeroControl": numeroControl,
            "codigoGeneracion": codigoGeneracion,
            "numControl": numeroControl,
            "codGeneracion": codigoGeneracion,
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
            "cliente": $('#txt6').val(),
            "select1":  $('#cmbTipDteFis').val(),
            "txt2": $('#fecha').val(),
            "txt1": $('#cliente').val(),
            "cmbTipDteFis": $('#cmbTipDteFis').val(),
            "txt4": $('#txt4').val(),
            "ctrlInterno": $('#ctrlInterno').val(),
            "txt5": $('#txt5').val(),
            "item72": filas,
            "SelloValida": $('#SelloValida').val(),
            "fechaemi":$('#fechaemi').val(),
            "subTotalIva1":$('#subTotalIva1').val(),
            "select2": $('#selectCo').val()
        };


        if (tipoConsulta == "fin") {
            var url = '<?=base_url()?>mhdte/ComprasComp/creacomprorete';

        }else{
            var url = '<?=base_url()?>mhdte/ComprasComp/llenarTabla';
            // llenarTabla(numeroControl, codigoGeneracion);
        }


        if(numeroControl != '' || codigoGeneracion != ''){
            $.ajax({
                type: "POST",
                url: url,
                data: Datos,
                success: function(data) {
                    respuesta = JSON.parse(data);

                    $('#riva').val(respuesta.totales.iva13);
                    $('#riva1').val(respuesta.totales.ivaPercibido);
                    $('#totalon').val(respuesta.totales.montoPorFormaPag);
                    if (tipoConsulta == "fin") {
                         numeroControl=respuesta.totales.numeroControl;
                        codigoGeneracion=respuesta.totales.codigoGeneracion;
                        enviarDte(respuesta.totales.codigoGeneracion, respuesta.totales.numeroControl);
                        $('#btnComprasIng').prop( "disabled", false );
                        
                    }
                }
            });
        }else{
            mensaje('Campos Requeridos', 'Verifique ingresar un Codigos y Serie del CCF', 'info');
        }



    }

    function llenarTabla(numeroControl, codigoGeneracion) {

        var Datos = {
            "numControl": numeroControl,
            "codGeneracion": codigoGeneracion

        };

        var url = "<?php echo base_url("mhdte/ComprasComp/llenarTabla");?>";
        $.ajax({
            type: "POST",
            url: url,
            data: Datos,
            success: function(data) {

                datos_tabla_new = JSON.parse(data);
                respuesta=datos_tabla_new.totales
                $('#riva').val(respuesta.iva13);
                $('#riva1').val(respuesta.ivaPercibido);
                $('#totalon').val(respuesta.montoPorFormaPag);
                $('#Texenta').val(respuesta.TvtaExenta);
                $('#Tgrabada').val(respuesta.TvtaGravada);
                tableDetalle = $('#example').DataTable({
                    "processing": true,
                    "destroy": true,
                    paging: false,
                    scrollY: '30vh',
                    scrollCollapse: true,

                    searching: false,
                    "data": datos_tabla_new.data,
                    "columns": [{
                        data: "item"
                    },

                                {
                                    data: "descripcion"
                                },
                                {
                                    data: "cantidad",
                                    width: "20px",
                                },
                                {
                                    data: "precio",
                                    width: "20px",
                                },
                                {
                                    data: "subtotal",
                                    width: "20px",
                                },
                                {
                                    "data": null,

                                    "mRender": function(data, type, value) {
                                        return '<a class="btn" href="#" onclick="Eliminar(' + value["item"] + ')"><i class="fa fa-trash"></i></a>'
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
                        .column(4)
                        .data()
                        .reduce(function(a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);


                        // Update footer by showing the total with the reference of the column index 
                        $(api.column(3).footer()).html('SubTotal');

                        $(api.column(4).footer()).html(friTotal.toFixed(3));
                    },

                });


            }
        });


    }

    function Eliminar(id){
        var Datos ={
            "id":id,
            "numeroControl":numeroControl,
            "codigoGeneracion": codigoGeneracion,
        }
        var url = '<?=base_url()?>mhdte/ComprasComp/EliminarComp';
        $.ajax({
            type: "POST",
            url: url,
            data: Datos,
            success: function(data) {
                respuesta = JSON.parse(data);
                if(respuesta.ok=='1'){
                    mensaje('Eliminando', 'Item Eliminado Correctamente', 'info');
                    llenarTabla(numeroControl,codigoGeneracion);
                }else{
                    mensaje('Error', respuesta.error, 'warning');
                }



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

    function leerArchivo(e) {
        var archivo = e.target.files[0];
        if (!archivo) {
            return;
        }
        var lector = new FileReader();
        lector.onload = function(e) {
            var contenido = e.target.result;
            mostrarContenido(contenido);
        };
        lector.readAsText(archivo);
    }

    function mostrarContenido(contenido) {
        // calcular total
        descripciones=''; TvtaExenta =0 ;TvtaGravada=0; iva13 =0;iva1=0;
        $('#panel2').addClass("alert alert-info alert-dismissible");
        $('#panel1').removeClass("alert alert-info alert-dismissible");

        var pedasitos="";
        try {

            pedasitos=JSON.parse(contenido);

        } catch (err) {

            mensaje('DTE JSON ERROR', 'Este Tipo de JSON no esta Realizado Correctamente', 'error');
            return;
        }

        if(pedasitos.hasOwnProperty('dteJson')){
            var pedasitos=pedasitos.dteJson;

        }else{
            var pedasitos=JSON.parse(contenido);
        }

        // elemento.innerHTML = 
        pedasitos.emisor.nrc=(pedasitos.emisor.nrc).slice(0,(pedasitos.emisor.nrc.length-1))+ "-" +(pedasitos.emisor.nrc).slice(pedasitos.emisor.nrc.length-1);

        $('#numControl').val(pedasitos.identificacion.numeroControl);
        $('#codGeneracion').val(pedasitos.identificacion.codigoGeneracion);
        $('#fechaemi').val(pedasitos.identificacion.fecEmi);
        $('#cliente').val(pedasitos.emisor.nrc);
        $('#fecha').val(pedasitos.identificacion.fecEmi);
        $('#cmbTipDteFis').val(3);


        if(pedasitos.hasOwnProperty('selloRecibido')){
            $('#SelloValida').val(pedasitos.selloRecibido);
        }else if (pedasitos.hasOwnProperty('responseMH')){
            $('#SelloValida').val(pedasitos.responseMH.selloRecibido);
        }else if (pedasitos.hasOwnProperty('acuseMH')){
            $('#SelloValida').val(pedasitos.acuseMH.selloRecibido);
        }else{
            mensaje('Dato no encontrado','No se Encontro sello Validación','danger');
            $('#SelloValida').val('');
        }

        TvtaExenta=pedasitos.resumen.totalExenta;
        TvtaGravada=pedasitos.resumen.totalGravada;
        subTotalIva1=pedasitos.resumen.subTotal;
        $('#TvtaExenta').val(TvtaExenta);
        $('#TvtaGravada').val(TvtaGravada);
        $('#subTotalIva1').val(subTotalIva1);
        

        if(pedasitos.resumen.tributos!=null){
            iva13=pedasitos.resumen.tributos[0].valor;
        }

        $('#iva13').val(iva13);
         $('#iva1').val(pedasitos.resumen.ivaRete1);

        // encabezado
        //var properties = new Object();
        //var arrayProperties = new Array();

        for(i=0;i< pedasitos.Cuerpodocumento.length;i++){
            descripciones=descripciones+' '+pedasitos.Cuerpodocumento[i].numItem+' '+pedasitos.Cuerpodocumento[i].descripcion+'\r\n' ;
            TotalItems=TotalItems+((pedasitos.Cuerpodocumento[i].precioUni*pedasitos.Cuerpodocumento[i].cantidad)-pedasitos.Cuerpodocumento[i].montoDescu );
        }

        $('#item83').val('59');
        $('#item80').val('1');
        $('#observacionesItem').val(descripciones)
        $('#item85').val(TotalItems.toFixed(2) )
        // arrayProperties.push(properties);

        //console.log( arrayProperties);
        $('#btnComprasIng').html("Guardar Documento DTE" );

        $('#agregar').prop("disabled", true );
        DTEenvio=true;

        buscarnCR();


    }

    document.getElementById('file-input').addEventListener('change', leerArchivo, false);

    $('#cliente').on("input", function() {
        buscarnCR();

    });

    function buscarnCR(){
        if ($('#cliente').val().length > 1) {

            var Datos = {
                "codigo": $('#cliente').val(),
            };

            var url = "<?php echo base_url("mhdte/ComprasComp/listaBuscarCliente");?>";
            $.ajax({
                type: "POST",
                url: url,
                data: Datos,
                success: function(data) {

                    arregleclientes = JSON.parse(data);
                    $("#clienteNom").empty();

                    grancontribuyente = '';

                    for (i = 0; i < arregleclientes.length; i++) {
                        $("#clienteNom").append($("<option>", {
                            value: arregleclientes[i]['ncr'] + ',' + arregleclientes[i]['granContribuyente'],
                            text:  arregleclientes[i]['ncr'] + ' -- ' +arregleclientes[i]['NomDenominacion']
                        }));
                    }
                    if (arregleclientes.length == 1) {
                        grancontribuyente = arregleclientes[0]['granContribuyente'];
                    }
                }
            });
        }
    }
  function cargarPeriodo(){
       

            var Datos = {
                "codigo": $('#mes').val(),
            };

            var url = "<?php echo base_url("mhdte/ComprasComp/cargarPeriodo");?>";
            $.ajax({
                type: "POST",
                url: url,
                data: Datos,
                success: function(data) {

                    cargarPeriodo = JSON.parse(data);
                   console.log(cargarPeriodo[0].mes);
                    $('#mes').val(cargarPeriodo[0].mes);
                   
                }
            });
        
    }

    $('#clienteNom').on('change', function() {

        separar = $(this).val().split(',');

        $('#cliente').val(separar[0]);
        grancontribuyente = (separar[1]);

    })

    $('#clienteNom').on('click', function() {

        separar = $(this).val().split(',');

        $('#cliente').val(separar[0]);
        grancontribuyente = (separar[1]);

    })
</script>
