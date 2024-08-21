<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');


class Encabezados 
{
    
public function css(){
$ccs='<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">

    <meta name="viewport" content="width=device-width, initial-scale=1">
  
    <style type="text/css">.table{width:100%;max-width:100%;margin-bottom:20px}.table>tbody>tr>td,.table>tbody>tr>th,.table>tfoot>tr>td,.table>tfoot>tr>th,.table>thead>tr>td,.table>thead>tr>th{padding:8px;line-height:1.42857143;vertical-align:top;border-top:1px solid #ddd}.table>thead>tr>th{vertical-align:bottom;border-bottom:2px solid #ddd}.table>caption+thead>tr:first-child>td,.table>caption+thead>tr:first-child>th,.table>colgroup+thead>tr:first-child>td,.table>colgroup+thead>tr:first-child>th,.table>thead:first-child>tr:first-child>td,.table>thead:first-child>tr:first-child>th{border-top:0}.table>tbody+tbody{border-top:2px solid #ddd}.table .table{background-color:#fff}.table-condensed>tbody>tr>td,.table-condensed>tbody>tr>th,.table-condensed>tfoot>tr>td,.table-condensed>tfoot>tr>th,.table-condensed>thead>tr>td,.table-condensed>thead>tr>th{padding:5px}.table-bordered{border:1px solid #ddd}.table-bordered>tbody>tr>td,.table-bordered>tbody>tr>th,.table-bordered>tfoot>tr>td,.table-bordered>tfoot>tr>th,.table-bordered>thead>tr>td,.table-bordered>thead>tr>th{border:1px solid #ddd}.table-bordered>thead>tr>td,.table-bordered>thead>tr>th{border-bottom-width:2px}.table-striped>tbody>tr:nth-of-type(odd){background-color:#f9f9f9}.table-hover>tbody>tr:hover{background-color:#f5f5f5}table col[class*=col-]{position:static;display:table-column;float:none}table td[class*=col-],table th[class*=col-]{position:static;display:table-cell;float:none}.table>tbody>tr.active>td,.table>tbody>tr.active>th,.table>tbody>tr>td.active,.table>tbody>tr>th.active,.table>tfoot>tr.active>td,.table>tfoot>tr.active>th,.table>tfoot>tr>td.active,.table>tfoot>tr>th.active,.table>thead>tr.active>td,.table>thead>tr.active>th,.table>thead>tr>td.active,.table>thead>tr>th.active{background-color:#f5f5f5}.table-hover>tbody>tr.active:hover>td,.table-hover>tbody>tr.active:hover>th,.table-hover>tbody>tr:hover>.active,.table-hover>tbody>tr>td.active:hover,.table-hover>tbody>tr>th.active:hover{background-color:#e8e8e8}.table>tbody>tr.success>td,.table>tbody>tr.success>th,.table>tbody>tr>td.success,.table>tbody>tr>th.success,.table>tfoot>tr.success>td,.table>tfoot>tr.success>th,.table>tfoot>tr>td.success,.table>tfoot>tr>th.success,.table>thead>tr.success>td,.table>thead>tr.success>th,.table>thead>tr>td.success,.table>thead>tr>th.success{background-color:#dff0d8}.table-hover>tbody>tr.success:hover>td,.table-hover>tbody>tr.success:hover>th,.table-hover>tbody>tr:hover>.success,.table-hover>tbody>tr>td.success:hover,.table-hover>tbody>tr>th.success:hover{background-color:#d0e9c6}.table>tbody>tr.info>td,.table>tbody>tr.info>th,.table>tbody>tr>td.info,.table>tbody>tr>th.info,.table>tfoot>tr.info>td,.table>tfoot>tr.info>th,.table>tfoot>tr>td.info,.table>tfoot>tr>th.info,.table>thead>tr.info>td,.table>thead>tr.info>th,.table>thead>tr>td.info,.table>thead>tr>th.info{background-color:#d9edf7}.table-hover>tbody>tr.info:hover>td,.table-hover>tbody>tr.info:hover>th,.table-hover>tbody>tr:hover>.info,.table-hover>tbody>tr>td.info:hover,.table-hover>tbody>tr>th.info:hover{background-color:#c4e3f3}.table>tbody>tr.warning>td,.table>tbody>tr.warning>th,.table>tbody>tr>td.warning,.table>tbody>tr>th.warning,.table>tfoot>tr.warning>td,.table>tfoot>tr.warning>th,.table>tfoot>tr>td.warning,.table>tfoot>tr>th.warning,.table>thead>tr.warning>td,.table>thead>tr.warning>th,.table>thead>tr>td.warning,.table>thead>tr>th.warning{background-color:#fcf8e3}.table-hover>tbody>tr.warning:hover>td,.table-hover>tbody>tr.warning:hover>th,.table-hover>tbody>tr:hover>.warning,.table-hover>tbody>tr>td.warning:hover,.table-hover>tbody>tr>th.warning:hover{background-color:#faf2cc}.table>tbody>tr.danger>td,.table>tbody>tr.danger>th,.table>tbody>tr>td.danger,.table>tbody>tr>th.danger,.table>tfoot>tr.danger>td,.table>tfoot>tr.danger>th,.table>tfoot>tr>td.danger,.table>tfoot>tr>th.danger,.table>thead>tr.danger>td,.table>thead>tr.danger>th,.table>thead>tr>td.danger,.table>thead>tr>th.danger{background-color:#f2dede}.table-hover>tbody>tr.danger:hover>td,.table-hover>tbody>tr.danger:hover>th,.table-hover>tbody>tr:hover>.danger,.table-hover>tbody>tr>td.danger:hover,.table-hover>tbody>tr>th.danger:hover{background-color:#ebcccc}.table-responsive{min-height:.01%;overflow-x:auto}@media screen and (max-width:767px){.table-responsive{width:100%;margin-bottom:15px;overflow-y:hidden;-ms-overflow-style:-ms-autohiding-scrollbar;border:1px solid #ddd}.table-responsive>.table{margin-bottom:0}.table-responsive>.table>tbody>tr>td,.table-responsive>.table>tbody>tr>th,.table-responsive>.table>tfoot>tr>td,.table-responsive>.table>tfoot>tr>th,.table-responsive>.table>thead>tr>td,.table-responsive>.table>thead>tr>th{white-space:nowrap}.table-responsive>.table-bordered{border:0}.table-responsive>.table-bordered>tbody>tr>td:first-child,.table-responsive>.table-bordered>tbody>tr>th:first-child,.table-responsive>.table-bordered>tfoot>tr>td:first-child,.table-responsive>.table-bordered>tfoot>tr>th:first-child,.table-responsive>.table-bordered>thead>tr>td:first-child,.table-responsive>.table-bordered>thead>tr>th:first-child{border-left:0}.table-responsive>.table-bordered>tbody>tr>td:last-child,.table-responsive>.table-bordered>tbody>tr>th:last-child,.table-responsive>.table-bordered>tfoot>tr>td:last-child,.table-responsive>.table-bordered>tfoot>tr>th:last-child,.table-responsive>.table-bordered>thead>tr>td:last-child,.table-responsive>.table-bordered>thead>tr>th:last-child{border-right:0}.table-responsive>.table-bordered>tbody>tr:last-child>td,.table-responsive>.table-bordered>tbody>tr:last-child>th,.table-responsive>.table-bordered>tfoot>tr:last-child>td,.table-responsive>.table-bordered>tfoot>tr:last-child>th{border-bottom:0}}
    body {
        background: #fff;
        margin-top: 10px;
    }

    .text-danger strong {
        color: #9f181c;
    }

    .receipt-main {
        background: #ffffff none repeat scroll 0 0;
        border-bottom: 12px solid #fff;
        border-top: 12px solid #fff;
        margin-top: 5px;
        margin-bottom: 5px;
        padding: 4px 30px !important;
        position: relative;
        box-shadow: 0 1px 21px #acacac;
        color: #333333;
        font-family: open sans;
    }

    .receipt-main p {
        color: #333333;
        font-family: open sans;
        line-height: 1.42857;
    }

    .receipt-footer h1 {
        font-size: 15px;
        font-weight: 400 !important;
        margin: 0 !important;
    }

    .receipt-main::after {
        background: #fff none repeat scroll 0 0;
        content: "";
        height: 5px;
        left: 0;
        position: absolute;
        right: 0;
        top: -13px;
    }

    .receipt-main thead {
        background: #fff none repeat scroll 0 0;
    }

    .receipt-main thead th {
        color: #333333;
    }

    .receipt-right h5 {
        font-size: 16px;
        font-weight: bold;
        margin: 0 0 7px 0;
    }

    .receipt-right p {
        font-size: 12px;
        margin: 0px;
    }

    .receipt-right p i {
        text-align: center;
        width: 18px;
    }

    .receipt-main td {
        padding: 9px 20px !important;
    }

    .receipt-main th {
        padding: 13px 20px !important;
    }

    .receipt-main td {
        font-size: 13px;
        font-weight: initial !important;
    }

    .receipt-main td p:last-child {
        margin: 0;
        padding: 0;
    }

    .receipt-main td h2 {
        font-size: 20px;
        font-weight: 900;
        margin: 0;
        text-transform: uppercase;
    }

    .receipt-header-mid .receipt-left h1 {
        font-weight: 100;
        margin: 34px 0 0;
        text-align: right;
        text-transform: uppercase;
    }

    .receipt-header-mid {
        margin: 24px 0;
        overflow: hidden;
    }

    #container {
        background-color: #dcdcdc;
    }
        table, tr, th{
   font-size:10px;
   text-align: center;
}
    </style></head>';
return $ccs;
}
    
    
    
public function final(){
    $fin=' 
    <script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        

    </script>
</body>

</html>';
return $fin;
}

    
  public  function encabezado($jsonCodigos ,$emisor, $respuestaMH){

$encabezado='<body>
  
<div class="row">
    <div class="receipt-main col-xs-12 col-sm-12 col-md-12 ">
  
        <div class="row">
            <div class="receipt-header">
                <div class="col-xs-4 col-sm-4 col-md-4">
                    <div class="receipt-right  text-right">
                        <p>'.$emisor[0]->nombre.'</p>
                    </div>

                </div>
              
                <div class="col-xs-6 col-sm-6 col-md-6 text-right">
                    <div class="receipt-right">
                    <p><small>DOCUMENTO TRIBUTARIO ELECTRÓNICO - '.$jsonCodigos["dte"].'</small></p>
                    </div>
                </div>
            </div>
        </div>
        <hr>
        <div class="row">
            <div class="receipt-header">
                <div class="col-xs-1 ">
                    <div class="receipt-left">
                        <img class="img-responsive" alt="iamgurdeeposahan"
                            src="'.base_url().'/assets/build/images/cuzlogo.png"
                            style="width: 71px; border-radius: 43px;">
                    </div>

                </div>
                <div class="col-xs-4 ">
                    <div class="receipt-right">
                        <p> </p>
                        <p><small>NIT:'.$emisor[0]->nit.'</small></p>
                        <p><small>'. "NCR: ".$emisor[0]->ncr .'</small></p>
                       <p><small>'. "Actividad económica: ".$emisor[0]->desactEco .'</small></p>
                       <p><small>'. "Dirección: ".$emisor[0]->Direccion .'</small></p>
                       <p><small>'."Teléfono: ".$emisor[0]->telefono .'</small></p>
                       <p><small>'. "Email: ".$emisor[0]->correo .'</small></p>
                       <p><small>'.  "Nombre Comercial: ".$emisor[0]->nomComercial .'</small></p>
                    </div>

                </div>
                <div class="col-xs-4 text-left">
                    <div class="receipt-right">
                        <p><small>Cód. Generación:</small></p>
                        <p><small> '.$jsonCodigos["codigo"].'</small></p>
                        <p><small>Núm. Control: '.$jsonCodigos["numero"].'</small></p>
                       <p><small>Sello de Recepción:</small></p>      
                       <p><small>'.$respuestaMH[0]->selloRecibido.'  </small></p>              
                       <p><small>Módelo de Facturación: Mod. facturación Previo</small></p>
                       <p><small>Tipo de Transmisión: Normal</small></p>
                       <p><small>Fecha y Hora de Generación:'.$respuestaMH[0]->fhProcesamiento .'</small></p>
                    </div>
                </div>
                <div class="col-md-1 ">
                    <div class="receipt-left">
                        <img class="img-responsive" alt="iamgurdeeposahan"
                            src="'.index_page()."?code=https://webapp.dtes.mh.gob.sv/consultaPublica?ambiente=01&codGen=".$jsonCodigos["codigo"]."&fechaEmi=".$jsonCodigos["fecha"].'"
                            width="500" height="500">
                    </div>

                </div>
            </div>
        </div>';

return $encabezado;

}

    
}