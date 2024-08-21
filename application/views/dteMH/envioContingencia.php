<!-- =============================================== -->

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
<section class="content-header">
    <!-- form input mask -->
    <div class="row">
        <div class="col-md-12 col-sm-12  ">
            <div class="x_panel">
                <div class="x_title">
                   
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <h2>Generacion de Contingencia</h2>
                    <small>Posterior a Recibir la respuesta de Hacienda se enviara automaticamente el lote de archivos
                    </small>
                    <br>
                    <br>
                    <form class="form-horizontal form-label-left" id="consultalsto">
                        <div class="form-group row">
                            <div class="col-md-6 col-sm-6  form-group ">
                                <input type="date" class="form-control " id="fInicio" placeholder="Motorista">
                            </div>
                            <div class="col-md-6 col-sm-6  form-group ">
                                <input type="time" class="form-control " id="hInicio" placeholder="Hora Inicio">
                            </div>
                            <div class="col-md-6 col-sm-6  form-group ">
                                <input type="date" class="form-control " id="fFin" placeholder="Motorista">
                            </div>
                            <div class="col-md-6 col-sm-6  form-group ">
                                <input type="time" class="form-control " id="hFin" placeholder="Hora Fin">
                            </div>
                            <div class="col-md-6 col-sm-6  form-group ">
                                <select class="form-control " id="TipoContin">
                                    <option value="5"> OTROS</option>
                                </select>
                            </div>
                            <div class="col-md-6 col-sm-6  form-group ">
                                <input type="text" class="form-control " id="motivoContingencia"
                                    placeholder="Motivo de Contingencia (al Seleccionar OTROS)">
                            </div>
                            <div class="col-md-6 col-sm-6  form-group ">
                                <input type="text" class="form-control " id="nombreRes"
                                    placeholder="Nombre Responsable">
                            </div>
                            <div class="col-md-6 col-sm-6  form-group ">
                                <select class="form-control-sm col-md-12" id="tipoRes">
                                    <option value="13">DUI</option>
                                    <option value="36">NIT</option>
                                </select>
                            </div>
                            <div class="col-md-6 col-sm-6  form-group ">
                                <input type="text" class="form-control " id="Numdoc" placeholder="Numero Documento">
                            </div>
                            <div class="col-md-6 col-sm-6  form-group ">
                                <label>Codigo Generacion Contingencia</label>
                                <input type="text" class="form-control " id="codContingencia"
                                    placeholder="CodigoGeneracion Contingencia" value="">
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-md-9 offset-md-6">
                                <button type="submit" class="btn btn-success ">Generar Contingencia</button>
                            </div>


                        </div>
                        <div class="ln_solid"></div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- /form input mask 


    <div class="row">

        <div class="col-md-9 offset-md-6">
            <button type="button" class="btn btn-success " onclick="crealote()">Generar Lote</button>
        </div>

    </div>-->
    <div class="row">

        <div class="col-md-12">
            <table id="example" class="table table-striped table-bordered" style="width:100%">
                <thead>
                    <tr>

                        <th>Num. control</th>

                        <th>Cod. DTE</th>

                        <th>Fecha</th>
                        <th>Hora</th>

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

                    </tr>
                </tfoot>
            </table>



        </div>
    </div>
</section>
</div>


<script>
var codigoGeneracion = '';
var codContingencia = '';
var codContingenciaLote = '';
$(document).ready(function() {
    //crealote();
    tableDetalle = $('#example').DataTable({

        scrollY: '40vh',
        scrollCollapse: true,
        paging: false,
        searching: true,


    });

    llenaCombos();

});


function llenarTabla(datos_tabla_new) {

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
                data: "noItem"
            },
            {
                data: "codigoGeneracion",

            },
            {
                data: "fecha",

            },
            {
                data: "hora",

            }
        ],
    });

}

