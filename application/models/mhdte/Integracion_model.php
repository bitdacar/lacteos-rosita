<?php
defined( 'BASEPATH' ) OR exit( 'No direct script access allowed' );

class Integracion_model extends CI_Model {

    public function save( $data ) {
        return $this->db->insert( "resumen", $data );
    }

    public function InArchivo(  $data ) {

        return $this->db->insert("integracion",$data);

    } 
    public function BorrarTabla() {

        $this->db->empty_table("integracion");

    } 
    public function BorrarTabla2() {
        $this->db->where("c1","CodigoGeneracion");
        $this->db->empty_table("integracion");


    }


    public function agrupa() {
        $this->db->select("c4,c6");
        $this->db->from("integracion");

        $this->db->group_by("c4");
        $resultados=$this->db->get();
        return $resultados->result();  

    }

    public function selectTodo($numeroControl){
        /*$this->db->select("c4,c6");
    $this->db->where("c4",$numeroControl);

    $this->db->from("integracion");

    $resultados=$this->db->get();*/
        $query = 'SELECT c4,c6 FROM integracion WHERE c4 ='.$numeroControl.'';

        $resultados = $this->db->query( $query );
        return $resultados->result();

    }
    public function savePartida( $data ) {
        return $this->db->insert( "tblpartidacontable", $data );
    }
    public function consultaPartida( $numeroControl,$codigoGeneracion ) {

        $this->db->where("numControlFact",$numeroControl);
        $this->db->where("codigoGeneracion",$codigoGeneracion);
        $resultados = $this->db->get("tblpartidacontable");
        return $resultados->result();
    }

    public function ingresoEcompras($data){
        return $this->db->insert( "compras", $data );

    } 
    public function ingresoDcompras($data){
        return $this->db->insert( "det_compras", $data );

    }
    public function Rcompras($numeroControl2,$codigoGeneracion2){
        $this->db->select("numControl,codGeneracion,cantidad,descripcion,precio,precio subtotal,id item,TvtaExenta,TvtaGravada,Iva1,Iva13,subTotalIva1");
        $this->db->where("numControl",$numeroControl2);
        $this->db->where("codGeneracion",$codigoGeneracion2);
        $resultados = $this->db->get("det_compras");
        return $resultados->result();


    }
    public function delete($data){
        return $this->db->delete('det_compras',$data);

    }

    public function MbuscarDteAnular($codGen){
        $query="select 
        i.tipodoc, 
        i.numeroControl,
        i.codigoGeneracion,
        bf.selloRecibido numrecepcionMH, 
        i.fecha,i.hora,
        replace(rc.nit,'-','') nit,replace(rc.numDoc,'-','') numDoc,
        rc.tipDoc  ,
        rc.correoReceptor ,rc.telReceptor ,r.iva13, '' codigoGeneracionR,rc.NomDenominacion
        from resumen r 
join receptordocumen rd on rd.numeroControl =r.numeroControl and rd.codigoGeneracion =r.codigoGeneracion 
join identificacion i on i.numeroControl=r.numeroControl and i.codigoGeneracion =r.codigoGeneracion 
join receptor rc on rc.codigo = rd.idReceptor 
join bitacorafactura bf on bf.codigoGeneracion =r.codigoGeneracion 
where bf.estado ='PROCESADO' and bf.codigoGeneracion ='".$codGen."' and i.estado in (1,2) order by i.tipoDoc asc ";
        $resultados = $this->db->query( $query );
        return $resultados->result();

    }
    public function GuardarAnulacion($anulacionTotal,$codigoGeneracion,$fecha){
        $query = "INSERT INTO anulacion (archivo,codGeneracion,fecha,respuestaMH)
        VALUES ('".json_encode($anulacionTotal)."','".$codigoGeneracion."','".$fecha."','An')";
        $resultados = $this->db->query( $query );
        return $resultados;

    }

    public function guardarJsonFirma($num,$cod,$jsondte){
        $this->db->where("numeroControl",$num);
        $this->db->where("codigoGeneracion",$cod);
        $resultado = $this->db->update("receptordocumen",$jsondte);
        return $this->db->affected_rows();

    } 

