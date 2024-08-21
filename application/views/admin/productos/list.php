<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			Productos
			<small>Listado</small>
		</h1>
	</section>
	<!-- Main content -->
	<section class="content">
		<!-- Default box -->
		<div class="box box-solid">
			<div class="box-body">
				<div class="row">
					<div class="col-md-12">
						<a href="<?php echo base_url(); ?>mantenimiento/productos/add" class="btn btn-primary btn-flat"><span class="fa fa-plus"></span> Agregar Productos</a>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-md-12">
						<table id="example1" class="table table-bordered table-hover">
							<thead>
								<tr>
									<th>#</th>
									<th>Codigo</th>
									<th>Nombre</th>
									<th>Precio Normal</th>
									<th>Precio Mayoreo</th>
									<th>Cantidad Maxima</th>
									<th>Cantidad Minima</th>
									<th>Categoria</th>
									<th>Opciones</th>
								</tr>
							</thead>
							<tbody>
								<?php if (!empty($productos)) : ?>
									<?php foreach ($productos as $producto) : ?>
										<tr>
											<td><?php echo $producto->id; ?></td>
											<td><?php echo $producto->cod_dte; ?></td>
											<td><?php echo $producto->nombre; ?></td>
											<td><?php echo $producto->prc_normal; ?></td>
											<td><?php echo $producto->prc_mayoreo; ?></td>
											<td><?php echo $producto->cantidad_maxima; ?></td>
											<td><?php echo $producto->cantidad_minima; ?></td>
											<td><?php echo $producto->categoria; ?></td>
											<?php $dataproducto = $producto->id . "*" . $producto->cod_dte . "*" . $producto->nombre . "*" . $producto->prc_normal . "*" . $producto->prc_mayoreo . "*" . $producto->cantidad_maxima . "*" . $producto->cantidad_minima . "*" . $producto->categoria_id; ?>
											<td>
												<div class="btn-group">
													<button type="button" class="btn btn-sm btn-info btn-view-producto" data-toggle="modal" data-target="#modal-default" value="<?php echo $dataproducto; ?>">
														<span class="fa fa-search"></span>
													</button>
													<a href="<?php echo base_url() ?>mantenimiento/productos/edit/<?php echo $producto->id; ?>" class="btn btn-sm btn-warning"><span class="fa fa-pen"></span></a>
													<a href="<?php echo base_url(); ?>mantenimiento/productos/delete/<?php echo $producto->id; ?>" class="btn btn-sm btn-danger btn-remove"><span class="fa fa-remove"></span></a>
												</div>
											</td>
										</tr>
									<?php endforeach; ?>
								<?php endif; ?>
							</tbody>
						</table>
						<?php echo $pagination; ?>
					</div>
				</div>
			</div>
			<!-- /.box-body -->
		</div>
		<!-- /.box -->
	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<div class="modal fade" id="modal-default">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">Informacion de la Categoria</h4>
			</div>
			<div class="modal-body">

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger pull-left" data-dismiss="modal">Cerrar</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->