$('#consultalsto').submit(function() {

    var Datos = {
        "fInicio": $('#fInicio').val(),
        "fFin": $('#fFin').val(),
        "hInicio": $('#hInicio').val(),
        "hFin": $('#hFin').val(),
        "tipoContingencia": $('#TipoContin').val(),
        "motivoContingencia": $('#motivoContingencia').val(),
        "nombreRes": $('#nombreRes').val(),
        "tipoRes": $('#tipoRes').val(),
        "Numdoc": $('#Numdoc').val(),

    };


    var url = "<?php echo base_url("mhdte/Integracion/creaContingencia");?>";
    $.ajax({
        type: "POST",
        url: url,
        data: Datos,

        success: function(data) {
            respuesta = JSON.parse(data);

            // console.log(respuesta);
            llenarTabla(respuesta.tabla);

            if (respuesta.ok == 1) {
                enviarAnulacionJson(respuesta.jsonAnu);
                codigoGeneracion = respuesta.tabla;
                codContingencia = respuesta.codigoGeneracion;
                $('#codContingencia').val(codContingencia);
            } else {
                mensaje('error', respuesta.ok, 'error');
            }
        },
        error: function(jqXHR, textStatus, errorThrown) {

        }
    });

    return false;


});


async function enviarAnulacionJson(dataDte) {
    const infoToken = obtenerToken()

    const url = '<?php echo $this->session->userdata('urlConti');?>';
    const token = '<?php echo $this->session->userdata('token');?>';

    const documento = (await firmarDocumentoAn(dataDte)).body;

    const dataToSend = {
        nit: '<?php echo $this->session->userdata('nit');?>',
        documento
    }

    $.ajax({
        type: "POST",
        url: url,
        headers: {
            Accept: "application/json",
            "Content-Type": "application/json",
            "User-Agent": "application/json",
            "Authorization": token

        },
        timeout: 8000,
        data: JSON.stringify(dataToSend),
        success: function(dataRespuesta) {
            // console.log(data);
            mensaje('success', 'Documento enviado correctamente', 'success');
            guardarBitacoraFacturaContin(dataRespuesta, 's');

            actualizarEstadoDteCon(1);
            //CREAR LOTE Y ENVIAR
            alert();
            /* setTimeout(function() { crealote();
                                   }, 2500)*/
        },
        // error: function(dataRespuesta) {
        error: function(dataRespuesta, textStatus) {

            // console.log(data.responseJSON);
            if (textStatus === "timeout") {
                mensaje('error', 'Ministerio Excedio Tiempo de respuesta', 'error');
            } else {
                console.log(dataRespuesta);
                // res.JSON.parse(
                mensaje('Error al enviar el documento', dataRespuesta.responseJSON.descripcionMsg,
                    'error');
                mensaje('Observaciones', dataRespuesta.responseJSON.observaciones, 'error');

                guardarBitacoraFactura(dataRespuesta.responseJSON, 'e');

            }

        }

    });

}

async function firmarDocumentoAn(documento) {

    const url = '<?php echo $this->session->userdata('urlFirma');?>';


    const docAFirmar = {
        nit: '<?php echo $this->session->userdata('nit');?>',
        activo: 1,
        passwordPri: '<?php echo $this->session->userdata('palabra');?>',
        dteJson: documento,
    }

    var docFirmado = null;

    return $.ajax({
        type: "POST",
        url: url,
        data: JSON.stringify(docAFirmar),
        headers: {
            Accept: "application/json",
            "Content-Type": "application/json",
        },
        success: function(data) {
            docFirmado = data;
        },
        error: function(data) {
            console.log(data);
        }
    }).done(function(docFirmado) {
        return docFirmado;
    });

}

function guardarBitacoraFacturaContin(data, status) {

    const url = "<?php echo base_url("mhdte/bitacora/guardarBitacoraFacturaContin");?>";
    const usuario = '<?php echo $this->session->userdata('uname');?>';
    const dataToSend = {
        ...data,
        usuario
    }

    $.ajax({
        type: "POST",
        headers: {
            Accept: "application/json",
            "Content-Type": "application/x-www-form-urlencoded",
        },
        url: url,
        data: dataToSend,
        success: function(data) {

            console.log(data);
            if (status != 'e') {
                //setTimeout(imprimir(), 3000);
                mensaje('success', 'Documento Recibido correctamente', 'success');
            }

        },
        error: function(data) {
            console.log(data);
        }
    });
}

