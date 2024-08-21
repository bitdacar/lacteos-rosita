    <script>


	console.log('ready envio dte');

			//reception dte
	async function enviarDte(codigoGeneracion, numeroControl) {
		const infoToken =  await  obtenerToken();

		const url = '<?php echo $this->session->userdata('urlRecepcion');?>';
		
		
		

		const dataDte = JSON.parse(await obtenerDocumentoBruto(codigoGeneracion,numeroControl))

		console.log('obtener', dataDte);
				
		if(dataDte == null) {
			return;
		}
		
			  const version = Number(dataDte.identificacion.version);

			  const tipoDte = dataDte.identificacion.tipoDte;

			  statusToken =JSON.parse(infoToken);

				  if(!statusToken.status) {
						mensaje('error', 'No se puede enviar el documento. No se ha autenticado', 'error');
					  return;
				  }
				   
			const token = statusToken.token;
			//var opcion=confirm("Esta seguro Enviar la factura" +token);			
				//  if(opcion==false){return; }

			  const documento = (await firmarDocumento(dataDte)).body;

			
			
				
			  const dataToSend ={
				  ambiente:  '<?php echo $this->session->userdata('ambiente');?>',
				  idEnvio: 1,
				  version ,
				  tipoDte,
				  documento
			  }
             
     $.ajax({
		  type: "POST",
		  url: url,
		  headers: {
			  Accept: "application/json",         
			  "Content-Type": "application/json",
			  "Authorization" : token
			  },
          timeout:8000,
		  data: JSON.stringify(dataToSend),
		  success: function(dataRespuesta) {
              mensaje('success', 'Documento enviado correctamente', 'success');
       
           if(dataRespuesta.estado=='PROCESADO' || dataRespuesta.selloRecibido!=''){
               mensaje('success', 'Documento enviado correctamente', 'success');
               actualizarEstadoDte(1);
               limpiar2();
			   limpiar();
           }
              (async() => {
 
  await  GuardaJson(documento,dataDte);
  
   guardarBitacoraFactura(dataRespuesta,'s');
})();
                
             
               
				
		  },
		 // error: function(dataRespuesta) {
		  error: function( dataRespuesta,textStatus) {
               
						  // console.log(data.responseJSON);
               if(textStatus==="timeout") {
          mensaje('error', 'Ministerio Excedio Tiempo de respuesta', 'error');
            actualizarEstadoDte(3);
        } else{
            console.log(dataRespuesta);
          
          mensaje('Error al enviar el documento', dataRespuesta.responseJSON.descripcionMsg, 'error'); 
          mensaje('Observaciones', dataRespuesta.responseJSON.observaciones, 'error');
          guardarBitacoraFactura(dataRespuesta.responseJSON,'e');		
            
        }
						
		  } 
	  });
  
  
  }



	function obtenerToken() {
    const url = "<?php echo base_url("mhdte/bitacora/obtenerToken");?>";
		statusToken = $.ajax({
						type: "POST",
					
						headers: {          
								Accept: "application/json",
								"Content-Type": "application/json",
								},
						url: url,
						success: function(data) {
								const { status, token, message } = data;
					
								statusToken =  status;
						},

						error: function(data) {
								mensaje('error', 'No se pudo obtener el token. Debes auntenticarte para recepcion de DTE del Ministerio de Hacienda', 'error');
								console.log(data);
						}
				}).done(function(statusToken) {
					return statusToken;
				});

		return statusToken;

  }

	async function firmarDocumento(documento) {

		const url = '<?php echo $this->session->userdata('urlFirma');?>';
		

		const tipoDte = documento.identificacion.tipoDte;

		const docAFirmar = {
			nit:"02033110660019",
			activo:1,
			passwordPri: '<?php echo $this->session->userdata('palabra');?>',
			dteJson: validarDocumento(documento,tipoDte),
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

	function guardarBitacoraFactura(data,status) {

		const url = "<?php echo base_url("mhdte/bitacora/guardarBitacoraFactura");?>";
		const usuario = '<?php echo $this->session->userdata('uname');?>';
		const dataToSend = {...data, usuario}

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
                           /* if(status!='e'){
                                setTimeout(imprimirTicket(), 2000);
                            }*/
                            
						},
						error: function(data) {
								console.log(data);
						}
				});
	}

	async function obtenerDocumentoBruto(codigoGeneracion, numeroControl){
		var url = "<?php echo base_url("mhdte/Documentosdte/cargarDocumento");?>";

		const datos = {
			codigoGeneracion,
			numeroControl
		}

		$documento = await $.ajax({
            type: "POST",
            url: url,
			headers: {          
						Accept: "application/json",
						"Content-Type": "application/x-www-form-urlencoded",
					},
            data: datos,
            success: function(data) {
                datos_tabla_new = JSON.parse(data);
            },
			error: function(data) {
				mensaje('error', 'No se pudo obtener el documento', 'error');
			}
        }).done(function(datos_tabla_new) {
			return datos_tabla_new;
		});

		return $documento;
		
	}

	function validoParaTipoDte(tipoDte, documentosAplicado){


		const FE = '01';
		const CCFE = '03';
		const NRE = '04';
		const NCE = '05';
		const NDE = '06';
		const FEXE = '11';
		const FSEE = '14';
        const CRE = '07';

		if(Array.isArray(documentosAplicado)){
			return documentosAplicado.includes(tipoDte);
		}

		return documentosAplicado == tipoDte;
	}

	function validarDocumento(documento, tipoDte){

		const FE = '01';
		const CCFE = '03';
		const NRE = '04';
		const NCE = '05';
		const NDE = '06';
		const FEXE = '11';
		const FSEE = '14';
		const CRE = '07';
      


		documento.identificacion.version = Number(documento.identificacion.version);
		documento.identificacion.tipoModelo =Number(documento.identificacion.tipoModelo);
		documento.identificacion.tipoOperacion = Number(documento.identificacion.tipoOperacion);
		documento.identificacion.tipoContingencia = documento.identificacion.tipoContingencia == "" || documento.identificacion.tipoContingencia == null ? null : Number(documento.identificacion.tipoContingencia);
        
        
        if(validoParaTipoDte(tipoDte,[CRE]))documento.receptor.telefono=documento.receptor.telefono.replace('-','');
        if(documento.cuerpoDocumento.codRetencion==22){
            documento.receptor.nrc;
        }else{
            if(validoParaTipoDte(tipoDte,[CRE]))documento.receptor.nrc !='na' ? documento.receptor.nrc=documento.receptor.nrc : documento.receptor.nrc=null;
        }

		if(!validoParaTipoDte(tipoDte,[FEXE])) documento.identificacion.motivoContin = documento.identificacion.motivoContin == "" || documento.identificacion.motivoContin == 'null' || documento.identificacion.motivoContin == 0 || documento.identificacion.motivoContin == null ? null : Number(documento.identificacion.motivoContin);

		if(validoParaTipoDte(tipoDte,[FEXE])) documento.identificacion.motivoContigencia = documento.identificacion.motivoContigencia == "" || documento.identificacion.motivoContigencia == null ? null : Number(documento.identificacion.motivoContigencia);

		if(validoParaTipoDte(tipoDte,[FEXE])) documento.emisor.tipoItemExpor = Number(documento.emisor.tipoItemExpor);

		if(validoParaTipoDte(tipoDte,[FEXE])) documento.receptor.tipoPersona = Number(documento.receptor.tipoPersona);
		
        

		const numDoc = documento.cuerpoDocumento.length;

		documento.cuerpoDocumento.forEach((cuerpo) => {
			if(!validoParaTipoDte(tipoDte,[FEXE, CRE])) cuerpo.tipoItem = Number(cuerpo.tipoItem);
			cuerpo.numItem = Number(cuerpo.numItem);
			cuerpo.codTributo = cuerpo.codTributo == "" ? null : cuerpo.codTributo;
			if(!validoParaTipoDte(tipoDte, CRE))cuerpo.cantidad = Number(cuerpo.cantidad);
			if(!validoParaTipoDte(tipoDte, CRE))cuerpo.precioUni = Number(cuerpo.precioUni);

			if(cuerpo.tributos != null) cuerpo.tributos = cuerpo.tributos.length > 2 ? String(cuerpo.tributos).split(',') : [cuerpo.tributos];

			if(validoParaTipoDte(tipoDte,[FE])) cuerpo.tributos = null;
			
			cuerpo.numeroDocumento = cuerpo.numeroDocumento == "" ? null : cuerpo.numeroDocumento;
			if(!validoParaTipoDte(tipoDte, CRE)) cuerpo.uniMedida = Number(cuerpo.uniMedida);
			if(!validoParaTipoDte(tipoDte, CRE)) cuerpo.montoDescu = Number(cuerpo.montoDescu);

			if(!validoParaTipoDte(tipoDte,[FSEE,CRE])) cuerpo.ventaGravada = Number(cuerpo.ventaGravada);
			if(!validoParaTipoDte(tipoDte,[FEXE, FSEE, CRE])) cuerpo.ventaExenta = Number(cuerpo.ventaExenta);
			
			if(tipoDte == FE) cuerpo.ivaItem = Number(cuerpo.ivaItem);

			if(!validoParaTipoDte(tipoDte,[FEXE, FSEE, CRE]))  cuerpo.ventaNoSuj = Number(cuerpo.ventaNoSuj);
			if(!validoParaTipoDte(tipoDte,[FSEE, CRE, NDE, NCE])) cuerpo.noGravado = Number(cuerpo.noGravado);
			if(!validoParaTipoDte(tipoDte,[FEXE, FSEE, CRE, NDE, NCE])) cuerpo.psv = Number(cuerpo.psv);

			if(validoParaTipoDte(tipoDte,[FSEE])) cuerpo.compra = Number(cuerpo.compra);

			if(validoParaTipoDte(tipoDte,[CRE])) cuerpo.ivaRetenido = Number(cuerpo.ivaRetenido);
			if(validoParaTipoDte(tipoDte,[CRE])) cuerpo.tipoDoc =  cuerpo.tipoDoc>0 ? Number(cuerpo.tipoDoc): null ;
			if(validoParaTipoDte(tipoDte,[CRE])) cuerpo.montoSujetoGrav = Number(cuerpo.montoSujetoGrav);
			

			
		})


		if(validoParaTipoDte(tipoDte, [NCE])){
			console.log("nota de credito",tipoDte)
			documento.documentoRelacionado.forEach((docRelacionado) => {
				docRelacionado.tipoGeneracion = Number(docRelacionado.tipoGeneracion)
			})
			
		} 


		//validacion de resumen
		if(!validoParaTipoDte(tipoDte, [FSEE, CRE, NDE, NCE])) documento.otrosDocumentos = documento.otrosDocumentos==null || documento.otrosDocumentos.length == 0 ? null : documento.otrosDocumentos;

		if(!validoParaTipoDte(tipoDte, [FEXE, FSEE, CRE])) documento.resumen.totalNoSuj = Number(documento.resumen.totalNoSuj);
		if(!validoParaTipoDte(tipoDte, [FEXE, FSEE, CRE])) documento.resumen.descuNoSuj = Number(documento.resumen.descuNoSuj);

		if(tipoDte == FE) documento.resumen.totalIva = Number(documento.resumen.totalIva);

		if(!validoParaTipoDte(tipoDte, [FEXE, CRE])) documento.resumen.ivaRete1 = Number(documento.resumen.ivaRete1);
		if(!validoParaTipoDte(tipoDte, [FEXE, FSEE, CRE])) documento.resumen.subTotalVentas = Number(documento.resumen.subTotalVentas);
		if(!validoParaTipoDte(tipoDte, [FEXE, CRE])) documento.resumen.subTotal = Number(documento.resumen.subTotal);
		if(!validoParaTipoDte(tipoDte, [FEXE, CRE])) documento.resumen.reteRenta = Number(documento.resumen.reteRenta);

		if(validoParaTipoDte(tipoDte, [FEXE])) documento.resumen.flete = Number(documento.resumen.flete);
		if(validoParaTipoDte(tipoDte, [FEXE])) documento.resumen.seguro = Number(documento.resumen.seguro);

		if(!validoParaTipoDte(tipoDte, [CRE])){
			const pagos = documento.resumen.pagos;
		if(pagos!=null && pagos.length > 0) {
			documento.resumen.pagos.forEach(pago => {
				pago.montoPago = Number(pago.montoPago);
				pago.periodo = pago.periodo = pago.periodo>0 ? Number(pago.periodo): null ;

			});
		}
		}

		if(validoParaTipoDte(tipoDte,[FEXE])) documento.resumen.descuento = Number(documento.resumen.descuento); 

		if(!validoParaTipoDte(tipoDte, [FEXE, FSEE, CRE])) documento.resumen.descuExenta = Number(documento.resumen.descuExenta);

		if(!validoParaTipoDte(tipoDte, [CRE])) documento.resumen.totalDescu = Number(documento.resumen.totalDescu);

		if(!validoParaTipoDte(tipoDte, [FEXE, FSEE, CRE])) documento.resumen.descuGravada = Number(documento.resumen.descuGravada);

		if(!validoParaTipoDte(tipoDte,[FSEE, CRE, NCE, NDE])) documento.resumen.porcentajeDescuento = Number(documento.resumen.porcentajeDescuento);

		if(!validoParaTipoDte(tipoDte,[FSEE, CRE])) documento.resumen.montoTotalOperacion = Number(documento.resumen.montoTotalOperacion);
		// if(validoParaTipoDte(tipoDte,[FE])) documento.resumen.totalVenta = Number(documento.resumen.totalVenta);
		if(!validoParaTipoDte(tipoDte,[FSEE, CRE ,NDE , NCE])) documento.resumen.totalNoGravado = Number(documento.resumen.totalNoGravado);
		if(!validoParaTipoDte(tipoDte, [FEXE, FSEE, CRE, NDE, NCE])) documento.resumen.saldoFavor = Number(documento.resumen.saldoFavor);
		if(!validoParaTipoDte(tipoDte, [FEXE, FSEE, CRE])) documento.resumen.totalExenta = Number(documento.resumen.totalExenta);

		if(validoParaTipoDte(tipoDte,[FSEE])) documento.resumen.totalCompra = Number(documento.resumen.totalCompra);
		if(validoParaTipoDte(tipoDte,[FSEE])) documento.resumen.descu = Number(documento.resumen.descu);

		if(!validoParaTipoDte(tipoDte,[CRE, NDE, NCE])) documento.resumen.totalPagar = Number(documento.resumen.totalPagar);
		if(!validoParaTipoDte(tipoDte,[FSEE, CRE])) documento.resumen.totalGravada = Number(documento.resumen.totalGravada);

		if(!validoParaTipoDte(tipoDte,[NRE, CRE])) documento.resumen.condicionOperacion = Number(documento.resumen.condicionOperacion);

		if(validoParaTipoDte(tipoDte, [NCE])) documento.resumen.condicionOperacion = Number(documento.resumen.condicionOperacion);

		if(validoParaTipoDte(tipoDte,[CCFE, NDE, NCE])) documento.resumen.ivaPerci1 = Number(documento.resumen.ivaPerci1);


		if(validoParaTipoDte(tipoDte,[CRE])) documento.resumen.totalSujetoRetencion = Number(documento.resumen.totalSujetoRetencion);
		if(validoParaTipoDte(tipoDte,[CRE])) documento.resumen.totalIVAretenido = Number(documento.resumen.totalIVAretenido);
		//if(validoParaTipoDte(tipoDte,[CRE])) documento.resumen.totalIVAretenidoLetras = Number(documento.resumen.totalIVAretenidoLetras);
       


		console.log(documento);

		return documento;
	}

	function mensaje(t, txt, stilo) {

		new PNotify({
			title: t,
			text: txt,
			type: stilo,
			styling: 'bootstrap3'
		});
	}

    /**/
    function actualizarEstadoDte(estado){
        
          var Datos = { 
              "numeroControl": numeroControl,
              "estado": estado,
            "codigoGeneracion": codigoGeneracion,};

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
   async function GuardaJson(jsonDtef,jsonDte){
        
          var Datos = { 
              "numeroControl": numeroControl,
              "jsonDte": jsonDte,
              "jsonDtef": jsonDtef,
            "codigoGeneracion": codigoGeneracion,};

        var url = "<?php echo base_url("mhdte/integracion/guardarJsonFirma");?>";
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

</script>
