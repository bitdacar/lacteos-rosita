<?php
defined( 'BASEPATH' ) OR exit( 'No direct script access allowed' );

class Reporte_Libro_model extends CI_Model {

    public function LBCT( $fini,$ffin ) {

    $query="
SELECT SUBSTRING(r2.numeroControl, 5, 2) tipo, CONCAT( SUBSTRING(r2.numeroControl, 1,6)  ,'-',TRIM(LEADING '0' FROM SUBSTRING(r2.numeroControl, -15)) )TipoDocumento,
r2.codigoGeneracion,
r.codigo,r.NomDenominacion,r.ncr,
r2.fecha,
r3.totalExenta,
r3.totalGravada,r3.iva13,r3.ivaPercibido
from receptor r
join receptordocumen r2 on r2.idReceptor =r.codigo 
join resumen r3 on (r3.codigoGeneracion =r2.codigoGeneracion and r3.numeroControl =r2.numeroControl )
join bitacorafactura b on (b.codigoGeneracion=r2.codigoGeneracion)
join identificacion i on (i.codigoGeneracion=r2.codigoGeneracion)
where
-- r.granContribuyente ='S' and
r.ncr not in ('00000-0')
and b.estado ='PROCESADO' and SUBSTRING(r2.numeroControl, 5, 2) in ('03','05')
and r2.fecha BETWEEN '".$fini."' and '".$ffin."'
and i.estado=1
order by CAST(TRIM(LEADING '0' FROM SUBSTRING(r2.numeroControl, -15))AS UNSIGNED) ASC, SUBSTRING(r2.numeroControl, 5, 2) ASC";

        $resultados = $this->db->query( $query );
        return $resultados->result();

    }
    
    public function LBCF( $fini,$ffin ) {

    $query="

SELECT  SUBSTRING(r2.numeroControl, 5, 2) tipo,CONCAT( SUBSTRING(r2.numeroControl, 1,6)  ,'-',TRIM(LEADING '0' FROM SUBSTRING(r2.numeroControl, -15)) )TipoDocumento,
r2.codigoGeneracion,
r.codigo,r.NomDenominacion, ' ' ncr,
r2.fecha,
r3.totalExenta,
r3.totalGravada,r3.iva13,r3.ivaPercibido
from receptor r
join receptordocumen r2 on r2.idReceptor =r.codigo 
join resumen r3 on (r3.codigoGeneracion =r2.codigoGeneracion and r3.numeroControl =r2.numeroControl )
join bitacorafactura b on (b.codigoGeneracion=r2.codigoGeneracion)
join identificacion i on (i.codigoGeneracion=r2.codigoGeneracion)
where
b.estado ='PROCESADO' and SUBSTRING(r2.numeroControl, 5, 2) in ('01','11')
and r2.fecha BETWEEN '".$fini."' and '".$ffin."'
and i.estado=1
order by CAST(TRIM(LEADING '0' FROM SUBSTRING(r2.numeroControl, -15))AS UNSIGNED) ASC";

        $resultados = $this->db->query( $query );
        return $resultados->result();

    }
    
    public function LCCS( $fini,$ffin ) {

    $query="(SELECT  SUBSTRING(r2.numeroControl, 5, 2) tipo,'' ncr,CONCAT( SUBSTRING(r2.numeroControl, 1,6)  ,'-',TRIM(LEADING '0' FROM SUBSTRING(r2.numeroControl, -15)) )TipoDocumento,
r2.codigoGeneracion,
r.codigo,r.NomDenominacion,
r2.fecha,
r3.totalExenta,
r3.totalGravada,r3.iva13,r3.totalIvaRetenido,r3.ivaPercibido
from receptor r
join receptordocumen r2 on r2.idReceptor =r.codigo 
join resumen r3 on (r3.codigoGeneracion =r2.codigoGeneracion and r3.numeroControl =r2.numeroControl )
join bitacorafactura b on (b.codigoGeneracion=r2.codigoGeneracion)
join identificacion i on (i.codigoGeneracion=r2.codigoGeneracion)
join cuerpodocumento c on ( c.codigoGeneracion=r2.codigoGeneracion and c.codRetencion ='C4')
where
b.estado ='PROCESADO' and SUBSTRING(r2.numeroControl, 5, 2) in ('07')
and r2.fecha BETWEEN '".$fini."' and '".$ffin."'
and i.estado=1
order by CAST(TRIM(LEADING '0' FROM SUBSTRING(r2.numeroControl, -15))AS UNSIGNED) ASC)
union all
(SELECT  SUBSTRING(r2.numeroControl, 5, 2) tipo,'' ncr,CONCAT( SUBSTRING(r2.numeroControl, 1,6)  ,'-',TRIM(LEADING '0' FROM SUBSTRING(r2.numeroControl, -15)) )TipoDocumento,
r2.codigoGeneracion,
r.codigo,r.NomDenominacion,
r2.fecha,
r3.totalExenta,
r3.totalGravada,r3.iva13,r3.totalIvaRetenido,r3.ivaPercibido
from receptor r
join receptordocumen r2 on r2.idReceptor =r.codigo 
join resumen r3 on (r3.codigoGeneracion =r2.codigoGeneracion and r3.numeroControl =r2.numeroControl )
join bitacorafactura b on (b.codigoGeneracion=r2.codigoGeneracion)
join identificacion i on (i.codigoGeneracion=r2.codigoGeneracion)
where
b.estado ='PROCESADO' and SUBSTRING(r2.numeroControl, 5, 2) in ('14')
and r2.fecha BETWEEN '".$fini."' and '".$ffin."'
and i.estado=1
order by CAST(TRIM(LEADING '0' FROM SUBSTRING(r2.numeroControl, -15))AS UNSIGNED) ASC)";

        $resultados = $this->db->query( $query );
        return $resultados->result();

    }

  
    public function resumenesLibros($fini,$ffin){
        
        
$query="
(select ifnull(sum(r3.totalGravada),'0.00') gravada ,ifnull(sum(r3.iva13),'0.00') iva
from receptor r
join receptordocumen r2 on r2.idReceptor =r.codigo 
join resumen r3 on (r3.codigoGeneracion =r2.codigoGeneracion and r3.numeroControl =r2.numeroControl )
join bitacorafactura b on (b.codigoGeneracion=r2.codigoGeneracion)
join identificacion i on (i.codigoGeneracion=r2.codigoGeneracion)
where
b.estado ='PROCESADO' and SUBSTRING(r2.numeroControl, 5, 2) in ('01')
and r2.fecha BETWEEN '".$fini."' and '".$ffin."'
and i.estado=1)
union all
(select ifnull(sum(r3.totalGravada),'0.00') gravada ,ifnull(sum(r3.iva13),'0.00') iva
from receptor r
join receptordocumen r2 on r2.idReceptor =r.codigo 
join resumen r3 on (r3.codigoGeneracion =r2.codigoGeneracion and r3.numeroControl =r2.numeroControl )
join bitacorafactura b on (b.codigoGeneracion=r2.codigoGeneracion)
join identificacion i on (i.codigoGeneracion=r2.codigoGeneracion)
where
b.estado ='PROCESADO' and SUBSTRING(r2.numeroControl, 5, 2) in ('11')
and r2.fecha BETWEEN '".$fini."' and '".$ffin."'
and i.estado=1)";

        $resultados = $this->db->query( $query );
        return $resultados->result();


        
    }
    
}