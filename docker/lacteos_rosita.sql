--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3 (Debian 16.3-1.pgdg120+1)
-- Dumped by pg_dump version 16.3

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

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA IF NOT EXISTS public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: activo_fijo; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.activo_fijo (
                                    activo_fijo_id integer NOT NULL,
                                    codigo character(10) NOT NULL,
                                    nombre character(30) NOT NULL,
                                    descripcion character(200) DEFAULT NULL::bpchar,
                                    fecha_registro date NOT NULL,
                                    valor_inicial double precision NOT NULL,
                                    porcentaje_cambio integer,
                                    monto_cambio double precision,
                                    tipo_cambio character(3) NOT NULL,
                                    periodo_tiempo integer,
                                    empled_id integer NOT NULL,
                                    tipo_activo_id integer
);


ALTER TABLE public.activo_fijo OWNER TO "saplic_dprlac_user";

--
-- Name: activo_fijo_activo_fijo_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.activo_fijo_activo_fijo_id_seq (
                                                       next_not_cached_value bigint NOT NULL,
                                                       minimum_value bigint NOT NULL,
                                                       maximum_value bigint NOT NULL,
                                                       start_value bigint NOT NULL,
                                                       increment bigint NOT NULL,
                                                       cache_size bigint NOT NULL,
                                                       cycle_option smallint NOT NULL,
                                                       cycle_count bigint NOT NULL
);


ALTER TABLE public.activo_fijo_activo_fijo_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: ajustar_lote; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.ajustar_lote (
                                     id integer NOT NULL,
                                     fecha date NOT NULL,
                                     producto integer NOT NULL,
                                     lote character varying(25) NOT NULL,
                                     sucursal integer NOT NULL,
                                     libras numeric(12,2) DEFAULT NULL::numeric,
                                     unidades integer,
                                     motivo character varying(700) NOT NULL
);


ALTER TABLE public.ajustar_lote OWNER TO "saplic_dprlac_user";

--
-- Name: ajustar_lote_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.ajustar_lote_id_seq (
                                            next_not_cached_value bigint NOT NULL,
                                            minimum_value bigint NOT NULL,
                                            maximum_value bigint NOT NULL,
                                            start_value bigint NOT NULL,
                                            increment bigint NOT NULL,
                                            cache_size bigint NOT NULL,
                                            cycle_option smallint NOT NULL,
                                            cycle_count bigint NOT NULL
);


ALTER TABLE public.ajustar_lote_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: ajuste_existencia; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.ajuste_existencia (
                                          id integer NOT NULL,
                                          sub_total integer NOT NULL,
                                          fecha_orden date,
                                          razon_ajuste character varying(300) DEFAULT NULL::character varying,
                                          tipo character varying(1) NOT NULL
);


ALTER TABLE public.ajuste_existencia OWNER TO "saplic_dprlac_user";

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


ALTER TABLE public.anulacion OWNER TO "saplic_dprlac_user";

--
-- Name: area_negocio; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.area_negocio (
                                     areneg_id integer NOT NULL,
                                     nombre character(40) NOT NULL,
                                     descripcion character(150) NOT NULL
);


ALTER TABLE public.area_negocio OWNER TO "saplic_dprlac_user";

--
-- Name: area_negocio_areneg_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.area_negocio_areneg_id_seq (
                                                   next_not_cached_value bigint NOT NULL,
                                                   minimum_value bigint NOT NULL,
                                                   maximum_value bigint NOT NULL,
                                                   start_value bigint NOT NULL,
                                                   increment bigint NOT NULL,
                                                   cache_size bigint NOT NULL,
                                                   cycle_option smallint NOT NULL,
                                                   cycle_count bigint NOT NULL
);


ALTER TABLE public.area_negocio_areneg_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: asiento_cont_det; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.asiento_cont_det (
                                         cnm_id integer NOT NULL,
                                         monto double precision,
                                         tipo character(3) NOT NULL,
                                         asiento_id integer NOT NULL,
                                         cuentac_id integer NOT NULL,
                                         montodeudor double precision,
                                         montoacreedor double precision,
                                         nit character(20) DEFAULT NULL::bpchar,
                                         concepto character(80) DEFAULT NULL::bpchar
);


ALTER TABLE public.asiento_cont_det OWNER TO "saplic_dprlac_user";

--
-- Name: asiento_cont_det_cnm_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.asiento_cont_det_cnm_id_seq (
                                                    next_not_cached_value bigint NOT NULL,
                                                    minimum_value bigint NOT NULL,
                                                    maximum_value bigint NOT NULL,
                                                    start_value bigint NOT NULL,
                                                    increment bigint NOT NULL,
                                                    cache_size bigint NOT NULL,
                                                    cycle_option smallint NOT NULL,
                                                    cycle_count bigint NOT NULL
);


ALTER TABLE public.asiento_cont_det_cnm_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: asiento_contable; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.asiento_contable (
                                         cnm_id integer NOT NULL,
                                         codigo character varying(16) NOT NULL,
                                         monto numeric(12,2) NOT NULL,
                                         comentario character varying(300) DEFAULT NULL::character varying,
                                         solo_lectura smallint,
                                         usuario_id integer NOT NULL,
                                         cliente_id integer,
                                         tipo_documento character varying(3) DEFAULT NULL::character varying,
                                         correlativo bigint,
                                         cod_documento character varying(20) DEFAULT NULL::character varying,
                                         catalogo_monedas_id integer,
                                         ejercicio_contable_id integer,
                                         centro_costo_id integer,
                                         fecha_asiento date,
                                         cargo numeric(12,2) DEFAULT NULL::numeric,
                                         corr_mes integer,
                                         monto_cheque integer,
                                         abono numeric(12,2) DEFAULT NULL::numeric,
                                         proveedor_str character varying(60) DEFAULT NULL::character varying,
                                         prdcont_id integer,
                                         tipptd_id integer,
                                         proveedor_id integer,
                                         concepto_id integer
);


ALTER TABLE public.asiento_contable OWNER TO "saplic_dprlac_user";

--
-- Name: asiento_contable_cnm_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.asiento_contable_cnm_id_seq (
                                                    next_not_cached_value bigint NOT NULL,
                                                    minimum_value bigint NOT NULL,
                                                    maximum_value bigint NOT NULL,
                                                    start_value bigint NOT NULL,
                                                    increment bigint NOT NULL,
                                                    cache_size bigint NOT NULL,
                                                    cycle_option smallint NOT NULL,
                                                    cycle_count bigint NOT NULL
);


ALTER TABLE public.asiento_contable_cnm_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: banco; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.banco (
                              banco_id integer NOT NULL,
                              codigo character(30) NOT NULL,
                              nombre character(50) NOT NULL,
                              descripcion character(50) DEFAULT NULL::bpchar
);


ALTER TABLE public.banco OWNER TO "saplic_dprlac_user";

--
-- Name: banco_banco_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.banco_banco_id_seq (
                                           next_not_cached_value bigint NOT NULL,
                                           minimum_value bigint NOT NULL,
                                           maximum_value bigint NOT NULL,
                                           start_value bigint NOT NULL,
                                           increment bigint NOT NULL,
                                           cache_size bigint NOT NULL,
                                           cycle_option smallint NOT NULL,
                                           cycle_count bigint NOT NULL
);


ALTER TABLE public.banco_banco_id_seq OWNER TO "saplic_dprlac_user";

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


ALTER TABLE public.bitacora OWNER TO "saplic_dprlac_user";

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


ALTER TABLE public.bitacorafactura OWNER TO "saplic_dprlac_user";

--
-- Name: caja_chica_det; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.caja_chica_det (
                                       cjcd_id integer NOT NULL,
                                       monto double precision NOT NULL,
                                       comentario character(200) DEFAULT NULL::bpchar,
                                       tipo character(3) NOT NULL,
                                       fecha date,
                                       concepto_id integer NOT NULL,
                                       cjachimov_id integer NOT NULL,
                                       es_venta smallint
);


ALTER TABLE public.caja_chica_det OWNER TO "saplic_dprlac_user";

--
-- Name: caja_chica_det_cjcd_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.caja_chica_det_cjcd_id_seq (
                                                   next_not_cached_value bigint NOT NULL,
                                                   minimum_value bigint NOT NULL,
                                                   maximum_value bigint NOT NULL,
                                                   start_value bigint NOT NULL,
                                                   increment bigint NOT NULL,
                                                   cache_size bigint NOT NULL,
                                                   cycle_option smallint NOT NULL,
                                                   cycle_count bigint NOT NULL
);


ALTER TABLE public.caja_chica_det_cjcd_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: caja_chica_mov; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.caja_chica_mov (
                                       cjch_id integer NOT NULL,
                                       monto double precision NOT NULL,
                                       fecha date NOT NULL,
                                       estado character(3) NOT NULL,
                                       sucursal_id integer NOT NULL,
                                       ingresos double precision,
                                       gastos double precision,
                                       ventas double precision,
                                       compras double precision
);


ALTER TABLE public.caja_chica_mov OWNER TO "saplic_dprlac_user";

--
-- Name: caja_chica_mov_cjch_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.caja_chica_mov_cjch_id_seq (
                                                   next_not_cached_value bigint NOT NULL,
                                                   minimum_value bigint NOT NULL,
                                                   maximum_value bigint NOT NULL,
                                                   start_value bigint NOT NULL,
                                                   increment bigint NOT NULL,
                                                   cache_size bigint NOT NULL,
                                                   cycle_option smallint NOT NULL,
                                                   cycle_count bigint NOT NULL
);


ALTER TABLE public.caja_chica_mov_cjch_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: cat001; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cat001 (
                               codigo character varying(2) NOT NULL,
                               valores character varying(20) NOT NULL
);


ALTER TABLE public.cat001 OWNER TO "saplic_dprlac_user";

--
-- Name: cat002; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cat002 (
                               codigo character varying(2) NOT NULL,
                               valores character varying(50) NOT NULL
);


ALTER TABLE public.cat002 OWNER TO "saplic_dprlac_user";

--
-- Name: cat003; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cat003 (
                               codigo character varying(2) NOT NULL,
                               valores character varying(36) NOT NULL
);


ALTER TABLE public.cat003 OWNER TO "saplic_dprlac_user";

--
-- Name: cat004; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cat004 (
                               codigo character varying(2) NOT NULL,
                               valores character varying(50) NOT NULL
);


ALTER TABLE public.cat004 OWNER TO "saplic_dprlac_user";

--
-- Name: cat005; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cat005 (
                               codigo character varying(1) NOT NULL,
                               valores character varying(200) NOT NULL
);


ALTER TABLE public.cat005 OWNER TO "saplic_dprlac_user";

--
-- Name: cat006; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cat006 (
                               codigo character varying(2) NOT NULL,
                               valores character varying(50) NOT NULL
);


ALTER TABLE public.cat006 OWNER TO "saplic_dprlac_user";

--
-- Name: cat007; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cat007 (
                               codigo character varying(1) NOT NULL,
                               valores character varying(100) NOT NULL
);


ALTER TABLE public.cat007 OWNER TO "saplic_dprlac_user";

--
-- Name: cat009; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cat009 (
                               codigo character varying(2) NOT NULL,
                               valores character varying(100) NOT NULL
);


ALTER TABLE public.cat009 OWNER TO "saplic_dprlac_user";

--
-- Name: cat010; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cat010 (
                               codigo character varying(2) NOT NULL,
                               valores character varying(100) NOT NULL
);


ALTER TABLE public.cat010 OWNER TO "saplic_dprlac_user";

--
-- Name: cat011; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cat011 (
                               codigo character varying(2) NOT NULL,
                               valores character varying(100) NOT NULL
);


ALTER TABLE public.cat011 OWNER TO "saplic_dprlac_user";

--
-- Name: cat012; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cat012 (
                               codigo character varying(2) NOT NULL,
                               valores character varying(100) NOT NULL
);


ALTER TABLE public.cat012 OWNER TO "saplic_dprlac_user";

--
-- Name: cat013; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cat013 (
                               codigo character varying(2) NOT NULL,
                               valor character varying(100) NOT NULL,
                               codigo_depto character varying(2) DEFAULT NULL::character varying,
                               idmuni integer NOT NULL
);


ALTER TABLE public.cat013 OWNER TO "saplic_dprlac_user";

--
-- Name: cat014; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cat014 (
                               codigo character varying(3) NOT NULL,
                               valor character varying(100) NOT NULL
);


ALTER TABLE public.cat014 OWNER TO "saplic_dprlac_user";

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


ALTER TABLE public.cat015 OWNER TO "saplic_dprlac_user";

--
-- Name: cat016; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cat016 (
                               codigo character varying(2) NOT NULL,
                               valor character varying(100) DEFAULT NULL::character varying
);


ALTER TABLE public.cat016 OWNER TO "saplic_dprlac_user";

--
-- Name: cat017; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cat017 (
                               codigo character varying(2) NOT NULL,
                               valor character varying(100) NOT NULL
);


ALTER TABLE public.cat017 OWNER TO "saplic_dprlac_user";

--
-- Name: cat018; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cat018 (
                               codigo character varying(2) NOT NULL,
                               valor character varying(100) NOT NULL
);


ALTER TABLE public.cat018 OWNER TO "saplic_dprlac_user";

--
-- Name: cat019; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cat019 (
                               codigo character varying(5) NOT NULL,
                               valor character varying(500) NOT NULL,
                               cod_tipo integer NOT NULL
);


ALTER TABLE public.cat019 OWNER TO "saplic_dprlac_user";

--
-- Name: cat020; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cat020 (
                               codigo character varying(4) NOT NULL,
                               valor character varying(100) NOT NULL
);


ALTER TABLE public.cat020 OWNER TO "saplic_dprlac_user";

--
-- Name: cat021; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cat021 (
                               codigo integer NOT NULL,
                               valor character varying(100) NOT NULL
);


ALTER TABLE public.cat021 OWNER TO "saplic_dprlac_user";

--
-- Name: cat022; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cat022 (
                               codigo integer NOT NULL,
                               valor character varying(100) NOT NULL
);


ALTER TABLE public.cat022 OWNER TO "saplic_dprlac_user";

--
-- Name: cat023; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cat023 (
                               codigo character varying(2) NOT NULL,
                               valor character varying(100) NOT NULL
);


ALTER TABLE public.cat023 OWNER TO "saplic_dprlac_user";

--
-- Name: cat024; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cat024 (
                               codigo integer NOT NULL,
                               valor character varying(100) NOT NULL
);


ALTER TABLE public.cat024 OWNER TO "saplic_dprlac_user";

--
-- Name: cat025; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cat025 (
                               codigo character varying(2) NOT NULL,
                               valor character varying(100) NOT NULL
);


ALTER TABLE public.cat025 OWNER TO "saplic_dprlac_user";

--
-- Name: cat026; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cat026 (
                               codigo integer NOT NULL,
                               valor character varying(100) DEFAULT NULL::character varying
);


ALTER TABLE public.cat026 OWNER TO "saplic_dprlac_user";

--
-- Name: cat027; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cat027 (
                               codigo character varying(2) NOT NULL,
                               valor character varying(100) NOT NULL
);


ALTER TABLE public.cat027 OWNER TO "saplic_dprlac_user";

--
-- Name: cat028; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cat028 (
                               codigo character varying(20) NOT NULL,
                               valor character varying(255) NOT NULL
);


ALTER TABLE public.cat028 OWNER TO "saplic_dprlac_user";

--
-- Name: cat029; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cat029 (
                               codigo integer NOT NULL,
                               valor character varying(100) NOT NULL
);


ALTER TABLE public.cat029 OWNER TO "saplic_dprlac_user";

--
-- Name: cat030; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cat030 (
                               codigo integer NOT NULL,
                               valor character varying(100) DEFAULT NULL::character varying
);


ALTER TABLE public.cat030 OWNER TO "saplic_dprlac_user";

--
-- Name: cat031; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cat031 (
                               codigo character varying(2) NOT NULL,
                               valor character varying(255) NOT NULL
);


ALTER TABLE public.cat031 OWNER TO "saplic_dprlac_user";

--
-- Name: catalogo_monedas; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.catalogo_monedas (
                                         catalogo_monedas_id integer NOT NULL,
                                         nombre character(30) NOT NULL,
                                         simbolo character(5) NOT NULL,
                                         fact_conver double precision NOT NULL,
                                         por_defecto smallint NOT NULL,
                                         idpai integer NOT NULL
);


ALTER TABLE public.catalogo_monedas OWNER TO "saplic_dprlac_user";

--
-- Name: catalogo_monedas_catalogo_monedas_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.catalogo_monedas_catalogo_monedas_id_seq (
                                                                 next_not_cached_value bigint NOT NULL,
                                                                 minimum_value bigint NOT NULL,
                                                                 maximum_value bigint NOT NULL,
                                                                 start_value bigint NOT NULL,
                                                                 increment bigint NOT NULL,
                                                                 cache_size bigint NOT NULL,
                                                                 cycle_option smallint NOT NULL,
                                                                 cycle_count bigint NOT NULL
);


ALTER TABLE public.catalogo_monedas_catalogo_monedas_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: categoria; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.categoria (
                                  id integer NOT NULL,
                                  nombre character(30) NOT NULL,
                                  codigo character(10) NOT NULL,
                                  descripcion character(200) DEFAULT NULL::bpchar,
                                  tiene_num_serie smallint NOT NULL,
                                  tiene_num_lote smallint NOT NULL,
                                  categoria_padre_id integer
);


ALTER TABLE public.categoria OWNER TO "saplic_dprlac_user";

--
-- Name: categoria_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.categoria_id_seq (
                                         next_not_cached_value bigint NOT NULL,
                                         minimum_value bigint NOT NULL,
                                         maximum_value bigint NOT NULL,
                                         start_value bigint NOT NULL,
                                         increment bigint NOT NULL,
                                         cache_size bigint NOT NULL,
                                         cycle_option smallint NOT NULL,
                                         cycle_count bigint NOT NULL
);


ALTER TABLE public.categoria_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: centro_costo; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.centro_costo (
                                     centro_costo_id integer NOT NULL,
                                     estado character(3) NOT NULL,
                                     nombre character(30) NOT NULL,
                                     cod_cuenta character(20) NOT NULL,
                                     descripcion character(200) DEFAULT NULL::bpchar,
                                     saldo_deudor double precision,
                                     saldo_acreedor double precision,
                                     ctapadre_id integer,
                                     cdp_id integer NOT NULL,
                                     sub_tipo_cuenta_id integer
);


ALTER TABLE public.centro_costo OWNER TO "saplic_dprlac_user";

--
-- Name: centro_costo_centro_costo_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.centro_costo_centro_costo_id_seq (
                                                         next_not_cached_value bigint NOT NULL,
                                                         minimum_value bigint NOT NULL,
                                                         maximum_value bigint NOT NULL,
                                                         start_value bigint NOT NULL,
                                                         increment bigint NOT NULL,
                                                         cache_size bigint NOT NULL,
                                                         cycle_option smallint NOT NULL,
                                                         cycle_count bigint NOT NULL
);


ALTER TABLE public.centro_costo_centro_costo_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: cert_descuento; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cert_descuento (
                                       crtdsc_id integer NOT NULL,
                                       descripcion character(150) DEFAULT NULL::bpchar,
                                       estado character(3) DEFAULT NULL::bpchar,
                                       cod_cert character(20) NOT NULL,
                                       fecha_ingreso date NOT NULL,
                                       desc_efectivo smallint,
                                       desc_tarjeta smallint,
                                       pass character(60) DEFAULT NULL::bpchar,
                                       fecha_final date,
                                       tipo_prc character(3) DEFAULT NULL::bpchar,
                                       auto_aplicable smallint,
                                       desc_global smallint,
                                       desc_cheque smallint,
                                       desc_monto double precision,
                                       tipo_mnt character(3) DEFAULT NULL::bpchar,
                                       especifico smallint,
                                       eval_criterio character(3) DEFAULT NULL::bpchar
);


ALTER TABLE public.cert_descuento OWNER TO "saplic_dprlac_user";

--
-- Name: cert_descuento_crtdsc_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cert_descuento_crtdsc_id_seq (
                                                     next_not_cached_value bigint NOT NULL,
                                                     minimum_value bigint NOT NULL,
                                                     maximum_value bigint NOT NULL,
                                                     start_value bigint NOT NULL,
                                                     increment bigint NOT NULL,
                                                     cache_size bigint NOT NULL,
                                                     cycle_option smallint NOT NULL,
                                                     cycle_count bigint NOT NULL
);


ALTER TABLE public.cert_descuento_crtdsc_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: cheques; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cheques (
                                csfcn_cheque_id integer NOT NULL,
                                monto double precision NOT NULL,
                                estado character(3) NOT NULL,
                                ciudad character(50) NOT NULL,
                                fech_emi date NOT NULL,
                                sgte_no integer NOT NULL,
                                transc_no character(30) NOT NULL,
                                referc character(150) NOT NULL,
                                csfcn_id integer,
                                ctacte_id integer,
                                cliente_id integer,
                                proveedor_id integer
);


ALTER TABLE public.cheques OWNER TO "saplic_dprlac_user";

--
-- Name: cheques_csfcn_cheque_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cheques_csfcn_cheque_id_seq (
                                                    next_not_cached_value bigint NOT NULL,
                                                    minimum_value bigint NOT NULL,
                                                    maximum_value bigint NOT NULL,
                                                    start_value bigint NOT NULL,
                                                    increment bigint NOT NULL,
                                                    cache_size bigint NOT NULL,
                                                    cycle_option smallint NOT NULL,
                                                    cycle_count bigint NOT NULL
);


ALTER TABLE public.cheques_csfcn_cheque_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: cliente; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cliente (
                                client_id integer NOT NULL,
                                nombre character(60) DEFAULT NULL::bpchar,
                                direccion character(200) DEFAULT NULL::bpchar,
                                apellido character(60) DEFAULT NULL::bpchar,
                                tel_fijo character(12) DEFAULT NULL::bpchar,
                                tel_celular character(12) DEFAULT NULL::bpchar,
                                email character(40) DEFAULT NULL::bpchar,
                                dui character(10) DEFAULT NULL::bpchar,
                                nit character(20) DEFAULT NULL::bpchar,
                                num_registro character(10) DEFAULT NULL::bpchar,
                                giro character(100) DEFAULT NULL::bpchar,
                                fecha_nacimiento date,
                                genero smallint,
                                tipo_contribuyente smallint,
                                exento smallint NOT NULL,
                                comonosconocio character(60) DEFAULT NULL::bpchar,
                                razon_social character(60) DEFAULT NULL::bpchar,
                                tipo_cliente integer,
                                estado character(3) DEFAULT NULL::bpchar,
                                medpub_id integer,
                                clasificacion1 character(1) DEFAULT NULL::bpchar,
                                clasificacion2 character(6) DEFAULT NULL::bpchar,
                                tipodecliente character(3) DEFAULT NULL::bpchar,
                                categoria smallint,
                                clasificacion character(3) DEFAULT NULL::bpchar,
                                nombre_tar_iva character(60) DEFAULT NULL::bpchar,
                                sucursal_id integer,
                                nrc character(255) DEFAULT NULL::bpchar,
                                lp_id integer,
                                vendedor integer
);


ALTER TABLE public.cliente OWNER TO "saplic_dprlac_user";

--
-- Name: cliente_client_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cliente_client_id_seq (
                                              next_not_cached_value bigint NOT NULL,
                                              minimum_value bigint NOT NULL,
                                              maximum_value bigint NOT NULL,
                                              start_value bigint NOT NULL,
                                              increment bigint NOT NULL,
                                              cache_size bigint NOT NULL,
                                              cycle_option smallint NOT NULL,
                                              cycle_count bigint NOT NULL
);


ALTER TABLE public.cliente_client_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: compra; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.compra (
                               id integer NOT NULL,
                               numero_factura character(20) DEFAULT NULL::bpchar,
                               sub_total double precision NOT NULL,
                               fecha_factura date,
                               fecha_orden date,
                               num_orden character(25) DEFAULT NULL::bpchar,
                               proveedor_id integer,
                               total double precision,
                               iva double precision,
                               valor_grabado double precision,
                               valor_exento double precision,
                               retencion double precision,
                               percepcion double precision,
                               fov_cotrans double precision,
                               valor_iva double precision,
                               total_fov double precision,
                               usuario_id integer,
                               tipo_documento character(3) DEFAULT NULL::bpchar,
                               cliente_id integer,
                               lote character(25) DEFAULT NULL::bpchar,
                               libras_enviadas double precision
);


ALTER TABLE public.compra OWNER TO "saplic_dprlac_user";

--
-- Name: compra_cnt; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.compra_cnt (
                                   id integer NOT NULL,
                                   total double precision NOT NULL,
                                   fecha date NOT NULL,
                                   iva double precision NOT NULL,
                                   numero_documento integer NOT NULL,
                                   comprado_al integer NOT NULL,
                                   tipo_compra integer NOT NULL,
                                   valor_grabado double precision NOT NULL,
                                   valor_exento double precision NOT NULL,
                                   retencion double precision NOT NULL,
                                   percepcion double precision NOT NULL,
                                   fov_cotrans double precision NOT NULL,
                                   valor_iva double precision NOT NULL,
                                   total_fov double precision NOT NULL,
                                   usuario_id integer,
                                   proveedor_cnt_id integer
);


ALTER TABLE public.compra_cnt OWNER TO "saplic_dprlac_user";

--
-- Name: compra_cnt_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.compra_cnt_id_seq (
                                          next_not_cached_value bigint NOT NULL,
                                          minimum_value bigint NOT NULL,
                                          maximum_value bigint NOT NULL,
                                          start_value bigint NOT NULL,
                                          increment bigint NOT NULL,
                                          cache_size bigint NOT NULL,
                                          cycle_option smallint NOT NULL,
                                          cycle_count bigint NOT NULL
);


ALTER TABLE public.compra_cnt_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: compras; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.compras (
                                id bigint NOT NULL,
                                codcompra character varying(10) NOT NULL,
                                tipdocumento character varying(4) NOT NULL,
                                fecha date NOT NULL,
                                emisor character varying(15) NOT NULL,
                                mes character varying(3) NOT NULL,
                                dteinterno character varying(20) NOT NULL,
                                serie character varying(20) NOT NULL,
                                numerocontrol character varying(36) NOT NULL,
                                codgeneracion character varying(36) NOT NULL,
                                sellovalidacion character varying(100) NOT NULL,
                                tipcompra character varying(4) NOT NULL,
                                tippago character varying(150) NOT NULL
);


ALTER TABLE public.compras OWNER TO "saplic_dprlac_user";

--
-- Name: comprobante_dia_ope; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.comprobante_dia_ope (
                                            cmpdiop_id integer NOT NULL,
                                            tipo_documento character(1) NOT NULL,
                                            num_serie_ini character(14) DEFAULT NULL::bpchar,
                                            num_serie_fin character(14) DEFAULT NULL::bpchar,
                                            num_documento_ini bigint,
                                            num_documento_fin bigint,
                                            diaope_id integer NOT NULL,
                                            num_documentos integer
);


ALTER TABLE public.comprobante_dia_ope OWNER TO "saplic_dprlac_user";

--
-- Name: comprobante_dia_ope_cmpdiop_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.comprobante_dia_ope_cmpdiop_id_seq (
                                                           next_not_cached_value bigint NOT NULL,
                                                           minimum_value bigint NOT NULL,
                                                           maximum_value bigint NOT NULL,
                                                           start_value bigint NOT NULL,
                                                           increment bigint NOT NULL,
                                                           cache_size bigint NOT NULL,
                                                           cycle_option smallint NOT NULL,
                                                           cycle_count bigint NOT NULL
);


ALTER TABLE public.comprobante_dia_ope_cmpdiop_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: concepto_movimiento; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.concepto_movimiento (
                                            cnm_id integer NOT NULL,
                                            nombre character(40) NOT NULL,
                                            codigo character(20) DEFAULT NULL::bpchar
);


ALTER TABLE public.concepto_movimiento OWNER TO "saplic_dprlac_user";

--
-- Name: concepto_movimiento_cnm_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.concepto_movimiento_cnm_id_seq (
                                                       next_not_cached_value bigint NOT NULL,
                                                       minimum_value bigint NOT NULL,
                                                       maximum_value bigint NOT NULL,
                                                       start_value bigint NOT NULL,
                                                       increment bigint NOT NULL,
                                                       cache_size bigint NOT NULL,
                                                       cycle_option smallint NOT NULL,
                                                       cycle_count bigint NOT NULL
);


ALTER TABLE public.concepto_movimiento_cnm_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: config_cod_barras; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.config_cod_barras (
                                          cfgbarcode_id integer NOT NULL,
                                          codigo character(255) NOT NULL,
                                          nombre character(40) NOT NULL,
                                          num_etiquetas smallint,
                                          margen_izquierdo double precision,
                                          margen_derecho double precision,
                                          margen_inferior double precision,
                                          margen_superior double precision,
                                          margen_etiquetas double precision,
                                          alto_etiqueta double precision,
                                          largo_etiqueta double precision,
                                          ajuste double precision,
                                          intervalo_ajuste smallint
);


ALTER TABLE public.config_cod_barras OWNER TO "saplic_dprlac_user";

--
-- Name: config_cod_barras_cfgbarcode_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.config_cod_barras_cfgbarcode_id_seq (
                                                            next_not_cached_value bigint NOT NULL,
                                                            minimum_value bigint NOT NULL,
                                                            maximum_value bigint NOT NULL,
                                                            start_value bigint NOT NULL,
                                                            increment bigint NOT NULL,
                                                            cache_size bigint NOT NULL,
                                                            cycle_option smallint NOT NULL,
                                                            cycle_count bigint NOT NULL
);


ALTER TABLE public.config_cod_barras_cfgbarcode_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: config_ctas_planilla; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.config_ctas_planilla (
                                             confg_ctas_pnll_id integer NOT NULL,
                                             nombre character(60) NOT NULL,
                                             descripcion character(200) NOT NULL,
                                             tipo_movimiento character(3) NOT NULL,
                                             cod_parametro character(20) NOT NULL,
                                             cuentac_id integer
);


ALTER TABLE public.config_ctas_planilla OWNER TO "saplic_dprlac_user";

--
-- Name: config_ctas_planilla_confg_ctas_pnll_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.config_ctas_planilla_confg_ctas_pnll_id_seq (
                                                                    next_not_cached_value bigint NOT NULL,
                                                                    minimum_value bigint NOT NULL,
                                                                    maximum_value bigint NOT NULL,
                                                                    start_value bigint NOT NULL,
                                                                    increment bigint NOT NULL,
                                                                    cache_size bigint NOT NULL,
                                                                    cycle_option smallint NOT NULL,
                                                                    cycle_count bigint NOT NULL
);


ALTER TABLE public.config_ctas_planilla_confg_ctas_pnll_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: config_impresora; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.config_impresora (
                                         cfgprt_id integer NOT NULL,
                                         estado character(3) NOT NULL,
                                         nombre_printer character(50) NOT NULL,
                                         margen_sup smallint,
                                         margen_inf smallint,
                                         margen_izq smallint,
                                         margen_der smallint,
                                         header_izq character(30) DEFAULT NULL::bpchar,
                                         header_ctr character(30) DEFAULT NULL::bpchar,
                                         header_der character(30) DEFAULT NULL::bpchar,
                                         footer_izq character(30) DEFAULT NULL::bpchar,
                                         footer_ctr character(30) DEFAULT NULL::bpchar,
                                         footer_der character(30) DEFAULT NULL::bpchar,
                                         impresion_silenciosa smallint NOT NULL,
                                         ajustar_impresion smallint NOT NULL,
                                         alto_papel smallint,
                                         ancho_papel smallint,
                                         tipo_impresora character(10) NOT NULL,
                                         sucursal_id integer NOT NULL
);


ALTER TABLE public.config_impresora OWNER TO "saplic_dprlac_user";

--
-- Name: config_impresora_cfgprt_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.config_impresora_cfgprt_id_seq (
                                                       next_not_cached_value bigint NOT NULL,
                                                       minimum_value bigint NOT NULL,
                                                       maximum_value bigint NOT NULL,
                                                       start_value bigint NOT NULL,
                                                       increment bigint NOT NULL,
                                                       cache_size bigint NOT NULL,
                                                       cycle_option smallint NOT NULL,
                                                       cycle_count bigint NOT NULL
);


ALTER TABLE public.config_impresora_cfgprt_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: config_notif_servier; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.config_notif_servier (
                                             cfgntsrv_id integer NOT NULL,
                                             host character varying(60) NOT NULL,
                                             usuario character varying(50) NOT NULL,
                                             estado character varying(255) NOT NULL,
                                             nombre character varying(30) NOT NULL,
                                             contrasena character varying(60) NOT NULL,
                                             puerto smallint NOT NULL,
                                             tls smallint NOT NULL,
                                             ssll smallint NOT NULL
);


ALTER TABLE public.config_notif_servier OWNER TO "saplic_dprlac_user";

--
-- Name: config_notif_servier_cfgntsrv_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.config_notif_servier_cfgntsrv_id_seq (
                                                             next_not_cached_value bigint NOT NULL,
                                                             minimum_value bigint NOT NULL,
                                                             maximum_value bigint NOT NULL,
                                                             start_value bigint NOT NULL,
                                                             increment bigint NOT NULL,
                                                             cache_size bigint NOT NULL,
                                                             cycle_option smallint NOT NULL,
                                                             cycle_count bigint NOT NULL
);


ALTER TABLE public.config_notif_servier_cfgntsrv_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: config_planilla; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.config_planilla (
                                        confg_pnll_id integer NOT NULL,
                                        formapago character(3) NOT NULL,
                                        pctj_anualidad double precision NOT NULL,
                                        pctj_vacaciones double precision NOT NULL,
                                        pctj_quinquenio double precision NOT NULL,
                                        pctj_cargar_social double precision NOT NULL,
                                        pctj_aguinaldos double precision NOT NULL,
                                        pctj_cesantias double precision NOT NULL,
                                        redondeo double precision NOT NULL,
                                        horas_semanales integer NOT NULL,
                                        pago_xhora double precision,
                                        pago_xdia double precision
);


ALTER TABLE public.config_planilla OWNER TO "saplic_dprlac_user";

--
-- Name: config_planilla_confg_pnll_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.config_planilla_confg_pnll_id_seq (
                                                          next_not_cached_value bigint NOT NULL,
                                                          minimum_value bigint NOT NULL,
                                                          maximum_value bigint NOT NULL,
                                                          start_value bigint NOT NULL,
                                                          increment bigint NOT NULL,
                                                          cache_size bigint NOT NULL,
                                                          cycle_option smallint NOT NULL,
                                                          cycle_count bigint NOT NULL
);


ALTER TABLE public.config_planilla_confg_pnll_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: controlcodigos; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.controlcodigos (
                                       id integer NOT NULL,
                                       numerocontrol character varying(16) DEFAULT NULL::character varying,
                                       codigogeneracion character varying(36) DEFAULT NULL::character varying,
                                       fechanio character varying(4) DEFAULT NULL::character varying
);


ALTER TABLE public.controlcodigos OWNER TO "saplic_dprlac_user";

--
-- Name: correlativo_comprobante; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.correlativo_comprobante (
                                                corrcpr_id integer NOT NULL,
                                                estado character(3) DEFAULT NULL::bpchar,
                                                tipo_documento character(1) NOT NULL,
                                                num_actual bigint NOT NULL,
                                                num_inicio bigint NOT NULL,
                                                num_serie character(10) DEFAULT NULL::bpchar,
                                                sucursal_id integer NOT NULL,
                                                num_final bigint,
                                                cod_aut_ticket character(200) DEFAULT NULL::bpchar
);


ALTER TABLE public.correlativo_comprobante OWNER TO "saplic_dprlac_user";

--
-- Name: correlativo_comprobante_corrcpr_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.correlativo_comprobante_corrcpr_id_seq (
                                                               next_not_cached_value bigint NOT NULL,
                                                               minimum_value bigint NOT NULL,
                                                               maximum_value bigint NOT NULL,
                                                               start_value bigint NOT NULL,
                                                               increment bigint NOT NULL,
                                                               cache_size bigint NOT NULL,
                                                               cycle_option smallint NOT NULL,
                                                               cycle_count bigint NOT NULL
);


ALTER TABLE public.correlativo_comprobante_corrcpr_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: csfcn_cheque; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.csfcn_cheque (
                                     csfcn_cheque_id integer NOT NULL,
                                     cod_csfcn character(30) NOT NULL,
                                     nombre_csfcn character(50) NOT NULL,
                                     clscheq_id integer
);


ALTER TABLE public.csfcn_cheque OWNER TO "saplic_dprlac_user";

--
-- Name: csfcn_cheque_csfcn_cheque_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.csfcn_cheque_csfcn_cheque_id_seq (
                                                         next_not_cached_value bigint NOT NULL,
                                                         minimum_value bigint NOT NULL,
                                                         maximum_value bigint NOT NULL,
                                                         start_value bigint NOT NULL,
                                                         increment bigint NOT NULL,
                                                         cache_size bigint NOT NULL,
                                                         cycle_option smallint NOT NULL,
                                                         cycle_count bigint NOT NULL
);


ALTER TABLE public.csfcn_cheque_csfcn_cheque_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: cta_cte; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cta_cte (
                                ctacte_id integer NOT NULL,
                                descripcion character(150) NOT NULL,
                                no_cta_cte character(30) NOT NULL,
                                saldo double precision NOT NULL,
                                sqte_cheque integer NOT NULL,
                                banco_id integer,
                                ctacont_id integer
);


ALTER TABLE public.cta_cte OWNER TO "saplic_dprlac_user";

--
-- Name: cta_cte_ctacte_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cta_cte_ctacte_id_seq (
                                              next_not_cached_value bigint NOT NULL,
                                              minimum_value bigint NOT NULL,
                                              maximum_value bigint NOT NULL,
                                              start_value bigint NOT NULL,
                                              increment bigint NOT NULL,
                                              cache_size bigint NOT NULL,
                                              cycle_option smallint NOT NULL,
                                              cycle_count bigint NOT NULL
);


ALTER TABLE public.cta_cte_ctacte_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: cuenta_cobrar; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cuenta_cobrar (
                                      cxc_id integer NOT NULL,
                                      monto integer NOT NULL,
                                      comentario character varying(300) DEFAULT NULL::character varying,
                                      estado character varying(255) NOT NULL,
                                      comprobante character varying(20) NOT NULL,
                                      fecha_ingreso date NOT NULL,
                                      dias_plazo integer NOT NULL,
                                      fecha_vencimiento date NOT NULL,
                                      remanente integer,
                                      cliente_id integer NOT NULL,
                                      concepto_id integer,
                                      succxc_id integer NOT NULL,
                                      asiento_id integer,
                                      venta_id integer,
                                      sin_banderas smallint
);


ALTER TABLE public.cuenta_cobrar OWNER TO "saplic_dprlac_user";

--
-- Name: cuenta_cobrar_cxc_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cuenta_cobrar_cxc_id_seq (
                                                 next_not_cached_value bigint NOT NULL,
                                                 minimum_value bigint NOT NULL,
                                                 maximum_value bigint NOT NULL,
                                                 start_value bigint NOT NULL,
                                                 increment bigint NOT NULL,
                                                 cache_size bigint NOT NULL,
                                                 cycle_option smallint NOT NULL,
                                                 cycle_count bigint NOT NULL
);


ALTER TABLE public.cuenta_cobrar_cxc_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: cuenta_contable; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cuenta_contable (
                                        cta_id integer NOT NULL,
                                        nombre character varying(120) NOT NULL,
                                        descripcion character varying(200) DEFAULT NULL::character varying,
                                        cod_cuenta character varying(20) NOT NULL,
                                        cod_cuenta_gral character varying(20) DEFAULT NULL::character varying,
                                        req_nit smallint,
                                        saldo_deudor numeric(12,2) DEFAULT NULL::numeric,
                                        saldo_acreedor numeric(12,2) DEFAULT NULL::numeric,
                                        csfcn_cta character varying(3) DEFAULT NULL::character varying,
                                        nivel integer,
                                        cifrado_cta character varying(12) DEFAULT NULL::character varying,
                                        acepta_movs smallint,
                                        cod_cuenta_papa character varying(12) DEFAULT NULL::character varying,
                                        cifrado_sup_cta character varying(12) DEFAULT NULL::character varying,
                                        naturaleza character varying(1) DEFAULT NULL::character varying,
                                        ctapadre_id integer,
                                        sub_tipo_cuenta_id integer,
                                        tpocta_id integer
);


ALTER TABLE public.cuenta_contable OWNER TO "saplic_dprlac_user";

--
-- Name: cuenta_contable_cta_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cuenta_contable_cta_id_seq (
                                                   next_not_cached_value bigint NOT NULL,
                                                   minimum_value bigint NOT NULL,
                                                   maximum_value bigint NOT NULL,
                                                   start_value bigint NOT NULL,
                                                   increment bigint NOT NULL,
                                                   cache_size bigint NOT NULL,
                                                   cycle_option smallint NOT NULL,
                                                   cycle_count bigint NOT NULL
);


ALTER TABLE public.cuenta_contable_cta_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: cuenta_pagar; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cuenta_pagar (
                                     cxp_id integer NOT NULL,
                                     monto integer NOT NULL,
                                     comentario character varying(300) DEFAULT NULL::character varying,
                                     estado character varying(3) NOT NULL,
                                     comprobante character varying(20) NOT NULL,
                                     fecha_ingreso date NOT NULL,
                                     dias_plazo integer NOT NULL,
                                     fecha_vencimiento date NOT NULL,
                                     remanente integer,
                                     asiento_id integer,
                                     concepto_id integer,
                                     proveedor integer,
                                     compra integer,
                                     sucursal integer,
                                     lote character varying(25) DEFAULT NULL::character varying
);


ALTER TABLE public.cuenta_pagar OWNER TO "saplic_dprlac_user";

--
-- Name: cuenta_pagar_cxp_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.cuenta_pagar_cxp_id_seq (
                                                next_not_cached_value bigint NOT NULL,
                                                minimum_value bigint NOT NULL,
                                                maximum_value bigint NOT NULL,
                                                start_value bigint NOT NULL,
                                                increment bigint NOT NULL,
                                                cache_size bigint NOT NULL,
                                                cycle_option smallint NOT NULL,
                                                cycle_count bigint NOT NULL
);


ALTER TABLE public.cuenta_pagar_cxp_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: Cuerpodocumento; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.Cuerpodocumento (
                                        "identificador" bigint NOT NULL,
                                        "numeroControl" character varying(36) NOT NULL,
                                        "codigoGeneracion" character varying(36) NOT NULL,
                                        "item" character varying(4) DEFAULT NULL::character varying,
                                        "tipoItem" character varying(4) DEFAULT NULL::character varying,
                                        "tipoDonacion" character varying(1) DEFAULT NULL::character varying,
                                        "depreciacion" character varying(14) DEFAULT NULL::character varying,
                                        "tipDTRelacionado" character varying(2) DEFAULT NULL::character varying,
                                        "tipGenDoc" character varying(1) DEFAULT NULL::character varying,
                                        "numDocRelacionado" character varying(36) DEFAULT NULL::character varying,
                                        "fechaGendoc" date,
                                        "cantidad" character varying(14) DEFAULT NULL::character varying,
                                        "codigo" character varying(25) DEFAULT NULL::character varying,
                                        "areafact" character varying(5) DEFAULT NULL::character varying,
                                        "codTributo" character varying(2) DEFAULT NULL::character varying,
                                        "unidadMedida" character varying(2) DEFAULT NULL::character varying,
                                        "descripcion" character varying(1000) DEFAULT NULL::character varying,
                                        "precioUnitario" character varying(14) DEFAULT NULL::character varying,
                                        "valorUnitario" character varying(14) DEFAULT NULL::character varying,
                                        "descuentos" character varying(14) DEFAULT NULL::character varying,
                                        "ventasNSujetas" character varying(14) DEFAULT NULL::character varying,
                                        "ventasExentas" character varying(14) DEFAULT NULL::character varying,
                                        "ventasGravadas" character varying(14) DEFAULT NULL::character varying,
                                        "exportaciones" character varying(14) DEFAULT NULL::character varying,
                                        "valorDonado" character varying(14) DEFAULT NULL::character varying,
                                        "ventas" character varying(11) DEFAULT NULL::character varying,
                                        "codigoTributo" character varying(100) DEFAULT NULL::character varying,
                                        "precSugVenta" character varying(14) DEFAULT NULL::character varying,
                                        "CargosAbono" character varying(14) DEFAULT NULL::character varying,
                                        "ivaItem" character varying(14) DEFAULT NULL::character varying,
                                        "montoretencion" character varying(14) DEFAULT NULL::character varying,
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
                                        "subtotal" character varying(14) DEFAULT NULL::character varying,
                                        "ivaOpLiq" character varying(14) DEFAULT NULL::character varying,
                                        "montoSinIva" character varying(14) DEFAULT NULL::character varying,
                                        "ivaPercibido" character varying(14) DEFAULT NULL::character varying,
                                        "comision" character varying(14) DEFAULT NULL::character varying,
                                        "porcComision" character varying(100) DEFAULT NULL::character varying,
                                        "IvaComision" character varying(14) DEFAULT NULL::character varying,
                                        "ValorLiqPagar" character varying(14) DEFAULT NULL::character varying,
                                        "valorLetras" character varying(200) DEFAULT NULL::character varying,
                                        "sacosEsp" character varying(5000) DEFAULT NULL::character varying
);


ALTER TABLE public.Cuerpodocumento OWNER TO "saplic_dprlac_user";

--
-- Name: dec_ing_emp; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.dec_ing_emp (
                                    dedingemp_id integer NOT NULL,
                                    plazo integer NOT NULL,
                                    ctadeding_id integer,
                                    empleado_id integer,
                                    decingsal_id integer
);


ALTER TABLE public.dec_ing_emp OWNER TO "saplic_dprlac_user";

--
-- Name: dec_ing_emp_dedingemp_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.dec_ing_emp_dedingemp_id_seq (
                                                     next_not_cached_value bigint NOT NULL,
                                                     minimum_value bigint NOT NULL,
                                                     maximum_value bigint NOT NULL,
                                                     start_value bigint NOT NULL,
                                                     increment bigint NOT NULL,
                                                     cache_size bigint NOT NULL,
                                                     cycle_option smallint NOT NULL,
                                                     cycle_count bigint NOT NULL
);


ALTER TABLE public.dec_ing_emp_dedingemp_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: dec_ing_sal; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.dec_ing_sal (
                                    decingsal_id integer NOT NULL,
                                    monto numeric(12,2) NOT NULL,
                                    tipo character varying(3) DEFAULT NULL::character varying,
                                    descripcion character varying(10) DEFAULT NULL::character varying,
                                    cod_dec_ing character varying(10) NOT NULL,
                                    obligatoria smallint,
                                    es_prctj smallint,
                                    ext_carga_social smallint,
                                    ext_pres smallint,
                                    ext_deduciones smallint,
                                    ctamon_id integer
);


ALTER TABLE public.dec_ing_sal OWNER TO "saplic_dprlac_user";

--
-- Name: dec_ing_sal_decingsal_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.dec_ing_sal_decingsal_id_seq (
                                                     next_not_cached_value bigint NOT NULL,
                                                     minimum_value bigint NOT NULL,
                                                     maximum_value bigint NOT NULL,
                                                     start_value bigint NOT NULL,
                                                     increment bigint NOT NULL,
                                                     cache_size bigint NOT NULL,
                                                     cycle_option smallint NOT NULL,
                                                     cycle_count bigint NOT NULL
);


ALTER TABLE public.dec_ing_sal_decingsal_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: deducciones; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.deducciones (
                                    deduccion_id integer NOT NULL,
                                    valorisss numeric(12,2) DEFAULT NULL::numeric,
                                    valorafp numeric(12,2) DEFAULT NULL::numeric,
                                    valorrenta numeric(12,2) DEFAULT NULL::numeric,
                                    valoripsfa numeric(12,2) DEFAULT NULL::numeric,
                                    valorissspensiones numeric(12,2) DEFAULT NULL::numeric,
                                    periodo_deducciones date,
                                    anno integer,
                                    mes integer,
                                    dia integer,
                                    total_deducciones numeric(12,2) DEFAULT NULL::numeric,
                                    empled_id integer NOT NULL
);


ALTER TABLE public.deducciones OWNER TO "saplic_dprlac_user";

--
-- Name: dep_ret_cta_cte; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.dep_ret_cta_cte (
                                        depretcta_id integer NOT NULL,
                                        monto integer NOT NULL,
                                        tipo character varying(3) NOT NULL,
                                        referencia character varying(150) NOT NULL,
                                        no_transac character varying(30) NOT NULL,
                                        fech_transac date NOT NULL,
                                        ctacte_id integer
);


ALTER TABLE public.dep_ret_cta_cte OWNER TO "saplic_dprlac_user";

--
-- Name: dep_ret_cta_cte_depretcta_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.dep_ret_cta_cte_depretcta_id_seq (
                                                         next_not_cached_value bigint NOT NULL,
                                                         minimum_value bigint NOT NULL,
                                                         maximum_value bigint NOT NULL,
                                                         start_value bigint NOT NULL,
                                                         increment bigint NOT NULL,
                                                         cache_size bigint NOT NULL,
                                                         cycle_option smallint NOT NULL,
                                                         cycle_count bigint NOT NULL
);


ALTER TABLE public.dep_ret_cta_cte_depretcta_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: departamento; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.departamento (
                                     departamento_id integer NOT NULL,
                                     codigo character varying(10) NOT NULL,
                                     nombre character varying(35) NOT NULL,
                                     descripcion character varying(150) DEFAULT NULL::character varying,
                                     ctadepto_id integer
);


ALTER TABLE public.departamento OWNER TO "saplic_dprlac_user";

--
-- Name: departamento_departamento_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.departamento_departamento_id_seq (
                                                         next_not_cached_value bigint NOT NULL,
                                                         minimum_value bigint NOT NULL,
                                                         maximum_value bigint NOT NULL,
                                                         start_value bigint NOT NULL,
                                                         increment bigint NOT NULL,
                                                         cache_size bigint NOT NULL,
                                                         cycle_option smallint NOT NULL,
                                                         cycle_count bigint NOT NULL
);


ALTER TABLE public.departamento_departamento_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: det_cert_descuento; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.det_cert_descuento (
                                           detdesc_id integer NOT NULL,
                                           crtdsc_id integer NOT NULL,
                                           producto_id integer,
                                           categoria_id integer,
                                           cliente_id integer,
                                           sucursal_id integer
);


ALTER TABLE public.det_cert_descuento OWNER TO "saplic_dprlac_user";

--
-- Name: det_cert_descuento_detdesc_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.det_cert_descuento_detdesc_id_seq (
                                                          next_not_cached_value bigint NOT NULL,
                                                          minimum_value bigint NOT NULL,
                                                          maximum_value bigint NOT NULL,
                                                          start_value bigint NOT NULL,
                                                          increment bigint NOT NULL,
                                                          cache_size bigint NOT NULL,
                                                          cycle_option smallint NOT NULL,
                                                          cycle_count bigint NOT NULL
);


ALTER TABLE public.det_cert_descuento_detdesc_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: det_compras; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.det_compras (
                                    id bigint NOT NULL,
                                    numcontrol character varying(36) NOT NULL,
                                    codgeneracion character varying(36) NOT NULL,
                                    cantidad character varying(14) NOT NULL,
                                    descripcion character varying(1000) NOT NULL,
                                    precio numeric(12,2) NOT NULL,
                                    item character varying(100) DEFAULT NULL::character varying
);


ALTER TABLE public.det_compras OWNER TO "saplic_dprlac_user";

--
-- Name: det_dec_ing; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.det_dec_ing (
                                    detdecing_id integer NOT NULL,
                                    dec_id integer NOT NULL,
                                    ing_id integer NOT NULL
);


ALTER TABLE public.det_dec_ing OWNER TO "saplic_dprlac_user";

--
-- Name: det_dec_ing_detdecing_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.det_dec_ing_detdecing_id_seq (
                                                     next_not_cached_value bigint NOT NULL,
                                                     minimum_value bigint NOT NULL,
                                                     maximum_value bigint NOT NULL,
                                                     start_value bigint NOT NULL,
                                                     increment bigint NOT NULL,
                                                     cache_size bigint NOT NULL,
                                                     cycle_option smallint NOT NULL,
                                                     cycle_count bigint NOT NULL
);


ALTER TABLE public.det_dec_ing_detdecing_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: det_devolucion_parcial; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.det_devolucion_parcial (
                                               dtdvpa_id integer NOT NULL,
                                               cantidad integer NOT NULL,
                                               costo_unitario integer NOT NULL,
                                               presentacion character varying(4) DEFAULT NULL::character varying,
                                               cant_presentacion integer,
                                               nums_presentacion character varying(2000) DEFAULT NULL::character varying,
                                               num_lote character varying(30) DEFAULT NULL::character varying,
                                               unimed_id integer,
                                               inventario_id integer NOT NULL,
                                               devolucion_id integer NOT NULL
);


ALTER TABLE public.det_devolucion_parcial OWNER TO "saplic_dprlac_user";

--
-- Name: det_devolucion_parcial_dtdvpa_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.det_devolucion_parcial_dtdvpa_id_seq (
                                                             next_not_cached_value bigint NOT NULL,
                                                             minimum_value bigint NOT NULL,
                                                             maximum_value bigint NOT NULL,
                                                             start_value bigint NOT NULL,
                                                             increment bigint NOT NULL,
                                                             cache_size bigint NOT NULL,
                                                             cycle_option smallint NOT NULL,
                                                             cycle_count bigint NOT NULL
);


ALTER TABLE public.det_devolucion_parcial_dtdvpa_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: det_devolucion_proveedor; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.det_devolucion_proveedor (
                                                 dtdvprov_id integer NOT NULL,
                                                 dvprov_id integer NOT NULL,
                                                 cantidad integer NOT NULL,
                                                 cod_lote character varying(50) DEFAULT NULL::character varying,
                                                 presentacion character varying(4) DEFAULT NULL::character varying,
                                                 cant_presentacion integer,
                                                 nums_presentacion character varying(1000) DEFAULT NULL::character varying,
                                                 costo_unitario integer NOT NULL,
                                                 unimed_id integer,
                                                 inventario_id integer NOT NULL
);


ALTER TABLE public.det_devolucion_proveedor OWNER TO "saplic_dprlac_user";

--
-- Name: det_devolucion_proveedor_dtdvprov_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.det_devolucion_proveedor_dtdvprov_id_seq (
                                                                 next_not_cached_value bigint NOT NULL,
                                                                 minimum_value bigint NOT NULL,
                                                                 maximum_value bigint NOT NULL,
                                                                 start_value bigint NOT NULL,
                                                                 increment bigint NOT NULL,
                                                                 cache_size bigint NOT NULL,
                                                                 cycle_option smallint NOT NULL,
                                                                 cycle_count bigint NOT NULL
);


ALTER TABLE public.det_devolucion_proveedor_dtdvprov_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: det_horario; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.det_horario (
                                    decingsal_id integer NOT NULL,
                                    dia character varying(3) NOT NULL,
                                    fech_entrada date NOT NULL,
                                    fech_salida date NOT NULL,
                                    horas_calc integer,
                                    mint_calc integer,
                                    horario_id integer
);


ALTER TABLE public.det_horario OWNER TO "saplic_dprlac_user";

--
-- Name: det_horario_decingsal_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.det_horario_decingsal_id_seq (
                                                     next_not_cached_value bigint NOT NULL,
                                                     minimum_value bigint NOT NULL,
                                                     maximum_value bigint NOT NULL,
                                                     start_value bigint NOT NULL,
                                                     increment bigint NOT NULL,
                                                     cache_size bigint NOT NULL,
                                                     cycle_option smallint NOT NULL,
                                                     cycle_count bigint NOT NULL
);


ALTER TABLE public.det_horario_decingsal_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: det_inventario_tienda; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.det_inventario_tienda (
                                              id integer NOT NULL,
                                              id_inv_tienda integer NOT NULL,
                                              id_producto integer NOT NULL,
                                              concepto character varying(50) NOT NULL,
                                              existencia integer NOT NULL,
                                              valor integer NOT NULL,
                                              total integer NOT NULL,
                                              lote integer,
                                              unidades integer
);


ALTER TABLE public.det_inventario_tienda OWNER TO "saplic_dprlac_user";

--
-- Name: det_inventario_tienda_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.det_inventario_tienda_id_seq (
                                                     next_not_cached_value bigint NOT NULL,
                                                     minimum_value bigint NOT NULL,
                                                     maximum_value bigint NOT NULL,
                                                     start_value bigint NOT NULL,
                                                     increment bigint NOT NULL,
                                                     cache_size bigint NOT NULL,
                                                     cycle_option smallint NOT NULL,
                                                     cycle_count bigint NOT NULL
);


ALTER TABLE public.det_inventario_tienda_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: det_list_precios; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.det_list_precios (
                                         id integer NOT NULL,
                                         precio_venta integer,
                                         lp_id integer NOT NULL,
                                         prod_id integer NOT NULL
);


ALTER TABLE public.det_list_precios OWNER TO "saplic_dprlac_user";

--
-- Name: det_list_precios_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.det_list_precios_id_seq (
                                                next_not_cached_value bigint NOT NULL,
                                                minimum_value bigint NOT NULL,
                                                maximum_value bigint NOT NULL,
                                                start_value bigint NOT NULL,
                                                increment bigint NOT NULL,
                                                cache_size bigint NOT NULL,
                                                cycle_option smallint NOT NULL,
                                                cycle_count bigint NOT NULL
);


ALTER TABLE public.det_list_precios_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: det_orden_venta; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.det_orden_venta (
                                        dov_id integer NOT NULL,
                                        orden_venta integer NOT NULL,
                                        producto_id integer NOT NULL,
                                        cantidad integer,
                                        unidades smallint,
                                        presentacion character varying(3) DEFAULT NULL::character varying,
                                        precio integer,
                                        lote character varying(50) DEFAULT NULL::character varying,
                                        nums_presentacion character varying(2000) DEFAULT NULL::character varying,
                                        monto integer
);


ALTER TABLE public.det_orden_venta OWNER TO "saplic_dprlac_user";

--
-- Name: det_orden_venta_dov_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.det_orden_venta_dov_id_seq (
                                                   next_not_cached_value bigint NOT NULL,
                                                   minimum_value bigint NOT NULL,
                                                   maximum_value bigint NOT NULL,
                                                   start_value bigint NOT NULL,
                                                   increment bigint NOT NULL,
                                                   cache_size bigint NOT NULL,
                                                   cycle_option smallint NOT NULL,
                                                   cycle_count bigint NOT NULL
);


ALTER TABLE public.det_orden_venta_dov_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: det_transferencia_flash; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.det_transferencia_flash (
                                                id integer NOT NULL,
                                                costo_unitario numeric(12,2) DEFAULT NULL::numeric,
                                                cantidad numeric(12,2) DEFAULT NULL::numeric,
                                                t_lote character varying(255) DEFAULT NULL::character varying,
                                                cant_presentacion smallint,
                                                tf_id integer NOT NULL,
                                                producto integer,
                                                presentacion character varying(3) DEFAULT NULL::character varying,
                                                costo_prod numeric(12,2) DEFAULT NULL::numeric,
                                                costo numeric(12,2) DEFAULT NULL::numeric
);


ALTER TABLE public.det_transferencia_flash OWNER TO "saplic_dprlac_user";

--
-- Name: det_transferencia_flash_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.det_transferencia_flash_id_seq (
                                                       next_not_cached_value bigint NOT NULL,
                                                       minimum_value bigint NOT NULL,
                                                       maximum_value bigint NOT NULL,
                                                       start_value bigint NOT NULL,
                                                       increment bigint NOT NULL,
                                                       cache_size bigint NOT NULL,
                                                       cycle_option smallint NOT NULL,
                                                       cycle_count bigint NOT NULL
);


ALTER TABLE public.det_transferencia_flash_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: det_venta_prod_serv; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.det_venta_prod_serv (
                                            vtaprsv_id integer NOT NULL,
                                            cantidad integer NOT NULL,
                                            monto integer NOT NULL,
                                            detalle character varying(200) NOT NULL,
                                            escondido smallint,
                                            venta_id integer NOT NULL,
                                            detalle_resumen character varying(80) DEFAULT NULL::character varying,
                                            precio_unitario integer,
                                            tipo_venta character varying(1) DEFAULT NULL::character varying,
                                            producto_id integer,
                                            servicio_id integer,
                                            cantidad_descuento integer,
                                            garantia smallint,
                                            abreviatura_uni character varying(8) DEFAULT NULL::character varying,
                                            costo_mercaderia numeric(12,2) DEFAULT NULL::numeric,
                                            presentacion character varying(3) DEFAULT NULL::character varying,
                                            cant_presentacion smallint,
                                            proveedor_id integer,
                                            lote character varying(35) DEFAULT NULL::character varying,
                                            nums_presentacion character varying(2000) DEFAULT NULL::character varying
);


ALTER TABLE public.det_venta_prod_serv OWNER TO "saplic_dprlac_user";

--
-- Name: det_venta_prod_serv_vtaprsv_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.det_venta_prod_serv_vtaprsv_id_seq (
                                                           next_not_cached_value bigint NOT NULL,
                                                           minimum_value bigint NOT NULL,
                                                           maximum_value bigint NOT NULL,
                                                           start_value bigint NOT NULL,
                                                           increment bigint NOT NULL,
                                                           cache_size bigint NOT NULL,
                                                           cycle_option smallint NOT NULL,
                                                           cycle_count bigint NOT NULL
);


ALTER TABLE public.det_venta_prod_serv_vtaprsv_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: devolucion_parcial; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.devolucion_parcial (
                                           devpar_id integer NOT NULL,
                                           fecha date NOT NULL,
                                           comentarios character varying(700) NOT NULL,
                                           monto_descontado integer,
                                           monto_nuevo integer,
                                           venta_id integer NOT NULL,
                                           movimiento integer,
                                           num_documento bigint,
                                           estado character varying(3) DEFAULT NULL::character varying,
                                           usuario_id integer,
                                           sucursal integer,
                                           tipeo character varying(255) DEFAULT NULL::character varying,
                                           ajuste_libras smallint
);


ALTER TABLE public.devolucion_parcial OWNER TO "saplic_dprlac_user";

--
-- Name: devolucion_parcial_devpar_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.devolucion_parcial_devpar_id_seq (
                                                         next_not_cached_value bigint NOT NULL,
                                                         minimum_value bigint NOT NULL,
                                                         maximum_value bigint NOT NULL,
                                                         start_value bigint NOT NULL,
                                                         increment bigint NOT NULL,
                                                         cache_size bigint NOT NULL,
                                                         cycle_option smallint NOT NULL,
                                                         cycle_count bigint NOT NULL
);


ALTER TABLE public.devolucion_parcial_devpar_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: devolucion_proveedor; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.devolucion_proveedor (
                                             devprov_id integer NOT NULL,
                                             fecha date NOT NULL,
                                             comentarios character varying(700) NOT NULL,
                                             monto_descontado integer,
                                             monto_nuevo integer,
                                             compra_id integer,
                                             prov_id integer,
                                             movimiento integer
);


ALTER TABLE public.devolucion_proveedor OWNER TO "saplic_dprlac_user";

--
-- Name: devolucion_proveedor_devprov_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.devolucion_proveedor_devprov_id_seq (
                                                            next_not_cached_value bigint NOT NULL,
                                                            minimum_value bigint NOT NULL,
                                                            maximum_value bigint NOT NULL,
                                                            start_value bigint NOT NULL,
                                                            increment bigint NOT NULL,
                                                            cache_size bigint NOT NULL,
                                                            cycle_option smallint NOT NULL,
                                                            cycle_count bigint NOT NULL
);


ALTER TABLE public.devolucion_proveedor_devprov_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: dia_operacion; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.dia_operacion (
                                      srvvta_id integer NOT NULL,
                                      fecha date NOT NULL,
                                      estado character varying(3) NOT NULL,
                                      fecha_apertura date,
                                      fecha_cierre date,
                                      usrcer_id integer,
                                      usrabi_id integer,
                                      suc_id integer
);


ALTER TABLE public.dia_operacion OWNER TO "saplic_dprlac_user";

--
-- Name: dia_operacion_srvvta_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.dia_operacion_srvvta_id_seq (
                                                    next_not_cached_value bigint NOT NULL,
                                                    minimum_value bigint NOT NULL,
                                                    maximum_value bigint NOT NULL,
                                                    start_value bigint NOT NULL,
                                                    increment bigint NOT NULL,
                                                    cache_size bigint NOT NULL,
                                                    cycle_option smallint NOT NULL,
                                                    cycle_count bigint NOT NULL
);


ALTER TABLE public.dia_operacion_srvvta_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: dias_extras; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.dias_extras (
                                    id integer NOT NULL,
                                    fecha date NOT NULL,
                                    empleado integer NOT NULL,
                                    cantidad_dias integer NOT NULL,
                                    empresa integer
);


ALTER TABLE public.dias_extras OWNER TO "saplic_dprlac_user";

--
-- Name: dias_extras_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.dias_extras_id_seq (
                                           next_not_cached_value bigint NOT NULL,
                                           minimum_value bigint NOT NULL,
                                           maximum_value bigint NOT NULL,
                                           start_value bigint NOT NULL,
                                           increment bigint NOT NULL,
                                           cache_size bigint NOT NULL,
                                           cycle_option smallint NOT NULL,
                                           cycle_count bigint NOT NULL
);


ALTER TABLE public.dias_extras_id_seq OWNER TO "saplic_dprlac_user";

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


ALTER TABLE public.docrelacionados OWNER TO "saplic_dprlac_user";

--
-- Name: ejercicio_contable; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.ejercicio_contable (
                                           ejercicio_contable_id integer NOT NULL,
                                           estado character varying(3) NOT NULL,
                                           fecha_inicio date NOT NULL,
                                           fecha_finalizacion date,
                                           longitud_cuenta integer,
                                           catalogo_monedas_id integer,
                                           ctavent_id integer,
                                           ctacomp_id integer,
                                           auto_renovable smallint,
                                           emp_id integer,
                                           num_ejercicio integer
);


ALTER TABLE public.ejercicio_contable OWNER TO "saplic_dprlac_user";

--
-- Name: ejercicio_contable_ejercicio_contable_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.ejercicio_contable_ejercicio_contable_id_seq (
                                                                     next_not_cached_value bigint NOT NULL,
                                                                     minimum_value bigint NOT NULL,
                                                                     maximum_value bigint NOT NULL,
                                                                     start_value bigint NOT NULL,
                                                                     increment bigint NOT NULL,
                                                                     cache_size bigint NOT NULL,
                                                                     cycle_option smallint NOT NULL,
                                                                     cycle_count bigint NOT NULL
);


ALTER TABLE public.ejercicio_contable_ejercicio_contable_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: ejercicio_cuenta_contable; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.ejercicio_cuenta_contable (
                                                  ejercicio_cuenta_contable_id integer NOT NULL,
                                                  saldo_deudor numeric(12,2) DEFAULT NULL::numeric,
                                                  saldo_acreedor numeric(12,2) DEFAULT NULL::numeric,
                                                  ejercicio_contable_id integer,
                                                  cta_id integer
);


ALTER TABLE public.ejercicio_cuenta_contable OWNER TO "saplic_dprlac_user";

--
-- Name: ejercicio_cuenta_contable_ejercicio_cuenta_contable_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.ejercicio_cuenta_contable_ejercicio_cuenta_contable_id_seq (
                                                                                   next_not_cached_value bigint NOT NULL,
                                                                                   minimum_value bigint NOT NULL,
                                                                                   maximum_value bigint NOT NULL,
                                                                                   start_value bigint NOT NULL,
                                                                                   increment bigint NOT NULL,
                                                                                   cache_size bigint NOT NULL,
                                                                                   cycle_option smallint NOT NULL,
                                                                                   cycle_count bigint NOT NULL
);


ALTER TABLE public.ejercicio_cuenta_contable_ejercicio_cuenta_contable_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: emisor; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.emisor (
                               id integer NOT NULL,
                               "numeroControl" character varying(31) NOT NULL,
                               "codigoGeneracion" character varying(36) NOT NULL,
                               "nit" character varying(17) DEFAULT NULL::character varying,
                               "tipoDoc" character varying(2) DEFAULT NULL::character varying,
                               "numDoc" character varying(14) DEFAULT NULL::character varying,
                               "ncr" character varying(8) DEFAULT NULL::character varying,
                               "nombre" character varying(250) DEFAULT NULL::character varying,
                               "codactEco" character varying(6) DEFAULT NULL::character varying,
                               "desactEco" character varying(150) DEFAULT NULL::character varying,
                               "nomComercial" character varying(150) DEFAULT NULL::character varying,
                               "tipEstablecimiento" character varying(2) DEFAULT NULL::character varying,
                               "Departamento" character varying(2) DEFAULT NULL::character varying,
                               "Municipio" character varying(2) DEFAULT NULL::character varying,
                               "Direccion" character varying(200) DEFAULT NULL::character varying,
                               "telefono" character varying(20) DEFAULT NULL::character varying,
                               "correo" character varying(100) DEFAULT NULL::character varying,
                               "codEstableMH" character varying(4) DEFAULT NULL::character varying,
                               "codEstable" character varying(10) DEFAULT NULL::character varying,
                               "codPuntoVentaMH" character varying(4) DEFAULT NULL::character varying,
                               "codPuntoVenta" character varying(15) DEFAULT NULL::character varying,
                               "tipoItem" integer,
                               "recintoFiscal" character varying(2) DEFAULT NULL::character varying,
                               "regExportacion" character varying(15) DEFAULT NULL::character varying
);


ALTER TABLE public.emisor OWNER TO "saplic_dprlac_user";

--
-- Name: empleado; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.empleado (
                                 empled_id integer NOT NULL,
                                 estado character varying(3) NOT NULL,
                                 nombre character varying(60) NOT NULL,
                                 genero smallint NOT NULL,
                                 fecha_ingreso date,
                                 fecha_inicio date NOT NULL,
                                 nit character varying(20) DEFAULT NULL::character varying,
                                 direccion character varying(200) NOT NULL,
                                 email character varying(40) DEFAULT NULL::character varying,
                                 forma_pago character varying(3) NOT NULL,
                                 apellido character varying(60) NOT NULL,
                                 tel_fijo character varying(12) DEFAULT NULL::character varying,
                                 tel_celular character varying(12) DEFAULT NULL::character varying,
                                 dui character varying(10) DEFAULT NULL::character varying,
                                 fecha_nacimiento date,
                                 periodo character varying(3) DEFAULT NULL::character varying,
                                 isss character varying(20) DEFAULT NULL::character varying,
                                 nup character varying(20) DEFAULT NULL::character varying,
                                 salario_hora numeric(12,2) DEFAULT NULL::numeric,
                                 horas integer,
                                 es_fijo smallint,
                                 pago_por character varying(3) DEFAULT NULL::character varying,
                                 anualidad integer,
                                 quinquenio integer,
                                 exclusividad integer,
                                 ser_prof_ex_agui smallint,
                                 vacaciones integer,
                                 ser_prof_ex_csta smallint,
                                 dias integer,
                                 persona_emergencia character varying(70) DEFAULT NULL::character varying,
                                 tel_emergencia character varying(12) DEFAULT NULL::character varying,
                                 licencia character varying(20) DEFAULT NULL::character varying,
                                 tipo_lic character varying(3) DEFAULT NULL::character varying,
                                 nombre_afp character varying(50) DEFAULT NULL::character varying,
                                 categoria_empl integer,
                                 debaja smallint NOT NULL,
                                 cotiza_isss smallint NOT NULL,
                                 cotiza_afp smallint NOT NULL,
                                 depto_id integer,
                                 puesto_trabajo_id integer NOT NULL,
                                 sucursal_id integer NOT NULL,
                                 horario_id integer NOT NULL,
                                 cantidad numeric(12,2) DEFAULT NULL::numeric,
                                 fecha_finalizacion date,
                                 cantidad2 numeric(12,2) DEFAULT NULL::numeric,
                                 valorisss numeric(12,2) DEFAULT NULL::numeric,
                                 valorafp numeric(12,2) DEFAULT NULL::numeric,
                                 valorrenta numeric(12,2) DEFAULT NULL::numeric,
                                 valoripsfa numeric(12,2) DEFAULT NULL::numeric,
                                 valorissspensiones numeric(12,2) DEFAULT NULL::numeric,
                                 total_deduciones numeric(12,2) DEFAULT NULL::numeric,
                                 cantidad_dias_trabajados integer,
                                 comisiones integer,
                                 bonificaciones integer,
                                 total_ingresos numeric(12,2) DEFAULT NULL::numeric,
                                 salario_devengado numeric(12,2) DEFAULT NULL::numeric,
                                 ipsfa character varying(20) DEFAULT NULL::character varying,
                                 isssp character varying(20) DEFAULT NULL::character varying,
                                 salario numeric(12,2) DEFAULT NULL::numeric,
                                 cotiza_ipsfa smallint,
                                 cotiza_isss_p smallint,
                                 hora_extra_normal numeric(12,2) DEFAULT NULL::numeric,
                                 hora_extra_nocturna numeric(12,2) DEFAULT NULL::numeric,
                                 anno integer,
                                 mes integer,
                                 dia integer,
                                 estado_planilla character varying(7) DEFAULT NULL::character varying,
                                 dias_trabajados_indemnizacion integer,
                                 anios_trabajados numeric(12,2) DEFAULT NULL::numeric,
                                 neto_recibir numeric(12,2) DEFAULT NULL::numeric,
                                 empresa integer,
                                 en_planilla smallint
);


ALTER TABLE public.empleado OWNER TO "saplic_dprlac_user";

--
-- Name: empleado_empled_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.empleado_empled_id_seq (
                                               next_not_cached_value bigint NOT NULL,
                                               minimum_value bigint NOT NULL,
                                               maximum_value bigint NOT NULL,
                                               start_value bigint NOT NULL,
                                               increment bigint NOT NULL,
                                               cache_size bigint NOT NULL,
                                               cycle_option smallint NOT NULL,
                                               cycle_count bigint NOT NULL
);


ALTER TABLE public.empleado_empled_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: empresa; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.empresa (
                                empresa_id integer NOT NULL,
                                codigo character varying(15) DEFAULT NULL::character varying,
                                nombre character varying(50) DEFAULT NULL::character varying
);


ALTER TABLE public.empresa OWNER TO "saplic_dprlac_user";

--
-- Name: empresa_empresa_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.empresa_empresa_id_seq (
                                               next_not_cached_value bigint NOT NULL,
                                               minimum_value bigint NOT NULL,
                                               maximum_value bigint NOT NULL,
                                               start_value bigint NOT NULL,
                                               increment bigint NOT NULL,
                                               cache_size bigint NOT NULL,
                                               cycle_option smallint NOT NULL,
                                               cycle_count bigint NOT NULL
);


ALTER TABLE public.empresa_empresa_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: encabezado_en_sa; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.encabezado_en_sa (
                                         id integer NOT NULL,
                                         fecha date NOT NULL,
                                         producto_entrada integer NOT NULL,
                                         movimiento integer,
                                         cant_entrada integer NOT NULL,
                                         pres_entrada character varying(3) DEFAULT NULL::character varying,
                                         cant_pres_entrada smallint
);


ALTER TABLE public.encabezado_en_sa OWNER TO "saplic_dprlac_user";

--
-- Name: encabezado_en_sa_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.encabezado_en_sa_id_seq (
                                                next_not_cached_value bigint NOT NULL,
                                                minimum_value bigint NOT NULL,
                                                maximum_value bigint NOT NULL,
                                                start_value bigint NOT NULL,
                                                increment bigint NOT NULL,
                                                cache_size bigint NOT NULL,
                                                cycle_option smallint NOT NULL,
                                                cycle_count bigint NOT NULL
);


ALTER TABLE public.encabezado_en_sa_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: factura; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.factura (
                                factura_id integer NOT NULL,
                                total numeric(12,2) NOT NULL,
                                fecha date NOT NULL,
                                tipo_documento integer NOT NULL,
                                iva integer NOT NULL,
                                numero_documento integer NOT NULL,
                                valor_grabado integer NOT NULL,
                                valor_exento integer NOT NULL,
                                valor_iva numeric(12,2) NOT NULL,
                                vendido_al integer NOT NULL,
                                retencion_percepcion integer NOT NULL,
                                client_id integer,
                                usuario_id integer
);


ALTER TABLE public.factura OWNER TO "saplic_dprlac_user";

--
-- Name: factura_factura_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.factura_factura_id_seq (
                                               next_not_cached_value bigint NOT NULL,
                                               minimum_value bigint NOT NULL,
                                               maximum_value bigint NOT NULL,
                                               start_value bigint NOT NULL,
                                               increment bigint NOT NULL,
                                               cache_size bigint NOT NULL,
                                               cycle_option smallint NOT NULL,
                                               cycle_count bigint NOT NULL
);


ALTER TABLE public.factura_factura_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: garantia_producto; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.garantia_producto (
                                          srvvta_id integer NOT NULL,
                                          estado character varying(3) NOT NULL,
                                          nombre character varying(40) NOT NULL,
                                          descripcion character varying(200) DEFAULT NULL::character varying,
                                          referencia character varying(20) NOT NULL,
                                          porcentaje smallint NOT NULL,
                                          categoria_id integer
);


ALTER TABLE public.garantia_producto OWNER TO "saplic_dprlac_user";

--
-- Name: garantia_producto_srvvta_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.garantia_producto_srvvta_id_seq (
                                                        next_not_cached_value bigint NOT NULL,
                                                        minimum_value bigint NOT NULL,
                                                        maximum_value bigint NOT NULL,
                                                        start_value bigint NOT NULL,
                                                        increment bigint NOT NULL,
                                                        cache_size bigint NOT NULL,
                                                        cycle_option smallint NOT NULL,
                                                        cycle_count bigint NOT NULL
);


ALTER TABLE public.garantia_producto_srvvta_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: gastos; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.gastos (
                               id integer NOT NULL,
                               id_sucursal integer NOT NULL,
                               fecha date NOT NULL,
                               pago_empleada integer,
                               pago_luz integer,
                               pago_local integer,
                               pago_agua integer,
                               pago_supervisora integer,
                               renta integer,
                               reparaciones integer,
                               varios_limpieza integer,
                               pago_anticipado_empl integer,
                               pago_anticipado_supervi integer,
                               recarga_tel integer,
                               plastico integer,
                               pajillas integer,
                               papel integer,
                               moto_taxi integer,
                               comida_gato integer,
                               libreria integer,
                               loroco integer,
                               pitas integer,
                               pago_vigilante integer,
                               vasos integer,
                               parqueo integer,
                               bolsas integer,
                               otros integer,
                               efectivo integer NOT NULL,
                               total_diario integer,
                               ganancias integer NOT NULL,
                               comentarios character varying(1000) DEFAULT NULL::character varying,
                               combustible integer,
                               honorarios_contable integer,
                               honorarios_juridicos integer,
                               caja_chica integer,
                               impuestos_iva integer,
                               imp_pag_cta integer,
                               impuesto_renta integer
);


ALTER TABLE public.gastos OWNER TO "saplic_dprlac_user";

--
-- Name: gastos_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.gastos_id_seq (
                                      next_not_cached_value bigint NOT NULL,
                                      minimum_value bigint NOT NULL,
                                      maximum_value bigint NOT NULL,
                                      start_value bigint NOT NULL,
                                      increment bigint NOT NULL,
                                      cache_size bigint NOT NULL,
                                      cycle_option smallint NOT NULL,
                                      cycle_count bigint NOT NULL
);


ALTER TABLE public.gastos_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: gastos_imprevistos; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.gastos_imprevistos (
                                           id integer NOT NULL,
                                           concepto character varying(150) NOT NULL,
                                           monto integer NOT NULL,
                                           id_gastos integer NOT NULL
);


ALTER TABLE public.gastos_imprevistos OWNER TO "saplic_dprlac_user";

--
-- Name: historial; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.historial (
                                  id integer NOT NULL,
                                  fecha date NOT NULL,
                                  movimiento integer,
                                  inventario integer,
                                  usuario integer NOT NULL,
                                  detalle character varying(700) NOT NULL
);


ALTER TABLE public.historial OWNER TO "saplic_dprlac_user";

--
-- Name: historial_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.historial_id_seq (
                                         next_not_cached_value bigint NOT NULL,
                                         minimum_value bigint NOT NULL,
                                         maximum_value bigint NOT NULL,
                                         start_value bigint NOT NULL,
                                         increment bigint NOT NULL,
                                         cache_size bigint NOT NULL,
                                         cycle_option smallint NOT NULL,
                                         cycle_count bigint NOT NULL
);


ALTER TABLE public.historial_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: horarios; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.horarios (
                                 detdecing_id integer NOT NULL,
                                 total smallint NOT NULL,
                                 descripcion character varying(150) DEFAULT NULL::character varying,
                                 iden_hor character varying(15) NOT NULL,
                                 tipo_horario character varying(1) NOT NULL,
                                 horas_domingo smallint NOT NULL,
                                 horas_lunes smallint NOT NULL,
                                 horas_martes smallint NOT NULL,
                                 horas_miercoles smallint NOT NULL,
                                 horas_jueves smallint NOT NULL,
                                 horas_viernes smallint NOT NULL,
                                 horas_sabado smallint NOT NULL,
                                 descanso_lunes smallint NOT NULL,
                                 descanso_martes smallint NOT NULL,
                                 descanso_miercoles smallint NOT NULL,
                                 descanso_jueves smallint NOT NULL,
                                 descanso_viernes smallint NOT NULL,
                                 descanso_sabado smallint NOT NULL,
                                 descanso_domingo smallint NOT NULL
);


ALTER TABLE public.horarios OWNER TO "saplic_dprlac_user";

--
-- Name: horarios_detdecing_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.horarios_detdecing_id_seq (
                                                  next_not_cached_value bigint NOT NULL,
                                                  minimum_value bigint NOT NULL,
                                                  maximum_value bigint NOT NULL,
                                                  start_value bigint NOT NULL,
                                                  increment bigint NOT NULL,
                                                  cache_size bigint NOT NULL,
                                                  cycle_option smallint NOT NULL,
                                                  cycle_count bigint NOT NULL
);


ALTER TABLE public.horarios_detdecing_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: horas_extras; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.horas_extras (
                                     he_id integer NOT NULL,
                                     fecha date NOT NULL,
                                     horas_normal numeric(12,2) NOT NULL,
                                     horas_domingo numeric(12,2) NOT NULL,
                                     horas_feriado numeric(12,2) NOT NULL,
                                     horas_nocturno numeric(12,2) NOT NULL,
                                     emp_he integer NOT NULL,
                                     phe_he integer,
                                     permanente smallint,
                                     periodo character varying(3) DEFAULT NULL::character varying
);


ALTER TABLE public.horas_extras OWNER TO "saplic_dprlac_user";

--
-- Name: horas_extras_he_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.horas_extras_he_id_seq (
                                               next_not_cached_value bigint NOT NULL,
                                               minimum_value bigint NOT NULL,
                                               maximum_value bigint NOT NULL,
                                               start_value bigint NOT NULL,
                                               increment bigint NOT NULL,
                                               cache_size bigint NOT NULL,
                                               cycle_option smallint NOT NULL,
                                               cycle_count bigint NOT NULL
);


ALTER TABLE public.horas_extras_he_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: hrs_act_emp; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.hrs_act_emp (
                                    hrsactemp_id integer NOT NULL,
                                    fech_entrada date,
                                    fech_salida date,
                                    empd_id integer,
                                    emps_id integer,
                                    act_id integer
);


ALTER TABLE public.hrs_act_emp OWNER TO "saplic_dprlac_user";

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
                                       "fecha" date,
                                       "hora" character varying(8) DEFAULT NULL::character varying,
                                       "tipMoneda" character varying(3) DEFAULT NULL::character varying,
                                       estado smallint DEFAULT 0
);


ALTER TABLE public.identificacion OWNER TO "saplic_dprlac_user";

--
-- Name: imp_renta; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.imp_renta (
                                  imp_renta_id integer NOT NULL,
                                  periodo character varying(30) NOT NULL,
                                  tramo character varying(30) NOT NULL,
                                  desde integer NOT NULL,
                                  hasta integer NOT NULL,
                                  pctj_aplicar integer NOT NULL,
                                  exceso integer NOT NULL,
                                  qta_fija integer NOT NULL
);


ALTER TABLE public.imp_renta OWNER TO "saplic_dprlac_user";

--
-- Name: imp_renta_imp_renta_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.imp_renta_imp_renta_id_seq (
                                                   next_not_cached_value bigint NOT NULL,
                                                   minimum_value bigint NOT NULL,
                                                   maximum_value bigint NOT NULL,
                                                   start_value bigint NOT NULL,
                                                   increment bigint NOT NULL,
                                                   cache_size bigint NOT NULL,
                                                   cycle_option smallint NOT NULL,
                                                   cycle_count bigint NOT NULL
);


ALTER TABLE public.imp_renta_imp_renta_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: indemnizacion; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.indemnizacion (
                                      indemnizacion_id integer NOT NULL,
                                      fecha_ingreso date,
                                      dias integer NOT NULL,
                                      monto_prestamo integer NOT NULL,
                                      salario numeric(12,2) NOT NULL,
                                      horase_diurnas numeric(12,2) NOT NULL,
                                      horase_nocturnas numeric(12,2) NOT NULL,
                                      "a�os" numeric(12,2) NOT NULL,
                                      valorneto numeric(12,2) NOT NULL,
                                      indemnizacion numeric(12,2) NOT NULL,
                                      v_isss numeric(12,2) DEFAULT NULL::numeric,
                                      v_afp numeric(12,2) DEFAULT NULL::numeric,
                                      valor_renta numeric(12,2) DEFAULT NULL::numeric,
                                      total_prestaciones numeric(12,2) DEFAULT NULL::numeric,
                                      suma_deducciones numeric(12,2) DEFAULT NULL::numeric,
                                      fecha_retiro date,
                                      pago_salario numeric(12,2) NOT NULL,
                                      empled_id integer NOT NULL,
                                      puesto_trabajo_id integer,
                                      depto_id integer
);


ALTER TABLE public.indemnizacion OWNER TO "saplic_dprlac_user";

--
-- Name: indemnizacion_indemnizacion_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.indemnizacion_indemnizacion_id_seq (
                                                           next_not_cached_value bigint NOT NULL,
                                                           minimum_value bigint NOT NULL,
                                                           maximum_value bigint NOT NULL,
                                                           start_value bigint NOT NULL,
                                                           increment bigint NOT NULL,
                                                           cache_size bigint NOT NULL,
                                                           cycle_option smallint NOT NULL,
                                                           cycle_count bigint NOT NULL
);


ALTER TABLE public.indemnizacion_indemnizacion_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: info_empresa; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.info_empresa (
                                     sgrprd_id integer NOT NULL,
                                     estado character varying(3) NOT NULL,
                                     nombre character varying(40) NOT NULL,
                                     direccion character varying(200) DEFAULT NULL::character varying,
                                     nit character varying(17) NOT NULL,
                                     giro character varying(200) NOT NULL,
                                     fax character varying(15) DEFAULT NULL::character varying,
                                     cod_empresa character varying(10) NOT NULL,
                                     nrc character varying(10) NOT NULL,
                                     telefono1 character varying(15) NOT NULL,
                                     telefono2 character varying(15) DEFAULT NULL::character varying,
                                     nombre_comercial character varying(40) DEFAULT NULL::character varying,
                                     tipo_contribuyente smallint
);


ALTER TABLE public.info_empresa OWNER TO "saplic_dprlac_user";

--
-- Name: info_empresa_sgrprd_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.info_empresa_sgrprd_id_seq (
                                                   next_not_cached_value bigint NOT NULL,
                                                   minimum_value bigint NOT NULL,
                                                   maximum_value bigint NOT NULL,
                                                   start_value bigint NOT NULL,
                                                   increment bigint NOT NULL,
                                                   cache_size bigint NOT NULL,
                                                   cycle_option smallint NOT NULL,
                                                   cycle_count bigint NOT NULL
);


ALTER TABLE public.info_empresa_sgrprd_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: ingresos; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.ingresos (
                                 ingresos_id integer NOT NULL,
                                 mes integer,
                                 dia integer,
                                 dias_trabajados integer,
                                 cantidad_he_diurnas numeric(12,2) DEFAULT NULL::numeric,
                                 horas_extras_diurnas numeric(12,2) DEFAULT NULL::numeric,
                                 cantidad_he_nocturnas numeric(12,2) DEFAULT NULL::numeric,
                                 horas_extras_nocturnas numeric(12,2) DEFAULT NULL::numeric,
                                 comisiones integer,
                                 bonificaciones integer,
                                 periodo_ingresos date,
                                 anno integer,
                                 total_ingresos numeric(12,2) DEFAULT NULL::numeric,
                                 salario_devengado numeric(12,2) DEFAULT NULL::numeric,
                                 empled_id integer NOT NULL,
                                 estado character varying(7) DEFAULT NULL::character varying
);


ALTER TABLE public.ingresos OWNER TO "saplic_dprlac_user";

--
-- Name: ingresos_ingresos_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.ingresos_ingresos_id_seq (
                                                 next_not_cached_value bigint NOT NULL,
                                                 minimum_value bigint NOT NULL,
                                                 maximum_value bigint NOT NULL,
                                                 start_value bigint NOT NULL,
                                                 increment bigint NOT NULL,
                                                 cache_size bigint NOT NULL,
                                                 cycle_option smallint NOT NULL,
                                                 cycle_count bigint NOT NULL
);


ALTER TABLE public.ingresos_ingresos_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: integracion; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.integracion (
                                    c1 character varying(150) DEFAULT NULL::character varying,
                                    c2 character varying(150) DEFAULT NULL::character varying,
                                    c3 character varying(150) DEFAULT NULL::character varying,
                                    c4 character varying(150) DEFAULT NULL::character varying,
                                    c5 character varying(150) DEFAULT NULL::character varying,
                                    c6 character varying(5000) DEFAULT NULL::character varying,
                                    c7 character varying(5000) DEFAULT NULL::character varying
);


ALTER TABLE public.integracion OWNER TO "saplic_dprlac_user";

--
-- Name: inventario; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.inventario (
                                   id integer NOT NULL,
                                   cantidad_actual integer NOT NULL,
                                   producto_id integer NOT NULL,
                                   sucursal_id integer NOT NULL
);


ALTER TABLE public.inventario OWNER TO "saplic_dprlac_user";

--
-- Name: inventario_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.inventario_id_seq (
                                          next_not_cached_value bigint NOT NULL,
                                          minimum_value bigint NOT NULL,
                                          maximum_value bigint NOT NULL,
                                          start_value bigint NOT NULL,
                                          increment bigint NOT NULL,
                                          cache_size bigint NOT NULL,
                                          cycle_option smallint NOT NULL,
                                          cycle_count bigint NOT NULL
);


ALTER TABLE public.inventario_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: inventario_tienda; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.inventario_tienda (
                                          id integer NOT NULL,
                                          id_sucursal integer NOT NULL,
                                          fecha_inicio date NOT NULL,
                                          fecha_fin date,
                                          supervisor character varying(62) DEFAULT NULL::character varying,
                                          encargada character varying(62) DEFAULT NULL::character varying,
                                          total_lacteos integer NOT NULL,
                                          caja integer NOT NULL,
                                          varios integer NOT NULL,
                                          paletas integer NOT NULL,
                                          saldos integer NOT NULL,
                                          otros_1 integer NOT NULL,
                                          exist_actual integer NOT NULL,
                                          remesas integer NOT NULL,
                                          gastos integer NOT NULL,
                                          descuentos integer NOT NULL,
                                          otros_2 integer NOT NULL,
                                          total_general integer NOT NULL,
                                          facturas integer NOT NULL,
                                          ganancia integer NOT NULL,
                                          otros integer NOT NULL,
                                          totales integer NOT NULL,
                                          comentarios character varying(1000) DEFAULT NULL::character varying,
                                          diferencia integer,
                                          producto_arruinado integer,
                                          empleado integer
);


ALTER TABLE public.inventario_tienda OWNER TO "saplic_dprlac_user";

--
-- Name: inventario_tienda_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.inventario_tienda_id_seq (
                                                 next_not_cached_value bigint NOT NULL,
                                                 minimum_value bigint NOT NULL,
                                                 maximum_value bigint NOT NULL,
                                                 start_value bigint NOT NULL,
                                                 increment bigint NOT NULL,
                                                 cache_size bigint NOT NULL,
                                                 cycle_option smallint NOT NULL,
                                                 cycle_count bigint NOT NULL
);


ALTER TABLE public.inventario_tienda_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: item; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.item (
                             inventario_id integer NOT NULL,
                             movimiento_id integer NOT NULL,
                             cantidad integer NOT NULL,
                             costo_unitario integer,
                             unimed_id integer,
                             presentacion character varying(3) DEFAULT NULL::character varying,
                             cant_presentacion smallint,
                             tipo_compra character varying(3) DEFAULT NULL::character varying,
                             lote character varying(50) DEFAULT NULL::character varying,
                             costo_compra numeric(12,2) DEFAULT NULL::numeric,
                             costo numeric(12,2) DEFAULT NULL::numeric
);


ALTER TABLE public.item OWNER TO "saplic_dprlac_user";

--
-- Name: item_lote; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.item_lote (
                                  item_lote_id integer NOT NULL,
                                  fecha_ingreso date NOT NULL,
                                  cantidad integer NOT NULL,
                                  num_serie character varying(20) DEFAULT NULL::character varying,
                                  precio_compra integer NOT NULL,
                                  fecha_expiracion date,
                                  cod_lote character varying(20) DEFAULT NULL::character varying,
                                  inv_id integer
);


ALTER TABLE public.item_lote OWNER TO "saplic_dprlac_user";

--
-- Name: item_lote_hist; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.item_lote_hist (
                                       item_lote_hist_id integer NOT NULL,
                                       num_serie character varying(20) DEFAULT NULL::character varying,
                                       precio_compra integer NOT NULL,
                                       fecha_expiracion date,
                                       cod_lote character varying(20) DEFAULT NULL::character varying,
                                       fecha_salida date NOT NULL,
                                       precio_venta integer,
                                       razon_salida character varying(3) NOT NULL,
                                       inv_id integer
);


ALTER TABLE public.item_lote_hist OWNER TO "saplic_dprlac_user";

--
-- Name: item_lote_hist_item_lote_hist_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.item_lote_hist_item_lote_hist_id_seq (
                                                             next_not_cached_value bigint NOT NULL,
                                                             minimum_value bigint NOT NULL,
                                                             maximum_value bigint NOT NULL,
                                                             start_value bigint NOT NULL,
                                                             increment bigint NOT NULL,
                                                             cache_size bigint NOT NULL,
                                                             cycle_option smallint NOT NULL,
                                                             cycle_count bigint NOT NULL
);


ALTER TABLE public.item_lote_hist_item_lote_hist_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: item_lote_item_lote_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.item_lote_item_lote_id_seq (
                                                   next_not_cached_value bigint NOT NULL,
                                                   minimum_value bigint NOT NULL,
                                                   maximum_value bigint NOT NULL,
                                                   start_value bigint NOT NULL,
                                                   increment bigint NOT NULL,
                                                   cache_size bigint NOT NULL,
                                                   cycle_option smallint NOT NULL,
                                                   cycle_count bigint NOT NULL
);


ALTER TABLE public.item_lote_item_lote_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: item_pedido; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.item_pedido (
                                    inventario_id integer NOT NULL,
                                    pedido_id integer NOT NULL,
                                    cantidad integer NOT NULL,
                                    costo_unitario integer NOT NULL
);


ALTER TABLE public.item_pedido OWNER TO "saplic_dprlac_user";

--
-- Name: list_precios; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.list_precios (
                                     id integer NOT NULL,
                                     codigo integer NOT NULL,
                                     nombre character varying(50) NOT NULL
);


ALTER TABLE public.list_precios OWNER TO "saplic_dprlac_user";

--
-- Name: list_precios_cliente; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.list_precios_cliente (
                                             list_precios_id integer NOT NULL,
                                             clientes_client_id integer NOT NULL
);


ALTER TABLE public.list_precios_cliente OWNER TO "saplic_dprlac_user";

--
-- Name: list_precios_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.list_precios_id_seq (
                                            next_not_cached_value bigint NOT NULL,
                                            minimum_value bigint NOT NULL,
                                            maximum_value bigint NOT NULL,
                                            start_value bigint NOT NULL,
                                            increment bigint NOT NULL,
                                            cache_size bigint NOT NULL,
                                            cycle_option smallint NOT NULL,
                                            cycle_count bigint NOT NULL
);


ALTER TABLE public.list_precios_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: log_generacion_rep; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.log_generacion_rep (
                                           lggnrep_id integer NOT NULL,
                                           codigo character varying(10) NOT NULL,
                                           fecha_generacion date NOT NULL,
                                           fecha_ini_rep date NOT NULL,
                                           fecha_fin_rep date,
                                           num_documento_ant bigint,
                                           sucursal_id integer NOT NULL,
                                           id_cmpbr integer,
                                           sin_banderas smallint,
                                           num_doc_ini bigint,
                                           num_doc_fin bigint,
                                           cod_aut_tick character varying(35) DEFAULT NULL::character varying,
                                           num_doc_act bigint
);


ALTER TABLE public.log_generacion_rep OWNER TO "saplic_dprlac_user";

--
-- Name: log_generacion_rep_lggnrep_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.log_generacion_rep_lggnrep_id_seq (
                                                          next_not_cached_value bigint NOT NULL,
                                                          minimum_value bigint NOT NULL,
                                                          maximum_value bigint NOT NULL,
                                                          start_value bigint NOT NULL,
                                                          increment bigint NOT NULL,
                                                          cache_size bigint NOT NULL,
                                                          cycle_option smallint NOT NULL,
                                                          cycle_count bigint NOT NULL
);


ALTER TABLE public.log_generacion_rep_lggnrep_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: lote_producto; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.lote_producto (
                                      lote_id integer NOT NULL,
                                      estado character varying(3) NOT NULL,
                                      fecha_ingreso date NOT NULL,
                                      cantidad_actual integer,
                                      cantidad integer NOT NULL,
                                      precio_compra integer NOT NULL,
                                      fecha_expiracion date,
                                      cod_lote character varying(25) DEFAULT NULL::character varying,
                                      inv_id integer,
                                      proveedor_id integer,
                                      presentacion character varying(3) DEFAULT NULL::character varying,
                                      cant_cont integer,
                                      cant_cont_actual integer,
                                      nums_contenedor character varying(10000) DEFAULT NULL::character varying
);


ALTER TABLE public.lote_producto OWNER TO "saplic_dprlac_user";

--
-- Name: lote_producto_lote_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.lote_producto_lote_id_seq (
                                                  next_not_cached_value bigint NOT NULL,
                                                  minimum_value bigint NOT NULL,
                                                  maximum_value bigint NOT NULL,
                                                  start_value bigint NOT NULL,
                                                  increment bigint NOT NULL,
                                                  cache_size bigint NOT NULL,
                                                  cycle_option smallint NOT NULL,
                                                  cycle_count bigint NOT NULL
);


ALTER TABLE public.lote_producto_lote_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: marca; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.marca (
                              id integer NOT NULL,
                              nombre character varying(30) NOT NULL,
                              descripcion character varying(200) DEFAULT NULL::character varying,
                              fecha_registro date,
                              prv_prpal_id integer,
                              prv_sec_id integer
);


ALTER TABLE public.marca OWNER TO "saplic_dprlac_user";

--
-- Name: marca_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.marca_id_seq (
                                     next_not_cached_value bigint NOT NULL,
                                     minimum_value bigint NOT NULL,
                                     maximum_value bigint NOT NULL,
                                     start_value bigint NOT NULL,
                                     increment bigint NOT NULL,
                                     cache_size bigint NOT NULL,
                                     cycle_option smallint NOT NULL,
                                     cycle_count bigint NOT NULL
);


ALTER TABLE public.marca_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: medio_notif_prg; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.medio_notif_prg (
                                        mdntf_id integer NOT NULL,
                                        email character varying(40) NOT NULL,
                                        telefono character varying(20) DEFAULT NULL::character varying,
                                        prgntf_id integer NOT NULL,
                                        nombre character varying(50) DEFAULT NULL::character varying
);


ALTER TABLE public.medio_notif_prg OWNER TO "saplic_dprlac_user";

--
-- Name: medio_notif_prg_mdntf_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.medio_notif_prg_mdntf_id_seq (
                                                     next_not_cached_value bigint NOT NULL,
                                                     minimum_value bigint NOT NULL,
                                                     maximum_value bigint NOT NULL,
                                                     start_value bigint NOT NULL,
                                                     increment bigint NOT NULL,
                                                     cache_size bigint NOT NULL,
                                                     cycle_option smallint NOT NULL,
                                                     cycle_count bigint NOT NULL
);


ALTER TABLE public.medio_notif_prg_mdntf_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: medio_publicidad; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.medio_publicidad (
                                         medpub_id integer NOT NULL,
                                         nombre character varying(40) NOT NULL,
                                         estado character varying(3) DEFAULT NULL::character varying
);


ALTER TABLE public.medio_publicidad OWNER TO "saplic_dprlac_user";

--
-- Name: medio_publicidad_medpub_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.medio_publicidad_medpub_id_seq (
                                                       next_not_cached_value bigint NOT NULL,
                                                       minimum_value bigint NOT NULL,
                                                       maximum_value bigint NOT NULL,
                                                       start_value bigint NOT NULL,
                                                       increment bigint NOT NULL,
                                                       cache_size bigint NOT NULL,
                                                       cycle_option smallint NOT NULL,
                                                       cycle_count bigint NOT NULL
);


ALTER TABLE public.medio_publicidad_medpub_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: menu; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.menu (
                             id integer NOT NULL,
                             url character varying(100) DEFAULT NULL::character varying,
                             visible smallint NOT NULL,
                             estado character varying(3) NOT NULL,
                             orden integer,
                             menu_padre_id integer,
                             etiqueta_esp character varying(50) DEFAULT NULL::character varying,
                             etiqueta_eng character varying(50) DEFAULT NULL::character varying,
                             etiqueta_fre character varying(50) DEFAULT NULL::character varying,
                             etiqueta_deu character varying(50) DEFAULT NULL::character varying,
                             etiqueta_prt character varying(50) DEFAULT NULL::character varying,
                             etiqueta_ita character varying(50) DEFAULT NULL::character varying
);


ALTER TABLE public.menu OWNER TO "saplic_dprlac_user";

--
-- Name: menu_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.menu_id_seq (
                                    next_not_cached_value bigint NOT NULL,
                                    minimum_value bigint NOT NULL,
                                    maximum_value bigint NOT NULL,
                                    start_value bigint NOT NULL,
                                    increment bigint NOT NULL,
                                    cache_size bigint NOT NULL,
                                    cycle_option smallint NOT NULL,
                                    cycle_count bigint NOT NULL
);


ALTER TABLE public.menu_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: menus; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.menus (
                              id integer NOT NULL,
                              nombre character varying(50) NOT NULL,
                              icono character varying(20) NOT NULL
);


ALTER TABLE public.menus OWNER TO "saplic_dprlac_user";

--
-- Name: movimiento; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.movimiento (
                                   id integer NOT NULL,
                                   observacion character varying(200) DEFAULT NULL::character varying,
                                   tipo_movimiento character varying(1) NOT NULL,
                                   razon character varying(1) NOT NULL,
                                   fecha date NOT NULL,
                                   sucursal_id integer NOT NULL,
                                   usuario_id integer
);


ALTER TABLE public.movimiento OWNER TO "saplic_dprlac_user";

--
-- Name: movimiento_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.movimiento_id_seq (
                                          next_not_cached_value bigint NOT NULL,
                                          minimum_value bigint NOT NULL,
                                          maximum_value bigint NOT NULL,
                                          start_value bigint NOT NULL,
                                          increment bigint NOT NULL,
                                          cache_size bigint NOT NULL,
                                          cycle_option smallint NOT NULL,
                                          cycle_count bigint NOT NULL
);


ALTER TABLE public.movimiento_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: notificacion; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.notificacion (
                                     notif_id integer NOT NULL,
                                     codigo character varying(10) NOT NULL,
                                     estado character varying(3) NOT NULL,
                                     nombre character varying(40) NOT NULL,
                                     descripcion character varying(200) DEFAULT NULL::character varying
);


ALTER TABLE public.notificacion OWNER TO "saplic_dprlac_user";

--
-- Name: notificacion_correo; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.notificacion_correo (
                                            notifeml_id integer NOT NULL,
                                            estado character varying(3) NOT NULL,
                                            email character varying(40) NOT NULL,
                                            tipo_notificacion character varying(10) NOT NULL,
                                            sucursal_id integer
);


ALTER TABLE public.notificacion_correo OWNER TO "saplic_dprlac_user";

--
-- Name: notificacion_correo_notifeml_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.notificacion_correo_notifeml_id_seq (
                                                            next_not_cached_value bigint NOT NULL,
                                                            minimum_value bigint NOT NULL,
                                                            maximum_value bigint NOT NULL,
                                                            start_value bigint NOT NULL,
                                                            increment bigint NOT NULL,
                                                            cache_size bigint NOT NULL,
                                                            cycle_option smallint NOT NULL,
                                                            cycle_count bigint NOT NULL
);


ALTER TABLE public.notificacion_correo_notifeml_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: notificacion_notif_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.notificacion_notif_id_seq (
                                                  next_not_cached_value bigint NOT NULL,
                                                  minimum_value bigint NOT NULL,
                                                  maximum_value bigint NOT NULL,
                                                  start_value bigint NOT NULL,
                                                  increment bigint NOT NULL,
                                                  cache_size bigint NOT NULL,
                                                  cycle_option smallint NOT NULL,
                                                  cycle_count bigint NOT NULL
);


ALTER TABLE public.notificacion_notif_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: orden_trabajo; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.orden_trabajo (
                                      odt_id integer NOT NULL,
                                      estado character varying(50) DEFAULT NULL::character varying,
                                      fechaingreso date NOT NULL,
                                      preciolente integer,
                                      tipoaro character varying(50) DEFAULT NULL::character varying,
                                      modeloaro character varying(50) DEFAULT NULL::character varying,
                                      coloraro character varying(50) DEFAULT NULL::character varying,
                                      tamanioaro character varying(50) DEFAULT NULL::character varying,
                                      precioaro integer,
                                      tipolente character varying(50) DEFAULT NULL::character varying,
                                      disenolente character varying(50) DEFAULT NULL::character varying,
                                      materiallente character varying(50) DEFAULT NULL::character varying,
                                      colorlente character varying(50) DEFAULT NULL::character varying,
                                      serie integer,
                                      numero integer NOT NULL,
                                      fechaventa date NOT NULL,
                                      comoseenterodelservicio character varying(50) DEFAULT NULL::character varying,
                                      esfera_izq integer,
                                      esfera_der integer,
                                      cilindro_izq integer,
                                      cilindro_der integer,
                                      adicion_izq integer,
                                      adicion_der integer,
                                      prima_izq integer,
                                      prima_der integer,
                                      eje_izq integer,
                                      eje_der integer,
                                      prd_aro_id integer,
                                      prd_lnt_id integer,
                                      client_id integer NOT NULL,
                                      sucursal_id integer NOT NULL,
                                      anticipo integer,
                                      prov_aro_id integer,
                                      prov_lnt_id integer,
                                      forma_pago character varying(1) DEFAULT NULL::character varying,
                                      venta_id integer
);


ALTER TABLE public.orden_trabajo OWNER TO "saplic_dprlac_user";

--
-- Name: orden_trabajo_odt_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.orden_trabajo_odt_id_seq (
                                                 next_not_cached_value bigint NOT NULL,
                                                 minimum_value bigint NOT NULL,
                                                 maximum_value bigint NOT NULL,
                                                 start_value bigint NOT NULL,
                                                 increment bigint NOT NULL,
                                                 cache_size bigint NOT NULL,
                                                 cycle_option smallint NOT NULL,
                                                 cycle_count bigint NOT NULL
);


ALTER TABLE public.orden_trabajo_odt_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: orden_venta; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.orden_venta (
                                    id integer NOT NULL,
                                    estado character varying(3) DEFAULT NULL::character varying,
                                    fecha_ingreso date NOT NULL,
                                    sucursal_id integer NOT NULL,
                                    cliente_id integer,
                                    venta_id integer,
                                    num_orden bigint,
                                    monto integer,
                                    num_actual bigint,
                                    trasladado smallint,
                                    transferencia integer
);


ALTER TABLE public.orden_venta OWNER TO "saplic_dprlac_user";

--
-- Name: orden_venta_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.orden_venta_id_seq (
                                           next_not_cached_value bigint NOT NULL,
                                           minimum_value bigint NOT NULL,
                                           maximum_value bigint NOT NULL,
                                           start_value bigint NOT NULL,
                                           increment bigint NOT NULL,
                                           cache_size bigint NOT NULL,
                                           cycle_option smallint NOT NULL,
                                           cycle_count bigint NOT NULL
);


ALTER TABLE public.orden_venta_id_seq OWNER TO "saplic_dprlac_user";

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


ALTER TABLE public.otrosdocumentos OWNER TO "saplic_dprlac_user";

--
-- Name: pago_cliente; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.pago_cliente (
                                     pgocli_id integer NOT NULL,
                                     monto integer NOT NULL,
                                     tipo character varying(1) NOT NULL,
                                     fecha date NOT NULL,
                                     forma_pago character varying(1) NOT NULL,
                                     ordtra_id integer,
                                     cxc_id integer,
                                     cliente_id integer,
                                     vtaprs_id integer,
                                     sucursal_id integer,
                                     sin_banderas smallint
);


ALTER TABLE public.pago_cliente OWNER TO "saplic_dprlac_user";

--
-- Name: pago_cliente_pgocli_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.pago_cliente_pgocli_id_seq (
                                                   next_not_cached_value bigint NOT NULL,
                                                   minimum_value bigint NOT NULL,
                                                   maximum_value bigint NOT NULL,
                                                   start_value bigint NOT NULL,
                                                   increment bigint NOT NULL,
                                                   cache_size bigint NOT NULL,
                                                   cycle_option smallint NOT NULL,
                                                   cycle_count bigint NOT NULL
);


ALTER TABLE public.pago_cliente_pgocli_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: pago_cuenta_pend; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.pago_cuenta_pend (
                                         pcpe_id integer NOT NULL,
                                         monto integer NOT NULL,
                                         comentario character varying(300) DEFAULT NULL::character varying,
                                         fecha_ingreso date NOT NULL,
                                         remanente integer NOT NULL,
                                         asiento_id integer,
                                         cxc_id integer,
                                         succxc_id integer,
                                         forma_pago character varying(1) DEFAULT NULL::character varying,
                                         usr_id integer,
                                         cxp_id integer,
                                         banco character varying(100) DEFAULT NULL::character varying,
                                         cheque character varying(20) DEFAULT NULL::character varying
);


ALTER TABLE public.pago_cuenta_pend OWNER TO "saplic_dprlac_user";

--
-- Name: pago_cuenta_pend_pcpe_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.pago_cuenta_pend_pcpe_id_seq (
                                                     next_not_cached_value bigint NOT NULL,
                                                     minimum_value bigint NOT NULL,
                                                     maximum_value bigint NOT NULL,
                                                     start_value bigint NOT NULL,
                                                     increment bigint NOT NULL,
                                                     cache_size bigint NOT NULL,
                                                     cycle_option smallint NOT NULL,
                                                     cycle_count bigint NOT NULL
);


ALTER TABLE public.pago_cuenta_pend_pcpe_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: pago_prestamo_emp; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.pago_prestamo_emp (
                                          pago_prestamo_emp_id integer NOT NULL,
                                          remanente integer,
                                          descripcion character varying(200) DEFAULT NULL::character varying,
                                          monto_abonado integer NOT NULL,
                                          tipo_abono character varying(1) DEFAULT NULL::character varying,
                                          fecha_abono date,
                                          prestamo_empleado_id integer NOT NULL
);


ALTER TABLE public.pago_prestamo_emp OWNER TO "saplic_dprlac_user";

--
-- Name: pago_prestamo_emp_pago_prestamo_emp_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.pago_prestamo_emp_pago_prestamo_emp_id_seq (
                                                                   next_not_cached_value bigint NOT NULL,
                                                                   minimum_value bigint NOT NULL,
                                                                   maximum_value bigint NOT NULL,
                                                                   start_value bigint NOT NULL,
                                                                   increment bigint NOT NULL,
                                                                   cache_size bigint NOT NULL,
                                                                   cycle_option smallint NOT NULL,
                                                                   cycle_count bigint NOT NULL
);


ALTER TABLE public.pago_prestamo_emp_pago_prestamo_emp_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: pais; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.pais (
                             idpai integer NOT NULL,
                             nombre character varying(250) NOT NULL,
                             iso2 character varying(2) DEFAULT NULL::character varying,
                             iso3 character varying(3) NOT NULL,
                             capital character varying(45) DEFAULT NULL::character varying,
                             ref_mapa character varying(70) DEFAULT NULL::character varying,
                             gentilicio character varying(45) DEFAULT NULL::character varying,
                             moneda character varying(20) DEFAULT NULL::character varying
);


ALTER TABLE public.pais OWNER TO "saplic_dprlac_user";

--
-- Name: pais_idpai_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.pais_idpai_seq (
                                       next_not_cached_value bigint NOT NULL,
                                       minimum_value bigint NOT NULL,
                                       maximum_value bigint NOT NULL,
                                       start_value bigint NOT NULL,
                                       increment bigint NOT NULL,
                                       cache_size bigint NOT NULL,
                                       cycle_option smallint NOT NULL,
                                       cycle_count bigint NOT NULL
);


ALTER TABLE public.pais_idpai_seq OWNER TO "saplic_dprlac_user";

--
-- Name: param_cuenta_contable; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.param_cuenta_contable (
                                              prctctb_id integer NOT NULL,
                                              nombre character varying(60) NOT NULL,
                                              descripcion character varying(200) NOT NULL,
                                              tipo_movimiento character varying(3) NOT NULL,
                                              cod_parametro character varying(20) NOT NULL,
                                              cuentac_id integer,
                                              valor character varying(40) DEFAULT NULL::character varying
);


ALTER TABLE public.param_cuenta_contable OWNER TO "saplic_dprlac_user";

--
-- Name: param_cuenta_contable_prctctb_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.param_cuenta_contable_prctctb_id_seq (
                                                             next_not_cached_value bigint NOT NULL,
                                                             minimum_value bigint NOT NULL,
                                                             maximum_value bigint NOT NULL,
                                                             start_value bigint NOT NULL,
                                                             increment bigint NOT NULL,
                                                             cache_size bigint NOT NULL,
                                                             cycle_option smallint NOT NULL,
                                                             cycle_count bigint NOT NULL
);


ALTER TABLE public.param_cuenta_contable_prctctb_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: param_horas_extras; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.param_horas_extras (
                                           param_he_id integer NOT NULL,
                                           valor_normal numeric(12,2) NOT NULL,
                                           valor_domingo numeric(12,2) NOT NULL,
                                           valor_feriado numeric(12,2) NOT NULL,
                                           valor_nocturno numeric(12,2) NOT NULL,
                                           nombre_desc character varying(50) DEFAULT NULL::character varying,
                                           por_default smallint
);


ALTER TABLE public.param_horas_extras OWNER TO "saplic_dprlac_user";

--
-- Name: param_horas_extras_param_he_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.param_horas_extras_param_he_id_seq (
                                                           next_not_cached_value bigint NOT NULL,
                                                           minimum_value bigint NOT NULL,
                                                           maximum_value bigint NOT NULL,
                                                           start_value bigint NOT NULL,
                                                           increment bigint NOT NULL,
                                                           cache_size bigint NOT NULL,
                                                           cycle_option smallint NOT NULL,
                                                           cycle_count bigint NOT NULL
);


ALTER TABLE public.param_horas_extras_param_he_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: param_planilla; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.param_planilla (
                                       param_planilla_id integer NOT NULL,
                                       codigo character varying(12) DEFAULT NULL::character varying,
                                       nombre character varying(60) DEFAULT NULL::character varying,
                                       descripcion character varying(150) DEFAULT NULL::character varying,
                                       valor character varying(20) DEFAULT NULL::character varying
);


ALTER TABLE public.param_planilla OWNER TO "saplic_dprlac_user";

--
-- Name: param_planilla_param_planilla_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.param_planilla_param_planilla_id_seq (
                                                             next_not_cached_value bigint NOT NULL,
                                                             minimum_value bigint NOT NULL,
                                                             maximum_value bigint NOT NULL,
                                                             start_value bigint NOT NULL,
                                                             increment bigint NOT NULL,
                                                             cache_size bigint NOT NULL,
                                                             cycle_option smallint NOT NULL,
                                                             cycle_count bigint NOT NULL
);


ALTER TABLE public.param_planilla_param_planilla_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: parametro_contable; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.parametro_contable (
                                           id integer NOT NULL,
                                           codigo character varying(10) NOT NULL,
                                           nombre character varying(50) NOT NULL,
                                           descripcion character varying(200) DEFAULT NULL::character varying,
                                           valor_str character varying(50) DEFAULT NULL::character varying,
                                           valor_num integer
);


ALTER TABLE public.parametro_contable OWNER TO "saplic_dprlac_user";

--
-- Name: parametro_sistema; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.parametro_sistema (
                                          parsis_id integer NOT NULL,
                                          codigo character varying(10) NOT NULL,
                                          nombre character varying(50) NOT NULL,
                                          descripcion character varying(200) DEFAULT NULL::character varying,
                                          valor character varying(50) NOT NULL
);


ALTER TABLE public.parametro_sistema OWNER TO "saplic_dprlac_user";

--
-- Name: parametro_sistema_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.parametro_sistema_id_seq (
                                                 next_not_cached_value bigint NOT NULL,
                                                 minimum_value bigint NOT NULL,
                                                 maximum_value bigint NOT NULL,
                                                 start_value bigint NOT NULL,
                                                 increment bigint NOT NULL,
                                                 cache_size bigint NOT NULL,
                                                 cycle_option smallint NOT NULL,
                                                 cycle_count bigint NOT NULL
);


ALTER TABLE public.parametro_sistema_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: parametro_sistema_parsis_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.parametro_sistema_parsis_id_seq (
                                                        next_not_cached_value bigint NOT NULL,
                                                        minimum_value bigint NOT NULL,
                                                        maximum_value bigint NOT NULL,
                                                        start_value bigint NOT NULL,
                                                        increment bigint NOT NULL,
                                                        cache_size bigint NOT NULL,
                                                        cycle_option smallint NOT NULL,
                                                        cycle_count bigint NOT NULL
);


ALTER TABLE public.parametro_sistema_parsis_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: pedido; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.pedido (
                               id integer NOT NULL,
                               descripcion character varying(255) DEFAULT NULL::character varying,
                               fecha_inicio date NOT NULL,
                               fecha_finalizado date,
                               estado character varying(255) NOT NULL,
                               subtotal integer,
                               usuario_id integer NOT NULL,
                               sucursal_id integer NOT NULL,
                               compra_id integer,
                               proveedor_id integer NOT NULL
);


ALTER TABLE public.pedido OWNER TO "saplic_dprlac_user";

--
-- Name: pedido_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.pedido_id_seq (
                                      next_not_cached_value bigint NOT NULL,
                                      minimum_value bigint NOT NULL,
                                      maximum_value bigint NOT NULL,
                                      start_value bigint NOT NULL,
                                      increment bigint NOT NULL,
                                      cache_size bigint NOT NULL,
                                      cycle_option smallint NOT NULL,
                                      cycle_count bigint NOT NULL
);


ALTER TABLE public.pedido_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: periodo_contable; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.periodo_contable (
                                         percon_id integer NOT NULL,
                                         estado character varying(3) DEFAULT NULL::character varying,
                                         orden integer,
                                         mes integer NOT NULL,
                                         anio integer NOT NULL
);


ALTER TABLE public.periodo_contable OWNER TO "saplic_dprlac_user";

--
-- Name: periodo_contable_percon_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.periodo_contable_percon_id_seq (
                                                       next_not_cached_value bigint NOT NULL,
                                                       minimum_value bigint NOT NULL,
                                                       maximum_value bigint NOT NULL,
                                                       start_value bigint NOT NULL,
                                                       increment bigint NOT NULL,
                                                       cache_size bigint NOT NULL,
                                                       cycle_option smallint NOT NULL,
                                                       cycle_count bigint NOT NULL
);


ALTER TABLE public.periodo_contable_percon_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: permiso_empleado; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.permiso_empleado (
                                         permiso_empleado_id integer NOT NULL,
                                         motivo character varying(200) DEFAULT NULL::character varying,
                                         fecha_fin date NOT NULL,
                                         fecha_ini date NOT NULL,
                                         num_dias integer NOT NULL,
                                         empled_id integer NOT NULL,
                                         remunerado smallint
);


ALTER TABLE public.permiso_empleado OWNER TO "saplic_dprlac_user";

--
-- Name: permiso_empleado_permiso_empleado_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.permiso_empleado_permiso_empleado_id_seq (
                                                                 next_not_cached_value bigint NOT NULL,
                                                                 minimum_value bigint NOT NULL,
                                                                 maximum_value bigint NOT NULL,
                                                                 start_value bigint NOT NULL,
                                                                 increment bigint NOT NULL,
                                                                 cache_size bigint NOT NULL,
                                                                 cycle_option smallint NOT NULL,
                                                                 cycle_count bigint NOT NULL
);


ALTER TABLE public.permiso_empleado_permiso_empleado_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: peso_bulto; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.peso_bulto (
                                   id integer NOT NULL,
                                   compra integer NOT NULL,
                                   bulto integer NOT NULL,
                                   peso integer NOT NULL
);


ALTER TABLE public.peso_bulto OWNER TO "saplic_dprlac_user";

--
-- Name: peso_bulto_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.peso_bulto_id_seq (
                                          next_not_cached_value bigint NOT NULL,
                                          minimum_value bigint NOT NULL,
                                          maximum_value bigint NOT NULL,
                                          start_value bigint NOT NULL,
                                          increment bigint NOT NULL,
                                          cache_size bigint NOT NULL,
                                          cycle_option smallint NOT NULL,
                                          cycle_count bigint NOT NULL
);


ALTER TABLE public.peso_bulto_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: planilla_emp; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.planilla_emp (
                                     planilla_id integer NOT NULL,
                                     estado character varying(7) DEFAULT NULL::character varying,
                                     horas_extras numeric(12,2) DEFAULT NULL::numeric,
                                     comision integer,
                                     total_deducciones numeric(12,2) DEFAULT NULL::numeric,
                                     total_ingresos numeric(12,2) DEFAULT NULL::numeric,
                                     neto_recibir numeric(12,2) DEFAULT NULL::numeric,
                                     salario_devengado numeric(12,2) DEFAULT NULL::numeric,
                                     dias_trabajados integer,
                                     bonificacion integer,
                                     deduccion_isss numeric(12,2) DEFAULT NULL::numeric,
                                     deduccion_afp numeric(12,2) DEFAULT NULL::numeric,
                                     deduccion_ipsfa numeric(12,2) DEFAULT NULL::numeric,
                                     deduccion_isssp numeric(12,2) DEFAULT NULL::numeric,
                                     deduccion_renta numeric(12,2) DEFAULT NULL::numeric,
                                     deduccion_prestamos integer,
                                     annop integer,
                                     mesp integer,
                                     diap integer,
                                     periodo_planilla date,
                                     dii smallint,
                                     total_salario_devengado numeric(12,2) DEFAULT NULL::numeric,
                                     empled_id integer NOT NULL,
                                     nombre character varying(255) DEFAULT NULL::character varying,
                                     apellidos character varying(255) DEFAULT NULL::character varying,
                                     salario_mensual numeric(12,2) DEFAULT NULL::numeric,
                                     viaticos numeric(12,2) DEFAULT NULL::numeric,
                                     dias_no_aborados integer,
                                     pago_vaca numeric(12,2) DEFAULT NULL::numeric,
                                     anticipos numeric(12,2) DEFAULT NULL::numeric,
                                     prestamos_empre numeric(12,2) DEFAULT NULL::numeric,
                                     prestamos_banco numeric(12,2) DEFAULT NULL::numeric,
                                     descuentos numeric(12,2) DEFAULT NULL::numeric,
                                     otros numeric(12,2) DEFAULT NULL::numeric,
                                     aguinaldo numeric(12,2) DEFAULT NULL::numeric
);


ALTER TABLE public.planilla_emp OWNER TO "saplic_dprlac_user";

--
-- Name: planilla_emp_planilla_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.planilla_emp_planilla_id_seq (
                                                     next_not_cached_value bigint NOT NULL,
                                                     minimum_value bigint NOT NULL,
                                                     maximum_value bigint NOT NULL,
                                                     start_value bigint NOT NULL,
                                                     increment bigint NOT NULL,
                                                     cache_size bigint NOT NULL,
                                                     cycle_option smallint NOT NULL,
                                                     cycle_count bigint NOT NULL
);


ALTER TABLE public.planilla_emp_planilla_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: planilla_isss; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.planilla_isss (
                                      id integer NOT NULL,
                                      id_empleado integer NOT NULL,
                                      fecha_emision date NOT NULL,
                                      numero_patronal integer NOT NULL,
                                      salario_devengado numeric(12,2) NOT NULL,
                                      pago_adicional numeric(12,2) DEFAULT NULL::numeric,
                                      pago_vacaciones numeric(12,2) DEFAULT NULL::numeric,
                                      hrs_jor smallint NOT NULL,
                                      dias_rem smallint NOT NULL,
                                      dias_vacacion smallint,
                                      cod_obs smallint,
                                      corr_trabajo smallint
);


ALTER TABLE public.planilla_isss OWNER TO "saplic_dprlac_user";

--
-- Name: planilla_isss_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.planilla_isss_id_seq (
                                             next_not_cached_value bigint NOT NULL,
                                             minimum_value bigint NOT NULL,
                                             maximum_value bigint NOT NULL,
                                             start_value bigint NOT NULL,
                                             increment bigint NOT NULL,
                                             cache_size bigint NOT NULL,
                                             cycle_option smallint NOT NULL,
                                             cycle_count bigint NOT NULL
);


ALTER TABLE public.planilla_isss_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: precio_prd_sucursal; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.precio_prd_sucursal (
                                            prprsuc_id integer NOT NULL,
                                            costo integer NOT NULL,
                                            prc_normal integer NOT NULL,
                                            prc_mayoreo integer NOT NULL,
                                            sucursal_id integer NOT NULL,
                                            producto_id integer NOT NULL
);


ALTER TABLE public.precio_prd_sucursal OWNER TO "saplic_dprlac_user";

--
-- Name: precio_prd_sucursal_prprsuc_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.precio_prd_sucursal_prprsuc_id_seq (
                                                           next_not_cached_value bigint NOT NULL,
                                                           minimum_value bigint NOT NULL,
                                                           maximum_value bigint NOT NULL,
                                                           start_value bigint NOT NULL,
                                                           increment bigint NOT NULL,
                                                           cache_size bigint NOT NULL,
                                                           cycle_option smallint NOT NULL,
                                                           cycle_count bigint NOT NULL
);


ALTER TABLE public.precio_prd_sucursal_prprsuc_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: prestamo_empleado; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.prestamo_empleado (
                                          prestamo_empleado_id integer NOT NULL,
                                          monto integer NOT NULL,
                                          estado character varying(3) NOT NULL,
                                          remanente integer NOT NULL,
                                          descripcion character varying(200) DEFAULT NULL::character varying,
                                          fecha_registro date NOT NULL,
                                          num_pagos smallint NOT NULL,
                                          cuota_mensual integer NOT NULL,
                                          fecha_liquidacion date,
                                          empled_id integer NOT NULL,
                                          referencia character varying(255) DEFAULT NULL::character varying,
                                          banco character varying(255) DEFAULT NULL::character varying,
                                          cuota_quincenal integer,
                                          tipo_descuento character varying(3) DEFAULT NULL::character varying,
                                          tipo_prestamo character varying(3) DEFAULT NULL::character varying,
                                          prestamo_padre integer,
                                          correlativo integer
);


ALTER TABLE public.prestamo_empleado OWNER TO "saplic_dprlac_user";

--
-- Name: prestamo_empleado_prestamo_empleado_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.prestamo_empleado_prestamo_empleado_id_seq (
                                                                   next_not_cached_value bigint NOT NULL,
                                                                   minimum_value bigint NOT NULL,
                                                                   maximum_value bigint NOT NULL,
                                                                   start_value bigint NOT NULL,
                                                                   increment bigint NOT NULL,
                                                                   cache_size bigint NOT NULL,
                                                                   cycle_option smallint NOT NULL,
                                                                   cycle_count bigint NOT NULL
);


ALTER TABLE public.prestamo_empleado_prestamo_empleado_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: producto; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.producto (
                                 id integer NOT NULL,
                                 nombre character varying(50) DEFAULT NULL::character varying,
                                 referencia character varying(20) NOT NULL,
                                 cantidad_minima integer,
                                 cantidad_maxima integer,
                                 modelo character varying(30) DEFAULT NULL::character varying,
                                 tiempo_envio smallint,
                                 gravable smallint NOT NULL,
                                 marca_id integer,
                                 categoria_id integer NOT NULL,
                                 genero character varying(1) DEFAULT NULL::character varying,
                                 tipo character varying(20) DEFAULT NULL::character varying,
                                 str_gen_1 character varying(20) DEFAULT NULL::character varying,
                                 str_gen_2 character varying(20) DEFAULT NULL::character varying,
                                 str_gen_3 character varying(20) DEFAULT NULL::character varying,
                                 str_gen_4 character varying(20) DEFAULT NULL::character varying,
                                 num_gen_1 numeric(12,2) DEFAULT NULL::numeric,
                                 num_gen_2 numeric(12,2) DEFAULT NULL::numeric,
                                 flag_gen_1 character varying(4) DEFAULT NULL::character varying,
                                 flag_gen_2 character varying(4) DEFAULT NULL::character varying,
                                 flag_gen_3 character varying(4) DEFAULT NULL::character varying,
                                 flag_gen_4 character varying(4) DEFAULT NULL::character varying,
                                 proveedor_id integer,
                                 str_gen_5 character varying(20) DEFAULT NULL::character varying,
                                 exento smallint,
                                 no_sujeto smallint,
                                 str_gen_6 character varying(20) DEFAULT NULL::character varying,
                                 barcode character varying(26) DEFAULT NULL::character varying,
                                 unimedpr_id integer,
                                 costo integer,
                                 prc_normal integer,
                                 prc_mayoreo integer
);


ALTER TABLE public.producto OWNER TO "saplic_dprlac_user";

--
-- Name: producto_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.producto_id_seq (
                                        next_not_cached_value bigint NOT NULL,
                                        minimum_value bigint NOT NULL,
                                        maximum_value bigint NOT NULL,
                                        start_value bigint NOT NULL,
                                        increment bigint NOT NULL,
                                        cache_size bigint NOT NULL,
                                        cycle_option smallint NOT NULL,
                                        cycle_count bigint NOT NULL
);


ALTER TABLE public.producto_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: productos; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.productos (
                                  id integer NOT NULL,
                                  codigo character varying(20) DEFAULT NULL::character varying,
                                  descripcion character varying(200) DEFAULT NULL::character varying,
                                  precio character varying(14) DEFAULT NULL::character varying,
                                  "precioPub" character varying(14) DEFAULT NULL::character varying,
                                  "UnidadMedida" character varying(2) DEFAULT NULL::character varying,
                                  area character varying(4) DEFAULT NULL::character varying,
                                  "CtaInv" character varying(20) DEFAULT NULL::character varying,
                                  "CtaIng" character varying(20) DEFAULT NULL::character varying,
                                  "CtaGas" character varying(20) DEFAULT NULL::character varying,
                                  "codCobol" smallint
);


ALTER TABLE public.productos OWNER TO "saplic_dprlac_user";

--
-- Name: programacion_notif; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.programacion_notif (
                                           prgntf_id integer NOT NULL,
                                           estado character varying(3) NOT NULL,
                                           nombre character varying(40) NOT NULL,
                                           descripcion character varying(200) DEFAULT NULL::character varying,
                                           fecha_ini date NOT NULL,
                                           fecha_fin date,
                                           tipo_prg character varying(6) NOT NULL,
                                           cron_syntax character varying(30) NOT NULL,
                                           notif_id integer NOT NULL,
                                           dia_tmp smallint,
                                           hora smallint,
                                           minuto smallint,
                                           intervalo_tmp smallint,
                                           nivel_importancia smallint
);


ALTER TABLE public.programacion_notif OWNER TO "saplic_dprlac_user";

--
-- Name: programacion_notif_prgntf_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.programacion_notif_prgntf_id_seq (
                                                         next_not_cached_value bigint NOT NULL,
                                                         minimum_value bigint NOT NULL,
                                                         maximum_value bigint NOT NULL,
                                                         start_value bigint NOT NULL,
                                                         increment bigint NOT NULL,
                                                         cache_size bigint NOT NULL,
                                                         cycle_option smallint NOT NULL,
                                                         cycle_count bigint NOT NULL
);


ALTER TABLE public.programacion_notif_prgntf_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: proveedor; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.proveedor (
                                  id integer NOT NULL,
                                  direccion character varying(200) DEFAULT NULL::character varying,
                                  email character varying(60) DEFAULT NULL::character varying,
                                  nit character varying(30) DEFAULT NULL::character varying,
                                  descripcion character varying(300) DEFAULT NULL::character varying,
                                  razon_social character varying(80) NOT NULL,
                                  nombre_contacto character varying(100) DEFAULT NULL::character varying,
                                  telefonos character varying(30) DEFAULT NULL::character varying,
                                  dir_telefono character varying(30) DEFAULT NULL::character varying,
                                  fax character varying(30) DEFAULT NULL::character varying,
                                  idpai integer,
                                  codigo character varying(20) DEFAULT NULL::character varying,
                                  nrc character varying(30) DEFAULT NULL::character varying,
                                  estado character varying(3) DEFAULT NULL::character varying
);


ALTER TABLE public.proveedor OWNER TO "saplic_dprlac_user";

--
-- Name: proveedor_cnt; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.proveedor_cnt (
                                      proveedor_cnt_id integer NOT NULL,
                                      codigo character varying(20) NOT NULL,
                                      nombre character varying(100) DEFAULT NULL::character varying,
                                      descripcion character varying(200) NOT NULL,
                                      direccion character varying(200) NOT NULL,
                                      email character varying(60) NOT NULL,
                                      nit character varying(30) NOT NULL,
                                      tipo_contribuyente integer,
                                      razon_social character varying(80) NOT NULL,
                                      nombre_contacto character varying(100) NOT NULL,
                                      telefonos character varying(30) NOT NULL,
                                      fax character varying(30) NOT NULL,
                                      nrc character varying(30) DEFAULT NULL::character varying
);


ALTER TABLE public.proveedor_cnt OWNER TO "saplic_dprlac_user";

--
-- Name: proveedor_cnt_proveedor_cnt_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.proveedor_cnt_proveedor_cnt_id_seq (
                                                           next_not_cached_value bigint NOT NULL,
                                                           minimum_value bigint NOT NULL,
                                                           maximum_value bigint NOT NULL,
                                                           start_value bigint NOT NULL,
                                                           increment bigint NOT NULL,
                                                           cache_size bigint NOT NULL,
                                                           cycle_option smallint NOT NULL,
                                                           cycle_count bigint NOT NULL
);


ALTER TABLE public.proveedor_cnt_proveedor_cnt_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: proveedor_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.proveedor_id_seq (
                                         next_not_cached_value bigint NOT NULL,
                                         minimum_value bigint NOT NULL,
                                         maximum_value bigint NOT NULL,
                                         start_value bigint NOT NULL,
                                         increment bigint NOT NULL,
                                         cache_size bigint NOT NULL,
                                         cycle_option smallint NOT NULL,
                                         cycle_count bigint NOT NULL
);


ALTER TABLE public.proveedor_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: puesto_trabajo; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.puesto_trabajo (
                                       puesto_trabajo_id integer NOT NULL,
                                       codigo character varying(10) NOT NULL,
                                       nombre character varying(30) NOT NULL,
                                       descripcion character varying(200) DEFAULT NULL::character varying,
                                       salario_base_hora numeric(12,2) DEFAULT NULL::numeric
);


ALTER TABLE public.puesto_trabajo OWNER TO "saplic_dprlac_user";

--
-- Name: puesto_trabajo_puesto_trabajo_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.puesto_trabajo_puesto_trabajo_id_seq (
                                                             next_not_cached_value bigint NOT NULL,
                                                             minimum_value bigint NOT NULL,
                                                             maximum_value bigint NOT NULL,
                                                             start_value bigint NOT NULL,
                                                             increment bigint NOT NULL,
                                                             cache_size bigint NOT NULL,
                                                             cycle_option smallint NOT NULL,
                                                             cycle_count bigint NOT NULL
);


ALTER TABLE public.puesto_trabajo_puesto_trabajo_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: receptor; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.receptor (
                                 id integer NOT NULL,
                                 codigo character varying(15) DEFAULT NULL::character varying,
                                 "tipDoc" character varying(25) DEFAULT NULL::character varying,
                                 "numDoc" character varying(30) DEFAULT NULL::character varying,
                                 "nit" character varying(17) DEFAULT NULL::character varying,
                                 "ncr" character varying(8) DEFAULT NULL::character varying,
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
                                 "area" character varying(5) NOT NULL,
                                 "codCliCobol" smallint
);


ALTER TABLE public.receptor OWNER TO "saplic_dprlac_user";

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


ALTER TABLE public.receptordocumen OWNER TO "saplic_dprlac_user";

--
-- Name: resumen; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.resumen (
                                id bigint NOT NULL,
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
                                "seguro" character varying(14) DEFAULT NULL::character varying,
                                "flete" character varying(14) DEFAULT NULL::character varying,
                                "montoTotalOp" character varying(14) DEFAULT NULL::character varying,
                                "totalCargoBasImpon" character varying(14) DEFAULT NULL::character varying,
                                "totalAPagar" character varying(14) DEFAULT NULL::character varying,
                                "total" character varying(14) DEFAULT NULL::character varying,
                                "totalIvaRetenido" character varying(14) DEFAULT NULL::character varying,
                                "valorLetrasIvaRet" character varying(250) DEFAULT NULL::character varying,
                                "valorLetras" character varying(250) DEFAULT NULL::character varying,
                                "iva13" character varying(14) DEFAULT NULL::character varying,
                                "saldoAFavor" character varying(14) DEFAULT NULL::character varying,
                                "condicionOpera" character varying(2) DEFAULT NULL::character varying,
                                "codFormaPago" character varying(2) DEFAULT NULL::character varying,
                                "montoPorFormaPag" character varying(14) DEFAULT NULL::character varying,
                                "refModalidadPago" character varying(50) DEFAULT NULL::character varying,
                                "plazo" character varying(2) DEFAULT NULL::character varying,
                                "periodoPlazo" character varying(3) DEFAULT NULL::character varying,
                                "numPagoElecNPE" character varying(250) DEFAULT NULL::character varying,
                                "incoterms" character varying(2) DEFAULT NULL::character varying,
                                "descincoterms" character varying(250) DEFAULT NULL::character varying,
                                "observaciones" character varying(500) DEFAULT NULL::character varying
);


ALTER TABLE public.resumen OWNER TO "saplic_dprlac_user";

--
-- Name: rol; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.rol (
                            id integer NOT NULL,
                            nombre character varying(50) NOT NULL,
                            codigo character varying(8) NOT NULL,
                            descripcion character varying(200) DEFAULT NULL::character varying
);


ALTER TABLE public.rol OWNER TO "saplic_dprlac_user";

--
-- Name: rol_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.rol_id_seq (
                                   next_not_cached_value bigint NOT NULL,
                                   minimum_value bigint NOT NULL,
                                   maximum_value bigint NOT NULL,
                                   start_value bigint NOT NULL,
                                   increment bigint NOT NULL,
                                   cache_size bigint NOT NULL,
                                   cycle_option smallint NOT NULL,
                                   cycle_count bigint NOT NULL
);


ALTER TABLE public.rol_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: rol_menu; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.rol_menu (
                                 rol_id integer NOT NULL,
                                 menu_id integer NOT NULL
);


ALTER TABLE public.rol_menu OWNER TO "saplic_dprlac_user";

--
-- Name: saldo_cuenta_contable; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.saldo_cuenta_contable (
                                              salcc_id integer NOT NULL,
                                              mes integer NOT NULL,
                                              anio integer NOT NULL,
                                              codcuenta character varying(20) NOT NULL,
                                              saldo_final integer NOT NULL,
                                              saldo_inicial integer NOT NULL,
                                              debe integer NOT NULL,
                                              haber integer NOT NULL,
                                              debe_anterior integer NOT NULL,
                                              haber_anterior integer NOT NULL
);


ALTER TABLE public.saldo_cuenta_contable OWNER TO "saplic_dprlac_user";

--
-- Name: saldo_cuenta_contable_salcc_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.saldo_cuenta_contable_salcc_id_seq (
                                                           next_not_cached_value bigint NOT NULL,
                                                           minimum_value bigint NOT NULL,
                                                           maximum_value bigint NOT NULL,
                                                           start_value bigint NOT NULL,
                                                           increment bigint NOT NULL,
                                                           cache_size bigint NOT NULL,
                                                           cycle_option smallint NOT NULL,
                                                           cycle_count bigint NOT NULL
);


ALTER TABLE public.saldo_cuenta_contable_salcc_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: salidas_prod; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.salidas_prod (
                                     id integer NOT NULL,
                                     entrada_prod integer NOT NULL,
                                     prod_salida integer NOT NULL,
                                     mov_salida integer NOT NULL,
                                     cant_salida integer NOT NULL,
                                     pres_salida character varying(3) DEFAULT NULL::character varying,
                                     cant_pres_salida smallint
);


ALTER TABLE public.salidas_prod OWNER TO "saplic_dprlac_user";

--
-- Name: salidas_prod_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.salidas_prod_id_seq (
                                            next_not_cached_value bigint NOT NULL,
                                            minimum_value bigint NOT NULL,
                                            maximum_value bigint NOT NULL,
                                            start_value bigint NOT NULL,
                                            increment bigint NOT NULL,
                                            cache_size bigint NOT NULL,
                                            cycle_option smallint NOT NULL,
                                            cycle_count bigint NOT NULL
);


ALTER TABLE public.salidas_prod_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: seccionesxdoc; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.seccionesxdoc (
                                      id integer NOT NULL,
                                      seccion character varying(25) DEFAULT NULL::character varying,
                                      tipodte character varying(25) DEFAULT NULL::character varying,
                                      items character varying(200) DEFAULT NULL::character varying
);


ALTER TABLE public.seccionesxdoc OWNER TO "saplic_dprlac_user";

--
-- Name: seg_det_venta_prod_serv; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.seg_det_venta_prod_serv (
                                                vtaprsv_id integer NOT NULL,
                                                monto integer NOT NULL,
                                                cantidad numeric(12,2) NOT NULL,
                                                detalle character varying(200) NOT NULL,
                                                escondido smallint,
                                                detalle_resumen character varying(80) DEFAULT NULL::character varying,
                                                precio_unitario integer NOT NULL,
                                                tipo_venta character varying(1) NOT NULL,
                                                cantidad_descuento integer,
                                                garantia smallint NOT NULL,
                                                abreviatura_uni character varying(8) DEFAULT NULL::character varying,
                                                costo_mercaderia numeric(12,2) DEFAULT NULL::numeric,
                                                producto_id integer,
                                                servicio_id integer,
                                                venta_id integer NOT NULL
);


ALTER TABLE public.seg_det_venta_prod_serv OWNER TO "saplic_dprlac_user";

--
-- Name: seg_det_venta_prod_serv_vtaprsv_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.seg_det_venta_prod_serv_vtaprsv_id_seq (
                                                               next_not_cached_value bigint NOT NULL,
                                                               minimum_value bigint NOT NULL,
                                                               maximum_value bigint NOT NULL,
                                                               start_value bigint NOT NULL,
                                                               increment bigint NOT NULL,
                                                               cache_size bigint NOT NULL,
                                                               cycle_option smallint NOT NULL,
                                                               cycle_count bigint NOT NULL
);


ALTER TABLE public.seg_det_venta_prod_serv_vtaprsv_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: seg_venta_prod_serv; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.seg_venta_prod_serv (
                                            vtaprsv_id integer NOT NULL,
                                            total integer NOT NULL,
                                            monto integer NOT NULL,
                                            estado character varying(3) NOT NULL,
                                            forma_pago character varying(1) DEFAULT NULL::character varying,
                                            num_serie character varying(10) DEFAULT NULL::character varying,
                                            tipo_venta character varying(3) NOT NULL,
                                            fecha_venta date NOT NULL,
                                            percibido integer NOT NULL,
                                            retenido integer NOT NULL,
                                            iva integer NOT NULL,
                                            id_detalle integer NOT NULL,
                                            tipo_descuento character varying(1) DEFAULT NULL::character varying,
                                            cantidad_descuento numeric(12,2) DEFAULT NULL::numeric,
                                            no_sujetas integer NOT NULL,
                                            exentas integer NOT NULL,
                                            gravadas integer NOT NULL,
                                            prc_tarjeta integer,
                                            id_movimiento integer,
                                            tipo_de_documento character varying(2) DEFAULT NULL::character varying,
                                            num_extranjero character varying(12) DEFAULT NULL::character varying,
                                            pago_efectivo numeric(12,2) DEFAULT NULL::numeric,
                                            pago_tarjeta numeric(12,2) DEFAULT NULL::numeric,
                                            pago_cheque numeric(12,2) DEFAULT NULL::numeric,
                                            pago_anticipo numeric(12,2) DEFAULT NULL::numeric,
                                            cambio integer,
                                            num_documento bigint NOT NULL,
                                            sin_banderas smallint,
                                            costo_mercaderia numeric(12,2) DEFAULT NULL::numeric,
                                            num_doc_ini bigint,
                                            num_doc_fin bigint,
                                            cod_aut_tick character varying(200) DEFAULT NULL::character varying,
                                            ya_devuelta smallint NOT NULL,
                                            cod_comprobante character varying(16) DEFAULT NULL::character varying,
                                            usrdsc_id integer,
                                            venta_prodserv_id integer,
                                            client_id integer,
                                            odt_id integer,
                                            usrefe_id integer NOT NULL,
                                            sucursal_id integer NOT NULL
);


ALTER TABLE public.seg_venta_prod_serv OWNER TO "saplic_dprlac_user";

--
-- Name: seg_venta_prod_serv_vtaprsv_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.seg_venta_prod_serv_vtaprsv_id_seq (
                                                           next_not_cached_value bigint NOT NULL,
                                                           minimum_value bigint NOT NULL,
                                                           maximum_value bigint NOT NULL,
                                                           start_value bigint NOT NULL,
                                                           increment bigint NOT NULL,
                                                           cache_size bigint NOT NULL,
                                                           cycle_option smallint NOT NULL,
                                                           cycle_count bigint NOT NULL
);


ALTER TABLE public.seg_venta_prod_serv_vtaprsv_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: seguro_producto; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.seguro_producto (
                                        sgrprd_id integer NOT NULL,
                                        estado character varying(3) NOT NULL,
                                        nombre character varying(40) NOT NULL,
                                        descripcion character varying(200) DEFAULT NULL::character varying,
                                        referencia character varying(20) NOT NULL,
                                        prc_normal integer NOT NULL,
                                        tipo_seguro character varying(3) NOT NULL
);


ALTER TABLE public.seguro_producto OWNER TO "saplic_dprlac_user";

--
-- Name: seguro_producto_sgrprd_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.seguro_producto_sgrprd_id_seq (
                                                      next_not_cached_value bigint NOT NULL,
                                                      minimum_value bigint NOT NULL,
                                                      maximum_value bigint NOT NULL,
                                                      start_value bigint NOT NULL,
                                                      increment bigint NOT NULL,
                                                      cache_size bigint NOT NULL,
                                                      cycle_option smallint NOT NULL,
                                                      cycle_count bigint NOT NULL
);


ALTER TABLE public.seguro_producto_sgrprd_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: servicio_venta; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.servicio_venta (
                                       srvvta_id integer NOT NULL,
                                       estado character varying(3) NOT NULL,
                                       nombre character varying(40) NOT NULL,
                                       descripcion character varying(200) DEFAULT NULL::character varying,
                                       exento smallint NOT NULL,
                                       no_sujeto smallint NOT NULL,
                                       referencia character varying(20) NOT NULL,
                                       prc_normal integer NOT NULL,
                                       prc_mayoreo integer NOT NULL,
                                       gravable smallint NOT NULL,
                                       sgrprd_id integer
);


ALTER TABLE public.servicio_venta OWNER TO "saplic_dprlac_user";

--
-- Name: servicio_venta_srvvta_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.servicio_venta_srvvta_id_seq (
                                                     next_not_cached_value bigint NOT NULL,
                                                     minimum_value bigint NOT NULL,
                                                     maximum_value bigint NOT NULL,
                                                     start_value bigint NOT NULL,
                                                     increment bigint NOT NULL,
                                                     cache_size bigint NOT NULL,
                                                     cycle_option smallint NOT NULL,
                                                     cycle_count bigint NOT NULL
);


ALTER TABLE public.servicio_venta_srvvta_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: sub_tipo_cuenta; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.sub_tipo_cuenta (
                                        sub_tipo_cuenta_id integer NOT NULL,
                                        codigo character varying(3) DEFAULT NULL::character varying,
                                        nombre character varying(120) NOT NULL,
                                        cdp_id integer,
                                        cifrado_sub_tipo character varying(8) DEFAULT NULL::character varying
);


ALTER TABLE public.sub_tipo_cuenta OWNER TO "saplic_dprlac_user";

--
-- Name: sub_tipo_cuenta_sub_tipo_cuenta_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.sub_tipo_cuenta_sub_tipo_cuenta_id_seq (
                                                               next_not_cached_value bigint NOT NULL,
                                                               minimum_value bigint NOT NULL,
                                                               maximum_value bigint NOT NULL,
                                                               start_value bigint NOT NULL,
                                                               increment bigint NOT NULL,
                                                               cache_size bigint NOT NULL,
                                                               cycle_option smallint NOT NULL,
                                                               cycle_count bigint NOT NULL
);


ALTER TABLE public.sub_tipo_cuenta_sub_tipo_cuenta_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: submenus; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.submenus (
                                 id integer NOT NULL,
                                 nombre character varying(100) DEFAULT NULL::character varying,
                                 url character varying(100) DEFAULT NULL::character varying,
                                 id_menuprin integer
);


ALTER TABLE public.submenus OWNER TO "saplic_dprlac_user";

--
-- Name: suc_cert_descuento; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.suc_cert_descuento (
                                           detdesc_id integer NOT NULL,
                                           crtdsc_id integer NOT NULL,
                                           sucursal_id integer NOT NULL
);


ALTER TABLE public.suc_cert_descuento OWNER TO "saplic_dprlac_user";

--
-- Name: suc_cert_descuento_detdesc_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.suc_cert_descuento_detdesc_id_seq (
                                                          next_not_cached_value bigint NOT NULL,
                                                          minimum_value bigint NOT NULL,
                                                          maximum_value bigint NOT NULL,
                                                          start_value bigint NOT NULL,
                                                          increment bigint NOT NULL,
                                                          cache_size bigint NOT NULL,
                                                          cycle_option smallint NOT NULL,
                                                          cycle_count bigint NOT NULL
);


ALTER TABLE public.suc_cert_descuento_detdesc_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: suc_prod; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.suc_prod (
                                 sucursal_id integer NOT NULL,
                                 producto_id integer NOT NULL
);


ALTER TABLE public.suc_prod OWNER TO "saplic_dprlac_user";

--
-- Name: suceso_moto; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.suceso_moto (
                                    id integer NOT NULL,
                                    fecha date,
                                    tipo character varying(2) DEFAULT NULL::character varying,
                                    descripcion character varying(400) DEFAULT NULL::character varying,
                                    emp_id integer NOT NULL
);


ALTER TABLE public.suceso_moto OWNER TO "saplic_dprlac_user";

--
-- Name: suceso_moto_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.suceso_moto_id_seq (
                                           next_not_cached_value bigint NOT NULL,
                                           minimum_value bigint NOT NULL,
                                           maximum_value bigint NOT NULL,
                                           start_value bigint NOT NULL,
                                           increment bigint NOT NULL,
                                           cache_size bigint NOT NULL,
                                           cycle_option smallint NOT NULL,
                                           cycle_count bigint NOT NULL
);


ALTER TABLE public.suceso_moto_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: sucursal; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.sucursal (
                                 id integer NOT NULL,
                                 nombre character varying(50) NOT NULL,
                                 codigo character varying(8) NOT NULL,
                                 estado character varying(3) NOT NULL,
                                 tipo character varying(3) NOT NULL,
                                 direccion character varying(140) DEFAULT NULL::character varying,
                                 num_resolucion character varying(20) DEFAULT NULL::character varying,
                                 fecha_resolucion date,
                                 serie character varying(6) DEFAULT NULL::character varying,
                                 correlativo integer
);


ALTER TABLE public.sucursal OWNER TO "saplic_dprlac_user";

--
-- Name: sucursal_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.sucursal_id_seq (
                                        next_not_cached_value bigint NOT NULL,
                                        minimum_value bigint NOT NULL,
                                        maximum_value bigint NOT NULL,
                                        start_value bigint NOT NULL,
                                        increment bigint NOT NULL,
                                        cache_size bigint NOT NULL,
                                        cycle_option smallint NOT NULL,
                                        cycle_count bigint NOT NULL
);


ALTER TABLE public.sucursal_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: susp_pago_prestamo; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.susp_pago_prestamo (
                                           sspgprs_id integer NOT NULL,
                                           mes smallint NOT NULL,
                                           anio smallint NOT NULL,
                                           periodo character varying(1) NOT NULL,
                                           num_quincena smallint NOT NULL,
                                           prstemp_id integer NOT NULL
);


ALTER TABLE public.susp_pago_prestamo OWNER TO "saplic_dprlac_user";

--
-- Name: susp_pago_prestamo_sspgprs_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.susp_pago_prestamo_sspgprs_id_seq (
                                                          next_not_cached_value bigint NOT NULL,
                                                          minimum_value bigint NOT NULL,
                                                          maximum_value bigint NOT NULL,
                                                          start_value bigint NOT NULL,
                                                          increment bigint NOT NULL,
                                                          cache_size bigint NOT NULL,
                                                          cycle_option smallint NOT NULL,
                                                          cycle_count bigint NOT NULL
);


ALTER TABLE public.susp_pago_prestamo_sspgprs_id_seq OWNER TO "saplic_dprlac_user";

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
                                      cuentaefe character varying(25) DEFAULT NULL::character varying,
                                      cuentacred character varying(25) DEFAULT NULL::character varying,
                                      codcobol character varying(25) DEFAULT NULL::character varying
);


ALTER TABLE public.tblcxvendedor OWNER TO "saplic_dprlac_user";

--
-- Name: tblimpuestosvariables; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.tblimpuestosvariables (
                                              "tipoImpuesto" character varying(10) NOT NULL,
                                              valor character varying(14) NOT NULL,
                                              estado integer NOT NULL,
                                              noseva integer NOT NULL
);


ALTER TABLE public.tblimpuestosvariables OWNER TO "saplic_dprlac_user";

--
-- Name: tblpartidacontable; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.tblpartidacontable (
                                           "codigoGeneracion" character varying(100) DEFAULT NULL::character varying,
                                           "numControlFact" character varying(100) DEFAULT NULL::character varying,
                                           "cuentaContable" character varying(100) DEFAULT NULL::character varying,
                                           "debeHaber" character varying(100) DEFAULT NULL::character varying,
                                           "monto" character varying(100) DEFAULT NULL::character varying,
                                           "descripcion" character varying(500) DEFAULT NULL::character varying,
                                           "numControl" integer NOT NULL,
                                           estado character(1) DEFAULT 1
);


ALTER TABLE public.tblpartidacontable OWNER TO "saplic_dprlac_user";

--
-- Name: tblusuario; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.tblusuario (
                                   "cUsuario" integer NOT NULL,
                                   "cNombre" character varying(100) DEFAULT NULL::character varying,
                                   "cClave" character varying(1000) DEFAULT NULL::character varying,
                                   "cUname" character varying(25) DEFAULT NULL::character varying,
                                   "cEstatus" character varying(3) DEFAULT NULL::character varying,
                                   "areafact" character varying(4) NOT NULL
);


ALTER TABLE public.tblusuario OWNER TO "saplic_dprlac_user";

--
-- Name: tipo_activo; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.tipo_activo (
                                    tipo_activo_id integer NOT NULL,
                                    nombre character varying(30) NOT NULL
);


ALTER TABLE public.tipo_activo OWNER TO "saplic_dprlac_user";

--
-- Name: tipo_activo_tipo_activo_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.tipo_activo_tipo_activo_id_seq (
                                                       next_not_cached_value bigint NOT NULL,
                                                       minimum_value bigint NOT NULL,
                                                       maximum_value bigint NOT NULL,
                                                       start_value bigint NOT NULL,
                                                       increment bigint NOT NULL,
                                                       cache_size bigint NOT NULL,
                                                       cycle_option smallint NOT NULL,
                                                       cycle_count bigint NOT NULL
);


ALTER TABLE public.tipo_activo_tipo_activo_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: tipo_cuenta; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.tipo_cuenta (
                                    cdp_id integer NOT NULL,
                                    codigo character varying(3) NOT NULL,
                                    nombre character varying(120) NOT NULL,
                                    clasificacion character varying(3) DEFAULT NULL::character varying,
                                    corr_cta character varying(100) DEFAULT NULL::character varying
);


ALTER TABLE public.tipo_cuenta OWNER TO "saplic_dprlac_user";

--
-- Name: tipo_cuenta_cdp_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.tipo_cuenta_cdp_id_seq (
                                               next_not_cached_value bigint NOT NULL,
                                               minimum_value bigint NOT NULL,
                                               maximum_value bigint NOT NULL,
                                               start_value bigint NOT NULL,
                                               increment bigint NOT NULL,
                                               cache_size bigint NOT NULL,
                                               cycle_option smallint NOT NULL,
                                               cycle_count bigint NOT NULL
);


ALTER TABLE public.tipo_cuenta_cdp_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: tipo_partida; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.tipo_partida (
                                     tipptd_id integer NOT NULL,
                                     nombre character varying(20) NOT NULL,
                                     codigo character varying(5) NOT NULL,
                                     descripcion character varying(100) DEFAULT NULL::character varying
);


ALTER TABLE public.tipo_partida OWNER TO "saplic_dprlac_user";

--
-- Name: tipo_partida_tipptd_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.tipo_partida_tipptd_id_seq (
                                                   next_not_cached_value bigint NOT NULL,
                                                   minimum_value bigint NOT NULL,
                                                   maximum_value bigint NOT NULL,
                                                   start_value bigint NOT NULL,
                                                   increment bigint NOT NULL,
                                                   cache_size bigint NOT NULL,
                                                   cycle_option smallint NOT NULL,
                                                   cycle_count bigint NOT NULL
);


ALTER TABLE public.tipo_partida_tipptd_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: transferencia; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.transferencia (
                                      id integer NOT NULL,
                                      estado character varying(255) NOT NULL,
                                      observacion_destino character varying(255) DEFAULT NULL::character varying,
                                      fecha_recibo date,
                                      entrada_id integer,
                                      sucursal_destino_id integer NOT NULL,
                                      usuario_genera_id integer,
                                      costo integer,
                                      lote character varying(30) DEFAULT NULL::character varying,
                                      libras integer,
                                      unidades integer
);


ALTER TABLE public.transferencia OWNER TO "saplic_dprlac_user";

--
-- Name: transferencia_flash; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.transferencia_flash (
                                            id integer NOT NULL,
                                            estado character varying(3) NOT NULL,
                                            fecha_envio date NOT NULL,
                                            entrada_id integer,
                                            usuario_genera_id integer,
                                            sucursal_destino_id integer NOT NULL,
                                            codigo character varying(20) DEFAULT NULL::character varying,
                                            tipo_transferencia character varying(3) DEFAULT NULL::character varying,
                                            total_transferido numeric(19,2) DEFAULT NULL::numeric,
                                            pedido_id integer,
                                            lacteos integer,
                                            varios integer,
                                            prod_rec integer
);


ALTER TABLE public.transferencia_flash OWNER TO "saplic_dprlac_user";

--
-- Name: unidad_medida; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.unidad_medida (
                                      unimed_id integer NOT NULL,
                                      tipo character varying(3) NOT NULL,
                                      estado character varying(3) NOT NULL,
                                      nombre character varying(20) NOT NULL,
                                      principal smallint NOT NULL,
                                      factor_conversion integer NOT NULL,
                                      abreviatura character varying(6) DEFAULT NULL::character varying
);


ALTER TABLE public.unidad_medida OWNER TO "saplic_dprlac_user";

--
-- Name: unidad_medida_unimed_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.unidad_medida_unimed_id_seq (
                                                    next_not_cached_value bigint NOT NULL,
                                                    minimum_value bigint NOT NULL,
                                                    maximum_value bigint NOT NULL,
                                                    start_value bigint NOT NULL,
                                                    increment bigint NOT NULL,
                                                    cache_size bigint NOT NULL,
                                                    cycle_option smallint NOT NULL,
                                                    cycle_count bigint NOT NULL
);


ALTER TABLE public.unidad_medida_unimed_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: unidad_producto; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.unidad_producto (
                                        uniprd_id integer NOT NULL,
                                        uni_id integer NOT NULL,
                                        prd_id integer NOT NULL
);


ALTER TABLE public.unidad_producto OWNER TO "saplic_dprlac_user";

--
-- Name: unidad_producto_uniprd_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.unidad_producto_uniprd_id_seq (
                                                      next_not_cached_value bigint NOT NULL,
                                                      minimum_value bigint NOT NULL,
                                                      maximum_value bigint NOT NULL,
                                                      start_value bigint NOT NULL,
                                                      increment bigint NOT NULL,
                                                      cache_size bigint NOT NULL,
                                                      cycle_option smallint NOT NULL,
                                                      cycle_count bigint NOT NULL
);


ALTER TABLE public.unidad_producto_uniprd_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: usuario; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.usuario (
                                id integer NOT NULL,
                                estado character varying(3) NOT NULL,
                                nombre_usuario character varying(20) NOT NULL,
                                pass character varying(60) NOT NULL,
                                fecha_ultimo_acceso date,
                                numero_intentos integer NOT NULL,
                                nombre_completo character varying(100) DEFAULT NULL::character varying,
                                accion_especial smallint NOT NULL,
                                rol_id integer,
                                sucursal_id integer,
                                cod_vendedor character varying(10) DEFAULT NULL::character varying,
                                notificacion_inv smallint
);


ALTER TABLE public.usuario OWNER TO "saplic_dprlac_user";

--
-- Name: usuario_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.usuario_id_seq (
                                       next_not_cached_value bigint NOT NULL,
                                       minimum_value bigint NOT NULL,
                                       maximum_value bigint NOT NULL,
                                       start_value bigint NOT NULL,
                                       increment bigint NOT NULL,
                                       cache_size bigint NOT NULL,
                                       cycle_option smallint NOT NULL,
                                       cycle_count bigint NOT NULL
);


ALTER TABLE public.usuario_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: vacaciones; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.vacaciones (
                                   vacaciones_id integer NOT NULL,
                                   anio integer,
                                   fecha_inicio date,
                                   dias integer,
                                   empleado_id integer,
                                   descansadas smallint
);


ALTER TABLE public.vacaciones OWNER TO "saplic_dprlac_user";

--
-- Name: vacaciones_vacaciones_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.vacaciones_vacaciones_id_seq (
                                                     next_not_cached_value bigint NOT NULL,
                                                     minimum_value bigint NOT NULL,
                                                     maximum_value bigint NOT NULL,
                                                     start_value bigint NOT NULL,
                                                     increment bigint NOT NULL,
                                                     cache_size bigint NOT NULL,
                                                     cycle_option smallint NOT NULL,
                                                     cycle_count bigint NOT NULL
);


ALTER TABLE public.vacaciones_vacaciones_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: venta_prod_serv; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.venta_prod_serv (
                                        vtaprsv_id integer NOT NULL,
                                        total integer NOT NULL,
                                        estado character varying(3) NOT NULL,
                                        monto integer NOT NULL,
                                        fecha_venta date NOT NULL,
                                        tipo_venta character varying(3) NOT NULL,
                                        percibido integer NOT NULL,
                                        retenido integer NOT NULL,
                                        iva integer NOT NULL,
                                        id_detalle integer NOT NULL,
                                        tipo_descuento character varying(1) DEFAULT NULL::character varying,
                                        cantidad_descuento numeric(12,2) DEFAULT NULL::numeric,
                                        no_sujetas integer NOT NULL,
                                        exentas integer NOT NULL,
                                        prc_tarjeta integer,
                                        id_movimiento integer,
                                        tipo_de_documento character varying(2) DEFAULT NULL::character varying,
                                        sucursal_id integer NOT NULL,
                                        usrefe_id integer NOT NULL,
                                        client_id integer,
                                        usrdsc_id integer,
                                        odt_id integer,
                                        num_extranjero character varying(12) DEFAULT NULL::character varying,
                                        forma_pago character varying(1) DEFAULT NULL::character varying,
                                        pago_efectivo integer,
                                        cambio integer,
                                        num_serie character varying(10) DEFAULT NULL::character varying,
                                        num_documento bigint,
                                        pago_tarjeta integer,
                                        pago_cheque integer,
                                        pago_anticipo integer,
                                        gravadas integer,
                                        cxc_id integer,
                                        ya_devuelta smallint,
                                        sin_banderas smallint,
                                        cod_comprobante character varying(16) DEFAULT NULL::character varying,
                                        costo_mercaderia numeric(12,2) DEFAULT NULL::numeric,
                                        num_doc_ini bigint,
                                        num_doc_fin bigint,
                                        cod_aut_tick character varying(35) DEFAULT NULL::character varying,
                                        proveedor_id integer,
                                        rutero integer
);


ALTER TABLE public.venta_prod_serv OWNER TO "saplic_dprlac_user";

--
-- Name: venta_prod_serv_vtaprsv_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.venta_prod_serv_vtaprsv_id_seq (
                                                       next_not_cached_value bigint NOT NULL,
                                                       minimum_value bigint NOT NULL,
                                                       maximum_value bigint NOT NULL,
                                                       start_value bigint NOT NULL,
                                                       increment bigint NOT NULL,
                                                       cache_size bigint NOT NULL,
                                                       cycle_option smallint NOT NULL,
                                                       cycle_count bigint NOT NULL
);


ALTER TABLE public.venta_prod_serv_vtaprsv_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: ventas_consumidor_final; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.ventas_consumidor_final (
                                                id integer NOT NULL,
                                                fecha date NOT NULL,
                                                documento_ini bigint NOT NULL,
                                                documento_fin bigint NOT NULL,
                                                ventas_propias_gravadas integer,
                                                ventas_propias_exentas integer,
                                                exportaciones integer,
                                                ventas_a_terceros integer,
                                                retencion_percepcion integer,
                                                total_ventas integer,
                                                estado character varying(8) DEFAULT NULL::character varying,
                                                maquina_registradora bigint,
                                                sucursal_id integer NOT NULL,
                                                valor_iva numeric(12,2) DEFAULT NULL::numeric
);


ALTER TABLE public.ventas_consumidor_final OWNER TO "saplic_dprlac_user";

--
-- Name: ventas_consumidor_final_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.ventas_consumidor_final_id_seq (
                                                       next_not_cached_value bigint NOT NULL,
                                                       minimum_value bigint NOT NULL,
                                                       maximum_value bigint NOT NULL,
                                                       start_value bigint NOT NULL,
                                                       increment bigint NOT NULL,
                                                       cache_size bigint NOT NULL,
                                                       cycle_option smallint NOT NULL,
                                                       cycle_count bigint NOT NULL
);


ALTER TABLE public.ventas_consumidor_final_id_seq OWNER TO "saplic_dprlac_user";

--
-- Name: ventatercero; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.ventatercero (
                                     "numeroControl" character varying(36) NOT NULL,
                                     "codigoGeneracion" character varying(36) NOT NULL,
                                     "nitPorCuenta" character varying(14) NOT NULL,
                                     "nomDenominacion" character varying(250) NOT NULL
);


ALTER TABLE public.ventatercero OWNER TO "saplic_dprlac_user";

--
-- Name: viaticos; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.viaticos (
                                 viaticos_id integer NOT NULL,
                                 descripcion character varying(50) DEFAULT NULL::character varying,
                                 cantidad numeric(12,2) NOT NULL,
                                 fecha_entrega date NOT NULL,
                                 empleado_id integer,
                                 permanente smallint,
                                 periodo character varying(3) DEFAULT NULL::character varying
);


ALTER TABLE public.viaticos OWNER TO "saplic_dprlac_user";

--
-- Name: viaticos_viaticos_id_seq; Type: TABLE; Schema: public; Owner: saplic_dprlac_user
--

CREATE TABLE public.viaticos_viaticos_id_seq (
                                                 next_not_cached_value bigint NOT NULL,
                                                 minimum_value bigint NOT NULL,
                                                 maximum_value bigint NOT NULL,
                                                 start_value bigint NOT NULL,
                                                 increment bigint NOT NULL,
                                                 cache_size bigint NOT NULL,
                                                 cycle_option smallint NOT NULL,
                                                 cycle_count bigint NOT NULL
);


ALTER TABLE public.viaticos_viaticos_id_seq OWNER TO "saplic_dprlac_user";

--
-- Data for Name: activo_fijo; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--


--
-- Data for Name: activo_fijo_activo_fijo_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--
--
-- Data for Name: bitacora; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.bitacora (id, usuario, comentario, fecha, token) FROM stdin;
5	02033110660019	Token de autenticacion	2024-03-09	Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIwMjAzMzExMDY2MDAxOSIsImF1dGhvcml0aWVzIjpbIlVTRVIiLCJVU0VSX0FQSSIsIlVzdWFyaW8iXSwiaWF0IjoxNzA5OTY1NTM5LCJleHAiOjE3MTAwNTE5Mzl9.AJps4RJkwggZFw1wEZe786gnvqjhR0CrT5nyEOaOsPzN-lFSYlPqqyo2vPzLiBoapcDkHtIxf_RjhiIbDofmrQ
6	02033110660019	Token de autenticacion	2024-03-09	Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIwMjAzMzExMDY2MDAxOSIsImF1dGhvcml0aWVzIjpbIlVTRVIiLCJVU0VSX0FQSSIsIlVzdWFyaW8iXSwiaWF0IjoxNzEwMDAwNTA4LCJleHAiOjE3MTAwODY5MDh9._FwgZe3TsLq19hRGT77CEWQ3hVJ2mZzWeRnlCFNa82Nv9IxRA-20QOrSKTJYICLpE490qmYZrRiDancVc179Dw
\.


--
-- Data for Name: bitacorafactura; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.bitacorafactura (version, ambiente, "versionApp", estado, "codigoGeneracion", "selloRecibido", "fhProcesamiento", "clasificaMsg", "descripcionMsg", observaciones, usuario, id) FROM stdin;
2	00	2	RECHAZADO	9FB0D8F8-2818-4A41-B0D0-6171273B53E9		08/03/2024 23:16:37	98	DOCUMENTO NO CUMPLE ESQUEMA JSON	[\\"Campo #\\\\/resumen\\\\/pagos\\\\/0\\\\/periodo no cumple el m\\\\u00ednimo  exclusivo\\",\\"Campo #\\\\/resumen\\\\/pagos\\\\/0\\\\/periodo contiene un valor inv\\\\u00e1lido\\",\\"Campo #\\\\/resumen\\\\/pagos contiene un valor inv\\\\u00e1lido\\",\\"Campo #\\\\/Cuerpodocumento no cumple el m\\\\u00ednimo requerido de cantidad de \\\\u00edtems\\"]	dgarcia	1
2	00	2	RECHAZADO	6438505D-BE64-46CC-A7A7-120DDC80B6FF		08/03/2024 23:25:00	98	DOCUMENTO NO CUMPLE ESQUEMA JSON	[\\"Campo #\\\\/resumen\\\\/pagos\\\\/0\\\\/periodo no cumple el m\\\\u00ednimo  exclusivo\\",\\"Campo #\\\\/resumen\\\\/pagos\\\\/0\\\\/periodo contiene un valor inv\\\\u00e1lido\\",\\"Campo #\\\\/resumen\\\\/pagos contiene un valor inv\\\\u00e1lido\\"]	dgarcia	2
2	00	2	RECHAZADO	C6D0A5BA-29A2-4A46-B17B-624E8A2EABB3		08/03/2024 23:30:40	98	DOCUMENTO NO CUMPLE ESQUEMA JSON	[\\"Campo #\\\\/resumen\\\\/pagos\\\\/0\\\\/periodo no cumple el m\\\\u00ednimo  exclusivo\\",\\"Campo #\\\\/resumen\\\\/pagos\\\\/0\\\\/periodo contiene un valor inv\\\\u00e1lido\\",\\"Campo #\\\\/resumen\\\\/pagos contiene un valor inv\\\\u00e1lido\\"]	dgarcia	3
2	00	2	RECHAZADO	D5A3E5D4-7ED8-495D-B3CF-569D8BA38F57		09/03/2024 00:25:54	13	[receptor.nit] NIT CONTRIBUYENTE NO EXISTE	null	dgarcia	4
2	00	2	RECHAZADO	8EB51F9E-662A-44F2-B5FA-0A0ECB940995		09/03/2024 00:29:30	16	[Cuerpodocumento.numItem] ERROR EN CORRELATIVO	null	dgarcia	5
2	00	2	RECHAZADO	DD7277CF-28FA-4F15-881F-BF757119E122		09/03/2024 00:30:04	98	DOCUMENTO NO CUMPLE ESQUEMA JSON	[\\"Campo #\\\\/Cuerpodocumento\\\\/0\\\\/numItem no cumple el valor m\\\\u00ednimo  requerido\\"]	dgarcia	6
2	00	2	RECHAZADO	17BCBD36-49C2-4CA0-A4A7-69A3C79E3AF5		09/03/2024 00:30:59	16	[Cuerpodocumento.numItem] ERROR EN CORRELATIVO	null	dgarcia	7
2	00	2	RECHAZADO	2D6B3A42-6375-4BB1-8162-65AB0DBCC585		09/03/2024 00:31:38	16	[Cuerpodocumento.item.2] CALCULO INCORRECTO	null	dgarcia	8
2	00	2	PROCESADO	02420099-5CD5-4F04-B6A3-448BAAF1B30B	202421C3ACDED8F545088412D85614E390FAAWS4	09/03/2024 00:37:53	10	RECIBIDO CON OBSERVACIONES	[\\"resumen.pagos.montoPago Forma de pago difiere del Total a Pagar.\\"]	dgarcia	9
2	00	2	PROCESADO	43AA7CEF-B070-46F6-89A0-18FEC495CCA8	202458F89C1F62DD4EF7B2C48864B159C2F0XKKC	09/03/2024 00:40:21	10	RECIBIDO CON OBSERVACIONES	[\\"resumen.pagos.montoPago Forma de pago difiere del Total a Pagar.\\"]	dgarcia	10
2	00	2	PROCESADO	5D61675C-260E-44FD-A3BA-57805A5DA2D2	2024B69F1EBD6098439C95FC422BC48F1B67T0BB	09/03/2024 00:44:08	10	RECIBIDO CON OBSERVACIONES	[\\"resumen.pagos.montoPago Forma de pago difiere del Total a Pagar.\\"]	dgarcia	11
2	00	2	PROCESADO	6EB3F012-7404-46C4-908A-6F5175D8CE02	20244441E46698B14CD5BEEA7460C98E75A4MY7A	09/03/2024 00:46:06	10	RECIBIDO CON OBSERVACIONES	[\\"resumen.pagos.montoPago Forma de pago difiere del Total a Pagar.\\"]	dgarcia	12
2	00	2	PROCESADO	9E76C69B-6AF3-41F0-A4BE-8C21E52D7CEB	20242B4C74B6A6AD4E1A9C0737E765FFB565O1UJ	09/03/2024 00:47:40	10	RECIBIDO CON OBSERVACIONES	[\\"resumen.pagos.montoPago Forma de pago difiere del Total a Pagar.\\"]	dgarcia	13
2	00	2	PROCESADO	8A74DCB8-B243-4C27-9F97-125584B4B103	2024E90DB367F3F54D059C766ED9AFE42CF4AVVC	09/03/2024 00:51:32	10	RECIBIDO CON OBSERVACIONES	[\\"resumen.pagos.montoPago Forma de pago difiere del Total a Pagar.\\"]	dgarcia	14
2	00	2	PROCESADO	584F066E-5FA3-4AEC-80FB-926901353051	20247852A1C5A3FA473B87B6A6A0C7AC3D672U6B	09/03/2024 00:54:25	10	RECIBIDO CON OBSERVACIONES	[\\"resumen.pagos.montoPago Forma de pago difiere del Total a Pagar.\\"]	dgarcia	15
2	00	2	PROCESADO	E9ABB697-938D-4924-A7E7-55C1C7E49AE0	202483427D451B8A4BDDB203506772CA7013UTTZ	09/03/2024 01:00:18	10	RECIBIDO CON OBSERVACIONES	[\\"resumen.pagos.montoPago Forma de pago difiere del Total a Pagar.\\"]	dgarcia	16
2	00	2	PROCESADO	8C38260B-247F-4A78-B83F-2B76CDA85224	20247F0DD03E74C44EC7B28CE933DC3FC3CAXENI	09/03/2024 01:03:49	10	RECIBIDO CON OBSERVACIONES	[\\"resumen.pagos.montoPago Forma de pago difiere del Total a Pagar.\\"]	dgarcia	17
2	00	2	PROCESADO	1EEACAC8-002D-49E9-8E30-253F94D8AFC0	2024627F90FF211C45D6AE5C0A9022BB8EADHGKZ	09/03/2024 01:04:21	10	RECIBIDO CON OBSERVACIONES	[\\"resumen.pagos.montoPago Forma de pago difiere del Total a Pagar.\\"]	dgarcia	18
2	00	2	PROCESADO	B0093AF7-3309-4B8D-B839-C0EE01A359D6	2024AB48CA32FAEF42A49F778153CC5BA12453GI	09/03/2024 10:09:00	10	RECIBIDO CON OBSERVACIONES	[\\"resumen.pagos.montoPago Forma de pago difiere del Total a Pagar.\\"]	dgarcia	19
\.


--
-- Data for Name: caja_chica_det; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--


--
-- Data for Name: caja_chica_det_cjcd_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--




--
-- Data for Name: caja_chica_mov; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.cat001 (codigo, valores) FROM stdin;
00	Modo prueba
01	Modo producci�n
\.


--
-- Data for Name: cat002; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.cat002 (codigo, valores) FROM stdin;
01	Factura
03	Comprobante de cr�dito fiscal
04	Nota de remisi�n
05	Nota de cr�dito
06	Nota de d�bito
07	Comprobante de retenci�n
08	Comprobante de liquidaci�n
09	Documento contable de liquidaci�n
11	Facturas de exportaci�n
14	Factura de sujeto excluido
15	Comprobante de donaci�n
01	Factura
03	Comprobante de cr�dito fiscal
\.


--
-- Data for Name: cat003; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.cat003 (codigo, valores) FROM stdin;
\.


--
-- Data for Name: cat004; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.cat004 (codigo, valores) FROM stdin;
01	Transmisi�n normal
02	Transmisi�n por contingencia
\.


--
-- Data for Name: cat005; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.cat005 (codigo, valores) FROM stdin;
1	No disponibilidad de sistema del MH
3	No disponibilidad de sistema del emisor
4	Falla en el suministro de servicio de Internet del Emisor
5	Falla en el suministro de servicio de energ�a el�ctrica del emisor\\r\\nque impida la transmisi�n de los DTE
6	Otro
\.


--
-- Data for Name: cat006; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.cat006 (codigo, valores) FROM stdin;
22	Retenci�n IVA 1%
C4	Retenci�n IVA 13%
C9	Otras retenciones IVA casos especiales
\.


--
-- Data for Name: cat007; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.cat007 (codigo, valores) FROM stdin;
1	F�sico
2	Retenci�n IVA 13%
\.


--
-- Data for Name: cat009; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.cat009 (codigo, valores) FROM stdin;
01	Sucursal / Agencia
02	Casa matriz
04	Bodega
07	Predio y/o patio
20	Otro
\.


--
-- Data for Name: cat010; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.cat010 (codigo, valores) FROM stdin;
1	Cirug�a
2	Operaci�n
3	Tratamiento m�dico
4	Cirug�a instituto salvadore�o de Bienestar Magisterial
5	Operaci�n Instituto Salvadore�o de Bienestar Magisterial
6	Tratamiento m�dico Instituto Salvadore�o de Bienestar Magisterial
\.


--
-- Data for Name: cat011; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.cat011 (codigo, valores) FROM stdin;
1	Bienes
2	Servicios
3	Ambos (Bienes y Servicios)
4	Otros tributos por �tem
\.


--
-- Data for Name: cat012; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.cat012 (codigo, valores) FROM stdin;
01	Ahuachap�n
02	Santa Ana
03	Sonsonate
04	Chalatenango
05	La Libertad
06	San Salvador
07	Cuscatl�n
08	La Paz
09	Caba�as
10	San Vicente
11	Usulut�n
12	San Miguel
13	Moraz�n
14	La Uni�n
\.


--
-- Data for Name: cat013; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.cat013 (codigo, valor, codigo_depto, idmuni) FROM stdin;
00	OTRO PAIS	00	1
01	AHUACHAPAN	01	2
02	APANECA	01	3
03	ATIQUIZAYA	01	4
04	CONCEPCION DE ATACO	01	5
05	EL REFUGIO	01	6
06	GUATMANGO	01	7
07	JUJUTLA	01	8
08	SAN FRANCISCO MENENDEZ	01	9
09	SAN LORENZO	01	10
10	SAN PEDRO PUXTLA	01	11
11	TACUBA	01	12
12	TURIN	01	13
01	CANDELARIA DE LA FRONTERA	02	14
02	COATEPEQUE	02	15
03	CHALCHUAPA	02	16
04	EL CONGO	02	17
05	EL PORVENIR	02	18
06	MASAHUAT	02	19
07	METAPAN	02	20
08	SAN ANTONIO PAJONAL	02	21
09	SAN SEBASTIAN SALITRILLO	02	22
10	SANTA ANA	02	23
11	STA ROSA GUACHI	02	24
12	STGO D LA FRONT	02	25
13	TEXISTEPEQUE	02	26
01	ACAJUTLA	03	27
02	ARMENIA	03	28
03	CALUCO	03	29
04	CUINAHUAT	03	30
05	STA ISHUATAN	03	31
06	IZALCO	03	32
07	JUAYUA	03	33
08	NAHUIZALCO	03	34
09	NAHUILINGO	03	35
10	SALCOATITAN	03	36
11	SAN ANTONIO DEL MONTE	03	37
12	SAN JULIAN	03	38
13	STA C MASAHUAT	03	39
14	SANTO DOMINGO GUZMAN	03	40
15	SONSONATE	03	41
16	SONZACATE	03	42
01	AGUA CALIENTE	04	43
02	ARCATAO	04	44
03	AZACUALPA	04	45
04	CHALATENANGO	04	46
05	COMALAPA	04	47
06	CITAL�	04	48
07	CONCEPCI�N QUEZALTEPEQUE	04	49
08	DULCE NOMBRE DE MAR�A	04	50
09	EL CARRIZAL	04	51
10	EL PARA�SO	04	52
11	LA LAGUNA	04	53
12	LA PALMA	04	54
13	LA REINA	04	55
14	LAS VUELTAS	04	56
15	NUEVA CONCEPCI�N	04	57
16	NUEVA TRINIDAD	04	58
17	NOMBRE DE JES�S	04	59
18	OJOS DE AGUA	04	60
19	POTONICO	04	61
20	SAN ANTONIO DE LA CRUZ	04	62
21	SAN ANTONIO LOS RANCHOS	04	63
22	SAN FERNANDO	04	64
23	SAN FRANCISCO LEMPA	04	65
24	SAN FRANCISCO MORAZ�N	04	66
25	SAN IGNACIO	04	67
26	SAN ISIDRO LABRADOR	04	68
27	SAN JOS� CANCASQUE	04	69
28	SAN JOS� LAS FLORES	04	70
29	SAN LUIS DEL CARMEN	04	71
30	SAN MIGUEL DE MERCEDES	04	72
31	SAN RAFAEL	04	73
32	SANTA RITA	04	74
33	TEJUTLA	04	75
01	ANTIGUO CUSCATL�N	05	76
02	CHILTIUP�N	05	77
03	CIUDAD ARCE	05	78
04	COL�N	05	79
05	COMASAGUA	05	80
06	HUIZ�CAR	05	81
07	JAYAQUE	05	82
08	JICALAPA	05	83
09	LA LIBERTAD	05	84
10	SANTA TECLA	05	85
11	NUEVO CUSCATL�N	05	86
12	SAN JUAN OPICO	05	87
13	QUEZALTEPEQUE	05	88
14	SACACOYO	05	89
15	SAN JOS� VILLANUEVA	05	90
16	SAN MAT�AS	05	91
17	SAN PABLO TACACHICO	05	92
18	TALNIQUE	05	93
19	TAMANIQUE	05	94
20	TEOTEPEQUE	05	95
21	TEPECOYO	05	96
22	ZARAGOZA	05	97
01	AGUILARES	06	98
02	APOPA	06	99
03	AYUTUXTEPEQUE	06	100
04	CUSCATANCINGO	06	101
05	CIUDAD DELGADO	06	102
06	EL PAISNAL	06	103
07	GUAZAPA	06	104
08	ILOPANGO	06	105
09	MEJICANOS	06	106
10	NEJAPA	06	107
11	PANCHIMALCO	06	108
12	ROSARIO DE MORA	06	109
13	SAN MARCOS	06	110
14	SAN MART�N	06	111
15	SAN SALVADOR	06	112
16	SANTIAGO TEXACUANGOS	06	113
17	SANTO TOM�S	06	114
18	SOYAPANGO	06	115
19	TONACATEPEQUE	06	116
01	CANDELARIA	07	117
02	COJUTEPEQUE	07	118
03	EL CARMEN	07	119
04	EL ROSARIO	07	120
05	MONTE SAN JUAN	07	121
06	ORATORIO DE CONCEPCI�N	07	122
07	SAN BARTOLOM� PERULAP�A	07	123
08	SAN CRIST�BAL	07	124
09	SAN JOS� GUAYABAL	07	125
10	SAN PEDRO PERULAP�N	07	126
11	SAN RAFAEL CEDROS	07	127
12	SAN RAM�N	07	128
13	SANTA CRUZ ANALQUITO	07	129
14	SANTA CRUZ MICHAPA	07	130
15	SUCHITOTO	07	131
16	TENANCINGO	07	132
01	CUYULTIT�N	08	133
02	EL ROSARIO	08	134
03	JERUSAL�N	08	135
04	MERCEDES LA CEIBA	08	136
05	OLOCUILTA	08	137
06	PARA�SO DE OSORIO	08	138
07	SAN ANTONIO MASAHUAT	08	139
08	SAN EMIGDIO	08	140
09	SAN FRANCISCO CHINAMECA	08	141
10	SAN JUAN NONUALCO	08	142
11	SAN JUAN TALPA	08	143
12	SAN JUAN TEPEZONTES	08	144
13	SAN LUIS TALPA	08	145
14	SAN LUIS LA HERRADURA	08	146
15	SAN MIGUEL TEPEZONTES	08	147
16	SAN PEDRO MASAHUAT	08	148
17	SAN PEDRO NONUALCO	08	149
18	SAN RAFAEL OBRAJUELO	08	150
19	SANTA MAR�A OSTUMA	08	151
20	SANTIAGO NONUALCO	08	152
21	TAPALHUACA	08	153
22	ZACATECOLUCA	08	154
01	CINQUERA	09	155
02	DOLORES	09	156
03	GUACOTECTI	09	157
04	ILOBASCO	09	158
05	JUTIAPA	09	159
06	SAN ISIDRO	09	160
07	SENSUNTEPEQUE	09	161
08	TEJUTEPEQUE	09	162
09	VICTORIA	09	163
01	APASTEPEQUE	10	164
02	GUADALUPE	10	165
03	SAN CAYETANO ISTEPEQUE	10	166
04	SAN ESTEBAN CATARINA	10	167
05	SAN ILDEFONSO	10	168
06	SAN LORENZO	10	169
07	SAN SEBASTI�N	10	170
08	SAN VICENTE	10	171
09	SANTA CLARA	10	172
10	SANTO DOMINGO	10	173
11	TECOLUCA	10	174
12	TEPETIT�N	10	175
13	VERAPAZ	10	176
01	ALEGR�A	11	177
02	BERL�N	11	178
03	CALIFORNIA	11	179
04	CONCEPCI�N BATRES	11	180
05	EL TRIUNFO	11	181
06	EREGUAYQU�N	11	182
07	ESTANZUELAS	11	183
08	JIQUILISCO	11	184
09	JUCUAPA	11	185
10	JUCUAR�N	11	186
11	MERCEDES UMA�A	11	187
12	NUEVA GRANADA	11	188
13	OZATL�N	11	189
14	PUERTO EL TRIUNFO	11	190
15	SAN AGUST�N	11	191
16	SAN BUENAVENTURA	11	192
17	SAN DIONISIO	11	193
18	SAN FRANCISCO JAVIER	11	194
19	SANTA ELENA	11	195
20	SANTA MAR�A	11	196
21	SANTIAGO DE MAR�A	11	197
22	TECAP�N	11	198
23	USULUT�N	11	199
01	CAROLINA	12	200
02	CHAPELTIQUE	12	201
03	CHINAMECA	12	202
04	CHIRILAGUA	12	203
05	CIUDAD BARRIOS	12	204
06	COMACAR�N	12	205
07	EL TR�NSITO	12	206
08	LOLOTIQUE	12	207
09	MONCAGUA	12	208
10	NUEVA GUADALUPE	12	209
11	NUEVO ED�N DE SAN JUAN	12	210
12	QUELEPA	12	211
13	SAN ANTONIO DEL MOSCO	12	212
14	SAN GERARDO	12	213
15	SAN JORGE	12	214
16	SAN LUIS DE LA REINA	12	215
17	SAN MIGUEL	12	216
18	SAN RAFAEL ORIENTE	12	217
19	SESORI	12	218
20	ULUAZAPA	12	219
01	ARAMBALA	13	220
02	CACAOPERA	13	221
03	CHILANGA	13	222
04	CORINTO	13	223
05	DELICIAS DE CONCEPCI�N	13	224
06	EL DIVISADERO	13	225
07	EL ROSARIO	13	226
08	GUALOCOCTI	13	227
09	GUATAJIAGUA	13	228
10	JOATECA	13	229
11	JOCOAITIQUE	13	230
12	JOCORO	13	231
13	LOLOTIQUILLO	13	232
14	MEANGUERA	13	233
15	OSICALA	13	234
16	PERQU�N	13	235
17	SAN CARLOS	13	236
18	SAN FERNANDO	13	237
19	SAN FRANCISCO GOTERA	13	238
20	SAN ISIDRO	13	239
21	SAN SIM�N	13	240
22	SENSEMBRA	13	241
23	SOCIEDAD	13	242
24	TOROLA	13	243
25	YAMABAL	13	244
26	YOLOAIQU�N	13	245
01	ANAMOR�S	14	246
02	BOL�VAR	14	247
03	CONCEPCI�N DE ORIENTE	14	248
04	CONCHAGUA	14	249
05	EL CARMEN	14	250
06	EL SAUCE	14	251
07	INTIPUC�	14	252
08	LA UNI�N	14	253
09	LISLIQUE	14	254
10	MEANGUERA DEL GOLFO	14	255
11	NUEVA ESPARTA	14	256
12	PASAQUINA	14	257
13	POLOR�S	14	258
14	SAN ALEJO	14	259
15	SAN JOS�	14	260
16	SANTA ROSA DE LIMA	14	261
17	YAYANTIQUE	14	262
18	YUCUAIQU�N	14	263
\.


--
-- Data for Name: cat014; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.cat014 (codigo, valor) FROM stdin;
01	Metro
02	Yarda
03	Vara
04	Pie
05	Pulgada
07	Mil�metro
08	Milla cuadrada
09	Kil�metro cuadrado
10	Hect�rea
11	Manzana
12	Acre
13	Metro cuadrado
14	Yarda cuadrada
15	Vara cuadrada
16	Pie cuadrado
17	Pulgada cuadrada
18	Metro c�bico
19	Yarda c�bica
20	Barril
21	Pie c�bico
22	Gal�n
23	Litro
24	Botella
25	Pulgada c�bica
26	Mililitro
27	Onza fluida
29	Tonelada m�trica
30	Tonelada
31	Quintal m�trico
32	Quintal
33	Arroba
34	Kilogramo
35	Libra troy
36	Libra
37	Onza troy
38	Onza
39	Gramo
40	Miligramo
42	Megawatt
43	Kilowatt
44	Watt
45	Megavoltio-amperio
46	Kilovoltio-amperio
47	Voltio-amperio
49	Gigawatt-hora
50	Megawatt-hora
51	Kilowatt-hora
52	Watt-hora
53	Kilovoltio
54	Voltio
55	Millar
56	Medio millar
57	Ciento
58	Docena
59	Unidad
99	Otra
\.


--
-- Data for Name: cat015; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.cat015 (codigo, valor, codigo_tipo, porcentaje, monto) FROM stdin;
19	Fabricante de Bebidas Gaseosas, Isotonicas, deportivas, fortificantes, energizante o estimulante	3	\N	\N
20	Impuesto al Valor agregado 13%	1	[0.13]	\N
28	Importador de Bebidas Gaseosas, Isotonicas, deportivas, fortificantes, energizante o estimulante	3	\N	\N
31	Detallistas o Expendedores de bebidas Alcoholicas	3	\N	\N
32	Fabricante de cerveza	3	\N	\N
33	Importador de cerveza	3	\N	\N
34	Fabricante de productos de tabaco	3	\N	\N
35	Importador de productos de tabaco	3	\N	\N
36	Fabricante de Armas de fuego, municiones, y articulos similares	3	\N	\N
37	Importador de Armas de fuego, municiones, y articulos similares	3	\N	\N
38	Fabricante de explosivos	3	\N	\N
39	Importador de explosivos	3	\N	\N
42	Fabricante de productos pirotecnicos	3	\N	\N
43	Importador de productos pirotecnicos	3	\N	\N
44	Productor de tabaco	3	\N	\N
50	Distribuidor de Bebidas Gaseosas, Isotonicas, deportivas, fortificantes, energizante o estimulante	3	\N	\N
51	Bebidas Alcoholicas	3	\N	\N
52	Cerveza	3	\N	\N
53	Productos del tabaco	3	\N	\N
54	Bebidas Carbonatadas o Gaseosas Simples o Endulzadas	3	\N	\N
55	Otros especificos	3	\N	\N
57	Impuesto industria de Cemento	2	\N	\N
58	Alcohol	3	\N	\N
59	Turismo: por alojamiento (5%)	1	[0.05]	\N
71	Turismo: salida del pais por via aerea $7.00	1	[0]	[7]
77	Importador de Jugos, Nectares, Bebidas con Jugo y Refrescos	3	\N	\N
78	Distribuidor de Jugos, Nectares, Bebidas con Jugo y Refrescos	3	\N	\N
79	Sobre Llamandas Telefonicas Provenientes del Ext.	3	\N	\N
85	Detallista de Jugos, Nectares, Bebidas, con Jugo y Refrescos	3	\N	\N
86	Fabricante de Preparaciones Concentradas o en Polvo para la elaboracion de bebidas	3	\N	\N
90	Impuesto especial a la primera matricula	2	\N	\N
91	Fabricante de Jugos, Nectares, Bebidas con Jugo y Refrescos	3	\N	\N
92	Importador de Preparaciones Concentradas o en Polvo para la elaboracion de bebidas	3	\N	\N
A1	Especificos y Ad-Valorem	3	\N	\N
A5	Bebidas Gaseosas, Isotonicas, Deportivas, Fortificantes, Energizantes o Estimulantes	3	\N	\N
A6	Impuesto ad-valorem, armas de fuego, municiones explosivas y articulos similares	2	\N	\N
A7	Alcohol Etilico	\N	\N	\N
A8	Impuesto Especial al Combustible (0%, 0.5%, 1%)	2	[0, 0.005, 1]	\N
A9	Sacos Sinteticos	3	\N	\N
C3	Impuesto al Valor agregado(exportaciones) 0%	1	\N	\N
C5	Impuesto ad-valorem por diferencial de precios de bebidas alcoholicas (8%)	3	[0.08]	\N
C6	Impuesto ad-valorem por diferencial de precios al tabaco cigarrillos (39%)	3	[0.39]	\N
C7	Impuesto ad-valorem por diferencial de precios al tabaco cigarrillos (100%)	3	[1]	\N
C8	COTRANS ($0.10 Ctvs. Por galon)	1	\N	[0.1]
D1	FOVIAL ($0.20 Ctvs. Por galon)	1	\N	[0.2]
D4	Otros impuestos casos especiales	1	\N	\N
D5	Otras tasas casos especiales	1	\N	\N
O4	Otros impuestos casos especiales	2	\N	\N
O5	Otras tasas casos especiales	2	\N	\N
\.


--
-- Data for Name: cat016; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.cat016 (codigo, valor) FROM stdin;
1	Contado
2	Credito
3	Otro
\.


--
-- Data for Name: cat017; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.cat017 (codigo, valor) FROM stdin;
01	Billetes y monedas
03	Tarjeta Credito
04	Cheque
03	Cuenta Libre
\.


--
-- Data for Name: cat018; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.cat018 (codigo, valor) FROM stdin;
01	Dias
02	Meses
03	A�os
\.


--
-- Data for Name: cat019; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.cat019 (codigo, valor, cod_tipo) FROM stdin;
01111	Cultivo de cereales excepto arroz y para forrajes	1
01112	Cultivo de legumbres	1
01113	Cultivo de semillas oleaginosas	1
01114	Cultivo de plantas para la preparaci�n de semillas	1
01119	Cultivo de otros cereales excepto arroz y forrajeros n.c.p.	1
01120	Cultivo de arroz	1
01131	Cultivo de ra�ces y tub�rculos	1
01132	Cultivo de brotes, bulbos, vegetales tub�rculos y cultivos similares	1
01133	Cultivo hort�cola de fruto	1
01134	Cultivo de hortalizas de hoja y otras hortalizas ncp	1
01140	Cultivo de ca�a de az�car	1
01150	Cultivo de tabaco	1
01161	Cultivo de algod�n	1
01162	Cultivo de fibras vegetales excepto algod�n	1
01191	Cultivo de plantas no perennes para la producci�n de semillas y flores	1
01192	Cultivo de cereales y pastos para la alimentaci�n animal	1
01199	Producci�n de cultivos no estacionales ncp	1
01220	Cultivo de frutas tropicales	1
01230	Cultivo de c�tricos	1
01240	Cultivo de frutas de pepita y hueso	1
01251	Cultivo de frutas ncp	1
01252	Cultivo de otros frutos y nueces de �rboles y arbustos	1
01260	Cultivo de frutos oleaginosos	1
01271	Cultivo de caf�	1
01272	Cultivo de plantas para la elaboraci�n de bebidas excepto caf�	1
01281	Cultivo de especias y arom�ticas	1
01282	Cultivo de plantas para la obtenci�n de productos medicinales y farmac�uticos	1
01291	Cultivo de �rboles de hule (caucho) para la obtenci�n de l�tex	1
01292	Cultivo de plantas para la obtenci�n de productos qu�micos y colorantes	1
01299	Producci�n de cultivos perennes ncp	1
01300	Propagaci�n de plantas	1
01301	Cultivo de plantas y flores ornamentales	1
01410	Cr�a y engorde de ganado bovino	1
01420	Cr�a de caballos y otros equinos	1
01440	Cr�a de ovejas y cabras	1
01450	Cr�a de cerdos	1
01460	Cr�a de aves de corral y producci�n de huevos	1
01491	Cr�a de abejas apicultura para la obtenci�n de miel y otros productos ap�colas	1
01492	Cr�a de conejos	1
01493	Cr�a de iguanas y garrobo	1
01494	Cr�a de mariposas y otros insectos	1
01499	Cr�a y obtenci�n de productos animales n.c.p.	1
01500	Cultivo de productos agr�colas en combinaci�n con la cr�a de animales	1
01611	Servicios de maquinaria agr�cola	1
01612	Control de plagas	1
01613	Servicios de riego	1
01614	Servicios de contrataci�n de mano de obra para la agricultura	1
01619	Servicios agr�colas ncp	1
01621	Actividades para mejorar la reproducci�n, el crecimiento y el rendimiento de los animales y sus productos	1
01622	Servicios de mano de obra pecuaria	1
01629	Servicios pecuarios ncp	1
01631	Labores post cosecha de preparaci�n de los productos agr�colas para su comercializaci�n o para la industria	1
01632	Servicio de beneficio de caf�	1
01633	Servicio de beneficiado de plantas textiles (incluye el beneficiado cuando este es realizado en la misma explotaci�n agropecuaria)	1
01640	Tratamiento de semillas para la propagaci�n	1
01700	Caza ordinaria y mediante trampas, repoblaci�n de animales de caza y servicios conexo	1
02100	Silvicultura y otras actividades forestales	2
02200	Extracci�n de madera	2
02300	Recolecci�n de productos diferentes a la madera	2
02400	Servicios de apoyo a la silvicultura	2
03110	Pesca mar�tima de altura y costera 	3
03120	Pesca de agua dulce 	3
03210	Acuicultura mar�tima 	3
03220	Acuicultura de agua dulce 	3
03300	Servicios de apoyo a la pesca y acuicultura 	3
05100	Extracci�n de hulla	4
05200	Extracci�n y aglomeraci�n de lignito	4
06100	Extracci�n de petr�leo crudo	5
06200	Extracci�n de gas natural	5
07100	Extracci�n de minerales de hierro	6
07210	Extracci�n de minerales de uranio y torio	6
07290	Extracci�n de minerales metal�feros no ferroso	6
08100	Extracci�n de piedra, arena y arcilla	7
08910	Extracci�n de minerales para la fabricaci�n de abonos y productos qu�micos	7
08920	Extracci�n y aglomeraci�n de turba	7
08930	Extracci�n de sal	7
08990	Explotaci�n de otras minas y canteras nc	7
09100	Actividades de apoyo a la extracci�n de petr�leo y gas natural	8
09900	Actividades de apoyo a la explotaci�n de minas y cantera	8
10001	Empleados	91
10002	Jubilado	91
10003	Estudiante	91
10004	Desempleado	91
10005	Otros	91
10101	Servicio de rastros y mataderos de bovinos y porcinos	9
10102	Matanza y procesamiento de bovinos y porcinos	9
10103	Matanza y procesamientos de aves de corral	9
10104	Elaboraci�n y conservaci�n de embutidos y tripas naturales	9
10105	Servicios de conservaci�n y empaque de carnes	9
10106	Elaboraci�n y conservaci�n de grasas y aceites animales	9
10107	Servicios de molienda de carne	9
10108	Elaboraci�n de productos de carne ncp	9
10201	Procesamiento y conservaci�n de pescado, crust�ceos y moluscos	9
10209	Fabricaci�n de productos de pescado ncp	9
10301	Elaboraci�n de jugos de frutas y hortalizasv	9
10302	Elaboraci�n y envase de jaleas, mermeladas y frutas deshidratadas	9
85103	Ense�anza primaria	76
10309	Elaboraci�n de productos de frutas y hortalizas n.c.p.	9
10401	Fabricaci�n de aceites y grasas vegetales y animales comestibles	9
10402	Fabricaci�n de aceites y grasas vegetales y animales no comestible	9
10409	Servicio de maquilado de aceites	9
10501	Fabricaci�n de productos l�cteos excepto sorbetes y quesos sustitutos	9
10502	Fabricaci�n de sorbetes y helados	9
10503	Fabricaci�n de quesos	9
10611	Molienda de cereales	9
10612	Elaboraci�n de cereales para el desayuno y similare	9
10613	Servicios de beneficiado de productos agr�colas ncp (excluye Beneficio de az�car rama 1072 y beneficio de caf� rama 0163)	9
10621	Fabricaci�n de almid�n	9
10628	Servicio de molienda de ma�z h�medo molino para nixtamal	9
10711	Elaboraci�n de tortillas	9
10712	Fabricaci�n de pan, galletas y barquillos	9
10713	Fabricaci�n de reposter�a	9
10721	Ingenios azucareros	9
10722	Molienda de ca�a de az�car para la elaboraci�n de dulces	9
10723	Elaboraci�n de jarabes de az�car y otros similares	9
10724	Maquilado de az�car de ca�a	9
10730	Fabricaci�n de cacao, chocolates y productos de confiter�a	9
10740	Elaboraci�n de macarrones, fideos, y productos farin�ceos similare	9
10750	Elaboraci�n de comidas y platos preparados para la reventa en locales y/o para exportaci�n	9
10791	Elaboraci�n de productos de caf�	9
10792	Elaboraci�n de especies, sazonadores y condimentos	9
10793	Elaboraci�n de sopas, cremas y consom�	9
10794	Fabricaci�n de bocadillos tostados y/o fritos	9
10799	Elaboraci�n de productos alimenticios ncp	9
10800	Elaboraci�n de alimentos preparados para animale	9
11012	Fabricaci�n de aguardiente y licores	10
11020	Elaboraci�n de vinos	10
11030	Fabricaci�n de cerveza	10
11041	Fabricaci�n de aguas gaseosas	10
11042	Fabricaci�n y envasado de agua	10
11043	Elaboraci�n de refrescos	10
11048	Maquilado de aguas gaseosas	10
11049	Elaboraci�n de bebidas no alcoh�licas	10
12000	Elaboraci�n de productos de tabaco	11
13111	Preparaci�n de fibras textiles 	12
13112	Fabricaci�n de hilados 	12
13120	Fabricaci�n de telas 	12
13130	Acabado de productos textiles 	12
13910	Fabricaci�n de tejidos de punto y ganchillo 	12
13921	Fabricaci�n de productos textiles para el hogar	13
13922	Sacos, bolsas y otros art�culos textiles	13
13929	Fabricaci�n de art�culos confeccionados con materiales textiles, excepto prendas de vestir ncp	13
13930	Fabricaci�n de tapices y alfombras	13
13941	Fabricaci�n de cuerdas de henequ�n y otras fibras naturales (lazos, pitas)	13
13942	Fabricaci�n de redes de diversos materiales	13
13948	Maquilado de productos trenzables de cualquier material (petates, sillas, etc.)	13
13991	Fabricaci�n de adornos, etiquetas y otros art�culos para prendas de vestir	13
13992	Servicio de bordados en art�culos y prendas de tela	13
13999	Fabricaci�n de productos textiles ncp	13
14101	Fabricaci�n de ropa interior, para dormir y similares	14
14102	Fabricaci�n de ropa para ni�os	14
14103	Fabricaci�n de prendas de vestir para ambos sexos	14
14104	Confecci�n de prendas a medida	14
14105	Fabricaci�n de prendas de vestir para deportes	14
14106	Elaboraci�n de artesan�as de uso personal confeccionadas especialmente de materiales textiles	14
14108	Maquilado de prendas de vestir, accesorios y otros	14
14109	Fabricaci�n de prendas y accesorios de vestir n.c.p.	14
14200	Fabricaci�n de art�culos de piel	14
14301	Fabricaci�n de calcetines, calcetas, medias (panty house) y otros similares	14
14302	Fabricaci�n de ropa interior de tejido de punto	14
14309	Fabricaci�n de prendas de vestir de tejido de punto ncp	14
15208	Maquilado de partes y accesorios de calzado	14
16100	Aserradero y acepilladura de madera	15
16210	Fabricaci�n de madera laminada, terciada, enchapada y contrachapada, paneles para la construcci�n	15
16220	Fabricaci�n de partes y piezas de carpinter�a para edificios y construcciones	15
16230	Fabricaci�n de envases y recipientes de madera	15
16292	Fabricaci�n de artesan�as de madera, semillas, materiales trenzable	15
16299	Fabricaci�n de productos de madera, corcho, paja y materiales trenzables ncp	15
17010	Fabricaci�n de pasta de madera, papel y cart�n	16
17020	Fabricaci�n de papel y cart�n ondulado y envases de papel y cart�	16
17091	Fabricaci�n de art�culos de papel y cart�n de uso personal y dom�stico	16
17092	Fabricaci�n de productos de papel ncp	16
18110	Impresi�n	17
18120	Servicios relacionados con la impresi�n	17
18200	Reproducci�n de grabacione	17
19100	Fabricaci�n de productos de hornos de coque	18
19201	Fabricaci�n de combustible	18
19202	Fabricaci�n de aceites y lubricante	18
20111	Fabricaci�n de materias primas para la fabricaci�n de colorantes	19
20112	Fabricaci�n de materiales curtientes	19
20113	Fabricaci�n de gases industriales	19
20114	Fabricaci�n de alcohol et�lico	19
20119	Fabricaci�n de sustancias qu�micas b�sicas	19
20120	Fabricaci�n de abonos y fertilizantes	19
20130	Fabricaci�n de pl�stico y caucho en formas primarias	19
20210	Fabricaci�n de plaguicidas y otros productos qu�micos de uso agropecuario	19
20220	Fabricaci�n de pinturas, barnices y productos de revestimiento similares; tintas de imprenta y masilla	19
20231	Fabricaci�n de jabones, detergentes y similares para limpieza	19
20232	Fabricaci�n de perfumes, cosm�ticos y productos de higiene y cuidado personal, incluyendo tintes, champ�, etc.	19
20291	Fabricaci�n de tintas y colores para escribir y pintar; fabricaci�n de cintas para impresoras	19
20292	Fabricaci�n de productos pirot�cnicos, explosivos y municiones	19
20299	Fabricaci�n de productos qu�micos n.c.p.	19
20300	Fabricaci�n de fibras artificiale	19
21001	Manufactura de productos farmac�uticos, sustancias qu�micas y productos bot�nicos	20
21008	Maquilado de medicamentos	20
22110	Fabricaci�n de cubiertas y c�maras; renovaci�n y recauchutado de cubiertas	21
22190	Fabricaci�n de otros productos de caucho	21
22201	Fabricaci�n de envases pl�sticos	21
22202	Fabricaci�n de productos pl�sticos para uso personal o dom�stico	21
22208	Maquila de pl�sticos	21
22209	Fabricaci�n de productos pl�sticos n.c.p.	21
23101	Fabricaci�n de vidrio	22
23102	Fabricaci�n de recipientes y envases de vidrio	22
23108	Servicio de maquilado	22
23109	Fabricaci�n de productos de vidrio ncp	22
23910	Fabricaci�n de productos refractarios	22
23920	Fabricaci�n de productos de arcilla para la construcci�n	22
23931	Fabricaci�n de productos de cer�mica y porcelana no refractaria	22
23932	Fabricaci�n de productos de cer�mica y porcelana ncp	22
23940	Fabricaci�n de cemento, cal y yeso	22
23950	Fabricaci�n de art�culos de hormig�n, cemento y yeso	22
23960	Corte, tallado y acabado de la piedra	22
23990	Fabricaci�n de productos minerales no met�licos ncp	22
24100	Industrias b�sicas de hierro y acero	23
24200	Fabricaci�n de productos primarios de metales preciosos y metales no ferrosos	23
24310	Fundici�n de hierro y acero	23
24320	Fundici�n de metales no ferrosos	23
25111	Fabricaci�n de productos met�licos para uso estructural	24
25118	Servicio de maquila para la fabricaci�n de estructuras met�licas	24
25120	Fabricaci�n de tanques, dep�sitos y recipientes de metal	24
25130	Fabricaci�n de generadores de vapor, excepto calderas de agua caliente para calefacci�n central	24
25200	Fabricaci�n de armas y municiones	24
25910	Forjado, prensado, estampado y laminado de metales; pulvimetalurgia	24
25920	Tratamiento y revestimiento de metales	24
25930	Fabricaci�n de art�culos de cuchiller�a, herramientas de mano y art�culos de ferreter�a	24
25991	Fabricaci�n de envases y art�culos conexos de metal	24
25992	Fabricaci�n de art�culos met�licos de uso personal y/o dom�stico	24
25999	Fabricaci�n de productos elaborados de metal nc	24
26100	Fabricaci�n de componentes electr�nicos	25
26200	Fabricaci�n de computadoras y equipo conexo	25
26300	Fabricaci�n de equipo de comunicaciones	25
26400	Fabricaci�n de aparatos electr�nicos de consumo para audio, video radio y televisi�n	25
26510	Fabricaci�n de instrumentos y aparatos para medir, verificar, ensayar, navegar y de control de procesos industriales	25
26520	Fabricaci�n de relojes y piezas de relojes	25
26600	Fabricaci�n de equipo m�dico de irradiaci�n y equipo electr�nico de uso m�dico y terap�utico	25
26700	Fabricaci�n de instrumentos de �ptica y equipo fotogr�fico	25
26800	Fabricaci�n de medios magn�ticos y �pticos	25
27500	Fabricaci�n de aparatos de uso dom�stico	27
27900	Fabricaci�n de otros tipos de equipo el�ctrico	27
28110	Fabricaci�n de motores y turbinas, excepto motores para aeronaves, veh�culos automotores y motocicletas	28
28120	Fabricaci�n de equipo hidr�ulico	28
28130	Fabricaci�n de otras bombas, compresores, grifos y v�lvulas	28
28140	Fabricaci�n de cojinetes, engranajes, trenes de engranajes y piezas de transmisi�n	28
28150	Fabricaci�n de hornos y quemadores	28
28160	Fabricaci�n de equipo de elevaci�n y manipulaci�n	28
28170	Fabricaci�n de maquinaria y equipo de oficina	28
28180	Fabricaci�n de herramientas manuales	28
28190	Fabricaci�n de otros tipos de maquinaria de uso general	28
28210	Fabricaci�n de maquinaria agropecuaria y forestal	28
28220	Fabricaci�n de m�quinas para conformar metales y maquinaria herramienta	28
28230	Fabricaci�n de maquinaria metal�rgica	28
28240	Fabricaci�n de maquinaria para la explotaci�n de minas y canteras y para obras de construcci�n	28
28250	Fabricaci�n de maquinaria para la elaboraci�n de alimentos, bebidas y tabaco	28
28260	Fabricaci�n de maquinaria para la elaboraci�n de productos textiles, prendas de vestir y cueros	28
28291	Fabricaci�n de m�quinas para imprenta	28
28299	Fabricaci�n de maquinaria de uso especial ncp	28
29100	Fabricaci�n veh�culos automotores	29
29200	Fabricaci�n de carrocer�as para veh�culos automotores; fabricaci�n de remolques y semiremolques	29
29300	Fabricaci�n de partes, piezas y accesorios para veh�culos automotores	29
30110	Fabricaci�n de buques	30
30120	Construcci�n y reparaci�n de embarcaciones de recreo	30
30200	Fabricaci�n de locomotoras y de material rodante	30
30300	Fabricaci�n de aeronaves y naves espaciales	30
30400	Fabricaci�n de veh�culos militares de combate	30
30910	Fabricaci�n de motocicletas	30
30920	Fabricaci�n de bicicletas y sillones de ruedas para inv�lidos	30
30990	Fabricaci�n de equipo de transporte ncp	30
31001	Fabricaci�n de colchones y somier	31
31002	Fabricaci�n de muebles y otros productos de madera a medida	31
31008	Servicios de maquilado de muebles	31
31009	Fabricaci�n de muebles ncp	31
32110	Fabricaci�n de joyas plater�as y joyer�as	31
32120	Fabricaci�n de joyas de imitaci�n (fantas�a) y art�culos conexos	31
32200	Fabricaci�n de instrumentos musicales	31
32301	Fabricaci�n de art�culos de deporte	31
32308	Servicio de maquila de productos deportivos	31
32401	Fabricaci�n de juegos de mesa y de sal�n	31
32402	Servicio de maquilado de juguetes y juegos	31
32409	Fabricaci�n de juegos y juguetes n.c.p.	31
32500	Fabricaci�n de instrumentos y materiales m�dicos y odontol�gicos	31
32901	Fabricaci�n de l�pices, bol�grafos, sellos y art�culos de librer�a en general	31
32902	Fabricaci�n de escobas, cepillos, pinceles y similares	31
32903	Fabricaci�n de artesan�as de materiales diversos	31
32904	Fabricaci�n de art�culos de uso personal y dom�sticos n.c.p.	31
32905	Fabricaci�n de accesorios para las confecciones y la marroquiner�a n.c.p.	31
32908	Servicios de maquila ncp	31
32909	Fabricaci�n de productos manufacturados n.c.p.	31
33110	Reparaci�n y mantenimiento de productos elaborados de metal	32
33120	Reparaci�n y mantenimiento de maquinaria	32
33130	Reparaci�n y mantenimiento de equipo electr�nico y �ptico	32
33140	Reparaci�n y mantenimiento de equipo el�ctrico	32
33150	Reparaci�n y mantenimiento de equipo de transporte, excepto veh�culos automotores	32
33190	Reparaci�n y mantenimiento de equipos n.c.p.	32
33200	Instalaci�n de maquinaria y equipo industrial	32
35101	Generaci�n de energ�a el�ctrica	33
35102	Transmisi�n de energ�a el�ctrica	33
35103	Distribuci�n de energ�a el�ctrica	33
35200	Fabricaci�n de gas, distribuci�n de combustibles gaseosos por tuber�as	33
35300	Suministro de vapor y agua calient	33
36000	Captaci�n, tratamiento y suministro de agua	34
37000	Evacuaci�n de aguas residuales (alcantarillado)	35
38110	Recolecci�n y transporte de desechos s�lidos proveniente de hogares y sector urbano	36
38120	Recolecci�n de desechos peligrosos	36
38210	Tratamiento y eliminaci�n de desechos inicuos	36
38220	Tratamiento y eliminaci�n de desechos peligrosos	36
38301	Reciclaje de desperdicios y desechos textiles	36
38302	Reciclaje de desperdicios y desechos de pl�stico y caucho	36
38303	Reciclaje de desperdicios y desechos de vidrio	36
38304	Reciclaje de desperdicios y desechos de papel y cart�n	36
38305	Reciclaje de desperdicios y desechos met�licos	36
38309	Reciclaje de desperdicios y desechos no met�licos n.c.p.	36
39000	Actividades de Saneamiento y otros Servicios de Gesti�n de Desechos	37
41001	Construcci�n de edificios residenciales	38
41002	Construcci�n de edificios no residenciales	38
42100	Construcci�n de carreteras, calles y caminos	39
42200	Construcci�n de proyectos de servicio p�blico	39
42900	Construcci�n de obras de ingenier�a civil n.c.p.	39
43110	Demolici�n	40
43120	Preparaci�n de terreno	40
43210	Instalaciones el�ctricas	40
43220	Instalaci�n de fontaner�a, calefacci�n y aire acondicionado	40
43290	Otras instalaciones para obras de construcci�n	40
43300	Terminaci�n y acabado de edificios	40
43900	Otras actividades especializadas de construcci�n	40
43901	Fabricaci�n de techos y materiales diversos	40
45100	Venta de veh�culos automotores	41
45201	Reparaci�n mec�nica de veh�culos automotores	41
45202	Reparaciones el�ctricas del automotor y recarga de bater�as	41
45203	Enderezado y pintura de veh�culos automotores	41
45204	Reparaciones de radiadores, escapes y silenciadores	41
45205	Reparaci�n y reconstrucci�n de v�as, stop y otros art�culos de fibra de vidrio	41
45206	Reparaci�n de llantas de veh�culos automotores	41
45207	Polarizado de veh�culos (mediante la adhesi�n de papel especial a los vidrios)	41
45208	Lavado y pasteado de veh�culos (carwash)	41
45209	Reparaciones de veh�culos n.c.p.	41
45211	Remolque de veh�culos automotores	41
45301	Venta de partes, piezas y accesorios nuevos para veh�culos automotores	41
45302	Venta de partes, piezas y accesorios usados para veh�culos automotores	41
45401	Venta de motocicletas	41
45402	Venta de repuestos, piezas y accesorios de motocicletas	41
45403	Mantenimiento y reparaci�n de motocicletas	41
46100	Venta al por mayor a cambio de retribuci�n o por contrata	42
46201	Venta al por mayor de materias primas agr�colas	42
46202	Venta al por mayor de productos de la silvicultura	42
46203	Venta al por mayor de productos pecuarios y de granja	42
46211	Venta de productos para uso agropecuario	42
46291	Venta al por mayor de granos b�sicos (cereales, leguminosas)	42
46292	Venta al por mayor de semillas mejoradas para cultivo	42
46293	Venta al por mayor de caf� oro y uva	42
46294	Venta al por mayor de ca�a de az�ca	42
46295	Venta al por mayor de flores, plantas y otros productos naturales	42
46296	Venta al por mayor de productos agr�colas	42
46297	Venta al por mayor de ganado bovino (vivo)	42
46298	Venta al por mayor de animales porcinos, ovinos, caprino, can�culas, ap�colas, av�colas vivos	42
46299	Venta de otras especies vivas del reino animal	42
46301	Venta al por mayor de alimentos	42
46302	Venta al por mayor de bebidas	42
46303	Venta al por mayor de tabaco	42
46371	Venta al por mayor de frutas, hortalizas (verduras), legumbres y tub�rculos	42
46372	Venta al por mayor de pollos, gallinas destazadas, pavos y otras aves	42
46373	Venta al por mayor de carne bovina y porcina, productos de carne y embutidos	42
46374	Venta al por mayor de huevos	42
46375	Venta al por mayor de productos l�cteos	42
46376	Venta al por mayor de productos farin�ceos de panader�a (pan dulce, cakes, reposter�a, etc.)	42
46377	Venta al por mayor de pastas alimenticias, aceites y grasas comestibles vegetal y animal	42
46378	Venta al por mayor de sal comestible	42
46379	Venta al por mayor de az�car	42
46391	Venta al por mayor de abarrotes (vinos, licores, productos alimenticios envasados, etc.)	42
46392	Venta al por mayor de aguas gaseosas	42
46393	Venta al por mayor de agua purificada	42
46394	Venta al por mayor de refrescos y otras bebidas, l�quidas o en polvo	42
46395	Venta al por mayor de cerveza y licores	42
46396	Venta al por mayor de hielo	42
46411	Venta al por mayor de hilados, tejidos y productos textiles de mercer�a	42
46412	Venta al por mayor de art�culos textiles excepto confecciones para el hogar	42
46413	Venta al por mayor de confecciones textiles para el hogar	42
46414	Venta al por mayor de prendas de vestir y accesorios de vestir	42
46415	Venta al por mayor de ropa usada	42
46416	Venta al por mayor de calzado	42
46417	Venta al por mayor de art�culos de marroquiner�a y talabarter�a	42
46418	Venta al por mayor de art�culos de peleter�a	42
46419	Venta al por mayor de otros art�culos textiles n.c.p.	42
46471	Venta al por mayor de instrumentos musicales	42
46472	Venta al por mayor de colchones, almohadas, cojines, etc.	42
46473	Venta al por mayor de art�culos de aluminio para el hogar y para otros usos	42
46474	Venta al por mayor de dep�sitos y otros art�culos pl�sticos para el hogar y otros usos, incluyendo los desechables de durapax y no desechables	42
46475	Venta al por mayor de c�maras fotogr�ficas, accesorios y materiale	42
46482	Venta al por mayor de medicamentos, art�culos y otros productos de uso veterinario	42
46483	Venta al por mayor de productos y art�culos de belleza y de uso personal	42
46484	Venta de productos farmac�uticos y medicinales	42
46491	Venta al por mayor de productos medicinales, cosm�ticos, perfumer�a y productos de limpieza	42
46492	Venta al por mayor de relojes y art�culos de joyer�a	42
46493	Venta al por mayor de electrodom�sticos y art�culos del hogar excepto bazar; art�culos de iluminaci�n	42
46494	Venta al por mayor de art�culos de bazar y similares	42
46495	Venta al por mayor de art�culos de �ptica	42
46496	Venta al por mayor de revistas, peri�dicos, libros, art�culos de librer�a y art�culos de papel y cart�n en general	42
46497	Venta de art�culos deportivos, juguetes y rodados	42
46498	Venta al por mayor de productos usados para el hogar o el uso personal	42
46499	Venta al por mayor de enseres dom�sticos y de uso personal n.c.p.	42
46500	Venta al por mayor de bicicletas, partes, accesorios y otros	42
46510	Venta al por mayor de computadoras, equipo perif�rico y programas inform�ticos	42
46520	Venta al por mayor de equipos de comunicaci�n	42
46530	Venta al por mayor de maquinaria y equipo agropecuario, accesorios, partes y suministros	42
46590	Venta de equipos e instrumentos de uso profesional y cient�fico y aparatos de medida y control	42
46591	Venta al por mayor de maquinaria equipo, accesorios y materiales para la industria de la madera y sus productos	42
46592	Venta al por mayor de maquinaria, equipo, accesorios y materiales para la industria gr�fica y del papel, cart�n y productos de papel y cart�n	42
46593	Venta al por mayor de maquinaria, equipo, accesorios y materiales para la industria de productos qu�micos, pl�stico y caucho	42
46594	Venta al por mayor de maquinaria, equipo, accesorios y materiales para la industria met�lica y de sus productos	42
46595	Venta al por mayor de equipamiento para uso m�dico, odontol�gico, veterinario y servicios conexos	42
46596	Venta al por mayor de maquinaria, equipo, accesorios y partes para la industria de la alimentaci�n	42
46597	Venta al por mayor de maquinaria, equipo, accesorios y partes para la industria textil, confecciones y cuero	42
46598	Venta al por mayor de maquinaria, equipo y accesorios para la construcci�n y explotaci�n de minas y canteras	42
46599	Venta al por mayor de otro tipo de maquinaria y equipo con sus accesorios y partes	42
46610	Venta al por mayor de otros combustibles s�lidos, l�quidos, gaseosos y de productos conexos	42
46612	Venta al por mayor de combustibles para automotores, aviones, barcos, maquinaria y otros	42
46613	Venta al por mayor de lubricantes, grasas y otros aceites para automotores, maquinaria industrial, etc.	42
46614	Venta al por mayor de gas propano	42
46615	Venta al por mayor de le�a y carb�n	42
46620	Venta al por mayor de metales y minerales metal�feros	42
46631	Venta al por mayor de puertas, ventanas, vitrinas y similares	42
46632	Venta al por mayor de art�culos de ferreter�a y pinturer�as	42
46633	Vidrier�as	42
46634	Venta al por mayor de maderas	42
46639	Venta al por mayor de materiales para la construcci�n n.c.p.	42
46691	Venta al por mayor de sal industrial sin yodar	42
46692	Venta al por mayor de productos intermedios y desechos de origen textil	42
46693	Venta al por mayor de productos intermedios y desechos de origen met�lico	42
46694	Venta al por mayor de productos intermedios y desechos de papel y cart�n	42
46695	Venta al por mayor fertilizantes, abonos, agroqu�micos y productos similares	43
46696	Venta al por mayor de productos intermedios y desechos de origen pl�stic	43
46697	Venta al por mayor de tintas para imprenta, productos curtientes y materias y productos colorantes	43
46698	Venta de productos intermedios y desechos de origen qu�mico y de caucho	43
46699	Venta al por mayor de productos intermedios y desechos ncp	43
46701	Venta de algod�n en oro	43
46900	Venta al por mayor de otros productos	43
46901	Venta al por mayor de cohetes y otros productos pirot�cnicos	43
46902	Venta al por mayor de art�culos diversos para consumo humano	43
46903	Venta al por mayor de armas de fuego, municiones y accesorios	43
46904	Venta al por mayor de toldos y tiendas de campa�a de cualquier material	43
46905	Venta al por mayor de exhibidores publicitarios y r�tulos	43
46906	Venta al por mayor de art�culos promocionales diverso	43
47111	Venta en supermercados	44
47112	Venta en tiendas de art�culos de primera necesidad	44
47119	Almacenes (venta de diversos art�culos)	44
47190	Venta al por menor de otros productos en comercios no especializados	44
47199	Venta de establecimientos no especializados con surtido compuesto principalmente de alimentos, bebidas y tabaco	44
47211	Venta al por menor de frutas y hortalizas	44
47212	Venta al por menor de carnes, embutidos y productos de granja	44
47213	Venta al por menor de pescado y mariscos	44
47214	Venta al por menor de productos l�cteos	44
47215	Venta al por menor de productos de panader�a, reposter�a y galleta	44
47216	Venta al por menor de huevos	44
47217	Venta al por menor de carnes y productos c�rnicos	44
47218	Venta al por menor de granos b�sicos y otros	44
47219	Venta al por menor de alimentos n.c.p.	44
47221	Venta al por menor de hielo	44
47223	Venta de bebidas no alcoh�licas, para su consumo fuera del establecimiento	44
47224	Venta de bebidas alcoh�licas, para su consumo fuera del establecimiento	44
47225	Venta de bebidas alcoh�licas para su consumo dentro del establecimiento	44
47230	Venta al por menor de tabaco	44
47300	Venta de combustibles, lubricantes y otros (gasolineras)	45
47411	Venta al por menor de computadoras y equipo perif�rico	45
47412	Venta de equipo y accesorios de telecomunicaci�n	45
47420	Venta al por menor de equipo de audio y video	45
47510	Venta al por menor de hilados, tejidos y productos textiles de mercer�a; confecciones para el hogar y textiles n.c.p.	45
47521	Venta al por menor de productos de madera	45
47522	Venta al por menor de art�culos de ferreter�a	45
47523	Venta al por menor de productos de pinturer�as	45
47524	Venta al por menor en vidrier�as	45
47529	Venta al por menor de materiales de construcci�n y art�culos conexos	45
47530	Venta al por menor de tapices, alfombras y revestimientos de paredes y pisos en comercios especializados	45
47591	Venta al por menor de muebles	45
47592	Venta al por menor de art�culos de bazar	45
47593	Venta al por menor de aparatos electrodom�sticos, repuestos y accesorios	45
47594	Venta al por menor de art�culos el�ctricos y de iluminaci�n	45
47598	Venta al por menor de instrumentos musicales	45
47610	Venta al por menor de libros, peri�dicos y art�culos de papeler�a en comercios especializados	45
47620	Venta al por menor de discos l�ser, cassettes, cintas de video y otros	45
47630	Venta al por menor de productos y equipos de deporte	45
47631	Venta al por menor de bicicletas, accesorios y repuestos	45
47640	Venta al por menor de juegos y juguetes en comercios especializados	45
47711	Venta al por menor de prendas de vestir y accesorios de vestir	45
47712	Venta al por menor de calzado	45
47713	Venta al por menor de art�culos de peleter�a, marroquiner�a y talabarter�a	45
47721	Venta al por menor de medicamentos farmac�uticos y otros materiales y art�culos de uso m�dico, odontol�gico y veterinario	45
47722	Venta al por menor de productos cosm�ticos y de tocador	45
47731	Venta al por menor de productos de joyer�a, bisuter�a, �ptica, relojer�a	45
47732	Venta al por menor de plantas, semillas, animales y art�culos conexo	45
47733	Venta al por menor de combustibles de uso dom�stico (gas propano y gas licuado)	45
47734	Venta al por menor de artesan�as, art�culos cer�micos y recuerdos en general	45
47735	Venta al por menor de ata�des, l�pidas y cruces, trofeos, art�culos religiosos en general	45
47736	Venta al por menor de armas de fuego, municiones y accesorios	45
47737	Venta al por menor de art�culos de coheter�a y pirot�cnicos	45
47738	Venta al por menor de art�culos desechables de uso personal y dom�stico (servilletas, papel higi�nico, pa�ales, toallas sanitarias, etc.)	45
47739	Venta al por menor de otros productos n.c.p.	45
47741	Venta al por menor de art�culos usados	45
47742	Venta al por menor de textiles y confecciones usados	45
47743	Venta al por menor de libros, revistas, papel y cart�n usados	45
47749	Venta al por menor de productos usados n.c.p.	45
47811	Venta al por menor de frutas, verduras y hortalizas	45
47814	Venta al por menor de productos l�cteos	45
47815	Venta al por menor de productos de panader�a, galletas y similares	45
47816	Venta al por menor de bebidas	45
47818	Venta al por menor en tiendas de mercado y puestos	45
47821	Venta al por menor de hilados, tejidos y productos textiles de mercer�a en puestos de mercados y ferias	45
47822	Venta al por menor de art�culos textiles excepto confecciones para el hogar en puestos de mercados y ferias	45
47823	Venta al por menor de confecciones textiles para el hogar en puestos de mercados y ferias	45
47824	Venta al por menor de prendas de vestir, accesorios de vestir y similares en puestos de mercados y ferias	45
47825	Venta al por menor de ropa usada	45
47826	Venta al por menor de calzado, art�culos de marroquiner�a y talabarter�a en puestos de mercados y ferias	45
47827	Venta al por menor de art�culos de marroquiner�a y talabarter�a en puestos de mercados y ferias	45
47829	Venta al por menor de art�culos textiles ncp en puestos de mercados y ferias	45
47891	Venta al por menor de animales, flores y productos conexos en puestos de feria y mercados	45
47892	Venta al por menor de productos medicinales, cosm�ticos, de tocador y de limpieza en puestos de ferias y mercados	45
47893	Venta al por menor de art�culos de bazar en puestos de ferias y mercados	45
47894	Venta al por menor de art�culos de papel, envases, libros, revistas y conexos en puestos de feria y mercados	45
47895	Venta al por menor de materiales de construcci�n, electrodom�sticos, accesorios para autos y similares en puestos de feria y mercados	45
47896	Venta al por menor de equipos accesorios para las comunicaciones en puestos de feria y mercados	45
47899	Venta al por menor en puestos de ferias y mercados n.c.p.	45
47910	Venta al por menor por correo o Internet	45
47990	Otros tipos de venta al por menor no realizada, en almacenes, puestos de venta o mercado	45
49110	Transporte interurbano de pasajeros por ferrocarril	46
49120	Transporte de carga por ferrocarril	46
49211	Transporte de pasajeros urbanos e interurbano mediante buses	46
49212	Transporte de pasajeros interdepartamental mediante microbuses	46
49213	Transporte de pasajeros urbanos e interurbano mediante microbuses	46
49214	Transporte de pasajeros interdepartamental mediante buses	46
49221	Transporte internacional de pasajeros	46
49222	Transporte de pasajeros mediante taxis y autos con chofer	46
49223	Transporte escolar	46
49225	Transporte de pasajeros para excursiones	46
49226	Servicios de transporte de personal	46
49229	Transporte de pasajeros por v�a terrestre ncp	46
49231	Transporte de carga urbano	46
49232	Transporte nacional de carga	46
49233	Transporte de carga internacional	46
49234	Servicios de mudanza	46
49235	Alquiler de veh�culos de carga con conductor	46
49300	Transporte por oleoducto o gasoducto	46
50110	Transporte de pasajeros mar�timo y de cabotaje	47
50120	Transporte de carga mar�timo y de cabotaje	47
50211	Transporte de pasajeros por v�as de navegaci�n interiore	47
50212	Alquiler de equipo de transporte de pasajeros por v�as de navegaci�n interior con conductor	48
50220	Transporte de carga por v�as de navegaci�n interiores	48
51100	Transporte a�reo de pasajeros	48
51201	Transporte de carga por v�a a�rea	48
51202	Alquiler de equipo de aerotransporte con operadores para el prop�sito de transportar carg	48
52101	Alquiler de instalaciones de almacenamiento en zonas francas	49
52102	Alquiler de silos para conservaci�n y almacenamiento de granos	49
52103	Alquiler de instalaciones con refrigeraci�n para almacenamiento y conservaci�n de alimentos y otros productos	49
52109	Alquiler de bodegas para almacenamiento y dep�sito n.c.p.	49
52211	Servicio de garaje y estacionamiento	49
52212	Servicios de terminales para el transporte por v�a terrestre	49
52219	Servicios para el transporte por v�a terrestre n.c.p.	49
52220	Servicios para el transporte acu�tico	49
52230	Servicios para el transporte a�reo	49
52240	Manipulaci�n de carga	49
52290	Servicios para el transporte ncp	49
52291	Agencias de tramitaciones aduanales	49
53100	Servicios de correo nacional	50
53200	Actividades de correo distintas a las actividades postales nacionales	50
55101	Actividades de alojamiento para estancias cortas	51
55102	Hoteles	51
55200	Actividades de campamentos, parques de veh�culos de recreo y parques de caravanas	51
55900	Alojamiento n.c.p.	51
56101	Restaurantes	52
56106	Pupuser�a	52
56107	Actividades varias de restaurantes	52
56108	Comedores	52
56109	Merenderos ambulantes	52
56210	Preparaci�n de comida para eventos especiales	52
56291	Servicios de provisi�n de comidas por contrato	52
56292	Servicios de concesi�n de cafetines y chalet en empresas e instituciones	52
56299	Servicios de preparaci�n de comidas ncp	52
56301	Servicio de expendio de bebidas en salones y bares	52
56302	Servicio de expendio de bebidas en puestos callejeros, mercados y ferias	52
58110	Edici�n de libros, folletos, partituras y otras ediciones distintas a estas	53
58120	Edici�n de directorios y listas de correos	53
58130	Edici�n de peri�dicos, revistas y otras publicaciones peri�dicas	53
58190	Otras actividades de edici�n	53
58200	Edici�n de programas inform�ticos (software)	53
59110	Actividades de producci�n cinematogr�fica	54
59120	Actividades de post producci�n de pel�culas, videos y programas de televisi�n	54
59130	Actividades de distribuci�n de pel�culas cinematogr�ficas, videos y programas de televisi�n	54
59140	Actividades de exhibici�n de pel�culas cinematogr�ficas y cintas de v�deo	54
59200	Actividades de edici�n y grabaci�n de m�sica	54
61101	Servicio de telefon�a 	55
61102	Servicio de Internet 	55
61103	Servicio de telefon�a fija 	55
61109	Servicio de Internet n.c.p. 	55
61201	Servicios de telefon�a celular 	55
61202	Servicios de Internet inal�mbrico 	55
61209	Servicios de telecomunicaciones inal�mbrico n.c.p.	55
61301	Telecomunicaciones satelitales	55
61309	Comunicaci�n v�a sat�lite n.c.p.	55
61900	Actividades de telecomunicaci�n n.c.p.	55
62010	Programaci�n inform�tica	56
62020	Consultor�as y gesti�n de servicios inform�ticos	56
62090	Otras actividades de tecnolog�a de informaci�n y servicios de computadora	56
63110	Procesamiento de datos y actividades relacionadas	57
63120	Portales WEB	57
63910	Servicios de Agencias de Noticias	57
63990	Otros servicios de informaci�n n.c.p.	57
64110	Servicios provistos por el Banco Central de El salvador	58
64190	Bancos	58
64192	Entidades dedicadas al env�o de remesas	58
64199	Otras entidades financieras	58
64200	Actividades de sociedades de cartera	58
64300	Fideicomisos, fondos y otras fuentes de financiamiento	58
64910	Arrendamientos financieros	58
64920	Asociaciones cooperativas de ahorro y cr�dito dedicadas a la intermediaci�n financiera	58
64921	Instituciones emisoras de tarjetas de cr�dito y otros	58
64922	Tipos de cr�dito ncp	58
64928	Prestamistas y casas de empe�o	58
64990	Actividades de servicios financieros, excepto la financiaci�n de planes de seguros y de pensiones n.c.p.	58
65110	Planes de seguros de vida	59
65120	Planes de seguro excepto de vida	59
65199	Seguros generales de todo tipo	59
65200	Planes se seguro	59
65300	Planes de pensiones	59
66110	Administraci�n de mercados financieros (Bolsa de Valores)	60
66120	Actividades burs�tiles (Corredores de Bolsa)	60
66190	Actividades auxiliares de la intermediaci�n financiera ncp	60
66210	Evaluaci�n de riesgos y da�os	60
66220	Actividades de agentes y corredores de seguros	60
66290	Otras actividades auxiliares de seguros y fondos de pensiones	60
66300	Actividades de administraci�n de fondos	60
68101	Servicio de alquiler y venta de lotes en cementerios	61
68109	Actividades inmobiliarias realizadas con bienes propios o arrendados n.c.p.	61
68200	Actividades Inmobiliarias Realizadas a Cambio de una Retribuci�n o por Contrata	61
69100	Actividades jur�dicas	62
69200	Actividades de contabilidad, tenedur�a de libros y auditor�a; asesoramiento en materia de impuestos	62
70100	Actividades de oficinas centrales de sociedades de cartera	63
70200	Actividades de consultor�a en gesti�n empresarial	63
71101	Servicios de arquitectura y planificaci�n urbana y servicios conexos	64
71102	Servicios de ingenier�a	64
71103	Servicios de agrimensura, topograf�a, cartograf�a, prospecci�n y geof�sica y servicios conexos	64
71200	Ensayos y an�lisis t�cnicos	64
72100	Investigaciones y desarrollo experimental en el campo de las ciencias naturales y la ingenier�a	65
72199	Investigaciones cient�ficas	65
72200	Investigaciones y desarrollo experimental en el campo de las ciencias sociales y las humanidades cient�fica y desarrollo	65
73100	Publicidad	66
73200	Investigaci�n de mercados y realizaci�n de encuestas de opini�n p�blica	67
74100	Actividades de dise�o especializado	68
74200	Actividades de fotograf�a	68
74900	Servicios profesionales y cient�ficos ncp	68
75000	Actividades veterinarias	69
77101	Alquiler de equipo de transporte terrestre	70
77102	Alquiler de equipo de transporte acu�tico	70
77103	Alquiler de equipo de transporte por v�a a�rea	70
77210	Alquiler y arrendamiento de equipo de recreo y deportivo	70
77220	Alquiler de cintas de video y discos	70
77290	Alquiler de otros efectos personales y enseres dom�sticos	70
77300	Alquiler de maquinaria y equipo	70
77400	Arrendamiento de productos de propiedad intelectual	70
78100	Obtenci�n y dotaci�n de personal	71
78200	Actividades de las agencias de trabajo temporal	71
78300	Dotaci�n de recursos humanos y gesti�n; gesti�n de las funciones de recursos humanos	71
79110	Actividades de agencias de viajes y organizadores de viajes; actividades de asistencia a turistas	72
79120	Actividades de los operadores tur�sticos	72
79900	Otros servicios de reservas y actividades relacionadas	72
80100	Servicios de seguridad privados	73
80201	Actividades de servicios de sistemas de seguridad	73
80202	Actividades para la prestaci�n de sistemas de seguridad	73
80300	Actividades de investigaci�n	73
81100	Actividades combinadas de mantenimiento de edificios e instalaciones	74
81210	Limpieza general de edificios	74
81290	Otras actividades combinadas de mantenimiento de edificios e instalaciones ncp	74
81300	Servicio de jardiner�a	74
82110	Servicios administrativos de oficinas	75
82190	Servicio de fotocopiado y similares, excepto en imprentas	75
82200	Actividades de las centrales de llamadas (call center)	75
82300	Organizaci�n de convenciones y ferias de negocios	75
82910	Actividades de agencias de cobro y oficinas de cr�dito	75
82921	Servicios de envase y empaque de productos alimenticios	75
82922	Servicios de envase y empaque de productos medicinales	75
82929	Servicio de envase y empaque ncp	75
82990	Actividades de apoyo empresariales ncp	75
85101	Guarder�a educativa	76
85102	Ense�anza preescolar o parvularia	76
85104	Servicio de educaci�n preescolar y primaria integrada	76
85211	Ense�anza secundaria tercer ciclo (7�, 8� y 9�)	76
85212	Ense�anza secundaria de formaci�n general bachillerato	76
85221	Ense�anza secundaria de formaci�n t�cnica y profesional	76
85222	Ense�anza secundaria de formaci�n t�cnica y profesional integrada con ense�anza primaria	76
85301	Ense�anza superior universitaria	76
85302	Ense�anza superior no universitari	76
85303	Ense�anza superior integrada a educaci�n secundaria y/o primaria	76
85410	Educaci�n deportiva y recreativa	76
85420	Educaci�n cultural	76
85490	Otros tipos de ense�anza n.c.p.	76
85499	Ense�anza formal	76
85500	Servicios de apoyo a la ense�anza	76
86100	Actividades de hospitales	77
86201	Cl�nicas m�dicas	77
86202	Servicios de Odontolog�a	77
86203	Servicios m�dicos	77
86901	Servicios de an�lisis y estudios de diagn�stico	77
86902	Actividades de atenci�n de la salud humana	77
86909	Otros Servicio relacionados con la salud ncp	77
87100	Residencias de ancianos con atenci�n de enfermer�a	78
87200	Instituciones dedicadas al tratamiento del retraso mental, problemas de salud mental y el uso indebido de sustancias nocivas	78
87300	Instituciones dedicadas al cuidado de ancianos y discapacitados	78
87900	Actividades de asistencia a ni�os y j�venes	78
87901	Otras actividades de atenci�n en instituciones	78
88100	Actividades de asistencia sociales sin alojamiento para ancianos y discapacitados	79
88900	Servicios sociales sin alojamiento ncp	79
90000	Actividades creativas art�sticas y de esparcimiento	80
91010	Actividades de bibliotecas y archivos	81
91020	Actividades de museos y preservaci�n de lugares y edificios hist�ricos	81
91030	Actividades de jardines bot�nicos, zool�gicos y de reservas naturale	81
92000	Actividades de juegos y apuestas	82
93110	Gesti�n de instalaciones deportivas	83
93120	Actividades de clubes deportivos	83
93190	Otras actividades deportivas	83
93210	Actividades de parques de atracciones y parques tem�ticos	83
93291	Discotecas y salas de baile	83
93298	Centros vacacionales	83
93299	Actividades de esparcimiento ncp	83
94110	Actividades de organizaciones empresariales y de empleadores	84
94120	Actividades de organizaciones profesionales	84
94200	Actividades de sindicatos	84
94910	Actividades de organizaciones religiosas	84
94920	Actividades de organizaciones pol�ticas	84
94990	Actividades de asociaciones n.c.p.	84
95110	Reparaci�n de computadoras y equipo perif�rico	85
95120	Reparaci�n de equipo de comunicaci�n	85
95210	Reparaci�n de aparatos electr�nicos de consumo	85
95220	Reparaci�n de aparatos dom�stico y equipo de hogar y jard�n	85
95230	Reparaci�n de calzado y art�culos de cuero	85
95240	Reparaci�n de muebles y accesorios para el hogar	85
95291	Reparaci�n de Instrumentos musicales	85
95292	Servicios de cerrajer�a y copiado de llaves	85
95293	Reparaci�n de joyas y relojes	85
95294	Reparaci�n de bicicletas, sillas de ruedas y rodados n.c.p.	85
95299	Reparaciones de enseres personales n.c.p.	85
96010	Lavado y limpieza de prendas de tela y de piel, incluso la limpieza en seco	86
96020	Peluquer�a y otros tratamientos de belleza	86
96030	Pompas f�nebres y actividades conexas	86
96091	Servicios de sauna y otros servicios para la est�tica corporal n.c.p.	86
96092	Servicios n.c.p.	86
97000	Actividad de los hogares en calidad de empleadores de personal dom�stico	87
98100	Actividades indiferenciadas de producci�n de bienes de los hogares privados para uso propio	88
98200	Actividades indiferenciadas de producci�n de servicios de los hogares privados para uso propio	88
99000	Actividades de organizaciones y �rganos extraterritoriales	90
\.


--
-- Data for Name: cat020; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.cat020 (codigo, valor) FROM stdin;
9300	EL SALVADOR
9303	AFGANIST�N
9304	ALAN
9306	ALBANIA
9309	ALEMANIA OCCID
9310	ALEMANIA ORIENT
9311	ALEMANIA
9315	ALTO VOLTA
9317	ANDORRA
9318	ANGOLA
9319	ANTIG Y BARBUDA
9320	ANGUILA
9324	ARABIA SAUDITA
9327	ARGELIA
9330	ARGENTIN
9332	ARUBA
9333	AUSTRALIA
9336	AUSTRIA
9338	AZERBAIY�N
9339	BANGLADESH
9342	BAHR�IN
9345	BARBADOS
9348	B�LGICA
9349	BELICE
9350	BEN�N
9353	BIELORRUSIA
9354	BIRMANIA
9357	BOLIVIA
9359	BOSNIA Y HERZEGOVINA
9360	BOTSWANA
9363	BRASIL
9366	BRUN�I
9369	BULGARIA
9371	BURKINA FASO
9372	BURUNDI
9374	BOPHUTHATSWANA
9375	BUT�N
9376	CABINDA
9377	CABO VERDE
9378	CAMBOYA
9381	CAMER�N
9384	CANAD�
9387	CEIL�N
9390	CTRO AFRIC REP
9393	COLOMBIA
9394	COMORAS-ISLAS
9396	CONGO REP DEL
9399	CONGO REP DEMOC
9402	COREA NORTE
9405	COREA SUR
9408	COSTA DE MARFIL
9411	COSTA RICA
9414	CUBA
9415	CURAZAO
9417	CHAD
9420	CHECOSLOVAQUIA
9423	CHILE
9426	CHINA REP POPUL
9432	CHIPRE
9435	DAHOMEY
9438	DINAMARCA
9439	DJIBOUTI
9440	DOMINICA
9441	DOMINICANA REP
9444	ECUADOR
9446	EMIRAT ARAB UNI
9447	ESPA�A
9449	ESLOVAQUIA
9450	EE UU
9451	ESLOVENIA
9452	WALLIS Y FUTUNA
9453	ETIOPIA
9454	ERITREA
9456	FIJI-ISLAS
9457	ESTONIA
9459	FILIPINAS
9462	FINLANDIA
9465	FRANCIA
9468	GAB�N
9471	GAMBIA
9472	GEORGIA
9474	GHANA
9477	GIBRALTAR
9480	GRECIA
9481	GRENADA
9482	GROENLANDIA
9483	GUATEMALA
9486	GUINEA
9487	GUYANA
9489	GUADALUPE
9490	GUAM
9491	GUAYANA FRANCESA
9492	GUERNSEY
9493	GUINEA ECUATORIAL
9494	GUINEA-BISSAU
9495	HAIT�
9498	HOLANDA
9501	HONDURAS
9504	HONG KONG
9507	HUNGR�A
9510	INDIA
9513	INDONESIA
9514	INGLATERRA Y GALES
9516	IRAK
9519	IR�N
9521	ISLA DE MA
9522	IRLANDA
9523	ISLA DE NAVIDAD
9524	ISLA DE COCOS
9525	ISLANDIA
9526	ISLAS SALOM�N
9527	ISLAS COOK
9528	ISRAEL
9529	ISLAS FEROE
9530	ISLAS AZORES
9531	ITALIA
9532	ISLA QESHM
9533	ISLAS MALVINAS
9534	JAMAICA
9535	ISLAS MARIANAS DEL NORTE
9536	ISLAS MARSHALL
9537	JAP�N
9538	ISLAS PITCAIM
9539	ISLAS TURCAS Y CAICOS
9540	JORDANIA
9541	KASAKISTAN
9542	ISLAS ULTRAMARINAS DE EE UU
9543	KENIA
9544	KIRIBATI
9545	ISLAS V�RGENES ESTADOUNIDENSES
9546	KUWAIT
9547	JERSEY
9548	KIRGUIST�N
9549	LAOS
9551	LETONIA
9552	LESOTHO
9555	L�BANO
9558	LIBERIA
9561	LIBIA
9564	LIECHTENSTEIN
9565	LITUANIA
9567	LUXEMBURGO
9568	MACAO
9570	MADAGASCAR
9571	MACEDONIA
9573	MALASIA
9574	MALI
9576	MALAWI
9577	MALDIVAS
9579	MALI
9582	MALTA
9585	MARRUECOS
9591	MASCATE Y OM�N
9594	MAURICIO
9597	MAURITANIA
9598	MAYOTTE
9600	M�XICO
9601	MICRONESIA
9602	MOLDAVIA
9603	M�NACO
9606	MONGOLIA
9607	MONTENEGRO
9608	MONSERRAT
9609	MOZAMBIQUE
9610	NAMIBIA
9611	NAURU
9612	NEPAL
9615	NICARAGUA
9618	N�GER
9621	NIGERIA
9622	NIUE
9623	NORFOLK
9624	NORUEGA
9627	NVA CALEDONIA
9633	NVA ZELANDIA
9636	NUEVAS HEBRIDAS
9638	PAPUA NV GUINEA
9639	PAKIST�N
9640	PALESTINA
9641	CROACIA
9642	PANAM�
9643	PALAOS
9645	PARAGUAY
9648	PER�
9651	POLONIA
9652	POLINESIA FRANCESA
9654	PORTUGAL
9660	QATAR EL
9663	REINO UNIDO
9664	REPUBLICA CHECA
9666	EGIPTO
9667	REUNI�N
9669	RODESI
9672	RUANDA
9673	REPUBLICA DE ARMENIA
9675	RUMANIA
9676	SAHARA OCCIDENTAL
9677	SAN MARINO
9678	SAMOA OCCID
9679	SAINT KITTS AND NEVIS
9680	SANTA LUCIA
9681	SENEGAL
9682	SAOTOME Y PRINC
9683	SN VIC Y GRENAD
9684	SIERRA LEONA
9685	SAMOA AMERICANA
9686	SAN PEDRO Y MIQUEL�N
9687	SINGAPUR
9688	SANTA ELENA
9689	SERBIA
9690	SIRIA
9691	SEYCHELLES
9692	SVALBARD Y JAN MAYEN
9693	SOMALIA
9696	SUD�FRICA REP
9699	SUDAN
9702	SUECIA
9705	SUIZA
9706	SURINAM
9707	SRI LANKA
9708	SUECILANDIA
9709	TAYIKIST�N
9711	TAILANDIA
9712	TERRITORIO BRIT�NICO DEL OC�ANO INDICO
9713	TERRITORIOS AUSTRALES FRANCESES
9714	TANZANIA
9715	TERRITORIOS PALESTINOS
9716	TIMOR ORIENTAL
9717	TOGO
9718	TOKELAU
9719	TURKMENIST�N
9720	TRINIDAD TOBAGO
9722	TONGA
9723	T�NEZ
9725	TRANSKEI
9726	TURQU�A
9727	TUVALU
9729	UGANDA
9732	U R S S
9733	RUSIA
9735	URUGUAY
9736	UCRANIA
9737	UZBEKIST�N
9738	VATICANO
9739	VANUATU
9740	VENDA
9741	VENEZUELA
9744	VIETNAM NORTE
9746	VIETNAM
9747	VIETNAM SUR
9750	YEMEN SUR RE
9751	YIBUTI
9756	YUGOSLAVIA
9758	ZAIRE
9759	ZAMBIA
9760	ZIMBABWE
9850	PUERTO RICO
9862	BAHAMAS
9863	BERMUDAS
9865	MARTINICA
9886	NUEVA GUINEA
9887	ISLAS GRAN CAIM�N
9888	SAN MAARTEN
9897	ISLAS V�RGENES BRIT�NICAS
9898	ANT HOLANDESAS
9899	TAIW�N
9900	DELAWARE (USA)
9901	NEVADA (USA)
9902	WYOMING (USA)
9903	CAMPIONE DITALIA, ITALIA
9904	FLORIDA (USA)
9905	DAKOTA DEL SUR (USA)
9906	TEXAS (USA)
9907	WASHINGTON (USA)
9999	No definido en migraci�n
\.


--
-- Data for Name: cat021; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.cat021 (codigo, valor) FROM stdin;
1	Emisor
2	Receptor
3	M�dico (solo aplica para contribuyentes obligados a la presentaci�n de  F-958)
4	Transporte (solo aplica para Factura de exportaci�n)
\.


--
-- Data for Name: cat022; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.cat022 (codigo, valor) FROM stdin;
2	Carnet de Residente
13	DUI
36	NIT
37	Pasaporte
\.


--
-- Data for Name: cat023; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.cat023 (codigo, valor) FROM stdin;
01	Factura Electr�nico
03	Comprobante de Cr�dito Fiscal Electr�nico
04	Nota de Remisi�n Electr�nica
05	Nota de Cr�dito Electr�nica
06	Nota de D�bito Electr�nica
11	Factura de Exportaci�n Electr�nica
14	Factura de Sujeto Excluido Electr�nica
\.


--
-- Data for Name: cat024; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.cat024 (codigo, valor) FROM stdin;
1	Error en la Informaci�n del Documento Tributario Electr�nico a invalidar.
2	Rescindir de la operaci�n realizada.
3	Otro
\.


--
-- Data for Name: cat025; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.cat025 (codigo, valor) FROM stdin;
01	Dep�sito
02	Propiedad
03	Consignaci�n
04	Traslado
05	Otros
\.


--
-- Data for Name: cat026; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.cat026 (codigo, valor) FROM stdin;
1	Efectivo
2	Bien
3	Servicio
\.


--
-- Data for Name: cat027; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.cat027 (codigo, valor) FROM stdin;
02	Mar�tima de Acajutla
03	A�rea Monse�or �scar Arnulfo Romero
04	Terrestre Las Chinamas
05	Terrestre La Hachadura
06	Terrestre Santa Ana
07	Terrestre San Crist�bal
08	Terrestre Anguiat�
09	Terrestre El Amatillo
10	Mar�tima La Uni�n (Puerto Cutuco)
11	Terrestre El Poy
12	Aduana Terrestre Metal�o
15	Fardos Postales
16	Z.F. San Marcos
17	Z.F. El Pedregal
18	Z.F. San Bartolo
20	Z.F. Exportsalva
21	Z.F. American Park
23	Z.F. Internacional
24	Z.F. Diez
26	Z.F. Miramar
27	Z.F. Santo Tomas
28	Z.F. Santa Tecla
29	Z.F. Santa Ana
30	Z.F. La Concordia
31	A�rea Ilopango
32	Z.F. Pipil
33	Puerto Barillas
34	Z.F. Calvo Conservas
35	Feria Internacional
36	Delg. Aduana El Papal�n
37	Z.F. Parque Industrial Sam-Li
38	Z.F. San Jos�
39	Z.F. Las Mercedes
71	Almacenes De Desarrollo (Aldesa)
72	Almac. Gral. Dep. Occidente (Agdosa)
73	Bodega General De Dep�sito (Bodesa)
76	DHL
77	Transauto (Santa Elena)
80	Almacenadora Nejapa, S.a. de C.V
81	Almacenadora Almaconsa S.A. De C.V.
83	Alm.Gral. Dep�sito Occidente (Apopa)
99	San Bartolo Env�o Hn/Gt
\.


--
-- Data for Name: cat028; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.cat028 (codigo, valor) FROM stdin;
EX-1.1000.000	Exportaci�n Definitiva, Exportaci�n Definitiva, R�gimen Com�n
EX-1.1040.000	Exportaci�n Definitiva, Exportaci�n Definitiva Sustituci�n de Mercanc�as, R�gimen Com�n
EX-1.1041.020	Exportaci�n Definitiva, Exportaci�n Definitiva Proveniente de Franquicia Provisional, Franq. Presidenciales exento de DAI
EX-1.1041.021	Exportaci�n Definitiva, Exportaci�n Definitiva Proveniente de Franquicia Provisional, Franq. Presidenciales exento de DAI e IVA
EX-1.1048.025	Exportaci�n Definitiva, Exportaci�n Definitiva Proveniente de Franquicia Definitiva, Maquinaria y Equipo LZF. DPA
EX-1.1048.031	Exportaci�n Definitiva, Exportaci�n Definitiva Proveniente de Franquicia Definitiva, Distribuci�n Internacional
EX-1.1048.032	Exportaci�n Definitiva, Exportaci�n Definitiva Proveniente. de Franquicia Definitiva, Operaciones Internacionales de Log�stica
EX-1.1048.033	Exportaci�n Definitiva, Exportaci�n Definitiva Proveniente de Franquicia Definitiva, Centro Internacional de llamadas (Call Center)
EX-1.1048.034	Exportaci�n Definitiva, Exportaci�n Definitiva Proveniente de Franquicia Definitiva, Tecnolog�as de Informaci�n LSI
EX-1.1048.035	Exportaci�n Definitiva, Exportaci�n Definitiva Proveniente de Franquicia Definitiva, Investigaci�n y Desarrollo LSI
EX-1.1048.036	Exportaci�n Definitiva, Exportaci�n Definitiva Proveniente de Franquicia Definitiva, Reparaci�n y Mantenimiento de Embarcaciones Mar�timas LSI
EX-1.1048.037	Exportaci�n Definitiva, Exportaci�n Definitiva Proveniente de Franquicia Definitiva, Reparaci�n y Mantenimiento de Aeronaves LSI
EX-1.1048.038	Exportaci�n Definitiva, Exportaci�n Definitiva Proveniente de Franquicia Definitiva, Procesos Empresariales LSI
EX-1.1048.039	Exportaci�n Definitiva, Exportaci�n Definitiva Proveniente de Franquicia Definitiva, Servicios Medico-Hospitalarios LSI
EX-1.1048.040	Exportaci�n Definitiva, Exportaci�n Definitiva Proveniente de Franquicia Definitiva, Servicios Financieros Internacionales LSI
EX-1.1048.043	Exportaci�n Definitiva, Exportaci�n Definitiva Proveniente de Franquicia Definitiva, Reparaci�n y Mantenimiento de Contenedores LSI
EX-1.1048.044	Exportaci�n Definitiva, Exportaci�n Definitiva Proveniente de Franquicia Definitiva, Reparaci�n de Equipos Tecnol�gicos LS
EX-1.1048.054	Exportaci�n Definitiva, Exportaci�n Definitiva Proveniente de Franquicia Definitiva, Atenci�n Ancianos y Convalecientes LSI
EX-1.1048.055	Exportaci�n Definitiva, Exportaci�n Definitiva Proveniente de Franquicia Definitiva, Telemedicina LSI
EX-1.1048.056	Exportaci�n Definitiva, Exportaci�n Definitiva Proveniente de Franquicia Definitiva, Cinematograf�a LSI
EX-1.1052.000	Exportaci�n Definitiva, Exportaci�n Definitiva de DPA con origen en Compras Locales, R�gimen Com�n
EX-1.1054.000	Exportaci�n Definitiva, Exportaci�n Definitiva de Zona Franca con origen en Compras Locales, R�gimen Com�n
EX-1.1100.000	Exportaci�n Definitiva, Exportaci�n Definitiva de Env�os de Socorro, R�gimen Com�n
EX-1.1200.000	Exportaci�n Definitiva, Exportaci�n Definitiva de Env�os Postales, R�gimen Com�n
EX-1.1300.000	Exportaci�n Definitiva, Exportaci�n Definitiva Env�os que requieren despacho urgente, R�gimen Com�n
EX-1.1400.000	Exportaci�n Definitiva, Exportaci�n Definitiva Courier, R�gimen Com�n
EX-1.1400.011	Exportaci�n Definitiva, Exportaci�n Definitiva Courier, Muestras Sin Valor Comercial
EX-1.1400.012	Exportaci�n Definitiva, Exportaci�n Definitiva Courier, Material Publicitario
EX-1.1400.017	Exportaci�n Definitiva, Exportaci�n Definitiva Courier, Declaraci�n de Documentos
EX-1.1500.000	Exportaci�n Definitiva, Exportaci�n Definitiva Menaje de casa, R�gimen Com�n
EX-2.2100.000	Exportaci�n Temporal, Exportaci�n Temporal para Perfeccionamiento Pasivo, R�gimen Com�n
EX-2.2200.000	Exportaci�n Temporal, Exportaci�n Temporal con Reimportaci�n en el mismo estado, R�gimen Com�n
EX-3.3050.000	Re-Exportaci�n, Reexportaci�n Proveniente de Importaci�n Temporal, R�gimen Com�n
EX-3.3051.000	Re-Exportaci�n, Reexportaci�n Proveniente de Tiendas Libres, R�gimen Com�n
EX-3.3052.000	Re-Exportaci�n, Reexportaci�n Proveniente de Admisi�n Temporal para Perfeccionamiento Activo, R�gimen Com�n
EX-3.3053.000	Re-Exportaci�n, Reexportaci�n Proveniente de Admisi�n Temporal, R�gimen Com�n
EX-3.3054.000	Re-Exportaci�n, Reexportaci�n Proveniente de R�gimen de Zona Franca, R�gimen Com�n
EX-3.3055.000	Re-Exportaci�n, Reexportaci�n Proveniente de Admisi�n Temporal para Perfeccionamiento Activo con Garant�a, R�gimen Com�n
EX-3.3056.000	Re-Exportaci�n, Reexportaci�n Proveniente de Admisi�n Temporal Distribuci�n Internacional Parque de Servicios, R�gimen Com�n
EX-3.3056.057	Re-Exportaci�n, Reexportaci�n Proveniente de Admisi�n Temporal Distribuci�n Internacional Parque de Servicios, Remisi�n entre Usuarios Directos del Mismo Parque de Servicios
EX-3.3056.058	Re-Exportaci�n, Reexportaci�n Proveniente de Admisi�n Temporal Distribuci�n Internacional Parque de Servicios, Remisi�n entre Usuarios Directos de Diferente Parque de Servicios
EX-3.3056.072	Re-Exportaci�n, Reexportaci�n Proveniente de Admisi�n Temporal Distribuci�n Internacional Parque de Servicios, Decreto 738 El�ctricos e H�bridos
EX-3.3057.000	Re-Exportaci�n, Reexportaci�n Proveniente de Admisi�n Temporal Operaciones Internacional de Log�stica Parque de Servicios, R�gimen Com�n
EX-3.3057.057	Re-Exportaci�n, Reexportaci�n Proveniente de Admisi�n Temporal Operaciones Internacional de Log�stica Parque de Servicios, Remisi�n entre Usuarios Directos del Mismo Parque de Servicios
EX-3.3057.058	Re-Exportaci�n, Reexportaci�n Proveniente de Admisi�n Temporal Operaciones Internacional de Log�stica Parque de Servicios, Remisi�n entre Usuarios Directos de Diferente Parque de Servicios
EX-3.3058.033	Re-Exportaci�n, Reexportaci�n Proveniente de Admisi�n Temporal Centro Servicio LSI, Centro Internacional de llamadas (Call Center)
EX-3.3058.036	Re-Exportaci�n, Reexportaci�n Proveniente de Admisi�n Temporal Centro Servicio LSI, Reparaci�n y Mantenimiento de Embarcaciones Mar�timas LSI
EX-3.3058.037	Re-Exportaci�n, Reexportaci�n Proveniente de Admisi�n Temporal Centro Servicio LSI, Reparaci�n y Mantenimiento de Aeronaves LSI
EX-3.3058.043	Re-Exportaci�n, Reexportaci�n Proveniente de Admisi�n Temporal Centro Servicio LSI, Reparaci�n y Mantenimiento de Contenedores LSI
EX-3.3059.000	Re-Exportaci�n, Reexportaci�n Proveniente de Admisi�n Temporal Reparaci�n de Equipo Tecnol�gico Parque de Servicios, R�gimen Com�n
EX-3.3059.057	Re-Exportaci�n, Reexportaci�n Proveniente de Admisi�n Temporal Reparaci�n de Equipo Tecnol�gico Parque de Servicios, Remisi�n entre Usuarios Directos del Mismo Parque de Servicios
EX-3.3059.058	Re-Exportaci�n, Reexportaci�n Proveniente de Admisi�n Temporal Reparaci�n de Equipo Tecnol�gico Parque de Servicios, Remisi�n entre Usuarios Directos de Diferente Parque de Servicios
EX-3.3070.000	Re-Exportaci�n, Reexportaci�n Proveniente de Dep�sito., R�gimen Com�n
EX-3.3070.072	Re-Exportaci�n, Reexportaci�n Proveniente de Dep�sito., Decreto 738 El�ctricos e H�bridos
\.


--
-- Data for Name: cat029; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.cat029 (codigo, valor) FROM stdin;
1	Persona Natural
2	Persona Juridica
\.


--
-- Data for Name: cat030; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.cat030 (codigo, valor) FROM stdin;
1	Terrestre
2	Mar�timo
3	A�reo
4	Multimodal, Terrestre-mar�timo
5	Multimodal, Terrestre-a�reo
6	Multimodal, Mar�timo- a�reo
7	Multimodal, Terrestre-Mar�timo- a�reo
\.


--
-- Data for Name: cat031; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.cat031 (codigo, valor) FROM stdin;
01	EXW-En fabrica
02	FCA-Libre transportista
03	CPT-Transporte pagado hasta
04	CIP-Transporte y seguro pagado hasta
05	DAP-Entrega en el lugar
06	DPU-Entregado en el lugar descargado
07	DDP-Entrega con impuestos pagados
08	FAS-Libre al costado del buque
09	FOB-Libre a bordo
10	CFR-Costo y flete
11	CIF- Costo seguro y flete
12	CIF- Costo seguro y flete
13	DAF-Entregada en frontera
14	DES-Entregada sobre duque \\n
15	DEQ-Entregada en muelle
16	DDU- Entregada derechos no pagados
\.


--
-- Data for Name: catalogo_monedas; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.catalogo_monedas (catalogo_monedas_id, nombre, simbolo, fact_conver, por_defecto, idpai) FROM stdin;
\.


--
-- Data for Name: catalogo_monedas_catalogo_monedas_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.catalogo_monedas_catalogo_monedas_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: categoria; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.categoria (id, nombre, codigo, descripcion, tiene_num_serie, tiene_num_lote, categoria_padre_id) FROM stdin;
\.


--
-- Data for Name: categoria_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.categoria_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: centro_costo; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.centro_costo (centro_costo_id, estado, nombre, cod_cuenta, descripcion, saldo_deudor, saldo_acreedor, ctapadre_id, cdp_id, sub_tipo_cuenta_id) FROM stdin;
\.


--
-- Data for Name: centro_costo_centro_costo_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.centro_costo_centro_costo_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: cert_descuento; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.cert_descuento (crtdsc_id, descripcion, estado, cod_cert, fecha_ingreso, desc_efectivo, desc_tarjeta, pass, fecha_final, tipo_prc, auto_aplicable, desc_global, desc_cheque, desc_monto, tipo_mnt, especifico, eval_criterio) FROM stdin;
\.


--
-- Data for Name: cert_descuento_crtdsc_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.cert_descuento_crtdsc_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: cheques; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.cheques (csfcn_cheque_id, monto, estado, ciudad, fech_emi, sgte_no, transc_no, referc, csfcn_id, ctacte_id, cliente_id, proveedor_id) FROM stdin;
\.


--
-- Data for Name: cheques_csfcn_cheque_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.cheques_csfcn_cheque_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.cliente (client_id, nombre, direccion, apellido, tel_fijo, tel_celular, email, dui, nit, num_registro, giro, fecha_nacimiento, genero, tipo_contribuyente, exento, comonosconocio, razon_social, tipo_cliente, estado, medpub_id, clasificacion1, clasificacion2, tipodecliente, categoria, clasificacion, nombre_tar_iva, sucursal_id, nrc, lp_id, vendedor) FROM stdin;
\.


--
-- Data for Name: cliente_client_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.cliente_client_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: compra; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.compra (id, numero_factura, sub_total, fecha_factura, fecha_orden, num_orden, proveedor_id, total, iva, valor_grabado, valor_exento, retencion, percepcion, fov_cotrans, valor_iva, total_fov, usuario_id, tipo_documento, cliente_id, lote, libras_enviadas) FROM stdin;
\.


--
-- Data for Name: compra_cnt; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.compra_cnt (id, total, fecha, iva, numero_documento, comprado_al, tipo_compra, valor_grabado, valor_exento, retencion, percepcion, fov_cotrans, valor_iva, total_fov, usuario_id, proveedor_cnt_id) FROM stdin;
\.


--
-- Data for Name: compra_cnt_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.compra_cnt_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: compras; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.compras (id, codcompra, tipdocumento, fecha, emisor, mes, dteinterno, serie, numerocontrol, codgeneracion, sellovalidacion, tipcompra, tippago) FROM stdin;
\.


--
-- Data for Name: comprobante_dia_ope; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.comprobante_dia_ope (cmpdiop_id, tipo_documento, num_serie_ini, num_serie_fin, num_documento_ini, num_documento_fin, diaope_id, num_documentos) FROM stdin;
\.


--
-- Data for Name: comprobante_dia_ope_cmpdiop_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.comprobante_dia_ope_cmpdiop_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: concepto_movimiento; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.concepto_movimiento (cnm_id, nombre, codigo) FROM stdin;
\.


--
-- Data for Name: concepto_movimiento_cnm_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.concepto_movimiento_cnm_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: config_cod_barras; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.config_cod_barras (cfgbarcode_id, codigo, nombre, num_etiquetas, margen_izquierdo, margen_derecho, margen_inferior, margen_superior, margen_etiquetas, alto_etiqueta, largo_etiqueta, ajuste, intervalo_ajuste) FROM stdin;
\.


--
-- Data for Name: config_cod_barras_cfgbarcode_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.config_cod_barras_cfgbarcode_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: config_ctas_planilla; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.config_ctas_planilla (confg_ctas_pnll_id, nombre, descripcion, tipo_movimiento, cod_parametro, cuentac_id) FROM stdin;
\.


--
-- Data for Name: config_ctas_planilla_confg_ctas_pnll_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.config_ctas_planilla_confg_ctas_pnll_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: config_impresora; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.config_impresora (cfgprt_id, estado, nombre_printer, margen_sup, margen_inf, margen_izq, margen_der, header_izq, header_ctr, header_der, footer_izq, footer_ctr, footer_der, impresion_silenciosa, ajustar_impresion, alto_papel, ancho_papel, tipo_impresora, sucursal_id) FROM stdin;
\.


--
-- Data for Name: config_impresora_cfgprt_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.config_impresora_cfgprt_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: config_notif_servier; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.config_notif_servier (cfgntsrv_id, host, usuario, estado, nombre, contrasena, puerto, tls, ssll) FROM stdin;
\.


--
-- Data for Name: config_notif_servier_cfgntsrv_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.config_notif_servier_cfgntsrv_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: config_planilla; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.config_planilla (confg_pnll_id, formapago, pctj_anualidad, pctj_vacaciones, pctj_quinquenio, pctj_cargar_social, pctj_aguinaldos, pctj_cesantias, redondeo, horas_semanales, pago_xhora, pago_xdia) FROM stdin;
\.


--
-- Data for Name: config_planilla_confg_pnll_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.config_planilla_confg_pnll_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: controlcodigos; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.controlcodigos (id, numerocontrol, codigogeneracion, fechanio) FROM stdin;
1	4000		2024
\.


--
-- Data for Name: correlativo_comprobante; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.correlativo_comprobante (corrcpr_id, estado, tipo_documento, num_actual, num_inicio, num_serie, sucursal_id, num_final, cod_aut_ticket) FROM stdin;
\.


--
-- Data for Name: correlativo_comprobante_corrcpr_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.correlativo_comprobante_corrcpr_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: csfcn_cheque; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.csfcn_cheque (csfcn_cheque_id, cod_csfcn, nombre_csfcn, clscheq_id) FROM stdin;
\.


--
-- Data for Name: csfcn_cheque_csfcn_cheque_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.csfcn_cheque_csfcn_cheque_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: cta_cte; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.cta_cte (ctacte_id, descripcion, no_cta_cte, saldo, sqte_cheque, banco_id, ctacont_id) FROM stdin;
\.


--
-- Data for Name: cta_cte_ctacte_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.cta_cte_ctacte_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: cuenta_cobrar; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.cuenta_cobrar (cxc_id, monto, comentario, estado, comprobante, fecha_ingreso, dias_plazo, fecha_vencimiento, remanente, cliente_id, concepto_id, succxc_id, asiento_id, venta_id, sin_banderas) FROM stdin;
\.


--
-- Data for Name: cuenta_cobrar_cxc_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.cuenta_cobrar_cxc_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: cuenta_contable; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.cuenta_contable (cta_id, nombre, descripcion, cod_cuenta, cod_cuenta_gral, req_nit, saldo_deudor, saldo_acreedor, csfcn_cta, nivel, cifrado_cta, acepta_movs, cod_cuenta_papa, cifrado_sup_cta, naturaleza, ctapadre_id, sub_tipo_cuenta_id, tpocta_id) FROM stdin;
\.


--
-- Data for Name: cuenta_contable_cta_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.cuenta_contable_cta_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: cuenta_pagar; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.cuenta_pagar (cxp_id, monto, comentario, estado, comprobante, fecha_ingreso, dias_plazo, fecha_vencimiento, remanente, asiento_id, concepto_id, proveedor, compra, sucursal, lote) FROM stdin;
\.


--
-- Data for Name: cuenta_pagar_cxp_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.cuenta_pagar_cxp_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: Cuerpodocumento; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.Cuerpodocumento ("identificador", "numeroControl", "codigoGeneracion", "item", "tipoItem", "tipoDonacion", "depreciacion", "tipDTRelacionado", "tipGenDoc", "numDocRelacionado", "fechaGendoc", "cantidad", "codigo", "areafact", "codTributo", "unidadMedida", "descripcion", "precioUnitario", "valorUnitario", "descuentos", "ventasNSujetas", "ventasExentas", "ventasGravadas", "exportaciones", "valorDonado", "ventas", "codigoTributo", "precSugVenta", "CargosAbono", "ivaItem", "montoretencion", "codRetencion", "ivaRetenido", "fechaIni", "fechaFin", "codLiquidacion", "canDocumentos", "valorOpLiq", "valNoPercepcion", "descNoPercepcion", "observacionesItem", "observacionesItems", "subtotal", "ivaOpLiq", "montoSinIva", "ivaPercibido", "comision", "porcComision", "IvaComision", "ValorLiqPagar", "valorLetras", "sacosEsp") FROM stdin;
27	DTE-03-CMPV0202-000000000003973	6438505D-BE64-46CC-A7A7-120DDC80B6FF	1	3			\N	\N		\N	200	1372	IT		59	Azucar 1/2 Kilo	0.50		0.00	0.00	0.00	0	0.00	0.00	0.508407	20	0.508407	0.00	13.22	0.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
28	DTE-03-CMPV0202-000000000003973	6438505D-BE64-46CC-A7A7-120DDC80B6FF	1	3			\N	\N		\N	40	1390	IT		59	Azucar 2.5 Kilos	2.48		0.00	0.00	0.00	0	0.00	0.00	2.488496	20	2.488496	0.00	12.94	0.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
29	DTE-03-CMPV0202-000000000003974	C6D0A5BA-29A2-4A46-B17B-624E8A2EABB3	1	3			\N	\N		\N	200	1372	IT		59	Azucar 1/2 Kilo	0.50		0.00	0.00	0.00	100	0.00	0.00	0.508407	20	0.508407	0.00	13.22	0.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
30	DTE-03-CMPV0202-000000000003974	C6D0A5BA-29A2-4A46-B17B-624E8A2EABB3	1	3			\N	\N		\N	40	1390	IT		59	Azucar 2.5 Kilos	2.48		0.00	0.00	0.00	199.2	0.00	0.00	2.488496	20	2.488496	0.00	12.94	0.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
31	DTE-03-CMPV0202-000000000003975	7AEE2981-DB26-400B-A33C-755C42E06986	1	3			\N	\N		\N	200	1372	IT		59	Azucar 1/2 Kilo	0.50		0.00	0.00	0.00	100	0.00	0.00	0.508407	20	0.508407	0.00	13.22	0.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
32	DTE-03-CMPV0202-000000000003975	7AEE2981-DB26-400B-A33C-755C42E06986	1	3			\N	\N		\N	40	1390	IT		59	Azucar 2.5 Kilos	2.48		0.00	0.00	0.00	199.2	0.00	0.00	2.488496	20	2.488496	0.00	12.94	0.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
33	DTE-03-CMPV0202-000000000003976	94410371-3B92-46DC-8D4B-5552A0F05122	1	3			\N	\N		\N	200	1372	IT		59	Azucar 1/2 Kilo	0.50		0.00	0.00	0.00	100	0.00	0.00	0.508407	20	0.508407	0.00	13.22	0.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
34	DTE-03-CMPV0202-000000000003976	94410371-3B92-46DC-8D4B-5552A0F05122	1	3			\N	\N		\N	40	1390	IT		59	Azucar 2.5 Kilos	2.48		0.00	0.00	0.00	199.2	0.00	0.00	2.488496	20	2.488496	0.00	12.94	0.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
35	DTE-03-CMPV0202-000000000003977	DE59BC3A-3473-4994-91E6-F11DDB9746D1	1	3			\N	\N		\N	200	1372	IT		59	Azucar 1/2 Kilo	0.50		0.00	0.00	0.00	100	0.00	0.00	0.508407	20	0.508407	0.00	13.22	0.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
36	DTE-03-CMPV0202-000000000003977	DE59BC3A-3473-4994-91E6-F11DDB9746D1	1	3			\N	\N		\N	40	1390	IT		59	Azucar 2.5 Kilos	2.48		0.00	0.00	0.00	199.2	0.00	0.00	2.488496	20	2.488496	0.00	12.94	0.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
37	DTE-03-CMPV0202-000000000003978	F41EC2AA-75DB-4063-BF3F-96BF20A9F0FE	1	3			\N	\N		\N	200	1372	IT		59	Azucar 1/2 Kilo	0.50		0.00	0.00	0.00	100	0.00	0.00	0.508407	20	0.508407	0.00	13.22	0.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
38	DTE-03-CMPV0202-000000000003978	F41EC2AA-75DB-4063-BF3F-96BF20A9F0FE	1	3			\N	\N		\N	40	1390	IT		59	Azucar 2.5 Kilos	2.48		0.00	0.00	0.00	199.2	0.00	0.00	2.488496	20	2.488496	0.00	12.94	0.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
39	DTE-03-CMPV0202-000000000003979	D5A3E5D4-7ED8-495D-B3CF-569D8BA38F57	1	3			\N	\N		\N	200	1372	IT		59	Azucar 1/2 Kilo	0.50		0.00	0.00	0.00	100	0.00	0.00	0.508407	20	0.508407	0.00	13.22	0.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
40	DTE-03-CMPV0202-000000000003979	D5A3E5D4-7ED8-495D-B3CF-569D8BA38F57	1	3			\N	\N		\N	40	1390	IT		59	Azucar 2.5 Kilos	2.48		0.00	0.00	0.00	199.2	0.00	0.00	2.488496	20	2.488496	0.00	12.94	0.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
41	DTE-03-CMPV0202-000000000003980	8EB51F9E-662A-44F2-B5FA-0A0ECB940995	1	3			\N	\N		\N	200	1372	IT		59	Azucar 1/2 Kilo	0.50		0.00	0.00	0.00	100	0.00	0.00	0.508407	20	0.508407	0.00	13.22	0.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
42	DTE-03-CMPV0202-000000000003980	8EB51F9E-662A-44F2-B5FA-0A0ECB940995	1	3			\N	\N		\N	40	1390	IT		59	Azucar 2.5 Kilos	2.48		0.00	0.00	0.00	199.2	0.00	0.00	2.488496	20	2.488496	0.00	12.94	0.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
43	DTE-03-CMPV0202-000000000003981	DD7277CF-28FA-4F15-881F-BF757119E122	0	3			\N	\N		\N	200	1372	IT		59	Azucar 1/2 Kilo	0.50		0.00	0.00	0.00	100	0.00	0.00	0.508407	20	0.508407	0.00	13.22	0.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
44	DTE-03-CMPV0202-000000000003981	DD7277CF-28FA-4F15-881F-BF757119E122	1	3			\N	\N		\N	40	1390	IT		59	Azucar 2.5 Kilos	2.48		0.00	0.00	0.00	199.2	0.00	0.00	2.488496	20	2.488496	0.00	12.94	0.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
45	DTE-03-CMPV0202-000000000003982	17BCBD36-49C2-4CA0-A4A7-69A3C79E3AF5	1	3			\N	\N		\N	200	1372	IT		59	Azucar 1/2 Kilo	0.50		0.00	0.00	0.00	100	0.00	0.00	0.508407	20	0.508407	0.00	13.22	0.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
46	DTE-03-CMPV0202-000000000003982	17BCBD36-49C2-4CA0-A4A7-69A3C79E3AF5	1	3			\N	\N		\N	40	1390	IT		59	Azucar 2.5 Kilos	2.48		0.00	0.00	0.00	199.2	0.00	0.00	2.488496	20	2.488496	0.00	12.94	0.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
47	DTE-03-CMPV0202-000000000003983	2D6B3A42-6375-4BB1-8162-65AB0DBCC585	1	3			\N	\N		\N	200	1372	IT		59	Azucar 1/2 Kilo	0.50		0.00	0.00	0.00	100	0.00	0.00	0.508407	20	0.508407	0.00	13.22	0.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
48	DTE-03-CMPV0202-000000000003983	2D6B3A42-6375-4BB1-8162-65AB0DBCC585	2	3			\N	\N		\N	40	1390	IT		59	Azucar 2.5 Kilos	2.48		0.00	0.00	0.00	199.2	0.00	0.00	2.488496	20	2.488496	0.00	12.94	0.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
49	DTE-03-CMPV0202-000000000003984	564B591C-2DA3-4204-A595-D9A740883E11	1	3			\N	\N		\N	200	1372	IT		59	Azucar 1/2 Kilo	0.50		0.00	0.00	0.00	100	0.00	0.00	0.508407	20	0.508407	0.00	13.22	0.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
50	DTE-03-CMPV0202-000000000003984	564B591C-2DA3-4204-A595-D9A740883E11	2	3			\N	\N		\N	40	1390	IT		59	Azucar 2.5 Kilos	2.48		0.00	0.00	0.00	99.2	0.00	0.00	2.488496	20	2.488496	0.00	12.94	0.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
51	DTE-03-CMPV0202-000000000003985	02420099-5CD5-4F04-B6A3-448BAAF1B30B	1	3			\N	\N		\N	200	1372	IT		59	Azucar 1/2 Kilo	0.50		0.00	0.00	0.00	100	0.00	0.00	0.508407	20	0.508407	0.00	13.22	0.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
52	DTE-03-CMPV0202-000000000003985	02420099-5CD5-4F04-B6A3-448BAAF1B30B	2	3			\N	\N		\N	40	1390	IT		59	Azucar 2.5 Kilos	2.48		0.00	0.00	0.00	99.2	0.00	0.00	2.488496	20	2.488496	0.00	12.94	0.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
53	DTE-03-CMPV0202-000000000003986	43AA7CEF-B070-46F6-89A0-18FEC495CCA8	1	3			\N	\N		\N	200	1372	IT		59	Azucar 1/2 Kilo	0.50		0.00	0.00	0.00	100	0.00	0.00	0.508407	20	0.508407	0.00	13.22	0.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
54	DTE-03-CMPV0202-000000000003986	43AA7CEF-B070-46F6-89A0-18FEC495CCA8	2	3			\N	\N		\N	40	1390	IT		59	Azucar 2.5 Kilos	2.48		0.00	0.00	0.00	99.2	0.00	0.00	2.488496	20	2.488496	0.00	12.94	0.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
55	DTE-03-CMPV0202-000000000003987	5D61675C-260E-44FD-A3BA-57805A5DA2D2	1	3			\N	\N		\N	200	1372	IT		59	Azucar 1/2 Kilo	0.50		0.00	0.00	0.00	100	0.00	0.00	0.508407	20	0.508407	0.00	13.22	0.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
56	DTE-03-CMPV0202-000000000003987	5D61675C-260E-44FD-A3BA-57805A5DA2D2	2	3			\N	\N		\N	40	1390	IT		59	Azucar 2.5 Kilos	2.48		0.00	0.00	0.00	99.2	0.00	0.00	2.488496	20	2.488496	0.00	12.94	0.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
57	DTE-03-CMPV0202-000000000003988	6EB3F012-7404-46C4-908A-6F5175D8CE02	1	3			\N	\N		\N	200	1372	IT		59	Azucar 1/2 Kilo	0.50		0.00	0.00	0.00	100	0.00	0.00	0.508407	20	0.508407	0.00	13.22	0.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
58	DTE-03-CMPV0202-000000000003988	6EB3F012-7404-46C4-908A-6F5175D8CE02	2	3			\N	\N		\N	40	1390	IT		59	Azucar 2.5 Kilos	2.48		0.00	0.00	0.00	99.2	0.00	0.00	2.488496	20	2.488496	0.00	12.94	0.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
59	DTE-03-CMPV0202-000000000003989	9E76C69B-6AF3-41F0-A4BE-8C21E52D7CEB	1	3			\N	\N		\N	200	1372	IT		59	Azucar 1/2 Kilo	0.50		0.00	0.00	0.00	100	0.00	0.00	0.508407	20	0.508407	0.00	13.22	0.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
60	DTE-03-CMPV0202-000000000003989	9E76C69B-6AF3-41F0-A4BE-8C21E52D7CEB	2	3			\N	\N		\N	40	1390	IT		59	Azucar 2.5 Kilos	2.48		0.00	0.00	0.00	99.2	0.00	0.00	2.488496	20	2.488496	0.00	12.94	0.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
61	DTE-03-CMPV0202-000000000003990	8A74DCB8-B243-4C27-9F97-125584B4B103	1	3			\N	\N		\N	200	1372	IT		59	Azucar 1/2 Kilo	0.50		0.00	0.00	0.00	100	0.00	0.00	0.508407	20	0.508407	0.00	13.22	0.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
62	DTE-03-CMPV0202-000000000003990	8A74DCB8-B243-4C27-9F97-125584B4B103	2	3			\N	\N		\N	40	1390	IT		59	Azucar 2.5 Kilos	2.48		0.00	0.00	0.00	99.2	0.00	0.00	2.488496	20	2.488496	0.00	12.94	0.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
63	DTE-03-CMPV0202-000000000003991	584F066E-5FA3-4AEC-80FB-926901353051	1	3			\N	\N		\N	200	1372	IT		59	Azucar 1/2 Kilo	0.50		0.00	0.00	0.00	100	0.00	0.00	0.508407	20	0.508407	0.00	13.22	0.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
64	DTE-03-CMPV0202-000000000003991	584F066E-5FA3-4AEC-80FB-926901353051	2	3			\N	\N		\N	40	1390	IT		59	Azucar 2.5 Kilos	2.48		0.00	0.00	0.00	99.2	0.00	0.00	2.488496	20	2.488496	0.00	12.94	0.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
65	DTE-03-CMPV0202-000000000003992	E9ABB697-938D-4924-A7E7-55C1C7E49AE0	1	3			\N	\N		\N	200	1372	IT		59	Azucar 1/2 Kilo	0.50		0.00	0.00	0.00	100	0.00	0.00	0.508407	20	0.508407	0.00	13.22	0.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
66	DTE-03-CMPV0202-000000000003992	E9ABB697-938D-4924-A7E7-55C1C7E49AE0	2	3			\N	\N		\N	40	1390	IT		59	Azucar 2.5 Kilos	2.48		0.00	0.00	0.00	99.2	0.00	0.00	2.488496	20	2.488496	0.00	12.94	0.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
67	DTE-03-CMPV0202-000000000003993	8C38260B-247F-4A78-B83F-2B76CDA85224	1	3			\N	\N		\N	200	1372	IT		59	Azucar 1/2 Kilo	0.50		0.00	0.00	0.00	100	0.00	0.00	0.508407	20	0.508407	0.00	13.22	0.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
68	DTE-03-CMPV0202-000000000003993	8C38260B-247F-4A78-B83F-2B76CDA85224	2	3			\N	\N		\N	40	1390	IT		59	Azucar 2.5 Kilos	2.48		0.00	0.00	0.00	99.2	0.00	0.00	2.488496	20	2.488496	0.00	12.94	0.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
69	DTE-03-CMPV0202-000000000003994	1EEACAC8-002D-49E9-8E30-253F94D8AFC0	1	3			\N	\N		\N	200	1372	IT		59	Azucar 1/2 Kilo	0.50		0.00	0.00	0.00	100	0.00	0.00	0.508407	20	0.508407	0.00	13.22	0.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
70	DTE-03-CMPV0202-000000000003994	1EEACAC8-002D-49E9-8E30-253F94D8AFC0	2	3			\N	\N		\N	40	1390	IT		59	Azucar 2.5 Kilos	2.48		0.00	0.00	0.00	99.2	0.00	0.00	2.488496	20	2.488496	0.00	12.94	0.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
71	DTE-03-CMPV0202-000000000003995	B0093AF7-3309-4B8D-B839-C0EE01A359D6	1	3			\N	\N		\N	200	1372	IT		59	Azucar 1/2 Kilo	0.50		0.00	0.00	0.00	100	0.00	0.00	0.508407	20	0.508407	0.00	13.22	0.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
72	DTE-03-CMPV0202-000000000003995	B0093AF7-3309-4B8D-B839-C0EE01A359D6	2	3			\N	\N		\N	40	1390	IT		59	Azucar 2.5 Kilos	2.48		0.00	0.00	0.00	99.2	0.00	0.00	2.488496	20	2.488496	0.00	12.94	0.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
73	DTE-01-CMPV0202-000000000003999	A39C6F29-0A6D-4AC6-85EB-132E4C0EDBCF	1	3			\N	\N		\N	1	0100101	CC		01	\N	10.00		0.00	0.00	0.00	10	0.00	0.00	10	20	10.00	0.00	1.15	0.00	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
74	DTE-01-CMPV0202-000000000003999	A39C6F29-0A6D-4AC6-85EB-132E4C0EDBCF	2	3			\N	\N		\N	2	02515181518	CC		01	\N	1.25		0.00	0.00	0.00	2.5	0.00	0.00	2.5	20	1.25	0.00	0.29	0.00	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: dec_ing_emp; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.dec_ing_emp (dedingemp_id, plazo, ctadeding_id, empleado_id, decingsal_id) FROM stdin;
\.


--
-- Data for Name: dec_ing_emp_dedingemp_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.dec_ing_emp_dedingemp_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: dec_ing_sal; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.dec_ing_sal (decingsal_id, monto, tipo, descripcion, cod_dec_ing, obligatoria, es_prctj, ext_carga_social, ext_pres, ext_deduciones, ctamon_id) FROM stdin;
\.


--
-- Data for Name: dec_ing_sal_decingsal_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.dec_ing_sal_decingsal_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: deducciones; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.deducciones (deduccion_id, valorisss, valorafp, valorrenta, valoripsfa, valorissspensiones, periodo_deducciones, anno, mes, dia, total_deducciones, empled_id) FROM stdin;
\.


--
-- Data for Name: dep_ret_cta_cte; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.dep_ret_cta_cte (depretcta_id, monto, tipo, referencia, no_transac, fech_transac, ctacte_id) FROM stdin;
\.


--
-- Data for Name: dep_ret_cta_cte_depretcta_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.dep_ret_cta_cte_depretcta_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: departamento; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.departamento (departamento_id, codigo, nombre, descripcion, ctadepto_id) FROM stdin;
\.


--
-- Data for Name: departamento_departamento_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.departamento_departamento_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: det_cert_descuento; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.det_cert_descuento (detdesc_id, crtdsc_id, producto_id, categoria_id, cliente_id, sucursal_id) FROM stdin;
\.


--
-- Data for Name: det_cert_descuento_detdesc_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.det_cert_descuento_detdesc_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: det_compras; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.det_compras (id, numcontrol, codgeneracion, cantidad, descripcion, precio, item) FROM stdin;
\.


--
-- Data for Name: det_dec_ing; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.det_dec_ing (detdecing_id, dec_id, ing_id) FROM stdin;
\.


--
-- Data for Name: det_dec_ing_detdecing_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.det_dec_ing_detdecing_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: det_devolucion_parcial; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.det_devolucion_parcial (dtdvpa_id, cantidad, costo_unitario, presentacion, cant_presentacion, nums_presentacion, num_lote, unimed_id, inventario_id, devolucion_id) FROM stdin;
\.


--
-- Data for Name: det_devolucion_parcial_dtdvpa_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.det_devolucion_parcial_dtdvpa_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: det_devolucion_proveedor; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.det_devolucion_proveedor (dtdvprov_id, dvprov_id, cantidad, cod_lote, presentacion, cant_presentacion, nums_presentacion, costo_unitario, unimed_id, inventario_id) FROM stdin;
\.


--
-- Data for Name: det_devolucion_proveedor_dtdvprov_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.det_devolucion_proveedor_dtdvprov_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: det_horario; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.det_horario (decingsal_id, dia, fech_entrada, fech_salida, horas_calc, mint_calc, horario_id) FROM stdin;
\.


--
-- Data for Name: det_horario_decingsal_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.det_horario_decingsal_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: det_inventario_tienda; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.det_inventario_tienda (id, id_inv_tienda, id_producto, concepto, existencia, valor, total, lote, unidades) FROM stdin;
\.


--
-- Data for Name: det_inventario_tienda_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.det_inventario_tienda_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: det_list_precios; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.det_list_precios (id, precio_venta, lp_id, prod_id) FROM stdin;
\.


--
-- Data for Name: det_list_precios_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.det_list_precios_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: det_orden_venta; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.det_orden_venta (dov_id, orden_venta, producto_id, cantidad, unidades, presentacion, precio, lote, nums_presentacion, monto) FROM stdin;
\.


--
-- Data for Name: det_orden_venta_dov_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.det_orden_venta_dov_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: det_transferencia_flash; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.det_transferencia_flash (id, costo_unitario, cantidad, t_lote, cant_presentacion, tf_id, producto, presentacion, costo_prod, costo) FROM stdin;
\.


--
-- Data for Name: det_transferencia_flash_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.det_transferencia_flash_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: det_venta_prod_serv; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.det_venta_prod_serv (vtaprsv_id, cantidad, monto, detalle, escondido, venta_id, detalle_resumen, precio_unitario, tipo_venta, producto_id, servicio_id, cantidad_descuento, garantia, abreviatura_uni, costo_mercaderia, presentacion, cant_presentacion, proveedor_id, lote, nums_presentacion) FROM stdin;
\.


--
-- Data for Name: det_venta_prod_serv_vtaprsv_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.det_venta_prod_serv_vtaprsv_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: devolucion_parcial; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.devolucion_parcial (devpar_id, fecha, comentarios, monto_descontado, monto_nuevo, venta_id, movimiento, num_documento, estado, usuario_id, sucursal, tipeo, ajuste_libras) FROM stdin;
\.


--
-- Data for Name: devolucion_parcial_devpar_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.devolucion_parcial_devpar_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: devolucion_proveedor; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.devolucion_proveedor (devprov_id, fecha, comentarios, monto_descontado, monto_nuevo, compra_id, prov_id, movimiento) FROM stdin;
\.


--
-- Data for Name: devolucion_proveedor_devprov_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.devolucion_proveedor_devprov_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: dia_operacion; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.dia_operacion (srvvta_id, fecha, estado, fecha_apertura, fecha_cierre, usrcer_id, usrabi_id, suc_id) FROM stdin;
\.


--
-- Data for Name: dia_operacion_srvvta_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.dia_operacion_srvvta_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: dias_extras; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.dias_extras (id, fecha, empleado, cantidad_dias, empresa) FROM stdin;
\.


--
-- Data for Name: dias_extras_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.dias_extras_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: ejercicio_contable; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.ejercicio_contable (ejercicio_contable_id, estado, fecha_inicio, fecha_finalizacion, longitud_cuenta, catalogo_monedas_id, ctavent_id, ctacomp_id, auto_renovable, emp_id, num_ejercicio) FROM stdin;
\.


--
-- Data for Name: ejercicio_contable_ejercicio_contable_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.ejercicio_contable_ejercicio_contable_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: ejercicio_cuenta_contable; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.ejercicio_cuenta_contable (ejercicio_cuenta_contable_id, saldo_deudor, saldo_acreedor, ejercicio_contable_id, cta_id) FROM stdin;
\.


--
-- Data for Name: ejercicio_cuenta_contable_ejercicio_cuenta_contable_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.ejercicio_cuenta_contable_ejercicio_cuenta_contable_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: emisor; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.emisor (id, "numeroControl", "codigoGeneracion", "nit", "tipoDoc", "numDoc", "ncr", "nombre", "codactEco", "desactEco", "nomComercial", "tipEstablecimiento", "Departamento", "Municipio", "Direccion", "telefono", "correo", "codEstableMH", "codEstable", "codPuntoVentaMH", "codPuntoVenta", "tipoItem", "recintoFiscal", "regExportacion") FROM stdin;
1			0203-311066-001-9			4674-4	COOPERATIVA CUZCACHAPA DE R.L	01632	Servicio de beneficio de caf�	SOCIEDAD COOPERATIVA CHALCHUAPANECA DE PRODUCTORES DE CAFE	02	02	03	CARRETERA A EL COCO, COL CUZCACHAPA CTON. GALEANO.	24527800	cuzcachapa@cuzcachapa.com	\N	\N	\N	\N	1	02	EX-1.1000.000
\.


--
-- Data for Name: empleado; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.empleado (empled_id, estado, nombre, genero, fecha_ingreso, fecha_inicio, nit, direccion, email, forma_pago, apellido, tel_fijo, tel_celular, dui, fecha_nacimiento, periodo, isss, nup, salario_hora, horas, es_fijo, pago_por, anualidad, quinquenio, exclusividad, ser_prof_ex_agui, vacaciones, ser_prof_ex_csta, dias, persona_emergencia, tel_emergencia, licencia, tipo_lic, nombre_afp, categoria_empl, debaja, cotiza_isss, cotiza_afp, depto_id, puesto_trabajo_id, sucursal_id, horario_id, cantidad, fecha_finalizacion, cantidad2, valorisss, valorafp, valorrenta, valoripsfa, valorissspensiones, total_deduciones, cantidad_dias_trabajados, comisiones, bonificaciones, total_ingresos, salario_devengado, ipsfa, isssp, salario, cotiza_ipsfa, cotiza_isss_p, hora_extra_normal, hora_extra_nocturna, anno, mes, dia, estado_planilla, dias_trabajados_indemnizacion, anios_trabajados, neto_recibir, empresa, en_planilla) FROM stdin;
\.


--
-- Data for Name: empleado_empled_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.empleado_empled_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: empresa; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.empresa (empresa_id, codigo, nombre) FROM stdin;
\.


--
-- Data for Name: empresa_empresa_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.empresa_empresa_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: encabezado_en_sa; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.encabezado_en_sa (id, fecha, producto_entrada, movimiento, cant_entrada, pres_entrada, cant_pres_entrada) FROM stdin;
\.


--
-- Data for Name: encabezado_en_sa_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.encabezado_en_sa_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: factura; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.factura (factura_id, total, fecha, tipo_documento, iva, numero_documento, valor_grabado, valor_exento, valor_iva, vendido_al, retencion_percepcion, client_id, usuario_id) FROM stdin;
\.


--
-- Data for Name: factura_factura_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.factura_factura_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: garantia_producto; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.garantia_producto (srvvta_id, estado, nombre, descripcion, referencia, porcentaje, categoria_id) FROM stdin;
\.


--
-- Data for Name: garantia_producto_srvvta_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.garantia_producto_srvvta_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: gastos; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.gastos (id, id_sucursal, fecha, pago_empleada, pago_luz, pago_local, pago_agua, pago_supervisora, renta, reparaciones, varios_limpieza, pago_anticipado_empl, pago_anticipado_supervi, recarga_tel, plastico, pajillas, papel, moto_taxi, comida_gato, libreria, loroco, pitas, pago_vigilante, vasos, parqueo, bolsas, otros, efectivo, total_diario, ganancias, comentarios, combustible, honorarios_contable, honorarios_juridicos, caja_chica, impuestos_iva, imp_pag_cta, impuesto_renta) FROM stdin;
\.


--
-- Data for Name: gastos_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.gastos_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: gastos_imprevistos; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.gastos_imprevistos (id, concepto, monto, id_gastos) FROM stdin;
\.


--
-- Data for Name: historial; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.historial (id, fecha, movimiento, inventario, usuario, detalle) FROM stdin;
\.


--
-- Data for Name: historial_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.historial_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: horarios; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.horarios (detdecing_id, total, descripcion, iden_hor, tipo_horario, horas_domingo, horas_lunes, horas_martes, horas_miercoles, horas_jueves, horas_viernes, horas_sabado, descanso_lunes, descanso_martes, descanso_miercoles, descanso_jueves, descanso_viernes, descanso_sabado, descanso_domingo) FROM stdin;
\.


--
-- Data for Name: horarios_detdecing_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.horarios_detdecing_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: horas_extras; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.horas_extras (he_id, fecha, horas_normal, horas_domingo, horas_feriado, horas_nocturno, emp_he, phe_he, permanente, periodo) FROM stdin;
\.


--
-- Data for Name: horas_extras_he_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.horas_extras_he_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: hrs_act_emp; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.hrs_act_emp (hrsactemp_id, fech_entrada, fech_salida, empd_id, emps_id, act_id) FROM stdin;
\.


--
-- Data for Name: identificacion; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.identificacion (version, "ambDestino", "tipoDoc", "numeroControl", "codigoGeneracion", "modFacturacion", "tipTransmicion", "tipContingencia", "motContingencia", "fecha", "hora", "tipMoneda", "estado") FROM stdin;
3	00	3	DTE-03-CMPV0202-000000000003985	02420099-5CD5-4F04-B6A3-448BAAF1B30B	1	1	\N	\N	2024-03-09	12:37:47	USD	0
3	00	3	DTE-03-CMPV0202-000000000003970	0930B690-67DB-461D-A739-1A5232834D40	1	1	\N	\N	2024-03-09	06:14:28	USD	0
3	00	3	DTE-03-CMPV0202-000000000003963	0F9DB45F-1E98-4573-89FB-F46A322984C3	1	1	\N	\N	2024-03-09	05:59:22	USD	0
3	00	3	DTE-03-CMPV0202-000000000003982	17BCBD36-49C2-4CA0-A4A7-69A3C79E3AF5	1	1	\N	\N	2024-03-09	12:30:52	USD	0
3	00	3	DTE-03-CMPV0202-000000000003994	1EEACAC8-002D-49E9-8E30-253F94D8AFC0	1	1	\N	\N	2024-03-09	01:04:15	USD	0
3	00	3	DTE-03-CMPV0202-000000000003966	29174571-7067-498C-AE55-42E3A8B6BCFB	1	1	\N	\N	2024-03-09	06:03:11	USD	0
3	00	3	DTE-03-CMPV0202-000000000003964	2BC21107-E05D-4F87-A49C-77A444871C49	1	1	\N	\N	2024-03-09	06:00:41	USD	0
3	00	3	DTE-03-CMPV0202-000000000003983	2D6B3A42-6375-4BB1-8162-65AB0DBCC585	1	1	\N	\N	2024-03-09	12:31:32	USD	0
1	00	1	DTE-01-CMPV0202-000000000003996	311DAD68-3A4D-47CF-9DB8-C3C10BB3ABBE	1	1	\N	\N	2024-04-04	11:29:04	USD	0
1	00	1	DTE-01-CMPV0202-000000000003997	36E46640-3A5D-4607-A788-ECF3E7B8B258	1	1	\N	\N	2024-04-04	11:29:31	USD	0
1	00	1	DTE-01-CMPV0202-000000000004000	3F1916EB-FE41-437D-95FD-B29680D0237B	1	1	\N	\N	2024-04-04	11:50:45	USD	0
3	00	3	DTE-03-CMPV0202-000000000003963	4058E0A5-E11E-4981-8DBD-A00F1BAEBEC7	1	1	\N	\N	2024-03-09	06:00:30	USD	0
3	00	3	DTE-03-CMPV0202-000000000003986	43AA7CEF-B070-46F6-89A0-18FEC495CCA8	1	1	\N	\N	2024-03-09	12:40:15	USD	0
3	00	3	DTE-03-CMPV0202-000000000003984	564B591C-2DA3-4204-A595-D9A740883E11	1	1	\N	\N	2024-03-09	12:34:07	USD	0
3	00	3	DTE-03-CMPV0202-000000000003991	584F066E-5FA3-4AEC-80FB-926901353051	1	1	\N	\N	2024-03-09	12:54:19	USD	0
3	00	3	DTE-03-CMPV0202-000000000003987	5D61675C-260E-44FD-A3BA-57805A5DA2D2	1	1	\N	\N	2024-03-09	12:44:01	USD	0
3	00	3	DTE-03-CMPV0202-000000000003973	6438505D-BE64-46CC-A7A7-120DDC80B6FF	1	1	\N	\N	2024-03-09	06:24:57	USD	0
3	00	3	DTE-03-CMPV0202-000000000003988	6EB3F012-7404-46C4-908A-6F5175D8CE02	1	1	\N	\N	2024-03-09	12:46:00	USD	0
1	00	1	DTE-01-CMPV0202-000000000003998	752239A4-5DB8-465D-8C6E-13123DAF86DB	1	1	\N	\N	2024-04-04	11:36:29	USD	0
3	00	3	DTE-03-CMPV0202-000000000003975	7AEE2981-DB26-400B-A33C-755C42E06986	1	1	\N	\N	2024-03-09	06:36:36	USD	0
3	00	3	DTE-03-CMPV0202-000000000003990	8A74DCB8-B243-4C27-9F97-125584B4B103	1	1	\N	\N	2024-03-09	12:51:26	USD	0
3	00	3	DTE-03-CMPV0202-000000000003993	8C38260B-247F-4A78-B83F-2B76CDA85224	1	1	\N	\N	2024-03-09	01:03:42	USD	0
3	00	3	DTE-03-CMPV0202-000000000003980	8EB51F9E-662A-44F2-B5FA-0A0ECB940995	1	1	\N	\N	2024-03-09	12:29:24	USD	0
3	00	3	DTE-03-CMPV0202-000000000003976	94410371-3B92-46DC-8D4B-5552A0F05122	1	1	\N	\N	2024-03-09	06:40:57	USD	0
3	00	3	DTE-03-CMPV0202-000000000003989	9E76C69B-6AF3-41F0-A4BE-8C21E52D7CEB	1	1	\N	\N	2024-03-09	12:47:34	USD	0
3	00	3	DTE-03-CMPV0202-000000000003972	9FB0D8F8-2818-4A41-B0D0-6171273B53E9	1	1	\N	\N	2024-03-09	06:16:34	USD	0
1	00	1	DTE-01-CMPV0202-000000000003999	A39C6F29-0A6D-4AC6-85EB-132E4C0EDBCF	1	1	\N	\N	2024-04-04	11:48:02	USD	0
3	00	3	DTE-03-CMPV0202-000000000003967	A890BEC7-DC27-4B92-90AF-05EC58C92699	1	1	\N	\N	2024-03-09	06:04:14	USD	0
3	00	3	DTE-03-CMPV0202-000000000003995	B0093AF7-3309-4B8D-B839-C0EE01A359D6	1	1	\N	\N	2024-03-09	10:08:50	USD	0
3	00	3	DTE-03-CMPV0202-000000000003965	B4A8EBD6-62C4-4511-8F89-7A1D8FF8F9DF	1	1	\N	\N	2024-03-09	06:00:49	USD	0
3	00	3	DTE-03-CMPV0202-000000000003974	C6D0A5BA-29A2-4A46-B17B-624E8A2EABB3	1	1	\N	\N	2024-03-09	06:30:37	USD	0
3	00	3	DTE-03-CMPV0202-000000000003968	D0D6C203-A842-46E4-A027-9E6B0260CCCC	1	1	\N	\N	2024-03-09	06:04:38	USD	0
3	00	3	DTE-03-CMPV0202-000000000003979	D5A3E5D4-7ED8-495D-B3CF-569D8BA38F57	1	1	\N	\N	2024-03-09	12:25:50	USD	0
3	00	3	DTE-03-CMPV0202-000000000003981	DD7277CF-28FA-4F15-881F-BF757119E122	1	1	\N	\N	2024-03-09	12:30:01	USD	0
3	00	3	DTE-03-CMPV0202-000000000003977	DE59BC3A-3473-4994-91E6-F11DDB9746D1	1	1	\N	\N	2024-03-09	06:41:57	USD	0
3	00	3	DTE-03-CMPV0202-000000000003969	E107BAD3-CAAF-445F-BF4D-CE20703FBEAB	1	1	\N	\N	2024-03-09	06:13:54	USD	0
3	00	3	DTE-03-CMPV0202-000000000003971	E8572C95-53D2-4CB0-B587-AB7FA9DEF1C4	1	1	\N	\N	2024-03-09	06:16:03	USD	0
3	00	3	DTE-03-CMPV0202-000000000003992	E9ABB697-938D-4924-A7E7-55C1C7E49AE0	1	1	\N	\N	2024-03-09	01:00:11	USD	0
3	00	3	DTE-03-CMPV0202-000000000003963	F2A4A92E-2DFE-4AF5-831E-A30EC3E70B86	1	1	\N	\N	2024-03-09	05:59:35	USD	0
3	00	3	DTE-03-CMPV0202-000000000003963	F2FF9703-9CC4-411F-91FE-39F87A3446D0	1	1	\N	\N	2024-03-09	05:58:55	USD	0
3	00	3	DTE-03-CMPV0202-000000000003978	F41EC2AA-75DB-4063-BF3F-96BF20A9F0FE	1	1	\N	\N	2024-03-08	11:56:55	USD	0
\.


--
-- Data for Name: imp_renta; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.imp_renta (imp_renta_id, periodo, tramo, desde, hasta, pctj_aplicar, exceso, qta_fija) FROM stdin;
\.


--
-- Data for Name: imp_renta_imp_renta_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.imp_renta_imp_renta_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: indemnizacion; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.indemnizacion (indemnizacion_id, fecha_ingreso, dias, monto_prestamo, salario, horase_diurnas, horase_nocturnas, "a�os", valorneto, indemnizacion, v_isss, v_afp, valor_renta, total_prestaciones, suma_deducciones, fecha_retiro, pago_salario, empled_id, puesto_trabajo_id, depto_id) FROM stdin;
\.


--
-- Data for Name: indemnizacion_indemnizacion_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.indemnizacion_indemnizacion_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: info_empresa; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.info_empresa (sgrprd_id, estado, nombre, direccion, nit, giro, fax, cod_empresa, nrc, telefono1, telefono2, nombre_comercial, tipo_contribuyente) FROM stdin;
\.


--
-- Data for Name: info_empresa_sgrprd_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.info_empresa_sgrprd_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: ingresos; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.ingresos (ingresos_id, mes, dia, dias_trabajados, cantidad_he_diurnas, horas_extras_diurnas, cantidad_he_nocturnas, horas_extras_nocturnas, comisiones, bonificaciones, periodo_ingresos, anno, total_ingresos, salario_devengado, empled_id, estado) FROM stdin;
\.


--
-- Data for Name: ingresos_ingresos_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.ingresos_ingresos_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: integracion; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.integracion (c1, c2, c3, c4, c5, c6, c7) FROM stdin;
\.


--
-- Data for Name: inventario; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.inventario (id, cantidad_actual, producto_id, sucursal_id) FROM stdin;
\.


--
-- Data for Name: inventario_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.inventario_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: inventario_tienda; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.inventario_tienda (id, id_sucursal, fecha_inicio, fecha_fin, supervisor, encargada, total_lacteos, caja, varios, paletas, saldos, otros_1, exist_actual, remesas, gastos, descuentos, otros_2, total_general, facturas, ganancia, otros, totales, comentarios, diferencia, producto_arruinado, empleado) FROM stdin;
\.


--
-- Data for Name: inventario_tienda_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.inventario_tienda_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: item; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.item (inventario_id, movimiento_id, cantidad, costo_unitario, unimed_id, presentacion, cant_presentacion, tipo_compra, lote, costo_compra, costo) FROM stdin;
\.


--
-- Data for Name: item_lote; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.item_lote (item_lote_id, fecha_ingreso, cantidad, num_serie, precio_compra, fecha_expiracion, cod_lote, inv_id) FROM stdin;
\.


--
-- Data for Name: item_lote_hist; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.item_lote_hist (item_lote_hist_id, num_serie, precio_compra, fecha_expiracion, cod_lote, fecha_salida, precio_venta, razon_salida, inv_id) FROM stdin;
\.


--
-- Data for Name: item_lote_hist_item_lote_hist_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.item_lote_hist_item_lote_hist_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: item_lote_item_lote_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.item_lote_item_lote_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: item_pedido; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.item_pedido (inventario_id, pedido_id, cantidad, costo_unitario) FROM stdin;
\.


--
-- Data for Name: list_precios; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.list_precios (id, codigo, nombre) FROM stdin;
\.


--
-- Data for Name: list_precios_cliente; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.list_precios_cliente (list_precios_id, clientes_client_id) FROM stdin;
\.


--
-- Data for Name: list_precios_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.list_precios_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: log_generacion_rep; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.log_generacion_rep (lggnrep_id, codigo, fecha_generacion, fecha_ini_rep, fecha_fin_rep, num_documento_ant, sucursal_id, id_cmpbr, sin_banderas, num_doc_ini, num_doc_fin, cod_aut_tick, num_doc_act) FROM stdin;
\.


--
-- Data for Name: log_generacion_rep_lggnrep_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.log_generacion_rep_lggnrep_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: lote_producto; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.lote_producto (lote_id, estado, fecha_ingreso, cantidad_actual, cantidad, precio_compra, fecha_expiracion, cod_lote, inv_id, proveedor_id, presentacion, cant_cont, cant_cont_actual, nums_contenedor) FROM stdin;
\.


--
-- Data for Name: lote_producto_lote_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.lote_producto_lote_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: marca; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.marca (id, nombre, descripcion, fecha_registro, prv_prpal_id, prv_sec_id) FROM stdin;
\.


--
-- Data for Name: marca_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.marca_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: medio_notif_prg; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.medio_notif_prg (mdntf_id, email, telefono, prgntf_id, nombre) FROM stdin;
\.


--
-- Data for Name: medio_notif_prg_mdntf_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.medio_notif_prg_mdntf_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: medio_publicidad; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.medio_publicidad (medpub_id, nombre, estado) FROM stdin;
\.


--
-- Data for Name: medio_publicidad_medpub_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.medio_publicidad_medpub_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: menu; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.menu (id, url, visible, estado, orden, menu_padre_id, etiqueta_esp, etiqueta_eng, etiqueta_fre, etiqueta_deu, etiqueta_prt, etiqueta_ita) FROM stdin;
\.


--
-- Data for Name: menu_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.menu_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: menus; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.menus (id, nombre, icono) FROM stdin;
1	Facturacion	fa-calculator
2	Integraciones	fa-sitemap
3	Reporteria	fa-file
4	Inicio Hacienda	fa-key
\.


--
-- Data for Name: movimiento; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.movimiento (id, observacion, tipo_movimiento, razon, fecha, sucursal_id, usuario_id) FROM stdin;
\.


--
-- Data for Name: movimiento_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.movimiento_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: notificacion; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.notificacion (notif_id, codigo, estado, nombre, descripcion) FROM stdin;
\.


--
-- Data for Name: notificacion_correo; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.notificacion_correo (notifeml_id, estado, email, tipo_notificacion, sucursal_id) FROM stdin;
\.


--
-- Data for Name: notificacion_correo_notifeml_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.notificacion_correo_notifeml_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: notificacion_notif_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.notificacion_notif_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: orden_trabajo; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.orden_trabajo (odt_id, estado, fechaingreso, preciolente, tipoaro, modeloaro, coloraro, tamanioaro, precioaro, tipolente, disenolente, materiallente, colorlente, serie, numero, fechaventa, comoseenterodelservicio, esfera_izq, esfera_der, cilindro_izq, cilindro_der, adicion_izq, adicion_der, prima_izq, prima_der, eje_izq, eje_der, prd_aro_id, prd_lnt_id, client_id, sucursal_id, anticipo, prov_aro_id, prov_lnt_id, forma_pago, venta_id) FROM stdin;
\.


--
-- Data for Name: orden_trabajo_odt_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.orden_trabajo_odt_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: orden_venta; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.orden_venta (id, estado, fecha_ingreso, sucursal_id, cliente_id, venta_id, num_orden, monto, num_actual, trasladado, transferencia) FROM stdin;
\.


--
-- Data for Name: orden_venta_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.orden_venta_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: pago_cliente; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.pago_cliente (pgocli_id, monto, tipo, fecha, forma_pago, ordtra_id, cxc_id, cliente_id, vtaprs_id, sucursal_id, sin_banderas) FROM stdin;
\.


--
-- Data for Name: pago_cliente_pgocli_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.pago_cliente_pgocli_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: pago_cuenta_pend; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.pago_cuenta_pend (pcpe_id, monto, comentario, fecha_ingreso, remanente, asiento_id, cxc_id, succxc_id, forma_pago, usr_id, cxp_id, banco, cheque) FROM stdin;
\.


--
-- Data for Name: pago_cuenta_pend_pcpe_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.pago_cuenta_pend_pcpe_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: pago_prestamo_emp; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.pago_prestamo_emp (pago_prestamo_emp_id, remanente, descripcion, monto_abonado, tipo_abono, fecha_abono, prestamo_empleado_id) FROM stdin;
\.


--
-- Data for Name: pago_prestamo_emp_pago_prestamo_emp_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.pago_prestamo_emp_pago_prestamo_emp_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: pais; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.pais (idpai, nombre, iso2, iso3, capital, ref_mapa, gentilicio, moneda) FROM stdin;
\.


--
-- Data for Name: pais_idpai_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.pais_idpai_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: param_cuenta_contable; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.param_cuenta_contable (prctctb_id, nombre, descripcion, tipo_movimiento, cod_parametro, cuentac_id, valor) FROM stdin;
\.


--
-- Data for Name: param_cuenta_contable_prctctb_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.param_cuenta_contable_prctctb_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: param_horas_extras; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.param_horas_extras (param_he_id, valor_normal, valor_domingo, valor_feriado, valor_nocturno, nombre_desc, por_default) FROM stdin;
\.


--
-- Data for Name: param_horas_extras_param_he_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.param_horas_extras_param_he_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: param_planilla; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.param_planilla (param_planilla_id, codigo, nombre, descripcion, valor) FROM stdin;
\.


--
-- Data for Name: param_planilla_param_planilla_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.param_planilla_param_planilla_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: parametro_contable; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.parametro_contable (id, codigo, nombre, descripcion, valor_str, valor_num) FROM stdin;
\.


--
-- Data for Name: parametro_sistema; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.parametro_sistema (parsis_id, codigo, nombre, descripcion, valor) FROM stdin;
\.


--
-- Data for Name: parametro_sistema_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.parametro_sistema_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: parametro_sistema_parsis_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.parametro_sistema_parsis_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: pedido; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.pedido (id, descripcion, fecha_inicio, fecha_finalizado, estado, subtotal, usuario_id, sucursal_id, compra_id, proveedor_id) FROM stdin;
\.


--
-- Data for Name: pedido_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.pedido_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: periodo_contable; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.periodo_contable (percon_id, estado, orden, mes, anio) FROM stdin;
\.


--
-- Data for Name: periodo_contable_percon_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.periodo_contable_percon_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: permiso_empleado; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.permiso_empleado (permiso_empleado_id, motivo, fecha_fin, fecha_ini, num_dias, empled_id, remunerado) FROM stdin;
\.


--
-- Data for Name: permiso_empleado_permiso_empleado_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.permiso_empleado_permiso_empleado_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: peso_bulto; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.peso_bulto (id, compra, bulto, peso) FROM stdin;
\.


--
-- Data for Name: peso_bulto_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.peso_bulto_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: planilla_emp; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.planilla_emp (planilla_id, estado, horas_extras, comision, total_deducciones, total_ingresos, neto_recibir, salario_devengado, dias_trabajados, bonificacion, deduccion_isss, deduccion_afp, deduccion_ipsfa, deduccion_isssp, deduccion_renta, deduccion_prestamos, annop, mesp, diap, periodo_planilla, dii, total_salario_devengado, empled_id, nombre, apellidos, salario_mensual, viaticos, dias_no_aborados, pago_vaca, anticipos, prestamos_empre, prestamos_banco, descuentos, otros, aguinaldo) FROM stdin;
\.


--
-- Data for Name: planilla_emp_planilla_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.planilla_emp_planilla_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: planilla_isss; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.planilla_isss (id, id_empleado, fecha_emision, numero_patronal, salario_devengado, pago_adicional, pago_vacaciones, hrs_jor, dias_rem, dias_vacacion, cod_obs, corr_trabajo) FROM stdin;
\.


--
-- Data for Name: planilla_isss_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.planilla_isss_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: precio_prd_sucursal; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.precio_prd_sucursal (prprsuc_id, costo, prc_normal, prc_mayoreo, sucursal_id, producto_id) FROM stdin;
\.


--
-- Data for Name: precio_prd_sucursal_prprsuc_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.precio_prd_sucursal_prprsuc_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: prestamo_empleado; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.prestamo_empleado (prestamo_empleado_id, monto, estado, remanente, descripcion, fecha_registro, num_pagos, cuota_mensual, fecha_liquidacion, empled_id, referencia, banco, cuota_quincenal, tipo_descuento, tipo_prestamo, prestamo_padre, correlativo) FROM stdin;
\.


--
-- Data for Name: prestamo_empleado_prestamo_empleado_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.prestamo_empleado_prestamo_empleado_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: producto; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.producto (id, nombre, referencia, cantidad_minima, cantidad_maxima, modelo, tiempo_envio, gravable, marca_id, categoria_id, genero, tipo, str_gen_1, str_gen_2, str_gen_3, str_gen_4, num_gen_1, num_gen_2, flag_gen_1, flag_gen_2, flag_gen_3, flag_gen_4, proveedor_id, str_gen_5, exento, no_sujeto, str_gen_6, barcode, unimedpr_id, costo, prc_normal, prc_mayoreo) FROM stdin;
\.


--
-- Data for Name: producto_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.producto_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: productos; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.productos (id, codigo, descripcion, precio, "precioPub", "UnidadMedida", area, "CtaInv", "CtaIng", "CtaGas", "codCobol") FROM stdin;
4491	51101010101	C. S.	0	0	59	EX	0	0	0	7
4492	51101010102	H. G.	0	0	59	EX	0	0	0	7
4493	51101010103	S. H. G.	0	0	59	EX	0	0	0	7
4494	51101010104	Especiales y Gourmet	0	0	59	EX	0	0	0	7
4495	51101010105	Taza Excelencia	0	0	59	EX	0	0	0	7
4496	51101010106	Organicos	0	0	59	EX	0	0	0	7
4497	51101010107	Complemento Ventas Futuro	0	0	59	EX	0	0	0	7
4498	51101010108	Natural Honey y Otros	0	0	59	EX	0	0	0	7
4499	51101010109	C. S. minus	0	0	59	EX	0	0	0	7
4500	51101010110	Rainforest Alliance y Certificados	0	0	59	EX	0	0	0	7
4501	51101010111	Certificados	0	0	59	EX	0	0	0	7
4502	51101010112	Maquilados Taza de Excelencia	0	0	59	EX	0	0	0	7
4503	51101010113	Maquilados Especiales	0	0	59	EX	0	0	0	7
4504	51101010114	Cafe Grano Tostado	0	0	59	EX	0	0	0	7
4505	51101010301	Chingo \\"A\\"	0	0	59	EX	0	0	0	7
4506	51101010302	El Paste	0	0	59	EX	0	0	0	7
4507	51101010303	Chingo \\"B\\"	0	0	59	EX	0	0	0	7
4508	51101010304	C.S.menos	0	0	59	EX	0	0	0	7
4509	51101010305	Neter \\"A\\"	0	0	59	EX	0	0	0	7
4510	51101010306	Neter \\"B\\"	0	0	59	EX	0	0	0	7
4511	51101010404	Pepena y Verde (PV)	0	0	59	EX	0	0	0	7
4512	51101010405	XXXXXXXXXXXXXXX	0	0	59	EX	0	0	0	7
4513	51101010409	Otros Ingresos sobre Cafe	0	0	59	EX	0	0	0	7
4514	51101010410	Exportaciones Cosecha Anterior	0	0	59	EX	0	0	0	7
4762	2	Salarios	0	0	59	SG	0	0	0	6
4763	3	Transporte	0	0	59	SG	0	0	0	6
4764	4	Honorarios	0	0	59	SG	0	0	0	6
4765	7	Dietas	0	0	59	SG	0	0	0	6
4766	5	Mutuos de capital	0	0	59	SG	0	0	0	11
4767	7	Pagos Varios	0	0	59	SG	0	0	0	6
\.


--
-- Data for Name: programacion_notif; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.programacion_notif (prgntf_id, estado, nombre, descripcion, fecha_ini, fecha_fin, tipo_prg, cron_syntax, notif_id, dia_tmp, hora, minuto, intervalo_tmp, nivel_importancia) FROM stdin;
\.


--
-- Data for Name: programacion_notif_prgntf_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.programacion_notif_prgntf_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: proveedor; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.proveedor (id, direccion, email, nit, descripcion, razon_social, nombre_contacto, telefonos, dir_telefono, fax, idpai, codigo, nrc, estado) FROM stdin;
\.


--
-- Data for Name: proveedor_cnt; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.proveedor_cnt (proveedor_cnt_id, codigo, nombre, descripcion, direccion, email, nit, tipo_contribuyente, razon_social, nombre_contacto, telefonos, fax, nrc) FROM stdin;
\.


--
-- Data for Name: proveedor_cnt_proveedor_cnt_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.proveedor_cnt_proveedor_cnt_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: proveedor_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.proveedor_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: puesto_trabajo; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.puesto_trabajo (puesto_trabajo_id, codigo, nombre, descripcion, salario_base_hora) FROM stdin;
\.


--
-- Data for Name: puesto_trabajo_puesto_trabajo_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.puesto_trabajo_puesto_trabajo_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: receptor; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.receptor (id, codigo, "tipDoc", "numDoc", "nit", "ncr", "NomDenominacion", "codActEco", "actEco", "nomComercial", "tipEstablecimiento", "Departamento", "Municipio", "dirComplemento", "codPais", "paisDestino", "domFiscal", "codEstable", "codPuntoVenta", "bienesRemitidos", "tipoReceptor", "telReceptor", "correoReceptor", "granContribuyente", "area", "codCliCobol") FROM stdin;
10	16625396	36	01488087-8	0203-270740-001-8	55652-1	DUCH MARTINEZ JUAN	01271	Cultivo de caf�	DUCH MARTINEZ JUAN	02	02	03	Av. Club de Leones Nte. Chalchuapa.	9300	9300	\N	02	02	\N	1	24440185	sal.tato@gmail.com	S	CC	12
7184	1662539	36	03951200-0	0210-030788-102-2	00	DAVID ALBERTO GARCIA CARDONA	62020	Consultor�as y gesti�n de servicios inform�ticos	DAVID ALBERTO GARCIA CARDONA	01	01	02	Condominios santa lucia E-47 apt-21	9300	9300	\N	\N	\N	\N	\N	77899798	sal.tato@gmail.com	N	SG	12
\.


--
-- Data for Name: receptordocumen; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.receptordocumen ("numeroControl", "codigoGeneracion", "idReceptor", "fecha", "estado", "destino", "cuentaArea", "cuentaVende", "seriefac", "serienumfac", "fechaseriefact") FROM stdin;
DTE-03-CMPV0202-000000000003985	02420099-5CD5-4F04-B6A3-448BAAF1B30B	16625396	2024-03-09	\N	\N	\N	\N	23DS000C	1448	2024-02-24
DTE-03-CMPV0202-000000000003970	0930B690-67DB-461D-A739-1A5232834D40	16625396	2024-03-09	{\\"Nofirmado\\":{\\"identificacion\\":{\\"version\\":\\"3\\",\\"ambiente\\":\\"00\\",\\"tipoDte\\":\\"03\\",\\"numeroControl\\":\\"DTE-03-CMPV0202-000000000003970\\",\\"codigoGeneracion\\":\\"0930B690-67DB-461D-A739-1A5232834D40\\",\\"tipoModelo\\":\\"1\\",\\"tipoOperacion\\":\\"1\\",\\"tipoContingencia\\":\\"\\",\\"fecEmi\\":\\"2024-03-09\\",\\"horEmi\\":\\"06:14:28\\",\\"tipoMoneda\\":\\"USD\\",\\"motivoContin\\":\\"\\"},\\"emisor\\":{\\"nit\\":\\"02033110660019\\",\\"nrc\\":\\"46744\\",\\"nombre\\":\\"COOPERATIVA CUZCACHAPA DE R.L\\",\\"codActividad\\":\\"01632\\",\\"descActividad\\":\\"Servicio de beneficio de caf\\\\u00e9\\",\\"nombreComercial\\":\\"SOCIEDAD COOPERATIVA CHALCHUAPANECA DE PRODUCTORES DE CAFE\\",\\"tipoEstablecimiento\\":\\"02\\",\\"telefono\\":\\"24527800\\",\\"correo\\":\\"cuzcachapa@cuzcachapa.com\\",\\"codEstable\\":\\"\\",\\"codEstableMH\\":\\"\\",\\"codPuntoVentaMH\\":\\"\\",\\"codPuntoVenta\\":\\"\\",\\"direccion\\":{\\"complemento\\":\\"CARRETERA A EL COCO, COL CUZCACHAPA CTON. GALEANO.\\",\\"municipio\\":\\"03\\",\\"departamento\\":\\"02\\"}},\\"documentoRelacionado\\":\\"\\",\\"receptor\\":{\\"nit\\":\\"02100307881022\\",\\"nrc\\":\\"00\\",\\"nombre\\":\\"DAVID ALBERTO GARCIA CARDONA\\",\\"codActividad\\":\\"62020\\",\\"descActividad\\":\\"Consultor\\\\u00edas y gesti\\\\u00f3n de servicios inform\\\\u00e1ticos\\",\\"nombreComercial\\":\\"DAVID ALBERTO GARCIA CARDONA\\",\\"direccion\\":{\\"complemento\\":\\"Condominios santa lucia E-47 apt-21\\",\\"municipio\\":\\"02\\",\\"departamento\\":\\"01\\"},\\"telefono\\":\\"77899798\\",\\"correo\\":\\"sal.tato@gmail.com\\"},\\"otrosDocumentos\\":\\"\\",\\"ventaTercero\\":\\"\\",\\"resumen\\":{\\"totalNoSuj\\":\\"0\\",\\"totalExenta\\":\\"0\\",\\"totalGravada\\":\\"0\\",\\"subTotalVentas\\":\\"0\\",\\"descuNoSuj\\":\\"0\\",\\"descuExenta\\":\\"0\\",\\"descuGravada\\":\\"0\\",\\"porcentajeDescuento\\":\\"0\\",\\"totalDescu\\":\\"0\\",\\"subTotal\\":\\"0\\",\\"ivaRete1\\":\\"0\\",\\"reteRenta\\":\\"0\\",\\"montoTotalOperacion\\":\\"26.16\\",\\"totalNoGravado\\":\\"0\\",\\"totalPagar\\":\\"26.16\\",\\"totalLetras\\":\\"CERO DOLARESS 00\\\\/100\\",\\"saldoFavor\\":\\"0\\",\\"condicionOperacion\\":\\"1\\",\\"ivaPerci1\\":\\"0\\",\\"numPagoElectronico\\":\\"\\",\\"pagos\\":[{\\"codigo\\":\\"01\\",\\"montoPago\\":\\"0\\",\\"referencia\\":\\"\\",\\"plazo\\":\\"01\\",\\"periodo\\":\\"0\\"}],\\"tributos\\":[{\\"codigo\\":\\"20\\",\\"descripcion\\":\\"Impuesto al Valor Agregado 13%\\",\\"valor\\":\\"26.16\\"}]},\\"extension\\":\\"\\",\\"apendice\\":\\"\\"},\\"firmado\\":\\"eyJhbGciOiJSUzUxMiJ9.ewogICJpZGVudGlmaWNhY2lvbiIgOiB7CiAgICAidmVyc2lvbiIgOiAzLAogICAgImFtYmllbnRlIiA6ICIwMCIsCiAgICAidGlwb0R0ZSIgOiAiMDMiLAogICAgIm51bWVyb0NvbnRyb2wiIDogIkRURS0wMy1DTVBWMDIwMi0wMDAwMDAwMDAwMDM5NzAiLAogICAgImNvZGlnb0dlbmVyYWNpb24iIDogIjA5MzBCNjkwLTY3REItNDYxRC1BNzM5LTFBNTIzMjgzNEQ0MCIsCiAgICAidGlwb01vZGVsbyIgOiAxLAogICAgInRpcG9PcGVyYWNpb24iIDogMSwKICAgICJ0aXBvQ29udGluZ2VuY2lhIiA6IG51bGwsCiAgICAiZmVjRW1pIiA6ICIyMDI0LTAzLTA5IiwKICAgICJob3JFbWkiIDogIjA2OjE0OjI4IiwKICAgICJ0aXBvTW9uZWRhIiA6ICJVU0QiLAogICAgIm1vdGl2b0NvbnRpbiIgOiBudWxsCiAgfSwKICAiZW1pc29yIiA6IHsKICAgICJuaXQiIDogIjAyMDMzMTEwNjYwMDE5IiwKICAgICJucmMiIDogIjQ2NzQ0IiwKICAgICJub21icmUiIDogIkNPT1BFUkFUSVZBIENVWkNBQ0hBUEEgREUgUi5MIiwKICAgICJjb2RBY3RpdmlkYWQiIDogIjAxNjMyIiwKICAgICJkZXNjQWN0aXZpZGFkIiA6ICJTZXJ2aWNpbyBkZSBiZW5lZmljaW8gZGUgY2Fmw6kiLAogICAgIm5vbWJyZUNvbWVyY2lhbCIgOiAiU09DSUVEQUQgQ09PUEVSQVRJVkEgQ0hBTENIVUFQQU5FQ0EgREUgUFJPRFVDVE9SRVMgREUgQ0FGRSIsCiAgICAidGlwb0VzdGFibGVjaW1pZW50byIgOiAiMDIiLAogICAgInRlbGVmb25vIiA6ICIyNDUyNzgwMCIsCiAgICAiY29ycmVvIiA6ICJjdXpjYWNoYXBhQGN1emNhY2hhcGEuY29tIiwKICAgICJjb2RFc3RhYmxlIiA6IG51bGwsCiAgICAiY29kRXN0YWJsZU1IIiA6IG51bGwsCiAgICAiY29kUHVudG9WZW50YU1IIiA6IG51bGwsCiAgICAiY29kUHVudG9WZW50YSIgOiBudWxsLAogICAgImRpcmVjY2lvbiIgOiB7CiAgICAgICJjb21wbGVtZW50byIgOiAiQ0FSUkVURVJBIEEgRUwgQ09DTywgQ09MIENVWkNBQ0hBUEEgQ1RPTi4gR0FMRUFOTy4iLAogICAgICAibXVuaWNpcGlvIiA6ICIwMyIsCiAgICAgICJkZXBhcnRhbWVudG8iIDogIjAyIgogICAgfQogIH0sCiAgImN1ZXJwb0RvY3VtZW50byIgOiBbIF0sCiAgImRvY3VtZW50b1JlbGFjaW9uYWRvIiA6IG51bGwsCiAgInJlY2VwdG9yIiA6IHsKICAgICJuaXQiIDogIjAyMTAwMzA3ODgxMDIyIiwKICAgICJucmMiIDogIjAwIiwKICAgICJub21icmUiIDogIkRBVklEIEFMQkVSVE8gR0FSQ0lBIENBUkRPTkEiLAogICAgImNvZEFjdGl2aWRhZCIgOiAiNjIwMjAiLAogICAgImRlc2NBY3RpdmlkYWQiIDogIkNvbnN1bHRvcsOtYXMgeSBnZXN0acOzbiBkZSBzZXJ2aWNpb3MgaW5mb3Jtw6F0aWNvcyIsCiAgICAibm9tYnJlQ29tZXJjaWFsIiA6ICJEQVZJRCBBTEJFUlRPIEdBUkNJQSBDQVJET05BIiwKICAgICJkaXJlY2Npb24iIDogewogICAgICAiY29tcGxlbWVudG8iIDogIkNvbmRvbWluaW9zIHNhbnRhIGx1Y2lhIEUtNDcgYXB0LTIxIiwKICAgICAgIm11bmljaXBpbyIgOiAiMDIiLAogICAgICAiZGVwYXJ0YW1lbnRvIiA6ICIwMSIKICAgIH0sCiAgICAidGVsZWZvbm8iIDogIjc3ODk5Nzk4IiwKICAgICJjb3JyZW8iIDogInNhbC50YXRvQGdtYWlsLmNvbSIKICB9LAogICJvdHJvc0RvY3VtZW50b3MiIDogbnVsbCwKICAidmVudGFUZXJjZXJvIiA6IG51bGwsCiAgInJlc3VtZW4iIDogewogICAgInRvdGFsTm9TdWoiIDogMCwKICAgICJ0b3RhbEV4ZW50YSIgOiAwLAogICAgInRvdGFsR3JhdmFkYSIgOiAwLAogICAgInN1YlRvdGFsVmVudGFzIiA6IDAsCiAgICAiZGVzY3VOb1N1aiIgOiAwLAogICAgImRlc2N1RXhlbnRhIiA6IDAsCiAgICAiZGVzY3VHcmF2YWRhIiA6IDAsCiAgICAicG9yY2VudGFqZURlc2N1ZW50byIgOiAwLAogICAgInRvdGFsRGVzY3UiIDogMCwKICAgICJzdWJUb3RhbCIgOiAwLAogICAgIml2YVJldGUxIiA6IDAsCiAgICAicmV0ZVJlbnRhIiA6IDAsCiAgICAibW9udG9Ub3RhbE9wZXJhY2lvbiIgOiAyNi4xNiwKICAgICJ0b3RhbE5vR3JhdmFkbyIgOiAwLAogICAgInRvdGFsUGFnYXIiIDogMjYuMTYsCiAgICAidG90YWxMZXRyYXMiIDogIkNFUk8gRE9MQVJFU1MgMDAvMTAwIiwKICAgICJzYWxkb0Zhdm9yIiA6IDAsCiAgICAiY29uZGljaW9uT3BlcmFjaW9uIiA6IDEsCiAgICAiaXZhUGVyY2kxIiA6IDAsCiAgICAibnVtUGFnb0VsZWN0cm9uaWNvIiA6ICIiLAogICAgInBhZ29zIiA6IFsgewogICAgICAiY29kaWdvIiA6ICIwMSIsCiAgICAgICJtb250b1BhZ28iIDogMCwKICAgICAgInJlZmVyZW5jaWEiIDogIiIsCiAgICAgICJwbGF6byIgOiAiMDEiLAogICAgICAicGVyaW9kbyIgOiAwCiAgICB9IF0sCiAgICAidHJpYnV0b3MiIDogWyB7CiAgICAgICJjb2RpZ28iIDogIjIwIiwKICAgICAgImRlc2NyaXBjaW9uIiA6ICJJbXB1ZXN0byBhbCBWYWxvciBBZ3JlZ2FkbyAxMyUiLAogICAgICAidmFsb3IiIDogMjYuMTYKICAgIH0gXQogIH0sCiAgImV4dGVuc2lvbiIgOiBudWxsLAogICJhcGVuZGljZSIgOiBudWxsCn0.IjJZY-tdUMFUDN0fA6OdDIBdL6FGMtB5ubEgTENOfjB4B_2noXTc4IUy2g76VTotNmvAvdzxrzsvVGPGl9_rOavlRAS0MBWAL2n0tgjX1LwfV2Ck_ElTJ5v5vkUlOfTRbfOgQeb9H0c3z3Ysvk1I4DSo9T-_KlBeCfoIMpdzsvrAh1Gwj-zify3ZnHSbrB8h0Mz48WN8EU07snFGM_pJ_tJHZFXnsqRhlKYlicQXZeHI4bE6QLYQqC_Ozzq25JcLcjozQv4dIdXull2sbJYOkDQX1ijohleL5hc4ibzEgIZeNu0mQl2Xh6l2TyTrvi36-h4GWnVjnWKEHl4-CauVYQ\\"}	\N	\N	\N	23DS000C	1448	2024-02-24
DTE-03-CMPV0202-000000000003963	0F9DB45F-1E98-4573-89FB-F46A322984C3	16625396	2024-03-09	\N	\N	\N	\N	23DS000C	1448	2024-02-24
DTE-03-CMPV0202-000000000003982	17BCBD36-49C2-4CA0-A4A7-69A3C79E3AF5	16625396	2024-03-09	\N	\N	\N	\N	23DS000C	1448	2024-02-24
DTE-03-CMPV0202-000000000003994	1EEACAC8-002D-49E9-8E30-253F94D8AFC0	16625396	2024-03-09	{\\"Nofirmado\\":{\\"identificacion\\":{\\"version\\":\\"3\\",\\"ambiente\\":\\"00\\",\\"tipoDte\\":\\"03\\",\\"numeroControl\\":\\"DTE-03-CMPV0202-000000000003994\\",\\"codigoGeneracion\\":\\"1EEACAC8-002D-49E9-8E30-253F94D8AFC0\\",\\"tipoModelo\\":\\"1\\",\\"tipoOperacion\\":\\"1\\",\\"tipoContingencia\\":\\"\\",\\"fecEmi\\":\\"2024-03-09\\",\\"horEmi\\":\\"01:04:15\\",\\"tipoMoneda\\":\\"USD\\",\\"motivoContin\\":\\"\\"},\\"emisor\\":{\\"nit\\":\\"02033110660019\\",\\"nrc\\":\\"46744\\",\\"nombre\\":\\"COOPERATIVA CUZCACHAPA DE R.L\\",\\"codActividad\\":\\"01632\\",\\"descActividad\\":\\"Servicio de beneficio de caf\\\\u00e9\\",\\"nombreComercial\\":\\"SOCIEDAD COOPERATIVA CHALCHUAPANECA DE PRODUCTORES DE CAFE\\",\\"tipoEstablecimiento\\":\\"02\\",\\"telefono\\":\\"24527800\\",\\"correo\\":\\"cuzcachapa@cuzcachapa.com\\",\\"codEstable\\":\\"\\",\\"codEstableMH\\":\\"\\",\\"codPuntoVentaMH\\":\\"\\",\\"codPuntoVenta\\":\\"\\",\\"direccion\\":{\\"complemento\\":\\"CARRETERA A EL COCO, COL CUZCACHAPA CTON. GALEANO.\\",\\"municipio\\":\\"03\\",\\"departamento\\":\\"02\\"}},\\"Cuerpodocumento\\":[{\\"numItem\\":\\"1\\",\\"tipoItem\\":\\"3\\",\\"numeroDocumento\\":\\"\\",\\"cantidad\\":\\"200\\",\\"codigo\\":\\"1372\\",\\"codTributo\\":\\"\\",\\"precioUni\\":\\"0.5\\",\\"montoDescu\\":\\"0\\",\\"uniMedida\\":\\"59\\",\\"ventaNoSuj\\":\\"0\\",\\"ventaExenta\\":\\"0\\",\\"ventaGravada\\":\\"100\\",\\"tributos\\":[\\"20\\"],\\"psv\\":\\"0.508407\\",\\"noGravado\\":\\"0\\",\\"descripcion\\":\\"Azucar 1\\\\/2 Kilo\\"},{\\"numItem\\":\\"2\\",\\"tipoItem\\":\\"3\\",\\"numeroDocumento\\":\\"\\",\\"cantidad\\":\\"40\\",\\"codigo\\":\\"1390\\",\\"codTributo\\":\\"\\",\\"precioUni\\":\\"2.48\\",\\"montoDescu\\":\\"0\\",\\"uniMedida\\":\\"59\\",\\"ventaNoSuj\\":\\"0\\",\\"ventaExenta\\":\\"0\\",\\"ventaGravada\\":\\"99.2\\",\\"tributos\\":[\\"20\\"],\\"psv\\":\\"2.488496\\",\\"noGravado\\":\\"0\\",\\"descripcion\\":\\"Azucar 2.5 Kilos\\"}],\\"documentoRelacionado\\":\\"\\",\\"receptor\\":{\\"nit\\":\\"02032707400018\\",\\"nrc\\":\\"556521\\",\\"nombre\\":\\"DUCH MARTINEZ JUAN\\",\\"codActividad\\":\\"01271\\",\\"descActividad\\":\\"Cultivo de caf\\\\u00e9\\",\\"nombreComercial\\":\\"DUCH MARTINEZ JUAN\\",\\"direccion\\":{\\"complemento\\":\\"Av. Club de Leones Nte. Chalchuapa.\\",\\"municipio\\":\\"03\\",\\"departamento\\":\\"02\\"},\\"telefono\\":\\"24440185\\",\\"correo\\":\\"sal.tato@gmail.com\\"},\\"otrosDocumentos\\":\\"\\",\\"ventaTercero\\":\\"\\",\\"resumen\\":{\\"totalNoSuj\\":\\"0\\",\\"totalExenta\\":\\"0\\",\\"totalGravada\\":\\"199.2\\",\\"subTotalVentas\\":\\"199.2\\",\\"descuNoSuj\\":\\"0\\",\\"descuExenta\\":\\"0\\",\\"descuGravada\\":\\"0\\",\\"porcentajeDescuento\\":\\"0\\",\\"totalDescu\\":\\"0\\",\\"subTotal\\":\\"199.2\\",\\"ivaRete1\\":\\"0\\",\\"reteRenta\\":\\"0\\",\\"montoTotalOperacion\\":\\"225.36\\",\\"totalNoGravado\\":\\"0\\",\\"totalPagar\\":\\"225.36\\",\\"totalLetras\\":\\"CIENTO NOVENTA Y NUEVE DOLARESS 20\\\\/100\\",\\"saldoFavor\\":\\"0\\",\\"condicionOperacion\\":\\"1\\",\\"ivaPerci1\\":\\"0\\",\\"numPagoElectronico\\":\\"\\",\\"pagos\\":[{\\"codigo\\":\\"01\\",\\"montoPago\\":\\"199.2\\",\\"referencia\\":\\"\\",\\"plazo\\":\\"01\\",\\"periodo\\":\\"\\"}],\\"tributos\\":[{\\"codigo\\":\\"20\\",\\"descripcion\\":\\"Impuesto al Valor Agregado 13%\\",\\"valor\\":\\"26.16\\"}]},\\"extension\\":\\"\\",\\"apendice\\":\\"\\"},\\"firmado\\":\\"eyJhbGciOiJSUzUxMiJ9.ewogICJpZGVudGlmaWNhY2lvbiIgOiB7CiAgICAidmVyc2lvbiIgOiAzLAogICAgImFtYmllbnRlIiA6ICIwMCIsCiAgICAidGlwb0R0ZSIgOiAiMDMiLAogICAgIm51bWVyb0NvbnRyb2wiIDogIkRURS0wMy1DTVBWMDIwMi0wMDAwMDAwMDAwMDM5OTQiLAogICAgImNvZGlnb0dlbmVyYWNpb24iIDogIjFFRUFDQUM4LTAwMkQtNDlFOS04RTMwLTI1M0Y5NEQ4QUZDMCIsCiAgICAidGlwb01vZGVsbyIgOiAxLAogICAgInRpcG9PcGVyYWNpb24iIDogMSwKICAgICJ0aXBvQ29udGluZ2VuY2lhIiA6IG51bGwsCiAgICAiZmVjRW1pIiA6ICIyMDI0LTAzLTA5IiwKICAgICJob3JFbWkiIDogIjAxOjA0OjE1IiwKICAgICJ0aXBvTW9uZWRhIiA6ICJVU0QiLAogICAgIm1vdGl2b0NvbnRpbiIgOiBudWxsCiAgfSwKICAiZW1pc29yIiA6IHsKICAgICJuaXQiIDogIjAyMDMzMTEwNjYwMDE5IiwKICAgICJucmMiIDogIjQ2NzQ0IiwKICAgICJub21icmUiIDogIkNPT1BFUkFUSVZBIENVWkNBQ0hBUEEgREUgUi5MIiwKICAgICJjb2RBY3RpdmlkYWQiIDogIjAxNjMyIiwKICAgICJkZXNjQWN0aXZpZGFkIiA6ICJTZXJ2aWNpbyBkZSBiZW5lZmljaW8gZGUgY2Fmw6kiLAogICAgIm5vbWJyZUNvbWVyY2lhbCIgOiAiU09DSUVEQUQgQ09PUEVSQVRJVkEgQ0hBTENIVUFQQU5FQ0EgREUgUFJPRFVDVE9SRVMgREUgQ0FGRSIsCiAgICAidGlwb0VzdGFibGVjaW1pZW50byIgOiAiMDIiLAogICAgInRlbGVmb25vIiA6ICIyNDUyNzgwMCIsCiAgICAiY29ycmVvIiA6ICJjdXpjYWNoYXBhQGN1emNhY2hhcGEuY29tIiwKICAgICJjb2RFc3RhYmxlIiA6IG51bGwsCiAgICAiY29kRXN0YWJsZU1IIiA6IG51bGwsCiAgICAiY29kUHVudG9WZW50YU1IIiA6IG51bGwsCiAgICAiY29kUHVudG9WZW50YSIgOiBudWxsLAogICAgImRpcmVjY2lvbiIgOiB7CiAgICAgICJjb21wbGVtZW50byIgOiAiQ0FSUkVURVJBIEEgRUwgQ09DTywgQ09MIENVWkNBQ0hBUEEgQ1RPTi4gR0FMRUFOTy4iLAogICAgICAibXVuaWNpcGlvIiA6ICIwMyIsCiAgICAgICJkZXBhcnRhbWVudG8iIDogIjAyIgogICAgfQogIH0sCiAgImN1ZXJwb0RvY3VtZW50byIgOiBbIHsKICAgICJudW1JdGVtIiA6IDEsCiAgICAidGlwb0l0ZW0iIDogMywKICAgICJudW1lcm9Eb2N1bWVudG8iIDogbnVsbCwKICAgICJjYW50aWRhZCIgOiAyMDAsCiAgICAiY29kaWdvIiA6ICIxMzcyIiwKICAgICJjb2RUcmlidXRvIiA6IG51bGwsCiAgICAicHJlY2lvVW5pIiA6IDAuNSwKICAgICJtb250b0Rlc2N1IiA6IDAsCiAgICAidW5pTWVkaWRhIiA6IDU5LAogICAgInZlbnRhTm9TdWoiIDogMCwKICAgICJ2ZW50YUV4ZW50YSIgOiAwLAogICAgInZlbnRhR3JhdmFkYSIgOiAxMDAsCiAgICAidHJpYnV0b3MiIDogWyAiMjAiIF0sCiAgICAicHN2IiA6IDAuNTA4NDA3LAogICAgIm5vR3JhdmFkbyIgOiAwLAogICAgImRlc2NyaXBjaW9uIiA6ICJBenVjYXIgMS8yIEtpbG8iCiAgfSwgewogICAgIm51bUl0ZW0iIDogMiwKICAgICJ0aXBvSXRlbSIgOiAzLAogICAgIm51bWVyb0RvY3VtZW50byIgOiBudWxsLAogICAgImNhbnRpZGFkIiA6IDQwLAogICAgImNvZGlnbyIgOiAiMTM5MCIsCiAgICAiY29kVHJpYnV0byIgOiBudWxsLAogICAgInByZWNpb1VuaSIgOiAyLjQ4LAogICAgIm1vbnRvRGVzY3UiIDogMCwKICAgICJ1bmlNZWRpZGEiIDogNTksCiAgICAidmVudGFOb1N1aiIgOiAwLAogICAgInZlbnRhRXhlbnRhIiA6IDAsCiAgICAidmVudGFHcmF2YWRhIiA6IDk5LjIsCiAgICAidHJpYnV0b3MiIDogWyAiMjAiIF0sCiAgICAicHN2IiA6IDIuNDg4NDk2LAogICAgIm5vR3JhdmFkbyIgOiAwLAogICAgImRlc2NyaXBjaW9uIiA6ICJBenVjYXIgMi41IEtpbG9zIgogIH0gXSwKICAiZG9jdW1lbnRvUmVsYWNpb25hZG8iIDogbnVsbCwKICAicmVjZXB0b3IiIDogewogICAgIm5pdCIgOiAiMDIwMzI3MDc0MDAwMTgiLAogICAgIm5yYyIgOiAiNTU2NTIxIiwKICAgICJub21icmUiIDogIkRVQ0ggTUFSVElORVogSlVBTiIsCiAgICAiY29kQWN0aXZpZGFkIiA6ICIwMTI3MSIsCiAgICAiZGVzY0FjdGl2aWRhZCIgOiAiQ3VsdGl2byBkZSBjYWbDqSIsCiAgICAibm9tYnJlQ29tZXJjaWFsIiA6ICJEVUNIIE1BUlRJTkVaIEpVQU4iLAogICAgImRpcmVjY2lvbiIgOiB7CiAgICAgICJjb21wbGVtZW50byIgOiAiQXYuIENsdWIgZGUgTGVvbmVzIE50ZS4gQ2hhbGNodWFwYS4iLAogICAgICAibXVuaWNpcGlvIiA6ICIwMyIsCiAgICAgICJkZXBhcnRhbWVudG8iIDogIjAyIgogICAgfSwKICAgICJ0ZWxlZm9ubyIgOiAiMjQ0NDAxODUiLAogICAgImNvcnJlbyIgOiAic2FsLnRhdG9AZ21haWwuY29tIgogIH0sCiAgIm90cm9zRG9jdW1lbnRvcyIgOiBudWxsLAogICJ2ZW50YVRlcmNlcm8iIDogbnVsbCwKICAicmVzdW1lbiIgOiB7CiAgICAidG90YWxOb1N1aiIgOiAwLAogICAgInRvdGFsRXhlbnRhIiA6IDAsCiAgICAidG90YWxHcmF2YWRhIiA6IDE5OS4yLAogICAgInN1YlRvdGFsVmVudGFzIiA6IDE5OS4yLAogICAgImRlc2N1Tm9TdWoiIDogMCwKICAgICJkZXNjdUV4ZW50YSIgOiAwLAogICAgImRlc2N1R3JhdmFkYSIgOiAwLAogICAgInBvcmNlbnRhamVEZXNjdWVudG8iIDogMCwKICAgICJ0b3RhbERlc2N1IiA6IDAsCiAgICAic3ViVG90YWwiIDogMTk5LjIsCiAgICAiaXZhUmV0ZTEiIDogMCwKICAgICJyZXRlUmVudGEiIDogMCwKICAgICJtb250b1RvdGFsT3BlcmFjaW9uIiA6IDIyNS4zNiwKICAgICJ0b3RhbE5vR3JhdmFkbyIgOiAwLAogICAgInRvdGFsUGFnYXIiIDogMjI1LjM2LAogICAgInRvdGFsTGV0cmFzIiA6ICJDSUVOVE8gTk9WRU5UQSBZIE5VRVZFIERPTEFSRVNTIDIwLzEwMCIsCiAgICAic2FsZG9GYXZvciIgOiAwLAogICAgImNvbmRpY2lvbk9wZXJhY2lvbiIgOiAxLAogICAgIml2YVBlcmNpMSIgOiAwLAogICAgIm51bVBhZ29FbGVjdHJvbmljbyIgOiAiIiwKICAgICJwYWdvcyIgOiBbIHsKICAgICAgImNvZGlnbyIgOiAiMDEiLAogICAgICAibW9udG9QYWdvIiA6IDE5OS4yLAogICAgICAicmVmZXJlbmNpYSIgOiAiIiwKICAgICAgInBsYXpvIiA6ICIwMSIsCiAgICAgICJwZXJpb2RvIiA6IG51bGwKICAgIH0gXSwKICAgICJ0cmlidXRvcyIgOiBbIHsKICAgICAgImNvZGlnbyIgOiAiMjAiLAogICAgICAiZGVzY3JpcGNpb24iIDogIkltcHVlc3RvIGFsIFZhbG9yIEFncmVnYWRvIDEzJSIsCiAgICAgICJ2YWxvciIgOiAyNi4xNgogICAgfSBdCiAgfSwKICAiZXh0ZW5zaW9uIiA6IG51bGwsCiAgImFwZW5kaWNlIiA6IG51bGwKfQ.e2qnQZDNVMZ1z_iJTttBVW5ZplR6ewrl-gwKbK2PilaN2UNhMovGx-JtlSVlrZPO-vJ9CqN7Lz8AidAdI1NWznJ8Ay81x1uuYQYn1cT0vcHLQPJFNenrF3SxgEWtOc0H_DThLwNtlZ1zYjU_6O8ZsfL28zex08tidud6m-BxZk6OVvnYt5YxFTjL--byn92K-tr6hCB2X2zV6tk7mrHNjFweQYRb0aHh6jlNtnOk7SMzj-pPgzh6y9C6yHu7sYoRqXjGRSS2TpbWZhVyostzXxlRHpNEbWYBTfIC4tNRRhCs02JpZ7asNMPFSxCFZ--YGzgKMUWQ2QmfpTphnitGNg\\"}	\N	\N	\N	23DS000C	1448	2024-02-24
DTE-03-CMPV0202-000000000003966	29174571-7067-498C-AE55-42E3A8B6BCFB	16625396	2024-03-09	\N	\N	\N	\N	23DS000C	1448	2024-02-24
DTE-03-CMPV0202-000000000003964	2BC21107-E05D-4F87-A49C-77A444871C49	16625396	2024-03-09	\N	\N	\N	\N	23DS000C	1448	2024-02-24
DTE-03-CMPV0202-000000000003983	2D6B3A42-6375-4BB1-8162-65AB0DBCC585	16625396	2024-03-09	\N	\N	\N	\N	23DS000C	1448	2024-02-24
DTE-01-CMPV0202-000000000003996	311DAD68-3A4D-47CF-9DB8-C3C10BB3ABBE	5222	2024-04-04	\N	{\\"destino\\":\\"\\",\\"direccionCli\\":null}	0	0000000	\N	\N	\N
DTE-01-CMPV0202-000000000003997	36E46640-3A5D-4607-A788-ECF3E7B8B258	5222	2024-04-04	\N	{\\"destino\\":\\"\\",\\"direccionCli\\":null}	1110102	0000000	\N	\N	\N
DTE-01-CMPV0202-000000000004000	3F1916EB-FE41-437D-95FD-B29680D0237B	5222	2024-04-04	\N	{\\"destino\\":\\"\\",\\"direccionCli\\":null}	01011011400	0000000	\N	\N	\N
DTE-03-CMPV0202-000000000003963	4058E0A5-E11E-4981-8DBD-A00F1BAEBEC7	16625396	2024-03-09	\N	\N	\N	\N	23DS000C	1448	2024-02-24
DTE-03-CMPV0202-000000000003986	43AA7CEF-B070-46F6-89A0-18FEC495CCA8	16625396	2024-03-09	\N	\N	\N	\N	23DS000C	1448	2024-02-24
DTE-03-CMPV0202-000000000003984	564B591C-2DA3-4204-A595-D9A740883E11	16625396	2024-03-09	\N	\N	\N	\N	23DS000C	1448	2024-02-24
DTE-03-CMPV0202-000000000003991	584F066E-5FA3-4AEC-80FB-926901353051	16625396	2024-03-09	\N	\N	\N	\N	23DS000C	1448	2024-02-24
DTE-03-CMPV0202-000000000003987	5D61675C-260E-44FD-A3BA-57805A5DA2D2	16625396	2024-03-09	\N	\N	\N	\N	23DS000C	1448	2024-02-24
DTE-03-CMPV0202-000000000003973	6438505D-BE64-46CC-A7A7-120DDC80B6FF	16625396	2024-03-09	\N	\N	\N	\N	23DS000C	1448	2024-02-24
DTE-03-CMPV0202-000000000003988	6EB3F012-7404-46C4-908A-6F5175D8CE02	16625396	2024-03-09	\N	\N	\N	\N	23DS000C	1448	2024-02-24
DTE-01-CMPV0202-000000000003998	752239A4-5DB8-465D-8C6E-13123DAF86DB	5222	2024-04-04	\N	{\\"destino\\":\\"\\",\\"direccionCli\\":null}	0	0000000	\N	\N	\N
DTE-03-CMPV0202-000000000003975	7AEE2981-DB26-400B-A33C-755C42E06986	16625396	2024-03-09	\N	\N	\N	\N	23DS000C	1448	2024-02-24
DTE-03-CMPV0202-000000000003990	8A74DCB8-B243-4C27-9F97-125584B4B103	16625396	2024-03-09	\N	\N	\N	\N	23DS000C	1448	2024-02-24
DTE-03-CMPV0202-000000000003993	8C38260B-247F-4A78-B83F-2B76CDA85224	16625396	2024-03-09	{\\"Nofirmado\\":{\\"identificacion\\":{\\"version\\":\\"3\\",\\"ambiente\\":\\"00\\",\\"tipoDte\\":\\"03\\",\\"numeroControl\\":\\"DTE-03-CMPV0202-000000000003993\\",\\"codigoGeneracion\\":\\"8C38260B-247F-4A78-B83F-2B76CDA85224\\",\\"tipoModelo\\":\\"1\\",\\"tipoOperacion\\":\\"1\\",\\"tipoContingencia\\":\\"\\",\\"fecEmi\\":\\"2024-03-09\\",\\"horEmi\\":\\"01:03:42\\",\\"tipoMoneda\\":\\"USD\\",\\"motivoContin\\":\\"\\"},\\"emisor\\":{\\"nit\\":\\"02033110660019\\",\\"nrc\\":\\"46744\\",\\"nombre\\":\\"COOPERATIVA CUZCACHAPA DE R.L\\",\\"codActividad\\":\\"01632\\",\\"descActividad\\":\\"Servicio de beneficio de caf\\\\u00e9\\",\\"nombreComercial\\":\\"SOCIEDAD COOPERATIVA CHALCHUAPANECA DE PRODUCTORES DE CAFE\\",\\"tipoEstablecimiento\\":\\"02\\",\\"telefono\\":\\"24527800\\",\\"correo\\":\\"cuzcachapa@cuzcachapa.com\\",\\"codEstable\\":\\"\\",\\"codEstableMH\\":\\"\\",\\"codPuntoVentaMH\\":\\"\\",\\"codPuntoVenta\\":\\"\\",\\"direccion\\":{\\"complemento\\":\\"CARRETERA A EL COCO, COL CUZCACHAPA CTON. GALEANO.\\",\\"municipio\\":\\"03\\",\\"departamento\\":\\"02\\"}},\\"Cuerpodocumento\\":[{\\"numItem\\":\\"1\\",\\"tipoItem\\":\\"3\\",\\"numeroDocumento\\":\\"\\",\\"cantidad\\":\\"200\\",\\"codigo\\":\\"1372\\",\\"codTributo\\":\\"\\",\\"precioUni\\":\\"0.5\\",\\"montoDescu\\":\\"0\\",\\"uniMedida\\":\\"59\\",\\"ventaNoSuj\\":\\"0\\",\\"ventaExenta\\":\\"0\\",\\"ventaGravada\\":\\"100\\",\\"tributos\\":[\\"20\\"],\\"psv\\":\\"0.508407\\",\\"noGravado\\":\\"0\\",\\"descripcion\\":\\"Azucar 1\\\\/2 Kilo\\"},{\\"numItem\\":\\"2\\",\\"tipoItem\\":\\"3\\",\\"numeroDocumento\\":\\"\\",\\"cantidad\\":\\"40\\",\\"codigo\\":\\"1390\\",\\"codTributo\\":\\"\\",\\"precioUni\\":\\"2.48\\",\\"montoDescu\\":\\"0\\",\\"uniMedida\\":\\"59\\",\\"ventaNoSuj\\":\\"0\\",\\"ventaExenta\\":\\"0\\",\\"ventaGravada\\":\\"99.2\\",\\"tributos\\":[\\"20\\"],\\"psv\\":\\"2.488496\\",\\"noGravado\\":\\"0\\",\\"descripcion\\":\\"Azucar 2.5 Kilos\\"}],\\"documentoRelacionado\\":\\"\\",\\"receptor\\":{\\"nit\\":\\"02032707400018\\",\\"nrc\\":\\"556521\\",\\"nombre\\":\\"DUCH MARTINEZ JUAN\\",\\"codActividad\\":\\"01271\\",\\"descActividad\\":\\"Cultivo de caf\\\\u00e9\\",\\"nombreComercial\\":\\"DUCH MARTINEZ JUAN\\",\\"direccion\\":{\\"complemento\\":\\"Av. Club de Leones Nte. Chalchuapa.\\",\\"municipio\\":\\"03\\",\\"departamento\\":\\"02\\"},\\"telefono\\":\\"24440185\\",\\"correo\\":\\"sal.tato@gmail.com\\"},\\"otrosDocumentos\\":\\"\\",\\"ventaTercero\\":\\"\\",\\"resumen\\":{\\"totalNoSuj\\":\\"0\\",\\"totalExenta\\":\\"0\\",\\"totalGravada\\":\\"199.2\\",\\"subTotalVentas\\":\\"199.2\\",\\"descuNoSuj\\":\\"0\\",\\"descuExenta\\":\\"0\\",\\"descuGravada\\":\\"0\\",\\"porcentajeDescuento\\":\\"0\\",\\"totalDescu\\":\\"0\\",\\"subTotal\\":\\"199.2\\",\\"ivaRete1\\":\\"0\\",\\"reteRenta\\":\\"0\\",\\"montoTotalOperacion\\":\\"225.36\\",\\"totalNoGravado\\":\\"0\\",\\"totalPagar\\":\\"225.36\\",\\"totalLetras\\":\\"CIENTO NOVENTA Y NUEVE DOLARESS 20\\\\/100\\",\\"saldoFavor\\":\\"0\\",\\"condicionOperacion\\":\\"1\\",\\"ivaPerci1\\":\\"0\\",\\"numPagoElectronico\\":\\"\\",\\"pagos\\":[{\\"codigo\\":\\"01\\",\\"montoPago\\":\\"199.2\\",\\"referencia\\":\\"\\",\\"plazo\\":\\"01\\",\\"periodo\\":\\"\\"}],\\"tributos\\":[{\\"codigo\\":\\"20\\",\\"descripcion\\":\\"Impuesto al Valor Agregado 13%\\",\\"valor\\":\\"26.16\\"}]},\\"extension\\":\\"\\",\\"apendice\\":\\"\\"},\\"firmado\\":\\"eyJhbGciOiJSUzUxMiJ9.ewogICJpZGVudGlmaWNhY2lvbiIgOiB7CiAgICAidmVyc2lvbiIgOiAzLAogICAgImFtYmllbnRlIiA6ICIwMCIsCiAgICAidGlwb0R0ZSIgOiAiMDMiLAogICAgIm51bWVyb0NvbnRyb2wiIDogIkRURS0wMy1DTVBWMDIwMi0wMDAwMDAwMDAwMDM5OTMiLAogICAgImNvZGlnb0dlbmVyYWNpb24iIDogIjhDMzgyNjBCLTI0N0YtNEE3OC1CODNGLTJCNzZDREE4NTIyNCIsCiAgICAidGlwb01vZGVsbyIgOiAxLAogICAgInRpcG9PcGVyYWNpb24iIDogMSwKICAgICJ0aXBvQ29udGluZ2VuY2lhIiA6IG51bGwsCiAgICAiZmVjRW1pIiA6ICIyMDI0LTAzLTA5IiwKICAgICJob3JFbWkiIDogIjAxOjAzOjQyIiwKICAgICJ0aXBvTW9uZWRhIiA6ICJVU0QiLAogICAgIm1vdGl2b0NvbnRpbiIgOiBudWxsCiAgfSwKICAiZW1pc29yIiA6IHsKICAgICJuaXQiIDogIjAyMDMzMTEwNjYwMDE5IiwKICAgICJucmMiIDogIjQ2NzQ0IiwKICAgICJub21icmUiIDogIkNPT1BFUkFUSVZBIENVWkNBQ0hBUEEgREUgUi5MIiwKICAgICJjb2RBY3RpdmlkYWQiIDogIjAxNjMyIiwKICAgICJkZXNjQWN0aXZpZGFkIiA6ICJTZXJ2aWNpbyBkZSBiZW5lZmljaW8gZGUgY2Fmw6kiLAogICAgIm5vbWJyZUNvbWVyY2lhbCIgOiAiU09DSUVEQUQgQ09PUEVSQVRJVkEgQ0hBTENIVUFQQU5FQ0EgREUgUFJPRFVDVE9SRVMgREUgQ0FGRSIsCiAgICAidGlwb0VzdGFibGVjaW1pZW50byIgOiAiMDIiLAogICAgInRlbGVmb25vIiA6ICIyNDUyNzgwMCIsCiAgICAiY29ycmVvIiA6ICJjdXpjYWNoYXBhQGN1emNhY2hhcGEuY29tIiwKICAgICJjb2RFc3RhYmxlIiA6IG51bGwsCiAgICAiY29kRXN0YWJsZU1IIiA6IG51bGwsCiAgICAiY29kUHVudG9WZW50YU1IIiA6IG51bGwsCiAgICAiY29kUHVudG9WZW50YSIgOiBudWxsLAogICAgImRpcmVjY2lvbiIgOiB7CiAgICAgICJjb21wbGVtZW50byIgOiAiQ0FSUkVURVJBIEEgRUwgQ09DTywgQ09MIENVWkNBQ0hBUEEgQ1RPTi4gR0FMRUFOTy4iLAogICAgICAibXVuaWNpcGlvIiA6ICIwMyIsCiAgICAgICJkZXBhcnRhbWVudG8iIDogIjAyIgogICAgfQogIH0sCiAgImN1ZXJwb0RvY3VtZW50byIgOiBbIHsKICAgICJudW1JdGVtIiA6IDEsCiAgICAidGlwb0l0ZW0iIDogMywKICAgICJudW1lcm9Eb2N1bWVudG8iIDogbnVsbCwKICAgICJjYW50aWRhZCIgOiAyMDAsCiAgICAiY29kaWdvIiA6ICIxMzcyIiwKICAgICJjb2RUcmlidXRvIiA6IG51bGwsCiAgICAicHJlY2lvVW5pIiA6IDAuNSwKICAgICJtb250b0Rlc2N1IiA6IDAsCiAgICAidW5pTWVkaWRhIiA6IDU5LAogICAgInZlbnRhTm9TdWoiIDogMCwKICAgICJ2ZW50YUV4ZW50YSIgOiAwLAogICAgInZlbnRhR3JhdmFkYSIgOiAxMDAsCiAgICAidHJpYnV0b3MiIDogWyAiMjAiIF0sCiAgICAicHN2IiA6IDAuNTA4NDA3LAogICAgIm5vR3JhdmFkbyIgOiAwLAogICAgImRlc2NyaXBjaW9uIiA6ICJBenVjYXIgMS8yIEtpbG8iCiAgfSwgewogICAgIm51bUl0ZW0iIDogMiwKICAgICJ0aXBvSXRlbSIgOiAzLAogICAgIm51bWVyb0RvY3VtZW50byIgOiBudWxsLAogICAgImNhbnRpZGFkIiA6IDQwLAogICAgImNvZGlnbyIgOiAiMTM5MCIsCiAgICAiY29kVHJpYnV0byIgOiBudWxsLAogICAgInByZWNpb1VuaSIgOiAyLjQ4LAogICAgIm1vbnRvRGVzY3UiIDogMCwKICAgICJ1bmlNZWRpZGEiIDogNTksCiAgICAidmVudGFOb1N1aiIgOiAwLAogICAgInZlbnRhRXhlbnRhIiA6IDAsCiAgICAidmVudGFHcmF2YWRhIiA6IDk5LjIsCiAgICAidHJpYnV0b3MiIDogWyAiMjAiIF0sCiAgICAicHN2IiA6IDIuNDg4NDk2LAogICAgIm5vR3JhdmFkbyIgOiAwLAogICAgImRlc2NyaXBjaW9uIiA6ICJBenVjYXIgMi41IEtpbG9zIgogIH0gXSwKICAiZG9jdW1lbnRvUmVsYWNpb25hZG8iIDogbnVsbCwKICAicmVjZXB0b3IiIDogewogICAgIm5pdCIgOiAiMDIwMzI3MDc0MDAwMTgiLAogICAgIm5yYyIgOiAiNTU2NTIxIiwKICAgICJub21icmUiIDogIkRVQ0ggTUFSVElORVogSlVBTiIsCiAgICAiY29kQWN0aXZpZGFkIiA6ICIwMTI3MSIsCiAgICAiZGVzY0FjdGl2aWRhZCIgOiAiQ3VsdGl2byBkZSBjYWbDqSIsCiAgICAibm9tYnJlQ29tZXJjaWFsIiA6ICJEVUNIIE1BUlRJTkVaIEpVQU4iLAogICAgImRpcmVjY2lvbiIgOiB7CiAgICAgICJjb21wbGVtZW50byIgOiAiQXYuIENsdWIgZGUgTGVvbmVzIE50ZS4gQ2hhbGNodWFwYS4iLAogICAgICAibXVuaWNpcGlvIiA6ICIwMyIsCiAgICAgICJkZXBhcnRhbWVudG8iIDogIjAyIgogICAgfSwKICAgICJ0ZWxlZm9ubyIgOiAiMjQ0NDAxODUiLAogICAgImNvcnJlbyIgOiAic2FsLnRhdG9AZ21haWwuY29tIgogIH0sCiAgIm90cm9zRG9jdW1lbnRvcyIgOiBudWxsLAogICJ2ZW50YVRlcmNlcm8iIDogbnVsbCwKICAicmVzdW1lbiIgOiB7CiAgICAidG90YWxOb1N1aiIgOiAwLAogICAgInRvdGFsRXhlbnRhIiA6IDAsCiAgICAidG90YWxHcmF2YWRhIiA6IDE5OS4yLAogICAgInN1YlRvdGFsVmVudGFzIiA6IDE5OS4yLAogICAgImRlc2N1Tm9TdWoiIDogMCwKICAgICJkZXNjdUV4ZW50YSIgOiAwLAogICAgImRlc2N1R3JhdmFkYSIgOiAwLAogICAgInBvcmNlbnRhamVEZXNjdWVudG8iIDogMCwKICAgICJ0b3RhbERlc2N1IiA6IDAsCiAgICAic3ViVG90YWwiIDogMTk5LjIsCiAgICAiaXZhUmV0ZTEiIDogMCwKICAgICJyZXRlUmVudGEiIDogMCwKICAgICJtb250b1RvdGFsT3BlcmFjaW9uIiA6IDIyNS4zNiwKICAgICJ0b3RhbE5vR3JhdmFkbyIgOiAwLAogICAgInRvdGFsUGFnYXIiIDogMjI1LjM2LAogICAgInRvdGFsTGV0cmFzIiA6ICJDSUVOVE8gTk9WRU5UQSBZIE5VRVZFIERPTEFSRVNTIDIwLzEwMCIsCiAgICAic2FsZG9GYXZvciIgOiAwLAogICAgImNvbmRpY2lvbk9wZXJhY2lvbiIgOiAxLAogICAgIml2YVBlcmNpMSIgOiAwLAogICAgIm51bVBhZ29FbGVjdHJvbmljbyIgOiAiIiwKICAgICJwYWdvcyIgOiBbIHsKICAgICAgImNvZGlnbyIgOiAiMDEiLAogICAgICAibW9udG9QYWdvIiA6IDE5OS4yLAogICAgICAicmVmZXJlbmNpYSIgOiAiIiwKICAgICAgInBsYXpvIiA6ICIwMSIsCiAgICAgICJwZXJpb2RvIiA6IG51bGwKICAgIH0gXSwKICAgICJ0cmlidXRvcyIgOiBbIHsKICAgICAgImNvZGlnbyIgOiAiMjAiLAogICAgICAiZGVzY3JpcGNpb24iIDogIkltcHVlc3RvIGFsIFZhbG9yIEFncmVnYWRvIDEzJSIsCiAgICAgICJ2YWxvciIgOiAyNi4xNgogICAgfSBdCiAgfSwKICAiZXh0ZW5zaW9uIiA6IG51bGwsCiAgImFwZW5kaWNlIiA6IG51bGwKfQ.fm9DidEJCpBXdIQ5FCbWL6dLURtrlMHAD2SNwdnwCsapxFEDj449VB3POg26mlP5g8EroKV6vstOkWUTeOasS1VO8Mh0sw4LrG8do7iQCGyVZBKwFEAp-B13h-Zn1dqKQdvYAIKsAIHFLq7j_C7e2hy3SZCvztd_X1b4y6kE2v1JJ1M4rofaTwbEOnE8FwRo5lMyzvm2m7IzeQ2zkvvNafu0dLkSQG2C-r4PK0hbjb3G6a6m52Ut66P0ZSQG6Adab3QUMW_at0-kSpr33Gcb2TXm27mZXhTr_6kyDsYNP6owBwsqChaQbnOYUgVUtUm3DMYuoD_fkDPHlmRmw4pmLA\\"}	\N	\N	\N	23DS000C	1448	2024-02-24
DTE-03-CMPV0202-000000000003980	8EB51F9E-662A-44F2-B5FA-0A0ECB940995	16625396	2024-03-09	\N	\N	\N	\N	23DS000C	1448	2024-02-24
DTE-03-CMPV0202-000000000003976	94410371-3B92-46DC-8D4B-5552A0F05122	16625396	2024-03-09	\N	\N	\N	\N	23DS000C	1448	2024-02-24
DTE-03-CMPV0202-000000000003989	9E76C69B-6AF3-41F0-A4BE-8C21E52D7CEB	16625396	2024-03-09	\N	\N	\N	\N	23DS000C	1448	2024-02-24
DTE-03-CMPV0202-000000000003972	9FB0D8F8-2818-4A41-B0D0-6171273B53E9	16625396	2024-03-09	{\\"Nofirmado\\":{\\"identificacion\\":{\\"version\\":\\"3\\",\\"ambiente\\":\\"00\\",\\"tipoDte\\":\\"03\\",\\"numeroControl\\":\\"DTE-03-CMPV0202-000000000003972\\",\\"codigoGeneracion\\":\\"9FB0D8F8-2818-4A41-B0D0-6171273B53E9\\",\\"tipoModelo\\":\\"1\\",\\"tipoOperacion\\":\\"1\\",\\"tipoContingencia\\":\\"\\",\\"fecEmi\\":\\"2024-03-09\\",\\"horEmi\\":\\"06:16:34\\",\\"tipoMoneda\\":\\"USD\\",\\"motivoContin\\":\\"\\"},\\"emisor\\":{\\"nit\\":\\"02033110660019\\",\\"nrc\\":\\"46744\\",\\"nombre\\":\\"COOPERATIVA CUZCACHAPA DE R.L\\",\\"codActividad\\":\\"01632\\",\\"descActividad\\":\\"Servicio de beneficio de caf\\\\u00e9\\",\\"nombreComercial\\":\\"SOCIEDAD COOPERATIVA CHALCHUAPANECA DE PRODUCTORES DE CAFE\\",\\"tipoEstablecimiento\\":\\"02\\",\\"telefono\\":\\"24527800\\",\\"correo\\":\\"cuzcachapa@cuzcachapa.com\\",\\"codEstable\\":\\"\\",\\"codEstableMH\\":\\"\\",\\"codPuntoVentaMH\\":\\"\\",\\"codPuntoVenta\\":\\"\\",\\"direccion\\":{\\"complemento\\":\\"CARRETERA A EL COCO, COL CUZCACHAPA CTON. GALEANO.\\",\\"municipio\\":\\"03\\",\\"departamento\\":\\"02\\"}},\\"documentoRelacionado\\":\\"\\",\\"receptor\\":{\\"nit\\":\\"02100307881022\\",\\"nrc\\":\\"00\\",\\"nombre\\":\\"DAVID ALBERTO GARCIA CARDONA\\",\\"codActividad\\":\\"62020\\",\\"descActividad\\":\\"Consultor\\\\u00edas y gesti\\\\u00f3n de servicios inform\\\\u00e1ticos\\",\\"nombreComercial\\":\\"DAVID ALBERTO GARCIA CARDONA\\",\\"direccion\\":{\\"complemento\\":\\"Condominios santa lucia E-47 apt-21\\",\\"municipio\\":\\"02\\",\\"departamento\\":\\"01\\"},\\"telefono\\":\\"77899798\\",\\"correo\\":\\"sal.tato@gmail.com\\"},\\"otrosDocumentos\\":\\"\\",\\"ventaTercero\\":\\"\\",\\"resumen\\":{\\"totalNoSuj\\":\\"0\\",\\"totalExenta\\":\\"0\\",\\"totalGravada\\":\\"0\\",\\"subTotalVentas\\":\\"0\\",\\"descuNoSuj\\":\\"0\\",\\"descuExenta\\":\\"0\\",\\"descuGravada\\":\\"0\\",\\"porcentajeDescuento\\":\\"0\\",\\"totalDescu\\":\\"0\\",\\"subTotal\\":\\"0\\",\\"ivaRete1\\":\\"0\\",\\"reteRenta\\":\\"0\\",\\"montoTotalOperacion\\":\\"26.16\\",\\"totalNoGravado\\":\\"0\\",\\"totalPagar\\":\\"26.16\\",\\"totalLetras\\":\\"CERO DOLARESS 00\\\\/100\\",\\"saldoFavor\\":\\"0\\",\\"condicionOperacion\\":\\"1\\",\\"ivaPerci1\\":\\"0\\",\\"numPagoElectronico\\":\\"\\",\\"pagos\\":[{\\"codigo\\":\\"01\\",\\"montoPago\\":\\"0\\",\\"referencia\\":\\"\\",\\"plazo\\":\\"01\\",\\"periodo\\":\\"0\\"}],\\"tributos\\":[{\\"codigo\\":\\"20\\",\\"descripcion\\":\\"Impuesto al Valor Agregado 13%\\",\\"valor\\":\\"26.16\\"}]},\\"extension\\":\\"\\",\\"apendice\\":\\"\\"},\\"firmado\\":\\"eyJhbGciOiJSUzUxMiJ9.ewogICJpZGVudGlmaWNhY2lvbiIgOiB7CiAgICAidmVyc2lvbiIgOiAzLAogICAgImFtYmllbnRlIiA6ICIwMCIsCiAgICAidGlwb0R0ZSIgOiAiMDMiLAogICAgIm51bWVyb0NvbnRyb2wiIDogIkRURS0wMy1DTVBWMDIwMi0wMDAwMDAwMDAwMDM5NzIiLAogICAgImNvZGlnb0dlbmVyYWNpb24iIDogIjlGQjBEOEY4LTI4MTgtNEE0MS1CMEQwLTYxNzEyNzNCNTNFOSIsCiAgICAidGlwb01vZGVsbyIgOiAxLAogICAgInRpcG9PcGVyYWNpb24iIDogMSwKICAgICJ0aXBvQ29udGluZ2VuY2lhIiA6IG51bGwsCiAgICAiZmVjRW1pIiA6ICIyMDI0LTAzLTA5IiwKICAgICJob3JFbWkiIDogIjA2OjE2OjM0IiwKICAgICJ0aXBvTW9uZWRhIiA6ICJVU0QiLAogICAgIm1vdGl2b0NvbnRpbiIgOiBudWxsCiAgfSwKICAiZW1pc29yIiA6IHsKICAgICJuaXQiIDogIjAyMDMzMTEwNjYwMDE5IiwKICAgICJucmMiIDogIjQ2NzQ0IiwKICAgICJub21icmUiIDogIkNPT1BFUkFUSVZBIENVWkNBQ0hBUEEgREUgUi5MIiwKICAgICJjb2RBY3RpdmlkYWQiIDogIjAxNjMyIiwKICAgICJkZXNjQWN0aXZpZGFkIiA6ICJTZXJ2aWNpbyBkZSBiZW5lZmljaW8gZGUgY2Fmw6kiLAogICAgIm5vbWJyZUNvbWVyY2lhbCIgOiAiU09DSUVEQUQgQ09PUEVSQVRJVkEgQ0hBTENIVUFQQU5FQ0EgREUgUFJPRFVDVE9SRVMgREUgQ0FGRSIsCiAgICAidGlwb0VzdGFibGVjaW1pZW50byIgOiAiMDIiLAogICAgInRlbGVmb25vIiA6ICIyNDUyNzgwMCIsCiAgICAiY29ycmVvIiA6ICJjdXpjYWNoYXBhQGN1emNhY2hhcGEuY29tIiwKICAgICJjb2RFc3RhYmxlIiA6IG51bGwsCiAgICAiY29kRXN0YWJsZU1IIiA6IG51bGwsCiAgICAiY29kUHVudG9WZW50YU1IIiA6IG51bGwsCiAgICAiY29kUHVudG9WZW50YSIgOiBudWxsLAogICAgImRpcmVjY2lvbiIgOiB7CiAgICAgICJjb21wbGVtZW50byIgOiAiQ0FSUkVURVJBIEEgRUwgQ09DTywgQ09MIENVWkNBQ0hBUEEgQ1RPTi4gR0FMRUFOTy4iLAogICAgICAibXVuaWNpcGlvIiA6ICIwMyIsCiAgICAgICJkZXBhcnRhbWVudG8iIDogIjAyIgogICAgfQogIH0sCiAgImN1ZXJwb0RvY3VtZW50byIgOiBbIF0sCiAgImRvY3VtZW50b1JlbGFjaW9uYWRvIiA6IG51bGwsCiAgInJlY2VwdG9yIiA6IHsKICAgICJuaXQiIDogIjAyMTAwMzA3ODgxMDIyIiwKICAgICJucmMiIDogIjAwIiwKICAgICJub21icmUiIDogIkRBVklEIEFMQkVSVE8gR0FSQ0lBIENBUkRPTkEiLAogICAgImNvZEFjdGl2aWRhZCIgOiAiNjIwMjAiLAogICAgImRlc2NBY3RpdmlkYWQiIDogIkNvbnN1bHRvcsOtYXMgeSBnZXN0acOzbiBkZSBzZXJ2aWNpb3MgaW5mb3Jtw6F0aWNvcyIsCiAgICAibm9tYnJlQ29tZXJjaWFsIiA6ICJEQVZJRCBBTEJFUlRPIEdBUkNJQSBDQVJET05BIiwKICAgICJkaXJlY2Npb24iIDogewogICAgICAiY29tcGxlbWVudG8iIDogIkNvbmRvbWluaW9zIHNhbnRhIGx1Y2lhIEUtNDcgYXB0LTIxIiwKICAgICAgIm11bmljaXBpbyIgOiAiMDIiLAogICAgICAiZGVwYXJ0YW1lbnRvIiA6ICIwMSIKICAgIH0sCiAgICAidGVsZWZvbm8iIDogIjc3ODk5Nzk4IiwKICAgICJjb3JyZW8iIDogInNhbC50YXRvQGdtYWlsLmNvbSIKICB9LAogICJvdHJvc0RvY3VtZW50b3MiIDogbnVsbCwKICAidmVudGFUZXJjZXJvIiA6IG51bGwsCiAgInJlc3VtZW4iIDogewogICAgInRvdGFsTm9TdWoiIDogMCwKICAgICJ0b3RhbEV4ZW50YSIgOiAwLAogICAgInRvdGFsR3JhdmFkYSIgOiAwLAogICAgInN1YlRvdGFsVmVudGFzIiA6IDAsCiAgICAiZGVzY3VOb1N1aiIgOiAwLAogICAgImRlc2N1RXhlbnRhIiA6IDAsCiAgICAiZGVzY3VHcmF2YWRhIiA6IDAsCiAgICAicG9yY2VudGFqZURlc2N1ZW50byIgOiAwLAogICAgInRvdGFsRGVzY3UiIDogMCwKICAgICJzdWJUb3RhbCIgOiAwLAogICAgIml2YVJldGUxIiA6IDAsCiAgICAicmV0ZVJlbnRhIiA6IDAsCiAgICAibW9udG9Ub3RhbE9wZXJhY2lvbiIgOiAyNi4xNiwKICAgICJ0b3RhbE5vR3JhdmFkbyIgOiAwLAogICAgInRvdGFsUGFnYXIiIDogMjYuMTYsCiAgICAidG90YWxMZXRyYXMiIDogIkNFUk8gRE9MQVJFU1MgMDAvMTAwIiwKICAgICJzYWxkb0Zhdm9yIiA6IDAsCiAgICAiY29uZGljaW9uT3BlcmFjaW9uIiA6IDEsCiAgICAiaXZhUGVyY2kxIiA6IDAsCiAgICAibnVtUGFnb0VsZWN0cm9uaWNvIiA6ICIiLAogICAgInBhZ29zIiA6IFsgewogICAgICAiY29kaWdvIiA6ICIwMSIsCiAgICAgICJtb250b1BhZ28iIDogMCwKICAgICAgInJlZmVyZW5jaWEiIDogIiIsCiAgICAgICJwbGF6byIgOiAiMDEiLAogICAgICAicGVyaW9kbyIgOiAwCiAgICB9IF0sCiAgICAidHJpYnV0b3MiIDogWyB7CiAgICAgICJjb2RpZ28iIDogIjIwIiwKICAgICAgImRlc2NyaXBjaW9uIiA6ICJJbXB1ZXN0byBhbCBWYWxvciBBZ3JlZ2FkbyAxMyUiLAogICAgICAidmFsb3IiIDogMjYuMTYKICAgIH0gXQogIH0sCiAgImV4dGVuc2lvbiIgOiBudWxsLAogICJhcGVuZGljZSIgOiBudWxsCn0.eQ5lM4Ezab4_MuKB_3zk6C0VPb_ntZd7mkF8PmU59sZNQCuHznhW7-2_V7oLo1jBE6ExxsirdU95-AioWPLhkrc0bWioCFNV3FAG83I2LCWfyRsYK1XRH-4J1Tv1-QuzKnk6zK5YNGWR-l7i0eGogy3O7H76GLklRJSE_DJXxdqDsFbztmGj45tKn_G3wbg6XkeSpBam5cHMVYZdQBow6M-CGkIIaoPbrkn2D-AEcWCN5DcOz5V6cKAet6ollO6cC9_7tNUcQgrnxbHaWTpf5rMSCQZUn4-d6Cf0HslXquSN83VgFATziWJN5SaxSorSdNs-vxVbEPOGvKk27_hrgQ\\"}	\N	\N	\N	23DS000C	1448	2024-02-24
DTE-01-CMPV0202-000000000003999	A39C6F29-0A6D-4AC6-85EB-132E4C0EDBCF	5222	2024-04-04	\N	{\\"destino\\":\\"\\",\\"direccionCli\\":null}	01011011400	0000000	\N	\N	\N
DTE-03-CMPV0202-000000000003967	A890BEC7-DC27-4B92-90AF-05EC58C92699	16625396	2024-03-09	\N	\N	\N	\N	23DS000C	1448	2024-02-24
DTE-03-CMPV0202-000000000003995	B0093AF7-3309-4B8D-B839-C0EE01A359D6	16625396	2024-03-09	{\\"Nofirmado\\":{\\"identificacion\\":{\\"version\\":\\"3\\",\\"ambiente\\":\\"00\\",\\"tipoDte\\":\\"03\\",\\"numeroControl\\":\\"DTE-03-CMPV0202-000000000003995\\",\\"codigoGeneracion\\":\\"B0093AF7-3309-4B8D-B839-C0EE01A359D6\\",\\"tipoModelo\\":\\"1\\",\\"tipoOperacion\\":\\"1\\",\\"tipoContingencia\\":\\"\\",\\"fecEmi\\":\\"2024-03-09\\",\\"horEmi\\":\\"10:08:50\\",\\"tipoMoneda\\":\\"USD\\",\\"motivoContin\\":\\"\\"},\\"emisor\\":{\\"nit\\":\\"02033110660019\\",\\"nrc\\":\\"46744\\",\\"nombre\\":\\"COOPERATIVA CUZCACHAPA DE R.L\\",\\"codActividad\\":\\"01632\\",\\"descActividad\\":\\"Servicio de beneficio de caf\\\\u00e9\\",\\"nombreComercial\\":\\"SOCIEDAD COOPERATIVA CHALCHUAPANECA DE PRODUCTORES DE CAFE\\",\\"tipoEstablecimiento\\":\\"02\\",\\"telefono\\":\\"24527800\\",\\"correo\\":\\"cuzcachapa@cuzcachapa.com\\",\\"codEstable\\":\\"\\",\\"codEstableMH\\":\\"\\",\\"codPuntoVentaMH\\":\\"\\",\\"codPuntoVenta\\":\\"\\",\\"direccion\\":{\\"complemento\\":\\"CARRETERA A EL COCO, COL CUZCACHAPA CTON. GALEANO.\\",\\"municipio\\":\\"03\\",\\"departamento\\":\\"02\\"}},\\"Cuerpodocumento\\":[{\\"numItem\\":\\"1\\",\\"tipoItem\\":\\"3\\",\\"numeroDocumento\\":\\"\\",\\"cantidad\\":\\"200\\",\\"codigo\\":\\"1372\\",\\"codTributo\\":\\"\\",\\"precioUni\\":\\"0.5\\",\\"montoDescu\\":\\"0\\",\\"uniMedida\\":\\"59\\",\\"ventaNoSuj\\":\\"0\\",\\"ventaExenta\\":\\"0\\",\\"ventaGravada\\":\\"100\\",\\"tributos\\":[\\"20\\"],\\"psv\\":\\"0.508407\\",\\"noGravado\\":\\"0\\",\\"descripcion\\":\\"Azucar 1\\\\/2 Kilo\\"},{\\"numItem\\":\\"2\\",\\"tipoItem\\":\\"3\\",\\"numeroDocumento\\":\\"\\",\\"cantidad\\":\\"40\\",\\"codigo\\":\\"1390\\",\\"codTributo\\":\\"\\",\\"precioUni\\":\\"2.48\\",\\"montoDescu\\":\\"0\\",\\"uniMedida\\":\\"59\\",\\"ventaNoSuj\\":\\"0\\",\\"ventaExenta\\":\\"0\\",\\"ventaGravada\\":\\"99.2\\",\\"tributos\\":[\\"20\\"],\\"psv\\":\\"2.488496\\",\\"noGravado\\":\\"0\\",\\"descripcion\\":\\"Azucar 2.5 Kilos\\"}],\\"documentoRelacionado\\":\\"\\",\\"receptor\\":{\\"nit\\":\\"02032707400018\\",\\"nrc\\":\\"556521\\",\\"nombre\\":\\"DUCH MARTINEZ JUAN\\",\\"codActividad\\":\\"01271\\",\\"descActividad\\":\\"Cultivo de caf\\\\u00e9\\",\\"nombreComercial\\":\\"DUCH MARTINEZ JUAN\\",\\"direccion\\":{\\"complemento\\":\\"Av. Club de Leones Nte. Chalchuapa.\\",\\"municipio\\":\\"03\\",\\"departamento\\":\\"02\\"},\\"telefono\\":\\"24440185\\",\\"correo\\":\\"sal.tato@gmail.com\\"},\\"otrosDocumentos\\":\\"\\",\\"ventaTercero\\":\\"\\",\\"resumen\\":{\\"totalNoSuj\\":\\"0\\",\\"totalExenta\\":\\"0\\",\\"totalGravada\\":\\"199.2\\",\\"subTotalVentas\\":\\"199.2\\",\\"descuNoSuj\\":\\"0\\",\\"descuExenta\\":\\"0\\",\\"descuGravada\\":\\"0\\",\\"porcentajeDescuento\\":\\"0\\",\\"totalDescu\\":\\"0\\",\\"subTotal\\":\\"199.2\\",\\"ivaRete1\\":\\"0\\",\\"reteRenta\\":\\"0\\",\\"montoTotalOperacion\\":\\"225.36\\",\\"totalNoGravado\\":\\"0\\",\\"totalPagar\\":\\"225.36\\",\\"totalLetras\\":\\"CIENTO NOVENTA Y NUEVE DOLARESS 20\\\\/100\\",\\"saldoFavor\\":\\"0\\",\\"condicionOperacion\\":\\"1\\",\\"ivaPerci1\\":\\"0\\",\\"numPagoElectronico\\":\\"\\",\\"pagos\\":[{\\"codigo\\":\\"01\\",\\"montoPago\\":\\"199.2\\",\\"referencia\\":\\"\\",\\"plazo\\":\\"01\\",\\"periodo\\":\\"\\"}],\\"tributos\\":[{\\"codigo\\":\\"20\\",\\"descripcion\\":\\"Impuesto al Valor Agregado 13%\\",\\"valor\\":\\"26.16\\"}]},\\"extension\\":\\"\\",\\"apendice\\":\\"\\"},\\"firmado\\":\\"eyJhbGciOiJSUzUxMiJ9.ewogICJpZGVudGlmaWNhY2lvbiIgOiB7CiAgICAidmVyc2lvbiIgOiAzLAogICAgImFtYmllbnRlIiA6ICIwMCIsCiAgICAidGlwb0R0ZSIgOiAiMDMiLAogICAgIm51bWVyb0NvbnRyb2wiIDogIkRURS0wMy1DTVBWMDIwMi0wMDAwMDAwMDAwMDM5OTUiLAogICAgImNvZGlnb0dlbmVyYWNpb24iIDogIkIwMDkzQUY3LTMzMDktNEI4RC1CODM5LUMwRUUwMUEzNTlENiIsCiAgICAidGlwb01vZGVsbyIgOiAxLAogICAgInRpcG9PcGVyYWNpb24iIDogMSwKICAgICJ0aXBvQ29udGluZ2VuY2lhIiA6IG51bGwsCiAgICAiZmVjRW1pIiA6ICIyMDI0LTAzLTA5IiwKICAgICJob3JFbWkiIDogIjEwOjA4OjUwIiwKICAgICJ0aXBvTW9uZWRhIiA6ICJVU0QiLAogICAgIm1vdGl2b0NvbnRpbiIgOiBudWxsCiAgfSwKICAiZW1pc29yIiA6IHsKICAgICJuaXQiIDogIjAyMDMzMTEwNjYwMDE5IiwKICAgICJucmMiIDogIjQ2NzQ0IiwKICAgICJub21icmUiIDogIkNPT1BFUkFUSVZBIENVWkNBQ0hBUEEgREUgUi5MIiwKICAgICJjb2RBY3RpdmlkYWQiIDogIjAxNjMyIiwKICAgICJkZXNjQWN0aXZpZGFkIiA6ICJTZXJ2aWNpbyBkZSBiZW5lZmljaW8gZGUgY2Fmw6kiLAogICAgIm5vbWJyZUNvbWVyY2lhbCIgOiAiU09DSUVEQUQgQ09PUEVSQVRJVkEgQ0hBTENIVUFQQU5FQ0EgREUgUFJPRFVDVE9SRVMgREUgQ0FGRSIsCiAgICAidGlwb0VzdGFibGVjaW1pZW50byIgOiAiMDIiLAogICAgInRlbGVmb25vIiA6ICIyNDUyNzgwMCIsCiAgICAiY29ycmVvIiA6ICJjdXpjYWNoYXBhQGN1emNhY2hhcGEuY29tIiwKICAgICJjb2RFc3RhYmxlIiA6IG51bGwsCiAgICAiY29kRXN0YWJsZU1IIiA6IG51bGwsCiAgICAiY29kUHVudG9WZW50YU1IIiA6IG51bGwsCiAgICAiY29kUHVudG9WZW50YSIgOiBudWxsLAogICAgImRpcmVjY2lvbiIgOiB7CiAgICAgICJjb21wbGVtZW50byIgOiAiQ0FSUkVURVJBIEEgRUwgQ09DTywgQ09MIENVWkNBQ0hBUEEgQ1RPTi4gR0FMRUFOTy4iLAogICAgICAibXVuaWNpcGlvIiA6ICIwMyIsCiAgICAgICJkZXBhcnRhbWVudG8iIDogIjAyIgogICAgfQogIH0sCiAgImN1ZXJwb0RvY3VtZW50byIgOiBbIHsKICAgICJudW1JdGVtIiA6IDEsCiAgICAidGlwb0l0ZW0iIDogMywKICAgICJudW1lcm9Eb2N1bWVudG8iIDogbnVsbCwKICAgICJjYW50aWRhZCIgOiAyMDAsCiAgICAiY29kaWdvIiA6ICIxMzcyIiwKICAgICJjb2RUcmlidXRvIiA6IG51bGwsCiAgICAicHJlY2lvVW5pIiA6IDAuNSwKICAgICJtb250b0Rlc2N1IiA6IDAsCiAgICAidW5pTWVkaWRhIiA6IDU5LAogICAgInZlbnRhTm9TdWoiIDogMCwKICAgICJ2ZW50YUV4ZW50YSIgOiAwLAogICAgInZlbnRhR3JhdmFkYSIgOiAxMDAsCiAgICAidHJpYnV0b3MiIDogWyAiMjAiIF0sCiAgICAicHN2IiA6IDAuNTA4NDA3LAogICAgIm5vR3JhdmFkbyIgOiAwLAogICAgImRlc2NyaXBjaW9uIiA6ICJBenVjYXIgMS8yIEtpbG8iCiAgfSwgewogICAgIm51bUl0ZW0iIDogMiwKICAgICJ0aXBvSXRlbSIgOiAzLAogICAgIm51bWVyb0RvY3VtZW50byIgOiBudWxsLAogICAgImNhbnRpZGFkIiA6IDQwLAogICAgImNvZGlnbyIgOiAiMTM5MCIsCiAgICAiY29kVHJpYnV0byIgOiBudWxsLAogICAgInByZWNpb1VuaSIgOiAyLjQ4LAogICAgIm1vbnRvRGVzY3UiIDogMCwKICAgICJ1bmlNZWRpZGEiIDogNTksCiAgICAidmVudGFOb1N1aiIgOiAwLAogICAgInZlbnRhRXhlbnRhIiA6IDAsCiAgICAidmVudGFHcmF2YWRhIiA6IDk5LjIsCiAgICAidHJpYnV0b3MiIDogWyAiMjAiIF0sCiAgICAicHN2IiA6IDIuNDg4NDk2LAogICAgIm5vR3JhdmFkbyIgOiAwLAogICAgImRlc2NyaXBjaW9uIiA6ICJBenVjYXIgMi41IEtpbG9zIgogIH0gXSwKICAiZG9jdW1lbnRvUmVsYWNpb25hZG8iIDogbnVsbCwKICAicmVjZXB0b3IiIDogewogICAgIm5pdCIgOiAiMDIwMzI3MDc0MDAwMTgiLAogICAgIm5yYyIgOiAiNTU2NTIxIiwKICAgICJub21icmUiIDogIkRVQ0ggTUFSVElORVogSlVBTiIsCiAgICAiY29kQWN0aXZpZGFkIiA6ICIwMTI3MSIsCiAgICAiZGVzY0FjdGl2aWRhZCIgOiAiQ3VsdGl2byBkZSBjYWbDqSIsCiAgICAibm9tYnJlQ29tZXJjaWFsIiA6ICJEVUNIIE1BUlRJTkVaIEpVQU4iLAogICAgImRpcmVjY2lvbiIgOiB7CiAgICAgICJjb21wbGVtZW50byIgOiAiQXYuIENsdWIgZGUgTGVvbmVzIE50ZS4gQ2hhbGNodWFwYS4iLAogICAgICAibXVuaWNpcGlvIiA6ICIwMyIsCiAgICAgICJkZXBhcnRhbWVudG8iIDogIjAyIgogICAgfSwKICAgICJ0ZWxlZm9ubyIgOiAiMjQ0NDAxODUiLAogICAgImNvcnJlbyIgOiAic2FsLnRhdG9AZ21haWwuY29tIgogIH0sCiAgIm90cm9zRG9jdW1lbnRvcyIgOiBudWxsLAogICJ2ZW50YVRlcmNlcm8iIDogbnVsbCwKICAicmVzdW1lbiIgOiB7CiAgICAidG90YWxOb1N1aiIgOiAwLAogICAgInRvdGFsRXhlbnRhIiA6IDAsCiAgICAidG90YWxHcmF2YWRhIiA6IDE5OS4yLAogICAgInN1YlRvdGFsVmVudGFzIiA6IDE5OS4yLAogICAgImRlc2N1Tm9TdWoiIDogMCwKICAgICJkZXNjdUV4ZW50YSIgOiAwLAogICAgImRlc2N1R3JhdmFkYSIgOiAwLAogICAgInBvcmNlbnRhamVEZXNjdWVudG8iIDogMCwKICAgICJ0b3RhbERlc2N1IiA6IDAsCiAgICAic3ViVG90YWwiIDogMTk5LjIsCiAgICAiaXZhUmV0ZTEiIDogMCwKICAgICJyZXRlUmVudGEiIDogMCwKICAgICJtb250b1RvdGFsT3BlcmFjaW9uIiA6IDIyNS4zNiwKICAgICJ0b3RhbE5vR3JhdmFkbyIgOiAwLAogICAgInRvdGFsUGFnYXIiIDogMjI1LjM2LAogICAgInRvdGFsTGV0cmFzIiA6ICJDSUVOVE8gTk9WRU5UQSBZIE5VRVZFIERPTEFSRVNTIDIwLzEwMCIsCiAgICAic2FsZG9GYXZvciIgOiAwLAogICAgImNvbmRpY2lvbk9wZXJhY2lvbiIgOiAxLAogICAgIml2YVBlcmNpMSIgOiAwLAogICAgIm51bVBhZ29FbGVjdHJvbmljbyIgOiAiIiwKICAgICJwYWdvcyIgOiBbIHsKICAgICAgImNvZGlnbyIgOiAiMDEiLAogICAgICAibW9udG9QYWdvIiA6IDE5OS4yLAogICAgICAicmVmZXJlbmNpYSIgOiAiIiwKICAgICAgInBsYXpvIiA6ICIwMSIsCiAgICAgICJwZXJpb2RvIiA6IG51bGwKICAgIH0gXSwKICAgICJ0cmlidXRvcyIgOiBbIHsKICAgICAgImNvZGlnbyIgOiAiMjAiLAogICAgICAiZGVzY3JpcGNpb24iIDogIkltcHVlc3RvIGFsIFZhbG9yIEFncmVnYWRvIDEzJSIsCiAgICAgICJ2YWxvciIgOiAyNi4xNgogICAgfSBdCiAgfSwKICAiZXh0ZW5zaW9uIiA6IG51bGwsCiAgImFwZW5kaWNlIiA6IG51bGwKfQ.S75o2C8ifjvyyi6wPVUzaweRGmF9bNSbqH2uTLiHN0HWx6MdgYv-twUVjnDX2-7xqA-PlyQ1CctNI14wCBc6xQIVhLLj2_5lfJbbl5TS26WDRKSb7TUTONCK1HZzHfp-tRF8qrFwgRkAsInbcbhMgaZZWShGl1-iQOrT-bfcI4bJSqXj_P5nTT9q0QHVk8MmdPOtqgpHcR0vm7FVKLmMVt5e_2NzakvxAf1BaxWJmurZeFUgwPAhlvsoZ51t_4BrZPvVCbsJ_DCFU9oE4-2_54L8cyJD-RkuYqy4QMvwVRtwTKFViinF8ysbUWRKEChhsGzgdhAQwBN0H2ZAt1GmLg\\"}	\N	\N	\N	23DS000C	1448	2024-02-24
DTE-03-CMPV0202-000000000003965	B4A8EBD6-62C4-4511-8F89-7A1D8FF8F9DF	16625396	2024-03-09	\N	\N	\N	\N	23DS000C	1448	2024-02-24
DTE-03-CMPV0202-000000000003974	C6D0A5BA-29A2-4A46-B17B-624E8A2EABB3	16625396	2024-03-09	\N	\N	\N	\N	23DS000C	1448	2024-02-24
DTE-03-CMPV0202-000000000003968	D0D6C203-A842-46E4-A027-9E6B0260CCCC	16625396	2024-03-09	\N	\N	\N	\N	23DS000C	1448	2024-02-24
DTE-03-CMPV0202-000000000003979	D5A3E5D4-7ED8-495D-B3CF-569D8BA38F57	16625396	2024-03-09	\N	\N	\N	\N	23DS000C	1448	2024-02-24
DTE-03-CMPV0202-000000000003981	DD7277CF-28FA-4F15-881F-BF757119E122	16625396	2024-03-09	\N	\N	\N	\N	23DS000C	1448	2024-02-24
DTE-03-CMPV0202-000000000003977	DE59BC3A-3473-4994-91E6-F11DDB9746D1	16625396	2024-03-09	\N	\N	\N	\N	23DS000C	1448	2024-02-24
DTE-03-CMPV0202-000000000003969	E107BAD3-CAAF-445F-BF4D-CE20703FBEAB	16625396	2024-03-09	\N	\N	\N	\N	23DS000C	1448	2024-02-24
DTE-03-CMPV0202-000000000003971	E8572C95-53D2-4CB0-B587-AB7FA9DEF1C4	16625396	2024-03-09	{\\"Nofirmado\\":{\\"identificacion\\":{\\"version\\":\\"3\\",\\"ambiente\\":\\"00\\",\\"tipoDte\\":\\"03\\",\\"numeroControl\\":\\"DTE-03-CMPV0202-000000000003971\\",\\"codigoGeneracion\\":\\"E8572C95-53D2-4CB0-B587-AB7FA9DEF1C4\\",\\"tipoModelo\\":\\"1\\",\\"tipoOperacion\\":\\"1\\",\\"tipoContingencia\\":\\"\\",\\"fecEmi\\":\\"2024-03-09\\",\\"horEmi\\":\\"06:16:03\\",\\"tipoMoneda\\":\\"USD\\",\\"motivoContin\\":\\"\\"},\\"emisor\\":{\\"nit\\":\\"02033110660019\\",\\"nrc\\":\\"46744\\",\\"nombre\\":\\"COOPERATIVA CUZCACHAPA DE R.L\\",\\"codActividad\\":\\"01632\\",\\"descActividad\\":\\"Servicio de beneficio de caf\\\\u00e9\\",\\"nombreComercial\\":\\"SOCIEDAD COOPERATIVA CHALCHUAPANECA DE PRODUCTORES DE CAFE\\",\\"tipoEstablecimiento\\":\\"02\\",\\"telefono\\":\\"24527800\\",\\"correo\\":\\"cuzcachapa@cuzcachapa.com\\",\\"codEstable\\":\\"\\",\\"codEstableMH\\":\\"\\",\\"codPuntoVentaMH\\":\\"\\",\\"codPuntoVenta\\":\\"\\",\\"direccion\\":{\\"complemento\\":\\"CARRETERA A EL COCO, COL CUZCACHAPA CTON. GALEANO.\\",\\"municipio\\":\\"03\\",\\"departamento\\":\\"02\\"}},\\"documentoRelacionado\\":\\"\\",\\"receptor\\":{\\"nit\\":\\"02100307881022\\",\\"nrc\\":\\"00\\",\\"nombre\\":\\"DAVID ALBERTO GARCIA CARDONA\\",\\"codActividad\\":\\"62020\\",\\"descActividad\\":\\"Consultor\\\\u00edas y gesti\\\\u00f3n de servicios inform\\\\u00e1ticos\\",\\"nombreComercial\\":\\"DAVID ALBERTO GARCIA CARDONA\\",\\"direccion\\":{\\"complemento\\":\\"Condominios santa lucia E-47 apt-21\\",\\"municipio\\":\\"02\\",\\"departamento\\":\\"01\\"},\\"telefono\\":\\"77899798\\",\\"correo\\":\\"sal.tato@gmail.com\\"},\\"otrosDocumentos\\":\\"\\",\\"ventaTercero\\":\\"\\",\\"resumen\\":{\\"totalNoSuj\\":\\"0\\",\\"totalExenta\\":\\"0\\",\\"totalGravada\\":\\"0\\",\\"subTotalVentas\\":\\"0\\",\\"descuNoSuj\\":\\"0\\",\\"descuExenta\\":\\"0\\",\\"descuGravada\\":\\"0\\",\\"porcentajeDescuento\\":\\"0\\",\\"totalDescu\\":\\"0\\",\\"subTotal\\":\\"0\\",\\"ivaRete1\\":\\"0\\",\\"reteRenta\\":\\"0\\",\\"montoTotalOperacion\\":\\"26.16\\",\\"totalNoGravado\\":\\"0\\",\\"totalPagar\\":\\"26.16\\",\\"totalLetras\\":\\"CERO DOLARESS 00\\\\/100\\",\\"saldoFavor\\":\\"0\\",\\"condicionOperacion\\":\\"1\\",\\"ivaPerci1\\":\\"0\\",\\"numPagoElectronico\\":\\"\\",\\"pagos\\":[{\\"codigo\\":\\"01\\",\\"montoPago\\":\\"0\\",\\"referencia\\":\\"\\",\\"plazo\\":\\"01\\",\\"periodo\\":\\"0\\"}],\\"tributos\\":[{\\"codigo\\":\\"20\\",\\"descripcion\\":\\"Impuesto al Valor Agregado 13%\\",\\"valor\\":\\"26.16\\"}]},\\"extension\\":\\"\\",\\"apendice\\":\\"\\"},\\"firmado\\":\\"eyJhbGciOiJSUzUxMiJ9.ewogICJpZGVudGlmaWNhY2lvbiIgOiB7CiAgICAidmVyc2lvbiIgOiAzLAogICAgImFtYmllbnRlIiA6ICIwMCIsCiAgICAidGlwb0R0ZSIgOiAiMDMiLAogICAgIm51bWVyb0NvbnRyb2wiIDogIkRURS0wMy1DTVBWMDIwMi0wMDAwMDAwMDAwMDM5NzEiLAogICAgImNvZGlnb0dlbmVyYWNpb24iIDogIkU4NTcyQzk1LTUzRDItNENCMC1CNTg3LUFCN0ZBOURFRjFDNCIsCiAgICAidGlwb01vZGVsbyIgOiAxLAogICAgInRpcG9PcGVyYWNpb24iIDogMSwKICAgICJ0aXBvQ29udGluZ2VuY2lhIiA6IG51bGwsCiAgICAiZmVjRW1pIiA6ICIyMDI0LTAzLTA5IiwKICAgICJob3JFbWkiIDogIjA2OjE2OjAzIiwKICAgICJ0aXBvTW9uZWRhIiA6ICJVU0QiLAogICAgIm1vdGl2b0NvbnRpbiIgOiBudWxsCiAgfSwKICAiZW1pc29yIiA6IHsKICAgICJuaXQiIDogIjAyMDMzMTEwNjYwMDE5IiwKICAgICJucmMiIDogIjQ2NzQ0IiwKICAgICJub21icmUiIDogIkNPT1BFUkFUSVZBIENVWkNBQ0hBUEEgREUgUi5MIiwKICAgICJjb2RBY3RpdmlkYWQiIDogIjAxNjMyIiwKICAgICJkZXNjQWN0aXZpZGFkIiA6ICJTZXJ2aWNpbyBkZSBiZW5lZmljaW8gZGUgY2Fmw6kiLAogICAgIm5vbWJyZUNvbWVyY2lhbCIgOiAiU09DSUVEQUQgQ09PUEVSQVRJVkEgQ0hBTENIVUFQQU5FQ0EgREUgUFJPRFVDVE9SRVMgREUgQ0FGRSIsCiAgICAidGlwb0VzdGFibGVjaW1pZW50byIgOiAiMDIiLAogICAgInRlbGVmb25vIiA6ICIyNDUyNzgwMCIsCiAgICAiY29ycmVvIiA6ICJjdXpjYWNoYXBhQGN1emNhY2hhcGEuY29tIiwKICAgICJjb2RFc3RhYmxlIiA6IG51bGwsCiAgICAiY29kRXN0YWJsZU1IIiA6IG51bGwsCiAgICAiY29kUHVudG9WZW50YU1IIiA6IG51bGwsCiAgICAiY29kUHVudG9WZW50YSIgOiBudWxsLAogICAgImRpcmVjY2lvbiIgOiB7CiAgICAgICJjb21wbGVtZW50byIgOiAiQ0FSUkVURVJBIEEgRUwgQ09DTywgQ09MIENVWkNBQ0hBUEEgQ1RPTi4gR0FMRUFOTy4iLAogICAgICAibXVuaWNpcGlvIiA6ICIwMyIsCiAgICAgICJkZXBhcnRhbWVudG8iIDogIjAyIgogICAgfQogIH0sCiAgImN1ZXJwb0RvY3VtZW50byIgOiBbIF0sCiAgImRvY3VtZW50b1JlbGFjaW9uYWRvIiA6IG51bGwsCiAgInJlY2VwdG9yIiA6IHsKICAgICJuaXQiIDogIjAyMTAwMzA3ODgxMDIyIiwKICAgICJucmMiIDogIjAwIiwKICAgICJub21icmUiIDogIkRBVklEIEFMQkVSVE8gR0FSQ0lBIENBUkRPTkEiLAogICAgImNvZEFjdGl2aWRhZCIgOiAiNjIwMjAiLAogICAgImRlc2NBY3RpdmlkYWQiIDogIkNvbnN1bHRvcsOtYXMgeSBnZXN0acOzbiBkZSBzZXJ2aWNpb3MgaW5mb3Jtw6F0aWNvcyIsCiAgICAibm9tYnJlQ29tZXJjaWFsIiA6ICJEQVZJRCBBTEJFUlRPIEdBUkNJQSBDQVJET05BIiwKICAgICJkaXJlY2Npb24iIDogewogICAgICAiY29tcGxlbWVudG8iIDogIkNvbmRvbWluaW9zIHNhbnRhIGx1Y2lhIEUtNDcgYXB0LTIxIiwKICAgICAgIm11bmljaXBpbyIgOiAiMDIiLAogICAgICAiZGVwYXJ0YW1lbnRvIiA6ICIwMSIKICAgIH0sCiAgICAidGVsZWZvbm8iIDogIjc3ODk5Nzk4IiwKICAgICJjb3JyZW8iIDogInNhbC50YXRvQGdtYWlsLmNvbSIKICB9LAogICJvdHJvc0RvY3VtZW50b3MiIDogbnVsbCwKICAidmVudGFUZXJjZXJvIiA6IG51bGwsCiAgInJlc3VtZW4iIDogewogICAgInRvdGFsTm9TdWoiIDogMCwKICAgICJ0b3RhbEV4ZW50YSIgOiAwLAogICAgInRvdGFsR3JhdmFkYSIgOiAwLAogICAgInN1YlRvdGFsVmVudGFzIiA6IDAsCiAgICAiZGVzY3VOb1N1aiIgOiAwLAogICAgImRlc2N1RXhlbnRhIiA6IDAsCiAgICAiZGVzY3VHcmF2YWRhIiA6IDAsCiAgICAicG9yY2VudGFqZURlc2N1ZW50byIgOiAwLAogICAgInRvdGFsRGVzY3UiIDogMCwKICAgICJzdWJUb3RhbCIgOiAwLAogICAgIml2YVJldGUxIiA6IDAsCiAgICAicmV0ZVJlbnRhIiA6IDAsCiAgICAibW9udG9Ub3RhbE9wZXJhY2lvbiIgOiAyNi4xNiwKICAgICJ0b3RhbE5vR3JhdmFkbyIgOiAwLAogICAgInRvdGFsUGFnYXIiIDogMjYuMTYsCiAgICAidG90YWxMZXRyYXMiIDogIkNFUk8gRE9MQVJFU1MgMDAvMTAwIiwKICAgICJzYWxkb0Zhdm9yIiA6IDAsCiAgICAiY29uZGljaW9uT3BlcmFjaW9uIiA6IDEsCiAgICAiaXZhUGVyY2kxIiA6IDAsCiAgICAibnVtUGFnb0VsZWN0cm9uaWNvIiA6ICIiLAogICAgInBhZ29zIiA6IFsgewogICAgICAiY29kaWdvIiA6ICIwMSIsCiAgICAgICJtb250b1BhZ28iIDogMCwKICAgICAgInJlZmVyZW5jaWEiIDogIiIsCiAgICAgICJwbGF6byIgOiAiMDEiLAogICAgICAicGVyaW9kbyIgOiAwCiAgICB9IF0sCiAgICAidHJpYnV0b3MiIDogWyB7CiAgICAgICJjb2RpZ28iIDogIjIwIiwKICAgICAgImRlc2NyaXBjaW9uIiA6ICJJbXB1ZXN0byBhbCBWYWxvciBBZ3JlZ2FkbyAxMyUiLAogICAgICAidmFsb3IiIDogMjYuMTYKICAgIH0gXQogIH0sCiAgImV4dGVuc2lvbiIgOiBudWxsLAogICJhcGVuZGljZSIgOiBudWxsCn0.X9RFdTtfrQTyl0XBh6uyAtYwJRbu5JhXlRpj4Awt4ZrG9x9SUerDYhdO-Wjzd7jWEDiMPuFpDTVFFWpbxKproIKLgkRJm7xzhHborkDOOBi7RVK1-XFkeQ5qcM7UCDdsIQRn1zkt-EZBXE781U3x0SLRdAiP9G55epfsv_B1f_4Zj_pXykIRXJNTsKrnFNdFAR2h9nPIAxobw_UVxS4S7jEfSpRHl7XqTtFO8yhr6t_hs1PaDE1lQ9oj6y67Jf0k2pvqDMQu-dcabc5gSUayfurKPa2A9-z1U8kmqeZDVc2eJMHIwUis9KiWpcEXXz4ZblflqZcysqoZ1fWF_Xs9QQ\\"}	\N	\N	\N	23DS000C	1448	2024-02-24
DTE-03-CMPV0202-000000000003992	E9ABB697-938D-4924-A7E7-55C1C7E49AE0	16625396	2024-03-09	\N	\N	\N	\N	23DS000C	1448	2024-02-24
DTE-03-CMPV0202-000000000003963	F2A4A92E-2DFE-4AF5-831E-A30EC3E70B86	16625396	2024-03-09	\N	\N	\N	\N	23DS000C	1448	2024-02-24
DTE-03-CMPV0202-000000000003963	F2FF9703-9CC4-411F-91FE-39F87A3446D0	16625396	2024-03-09	\N	\N	\N	\N	23DS000C	1448	2024-02-24
DTE-03-CMPV0202-000000000003978	F41EC2AA-75DB-4063-BF3F-96BF20A9F0FE	16625396	2024-03-08	\N	\N	\N	\N	23DS000C	1448	2024-02-24
\.


--
-- Data for Name: resumen; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.resumen (id,"numeroControl", "codigoGeneracion", "totalNoSuj", "totalExenta", "totalGravada", "totalOpeExpo", "totalOperaciones", "totalDonacion", "sumOpSinImpu", "montoGloDescNS", "montoGloDescVE", "montoGloDescVG", "montoGloDescVA", "montoGloDescOP", "porcMontoGloDesc", "totalDescBonRev", "resCodTributo", "nombreTributo", "valorTributo", "subTotal", "totalMonSujRet", "ivaPercibido", "ivaPercibidoLiq", "ivaRetenido", "retencionRenta", "seguro", "flete", "montoTotalOp", "totalCargoBasImpon", "totalAPagar", "total", "totalIvaRetenido", "valorLetrasIvaRet", "valorLetras", "iva13", "saldoAFavor", "condicionOpera", "codFormaPago", "montoPorFormaPag", "refModalidadPago", "plazo", "periodoPlazo", "numPagoElecNPE", "incoterms", "descincoterms", "observaciones") FROM stdin;
1	DTE-03-CMPV0202-000000000003963	0F9DB45F-1E98-4573-89FB-F46A322984C3	0.00	0.00	0	\N	\N	\N	0	0.00	0.00	0.00	\N	\N	0.00	0.00	\N	[{\\"codigo\\":\\"20\\",\\"descripcion\\":\\"Impuesto al Valor Agregado 13%\\",\\"valor\\":26.16}]	\N	0	\N	0	\N	0	0.00	\N	\N	26.16	0.00	26.16	\N	\N	\N	CERO DOLARESS 00/100	26.16	0.00	1	01	0		01			\N	\N	\N
2	DTE-03-CMPV0202-000000000003963	F2A4A92E-2DFE-4AF5-831E-A30EC3E70B86	0.00	0.00	0	\N	\N	\N	0	0.00	0.00	0.00	\N	\N	0.00	0.00	\N	[{\\"codigo\\":\\"20\\",\\"descripcion\\":\\"Impuesto al Valor Agregado 13%\\",\\"valor\\":26.16}]	\N	0	\N	0	\N	0	0.00	\N	\N	26.16	0.00	26.16	\N	\N	\N	CERO DOLARESS 00/100	26.16	0.00	1	01	0		01			\N	\N	\N
3	DTE-03-CMPV0202-000000000003963	4058E0A5-E11E-4981-8DBD-A00F1BAEBEC7	0.00	0.00	0	\N	\N	\N	0	0.00	0.00	0.00	\N	\N	0.00	0.00	\N	[{\\"codigo\\":\\"20\\",\\"descripcion\\":\\"Impuesto al Valor Agregado 13%\\",\\"valor\\":26.16}]	\N	0	\N	0	\N	0	0.00	\N	\N	26.16	0.00	26.16	\N	\N	\N	CERO DOLARESS 00/100	26.16	0.00	1	01	0		01			\N	\N	\N
4	DTE-03-CMPV0202-000000000003964	2BC21107-E05D-4F87-A49C-77A444871C49	0.00	0.00	0	\N	\N	\N	0	0.00	0.00	0.00	\N	\N	0.00	0.00	\N	[{\\"codigo\\":\\"20\\",\\"descripcion\\":\\"Impuesto al Valor Agregado 13%\\",\\"valor\\":26.16}]	\N	0	\N	0	\N	0	0.00	\N	\N	26.16	0.00	26.16	\N	\N	\N	CERO DOLARESS 00/100	26.16	0.00	1	01	0		01			\N	\N	\N
5	DTE-03-CMPV0202-000000000003965	B4A8EBD6-62C4-4511-8F89-7A1D8FF8F9DF	0.00	0.00	0	\N	\N	\N	0	0.00	0.00	0.00	\N	\N	0.00	0.00	\N	[{\\"codigo\\":\\"20\\",\\"descripcion\\":\\"Impuesto al Valor Agregado 13%\\",\\"valor\\":26.16}]	\N	0	\N	0	\N	0	0.00	\N	\N	26.16	0.00	26.16	\N	\N	\N	CERO DOLARESS 00/100	26.16	0.00	1	01	0		01			\N	\N	\N
6	DTE-03-CMPV0202-000000000003966	29174571-7067-498C-AE55-42E3A8B6BCFB	0.00	0.00	0	\N	\N	\N	0	0.00	0.00	0.00	\N	\N	0.00	0.00	\N	[{\\"codigo\\":\\"20\\",\\"descripcion\\":\\"Impuesto al Valor Agregado 13%\\",\\"valor\\":26.16}]	\N	0	\N	0	\N	0	0.00	\N	\N	26.16	0.00	26.16	\N	\N	\N	CERO DOLARESS 00/100	26.16	0.00	1	01	0		01			\N	\N	\N
7	DTE-03-CMPV0202-000000000003967	A890BEC7-DC27-4B92-90AF-05EC58C92699	0.00	0.00	0	\N	\N	\N	0	0.00	0.00	0.00	\N	\N	0.00	0.00	\N	[{\\"codigo\\":\\"20\\",\\"descripcion\\":\\"Impuesto al Valor Agregado 13%\\",\\"valor\\":26.16}]	\N	0	\N	0	\N	0	0.00	\N	\N	26.16	0.00	26.16	\N	\N	\N	CERO DOLARESS 00/100	26.16	0.00	1	01	0		01			\N	\N	\N
8	DTE-03-CMPV0202-000000000003968	D0D6C203-A842-46E4-A027-9E6B0260CCCC	0.00	0.00	0	\N	\N	\N	0	0.00	0.00	0.00	\N	\N	0.00	0.00	\N	[{\\"codigo\\":\\"20\\",\\"descripcion\\":\\"Impuesto al Valor Agregado 13%\\",\\"valor\\":26.16}]	\N	0	\N	0	\N	0	0.00	\N	\N	26.16	0.00	26.16	\N	\N	\N	CERO DOLARESS 00/100	26.16	0.00	1	01	0		01			\N	\N	\N
9	DTE-03-CMPV0202-000000000003969	E107BAD3-CAAF-445F-BF4D-CE20703FBEAB	0.00	0.00	0	\N	\N	\N	0	0.00	0.00	0.00	\N	\N	0.00	0.00	\N	[{\\"codigo\\":\\"20\\",\\"descripcion\\":\\"Impuesto al Valor Agregado 13%\\",\\"valor\\":26.16}]	\N	0	\N	0	\N	0	0.00	\N	\N	26.16	0.00	26.16	\N	\N	\N	CERO DOLARESS 00/100	26.16	0.00	1	01	0		01			\N	\N	\N
10	DTE-03-CMPV0202-000000000003970	0930B690-67DB-461D-A739-1A5232834D40	0.00	0.00	0	\N	\N	\N	0	0.00	0.00	0.00	\N	\N	0.00	0.00	\N	[{\\"codigo\\":\\"20\\",\\"descripcion\\":\\"Impuesto al Valor Agregado 13%\\",\\"valor\\":26.16}]	\N	0	\N	0	\N	0	0.00	\N	\N	26.16	0.00	26.16	\N	\N	\N	CERO DOLARESS 00/100	26.16	0.00	1	01	0		01			\N	\N	\N
11	DTE-03-CMPV0202-000000000003971	E8572C95-53D2-4CB0-B587-AB7FA9DEF1C4	0.00	0.00	0	\N	\N	\N	0	0.00	0.00	0.00	\N	\N	0.00	0.00	\N	[{\\"codigo\\":\\"20\\",\\"descripcion\\":\\"Impuesto al Valor Agregado 13%\\",\\"valor\\":26.16}]	\N	0	\N	0	\N	0	0.00	\N	\N	26.16	0.00	26.16	\N	\N	\N	CERO DOLARESS 00/100	26.16	0.00	1	01	0		01			\N	\N	\N
12	DTE-03-CMPV0202-000000000003972	9FB0D8F8-2818-4A41-B0D0-6171273B53E9	0.00	0.00	0	\N	\N	\N	0	0.00	0.00	0.00	\N	\N	0.00	0.00	\N	[{\\"codigo\\":\\"20\\",\\"descripcion\\":\\"Impuesto al Valor Agregado 13%\\",\\"valor\\":26.16}]	\N	0	\N	0	\N	0	0.00	\N	\N	26.16	0.00	26.16	\N	\N	\N	CERO DOLARESS 00/100	26.16	0.00	1	01	0		01			\N	\N	\N
13	DTE-03-CMPV0202-000000000003973	6438505D-BE64-46CC-A7A7-120DDC80B6FF	0.00	0.00	0	\N	\N	\N	0	0.00	0.00	0.00	\N	\N	0.00	0.00	\N	[{\\"codigo\\":\\"20\\",\\"descripcion\\":\\"Impuesto al Valor Agregado 13%\\",\\"valor\\":26.16}]	\N	0	\N	0	\N	0	0.00	\N	\N	26.16	0.00	26.16	\N	\N	\N	CERO DOLARESS 00/100	26.16	0.00	1	01	0		01			\N	\N	\N
14	DTE-03-CMPV0202-000000000003974	C6D0A5BA-29A2-4A46-B17B-624E8A2EABB3	0.00	0.00	199.2	\N	\N	\N	199.2	0.00	0.00	0.00	\N	\N	0.00	0.00	\N	[{\\"codigo\\":\\"20\\",\\"descripcion\\":\\"Impuesto al Valor Agregado 13%\\",\\"valor\\":26.16}]	\N	199.2	\N	0	\N	0	0.00	\N	\N	225.36	0.00	225.36	\N	\N	\N	CIENTO NOVENTA Y NUEVE DOLARESS 20/100	26.16	0.00	1	01	199.2		01			\N	\N	\N
15	DTE-03-CMPV0202-000000000003975	7AEE2981-DB26-400B-A33C-755C42E06986	0.00	0.00	199.2	\N	\N	\N	199.2	0.00	0.00	0.00	\N	\N	0.00	0.00	\N	[{\\"codigo\\":\\"20\\",\\"descripcion\\":\\"Impuesto al Valor Agregado 13%\\",\\"valor\\":26.16}]	\N	199.2	\N	0	\N	0	0.00	\N	\N	225.36	0.00	225.36	\N	\N	\N	CIENTO NOVENTA Y NUEVE DOLARESS 20/100	26.16	0.00	1	01	199.2		01			\N	\N	\N
16	DTE-03-CMPV0202-000000000003976	94410371-3B92-46DC-8D4B-5552A0F05122	0.00	0.00	199.2	\N	\N	\N	199.2	0.00	0.00	0.00	\N	\N	0.00	0.00	\N	[{\\"codigo\\":\\"20\\",\\"descripcion\\":\\"Impuesto al Valor Agregado 13%\\",\\"valor\\":26.16}]	\N	199.2	\N	0	\N	0	0.00	\N	\N	225.36	0.00	225.36	\N	\N	\N	CIENTO NOVENTA Y NUEVE DOLARESS 20/100	26.16	0.00	1	01	199.2		01			\N	\N	\N
17	DTE-03-CMPV0202-000000000003977	DE59BC3A-3473-4994-91E6-F11DDB9746D1	0.00	0.00	199.2	\N	\N	\N	199.2	0.00	0.00	0.00	\N	\N	0.00	0.00	\N	[{\\"codigo\\":\\"20\\",\\"descripcion\\":\\"Impuesto al Valor Agregado 13%\\",\\"valor\\":26.16}]	\N	199.2	\N	0	\N	0	0.00	\N	\N	225.36	0.00	225.36	\N	\N	\N	CIENTO NOVENTA Y NUEVE DOLARESS 20/100	26.16	0.00	1	01	199.2		01			\N	\N	\N
18	DTE-03-CMPV0202-000000000003978	F41EC2AA-75DB-4063-BF3F-96BF20A9F0FE	0.00	0.00	199.2	\N	\N	\N	199.2	0.00	0.00	0.00	\N	\N	0.00	0.00	\N	[{\\"codigo\\":\\"20\\",\\"descripcion\\":\\"Impuesto al Valor Agregado 13%\\",\\"valor\\":26.16}]	\N	199.2	\N	0	\N	0	0.00	\N	\N	225.36	0.00	225.36	\N	\N	\N	CIENTO NOVENTA Y NUEVE DOLARESS 20/100	26.16	0.00	1	01	199.2		01			\N	\N	\N
19	DTE-03-CMPV0202-000000000003979	D5A3E5D4-7ED8-495D-B3CF-569D8BA38F57	0.00	0.00	199.2	\N	\N	\N	199.2	0.00	0.00	0.00	\N	\N	0.00	0.00	\N	[{\\"codigo\\":\\"20\\",\\"descripcion\\":\\"Impuesto al Valor Agregado 13%\\",\\"valor\\":26.16}]	\N	199.2	\N	0	\N	0	0.00	\N	\N	225.36	0.00	225.36	\N	\N	\N	CIENTO NOVENTA Y NUEVE DOLARESS 20/100	26.16	0.00	1	01	199.2		01			\N	\N	\N
20	DTE-03-CMPV0202-000000000003980	8EB51F9E-662A-44F2-B5FA-0A0ECB940995	0.00	0.00	199.2	\N	\N	\N	199.2	0.00	0.00	0.00	\N	\N	0.00	0.00	\N	[{\\"codigo\\":\\"20\\",\\"descripcion\\":\\"Impuesto al Valor Agregado 13%\\",\\"valor\\":26.16}]	\N	199.2	\N	0	\N	0	0.00	\N	\N	225.36	0.00	225.36	\N	\N	\N	CIENTO NOVENTA Y NUEVE DOLARESS 20/100	26.16	0.00	1	01	199.2		01			\N	\N	\N
21	DTE-03-CMPV0202-000000000003981	DD7277CF-28FA-4F15-881F-BF757119E122	0.00	0.00	199.2	\N	\N	\N	199.2	0.00	0.00	0.00	\N	\N	0.00	0.00	\N	[{\\"codigo\\":\\"20\\",\\"descripcion\\":\\"Impuesto al Valor Agregado 13%\\",\\"valor\\":26.16}]	\N	199.2	\N	0	\N	0	0.00	\N	\N	225.36	0.00	225.36	\N	\N	\N	CIENTO NOVENTA Y NUEVE DOLARESS 20/100	26.16	0.00	1	01	199.2		01			\N	\N	\N
22	DTE-03-CMPV0202-000000000003982	17BCBD36-49C2-4CA0-A4A7-69A3C79E3AF5	0.00	0.00	199.2	\N	\N	\N	199.2	0.00	0.00	0.00	\N	\N	0.00	0.00	\N	[{\\"codigo\\":\\"20\\",\\"descripcion\\":\\"Impuesto al Valor Agregado 13%\\",\\"valor\\":26.16}]	\N	199.2	\N	0	\N	0	0.00	\N	\N	225.36	0.00	225.36	\N	\N	\N	CIENTO NOVENTA Y NUEVE DOLARESS 20/100	26.16	0.00	1	01	199.2		01			\N	\N	\N
23	DTE-03-CMPV0202-000000000003983	2D6B3A42-6375-4BB1-8162-65AB0DBCC585	0.00	0.00	199.2	\N	\N	\N	199.2	0.00	0.00	0.00	\N	\N	0.00	0.00	\N	[{\\"codigo\\":\\"20\\",\\"descripcion\\":\\"Impuesto al Valor Agregado 13%\\",\\"valor\\":26.16}]	\N	199.2	\N	0	\N	0	0.00	\N	\N	225.36	0.00	225.36	\N	\N	\N	CIENTO NOVENTA Y NUEVE DOLARESS 20/100	26.16	0.00	1	01	199.2		01			\N	\N	\N
24	DTE-03-CMPV0202-000000000003984	564B591C-2DA3-4204-A595-D9A740883E11	0.00	0.00	199.2	\N	\N	\N	199.2	0.00	0.00	0.00	\N	\N	0.00	0.00	\N	[{\\"codigo\\":\\"20\\",\\"descripcion\\":\\"Impuesto al Valor Agregado 13%\\",\\"valor\\":26.16}]	\N	199.2	\N	0	\N	0	0.00	\N	\N	225.36	0.00	225.36	\N	\N	\N	CIENTO NOVENTA Y NUEVE DOLARESS 20/100	26.16	0.00	1	01	199.2		01			\N	\N	\N
25	DTE-03-CMPV0202-000000000003985	02420099-5CD5-4F04-B6A3-448BAAF1B30B	0.00	0.00	199.2	\N	\N	\N	199.2	0.00	0.00	0.00	\N	\N	0.00	0.00	\N	[{\\"codigo\\":\\"20\\",\\"descripcion\\":\\"Impuesto al Valor Agregado 13%\\",\\"valor\\":26.16}]	\N	199.2	\N	0	\N	0	0.00	\N	\N	225.36	0.00	225.36	\N	\N	\N	CIENTO NOVENTA Y NUEVE DOLARESS 20/100	26.16	0.00	1	01	199.2		01			\N	\N	\N
26	DTE-03-CMPV0202-000000000003986	43AA7CEF-B070-46F6-89A0-18FEC495CCA8	0.00	0.00	199.2	\N	\N	\N	199.2	0.00	0.00	0.00	\N	\N	0.00	0.00	\N	[{\\"codigo\\":\\"20\\",\\"descripcion\\":\\"Impuesto al Valor Agregado 13%\\",\\"valor\\":26.16}]	\N	199.2	\N	0	\N	0	0.00	\N	\N	225.36	0.00	225.36	\N	\N	\N	CIENTO NOVENTA Y NUEVE DOLARESS 20/100	26.16	0.00	1	01	199.2		01			\N	\N	\N
27	DTE-03-CMPV0202-000000000003987	5D61675C-260E-44FD-A3BA-57805A5DA2D2	0.00	0.00	199.2	\N	\N	\N	199.2	0.00	0.00	0.00	\N	\N	0.00	0.00	\N	[{\\"codigo\\":\\"20\\",\\"descripcion\\":\\"Impuesto al Valor Agregado 13%\\",\\"valor\\":26.16}]	\N	199.2	\N	0	\N	0	0.00	\N	\N	225.36	0.00	225.36	\N	\N	\N	CIENTO NOVENTA Y NUEVE DOLARESS 20/100	26.16	0.00	1	01	199.2		01			\N	\N	\N
28	DTE-03-CMPV0202-000000000003988	6EB3F012-7404-46C4-908A-6F5175D8CE02	0.00	0.00	199.2	\N	\N	\N	199.2	0.00	0.00	0.00	\N	\N	0.00	0.00	\N	[{\\"codigo\\":\\"20\\",\\"descripcion\\":\\"Impuesto al Valor Agregado 13%\\",\\"valor\\":26.16}]	\N	199.2	\N	0	\N	0	0.00	\N	\N	225.36	0.00	225.36	\N	\N	\N	CIENTO NOVENTA Y NUEVE DOLARESS 20/100	26.16	0.00	1	01	199.2		01			\N	\N	\N
29	DTE-03-CMPV0202-000000000003989	9E76C69B-6AF3-41F0-A4BE-8C21E52D7CEB	0.00	0.00	199.2	\N	\N	\N	199.2	0.00	0.00	0.00	\N	\N	0.00	0.00	\N	[{\\"codigo\\":\\"20\\",\\"descripcion\\":\\"Impuesto al Valor Agregado 13%\\",\\"valor\\":26.16}]	\N	199.2	\N	0	\N	0	0.00	\N	\N	225.36	0.00	225.36	\N	\N	\N	CIENTO NOVENTA Y NUEVE DOLARESS 20/100	26.16	0.00	1	01	199.2		01			\N	\N	\N
30	DTE-03-CMPV0202-000000000003990	8A74DCB8-B243-4C27-9F97-125584B4B103	0.00	0.00	199.2	\N	\N	\N	199.2	0.00	0.00	0.00	\N	\N	0.00	0.00	\N	[{\\"codigo\\":\\"20\\",\\"descripcion\\":\\"Impuesto al Valor Agregado 13%\\",\\"valor\\":26.16}]	\N	199.2	\N	0	\N	0	0.00	\N	\N	225.36	0.00	225.36	\N	\N	\N	CIENTO NOVENTA Y NUEVE DOLARESS 20/100	26.16	0.00	1	01	199.2		01			\N	\N	\N
31	DTE-03-CMPV0202-000000000003991	584F066E-5FA3-4AEC-80FB-926901353051	0.00	0.00	199.2	\N	\N	\N	199.2	0.00	0.00	0.00	\N	\N	0.00	0.00	\N	[{\\"codigo\\":\\"20\\",\\"descripcion\\":\\"Impuesto al Valor Agregado 13%\\",\\"valor\\":26.16}]	\N	199.2	\N	0	\N	0	0.00	\N	\N	225.36	0.00	225.36	\N	\N	\N	CIENTO NOVENTA Y NUEVE DOLARESS 20/100	26.16	0.00	1	01	199.2		01			\N	\N	\N
32	DTE-03-CMPV0202-000000000003992	E9ABB697-938D-4924-A7E7-55C1C7E49AE0	0.00	0.00	199.2	\N	\N	\N	199.2	0.00	0.00	0.00	\N	\N	0.00	0.00	\N	[{\\"codigo\\":\\"20\\",\\"descripcion\\":\\"Impuesto al Valor Agregado 13%\\",\\"valor\\":26.16}]	\N	199.2	\N	0	\N	0	0.00	\N	\N	225.36	0.00	225.36	\N	\N	\N	CIENTO NOVENTA Y NUEVE DOLARESS 20/100	26.16	0.00	1	01	199.2		01			\N	\N	\N
33	DTE-03-CMPV0202-000000000003993	8C38260B-247F-4A78-B83F-2B76CDA85224	0.00	0.00	199.2	\N	\N	\N	199.2	0.00	0.00	0.00	\N	\N	0.00	0.00	\N	[{\\"codigo\\":\\"20\\",\\"descripcion\\":\\"Impuesto al Valor Agregado 13%\\",\\"valor\\":26.16}]	\N	199.2	\N	0	\N	0	0.00	\N	\N	225.36	0.00	225.36	\N	\N	\N	CIENTO NOVENTA Y NUEVE DOLARESS 20/100	26.16	0.00	1	01	199.2		01			\N	\N	\N
34	DTE-03-CMPV0202-000000000003994	1EEACAC8-002D-49E9-8E30-253F94D8AFC0	0.00	0.00	199.2	\N	\N	\N	199.2	0.00	0.00	0.00	\N	\N	0.00	0.00	\N	[{\\"codigo\\":\\"20\\",\\"descripcion\\":\\"Impuesto al Valor Agregado 13%\\",\\"valor\\":26.16}]	\N	199.2	\N	0	\N	0	0.00	\N	\N	225.36	0.00	225.36	\N	\N	\N	CIENTO NOVENTA Y NUEVE DOLARESS 20/100	26.16	0.00	1	01	199.2		01			\N	\N	\N
35	DTE-03-CMPV0202-000000000003995	B0093AF7-3309-4B8D-B839-C0EE01A359D6	0.00	0.00	199.2	\N	\N	\N	199.2	0.00	0.00	0.00	\N	\N	0.00	0.00	\N	[{\\"codigo\\":\\"20\\",\\"descripcion\\":\\"Impuesto al Valor Agregado 13%\\",\\"valor\\":26.16}]	\N	199.2	\N	0	\N	0	0.00	\N	\N	225.36	0.00	225.36	\N	\N	\N	CIENTO NOVENTA Y NUEVE DOLARESS 20/100	26.16	0.00	1	01	199.2		01			\N	\N	\N
36			0.00	0.00	0.00	\N	\N	\N	0.00	0.00	0.00	0.00	\N	\N	0.00	0.00	\N	\N	\N	0	\N	0.00	\N	0.00		\N	\N	0.00	0.00	0.00	\N	\N	\N	CERO DOLARESS 00/100	0.00	0.00	1	01	0.00		01			\N	\N	1
37	DTE-01-CMPV0202-000000000003999	A39C6F29-0A6D-4AC6-85EB-132E4C0EDBCF	0.00	0.00	10.00	\N	\N	\N	10.00	0.00	0.00	0.00	\N	\N	0.00	0.00	\N	\N	\N	10	\N	0.00	\N	0.00		\N	\N	10.00	0.00	10.00	\N	\N	\N	DIEZ DOLARESS 00/100	1.15	0.00	1	01	10.00		01	1		\N	\N	1
\.


--
-- Data for Name: rol; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.rol (id, nombre, codigo, descripcion) FROM stdin;
\.


--
-- Data for Name: rol_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.rol_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: rol_menu; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.rol_menu (rol_id, menu_id) FROM stdin;
\.


--
-- Data for Name: saldo_cuenta_contable; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.saldo_cuenta_contable (salcc_id, mes, anio, codcuenta, saldo_final, saldo_inicial, debe, haber, debe_anterior, haber_anterior) FROM stdin;
\.


--
-- Data for Name: saldo_cuenta_contable_salcc_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.saldo_cuenta_contable_salcc_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: salidas_prod; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.salidas_prod (id, entrada_prod, prod_salida, mov_salida, cant_salida, pres_salida, cant_pres_salida) FROM stdin;
\.


--
-- Data for Name: salidas_prod_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.salidas_prod_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: seccionesxdoc; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.seccionesxdoc (id, seccion, tipodte, items) FROM stdin;
\.


--
-- Data for Name: seg_det_venta_prod_serv; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.seg_det_venta_prod_serv (vtaprsv_id, monto, cantidad, detalle, escondido, detalle_resumen, precio_unitario, tipo_venta, cantidad_descuento, garantia, abreviatura_uni, costo_mercaderia, producto_id, servicio_id, venta_id) FROM stdin;
\.


--
-- Data for Name: seg_det_venta_prod_serv_vtaprsv_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.seg_det_venta_prod_serv_vtaprsv_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: seg_venta_prod_serv; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.seg_venta_prod_serv (vtaprsv_id, total, monto, estado, forma_pago, num_serie, tipo_venta, fecha_venta, percibido, retenido, iva, id_detalle, tipo_descuento, cantidad_descuento, no_sujetas, exentas, gravadas, prc_tarjeta, id_movimiento, tipo_de_documento, num_extranjero, pago_efectivo, pago_tarjeta, pago_cheque, pago_anticipo, cambio, num_documento, sin_banderas, costo_mercaderia, num_doc_ini, num_doc_fin, cod_aut_tick, ya_devuelta, cod_comprobante, usrdsc_id, venta_prodserv_id, client_id, odt_id, usrefe_id, sucursal_id) FROM stdin;
\.


--
-- Data for Name: seg_venta_prod_serv_vtaprsv_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.seg_venta_prod_serv_vtaprsv_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: seguro_producto; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.seguro_producto (sgrprd_id, estado, nombre, descripcion, referencia, prc_normal, tipo_seguro) FROM stdin;
\.


--
-- Data for Name: seguro_producto_sgrprd_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.seguro_producto_sgrprd_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: servicio_venta; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.servicio_venta (srvvta_id, estado, nombre, descripcion, exento, no_sujeto, referencia, prc_normal, prc_mayoreo, gravable, sgrprd_id) FROM stdin;
\.


--
-- Data for Name: servicio_venta_srvvta_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.servicio_venta_srvvta_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: sub_tipo_cuenta; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.sub_tipo_cuenta (sub_tipo_cuenta_id, codigo, nombre, cdp_id, cifrado_sub_tipo) FROM stdin;
\.


--
-- Data for Name: sub_tipo_cuenta_sub_tipo_cuenta_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.sub_tipo_cuenta_sub_tipo_cuenta_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: submenus; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.submenus (id, nombre, url, id_menuprin) FROM stdin;
1	Factura Venta Cafe	mhdte/Cuerpodocumento/?Cat=CC	1
2	Factura Ferreteria	mhdte/Cuerpodocumento/?Cat=CF	1
3	Factura Consignacion	mhdte/Cuerpodocumento/?Cat=CO	1
4	Factura Oficina	mhdte/Cuerpodocumento/fcof/?Cat=OF	1
5	Factura Combustible	mhdte/Cuerpodocumento/fgas/?Cat=CG	1
6	Factura Exportacion	mhdte/Cuerpodocumento/FacturaExp/?Cat=EX	1
7	F. Excluido Compras	mhdte/ServiciosGenerales/	1
8	F. Excluido Pagos Servicios	mhdte/ServiciosGenerales/fsep	1
9	Comp. Retencion	mhdte/ServiciosGenerales/comrete	1
10	Nota de Credito	mhdte/ServiciosGenerales/Notcredi	1
11	Ingresos de Compra	mhdte/comprasComp/	1
12	Nota de Remisi�n	mhdte/ServiciosGenerales/NotRemicion	1
13	Envio de DTE a Cobol	mhdte/Integracion/IntegraCobol	2
14	Generar Contingencia	mhdte/Integracion/Contingencia	2
15	Pago de Intereses	mhdte/Integracion/cargaIntereses	2
16	Anulaciones DTE	mhdte/Integracion/AnulacionDte	2
17	Reportes a Cobol	mhdte/Integracion/ReporteReimpresion	3
18	Reporte Anulaciones	mhdte/Integracion/DescargaAnulacion	3
19	Reporte Consultas Gen.	mhdte/Integracion/ConsultasGen	3
20	Reporte Por Usuario	mhdte/Integracion/ConsultasGenUser	3
21	Autenticar en MH	mhdte/Integracion/	\N
\.


--
-- Data for Name: suc_cert_descuento; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.suc_cert_descuento (detdesc_id, crtdsc_id, sucursal_id) FROM stdin;
\.


--
-- Data for Name: suc_cert_descuento_detdesc_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.suc_cert_descuento_detdesc_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: suc_prod; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.suc_prod (sucursal_id, producto_id) FROM stdin;
\.


--
-- Data for Name: suceso_moto; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.suceso_moto (id, fecha, tipo, descripcion, emp_id) FROM stdin;
\.


--
-- Data for Name: suceso_moto_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.suceso_moto_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: sucursal; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.sucursal (id, nombre, codigo, estado, tipo, direccion, num_resolucion, fecha_resolucion, serie, correlativo) FROM stdin;
\.


--
-- Data for Name: sucursal_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.sucursal_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: susp_pago_prestamo; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.susp_pago_prestamo (sspgprs_id, mes, anio, periodo, num_quincena, prstemp_id) FROM stdin;
\.


--
-- Data for Name: susp_pago_prestamo_sspgprs_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.susp_pago_prestamo_sspgprs_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: tblc_x_pago; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.tblc_x_pago (id, tipopag, cuentaxpago, areafac) FROM stdin;
1	01	1110102	CF
4	03	1110102	CF
5	04	1130602	CF
6	01	1110103	CO
7	03	1110103	CO
8	04	1130602	CO
9	01	1110101	OF
10	03	1110101	OF
11	04	1130601	OF
12	01	1110104	CG
13	03	1110104	CG
14	04	1130602	CG
15	01	0	CC
16	03	0	CC
17	04	0	CC
18	01	0	EX
19	03	0	EX
20	04	0	EX
21	01	0	SE
22	03	0	SE
23	04	0	SE
24	01	0	SG
25	03	0	SG
26	04	0	SG
\.


--
-- Data for Name: tblcxvendedor; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.tblcxvendedor (id, cod_usuario, cuentaefe, cuentacred, codcobol) FROM stdin;
1	fsalinas	111010501	113014214	00
2	ccastro	111010501	113014214	01
3	fmendoza	111010502	113014212	02
4	ggonzales	111010503	113014215	03
5	vmaquilas	111010504	\N	04
6	jsorto	111010505	113014213	05
7	rdue�as	111010506	113014217	06
8	dgarcia	0000000	0000000	00
\.


--
-- Data for Name: tblimpuestosvariables; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.tblimpuestosvariables ("tipoImpuesto", valor, estado, noseva) FROM stdin;
COTRANS	0.10	2	8
FOVIAL	0.20	1	5
IVA1	0.01	6	1
IVA13	0.13	3	1
RENTA	0.015	4	1
RENTAEX	0.10	5	1
\.


--
-- Data for Name: tblusuario; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.tblusuario ("cUsuario", "cNombre", "cClave", "cUname", "cEstatus", "areafact") FROM stdin;
1	David Garcia	711383a59fda05336fd2ccf70c8059d1523eb41a	dgarcia	1	CC
2	Fausto Salinas	f7c3bc1d808e04732adf679965ccc34ca7ae3441	fsalinas	1	CO
3	Fausto Salinas Segundo	f7c3bc1d808e04732adf679965ccc34ca7ae3441	fsalinas2	1	CF
4	Cristian Castro	f7c3bc1d808e04732adf679965ccc34ca7ae3441	ccastro	1	CC
5	Fernando Mendoza	f7c3bc1d808e04732adf679965ccc34ca7ae3441	fmendoza	1	CC
6	Guadalupe Gonzales	f7c3bc1d808e04732adf679965ccc34ca7ae3441	ggonzales	1	CC
7	Venta Maquilas	f7c3bc1d808e04732adf679965ccc34ca7ae3441	vmaquilas	1	CC
8	Jorge Sorto	f7c3bc1d808e04732adf679965ccc34ca7ae3441	jsorto	1	CC
9	Roberto Due�as	f7c3bc1d808e04732adf679965ccc34ca7ae3441	rdue�as	1	CC
\.


--
-- Data for Name: tipo_activo; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.tipo_activo (tipo_activo_id, nombre) FROM stdin;
\.


--
-- Data for Name: tipo_activo_tipo_activo_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.tipo_activo_tipo_activo_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: tipo_cuenta; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.tipo_cuenta (cdp_id, codigo, nombre, clasificacion, corr_cta) FROM stdin;
\.


--
-- Data for Name: tipo_cuenta_cdp_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.tipo_cuenta_cdp_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: tipo_partida; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.tipo_partida (tipptd_id, nombre, codigo, descripcion) FROM stdin;
\.


--
-- Data for Name: tipo_partida_tipptd_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.tipo_partida_tipptd_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: transferencia; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.transferencia (id, estado, observacion_destino, fecha_recibo, entrada_id, sucursal_destino_id, usuario_genera_id, costo, lote, libras, unidades) FROM stdin;
\.


--
-- Data for Name: transferencia_flash; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.transferencia_flash (id, estado, fecha_envio, entrada_id, usuario_genera_id, sucursal_destino_id, codigo, tipo_transferencia, total_transferido, pedido_id, lacteos, varios, prod_rec) FROM stdin;
\.


--
-- Data for Name: unidad_medida; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.unidad_medida (unimed_id, tipo, estado, nombre, principal, factor_conversion, abreviatura) FROM stdin;
\.


--
-- Data for Name: unidad_medida_unimed_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.unidad_medida_unimed_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: unidad_producto; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.unidad_producto (uniprd_id, uni_id, prd_id) FROM stdin;
\.


--
-- Data for Name: unidad_producto_uniprd_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.unidad_producto_uniprd_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.usuario (id, estado, nombre_usuario, pass, fecha_ultimo_acceso, numero_intentos, nombre_completo, accion_especial, rol_id, sucursal_id, cod_vendedor, notificacion_inv) FROM stdin;
\.


--
-- Data for Name: usuario_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.usuario_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: vacaciones; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.vacaciones (vacaciones_id, anio, fecha_inicio, dias, empleado_id, descansadas) FROM stdin;
\.


--
-- Data for Name: vacaciones_vacaciones_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.vacaciones_vacaciones_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: venta_prod_serv; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.venta_prod_serv (vtaprsv_id, total, estado, monto, fecha_venta, tipo_venta, percibido, retenido, iva, id_detalle, tipo_descuento, cantidad_descuento, no_sujetas, exentas, prc_tarjeta, id_movimiento, tipo_de_documento, sucursal_id, usrefe_id, client_id, usrdsc_id, odt_id, num_extranjero, forma_pago, pago_efectivo, cambio, num_serie, num_documento, pago_tarjeta, pago_cheque, pago_anticipo, gravadas, cxc_id, ya_devuelta, sin_banderas, cod_comprobante, costo_mercaderia, num_doc_ini, num_doc_fin, cod_aut_tick, proveedor_id, rutero) FROM stdin;
\.


--
-- Data for Name: venta_prod_serv_vtaprsv_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.venta_prod_serv_vtaprsv_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


--
-- Data for Name: ventas_consumidor_final; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.ventas_consumidor_final (id, fecha, documento_ini, documento_fin, ventas_propias_gravadas, ventas_propias_exentas, exportaciones, ventas_a_terceros, retencion_percepcion, total_ventas, estado, maquina_registradora, sucursal_id, valor_iva) FROM stdin;
\.


--
-- Data for Name: ventas_consumidor_final_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.ventas_consumidor_final_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.



--
-- Data for Name: viaticos; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.viaticos (viaticos_id, descripcion, cantidad, fecha_entrega, empleado_id, permanente, periodo) FROM stdin;
\.


--
-- Data for Name: viaticos_viaticos_id_seq; Type: TABLE DATA; Schema: public; Owner: saplic_dprlac_user
--

COPY public.viaticos_viaticos_id_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) FROM stdin;
1	1	9223372036854775806	1	1	1	0	0
\.


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


--
-- Name: compras compras_pkey; Type: CONSTRAINT; Schema: public; Owner: saplic_dprlac_user
--

ALTER TABLE ONLY public.compras
    ADD CONSTRAINT compras_pkey PRIMARY KEY (id);


--
-- Name: controlcodigos controlcodigos_pkey; Type: CONSTRAINT; Schema: public; Owner: saplic_dprlac_user
--

ALTER TABLE ONLY public.controlcodigos
    ADD CONSTRAINT controlcodigos_pkey PRIMARY KEY (id);


--
-- Name: Cuerpodocumento Cuerpodocumento_pkey; Type: CONSTRAINT; Schema: public; Owner: saplic_dprlac_user
--

ALTER TABLE ONLY public.Cuerpodocumento
    ADD CONSTRAINT Cuerpodocumento_pkey PRIMARY KEY (identificador);


--
-- Name: det_compras det_compras_pkey; Type: CONSTRAINT; Schema: public; Owner: saplic_dprlac_user
--

ALTER TABLE ONLY public.det_compras
    ADD CONSTRAINT det_compras_pkey PRIMARY KEY (id);


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
-- Name: menus menus_pkey; Type: CONSTRAINT; Schema: public; Owner: saplic_dprlac_user
--

ALTER TABLE ONLY public.menus
    ADD CONSTRAINT menus_pkey PRIMARY KEY (id);


--
-- Name: productos productos_pkey; Type: CONSTRAINT; Schema: public; Owner: saplic_dprlac_user
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (id);


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


--
-- Name: resumen resumen_pkey; Type: CONSTRAINT; Schema: public; Owner: saplic_dprlac_user
--

ALTER TABLE ONLY public.resumen
    ADD CONSTRAINT resumen_pkey PRIMARY KEY (id);


--
-- Name: seccionesxdoc seccionesxdoc_pkey; Type: CONSTRAINT; Schema: public; Owner: saplic_dprlac_user
--

ALTER TABLE ONLY public.seccionesxdoc
    ADD CONSTRAINT seccionesxdoc_pkey PRIMARY KEY (id);


--
-- Name: submenus submenus_pkey; Type: CONSTRAINT; Schema: public; Owner: saplic_dprlac_user
--

ALTER TABLE ONLY public.submenus
    ADD CONSTRAINT submenus_pkey PRIMARY KEY (id);


--
-- Name: tblc_x_pago tblc_x_pago_pkey; Type: CONSTRAINT; Schema: public; Owner: saplic_dprlac_user
--

ALTER TABLE ONLY public.tblc_x_pago
    ADD CONSTRAINT tblc_x_pago_pkey PRIMARY KEY (id);


--
-- Name: tblcxvendedor tblcxvendedor_pkey; Type: CONSTRAINT; Schema: public; Owner: saplic_dprlac_user
--

ALTER TABLE ONLY public.tblcxvendedor
    ADD CONSTRAINT tblcxvendedor_pkey PRIMARY KEY (id);


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

