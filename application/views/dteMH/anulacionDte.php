<!-- =============================================== -->
<div class="content-wrapper">
    <section class="content-header">
    <div class="x_title">
                    <label>Anulacion DTE </label>

                    <div class="clearfix"></div>
                </div>
        <div class="row">
            <!-- form input mask -->

               
             
                    <div class="col-md-6 col-sm-6  form-group ">
                        <!-- form input mask -->

                        <div class="col-md-6 col-sm-6  form-group ">
                            <input type="text" class="form-control " id="codigoGeneracion"
                                placeholder="Codigo Generacion" value="">
                            <div class="form-group">
                                <button type="button" id="btnApi" class="btn btn-secondary btn-sm">Buscar</button>
                            </div>
                        </div>

                        <div class="col-md-12 col-sm-12  form-group ">
                            <select class="form-control-sm col-md-12" id="cat024">

                            </select>
                        </div>


                        <div class="col-md-12 col-sm-12  form-group ">
                            <input type="text" class="form-control " id="motivoAnulacion"
                                placeholder="motivo Anulacion">
                        </div>
                        <div class="col-md-6 col-sm-6  form-group ">
                            <input type="text" class="form-control " id="nombreSolicita"
                                placeholder="nombre Responsable">
                        </div>



                        <div class="col-md-6 col-sm-6  form-group ">
                            <select class="form-control-sm col-md-12" id="tipDocSolicita">
                                <option value="13">DUI</option>
                                <option value="36">NIT</option>
                            </select>
                        </div>
                        <div class="col-md-6 col-sm-6  form-group ">
                            <input type="text" class="form-control " id="numDocSolicita" placeholder="numero Doc">
                        </div>
                        <div class="col-md-12 col-sm-12  form-group ">
                            <input type="text" class="form-control " id="codigoGeneracionR"
                                placeholder="CODGENERACION NUEVO">
                        </div>
                        <div class="col-md-12 col-sm-12  form-group ">
                            <input type="button" class="btn btn-primary btn-sm" id="btnAnulando" value="Anular">
                        </div>

                    </div>
                    <div class="col-md-6 col-sm-6  form-group ">
                        <table id="factura" class="display table table-striped table-bordered" style="width:100%">
                            <thead>
                                <tr>
                                    <th>Item</th>
                                    <th>Descripcion</th>

                                </tr>
                            </thead>
                        </table>
                    </div>
                  
                    <!-- /form input mask -->
           
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
var mi_tabla;
var numeroControl = '';
var codigoGeneracion = '';
$(document).ready(function() {
    mi_tabla = $('#factura').DataTable({

        scrollY: '230vh',
        scrollCollapse: false,
        paging: false,
        searching: false,
        ordering: false,
        destroy: true
    });

    llenaCombos();
});

$('#btnApi').on('click', function() {

   // const url = '';
    url = "<?php echo base_url("mhdte/Integracion/buscarDteAnular");?>";
    const user = $('#codigoGeneracion').val();
    const pwd = '';

    const credenciales = {
        user,
        pwd
    }

    $.ajax({
        type: "POST",
        url: url,
        data: credenciales,
        headers: {
            Accept: "application/json",
            "Content-Type": "application/x-www-form-urlencoded",
        },
        success: function(data) {

            respuesta = JSON.parse(data);
            numeroControl = respuesta[1][1];
            codigoGeneracion = respuesta[2][1];
            mi_tabla.clear().draw();
            if (respuesta[0][0] != '') {
                $('#codigoGeneracion').prop("disabled", true);
                for (var item = 0; item < 13; item++) {
                    mi_tabla.row.add([
                        respuesta[item][0],

                        respuesta[item][1],

                    ]).draw(false);
                }
            } else {
                mensaje('No Resultados', 'No se encontro DTE', 'info');
            }

        },
        error: function(data) {
            console.log(data);
        }
    })



});

$('#btnAnulando').on('click', function() {

    const url = 'enviarDteAnular';
    const user = $('#codigoGeneracion').val();
    const cat024 = $('#cat024').val();
    const motivoAnulacion = $('#motivoAnulacion').val();
    const nombreSolicita = $('#nombreSolicita').val();
    const tipDocSolicita = $('#tipDocSolicita').val();
    const numDocSolicita = $('#numDocSolicita').val();
    const codigoGeneracionR = $('#codigoGeneracionR').val();


    const credenciales = {
        user,
        cat024,
        motivoAnulacion,
        nombreSolicita,
        tipDocSolicita,
        numDocSolicita,
        codigoGeneracionR
    }

    $.ajax({
        type: "POST",
        url: url,
        data: credenciales,
        headers: {
            Accept: "application/json",
            "Content-Type": "application/x-www-form-urlencoded",
        },
        success: function(data) {

            respuesta = JSON.parse(data);
            // console.log(respuesta.jsonAnu);
            if (respuesta.ok == 1) {
                const infoToken = obtenerToken()
                enviarAnulacionJson(respuesta.jsonAnu);
            }




            $('#codigoGeneracion').prop("disabled", false);

        },
        error: function(data) {
            console.log(data);
        }
    });


});

async function enviarAnulacionJson(dataDte) {


    const url = '<?php echo $this->session->userdata('urlAnula');?>';
    const token = '<?php echo $this->session->userdata('token');?>';

    const documento = (await firmarDocumentoAn(dataDte)).body;

    const dataToSend = {
        ambiente: "01",
        idEnvio: 1,
        version: 2,
        documento
    }

    $.ajax({
        type: "POST",
        url: url,
        headers: {
            Accept: "application/json",
            "Content-Type": "application/json",
            "Authorization": token
        },
        timeout: 8000,
        data: JSON.stringify(dataToSend),
        success: function(dataRespuesta) {
            // console.log(data);

            if (dataRespuesta.estado == 'PROCESADO' || dataRespuesta.selloRecibido != '') {
                mensaje('success', 'Documento Anulado correctamente', 'success');
                actualizarEstadoDte(4);

            }
            guardarBitacoraFactura(dataRespuesta, 's');

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
        nit: "02033110660019",
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




function llenaCombos() {
    var Datos = {};
    var url = "<?php echo base_url("mhdte/Get_cat/getCat024");?>";
    $.ajax({
        type: "POST",
        url: url,
        data: Datos,
        success: function(data) {

            cat024 = JSON.parse(data);

            $("#cat024").empty();
            $("#cat024").append($("<option>", {
                value: '',
                text: 'Seleccione Tipo Anulacion'
            }));
            for (i = 0; i < cat024.length; i++) {
                $("#cat024").append($("<option>", {
                    value: cat024[i]['codigo'],
                    text: cat024[i]['valor']
                }));

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

function actualizarEstadoDte(estado) {

    var Datos = {
        "numeroControl": numeroControl,
        "estado": estado,
        "codigoGeneracion": codigoGeneracion,
    };

    var url = "<?php echo base_url("mhdte/Documentosdte/modificarEstadoDte");?>";
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



// *********************************************************************************************** ******************
</script>

<!-- /.content-wrapper -->