    public function guardarcontingencia($cod,$fecha,$jsondte){

        $query = "INSERT INTO anulacion (archivo,codGeneracion,fecha,respuestaMH)
        VALUES ('".json_encode($jsondte)."','".$cod."','".$fecha."','Ctg')";
        $resultados = $this->db->query( $query );
        return $resultados;

    } 

   
    public function traesello($cod){
        $this->db->select("selloRecibido,observaciones");
        $this->db->where("codigoGeneracion",$cod);
        $this->db->where("estado","PROCESADO");
        $resultados =  $this->db->get( "bitacorafactura" );

        return $resultados->result();
    }

    public function creaContingencia(){
        $query = "select * from identificacion where estado=3 and tipoDoc in(1,3,4,5,6,11,14)";
        $resultados = $this->db->query( $query );

        return $resultados->result();


    }

    public function crealoteConti($codigoGeneracion2){

        $this->db->where("codGeneracion",$codigoGeneracion2);
        $resultados = $this->db->get("anulacion");
        return $resultados->result();
    }
    public function consultaEnviCobol($f1,$f2){

        $query="select * from anulacion a where fecha  between  '".$f1."' and  '".$f2."' and respuestaMH ='CO';";
        $resultados = $this->db->query( $query );
        return $resultados->result();
    }
    public function consultaEnviCobolRep($codigo){

        $query="select * from anulacion a where codGeneracion= '".$codigo."' and respuestaMH ='CO';";
        $resultados = $this->db->query( $query );
        return $resultados->result();
    }
    public function partidaContable(){

        $query="select * from tblpartidacontable where estado =1";
        $resultados = $this->db->query( $query );
        return $resultados->result();
    }
    public function partidaContableActualiza($numeroControl,$codigoGeneracion){

        $query="update tblpartidacontable set estado=2 where numControlFact='".$numeroControl."' and codigoGeneracion='".$codigoGeneracion."'";
        //$resultados = $this->db->query( $query );
        return $this->db->affected_rows();
    }
    public function reporteExtras($numeroControl,$codigoGeneracion){

        $query="select rc.NomDenominacion,i.fecha ,i.hora,q.areafact,q.item,c.codFormaPago,c.iva13,cd.ivaPercibido,c.totalMonSujRet ,
        cd.ivaRetenido,c.totalGravada,c.montoPorFormaPag,c.condicionOpera
from receptordocumen r 
join receptor rc on r.idReceptor =rc.codigo 
join resumen c ON r.numeroControl=c.numeroControl and r.codigoGeneracion =c.codigoGeneracion 
join Cuerpodocumento cd ON cd.numeroControl=c.numeroControl and cd.codigoGeneracion =c.codigoGeneracion  
join identificacion i on i.numeroControl =r.numeroControl and i.codigoGeneracion=r.codigoGeneracion
left join (select numeroControl, codigoGeneracion,count(c.item) item, c.areafact 
			from Cuerpodocumento c where c.numeroControl ='".$numeroControl."' 
and c.codigoGeneracion ='".$codigoGeneracion."'
	 ) as q on q.numeroControl=i.numeroControl and q.codigoGeneracion=i.codigoGeneracion
where
r.numeroControl ='".$numeroControl."' 
and r.codigoGeneracion ='".$codigoGeneracion."';";
        $resultados = $this->db->query( $query );
        return $resultados->result();
    }
    public function DescargaAnulacion($f1,$f2){
        
        $query="select * from anulacion a where fecha  between  '".$f1."' and  '".$f2."' and respuestaMH ='An';";
        $resultados = $this->db->query( $query );
        return $resultados->result();
    }
    
     public function ConsultasGenerales( $fini,$ffin,$area,$txt,$id ,$codestab) {

        $query="select r.condicionOpera , c.numeroControl,c.codigoGeneracion,c.areafact,round(sum( c.ventasGravadas),3) ventasGravadas ,
        round(sum(c.ivaItem) ,3) ivaItem,i.* from identificacion i  
join Cuerpodocumento c on c.numeroControl =i.numeroControl 
and c.codigoGeneracion =i.codigoGeneracion 
join resumen r on r.numeroControl =i.numeroControl  
join bitacorafactura bf on bf.codigoGeneracion=i.codigoGeneracion 
and r.codigoGeneracion =i.codigoGeneracion 
where fecha BETWEEN '".$fini."' and '".$ffin."'
and i.estado ='".$id."' ".$txt." and bf.estado ='PROCESADO' 
and substr(r.numeroControl,8,8)='".$codestab."'
group by i.codigoGeneracion order by fecha,substr(r.numeroControl,5,2) ,r.condicionOpera,areafact";

        $resultados = $this->db->query( $query );
        return $resultados->result();

    }

