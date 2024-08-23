<?php
defined( 'BASEPATH' ) OR exit( 'No direct script access allowed' );

class resumen_model extends CI_Model {

    public function save( $data ) {
        return $this->db->insert( "resumen", $data );
    }
    public function savetho( $data,$num,$cod ) {
        $this->db->where('numeroControl',$num);
        $this->db->where('codigoGeneracion',$cod);
        $q = $this->db->get('resumen');

        if ( $q->num_rows() > 0 ) 
        {
            $this->db->where('numeroControl',$num);
            $this->db->where('codigoGeneracion',$cod);
            return   $this->db->update('resumen',$data);
        } else {
            //  $this->db->where('codigoGeneracion',$cod); $this->db->where('numeroControl',$num);
            return   $this->db->insert('resumen',$data);
        }


    }

    public function update( $id, $data ) {
        $this->db->where( "id", $id );
        return $this->db->update( "productos", $data );
    }

    public function getProductos() {
        $this->db->select( "p.*,c.nombre as categoria" );
        $this->db->from( "productos p" );
        $this->db->join( "categorias c", "p.categoria_id = c.id" );
        $this->db->where( "p.estado", "1" );
        $resultados = $this->db->get();
        return $resultados->result();
    }

    public function getProducto( $id ) {
        $this->db->where( "id", $id );
        $resultado = $this->db->get( "productos" );
        return $resultado->row();
    }

    public function consultaArchivo( $id, $fecha,$fini,$ffin ) {

        $query="select i.* from identificacion i  
        where fecha>= '".$fini."' and fecha <= '".$ffin."'
        and estado ='".$id."' order by tipoDoc asc";

        $resultados = $this->db->query( $query );
        return $resultados->result();

    }

    public function traedetalle( $id, $fecha ) {

        $query = "select td.c1,td.c2,td.c3,td.c4,
        i.tipodoc, 
        i.numeroControl,
        i.codigoGeneracion,
        bf.selloRecibido numrecepcionMH, 
        '' Numerocontrolint, 
        i.fecha,i.hora,(select t.Codcobol from tblcxvendedor t where  t.cod_usuario=bf.usuario) CodVendedor,
        rd.idReceptor cliente,rc.codClicobol,p.codCobol,rd.cuentaArea,rd.cuentaVende,
        rc.nit,rc.numDoc ,
        rc.ncr ,
        rc.dirComplemento,
        rc.Departamento,
        rc.Municipio , 
        r.condicionOpera,
        r.codFormaPago,	
        r.montoPorFormaPag,	
        r.retencionRenta,
        r.refModalidadPago,	r.plazo	,r.periodoPlazo	,r.numPagoElecNPE	
        ,r.incoterms	,r.descincoterms	,r.observaciones  ConsumoInterno
        ,c.item	,c.tipDTRelacionado	,c.numDocRelacionado	,c.fechaGendoc	,c.cantidad	,c.codigo	
        ,c.areafact	,c.descripcion	,c.precioUnitario	,c.ventasGravadas	,c.ivaItem	,c.montoretencion	,c.codRetencion	
        ,r.ivaRetenido	,replace(c.observacionesItem,'\n',';')	observacionesItem,replace(c.observacionesItems,'\n',';') observacionesItems,c.ivaPercibido	,
        JSON_UNQUOTE(JSON_EXTRACT(sacosEsp,  '$.sacos')) sacos, c.valorUnitario promo,
        rd.destino fexDestino, 
        JSON_UNQUOTE(JSON_EXTRACT(sacosEsp,  '$.contrato')) Contrato, 
        JSON_EXTRACT(nombreTributo,  '$[1].valor') fovial,
        JSON_EXTRACT(nombreTributo,  '$[2].valor') cotrans,totalAPagar
        from resumen r 
        join Cuerpodocumento c on r.numeroControl=c.numeroControl and r.codigoGeneracion =c.codigoGeneracion 
        join receptordocumen rd on rd.numeroControl =c.numeroControl and rd.codigoGeneracion =c.codigoGeneracion 
        join identificacion i on i.numeroControl=c.numeroControl and i.codigoGeneracion =c.codigoGeneracion 
        join receptor rc on rc.codigo = rd.idReceptor
        join bitacorafactura bf on bf.codigoGeneracion =c.codigoGeneracion 
        left join productos p on (p.codigo=c.codigo and p.area=c.areafact) 
        left join tblextras_dte td on r.numeroControl =td.numeroControl  and r.codigoGeneracion =td.codigoGeneracion 
        where
        (c.numeroControl= '".$id."' and
        c.codigoGeneracion='".$fecha."' and
        bf.estado ='PROCESADO') order by i.tipoDoc asc";
        // colocar de identificacion aquellos dn estado '2' cuandoya ha sido enviado a conta
        //c.codigoGeneracion='".$fecha."')";

        $resultados = $this->db->query( $query );
        return $resultados->result();

    }
    public function traedetalleIni( $id, $fecha ) {
        /*$this->db->where( "estado", $id );
        $this->db->where( "fecha", $fecha );
        $resultado = $this->db->get( "receptordocumen" );
        return $resultado->row();
        */
        $query = "
select 
a.tipoDoc, a.numeroControl,a.codigoGeneracion,'' numrecepcionMH,'' numeroControlInt,
date_format(a.fecha, '%d-%m-%Y') fecha,
a.hora,'' tipoCliente ,b.idReceptor cliente,d.ncr,d.nit ,d.numDoc DUI,LPAD(d.dirComplemento,50,' ') dirComplemento ,d.Departamento, d.Municipio  ,c.item,c.identificador,
c.cantidad,c.codigo,c.areafact,c.descripcion,c.precioUnitario,
c.ventasGravadas,c.ivaItem,r.ivaRetenido,r.ivaPercibido,r.iva13
,p.CtaInv ,p.CtaIng ,p.CtaGas ,
r.condicionOpera, r.codFormaPago,r.montoPorFormaPag,
r.plazo,r.periodoPlazo,r.numPagoElecNPE,
r.refModalidadPago,
JSON_EXTRACT(nombreTributo,  '$[1].valor') fovial,
JSON_EXTRACT(nombreTributo,  '$[2].valor') cotrans
from identificacion A 
JOIN  receptordocumen B on a.numeroControl=b.numeroControl and a.codigoGeneracion=b.codigoGeneracion and a.fecha=b.fecha
JOIN Cuerpodocumento C on a.numeroControl=c.numeroControl and a.codigoGeneracion=c.codigoGeneracion
JOIN resumen r ON a.numeroControl=r.numeroControl and a.codigoGeneracion=r.codigoGeneracion
JOIN receptor d  ON b.idReceptor=d.codigo
 JOIN productos p  ON p.codigo  =c.codigo and p.area =c.areafact 
where  
(c.numeroControl= '".$id."' and
c.codigoGeneracion='".$fecha."')";
        //c.codigoGeneracion='".$fecha."')";

        $resultados = $this->db->query( $query );
        return $resultados->result();

    }

