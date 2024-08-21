--
-- PostgreSQL database dump
--

-- Dumped from database version 14.12
-- Dumped by pg_dump version 16.3 (Ubuntu 16.3-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: anulacion; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.anulacion (
    id bigint NOT NULL,
    archivo text NOT NULL,
    "codGeneracion" character varying(36) NOT NULL,
    fecha date NOT NULL,
    respuestamh text
);

ALTER TABLE public.anulacion OWNER TO saplic_dprlac_user;

--
-- Name: bitacora; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.bitacora (
    id integer NOT NULL,
    usuario character varying(25) DEFAULT NULL::character varying,
    comentario character varying(500) DEFAULT NULL::character varying,
    fecha date,
    token character varying(1000) DEFAULT NULL::character varying,
    mensaje character varying(1000) DEFAULT NULL::character varying
);


ALTER TABLE public.bitacora OWNER TO saplic_dprlac_user;

--
-- Name: bitacorafactura; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.bitacorafactura (
    version integer NOT NULL,
    ambiente character varying(2) NOT NULL,
    "versionApp" integer NOT NULL,
    estado text NOT NULL,
    "codigoGeneracion" character varying(36) NOT NULL,
    "selloRecibido" character varying(50) DEFAULT NULL::character varying,
    "fhProcesamiento" character varying(20) NOT NULL,
    "clasificaMsg" character varying(2) DEFAULT NULL::character varying,
    "descripcionMsg" character varying(1000) DEFAULT NULL::character varying,
    observaciones text,
    usuario character varying(100) NOT NULL,
    id integer NOT NULL,
    CONSTRAINT bitacorafactura_estado_check CHECK ((estado = ANY (ARRAY['RECHAZADO'::text, 'PROCESADO'::text])))
);


ALTER TABLE public.bitacorafactura OWNER TO saplic_dprlac_user;

--
-- Name: cat001; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cat001 (
    codigo character varying(2) NOT NULL,
    valores character varying(20) NOT NULL
);


ALTER TABLE public.cat001 OWNER TO saplic_dprlac_user;

--
-- Name: cat002; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cat002 (
    codigo character varying(2) NOT NULL,
    valores character varying(50) NOT NULL
);


ALTER TABLE public.cat002 OWNER TO saplic_dprlac_user;

--
-- Name: cat003; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cat003 (
    codigo character varying(2) NOT NULL,
    valores character varying(36) NOT NULL
);


ALTER TABLE public.cat003 OWNER TO saplic_dprlac_user;

--
-- Name: cat004; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cat004 (
    codigo character varying(2) NOT NULL,
    valores character varying(50) NOT NULL
);


ALTER TABLE public.cat004 OWNER TO saplic_dprlac_user;

--
-- Name: cat005; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cat005 (
    codigo character varying(1) NOT NULL,
    valores character varying(200) NOT NULL
);


ALTER TABLE public.cat005 OWNER TO saplic_dprlac_user;

--
-- Name: cat006; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cat006 (
    codigo character varying(2) NOT NULL,
    valores character varying(50) NOT NULL
);


ALTER TABLE public.cat006 OWNER TO saplic_dprlac_user;

--
-- Name: cat007; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cat007 (
    codigo character varying(1) NOT NULL,
    valores character varying(100) NOT NULL
);


ALTER TABLE public.cat007 OWNER TO saplic_dprlac_user;

--
-- Name: cat009; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cat009 (
    codigo character varying(2) NOT NULL,
    valores character varying(100) NOT NULL
);


ALTER TABLE public.cat009 OWNER TO saplic_dprlac_user;

--
-- Name: cat010; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cat010 (
    codigo character varying(2) NOT NULL,
    valores character varying(100) NOT NULL
);


ALTER TABLE public.cat010 OWNER TO saplic_dprlac_user;

--
-- Name: cat011; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cat011 (
    codigo character varying(2) NOT NULL,
    valores character varying(100) NOT NULL
);


ALTER TABLE public.cat011 OWNER TO saplic_dprlac_user;

--
-- Name: cat012; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cat012 (
    codigo character varying(2) NOT NULL,
    valores character varying(100) NOT NULL
);


ALTER TABLE public.cat012 OWNER TO saplic_dprlac_user;

--
-- Name: cat013; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cat013 (
    codigo character varying(2) NOT NULL,
    valor character varying(100) NOT NULL,
    codigo_depto character varying(2) DEFAULT NULL::character varying,
    idmuni integer NOT NULL
);


ALTER TABLE public.cat013 OWNER TO saplic_dprlac_user;

--
-- Name: cat014; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cat014 (
    codigo character varying(3) NOT NULL,
    valor character varying(100) NOT NULL
);


ALTER TABLE public.cat014 OWNER TO saplic_dprlac_user;

--
-- Name: cat015; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cat015 (
    codigo character varying(2) NOT NULL,
    valor character varying(100) NOT NULL,
    codigo_tipo integer,
    porcentaje text,
    monto text
);


ALTER TABLE public.cat015 OWNER TO saplic_dprlac_user;

--
-- Name: cat016; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cat016 (
    codigo character varying(2) NOT NULL,
    valor character varying(100) DEFAULT NULL::character varying
);


ALTER TABLE public.cat016 OWNER TO saplic_dprlac_user;

--
-- Name: cat017; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cat017 (
    codigo character varying(2) NOT NULL,
    valor character varying(100) NOT NULL
);


ALTER TABLE public.cat017 OWNER TO saplic_dprlac_user;

--
-- Name: cat018; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cat018 (
    codigo character varying(2) NOT NULL,
    valor character varying(100) NOT NULL
);


ALTER TABLE public.cat018 OWNER TO saplic_dprlac_user;

--
-- Name: cat019; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cat019 (
    codigo character varying(5) NOT NULL,
    valor character varying(500) NOT NULL,
    cod_tipo integer NOT NULL
);


ALTER TABLE public.cat019 OWNER TO saplic_dprlac_user;

--
-- Name: cat020; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cat020 (
    codigo character varying(4) NOT NULL,
    valor character varying(100) NOT NULL
);


ALTER TABLE public.cat020 OWNER TO saplic_dprlac_user;

--
-- Name: cat021; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cat021 (
    codigo integer NOT NULL,
    valor character varying(100) NOT NULL
);


ALTER TABLE public.cat021 OWNER TO saplic_dprlac_user;

--
-- Name: cat022; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cat022 (
    codigo integer NOT NULL,
    valor character varying(100) NOT NULL
);


ALTER TABLE public.cat022 OWNER TO saplic_dprlac_user;

--
-- Name: cat023; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cat023 (
    codigo character varying(2) NOT NULL,
    valor character varying(100) NOT NULL
);


ALTER TABLE public.cat023 OWNER TO saplic_dprlac_user;

--
-- Name: cat024; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cat024 (
    codigo integer NOT NULL,
    valor character varying(100) NOT NULL
);


ALTER TABLE public.cat024 OWNER TO saplic_dprlac_user;

--
-- Name: cat025; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cat025 (
    codigo character varying(2) NOT NULL,
    valor character varying(100) NOT NULL
);


ALTER TABLE public.cat025 OWNER TO saplic_dprlac_user;

--
-- Name: cat026; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cat026 (
    codigo integer NOT NULL,
    valor character varying(100) DEFAULT NULL::character varying
);


ALTER TABLE public.cat026 OWNER TO saplic_dprlac_user;

--
-- Name: cat027; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cat027 (
    codigo character varying(2) NOT NULL,
    valor character varying(100) NOT NULL
);


ALTER TABLE public.cat027 OWNER TO saplic_dprlac_user;

--
-- Name: cat028; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cat028 (
    codigo character varying(20) NOT NULL,
    valor character varying(255) NOT NULL
);


ALTER TABLE public.cat028 OWNER TO saplic_dprlac_user;

--
-- Name: cat029; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cat029 (
    codigo integer NOT NULL,
    valor character varying(100) NOT NULL
);


ALTER TABLE public.cat029 OWNER TO saplic_dprlac_user;

--
-- Name: cat030; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cat030 (
    codigo integer NOT NULL,
    valor character varying(100) DEFAULT NULL::character varying
);


ALTER TABLE public.cat030 OWNER TO saplic_dprlac_user;

--
-- Name: cat031; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cat031 (
    codigo character varying(2) NOT NULL,
    valor character varying(255) NOT NULL
);


ALTER TABLE public.cat031 OWNER TO saplic_dprlac_user;

--
-- Name: Cuerpodocumento; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.Cuerpodocumento (
    identificador serial primary key,,
    "numeroControl" character varying(36) NOT NULL,
    "codigoGeneracion" character varying(36) NOT NULL,
    item character varying(4) DEFAULT NULL::character varying,
    "tipoItem" character varying(4) DEFAULT NULL::character varying,
    "tipoDonacion" character varying(1) DEFAULT NULL::character varying,
    depreciacion character varying(14) DEFAULT NULL::character varying,
    "tipDTRelacionado" character varying(2) DEFAULT NULL::character varying,
    "tipGenDoc" character varying(1) DEFAULT NULL::character varying,
    "numDocRelacionado" character varying(36) DEFAULT NULL::character varying,
    "fechaGendoc" date,
    cantidad character varying(14) DEFAULT NULL::character varying,
    codigo character varying(25) DEFAULT NULL::character varying,
    areafact character varying(5) DEFAULT NULL::character varying,
    "codTributo" character varying(2) DEFAULT NULL::character varying,
    "unidadMedida" character varying(2) DEFAULT NULL::character varying,
    descripcion character varying(1000) DEFAULT NULL::character varying,
    "precioUnitario" character varying(14) DEFAULT NULL::character varying,
    "valorUnitario" character varying(14) DEFAULT NULL::character varying,
    descuentos character varying(14) DEFAULT NULL::character varying,
    "ventasNSujetas" character varying(14) DEFAULT NULL::character varying,
    "ventasExentas" character varying(14) DEFAULT NULL::character varying,
    "ventasGravadas" character varying(14) DEFAULT NULL::character varying,
    exportaciones character varying(14) DEFAULT NULL::character varying,
    "valorDonado" character varying(14) DEFAULT NULL::character varying,
    ventas character varying(11) DEFAULT NULL::character varying,
    "codigoTributo" character varying(100) DEFAULT NULL::character varying,
    "precSugVenta" character varying(14) DEFAULT NULL::character varying,
    "CargosAbono" character varying(14) DEFAULT NULL::character varying,
    "ivaItem" character varying(14) DEFAULT NULL::character varying,
    montoretencion character varying(14) DEFAULT NULL::character varying,
    "codRetencion" character varying(2) DEFAULT NULL::character varying,
    "ivaRetenido" character varying(14) DEFAULT NULL::character varying,
    "fechaIni" date,
    "fechaFin" date,
    "codLiquidacion" character varying(30) DEFAULT NULL::character varying,
    "canDocumentos" character varying(9) DEFAULT NULL::character varying,
    "valorOpLiq" character varying(14) DEFAULT NULL::character varying,
    "valNoPercepcion" character varying(14) DEFAULT NULL::character varying,
    "descNoPercepcion" character varying(100) DEFAULT NULL::character varying,
    "observacionesItem" character varying(3000) DEFAULT NULL::character varying,
    "observacionesItems" character varying(5000) DEFAULT NULL::character varying,
    subtotal character varying(14) DEFAULT NULL::character varying,
    "ivaOpLiq" character varying(14) DEFAULT NULL::character varying,
    "montoSinIva" character varying(14) DEFAULT NULL::character varying,
    "ivaPercibido" character varying(14) DEFAULT NULL::character varying,
    comision character varying(14) DEFAULT NULL::character varying,
    "porcComision" character varying(100) DEFAULT NULL::character varying,
    "IvaComision" character varying(14) DEFAULT NULL::character varying,
    "ValorLiqPagar" character varying(14) DEFAULT NULL::character varying,
    "valorLetras" character varying(200) DEFAULT NULL::character varying,
    "sacosEsp" character varying(5000) DEFAULT NULL::character varying
);


ALTER TABLE public.Cuerpodocumento OWNER TO saplic_dprlac_user;

--
-- Name: docrelacionados; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.docrelacionados (
    "numeroControl" character varying(36) NOT NULL,
    "codigoGeneracion" character varying(36) NOT NULL,
    "tipoDoc" character varying(2) DEFAULT NULL::character varying,
    "tipoGenera" integer,
    "numDocRelacion" character varying(36) DEFAULT NULL::character varying,
    "fechaGeneracion" date
);


ALTER TABLE public.docrelacionados OWNER TO saplic_dprlac_user;

--
-- Name: emisor; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.emisor (
    id integer NOT NULL,
    "numeroControl" character varying(31) NOT NULL,
    "codigoGeneracion" character varying(36) NOT NULL,
    nit character varying(17) DEFAULT NULL::character varying,
    "tipoDoc" character varying(2) DEFAULT NULL::character varying,
    "numDoc" character varying(14) DEFAULT NULL::character varying,
    ncr character varying(8) DEFAULT NULL::character varying,
    nombre character varying(250) DEFAULT NULL::character varying,
    "codactEco" character varying(6) DEFAULT NULL::character varying,
    "desactEco" character varying(150) DEFAULT NULL::character varying,
    "nomComercial" character varying(150) DEFAULT NULL::character varying,
    "tipEstablecimiento" character varying(2) DEFAULT NULL::character varying,
    "Departamento" character varying(2) DEFAULT NULL::character varying,
    "Municipio" character varying(2) DEFAULT NULL::character varying,
    "Direccion" character varying(200) DEFAULT NULL::character varying,
    telefono character varying(20) DEFAULT NULL::character varying,
    correo character varying(100) DEFAULT NULL::character varying,
    "codEstableMH" character varying(4) DEFAULT NULL::character varying,
    "codEstable" character varying(10) DEFAULT NULL::character varying,
    "codPuntoVentaMH" character varying(4) DEFAULT NULL::character varying,
    "codPuntoVenta" character varying(15) DEFAULT NULL::character varying,
    "tipoItem" integer,
    "recintoFiscal" character varying(2) DEFAULT NULL::character varying,
    "regExportacion" character varying(15) DEFAULT NULL::character varying
);


ALTER TABLE public.emisor OWNER TO saplic_dprlac_user;

--
-- Name: identificacion; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.identificacion (
    version integer NOT NULL,
    "ambDestino" character varying(2) DEFAULT NULL::character varying,
    "tipoDoc" integer,
    "numeroControl" character varying(36) NOT NULL,
    "codigoGeneracion" character varying(36) NOT NULL,
    "modFacturacion" integer,
    "tipTransmicion" integer,
    "tipContingencia" character varying(11) DEFAULT NULL::character varying,
    "motContingencia" character varying(500) DEFAULT NULL::character varying,
    fecha date,
    hora character varying(8) DEFAULT NULL::character varying,
    "tipMoneda" character varying(3) DEFAULT NULL::character varying,
    estado smallint DEFAULT 0
);


ALTER TABLE public.identificacion OWNER TO saplic_dprlac_user;

--
-- Name: otrosdocumentos; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.otrosdocumentos (
    "numeroControl" character varying(36) NOT NULL,
    "codigoGeneracion" integer NOT NULL,
    "docAsociado" integer,
    "identificacionDoc" character varying(100) DEFAULT NULL::character varying,
    "desDocumento" character varying(300) DEFAULT NULL::character varying,
    "nomMedico" character varying(100) DEFAULT NULL::character varying,
    "nitMedico" character varying(14) DEFAULT NULL::character varying,
    "docIdenNoDom" character varying(25) DEFAULT NULL::character varying,
    "codServicio" character varying(1) DEFAULT NULL::character varying,
    "modTransporte" character varying(11) DEFAULT NULL::character varying,
    "numIdentificacion" character varying(70) DEFAULT NULL::character varying,
    "numDocIdenti" character varying(100) DEFAULT NULL::character varying,
    "nomConductor" character varying(100) DEFAULT NULL::character varying
);


ALTER TABLE public.otrosdocumentos OWNER TO saplic_dprlac_user;

--
-- Name: receptor; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.receptor (
    id integer NOT NULL,
    codigo character varying(15) DEFAULT NULL::character varying,
    "tipDoc" character varying(25) DEFAULT NULL::character varying,
    "numDoc" character varying(30) DEFAULT NULL::character varying,
    nit character varying(17) DEFAULT NULL::character varying,
    ncr character varying(8) DEFAULT NULL::character varying,
    "NomDenominacion" character varying(250) DEFAULT NULL::character varying,
    "codActEco" character varying(6) DEFAULT NULL::character varying,
    "actEco" character varying(150) DEFAULT NULL::character varying,
    "nomComercial" character varying(150) DEFAULT NULL::character varying,
    "tipEstablecimiento" character varying(2) DEFAULT NULL::character varying,
    "Departamento" character varying(2) DEFAULT NULL::character varying,
    "Municipio" character varying(2) DEFAULT NULL::character varying,
    "dirComplemento" character varying(200) DEFAULT NULL::character varying,
    "codPais" character varying(4) DEFAULT NULL::character varying,
    "paisDestino" character varying(50) DEFAULT NULL::character varying,
    "domFiscal" character varying(1) DEFAULT NULL::character varying,
    "codEstable" character varying(4) DEFAULT NULL::character varying,
    "codPuntoVenta" character varying(4) DEFAULT NULL::character varying,
    "bienesRemitidos" character varying(2) DEFAULT NULL::character varying,
    "tipoReceptor" integer,
    "telReceptor" character varying(30) DEFAULT NULL::character varying,
    "correoReceptor" character varying(100) DEFAULT NULL::character varying,
    "granContribuyente" character varying(2) NOT NULL,
    area character varying(5) NOT NULL,
    "codCliCobol" smallint
);


ALTER TABLE public.receptor OWNER TO saplic_dprlac_user;

--
-- Name: receptordocumen; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.receptordocumen (
    "numeroControl" character varying(36) NOT NULL,
    "codigoGeneracion" character varying(36) NOT NULL,
    "idReceptor" character varying(11) NOT NULL,
    fecha date,
    estado text,
    destino character varying(5000) DEFAULT NULL::character varying,
    "cuentaArea" character varying(25) DEFAULT NULL::character varying,
    "cuentaVende" character varying(25) DEFAULT NULL::character varying,
    seriefac character varying(25) DEFAULT NULL::character varying,
    serienumfac character varying(25) DEFAULT NULL::character varying,
    fechaseriefact date
);


ALTER TABLE public.receptordocumen OWNER TO saplic_dprlac_user;

--
-- Name: resumen; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.resumen (
    id serial primary key,
    "numeroControl" character varying(36) NOT NULL,
    "codigoGeneracion" character varying(36) NOT NULL,
    "totalNoSuj" character varying(14) DEFAULT NULL::character varying,
    "totalExenta" character varying(14) DEFAULT NULL::character varying,
    "totalGravada" character varying(14) DEFAULT NULL::character varying,
    "totalOpeExpo" character varying(14) DEFAULT NULL::character varying,
    "totalOperaciones" character varying(14) DEFAULT NULL::character varying,
    "totalDonacion" character varying(14) DEFAULT NULL::character varying,
    "sumOpSinImpu" character varying(14) DEFAULT NULL::character varying,
    "montoGloDescNS" character varying(14) DEFAULT NULL::character varying,
    "montoGloDescVE" character varying(14) DEFAULT NULL::character varying,
    "montoGloDescVG" character varying(14) DEFAULT NULL::character varying,
    "montoGloDescVA" character varying(14) DEFAULT NULL::character varying,
    "montoGloDescOP" character varying(14) DEFAULT NULL::character varying,
    "porcMontoGloDesc" character varying(6) DEFAULT NULL::character varying,
    "totalDescBonRev" character varying(14) DEFAULT NULL::character varying,
    "resCodTributo" character varying(2) DEFAULT NULL::character varying,
    "nombreTributo" character varying(300) DEFAULT NULL::character varying,
    "valorTributo" character varying(14) DEFAULT NULL::character varying,
    "subTotal" character varying(14) DEFAULT NULL::character varying,
    "totalMonSujRet" character varying(14) DEFAULT NULL::character varying,
    "ivaPercibido" character varying(14) DEFAULT NULL::character varying,
    "ivaPercibidoLiq" character varying(14) DEFAULT NULL::character varying,
    "ivaRetenido" character varying(14) DEFAULT NULL::character varying,
    "retencionRenta" character varying(14) DEFAULT NULL::character varying,
    seguro character varying(14) DEFAULT NULL::character varying,
    flete character varying(14) DEFAULT NULL::character varying,
    "montoTotalOp" character varying(14) DEFAULT NULL::character varying,
    "totalCargoBasImpon" character varying(14) DEFAULT NULL::character varying,
    "totalAPagar" character varying(14) DEFAULT NULL::character varying,
    total character varying(14) DEFAULT NULL::character varying,
    "totalIvaRetenido" character varying(14) DEFAULT NULL::character varying,
    "valorLetrasIvaRet" character varying(250) DEFAULT NULL::character varying,
    "valorLetras" character varying(250) DEFAULT NULL::character varying,
    iva13 character varying(14) DEFAULT NULL::character varying,
    "saldoAFavor" character varying(14) DEFAULT NULL::character varying,
    "condicionOpera" character varying(2) DEFAULT NULL::character varying,
    "codFormaPago" character varying(2) DEFAULT NULL::character varying,
    "montoPorFormaPag" character varying(14) DEFAULT NULL::character varying,
    "refModalidadPago" character varying(50) DEFAULT NULL::character varying,
    plazo character varying(2) DEFAULT NULL::character varying,
    "periodoPlazo" character varying(3) DEFAULT NULL::character varying,
    "numPagoElecNPE" character varying(250) DEFAULT NULL::character varying,
    incoterms character varying(2) DEFAULT NULL::character varying,
    descincoterms character varying(250) DEFAULT NULL::character varying,
    observaciones character varying(500) DEFAULT NULL::character varying
);


ALTER TABLE public.resumen OWNER TO saplic_dprlac_user;

--
-- Name: tblimpuestosvariables; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.tblimpuestosvariables (
    "tipoImpuesto" character varying(10) NOT NULL,
    valor character varying(14) NOT NULL,
    estado integer NOT NULL,
    noseva integer NOT NULL
);


ALTER TABLE public.tblimpuestosvariables OWNER TO saplic_dprlac_user;

--
-- Name: tblpartidacontable; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.tblpartidacontable (
    "codigoGeneracion" character varying(100) DEFAULT NULL::character varying,
    "numControlFact" character varying(100) DEFAULT NULL::character varying,
    "cuentaContable" character varying(100) DEFAULT NULL::character varying,
    "debeHaber" character varying(100) DEFAULT NULL::character varying,
    monto character varying(100) DEFAULT NULL::character varying,
    descripcion character varying(500) DEFAULT NULL::character varying,
    "numControl" integer NOT NULL,
    estado character(1) DEFAULT 1
);


ALTER TABLE public.tblpartidacontable OWNER TO saplic_dprlac_user;

--
-- Name: tblusuario; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.tblusuario (
    "cUsuario" integer NOT NULL,
    "cNombre" character varying(100) DEFAULT NULL::character varying,
    "cClave" character varying(1000) DEFAULT NULL::character varying,
    "cUname" character varying(25) DEFAULT NULL::character varying,
    "cEstatus" character varying(3) DEFAULT NULL::character varying,
    areafact character varying(4) NOT NULL
);


ALTER TABLE public.tblusuario OWNER TO saplic_dprlac_user;

--
-- Name: ventatercero; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.ventatercero (
    "numeroControl" character varying(36) NOT NULL,
    "codigoGeneracion" character varying(36) NOT NULL,
    "nitPorCuenta" character varying(14) NOT NULL,
    "nomDenominacion" character varying(250) NOT NULL
);


ALTER TABLE public.ventatercero OWNER TO saplic_dprlac_user;

--
-- Name: controlcodigos; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.controlcodigos (
    id integer NOT NULL,
    "numeroControl" character varying(16) DEFAULT NULL::character varying,
	codigogeneracion character varying(36) DEFAULT NULL::character varying,
	fechanio character varying(4) DEFAULT NULL::character varying
);


ALTER TABLE public.controlcodigos OWNER TO "saplic_dprlac_user";

--
-- Name: tblc_x_pago; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.tblc_x_pago (
	id integer NOT NULL,
	tipopag character varying(2) DEFAULT NULL::character varying,
	cuentaxpago character varying(50) DEFAULT NULL::character varying,
	areafac character varying(4) DEFAULT NULL::character varying
);


ALTER TABLE public.tblc_x_pago OWNER TO "saplic_dprlac_user";

--
-- Name: tblcxvendedor; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.tblcxvendedor (
	id integer NOT NULL,
	cod_usuario character varying(20) DEFAULT NULL::character varying,
	"cuentaEfe" character varying(25) DEFAULT NULL::character varying,
	"cuentaCred" character varying(25) DEFAULT NULL::character varying
);


ALTER TABLE public.tblcxvendedor OWNER TO "saplic_dprlac_user";

--
-- Data for Name: bitacora; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

INSERT INTO public.bitacora (id, usuario, comentario, fecha, token, mensaje) VALUES (5, '02033110660019', 'Token de autenticacion', '2024-03-09', 'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIwMjAzMzExMDY2MDAxOSIsImF1dGhvcml0aWVzIjpbIlVTRVIiLCJVU0VSX0FQSSIsIlVzdWFyaW8iXSwiaWF0IjoxNzA5OTY1NTM5LCJleHAiOjE3MTAwNTE5Mzl9.AJps4RJkwggZFw1wEZe786gnvqjhR0CrT5nyEOaOsPzN-lFSYlPqqyo2vPzLiBoapcDkHtIxf_RjhiIbDofmrQ', NULL);
INSERT INTO public.bitacora (id, usuario, comentario, fecha, token, mensaje) VALUES (6, '02033110660019', 'Token de autenticacion', '2024-03-09', 'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIwMjAzMzExMDY2MDAxOSIsImF1dGhvcml0aWVzIjpbIlVTRVIiLCJVU0VSX0FQSSIsIlVzdWFyaW8iXSwiaWF0IjoxNzEwMDAwNTA4LCJleHAiOjE3MTAwODY5MDh9._FwgZe3TsLq19hRGT77CEWQ3hVJ2mZzWeRnlCFNa82Nv9IxRA-20QOrSKTJYICLpE490qmYZrRiDancVc179Dw', NULL);


--
-- Data for Name: bitacorafactura; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

INSERT INTO public.bitacorafactura (version, ambiente, "versionApp", estado, "codigoGeneracion", "selloRecibido", "fhProcesamiento", "clasificaMsg", "descripcionMsg", observaciones, usuario, id) VALUES (2, '00', 2, 'RECHAZADO', '9FB0D8F8-2818-4A41-B0D0-6171273B53E9', '', '08/03/2024 23:16:37', '98', 'DOCUMENTO NO CUMPLE ESQUEMA JSON', '[\"Campo #\\/resumen\\/pagos\\/0\\/periodo no cumple el m\\u00ednimo  exclusivo\",\"Campo #\\/resumen\\/pagos\\/0\\/periodo contiene un valor inv\\u00e1lido\",\"Campo #\\/resumen\\/pagos contiene un valor inv\\u00e1lido\",\"Campo #\\/Cuerpodocumento no cumple el m\\u00ednimo requerido de cantidad de \\u00edtems\"]', 'dgarcia', 1);
INSERT INTO public.bitacorafactura (version, ambiente, "versionApp", estado, "codigoGeneracion", "selloRecibido", "fhProcesamiento", "clasificaMsg", "descripcionMsg", observaciones, usuario, id) VALUES (2, '00', 2, 'RECHAZADO', '6438505D-BE64-46CC-A7A7-120DDC80B6FF', '', '08/03/2024 23:25:00', '98', 'DOCUMENTO NO CUMPLE ESQUEMA JSON', '[\"Campo #\\/resumen\\/pagos\\/0\\/periodo no cumple el m\\u00ednimo  exclusivo\",\"Campo #\\/resumen\\/pagos\\/0\\/periodo contiene un valor inv\\u00e1lido\",\"Campo #\\/resumen\\/pagos contiene un valor inv\\u00e1lido\"]', 'dgarcia', 2);
INSERT INTO public.bitacorafactura (version, ambiente, "versionApp", estado, "codigoGeneracion", "selloRecibido", "fhProcesamiento", "clasificaMsg", "descripcionMsg", observaciones, usuario, id) VALUES (2, '00', 2, 'RECHAZADO', 'C6D0A5BA-29A2-4A46-B17B-624E8A2EABB3', '', '08/03/2024 23:30:40', '98', 'DOCUMENTO NO CUMPLE ESQUEMA JSON', '[\"Campo #\\/resumen\\/pagos\\/0\\/periodo no cumple el m\\u00ednimo  exclusivo\",\"Campo #\\/resumen\\/pagos\\/0\\/periodo contiene un valor inv\\u00e1lido\",\"Campo #\\/resumen\\/pagos contiene un valor inv\\u00e1lido\"]', 'dgarcia', 3);
INSERT INTO public.bitacorafactura (version, ambiente, "versionApp", estado, "codigoGeneracion", "selloRecibido", "fhProcesamiento", "clasificaMsg", "descripcionMsg", observaciones, usuario, id) VALUES (2, '00', 2, 'RECHAZADO', 'D5A3E5D4-7ED8-495D-B3CF-569D8BA38F57', '', '09/03/2024 00:25:54', '13', '[receptor.nit] NIT CONTRIBUYENTE NO EXISTE', 'null', 'dgarcia', 4);
INSERT INTO public.bitacorafactura (version, ambiente, "versionApp", estado, "codigoGeneracion", "selloRecibido", "fhProcesamiento", "clasificaMsg", "descripcionMsg", observaciones, usuario, id) VALUES (2, '00', 2, 'RECHAZADO', '8EB51F9E-662A-44F2-B5FA-0A0ECB940995', '', '09/03/2024 00:29:30', '16', '[Cuerpodocumento.numItem] ERROR EN CORRELATIVO', 'null', 'dgarcia', 5);
INSERT INTO public.bitacorafactura (version, ambiente, "versionApp", estado, "codigoGeneracion", "selloRecibido", "fhProcesamiento", "clasificaMsg", "descripcionMsg", observaciones, usuario, id) VALUES (2, '00', 2, 'RECHAZADO', 'DD7277CF-28FA-4F15-881F-BF757119E122', '', '09/03/2024 00:30:04', '98', 'DOCUMENTO NO CUMPLE ESQUEMA JSON', '[\"Campo #\\/Cuerpodocumento\\/0\\/numItem no cumple el valor m\\u00ednimo  requerido\"]', 'dgarcia', 6);
INSERT INTO public.bitacorafactura (version, ambiente, "versionApp", estado, "codigoGeneracion", "selloRecibido", "fhProcesamiento", "clasificaMsg", "descripcionMsg", observaciones, usuario, id) VALUES (2, '00', 2, 'RECHAZADO', '17BCBD36-49C2-4CA0-A4A7-69A3C79E3AF5', '', '09/03/2024 00:30:59', '16', '[Cuerpodocumento.numItem] ERROR EN CORRELATIVO', 'null', 'dgarcia', 7);
INSERT INTO public.bitacorafactura (version, ambiente, "versionApp", estado, "codigoGeneracion", "selloRecibido", "fhProcesamiento", "clasificaMsg", "descripcionMsg", observaciones, usuario, id) VALUES (2, '00', 2, 'RECHAZADO', '2D6B3A42-6375-4BB1-8162-65AB0DBCC585', '', '09/03/2024 00:31:38', '16', '[Cuerpodocumento.item.2] CALCULO INCORRECTO', 'null', 'dgarcia', 8);
INSERT INTO public.bitacorafactura (version, ambiente, "versionApp", estado, "codigoGeneracion", "selloRecibido", "fhProcesamiento", "clasificaMsg", "descripcionMsg", observaciones, usuario, id) VALUES (2, '00', 2, 'PROCESADO', '02420099-5CD5-4F04-B6A3-448BAAF1B30B', '202421C3ACDED8F545088412D85614E390FAAWS4', '09/03/2024 00:37:53', '10', 'RECIBIDO CON OBSERVACIONES', '[\"resumen.pagos.montoPago Forma de pago difiere del Total a Pagar.\"]', 'dgarcia', 9);
INSERT INTO public.bitacorafactura (version, ambiente, "versionApp", estado, "codigoGeneracion", "selloRecibido", "fhProcesamiento", "clasificaMsg", "descripcionMsg", observaciones, usuario, id) VALUES (2, '00', 2, 'PROCESADO', '43AA7CEF-B070-46F6-89A0-18FEC495CCA8', '202458F89C1F62DD4EF7B2C48864B159C2F0XKKC', '09/03/2024 00:40:21', '10', 'RECIBIDO CON OBSERVACIONES', '[\"resumen.pagos.montoPago Forma de pago difiere del Total a Pagar.\"]', 'dgarcia', 10);
INSERT INTO public.bitacorafactura (version, ambiente, "versionApp", estado, "codigoGeneracion", "selloRecibido", "fhProcesamiento", "clasificaMsg", "descripcionMsg", observaciones, usuario, id) VALUES (2, '00', 2, 'PROCESADO', '5D61675C-260E-44FD-A3BA-57805A5DA2D2', '2024B69F1EBD6098439C95FC422BC48F1B67T0BB', '09/03/2024 00:44:08', '10', 'RECIBIDO CON OBSERVACIONES', '[\"resumen.pagos.montoPago Forma de pago difiere del Total a Pagar.\"]', 'dgarcia', 11);
INSERT INTO public.bitacorafactura (version, ambiente, "versionApp", estado, "codigoGeneracion", "selloRecibido", "fhProcesamiento", "clasificaMsg", "descripcionMsg", observaciones, usuario, id) VALUES (2, '00', 2, 'PROCESADO', '6EB3F012-7404-46C4-908A-6F5175D8CE02', '20244441E46698B14CD5BEEA7460C98E75A4MY7A', '09/03/2024 00:46:06', '10', 'RECIBIDO CON OBSERVACIONES', '[\"resumen.pagos.montoPago Forma de pago difiere del Total a Pagar.\"]', 'dgarcia', 12);
INSERT INTO public.bitacorafactura (version, ambiente, "versionApp", estado, "codigoGeneracion", "selloRecibido", "fhProcesamiento", "clasificaMsg", "descripcionMsg", observaciones, usuario, id) VALUES (2, '00', 2, 'PROCESADO', '9E76C69B-6AF3-41F0-A4BE-8C21E52D7CEB', '20242B4C74B6A6AD4E1A9C0737E765FFB565O1UJ', '09/03/2024 00:47:40', '10', 'RECIBIDO CON OBSERVACIONES', '[\"resumen.pagos.montoPago Forma de pago difiere del Total a Pagar.\"]', 'dgarcia', 13);
INSERT INTO public.bitacorafactura (version, ambiente, "versionApp", estado, "codigoGeneracion", "selloRecibido", "fhProcesamiento", "clasificaMsg", "descripcionMsg", observaciones, usuario, id) VALUES (2, '00', 2, 'PROCESADO', '8A74DCB8-B243-4C27-9F97-125584B4B103', '2024E90DB367F3F54D059C766ED9AFE42CF4AVVC', '09/03/2024 00:51:32', '10', 'RECIBIDO CON OBSERVACIONES', '[\"resumen.pagos.montoPago Forma de pago difiere del Total a Pagar.\"]', 'dgarcia', 14);
INSERT INTO public.bitacorafactura (version, ambiente, "versionApp", estado, "codigoGeneracion", "selloRecibido", "fhProcesamiento", "clasificaMsg", "descripcionMsg", observaciones, usuario, id) VALUES (2, '00', 2, 'PROCESADO', '584F066E-5FA3-4AEC-80FB-926901353051', '20247852A1C5A3FA473B87B6A6A0C7AC3D672U6B', '09/03/2024 00:54:25', '10', 'RECIBIDO CON OBSERVACIONES', '[\"resumen.pagos.montoPago Forma de pago difiere del Total a Pagar.\"]', 'dgarcia', 15);
INSERT INTO public.bitacorafactura (version, ambiente, "versionApp", estado, "codigoGeneracion", "selloRecibido", "fhProcesamiento", "clasificaMsg", "descripcionMsg", observaciones, usuario, id) VALUES (2, '00', 2, 'PROCESADO', 'E9ABB697-938D-4924-A7E7-55C1C7E49AE0', '202483427D451B8A4BDDB203506772CA7013UTTZ', '09/03/2024 01:00:18', '10', 'RECIBIDO CON OBSERVACIONES', '[\"resumen.pagos.montoPago Forma de pago difiere del Total a Pagar.\"]', 'dgarcia', 16);
INSERT INTO public.bitacorafactura (version, ambiente, "versionApp", estado, "codigoGeneracion", "selloRecibido", "fhProcesamiento", "clasificaMsg", "descripcionMsg", observaciones, usuario, id) VALUES (2, '00', 2, 'PROCESADO', '8C38260B-247F-4A78-B83F-2B76CDA85224', '20247F0DD03E74C44EC7B28CE933DC3FC3CAXENI', '09/03/2024 01:03:49', '10', 'RECIBIDO CON OBSERVACIONES', '[\"resumen.pagos.montoPago Forma de pago difiere del Total a Pagar.\"]', 'dgarcia', 17);
INSERT INTO public.bitacorafactura (version, ambiente, "versionApp", estado, "codigoGeneracion", "selloRecibido", "fhProcesamiento", "clasificaMsg", "descripcionMsg", observaciones, usuario, id) VALUES (2, '00', 2, 'PROCESADO', '1EEACAC8-002D-49E9-8E30-253F94D8AFC0', '2024627F90FF211C45D6AE5C0A9022BB8EADHGKZ', '09/03/2024 01:04:21', '10', 'RECIBIDO CON OBSERVACIONES', '[\"resumen.pagos.montoPago Forma de pago difiere del Total a Pagar.\"]', 'dgarcia', 18);
INSERT INTO public.bitacorafactura (version, ambiente, "versionApp", estado, "codigoGeneracion", "selloRecibido", "fhProcesamiento", "clasificaMsg", "descripcionMsg", observaciones, usuario, id) VALUES (2, '00', 2, 'PROCESADO', 'B0093AF7-3309-4B8D-B839-C0EE01A359D6', '2024AB48CA32FAEF42A49F778153CC5BA12453GI', '09/03/2024 10:09:00', '10', 'RECIBIDO CON OBSERVACIONES', '[\"resumen.pagos.montoPago Forma de pago difiere del Total a Pagar.\"]', 'dgarcia', 19);


--
-- Data for Name: cat001; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

INSERT INTO public.cat001 (codigo, valores) VALUES ('00', 'Modo prueba');
INSERT INTO public.cat001 (codigo, valores) VALUES ('01', 'Modo producci�n');


--
-- Data for Name: cat002; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

INSERT INTO public.cat002 (codigo, valores) VALUES ('01', 'Factura');
INSERT INTO public.cat002 (codigo, valores) VALUES ('03', 'Comprobante de cr�dito fiscal');
INSERT INTO public.cat002 (codigo, valores) VALUES ('04', 'Nota de remisi�n');
INSERT INTO public.cat002 (codigo, valores) VALUES ('05', 'Nota de cr�dito');
INSERT INTO public.cat002 (codigo, valores) VALUES ('06', 'Nota de d�bito');
INSERT INTO public.cat002 (codigo, valores) VALUES ('07', 'Comprobante de retenci�n');
INSERT INTO public.cat002 (codigo, valores) VALUES ('08', 'Comprobante de liquidaci�n');
INSERT INTO public.cat002 (codigo, valores) VALUES ('09', 'Documento contable de liquidaci�n');
INSERT INTO public.cat002 (codigo, valores) VALUES ('11', 'Facturas de exportaci�n');
INSERT INTO public.cat002 (codigo, valores) VALUES ('14', 'Factura de sujeto excluido');
INSERT INTO public.cat002 (codigo, valores) VALUES ('15', 'Comprobante de donaci�n');
INSERT INTO public.cat002 (codigo, valores) VALUES ('01', 'Factura');
INSERT INTO public.cat002 (codigo, valores) VALUES ('03', 'Comprobante de cr�dito fiscal');


--
-- Data for Name: cat003; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--



--
-- Data for Name: cat004; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

INSERT INTO public.cat004 (codigo, valores) VALUES ('01', 'Transmisi�n normal');
INSERT INTO public.cat004 (codigo, valores) VALUES ('02', 'Transmisi�n por contingencia');


--
-- Data for Name: cat005; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

INSERT INTO public.cat005 (codigo, valores) VALUES ('1', 'No disponibilidad de sistema del MH');
INSERT INTO public.cat005 (codigo, valores) VALUES ('3', 'No disponibilidad de sistema del emisor');
INSERT INTO public.cat005 (codigo, valores) VALUES ('4', 'Falla en el suministro de servicio de Internet del Emisor');
INSERT INTO public.cat005 (codigo, valores) VALUES ('5', 'Falla en el suministro de servicio de energ�a el�ctrica del emisor\r\nque impida la transmisi�n de los DTE');
INSERT INTO public.cat005 (codigo, valores) VALUES ('6', 'Otro');


--
-- Data for Name: cat006; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

INSERT INTO public.cat006 (codigo, valores) VALUES ('22', 'Retenci�n IVA 1%');
INSERT INTO public.cat006 (codigo, valores) VALUES ('C4', 'Retenci�n IVA 13%');
INSERT INTO public.cat006 (codigo, valores) VALUES ('C9', 'Otras retenciones IVA casos especiales');


--
-- Data for Name: cat007; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

INSERT INTO public.cat007 (codigo, valores) VALUES ('1', 'F�sico');
INSERT INTO public.cat007 (codigo, valores) VALUES ('2', 'Retenci�n IVA 13%');


--
-- Data for Name: cat009; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

INSERT INTO public.cat009 (codigo, valores) VALUES ('01', 'Sucursal / Agencia');
INSERT INTO public.cat009 (codigo, valores) VALUES ('02', 'Casa matriz');
INSERT INTO public.cat009 (codigo, valores) VALUES ('04', 'Bodega');
INSERT INTO public.cat009 (codigo, valores) VALUES ('07', 'Predio y/o patio');
INSERT INTO public.cat009 (codigo, valores) VALUES ('20', 'Otro');


--
-- Data for Name: cat010; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

INSERT INTO public.cat010 (codigo, valores) VALUES ('1', 'Cirug�a');
INSERT INTO public.cat010 (codigo, valores) VALUES ('2', 'Operaci�n');
INSERT INTO public.cat010 (codigo, valores) VALUES ('3', 'Tratamiento m�dico');
INSERT INTO public.cat010 (codigo, valores) VALUES ('4', 'Cirug�a instituto salvadore�o de Bienestar Magisterial');
INSERT INTO public.cat010 (codigo, valores) VALUES ('5', 'Operaci�n Instituto Salvadore�o de Bienestar Magisterial');
INSERT INTO public.cat010 (codigo, valores) VALUES ('6', 'Tratamiento m�dico Instituto Salvadore�o de Bienestar Magisterial');


--
-- Data for Name: cat011; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

INSERT INTO public.cat011 (codigo, valores) VALUES ('1', 'Bienes');
INSERT INTO public.cat011 (codigo, valores) VALUES ('2', 'Servicios');
INSERT INTO public.cat011 (codigo, valores) VALUES ('3', 'Ambos (Bienes y Servicios)');
INSERT INTO public.cat011 (codigo, valores) VALUES ('4', 'Otros tributos por �tem');


--
-- Data for Name: cat012; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

INSERT INTO public.cat012 (codigo, valores) VALUES ('01', 'Ahuachap�n');
INSERT INTO public.cat012 (codigo, valores) VALUES ('02', 'Santa Ana');
INSERT INTO public.cat012 (codigo, valores) VALUES ('03', 'Sonsonate');
INSERT INTO public.cat012 (codigo, valores) VALUES ('04', 'Chalatenango');
INSERT INTO public.cat012 (codigo, valores) VALUES ('05', 'La Libertad');
INSERT INTO public.cat012 (codigo, valores) VALUES ('06', 'San Salvador');
INSERT INTO public.cat012 (codigo, valores) VALUES ('07', 'Cuscatl�n');
INSERT INTO public.cat012 (codigo, valores) VALUES ('08', 'La Paz');
INSERT INTO public.cat012 (codigo, valores) VALUES ('09', 'Caba�as');
INSERT INTO public.cat012 (codigo, valores) VALUES ('10', 'San Vicente');
INSERT INTO public.cat012 (codigo, valores) VALUES ('11', 'Usulut�n');
INSERT INTO public.cat012 (codigo, valores) VALUES ('12', 'San Miguel');
INSERT INTO public.cat012 (codigo, valores) VALUES ('13', 'Moraz�n');
INSERT INTO public.cat012 (codigo, valores) VALUES ('14', 'La Uni�n');


--
-- Data for Name: cat013; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('00', 'OTRO PAIS', '00', 1);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('01', 'AHUACHAPAN', '01', 2);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('02', 'APANECA', '01', 3);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('03', 'ATIQUIZAYA', '01', 4);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('04', 'CONCEPCION DE ATACO', '01', 5);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('05', 'EL REFUGIO', '01', 6);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('06', 'GUATMANGO', '01', 7);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('07', 'JUJUTLA', '01', 8);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('08', 'SAN FRANCISCO MENENDEZ', '01', 9);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('09', 'SAN LORENZO', '01', 10);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('10', 'SAN PEDRO PUXTLA', '01', 11);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('11', 'TACUBA', '01', 12);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('12', 'TURIN', '01', 13);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('01', 'CANDELARIA DE LA FRONTERA', '02', 14);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('02', 'COATEPEQUE', '02', 15);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('03', 'CHALCHUAPA', '02', 16);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('04', 'EL CONGO', '02', 17);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('05', 'EL PORVENIR', '02', 18);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('06', 'MASAHUAT', '02', 19);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('07', 'METAPAN', '02', 20);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('08', 'SAN ANTONIO PAJONAL', '02', 21);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('09', 'SAN SEBASTIAN SALITRILLO', '02', 22);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('10', 'SANTA ANA', '02', 23);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('11', 'STA ROSA GUACHI', '02', 24);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('12', 'STGO D LA FRONT', '02', 25);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('13', 'TEXISTEPEQUE', '02', 26);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('01', 'ACAJUTLA', '03', 27);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('02', 'ARMENIA', '03', 28);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('03', 'CALUCO', '03', 29);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('04', 'CUINAHUAT', '03', 30);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('05', 'STA ISHUATAN', '03', 31);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('06', 'IZALCO', '03', 32);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('07', 'JUAYUA', '03', 33);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('08', 'NAHUIZALCO', '03', 34);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('09', 'NAHUILINGO', '03', 35);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('10', 'SALCOATITAN', '03', 36);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('11', 'SAN ANTONIO DEL MONTE', '03', 37);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('12', 'SAN JULIAN', '03', 38);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('13', 'STA C MASAHUAT', '03', 39);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('14', 'SANTO DOMINGO GUZMAN', '03', 40);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('15', 'SONSONATE', '03', 41);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('16', 'SONZACATE', '03', 42);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('01', 'AGUA CALIENTE', '04', 43);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('02', 'ARCATAO', '04', 44);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('03', 'AZACUALPA', '04', 45);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('04', 'CHALATENANGO', '04', 46);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('05', 'COMALAPA', '04', 47);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('06', 'CITAL�', '04', 48);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('07', 'CONCEPCI�N QUEZALTEPEQUE', '04', 49);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('08', 'DULCE NOMBRE DE MAR�A', '04', 50);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('09', 'EL CARRIZAL', '04', 51);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('10', 'EL PARA�SO', '04', 52);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('11', 'LA LAGUNA', '04', 53);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('12', 'LA PALMA', '04', 54);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('13', 'LA REINA', '04', 55);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('14', 'LAS VUELTAS', '04', 56);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('15', 'NUEVA CONCEPCI�N', '04', 57);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('16', 'NUEVA TRINIDAD', '04', 58);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('17', 'NOMBRE DE JES�S', '04', 59);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('18', 'OJOS DE AGUA', '04', 60);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('19', 'POTONICO', '04', 61);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('20', 'SAN ANTONIO DE LA CRUZ', '04', 62);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('21', 'SAN ANTONIO LOS RANCHOS', '04', 63);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('22', 'SAN FERNANDO', '04', 64);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('23', 'SAN FRANCISCO LEMPA', '04', 65);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('24', 'SAN FRANCISCO MORAZ�N', '04', 66);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('25', 'SAN IGNACIO', '04', 67);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('26', 'SAN ISIDRO LABRADOR', '04', 68);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('27', 'SAN JOS� CANCASQUE', '04', 69);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('28', 'SAN JOS� LAS FLORES', '04', 70);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('29', 'SAN LUIS DEL CARMEN', '04', 71);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('30', 'SAN MIGUEL DE MERCEDES', '04', 72);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('31', 'SAN RAFAEL', '04', 73);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('32', 'SANTA RITA', '04', 74);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('33', 'TEJUTLA', '04', 75);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('01', 'ANTIGUO CUSCATL�N', '05', 76);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('02', 'CHILTIUP�N', '05', 77);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('03', 'CIUDAD ARCE', '05', 78);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('04', 'COL�N', '05', 79);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('05', 'COMASAGUA', '05', 80);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('06', 'HUIZ�CAR', '05', 81);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('07', 'JAYAQUE', '05', 82);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('08', 'JICALAPA', '05', 83);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('09', 'LA LIBERTAD', '05', 84);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('10', 'SANTA TECLA', '05', 85);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('11', 'NUEVO CUSCATL�N', '05', 86);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('12', 'SAN JUAN OPICO', '05', 87);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('13', 'QUEZALTEPEQUE', '05', 88);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('14', 'SACACOYO', '05', 89);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('15', 'SAN JOS� VILLANUEVA', '05', 90);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('16', 'SAN MAT�AS', '05', 91);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('17', 'SAN PABLO TACACHICO', '05', 92);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('18', 'TALNIQUE', '05', 93);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('19', 'TAMANIQUE', '05', 94);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('20', 'TEOTEPEQUE', '05', 95);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('21', 'TEPECOYO', '05', 96);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('22', 'ZARAGOZA', '05', 97);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('01', 'AGUILARES', '06', 98);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('02', 'APOPA', '06', 99);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('03', 'AYUTUXTEPEQUE', '06', 100);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('04', 'CUSCATANCINGO', '06', 101);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('05', 'CIUDAD DELGADO', '06', 102);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('06', 'EL PAISNAL', '06', 103);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('07', 'GUAZAPA', '06', 104);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('08', 'ILOPANGO', '06', 105);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('09', 'MEJICANOS', '06', 106);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('10', 'NEJAPA', '06', 107);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('11', 'PANCHIMALCO', '06', 108);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('12', 'ROSARIO DE MORA', '06', 109);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('13', 'SAN MARCOS', '06', 110);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('14', 'SAN MART�N', '06', 111);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('15', 'SAN SALVADOR', '06', 112);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('16', 'SANTIAGO TEXACUANGOS', '06', 113);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('17', 'SANTO TOM�S', '06', 114);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('18', 'SOYAPANGO', '06', 115);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('19', 'TONACATEPEQUE', '06', 116);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('01', 'CANDELARIA', '07', 117);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('02', 'COJUTEPEQUE', '07', 118);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('03', 'EL CARMEN', '07', 119);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('04', 'EL ROSARIO', '07', 120);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('05', 'MONTE SAN JUAN', '07', 121);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('06', 'ORATORIO DE CONCEPCI�N', '07', 122);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('07', 'SAN BARTOLOM� PERULAP�A', '07', 123);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('08', 'SAN CRIST�BAL', '07', 124);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('09', 'SAN JOS� GUAYABAL', '07', 125);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('10', 'SAN PEDRO PERULAP�N', '07', 126);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('11', 'SAN RAFAEL CEDROS', '07', 127);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('12', 'SAN RAM�N', '07', 128);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('13', 'SANTA CRUZ ANALQUITO', '07', 129);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('14', 'SANTA CRUZ MICHAPA', '07', 130);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('15', 'SUCHITOTO', '07', 131);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('16', 'TENANCINGO', '07', 132);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('01', 'CUYULTIT�N', '08', 133);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('02', 'EL ROSARIO', '08', 134);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('03', 'JERUSAL�N', '08', 135);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('04', 'MERCEDES LA CEIBA', '08', 136);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('05', 'OLOCUILTA', '08', 137);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('06', 'PARA�SO DE OSORIO', '08', 138);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('07', 'SAN ANTONIO MASAHUAT', '08', 139);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('08', 'SAN EMIGDIO', '08', 140);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('09', 'SAN FRANCISCO CHINAMECA', '08', 141);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('10', 'SAN JUAN NONUALCO', '08', 142);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('11', 'SAN JUAN TALPA', '08', 143);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('12', 'SAN JUAN TEPEZONTES', '08', 144);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('13', 'SAN LUIS TALPA', '08', 145);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('14', 'SAN LUIS LA HERRADURA', '08', 146);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('15', 'SAN MIGUEL TEPEZONTES', '08', 147);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('16', 'SAN PEDRO MASAHUAT', '08', 148);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('17', 'SAN PEDRO NONUALCO', '08', 149);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('18', 'SAN RAFAEL OBRAJUELO', '08', 150);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('19', 'SANTA MAR�A OSTUMA', '08', 151);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('20', 'SANTIAGO NONUALCO', '08', 152);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('21', 'TAPALHUACA', '08', 153);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('22', 'ZACATECOLUCA', '08', 154);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('01', 'CINQUERA', '09', 155);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('02', 'DOLORES', '09', 156);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('03', 'GUACOTECTI', '09', 157);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('04', 'ILOBASCO', '09', 158);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('05', 'JUTIAPA', '09', 159);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('06', 'SAN ISIDRO', '09', 160);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('07', 'SENSUNTEPEQUE', '09', 161);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('08', 'TEJUTEPEQUE', '09', 162);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('09', 'VICTORIA', '09', 163);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('01', 'APASTEPEQUE', '10', 164);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('02', 'GUADALUPE', '10', 165);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('03', 'SAN CAYETANO ISTEPEQUE', '10', 166);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('04', 'SAN ESTEBAN CATARINA', '10', 167);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('05', 'SAN ILDEFONSO', '10', 168);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('06', 'SAN LORENZO', '10', 169);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('07', 'SAN SEBASTI�N', '10', 170);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('08', 'SAN VICENTE', '10', 171);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('09', 'SANTA CLARA', '10', 172);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('10', 'SANTO DOMINGO', '10', 173);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('11', 'TECOLUCA', '10', 174);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('12', 'TEPETIT�N', '10', 175);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('13', 'VERAPAZ', '10', 176);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('01', 'ALEGR�A', '11', 177);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('02', 'BERL�N', '11', 178);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('03', 'CALIFORNIA', '11', 179);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('04', 'CONCEPCI�N BATRES', '11', 180);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('05', 'EL TRIUNFO', '11', 181);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('06', 'EREGUAYQU�N', '11', 182);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('07', 'ESTANZUELAS', '11', 183);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('08', 'JIQUILISCO', '11', 184);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('09', 'JUCUAPA', '11', 185);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('10', 'JUCUAR�N', '11', 186);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('11', 'MERCEDES UMA�A', '11', 187);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('12', 'NUEVA GRANADA', '11', 188);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('13', 'OZATL�N', '11', 189);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('14', 'PUERTO EL TRIUNFO', '11', 190);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('15', 'SAN AGUST�N', '11', 191);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('16', 'SAN BUENAVENTURA', '11', 192);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('17', 'SAN DIONISIO', '11', 193);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('18', 'SAN FRANCISCO JAVIER', '11', 194);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('19', 'SANTA ELENA', '11', 195);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('20', 'SANTA MAR�A', '11', 196);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('21', 'SANTIAGO DE MAR�A', '11', 197);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('22', 'TECAP�N', '11', 198);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('23', 'USULUT�N', '11', 199);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('01', 'CAROLINA', '12', 200);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('02', 'CHAPELTIQUE', '12', 201);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('03', 'CHINAMECA', '12', 202);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('04', 'CHIRILAGUA', '12', 203);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('05', 'CIUDAD BARRIOS', '12', 204);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('06', 'COMACAR�N', '12', 205);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('07', 'EL TR�NSITO', '12', 206);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('08', 'LOLOTIQUE', '12', 207);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('09', 'MONCAGUA', '12', 208);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('10', 'NUEVA GUADALUPE', '12', 209);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('11', 'NUEVO ED�N DE SAN JUAN', '12', 210);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('12', 'QUELEPA', '12', 211);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('13', 'SAN ANTONIO DEL MOSCO', '12', 212);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('14', 'SAN GERARDO', '12', 213);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('15', 'SAN JORGE', '12', 214);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('16', 'SAN LUIS DE LA REINA', '12', 215);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('17', 'SAN MIGUEL', '12', 216);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('18', 'SAN RAFAEL ORIENTE', '12', 217);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('19', 'SESORI', '12', 218);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('20', 'ULUAZAPA', '12', 219);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('01', 'ARAMBALA', '13', 220);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('02', 'CACAOPERA', '13', 221);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('03', 'CHILANGA', '13', 222);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('04', 'CORINTO', '13', 223);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('05', 'DELICIAS DE CONCEPCI�N', '13', 224);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('06', 'EL DIVISADERO', '13', 225);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('07', 'EL ROSARIO', '13', 226);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('08', 'GUALOCOCTI', '13', 227);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('09', 'GUATAJIAGUA', '13', 228);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('10', 'JOATECA', '13', 229);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('11', 'JOCOAITIQUE', '13', 230);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('12', 'JOCORO', '13', 231);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('13', 'LOLOTIQUILLO', '13', 232);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('14', 'MEANGUERA', '13', 233);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('15', 'OSICALA', '13', 234);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('16', 'PERQU�N', '13', 235);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('17', 'SAN CARLOS', '13', 236);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('18', 'SAN FERNANDO', '13', 237);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('19', 'SAN FRANCISCO GOTERA', '13', 238);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('20', 'SAN ISIDRO', '13', 239);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('21', 'SAN SIM�N', '13', 240);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('22', 'SENSEMBRA', '13', 241);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('23', 'SOCIEDAD', '13', 242);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('24', 'TOROLA', '13', 243);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('25', 'YAMABAL', '13', 244);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('26', 'YOLOAIQU�N', '13', 245);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('01', 'ANAMOR�S', '14', 246);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('02', 'BOL�VAR', '14', 247);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('03', 'CONCEPCI�N DE ORIENTE', '14', 248);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('04', 'CONCHAGUA', '14', 249);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('05', 'EL CARMEN', '14', 250);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('06', 'EL SAUCE', '14', 251);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('07', 'INTIPUC�', '14', 252);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('08', 'LA UNI�N', '14', 253);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('09', 'LISLIQUE', '14', 254);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('10', 'MEANGUERA DEL GOLFO', '14', 255);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('11', 'NUEVA ESPARTA', '14', 256);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('12', 'PASAQUINA', '14', 257);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('13', 'POLOR�S', '14', 258);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('14', 'SAN ALEJO', '14', 259);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('15', 'SAN JOS�', '14', 260);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('16', 'SANTA ROSA DE LIMA', '14', 261);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('17', 'YAYANTIQUE', '14', 262);
INSERT INTO public.cat013 (codigo, valor, codigo_depto, idmuni) VALUES ('18', 'YUCUAIQU�N', '14', 263);


--
-- Data for Name: cat014; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

INSERT INTO public.cat014 (codigo, valor) VALUES ('01', 'Metro');
INSERT INTO public.cat014 (codigo, valor) VALUES ('02', 'Yarda');
INSERT INTO public.cat014 (codigo, valor) VALUES ('03', 'Vara');
INSERT INTO public.cat014 (codigo, valor) VALUES ('04', 'Pie');
INSERT INTO public.cat014 (codigo, valor) VALUES ('05', 'Pulgada');
INSERT INTO public.cat014 (codigo, valor) VALUES ('07', 'Mil�metro');
INSERT INTO public.cat014 (codigo, valor) VALUES ('08', 'Milla cuadrada');
INSERT INTO public.cat014 (codigo, valor) VALUES ('09', 'Kil�metro cuadrado');
INSERT INTO public.cat014 (codigo, valor) VALUES ('10', 'Hect�rea');
INSERT INTO public.cat014 (codigo, valor) VALUES ('11', 'Manzana');
INSERT INTO public.cat014 (codigo, valor) VALUES ('12', 'Acre');
INSERT INTO public.cat014 (codigo, valor) VALUES ('13', 'Metro cuadrado');
INSERT INTO public.cat014 (codigo, valor) VALUES ('14', 'Yarda cuadrada');
INSERT INTO public.cat014 (codigo, valor) VALUES ('15', 'Vara cuadrada');
INSERT INTO public.cat014 (codigo, valor) VALUES ('16', 'Pie cuadrado');
INSERT INTO public.cat014 (codigo, valor) VALUES ('17', 'Pulgada cuadrada');
INSERT INTO public.cat014 (codigo, valor) VALUES ('18', 'Metro c�bico');
INSERT INTO public.cat014 (codigo, valor) VALUES ('19', 'Yarda c�bica');
INSERT INTO public.cat014 (codigo, valor) VALUES ('20', 'Barril');
INSERT INTO public.cat014 (codigo, valor) VALUES ('21', 'Pie c�bico');
INSERT INTO public.cat014 (codigo, valor) VALUES ('22', 'Gal�n');
INSERT INTO public.cat014 (codigo, valor) VALUES ('23', 'Litro');
INSERT INTO public.cat014 (codigo, valor) VALUES ('24', 'Botella');
INSERT INTO public.cat014 (codigo, valor) VALUES ('25', 'Pulgada c�bica');
INSERT INTO public.cat014 (codigo, valor) VALUES ('26', 'Mililitro');
INSERT INTO public.cat014 (codigo, valor) VALUES ('27', 'Onza fluida');
INSERT INTO public.cat014 (codigo, valor) VALUES ('29', 'Tonelada m�trica');
INSERT INTO public.cat014 (codigo, valor) VALUES ('30', 'Tonelada');
INSERT INTO public.cat014 (codigo, valor) VALUES ('31', 'Quintal m�trico');
INSERT INTO public.cat014 (codigo, valor) VALUES ('32', 'Quintal');
INSERT INTO public.cat014 (codigo, valor) VALUES ('33', 'Arroba');
INSERT INTO public.cat014 (codigo, valor) VALUES ('34', 'Kilogramo');
INSERT INTO public.cat014 (codigo, valor) VALUES ('35', 'Libra troy');
INSERT INTO public.cat014 (codigo, valor) VALUES ('36', 'Libra');
INSERT INTO public.cat014 (codigo, valor) VALUES ('37', 'Onza troy');
INSERT INTO public.cat014 (codigo, valor) VALUES ('38', 'Onza');
INSERT INTO public.cat014 (codigo, valor) VALUES ('39', 'Gramo');
INSERT INTO public.cat014 (codigo, valor) VALUES ('40', 'Miligramo');
INSERT INTO public.cat014 (codigo, valor) VALUES ('42', 'Megawatt');
INSERT INTO public.cat014 (codigo, valor) VALUES ('43', 'Kilowatt');
INSERT INTO public.cat014 (codigo, valor) VALUES ('44', 'Watt');
INSERT INTO public.cat014 (codigo, valor) VALUES ('45', 'Megavoltio-amperio');
INSERT INTO public.cat014 (codigo, valor) VALUES ('46', 'Kilovoltio-amperio');
INSERT INTO public.cat014 (codigo, valor) VALUES ('47', 'Voltio-amperio');
INSERT INTO public.cat014 (codigo, valor) VALUES ('49', 'Gigawatt-hora');
INSERT INTO public.cat014 (codigo, valor) VALUES ('50', 'Megawatt-hora');
INSERT INTO public.cat014 (codigo, valor) VALUES ('51', 'Kilowatt-hora');
INSERT INTO public.cat014 (codigo, valor) VALUES ('52', 'Watt-hora');
INSERT INTO public.cat014 (codigo, valor) VALUES ('53', 'Kilovoltio');
INSERT INTO public.cat014 (codigo, valor) VALUES ('54', 'Voltio');
INSERT INTO public.cat014 (codigo, valor) VALUES ('55', 'Millar');
INSERT INTO public.cat014 (codigo, valor) VALUES ('56', 'Medio millar');
INSERT INTO public.cat014 (codigo, valor) VALUES ('57', 'Ciento');
INSERT INTO public.cat014 (codigo, valor) VALUES ('58', 'Docena');
INSERT INTO public.cat014 (codigo, valor) VALUES ('59', 'Unidad');
INSERT INTO public.cat014 (codigo, valor) VALUES ('99', 'Otra');


--
-- Data for Name: cat015; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

INSERT INTO public.cat015 (codigo, valor, codigo_tipo, porcentaje, monto) VALUES ('19', 'Fabricante de Bebidas Gaseosas, Isotonicas, deportivas, fortificantes, energizante o estimulante', 3, NULL, NULL);
INSERT INTO public.cat015 (codigo, valor, codigo_tipo, porcentaje, monto) VALUES ('20', 'Impuesto al Valor agregado 13%', 1, '[0.13]', NULL);
INSERT INTO public.cat015 (codigo, valor, codigo_tipo, porcentaje, monto) VALUES ('28', 'Importador de Bebidas Gaseosas, Isotonicas, deportivas, fortificantes, energizante o estimulante', 3, NULL, NULL);
INSERT INTO public.cat015 (codigo, valor, codigo_tipo, porcentaje, monto) VALUES ('31', 'Detallistas o Expendedores de bebidas Alcoholicas', 3, NULL, NULL);
INSERT INTO public.cat015 (codigo, valor, codigo_tipo, porcentaje, monto) VALUES ('32', 'Fabricante de cerveza', 3, NULL, NULL);
INSERT INTO public.cat015 (codigo, valor, codigo_tipo, porcentaje, monto) VALUES ('33', 'Importador de cerveza', 3, NULL, NULL);
INSERT INTO public.cat015 (codigo, valor, codigo_tipo, porcentaje, monto) VALUES ('34', 'Fabricante de productos de tabaco', 3, NULL, NULL);
INSERT INTO public.cat015 (codigo, valor, codigo_tipo, porcentaje, monto) VALUES ('35', 'Importador de productos de tabaco', 3, NULL, NULL);
INSERT INTO public.cat015 (codigo, valor, codigo_tipo, porcentaje, monto) VALUES ('36', 'Fabricante de Armas de fuego, municiones, y articulos similares', 3, NULL, NULL);
INSERT INTO public.cat015 (codigo, valor, codigo_tipo, porcentaje, monto) VALUES ('37', 'Importador de Armas de fuego, municiones, y articulos similares', 3, NULL, NULL);
INSERT INTO public.cat015 (codigo, valor, codigo_tipo, porcentaje, monto) VALUES ('38', 'Fabricante de explosivos', 3, NULL, NULL);
INSERT INTO public.cat015 (codigo, valor, codigo_tipo, porcentaje, monto) VALUES ('39', 'Importador de explosivos', 3, NULL, NULL);
INSERT INTO public.cat015 (codigo, valor, codigo_tipo, porcentaje, monto) VALUES ('42', 'Fabricante de productos pirotecnicos', 3, NULL, NULL);
INSERT INTO public.cat015 (codigo, valor, codigo_tipo, porcentaje, monto) VALUES ('43', 'Importador de productos pirotecnicos', 3, NULL, NULL);
INSERT INTO public.cat015 (codigo, valor, codigo_tipo, porcentaje, monto) VALUES ('44', 'Productor de tabaco', 3, NULL, NULL);
INSERT INTO public.cat015 (codigo, valor, codigo_tipo, porcentaje, monto) VALUES ('50', 'Distribuidor de Bebidas Gaseosas, Isotonicas, deportivas, fortificantes, energizante o estimulante', 3, NULL, NULL);
INSERT INTO public.cat015 (codigo, valor, codigo_tipo, porcentaje, monto) VALUES ('51', 'Bebidas Alcoholicas', 3, NULL, NULL);
INSERT INTO public.cat015 (codigo, valor, codigo_tipo, porcentaje, monto) VALUES ('52', 'Cerveza', 3, NULL, NULL);
INSERT INTO public.cat015 (codigo, valor, codigo_tipo, porcentaje, monto) VALUES ('53', 'Productos del tabaco', 3, NULL, NULL);
INSERT INTO public.cat015 (codigo, valor, codigo_tipo, porcentaje, monto) VALUES ('54', 'Bebidas Carbonatadas o Gaseosas Simples o Endulzadas', 3, NULL, NULL);
INSERT INTO public.cat015 (codigo, valor, codigo_tipo, porcentaje, monto) VALUES ('55', 'Otros especificos', 3, NULL, NULL);
INSERT INTO public.cat015 (codigo, valor, codigo_tipo, porcentaje, monto) VALUES ('57', 'Impuesto industria de Cemento', 2, NULL, NULL);
INSERT INTO public.cat015 (codigo, valor, codigo_tipo, porcentaje, monto) VALUES ('58', 'Alcohol', 3, NULL, NULL);
INSERT INTO public.cat015 (codigo, valor, codigo_tipo, porcentaje, monto) VALUES ('59', 'Turismo: por alojamiento (5%)', 1, '[0.05]', NULL);
INSERT INTO public.cat015 (codigo, valor, codigo_tipo, porcentaje, monto) VALUES ('71', 'Turismo: salida del pais por via aerea $7.00', 1, '[0]', '[7]');
INSERT INTO public.cat015 (codigo, valor, codigo_tipo, porcentaje, monto) VALUES ('77', 'Importador de Jugos, Nectares, Bebidas con Jugo y Refrescos', 3, NULL, NULL);
INSERT INTO public.cat015 (codigo, valor, codigo_tipo, porcentaje, monto) VALUES ('78', 'Distribuidor de Jugos, Nectares, Bebidas con Jugo y Refrescos', 3, NULL, NULL);
INSERT INTO public.cat015 (codigo, valor, codigo_tipo, porcentaje, monto) VALUES ('79', 'Sobre Llamandas Telefonicas Provenientes del Ext.', 3, NULL, NULL);
INSERT INTO public.cat015 (codigo, valor, codigo_tipo, porcentaje, monto) VALUES ('85', 'Detallista de Jugos, Nectares, Bebidas, con Jugo y Refrescos', 3, NULL, NULL);
INSERT INTO public.cat015 (codigo, valor, codigo_tipo, porcentaje, monto) VALUES ('86', 'Fabricante de Preparaciones Concentradas o en Polvo para la elaboracion de bebidas', 3, NULL, NULL);
INSERT INTO public.cat015 (codigo, valor, codigo_tipo, porcentaje, monto) VALUES ('90', 'Impuesto especial a la primera matricula', 2, NULL, NULL);
INSERT INTO public.cat015 (codigo, valor, codigo_tipo, porcentaje, monto) VALUES ('91', 'Fabricante de Jugos, Nectares, Bebidas con Jugo y Refrescos', 3, NULL, NULL);
INSERT INTO public.cat015 (codigo, valor, codigo_tipo, porcentaje, monto) VALUES ('92', 'Importador de Preparaciones Concentradas o en Polvo para la elaboracion de bebidas', 3, NULL, NULL);
INSERT INTO public.cat015 (codigo, valor, codigo_tipo, porcentaje, monto) VALUES ('A1', 'Especificos y Ad-Valorem', 3, NULL, NULL);
INSERT INTO public.cat015 (codigo, valor, codigo_tipo, porcentaje, monto) VALUES ('A5', 'Bebidas Gaseosas, Isotonicas, Deportivas, Fortificantes, Energizantes o Estimulantes', 3, NULL, NULL);
INSERT INTO public.cat015 (codigo, valor, codigo_tipo, porcentaje, monto) VALUES ('A6', 'Impuesto ad-valorem, armas de fuego, municiones explosivas y articulos similares', 2, NULL, NULL);
INSERT INTO public.cat015 (codigo, valor, codigo_tipo, porcentaje, monto) VALUES ('A7', 'Alcohol Etilico', NULL, NULL, NULL);
INSERT INTO public.cat015 (codigo, valor, codigo_tipo, porcentaje, monto) VALUES ('A8', 'Impuesto Especial al Combustible (0%, 0.5%, 1%)', 2, '[0, 0.005, 1]', NULL);
INSERT INTO public.cat015 (codigo, valor, codigo_tipo, porcentaje, monto) VALUES ('A9', 'Sacos Sinteticos', 3, NULL, NULL);
INSERT INTO public.cat015 (codigo, valor, codigo_tipo, porcentaje, monto) VALUES ('C3', 'Impuesto al Valor agregado(exportaciones) 0%', 1, NULL, NULL);
INSERT INTO public.cat015 (codigo, valor, codigo_tipo, porcentaje, monto) VALUES ('C5', 'Impuesto ad-valorem por diferencial de precios de bebidas alcoholicas (8%)', 3, '[0.08]', NULL);
INSERT INTO public.cat015 (codigo, valor, codigo_tipo, porcentaje, monto) VALUES ('C6', 'Impuesto ad-valorem por diferencial de precios al tabaco cigarrillos (39%)', 3, '[0.39]', NULL);
INSERT INTO public.cat015 (codigo, valor, codigo_tipo, porcentaje, monto) VALUES ('C7', 'Impuesto ad-valorem por diferencial de precios al tabaco cigarrillos (100%)', 3, '[1]', NULL);
INSERT INTO public.cat015 (codigo, valor, codigo_tipo, porcentaje, monto) VALUES ('C8', 'COTRANS ($0.10 Ctvs. Por galon)', 1, NULL, '[0.1]');
INSERT INTO public.cat015 (codigo, valor, codigo_tipo, porcentaje, monto) VALUES ('D1', 'FOVIAL ($0.20 Ctvs. Por galon)', 1, NULL, '[0.2]');
INSERT INTO public.cat015 (codigo, valor, codigo_tipo, porcentaje, monto) VALUES ('D4', 'Otros impuestos casos especiales', 1, NULL, NULL);
INSERT INTO public.cat015 (codigo, valor, codigo_tipo, porcentaje, monto) VALUES ('D5', 'Otras tasas casos especiales', 1, NULL, NULL);
INSERT INTO public.cat015 (codigo, valor, codigo_tipo, porcentaje, monto) VALUES ('O4', 'Otros impuestos casos especiales', 2, NULL, NULL);
INSERT INTO public.cat015 (codigo, valor, codigo_tipo, porcentaje, monto) VALUES ('O5', 'Otras tasas casos especiales', 2, NULL, NULL);


--
-- Data for Name: cat016; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

INSERT INTO public.cat016 (codigo, valor) VALUES ('1', 'Contado');
INSERT INTO public.cat016 (codigo, valor) VALUES ('2', 'Credito');
INSERT INTO public.cat016 (codigo, valor) VALUES ('3', 'Otro');


--
-- Data for Name: cat017; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

INSERT INTO public.cat017 (codigo, valor) VALUES ('01', 'Billetes y monedas');
INSERT INTO public.cat017 (codigo, valor) VALUES ('03', 'Tarjeta Credito');
INSERT INTO public.cat017 (codigo, valor) VALUES ('04', 'Cheque');
INSERT INTO public.cat017 (codigo, valor) VALUES ('03', 'Cuenta Libre');


--
-- Data for Name: cat018; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

INSERT INTO public.cat018 (codigo, valor) VALUES ('01', 'Dias');
INSERT INTO public.cat018 (codigo, valor) VALUES ('02', 'Meses');
INSERT INTO public.cat018 (codigo, valor) VALUES ('03', 'A�os');


--
-- Data for Name: cat019; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('01111', 'Cultivo de cereales excepto arroz y para forrajes', 1);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('01112', 'Cultivo de legumbres', 1);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('01113', 'Cultivo de semillas oleaginosas', 1);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('01114', 'Cultivo de plantas para la preparaci�n de semillas', 1);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('01119', 'Cultivo de otros cereales excepto arroz y forrajeros n.c.p.', 1);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('01120', 'Cultivo de arroz', 1);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('01131', 'Cultivo de ra�ces y tub�rculos', 1);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('01132', 'Cultivo de brotes, bulbos, vegetales tub�rculos y cultivos similares', 1);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('01133', 'Cultivo hort�cola de fruto', 1);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('01134', 'Cultivo de hortalizas de hoja y otras hortalizas ncp', 1);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('01140', 'Cultivo de ca�a de az�car', 1);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('01150', 'Cultivo de tabaco', 1);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('01161', 'Cultivo de algod�n', 1);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('01162', 'Cultivo de fibras vegetales excepto algod�n', 1);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('01191', 'Cultivo de plantas no perennes para la producci�n de semillas y flores', 1);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('01192', 'Cultivo de cereales y pastos para la alimentaci�n animal', 1);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('01199', 'Producci�n de cultivos no estacionales ncp', 1);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('01220', 'Cultivo de frutas tropicales', 1);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('01230', 'Cultivo de c�tricos', 1);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('01240', 'Cultivo de frutas de pepita y hueso', 1);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('01251', 'Cultivo de frutas ncp', 1);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('01252', 'Cultivo de otros frutos y nueces de �rboles y arbustos', 1);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('01260', 'Cultivo de frutos oleaginosos', 1);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('01271', 'Cultivo de caf�', 1);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('01272', 'Cultivo de plantas para la elaboraci�n de bebidas excepto caf�', 1);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('01281', 'Cultivo de especias y arom�ticas', 1);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('01282', 'Cultivo de plantas para la obtenci�n de productos medicinales y farmac�uticos', 1);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('01291', 'Cultivo de �rboles de hule (caucho) para la obtenci�n de l�tex', 1);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('01292', 'Cultivo de plantas para la obtenci�n de productos qu�micos y colorantes', 1);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('01299', 'Producci�n de cultivos perennes ncp', 1);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('01300', 'Propagaci�n de plantas', 1);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('01301', 'Cultivo de plantas y flores ornamentales', 1);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('01410', 'Cr�a y engorde de ganado bovino', 1);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('01420', 'Cr�a de caballos y otros equinos', 1);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('01440', 'Cr�a de ovejas y cabras', 1);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('01450', 'Cr�a de cerdos', 1);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('01460', 'Cr�a de aves de corral y producci�n de huevos', 1);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('01491', 'Cr�a de abejas apicultura para la obtenci�n de miel y otros productos ap�colas', 1);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('01492', 'Cr�a de conejos', 1);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('01493', 'Cr�a de iguanas y garrobo', 1);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('01494', 'Cr�a de mariposas y otros insectos', 1);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('01499', 'Cr�a y obtenci�n de productos animales n.c.p.', 1);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('01500', 'Cultivo de productos agr�colas en combinaci�n con la cr�a de animales', 1);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('01611', 'Servicios de maquinaria agr�cola', 1);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('01612', 'Control de plagas', 1);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('01613', 'Servicios de riego', 1);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('01614', 'Servicios de contrataci�n de mano de obra para la agricultura', 1);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('01619', 'Servicios agr�colas ncp', 1);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('01621', 'Actividades para mejorar la reproducci�n, el crecimiento y el rendimiento de los animales y sus productos', 1);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('01622', 'Servicios de mano de obra pecuaria', 1);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('01629', 'Servicios pecuarios ncp', 1);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('01631', 'Labores post cosecha de preparaci�n de los productos agr�colas para su comercializaci�n o para la industria', 1);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('01632', 'Servicio de beneficio de caf�', 1);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('01633', 'Servicio de beneficiado de plantas textiles (incluye el beneficiado cuando este es realizado en la misma explotaci�n agropecuaria)', 1);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('01640', 'Tratamiento de semillas para la propagaci�n', 1);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('01700', 'Caza ordinaria y mediante trampas, repoblaci�n de animales de caza y servicios conexo', 1);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('02100', 'Silvicultura y otras actividades forestales', 2);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('02200', 'Extracci�n de madera', 2);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('02300', 'Recolecci�n de productos diferentes a la madera', 2);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('02400', 'Servicios de apoyo a la silvicultura', 2);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('03110', 'Pesca mar�tima de altura y costera ', 3);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('03120', 'Pesca de agua dulce ', 3);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('03210', 'Acuicultura mar�tima ', 3);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('03220', 'Acuicultura de agua dulce ', 3);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('03300', 'Servicios de apoyo a la pesca y acuicultura ', 3);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('05100', 'Extracci�n de hulla', 4);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('05200', 'Extracci�n y aglomeraci�n de lignito', 4);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('06100', 'Extracci�n de petr�leo crudo', 5);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('06200', 'Extracci�n de gas natural', 5);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('07100', 'Extracci�n de minerales de hierro', 6);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('07210', 'Extracci�n de minerales de uranio y torio', 6);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('07290', 'Extracci�n de minerales metal�feros no ferroso', 6);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('08100', 'Extracci�n de piedra, arena y arcilla', 7);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('08910', 'Extracci�n de minerales para la fabricaci�n de abonos y productos qu�micos', 7);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('08920', 'Extracci�n y aglomeraci�n de turba', 7);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('08930', 'Extracci�n de sal', 7);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('08990', 'Explotaci�n de otras minas y canteras nc', 7);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('09100', 'Actividades de apoyo a la extracci�n de petr�leo y gas natural', 8);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('09900', 'Actividades de apoyo a la explotaci�n de minas y cantera', 8);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('10001', 'Empleados', 91);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('10002', 'Jubilado', 91);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('10003', 'Estudiante', 91);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('10004', 'Desempleado', 91);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('10005', 'Otros', 91);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('10101', 'Servicio de rastros y mataderos de bovinos y porcinos', 9);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('10102', 'Matanza y procesamiento de bovinos y porcinos', 9);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('10103', 'Matanza y procesamientos de aves de corral', 9);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('10104', 'Elaboraci�n y conservaci�n de embutidos y tripas naturales', 9);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('10105', 'Servicios de conservaci�n y empaque de carnes', 9);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('10106', 'Elaboraci�n y conservaci�n de grasas y aceites animales', 9);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('10107', 'Servicios de molienda de carne', 9);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('10108', 'Elaboraci�n de productos de carne ncp', 9);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('10201', 'Procesamiento y conservaci�n de pescado, crust�ceos y moluscos', 9);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('10209', 'Fabricaci�n de productos de pescado ncp', 9);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('10301', 'Elaboraci�n de jugos de frutas y hortalizasv', 9);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('10302', 'Elaboraci�n y envase de jaleas, mermeladas y frutas deshidratadas', 9);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('85103', 'Ense�anza primaria', 76);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('10309', 'Elaboraci�n de productos de frutas y hortalizas n.c.p.', 9);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('10401', 'Fabricaci�n de aceites y grasas vegetales y animales comestibles', 9);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('10402', 'Fabricaci�n de aceites y grasas vegetales y animales no comestible', 9);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('10409', 'Servicio de maquilado de aceites', 9);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('10501', 'Fabricaci�n de productos l�cteos excepto sorbetes y quesos sustitutos', 9);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('10502', 'Fabricaci�n de sorbetes y helados', 9);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('10503', 'Fabricaci�n de quesos', 9);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('10611', 'Molienda de cereales', 9);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('10612', 'Elaboraci�n de cereales para el desayuno y similare', 9);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('10613', 'Servicios de beneficiado de productos agr�colas ncp (excluye Beneficio de az�car rama 1072 y beneficio de caf� rama 0163)', 9);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('10621', 'Fabricaci�n de almid�n', 9);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('10628', 'Servicio de molienda de ma�z h�medo molino para nixtamal', 9);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('10711', 'Elaboraci�n de tortillas', 9);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('10712', 'Fabricaci�n de pan, galletas y barquillos', 9);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('10713', 'Fabricaci�n de reposter�a', 9);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('10721', 'Ingenios azucareros', 9);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('10722', 'Molienda de ca�a de az�car para la elaboraci�n de dulces', 9);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('10723', 'Elaboraci�n de jarabes de az�car y otros similares', 9);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('10724', 'Maquilado de az�car de ca�a', 9);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('10730', 'Fabricaci�n de cacao, chocolates y productos de confiter�a', 9);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('10740', 'Elaboraci�n de macarrones, fideos, y productos farin�ceos similare', 9);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('10750', 'Elaboraci�n de comidas y platos preparados para la reventa en locales y/o para exportaci�n', 9);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('10791', 'Elaboraci�n de productos de caf�', 9);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('10792', 'Elaboraci�n de especies, sazonadores y condimentos', 9);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('10793', 'Elaboraci�n de sopas, cremas y consom�', 9);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('10794', 'Fabricaci�n de bocadillos tostados y/o fritos', 9);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('10799', 'Elaboraci�n de productos alimenticios ncp', 9);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('10800', 'Elaboraci�n de alimentos preparados para animale', 9);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('11012', 'Fabricaci�n de aguardiente y licores', 10);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('11020', 'Elaboraci�n de vinos', 10);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('11030', 'Fabricaci�n de cerveza', 10);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('11041', 'Fabricaci�n de aguas gaseosas', 10);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('11042', 'Fabricaci�n y envasado de agua', 10);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('11043', 'Elaboraci�n de refrescos', 10);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('11048', 'Maquilado de aguas gaseosas', 10);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('11049', 'Elaboraci�n de bebidas no alcoh�licas', 10);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('12000', 'Elaboraci�n de productos de tabaco', 11);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('13111', 'Preparaci�n de fibras textiles ', 12);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('13112', 'Fabricaci�n de hilados ', 12);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('13120', 'Fabricaci�n de telas ', 12);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('13130', 'Acabado de productos textiles ', 12);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('13910', 'Fabricaci�n de tejidos de punto y ganchillo ', 12);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('13921', 'Fabricaci�n de productos textiles para el hogar', 13);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('13922', 'Sacos, bolsas y otros art�culos textiles', 13);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('13929', 'Fabricaci�n de art�culos confeccionados con materiales textiles, excepto prendas de vestir ncp', 13);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('13930', 'Fabricaci�n de tapices y alfombras', 13);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('13941', 'Fabricaci�n de cuerdas de henequ�n y otras fibras naturales (lazos, pitas)', 13);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('13942', 'Fabricaci�n de redes de diversos materiales', 13);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('13948', 'Maquilado de productos trenzables de cualquier material (petates, sillas, etc.)', 13);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('13991', 'Fabricaci�n de adornos, etiquetas y otros art�culos para prendas de vestir', 13);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('13992', 'Servicio de bordados en art�culos y prendas de tela', 13);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('13999', 'Fabricaci�n de productos textiles ncp', 13);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('14101', 'Fabricaci�n de ropa interior, para dormir y similares', 14);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('14102', 'Fabricaci�n de ropa para ni�os', 14);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('14103', 'Fabricaci�n de prendas de vestir para ambos sexos', 14);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('14104', 'Confecci�n de prendas a medida', 14);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('14105', 'Fabricaci�n de prendas de vestir para deportes', 14);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('14106', 'Elaboraci�n de artesan�as de uso personal confeccionadas especialmente de materiales textiles', 14);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('14108', 'Maquilado de prendas de vestir, accesorios y otros', 14);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('14109', 'Fabricaci�n de prendas y accesorios de vestir n.c.p.', 14);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('14200', 'Fabricaci�n de art�culos de piel', 14);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('14301', 'Fabricaci�n de calcetines, calcetas, medias (panty house) y otros similares', 14);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('14302', 'Fabricaci�n de ropa interior de tejido de punto', 14);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('14309', 'Fabricaci�n de prendas de vestir de tejido de punto ncp', 14);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('15208', 'Maquilado de partes y accesorios de calzado', 14);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('16100', 'Aserradero y acepilladura de madera', 15);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('16210', 'Fabricaci�n de madera laminada, terciada, enchapada y contrachapada, paneles para la construcci�n', 15);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('16220', 'Fabricaci�n de partes y piezas de carpinter�a para edificios y construcciones', 15);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('16230', 'Fabricaci�n de envases y recipientes de madera', 15);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('16292', 'Fabricaci�n de artesan�as de madera, semillas, materiales trenzable', 15);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('16299', 'Fabricaci�n de productos de madera, corcho, paja y materiales trenzables ncp', 15);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('17010', 'Fabricaci�n de pasta de madera, papel y cart�n', 16);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('17020', 'Fabricaci�n de papel y cart�n ondulado y envases de papel y cart�', 16);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('17091', 'Fabricaci�n de art�culos de papel y cart�n de uso personal y dom�stico', 16);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('17092', 'Fabricaci�n de productos de papel ncp', 16);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('18110', 'Impresi�n', 17);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('18120', 'Servicios relacionados con la impresi�n', 17);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('18200', 'Reproducci�n de grabacione', 17);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('19100', 'Fabricaci�n de productos de hornos de coque', 18);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('19201', 'Fabricaci�n de combustible', 18);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('19202', 'Fabricaci�n de aceites y lubricante', 18);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('20111', 'Fabricaci�n de materias primas para la fabricaci�n de colorantes', 19);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('20112', 'Fabricaci�n de materiales curtientes', 19);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('20113', 'Fabricaci�n de gases industriales', 19);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('20114', 'Fabricaci�n de alcohol et�lico', 19);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('20119', 'Fabricaci�n de sustancias qu�micas b�sicas', 19);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('20120', 'Fabricaci�n de abonos y fertilizantes', 19);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('20130', 'Fabricaci�n de pl�stico y caucho en formas primarias', 19);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('20210', 'Fabricaci�n de plaguicidas y otros productos qu�micos de uso agropecuario', 19);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('20220', 'Fabricaci�n de pinturas, barnices y productos de revestimiento similares; tintas de imprenta y masilla', 19);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('20231', 'Fabricaci�n de jabones, detergentes y similares para limpieza', 19);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('20232', 'Fabricaci�n de perfumes, cosm�ticos y productos de higiene y cuidado personal, incluyendo tintes, champ�, etc.', 19);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('20291', 'Fabricaci�n de tintas y colores para escribir y pintar; fabricaci�n de cintas para impresoras', 19);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('20292', 'Fabricaci�n de productos pirot�cnicos, explosivos y municiones', 19);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('20299', 'Fabricaci�n de productos qu�micos n.c.p.', 19);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('20300', 'Fabricaci�n de fibras artificiale', 19);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('21001', 'Manufactura de productos farmac�uticos, sustancias qu�micas y productos bot�nicos', 20);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('21008', 'Maquilado de medicamentos', 20);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('22110', 'Fabricaci�n de cubiertas y c�maras; renovaci�n y recauchutado de cubiertas', 21);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('22190', 'Fabricaci�n de otros productos de caucho', 21);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('22201', 'Fabricaci�n de envases pl�sticos', 21);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('22202', 'Fabricaci�n de productos pl�sticos para uso personal o dom�stico', 21);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('22208', 'Maquila de pl�sticos', 21);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('22209', 'Fabricaci�n de productos pl�sticos n.c.p.', 21);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('23101', 'Fabricaci�n de vidrio', 22);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('23102', 'Fabricaci�n de recipientes y envases de vidrio', 22);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('23108', 'Servicio de maquilado', 22);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('23109', 'Fabricaci�n de productos de vidrio ncp', 22);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('23910', 'Fabricaci�n de productos refractarios', 22);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('23920', 'Fabricaci�n de productos de arcilla para la construcci�n', 22);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('23931', 'Fabricaci�n de productos de cer�mica y porcelana no refractaria', 22);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('23932', 'Fabricaci�n de productos de cer�mica y porcelana ncp', 22);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('23940', 'Fabricaci�n de cemento, cal y yeso', 22);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('23950', 'Fabricaci�n de art�culos de hormig�n, cemento y yeso', 22);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('23960', 'Corte, tallado y acabado de la piedra', 22);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('23990', 'Fabricaci�n de productos minerales no met�licos ncp', 22);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('24100', 'Industrias b�sicas de hierro y acero', 23);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('24200', 'Fabricaci�n de productos primarios de metales preciosos y metales no ferrosos', 23);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('24310', 'Fundici�n de hierro y acero', 23);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('24320', 'Fundici�n de metales no ferrosos', 23);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('25111', 'Fabricaci�n de productos met�licos para uso estructural', 24);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('25118', 'Servicio de maquila para la fabricaci�n de estructuras met�licas', 24);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('25120', 'Fabricaci�n de tanques, dep�sitos y recipientes de metal', 24);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('25130', 'Fabricaci�n de generadores de vapor, excepto calderas de agua caliente para calefacci�n central', 24);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('25200', 'Fabricaci�n de armas y municiones', 24);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('25910', 'Forjado, prensado, estampado y laminado de metales; pulvimetalurgia', 24);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('25920', 'Tratamiento y revestimiento de metales', 24);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('25930', 'Fabricaci�n de art�culos de cuchiller�a, herramientas de mano y art�culos de ferreter�a', 24);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('25991', 'Fabricaci�n de envases y art�culos conexos de metal', 24);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('25992', 'Fabricaci�n de art�culos met�licos de uso personal y/o dom�stico', 24);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('25999', 'Fabricaci�n de productos elaborados de metal nc', 24);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('26100', 'Fabricaci�n de componentes electr�nicos', 25);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('26200', 'Fabricaci�n de computadoras y equipo conexo', 25);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('26300', 'Fabricaci�n de equipo de comunicaciones', 25);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('26400', 'Fabricaci�n de aparatos electr�nicos de consumo para audio, video radio y televisi�n', 25);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('26510', 'Fabricaci�n de instrumentos y aparatos para medir, verificar, ensayar, navegar y de control de procesos industriales', 25);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('26520', 'Fabricaci�n de relojes y piezas de relojes', 25);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('26600', 'Fabricaci�n de equipo m�dico de irradiaci�n y equipo electr�nico de uso m�dico y terap�utico', 25);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('26700', 'Fabricaci�n de instrumentos de �ptica y equipo fotogr�fico', 25);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('26800', 'Fabricaci�n de medios magn�ticos y �pticos', 25);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('27500', 'Fabricaci�n de aparatos de uso dom�stico', 27);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('27900', 'Fabricaci�n de otros tipos de equipo el�ctrico', 27);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('28110', 'Fabricaci�n de motores y turbinas, excepto motores para aeronaves, veh�culos automotores y motocicletas', 28);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('28120', 'Fabricaci�n de equipo hidr�ulico', 28);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('28130', 'Fabricaci�n de otras bombas, compresores, grifos y v�lvulas', 28);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('28140', 'Fabricaci�n de cojinetes, engranajes, trenes de engranajes y piezas de transmisi�n', 28);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('28150', 'Fabricaci�n de hornos y quemadores', 28);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('28160', 'Fabricaci�n de equipo de elevaci�n y manipulaci�n', 28);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('28170', 'Fabricaci�n de maquinaria y equipo de oficina', 28);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('28180', 'Fabricaci�n de herramientas manuales', 28);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('28190', 'Fabricaci�n de otros tipos de maquinaria de uso general', 28);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('28210', 'Fabricaci�n de maquinaria agropecuaria y forestal', 28);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('28220', 'Fabricaci�n de m�quinas para conformar metales y maquinaria herramienta', 28);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('28230', 'Fabricaci�n de maquinaria metal�rgica', 28);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('28240', 'Fabricaci�n de maquinaria para la explotaci�n de minas y canteras y para obras de construcci�n', 28);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('28250', 'Fabricaci�n de maquinaria para la elaboraci�n de alimentos, bebidas y tabaco', 28);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('28260', 'Fabricaci�n de maquinaria para la elaboraci�n de productos textiles, prendas de vestir y cueros', 28);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('28291', 'Fabricaci�n de m�quinas para imprenta', 28);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('28299', 'Fabricaci�n de maquinaria de uso especial ncp', 28);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('29100', 'Fabricaci�n veh�culos automotores', 29);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('29200', 'Fabricaci�n de carrocer�as para veh�culos automotores; fabricaci�n de remolques y semiremolques', 29);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('29300', 'Fabricaci�n de partes, piezas y accesorios para veh�culos automotores', 29);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('30110', 'Fabricaci�n de buques', 30);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('30120', 'Construcci�n y reparaci�n de embarcaciones de recreo', 30);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('30200', 'Fabricaci�n de locomotoras y de material rodante', 30);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('30300', 'Fabricaci�n de aeronaves y naves espaciales', 30);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('30400', 'Fabricaci�n de veh�culos militares de combate', 30);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('30910', 'Fabricaci�n de motocicletas', 30);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('30920', 'Fabricaci�n de bicicletas y sillones de ruedas para inv�lidos', 30);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('30990', 'Fabricaci�n de equipo de transporte ncp', 30);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('31001', 'Fabricaci�n de colchones y somier', 31);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('31002', 'Fabricaci�n de muebles y otros productos de madera a medida', 31);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('31008', 'Servicios de maquilado de muebles', 31);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('31009', 'Fabricaci�n de muebles ncp', 31);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('32110', 'Fabricaci�n de joyas plater�as y joyer�as', 31);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('32120', 'Fabricaci�n de joyas de imitaci�n (fantas�a) y art�culos conexos', 31);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('32200', 'Fabricaci�n de instrumentos musicales', 31);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('32301', 'Fabricaci�n de art�culos de deporte', 31);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('32308', 'Servicio de maquila de productos deportivos', 31);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('32401', 'Fabricaci�n de juegos de mesa y de sal�n', 31);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('32402', 'Servicio de maquilado de juguetes y juegos', 31);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('32409', 'Fabricaci�n de juegos y juguetes n.c.p.', 31);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('32500', 'Fabricaci�n de instrumentos y materiales m�dicos y odontol�gicos', 31);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('32901', 'Fabricaci�n de l�pices, bol�grafos, sellos y art�culos de librer�a en general', 31);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('32902', 'Fabricaci�n de escobas, cepillos, pinceles y similares', 31);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('32903', 'Fabricaci�n de artesan�as de materiales diversos', 31);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('32904', 'Fabricaci�n de art�culos de uso personal y dom�sticos n.c.p.', 31);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('32905', 'Fabricaci�n de accesorios para las confecciones y la marroquiner�a n.c.p.', 31);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('32908', 'Servicios de maquila ncp', 31);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('32909', 'Fabricaci�n de productos manufacturados n.c.p.', 31);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('33110', 'Reparaci�n y mantenimiento de productos elaborados de metal', 32);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('33120', 'Reparaci�n y mantenimiento de maquinaria', 32);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('33130', 'Reparaci�n y mantenimiento de equipo electr�nico y �ptico', 32);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('33140', 'Reparaci�n y mantenimiento de equipo el�ctrico', 32);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('33150', 'Reparaci�n y mantenimiento de equipo de transporte, excepto veh�culos automotores', 32);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('33190', 'Reparaci�n y mantenimiento de equipos n.c.p.', 32);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('33200', 'Instalaci�n de maquinaria y equipo industrial', 32);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('35101', 'Generaci�n de energ�a el�ctrica', 33);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('35102', 'Transmisi�n de energ�a el�ctrica', 33);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('35103', 'Distribuci�n de energ�a el�ctrica', 33);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('35200', 'Fabricaci�n de gas, distribuci�n de combustibles gaseosos por tuber�as', 33);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('35300', 'Suministro de vapor y agua calient', 33);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('36000', 'Captaci�n, tratamiento y suministro de agua', 34);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('37000', 'Evacuaci�n de aguas residuales (alcantarillado)', 35);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('38110', 'Recolecci�n y transporte de desechos s�lidos proveniente de hogares y sector urbano', 36);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('38120', 'Recolecci�n de desechos peligrosos', 36);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('38210', 'Tratamiento y eliminaci�n de desechos inicuos', 36);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('38220', 'Tratamiento y eliminaci�n de desechos peligrosos', 36);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('38301', 'Reciclaje de desperdicios y desechos textiles', 36);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('38302', 'Reciclaje de desperdicios y desechos de pl�stico y caucho', 36);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('38303', 'Reciclaje de desperdicios y desechos de vidrio', 36);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('38304', 'Reciclaje de desperdicios y desechos de papel y cart�n', 36);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('38305', 'Reciclaje de desperdicios y desechos met�licos', 36);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('38309', 'Reciclaje de desperdicios y desechos no met�licos n.c.p.', 36);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('39000', 'Actividades de Saneamiento y otros Servicios de Gesti�n de Desechos', 37);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('41001', 'Construcci�n de edificios residenciales', 38);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('41002', 'Construcci�n de edificios no residenciales', 38);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('42100', 'Construcci�n de carreteras, calles y caminos', 39);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('42200', 'Construcci�n de proyectos de servicio p�blico', 39);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('42900', 'Construcci�n de obras de ingenier�a civil n.c.p.', 39);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('43110', 'Demolici�n', 40);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('43120', 'Preparaci�n de terreno', 40);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('43210', 'Instalaciones el�ctricas', 40);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('43220', 'Instalaci�n de fontaner�a, calefacci�n y aire acondicionado', 40);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('43290', 'Otras instalaciones para obras de construcci�n', 40);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('43300', 'Terminaci�n y acabado de edificios', 40);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('43900', 'Otras actividades especializadas de construcci�n', 40);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('43901', 'Fabricaci�n de techos y materiales diversos', 40);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('45100', 'Venta de veh�culos automotores', 41);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('45201', 'Reparaci�n mec�nica de veh�culos automotores', 41);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('45202', 'Reparaciones el�ctricas del automotor y recarga de bater�as', 41);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('45203', 'Enderezado y pintura de veh�culos automotores', 41);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('45204', 'Reparaciones de radiadores, escapes y silenciadores', 41);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('45205', 'Reparaci�n y reconstrucci�n de v�as, stop y otros art�culos de fibra de vidrio', 41);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('45206', 'Reparaci�n de llantas de veh�culos automotores', 41);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('45207', 'Polarizado de veh�culos (mediante la adhesi�n de papel especial a los vidrios)', 41);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('45208', 'Lavado y pasteado de veh�culos (carwash)', 41);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('45209', 'Reparaciones de veh�culos n.c.p.', 41);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('45211', 'Remolque de veh�culos automotores', 41);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('45301', 'Venta de partes, piezas y accesorios nuevos para veh�culos automotores', 41);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('45302', 'Venta de partes, piezas y accesorios usados para veh�culos automotores', 41);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('45401', 'Venta de motocicletas', 41);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('45402', 'Venta de repuestos, piezas y accesorios de motocicletas', 41);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('45403', 'Mantenimiento y reparaci�n de motocicletas', 41);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46100', 'Venta al por mayor a cambio de retribuci�n o por contrata', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46201', 'Venta al por mayor de materias primas agr�colas', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46202', 'Venta al por mayor de productos de la silvicultura', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46203', 'Venta al por mayor de productos pecuarios y de granja', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46211', 'Venta de productos para uso agropecuario', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46291', 'Venta al por mayor de granos b�sicos (cereales, leguminosas)', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46292', 'Venta al por mayor de semillas mejoradas para cultivo', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46293', 'Venta al por mayor de caf� oro y uva', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46294', 'Venta al por mayor de ca�a de az�ca', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46295', 'Venta al por mayor de flores, plantas y otros productos naturales', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46296', 'Venta al por mayor de productos agr�colas', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46297', 'Venta al por mayor de ganado bovino (vivo)', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46298', 'Venta al por mayor de animales porcinos, ovinos, caprino, can�culas, ap�colas, av�colas vivos', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46299', 'Venta de otras especies vivas del reino animal', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46301', 'Venta al por mayor de alimentos', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46302', 'Venta al por mayor de bebidas', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46303', 'Venta al por mayor de tabaco', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46371', 'Venta al por mayor de frutas, hortalizas (verduras), legumbres y tub�rculos', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46372', 'Venta al por mayor de pollos, gallinas destazadas, pavos y otras aves', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46373', 'Venta al por mayor de carne bovina y porcina, productos de carne y embutidos', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46374', 'Venta al por mayor de huevos', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46375', 'Venta al por mayor de productos l�cteos', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46376', 'Venta al por mayor de productos farin�ceos de panader�a (pan dulce, cakes, reposter�a, etc.)', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46377', 'Venta al por mayor de pastas alimenticias, aceites y grasas comestibles vegetal y animal', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46378', 'Venta al por mayor de sal comestible', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46379', 'Venta al por mayor de az�car', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46391', 'Venta al por mayor de abarrotes (vinos, licores, productos alimenticios envasados, etc.)', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46392', 'Venta al por mayor de aguas gaseosas', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46393', 'Venta al por mayor de agua purificada', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46394', 'Venta al por mayor de refrescos y otras bebidas, l�quidas o en polvo', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46395', 'Venta al por mayor de cerveza y licores', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46396', 'Venta al por mayor de hielo', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46411', 'Venta al por mayor de hilados, tejidos y productos textiles de mercer�a', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46412', 'Venta al por mayor de art�culos textiles excepto confecciones para el hogar', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46413', 'Venta al por mayor de confecciones textiles para el hogar', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46414', 'Venta al por mayor de prendas de vestir y accesorios de vestir', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46415', 'Venta al por mayor de ropa usada', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46416', 'Venta al por mayor de calzado', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46417', 'Venta al por mayor de art�culos de marroquiner�a y talabarter�a', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46418', 'Venta al por mayor de art�culos de peleter�a', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46419', 'Venta al por mayor de otros art�culos textiles n.c.p.', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46471', 'Venta al por mayor de instrumentos musicales', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46472', 'Venta al por mayor de colchones, almohadas, cojines, etc.', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46473', 'Venta al por mayor de art�culos de aluminio para el hogar y para otros usos', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46474', 'Venta al por mayor de dep�sitos y otros art�culos pl�sticos para el hogar y otros usos, incluyendo los desechables de durapax y no desechables', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46475', 'Venta al por mayor de c�maras fotogr�ficas, accesorios y materiale', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46482', 'Venta al por mayor de medicamentos, art�culos y otros productos de uso veterinario', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46483', 'Venta al por mayor de productos y art�culos de belleza y de uso personal', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46484', 'Venta de productos farmac�uticos y medicinales', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46491', 'Venta al por mayor de productos medicinales, cosm�ticos, perfumer�a y productos de limpieza', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46492', 'Venta al por mayor de relojes y art�culos de joyer�a', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46493', 'Venta al por mayor de electrodom�sticos y art�culos del hogar excepto bazar; art�culos de iluminaci�n', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46494', 'Venta al por mayor de art�culos de bazar y similares', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46495', 'Venta al por mayor de art�culos de �ptica', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46496', 'Venta al por mayor de revistas, peri�dicos, libros, art�culos de librer�a y art�culos de papel y cart�n en general', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46497', 'Venta de art�culos deportivos, juguetes y rodados', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46498', 'Venta al por mayor de productos usados para el hogar o el uso personal', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46499', 'Venta al por mayor de enseres dom�sticos y de uso personal n.c.p.', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46500', 'Venta al por mayor de bicicletas, partes, accesorios y otros', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46510', 'Venta al por mayor de computadoras, equipo perif�rico y programas inform�ticos', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46520', 'Venta al por mayor de equipos de comunicaci�n', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46530', 'Venta al por mayor de maquinaria y equipo agropecuario, accesorios, partes y suministros', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46590', 'Venta de equipos e instrumentos de uso profesional y cient�fico y aparatos de medida y control', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46591', 'Venta al por mayor de maquinaria equipo, accesorios y materiales para la industria de la madera y sus productos', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46592', 'Venta al por mayor de maquinaria, equipo, accesorios y materiales para la industria gr�fica y del papel, cart�n y productos de papel y cart�n', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46593', 'Venta al por mayor de maquinaria, equipo, accesorios y materiales para la industria de productos qu�micos, pl�stico y caucho', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46594', 'Venta al por mayor de maquinaria, equipo, accesorios y materiales para la industria met�lica y de sus productos', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46595', 'Venta al por mayor de equipamiento para uso m�dico, odontol�gico, veterinario y servicios conexos', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46596', 'Venta al por mayor de maquinaria, equipo, accesorios y partes para la industria de la alimentaci�n', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46597', 'Venta al por mayor de maquinaria, equipo, accesorios y partes para la industria textil, confecciones y cuero', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46598', 'Venta al por mayor de maquinaria, equipo y accesorios para la construcci�n y explotaci�n de minas y canteras', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46599', 'Venta al por mayor de otro tipo de maquinaria y equipo con sus accesorios y partes', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46610', 'Venta al por mayor de otros combustibles s�lidos, l�quidos, gaseosos y de productos conexos', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46612', 'Venta al por mayor de combustibles para automotores, aviones, barcos, maquinaria y otros', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46613', 'Venta al por mayor de lubricantes, grasas y otros aceites para automotores, maquinaria industrial, etc.', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46614', 'Venta al por mayor de gas propano', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46615', 'Venta al por mayor de le�a y carb�n', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46620', 'Venta al por mayor de metales y minerales metal�feros', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46631', 'Venta al por mayor de puertas, ventanas, vitrinas y similares', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46632', 'Venta al por mayor de art�culos de ferreter�a y pinturer�as', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46633', 'Vidrier�as', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46634', 'Venta al por mayor de maderas', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46639', 'Venta al por mayor de materiales para la construcci�n n.c.p.', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46691', 'Venta al por mayor de sal industrial sin yodar', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46692', 'Venta al por mayor de productos intermedios y desechos de origen textil', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46693', 'Venta al por mayor de productos intermedios y desechos de origen met�lico', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46694', 'Venta al por mayor de productos intermedios y desechos de papel y cart�n', 42);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46695', 'Venta al por mayor fertilizantes, abonos, agroqu�micos y productos similares', 43);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46696', 'Venta al por mayor de productos intermedios y desechos de origen pl�stic', 43);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46697', 'Venta al por mayor de tintas para imprenta, productos curtientes y materias y productos colorantes', 43);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46698', 'Venta de productos intermedios y desechos de origen qu�mico y de caucho', 43);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46699', 'Venta al por mayor de productos intermedios y desechos ncp', 43);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46701', 'Venta de algod�n en oro', 43);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46900', 'Venta al por mayor de otros productos', 43);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46901', 'Venta al por mayor de cohetes y otros productos pirot�cnicos', 43);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46902', 'Venta al por mayor de art�culos diversos para consumo humano', 43);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46903', 'Venta al por mayor de armas de fuego, municiones y accesorios', 43);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46904', 'Venta al por mayor de toldos y tiendas de campa�a de cualquier material', 43);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46905', 'Venta al por mayor de exhibidores publicitarios y r�tulos', 43);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('46906', 'Venta al por mayor de art�culos promocionales diverso', 43);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47111', 'Venta en supermercados', 44);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47112', 'Venta en tiendas de art�culos de primera necesidad', 44);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47119', 'Almacenes (venta de diversos art�culos)', 44);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47190', 'Venta al por menor de otros productos en comercios no especializados', 44);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47199', 'Venta de establecimientos no especializados con surtido compuesto principalmente de alimentos, bebidas y tabaco', 44);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47211', 'Venta al por menor de frutas y hortalizas', 44);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47212', 'Venta al por menor de carnes, embutidos y productos de granja', 44);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47213', 'Venta al por menor de pescado y mariscos', 44);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47214', 'Venta al por menor de productos l�cteos', 44);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47215', 'Venta al por menor de productos de panader�a, reposter�a y galleta', 44);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47216', 'Venta al por menor de huevos', 44);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47217', 'Venta al por menor de carnes y productos c�rnicos', 44);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47218', 'Venta al por menor de granos b�sicos y otros', 44);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47219', 'Venta al por menor de alimentos n.c.p.', 44);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47221', 'Venta al por menor de hielo', 44);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47223', 'Venta de bebidas no alcoh�licas, para su consumo fuera del establecimiento', 44);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47224', 'Venta de bebidas alcoh�licas, para su consumo fuera del establecimiento', 44);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47225', 'Venta de bebidas alcoh�licas para su consumo dentro del establecimiento', 44);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47230', 'Venta al por menor de tabaco', 44);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47300', 'Venta de combustibles, lubricantes y otros (gasolineras)', 45);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47411', 'Venta al por menor de computadoras y equipo perif�rico', 45);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47412', 'Venta de equipo y accesorios de telecomunicaci�n', 45);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47420', 'Venta al por menor de equipo de audio y video', 45);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47510', 'Venta al por menor de hilados, tejidos y productos textiles de mercer�a; confecciones para el hogar y textiles n.c.p.', 45);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47521', 'Venta al por menor de productos de madera', 45);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47522', 'Venta al por menor de art�culos de ferreter�a', 45);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47523', 'Venta al por menor de productos de pinturer�as', 45);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47524', 'Venta al por menor en vidrier�as', 45);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47529', 'Venta al por menor de materiales de construcci�n y art�culos conexos', 45);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47530', 'Venta al por menor de tapices, alfombras y revestimientos de paredes y pisos en comercios especializados', 45);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47591', 'Venta al por menor de muebles', 45);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47592', 'Venta al por menor de art�culos de bazar', 45);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47593', 'Venta al por menor de aparatos electrodom�sticos, repuestos y accesorios', 45);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47594', 'Venta al por menor de art�culos el�ctricos y de iluminaci�n', 45);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47598', 'Venta al por menor de instrumentos musicales', 45);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47610', 'Venta al por menor de libros, peri�dicos y art�culos de papeler�a en comercios especializados', 45);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47620', 'Venta al por menor de discos l�ser, cassettes, cintas de video y otros', 45);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47630', 'Venta al por menor de productos y equipos de deporte', 45);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47631', 'Venta al por menor de bicicletas, accesorios y repuestos', 45);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47640', 'Venta al por menor de juegos y juguetes en comercios especializados', 45);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47711', 'Venta al por menor de prendas de vestir y accesorios de vestir', 45);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47712', 'Venta al por menor de calzado', 45);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47713', 'Venta al por menor de art�culos de peleter�a, marroquiner�a y talabarter�a', 45);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47721', 'Venta al por menor de medicamentos farmac�uticos y otros materiales y art�culos de uso m�dico, odontol�gico y veterinario', 45);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47722', 'Venta al por menor de productos cosm�ticos y de tocador', 45);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47731', 'Venta al por menor de productos de joyer�a, bisuter�a, �ptica, relojer�a', 45);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47732', 'Venta al por menor de plantas, semillas, animales y art�culos conexo', 45);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47733', 'Venta al por menor de combustibles de uso dom�stico (gas propano y gas licuado)', 45);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47734', 'Venta al por menor de artesan�as, art�culos cer�micos y recuerdos en general', 45);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47735', 'Venta al por menor de ata�des, l�pidas y cruces, trofeos, art�culos religiosos en general', 45);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47736', 'Venta al por menor de armas de fuego, municiones y accesorios', 45);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47737', 'Venta al por menor de art�culos de coheter�a y pirot�cnicos', 45);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47738', 'Venta al por menor de art�culos desechables de uso personal y dom�stico (servilletas, papel higi�nico, pa�ales, toallas sanitarias, etc.)', 45);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47739', 'Venta al por menor de otros productos n.c.p.', 45);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47741', 'Venta al por menor de art�culos usados', 45);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47742', 'Venta al por menor de textiles y confecciones usados', 45);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47743', 'Venta al por menor de libros, revistas, papel y cart�n usados', 45);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47749', 'Venta al por menor de productos usados n.c.p.', 45);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47811', 'Venta al por menor de frutas, verduras y hortalizas', 45);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47814', 'Venta al por menor de productos l�cteos', 45);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47815', 'Venta al por menor de productos de panader�a, galletas y similares', 45);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47816', 'Venta al por menor de bebidas', 45);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47818', 'Venta al por menor en tiendas de mercado y puestos', 45);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47821', 'Venta al por menor de hilados, tejidos y productos textiles de mercer�a en puestos de mercados y ferias', 45);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47822', 'Venta al por menor de art�culos textiles excepto confecciones para el hogar en puestos de mercados y ferias', 45);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47823', 'Venta al por menor de confecciones textiles para el hogar en puestos de mercados y ferias', 45);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47824', 'Venta al por menor de prendas de vestir, accesorios de vestir y similares en puestos de mercados y ferias', 45);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47825', 'Venta al por menor de ropa usada', 45);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47826', 'Venta al por menor de calzado, art�culos de marroquiner�a y talabarter�a en puestos de mercados y ferias', 45);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47827', 'Venta al por menor de art�culos de marroquiner�a y talabarter�a en puestos de mercados y ferias', 45);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47829', 'Venta al por menor de art�culos textiles ncp en puestos de mercados y ferias', 45);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47891', 'Venta al por menor de animales, flores y productos conexos en puestos de feria y mercados', 45);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47892', 'Venta al por menor de productos medicinales, cosm�ticos, de tocador y de limpieza en puestos de ferias y mercados', 45);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47893', 'Venta al por menor de art�culos de bazar en puestos de ferias y mercados', 45);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47894', 'Venta al por menor de art�culos de papel, envases, libros, revistas y conexos en puestos de feria y mercados', 45);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47895', 'Venta al por menor de materiales de construcci�n, electrodom�sticos, accesorios para autos y similares en puestos de feria y mercados', 45);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47896', 'Venta al por menor de equipos accesorios para las comunicaciones en puestos de feria y mercados', 45);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47899', 'Venta al por menor en puestos de ferias y mercados n.c.p.', 45);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47910', 'Venta al por menor por correo o Internet', 45);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('47990', 'Otros tipos de venta al por menor no realizada, en almacenes, puestos de venta o mercado', 45);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('49110', 'Transporte interurbano de pasajeros por ferrocarril', 46);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('49120', 'Transporte de carga por ferrocarril', 46);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('49211', 'Transporte de pasajeros urbanos e interurbano mediante buses', 46);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('49212', 'Transporte de pasajeros interdepartamental mediante microbuses', 46);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('49213', 'Transporte de pasajeros urbanos e interurbano mediante microbuses', 46);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('49214', 'Transporte de pasajeros interdepartamental mediante buses', 46);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('49221', 'Transporte internacional de pasajeros', 46);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('49222', 'Transporte de pasajeros mediante taxis y autos con chofer', 46);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('49223', 'Transporte escolar', 46);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('49225', 'Transporte de pasajeros para excursiones', 46);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('49226', 'Servicios de transporte de personal', 46);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('49229', 'Transporte de pasajeros por v�a terrestre ncp', 46);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('49231', 'Transporte de carga urbano', 46);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('49232', 'Transporte nacional de carga', 46);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('49233', 'Transporte de carga internacional', 46);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('49234', 'Servicios de mudanza', 46);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('49235', 'Alquiler de veh�culos de carga con conductor', 46);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('49300', 'Transporte por oleoducto o gasoducto', 46);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('50110', 'Transporte de pasajeros mar�timo y de cabotaje', 47);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('50120', 'Transporte de carga mar�timo y de cabotaje', 47);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('50211', 'Transporte de pasajeros por v�as de navegaci�n interiore', 47);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('50212', 'Alquiler de equipo de transporte de pasajeros por v�as de navegaci�n interior con conductor', 48);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('50220', 'Transporte de carga por v�as de navegaci�n interiores', 48);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('51100', 'Transporte a�reo de pasajeros', 48);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('51201', 'Transporte de carga por v�a a�rea', 48);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('51202', 'Alquiler de equipo de aerotransporte con operadores para el prop�sito de transportar carg', 48);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('52101', 'Alquiler de instalaciones de almacenamiento en zonas francas', 49);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('52102', 'Alquiler de silos para conservaci�n y almacenamiento de granos', 49);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('52103', 'Alquiler de instalaciones con refrigeraci�n para almacenamiento y conservaci�n de alimentos y otros productos', 49);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('52109', 'Alquiler de bodegas para almacenamiento y dep�sito n.c.p.', 49);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('52211', 'Servicio de garaje y estacionamiento', 49);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('52212', 'Servicios de terminales para el transporte por v�a terrestre', 49);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('52219', 'Servicios para el transporte por v�a terrestre n.c.p.', 49);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('52220', 'Servicios para el transporte acu�tico', 49);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('52230', 'Servicios para el transporte a�reo', 49);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('52240', 'Manipulaci�n de carga', 49);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('52290', 'Servicios para el transporte ncp', 49);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('52291', 'Agencias de tramitaciones aduanales', 49);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('53100', 'Servicios de correo nacional', 50);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('53200', 'Actividades de correo distintas a las actividades postales nacionales', 50);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('55101', 'Actividades de alojamiento para estancias cortas', 51);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('55102', 'Hoteles', 51);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('55200', 'Actividades de campamentos, parques de veh�culos de recreo y parques de caravanas', 51);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('55900', 'Alojamiento n.c.p.', 51);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('56101', 'Restaurantes', 52);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('56106', 'Pupuser�a', 52);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('56107', 'Actividades varias de restaurantes', 52);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('56108', 'Comedores', 52);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('56109', 'Merenderos ambulantes', 52);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('56210', 'Preparaci�n de comida para eventos especiales', 52);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('56291', 'Servicios de provisi�n de comidas por contrato', 52);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('56292', 'Servicios de concesi�n de cafetines y chalet en empresas e instituciones', 52);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('56299', 'Servicios de preparaci�n de comidas ncp', 52);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('56301', 'Servicio de expendio de bebidas en salones y bares', 52);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('56302', 'Servicio de expendio de bebidas en puestos callejeros, mercados y ferias', 52);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('58110', 'Edici�n de libros, folletos, partituras y otras ediciones distintas a estas', 53);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('58120', 'Edici�n de directorios y listas de correos', 53);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('58130', 'Edici�n de peri�dicos, revistas y otras publicaciones peri�dicas', 53);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('58190', 'Otras actividades de edici�n', 53);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('58200', 'Edici�n de programas inform�ticos (software)', 53);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('59110', 'Actividades de producci�n cinematogr�fica', 54);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('59120', 'Actividades de post producci�n de pel�culas, videos y programas de televisi�n', 54);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('59130', 'Actividades de distribuci�n de pel�culas cinematogr�ficas, videos y programas de televisi�n', 54);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('59140', 'Actividades de exhibici�n de pel�culas cinematogr�ficas y cintas de v�deo', 54);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('59200', 'Actividades de edici�n y grabaci�n de m�sica', 54);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('61101', 'Servicio de telefon�a ', 55);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('61102', 'Servicio de Internet ', 55);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('61103', 'Servicio de telefon�a fija ', 55);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('61109', 'Servicio de Internet n.c.p. ', 55);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('61201', 'Servicios de telefon�a celular ', 55);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('61202', 'Servicios de Internet inal�mbrico ', 55);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('61209', 'Servicios de telecomunicaciones inal�mbrico n.c.p.', 55);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('61301', 'Telecomunicaciones satelitales', 55);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('61309', 'Comunicaci�n v�a sat�lite n.c.p.', 55);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('61900', 'Actividades de telecomunicaci�n n.c.p.', 55);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('62010', 'Programaci�n inform�tica', 56);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('62020', 'Consultor�as y gesti�n de servicios inform�ticos', 56);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('62090', 'Otras actividades de tecnolog�a de informaci�n y servicios de computadora', 56);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('63110', 'Procesamiento de datos y actividades relacionadas', 57);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('63120', 'Portales WEB', 57);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('63910', 'Servicios de Agencias de Noticias', 57);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('63990', 'Otros servicios de informaci�n n.c.p.', 57);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('64110', 'Servicios provistos por el Banco Central de El salvador', 58);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('64190', 'Bancos', 58);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('64192', 'Entidades dedicadas al env�o de remesas', 58);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('64199', 'Otras entidades financieras', 58);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('64200', 'Actividades de sociedades de cartera', 58);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('64300', 'Fideicomisos, fondos y otras fuentes de financiamiento', 58);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('64910', 'Arrendamientos financieros', 58);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('64920', 'Asociaciones cooperativas de ahorro y cr�dito dedicadas a la intermediaci�n financiera', 58);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('64921', 'Instituciones emisoras de tarjetas de cr�dito y otros', 58);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('64922', 'Tipos de cr�dito ncp', 58);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('64928', 'Prestamistas y casas de empe�o', 58);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('64990', 'Actividades de servicios financieros, excepto la financiaci�n de planes de seguros y de pensiones n.c.p.', 58);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('65110', 'Planes de seguros de vida', 59);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('65120', 'Planes de seguro excepto de vida', 59);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('65199', 'Seguros generales de todo tipo', 59);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('65200', 'Planes se seguro', 59);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('65300', 'Planes de pensiones', 59);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('66110', 'Administraci�n de mercados financieros (Bolsa de Valores)', 60);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('66120', 'Actividades burs�tiles (Corredores de Bolsa)', 60);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('66190', 'Actividades auxiliares de la intermediaci�n financiera ncp', 60);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('66210', 'Evaluaci�n de riesgos y da�os', 60);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('66220', 'Actividades de agentes y corredores de seguros', 60);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('66290', 'Otras actividades auxiliares de seguros y fondos de pensiones', 60);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('66300', 'Actividades de administraci�n de fondos', 60);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('68101', 'Servicio de alquiler y venta de lotes en cementerios', 61);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('68109', 'Actividades inmobiliarias realizadas con bienes propios o arrendados n.c.p.', 61);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('68200', 'Actividades Inmobiliarias Realizadas a Cambio de una Retribuci�n o por Contrata', 61);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('69100', 'Actividades jur�dicas', 62);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('69200', 'Actividades de contabilidad, tenedur�a de libros y auditor�a; asesoramiento en materia de impuestos', 62);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('70100', 'Actividades de oficinas centrales de sociedades de cartera', 63);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('70200', 'Actividades de consultor�a en gesti�n empresarial', 63);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('71101', 'Servicios de arquitectura y planificaci�n urbana y servicios conexos', 64);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('71102', 'Servicios de ingenier�a', 64);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('71103', 'Servicios de agrimensura, topograf�a, cartograf�a, prospecci�n y geof�sica y servicios conexos', 64);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('71200', 'Ensayos y an�lisis t�cnicos', 64);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('72100', 'Investigaciones y desarrollo experimental en el campo de las ciencias naturales y la ingenier�a', 65);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('72199', 'Investigaciones cient�ficas', 65);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('72200', 'Investigaciones y desarrollo experimental en el campo de las ciencias sociales y las humanidades cient�fica y desarrollo', 65);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('73100', 'Publicidad', 66);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('73200', 'Investigaci�n de mercados y realizaci�n de encuestas de opini�n p�blica', 67);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('74100', 'Actividades de dise�o especializado', 68);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('74200', 'Actividades de fotograf�a', 68);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('74900', 'Servicios profesionales y cient�ficos ncp', 68);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('75000', 'Actividades veterinarias', 69);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('77101', 'Alquiler de equipo de transporte terrestre', 70);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('77102', 'Alquiler de equipo de transporte acu�tico', 70);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('77103', 'Alquiler de equipo de transporte por v�a a�rea', 70);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('77210', 'Alquiler y arrendamiento de equipo de recreo y deportivo', 70);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('77220', 'Alquiler de cintas de video y discos', 70);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('77290', 'Alquiler de otros efectos personales y enseres dom�sticos', 70);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('77300', 'Alquiler de maquinaria y equipo', 70);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('77400', 'Arrendamiento de productos de propiedad intelectual', 70);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('78100', 'Obtenci�n y dotaci�n de personal', 71);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('78200', 'Actividades de las agencias de trabajo temporal', 71);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('78300', 'Dotaci�n de recursos humanos y gesti�n; gesti�n de las funciones de recursos humanos', 71);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('79110', 'Actividades de agencias de viajes y organizadores de viajes; actividades de asistencia a turistas', 72);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('79120', 'Actividades de los operadores tur�sticos', 72);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('79900', 'Otros servicios de reservas y actividades relacionadas', 72);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('80100', 'Servicios de seguridad privados', 73);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('80201', 'Actividades de servicios de sistemas de seguridad', 73);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('80202', 'Actividades para la prestaci�n de sistemas de seguridad', 73);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('80300', 'Actividades de investigaci�n', 73);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('81100', 'Actividades combinadas de mantenimiento de edificios e instalaciones', 74);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('81210', 'Limpieza general de edificios', 74);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('81290', 'Otras actividades combinadas de mantenimiento de edificios e instalaciones ncp', 74);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('81300', 'Servicio de jardiner�a', 74);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('82110', 'Servicios administrativos de oficinas', 75);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('82190', 'Servicio de fotocopiado y similares, excepto en imprentas', 75);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('82200', 'Actividades de las centrales de llamadas (call center)', 75);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('82300', 'Organizaci�n de convenciones y ferias de negocios', 75);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('82910', 'Actividades de agencias de cobro y oficinas de cr�dito', 75);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('82921', 'Servicios de envase y empaque de productos alimenticios', 75);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('82922', 'Servicios de envase y empaque de productos medicinales', 75);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('82929', 'Servicio de envase y empaque ncp', 75);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('82990', 'Actividades de apoyo empresariales ncp', 75);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('85101', 'Guarder�a educativa', 76);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('85102', 'Ense�anza preescolar o parvularia', 76);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('85104', 'Servicio de educaci�n preescolar y primaria integrada', 76);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('85211', 'Ense�anza secundaria tercer ciclo (7�, 8� y 9�)', 76);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('85212', 'Ense�anza secundaria de formaci�n general bachillerato', 76);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('85221', 'Ense�anza secundaria de formaci�n t�cnica y profesional', 76);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('85222', 'Ense�anza secundaria de formaci�n t�cnica y profesional integrada con ense�anza primaria', 76);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('85301', 'Ense�anza superior universitaria', 76);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('85302', 'Ense�anza superior no universitari', 76);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('85303', 'Ense�anza superior integrada a educaci�n secundaria y/o primaria', 76);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('85410', 'Educaci�n deportiva y recreativa', 76);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('85420', 'Educaci�n cultural', 76);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('85490', 'Otros tipos de ense�anza n.c.p.', 76);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('85499', 'Ense�anza formal', 76);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('85500', 'Servicios de apoyo a la ense�anza', 76);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('86100', 'Actividades de hospitales', 77);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('86201', 'Cl�nicas m�dicas', 77);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('86202', 'Servicios de Odontolog�a', 77);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('86203', 'Servicios m�dicos', 77);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('86901', 'Servicios de an�lisis y estudios de diagn�stico', 77);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('86902', 'Actividades de atenci�n de la salud humana', 77);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('86909', 'Otros Servicio relacionados con la salud ncp', 77);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('87100', 'Residencias de ancianos con atenci�n de enfermer�a', 78);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('87200', 'Instituciones dedicadas al tratamiento del retraso mental, problemas de salud mental y el uso indebido de sustancias nocivas', 78);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('87300', 'Instituciones dedicadas al cuidado de ancianos y discapacitados', 78);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('87900', 'Actividades de asistencia a ni�os y j�venes', 78);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('87901', 'Otras actividades de atenci�n en instituciones', 78);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('88100', 'Actividades de asistencia sociales sin alojamiento para ancianos y discapacitados', 79);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('88900', 'Servicios sociales sin alojamiento ncp', 79);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('90000', 'Actividades creativas art�sticas y de esparcimiento', 80);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('91010', 'Actividades de bibliotecas y archivos', 81);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('91020', 'Actividades de museos y preservaci�n de lugares y edificios hist�ricos', 81);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('91030', 'Actividades de jardines bot�nicos, zool�gicos y de reservas naturale', 81);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('92000', 'Actividades de juegos y apuestas', 82);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('93110', 'Gesti�n de instalaciones deportivas', 83);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('93120', 'Actividades de clubes deportivos', 83);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('93190', 'Otras actividades deportivas', 83);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('93210', 'Actividades de parques de atracciones y parques tem�ticos', 83);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('93291', 'Discotecas y salas de baile', 83);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('93298', 'Centros vacacionales', 83);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('93299', 'Actividades de esparcimiento ncp', 83);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('94110', 'Actividades de organizaciones empresariales y de empleadores', 84);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('94120', 'Actividades de organizaciones profesionales', 84);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('94200', 'Actividades de sindicatos', 84);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('94910', 'Actividades de organizaciones religiosas', 84);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('94920', 'Actividades de organizaciones pol�ticas', 84);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('94990', 'Actividades de asociaciones n.c.p.', 84);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('95110', 'Reparaci�n de computadoras y equipo perif�rico', 85);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('95120', 'Reparaci�n de equipo de comunicaci�n', 85);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('95210', 'Reparaci�n de aparatos electr�nicos de consumo', 85);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('95220', 'Reparaci�n de aparatos dom�stico y equipo de hogar y jard�n', 85);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('95230', 'Reparaci�n de calzado y art�culos de cuero', 85);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('95240', 'Reparaci�n de muebles y accesorios para el hogar', 85);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('95291', 'Reparaci�n de Instrumentos musicales', 85);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('95292', 'Servicios de cerrajer�a y copiado de llaves', 85);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('95293', 'Reparaci�n de joyas y relojes', 85);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('95294', 'Reparaci�n de bicicletas, sillas de ruedas y rodados n.c.p.', 85);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('95299', 'Reparaciones de enseres personales n.c.p.', 85);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('96010', 'Lavado y limpieza de prendas de tela y de piel, incluso la limpieza en seco', 86);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('96020', 'Peluquer�a y otros tratamientos de belleza', 86);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('96030', 'Pompas f�nebres y actividades conexas', 86);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('96091', 'Servicios de sauna y otros servicios para la est�tica corporal n.c.p.', 86);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('96092', 'Servicios n.c.p.', 86);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('97000', 'Actividad de los hogares en calidad de empleadores de personal dom�stico', 87);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('98100', 'Actividades indiferenciadas de producci�n de bienes de los hogares privados para uso propio', 88);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('98200', 'Actividades indiferenciadas de producci�n de servicios de los hogares privados para uso propio', 88);
INSERT INTO public.cat019 (codigo, valor, cod_tipo) VALUES ('99000', 'Actividades de organizaciones y �rganos extraterritoriales', 90);


--
-- Data for Name: cat020; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

INSERT INTO public.cat020 (codigo, valor) VALUES ('9300', 'EL SALVADOR');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9303', 'AFGANIST�N');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9304', 'ALAN');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9306', 'ALBANIA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9309', 'ALEMANIA OCCID');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9310', 'ALEMANIA ORIENT');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9311', 'ALEMANIA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9315', 'ALTO VOLTA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9317', 'ANDORRA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9318', 'ANGOLA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9319', 'ANTIG Y BARBUDA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9320', 'ANGUILA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9324', 'ARABIA SAUDITA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9327', 'ARGELIA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9330', 'ARGENTIN');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9332', 'ARUBA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9333', 'AUSTRALIA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9336', 'AUSTRIA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9338', 'AZERBAIY�N');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9339', 'BANGLADESH');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9342', 'BAHR�IN');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9345', 'BARBADOS');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9348', 'B�LGICA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9349', 'BELICE');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9350', 'BEN�N');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9353', 'BIELORRUSIA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9354', 'BIRMANIA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9357', 'BOLIVIA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9359', 'BOSNIA Y HERZEGOVINA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9360', 'BOTSWANA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9363', 'BRASIL');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9366', 'BRUN�I');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9369', 'BULGARIA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9371', 'BURKINA FASO');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9372', 'BURUNDI');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9374', 'BOPHUTHATSWANA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9375', 'BUT�N');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9376', 'CABINDA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9377', 'CABO VERDE');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9378', 'CAMBOYA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9381', 'CAMER�N');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9384', 'CANAD�');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9387', 'CEIL�N');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9390', 'CTRO AFRIC REP');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9393', 'COLOMBIA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9394', 'COMORAS-ISLAS');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9396', 'CONGO REP DEL');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9399', 'CONGO REP DEMOC');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9402', 'COREA NORTE');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9405', 'COREA SUR');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9408', 'COSTA DE MARFIL');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9411', 'COSTA RICA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9414', 'CUBA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9415', 'CURAZAO');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9417', 'CHAD');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9420', 'CHECOSLOVAQUIA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9423', 'CHILE');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9426', 'CHINA REP POPUL');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9432', 'CHIPRE');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9435', 'DAHOMEY');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9438', 'DINAMARCA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9439', 'DJIBOUTI');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9440', 'DOMINICA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9441', 'DOMINICANA REP');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9444', 'ECUADOR');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9446', 'EMIRAT ARAB UNI');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9447', 'ESPA�A');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9449', 'ESLOVAQUIA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9450', 'EE UU');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9451', 'ESLOVENIA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9452', 'WALLIS Y FUTUNA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9453', 'ETIOPIA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9454', 'ERITREA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9456', 'FIJI-ISLAS');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9457', 'ESTONIA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9459', 'FILIPINAS');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9462', 'FINLANDIA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9465', 'FRANCIA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9468', 'GAB�N');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9471', 'GAMBIA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9472', 'GEORGIA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9474', 'GHANA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9477', 'GIBRALTAR');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9480', 'GRECIA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9481', 'GRENADA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9482', 'GROENLANDIA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9483', 'GUATEMALA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9486', 'GUINEA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9487', 'GUYANA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9489', 'GUADALUPE');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9490', 'GUAM');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9491', 'GUAYANA FRANCESA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9492', 'GUERNSEY');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9493', 'GUINEA ECUATORIAL');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9494', 'GUINEA-BISSAU');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9495', 'HAIT�');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9498', 'HOLANDA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9501', 'HONDURAS');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9504', 'HONG KONG');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9507', 'HUNGR�A');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9510', 'INDIA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9513', 'INDONESIA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9514', 'INGLATERRA Y GALES');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9516', 'IRAK');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9519', 'IR�N');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9521', 'ISLA DE MA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9522', 'IRLANDA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9523', 'ISLA DE NAVIDAD');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9524', 'ISLA DE COCOS');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9525', 'ISLANDIA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9526', 'ISLAS SALOM�N');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9527', 'ISLAS COOK');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9528', 'ISRAEL');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9529', 'ISLAS FEROE');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9530', 'ISLAS AZORES');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9531', 'ITALIA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9532', 'ISLA QESHM');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9533', 'ISLAS MALVINAS');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9534', 'JAMAICA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9535', 'ISLAS MARIANAS DEL NORTE');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9536', 'ISLAS MARSHALL');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9537', 'JAP�N');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9538', 'ISLAS PITCAIM');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9539', 'ISLAS TURCAS Y CAICOS');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9540', 'JORDANIA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9541', 'KASAKISTAN');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9542', 'ISLAS ULTRAMARINAS DE EE UU');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9543', 'KENIA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9544', 'KIRIBATI');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9545', 'ISLAS V�RGENES ESTADOUNIDENSES');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9546', 'KUWAIT');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9547', 'JERSEY');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9548', 'KIRGUIST�N');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9549', 'LAOS');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9551', 'LETONIA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9552', 'LESOTHO');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9555', 'L�BANO');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9558', 'LIBERIA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9561', 'LIBIA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9564', 'LIECHTENSTEIN');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9565', 'LITUANIA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9567', 'LUXEMBURGO');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9568', 'MACAO');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9570', 'MADAGASCAR');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9571', 'MACEDONIA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9573', 'MALASIA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9574', 'MALI');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9576', 'MALAWI');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9577', 'MALDIVAS');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9579', 'MALI');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9582', 'MALTA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9585', 'MARRUECOS');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9591', 'MASCATE Y OM�N');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9594', 'MAURICIO');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9597', 'MAURITANIA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9598', 'MAYOTTE');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9600', 'M�XICO');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9601', 'MICRONESIA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9602', 'MOLDAVIA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9603', 'M�NACO');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9606', 'MONGOLIA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9607', 'MONTENEGRO');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9608', 'MONSERRAT');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9609', 'MOZAMBIQUE');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9610', 'NAMIBIA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9611', 'NAURU');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9612', 'NEPAL');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9615', 'NICARAGUA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9618', 'N�GER');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9621', 'NIGERIA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9622', 'NIUE');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9623', 'NORFOLK');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9624', 'NORUEGA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9627', 'NVA CALEDONIA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9633', 'NVA ZELANDIA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9636', 'NUEVAS HEBRIDAS');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9638', 'PAPUA NV GUINEA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9639', 'PAKIST�N');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9640', 'PALESTINA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9641', 'CROACIA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9642', 'PANAM�');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9643', 'PALAOS');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9645', 'PARAGUAY');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9648', 'PER�');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9651', 'POLONIA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9652', 'POLINESIA FRANCESA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9654', 'PORTUGAL');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9660', 'QATAR EL');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9663', 'REINO UNIDO');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9664', 'REPUBLICA CHECA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9666', 'EGIPTO');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9667', 'REUNI�N');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9669', 'RODESI');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9672', 'RUANDA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9673', 'REPUBLICA DE ARMENIA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9675', 'RUMANIA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9676', 'SAHARA OCCIDENTAL');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9677', 'SAN MARINO');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9678', 'SAMOA OCCID');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9679', 'SAINT KITTS AND NEVIS');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9680', 'SANTA LUCIA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9681', 'SENEGAL');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9682', 'SAOTOME Y PRINC');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9683', 'SN VIC Y GRENAD');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9684', 'SIERRA LEONA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9685', 'SAMOA AMERICANA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9686', 'SAN PEDRO Y MIQUEL�N');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9687', 'SINGAPUR');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9688', 'SANTA ELENA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9689', 'SERBIA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9690', 'SIRIA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9691', 'SEYCHELLES');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9692', 'SVALBARD Y JAN MAYEN');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9693', 'SOMALIA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9696', 'SUD�FRICA REP');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9699', 'SUDAN');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9702', 'SUECIA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9705', 'SUIZA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9706', 'SURINAM');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9707', 'SRI LANKA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9708', 'SUECILANDIA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9709', 'TAYIKIST�N');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9711', 'TAILANDIA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9712', 'TERRITORIO BRIT�NICO DEL OC�ANO INDICO');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9713', 'TERRITORIOS AUSTRALES FRANCESES');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9714', 'TANZANIA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9715', 'TERRITORIOS PALESTINOS');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9716', 'TIMOR ORIENTAL');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9717', 'TOGO');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9718', 'TOKELAU');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9719', 'TURKMENIST�N');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9720', 'TRINIDAD TOBAGO');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9722', 'TONGA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9723', 'T�NEZ');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9725', 'TRANSKEI');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9726', 'TURQU�A');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9727', 'TUVALU');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9729', 'UGANDA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9732', 'U R S S');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9733', 'RUSIA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9735', 'URUGUAY');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9736', 'UCRANIA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9737', 'UZBEKIST�N');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9738', 'VATICANO');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9739', 'VANUATU');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9740', 'VENDA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9741', 'VENEZUELA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9744', 'VIETNAM NORTE');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9746', 'VIETNAM');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9747', 'VIETNAM SUR');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9750', 'YEMEN SUR RE');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9751', 'YIBUTI');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9756', 'YUGOSLAVIA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9758', 'ZAIRE');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9759', 'ZAMBIA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9760', 'ZIMBABWE');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9850', 'PUERTO RICO');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9862', 'BAHAMAS');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9863', 'BERMUDAS');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9865', 'MARTINICA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9886', 'NUEVA GUINEA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9887', 'ISLAS GRAN CAIM�N');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9888', 'SAN MAARTEN');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9897', 'ISLAS V�RGENES BRIT�NICAS');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9898', 'ANT HOLANDESAS');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9899', 'TAIW�N');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9900', 'DELAWARE (USA)');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9901', 'NEVADA (USA)');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9902', 'WYOMING (USA)');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9903', 'CAMPIONE DITALIA, ITALIA');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9904', 'FLORIDA (USA)');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9905', 'DAKOTA DEL SUR (USA)');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9906', 'TEXAS (USA)');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9907', 'WASHINGTON (USA)');
INSERT INTO public.cat020 (codigo, valor) VALUES ('9999', 'No definido en migraci�n');


--
-- Data for Name: cat021; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

INSERT INTO public.cat021 (codigo, valor) VALUES (1, 'Emisor');
INSERT INTO public.cat021 (codigo, valor) VALUES (2, 'Receptor');
INSERT INTO public.cat021 (codigo, valor) VALUES (3, 'M�dico (solo aplica para contribuyentes obligados a la presentaci�n de  F-958)');
INSERT INTO public.cat021 (codigo, valor) VALUES (4, 'Transporte (solo aplica para Factura de exportaci�n)');


--
-- Data for Name: cat022; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

INSERT INTO public.cat022 (codigo, valor) VALUES (2, 'Carnet de Residente');
INSERT INTO public.cat022 (codigo, valor) VALUES (13, 'DUI');
INSERT INTO public.cat022 (codigo, valor) VALUES (36, 'NIT');
INSERT INTO public.cat022 (codigo, valor) VALUES (37, 'Pasaporte');


--
-- Data for Name: cat023; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

INSERT INTO public.cat023 (codigo, valor) VALUES ('01', 'Factura Electr�nico');
INSERT INTO public.cat023 (codigo, valor) VALUES ('03', 'Comprobante de Cr�dito Fiscal Electr�nico');
INSERT INTO public.cat023 (codigo, valor) VALUES ('04', 'Nota de Remisi�n Electr�nica');
INSERT INTO public.cat023 (codigo, valor) VALUES ('05', 'Nota de Cr�dito Electr�nica');
INSERT INTO public.cat023 (codigo, valor) VALUES ('06', 'Nota de D�bito Electr�nica');
INSERT INTO public.cat023 (codigo, valor) VALUES ('11', 'Factura de Exportaci�n Electr�nica');
INSERT INTO public.cat023 (codigo, valor) VALUES ('14', 'Factura de Sujeto Excluido Electr�nica');


--
-- Data for Name: cat024; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

INSERT INTO public.cat024 (codigo, valor) VALUES (1, 'Error en la Informaci�n del Documento Tributario Electr�nico a invalidar.');
INSERT INTO public.cat024 (codigo, valor) VALUES (2, 'Rescindir de la operaci�n realizada.');
INSERT INTO public.cat024 (codigo, valor) VALUES (3, 'Otro');


--
-- Data for Name: cat025; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

INSERT INTO public.cat025 (codigo, valor) VALUES ('01', 'Dep�sito');
INSERT INTO public.cat025 (codigo, valor) VALUES ('02', 'Propiedad');
INSERT INTO public.cat025 (codigo, valor) VALUES ('03', 'Consignaci�n');
INSERT INTO public.cat025 (codigo, valor) VALUES ('04', 'Traslado');
INSERT INTO public.cat025 (codigo, valor) VALUES ('05', 'Otros');


--
-- Data for Name: cat026; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

INSERT INTO public.cat026 (codigo, valor) VALUES (1, 'Efectivo');
INSERT INTO public.cat026 (codigo, valor) VALUES (2, 'Bien');
INSERT INTO public.cat026 (codigo, valor) VALUES (3, 'Servicio');


--
-- Data for Name: cat027; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

INSERT INTO public.cat027 (codigo, valor) VALUES ('02', 'Mar�tima de Acajutla');
INSERT INTO public.cat027 (codigo, valor) VALUES ('03', 'A�rea Monse�or �scar Arnulfo Romero');
INSERT INTO public.cat027 (codigo, valor) VALUES ('04', 'Terrestre Las Chinamas');
INSERT INTO public.cat027 (codigo, valor) VALUES ('05', 'Terrestre La Hachadura');
INSERT INTO public.cat027 (codigo, valor) VALUES ('06', 'Terrestre Santa Ana');
INSERT INTO public.cat027 (codigo, valor) VALUES ('07', 'Terrestre San Crist�bal');
INSERT INTO public.cat027 (codigo, valor) VALUES ('08', 'Terrestre Anguiat�');
INSERT INTO public.cat027 (codigo, valor) VALUES ('09', 'Terrestre El Amatillo');
INSERT INTO public.cat027 (codigo, valor) VALUES ('10', 'Mar�tima La Uni�n (Puerto Cutuco)');
INSERT INTO public.cat027 (codigo, valor) VALUES ('11', 'Terrestre El Poy');
INSERT INTO public.cat027 (codigo, valor) VALUES ('12', 'Aduana Terrestre Metal�o');
INSERT INTO public.cat027 (codigo, valor) VALUES ('15', 'Fardos Postales');
INSERT INTO public.cat027 (codigo, valor) VALUES ('16', 'Z.F. San Marcos');
INSERT INTO public.cat027 (codigo, valor) VALUES ('17', 'Z.F. El Pedregal');
INSERT INTO public.cat027 (codigo, valor) VALUES ('18', 'Z.F. San Bartolo');
INSERT INTO public.cat027 (codigo, valor) VALUES ('20', 'Z.F. Exportsalva');
INSERT INTO public.cat027 (codigo, valor) VALUES ('21', 'Z.F. American Park');
INSERT INTO public.cat027 (codigo, valor) VALUES ('23', 'Z.F. Internacional');
INSERT INTO public.cat027 (codigo, valor) VALUES ('24', 'Z.F. Diez');
INSERT INTO public.cat027 (codigo, valor) VALUES ('26', 'Z.F. Miramar');
INSERT INTO public.cat027 (codigo, valor) VALUES ('27', 'Z.F. Santo Tomas');
INSERT INTO public.cat027 (codigo, valor) VALUES ('28', 'Z.F. Santa Tecla');
INSERT INTO public.cat027 (codigo, valor) VALUES ('29', 'Z.F. Santa Ana');
INSERT INTO public.cat027 (codigo, valor) VALUES ('30', 'Z.F. La Concordia');
INSERT INTO public.cat027 (codigo, valor) VALUES ('31', 'A�rea Ilopango');
INSERT INTO public.cat027 (codigo, valor) VALUES ('32', 'Z.F. Pipil');
INSERT INTO public.cat027 (codigo, valor) VALUES ('33', 'Puerto Barillas');
INSERT INTO public.cat027 (codigo, valor) VALUES ('34', 'Z.F. Calvo Conservas');
INSERT INTO public.cat027 (codigo, valor) VALUES ('35', 'Feria Internacional');
INSERT INTO public.cat027 (codigo, valor) VALUES ('36', 'Delg. Aduana El Papal�n');
INSERT INTO public.cat027 (codigo, valor) VALUES ('37', 'Z.F. Parque Industrial Sam-Li');
INSERT INTO public.cat027 (codigo, valor) VALUES ('38', 'Z.F. San Jos�');
INSERT INTO public.cat027 (codigo, valor) VALUES ('39', 'Z.F. Las Mercedes');
INSERT INTO public.cat027 (codigo, valor) VALUES ('71', 'Almacenes De Desarrollo (Aldesa)');
INSERT INTO public.cat027 (codigo, valor) VALUES ('72', 'Almac. Gral. Dep. Occidente (Agdosa)');
INSERT INTO public.cat027 (codigo, valor) VALUES ('73', 'Bodega General De Dep�sito (Bodesa)');
INSERT INTO public.cat027 (codigo, valor) VALUES ('76', 'DHL');
INSERT INTO public.cat027 (codigo, valor) VALUES ('77', 'Transauto (Santa Elena)');
INSERT INTO public.cat027 (codigo, valor) VALUES ('80', 'Almacenadora Nejapa, S.a. de C.V');
INSERT INTO public.cat027 (codigo, valor) VALUES ('81', 'Almacenadora Almaconsa S.A. De C.V.');
INSERT INTO public.cat027 (codigo, valor) VALUES ('83', 'Alm.Gral. Dep�sito Occidente (Apopa)');
INSERT INTO public.cat027 (codigo, valor) VALUES ('99', 'San Bartolo Env�o Hn/Gt');


--
-- Data for Name: cat028; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

INSERT INTO public.cat028 (codigo, valor) VALUES ('EX-1.1000.000', 'Exportaci�n Definitiva, Exportaci�n Definitiva, R�gimen Com�n');
INSERT INTO public.cat028 (codigo, valor) VALUES ('EX-1.1040.000', 'Exportaci�n Definitiva, Exportaci�n Definitiva Sustituci�n de Mercanc�as, R�gimen Com�n');
INSERT INTO public.cat028 (codigo, valor) VALUES ('EX-1.1041.020', 'Exportaci�n Definitiva, Exportaci�n Definitiva Proveniente de Franquicia Provisional, Franq. Presidenciales exento de DAI');
INSERT INTO public.cat028 (codigo, valor) VALUES ('EX-1.1041.021', 'Exportaci�n Definitiva, Exportaci�n Definitiva Proveniente de Franquicia Provisional, Franq. Presidenciales exento de DAI e IVA');
INSERT INTO public.cat028 (codigo, valor) VALUES ('EX-1.1048.025', 'Exportaci�n Definitiva, Exportaci�n Definitiva Proveniente de Franquicia Definitiva, Maquinaria y Equipo LZF. DPA');
INSERT INTO public.cat028 (codigo, valor) VALUES ('EX-1.1048.031', 'Exportaci�n Definitiva, Exportaci�n Definitiva Proveniente de Franquicia Definitiva, Distribuci�n Internacional');
INSERT INTO public.cat028 (codigo, valor) VALUES ('EX-1.1048.032', 'Exportaci�n Definitiva, Exportaci�n Definitiva Proveniente. de Franquicia Definitiva, Operaciones Internacionales de Log�stica');
INSERT INTO public.cat028 (codigo, valor) VALUES ('EX-1.1048.033', 'Exportaci�n Definitiva, Exportaci�n Definitiva Proveniente de Franquicia Definitiva, Centro Internacional de llamadas (Call Center)');
INSERT INTO public.cat028 (codigo, valor) VALUES ('EX-1.1048.034', 'Exportaci�n Definitiva, Exportaci�n Definitiva Proveniente de Franquicia Definitiva, Tecnolog�as de Informaci�n LSI');
INSERT INTO public.cat028 (codigo, valor) VALUES ('EX-1.1048.035', 'Exportaci�n Definitiva, Exportaci�n Definitiva Proveniente de Franquicia Definitiva, Investigaci�n y Desarrollo LSI');
INSERT INTO public.cat028 (codigo, valor) VALUES ('EX-1.1048.036', 'Exportaci�n Definitiva, Exportaci�n Definitiva Proveniente de Franquicia Definitiva, Reparaci�n y Mantenimiento de Embarcaciones Mar�timas LSI');
INSERT INTO public.cat028 (codigo, valor) VALUES ('EX-1.1048.037', 'Exportaci�n Definitiva, Exportaci�n Definitiva Proveniente de Franquicia Definitiva, Reparaci�n y Mantenimiento de Aeronaves LSI');
INSERT INTO public.cat028 (codigo, valor) VALUES ('EX-1.1048.038', 'Exportaci�n Definitiva, Exportaci�n Definitiva Proveniente de Franquicia Definitiva, Procesos Empresariales LSI');
INSERT INTO public.cat028 (codigo, valor) VALUES ('EX-1.1048.039', 'Exportaci�n Definitiva, Exportaci�n Definitiva Proveniente de Franquicia Definitiva, Servicios Medico-Hospitalarios LSI');
INSERT INTO public.cat028 (codigo, valor) VALUES ('EX-1.1048.040', 'Exportaci�n Definitiva, Exportaci�n Definitiva Proveniente de Franquicia Definitiva, Servicios Financieros Internacionales LSI');
INSERT INTO public.cat028 (codigo, valor) VALUES ('EX-1.1048.043', 'Exportaci�n Definitiva, Exportaci�n Definitiva Proveniente de Franquicia Definitiva, Reparaci�n y Mantenimiento de Contenedores LSI');
INSERT INTO public.cat028 (codigo, valor) VALUES ('EX-1.1048.044', 'Exportaci�n Definitiva, Exportaci�n Definitiva Proveniente de Franquicia Definitiva, Reparaci�n de Equipos Tecnol�gicos LS');
INSERT INTO public.cat028 (codigo, valor) VALUES ('EX-1.1048.054', 'Exportaci�n Definitiva, Exportaci�n Definitiva Proveniente de Franquicia Definitiva, Atenci�n Ancianos y Convalecientes LSI');
INSERT INTO public.cat028 (codigo, valor) VALUES ('EX-1.1048.055', 'Exportaci�n Definitiva, Exportaci�n Definitiva Proveniente de Franquicia Definitiva, Telemedicina LSI');
INSERT INTO public.cat028 (codigo, valor) VALUES ('EX-1.1048.056', 'Exportaci�n Definitiva, Exportaci�n Definitiva Proveniente de Franquicia Definitiva, Cinematograf�a LSI');
INSERT INTO public.cat028 (codigo, valor) VALUES ('EX-1.1052.000', 'Exportaci�n Definitiva, Exportaci�n Definitiva de DPA con origen en Compras Locales, R�gimen Com�n');
INSERT INTO public.cat028 (codigo, valor) VALUES ('EX-1.1054.000', 'Exportaci�n Definitiva, Exportaci�n Definitiva de Zona Franca con origen en Compras Locales, R�gimen Com�n');
INSERT INTO public.cat028 (codigo, valor) VALUES ('EX-1.1100.000', 'Exportaci�n Definitiva, Exportaci�n Definitiva de Env�os de Socorro, R�gimen Com�n');
INSERT INTO public.cat028 (codigo, valor) VALUES ('EX-1.1200.000', 'Exportaci�n Definitiva, Exportaci�n Definitiva de Env�os Postales, R�gimen Com�n');
INSERT INTO public.cat028 (codigo, valor) VALUES ('EX-1.1300.000', 'Exportaci�n Definitiva, Exportaci�n Definitiva Env�os que requieren despacho urgente, R�gimen Com�n');
INSERT INTO public.cat028 (codigo, valor) VALUES ('EX-1.1400.000', 'Exportaci�n Definitiva, Exportaci�n Definitiva Courier, R�gimen Com�n');
INSERT INTO public.cat028 (codigo, valor) VALUES ('EX-1.1400.011', 'Exportaci�n Definitiva, Exportaci�n Definitiva Courier, Muestras Sin Valor Comercial');
INSERT INTO public.cat028 (codigo, valor) VALUES ('EX-1.1400.012', 'Exportaci�n Definitiva, Exportaci�n Definitiva Courier, Material Publicitario');
INSERT INTO public.cat028 (codigo, valor) VALUES ('EX-1.1400.017', 'Exportaci�n Definitiva, Exportaci�n Definitiva Courier, Declaraci�n de Documentos');
INSERT INTO public.cat028 (codigo, valor) VALUES ('EX-1.1500.000', 'Exportaci�n Definitiva, Exportaci�n Definitiva Menaje de casa, R�gimen Com�n');
INSERT INTO public.cat028 (codigo, valor) VALUES ('EX-2.2100.000', 'Exportaci�n Temporal, Exportaci�n Temporal para Perfeccionamiento Pasivo, R�gimen Com�n');
INSERT INTO public.cat028 (codigo, valor) VALUES ('EX-2.2200.000', 'Exportaci�n Temporal, Exportaci�n Temporal con Reimportaci�n en el mismo estado, R�gimen Com�n');
INSERT INTO public.cat028 (codigo, valor) VALUES ('EX-3.3050.000', 'Re-Exportaci�n, Reexportaci�n Proveniente de Importaci�n Temporal, R�gimen Com�n');
INSERT INTO public.cat028 (codigo, valor) VALUES ('EX-3.3051.000', 'Re-Exportaci�n, Reexportaci�n Proveniente de Tiendas Libres, R�gimen Com�n');
INSERT INTO public.cat028 (codigo, valor) VALUES ('EX-3.3052.000', 'Re-Exportaci�n, Reexportaci�n Proveniente de Admisi�n Temporal para Perfeccionamiento Activo, R�gimen Com�n');
INSERT INTO public.cat028 (codigo, valor) VALUES ('EX-3.3053.000', 'Re-Exportaci�n, Reexportaci�n Proveniente de Admisi�n Temporal, R�gimen Com�n');
INSERT INTO public.cat028 (codigo, valor) VALUES ('EX-3.3054.000', 'Re-Exportaci�n, Reexportaci�n Proveniente de R�gimen de Zona Franca, R�gimen Com�n');
INSERT INTO public.cat028 (codigo, valor) VALUES ('EX-3.3055.000', 'Re-Exportaci�n, Reexportaci�n Proveniente de Admisi�n Temporal para Perfeccionamiento Activo con Garant�a, R�gimen Com�n');
INSERT INTO public.cat028 (codigo, valor) VALUES ('EX-3.3056.000', 'Re-Exportaci�n, Reexportaci�n Proveniente de Admisi�n Temporal Distribuci�n Internacional Parque de Servicios, R�gimen Com�n');
INSERT INTO public.cat028 (codigo, valor) VALUES ('EX-3.3056.057', 'Re-Exportaci�n, Reexportaci�n Proveniente de Admisi�n Temporal Distribuci�n Internacional Parque de Servicios, Remisi�n entre Usuarios Directos del Mismo Parque de Servicios');
INSERT INTO public.cat028 (codigo, valor) VALUES ('EX-3.3056.058', 'Re-Exportaci�n, Reexportaci�n Proveniente de Admisi�n Temporal Distribuci�n Internacional Parque de Servicios, Remisi�n entre Usuarios Directos de Diferente Parque de Servicios');
INSERT INTO public.cat028 (codigo, valor) VALUES ('EX-3.3056.072', 'Re-Exportaci�n, Reexportaci�n Proveniente de Admisi�n Temporal Distribuci�n Internacional Parque de Servicios, Decreto 738 El�ctricos e H�bridos');
INSERT INTO public.cat028 (codigo, valor) VALUES ('EX-3.3057.000', 'Re-Exportaci�n, Reexportaci�n Proveniente de Admisi�n Temporal Operaciones Internacional de Log�stica Parque de Servicios, R�gimen Com�n');
INSERT INTO public.cat028 (codigo, valor) VALUES ('EX-3.3057.057', 'Re-Exportaci�n, Reexportaci�n Proveniente de Admisi�n Temporal Operaciones Internacional de Log�stica Parque de Servicios, Remisi�n entre Usuarios Directos del Mismo Parque de Servicios');
INSERT INTO public.cat028 (codigo, valor) VALUES ('EX-3.3057.058', 'Re-Exportaci�n, Reexportaci�n Proveniente de Admisi�n Temporal Operaciones Internacional de Log�stica Parque de Servicios, Remisi�n entre Usuarios Directos de Diferente Parque de Servicios');
INSERT INTO public.cat028 (codigo, valor) VALUES ('EX-3.3058.033', 'Re-Exportaci�n, Reexportaci�n Proveniente de Admisi�n Temporal Centro Servicio LSI, Centro Internacional de llamadas (Call Center)');
INSERT INTO public.cat028 (codigo, valor) VALUES ('EX-3.3058.036', 'Re-Exportaci�n, Reexportaci�n Proveniente de Admisi�n Temporal Centro Servicio LSI, Reparaci�n y Mantenimiento de Embarcaciones Mar�timas LSI');
INSERT INTO public.cat028 (codigo, valor) VALUES ('EX-3.3058.037', 'Re-Exportaci�n, Reexportaci�n Proveniente de Admisi�n Temporal Centro Servicio LSI, Reparaci�n y Mantenimiento de Aeronaves LSI');
INSERT INTO public.cat028 (codigo, valor) VALUES ('EX-3.3058.043', 'Re-Exportaci�n, Reexportaci�n Proveniente de Admisi�n Temporal Centro Servicio LSI, Reparaci�n y Mantenimiento de Contenedores LSI');
INSERT INTO public.cat028 (codigo, valor) VALUES ('EX-3.3059.000', 'Re-Exportaci�n, Reexportaci�n Proveniente de Admisi�n Temporal Reparaci�n de Equipo Tecnol�gico Parque de Servicios, R�gimen Com�n');
INSERT INTO public.cat028 (codigo, valor) VALUES ('EX-3.3059.057', 'Re-Exportaci�n, Reexportaci�n Proveniente de Admisi�n Temporal Reparaci�n de Equipo Tecnol�gico Parque de Servicios, Remisi�n entre Usuarios Directos del Mismo Parque de Servicios');
INSERT INTO public.cat028 (codigo, valor) VALUES ('EX-3.3059.058', 'Re-Exportaci�n, Reexportaci�n Proveniente de Admisi�n Temporal Reparaci�n de Equipo Tecnol�gico Parque de Servicios, Remisi�n entre Usuarios Directos de Diferente Parque de Servicios');
INSERT INTO public.cat028 (codigo, valor) VALUES ('EX-3.3070.000', 'Re-Exportaci�n, Reexportaci�n Proveniente de Dep�sito., R�gimen Com�n');
INSERT INTO public.cat028 (codigo, valor) VALUES ('EX-3.3070.072', 'Re-Exportaci�n, Reexportaci�n Proveniente de Dep�sito., Decreto 738 El�ctricos e H�bridos');


--
-- Data for Name: cat029; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

INSERT INTO public.cat029 (codigo, valor) VALUES (1, 'Persona Natural');
INSERT INTO public.cat029 (codigo, valor) VALUES (2, 'Persona Juridica');


--
-- Data for Name: cat030; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

INSERT INTO public.cat030 (codigo, valor) VALUES (1, 'Terrestre');
INSERT INTO public.cat030 (codigo, valor) VALUES (2, 'Mar�timo');
INSERT INTO public.cat030 (codigo, valor) VALUES (3, 'A�reo');
INSERT INTO public.cat030 (codigo, valor) VALUES (4, 'Multimodal, Terrestre-mar�timo');
INSERT INTO public.cat030 (codigo, valor) VALUES (5, 'Multimodal, Terrestre-a�reo');
INSERT INTO public.cat030 (codigo, valor) VALUES (6, 'Multimodal, Mar�timo- a�reo');
INSERT INTO public.cat030 (codigo, valor) VALUES (7, 'Multimodal, Terrestre-Mar�timo- a�reo');


--
-- Data for Name: cat031; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

INSERT INTO public.cat031 (codigo, valor) VALUES ('01', 'EXW-En fabrica');
INSERT INTO public.cat031 (codigo, valor) VALUES ('02', 'FCA-Libre transportista');
INSERT INTO public.cat031 (codigo, valor) VALUES ('03', 'CPT-Transporte pagado hasta');
INSERT INTO public.cat031 (codigo, valor) VALUES ('04', 'CIP-Transporte y seguro pagado hasta');
INSERT INTO public.cat031 (codigo, valor) VALUES ('05', 'DAP-Entrega en el lugar');
INSERT INTO public.cat031 (codigo, valor) VALUES ('06', 'DPU-Entregado en el lugar descargado');
INSERT INTO public.cat031 (codigo, valor) VALUES ('07', 'DDP-Entrega con impuestos pagados');
INSERT INTO public.cat031 (codigo, valor) VALUES ('08', 'FAS-Libre al costado del buque');
INSERT INTO public.cat031 (codigo, valor) VALUES ('09', 'FOB-Libre a bordo');
INSERT INTO public.cat031 (codigo, valor) VALUES ('10', 'CFR-Costo y flete');
INSERT INTO public.cat031 (codigo, valor) VALUES ('11', 'CIF- Costo seguro y flete');
INSERT INTO public.cat031 (codigo, valor) VALUES ('12', 'CIF- Costo seguro y flete');
INSERT INTO public.cat031 (codigo, valor) VALUES ('13', 'DAF-Entregada en frontera');
INSERT INTO public.cat031 (codigo, valor) VALUES ('14', 'DES-Entregada sobre duque \n');
INSERT INTO public.cat031 (codigo, valor) VALUES ('15', 'DEQ-Entregada en muelle');
INSERT INTO public.cat031 (codigo, valor) VALUES ('16', 'DDU- Entregada derechos no pagados');


--
-- Data for Name: Cuerpodocumento; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

INSERT INTO public.Cuerpodocumento (identificador, "numeroControl", "codigoGeneracion", item, "tipoItem", "tipoDonacion", depreciacion, "tipDTRelacionado", "tipGenDoc", "numDocRelacionado", "fechaGendoc", cantidad, codigo, areafact, "codTributo", "unidadMedida", descripcion, "precioUnitario", "valorUnitario", descuentos, "ventasNSujetas", "ventasExentas", "ventasGravadas", exportaciones, "valorDonado", ventas, "codigoTributo", "precSugVenta", "CargosAbono", "ivaItem", montoretencion, "codRetencion", "ivaRetenido", "fechaIni", "fechaFin", "codLiquidacion", "canDocumentos", "valorOpLiq", "valNoPercepcion", "descNoPercepcion", "observacionesItem", "observacionesItems", subtotal, "ivaOpLiq", "montoSinIva", "ivaPercibido", comision, "porcComision", "IvaComision", "ValorLiqPagar", "valorLetras", "sacosEsp") VALUES (27, 'DTE-03-CMPV0202-000000000003973', '6438505D-BE64-46CC-A7A7-120DDC80B6FF', '1', '3', '', '', NULL, NULL, '', NULL, '200', '1372', 'IT', '', '59', 'Azucar 1/2 Kilo', '0.50', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0.508407', '20', '0.508407', '0.00', '13.22', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.Cuerpodocumento (identificador, "numeroControl", "codigoGeneracion", item, "tipoItem", "tipoDonacion", depreciacion, "tipDTRelacionado", "tipGenDoc", "numDocRelacionado", "fechaGendoc", cantidad, codigo, areafact, "codTributo", "unidadMedida", descripcion, "precioUnitario", "valorUnitario", descuentos, "ventasNSujetas", "ventasExentas", "ventasGravadas", exportaciones, "valorDonado", ventas, "codigoTributo", "precSugVenta", "CargosAbono", "ivaItem", montoretencion, "codRetencion", "ivaRetenido", "fechaIni", "fechaFin", "codLiquidacion", "canDocumentos", "valorOpLiq", "valNoPercepcion", "descNoPercepcion", "observacionesItem", "observacionesItems", subtotal, "ivaOpLiq", "montoSinIva", "ivaPercibido", comision, "porcComision", "IvaComision", "ValorLiqPagar", "valorLetras", "sacosEsp") VALUES (28, 'DTE-03-CMPV0202-000000000003973', '6438505D-BE64-46CC-A7A7-120DDC80B6FF', '1', '3', '', '', NULL, NULL, '', NULL, '40', '1390', 'IT', '', '59', 'Azucar 2.5 Kilos', '2.48', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '2.488496', '20', '2.488496', '0.00', '12.94', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.Cuerpodocumento (identificador, "numeroControl", "codigoGeneracion", item, "tipoItem", "tipoDonacion", depreciacion, "tipDTRelacionado", "tipGenDoc", "numDocRelacionado", "fechaGendoc", cantidad, codigo, areafact, "codTributo", "unidadMedida", descripcion, "precioUnitario", "valorUnitario", descuentos, "ventasNSujetas", "ventasExentas", "ventasGravadas", exportaciones, "valorDonado", ventas, "codigoTributo", "precSugVenta", "CargosAbono", "ivaItem", montoretencion, "codRetencion", "ivaRetenido", "fechaIni", "fechaFin", "codLiquidacion", "canDocumentos", "valorOpLiq", "valNoPercepcion", "descNoPercepcion", "observacionesItem", "observacionesItems", subtotal, "ivaOpLiq", "montoSinIva", "ivaPercibido", comision, "porcComision", "IvaComision", "ValorLiqPagar", "valorLetras", "sacosEsp") VALUES (29, 'DTE-03-CMPV0202-000000000003974', 'C6D0A5BA-29A2-4A46-B17B-624E8A2EABB3', '1', '3', '', '', NULL, NULL, '', NULL, '200', '1372', 'IT', '', '59', 'Azucar 1/2 Kilo', '0.50', '', '0.00', '0.00', '0.00', '100', '0.00', '0.00', '0.508407', '20', '0.508407', '0.00', '13.22', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.Cuerpodocumento (identificador, "numeroControl", "codigoGeneracion", item, "tipoItem", "tipoDonacion", depreciacion, "tipDTRelacionado", "tipGenDoc", "numDocRelacionado", "fechaGendoc", cantidad, codigo, areafact, "codTributo", "unidadMedida", descripcion, "precioUnitario", "valorUnitario", descuentos, "ventasNSujetas", "ventasExentas", "ventasGravadas", exportaciones, "valorDonado", ventas, "codigoTributo", "precSugVenta", "CargosAbono", "ivaItem", montoretencion, "codRetencion", "ivaRetenido", "fechaIni", "fechaFin", "codLiquidacion", "canDocumentos", "valorOpLiq", "valNoPercepcion", "descNoPercepcion", "observacionesItem", "observacionesItems", subtotal, "ivaOpLiq", "montoSinIva", "ivaPercibido", comision, "porcComision", "IvaComision", "ValorLiqPagar", "valorLetras", "sacosEsp") VALUES (30, 'DTE-03-CMPV0202-000000000003974', 'C6D0A5BA-29A2-4A46-B17B-624E8A2EABB3', '1', '3', '', '', NULL, NULL, '', NULL, '40', '1390', 'IT', '', '59', 'Azucar 2.5 Kilos', '2.48', '', '0.00', '0.00', '0.00', '199.2', '0.00', '0.00', '2.488496', '20', '2.488496', '0.00', '12.94', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.Cuerpodocumento (identificador, "numeroControl", "codigoGeneracion", item, "tipoItem", "tipoDonacion", depreciacion, "tipDTRelacionado", "tipGenDoc", "numDocRelacionado", "fechaGendoc", cantidad, codigo, areafact, "codTributo", "unidadMedida", descripcion, "precioUnitario", "valorUnitario", descuentos, "ventasNSujetas", "ventasExentas", "ventasGravadas", exportaciones, "valorDonado", ventas, "codigoTributo", "precSugVenta", "CargosAbono", "ivaItem", montoretencion, "codRetencion", "ivaRetenido", "fechaIni", "fechaFin", "codLiquidacion", "canDocumentos", "valorOpLiq", "valNoPercepcion", "descNoPercepcion", "observacionesItem", "observacionesItems", subtotal, "ivaOpLiq", "montoSinIva", "ivaPercibido", comision, "porcComision", "IvaComision", "ValorLiqPagar", "valorLetras", "sacosEsp") VALUES (31, 'DTE-03-CMPV0202-000000000003975', '7AEE2981-DB26-400B-A33C-755C42E06986', '1', '3', '', '', NULL, NULL, '', NULL, '200', '1372', 'IT', '', '59', 'Azucar 1/2 Kilo', '0.50', '', '0.00', '0.00', '0.00', '100', '0.00', '0.00', '0.508407', '20', '0.508407', '0.00', '13.22', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.Cuerpodocumento (identificador, "numeroControl", "codigoGeneracion", item, "tipoItem", "tipoDonacion", depreciacion, "tipDTRelacionado", "tipGenDoc", "numDocRelacionado", "fechaGendoc", cantidad, codigo, areafact, "codTributo", "unidadMedida", descripcion, "precioUnitario", "valorUnitario", descuentos, "ventasNSujetas", "ventasExentas", "ventasGravadas", exportaciones, "valorDonado", ventas, "codigoTributo", "precSugVenta", "CargosAbono", "ivaItem", montoretencion, "codRetencion", "ivaRetenido", "fechaIni", "fechaFin", "codLiquidacion", "canDocumentos", "valorOpLiq", "valNoPercepcion", "descNoPercepcion", "observacionesItem", "observacionesItems", subtotal, "ivaOpLiq", "montoSinIva", "ivaPercibido", comision, "porcComision", "IvaComision", "ValorLiqPagar", "valorLetras", "sacosEsp") VALUES (32, 'DTE-03-CMPV0202-000000000003975', '7AEE2981-DB26-400B-A33C-755C42E06986', '1', '3', '', '', NULL, NULL, '', NULL, '40', '1390', 'IT', '', '59', 'Azucar 2.5 Kilos', '2.48', '', '0.00', '0.00', '0.00', '199.2', '0.00', '0.00', '2.488496', '20', '2.488496', '0.00', '12.94', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.Cuerpodocumento (identificador, "numeroControl", "codigoGeneracion", item, "tipoItem", "tipoDonacion", depreciacion, "tipDTRelacionado", "tipGenDoc", "numDocRelacionado", "fechaGendoc", cantidad, codigo, areafact, "codTributo", "unidadMedida", descripcion, "precioUnitario", "valorUnitario", descuentos, "ventasNSujetas", "ventasExentas", "ventasGravadas", exportaciones, "valorDonado", ventas, "codigoTributo", "precSugVenta", "CargosAbono", "ivaItem", montoretencion, "codRetencion", "ivaRetenido", "fechaIni", "fechaFin", "codLiquidacion", "canDocumentos", "valorOpLiq", "valNoPercepcion", "descNoPercepcion", "observacionesItem", "observacionesItems", subtotal, "ivaOpLiq", "montoSinIva", "ivaPercibido", comision, "porcComision", "IvaComision", "ValorLiqPagar", "valorLetras", "sacosEsp") VALUES (33, 'DTE-03-CMPV0202-000000000003976', '94410371-3B92-46DC-8D4B-5552A0F05122', '1', '3', '', '', NULL, NULL, '', NULL, '200', '1372', 'IT', '', '59', 'Azucar 1/2 Kilo', '0.50', '', '0.00', '0.00', '0.00', '100', '0.00', '0.00', '0.508407', '20', '0.508407', '0.00', '13.22', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.Cuerpodocumento (identificador, "numeroControl", "codigoGeneracion", item, "tipoItem", "tipoDonacion", depreciacion, "tipDTRelacionado", "tipGenDoc", "numDocRelacionado", "fechaGendoc", cantidad, codigo, areafact, "codTributo", "unidadMedida", descripcion, "precioUnitario", "valorUnitario", descuentos, "ventasNSujetas", "ventasExentas", "ventasGravadas", exportaciones, "valorDonado", ventas, "codigoTributo", "precSugVenta", "CargosAbono", "ivaItem", montoretencion, "codRetencion", "ivaRetenido", "fechaIni", "fechaFin", "codLiquidacion", "canDocumentos", "valorOpLiq", "valNoPercepcion", "descNoPercepcion", "observacionesItem", "observacionesItems", subtotal, "ivaOpLiq", "montoSinIva", "ivaPercibido", comision, "porcComision", "IvaComision", "ValorLiqPagar", "valorLetras", "sacosEsp") VALUES (34, 'DTE-03-CMPV0202-000000000003976', '94410371-3B92-46DC-8D4B-5552A0F05122', '1', '3', '', '', NULL, NULL, '', NULL, '40', '1390', 'IT', '', '59', 'Azucar 2.5 Kilos', '2.48', '', '0.00', '0.00', '0.00', '199.2', '0.00', '0.00', '2.488496', '20', '2.488496', '0.00', '12.94', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.Cuerpodocumento (identificador, "numeroControl", "codigoGeneracion", item, "tipoItem", "tipoDonacion", depreciacion, "tipDTRelacionado", "tipGenDoc", "numDocRelacionado", "fechaGendoc", cantidad, codigo, areafact, "codTributo", "unidadMedida", descripcion, "precioUnitario", "valorUnitario", descuentos, "ventasNSujetas", "ventasExentas", "ventasGravadas", exportaciones, "valorDonado", ventas, "codigoTributo", "precSugVenta", "CargosAbono", "ivaItem", montoretencion, "codRetencion", "ivaRetenido", "fechaIni", "fechaFin", "codLiquidacion", "canDocumentos", "valorOpLiq", "valNoPercepcion", "descNoPercepcion", "observacionesItem", "observacionesItems", subtotal, "ivaOpLiq", "montoSinIva", "ivaPercibido", comision, "porcComision", "IvaComision", "ValorLiqPagar", "valorLetras", "sacosEsp") VALUES (35, 'DTE-03-CMPV0202-000000000003977', 'DE59BC3A-3473-4994-91E6-F11DDB9746D1', '1', '3', '', '', NULL, NULL, '', NULL, '200', '1372', 'IT', '', '59', 'Azucar 1/2 Kilo', '0.50', '', '0.00', '0.00', '0.00', '100', '0.00', '0.00', '0.508407', '20', '0.508407', '0.00', '13.22', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.Cuerpodocumento (identificador, "numeroControl", "codigoGeneracion", item, "tipoItem", "tipoDonacion", depreciacion, "tipDTRelacionado", "tipGenDoc", "numDocRelacionado", "fechaGendoc", cantidad, codigo, areafact, "codTributo", "unidadMedida", descripcion, "precioUnitario", "valorUnitario", descuentos, "ventasNSujetas", "ventasExentas", "ventasGravadas", exportaciones, "valorDonado", ventas, "codigoTributo", "precSugVenta", "CargosAbono", "ivaItem", montoretencion, "codRetencion", "ivaRetenido", "fechaIni", "fechaFin", "codLiquidacion", "canDocumentos", "valorOpLiq", "valNoPercepcion", "descNoPercepcion", "observacionesItem", "observacionesItems", subtotal, "ivaOpLiq", "montoSinIva", "ivaPercibido", comision, "porcComision", "IvaComision", "ValorLiqPagar", "valorLetras", "sacosEsp") VALUES (36, 'DTE-03-CMPV0202-000000000003977', 'DE59BC3A-3473-4994-91E6-F11DDB9746D1', '1', '3', '', '', NULL, NULL, '', NULL, '40', '1390', 'IT', '', '59', 'Azucar 2.5 Kilos', '2.48', '', '0.00', '0.00', '0.00', '199.2', '0.00', '0.00', '2.488496', '20', '2.488496', '0.00', '12.94', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.Cuerpodocumento (identificador, "numeroControl", "codigoGeneracion", item, "tipoItem", "tipoDonacion", depreciacion, "tipDTRelacionado", "tipGenDoc", "numDocRelacionado", "fechaGendoc", cantidad, codigo, areafact, "codTributo", "unidadMedida", descripcion, "precioUnitario", "valorUnitario", descuentos, "ventasNSujetas", "ventasExentas", "ventasGravadas", exportaciones, "valorDonado", ventas, "codigoTributo", "precSugVenta", "CargosAbono", "ivaItem", montoretencion, "codRetencion", "ivaRetenido", "fechaIni", "fechaFin", "codLiquidacion", "canDocumentos", "valorOpLiq", "valNoPercepcion", "descNoPercepcion", "observacionesItem", "observacionesItems", subtotal, "ivaOpLiq", "montoSinIva", "ivaPercibido", comision, "porcComision", "IvaComision", "ValorLiqPagar", "valorLetras", "sacosEsp") VALUES (37, 'DTE-03-CMPV0202-000000000003978', 'F41EC2AA-75DB-4063-BF3F-96BF20A9F0FE', '1', '3', '', '', NULL, NULL, '', NULL, '200', '1372', 'IT', '', '59', 'Azucar 1/2 Kilo', '0.50', '', '0.00', '0.00', '0.00', '100', '0.00', '0.00', '0.508407', '20', '0.508407', '0.00', '13.22', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.Cuerpodocumento (identificador, "numeroControl", "codigoGeneracion", item, "tipoItem", "tipoDonacion", depreciacion, "tipDTRelacionado", "tipGenDoc", "numDocRelacionado", "fechaGendoc", cantidad, codigo, areafact, "codTributo", "unidadMedida", descripcion, "precioUnitario", "valorUnitario", descuentos, "ventasNSujetas", "ventasExentas", "ventasGravadas", exportaciones, "valorDonado", ventas, "codigoTributo", "precSugVenta", "CargosAbono", "ivaItem", montoretencion, "codRetencion", "ivaRetenido", "fechaIni", "fechaFin", "codLiquidacion", "canDocumentos", "valorOpLiq", "valNoPercepcion", "descNoPercepcion", "observacionesItem", "observacionesItems", subtotal, "ivaOpLiq", "montoSinIva", "ivaPercibido", comision, "porcComision", "IvaComision", "ValorLiqPagar", "valorLetras", "sacosEsp") VALUES (38, 'DTE-03-CMPV0202-000000000003978', 'F41EC2AA-75DB-4063-BF3F-96BF20A9F0FE', '1', '3', '', '', NULL, NULL, '', NULL, '40', '1390', 'IT', '', '59', 'Azucar 2.5 Kilos', '2.48', '', '0.00', '0.00', '0.00', '199.2', '0.00', '0.00', '2.488496', '20', '2.488496', '0.00', '12.94', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.Cuerpodocumento (identificador, "numeroControl", "codigoGeneracion", item, "tipoItem", "tipoDonacion", depreciacion, "tipDTRelacionado", "tipGenDoc", "numDocRelacionado", "fechaGendoc", cantidad, codigo, areafact, "codTributo", "unidadMedida", descripcion, "precioUnitario", "valorUnitario", descuentos, "ventasNSujetas", "ventasExentas", "ventasGravadas", exportaciones, "valorDonado", ventas, "codigoTributo", "precSugVenta", "CargosAbono", "ivaItem", montoretencion, "codRetencion", "ivaRetenido", "fechaIni", "fechaFin", "codLiquidacion", "canDocumentos", "valorOpLiq", "valNoPercepcion", "descNoPercepcion", "observacionesItem", "observacionesItems", subtotal, "ivaOpLiq", "montoSinIva", "ivaPercibido", comision, "porcComision", "IvaComision", "ValorLiqPagar", "valorLetras", "sacosEsp") VALUES (39, 'DTE-03-CMPV0202-000000000003979', 'D5A3E5D4-7ED8-495D-B3CF-569D8BA38F57', '1', '3', '', '', NULL, NULL, '', NULL, '200', '1372', 'IT', '', '59', 'Azucar 1/2 Kilo', '0.50', '', '0.00', '0.00', '0.00', '100', '0.00', '0.00', '0.508407', '20', '0.508407', '0.00', '13.22', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.Cuerpodocumento (identificador, "numeroControl", "codigoGeneracion", item, "tipoItem", "tipoDonacion", depreciacion, "tipDTRelacionado", "tipGenDoc", "numDocRelacionado", "fechaGendoc", cantidad, codigo, areafact, "codTributo", "unidadMedida", descripcion, "precioUnitario", "valorUnitario", descuentos, "ventasNSujetas", "ventasExentas", "ventasGravadas", exportaciones, "valorDonado", ventas, "codigoTributo", "precSugVenta", "CargosAbono", "ivaItem", montoretencion, "codRetencion", "ivaRetenido", "fechaIni", "fechaFin", "codLiquidacion", "canDocumentos", "valorOpLiq", "valNoPercepcion", "descNoPercepcion", "observacionesItem", "observacionesItems", subtotal, "ivaOpLiq", "montoSinIva", "ivaPercibido", comision, "porcComision", "IvaComision", "ValorLiqPagar", "valorLetras", "sacosEsp") VALUES (40, 'DTE-03-CMPV0202-000000000003979', 'D5A3E5D4-7ED8-495D-B3CF-569D8BA38F57', '1', '3', '', '', NULL, NULL, '', NULL, '40', '1390', 'IT', '', '59', 'Azucar 2.5 Kilos', '2.48', '', '0.00', '0.00', '0.00', '199.2', '0.00', '0.00', '2.488496', '20', '2.488496', '0.00', '12.94', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.Cuerpodocumento (identificador, "numeroControl", "codigoGeneracion", item, "tipoItem", "tipoDonacion", depreciacion, "tipDTRelacionado", "tipGenDoc", "numDocRelacionado", "fechaGendoc", cantidad, codigo, areafact, "codTributo", "unidadMedida", descripcion, "precioUnitario", "valorUnitario", descuentos, "ventasNSujetas", "ventasExentas", "ventasGravadas", exportaciones, "valorDonado", ventas, "codigoTributo", "precSugVenta", "CargosAbono", "ivaItem", montoretencion, "codRetencion", "ivaRetenido", "fechaIni", "fechaFin", "codLiquidacion", "canDocumentos", "valorOpLiq", "valNoPercepcion", "descNoPercepcion", "observacionesItem", "observacionesItems", subtotal, "ivaOpLiq", "montoSinIva", "ivaPercibido", comision, "porcComision", "IvaComision", "ValorLiqPagar", "valorLetras", "sacosEsp") VALUES (41, 'DTE-03-CMPV0202-000000000003980', '8EB51F9E-662A-44F2-B5FA-0A0ECB940995', '1', '3', '', '', NULL, NULL, '', NULL, '200', '1372', 'IT', '', '59', 'Azucar 1/2 Kilo', '0.50', '', '0.00', '0.00', '0.00', '100', '0.00', '0.00', '0.508407', '20', '0.508407', '0.00', '13.22', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.Cuerpodocumento (identificador, "numeroControl", "codigoGeneracion", item, "tipoItem", "tipoDonacion", depreciacion, "tipDTRelacionado", "tipGenDoc", "numDocRelacionado", "fechaGendoc", cantidad, codigo, areafact, "codTributo", "unidadMedida", descripcion, "precioUnitario", "valorUnitario", descuentos, "ventasNSujetas", "ventasExentas", "ventasGravadas", exportaciones, "valorDonado", ventas, "codigoTributo", "precSugVenta", "CargosAbono", "ivaItem", montoretencion, "codRetencion", "ivaRetenido", "fechaIni", "fechaFin", "codLiquidacion", "canDocumentos", "valorOpLiq", "valNoPercepcion", "descNoPercepcion", "observacionesItem", "observacionesItems", subtotal, "ivaOpLiq", "montoSinIva", "ivaPercibido", comision, "porcComision", "IvaComision", "ValorLiqPagar", "valorLetras", "sacosEsp") VALUES (42, 'DTE-03-CMPV0202-000000000003980', '8EB51F9E-662A-44F2-B5FA-0A0ECB940995', '1', '3', '', '', NULL, NULL, '', NULL, '40', '1390', 'IT', '', '59', 'Azucar 2.5 Kilos', '2.48', '', '0.00', '0.00', '0.00', '199.2', '0.00', '0.00', '2.488496', '20', '2.488496', '0.00', '12.94', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.Cuerpodocumento (identificador, "numeroControl", "codigoGeneracion", item, "tipoItem", "tipoDonacion", depreciacion, "tipDTRelacionado", "tipGenDoc", "numDocRelacionado", "fechaGendoc", cantidad, codigo, areafact, "codTributo", "unidadMedida", descripcion, "precioUnitario", "valorUnitario", descuentos, "ventasNSujetas", "ventasExentas", "ventasGravadas", exportaciones, "valorDonado", ventas, "codigoTributo", "precSugVenta", "CargosAbono", "ivaItem", montoretencion, "codRetencion", "ivaRetenido", "fechaIni", "fechaFin", "codLiquidacion", "canDocumentos", "valorOpLiq", "valNoPercepcion", "descNoPercepcion", "observacionesItem", "observacionesItems", subtotal, "ivaOpLiq", "montoSinIva", "ivaPercibido", comision, "porcComision", "IvaComision", "ValorLiqPagar", "valorLetras", "sacosEsp") VALUES (43, 'DTE-03-CMPV0202-000000000003981', 'DD7277CF-28FA-4F15-881F-BF757119E122', '0', '3', '', '', NULL, NULL, '', NULL, '200', '1372', 'IT', '', '59', 'Azucar 1/2 Kilo', '0.50', '', '0.00', '0.00', '0.00', '100', '0.00', '0.00', '0.508407', '20', '0.508407', '0.00', '13.22', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.Cuerpodocumento (identificador, "numeroControl", "codigoGeneracion", item, "tipoItem", "tipoDonacion", depreciacion, "tipDTRelacionado", "tipGenDoc", "numDocRelacionado", "fechaGendoc", cantidad, codigo, areafact, "codTributo", "unidadMedida", descripcion, "precioUnitario", "valorUnitario", descuentos, "ventasNSujetas", "ventasExentas", "ventasGravadas", exportaciones, "valorDonado", ventas, "codigoTributo", "precSugVenta", "CargosAbono", "ivaItem", montoretencion, "codRetencion", "ivaRetenido", "fechaIni", "fechaFin", "codLiquidacion", "canDocumentos", "valorOpLiq", "valNoPercepcion", "descNoPercepcion", "observacionesItem", "observacionesItems", subtotal, "ivaOpLiq", "montoSinIva", "ivaPercibido", comision, "porcComision", "IvaComision", "ValorLiqPagar", "valorLetras", "sacosEsp") VALUES (44, 'DTE-03-CMPV0202-000000000003981', 'DD7277CF-28FA-4F15-881F-BF757119E122', '1', '3', '', '', NULL, NULL, '', NULL, '40', '1390', 'IT', '', '59', 'Azucar 2.5 Kilos', '2.48', '', '0.00', '0.00', '0.00', '199.2', '0.00', '0.00', '2.488496', '20', '2.488496', '0.00', '12.94', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.Cuerpodocumento (identificador, "numeroControl", "codigoGeneracion", item, "tipoItem", "tipoDonacion", depreciacion, "tipDTRelacionado", "tipGenDoc", "numDocRelacionado", "fechaGendoc", cantidad, codigo, areafact, "codTributo", "unidadMedida", descripcion, "precioUnitario", "valorUnitario", descuentos, "ventasNSujetas", "ventasExentas", "ventasGravadas", exportaciones, "valorDonado", ventas, "codigoTributo", "precSugVenta", "CargosAbono", "ivaItem", montoretencion, "codRetencion", "ivaRetenido", "fechaIni", "fechaFin", "codLiquidacion", "canDocumentos", "valorOpLiq", "valNoPercepcion", "descNoPercepcion", "observacionesItem", "observacionesItems", subtotal, "ivaOpLiq", "montoSinIva", "ivaPercibido", comision, "porcComision", "IvaComision", "ValorLiqPagar", "valorLetras", "sacosEsp") VALUES (45, 'DTE-03-CMPV0202-000000000003982', '17BCBD36-49C2-4CA0-A4A7-69A3C79E3AF5', '1', '3', '', '', NULL, NULL, '', NULL, '200', '1372', 'IT', '', '59', 'Azucar 1/2 Kilo', '0.50', '', '0.00', '0.00', '0.00', '100', '0.00', '0.00', '0.508407', '20', '0.508407', '0.00', '13.22', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.Cuerpodocumento (identificador, "numeroControl", "codigoGeneracion", item, "tipoItem", "tipoDonacion", depreciacion, "tipDTRelacionado", "tipGenDoc", "numDocRelacionado", "fechaGendoc", cantidad, codigo, areafact, "codTributo", "unidadMedida", descripcion, "precioUnitario", "valorUnitario", descuentos, "ventasNSujetas", "ventasExentas", "ventasGravadas", exportaciones, "valorDonado", ventas, "codigoTributo", "precSugVenta", "CargosAbono", "ivaItem", montoretencion, "codRetencion", "ivaRetenido", "fechaIni", "fechaFin", "codLiquidacion", "canDocumentos", "valorOpLiq", "valNoPercepcion", "descNoPercepcion", "observacionesItem", "observacionesItems", subtotal, "ivaOpLiq", "montoSinIva", "ivaPercibido", comision, "porcComision", "IvaComision", "ValorLiqPagar", "valorLetras", "sacosEsp") VALUES (46, 'DTE-03-CMPV0202-000000000003982', '17BCBD36-49C2-4CA0-A4A7-69A3C79E3AF5', '1', '3', '', '', NULL, NULL, '', NULL, '40', '1390', 'IT', '', '59', 'Azucar 2.5 Kilos', '2.48', '', '0.00', '0.00', '0.00', '199.2', '0.00', '0.00', '2.488496', '20', '2.488496', '0.00', '12.94', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.Cuerpodocumento (identificador, "numeroControl", "codigoGeneracion", item, "tipoItem", "tipoDonacion", depreciacion, "tipDTRelacionado", "tipGenDoc", "numDocRelacionado", "fechaGendoc", cantidad, codigo, areafact, "codTributo", "unidadMedida", descripcion, "precioUnitario", "valorUnitario", descuentos, "ventasNSujetas", "ventasExentas", "ventasGravadas", exportaciones, "valorDonado", ventas, "codigoTributo", "precSugVenta", "CargosAbono", "ivaItem", montoretencion, "codRetencion", "ivaRetenido", "fechaIni", "fechaFin", "codLiquidacion", "canDocumentos", "valorOpLiq", "valNoPercepcion", "descNoPercepcion", "observacionesItem", "observacionesItems", subtotal, "ivaOpLiq", "montoSinIva", "ivaPercibido", comision, "porcComision", "IvaComision", "ValorLiqPagar", "valorLetras", "sacosEsp") VALUES (47, 'DTE-03-CMPV0202-000000000003983', '2D6B3A42-6375-4BB1-8162-65AB0DBCC585', '1', '3', '', '', NULL, NULL, '', NULL, '200', '1372', 'IT', '', '59', 'Azucar 1/2 Kilo', '0.50', '', '0.00', '0.00', '0.00', '100', '0.00', '0.00', '0.508407', '20', '0.508407', '0.00', '13.22', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.Cuerpodocumento (identificador, "numeroControl", "codigoGeneracion", item, "tipoItem", "tipoDonacion", depreciacion, "tipDTRelacionado", "tipGenDoc", "numDocRelacionado", "fechaGendoc", cantidad, codigo, areafact, "codTributo", "unidadMedida", descripcion, "precioUnitario", "valorUnitario", descuentos, "ventasNSujetas", "ventasExentas", "ventasGravadas", exportaciones, "valorDonado", ventas, "codigoTributo", "precSugVenta", "CargosAbono", "ivaItem", montoretencion, "codRetencion", "ivaRetenido", "fechaIni", "fechaFin", "codLiquidacion", "canDocumentos", "valorOpLiq", "valNoPercepcion", "descNoPercepcion", "observacionesItem", "observacionesItems", subtotal, "ivaOpLiq", "montoSinIva", "ivaPercibido", comision, "porcComision", "IvaComision", "ValorLiqPagar", "valorLetras", "sacosEsp") VALUES (48, 'DTE-03-CMPV0202-000000000003983', '2D6B3A42-6375-4BB1-8162-65AB0DBCC585', '2', '3', '', '', NULL, NULL, '', NULL, '40', '1390', 'IT', '', '59', 'Azucar 2.5 Kilos', '2.48', '', '0.00', '0.00', '0.00', '199.2', '0.00', '0.00', '2.488496', '20', '2.488496', '0.00', '12.94', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.Cuerpodocumento (identificador, "numeroControl", "codigoGeneracion", item, "tipoItem", "tipoDonacion", depreciacion, "tipDTRelacionado", "tipGenDoc", "numDocRelacionado", "fechaGendoc", cantidad, codigo, areafact, "codTributo", "unidadMedida", descripcion, "precioUnitario", "valorUnitario", descuentos, "ventasNSujetas", "ventasExentas", "ventasGravadas", exportaciones, "valorDonado", ventas, "codigoTributo", "precSugVenta", "CargosAbono", "ivaItem", montoretencion, "codRetencion", "ivaRetenido", "fechaIni", "fechaFin", "codLiquidacion", "canDocumentos", "valorOpLiq", "valNoPercepcion", "descNoPercepcion", "observacionesItem", "observacionesItems", subtotal, "ivaOpLiq", "montoSinIva", "ivaPercibido", comision, "porcComision", "IvaComision", "ValorLiqPagar", "valorLetras", "sacosEsp") VALUES (49, 'DTE-03-CMPV0202-000000000003984', '564B591C-2DA3-4204-A595-D9A740883E11', '1', '3', '', '', NULL, NULL, '', NULL, '200', '1372', 'IT', '', '59', 'Azucar 1/2 Kilo', '0.50', '', '0.00', '0.00', '0.00', '100', '0.00', '0.00', '0.508407', '20', '0.508407', '0.00', '13.22', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.Cuerpodocumento (identificador, "numeroControl", "codigoGeneracion", item, "tipoItem", "tipoDonacion", depreciacion, "tipDTRelacionado", "tipGenDoc", "numDocRelacionado", "fechaGendoc", cantidad, codigo, areafact, "codTributo", "unidadMedida", descripcion, "precioUnitario", "valorUnitario", descuentos, "ventasNSujetas", "ventasExentas", "ventasGravadas", exportaciones, "valorDonado", ventas, "codigoTributo", "precSugVenta", "CargosAbono", "ivaItem", montoretencion, "codRetencion", "ivaRetenido", "fechaIni", "fechaFin", "codLiquidacion", "canDocumentos", "valorOpLiq", "valNoPercepcion", "descNoPercepcion", "observacionesItem", "observacionesItems", subtotal, "ivaOpLiq", "montoSinIva", "ivaPercibido", comision, "porcComision", "IvaComision", "ValorLiqPagar", "valorLetras", "sacosEsp") VALUES (50, 'DTE-03-CMPV0202-000000000003984', '564B591C-2DA3-4204-A595-D9A740883E11', '2', '3', '', '', NULL, NULL, '', NULL, '40', '1390', 'IT', '', '59', 'Azucar 2.5 Kilos', '2.48', '', '0.00', '0.00', '0.00', '99.2', '0.00', '0.00', '2.488496', '20', '2.488496', '0.00', '12.94', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.Cuerpodocumento (identificador, "numeroControl", "codigoGeneracion", item, "tipoItem", "tipoDonacion", depreciacion, "tipDTRelacionado", "tipGenDoc", "numDocRelacionado", "fechaGendoc", cantidad, codigo, areafact, "codTributo", "unidadMedida", descripcion, "precioUnitario", "valorUnitario", descuentos, "ventasNSujetas", "ventasExentas", "ventasGravadas", exportaciones, "valorDonado", ventas, "codigoTributo", "precSugVenta", "CargosAbono", "ivaItem", montoretencion, "codRetencion", "ivaRetenido", "fechaIni", "fechaFin", "codLiquidacion", "canDocumentos", "valorOpLiq", "valNoPercepcion", "descNoPercepcion", "observacionesItem", "observacionesItems", subtotal, "ivaOpLiq", "montoSinIva", "ivaPercibido", comision, "porcComision", "IvaComision", "ValorLiqPagar", "valorLetras", "sacosEsp") VALUES (51, 'DTE-03-CMPV0202-000000000003985', '02420099-5CD5-4F04-B6A3-448BAAF1B30B', '1', '3', '', '', NULL, NULL, '', NULL, '200', '1372', 'IT', '', '59', 'Azucar 1/2 Kilo', '0.50', '', '0.00', '0.00', '0.00', '100', '0.00', '0.00', '0.508407', '20', '0.508407', '0.00', '13.22', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.Cuerpodocumento (identificador, "numeroControl", "codigoGeneracion", item, "tipoItem", "tipoDonacion", depreciacion, "tipDTRelacionado", "tipGenDoc", "numDocRelacionado", "fechaGendoc", cantidad, codigo, areafact, "codTributo", "unidadMedida", descripcion, "precioUnitario", "valorUnitario", descuentos, "ventasNSujetas", "ventasExentas", "ventasGravadas", exportaciones, "valorDonado", ventas, "codigoTributo", "precSugVenta", "CargosAbono", "ivaItem", montoretencion, "codRetencion", "ivaRetenido", "fechaIni", "fechaFin", "codLiquidacion", "canDocumentos", "valorOpLiq", "valNoPercepcion", "descNoPercepcion", "observacionesItem", "observacionesItems", subtotal, "ivaOpLiq", "montoSinIva", "ivaPercibido", comision, "porcComision", "IvaComision", "ValorLiqPagar", "valorLetras", "sacosEsp") VALUES (52, 'DTE-03-CMPV0202-000000000003985', '02420099-5CD5-4F04-B6A3-448BAAF1B30B', '2', '3', '', '', NULL, NULL, '', NULL, '40', '1390', 'IT', '', '59', 'Azucar 2.5 Kilos', '2.48', '', '0.00', '0.00', '0.00', '99.2', '0.00', '0.00', '2.488496', '20', '2.488496', '0.00', '12.94', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.Cuerpodocumento (identificador, "numeroControl", "codigoGeneracion", item, "tipoItem", "tipoDonacion", depreciacion, "tipDTRelacionado", "tipGenDoc", "numDocRelacionado", "fechaGendoc", cantidad, codigo, areafact, "codTributo", "unidadMedida", descripcion, "precioUnitario", "valorUnitario", descuentos, "ventasNSujetas", "ventasExentas", "ventasGravadas", exportaciones, "valorDonado", ventas, "codigoTributo", "precSugVenta", "CargosAbono", "ivaItem", montoretencion, "codRetencion", "ivaRetenido", "fechaIni", "fechaFin", "codLiquidacion", "canDocumentos", "valorOpLiq", "valNoPercepcion", "descNoPercepcion", "observacionesItem", "observacionesItems", subtotal, "ivaOpLiq", "montoSinIva", "ivaPercibido", comision, "porcComision", "IvaComision", "ValorLiqPagar", "valorLetras", "sacosEsp") VALUES (53, 'DTE-03-CMPV0202-000000000003986', '43AA7CEF-B070-46F6-89A0-18FEC495CCA8', '1', '3', '', '', NULL, NULL, '', NULL, '200', '1372', 'IT', '', '59', 'Azucar 1/2 Kilo', '0.50', '', '0.00', '0.00', '0.00', '100', '0.00', '0.00', '0.508407', '20', '0.508407', '0.00', '13.22', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.Cuerpodocumento (identificador, "numeroControl", "codigoGeneracion", item, "tipoItem", "tipoDonacion", depreciacion, "tipDTRelacionado", "tipGenDoc", "numDocRelacionado", "fechaGendoc", cantidad, codigo, areafact, "codTributo", "unidadMedida", descripcion, "precioUnitario", "valorUnitario", descuentos, "ventasNSujetas", "ventasExentas", "ventasGravadas", exportaciones, "valorDonado", ventas, "codigoTributo", "precSugVenta", "CargosAbono", "ivaItem", montoretencion, "codRetencion", "ivaRetenido", "fechaIni", "fechaFin", "codLiquidacion", "canDocumentos", "valorOpLiq", "valNoPercepcion", "descNoPercepcion", "observacionesItem", "observacionesItems", subtotal, "ivaOpLiq", "montoSinIva", "ivaPercibido", comision, "porcComision", "IvaComision", "ValorLiqPagar", "valorLetras", "sacosEsp") VALUES (54, 'DTE-03-CMPV0202-000000000003986', '43AA7CEF-B070-46F6-89A0-18FEC495CCA8', '2', '3', '', '', NULL, NULL, '', NULL, '40', '1390', 'IT', '', '59', 'Azucar 2.5 Kilos', '2.48', '', '0.00', '0.00', '0.00', '99.2', '0.00', '0.00', '2.488496', '20', '2.488496', '0.00', '12.94', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.Cuerpodocumento (identificador, "numeroControl", "codigoGeneracion", item, "tipoItem", "tipoDonacion", depreciacion, "tipDTRelacionado", "tipGenDoc", "numDocRelacionado", "fechaGendoc", cantidad, codigo, areafact, "codTributo", "unidadMedida", descripcion, "precioUnitario", "valorUnitario", descuentos, "ventasNSujetas", "ventasExentas", "ventasGravadas", exportaciones, "valorDonado", ventas, "codigoTributo", "precSugVenta", "CargosAbono", "ivaItem", montoretencion, "codRetencion", "ivaRetenido", "fechaIni", "fechaFin", "codLiquidacion", "canDocumentos", "valorOpLiq", "valNoPercepcion", "descNoPercepcion", "observacionesItem", "observacionesItems", subtotal, "ivaOpLiq", "montoSinIva", "ivaPercibido", comision, "porcComision", "IvaComision", "ValorLiqPagar", "valorLetras", "sacosEsp") VALUES (55, 'DTE-03-CMPV0202-000000000003987', '5D61675C-260E-44FD-A3BA-57805A5DA2D2', '1', '3', '', '', NULL, NULL, '', NULL, '200', '1372', 'IT', '', '59', 'Azucar 1/2 Kilo', '0.50', '', '0.00', '0.00', '0.00', '100', '0.00', '0.00', '0.508407', '20', '0.508407', '0.00', '13.22', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.Cuerpodocumento (identificador, "numeroControl", "codigoGeneracion", item, "tipoItem", "tipoDonacion", depreciacion, "tipDTRelacionado", "tipGenDoc", "numDocRelacionado", "fechaGendoc", cantidad, codigo, areafact, "codTributo", "unidadMedida", descripcion, "precioUnitario", "valorUnitario", descuentos, "ventasNSujetas", "ventasExentas", "ventasGravadas", exportaciones, "valorDonado", ventas, "codigoTributo", "precSugVenta", "CargosAbono", "ivaItem", montoretencion, "codRetencion", "ivaRetenido", "fechaIni", "fechaFin", "codLiquidacion", "canDocumentos", "valorOpLiq", "valNoPercepcion", "descNoPercepcion", "observacionesItem", "observacionesItems", subtotal, "ivaOpLiq", "montoSinIva", "ivaPercibido", comision, "porcComision", "IvaComision", "ValorLiqPagar", "valorLetras", "sacosEsp") VALUES (56, 'DTE-03-CMPV0202-000000000003987', '5D61675C-260E-44FD-A3BA-57805A5DA2D2', '2', '3', '', '', NULL, NULL, '', NULL, '40', '1390', 'IT', '', '59', 'Azucar 2.5 Kilos', '2.48', '', '0.00', '0.00', '0.00', '99.2', '0.00', '0.00', '2.488496', '20', '2.488496', '0.00', '12.94', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.Cuerpodocumento (identificador, "numeroControl", "codigoGeneracion", item, "tipoItem", "tipoDonacion", depreciacion, "tipDTRelacionado", "tipGenDoc", "numDocRelacionado", "fechaGendoc", cantidad, codigo, areafact, "codTributo", "unidadMedida", descripcion, "precioUnitario", "valorUnitario", descuentos, "ventasNSujetas", "ventasExentas", "ventasGravadas", exportaciones, "valorDonado", ventas, "codigoTributo", "precSugVenta", "CargosAbono", "ivaItem", montoretencion, "codRetencion", "ivaRetenido", "fechaIni", "fechaFin", "codLiquidacion", "canDocumentos", "valorOpLiq", "valNoPercepcion", "descNoPercepcion", "observacionesItem", "observacionesItems", subtotal, "ivaOpLiq", "montoSinIva", "ivaPercibido", comision, "porcComision", "IvaComision", "ValorLiqPagar", "valorLetras", "sacosEsp") VALUES (57, 'DTE-03-CMPV0202-000000000003988', '6EB3F012-7404-46C4-908A-6F5175D8CE02', '1', '3', '', '', NULL, NULL, '', NULL, '200', '1372', 'IT', '', '59', 'Azucar 1/2 Kilo', '0.50', '', '0.00', '0.00', '0.00', '100', '0.00', '0.00', '0.508407', '20', '0.508407', '0.00', '13.22', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.Cuerpodocumento (identificador, "numeroControl", "codigoGeneracion", item, "tipoItem", "tipoDonacion", depreciacion, "tipDTRelacionado", "tipGenDoc", "numDocRelacionado", "fechaGendoc", cantidad, codigo, areafact, "codTributo", "unidadMedida", descripcion, "precioUnitario", "valorUnitario", descuentos, "ventasNSujetas", "ventasExentas", "ventasGravadas", exportaciones, "valorDonado", ventas, "codigoTributo", "precSugVenta", "CargosAbono", "ivaItem", montoretencion, "codRetencion", "ivaRetenido", "fechaIni", "fechaFin", "codLiquidacion", "canDocumentos", "valorOpLiq", "valNoPercepcion", "descNoPercepcion", "observacionesItem", "observacionesItems", subtotal, "ivaOpLiq", "montoSinIva", "ivaPercibido", comision, "porcComision", "IvaComision", "ValorLiqPagar", "valorLetras", "sacosEsp") VALUES (58, 'DTE-03-CMPV0202-000000000003988', '6EB3F012-7404-46C4-908A-6F5175D8CE02', '2', '3', '', '', NULL, NULL, '', NULL, '40', '1390', 'IT', '', '59', 'Azucar 2.5 Kilos', '2.48', '', '0.00', '0.00', '0.00', '99.2', '0.00', '0.00', '2.488496', '20', '2.488496', '0.00', '12.94', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.Cuerpodocumento (identificador, "numeroControl", "codigoGeneracion", item, "tipoItem", "tipoDonacion", depreciacion, "tipDTRelacionado", "tipGenDoc", "numDocRelacionado", "fechaGendoc", cantidad, codigo, areafact, "codTributo", "unidadMedida", descripcion, "precioUnitario", "valorUnitario", descuentos, "ventasNSujetas", "ventasExentas", "ventasGravadas", exportaciones, "valorDonado", ventas, "codigoTributo", "precSugVenta", "CargosAbono", "ivaItem", montoretencion, "codRetencion", "ivaRetenido", "fechaIni", "fechaFin", "codLiquidacion", "canDocumentos", "valorOpLiq", "valNoPercepcion", "descNoPercepcion", "observacionesItem", "observacionesItems", subtotal, "ivaOpLiq", "montoSinIva", "ivaPercibido", comision, "porcComision", "IvaComision", "ValorLiqPagar", "valorLetras", "sacosEsp") VALUES (59, 'DTE-03-CMPV0202-000000000003989', '9E76C69B-6AF3-41F0-A4BE-8C21E52D7CEB', '1', '3', '', '', NULL, NULL, '', NULL, '200', '1372', 'IT', '', '59', 'Azucar 1/2 Kilo', '0.50', '', '0.00', '0.00', '0.00', '100', '0.00', '0.00', '0.508407', '20', '0.508407', '0.00', '13.22', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.Cuerpodocumento (identificador, "numeroControl", "codigoGeneracion", item, "tipoItem", "tipoDonacion", depreciacion, "tipDTRelacionado", "tipGenDoc", "numDocRelacionado", "fechaGendoc", cantidad, codigo, areafact, "codTributo", "unidadMedida", descripcion, "precioUnitario", "valorUnitario", descuentos, "ventasNSujetas", "ventasExentas", "ventasGravadas", exportaciones, "valorDonado", ventas, "codigoTributo", "precSugVenta", "CargosAbono", "ivaItem", montoretencion, "codRetencion", "ivaRetenido", "fechaIni", "fechaFin", "codLiquidacion", "canDocumentos", "valorOpLiq", "valNoPercepcion", "descNoPercepcion", "observacionesItem", "observacionesItems", subtotal, "ivaOpLiq", "montoSinIva", "ivaPercibido", comision, "porcComision", "IvaComision", "ValorLiqPagar", "valorLetras", "sacosEsp") VALUES (60, 'DTE-03-CMPV0202-000000000003989', '9E76C69B-6AF3-41F0-A4BE-8C21E52D7CEB', '2', '3', '', '', NULL, NULL, '', NULL, '40', '1390', 'IT', '', '59', 'Azucar 2.5 Kilos', '2.48', '', '0.00', '0.00', '0.00', '99.2', '0.00', '0.00', '2.488496', '20', '2.488496', '0.00', '12.94', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.Cuerpodocumento (identificador, "numeroControl", "codigoGeneracion", item, "tipoItem", "tipoDonacion", depreciacion, "tipDTRelacionado", "tipGenDoc", "numDocRelacionado", "fechaGendoc", cantidad, codigo, areafact, "codTributo", "unidadMedida", descripcion, "precioUnitario", "valorUnitario", descuentos, "ventasNSujetas", "ventasExentas", "ventasGravadas", exportaciones, "valorDonado", ventas, "codigoTributo", "precSugVenta", "CargosAbono", "ivaItem", montoretencion, "codRetencion", "ivaRetenido", "fechaIni", "fechaFin", "codLiquidacion", "canDocumentos", "valorOpLiq", "valNoPercepcion", "descNoPercepcion", "observacionesItem", "observacionesItems", subtotal, "ivaOpLiq", "montoSinIva", "ivaPercibido", comision, "porcComision", "IvaComision", "ValorLiqPagar", "valorLetras", "sacosEsp") VALUES (61, 'DTE-03-CMPV0202-000000000003990', '8A74DCB8-B243-4C27-9F97-125584B4B103', '1', '3', '', '', NULL, NULL, '', NULL, '200', '1372', 'IT', '', '59', 'Azucar 1/2 Kilo', '0.50', '', '0.00', '0.00', '0.00', '100', '0.00', '0.00', '0.508407', '20', '0.508407', '0.00', '13.22', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.Cuerpodocumento (identificador, "numeroControl", "codigoGeneracion", item, "tipoItem", "tipoDonacion", depreciacion, "tipDTRelacionado", "tipGenDoc", "numDocRelacionado", "fechaGendoc", cantidad, codigo, areafact, "codTributo", "unidadMedida", descripcion, "precioUnitario", "valorUnitario", descuentos, "ventasNSujetas", "ventasExentas", "ventasGravadas", exportaciones, "valorDonado", ventas, "codigoTributo", "precSugVenta", "CargosAbono", "ivaItem", montoretencion, "codRetencion", "ivaRetenido", "fechaIni", "fechaFin", "codLiquidacion", "canDocumentos", "valorOpLiq", "valNoPercepcion", "descNoPercepcion", "observacionesItem", "observacionesItems", subtotal, "ivaOpLiq", "montoSinIva", "ivaPercibido", comision, "porcComision", "IvaComision", "ValorLiqPagar", "valorLetras", "sacosEsp") VALUES (62, 'DTE-03-CMPV0202-000000000003990', '8A74DCB8-B243-4C27-9F97-125584B4B103', '2', '3', '', '', NULL, NULL, '', NULL, '40', '1390', 'IT', '', '59', 'Azucar 2.5 Kilos', '2.48', '', '0.00', '0.00', '0.00', '99.2', '0.00', '0.00', '2.488496', '20', '2.488496', '0.00', '12.94', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.Cuerpodocumento (identificador, "numeroControl", "codigoGeneracion", item, "tipoItem", "tipoDonacion", depreciacion, "tipDTRelacionado", "tipGenDoc", "numDocRelacionado", "fechaGendoc", cantidad, codigo, areafact, "codTributo", "unidadMedida", descripcion, "precioUnitario", "valorUnitario", descuentos, "ventasNSujetas", "ventasExentas", "ventasGravadas", exportaciones, "valorDonado", ventas, "codigoTributo", "precSugVenta", "CargosAbono", "ivaItem", montoretencion, "codRetencion", "ivaRetenido", "fechaIni", "fechaFin", "codLiquidacion", "canDocumentos", "valorOpLiq", "valNoPercepcion", "descNoPercepcion", "observacionesItem", "observacionesItems", subtotal, "ivaOpLiq", "montoSinIva", "ivaPercibido", comision, "porcComision", "IvaComision", "ValorLiqPagar", "valorLetras", "sacosEsp") VALUES (63, 'DTE-03-CMPV0202-000000000003991', '584F066E-5FA3-4AEC-80FB-926901353051', '1', '3', '', '', NULL, NULL, '', NULL, '200', '1372', 'IT', '', '59', 'Azucar 1/2 Kilo', '0.50', '', '0.00', '0.00', '0.00', '100', '0.00', '0.00', '0.508407', '20', '0.508407', '0.00', '13.22', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.Cuerpodocumento (identificador, "numeroControl", "codigoGeneracion", item, "tipoItem", "tipoDonacion", depreciacion, "tipDTRelacionado", "tipGenDoc", "numDocRelacionado", "fechaGendoc", cantidad, codigo, areafact, "codTributo", "unidadMedida", descripcion, "precioUnitario", "valorUnitario", descuentos, "ventasNSujetas", "ventasExentas", "ventasGravadas", exportaciones, "valorDonado", ventas, "codigoTributo", "precSugVenta", "CargosAbono", "ivaItem", montoretencion, "codRetencion", "ivaRetenido", "fechaIni", "fechaFin", "codLiquidacion", "canDocumentos", "valorOpLiq", "valNoPercepcion", "descNoPercepcion", "observacionesItem", "observacionesItems", subtotal, "ivaOpLiq", "montoSinIva", "ivaPercibido", comision, "porcComision", "IvaComision", "ValorLiqPagar", "valorLetras", "sacosEsp") VALUES (64, 'DTE-03-CMPV0202-000000000003991', '584F066E-5FA3-4AEC-80FB-926901353051', '2', '3', '', '', NULL, NULL, '', NULL, '40', '1390', 'IT', '', '59', 'Azucar 2.5 Kilos', '2.48', '', '0.00', '0.00', '0.00', '99.2', '0.00', '0.00', '2.488496', '20', '2.488496', '0.00', '12.94', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.Cuerpodocumento (identificador, "numeroControl", "codigoGeneracion", item, "tipoItem", "tipoDonacion", depreciacion, "tipDTRelacionado", "tipGenDoc", "numDocRelacionado", "fechaGendoc", cantidad, codigo, areafact, "codTributo", "unidadMedida", descripcion, "precioUnitario", "valorUnitario", descuentos, "ventasNSujetas", "ventasExentas", "ventasGravadas", exportaciones, "valorDonado", ventas, "codigoTributo", "precSugVenta", "CargosAbono", "ivaItem", montoretencion, "codRetencion", "ivaRetenido", "fechaIni", "fechaFin", "codLiquidacion", "canDocumentos", "valorOpLiq", "valNoPercepcion", "descNoPercepcion", "observacionesItem", "observacionesItems", subtotal, "ivaOpLiq", "montoSinIva", "ivaPercibido", comision, "porcComision", "IvaComision", "ValorLiqPagar", "valorLetras", "sacosEsp") VALUES (65, 'DTE-03-CMPV0202-000000000003992', 'E9ABB697-938D-4924-A7E7-55C1C7E49AE0', '1', '3', '', '', NULL, NULL, '', NULL, '200', '1372', 'IT', '', '59', 'Azucar 1/2 Kilo', '0.50', '', '0.00', '0.00', '0.00', '100', '0.00', '0.00', '0.508407', '20', '0.508407', '0.00', '13.22', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.Cuerpodocumento (identificador, "numeroControl", "codigoGeneracion", item, "tipoItem", "tipoDonacion", depreciacion, "tipDTRelacionado", "tipGenDoc", "numDocRelacionado", "fechaGendoc", cantidad, codigo, areafact, "codTributo", "unidadMedida", descripcion, "precioUnitario", "valorUnitario", descuentos, "ventasNSujetas", "ventasExentas", "ventasGravadas", exportaciones, "valorDonado", ventas, "codigoTributo", "precSugVenta", "CargosAbono", "ivaItem", montoretencion, "codRetencion", "ivaRetenido", "fechaIni", "fechaFin", "codLiquidacion", "canDocumentos", "valorOpLiq", "valNoPercepcion", "descNoPercepcion", "observacionesItem", "observacionesItems", subtotal, "ivaOpLiq", "montoSinIva", "ivaPercibido", comision, "porcComision", "IvaComision", "ValorLiqPagar", "valorLetras", "sacosEsp") VALUES (66, 'DTE-03-CMPV0202-000000000003992', 'E9ABB697-938D-4924-A7E7-55C1C7E49AE0', '2', '3', '', '', NULL, NULL, '', NULL, '40', '1390', 'IT', '', '59', 'Azucar 2.5 Kilos', '2.48', '', '0.00', '0.00', '0.00', '99.2', '0.00', '0.00', '2.488496', '20', '2.488496', '0.00', '12.94', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.Cuerpodocumento (identificador, "numeroControl", "codigoGeneracion", item, "tipoItem", "tipoDonacion", depreciacion, "tipDTRelacionado", "tipGenDoc", "numDocRelacionado", "fechaGendoc", cantidad, codigo, areafact, "codTributo", "unidadMedida", descripcion, "precioUnitario", "valorUnitario", descuentos, "ventasNSujetas", "ventasExentas", "ventasGravadas", exportaciones, "valorDonado", ventas, "codigoTributo", "precSugVenta", "CargosAbono", "ivaItem", montoretencion, "codRetencion", "ivaRetenido", "fechaIni", "fechaFin", "codLiquidacion", "canDocumentos", "valorOpLiq", "valNoPercepcion", "descNoPercepcion", "observacionesItem", "observacionesItems", subtotal, "ivaOpLiq", "montoSinIva", "ivaPercibido", comision, "porcComision", "IvaComision", "ValorLiqPagar", "valorLetras", "sacosEsp") VALUES (67, 'DTE-03-CMPV0202-000000000003993', '8C38260B-247F-4A78-B83F-2B76CDA85224', '1', '3', '', '', NULL, NULL, '', NULL, '200', '1372', 'IT', '', '59', 'Azucar 1/2 Kilo', '0.50', '', '0.00', '0.00', '0.00', '100', '0.00', '0.00', '0.508407', '20', '0.508407', '0.00', '13.22', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.Cuerpodocumento (identificador, "numeroControl", "codigoGeneracion", item, "tipoItem", "tipoDonacion", depreciacion, "tipDTRelacionado", "tipGenDoc", "numDocRelacionado", "fechaGendoc", cantidad, codigo, areafact, "codTributo", "unidadMedida", descripcion, "precioUnitario", "valorUnitario", descuentos, "ventasNSujetas", "ventasExentas", "ventasGravadas", exportaciones, "valorDonado", ventas, "codigoTributo", "precSugVenta", "CargosAbono", "ivaItem", montoretencion, "codRetencion", "ivaRetenido", "fechaIni", "fechaFin", "codLiquidacion", "canDocumentos", "valorOpLiq", "valNoPercepcion", "descNoPercepcion", "observacionesItem", "observacionesItems", subtotal, "ivaOpLiq", "montoSinIva", "ivaPercibido", comision, "porcComision", "IvaComision", "ValorLiqPagar", "valorLetras", "sacosEsp") VALUES (68, 'DTE-03-CMPV0202-000000000003993', '8C38260B-247F-4A78-B83F-2B76CDA85224', '2', '3', '', '', NULL, NULL, '', NULL, '40', '1390', 'IT', '', '59', 'Azucar 2.5 Kilos', '2.48', '', '0.00', '0.00', '0.00', '99.2', '0.00', '0.00', '2.488496', '20', '2.488496', '0.00', '12.94', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.Cuerpodocumento (identificador, "numeroControl", "codigoGeneracion", item, "tipoItem", "tipoDonacion", depreciacion, "tipDTRelacionado", "tipGenDoc", "numDocRelacionado", "fechaGendoc", cantidad, codigo, areafact, "codTributo", "unidadMedida", descripcion, "precioUnitario", "valorUnitario", descuentos, "ventasNSujetas", "ventasExentas", "ventasGravadas", exportaciones, "valorDonado", ventas, "codigoTributo", "precSugVenta", "CargosAbono", "ivaItem", montoretencion, "codRetencion", "ivaRetenido", "fechaIni", "fechaFin", "codLiquidacion", "canDocumentos", "valorOpLiq", "valNoPercepcion", "descNoPercepcion", "observacionesItem", "observacionesItems", subtotal, "ivaOpLiq", "montoSinIva", "ivaPercibido", comision, "porcComision", "IvaComision", "ValorLiqPagar", "valorLetras", "sacosEsp") VALUES (69, 'DTE-03-CMPV0202-000000000003994', '1EEACAC8-002D-49E9-8E30-253F94D8AFC0', '1', '3', '', '', NULL, NULL, '', NULL, '200', '1372', 'IT', '', '59', 'Azucar 1/2 Kilo', '0.50', '', '0.00', '0.00', '0.00', '100', '0.00', '0.00', '0.508407', '20', '0.508407', '0.00', '13.22', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.Cuerpodocumento (identificador, "numeroControl", "codigoGeneracion", item, "tipoItem", "tipoDonacion", depreciacion, "tipDTRelacionado", "tipGenDoc", "numDocRelacionado", "fechaGendoc", cantidad, codigo, areafact, "codTributo", "unidadMedida", descripcion, "precioUnitario", "valorUnitario", descuentos, "ventasNSujetas", "ventasExentas", "ventasGravadas", exportaciones, "valorDonado", ventas, "codigoTributo", "precSugVenta", "CargosAbono", "ivaItem", montoretencion, "codRetencion", "ivaRetenido", "fechaIni", "fechaFin", "codLiquidacion", "canDocumentos", "valorOpLiq", "valNoPercepcion", "descNoPercepcion", "observacionesItem", "observacionesItems", subtotal, "ivaOpLiq", "montoSinIva", "ivaPercibido", comision, "porcComision", "IvaComision", "ValorLiqPagar", "valorLetras", "sacosEsp") VALUES (70, 'DTE-03-CMPV0202-000000000003994', '1EEACAC8-002D-49E9-8E30-253F94D8AFC0', '2', '3', '', '', NULL, NULL, '', NULL, '40', '1390', 'IT', '', '59', 'Azucar 2.5 Kilos', '2.48', '', '0.00', '0.00', '0.00', '99.2', '0.00', '0.00', '2.488496', '20', '2.488496', '0.00', '12.94', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.Cuerpodocumento (identificador, "numeroControl", "codigoGeneracion", item, "tipoItem", "tipoDonacion", depreciacion, "tipDTRelacionado", "tipGenDoc", "numDocRelacionado", "fechaGendoc", cantidad, codigo, areafact, "codTributo", "unidadMedida", descripcion, "precioUnitario", "valorUnitario", descuentos, "ventasNSujetas", "ventasExentas", "ventasGravadas", exportaciones, "valorDonado", ventas, "codigoTributo", "precSugVenta", "CargosAbono", "ivaItem", montoretencion, "codRetencion", "ivaRetenido", "fechaIni", "fechaFin", "codLiquidacion", "canDocumentos", "valorOpLiq", "valNoPercepcion", "descNoPercepcion", "observacionesItem", "observacionesItems", subtotal, "ivaOpLiq", "montoSinIva", "ivaPercibido", comision, "porcComision", "IvaComision", "ValorLiqPagar", "valorLetras", "sacosEsp") VALUES (71, 'DTE-03-CMPV0202-000000000003995', 'B0093AF7-3309-4B8D-B839-C0EE01A359D6', '1', '3', '', '', NULL, NULL, '', NULL, '200', '1372', 'IT', '', '59', 'Azucar 1/2 Kilo', '0.50', '', '0.00', '0.00', '0.00', '100', '0.00', '0.00', '0.508407', '20', '0.508407', '0.00', '13.22', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.Cuerpodocumento (identificador, "numeroControl", "codigoGeneracion", item, "tipoItem", "tipoDonacion", depreciacion, "tipDTRelacionado", "tipGenDoc", "numDocRelacionado", "fechaGendoc", cantidad, codigo, areafact, "codTributo", "unidadMedida", descripcion, "precioUnitario", "valorUnitario", descuentos, "ventasNSujetas", "ventasExentas", "ventasGravadas", exportaciones, "valorDonado", ventas, "codigoTributo", "precSugVenta", "CargosAbono", "ivaItem", montoretencion, "codRetencion", "ivaRetenido", "fechaIni", "fechaFin", "codLiquidacion", "canDocumentos", "valorOpLiq", "valNoPercepcion", "descNoPercepcion", "observacionesItem", "observacionesItems", subtotal, "ivaOpLiq", "montoSinIva", "ivaPercibido", comision, "porcComision", "IvaComision", "ValorLiqPagar", "valorLetras", "sacosEsp") VALUES (72, 'DTE-03-CMPV0202-000000000003995', 'B0093AF7-3309-4B8D-B839-C0EE01A359D6', '2', '3', '', '', NULL, NULL, '', NULL, '40', '1390', 'IT', '', '59', 'Azucar 2.5 Kilos', '2.48', '', '0.00', '0.00', '0.00', '99.2', '0.00', '0.00', '2.488496', '20', '2.488496', '0.00', '12.94', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.Cuerpodocumento (identificador, "numeroControl", "codigoGeneracion", item, "tipoItem", "tipoDonacion", depreciacion, "tipDTRelacionado", "tipGenDoc", "numDocRelacionado", "fechaGendoc", cantidad, codigo, areafact, "codTributo", "unidadMedida", descripcion, "precioUnitario", "valorUnitario", descuentos, "ventasNSujetas", "ventasExentas", "ventasGravadas", exportaciones, "valorDonado", ventas, "codigoTributo", "precSugVenta", "CargosAbono", "ivaItem", montoretencion, "codRetencion", "ivaRetenido", "fechaIni", "fechaFin", "codLiquidacion", "canDocumentos", "valorOpLiq", "valNoPercepcion", "descNoPercepcion", "observacionesItem", "observacionesItems", subtotal, "ivaOpLiq", "montoSinIva", "ivaPercibido", comision, "porcComision", "IvaComision", "ValorLiqPagar", "valorLetras", "sacosEsp") VALUES (73, 'DTE-01-CMPV0202-000000000003999', 'A39C6F29-0A6D-4AC6-85EB-132E4C0EDBCF', '1', '3', '', '', NULL, NULL, '', NULL, '1', '0100101', 'CC', '', '01', NULL, '10.00', '', '0.00', '0.00', '0.00', '10', '0.00', '0.00', '10', '20', '10.00', '0.00', '1.15', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.Cuerpodocumento (identificador, "numeroControl", "codigoGeneracion", item, "tipoItem", "tipoDonacion", depreciacion, "tipDTRelacionado", "tipGenDoc", "numDocRelacionado", "fechaGendoc", cantidad, codigo, areafact, "codTributo", "unidadMedida", descripcion, "precioUnitario", "valorUnitario", descuentos, "ventasNSujetas", "ventasExentas", "ventasGravadas", exportaciones, "valorDonado", ventas, "codigoTributo", "precSugVenta", "CargosAbono", "ivaItem", montoretencion, "codRetencion", "ivaRetenido", "fechaIni", "fechaFin", "codLiquidacion", "canDocumentos", "valorOpLiq", "valNoPercepcion", "descNoPercepcion", "observacionesItem", "observacionesItems", subtotal, "ivaOpLiq", "montoSinIva", "ivaPercibido", comision, "porcComision", "IvaComision", "ValorLiqPagar", "valorLetras", "sacosEsp") VALUES (74, 'DTE-01-CMPV0202-000000000003999', 'A39C6F29-0A6D-4AC6-85EB-132E4C0EDBCF', '2', '3', '', '', NULL, NULL, '', NULL, '2', '02515181518', 'CC', '', '01', NULL, '1.25', '', '0.00', '0.00', '0.00', '2.5', '0.00', '0.00', '2.5', '20', '1.25', '0.00', '0.29', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- Data for Name: docrelacionados; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--



--
-- Data for Name: emisor; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

INSERT INTO public.emisor (id, "numeroControl", "codigoGeneracion", nit, "tipoDoc", "numDoc", ncr, nombre, "codactEco", "desactEco", "nomComercial", "tipEstablecimiento", "Departamento", "Municipio", "Direccion", telefono, correo, "codEstableMH", "codEstable", "codPuntoVentaMH", "codPuntoVenta", "tipoItem", "recintoFiscal", "regExportacion") VALUES (1, '', '', '0203-311066-001-9', '', '', '4674-4', 'COOPERATIVA CUZCACHAPA DE R.L', '01632', 'Servicio de beneficio de caf�', 'SOCIEDAD COOPERATIVA CHALCHUAPANECA DE PRODUCTORES DE CAFE', '02', '02', '03', 'CARRETERA A EL COCO, COL CUZCACHAPA CTON. GALEANO.', '24527800', 'cuzcachapa@cuzcachapa.com', NULL, NULL, NULL, NULL, 1, '02', 'EX-1.1000.000');


--
-- Data for Name: identificacion; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

INSERT INTO public.identificacion (version, "ambDestino", "tipoDoc", "numeroControl", "codigoGeneracion", "modFacturacion", "tipTransmicion", "tipContingencia", "motContingencia", fecha, hora, "tipMoneda", estado) VALUES (3, '00', 3, 'DTE-03-CMPV0202-000000000003985', '02420099-5CD5-4F04-B6A3-448BAAF1B30B', 1, 1, NULL, NULL, '2024-03-09', '12:37:47', 'USD', 0);
INSERT INTO public.identificacion (version, "ambDestino", "tipoDoc", "numeroControl", "codigoGeneracion", "modFacturacion", "tipTransmicion", "tipContingencia", "motContingencia", fecha, hora, "tipMoneda", estado) VALUES (3, '00', 3, 'DTE-03-CMPV0202-000000000003970', '0930B690-67DB-461D-A739-1A5232834D40', 1, 1, NULL, NULL, '2024-03-09', '06:14:28', 'USD', 0);
INSERT INTO public.identificacion (version, "ambDestino", "tipoDoc", "numeroControl", "codigoGeneracion", "modFacturacion", "tipTransmicion", "tipContingencia", "motContingencia", fecha, hora, "tipMoneda", estado) VALUES (3, '00', 3, 'DTE-03-CMPV0202-000000000003963', '0F9DB45F-1E98-4573-89FB-F46A322984C3', 1, 1, NULL, NULL, '2024-03-09', '05:59:22', 'USD', 0);
INSERT INTO public.identificacion (version, "ambDestino", "tipoDoc", "numeroControl", "codigoGeneracion", "modFacturacion", "tipTransmicion", "tipContingencia", "motContingencia", fecha, hora, "tipMoneda", estado) VALUES (3, '00', 3, 'DTE-03-CMPV0202-000000000003982', '17BCBD36-49C2-4CA0-A4A7-69A3C79E3AF5', 1, 1, NULL, NULL, '2024-03-09', '12:30:52', 'USD', 0);
INSERT INTO public.identificacion (version, "ambDestino", "tipoDoc", "numeroControl", "codigoGeneracion", "modFacturacion", "tipTransmicion", "tipContingencia", "motContingencia", fecha, hora, "tipMoneda", estado) VALUES (3, '00', 3, 'DTE-03-CMPV0202-000000000003994', '1EEACAC8-002D-49E9-8E30-253F94D8AFC0', 1, 1, NULL, NULL, '2024-03-09', '01:04:15', 'USD', 0);
INSERT INTO public.identificacion (version, "ambDestino", "tipoDoc", "numeroControl", "codigoGeneracion", "modFacturacion", "tipTransmicion", "tipContingencia", "motContingencia", fecha, hora, "tipMoneda", estado) VALUES (3, '00', 3, 'DTE-03-CMPV0202-000000000003966', '29174571-7067-498C-AE55-42E3A8B6BCFB', 1, 1, NULL, NULL, '2024-03-09', '06:03:11', 'USD', 0);
INSERT INTO public.identificacion (version, "ambDestino", "tipoDoc", "numeroControl", "codigoGeneracion", "modFacturacion", "tipTransmicion", "tipContingencia", "motContingencia", fecha, hora, "tipMoneda", estado) VALUES (3, '00', 3, 'DTE-03-CMPV0202-000000000003964', '2BC21107-E05D-4F87-A49C-77A444871C49', 1, 1, NULL, NULL, '2024-03-09', '06:00:41', 'USD', 0);
INSERT INTO public.identificacion (version, "ambDestino", "tipoDoc", "numeroControl", "codigoGeneracion", "modFacturacion", "tipTransmicion", "tipContingencia", "motContingencia", fecha, hora, "tipMoneda", estado) VALUES (3, '00', 3, 'DTE-03-CMPV0202-000000000003983', '2D6B3A42-6375-4BB1-8162-65AB0DBCC585', 1, 1, NULL, NULL, '2024-03-09', '12:31:32', 'USD', 0);
INSERT INTO public.identificacion (version, "ambDestino", "tipoDoc", "numeroControl", "codigoGeneracion", "modFacturacion", "tipTransmicion", "tipContingencia", "motContingencia", fecha, hora, "tipMoneda", estado) VALUES (1, '00', 1, 'DTE-01-CMPV0202-000000000003996', '311DAD68-3A4D-47CF-9DB8-C3C10BB3ABBE', 1, 1, NULL, NULL, '2024-04-04', '11:29:04', 'USD', 0);
INSERT INTO public.identificacion (version, "ambDestino", "tipoDoc", "numeroControl", "codigoGeneracion", "modFacturacion", "tipTransmicion", "tipContingencia", "motContingencia", fecha, hora, "tipMoneda", estado) VALUES (1, '00', 1, 'DTE-01-CMPV0202-000000000003997', '36E46640-3A5D-4607-A788-ECF3E7B8B258', 1, 1, NULL, NULL, '2024-04-04', '11:29:31', 'USD', 0);
INSERT INTO public.identificacion (version, "ambDestino", "tipoDoc", "numeroControl", "codigoGeneracion", "modFacturacion", "tipTransmicion", "tipContingencia", "motContingencia", fecha, hora, "tipMoneda", estado) VALUES (1, '00', 1, 'DTE-01-CMPV0202-000000000004000', '3F1916EB-FE41-437D-95FD-B29680D0237B', 1, 1, NULL, NULL, '2024-04-04', '11:50:45', 'USD', 0);
INSERT INTO public.identificacion (version, "ambDestino", "tipoDoc", "numeroControl", "codigoGeneracion", "modFacturacion", "tipTransmicion", "tipContingencia", "motContingencia", fecha, hora, "tipMoneda", estado) VALUES (3, '00', 3, 'DTE-03-CMPV0202-000000000003963', '4058E0A5-E11E-4981-8DBD-A00F1BAEBEC7', 1, 1, NULL, NULL, '2024-03-09', '06:00:30', 'USD', 0);
INSERT INTO public.identificacion (version, "ambDestino", "tipoDoc", "numeroControl", "codigoGeneracion", "modFacturacion", "tipTransmicion", "tipContingencia", "motContingencia", fecha, hora, "tipMoneda", estado) VALUES (3, '00', 3, 'DTE-03-CMPV0202-000000000003986', '43AA7CEF-B070-46F6-89A0-18FEC495CCA8', 1, 1, NULL, NULL, '2024-03-09', '12:40:15', 'USD', 0);
INSERT INTO public.identificacion (version, "ambDestino", "tipoDoc", "numeroControl", "codigoGeneracion", "modFacturacion", "tipTransmicion", "tipContingencia", "motContingencia", fecha, hora, "tipMoneda", estado) VALUES (3, '00', 3, 'DTE-03-CMPV0202-000000000003984', '564B591C-2DA3-4204-A595-D9A740883E11', 1, 1, NULL, NULL, '2024-03-09', '12:34:07', 'USD', 0);
INSERT INTO public.identificacion (version, "ambDestino", "tipoDoc", "numeroControl", "codigoGeneracion", "modFacturacion", "tipTransmicion", "tipContingencia", "motContingencia", fecha, hora, "tipMoneda", estado) VALUES (3, '00', 3, 'DTE-03-CMPV0202-000000000003991', '584F066E-5FA3-4AEC-80FB-926901353051', 1, 1, NULL, NULL, '2024-03-09', '12:54:19', 'USD', 0);
INSERT INTO public.identificacion (version, "ambDestino", "tipoDoc", "numeroControl", "codigoGeneracion", "modFacturacion", "tipTransmicion", "tipContingencia", "motContingencia", fecha, hora, "tipMoneda", estado) VALUES (3, '00', 3, 'DTE-03-CMPV0202-000000000003987', '5D61675C-260E-44FD-A3BA-57805A5DA2D2', 1, 1, NULL, NULL, '2024-03-09', '12:44:01', 'USD', 0);
INSERT INTO public.identificacion (version, "ambDestino", "tipoDoc", "numeroControl", "codigoGeneracion", "modFacturacion", "tipTransmicion", "tipContingencia", "motContingencia", fecha, hora, "tipMoneda", estado) VALUES (3, '00', 3, 'DTE-03-CMPV0202-000000000003973', '6438505D-BE64-46CC-A7A7-120DDC80B6FF', 1, 1, NULL, NULL, '2024-03-09', '06:24:57', 'USD', 0);
INSERT INTO public.identificacion (version, "ambDestino", "tipoDoc", "numeroControl", "codigoGeneracion", "modFacturacion", "tipTransmicion", "tipContingencia", "motContingencia", fecha, hora, "tipMoneda", estado) VALUES (3, '00', 3, 'DTE-03-CMPV0202-000000000003988', '6EB3F012-7404-46C4-908A-6F5175D8CE02', 1, 1, NULL, NULL, '2024-03-09', '12:46:00', 'USD', 0);
INSERT INTO public.identificacion (version, "ambDestino", "tipoDoc", "numeroControl", "codigoGeneracion", "modFacturacion", "tipTransmicion", "tipContingencia", "motContingencia", fecha, hora, "tipMoneda", estado) VALUES (1, '00', 1, 'DTE-01-CMPV0202-000000000003998', '752239A4-5DB8-465D-8C6E-13123DAF86DB', 1, 1, NULL, NULL, '2024-04-04', '11:36:29', 'USD', 0);
INSERT INTO public.identificacion (version, "ambDestino", "tipoDoc", "numeroControl", "codigoGeneracion", "modFacturacion", "tipTransmicion", "tipContingencia", "motContingencia", fecha, hora, "tipMoneda", estado) VALUES (3, '00', 3, 'DTE-03-CMPV0202-000000000003975', '7AEE2981-DB26-400B-A33C-755C42E06986', 1, 1, NULL, NULL, '2024-03-09', '06:36:36', 'USD', 0);
INSERT INTO public.identificacion (version, "ambDestino", "tipoDoc", "numeroControl", "codigoGeneracion", "modFacturacion", "tipTransmicion", "tipContingencia", "motContingencia", fecha, hora, "tipMoneda", estado) VALUES (3, '00', 3, 'DTE-03-CMPV0202-000000000003990', '8A74DCB8-B243-4C27-9F97-125584B4B103', 1, 1, NULL, NULL, '2024-03-09', '12:51:26', 'USD', 0);
INSERT INTO public.identificacion (version, "ambDestino", "tipoDoc", "numeroControl", "codigoGeneracion", "modFacturacion", "tipTransmicion", "tipContingencia", "motContingencia", fecha, hora, "tipMoneda", estado) VALUES (3, '00', 3, 'DTE-03-CMPV0202-000000000003993', '8C38260B-247F-4A78-B83F-2B76CDA85224', 1, 1, NULL, NULL, '2024-03-09', '01:03:42', 'USD', 0);
INSERT INTO public.identificacion (version, "ambDestino", "tipoDoc", "numeroControl", "codigoGeneracion", "modFacturacion", "tipTransmicion", "tipContingencia", "motContingencia", fecha, hora, "tipMoneda", estado) VALUES (3, '00', 3, 'DTE-03-CMPV0202-000000000003980', '8EB51F9E-662A-44F2-B5FA-0A0ECB940995', 1, 1, NULL, NULL, '2024-03-09', '12:29:24', 'USD', 0);
INSERT INTO public.identificacion (version, "ambDestino", "tipoDoc", "numeroControl", "codigoGeneracion", "modFacturacion", "tipTransmicion", "tipContingencia", "motContingencia", fecha, hora, "tipMoneda", estado) VALUES (3, '00', 3, 'DTE-03-CMPV0202-000000000003976', '94410371-3B92-46DC-8D4B-5552A0F05122', 1, 1, NULL, NULL, '2024-03-09', '06:40:57', 'USD', 0);
INSERT INTO public.identificacion (version, "ambDestino", "tipoDoc", "numeroControl", "codigoGeneracion", "modFacturacion", "tipTransmicion", "tipContingencia", "motContingencia", fecha, hora, "tipMoneda", estado) VALUES (3, '00', 3, 'DTE-03-CMPV0202-000000000003989', '9E76C69B-6AF3-41F0-A4BE-8C21E52D7CEB', 1, 1, NULL, NULL, '2024-03-09', '12:47:34', 'USD', 0);
INSERT INTO public.identificacion (version, "ambDestino", "tipoDoc", "numeroControl", "codigoGeneracion", "modFacturacion", "tipTransmicion", "tipContingencia", "motContingencia", fecha, hora, "tipMoneda", estado) VALUES (3, '00', 3, 'DTE-03-CMPV0202-000000000003972', '9FB0D8F8-2818-4A41-B0D0-6171273B53E9', 1, 1, NULL, NULL, '2024-03-09', '06:16:34', 'USD', 0);
INSERT INTO public.identificacion (version, "ambDestino", "tipoDoc", "numeroControl", "codigoGeneracion", "modFacturacion", "tipTransmicion", "tipContingencia", "motContingencia", fecha, hora, "tipMoneda", estado) VALUES (1, '00', 1, 'DTE-01-CMPV0202-000000000003999', 'A39C6F29-0A6D-4AC6-85EB-132E4C0EDBCF', 1, 1, NULL, NULL, '2024-04-04', '11:48:02', 'USD', 0);
INSERT INTO public.identificacion (version, "ambDestino", "tipoDoc", "numeroControl", "codigoGeneracion", "modFacturacion", "tipTransmicion", "tipContingencia", "motContingencia", fecha, hora, "tipMoneda", estado) VALUES (3, '00', 3, 'DTE-03-CMPV0202-000000000003967', 'A890BEC7-DC27-4B92-90AF-05EC58C92699', 1, 1, NULL, NULL, '2024-03-09', '06:04:14', 'USD', 0);
INSERT INTO public.identificacion (version, "ambDestino", "tipoDoc", "numeroControl", "codigoGeneracion", "modFacturacion", "tipTransmicion", "tipContingencia", "motContingencia", fecha, hora, "tipMoneda", estado) VALUES (3, '00', 3, 'DTE-03-CMPV0202-000000000003995', 'B0093AF7-3309-4B8D-B839-C0EE01A359D6', 1, 1, NULL, NULL, '2024-03-09', '10:08:50', 'USD', 0);
INSERT INTO public.identificacion (version, "ambDestino", "tipoDoc", "numeroControl", "codigoGeneracion", "modFacturacion", "tipTransmicion", "tipContingencia", "motContingencia", fecha, hora, "tipMoneda", estado) VALUES (3, '00', 3, 'DTE-03-CMPV0202-000000000003965', 'B4A8EBD6-62C4-4511-8F89-7A1D8FF8F9DF', 1, 1, NULL, NULL, '2024-03-09', '06:00:49', 'USD', 0);
INSERT INTO public.identificacion (version, "ambDestino", "tipoDoc", "numeroControl", "codigoGeneracion", "modFacturacion", "tipTransmicion", "tipContingencia", "motContingencia", fecha, hora, "tipMoneda", estado) VALUES (3, '00', 3, 'DTE-03-CMPV0202-000000000003974', 'C6D0A5BA-29A2-4A46-B17B-624E8A2EABB3', 1, 1, NULL, NULL, '2024-03-09', '06:30:37', 'USD', 0);
INSERT INTO public.identificacion (version, "ambDestino", "tipoDoc", "numeroControl", "codigoGeneracion", "modFacturacion", "tipTransmicion", "tipContingencia", "motContingencia", fecha, hora, "tipMoneda", estado) VALUES (3, '00', 3, 'DTE-03-CMPV0202-000000000003968', 'D0D6C203-A842-46E4-A027-9E6B0260CCCC', 1, 1, NULL, NULL, '2024-03-09', '06:04:38', 'USD', 0);
INSERT INTO public.identificacion (version, "ambDestino", "tipoDoc", "numeroControl", "codigoGeneracion", "modFacturacion", "tipTransmicion", "tipContingencia", "motContingencia", fecha, hora, "tipMoneda", estado) VALUES (3, '00', 3, 'DTE-03-CMPV0202-000000000003979', 'D5A3E5D4-7ED8-495D-B3CF-569D8BA38F57', 1, 1, NULL, NULL, '2024-03-09', '12:25:50', 'USD', 0);
INSERT INTO public.identificacion (version, "ambDestino", "tipoDoc", "numeroControl", "codigoGeneracion", "modFacturacion", "tipTransmicion", "tipContingencia", "motContingencia", fecha, hora, "tipMoneda", estado) VALUES (3, '00', 3, 'DTE-03-CMPV0202-000000000003981', 'DD7277CF-28FA-4F15-881F-BF757119E122', 1, 1, NULL, NULL, '2024-03-09', '12:30:01', 'USD', 0);
INSERT INTO public.identificacion (version, "ambDestino", "tipoDoc", "numeroControl", "codigoGeneracion", "modFacturacion", "tipTransmicion", "tipContingencia", "motContingencia", fecha, hora, "tipMoneda", estado) VALUES (3, '00', 3, 'DTE-03-CMPV0202-000000000003977', 'DE59BC3A-3473-4994-91E6-F11DDB9746D1', 1, 1, NULL, NULL, '2024-03-09', '06:41:57', 'USD', 0);
INSERT INTO public.identificacion (version, "ambDestino", "tipoDoc", "numeroControl", "codigoGeneracion", "modFacturacion", "tipTransmicion", "tipContingencia", "motContingencia", fecha, hora, "tipMoneda", estado) VALUES (3, '00', 3, 'DTE-03-CMPV0202-000000000003969', 'E107BAD3-CAAF-445F-BF4D-CE20703FBEAB', 1, 1, NULL, NULL, '2024-03-09', '06:13:54', 'USD', 0);
INSERT INTO public.identificacion (version, "ambDestino", "tipoDoc", "numeroControl", "codigoGeneracion", "modFacturacion", "tipTransmicion", "tipContingencia", "motContingencia", fecha, hora, "tipMoneda", estado) VALUES (3, '00', 3, 'DTE-03-CMPV0202-000000000003971', 'E8572C95-53D2-4CB0-B587-AB7FA9DEF1C4', 1, 1, NULL, NULL, '2024-03-09', '06:16:03', 'USD', 0);
INSERT INTO public.identificacion (version, "ambDestino", "tipoDoc", "numeroControl", "codigoGeneracion", "modFacturacion", "tipTransmicion", "tipContingencia", "motContingencia", fecha, hora, "tipMoneda", estado) VALUES (3, '00', 3, 'DTE-03-CMPV0202-000000000003992', 'E9ABB697-938D-4924-A7E7-55C1C7E49AE0', 1, 1, NULL, NULL, '2024-03-09', '01:00:11', 'USD', 0);
INSERT INTO public.identificacion (version, "ambDestino", "tipoDoc", "numeroControl", "codigoGeneracion", "modFacturacion", "tipTransmicion", "tipContingencia", "motContingencia", fecha, hora, "tipMoneda", estado) VALUES (3, '00', 3, 'DTE-03-CMPV0202-000000000003963', 'F2A4A92E-2DFE-4AF5-831E-A30EC3E70B86', 1, 1, NULL, NULL, '2024-03-09', '05:59:35', 'USD', 0);
INSERT INTO public.identificacion (version, "ambDestino", "tipoDoc", "numeroControl", "codigoGeneracion", "modFacturacion", "tipTransmicion", "tipContingencia", "motContingencia", fecha, hora, "tipMoneda", estado) VALUES (3, '00', 3, 'DTE-03-CMPV0202-000000000003963', 'F2FF9703-9CC4-411F-91FE-39F87A3446D0', 1, 1, NULL, NULL, '2024-03-09', '05:58:55', 'USD', 0);
INSERT INTO public.identificacion (version, "ambDestino", "tipoDoc", "numeroControl", "codigoGeneracion", "modFacturacion", "tipTransmicion", "tipContingencia", "motContingencia", fecha, hora, "tipMoneda", estado) VALUES (3, '00', 3, 'DTE-03-CMPV0202-000000000003978', 'F41EC2AA-75DB-4063-BF3F-96BF20A9F0FE', 1, 1, NULL, NULL, '2024-03-08', '11:56:55', 'USD', 0);


--
-- Data for Name: otrosdocumentos; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--



--
-- Data for Name: receptor; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

INSERT INTO public.receptor (id, codigo, "tipDoc", "numDoc", nit, ncr, "NomDenominacion", "codActEco", "actEco", "nomComercial", "tipEstablecimiento", "Departamento", "Municipio", "dirComplemento", "codPais", "paisDestino", "domFiscal", "codEstable", "codPuntoVenta", "bienesRemitidos", "tipoReceptor", "telReceptor", "correoReceptor", "granContribuyente", area, "codCliCobol") VALUES (10, '16625396', '36', '01488087-8', '0203-270740-001-8', '55652-1', 'DUCH MARTINEZ JUAN', '01271', 'Cultivo de caf�', 'DUCH MARTINEZ JUAN', '02', '02', '03', 'Av. Club de Leones Nte. Chalchuapa.', '9300', '9300', NULL, '02', '02', NULL, 1, '24440185', 'sal.tato@gmail.com', 'S', 'CC', 12);
INSERT INTO public.receptor (id, codigo, "tipDoc", "numDoc", nit, ncr, "NomDenominacion", "codActEco", "actEco", "nomComercial", "tipEstablecimiento", "Departamento", "Municipio", "dirComplemento", "codPais", "paisDestino", "domFiscal", "codEstable", "codPuntoVenta", "bienesRemitidos", "tipoReceptor", "telReceptor", "correoReceptor", "granContribuyente", area, "codCliCobol") VALUES (7184, '1662539', '36', '03951200-0', '0210-030788-102-2', '00', 'DAVID ALBERTO GARCIA CARDONA', '62020', 'Consultor�as y gesti�n de servicios inform�ticos', 'DAVID ALBERTO GARCIA CARDONA', '01', '01', '02', 'Condominios santa lucia E-47 apt-21', '9300', '9300', NULL, NULL, NULL, NULL, NULL, '77899798', 'sal.tato@gmail.com', 'N', 'SG', 12);


--
-- Data for Name: receptordocumen; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

INSERT INTO public.receptordocumen ("numeroControl", "codigoGeneracion", "idReceptor", fecha, estado, destino, "cuentaArea", "cuentaVende", seriefac, serienumfac, fechaseriefact) VALUES ('DTE-03-CMPV0202-000000000003985', '02420099-5CD5-4F04-B6A3-448BAAF1B30B', '16625396', '2024-03-09', NULL, NULL, NULL, NULL, '23DS000C', '1448', '2024-02-24');
INSERT INTO public.receptordocumen ("numeroControl", "codigoGeneracion", "idReceptor", fecha, estado, destino, "cuentaArea", "cuentaVende", seriefac, serienumfac, fechaseriefact) VALUES ('DTE-03-CMPV0202-000000000003970', '0930B690-67DB-461D-A739-1A5232834D40', '16625396', '2024-03-09', '{\"Nofirmado\":{\"identificacion\":{\"version\":\"3\",\"ambiente\":\"00\",\"tipoDte\":\"03\",\"numeroControl\":\"DTE-03-CMPV0202-000000000003970\",\"codigoGeneracion\":\"0930B690-67DB-461D-A739-1A5232834D40\",\"tipoModelo\":\"1\",\"tipoOperacion\":\"1\",\"tipoContingencia\":\"\",\"fecEmi\":\"2024-03-09\",\"horEmi\":\"06:14:28\",\"tipoMoneda\":\"USD\",\"motivoContin\":\"\"},\"emisor\":{\"nit\":\"02033110660019\",\"nrc\":\"46744\",\"nombre\":\"COOPERATIVA CUZCACHAPA DE R.L\",\"codActividad\":\"01632\",\"descActividad\":\"Servicio de beneficio de caf\\u00e9\",\"nombreComercial\":\"SOCIEDAD COOPERATIVA CHALCHUAPANECA DE PRODUCTORES DE CAFE\",\"tipoEstablecimiento\":\"02\",\"telefono\":\"24527800\",\"correo\":\"cuzcachapa@cuzcachapa.com\",\"codEstable\":\"\",\"codEstableMH\":\"\",\"codPuntoVentaMH\":\"\",\"codPuntoVenta\":\"\",\"direccion\":{\"complemento\":\"CARRETERA A EL COCO, COL CUZCACHAPA CTON. GALEANO.\",\"municipio\":\"03\",\"departamento\":\"02\"}},\"documentoRelacionado\":\"\",\"receptor\":{\"nit\":\"02100307881022\",\"nrc\":\"00\",\"nombre\":\"DAVID ALBERTO GARCIA CARDONA\",\"codActividad\":\"62020\",\"descActividad\":\"Consultor\\u00edas y gesti\\u00f3n de servicios inform\\u00e1ticos\",\"nombreComercial\":\"DAVID ALBERTO GARCIA CARDONA\",\"direccion\":{\"complemento\":\"Condominios santa lucia E-47 apt-21\",\"municipio\":\"02\",\"departamento\":\"01\"},\"telefono\":\"77899798\",\"correo\":\"sal.tato@gmail.com\"},\"otrosDocumentos\":\"\",\"ventaTercero\":\"\",\"resumen\":{\"totalNoSuj\":\"0\",\"totalExenta\":\"0\",\"totalGravada\":\"0\",\"subTotalVentas\":\"0\",\"descuNoSuj\":\"0\",\"descuExenta\":\"0\",\"descuGravada\":\"0\",\"porcentajeDescuento\":\"0\",\"totalDescu\":\"0\",\"subTotal\":\"0\",\"ivaRete1\":\"0\",\"reteRenta\":\"0\",\"montoTotalOperacion\":\"26.16\",\"totalNoGravado\":\"0\",\"totalPagar\":\"26.16\",\"totalLetras\":\"CERO DOLARESS 00\\/100\",\"saldoFavor\":\"0\",\"condicionOperacion\":\"1\",\"ivaPerci1\":\"0\",\"numPagoElectronico\":\"\",\"pagos\":[{\"codigo\":\"01\",\"montoPago\":\"0\",\"referencia\":\"\",\"plazo\":\"01\",\"periodo\":\"0\"}],\"tributos\":[{\"codigo\":\"20\",\"descripcion\":\"Impuesto al Valor Agregado 13%\",\"valor\":\"26.16\"}]},\"extension\":\"\",\"apendice\":\"\"},\"firmado\":\"eyJhbGciOiJSUzUxMiJ9.ewogICJpZGVudGlmaWNhY2lvbiIgOiB7CiAgICAidmVyc2lvbiIgOiAzLAogICAgImFtYmllbnRlIiA6ICIwMCIsCiAgICAidGlwb0R0ZSIgOiAiMDMiLAogICAgIm51bWVyb0NvbnRyb2wiIDogIkRURS0wMy1DTVBWMDIwMi0wMDAwMDAwMDAwMDM5NzAiLAogICAgImNvZGlnb0dlbmVyYWNpb24iIDogIjA5MzBCNjkwLTY3REItNDYxRC1BNzM5LTFBNTIzMjgzNEQ0MCIsCiAgICAidGlwb01vZGVsbyIgOiAxLAogICAgInRpcG9PcGVyYWNpb24iIDogMSwKICAgICJ0aXBvQ29udGluZ2VuY2lhIiA6IG51bGwsCiAgICAiZmVjRW1pIiA6ICIyMDI0LTAzLTA5IiwKICAgICJob3JFbWkiIDogIjA2OjE0OjI4IiwKICAgICJ0aXBvTW9uZWRhIiA6ICJVU0QiLAogICAgIm1vdGl2b0NvbnRpbiIgOiBudWxsCiAgfSwKICAiZW1pc29yIiA6IHsKICAgICJuaXQiIDogIjAyMDMzMTEwNjYwMDE5IiwKICAgICJucmMiIDogIjQ2NzQ0IiwKICAgICJub21icmUiIDogIkNPT1BFUkFUSVZBIENVWkNBQ0hBUEEgREUgUi5MIiwKICAgICJjb2RBY3RpdmlkYWQiIDogIjAxNjMyIiwKICAgICJkZXNjQWN0aXZpZGFkIiA6ICJTZXJ2aWNpbyBkZSBiZW5lZmljaW8gZGUgY2Fmw6kiLAogICAgIm5vbWJyZUNvbWVyY2lhbCIgOiAiU09DSUVEQUQgQ09PUEVSQVRJVkEgQ0hBTENIVUFQQU5FQ0EgREUgUFJPRFVDVE9SRVMgREUgQ0FGRSIsCiAgICAidGlwb0VzdGFibGVjaW1pZW50byIgOiAiMDIiLAogICAgInRlbGVmb25vIiA6ICIyNDUyNzgwMCIsCiAgICAiY29ycmVvIiA6ICJjdXpjYWNoYXBhQGN1emNhY2hhcGEuY29tIiwKICAgICJjb2RFc3RhYmxlIiA6IG51bGwsCiAgICAiY29kRXN0YWJsZU1IIiA6IG51bGwsCiAgICAiY29kUHVudG9WZW50YU1IIiA6IG51bGwsCiAgICAiY29kUHVudG9WZW50YSIgOiBudWxsLAogICAgImRpcmVjY2lvbiIgOiB7CiAgICAgICJjb21wbGVtZW50byIgOiAiQ0FSUkVURVJBIEEgRUwgQ09DTywgQ09MIENVWkNBQ0hBUEEgQ1RPTi4gR0FMRUFOTy4iLAogICAgICAibXVuaWNpcGlvIiA6ICIwMyIsCiAgICAgICJkZXBhcnRhbWVudG8iIDogIjAyIgogICAgfQogIH0sCiAgImN1ZXJwb0RvY3VtZW50byIgOiBbIF0sCiAgImRvY3VtZW50b1JlbGFjaW9uYWRvIiA6IG51bGwsCiAgInJlY2VwdG9yIiA6IHsKICAgICJuaXQiIDogIjAyMTAwMzA3ODgxMDIyIiwKICAgICJucmMiIDogIjAwIiwKICAgICJub21icmUiIDogIkRBVklEIEFMQkVSVE8gR0FSQ0lBIENBUkRPTkEiLAogICAgImNvZEFjdGl2aWRhZCIgOiAiNjIwMjAiLAogICAgImRlc2NBY3RpdmlkYWQiIDogIkNvbnN1bHRvcsOtYXMgeSBnZXN0acOzbiBkZSBzZXJ2aWNpb3MgaW5mb3Jtw6F0aWNvcyIsCiAgICAibm9tYnJlQ29tZXJjaWFsIiA6ICJEQVZJRCBBTEJFUlRPIEdBUkNJQSBDQVJET05BIiwKICAgICJkaXJlY2Npb24iIDogewogICAgICAiY29tcGxlbWVudG8iIDogIkNvbmRvbWluaW9zIHNhbnRhIGx1Y2lhIEUtNDcgYXB0LTIxIiwKICAgICAgIm11bmljaXBpbyIgOiAiMDIiLAogICAgICAiZGVwYXJ0YW1lbnRvIiA6ICIwMSIKICAgIH0sCiAgICAidGVsZWZvbm8iIDogIjc3ODk5Nzk4IiwKICAgICJjb3JyZW8iIDogInNhbC50YXRvQGdtYWlsLmNvbSIKICB9LAogICJvdHJvc0RvY3VtZW50b3MiIDogbnVsbCwKICAidmVudGFUZXJjZXJvIiA6IG51bGwsCiAgInJlc3VtZW4iIDogewogICAgInRvdGFsTm9TdWoiIDogMCwKICAgICJ0b3RhbEV4ZW50YSIgOiAwLAogICAgInRvdGFsR3JhdmFkYSIgOiAwLAogICAgInN1YlRvdGFsVmVudGFzIiA6IDAsCiAgICAiZGVzY3VOb1N1aiIgOiAwLAogICAgImRlc2N1RXhlbnRhIiA6IDAsCiAgICAiZGVzY3VHcmF2YWRhIiA6IDAsCiAgICAicG9yY2VudGFqZURlc2N1ZW50byIgOiAwLAogICAgInRvdGFsRGVzY3UiIDogMCwKICAgICJzdWJUb3RhbCIgOiAwLAogICAgIml2YVJldGUxIiA6IDAsCiAgICAicmV0ZVJlbnRhIiA6IDAsCiAgICAibW9udG9Ub3RhbE9wZXJhY2lvbiIgOiAyNi4xNiwKICAgICJ0b3RhbE5vR3JhdmFkbyIgOiAwLAogICAgInRvdGFsUGFnYXIiIDogMjYuMTYsCiAgICAidG90YWxMZXRyYXMiIDogIkNFUk8gRE9MQVJFU1MgMDAvMTAwIiwKICAgICJzYWxkb0Zhdm9yIiA6IDAsCiAgICAiY29uZGljaW9uT3BlcmFjaW9uIiA6IDEsCiAgICAiaXZhUGVyY2kxIiA6IDAsCiAgICAibnVtUGFnb0VsZWN0cm9uaWNvIiA6ICIiLAogICAgInBhZ29zIiA6IFsgewogICAgICAiY29kaWdvIiA6ICIwMSIsCiAgICAgICJtb250b1BhZ28iIDogMCwKICAgICAgInJlZmVyZW5jaWEiIDogIiIsCiAgICAgICJwbGF6byIgOiAiMDEiLAogICAgICAicGVyaW9kbyIgOiAwCiAgICB9IF0sCiAgICAidHJpYnV0b3MiIDogWyB7CiAgICAgICJjb2RpZ28iIDogIjIwIiwKICAgICAgImRlc2NyaXBjaW9uIiA6ICJJbXB1ZXN0byBhbCBWYWxvciBBZ3JlZ2FkbyAxMyUiLAogICAgICAidmFsb3IiIDogMjYuMTYKICAgIH0gXQogIH0sCiAgImV4dGVuc2lvbiIgOiBudWxsLAogICJhcGVuZGljZSIgOiBudWxsCn0.IjJZY-tdUMFUDN0fA6OdDIBdL6FGMtB5ubEgTENOfjB4B_2noXTc4IUy2g76VTotNmvAvdzxrzsvVGPGl9_rOavlRAS0MBWAL2n0tgjX1LwfV2Ck_ElTJ5v5vkUlOfTRbfOgQeb9H0c3z3Ysvk1I4DSo9T-_KlBeCfoIMpdzsvrAh1Gwj-zify3ZnHSbrB8h0Mz48WN8EU07snFGM_pJ_tJHZFXnsqRhlKYlicQXZeHI4bE6QLYQqC_Ozzq25JcLcjozQv4dIdXull2sbJYOkDQX1ijohleL5hc4ibzEgIZeNu0mQl2Xh6l2TyTrvi36-h4GWnVjnWKEHl4-CauVYQ\"}', NULL, NULL, NULL, '23DS000C', '1448', '2024-02-24');
INSERT INTO public.receptordocumen ("numeroControl", "codigoGeneracion", "idReceptor", fecha, estado, destino, "cuentaArea", "cuentaVende", seriefac, serienumfac, fechaseriefact) VALUES ('DTE-03-CMPV0202-000000000003963', '0F9DB45F-1E98-4573-89FB-F46A322984C3', '16625396', '2024-03-09', NULL, NULL, NULL, NULL, '23DS000C', '1448', '2024-02-24');
INSERT INTO public.receptordocumen ("numeroControl", "codigoGeneracion", "idReceptor", fecha, estado, destino, "cuentaArea", "cuentaVende", seriefac, serienumfac, fechaseriefact) VALUES ('DTE-03-CMPV0202-000000000003982', '17BCBD36-49C2-4CA0-A4A7-69A3C79E3AF5', '16625396', '2024-03-09', NULL, NULL, NULL, NULL, '23DS000C', '1448', '2024-02-24');
INSERT INTO public.receptordocumen ("numeroControl", "codigoGeneracion", "idReceptor", fecha, estado, destino, "cuentaArea", "cuentaVende", seriefac, serienumfac, fechaseriefact) VALUES ('DTE-03-CMPV0202-000000000003994', '1EEACAC8-002D-49E9-8E30-253F94D8AFC0', '16625396', '2024-03-09', '{\"Nofirmado\":{\"identificacion\":{\"version\":\"3\",\"ambiente\":\"00\",\"tipoDte\":\"03\",\"numeroControl\":\"DTE-03-CMPV0202-000000000003994\",\"codigoGeneracion\":\"1EEACAC8-002D-49E9-8E30-253F94D8AFC0\",\"tipoModelo\":\"1\",\"tipoOperacion\":\"1\",\"tipoContingencia\":\"\",\"fecEmi\":\"2024-03-09\",\"horEmi\":\"01:04:15\",\"tipoMoneda\":\"USD\",\"motivoContin\":\"\"},\"emisor\":{\"nit\":\"02033110660019\",\"nrc\":\"46744\",\"nombre\":\"COOPERATIVA CUZCACHAPA DE R.L\",\"codActividad\":\"01632\",\"descActividad\":\"Servicio de beneficio de caf\\u00e9\",\"nombreComercial\":\"SOCIEDAD COOPERATIVA CHALCHUAPANECA DE PRODUCTORES DE CAFE\",\"tipoEstablecimiento\":\"02\",\"telefono\":\"24527800\",\"correo\":\"cuzcachapa@cuzcachapa.com\",\"codEstable\":\"\",\"codEstableMH\":\"\",\"codPuntoVentaMH\":\"\",\"codPuntoVenta\":\"\",\"direccion\":{\"complemento\":\"CARRETERA A EL COCO, COL CUZCACHAPA CTON. GALEANO.\",\"municipio\":\"03\",\"departamento\":\"02\"}},\"Cuerpodocumento\":[{\"numItem\":\"1\",\"tipoItem\":\"3\",\"numeroDocumento\":\"\",\"cantidad\":\"200\",\"codigo\":\"1372\",\"codTributo\":\"\",\"precioUni\":\"0.5\",\"montoDescu\":\"0\",\"uniMedida\":\"59\",\"ventaNoSuj\":\"0\",\"ventaExenta\":\"0\",\"ventaGravada\":\"100\",\"tributos\":[\"20\"],\"psv\":\"0.508407\",\"noGravado\":\"0\",\"descripcion\":\"Azucar 1\\/2 Kilo\"},{\"numItem\":\"2\",\"tipoItem\":\"3\",\"numeroDocumento\":\"\",\"cantidad\":\"40\",\"codigo\":\"1390\",\"codTributo\":\"\",\"precioUni\":\"2.48\",\"montoDescu\":\"0\",\"uniMedida\":\"59\",\"ventaNoSuj\":\"0\",\"ventaExenta\":\"0\",\"ventaGravada\":\"99.2\",\"tributos\":[\"20\"],\"psv\":\"2.488496\",\"noGravado\":\"0\",\"descripcion\":\"Azucar 2.5 Kilos\"}],\"documentoRelacionado\":\"\",\"receptor\":{\"nit\":\"02032707400018\",\"nrc\":\"556521\",\"nombre\":\"DUCH MARTINEZ JUAN\",\"codActividad\":\"01271\",\"descActividad\":\"Cultivo de caf\\u00e9\",\"nombreComercial\":\"DUCH MARTINEZ JUAN\",\"direccion\":{\"complemento\":\"Av. Club de Leones Nte. Chalchuapa.\",\"municipio\":\"03\",\"departamento\":\"02\"},\"telefono\":\"24440185\",\"correo\":\"sal.tato@gmail.com\"},\"otrosDocumentos\":\"\",\"ventaTercero\":\"\",\"resumen\":{\"totalNoSuj\":\"0\",\"totalExenta\":\"0\",\"totalGravada\":\"199.2\",\"subTotalVentas\":\"199.2\",\"descuNoSuj\":\"0\",\"descuExenta\":\"0\",\"descuGravada\":\"0\",\"porcentajeDescuento\":\"0\",\"totalDescu\":\"0\",\"subTotal\":\"199.2\",\"ivaRete1\":\"0\",\"reteRenta\":\"0\",\"montoTotalOperacion\":\"225.36\",\"totalNoGravado\":\"0\",\"totalPagar\":\"225.36\",\"totalLetras\":\"CIENTO NOVENTA Y NUEVE DOLARESS 20\\/100\",\"saldoFavor\":\"0\",\"condicionOperacion\":\"1\",\"ivaPerci1\":\"0\",\"numPagoElectronico\":\"\",\"pagos\":[{\"codigo\":\"01\",\"montoPago\":\"199.2\",\"referencia\":\"\",\"plazo\":\"01\",\"periodo\":\"\"}],\"tributos\":[{\"codigo\":\"20\",\"descripcion\":\"Impuesto al Valor Agregado 13%\",\"valor\":\"26.16\"}]},\"extension\":\"\",\"apendice\":\"\"},\"firmado\":\"eyJhbGciOiJSUzUxMiJ9.ewogICJpZGVudGlmaWNhY2lvbiIgOiB7CiAgICAidmVyc2lvbiIgOiAzLAogICAgImFtYmllbnRlIiA6ICIwMCIsCiAgICAidGlwb0R0ZSIgOiAiMDMiLAogICAgIm51bWVyb0NvbnRyb2wiIDogIkRURS0wMy1DTVBWMDIwMi0wMDAwMDAwMDAwMDM5OTQiLAogICAgImNvZGlnb0dlbmVyYWNpb24iIDogIjFFRUFDQUM4LTAwMkQtNDlFOS04RTMwLTI1M0Y5NEQ4QUZDMCIsCiAgICAidGlwb01vZGVsbyIgOiAxLAogICAgInRpcG9PcGVyYWNpb24iIDogMSwKICAgICJ0aXBvQ29udGluZ2VuY2lhIiA6IG51bGwsCiAgICAiZmVjRW1pIiA6ICIyMDI0LTAzLTA5IiwKICAgICJob3JFbWkiIDogIjAxOjA0OjE1IiwKICAgICJ0aXBvTW9uZWRhIiA6ICJVU0QiLAogICAgIm1vdGl2b0NvbnRpbiIgOiBudWxsCiAgfSwKICAiZW1pc29yIiA6IHsKICAgICJuaXQiIDogIjAyMDMzMTEwNjYwMDE5IiwKICAgICJucmMiIDogIjQ2NzQ0IiwKICAgICJub21icmUiIDogIkNPT1BFUkFUSVZBIENVWkNBQ0hBUEEgREUgUi5MIiwKICAgICJjb2RBY3RpdmlkYWQiIDogIjAxNjMyIiwKICAgICJkZXNjQWN0aXZpZGFkIiA6ICJTZXJ2aWNpbyBkZSBiZW5lZmljaW8gZGUgY2Fmw6kiLAogICAgIm5vbWJyZUNvbWVyY2lhbCIgOiAiU09DSUVEQUQgQ09PUEVSQVRJVkEgQ0hBTENIVUFQQU5FQ0EgREUgUFJPRFVDVE9SRVMgREUgQ0FGRSIsCiAgICAidGlwb0VzdGFibGVjaW1pZW50byIgOiAiMDIiLAogICAgInRlbGVmb25vIiA6ICIyNDUyNzgwMCIsCiAgICAiY29ycmVvIiA6ICJjdXpjYWNoYXBhQGN1emNhY2hhcGEuY29tIiwKICAgICJjb2RFc3RhYmxlIiA6IG51bGwsCiAgICAiY29kRXN0YWJsZU1IIiA6IG51bGwsCiAgICAiY29kUHVudG9WZW50YU1IIiA6IG51bGwsCiAgICAiY29kUHVudG9WZW50YSIgOiBudWxsLAogICAgImRpcmVjY2lvbiIgOiB7CiAgICAgICJjb21wbGVtZW50byIgOiAiQ0FSUkVURVJBIEEgRUwgQ09DTywgQ09MIENVWkNBQ0hBUEEgQ1RPTi4gR0FMRUFOTy4iLAogICAgICAibXVuaWNpcGlvIiA6ICIwMyIsCiAgICAgICJkZXBhcnRhbWVudG8iIDogIjAyIgogICAgfQogIH0sCiAgImN1ZXJwb0RvY3VtZW50byIgOiBbIHsKICAgICJudW1JdGVtIiA6IDEsCiAgICAidGlwb0l0ZW0iIDogMywKICAgICJudW1lcm9Eb2N1bWVudG8iIDogbnVsbCwKICAgICJjYW50aWRhZCIgOiAyMDAsCiAgICAiY29kaWdvIiA6ICIxMzcyIiwKICAgICJjb2RUcmlidXRvIiA6IG51bGwsCiAgICAicHJlY2lvVW5pIiA6IDAuNSwKICAgICJtb250b0Rlc2N1IiA6IDAsCiAgICAidW5pTWVkaWRhIiA6IDU5LAogICAgInZlbnRhTm9TdWoiIDogMCwKICAgICJ2ZW50YUV4ZW50YSIgOiAwLAogICAgInZlbnRhR3JhdmFkYSIgOiAxMDAsCiAgICAidHJpYnV0b3MiIDogWyAiMjAiIF0sCiAgICAicHN2IiA6IDAuNTA4NDA3LAogICAgIm5vR3JhdmFkbyIgOiAwLAogICAgImRlc2NyaXBjaW9uIiA6ICJBenVjYXIgMS8yIEtpbG8iCiAgfSwgewogICAgIm51bUl0ZW0iIDogMiwKICAgICJ0aXBvSXRlbSIgOiAzLAogICAgIm51bWVyb0RvY3VtZW50byIgOiBudWxsLAogICAgImNhbnRpZGFkIiA6IDQwLAogICAgImNvZGlnbyIgOiAiMTM5MCIsCiAgICAiY29kVHJpYnV0byIgOiBudWxsLAogICAgInByZWNpb1VuaSIgOiAyLjQ4LAogICAgIm1vbnRvRGVzY3UiIDogMCwKICAgICJ1bmlNZWRpZGEiIDogNTksCiAgICAidmVudGFOb1N1aiIgOiAwLAogICAgInZlbnRhRXhlbnRhIiA6IDAsCiAgICAidmVudGFHcmF2YWRhIiA6IDk5LjIsCiAgICAidHJpYnV0b3MiIDogWyAiMjAiIF0sCiAgICAicHN2IiA6IDIuNDg4NDk2LAogICAgIm5vR3JhdmFkbyIgOiAwLAogICAgImRlc2NyaXBjaW9uIiA6ICJBenVjYXIgMi41IEtpbG9zIgogIH0gXSwKICAiZG9jdW1lbnRvUmVsYWNpb25hZG8iIDogbnVsbCwKICAicmVjZXB0b3IiIDogewogICAgIm5pdCIgOiAiMDIwMzI3MDc0MDAwMTgiLAogICAgIm5yYyIgOiAiNTU2NTIxIiwKICAgICJub21icmUiIDogIkRVQ0ggTUFSVElORVogSlVBTiIsCiAgICAiY29kQWN0aXZpZGFkIiA6ICIwMTI3MSIsCiAgICAiZGVzY0FjdGl2aWRhZCIgOiAiQ3VsdGl2byBkZSBjYWbDqSIsCiAgICAibm9tYnJlQ29tZXJjaWFsIiA6ICJEVUNIIE1BUlRJTkVaIEpVQU4iLAogICAgImRpcmVjY2lvbiIgOiB7CiAgICAgICJjb21wbGVtZW50byIgOiAiQXYuIENsdWIgZGUgTGVvbmVzIE50ZS4gQ2hhbGNodWFwYS4iLAogICAgICAibXVuaWNpcGlvIiA6ICIwMyIsCiAgICAgICJkZXBhcnRhbWVudG8iIDogIjAyIgogICAgfSwKICAgICJ0ZWxlZm9ubyIgOiAiMjQ0NDAxODUiLAogICAgImNvcnJlbyIgOiAic2FsLnRhdG9AZ21haWwuY29tIgogIH0sCiAgIm90cm9zRG9jdW1lbnRvcyIgOiBudWxsLAogICJ2ZW50YVRlcmNlcm8iIDogbnVsbCwKICAicmVzdW1lbiIgOiB7CiAgICAidG90YWxOb1N1aiIgOiAwLAogICAgInRvdGFsRXhlbnRhIiA6IDAsCiAgICAidG90YWxHcmF2YWRhIiA6IDE5OS4yLAogICAgInN1YlRvdGFsVmVudGFzIiA6IDE5OS4yLAogICAgImRlc2N1Tm9TdWoiIDogMCwKICAgICJkZXNjdUV4ZW50YSIgOiAwLAogICAgImRlc2N1R3JhdmFkYSIgOiAwLAogICAgInBvcmNlbnRhamVEZXNjdWVudG8iIDogMCwKICAgICJ0b3RhbERlc2N1IiA6IDAsCiAgICAic3ViVG90YWwiIDogMTk5LjIsCiAgICAiaXZhUmV0ZTEiIDogMCwKICAgICJyZXRlUmVudGEiIDogMCwKICAgICJtb250b1RvdGFsT3BlcmFjaW9uIiA6IDIyNS4zNiwKICAgICJ0b3RhbE5vR3JhdmFkbyIgOiAwLAogICAgInRvdGFsUGFnYXIiIDogMjI1LjM2LAogICAgInRvdGFsTGV0cmFzIiA6ICJDSUVOVE8gTk9WRU5UQSBZIE5VRVZFIERPTEFSRVNTIDIwLzEwMCIsCiAgICAic2FsZG9GYXZvciIgOiAwLAogICAgImNvbmRpY2lvbk9wZXJhY2lvbiIgOiAxLAogICAgIml2YVBlcmNpMSIgOiAwLAogICAgIm51bVBhZ29FbGVjdHJvbmljbyIgOiAiIiwKICAgICJwYWdvcyIgOiBbIHsKICAgICAgImNvZGlnbyIgOiAiMDEiLAogICAgICAibW9udG9QYWdvIiA6IDE5OS4yLAogICAgICAicmVmZXJlbmNpYSIgOiAiIiwKICAgICAgInBsYXpvIiA6ICIwMSIsCiAgICAgICJwZXJpb2RvIiA6IG51bGwKICAgIH0gXSwKICAgICJ0cmlidXRvcyIgOiBbIHsKICAgICAgImNvZGlnbyIgOiAiMjAiLAogICAgICAiZGVzY3JpcGNpb24iIDogIkltcHVlc3RvIGFsIFZhbG9yIEFncmVnYWRvIDEzJSIsCiAgICAgICJ2YWxvciIgOiAyNi4xNgogICAgfSBdCiAgfSwKICAiZXh0ZW5zaW9uIiA6IG51bGwsCiAgImFwZW5kaWNlIiA6IG51bGwKfQ.e2qnQZDNVMZ1z_iJTttBVW5ZplR6ewrl-gwKbK2PilaN2UNhMovGx-JtlSVlrZPO-vJ9CqN7Lz8AidAdI1NWznJ8Ay81x1uuYQYn1cT0vcHLQPJFNenrF3SxgEWtOc0H_DThLwNtlZ1zYjU_6O8ZsfL28zex08tidud6m-BxZk6OVvnYt5YxFTjL--byn92K-tr6hCB2X2zV6tk7mrHNjFweQYRb0aHh6jlNtnOk7SMzj-pPgzh6y9C6yHu7sYoRqXjGRSS2TpbWZhVyostzXxlRHpNEbWYBTfIC4tNRRhCs02JpZ7asNMPFSxCFZ--YGzgKMUWQ2QmfpTphnitGNg\"}', NULL, NULL, NULL, '23DS000C', '1448', '2024-02-24');
INSERT INTO public.receptordocumen ("numeroControl", "codigoGeneracion", "idReceptor", fecha, estado, destino, "cuentaArea", "cuentaVende", seriefac, serienumfac, fechaseriefact) VALUES ('DTE-03-CMPV0202-000000000003966', '29174571-7067-498C-AE55-42E3A8B6BCFB', '16625396', '2024-03-09', NULL, NULL, NULL, NULL, '23DS000C', '1448', '2024-02-24');
INSERT INTO public.receptordocumen ("numeroControl", "codigoGeneracion", "idReceptor", fecha, estado, destino, "cuentaArea", "cuentaVende", seriefac, serienumfac, fechaseriefact) VALUES ('DTE-03-CMPV0202-000000000003964', '2BC21107-E05D-4F87-A49C-77A444871C49', '16625396', '2024-03-09', NULL, NULL, NULL, NULL, '23DS000C', '1448', '2024-02-24');
INSERT INTO public.receptordocumen ("numeroControl", "codigoGeneracion", "idReceptor", fecha, estado, destino, "cuentaArea", "cuentaVende", seriefac, serienumfac, fechaseriefact) VALUES ('DTE-03-CMPV0202-000000000003983', '2D6B3A42-6375-4BB1-8162-65AB0DBCC585', '16625396', '2024-03-09', NULL, NULL, NULL, NULL, '23DS000C', '1448', '2024-02-24');
INSERT INTO public.receptordocumen ("numeroControl", "codigoGeneracion", "idReceptor", fecha, estado, destino, "cuentaArea", "cuentaVende", seriefac, serienumfac, fechaseriefact) VALUES ('DTE-01-CMPV0202-000000000003996', '311DAD68-3A4D-47CF-9DB8-C3C10BB3ABBE', '5222', '2024-04-04', NULL, '{\"destino\":\"\",\"direccionCli\":null}', '0', '0000000', NULL, NULL, NULL);
INSERT INTO public.receptordocumen ("numeroControl", "codigoGeneracion", "idReceptor", fecha, estado, destino, "cuentaArea", "cuentaVende", seriefac, serienumfac, fechaseriefact) VALUES ('DTE-01-CMPV0202-000000000003997', '36E46640-3A5D-4607-A788-ECF3E7B8B258', '5222', '2024-04-04', NULL, '{\"destino\":\"\",\"direccionCli\":null}', '1110102', '0000000', NULL, NULL, NULL);
INSERT INTO public.receptordocumen ("numeroControl", "codigoGeneracion", "idReceptor", fecha, estado, destino, "cuentaArea", "cuentaVende", seriefac, serienumfac, fechaseriefact) VALUES ('DTE-01-CMPV0202-000000000004000', '3F1916EB-FE41-437D-95FD-B29680D0237B', '5222', '2024-04-04', NULL, '{\"destino\":\"\",\"direccionCli\":null}', '01011011400', '0000000', NULL, NULL, NULL);
INSERT INTO public.receptordocumen ("numeroControl", "codigoGeneracion", "idReceptor", fecha, estado, destino, "cuentaArea", "cuentaVende", seriefac, serienumfac, fechaseriefact) VALUES ('DTE-03-CMPV0202-000000000003963', '4058E0A5-E11E-4981-8DBD-A00F1BAEBEC7', '16625396', '2024-03-09', NULL, NULL, NULL, NULL, '23DS000C', '1448', '2024-02-24');
INSERT INTO public.receptordocumen ("numeroControl", "codigoGeneracion", "idReceptor", fecha, estado, destino, "cuentaArea", "cuentaVende", seriefac, serienumfac, fechaseriefact) VALUES ('DTE-03-CMPV0202-000000000003986', '43AA7CEF-B070-46F6-89A0-18FEC495CCA8', '16625396', '2024-03-09', NULL, NULL, NULL, NULL, '23DS000C', '1448', '2024-02-24');
INSERT INTO public.receptordocumen ("numeroControl", "codigoGeneracion", "idReceptor", fecha, estado, destino, "cuentaArea", "cuentaVende", seriefac, serienumfac, fechaseriefact) VALUES ('DTE-03-CMPV0202-000000000003984', '564B591C-2DA3-4204-A595-D9A740883E11', '16625396', '2024-03-09', NULL, NULL, NULL, NULL, '23DS000C', '1448', '2024-02-24');
INSERT INTO public.receptordocumen ("numeroControl", "codigoGeneracion", "idReceptor", fecha, estado, destino, "cuentaArea", "cuentaVende", seriefac, serienumfac, fechaseriefact) VALUES ('DTE-03-CMPV0202-000000000003991', '584F066E-5FA3-4AEC-80FB-926901353051', '16625396', '2024-03-09', NULL, NULL, NULL, NULL, '23DS000C', '1448', '2024-02-24');
INSERT INTO public.receptordocumen ("numeroControl", "codigoGeneracion", "idReceptor", fecha, estado, destino, "cuentaArea", "cuentaVende", seriefac, serienumfac, fechaseriefact) VALUES ('DTE-03-CMPV0202-000000000003987', '5D61675C-260E-44FD-A3BA-57805A5DA2D2', '16625396', '2024-03-09', NULL, NULL, NULL, NULL, '23DS000C', '1448', '2024-02-24');
INSERT INTO public.receptordocumen ("numeroControl", "codigoGeneracion", "idReceptor", fecha, estado, destino, "cuentaArea", "cuentaVende", seriefac, serienumfac, fechaseriefact) VALUES ('DTE-03-CMPV0202-000000000003973', '6438505D-BE64-46CC-A7A7-120DDC80B6FF', '16625396', '2024-03-09', NULL, NULL, NULL, NULL, '23DS000C', '1448', '2024-02-24');
INSERT INTO public.receptordocumen ("numeroControl", "codigoGeneracion", "idReceptor", fecha, estado, destino, "cuentaArea", "cuentaVende", seriefac, serienumfac, fechaseriefact) VALUES ('DTE-03-CMPV0202-000000000003988', '6EB3F012-7404-46C4-908A-6F5175D8CE02', '16625396', '2024-03-09', NULL, NULL, NULL, NULL, '23DS000C', '1448', '2024-02-24');
INSERT INTO public.receptordocumen ("numeroControl", "codigoGeneracion", "idReceptor", fecha, estado, destino, "cuentaArea", "cuentaVende", seriefac, serienumfac, fechaseriefact) VALUES ('DTE-01-CMPV0202-000000000003998', '752239A4-5DB8-465D-8C6E-13123DAF86DB', '5222', '2024-04-04', NULL, '{\"destino\":\"\",\"direccionCli\":null}', '0', '0000000', NULL, NULL, NULL);
INSERT INTO public.receptordocumen ("numeroControl", "codigoGeneracion", "idReceptor", fecha, estado, destino, "cuentaArea", "cuentaVende", seriefac, serienumfac, fechaseriefact) VALUES ('DTE-03-CMPV0202-000000000003975', '7AEE2981-DB26-400B-A33C-755C42E06986', '16625396', '2024-03-09', NULL, NULL, NULL, NULL, '23DS000C', '1448', '2024-02-24');
INSERT INTO public.receptordocumen ("numeroControl", "codigoGeneracion", "idReceptor", fecha, estado, destino, "cuentaArea", "cuentaVende", seriefac, serienumfac, fechaseriefact) VALUES ('DTE-03-CMPV0202-000000000003990', '8A74DCB8-B243-4C27-9F97-125584B4B103', '16625396', '2024-03-09', NULL, NULL, NULL, NULL, '23DS000C', '1448', '2024-02-24');
INSERT INTO public.receptordocumen ("numeroControl", "codigoGeneracion", "idReceptor", fecha, estado, destino, "cuentaArea", "cuentaVende", seriefac, serienumfac, fechaseriefact) VALUES ('DTE-03-CMPV0202-000000000003993', '8C38260B-247F-4A78-B83F-2B76CDA85224', '16625396', '2024-03-09', '{\"Nofirmado\":{\"identificacion\":{\"version\":\"3\",\"ambiente\":\"00\",\"tipoDte\":\"03\",\"numeroControl\":\"DTE-03-CMPV0202-000000000003993\",\"codigoGeneracion\":\"8C38260B-247F-4A78-B83F-2B76CDA85224\",\"tipoModelo\":\"1\",\"tipoOperacion\":\"1\",\"tipoContingencia\":\"\",\"fecEmi\":\"2024-03-09\",\"horEmi\":\"01:03:42\",\"tipoMoneda\":\"USD\",\"motivoContin\":\"\"},\"emisor\":{\"nit\":\"02033110660019\",\"nrc\":\"46744\",\"nombre\":\"COOPERATIVA CUZCACHAPA DE R.L\",\"codActividad\":\"01632\",\"descActividad\":\"Servicio de beneficio de caf\\u00e9\",\"nombreComercial\":\"SOCIEDAD COOPERATIVA CHALCHUAPANECA DE PRODUCTORES DE CAFE\",\"tipoEstablecimiento\":\"02\",\"telefono\":\"24527800\",\"correo\":\"cuzcachapa@cuzcachapa.com\",\"codEstable\":\"\",\"codEstableMH\":\"\",\"codPuntoVentaMH\":\"\",\"codPuntoVenta\":\"\",\"direccion\":{\"complemento\":\"CARRETERA A EL COCO, COL CUZCACHAPA CTON. GALEANO.\",\"municipio\":\"03\",\"departamento\":\"02\"}},\"Cuerpodocumento\":[{\"numItem\":\"1\",\"tipoItem\":\"3\",\"numeroDocumento\":\"\",\"cantidad\":\"200\",\"codigo\":\"1372\",\"codTributo\":\"\",\"precioUni\":\"0.5\",\"montoDescu\":\"0\",\"uniMedida\":\"59\",\"ventaNoSuj\":\"0\",\"ventaExenta\":\"0\",\"ventaGravada\":\"100\",\"tributos\":[\"20\"],\"psv\":\"0.508407\",\"noGravado\":\"0\",\"descripcion\":\"Azucar 1\\/2 Kilo\"},{\"numItem\":\"2\",\"tipoItem\":\"3\",\"numeroDocumento\":\"\",\"cantidad\":\"40\",\"codigo\":\"1390\",\"codTributo\":\"\",\"precioUni\":\"2.48\",\"montoDescu\":\"0\",\"uniMedida\":\"59\",\"ventaNoSuj\":\"0\",\"ventaExenta\":\"0\",\"ventaGravada\":\"99.2\",\"tributos\":[\"20\"],\"psv\":\"2.488496\",\"noGravado\":\"0\",\"descripcion\":\"Azucar 2.5 Kilos\"}],\"documentoRelacionado\":\"\",\"receptor\":{\"nit\":\"02032707400018\",\"nrc\":\"556521\",\"nombre\":\"DUCH MARTINEZ JUAN\",\"codActividad\":\"01271\",\"descActividad\":\"Cultivo de caf\\u00e9\",\"nombreComercial\":\"DUCH MARTINEZ JUAN\",\"direccion\":{\"complemento\":\"Av. Club de Leones Nte. Chalchuapa.\",\"municipio\":\"03\",\"departamento\":\"02\"},\"telefono\":\"24440185\",\"correo\":\"sal.tato@gmail.com\"},\"otrosDocumentos\":\"\",\"ventaTercero\":\"\",\"resumen\":{\"totalNoSuj\":\"0\",\"totalExenta\":\"0\",\"totalGravada\":\"199.2\",\"subTotalVentas\":\"199.2\",\"descuNoSuj\":\"0\",\"descuExenta\":\"0\",\"descuGravada\":\"0\",\"porcentajeDescuento\":\"0\",\"totalDescu\":\"0\",\"subTotal\":\"199.2\",\"ivaRete1\":\"0\",\"reteRenta\":\"0\",\"montoTotalOperacion\":\"225.36\",\"totalNoGravado\":\"0\",\"totalPagar\":\"225.36\",\"totalLetras\":\"CIENTO NOVENTA Y NUEVE DOLARESS 20\\/100\",\"saldoFavor\":\"0\",\"condicionOperacion\":\"1\",\"ivaPerci1\":\"0\",\"numPagoElectronico\":\"\",\"pagos\":[{\"codigo\":\"01\",\"montoPago\":\"199.2\",\"referencia\":\"\",\"plazo\":\"01\",\"periodo\":\"\"}],\"tributos\":[{\"codigo\":\"20\",\"descripcion\":\"Impuesto al Valor Agregado 13%\",\"valor\":\"26.16\"}]},\"extension\":\"\",\"apendice\":\"\"},\"firmado\":\"eyJhbGciOiJSUzUxMiJ9.ewogICJpZGVudGlmaWNhY2lvbiIgOiB7CiAgICAidmVyc2lvbiIgOiAzLAogICAgImFtYmllbnRlIiA6ICIwMCIsCiAgICAidGlwb0R0ZSIgOiAiMDMiLAogICAgIm51bWVyb0NvbnRyb2wiIDogIkRURS0wMy1DTVBWMDIwMi0wMDAwMDAwMDAwMDM5OTMiLAogICAgImNvZGlnb0dlbmVyYWNpb24iIDogIjhDMzgyNjBCLTI0N0YtNEE3OC1CODNGLTJCNzZDREE4NTIyNCIsCiAgICAidGlwb01vZGVsbyIgOiAxLAogICAgInRpcG9PcGVyYWNpb24iIDogMSwKICAgICJ0aXBvQ29udGluZ2VuY2lhIiA6IG51bGwsCiAgICAiZmVjRW1pIiA6ICIyMDI0LTAzLTA5IiwKICAgICJob3JFbWkiIDogIjAxOjAzOjQyIiwKICAgICJ0aXBvTW9uZWRhIiA6ICJVU0QiLAogICAgIm1vdGl2b0NvbnRpbiIgOiBudWxsCiAgfSwKICAiZW1pc29yIiA6IHsKICAgICJuaXQiIDogIjAyMDMzMTEwNjYwMDE5IiwKICAgICJucmMiIDogIjQ2NzQ0IiwKICAgICJub21icmUiIDogIkNPT1BFUkFUSVZBIENVWkNBQ0hBUEEgREUgUi5MIiwKICAgICJjb2RBY3RpdmlkYWQiIDogIjAxNjMyIiwKICAgICJkZXNjQWN0aXZpZGFkIiA6ICJTZXJ2aWNpbyBkZSBiZW5lZmljaW8gZGUgY2Fmw6kiLAogICAgIm5vbWJyZUNvbWVyY2lhbCIgOiAiU09DSUVEQUQgQ09PUEVSQVRJVkEgQ0hBTENIVUFQQU5FQ0EgREUgUFJPRFVDVE9SRVMgREUgQ0FGRSIsCiAgICAidGlwb0VzdGFibGVjaW1pZW50byIgOiAiMDIiLAogICAgInRlbGVmb25vIiA6ICIyNDUyNzgwMCIsCiAgICAiY29ycmVvIiA6ICJjdXpjYWNoYXBhQGN1emNhY2hhcGEuY29tIiwKICAgICJjb2RFc3RhYmxlIiA6IG51bGwsCiAgICAiY29kRXN0YWJsZU1IIiA6IG51bGwsCiAgICAiY29kUHVudG9WZW50YU1IIiA6IG51bGwsCiAgICAiY29kUHVudG9WZW50YSIgOiBudWxsLAogICAgImRpcmVjY2lvbiIgOiB7CiAgICAgICJjb21wbGVtZW50byIgOiAiQ0FSUkVURVJBIEEgRUwgQ09DTywgQ09MIENVWkNBQ0hBUEEgQ1RPTi4gR0FMRUFOTy4iLAogICAgICAibXVuaWNpcGlvIiA6ICIwMyIsCiAgICAgICJkZXBhcnRhbWVudG8iIDogIjAyIgogICAgfQogIH0sCiAgImN1ZXJwb0RvY3VtZW50byIgOiBbIHsKICAgICJudW1JdGVtIiA6IDEsCiAgICAidGlwb0l0ZW0iIDogMywKICAgICJudW1lcm9Eb2N1bWVudG8iIDogbnVsbCwKICAgICJjYW50aWRhZCIgOiAyMDAsCiAgICAiY29kaWdvIiA6ICIxMzcyIiwKICAgICJjb2RUcmlidXRvIiA6IG51bGwsCiAgICAicHJlY2lvVW5pIiA6IDAuNSwKICAgICJtb250b0Rlc2N1IiA6IDAsCiAgICAidW5pTWVkaWRhIiA6IDU5LAogICAgInZlbnRhTm9TdWoiIDogMCwKICAgICJ2ZW50YUV4ZW50YSIgOiAwLAogICAgInZlbnRhR3JhdmFkYSIgOiAxMDAsCiAgICAidHJpYnV0b3MiIDogWyAiMjAiIF0sCiAgICAicHN2IiA6IDAuNTA4NDA3LAogICAgIm5vR3JhdmFkbyIgOiAwLAogICAgImRlc2NyaXBjaW9uIiA6ICJBenVjYXIgMS8yIEtpbG8iCiAgfSwgewogICAgIm51bUl0ZW0iIDogMiwKICAgICJ0aXBvSXRlbSIgOiAzLAogICAgIm51bWVyb0RvY3VtZW50byIgOiBudWxsLAogICAgImNhbnRpZGFkIiA6IDQwLAogICAgImNvZGlnbyIgOiAiMTM5MCIsCiAgICAiY29kVHJpYnV0byIgOiBudWxsLAogICAgInByZWNpb1VuaSIgOiAyLjQ4LAogICAgIm1vbnRvRGVzY3UiIDogMCwKICAgICJ1bmlNZWRpZGEiIDogNTksCiAgICAidmVudGFOb1N1aiIgOiAwLAogICAgInZlbnRhRXhlbnRhIiA6IDAsCiAgICAidmVudGFHcmF2YWRhIiA6IDk5LjIsCiAgICAidHJpYnV0b3MiIDogWyAiMjAiIF0sCiAgICAicHN2IiA6IDIuNDg4NDk2LAogICAgIm5vR3JhdmFkbyIgOiAwLAogICAgImRlc2NyaXBjaW9uIiA6ICJBenVjYXIgMi41IEtpbG9zIgogIH0gXSwKICAiZG9jdW1lbnRvUmVsYWNpb25hZG8iIDogbnVsbCwKICAicmVjZXB0b3IiIDogewogICAgIm5pdCIgOiAiMDIwMzI3MDc0MDAwMTgiLAogICAgIm5yYyIgOiAiNTU2NTIxIiwKICAgICJub21icmUiIDogIkRVQ0ggTUFSVElORVogSlVBTiIsCiAgICAiY29kQWN0aXZpZGFkIiA6ICIwMTI3MSIsCiAgICAiZGVzY0FjdGl2aWRhZCIgOiAiQ3VsdGl2byBkZSBjYWbDqSIsCiAgICAibm9tYnJlQ29tZXJjaWFsIiA6ICJEVUNIIE1BUlRJTkVaIEpVQU4iLAogICAgImRpcmVjY2lvbiIgOiB7CiAgICAgICJjb21wbGVtZW50byIgOiAiQXYuIENsdWIgZGUgTGVvbmVzIE50ZS4gQ2hhbGNodWFwYS4iLAogICAgICAibXVuaWNpcGlvIiA6ICIwMyIsCiAgICAgICJkZXBhcnRhbWVudG8iIDogIjAyIgogICAgfSwKICAgICJ0ZWxlZm9ubyIgOiAiMjQ0NDAxODUiLAogICAgImNvcnJlbyIgOiAic2FsLnRhdG9AZ21haWwuY29tIgogIH0sCiAgIm90cm9zRG9jdW1lbnRvcyIgOiBudWxsLAogICJ2ZW50YVRlcmNlcm8iIDogbnVsbCwKICAicmVzdW1lbiIgOiB7CiAgICAidG90YWxOb1N1aiIgOiAwLAogICAgInRvdGFsRXhlbnRhIiA6IDAsCiAgICAidG90YWxHcmF2YWRhIiA6IDE5OS4yLAogICAgInN1YlRvdGFsVmVudGFzIiA6IDE5OS4yLAogICAgImRlc2N1Tm9TdWoiIDogMCwKICAgICJkZXNjdUV4ZW50YSIgOiAwLAogICAgImRlc2N1R3JhdmFkYSIgOiAwLAogICAgInBvcmNlbnRhamVEZXNjdWVudG8iIDogMCwKICAgICJ0b3RhbERlc2N1IiA6IDAsCiAgICAic3ViVG90YWwiIDogMTk5LjIsCiAgICAiaXZhUmV0ZTEiIDogMCwKICAgICJyZXRlUmVudGEiIDogMCwKICAgICJtb250b1RvdGFsT3BlcmFjaW9uIiA6IDIyNS4zNiwKICAgICJ0b3RhbE5vR3JhdmFkbyIgOiAwLAogICAgInRvdGFsUGFnYXIiIDogMjI1LjM2LAogICAgInRvdGFsTGV0cmFzIiA6ICJDSUVOVE8gTk9WRU5UQSBZIE5VRVZFIERPTEFSRVNTIDIwLzEwMCIsCiAgICAic2FsZG9GYXZvciIgOiAwLAogICAgImNvbmRpY2lvbk9wZXJhY2lvbiIgOiAxLAogICAgIml2YVBlcmNpMSIgOiAwLAogICAgIm51bVBhZ29FbGVjdHJvbmljbyIgOiAiIiwKICAgICJwYWdvcyIgOiBbIHsKICAgICAgImNvZGlnbyIgOiAiMDEiLAogICAgICAibW9udG9QYWdvIiA6IDE5OS4yLAogICAgICAicmVmZXJlbmNpYSIgOiAiIiwKICAgICAgInBsYXpvIiA6ICIwMSIsCiAgICAgICJwZXJpb2RvIiA6IG51bGwKICAgIH0gXSwKICAgICJ0cmlidXRvcyIgOiBbIHsKICAgICAgImNvZGlnbyIgOiAiMjAiLAogICAgICAiZGVzY3JpcGNpb24iIDogIkltcHVlc3RvIGFsIFZhbG9yIEFncmVnYWRvIDEzJSIsCiAgICAgICJ2YWxvciIgOiAyNi4xNgogICAgfSBdCiAgfSwKICAiZXh0ZW5zaW9uIiA6IG51bGwsCiAgImFwZW5kaWNlIiA6IG51bGwKfQ.fm9DidEJCpBXdIQ5FCbWL6dLURtrlMHAD2SNwdnwCsapxFEDj449VB3POg26mlP5g8EroKV6vstOkWUTeOasS1VO8Mh0sw4LrG8do7iQCGyVZBKwFEAp-B13h-Zn1dqKQdvYAIKsAIHFLq7j_C7e2hy3SZCvztd_X1b4y6kE2v1JJ1M4rofaTwbEOnE8FwRo5lMyzvm2m7IzeQ2zkvvNafu0dLkSQG2C-r4PK0hbjb3G6a6m52Ut66P0ZSQG6Adab3QUMW_at0-kSpr33Gcb2TXm27mZXhTr_6kyDsYNP6owBwsqChaQbnOYUgVUtUm3DMYuoD_fkDPHlmRmw4pmLA\"}', NULL, NULL, NULL, '23DS000C', '1448', '2024-02-24');
INSERT INTO public.receptordocumen ("numeroControl", "codigoGeneracion", "idReceptor", fecha, estado, destino, "cuentaArea", "cuentaVende", seriefac, serienumfac, fechaseriefact) VALUES ('DTE-03-CMPV0202-000000000003980', '8EB51F9E-662A-44F2-B5FA-0A0ECB940995', '16625396', '2024-03-09', NULL, NULL, NULL, NULL, '23DS000C', '1448', '2024-02-24');
INSERT INTO public.receptordocumen ("numeroControl", "codigoGeneracion", "idReceptor", fecha, estado, destino, "cuentaArea", "cuentaVende", seriefac, serienumfac, fechaseriefact) VALUES ('DTE-03-CMPV0202-000000000003976', '94410371-3B92-46DC-8D4B-5552A0F05122', '16625396', '2024-03-09', NULL, NULL, NULL, NULL, '23DS000C', '1448', '2024-02-24');
INSERT INTO public.receptordocumen ("numeroControl", "codigoGeneracion", "idReceptor", fecha, estado, destino, "cuentaArea", "cuentaVende", seriefac, serienumfac, fechaseriefact) VALUES ('DTE-03-CMPV0202-000000000003989', '9E76C69B-6AF3-41F0-A4BE-8C21E52D7CEB', '16625396', '2024-03-09', NULL, NULL, NULL, NULL, '23DS000C', '1448', '2024-02-24');
INSERT INTO public.receptordocumen ("numeroControl", "codigoGeneracion", "idReceptor", fecha, estado, destino, "cuentaArea", "cuentaVende", seriefac, serienumfac, fechaseriefact) VALUES ('DTE-03-CMPV0202-000000000003972', '9FB0D8F8-2818-4A41-B0D0-6171273B53E9', '16625396', '2024-03-09', '{\"Nofirmado\":{\"identificacion\":{\"version\":\"3\",\"ambiente\":\"00\",\"tipoDte\":\"03\",\"numeroControl\":\"DTE-03-CMPV0202-000000000003972\",\"codigoGeneracion\":\"9FB0D8F8-2818-4A41-B0D0-6171273B53E9\",\"tipoModelo\":\"1\",\"tipoOperacion\":\"1\",\"tipoContingencia\":\"\",\"fecEmi\":\"2024-03-09\",\"horEmi\":\"06:16:34\",\"tipoMoneda\":\"USD\",\"motivoContin\":\"\"},\"emisor\":{\"nit\":\"02033110660019\",\"nrc\":\"46744\",\"nombre\":\"COOPERATIVA CUZCACHAPA DE R.L\",\"codActividad\":\"01632\",\"descActividad\":\"Servicio de beneficio de caf\\u00e9\",\"nombreComercial\":\"SOCIEDAD COOPERATIVA CHALCHUAPANECA DE PRODUCTORES DE CAFE\",\"tipoEstablecimiento\":\"02\",\"telefono\":\"24527800\",\"correo\":\"cuzcachapa@cuzcachapa.com\",\"codEstable\":\"\",\"codEstableMH\":\"\",\"codPuntoVentaMH\":\"\",\"codPuntoVenta\":\"\",\"direccion\":{\"complemento\":\"CARRETERA A EL COCO, COL CUZCACHAPA CTON. GALEANO.\",\"municipio\":\"03\",\"departamento\":\"02\"}},\"documentoRelacionado\":\"\",\"receptor\":{\"nit\":\"02100307881022\",\"nrc\":\"00\",\"nombre\":\"DAVID ALBERTO GARCIA CARDONA\",\"codActividad\":\"62020\",\"descActividad\":\"Consultor\\u00edas y gesti\\u00f3n de servicios inform\\u00e1ticos\",\"nombreComercial\":\"DAVID ALBERTO GARCIA CARDONA\",\"direccion\":{\"complemento\":\"Condominios santa lucia E-47 apt-21\",\"municipio\":\"02\",\"departamento\":\"01\"},\"telefono\":\"77899798\",\"correo\":\"sal.tato@gmail.com\"},\"otrosDocumentos\":\"\",\"ventaTercero\":\"\",\"resumen\":{\"totalNoSuj\":\"0\",\"totalExenta\":\"0\",\"totalGravada\":\"0\",\"subTotalVentas\":\"0\",\"descuNoSuj\":\"0\",\"descuExenta\":\"0\",\"descuGravada\":\"0\",\"porcentajeDescuento\":\"0\",\"totalDescu\":\"0\",\"subTotal\":\"0\",\"ivaRete1\":\"0\",\"reteRenta\":\"0\",\"montoTotalOperacion\":\"26.16\",\"totalNoGravado\":\"0\",\"totalPagar\":\"26.16\",\"totalLetras\":\"CERO DOLARESS 00\\/100\",\"saldoFavor\":\"0\",\"condicionOperacion\":\"1\",\"ivaPerci1\":\"0\",\"numPagoElectronico\":\"\",\"pagos\":[{\"codigo\":\"01\",\"montoPago\":\"0\",\"referencia\":\"\",\"plazo\":\"01\",\"periodo\":\"0\"}],\"tributos\":[{\"codigo\":\"20\",\"descripcion\":\"Impuesto al Valor Agregado 13%\",\"valor\":\"26.16\"}]},\"extension\":\"\",\"apendice\":\"\"},\"firmado\":\"eyJhbGciOiJSUzUxMiJ9.ewogICJpZGVudGlmaWNhY2lvbiIgOiB7CiAgICAidmVyc2lvbiIgOiAzLAogICAgImFtYmllbnRlIiA6ICIwMCIsCiAgICAidGlwb0R0ZSIgOiAiMDMiLAogICAgIm51bWVyb0NvbnRyb2wiIDogIkRURS0wMy1DTVBWMDIwMi0wMDAwMDAwMDAwMDM5NzIiLAogICAgImNvZGlnb0dlbmVyYWNpb24iIDogIjlGQjBEOEY4LTI4MTgtNEE0MS1CMEQwLTYxNzEyNzNCNTNFOSIsCiAgICAidGlwb01vZGVsbyIgOiAxLAogICAgInRpcG9PcGVyYWNpb24iIDogMSwKICAgICJ0aXBvQ29udGluZ2VuY2lhIiA6IG51bGwsCiAgICAiZmVjRW1pIiA6ICIyMDI0LTAzLTA5IiwKICAgICJob3JFbWkiIDogIjA2OjE2OjM0IiwKICAgICJ0aXBvTW9uZWRhIiA6ICJVU0QiLAogICAgIm1vdGl2b0NvbnRpbiIgOiBudWxsCiAgfSwKICAiZW1pc29yIiA6IHsKICAgICJuaXQiIDogIjAyMDMzMTEwNjYwMDE5IiwKICAgICJucmMiIDogIjQ2NzQ0IiwKICAgICJub21icmUiIDogIkNPT1BFUkFUSVZBIENVWkNBQ0hBUEEgREUgUi5MIiwKICAgICJjb2RBY3RpdmlkYWQiIDogIjAxNjMyIiwKICAgICJkZXNjQWN0aXZpZGFkIiA6ICJTZXJ2aWNpbyBkZSBiZW5lZmljaW8gZGUgY2Fmw6kiLAogICAgIm5vbWJyZUNvbWVyY2lhbCIgOiAiU09DSUVEQUQgQ09PUEVSQVRJVkEgQ0hBTENIVUFQQU5FQ0EgREUgUFJPRFVDVE9SRVMgREUgQ0FGRSIsCiAgICAidGlwb0VzdGFibGVjaW1pZW50byIgOiAiMDIiLAogICAgInRlbGVmb25vIiA6ICIyNDUyNzgwMCIsCiAgICAiY29ycmVvIiA6ICJjdXpjYWNoYXBhQGN1emNhY2hhcGEuY29tIiwKICAgICJjb2RFc3RhYmxlIiA6IG51bGwsCiAgICAiY29kRXN0YWJsZU1IIiA6IG51bGwsCiAgICAiY29kUHVudG9WZW50YU1IIiA6IG51bGwsCiAgICAiY29kUHVudG9WZW50YSIgOiBudWxsLAogICAgImRpcmVjY2lvbiIgOiB7CiAgICAgICJjb21wbGVtZW50byIgOiAiQ0FSUkVURVJBIEEgRUwgQ09DTywgQ09MIENVWkNBQ0hBUEEgQ1RPTi4gR0FMRUFOTy4iLAogICAgICAibXVuaWNpcGlvIiA6ICIwMyIsCiAgICAgICJkZXBhcnRhbWVudG8iIDogIjAyIgogICAgfQogIH0sCiAgImN1ZXJwb0RvY3VtZW50byIgOiBbIF0sCiAgImRvY3VtZW50b1JlbGFjaW9uYWRvIiA6IG51bGwsCiAgInJlY2VwdG9yIiA6IHsKICAgICJuaXQiIDogIjAyMTAwMzA3ODgxMDIyIiwKICAgICJucmMiIDogIjAwIiwKICAgICJub21icmUiIDogIkRBVklEIEFMQkVSVE8gR0FSQ0lBIENBUkRPTkEiLAogICAgImNvZEFjdGl2aWRhZCIgOiAiNjIwMjAiLAogICAgImRlc2NBY3RpdmlkYWQiIDogIkNvbnN1bHRvcsOtYXMgeSBnZXN0acOzbiBkZSBzZXJ2aWNpb3MgaW5mb3Jtw6F0aWNvcyIsCiAgICAibm9tYnJlQ29tZXJjaWFsIiA6ICJEQVZJRCBBTEJFUlRPIEdBUkNJQSBDQVJET05BIiwKICAgICJkaXJlY2Npb24iIDogewogICAgICAiY29tcGxlbWVudG8iIDogIkNvbmRvbWluaW9zIHNhbnRhIGx1Y2lhIEUtNDcgYXB0LTIxIiwKICAgICAgIm11bmljaXBpbyIgOiAiMDIiLAogICAgICAiZGVwYXJ0YW1lbnRvIiA6ICIwMSIKICAgIH0sCiAgICAidGVsZWZvbm8iIDogIjc3ODk5Nzk4IiwKICAgICJjb3JyZW8iIDogInNhbC50YXRvQGdtYWlsLmNvbSIKICB9LAogICJvdHJvc0RvY3VtZW50b3MiIDogbnVsbCwKICAidmVudGFUZXJjZXJvIiA6IG51bGwsCiAgInJlc3VtZW4iIDogewogICAgInRvdGFsTm9TdWoiIDogMCwKICAgICJ0b3RhbEV4ZW50YSIgOiAwLAogICAgInRvdGFsR3JhdmFkYSIgOiAwLAogICAgInN1YlRvdGFsVmVudGFzIiA6IDAsCiAgICAiZGVzY3VOb1N1aiIgOiAwLAogICAgImRlc2N1RXhlbnRhIiA6IDAsCiAgICAiZGVzY3VHcmF2YWRhIiA6IDAsCiAgICAicG9yY2VudGFqZURlc2N1ZW50byIgOiAwLAogICAgInRvdGFsRGVzY3UiIDogMCwKICAgICJzdWJUb3RhbCIgOiAwLAogICAgIml2YVJldGUxIiA6IDAsCiAgICAicmV0ZVJlbnRhIiA6IDAsCiAgICAibW9udG9Ub3RhbE9wZXJhY2lvbiIgOiAyNi4xNiwKICAgICJ0b3RhbE5vR3JhdmFkbyIgOiAwLAogICAgInRvdGFsUGFnYXIiIDogMjYuMTYsCiAgICAidG90YWxMZXRyYXMiIDogIkNFUk8gRE9MQVJFU1MgMDAvMTAwIiwKICAgICJzYWxkb0Zhdm9yIiA6IDAsCiAgICAiY29uZGljaW9uT3BlcmFjaW9uIiA6IDEsCiAgICAiaXZhUGVyY2kxIiA6IDAsCiAgICAibnVtUGFnb0VsZWN0cm9uaWNvIiA6ICIiLAogICAgInBhZ29zIiA6IFsgewogICAgICAiY29kaWdvIiA6ICIwMSIsCiAgICAgICJtb250b1BhZ28iIDogMCwKICAgICAgInJlZmVyZW5jaWEiIDogIiIsCiAgICAgICJwbGF6byIgOiAiMDEiLAogICAgICAicGVyaW9kbyIgOiAwCiAgICB9IF0sCiAgICAidHJpYnV0b3MiIDogWyB7CiAgICAgICJjb2RpZ28iIDogIjIwIiwKICAgICAgImRlc2NyaXBjaW9uIiA6ICJJbXB1ZXN0byBhbCBWYWxvciBBZ3JlZ2FkbyAxMyUiLAogICAgICAidmFsb3IiIDogMjYuMTYKICAgIH0gXQogIH0sCiAgImV4dGVuc2lvbiIgOiBudWxsLAogICJhcGVuZGljZSIgOiBudWxsCn0.eQ5lM4Ezab4_MuKB_3zk6C0VPb_ntZd7mkF8PmU59sZNQCuHznhW7-2_V7oLo1jBE6ExxsirdU95-AioWPLhkrc0bWioCFNV3FAG83I2LCWfyRsYK1XRH-4J1Tv1-QuzKnk6zK5YNGWR-l7i0eGogy3O7H76GLklRJSE_DJXxdqDsFbztmGj45tKn_G3wbg6XkeSpBam5cHMVYZdQBow6M-CGkIIaoPbrkn2D-AEcWCN5DcOz5V6cKAet6ollO6cC9_7tNUcQgrnxbHaWTpf5rMSCQZUn4-d6Cf0HslXquSN83VgFATziWJN5SaxSorSdNs-vxVbEPOGvKk27_hrgQ\"}', NULL, NULL, NULL, '23DS000C', '1448', '2024-02-24');
INSERT INTO public.receptordocumen ("numeroControl", "codigoGeneracion", "idReceptor", fecha, estado, destino, "cuentaArea", "cuentaVende", seriefac, serienumfac, fechaseriefact) VALUES ('DTE-01-CMPV0202-000000000003999', 'A39C6F29-0A6D-4AC6-85EB-132E4C0EDBCF', '5222', '2024-04-04', NULL, '{\"destino\":\"\",\"direccionCli\":null}', '01011011400', '0000000', NULL, NULL, NULL);
INSERT INTO public.receptordocumen ("numeroControl", "codigoGeneracion", "idReceptor", fecha, estado, destino, "cuentaArea", "cuentaVende", seriefac, serienumfac, fechaseriefact) VALUES ('DTE-03-CMPV0202-000000000003967', 'A890BEC7-DC27-4B92-90AF-05EC58C92699', '16625396', '2024-03-09', NULL, NULL, NULL, NULL, '23DS000C', '1448', '2024-02-24');
INSERT INTO public.receptordocumen ("numeroControl", "codigoGeneracion", "idReceptor", fecha, estado, destino, "cuentaArea", "cuentaVende", seriefac, serienumfac, fechaseriefact) VALUES ('DTE-03-CMPV0202-000000000003995', 'B0093AF7-3309-4B8D-B839-C0EE01A359D6', '16625396', '2024-03-09', '{\"Nofirmado\":{\"identificacion\":{\"version\":\"3\",\"ambiente\":\"00\",\"tipoDte\":\"03\",\"numeroControl\":\"DTE-03-CMPV0202-000000000003995\",\"codigoGeneracion\":\"B0093AF7-3309-4B8D-B839-C0EE01A359D6\",\"tipoModelo\":\"1\",\"tipoOperacion\":\"1\",\"tipoContingencia\":\"\",\"fecEmi\":\"2024-03-09\",\"horEmi\":\"10:08:50\",\"tipoMoneda\":\"USD\",\"motivoContin\":\"\"},\"emisor\":{\"nit\":\"02033110660019\",\"nrc\":\"46744\",\"nombre\":\"COOPERATIVA CUZCACHAPA DE R.L\",\"codActividad\":\"01632\",\"descActividad\":\"Servicio de beneficio de caf\\u00e9\",\"nombreComercial\":\"SOCIEDAD COOPERATIVA CHALCHUAPANECA DE PRODUCTORES DE CAFE\",\"tipoEstablecimiento\":\"02\",\"telefono\":\"24527800\",\"correo\":\"cuzcachapa@cuzcachapa.com\",\"codEstable\":\"\",\"codEstableMH\":\"\",\"codPuntoVentaMH\":\"\",\"codPuntoVenta\":\"\",\"direccion\":{\"complemento\":\"CARRETERA A EL COCO, COL CUZCACHAPA CTON. GALEANO.\",\"municipio\":\"03\",\"departamento\":\"02\"}},\"Cuerpodocumento\":[{\"numItem\":\"1\",\"tipoItem\":\"3\",\"numeroDocumento\":\"\",\"cantidad\":\"200\",\"codigo\":\"1372\",\"codTributo\":\"\",\"precioUni\":\"0.5\",\"montoDescu\":\"0\",\"uniMedida\":\"59\",\"ventaNoSuj\":\"0\",\"ventaExenta\":\"0\",\"ventaGravada\":\"100\",\"tributos\":[\"20\"],\"psv\":\"0.508407\",\"noGravado\":\"0\",\"descripcion\":\"Azucar 1\\/2 Kilo\"},{\"numItem\":\"2\",\"tipoItem\":\"3\",\"numeroDocumento\":\"\",\"cantidad\":\"40\",\"codigo\":\"1390\",\"codTributo\":\"\",\"precioUni\":\"2.48\",\"montoDescu\":\"0\",\"uniMedida\":\"59\",\"ventaNoSuj\":\"0\",\"ventaExenta\":\"0\",\"ventaGravada\":\"99.2\",\"tributos\":[\"20\"],\"psv\":\"2.488496\",\"noGravado\":\"0\",\"descripcion\":\"Azucar 2.5 Kilos\"}],\"documentoRelacionado\":\"\",\"receptor\":{\"nit\":\"02032707400018\",\"nrc\":\"556521\",\"nombre\":\"DUCH MARTINEZ JUAN\",\"codActividad\":\"01271\",\"descActividad\":\"Cultivo de caf\\u00e9\",\"nombreComercial\":\"DUCH MARTINEZ JUAN\",\"direccion\":{\"complemento\":\"Av. Club de Leones Nte. Chalchuapa.\",\"municipio\":\"03\",\"departamento\":\"02\"},\"telefono\":\"24440185\",\"correo\":\"sal.tato@gmail.com\"},\"otrosDocumentos\":\"\",\"ventaTercero\":\"\",\"resumen\":{\"totalNoSuj\":\"0\",\"totalExenta\":\"0\",\"totalGravada\":\"199.2\",\"subTotalVentas\":\"199.2\",\"descuNoSuj\":\"0\",\"descuExenta\":\"0\",\"descuGravada\":\"0\",\"porcentajeDescuento\":\"0\",\"totalDescu\":\"0\",\"subTotal\":\"199.2\",\"ivaRete1\":\"0\",\"reteRenta\":\"0\",\"montoTotalOperacion\":\"225.36\",\"totalNoGravado\":\"0\",\"totalPagar\":\"225.36\",\"totalLetras\":\"CIENTO NOVENTA Y NUEVE DOLARESS 20\\/100\",\"saldoFavor\":\"0\",\"condicionOperacion\":\"1\",\"ivaPerci1\":\"0\",\"numPagoElectronico\":\"\",\"pagos\":[{\"codigo\":\"01\",\"montoPago\":\"199.2\",\"referencia\":\"\",\"plazo\":\"01\",\"periodo\":\"\"}],\"tributos\":[{\"codigo\":\"20\",\"descripcion\":\"Impuesto al Valor Agregado 13%\",\"valor\":\"26.16\"}]},\"extension\":\"\",\"apendice\":\"\"},\"firmado\":\"eyJhbGciOiJSUzUxMiJ9.ewogICJpZGVudGlmaWNhY2lvbiIgOiB7CiAgICAidmVyc2lvbiIgOiAzLAogICAgImFtYmllbnRlIiA6ICIwMCIsCiAgICAidGlwb0R0ZSIgOiAiMDMiLAogICAgIm51bWVyb0NvbnRyb2wiIDogIkRURS0wMy1DTVBWMDIwMi0wMDAwMDAwMDAwMDM5OTUiLAogICAgImNvZGlnb0dlbmVyYWNpb24iIDogIkIwMDkzQUY3LTMzMDktNEI4RC1CODM5LUMwRUUwMUEzNTlENiIsCiAgICAidGlwb01vZGVsbyIgOiAxLAogICAgInRpcG9PcGVyYWNpb24iIDogMSwKICAgICJ0aXBvQ29udGluZ2VuY2lhIiA6IG51bGwsCiAgICAiZmVjRW1pIiA6ICIyMDI0LTAzLTA5IiwKICAgICJob3JFbWkiIDogIjEwOjA4OjUwIiwKICAgICJ0aXBvTW9uZWRhIiA6ICJVU0QiLAogICAgIm1vdGl2b0NvbnRpbiIgOiBudWxsCiAgfSwKICAiZW1pc29yIiA6IHsKICAgICJuaXQiIDogIjAyMDMzMTEwNjYwMDE5IiwKICAgICJucmMiIDogIjQ2NzQ0IiwKICAgICJub21icmUiIDogIkNPT1BFUkFUSVZBIENVWkNBQ0hBUEEgREUgUi5MIiwKICAgICJjb2RBY3RpdmlkYWQiIDogIjAxNjMyIiwKICAgICJkZXNjQWN0aXZpZGFkIiA6ICJTZXJ2aWNpbyBkZSBiZW5lZmljaW8gZGUgY2Fmw6kiLAogICAgIm5vbWJyZUNvbWVyY2lhbCIgOiAiU09DSUVEQUQgQ09PUEVSQVRJVkEgQ0hBTENIVUFQQU5FQ0EgREUgUFJPRFVDVE9SRVMgREUgQ0FGRSIsCiAgICAidGlwb0VzdGFibGVjaW1pZW50byIgOiAiMDIiLAogICAgInRlbGVmb25vIiA6ICIyNDUyNzgwMCIsCiAgICAiY29ycmVvIiA6ICJjdXpjYWNoYXBhQGN1emNhY2hhcGEuY29tIiwKICAgICJjb2RFc3RhYmxlIiA6IG51bGwsCiAgICAiY29kRXN0YWJsZU1IIiA6IG51bGwsCiAgICAiY29kUHVudG9WZW50YU1IIiA6IG51bGwsCiAgICAiY29kUHVudG9WZW50YSIgOiBudWxsLAogICAgImRpcmVjY2lvbiIgOiB7CiAgICAgICJjb21wbGVtZW50byIgOiAiQ0FSUkVURVJBIEEgRUwgQ09DTywgQ09MIENVWkNBQ0hBUEEgQ1RPTi4gR0FMRUFOTy4iLAogICAgICAibXVuaWNpcGlvIiA6ICIwMyIsCiAgICAgICJkZXBhcnRhbWVudG8iIDogIjAyIgogICAgfQogIH0sCiAgImN1ZXJwb0RvY3VtZW50byIgOiBbIHsKICAgICJudW1JdGVtIiA6IDEsCiAgICAidGlwb0l0ZW0iIDogMywKICAgICJudW1lcm9Eb2N1bWVudG8iIDogbnVsbCwKICAgICJjYW50aWRhZCIgOiAyMDAsCiAgICAiY29kaWdvIiA6ICIxMzcyIiwKICAgICJjb2RUcmlidXRvIiA6IG51bGwsCiAgICAicHJlY2lvVW5pIiA6IDAuNSwKICAgICJtb250b0Rlc2N1IiA6IDAsCiAgICAidW5pTWVkaWRhIiA6IDU5LAogICAgInZlbnRhTm9TdWoiIDogMCwKICAgICJ2ZW50YUV4ZW50YSIgOiAwLAogICAgInZlbnRhR3JhdmFkYSIgOiAxMDAsCiAgICAidHJpYnV0b3MiIDogWyAiMjAiIF0sCiAgICAicHN2IiA6IDAuNTA4NDA3LAogICAgIm5vR3JhdmFkbyIgOiAwLAogICAgImRlc2NyaXBjaW9uIiA6ICJBenVjYXIgMS8yIEtpbG8iCiAgfSwgewogICAgIm51bUl0ZW0iIDogMiwKICAgICJ0aXBvSXRlbSIgOiAzLAogICAgIm51bWVyb0RvY3VtZW50byIgOiBudWxsLAogICAgImNhbnRpZGFkIiA6IDQwLAogICAgImNvZGlnbyIgOiAiMTM5MCIsCiAgICAiY29kVHJpYnV0byIgOiBudWxsLAogICAgInByZWNpb1VuaSIgOiAyLjQ4LAogICAgIm1vbnRvRGVzY3UiIDogMCwKICAgICJ1bmlNZWRpZGEiIDogNTksCiAgICAidmVudGFOb1N1aiIgOiAwLAogICAgInZlbnRhRXhlbnRhIiA6IDAsCiAgICAidmVudGFHcmF2YWRhIiA6IDk5LjIsCiAgICAidHJpYnV0b3MiIDogWyAiMjAiIF0sCiAgICAicHN2IiA6IDIuNDg4NDk2LAogICAgIm5vR3JhdmFkbyIgOiAwLAogICAgImRlc2NyaXBjaW9uIiA6ICJBenVjYXIgMi41IEtpbG9zIgogIH0gXSwKICAiZG9jdW1lbnRvUmVsYWNpb25hZG8iIDogbnVsbCwKICAicmVjZXB0b3IiIDogewogICAgIm5pdCIgOiAiMDIwMzI3MDc0MDAwMTgiLAogICAgIm5yYyIgOiAiNTU2NTIxIiwKICAgICJub21icmUiIDogIkRVQ0ggTUFSVElORVogSlVBTiIsCiAgICAiY29kQWN0aXZpZGFkIiA6ICIwMTI3MSIsCiAgICAiZGVzY0FjdGl2aWRhZCIgOiAiQ3VsdGl2byBkZSBjYWbDqSIsCiAgICAibm9tYnJlQ29tZXJjaWFsIiA6ICJEVUNIIE1BUlRJTkVaIEpVQU4iLAogICAgImRpcmVjY2lvbiIgOiB7CiAgICAgICJjb21wbGVtZW50byIgOiAiQXYuIENsdWIgZGUgTGVvbmVzIE50ZS4gQ2hhbGNodWFwYS4iLAogICAgICAibXVuaWNpcGlvIiA6ICIwMyIsCiAgICAgICJkZXBhcnRhbWVudG8iIDogIjAyIgogICAgfSwKICAgICJ0ZWxlZm9ubyIgOiAiMjQ0NDAxODUiLAogICAgImNvcnJlbyIgOiAic2FsLnRhdG9AZ21haWwuY29tIgogIH0sCiAgIm90cm9zRG9jdW1lbnRvcyIgOiBudWxsLAogICJ2ZW50YVRlcmNlcm8iIDogbnVsbCwKICAicmVzdW1lbiIgOiB7CiAgICAidG90YWxOb1N1aiIgOiAwLAogICAgInRvdGFsRXhlbnRhIiA6IDAsCiAgICAidG90YWxHcmF2YWRhIiA6IDE5OS4yLAogICAgInN1YlRvdGFsVmVudGFzIiA6IDE5OS4yLAogICAgImRlc2N1Tm9TdWoiIDogMCwKICAgICJkZXNjdUV4ZW50YSIgOiAwLAogICAgImRlc2N1R3JhdmFkYSIgOiAwLAogICAgInBvcmNlbnRhamVEZXNjdWVudG8iIDogMCwKICAgICJ0b3RhbERlc2N1IiA6IDAsCiAgICAic3ViVG90YWwiIDogMTk5LjIsCiAgICAiaXZhUmV0ZTEiIDogMCwKICAgICJyZXRlUmVudGEiIDogMCwKICAgICJtb250b1RvdGFsT3BlcmFjaW9uIiA6IDIyNS4zNiwKICAgICJ0b3RhbE5vR3JhdmFkbyIgOiAwLAogICAgInRvdGFsUGFnYXIiIDogMjI1LjM2LAogICAgInRvdGFsTGV0cmFzIiA6ICJDSUVOVE8gTk9WRU5UQSBZIE5VRVZFIERPTEFSRVNTIDIwLzEwMCIsCiAgICAic2FsZG9GYXZvciIgOiAwLAogICAgImNvbmRpY2lvbk9wZXJhY2lvbiIgOiAxLAogICAgIml2YVBlcmNpMSIgOiAwLAogICAgIm51bVBhZ29FbGVjdHJvbmljbyIgOiAiIiwKICAgICJwYWdvcyIgOiBbIHsKICAgICAgImNvZGlnbyIgOiAiMDEiLAogICAgICAibW9udG9QYWdvIiA6IDE5OS4yLAogICAgICAicmVmZXJlbmNpYSIgOiAiIiwKICAgICAgInBsYXpvIiA6ICIwMSIsCiAgICAgICJwZXJpb2RvIiA6IG51bGwKICAgIH0gXSwKICAgICJ0cmlidXRvcyIgOiBbIHsKICAgICAgImNvZGlnbyIgOiAiMjAiLAogICAgICAiZGVzY3JpcGNpb24iIDogIkltcHVlc3RvIGFsIFZhbG9yIEFncmVnYWRvIDEzJSIsCiAgICAgICJ2YWxvciIgOiAyNi4xNgogICAgfSBdCiAgfSwKICAiZXh0ZW5zaW9uIiA6IG51bGwsCiAgImFwZW5kaWNlIiA6IG51bGwKfQ.S75o2C8ifjvyyi6wPVUzaweRGmF9bNSbqH2uTLiHN0HWx6MdgYv-twUVjnDX2-7xqA-PlyQ1CctNI14wCBc6xQIVhLLj2_5lfJbbl5TS26WDRKSb7TUTONCK1HZzHfp-tRF8qrFwgRkAsInbcbhMgaZZWShGl1-iQOrT-bfcI4bJSqXj_P5nTT9q0QHVk8MmdPOtqgpHcR0vm7FVKLmMVt5e_2NzakvxAf1BaxWJmurZeFUgwPAhlvsoZ51t_4BrZPvVCbsJ_DCFU9oE4-2_54L8cyJD-RkuYqy4QMvwVRtwTKFViinF8ysbUWRKEChhsGzgdhAQwBN0H2ZAt1GmLg\"}', NULL, NULL, NULL, '23DS000C', '1448', '2024-02-24');
INSERT INTO public.receptordocumen ("numeroControl", "codigoGeneracion", "idReceptor", fecha, estado, destino, "cuentaArea", "cuentaVende", seriefac, serienumfac, fechaseriefact) VALUES ('DTE-03-CMPV0202-000000000003965', 'B4A8EBD6-62C4-4511-8F89-7A1D8FF8F9DF', '16625396', '2024-03-09', NULL, NULL, NULL, NULL, '23DS000C', '1448', '2024-02-24');
INSERT INTO public.receptordocumen ("numeroControl", "codigoGeneracion", "idReceptor", fecha, estado, destino, "cuentaArea", "cuentaVende", seriefac, serienumfac, fechaseriefact) VALUES ('DTE-03-CMPV0202-000000000003974', 'C6D0A5BA-29A2-4A46-B17B-624E8A2EABB3', '16625396', '2024-03-09', NULL, NULL, NULL, NULL, '23DS000C', '1448', '2024-02-24');
INSERT INTO public.receptordocumen ("numeroControl", "codigoGeneracion", "idReceptor", fecha, estado, destino, "cuentaArea", "cuentaVende", seriefac, serienumfac, fechaseriefact) VALUES ('DTE-03-CMPV0202-000000000003968', 'D0D6C203-A842-46E4-A027-9E6B0260CCCC', '16625396', '2024-03-09', NULL, NULL, NULL, NULL, '23DS000C', '1448', '2024-02-24');
INSERT INTO public.receptordocumen ("numeroControl", "codigoGeneracion", "idReceptor", fecha, estado, destino, "cuentaArea", "cuentaVende", seriefac, serienumfac, fechaseriefact) VALUES ('DTE-03-CMPV0202-000000000003979', 'D5A3E5D4-7ED8-495D-B3CF-569D8BA38F57', '16625396', '2024-03-09', NULL, NULL, NULL, NULL, '23DS000C', '1448', '2024-02-24');
INSERT INTO public.receptordocumen ("numeroControl", "codigoGeneracion", "idReceptor", fecha, estado, destino, "cuentaArea", "cuentaVende", seriefac, serienumfac, fechaseriefact) VALUES ('DTE-03-CMPV0202-000000000003981', 'DD7277CF-28FA-4F15-881F-BF757119E122', '16625396', '2024-03-09', NULL, NULL, NULL, NULL, '23DS000C', '1448', '2024-02-24');
INSERT INTO public.receptordocumen ("numeroControl", "codigoGeneracion", "idReceptor", fecha, estado, destino, "cuentaArea", "cuentaVende", seriefac, serienumfac, fechaseriefact) VALUES ('DTE-03-CMPV0202-000000000003977', 'DE59BC3A-3473-4994-91E6-F11DDB9746D1', '16625396', '2024-03-09', NULL, NULL, NULL, NULL, '23DS000C', '1448', '2024-02-24');
INSERT INTO public.receptordocumen ("numeroControl", "codigoGeneracion", "idReceptor", fecha, estado, destino, "cuentaArea", "cuentaVende", seriefac, serienumfac, fechaseriefact) VALUES ('DTE-03-CMPV0202-000000000003969', 'E107BAD3-CAAF-445F-BF4D-CE20703FBEAB', '16625396', '2024-03-09', NULL, NULL, NULL, NULL, '23DS000C', '1448', '2024-02-24');
INSERT INTO public.receptordocumen ("numeroControl", "codigoGeneracion", "idReceptor", fecha, estado, destino, "cuentaArea", "cuentaVende", seriefac, serienumfac, fechaseriefact) VALUES ('DTE-03-CMPV0202-000000000003971', 'E8572C95-53D2-4CB0-B587-AB7FA9DEF1C4', '16625396', '2024-03-09', '{\"Nofirmado\":{\"identificacion\":{\"version\":\"3\",\"ambiente\":\"00\",\"tipoDte\":\"03\",\"numeroControl\":\"DTE-03-CMPV0202-000000000003971\",\"codigoGeneracion\":\"E8572C95-53D2-4CB0-B587-AB7FA9DEF1C4\",\"tipoModelo\":\"1\",\"tipoOperacion\":\"1\",\"tipoContingencia\":\"\",\"fecEmi\":\"2024-03-09\",\"horEmi\":\"06:16:03\",\"tipoMoneda\":\"USD\",\"motivoContin\":\"\"},\"emisor\":{\"nit\":\"02033110660019\",\"nrc\":\"46744\",\"nombre\":\"COOPERATIVA CUZCACHAPA DE R.L\",\"codActividad\":\"01632\",\"descActividad\":\"Servicio de beneficio de caf\\u00e9\",\"nombreComercial\":\"SOCIEDAD COOPERATIVA CHALCHUAPANECA DE PRODUCTORES DE CAFE\",\"tipoEstablecimiento\":\"02\",\"telefono\":\"24527800\",\"correo\":\"cuzcachapa@cuzcachapa.com\",\"codEstable\":\"\",\"codEstableMH\":\"\",\"codPuntoVentaMH\":\"\",\"codPuntoVenta\":\"\",\"direccion\":{\"complemento\":\"CARRETERA A EL COCO, COL CUZCACHAPA CTON. GALEANO.\",\"municipio\":\"03\",\"departamento\":\"02\"}},\"documentoRelacionado\":\"\",\"receptor\":{\"nit\":\"02100307881022\",\"nrc\":\"00\",\"nombre\":\"DAVID ALBERTO GARCIA CARDONA\",\"codActividad\":\"62020\",\"descActividad\":\"Consultor\\u00edas y gesti\\u00f3n de servicios inform\\u00e1ticos\",\"nombreComercial\":\"DAVID ALBERTO GARCIA CARDONA\",\"direccion\":{\"complemento\":\"Condominios santa lucia E-47 apt-21\",\"municipio\":\"02\",\"departamento\":\"01\"},\"telefono\":\"77899798\",\"correo\":\"sal.tato@gmail.com\"},\"otrosDocumentos\":\"\",\"ventaTercero\":\"\",\"resumen\":{\"totalNoSuj\":\"0\",\"totalExenta\":\"0\",\"totalGravada\":\"0\",\"subTotalVentas\":\"0\",\"descuNoSuj\":\"0\",\"descuExenta\":\"0\",\"descuGravada\":\"0\",\"porcentajeDescuento\":\"0\",\"totalDescu\":\"0\",\"subTotal\":\"0\",\"ivaRete1\":\"0\",\"reteRenta\":\"0\",\"montoTotalOperacion\":\"26.16\",\"totalNoGravado\":\"0\",\"totalPagar\":\"26.16\",\"totalLetras\":\"CERO DOLARESS 00\\/100\",\"saldoFavor\":\"0\",\"condicionOperacion\":\"1\",\"ivaPerci1\":\"0\",\"numPagoElectronico\":\"\",\"pagos\":[{\"codigo\":\"01\",\"montoPago\":\"0\",\"referencia\":\"\",\"plazo\":\"01\",\"periodo\":\"0\"}],\"tributos\":[{\"codigo\":\"20\",\"descripcion\":\"Impuesto al Valor Agregado 13%\",\"valor\":\"26.16\"}]},\"extension\":\"\",\"apendice\":\"\"},\"firmado\":\"eyJhbGciOiJSUzUxMiJ9.ewogICJpZGVudGlmaWNhY2lvbiIgOiB7CiAgICAidmVyc2lvbiIgOiAzLAogICAgImFtYmllbnRlIiA6ICIwMCIsCiAgICAidGlwb0R0ZSIgOiAiMDMiLAogICAgIm51bWVyb0NvbnRyb2wiIDogIkRURS0wMy1DTVBWMDIwMi0wMDAwMDAwMDAwMDM5NzEiLAogICAgImNvZGlnb0dlbmVyYWNpb24iIDogIkU4NTcyQzk1LTUzRDItNENCMC1CNTg3LUFCN0ZBOURFRjFDNCIsCiAgICAidGlwb01vZGVsbyIgOiAxLAogICAgInRpcG9PcGVyYWNpb24iIDogMSwKICAgICJ0aXBvQ29udGluZ2VuY2lhIiA6IG51bGwsCiAgICAiZmVjRW1pIiA6ICIyMDI0LTAzLTA5IiwKICAgICJob3JFbWkiIDogIjA2OjE2OjAzIiwKICAgICJ0aXBvTW9uZWRhIiA6ICJVU0QiLAogICAgIm1vdGl2b0NvbnRpbiIgOiBudWxsCiAgfSwKICAiZW1pc29yIiA6IHsKICAgICJuaXQiIDogIjAyMDMzMTEwNjYwMDE5IiwKICAgICJucmMiIDogIjQ2NzQ0IiwKICAgICJub21icmUiIDogIkNPT1BFUkFUSVZBIENVWkNBQ0hBUEEgREUgUi5MIiwKICAgICJjb2RBY3RpdmlkYWQiIDogIjAxNjMyIiwKICAgICJkZXNjQWN0aXZpZGFkIiA6ICJTZXJ2aWNpbyBkZSBiZW5lZmljaW8gZGUgY2Fmw6kiLAogICAgIm5vbWJyZUNvbWVyY2lhbCIgOiAiU09DSUVEQUQgQ09PUEVSQVRJVkEgQ0hBTENIVUFQQU5FQ0EgREUgUFJPRFVDVE9SRVMgREUgQ0FGRSIsCiAgICAidGlwb0VzdGFibGVjaW1pZW50byIgOiAiMDIiLAogICAgInRlbGVmb25vIiA6ICIyNDUyNzgwMCIsCiAgICAiY29ycmVvIiA6ICJjdXpjYWNoYXBhQGN1emNhY2hhcGEuY29tIiwKICAgICJjb2RFc3RhYmxlIiA6IG51bGwsCiAgICAiY29kRXN0YWJsZU1IIiA6IG51bGwsCiAgICAiY29kUHVudG9WZW50YU1IIiA6IG51bGwsCiAgICAiY29kUHVudG9WZW50YSIgOiBudWxsLAogICAgImRpcmVjY2lvbiIgOiB7CiAgICAgICJjb21wbGVtZW50byIgOiAiQ0FSUkVURVJBIEEgRUwgQ09DTywgQ09MIENVWkNBQ0hBUEEgQ1RPTi4gR0FMRUFOTy4iLAogICAgICAibXVuaWNpcGlvIiA6ICIwMyIsCiAgICAgICJkZXBhcnRhbWVudG8iIDogIjAyIgogICAgfQogIH0sCiAgImN1ZXJwb0RvY3VtZW50byIgOiBbIF0sCiAgImRvY3VtZW50b1JlbGFjaW9uYWRvIiA6IG51bGwsCiAgInJlY2VwdG9yIiA6IHsKICAgICJuaXQiIDogIjAyMTAwMzA3ODgxMDIyIiwKICAgICJucmMiIDogIjAwIiwKICAgICJub21icmUiIDogIkRBVklEIEFMQkVSVE8gR0FSQ0lBIENBUkRPTkEiLAogICAgImNvZEFjdGl2aWRhZCIgOiAiNjIwMjAiLAogICAgImRlc2NBY3RpdmlkYWQiIDogIkNvbnN1bHRvcsOtYXMgeSBnZXN0acOzbiBkZSBzZXJ2aWNpb3MgaW5mb3Jtw6F0aWNvcyIsCiAgICAibm9tYnJlQ29tZXJjaWFsIiA6ICJEQVZJRCBBTEJFUlRPIEdBUkNJQSBDQVJET05BIiwKICAgICJkaXJlY2Npb24iIDogewogICAgICAiY29tcGxlbWVudG8iIDogIkNvbmRvbWluaW9zIHNhbnRhIGx1Y2lhIEUtNDcgYXB0LTIxIiwKICAgICAgIm11bmljaXBpbyIgOiAiMDIiLAogICAgICAiZGVwYXJ0YW1lbnRvIiA6ICIwMSIKICAgIH0sCiAgICAidGVsZWZvbm8iIDogIjc3ODk5Nzk4IiwKICAgICJjb3JyZW8iIDogInNhbC50YXRvQGdtYWlsLmNvbSIKICB9LAogICJvdHJvc0RvY3VtZW50b3MiIDogbnVsbCwKICAidmVudGFUZXJjZXJvIiA6IG51bGwsCiAgInJlc3VtZW4iIDogewogICAgInRvdGFsTm9TdWoiIDogMCwKICAgICJ0b3RhbEV4ZW50YSIgOiAwLAogICAgInRvdGFsR3JhdmFkYSIgOiAwLAogICAgInN1YlRvdGFsVmVudGFzIiA6IDAsCiAgICAiZGVzY3VOb1N1aiIgOiAwLAogICAgImRlc2N1RXhlbnRhIiA6IDAsCiAgICAiZGVzY3VHcmF2YWRhIiA6IDAsCiAgICAicG9yY2VudGFqZURlc2N1ZW50byIgOiAwLAogICAgInRvdGFsRGVzY3UiIDogMCwKICAgICJzdWJUb3RhbCIgOiAwLAogICAgIml2YVJldGUxIiA6IDAsCiAgICAicmV0ZVJlbnRhIiA6IDAsCiAgICAibW9udG9Ub3RhbE9wZXJhY2lvbiIgOiAyNi4xNiwKICAgICJ0b3RhbE5vR3JhdmFkbyIgOiAwLAogICAgInRvdGFsUGFnYXIiIDogMjYuMTYsCiAgICAidG90YWxMZXRyYXMiIDogIkNFUk8gRE9MQVJFU1MgMDAvMTAwIiwKICAgICJzYWxkb0Zhdm9yIiA6IDAsCiAgICAiY29uZGljaW9uT3BlcmFjaW9uIiA6IDEsCiAgICAiaXZhUGVyY2kxIiA6IDAsCiAgICAibnVtUGFnb0VsZWN0cm9uaWNvIiA6ICIiLAogICAgInBhZ29zIiA6IFsgewogICAgICAiY29kaWdvIiA6ICIwMSIsCiAgICAgICJtb250b1BhZ28iIDogMCwKICAgICAgInJlZmVyZW5jaWEiIDogIiIsCiAgICAgICJwbGF6byIgOiAiMDEiLAogICAgICAicGVyaW9kbyIgOiAwCiAgICB9IF0sCiAgICAidHJpYnV0b3MiIDogWyB7CiAgICAgICJjb2RpZ28iIDogIjIwIiwKICAgICAgImRlc2NyaXBjaW9uIiA6ICJJbXB1ZXN0byBhbCBWYWxvciBBZ3JlZ2FkbyAxMyUiLAogICAgICAidmFsb3IiIDogMjYuMTYKICAgIH0gXQogIH0sCiAgImV4dGVuc2lvbiIgOiBudWxsLAogICJhcGVuZGljZSIgOiBudWxsCn0.X9RFdTtfrQTyl0XBh6uyAtYwJRbu5JhXlRpj4Awt4ZrG9x9SUerDYhdO-Wjzd7jWEDiMPuFpDTVFFWpbxKproIKLgkRJm7xzhHborkDOOBi7RVK1-XFkeQ5qcM7UCDdsIQRn1zkt-EZBXE781U3x0SLRdAiP9G55epfsv_B1f_4Zj_pXykIRXJNTsKrnFNdFAR2h9nPIAxobw_UVxS4S7jEfSpRHl7XqTtFO8yhr6t_hs1PaDE1lQ9oj6y67Jf0k2pvqDMQu-dcabc5gSUayfurKPa2A9-z1U8kmqeZDVc2eJMHIwUis9KiWpcEXXz4ZblflqZcysqoZ1fWF_Xs9QQ\"}', NULL, NULL, NULL, '23DS000C', '1448', '2024-02-24');
INSERT INTO public.receptordocumen ("numeroControl", "codigoGeneracion", "idReceptor", fecha, estado, destino, "cuentaArea", "cuentaVende", seriefac, serienumfac, fechaseriefact) VALUES ('DTE-03-CMPV0202-000000000003992', 'E9ABB697-938D-4924-A7E7-55C1C7E49AE0', '16625396', '2024-03-09', NULL, NULL, NULL, NULL, '23DS000C', '1448', '2024-02-24');
INSERT INTO public.receptordocumen ("numeroControl", "codigoGeneracion", "idReceptor", fecha, estado, destino, "cuentaArea", "cuentaVende", seriefac, serienumfac, fechaseriefact) VALUES ('DTE-03-CMPV0202-000000000003963', 'F2A4A92E-2DFE-4AF5-831E-A30EC3E70B86', '16625396', '2024-03-09', NULL, NULL, NULL, NULL, '23DS000C', '1448', '2024-02-24');
INSERT INTO public.receptordocumen ("numeroControl", "codigoGeneracion", "idReceptor", fecha, estado, destino, "cuentaArea", "cuentaVende", seriefac, serienumfac, fechaseriefact) VALUES ('DTE-03-CMPV0202-000000000003963', 'F2FF9703-9CC4-411F-91FE-39F87A3446D0', '16625396', '2024-03-09', NULL, NULL, NULL, NULL, '23DS000C', '1448', '2024-02-24');
INSERT INTO public.receptordocumen ("numeroControl", "codigoGeneracion", "idReceptor", fecha, estado, destino, "cuentaArea", "cuentaVende", seriefac, serienumfac, fechaseriefact) VALUES ('DTE-03-CMPV0202-000000000003978', 'F41EC2AA-75DB-4063-BF3F-96BF20A9F0FE', '16625396', '2024-03-08', NULL, NULL, NULL, NULL, '23DS000C', '1448', '2024-02-24');


--
-- Data for Name: resumen; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

INSERT INTO public.resumen (id, "numeroControl", "codigoGeneracion", "totalNoSuj", "totalExenta", "totalGravada", "totalOpeExpo", "totalOperaciones", "totalDonacion", "sumOpSinImpu", "montoGloDescNS", "montoGloDescVE", "montoGloDescVG", "montoGloDescVA", "montoGloDescOP", "porcMontoGloDesc", "totalDescBonRev", "resCodTributo", "nombreTributo", "valorTributo", "subTotal", "totalMonSujRet", "ivaPercibido", "ivaPercibidoLiq", "ivaRetenido", "retencionRenta", seguro, flete, "montoTotalOp", "totalCargoBasImpon", "totalAPagar", total, "totalIvaRetenido", "valorLetrasIvaRet", "valorLetras", iva13, "saldoAFavor", "condicionOpera", "codFormaPago", "montoPorFormaPag", "refModalidadPago", plazo, "periodoPlazo", "numPagoElecNPE", incoterms, descincoterms, observaciones) VALUES (1, 'DTE-03-CMPV0202-000000000003963', '0F9DB45F-1E98-4573-89FB-F46A322984C3', '0.00', '0.00', '0', NULL, NULL, NULL, '0', '0.00', '0.00', '0.00', NULL, NULL, '0.00', '0.00', NULL, '[{\"codigo\":\"20\",\"descripcion\":\"Impuesto al Valor Agregado 13%\",\"valor\":26.16}]', NULL, '0', NULL, '0', NULL, '0', '0.00', NULL, NULL, '26.16', '0.00', '26.16', NULL, NULL, NULL, 'CERO DOLARESS 00/100', '26.16', '0.00', '1', '01', '0', '', '01', '', '', NULL, NULL, NULL);
INSERT INTO public.resumen (id, "numeroControl", "codigoGeneracion", "totalNoSuj", "totalExenta", "totalGravada", "totalOpeExpo", "totalOperaciones", "totalDonacion", "sumOpSinImpu", "montoGloDescNS", "montoGloDescVE", "montoGloDescVG", "montoGloDescVA", "montoGloDescOP", "porcMontoGloDesc", "totalDescBonRev", "resCodTributo", "nombreTributo", "valorTributo", "subTotal", "totalMonSujRet", "ivaPercibido", "ivaPercibidoLiq", "ivaRetenido", "retencionRenta", seguro, flete, "montoTotalOp", "totalCargoBasImpon", "totalAPagar", total, "totalIvaRetenido", "valorLetrasIvaRet", "valorLetras", iva13, "saldoAFavor", "condicionOpera", "codFormaPago", "montoPorFormaPag", "refModalidadPago", plazo, "periodoPlazo", "numPagoElecNPE", incoterms, descincoterms, observaciones) VALUES (2, 'DTE-03-CMPV0202-000000000003963', 'F2A4A92E-2DFE-4AF5-831E-A30EC3E70B86', '0.00', '0.00', '0', NULL, NULL, NULL, '0', '0.00', '0.00', '0.00', NULL, NULL, '0.00', '0.00', NULL, '[{\"codigo\":\"20\",\"descripcion\":\"Impuesto al Valor Agregado 13%\",\"valor\":26.16}]', NULL, '0', NULL, '0', NULL, '0', '0.00', NULL, NULL, '26.16', '0.00', '26.16', NULL, NULL, NULL, 'CERO DOLARESS 00/100', '26.16', '0.00', '1', '01', '0', '', '01', '', '', NULL, NULL, NULL);
INSERT INTO public.resumen (id, "numeroControl", "codigoGeneracion", "totalNoSuj", "totalExenta", "totalGravada", "totalOpeExpo", "totalOperaciones", "totalDonacion", "sumOpSinImpu", "montoGloDescNS", "montoGloDescVE", "montoGloDescVG", "montoGloDescVA", "montoGloDescOP", "porcMontoGloDesc", "totalDescBonRev", "resCodTributo", "nombreTributo", "valorTributo", "subTotal", "totalMonSujRet", "ivaPercibido", "ivaPercibidoLiq", "ivaRetenido", "retencionRenta", seguro, flete, "montoTotalOp", "totalCargoBasImpon", "totalAPagar", total, "totalIvaRetenido", "valorLetrasIvaRet", "valorLetras", iva13, "saldoAFavor", "condicionOpera", "codFormaPago", "montoPorFormaPag", "refModalidadPago", plazo, "periodoPlazo", "numPagoElecNPE", incoterms, descincoterms, observaciones) VALUES (3, 'DTE-03-CMPV0202-000000000003963', '4058E0A5-E11E-4981-8DBD-A00F1BAEBEC7', '0.00', '0.00', '0', NULL, NULL, NULL, '0', '0.00', '0.00', '0.00', NULL, NULL, '0.00', '0.00', NULL, '[{\"codigo\":\"20\",\"descripcion\":\"Impuesto al Valor Agregado 13%\",\"valor\":26.16}]', NULL, '0', NULL, '0', NULL, '0', '0.00', NULL, NULL, '26.16', '0.00', '26.16', NULL, NULL, NULL, 'CERO DOLARESS 00/100', '26.16', '0.00', '1', '01', '0', '', '01', '', '', NULL, NULL, NULL);
INSERT INTO public.resumen (id, "numeroControl", "codigoGeneracion", "totalNoSuj", "totalExenta", "totalGravada", "totalOpeExpo", "totalOperaciones", "totalDonacion", "sumOpSinImpu", "montoGloDescNS", "montoGloDescVE", "montoGloDescVG", "montoGloDescVA", "montoGloDescOP", "porcMontoGloDesc", "totalDescBonRev", "resCodTributo", "nombreTributo", "valorTributo", "subTotal", "totalMonSujRet", "ivaPercibido", "ivaPercibidoLiq", "ivaRetenido", "retencionRenta", seguro, flete, "montoTotalOp", "totalCargoBasImpon", "totalAPagar", total, "totalIvaRetenido", "valorLetrasIvaRet", "valorLetras", iva13, "saldoAFavor", "condicionOpera", "codFormaPago", "montoPorFormaPag", "refModalidadPago", plazo, "periodoPlazo", "numPagoElecNPE", incoterms, descincoterms, observaciones) VALUES (4, 'DTE-03-CMPV0202-000000000003964', '2BC21107-E05D-4F87-A49C-77A444871C49', '0.00', '0.00', '0', NULL, NULL, NULL, '0', '0.00', '0.00', '0.00', NULL, NULL, '0.00', '0.00', NULL, '[{\"codigo\":\"20\",\"descripcion\":\"Impuesto al Valor Agregado 13%\",\"valor\":26.16}]', NULL, '0', NULL, '0', NULL, '0', '0.00', NULL, NULL, '26.16', '0.00', '26.16', NULL, NULL, NULL, 'CERO DOLARESS 00/100', '26.16', '0.00', '1', '01', '0', '', '01', '', '', NULL, NULL, NULL);
INSERT INTO public.resumen (id, "numeroControl", "codigoGeneracion", "totalNoSuj", "totalExenta", "totalGravada", "totalOpeExpo", "totalOperaciones", "totalDonacion", "sumOpSinImpu", "montoGloDescNS", "montoGloDescVE", "montoGloDescVG", "montoGloDescVA", "montoGloDescOP", "porcMontoGloDesc", "totalDescBonRev", "resCodTributo", "nombreTributo", "valorTributo", "subTotal", "totalMonSujRet", "ivaPercibido", "ivaPercibidoLiq", "ivaRetenido", "retencionRenta", seguro, flete, "montoTotalOp", "totalCargoBasImpon", "totalAPagar", total, "totalIvaRetenido", "valorLetrasIvaRet", "valorLetras", iva13, "saldoAFavor", "condicionOpera", "codFormaPago", "montoPorFormaPag", "refModalidadPago", plazo, "periodoPlazo", "numPagoElecNPE", incoterms, descincoterms, observaciones) VALUES (5, 'DTE-03-CMPV0202-000000000003965', 'B4A8EBD6-62C4-4511-8F89-7A1D8FF8F9DF', '0.00', '0.00', '0', NULL, NULL, NULL, '0', '0.00', '0.00', '0.00', NULL, NULL, '0.00', '0.00', NULL, '[{\"codigo\":\"20\",\"descripcion\":\"Impuesto al Valor Agregado 13%\",\"valor\":26.16}]', NULL, '0', NULL, '0', NULL, '0', '0.00', NULL, NULL, '26.16', '0.00', '26.16', NULL, NULL, NULL, 'CERO DOLARESS 00/100', '26.16', '0.00', '1', '01', '0', '', '01', '', '', NULL, NULL, NULL);
INSERT INTO public.resumen (id, "numeroControl", "codigoGeneracion", "totalNoSuj", "totalExenta", "totalGravada", "totalOpeExpo", "totalOperaciones", "totalDonacion", "sumOpSinImpu", "montoGloDescNS", "montoGloDescVE", "montoGloDescVG", "montoGloDescVA", "montoGloDescOP", "porcMontoGloDesc", "totalDescBonRev", "resCodTributo", "nombreTributo", "valorTributo", "subTotal", "totalMonSujRet", "ivaPercibido", "ivaPercibidoLiq", "ivaRetenido", "retencionRenta", seguro, flete, "montoTotalOp", "totalCargoBasImpon", "totalAPagar", total, "totalIvaRetenido", "valorLetrasIvaRet", "valorLetras", iva13, "saldoAFavor", "condicionOpera", "codFormaPago", "montoPorFormaPag", "refModalidadPago", plazo, "periodoPlazo", "numPagoElecNPE", incoterms, descincoterms, observaciones) VALUES (6, 'DTE-03-CMPV0202-000000000003966', '29174571-7067-498C-AE55-42E3A8B6BCFB', '0.00', '0.00', '0', NULL, NULL, NULL, '0', '0.00', '0.00', '0.00', NULL, NULL, '0.00', '0.00', NULL, '[{\"codigo\":\"20\",\"descripcion\":\"Impuesto al Valor Agregado 13%\",\"valor\":26.16}]', NULL, '0', NULL, '0', NULL, '0', '0.00', NULL, NULL, '26.16', '0.00', '26.16', NULL, NULL, NULL, 'CERO DOLARESS 00/100', '26.16', '0.00', '1', '01', '0', '', '01', '', '', NULL, NULL, NULL);
INSERT INTO public.resumen (id, "numeroControl", "codigoGeneracion", "totalNoSuj", "totalExenta", "totalGravada", "totalOpeExpo", "totalOperaciones", "totalDonacion", "sumOpSinImpu", "montoGloDescNS", "montoGloDescVE", "montoGloDescVG", "montoGloDescVA", "montoGloDescOP", "porcMontoGloDesc", "totalDescBonRev", "resCodTributo", "nombreTributo", "valorTributo", "subTotal", "totalMonSujRet", "ivaPercibido", "ivaPercibidoLiq", "ivaRetenido", "retencionRenta", seguro, flete, "montoTotalOp", "totalCargoBasImpon", "totalAPagar", total, "totalIvaRetenido", "valorLetrasIvaRet", "valorLetras", iva13, "saldoAFavor", "condicionOpera", "codFormaPago", "montoPorFormaPag", "refModalidadPago", plazo, "periodoPlazo", "numPagoElecNPE", incoterms, descincoterms, observaciones) VALUES (7, 'DTE-03-CMPV0202-000000000003967', 'A890BEC7-DC27-4B92-90AF-05EC58C92699', '0.00', '0.00', '0', NULL, NULL, NULL, '0', '0.00', '0.00', '0.00', NULL, NULL, '0.00', '0.00', NULL, '[{\"codigo\":\"20\",\"descripcion\":\"Impuesto al Valor Agregado 13%\",\"valor\":26.16}]', NULL, '0', NULL, '0', NULL, '0', '0.00', NULL, NULL, '26.16', '0.00', '26.16', NULL, NULL, NULL, 'CERO DOLARESS 00/100', '26.16', '0.00', '1', '01', '0', '', '01', '', '', NULL, NULL, NULL);
INSERT INTO public.resumen (id, "numeroControl", "codigoGeneracion", "totalNoSuj", "totalExenta", "totalGravada", "totalOpeExpo", "totalOperaciones", "totalDonacion", "sumOpSinImpu", "montoGloDescNS", "montoGloDescVE", "montoGloDescVG", "montoGloDescVA", "montoGloDescOP", "porcMontoGloDesc", "totalDescBonRev", "resCodTributo", "nombreTributo", "valorTributo", "subTotal", "totalMonSujRet", "ivaPercibido", "ivaPercibidoLiq", "ivaRetenido", "retencionRenta", seguro, flete, "montoTotalOp", "totalCargoBasImpon", "totalAPagar", total, "totalIvaRetenido", "valorLetrasIvaRet", "valorLetras", iva13, "saldoAFavor", "condicionOpera", "codFormaPago", "montoPorFormaPag", "refModalidadPago", plazo, "periodoPlazo", "numPagoElecNPE", incoterms, descincoterms, observaciones) VALUES (8, 'DTE-03-CMPV0202-000000000003968', 'D0D6C203-A842-46E4-A027-9E6B0260CCCC', '0.00', '0.00', '0', NULL, NULL, NULL, '0', '0.00', '0.00', '0.00', NULL, NULL, '0.00', '0.00', NULL, '[{\"codigo\":\"20\",\"descripcion\":\"Impuesto al Valor Agregado 13%\",\"valor\":26.16}]', NULL, '0', NULL, '0', NULL, '0', '0.00', NULL, NULL, '26.16', '0.00', '26.16', NULL, NULL, NULL, 'CERO DOLARESS 00/100', '26.16', '0.00', '1', '01', '0', '', '01', '', '', NULL, NULL, NULL);
INSERT INTO public.resumen (id, "numeroControl", "codigoGeneracion", "totalNoSuj", "totalExenta", "totalGravada", "totalOpeExpo", "totalOperaciones", "totalDonacion", "sumOpSinImpu", "montoGloDescNS", "montoGloDescVE", "montoGloDescVG", "montoGloDescVA", "montoGloDescOP", "porcMontoGloDesc", "totalDescBonRev", "resCodTributo", "nombreTributo", "valorTributo", "subTotal", "totalMonSujRet", "ivaPercibido", "ivaPercibidoLiq", "ivaRetenido", "retencionRenta", seguro, flete, "montoTotalOp", "totalCargoBasImpon", "totalAPagar", total, "totalIvaRetenido", "valorLetrasIvaRet", "valorLetras", iva13, "saldoAFavor", "condicionOpera", "codFormaPago", "montoPorFormaPag", "refModalidadPago", plazo, "periodoPlazo", "numPagoElecNPE", incoterms, descincoterms, observaciones) VALUES (9, 'DTE-03-CMPV0202-000000000003969', 'E107BAD3-CAAF-445F-BF4D-CE20703FBEAB', '0.00', '0.00', '0', NULL, NULL, NULL, '0', '0.00', '0.00', '0.00', NULL, NULL, '0.00', '0.00', NULL, '[{\"codigo\":\"20\",\"descripcion\":\"Impuesto al Valor Agregado 13%\",\"valor\":26.16}]', NULL, '0', NULL, '0', NULL, '0', '0.00', NULL, NULL, '26.16', '0.00', '26.16', NULL, NULL, NULL, 'CERO DOLARESS 00/100', '26.16', '0.00', '1', '01', '0', '', '01', '', '', NULL, NULL, NULL);
INSERT INTO public.resumen (id, "numeroControl", "codigoGeneracion", "totalNoSuj", "totalExenta", "totalGravada", "totalOpeExpo", "totalOperaciones", "totalDonacion", "sumOpSinImpu", "montoGloDescNS", "montoGloDescVE", "montoGloDescVG", "montoGloDescVA", "montoGloDescOP", "porcMontoGloDesc", "totalDescBonRev", "resCodTributo", "nombreTributo", "valorTributo", "subTotal", "totalMonSujRet", "ivaPercibido", "ivaPercibidoLiq", "ivaRetenido", "retencionRenta", seguro, flete, "montoTotalOp", "totalCargoBasImpon", "totalAPagar", total, "totalIvaRetenido", "valorLetrasIvaRet", "valorLetras", iva13, "saldoAFavor", "condicionOpera", "codFormaPago", "montoPorFormaPag", "refModalidadPago", plazo, "periodoPlazo", "numPagoElecNPE", incoterms, descincoterms, observaciones) VALUES (10, 'DTE-03-CMPV0202-000000000003970', '0930B690-67DB-461D-A739-1A5232834D40', '0.00', '0.00', '0', NULL, NULL, NULL, '0', '0.00', '0.00', '0.00', NULL, NULL, '0.00', '0.00', NULL, '[{\"codigo\":\"20\",\"descripcion\":\"Impuesto al Valor Agregado 13%\",\"valor\":26.16}]', NULL, '0', NULL, '0', NULL, '0', '0.00', NULL, NULL, '26.16', '0.00', '26.16', NULL, NULL, NULL, 'CERO DOLARESS 00/100', '26.16', '0.00', '1', '01', '0', '', '01', '', '', NULL, NULL, NULL);
INSERT INTO public.resumen (id, "numeroControl", "codigoGeneracion", "totalNoSuj", "totalExenta", "totalGravada", "totalOpeExpo", "totalOperaciones", "totalDonacion", "sumOpSinImpu", "montoGloDescNS", "montoGloDescVE", "montoGloDescVG", "montoGloDescVA", "montoGloDescOP", "porcMontoGloDesc", "totalDescBonRev", "resCodTributo", "nombreTributo", "valorTributo", "subTotal", "totalMonSujRet", "ivaPercibido", "ivaPercibidoLiq", "ivaRetenido", "retencionRenta", seguro, flete, "montoTotalOp", "totalCargoBasImpon", "totalAPagar", total, "totalIvaRetenido", "valorLetrasIvaRet", "valorLetras", iva13, "saldoAFavor", "condicionOpera", "codFormaPago", "montoPorFormaPag", "refModalidadPago", plazo, "periodoPlazo", "numPagoElecNPE", incoterms, descincoterms, observaciones) VALUES (11, 'DTE-03-CMPV0202-000000000003971', 'E8572C95-53D2-4CB0-B587-AB7FA9DEF1C4', '0.00', '0.00', '0', NULL, NULL, NULL, '0', '0.00', '0.00', '0.00', NULL, NULL, '0.00', '0.00', NULL, '[{\"codigo\":\"20\",\"descripcion\":\"Impuesto al Valor Agregado 13%\",\"valor\":26.16}]', NULL, '0', NULL, '0', NULL, '0', '0.00', NULL, NULL, '26.16', '0.00', '26.16', NULL, NULL, NULL, 'CERO DOLARESS 00/100', '26.16', '0.00', '1', '01', '0', '', '01', '', '', NULL, NULL, NULL);
INSERT INTO public.resumen (id, "numeroControl", "codigoGeneracion", "totalNoSuj", "totalExenta", "totalGravada", "totalOpeExpo", "totalOperaciones", "totalDonacion", "sumOpSinImpu", "montoGloDescNS", "montoGloDescVE", "montoGloDescVG", "montoGloDescVA", "montoGloDescOP", "porcMontoGloDesc", "totalDescBonRev", "resCodTributo", "nombreTributo", "valorTributo", "subTotal", "totalMonSujRet", "ivaPercibido", "ivaPercibidoLiq", "ivaRetenido", "retencionRenta", seguro, flete, "montoTotalOp", "totalCargoBasImpon", "totalAPagar", total, "totalIvaRetenido", "valorLetrasIvaRet", "valorLetras", iva13, "saldoAFavor", "condicionOpera", "codFormaPago", "montoPorFormaPag", "refModalidadPago", plazo, "periodoPlazo", "numPagoElecNPE", incoterms, descincoterms, observaciones) VALUES (12, 'DTE-03-CMPV0202-000000000003972', '9FB0D8F8-2818-4A41-B0D0-6171273B53E9', '0.00', '0.00', '0', NULL, NULL, NULL, '0', '0.00', '0.00', '0.00', NULL, NULL, '0.00', '0.00', NULL, '[{\"codigo\":\"20\",\"descripcion\":\"Impuesto al Valor Agregado 13%\",\"valor\":26.16}]', NULL, '0', NULL, '0', NULL, '0', '0.00', NULL, NULL, '26.16', '0.00', '26.16', NULL, NULL, NULL, 'CERO DOLARESS 00/100', '26.16', '0.00', '1', '01', '0', '', '01', '', '', NULL, NULL, NULL);
INSERT INTO public.resumen (id, "numeroControl", "codigoGeneracion", "totalNoSuj", "totalExenta", "totalGravada", "totalOpeExpo", "totalOperaciones", "totalDonacion", "sumOpSinImpu", "montoGloDescNS", "montoGloDescVE", "montoGloDescVG", "montoGloDescVA", "montoGloDescOP", "porcMontoGloDesc", "totalDescBonRev", "resCodTributo", "nombreTributo", "valorTributo", "subTotal", "totalMonSujRet", "ivaPercibido", "ivaPercibidoLiq", "ivaRetenido", "retencionRenta", seguro, flete, "montoTotalOp", "totalCargoBasImpon", "totalAPagar", total, "totalIvaRetenido", "valorLetrasIvaRet", "valorLetras", iva13, "saldoAFavor", "condicionOpera", "codFormaPago", "montoPorFormaPag", "refModalidadPago", plazo, "periodoPlazo", "numPagoElecNPE", incoterms, descincoterms, observaciones) VALUES (13, 'DTE-03-CMPV0202-000000000003973', '6438505D-BE64-46CC-A7A7-120DDC80B6FF', '0.00', '0.00', '0', NULL, NULL, NULL, '0', '0.00', '0.00', '0.00', NULL, NULL, '0.00', '0.00', NULL, '[{\"codigo\":\"20\",\"descripcion\":\"Impuesto al Valor Agregado 13%\",\"valor\":26.16}]', NULL, '0', NULL, '0', NULL, '0', '0.00', NULL, NULL, '26.16', '0.00', '26.16', NULL, NULL, NULL, 'CERO DOLARESS 00/100', '26.16', '0.00', '1', '01', '0', '', '01', '', '', NULL, NULL, NULL);
INSERT INTO public.resumen (id, "numeroControl", "codigoGeneracion", "totalNoSuj", "totalExenta", "totalGravada", "totalOpeExpo", "totalOperaciones", "totalDonacion", "sumOpSinImpu", "montoGloDescNS", "montoGloDescVE", "montoGloDescVG", "montoGloDescVA", "montoGloDescOP", "porcMontoGloDesc", "totalDescBonRev", "resCodTributo", "nombreTributo", "valorTributo", "subTotal", "totalMonSujRet", "ivaPercibido", "ivaPercibidoLiq", "ivaRetenido", "retencionRenta", seguro, flete, "montoTotalOp", "totalCargoBasImpon", "totalAPagar", total, "totalIvaRetenido", "valorLetrasIvaRet", "valorLetras", iva13, "saldoAFavor", "condicionOpera", "codFormaPago", "montoPorFormaPag", "refModalidadPago", plazo, "periodoPlazo", "numPagoElecNPE", incoterms, descincoterms, observaciones) VALUES (14, 'DTE-03-CMPV0202-000000000003974', 'C6D0A5BA-29A2-4A46-B17B-624E8A2EABB3', '0.00', '0.00', '199.2', NULL, NULL, NULL, '199.2', '0.00', '0.00', '0.00', NULL, NULL, '0.00', '0.00', NULL, '[{\"codigo\":\"20\",\"descripcion\":\"Impuesto al Valor Agregado 13%\",\"valor\":26.16}]', NULL, '199.2', NULL, '0', NULL, '0', '0.00', NULL, NULL, '225.36', '0.00', '225.36', NULL, NULL, NULL, 'CIENTO NOVENTA Y NUEVE DOLARESS 20/100', '26.16', '0.00', '1', '01', '199.2', '', '01', '', '', NULL, NULL, NULL);
INSERT INTO public.resumen (id, "numeroControl", "codigoGeneracion", "totalNoSuj", "totalExenta", "totalGravada", "totalOpeExpo", "totalOperaciones", "totalDonacion", "sumOpSinImpu", "montoGloDescNS", "montoGloDescVE", "montoGloDescVG", "montoGloDescVA", "montoGloDescOP", "porcMontoGloDesc", "totalDescBonRev", "resCodTributo", "nombreTributo", "valorTributo", "subTotal", "totalMonSujRet", "ivaPercibido", "ivaPercibidoLiq", "ivaRetenido", "retencionRenta", seguro, flete, "montoTotalOp", "totalCargoBasImpon", "totalAPagar", total, "totalIvaRetenido", "valorLetrasIvaRet", "valorLetras", iva13, "saldoAFavor", "condicionOpera", "codFormaPago", "montoPorFormaPag", "refModalidadPago", plazo, "periodoPlazo", "numPagoElecNPE", incoterms, descincoterms, observaciones) VALUES (15, 'DTE-03-CMPV0202-000000000003975', '7AEE2981-DB26-400B-A33C-755C42E06986', '0.00', '0.00', '199.2', NULL, NULL, NULL, '199.2', '0.00', '0.00', '0.00', NULL, NULL, '0.00', '0.00', NULL, '[{\"codigo\":\"20\",\"descripcion\":\"Impuesto al Valor Agregado 13%\",\"valor\":26.16}]', NULL, '199.2', NULL, '0', NULL, '0', '0.00', NULL, NULL, '225.36', '0.00', '225.36', NULL, NULL, NULL, 'CIENTO NOVENTA Y NUEVE DOLARESS 20/100', '26.16', '0.00', '1', '01', '199.2', '', '01', '', '', NULL, NULL, NULL);
INSERT INTO public.resumen (id, "numeroControl", "codigoGeneracion", "totalNoSuj", "totalExenta", "totalGravada", "totalOpeExpo", "totalOperaciones", "totalDonacion", "sumOpSinImpu", "montoGloDescNS", "montoGloDescVE", "montoGloDescVG", "montoGloDescVA", "montoGloDescOP", "porcMontoGloDesc", "totalDescBonRev", "resCodTributo", "nombreTributo", "valorTributo", "subTotal", "totalMonSujRet", "ivaPercibido", "ivaPercibidoLiq", "ivaRetenido", "retencionRenta", seguro, flete, "montoTotalOp", "totalCargoBasImpon", "totalAPagar", total, "totalIvaRetenido", "valorLetrasIvaRet", "valorLetras", iva13, "saldoAFavor", "condicionOpera", "codFormaPago", "montoPorFormaPag", "refModalidadPago", plazo, "periodoPlazo", "numPagoElecNPE", incoterms, descincoterms, observaciones) VALUES (16, 'DTE-03-CMPV0202-000000000003976', '94410371-3B92-46DC-8D4B-5552A0F05122', '0.00', '0.00', '199.2', NULL, NULL, NULL, '199.2', '0.00', '0.00', '0.00', NULL, NULL, '0.00', '0.00', NULL, '[{\"codigo\":\"20\",\"descripcion\":\"Impuesto al Valor Agregado 13%\",\"valor\":26.16}]', NULL, '199.2', NULL, '0', NULL, '0', '0.00', NULL, NULL, '225.36', '0.00', '225.36', NULL, NULL, NULL, 'CIENTO NOVENTA Y NUEVE DOLARESS 20/100', '26.16', '0.00', '1', '01', '199.2', '', '01', '', '', NULL, NULL, NULL);
INSERT INTO public.resumen (id, "numeroControl", "codigoGeneracion", "totalNoSuj", "totalExenta", "totalGravada", "totalOpeExpo", "totalOperaciones", "totalDonacion", "sumOpSinImpu", "montoGloDescNS", "montoGloDescVE", "montoGloDescVG", "montoGloDescVA", "montoGloDescOP", "porcMontoGloDesc", "totalDescBonRev", "resCodTributo", "nombreTributo", "valorTributo", "subTotal", "totalMonSujRet", "ivaPercibido", "ivaPercibidoLiq", "ivaRetenido", "retencionRenta", seguro, flete, "montoTotalOp", "totalCargoBasImpon", "totalAPagar", total, "totalIvaRetenido", "valorLetrasIvaRet", "valorLetras", iva13, "saldoAFavor", "condicionOpera", "codFormaPago", "montoPorFormaPag", "refModalidadPago", plazo, "periodoPlazo", "numPagoElecNPE", incoterms, descincoterms, observaciones) VALUES (17, 'DTE-03-CMPV0202-000000000003977', 'DE59BC3A-3473-4994-91E6-F11DDB9746D1', '0.00', '0.00', '199.2', NULL, NULL, NULL, '199.2', '0.00', '0.00', '0.00', NULL, NULL, '0.00', '0.00', NULL, '[{\"codigo\":\"20\",\"descripcion\":\"Impuesto al Valor Agregado 13%\",\"valor\":26.16}]', NULL, '199.2', NULL, '0', NULL, '0', '0.00', NULL, NULL, '225.36', '0.00', '225.36', NULL, NULL, NULL, 'CIENTO NOVENTA Y NUEVE DOLARESS 20/100', '26.16', '0.00', '1', '01', '199.2', '', '01', '', '', NULL, NULL, NULL);
INSERT INTO public.resumen (id, "numeroControl", "codigoGeneracion", "totalNoSuj", "totalExenta", "totalGravada", "totalOpeExpo", "totalOperaciones", "totalDonacion", "sumOpSinImpu", "montoGloDescNS", "montoGloDescVE", "montoGloDescVG", "montoGloDescVA", "montoGloDescOP", "porcMontoGloDesc", "totalDescBonRev", "resCodTributo", "nombreTributo", "valorTributo", "subTotal", "totalMonSujRet", "ivaPercibido", "ivaPercibidoLiq", "ivaRetenido", "retencionRenta", seguro, flete, "montoTotalOp", "totalCargoBasImpon", "totalAPagar", total, "totalIvaRetenido", "valorLetrasIvaRet", "valorLetras", iva13, "saldoAFavor", "condicionOpera", "codFormaPago", "montoPorFormaPag", "refModalidadPago", plazo, "periodoPlazo", "numPagoElecNPE", incoterms, descincoterms, observaciones) VALUES (18, 'DTE-03-CMPV0202-000000000003978', 'F41EC2AA-75DB-4063-BF3F-96BF20A9F0FE', '0.00', '0.00', '199.2', NULL, NULL, NULL, '199.2', '0.00', '0.00', '0.00', NULL, NULL, '0.00', '0.00', NULL, '[{\"codigo\":\"20\",\"descripcion\":\"Impuesto al Valor Agregado 13%\",\"valor\":26.16}]', NULL, '199.2', NULL, '0', NULL, '0', '0.00', NULL, NULL, '225.36', '0.00', '225.36', NULL, NULL, NULL, 'CIENTO NOVENTA Y NUEVE DOLARESS 20/100', '26.16', '0.00', '1', '01', '199.2', '', '01', '', '', NULL, NULL, NULL);
INSERT INTO public.resumen (id, "numeroControl", "codigoGeneracion", "totalNoSuj", "totalExenta", "totalGravada", "totalOpeExpo", "totalOperaciones", "totalDonacion", "sumOpSinImpu", "montoGloDescNS", "montoGloDescVE", "montoGloDescVG", "montoGloDescVA", "montoGloDescOP", "porcMontoGloDesc", "totalDescBonRev", "resCodTributo", "nombreTributo", "valorTributo", "subTotal", "totalMonSujRet", "ivaPercibido", "ivaPercibidoLiq", "ivaRetenido", "retencionRenta", seguro, flete, "montoTotalOp", "totalCargoBasImpon", "totalAPagar", total, "totalIvaRetenido", "valorLetrasIvaRet", "valorLetras", iva13, "saldoAFavor", "condicionOpera", "codFormaPago", "montoPorFormaPag", "refModalidadPago", plazo, "periodoPlazo", "numPagoElecNPE", incoterms, descincoterms, observaciones) VALUES (19, 'DTE-03-CMPV0202-000000000003979', 'D5A3E5D4-7ED8-495D-B3CF-569D8BA38F57', '0.00', '0.00', '199.2', NULL, NULL, NULL, '199.2', '0.00', '0.00', '0.00', NULL, NULL, '0.00', '0.00', NULL, '[{\"codigo\":\"20\",\"descripcion\":\"Impuesto al Valor Agregado 13%\",\"valor\":26.16}]', NULL, '199.2', NULL, '0', NULL, '0', '0.00', NULL, NULL, '225.36', '0.00', '225.36', NULL, NULL, NULL, 'CIENTO NOVENTA Y NUEVE DOLARESS 20/100', '26.16', '0.00', '1', '01', '199.2', '', '01', '', '', NULL, NULL, NULL);
INSERT INTO public.resumen (id, "numeroControl", "codigoGeneracion", "totalNoSuj", "totalExenta", "totalGravada", "totalOpeExpo", "totalOperaciones", "totalDonacion", "sumOpSinImpu", "montoGloDescNS", "montoGloDescVE", "montoGloDescVG", "montoGloDescVA", "montoGloDescOP", "porcMontoGloDesc", "totalDescBonRev", "resCodTributo", "nombreTributo", "valorTributo", "subTotal", "totalMonSujRet", "ivaPercibido", "ivaPercibidoLiq", "ivaRetenido", "retencionRenta", seguro, flete, "montoTotalOp", "totalCargoBasImpon", "totalAPagar", total, "totalIvaRetenido", "valorLetrasIvaRet", "valorLetras", iva13, "saldoAFavor", "condicionOpera", "codFormaPago", "montoPorFormaPag", "refModalidadPago", plazo, "periodoPlazo", "numPagoElecNPE", incoterms, descincoterms, observaciones) VALUES (20, 'DTE-03-CMPV0202-000000000003980', '8EB51F9E-662A-44F2-B5FA-0A0ECB940995', '0.00', '0.00', '199.2', NULL, NULL, NULL, '199.2', '0.00', '0.00', '0.00', NULL, NULL, '0.00', '0.00', NULL, '[{\"codigo\":\"20\",\"descripcion\":\"Impuesto al Valor Agregado 13%\",\"valor\":26.16}]', NULL, '199.2', NULL, '0', NULL, '0', '0.00', NULL, NULL, '225.36', '0.00', '225.36', NULL, NULL, NULL, 'CIENTO NOVENTA Y NUEVE DOLARESS 20/100', '26.16', '0.00', '1', '01', '199.2', '', '01', '', '', NULL, NULL, NULL);
INSERT INTO public.resumen (id, "numeroControl", "codigoGeneracion", "totalNoSuj", "totalExenta", "totalGravada", "totalOpeExpo", "totalOperaciones", "totalDonacion", "sumOpSinImpu", "montoGloDescNS", "montoGloDescVE", "montoGloDescVG", "montoGloDescVA", "montoGloDescOP", "porcMontoGloDesc", "totalDescBonRev", "resCodTributo", "nombreTributo", "valorTributo", "subTotal", "totalMonSujRet", "ivaPercibido", "ivaPercibidoLiq", "ivaRetenido", "retencionRenta", seguro, flete, "montoTotalOp", "totalCargoBasImpon", "totalAPagar", total, "totalIvaRetenido", "valorLetrasIvaRet", "valorLetras", iva13, "saldoAFavor", "condicionOpera", "codFormaPago", "montoPorFormaPag", "refModalidadPago", plazo, "periodoPlazo", "numPagoElecNPE", incoterms, descincoterms, observaciones) VALUES (21, 'DTE-03-CMPV0202-000000000003981', 'DD7277CF-28FA-4F15-881F-BF757119E122', '0.00', '0.00', '199.2', NULL, NULL, NULL, '199.2', '0.00', '0.00', '0.00', NULL, NULL, '0.00', '0.00', NULL, '[{\"codigo\":\"20\",\"descripcion\":\"Impuesto al Valor Agregado 13%\",\"valor\":26.16}]', NULL, '199.2', NULL, '0', NULL, '0', '0.00', NULL, NULL, '225.36', '0.00', '225.36', NULL, NULL, NULL, 'CIENTO NOVENTA Y NUEVE DOLARESS 20/100', '26.16', '0.00', '1', '01', '199.2', '', '01', '', '', NULL, NULL, NULL);
INSERT INTO public.resumen (id, "numeroControl", "codigoGeneracion", "totalNoSuj", "totalExenta", "totalGravada", "totalOpeExpo", "totalOperaciones", "totalDonacion", "sumOpSinImpu", "montoGloDescNS", "montoGloDescVE", "montoGloDescVG", "montoGloDescVA", "montoGloDescOP", "porcMontoGloDesc", "totalDescBonRev", "resCodTributo", "nombreTributo", "valorTributo", "subTotal", "totalMonSujRet", "ivaPercibido", "ivaPercibidoLiq", "ivaRetenido", "retencionRenta", seguro, flete, "montoTotalOp", "totalCargoBasImpon", "totalAPagar", total, "totalIvaRetenido", "valorLetrasIvaRet", "valorLetras", iva13, "saldoAFavor", "condicionOpera", "codFormaPago", "montoPorFormaPag", "refModalidadPago", plazo, "periodoPlazo", "numPagoElecNPE", incoterms, descincoterms, observaciones) VALUES (22, 'DTE-03-CMPV0202-000000000003982', '17BCBD36-49C2-4CA0-A4A7-69A3C79E3AF5', '0.00', '0.00', '199.2', NULL, NULL, NULL, '199.2', '0.00', '0.00', '0.00', NULL, NULL, '0.00', '0.00', NULL, '[{\"codigo\":\"20\",\"descripcion\":\"Impuesto al Valor Agregado 13%\",\"valor\":26.16}]', NULL, '199.2', NULL, '0', NULL, '0', '0.00', NULL, NULL, '225.36', '0.00', '225.36', NULL, NULL, NULL, 'CIENTO NOVENTA Y NUEVE DOLARESS 20/100', '26.16', '0.00', '1', '01', '199.2', '', '01', '', '', NULL, NULL, NULL);
INSERT INTO public.resumen (id, "numeroControl", "codigoGeneracion", "totalNoSuj", "totalExenta", "totalGravada", "totalOpeExpo", "totalOperaciones", "totalDonacion", "sumOpSinImpu", "montoGloDescNS", "montoGloDescVE", "montoGloDescVG", "montoGloDescVA", "montoGloDescOP", "porcMontoGloDesc", "totalDescBonRev", "resCodTributo", "nombreTributo", "valorTributo", "subTotal", "totalMonSujRet", "ivaPercibido", "ivaPercibidoLiq", "ivaRetenido", "retencionRenta", seguro, flete, "montoTotalOp", "totalCargoBasImpon", "totalAPagar", total, "totalIvaRetenido", "valorLetrasIvaRet", "valorLetras", iva13, "saldoAFavor", "condicionOpera", "codFormaPago", "montoPorFormaPag", "refModalidadPago", plazo, "periodoPlazo", "numPagoElecNPE", incoterms, descincoterms, observaciones) VALUES (23, 'DTE-03-CMPV0202-000000000003983', '2D6B3A42-6375-4BB1-8162-65AB0DBCC585', '0.00', '0.00', '199.2', NULL, NULL, NULL, '199.2', '0.00', '0.00', '0.00', NULL, NULL, '0.00', '0.00', NULL, '[{\"codigo\":\"20\",\"descripcion\":\"Impuesto al Valor Agregado 13%\",\"valor\":26.16}]', NULL, '199.2', NULL, '0', NULL, '0', '0.00', NULL, NULL, '225.36', '0.00', '225.36', NULL, NULL, NULL, 'CIENTO NOVENTA Y NUEVE DOLARESS 20/100', '26.16', '0.00', '1', '01', '199.2', '', '01', '', '', NULL, NULL, NULL);
INSERT INTO public.resumen (id, "numeroControl", "codigoGeneracion", "totalNoSuj", "totalExenta", "totalGravada", "totalOpeExpo", "totalOperaciones", "totalDonacion", "sumOpSinImpu", "montoGloDescNS", "montoGloDescVE", "montoGloDescVG", "montoGloDescVA", "montoGloDescOP", "porcMontoGloDesc", "totalDescBonRev", "resCodTributo", "nombreTributo", "valorTributo", "subTotal", "totalMonSujRet", "ivaPercibido", "ivaPercibidoLiq", "ivaRetenido", "retencionRenta", seguro, flete, "montoTotalOp", "totalCargoBasImpon", "totalAPagar", total, "totalIvaRetenido", "valorLetrasIvaRet", "valorLetras", iva13, "saldoAFavor", "condicionOpera", "codFormaPago", "montoPorFormaPag", "refModalidadPago", plazo, "periodoPlazo", "numPagoElecNPE", incoterms, descincoterms, observaciones) VALUES (24, 'DTE-03-CMPV0202-000000000003984', '564B591C-2DA3-4204-A595-D9A740883E11', '0.00', '0.00', '199.2', NULL, NULL, NULL, '199.2', '0.00', '0.00', '0.00', NULL, NULL, '0.00', '0.00', NULL, '[{\"codigo\":\"20\",\"descripcion\":\"Impuesto al Valor Agregado 13%\",\"valor\":26.16}]', NULL, '199.2', NULL, '0', NULL, '0', '0.00', NULL, NULL, '225.36', '0.00', '225.36', NULL, NULL, NULL, 'CIENTO NOVENTA Y NUEVE DOLARESS 20/100', '26.16', '0.00', '1', '01', '199.2', '', '01', '', '', NULL, NULL, NULL);
INSERT INTO public.resumen (id, "numeroControl", "codigoGeneracion", "totalNoSuj", "totalExenta", "totalGravada", "totalOpeExpo", "totalOperaciones", "totalDonacion", "sumOpSinImpu", "montoGloDescNS", "montoGloDescVE", "montoGloDescVG", "montoGloDescVA", "montoGloDescOP", "porcMontoGloDesc", "totalDescBonRev", "resCodTributo", "nombreTributo", "valorTributo", "subTotal", "totalMonSujRet", "ivaPercibido", "ivaPercibidoLiq", "ivaRetenido", "retencionRenta", seguro, flete, "montoTotalOp", "totalCargoBasImpon", "totalAPagar", total, "totalIvaRetenido", "valorLetrasIvaRet", "valorLetras", iva13, "saldoAFavor", "condicionOpera", "codFormaPago", "montoPorFormaPag", "refModalidadPago", plazo, "periodoPlazo", "numPagoElecNPE", incoterms, descincoterms, observaciones) VALUES (25, 'DTE-03-CMPV0202-000000000003985', '02420099-5CD5-4F04-B6A3-448BAAF1B30B', '0.00', '0.00', '199.2', NULL, NULL, NULL, '199.2', '0.00', '0.00', '0.00', NULL, NULL, '0.00', '0.00', NULL, '[{\"codigo\":\"20\",\"descripcion\":\"Impuesto al Valor Agregado 13%\",\"valor\":26.16}]', NULL, '199.2', NULL, '0', NULL, '0', '0.00', NULL, NULL, '225.36', '0.00', '225.36', NULL, NULL, NULL, 'CIENTO NOVENTA Y NUEVE DOLARESS 20/100', '26.16', '0.00', '1', '01', '199.2', '', '01', '', '', NULL, NULL, NULL);
INSERT INTO public.resumen (id, "numeroControl", "codigoGeneracion", "totalNoSuj", "totalExenta", "totalGravada", "totalOpeExpo", "totalOperaciones", "totalDonacion", "sumOpSinImpu", "montoGloDescNS", "montoGloDescVE", "montoGloDescVG", "montoGloDescVA", "montoGloDescOP", "porcMontoGloDesc", "totalDescBonRev", "resCodTributo", "nombreTributo", "valorTributo", "subTotal", "totalMonSujRet", "ivaPercibido", "ivaPercibidoLiq", "ivaRetenido", "retencionRenta", seguro, flete, "montoTotalOp", "totalCargoBasImpon", "totalAPagar", total, "totalIvaRetenido", "valorLetrasIvaRet", "valorLetras", iva13, "saldoAFavor", "condicionOpera", "codFormaPago", "montoPorFormaPag", "refModalidadPago", plazo, "periodoPlazo", "numPagoElecNPE", incoterms, descincoterms, observaciones) VALUES (26, 'DTE-03-CMPV0202-000000000003986', '43AA7CEF-B070-46F6-89A0-18FEC495CCA8', '0.00', '0.00', '199.2', NULL, NULL, NULL, '199.2', '0.00', '0.00', '0.00', NULL, NULL, '0.00', '0.00', NULL, '[{\"codigo\":\"20\",\"descripcion\":\"Impuesto al Valor Agregado 13%\",\"valor\":26.16}]', NULL, '199.2', NULL, '0', NULL, '0', '0.00', NULL, NULL, '225.36', '0.00', '225.36', NULL, NULL, NULL, 'CIENTO NOVENTA Y NUEVE DOLARESS 20/100', '26.16', '0.00', '1', '01', '199.2', '', '01', '', '', NULL, NULL, NULL);
INSERT INTO public.resumen (id, "numeroControl", "codigoGeneracion", "totalNoSuj", "totalExenta", "totalGravada", "totalOpeExpo", "totalOperaciones", "totalDonacion", "sumOpSinImpu", "montoGloDescNS", "montoGloDescVE", "montoGloDescVG", "montoGloDescVA", "montoGloDescOP", "porcMontoGloDesc", "totalDescBonRev", "resCodTributo", "nombreTributo", "valorTributo", "subTotal", "totalMonSujRet", "ivaPercibido", "ivaPercibidoLiq", "ivaRetenido", "retencionRenta", seguro, flete, "montoTotalOp", "totalCargoBasImpon", "totalAPagar", total, "totalIvaRetenido", "valorLetrasIvaRet", "valorLetras", iva13, "saldoAFavor", "condicionOpera", "codFormaPago", "montoPorFormaPag", "refModalidadPago", plazo, "periodoPlazo", "numPagoElecNPE", incoterms, descincoterms, observaciones) VALUES (27, 'DTE-03-CMPV0202-000000000003987', '5D61675C-260E-44FD-A3BA-57805A5DA2D2', '0.00', '0.00', '199.2', NULL, NULL, NULL, '199.2', '0.00', '0.00', '0.00', NULL, NULL, '0.00', '0.00', NULL, '[{\"codigo\":\"20\",\"descripcion\":\"Impuesto al Valor Agregado 13%\",\"valor\":26.16}]', NULL, '199.2', NULL, '0', NULL, '0', '0.00', NULL, NULL, '225.36', '0.00', '225.36', NULL, NULL, NULL, 'CIENTO NOVENTA Y NUEVE DOLARESS 20/100', '26.16', '0.00', '1', '01', '199.2', '', '01', '', '', NULL, NULL, NULL);
INSERT INTO public.resumen (id, "numeroControl", "codigoGeneracion", "totalNoSuj", "totalExenta", "totalGravada", "totalOpeExpo", "totalOperaciones", "totalDonacion", "sumOpSinImpu", "montoGloDescNS", "montoGloDescVE", "montoGloDescVG", "montoGloDescVA", "montoGloDescOP", "porcMontoGloDesc", "totalDescBonRev", "resCodTributo", "nombreTributo", "valorTributo", "subTotal", "totalMonSujRet", "ivaPercibido", "ivaPercibidoLiq", "ivaRetenido", "retencionRenta", seguro, flete, "montoTotalOp", "totalCargoBasImpon", "totalAPagar", total, "totalIvaRetenido", "valorLetrasIvaRet", "valorLetras", iva13, "saldoAFavor", "condicionOpera", "codFormaPago", "montoPorFormaPag", "refModalidadPago", plazo, "periodoPlazo", "numPagoElecNPE", incoterms, descincoterms, observaciones) VALUES (28, 'DTE-03-CMPV0202-000000000003988', '6EB3F012-7404-46C4-908A-6F5175D8CE02', '0.00', '0.00', '199.2', NULL, NULL, NULL, '199.2', '0.00', '0.00', '0.00', NULL, NULL, '0.00', '0.00', NULL, '[{\"codigo\":\"20\",\"descripcion\":\"Impuesto al Valor Agregado 13%\",\"valor\":26.16}]', NULL, '199.2', NULL, '0', NULL, '0', '0.00', NULL, NULL, '225.36', '0.00', '225.36', NULL, NULL, NULL, 'CIENTO NOVENTA Y NUEVE DOLARESS 20/100', '26.16', '0.00', '1', '01', '199.2', '', '01', '', '', NULL, NULL, NULL);
INSERT INTO public.resumen (id, "numeroControl", "codigoGeneracion", "totalNoSuj", "totalExenta", "totalGravada", "totalOpeExpo", "totalOperaciones", "totalDonacion", "sumOpSinImpu", "montoGloDescNS", "montoGloDescVE", "montoGloDescVG", "montoGloDescVA", "montoGloDescOP", "porcMontoGloDesc", "totalDescBonRev", "resCodTributo", "nombreTributo", "valorTributo", "subTotal", "totalMonSujRet", "ivaPercibido", "ivaPercibidoLiq", "ivaRetenido", "retencionRenta", seguro, flete, "montoTotalOp", "totalCargoBasImpon", "totalAPagar", total, "totalIvaRetenido", "valorLetrasIvaRet", "valorLetras", iva13, "saldoAFavor", "condicionOpera", "codFormaPago", "montoPorFormaPag", "refModalidadPago", plazo, "periodoPlazo", "numPagoElecNPE", incoterms, descincoterms, observaciones) VALUES (29, 'DTE-03-CMPV0202-000000000003989', '9E76C69B-6AF3-41F0-A4BE-8C21E52D7CEB', '0.00', '0.00', '199.2', NULL, NULL, NULL, '199.2', '0.00', '0.00', '0.00', NULL, NULL, '0.00', '0.00', NULL, '[{\"codigo\":\"20\",\"descripcion\":\"Impuesto al Valor Agregado 13%\",\"valor\":26.16}]', NULL, '199.2', NULL, '0', NULL, '0', '0.00', NULL, NULL, '225.36', '0.00', '225.36', NULL, NULL, NULL, 'CIENTO NOVENTA Y NUEVE DOLARESS 20/100', '26.16', '0.00', '1', '01', '199.2', '', '01', '', '', NULL, NULL, NULL);
INSERT INTO public.resumen (id, "numeroControl", "codigoGeneracion", "totalNoSuj", "totalExenta", "totalGravada", "totalOpeExpo", "totalOperaciones", "totalDonacion", "sumOpSinImpu", "montoGloDescNS", "montoGloDescVE", "montoGloDescVG", "montoGloDescVA", "montoGloDescOP", "porcMontoGloDesc", "totalDescBonRev", "resCodTributo", "nombreTributo", "valorTributo", "subTotal", "totalMonSujRet", "ivaPercibido", "ivaPercibidoLiq", "ivaRetenido", "retencionRenta", seguro, flete, "montoTotalOp", "totalCargoBasImpon", "totalAPagar", total, "totalIvaRetenido", "valorLetrasIvaRet", "valorLetras", iva13, "saldoAFavor", "condicionOpera", "codFormaPago", "montoPorFormaPag", "refModalidadPago", plazo, "periodoPlazo", "numPagoElecNPE", incoterms, descincoterms, observaciones) VALUES (30, 'DTE-03-CMPV0202-000000000003990', '8A74DCB8-B243-4C27-9F97-125584B4B103', '0.00', '0.00', '199.2', NULL, NULL, NULL, '199.2', '0.00', '0.00', '0.00', NULL, NULL, '0.00', '0.00', NULL, '[{\"codigo\":\"20\",\"descripcion\":\"Impuesto al Valor Agregado 13%\",\"valor\":26.16}]', NULL, '199.2', NULL, '0', NULL, '0', '0.00', NULL, NULL, '225.36', '0.00', '225.36', NULL, NULL, NULL, 'CIENTO NOVENTA Y NUEVE DOLARESS 20/100', '26.16', '0.00', '1', '01', '199.2', '', '01', '', '', NULL, NULL, NULL);
INSERT INTO public.resumen (id, "numeroControl", "codigoGeneracion", "totalNoSuj", "totalExenta", "totalGravada", "totalOpeExpo", "totalOperaciones", "totalDonacion", "sumOpSinImpu", "montoGloDescNS", "montoGloDescVE", "montoGloDescVG", "montoGloDescVA", "montoGloDescOP", "porcMontoGloDesc", "totalDescBonRev", "resCodTributo", "nombreTributo", "valorTributo", "subTotal", "totalMonSujRet", "ivaPercibido", "ivaPercibidoLiq", "ivaRetenido", "retencionRenta", seguro, flete, "montoTotalOp", "totalCargoBasImpon", "totalAPagar", total, "totalIvaRetenido", "valorLetrasIvaRet", "valorLetras", iva13, "saldoAFavor", "condicionOpera", "codFormaPago", "montoPorFormaPag", "refModalidadPago", plazo, "periodoPlazo", "numPagoElecNPE", incoterms, descincoterms, observaciones) VALUES (31, 'DTE-03-CMPV0202-000000000003991', '584F066E-5FA3-4AEC-80FB-926901353051', '0.00', '0.00', '199.2', NULL, NULL, NULL, '199.2', '0.00', '0.00', '0.00', NULL, NULL, '0.00', '0.00', NULL, '[{\"codigo\":\"20\",\"descripcion\":\"Impuesto al Valor Agregado 13%\",\"valor\":26.16}]', NULL, '199.2', NULL, '0', NULL, '0', '0.00', NULL, NULL, '225.36', '0.00', '225.36', NULL, NULL, NULL, 'CIENTO NOVENTA Y NUEVE DOLARESS 20/100', '26.16', '0.00', '1', '01', '199.2', '', '01', '', '', NULL, NULL, NULL);
INSERT INTO public.resumen (id, "numeroControl", "codigoGeneracion", "totalNoSuj", "totalExenta", "totalGravada", "totalOpeExpo", "totalOperaciones", "totalDonacion", "sumOpSinImpu", "montoGloDescNS", "montoGloDescVE", "montoGloDescVG", "montoGloDescVA", "montoGloDescOP", "porcMontoGloDesc", "totalDescBonRev", "resCodTributo", "nombreTributo", "valorTributo", "subTotal", "totalMonSujRet", "ivaPercibido", "ivaPercibidoLiq", "ivaRetenido", "retencionRenta", seguro, flete, "montoTotalOp", "totalCargoBasImpon", "totalAPagar", total, "totalIvaRetenido", "valorLetrasIvaRet", "valorLetras", iva13, "saldoAFavor", "condicionOpera", "codFormaPago", "montoPorFormaPag", "refModalidadPago", plazo, "periodoPlazo", "numPagoElecNPE", incoterms, descincoterms, observaciones) VALUES (32, 'DTE-03-CMPV0202-000000000003992', 'E9ABB697-938D-4924-A7E7-55C1C7E49AE0', '0.00', '0.00', '199.2', NULL, NULL, NULL, '199.2', '0.00', '0.00', '0.00', NULL, NULL, '0.00', '0.00', NULL, '[{\"codigo\":\"20\",\"descripcion\":\"Impuesto al Valor Agregado 13%\",\"valor\":26.16}]', NULL, '199.2', NULL, '0', NULL, '0', '0.00', NULL, NULL, '225.36', '0.00', '225.36', NULL, NULL, NULL, 'CIENTO NOVENTA Y NUEVE DOLARESS 20/100', '26.16', '0.00', '1', '01', '199.2', '', '01', '', '', NULL, NULL, NULL);
INSERT INTO public.resumen (id, "numeroControl", "codigoGeneracion", "totalNoSuj", "totalExenta", "totalGravada", "totalOpeExpo", "totalOperaciones", "totalDonacion", "sumOpSinImpu", "montoGloDescNS", "montoGloDescVE", "montoGloDescVG", "montoGloDescVA", "montoGloDescOP", "porcMontoGloDesc", "totalDescBonRev", "resCodTributo", "nombreTributo", "valorTributo", "subTotal", "totalMonSujRet", "ivaPercibido", "ivaPercibidoLiq", "ivaRetenido", "retencionRenta", seguro, flete, "montoTotalOp", "totalCargoBasImpon", "totalAPagar", total, "totalIvaRetenido", "valorLetrasIvaRet", "valorLetras", iva13, "saldoAFavor", "condicionOpera", "codFormaPago", "montoPorFormaPag", "refModalidadPago", plazo, "periodoPlazo", "numPagoElecNPE", incoterms, descincoterms, observaciones) VALUES (33, 'DTE-03-CMPV0202-000000000003993', '8C38260B-247F-4A78-B83F-2B76CDA85224', '0.00', '0.00', '199.2', NULL, NULL, NULL, '199.2', '0.00', '0.00', '0.00', NULL, NULL, '0.00', '0.00', NULL, '[{\"codigo\":\"20\",\"descripcion\":\"Impuesto al Valor Agregado 13%\",\"valor\":26.16}]', NULL, '199.2', NULL, '0', NULL, '0', '0.00', NULL, NULL, '225.36', '0.00', '225.36', NULL, NULL, NULL, 'CIENTO NOVENTA Y NUEVE DOLARESS 20/100', '26.16', '0.00', '1', '01', '199.2', '', '01', '', '', NULL, NULL, NULL);
INSERT INTO public.resumen (id, "numeroControl", "codigoGeneracion", "totalNoSuj", "totalExenta", "totalGravada", "totalOpeExpo", "totalOperaciones", "totalDonacion", "sumOpSinImpu", "montoGloDescNS", "montoGloDescVE", "montoGloDescVG", "montoGloDescVA", "montoGloDescOP", "porcMontoGloDesc", "totalDescBonRev", "resCodTributo", "nombreTributo", "valorTributo", "subTotal", "totalMonSujRet", "ivaPercibido", "ivaPercibidoLiq", "ivaRetenido", "retencionRenta", seguro, flete, "montoTotalOp", "totalCargoBasImpon", "totalAPagar", total, "totalIvaRetenido", "valorLetrasIvaRet", "valorLetras", iva13, "saldoAFavor", "condicionOpera", "codFormaPago", "montoPorFormaPag", "refModalidadPago", plazo, "periodoPlazo", "numPagoElecNPE", incoterms, descincoterms, observaciones) VALUES (34, 'DTE-03-CMPV0202-000000000003994', '1EEACAC8-002D-49E9-8E30-253F94D8AFC0', '0.00', '0.00', '199.2', NULL, NULL, NULL, '199.2', '0.00', '0.00', '0.00', NULL, NULL, '0.00', '0.00', NULL, '[{\"codigo\":\"20\",\"descripcion\":\"Impuesto al Valor Agregado 13%\",\"valor\":26.16}]', NULL, '199.2', NULL, '0', NULL, '0', '0.00', NULL, NULL, '225.36', '0.00', '225.36', NULL, NULL, NULL, 'CIENTO NOVENTA Y NUEVE DOLARESS 20/100', '26.16', '0.00', '1', '01', '199.2', '', '01', '', '', NULL, NULL, NULL);
INSERT INTO public.resumen (id, "numeroControl", "codigoGeneracion", "totalNoSuj", "totalExenta", "totalGravada", "totalOpeExpo", "totalOperaciones", "totalDonacion", "sumOpSinImpu", "montoGloDescNS", "montoGloDescVE", "montoGloDescVG", "montoGloDescVA", "montoGloDescOP", "porcMontoGloDesc", "totalDescBonRev", "resCodTributo", "nombreTributo", "valorTributo", "subTotal", "totalMonSujRet", "ivaPercibido", "ivaPercibidoLiq", "ivaRetenido", "retencionRenta", seguro, flete, "montoTotalOp", "totalCargoBasImpon", "totalAPagar", total, "totalIvaRetenido", "valorLetrasIvaRet", "valorLetras", iva13, "saldoAFavor", "condicionOpera", "codFormaPago", "montoPorFormaPag", "refModalidadPago", plazo, "periodoPlazo", "numPagoElecNPE", incoterms, descincoterms, observaciones) VALUES (35, 'DTE-03-CMPV0202-000000000003995', 'B0093AF7-3309-4B8D-B839-C0EE01A359D6', '0.00', '0.00', '199.2', NULL, NULL, NULL, '199.2', '0.00', '0.00', '0.00', NULL, NULL, '0.00', '0.00', NULL, '[{\"codigo\":\"20\",\"descripcion\":\"Impuesto al Valor Agregado 13%\",\"valor\":26.16}]', NULL, '199.2', NULL, '0', NULL, '0', '0.00', NULL, NULL, '225.36', '0.00', '225.36', NULL, NULL, NULL, 'CIENTO NOVENTA Y NUEVE DOLARESS 20/100', '26.16', '0.00', '1', '01', '199.2', '', '01', '', '', NULL, NULL, NULL);
INSERT INTO public.resumen (id, "numeroControl", "codigoGeneracion", "totalNoSuj", "totalExenta", "totalGravada", "totalOpeExpo", "totalOperaciones", "totalDonacion", "sumOpSinImpu", "montoGloDescNS", "montoGloDescVE", "montoGloDescVG", "montoGloDescVA", "montoGloDescOP", "porcMontoGloDesc", "totalDescBonRev", "resCodTributo", "nombreTributo", "valorTributo", "subTotal", "totalMonSujRet", "ivaPercibido", "ivaPercibidoLiq", "ivaRetenido", "retencionRenta", seguro, flete, "montoTotalOp", "totalCargoBasImpon", "totalAPagar", total, "totalIvaRetenido", "valorLetrasIvaRet", "valorLetras", iva13, "saldoAFavor", "condicionOpera", "codFormaPago", "montoPorFormaPag", "refModalidadPago", plazo, "periodoPlazo", "numPagoElecNPE", incoterms, descincoterms, observaciones) VALUES (36, '', '', '0.00', '0.00', '0.00', NULL, NULL, NULL, '0.00', '0.00', '0.00', '0.00', NULL, NULL, '0.00', '0.00', NULL, NULL, NULL, '0', NULL, '0.00', NULL, '0.00', '', NULL, NULL, '0.00', '0.00', '0.00', NULL, NULL, NULL, 'CERO DOLARESS 00/100', '0.00', '0.00', '1', '01', '0.00', '', '01', '', '', NULL, NULL, '1');
INSERT INTO public.resumen (id, "numeroControl", "codigoGeneracion", "totalNoSuj", "totalExenta", "totalGravada", "totalOpeExpo", "totalOperaciones", "totalDonacion", "sumOpSinImpu", "montoGloDescNS", "montoGloDescVE", "montoGloDescVG", "montoGloDescVA", "montoGloDescOP", "porcMontoGloDesc", "totalDescBonRev", "resCodTributo", "nombreTributo", "valorTributo", "subTotal", "totalMonSujRet", "ivaPercibido", "ivaPercibidoLiq", "ivaRetenido", "retencionRenta", seguro, flete, "montoTotalOp", "totalCargoBasImpon", "totalAPagar", total, "totalIvaRetenido", "valorLetrasIvaRet", "valorLetras", iva13, "saldoAFavor", "condicionOpera", "codFormaPago", "montoPorFormaPag", "refModalidadPago", plazo, "periodoPlazo", "numPagoElecNPE", incoterms, descincoterms, observaciones) VALUES (37, 'DTE-01-CMPV0202-000000000003999', 'A39C6F29-0A6D-4AC6-85EB-132E4C0EDBCF', '0.00', '0.00', '10.00', NULL, NULL, NULL, '10.00', '0.00', '0.00', '0.00', NULL, NULL, '0.00', '0.00', NULL, NULL, NULL, '10', NULL, '0.00', NULL, '0.00', '', NULL, NULL, '10.00', '0.00', '10.00', NULL, NULL, NULL, 'DIEZ DOLARESS 00/100', '1.15', '0.00', '1', '01', '10.00', '', '01', '1', '', NULL, NULL, '1');


--
-- Data for Name: tblimpuestosvariables; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

INSERT INTO public.tblimpuestosvariables ("tipoImpuesto", valor, estado, noseva) VALUES ('COTRANS', '0.10', 2, 8);
INSERT INTO public.tblimpuestosvariables ("tipoImpuesto", valor, estado, noseva) VALUES ('FOVIAL', '0.20', 1, 5);
INSERT INTO public.tblimpuestosvariables ("tipoImpuesto", valor, estado, noseva) VALUES ('IVA1', '0.01', 6, 1);
INSERT INTO public.tblimpuestosvariables ("tipoImpuesto", valor, estado, noseva) VALUES ('IVA13', '0.13', 3, 1);
INSERT INTO public.tblimpuestosvariables ("tipoImpuesto", valor, estado, noseva) VALUES ('RENTA', '0.015', 4, 1);
INSERT INTO public.tblimpuestosvariables ("tipoImpuesto", valor, estado, noseva) VALUES ('RENTAEX', '0.10', 5, 1);


--
-- Data for Name: tblpartidacontable; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--



--
-- Data for Name: tblusuario; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

INSERT INTO public.tblusuario ("cUsuario", "cNombre", "cClave", "cUname", "cEstatus", areafact) VALUES (1, 'David Garcia', '711383a59fda05336fd2ccf70c8059d1523eb41a', 'dgarcia', '1', 'CC');
INSERT INTO public.tblusuario ("cUsuario", "cNombre", "cClave", "cUname", "cEstatus", areafact) VALUES (2, 'Fausto Salinas', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'fsalinas', '1', 'CO');
INSERT INTO public.tblusuario ("cUsuario", "cNombre", "cClave", "cUname", "cEstatus", areafact) VALUES (3, 'Fausto Salinas Segundo', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'fsalinas2', '1', 'CF');
INSERT INTO public.tblusuario ("cUsuario", "cNombre", "cClave", "cUname", "cEstatus", areafact) VALUES (4, 'Cristian Castro', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'ccastro', '1', 'CC');
INSERT INTO public.tblusuario ("cUsuario", "cNombre", "cClave", "cUname", "cEstatus", areafact) VALUES (5, 'Fernando Mendoza', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'fmendoza', '1', 'CC');
INSERT INTO public.tblusuario ("cUsuario", "cNombre", "cClave", "cUname", "cEstatus", areafact) VALUES (6, 'Guadalupe Gonzales', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'ggonzales', '1', 'CC');
INSERT INTO public.tblusuario ("cUsuario", "cNombre", "cClave", "cUname", "cEstatus", areafact) VALUES (7, 'Venta Maquilas', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'vmaquilas', '1', 'CC');
INSERT INTO public.tblusuario ("cUsuario", "cNombre", "cClave", "cUname", "cEstatus", areafact) VALUES (8, 'Jorge Sorto', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'jsorto', '1', 'CC');
INSERT INTO public.tblusuario ("cUsuario", "cNombre", "cClave", "cUname", "cEstatus", areafact) VALUES (9, 'Roberto Due�as', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'rdue�as', '1', 'CC');


--
-- Data for Name: tblc_x_pago; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

INSERT INTO public.tblc_x_pago (id, tipopag, cuentaxpago, areafac) VALUES
(1, '01', '1110102', 'CF'),
(4, '03', '1110102', 'CF'),
(5, '04', '1130602', 'CF'),
(6, '01', '1110103', 'CO'),
(7, '03', '1110103', 'CO'),
(8, '04', '1130602', 'CO'),
(9, '01', '1110101', 'OF'),
(10, '03', '1110101', 'OF'),
(11, '04', '1130601', 'OF'),
(12, '01', '1110104', 'CG'),
(13, '03', '1110104', 'CG'),
(14, '04', '1130602', 'CG'),
(15, '01', '0', 'CC'),
(16, '03', '0', 'CC'),
(17, '04', '0', 'CC'),
(18, '01', '0', 'EX'),
(19, '03', '0', 'EX'),
(20, '04', '0', 'EX'),
(21, '01', '0', 'SE'),
(22, '03', '0', 'SE'),
(23, '04', '0', 'SE'),
(24, '01', '0', 'SG'),
(25, '03', '0', 'SG'),
(26, '04', '0', 'SG');


--
-- Data for Name: tblcxvendedor; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

INSERT INTO public.tblcxvendedor (id, cod_usuario, "cuentaEfe", "cuentaCred") VALUES
(1, 'fsalinas', '111010501', '113014214'),
(2, 'ccastro', '111010501', '113014214'),
(3, 'fmendoza', '111010502', '113014212'),
(4, 'ggonzales', '111010503', '113014215'),
(5, 'vmaquilas', '111010504', NULL),
(6, 'jsorto', '111010505', '113014213'),
(7, 'rdueñas', '111010506', '113014217'),
(8, 'dgarcia', '0000000', '0000000');

--
-- Data for Name: ventatercero; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--


--
-- Name: anulacion anulacion_pkey; Type: CONSTRAINT; Schema: public; Owner: saplic_dprlac_user
--

ALTER TABLE ONLY public.anulacion
    ADD CONSTRAINT anulacion_pkey PRIMARY KEY (id);

--
-- Name: bitacora bitacora_pkey; Type: CONSTRAINT; Schema: public; Owner: saplic_dprlac_user
--

ALTER TABLE ONLY public.bitacora
    ADD CONSTRAINT bitacora_pkey PRIMARY KEY (id);


--
-- Name: bitacorafactura bitacorafactura_pkey; Type: CONSTRAINT; Schema: public; Owner: saplic_dprlac_user
--

ALTER TABLE ONLY public.bitacorafactura
    ADD CONSTRAINT bitacorafactura_pkey PRIMARY KEY (id);


-- --
-- -- Name: Cuerpodocumento Cuerpodocumento_pkey; Type: CONSTRAINT; Schema: public; Owner: saplic_dprlac_user
-- --

-- ALTER TABLE ONLY public.Cuerpodocumento
--     ADD CONSTRAINT Cuerpodocumento_pkey PRIMARY KEY (identificador);


--
-- Name: docrelacionados docrelacionados_pkey; Type: CONSTRAINT; Schema: public; Owner: saplic_dprlac_user
--

ALTER TABLE ONLY public.docrelacionados
    ADD CONSTRAINT docrelacionados_pkey PRIMARY KEY ("codigoGeneracion");


--
-- Name: emisor emisor_pkey; Type: CONSTRAINT; Schema: public; Owner: saplic_dprlac_user
--

ALTER TABLE ONLY public.emisor
    ADD CONSTRAINT emisor_pkey PRIMARY KEY (id);


--
-- Name: identificacion identificacion_pkey; Type: CONSTRAINT; Schema: public; Owner: saplic_dprlac_user
--

ALTER TABLE ONLY public.identificacion
    ADD CONSTRAINT identificacion_pkey PRIMARY KEY ("codigoGeneracion");


--
-- Name: receptor receptor_pkey; Type: CONSTRAINT; Schema: public; Owner: saplic_dprlac_user
--

ALTER TABLE ONLY public.receptor
    ADD CONSTRAINT receptor_pkey PRIMARY KEY (id);


--
-- Name: receptordocumen receptordocumen_pkey; Type: CONSTRAINT; Schema: public; Owner: saplic_dprlac_user
--

ALTER TABLE ONLY public.receptordocumen
    ADD CONSTRAINT receptordocumen_pkey PRIMARY KEY ("codigoGeneracion");


-- --
-- -- Name: resumen resumen_pkey; Type: CONSTRAINT; Schema: public; Owner: saplic_dprlac_user
-- --

-- ALTER TABLE ONLY public.resumen
--     ADD CONSTRAINT resumen_pkey PRIMARY KEY (id);


--
-- Name: tblimpuestosvariables tblimpuestosvariables_pkey; Type: CONSTRAINT; Schema: public; Owner: saplic_dprlac_user
--

ALTER TABLE ONLY public.tblimpuestosvariables
    ADD CONSTRAINT tblimpuestosvariables_pkey PRIMARY KEY ("tipoImpuesto");


--
-- Name: tblpartidacontable tblpartidacontable_pkey; Type: CONSTRAINT; Schema: public; Owner: saplic_dprlac_user
--

ALTER TABLE ONLY public.tblpartidacontable
    ADD CONSTRAINT tblpartidacontable_pkey PRIMARY KEY ("numControl");


--
-- Name: tblusuario tblusuario_pkey; Type: CONSTRAINT; Schema: public; Owner: saplic_dprlac_user
--

ALTER TABLE ONLY public.tblusuario
    ADD CONSTRAINT tblusuario_pkey PRIMARY KEY ("cUsuario");


--
-- PostgreSQL database dump complete
--

