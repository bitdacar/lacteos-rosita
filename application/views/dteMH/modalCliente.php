<script>
	$(document).ready(function() {

		buscarClientes();

		listarReceptorPorCodigo();

	});


	// ejemplo de como obtener datos, pero no funcion en ready
	async function obtenerPaginacion() {
		const url = "<?php echo base_url('mhdte/receptor/obtenerPaginacion'); ?>";
		try {
			const response = await fetch(url, {
				method: 'POST'
			});
			if (!response.ok) {
				throw new Error('Network response was not ok');
			}
			const data = await response.text();
			return data;
		} catch (error) {
			console.error('There has been a problem with your fetch operation:', error);
		}
	}

	function listarReceptorPorCodigo() {
		$('#txt1').on("input", function() {

			if ($('#txt1').val().length > 1) {
				var Datos = {
					"codigo": $('#txt1').val(),
				};

				var url = "<?php echo base_url("mhdte/receptor/listaBuscarCliente"); ?>";
				$.ajax({
					type: "POST",
					url: url,
					data: Datos,
					success: function(data) {

						arregleclientes = JSON.parse(data);
						$("#select_cliente").empty();

						grancontribuyente = '';

						arregleclientes.forEach(function(item, index) {
							$('#select_cliente').append('<option value="' + item.codigo + '">' + item.NomDenominacion + '</option>');
						});

						// if (arregleclientes.length == 1) {
						// 	grancontribuyente = arregleclientes[0]['granContribuyente'];
						// }
					}
				});

			}


		});

	}

	async function buscarClientes() {

		var url = "<?php echo base_url("mhdte/receptor/listaBuscarCliente"); ?>";

		var Datos = {
			"nombre": $('#buscar_cliente').val()
		};

		await $.ajax({
			type: "POST",
			url: url,
			data: Datos,
			success: async function(data) {
				lista_receptor = JSON.parse(data);

				await $('#tbl_receptor').DataTable({
					"processing": false,
					"destroy": true,
					paging: true,
					scrollCollapse: true,
					searching: true,
					ordering: true,
					select: true,
					language: {
						"lengthMenu": "Mostrar _MENU_ registros por pagina",
						"zeroRecords": "No se encontraron resultados en su busqueda",
						"searchPlaceholder": "Buscar registros",
						"info": "Mostrando registros de _START_ al _END_ de un total de _TOTAL_ registros",
						"infoEmpty": "No existen registros",
						"infoFiltered": "(filtrado de un total de _MAX_ registros)",
						"search": "Buscar:",
						paginate: {
							"first": '<i class="fa fa-angle-double-left"></i>',
							"last": '<i class="fa fa-angle-double-right"></i>',
							"next": '<i class="fa fa-angle-right"></i>',
							"previous": '<i class="fa fa-angle-left"></i>'
						}
					},
					"aaData": lista_receptor,
					"columns": [{
							"data": "codigo"
						},
						{
							"data": "NomDenominacion"
						},
					],
				});

				await $('#tbl_receptor tbody').on('click', 'tr', function() {
					var data = $('#tbl_receptor').DataTable().row(this).data();
					$('#select_cliente').empty();
					$('#txt1').val(data.codigo);
					$('#select_cliente').append('<option value="' + data.codigo + '">' + data.NomDenominacion + '</option>');
					$('#Bcliente').modal('hide');
				});

			}
		});
	}
</script>
<!-- /page content -->
<div id="Bcliente" class="modal fade bs-example-modal-lgCliente" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">

			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">Buscar cliente</h4>
				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="col-md-12 col-sm-12 ">
					<div class="x_panel">
						<div class="x_title">
						</div>
						<div class="x_content">
							<div class="row">
								<div class="col-sm-12">
									<div class="card-box table-responsive table-striped table-hover">

										<table id="tbl_receptor" class="table table-striped table-bordered" style="width:100%">
											<thead>
												<tr>
													<th>Codigo</th>
													<th>Nombre Completo</th>

												</tr>
											</thead>


											<tbody>

											</tbody>
										</table>
										<div id="pagination">

										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>


			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

			</div>

		</div>
	</div>
</div>

<!-- /page content -->