    public function traedetalleRete( $id, $cod ) {
        /*$this->db->where( "estado", $id );
        $this->db->where( "fecha", $fecha );
        $resultado = $this->db->get( "receptordocumen" );
        return $resultado->row();
        */
        $query = "
select 
a.tipoDoc, a.numeroControl,a.codigoGeneracion,'' numrecepcionMH,
date_format(a.fecha, '%Y-%m-%d') fecha,
a.hora,c.ivaRetenido,c.ivaPercibido,r.retencionRenta,r.iva13,
r.condicionOpera, r.codFormaPago,r.montoPorFormaPag,totalAPagar,
	r.plazo,r.periodoPlazo,r.numPagoElecNPE,r.montoTotalOp,
r.refModalidadPago,c.observacionesItem,c.item,c.areafact,c.descripcion,c.montoretencion,c.fechaGendoc,c.subtotal,r.totalIvaRetenido,c.codRetencion,r.totalMonSujRet,c.ventasGravadas,
s.codigo, s.grancontribuyente,s.Nomdenominacion
from identificacion a 
JOIN  receptordocumen b on a.numeroControl=b.numeroControl and a.codigoGeneracion=b.codigoGeneracion and a.fecha=b.fecha
JOIN resumen r ON a.numeroControl=r.numeroControl and a.codigoGeneracion=r.codigoGeneracion
JOIN Cuerpodocumento c on a.numeroControl=c.numeroControl and a.codigoGeneracion=c.codigoGeneracion

join receptor s on s.codigo = b.idReceptor 
where  
(a.numeroControl= '".$id."' and
a.codigoGeneracion='".$cod."')";
        //c.codigoGeneracion='".$fecha."')";

        $resultados = $this->db->query( $query );
        return $resultados->result();

    }

    public function traedetallelee( $id, $fecha ) {
        /*$this->db->where( "estado", $id );
        $this->db->where( "fecha", $fecha );
        $resultado = $this->db->get( "receptordocumen" );
        return $resultado->row();
        */
        $query = "
select 
a.tipoDoc, a.numeroControl,a.codigoGeneracion,'' numrecepcionMH,'' numeroControlInt,
date_format(a.fecha, '%d-%m-%Y') fecha,
a.hora,'' tipoCliente ,b.idReceptor cliente,d.ncr,d.nit ,d.numDoc DUI,LPAD(d.dirComplemento,50,' ') dirComplemento ,d.Departamento, d.Municipio  ,r.ivaRetenido,r.ivaPercibido,r.iva13,

r.condicionOpera, r.codFormaPago,r.montoPorFormaPag,
r.plazo,r.periodoPlazo,r.numPagoElecNPE,
r.refModalidadPago,
JSON_EXTRACT(nombreTributo,  '$[1].valor') fovial,
JSON_EXTRACT(nombreTributo,  '$[2].valor') cotrans
from identificacion A 
JOIN  receptordocumen B on a.numeroControl=b.numeroControl and a.codigoGeneracion=b.codigoGeneracion 

JOIN resumen r ON a.numeroControl=r.numeroControl and a.codigoGeneracion=r.codigoGeneracion
JOIN receptor d  ON b.idReceptor=d.codigo

where  
(a.fecha ='".$fecha."')";
        //c.codigoGeneracion='".$fecha."')";

        $resultados = $this->db->query( $query );
        return $resultados->result();

    }

    public function cuentasxArea($tipoPago,$area){
        $query = "select cuentaxpago from tblc_x_pago txp  where TipoPag ='".$tipoPago."'and  areafac ='".$area."' ";
        $resultados = $this->db->query( $query );
        return $resultados->result();

    }

    public function cuentavendedor($cuentaVende,$uname ){

        $query = "select ".$cuentaVende." cuenta from tblcxvendedor where cod_usuario ='".$uname."' ";
        $resultados = $this->db->query( $query );
        return $resultados->result();

    }

}