function actualizarEstadoDteCon(estado) {

    var Datos = {

        "estado": estado,
        "codigoGeneracion": codigoGeneracion
    };

    var url = "<?php echo base_url("mhdte/documentosdte/actualizarEstadoDteCon");?>";
    $.ajax({
        type: "POST",
        url: url,
        data: Datos,
        success: function(data) {

            cat016 = JSON.parse(data);

            console.log(cat016);

        }

    });
    var Datos = {

        "DteJson": codigoGeneracion,
        "codigoGeneracion": codContingencia
    };

    var url = "<?php echo base_url("mhdte/Integracion/guardaContingencia");?>";
    $.ajax({
        type: "POST",
        url: url,
        data: Datos,
        success: function(data) {

            cat016 = JSON.parse(data);

            console.log(cat016);

        }

    });

}

function crealote() {
    var Datos = {
        "DteJson": codigoGeneracion,
        "codigoGeneracion": $('#codContingencia').val()
    };

    var url = "<?php echo base_url("mhdte/Integracion/crealoteConti");?>";
    $.ajax({
        type: "POST",
        url: url,
        data: Datos,
        success: function(data) {

            cat016 = JSON.parse(data);
            console.log(cat016.lote);
            enviarAnulacionJsonLote(cat016.lote);
            alert("este es codigo " + cat016.codgeneracion);
            codContingenciaLote = "597AE396-6C6E-4ADF-B598-4D56663600C4";

        }

    });

}

async function enviarAnulacionJsonLote(dataDte) {
    const infoToken = obtenerToken()

    const url = '<?php echo $this->session->userdata('urlLote');?>';
    // const url = 'https://api.dtes.mh.gob.sv/fesv/contingencia';
    const token = '<?php echo $this->session->userdata('token');?>';

    //const documento =(await firmarDocumentoAn(dataDte)).body;  

    const dataToSend = {
        nit: '<?php echo $this->session->userdata('nit');?>',
        ambiente: '00',
        idEnvio: codContingenciaLote,
        version: 1,
        documento: dataDte
    }

    $.ajax({
        type: "POST",
        url: url,
        headers: {
            Accept: "application/json",
            "Content-Type": "application/json",
            "User-Agent": "application/json",
            "Authorization": token

        },
        timeout: 8000,
        data: JSON.stringify(dataToSend),
        success: function(dataRespuesta) {
            // console.log(data);
            mensaje('success', 'Documento enviado correctamente', 'success');
            guardarBitacoraFacturaContin(dataRespuesta, 's');

            //actualizarEstadoDteCon(1);
            //CREAR LOTE Y ENVIAR
            // crealote();
        },
        // error: function(dataRespuesta) {
        error: function(dataRespuesta, textStatus) {

            // console.log(data.responseJSON);
            if (textStatus === "timeout") {
                mensaje('error', 'Ministerio Excedio Tiempo de respuesta', 'error');
            } else {
                console.log(dataRespuesta);
                // res.JSON.parse(
                mensaje('Error al enviar el documento', dataRespuesta.responseJSON.descripcionMsg,
                    'error');
                mensaje('Observaciones', dataRespuesta.responseJSON.observaciones, 'error');

                guardarBitacoraFactura(dataRespuesta.responseJSON, 'e');

            }

        }

    });

}

function llenaCombos() {
    var Datos = {};
    var url = "<?php echo base_url("mhdte/Get_cat/getCat005");?>";
    $.ajax({
        type: "POST",
        url: url,
        data: Datos,
        success: function(data) {

            cat024 = JSON.parse(data);

            $("#TipoContin").empty();
            $("#TipoContin").append($("<option>", {
                value: '',
                text: 'Seleccione Tipo Contingencia'
            }));
            for (i = 0; i < cat024.length; i++) {
                $("#TipoContin").append($("<option>", {
                    value: cat024[i]['codigo'],
                    text: cat024[i]['valores']
                }));

            }

        }
    });
}
</script>

<!-- /.content-wrapper -->