 public function ConsultasXusuarios( $fini,$ffin,$area,$txt,$id ) {
   
        $query="select i.numeroControl,i.codigoGeneracion,i.estado,r.totalGravada ventasGravadas,r.iva13 ivaItem ,i.fecha 
from identificacion i 
join bitacorafactura b on b.codigoGeneracion =i.codigoGeneracion
join resumen r on r.codigoGeneracion =i.codigoGeneracion and r.numeroControl = i.numeroControl 
WHERE 
i.fecha BETWEEN '".$fini."' and '".$ffin."'
and b.estado ='PROCESADO'
and substr(i.numeroControl,8,8)='".$area."' and substr(i.numeroControl,5,2) in ($txt) ";

        $resultados = $this->db->query( $query );
        return $resultados->result();

    }
  public function vendedor( $area ) {
         
         $query=("select t.cNombre  from tblcxvendedor v join tblusuario t on t.cUname = v.cod_usuario where t.codestab='".$area."'");
        $resultados = $this->db->query( $query );
        return $resultados->result();
     }

public function consultaReimpresion($estado,$fini,$ffin){
    
    $query="select distinct i.numeroControl ,i.codigoGeneracion ,rc.codigo ,
rc.nomComercial , r.totalGravada, i.fecha,i.hora ,rd.reporte,
c.areafact 
from identificacion i  
join resumen r on r.numeroControl =i.numeroControl 
and r.codigoGeneracion =i.codigoGeneracion 
join receptordocumen rd on rd.numeroControl =i.numeroControl  
and rd.codigoGeneracion =i.codigoGeneracion
join receptor rc on rc.codigo =rd.idReceptor 
join Cuerpodocumento c on c.numeroControl =r.numeroControl 
and c.codigoGeneracion =r.codigoGeneracion 
where i.fecha >= '".$fini."' and i.fecha <= '".$ffin."'
and i.estado ='".$estado."' order by i.tipoDoc  asc";
     $resultados = $this->db->query( $query );
        return $resultados->result();
    
}
    
    public function CargaUnoUno($estado,$fini){
        $query="select r2.codigo ,r2.NomDenominacion ,r2.ncr ,r2.numDoc ,r2.nit ,b.descripcionMsg,b.codigoGeneracion, b.observaciones,r.numeroControl, r.totalGravada,r.totalIvaRetenido,r.nombreTributo  from bitacorafactura b 
join resumen r on r.codigoGeneracion =b.codigoGeneracion 
join receptordocumen re on re.codigoGeneracion =r.codigoGeneracion  
left join receptor r2 on r2.codigo =re.idReceptor 
where  b.codigoGeneracion in (select codigoGeneracion from identificacion i where estado=$estado and i.fecha='".$fini."') ";
        $resultados = $this->db->query( $query );
        return $resultados->result();
        
        
    }
    
    public function CargaRenvio($estado,$fini,$codestab){
        
        $query="select i.numeroControl,i.codigoGeneracion ,i.fecha,i.hora  ,c.ventasGravadas  from identificacion i 
            join Cuerpodocumento c on i.numeroControl =c.numeroControl  and i.codigoGeneracion =c.codigoGeneracion 
            where 
            i.estado=$estado and i.fecha ='".$fini."' and substr(i.numeroControl,8,8) ='".$codestab."'";
        $resultados = $this->db->query( $query );
        return $resultados->result();
        
    }
    
    public function  TraeReimp($estado,$fini){
        
        $query="select id,codGeneracion,fecha from anulacion
            where 
            respuestaMH='".$estado."' and fecha ='".$fini."' ";
        $resultados = $this->db->query( $query );
        return $resultados->result();
        
    }
    public function getReporteMensual($id,$codGeneracion){
        $query="select archivo from anulacion
            where 
            codGeneracion='".$codGeneracion."' and id ='".$id."' ";
        $resultados = $this->db->query( $query );
        return $resultados->result();
        
    }
}