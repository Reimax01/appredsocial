--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3
-- Dumped by pg_dump version 13.3

-- Started on 2021-07-23 22:23:53

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
-- TOC entry 200 (class 1259 OID 16396)
-- Name: filtros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.filtros (
    id_filtro bigint NOT NULL,
    nombre_filtro character varying(20),
    imagen_filtro character varying(100)
)
WITH (autovacuum_enabled='true');


ALTER TABLE public.filtros OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16399)
-- Name: Filtros_id_filtro_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Filtros_id_filtro_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Filtros_id_filtro_seq" OWNER TO postgres;

--
-- TOC entry 3366 (class 0 OID 0)
-- Dependencies: 201
-- Name: Filtros_id_filtro_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Filtros_id_filtro_seq" OWNED BY public.filtros.id_filtro;


--
-- TOC entry 202 (class 1259 OID 16401)
-- Name: amigos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.amigos (
    es_aceptada boolean,
    fecha_emision_amigo date,
    fecha_aceptacion_amigo date,
    es_seguido boolean,
    es_seguidor boolean,
    es_bloqueado boolean,
    id_usuario bigint,
    id_amigo bigint
)
WITH (autovacuum_enabled='true');


ALTER TABLE public.amigos OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16404)
-- Name: chat; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chat (
    id_chat bigint NOT NULL,
    fecha date,
    nomb_chat character varying
)
WITH (autovacuum_enabled='true');


ALTER TABLE public.chat OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16410)
-- Name: chat_id_chat_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.chat_id_chat_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chat_id_chat_seq OWNER TO postgres;

--
-- TOC entry 3367 (class 0 OID 0)
-- Dependencies: 204
-- Name: chat_id_chat_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.chat_id_chat_seq OWNED BY public.chat.id_chat;


--
-- TOC entry 205 (class 1259 OID 16412)
-- Name: archivo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.archivo (
    id_archivo bigint NOT NULL,
    nombre_archivo text,
    id_chat bigint DEFAULT nextval('public.chat_id_chat_seq'::regclass)
)
WITH (autovacuum_enabled='true');


ALTER TABLE public.archivo OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16419)
-- Name: archivo_id_archivo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.archivo_id_archivo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.archivo_id_archivo_seq OWNER TO postgres;

--
-- TOC entry 3368 (class 0 OID 0)
-- Dependencies: 206
-- Name: archivo_id_archivo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.archivo_id_archivo_seq OWNED BY public.archivo.id_archivo;


--
-- TOC entry 207 (class 1259 OID 16421)
-- Name: cant_reac; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cant_reac (
    id_pub bigint,
    id_usuario bigint,
    id_reac bigint,
    id_cant_reac bigint NOT NULL
)
WITH (autovacuum_enabled='true');


ALTER TABLE public.cant_reac OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16424)
-- Name: cant_reac_id_can_reac_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cant_reac_id_can_reac_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cant_reac_id_can_reac_seq OWNER TO postgres;

--
-- TOC entry 3369 (class 0 OID 0)
-- Dependencies: 208
-- Name: cant_reac_id_can_reac_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cant_reac_id_can_reac_seq OWNED BY public.cant_reac.id_cant_reac;


--
-- TOC entry 209 (class 1259 OID 16426)
-- Name: catalogo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.catalogo (
    id_catalogo bigint NOT NULL,
    nombre_catalogo text
);


ALTER TABLE public.catalogo OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16432)
-- Name: catalogo_id_catalogo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.catalogo_id_catalogo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.catalogo_id_catalogo_seq OWNER TO postgres;

--
-- TOC entry 3370 (class 0 OID 0)
-- Dependencies: 210
-- Name: catalogo_id_catalogo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.catalogo_id_catalogo_seq OWNED BY public.catalogo.id_catalogo;


--
-- TOC entry 211 (class 1259 OID 16434)
-- Name: comentario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comentario (
    id_com bigint NOT NULL,
    contenido_com text,
    fecha_hora_com timestamp with time zone,
    id_usuario bigint,
    id_pub bigint
)
WITH (autovacuum_enabled='true');


ALTER TABLE public.comentario OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16440)
-- Name: comentario_detalle; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comentario_detalle (
    id_com bigint,
    id_com_resp bigint
)
WITH (autovacuum_enabled='true');


ALTER TABLE public.comentario_detalle OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16443)
-- Name: comentario_id_com_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comentario_id_com_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comentario_id_com_seq OWNER TO postgres;

--
-- TOC entry 3371 (class 0 OID 0)
-- Dependencies: 213
-- Name: comentario_id_com_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comentario_id_com_seq OWNED BY public.comentario.id_com;


--
-- TOC entry 214 (class 1259 OID 16445)
-- Name: comentario_respuesta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comentario_respuesta (
    id_com_resp bigint NOT NULL,
    contenido_com_resp text,
    fecha_hora_com_resp timestamp with time zone,
    id_usuario bigint
)
WITH (autovacuum_enabled='true');


ALTER TABLE public.comentario_respuesta OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16451)
-- Name: comentario_respuesta_id_com_resp_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comentario_respuesta_id_com_resp_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comentario_respuesta_id_com_resp_seq OWNER TO postgres;

--
-- TOC entry 3372 (class 0 OID 0)
-- Dependencies: 215
-- Name: comentario_respuesta_id_com_resp_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comentario_respuesta_id_com_resp_seq OWNED BY public.comentario_respuesta.id_com_resp;


--
-- TOC entry 216 (class 1259 OID 16453)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    id_usuario bigint NOT NULL,
    nombres_usuario character varying(20),
    apellidos_usuario character varying(20),
    fecha_nac_usuario date,
    email_usuario character varying(40),
    contrasena_usuario text,
    presentacion_usuario text,
    telefono_usuario character varying(15),
    nom_usuario character varying(20),
    imagen_usuario text,
    id_genero bigint
)
WITH (autovacuum_enabled='true');


ALTER TABLE public.usuario OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16459)
-- Name: usuario_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuario_id_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuario_id_usuario_seq OWNER TO postgres;

--
-- TOC entry 3373 (class 0 OID 0)
-- Dependencies: 217
-- Name: usuario_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_id_usuario_seq OWNED BY public.usuario.id_usuario;


--
-- TOC entry 218 (class 1259 OID 16461)
-- Name: compra_venta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.compra_venta (
    id_comp_vent bigint NOT NULL,
    tipo character varying(20),
    descuento_comp_vent double precision,
    impuesto0_comp_vent double precision,
    impuesto_comp_vent double precision,
    subtotal_comp_vent double precision,
    total_comp_vent double precision,
    id_usuario bigint DEFAULT nextval('public.usuario_id_usuario_seq'::regclass)
);


ALTER TABLE public.compra_venta OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16465)
-- Name: compra_venta_id_comp_vent_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.compra_venta_id_comp_vent_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.compra_venta_id_comp_vent_seq OWNER TO postgres;

--
-- TOC entry 3374 (class 0 OID 0)
-- Dependencies: 219
-- Name: compra_venta_id_comp_vent_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.compra_venta_id_comp_vent_seq OWNED BY public.compra_venta.id_comp_vent;


--
-- TOC entry 220 (class 1259 OID 16467)
-- Name: comunidades; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comunidades (
    id_comunidad bigint NOT NULL,
    nombre_comunidad character varying(40),
    descripcion_comunidad text,
    imagen_comunidad text,
    id_usuario bigint
)
WITH (autovacuum_enabled='true');


ALTER TABLE public.comunidades OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16473)
-- Name: comunidades_id_comunidad_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comunidades_id_comunidad_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comunidades_id_comunidad_seq OWNER TO postgres;

--
-- TOC entry 3375 (class 0 OID 0)
-- Dependencies: 221
-- Name: comunidades_id_comunidad_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comunidades_id_comunidad_seq OWNED BY public.comunidades.id_comunidad;


--
-- TOC entry 222 (class 1259 OID 16475)
-- Name: detalle_comp_vent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.detalle_comp_vent (
    id_producto bigint,
    id_comp_vent bigint NOT NULL
);


ALTER TABLE public.detalle_comp_vent OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16478)
-- Name: detalle_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.detalle_product (
    id_catalogo bigint NOT NULL,
    id_producto bigint NOT NULL
);


ALTER TABLE public.detalle_product OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16481)
-- Name: evento_id_evento_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.evento_id_evento_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999
    CACHE 1;


ALTER TABLE public.evento_id_evento_seq OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16483)
-- Name: evento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.evento (
    id_evento bigint DEFAULT nextval('public.evento_id_evento_seq'::regclass) NOT NULL,
    fecha_hora_evento timestamp with time zone,
    lugar_evento character varying(40),
    logo character varying(250),
    nombre_evento character varying,
    fecha_finalizacion timestamp with time zone
);


ALTER TABLE public.evento OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16490)
-- Name: genero_id_genero_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.genero_id_genero_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.genero_id_genero_seq OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16492)
-- Name: genero; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.genero (
    id_genero bigint DEFAULT nextval('public.genero_id_genero_seq'::regclass) NOT NULL,
    nombre_genero character varying(10)
);


ALTER TABLE public.genero OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16496)
-- Name: historia_detalle; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.historia_detalle (
    id_historia bigint,
    id_usuario bigint,
    id_reaccion bigint
)
WITH (autovacuum_enabled='true');


ALTER TABLE public.historia_detalle OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16499)
-- Name: historias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.historias (
    id_historia bigint NOT NULL,
    imagen_historia text,
    id_usuario bigint
)
WITH (autovacuum_enabled='true');


ALTER TABLE public.historias OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16505)
-- Name: historias_id_historia_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.historias_id_historia_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.historias_id_historia_seq OWNER TO postgres;

--
-- TOC entry 3376 (class 0 OID 0)
-- Dependencies: 230
-- Name: historias_id_historia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.historias_id_historia_seq OWNED BY public.historias.id_historia;


--
-- TOC entry 231 (class 1259 OID 16507)
-- Name: invitados_evento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.invitados_evento (
    id_invitado bigint NOT NULL,
    id_evento bigint,
    estado_evento character(20),
    id_usuario bigint
)
WITH (autovacuum_enabled='true');


ALTER TABLE public.invitados_evento OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16510)
-- Name: invitados_evento_id_invitado_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.invitados_evento_id_invitado_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.invitados_evento_id_invitado_seq OWNER TO postgres;

--
-- TOC entry 3377 (class 0 OID 0)
-- Dependencies: 232
-- Name: invitados_evento_id_invitado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.invitados_evento_id_invitado_seq OWNED BY public.invitados_evento.id_invitado;


--
-- TOC entry 233 (class 1259 OID 16512)
-- Name: mark_place; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mark_place (
    id_mark bigint NOT NULL,
    contenido_mark text,
    lugar_mark text,
    id_usuario bigint DEFAULT nextval('public.usuario_id_usuario_seq'::regclass)
);


ALTER TABLE public.mark_place OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 16519)
-- Name: mark_place_id_mark_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mark_place_id_mark_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mark_place_id_mark_seq OWNER TO postgres;

--
-- TOC entry 3378 (class 0 OID 0)
-- Dependencies: 234
-- Name: mark_place_id_mark_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mark_place_id_mark_seq OWNED BY public.mark_place.id_mark;


--
-- TOC entry 235 (class 1259 OID 16521)
-- Name: mensaje; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mensaje (
    id_mensaje bigint NOT NULL,
    mensaje text,
    estado character(20),
    fecha_hora_mensaje timestamp with time zone,
    id_chat bigint,
    id_usuario bigint,
    ruta_archivo text,
    file_name text
)
WITH (autovacuum_enabled='true');


ALTER TABLE public.mensaje OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 16527)
-- Name: mensaje_id_mensaje_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mensaje_id_mensaje_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mensaje_id_mensaje_seq OWNER TO postgres;

--
-- TOC entry 3379 (class 0 OID 0)
-- Dependencies: 236
-- Name: mensaje_id_mensaje_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mensaje_id_mensaje_seq OWNED BY public.mensaje.id_mensaje;


--
-- TOC entry 237 (class 1259 OID 16529)
-- Name: miembros_comunidad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.miembros_comunidad (
    id_comunidad bigint,
    id_usuario bigint
)
WITH (autovacuum_enabled='true');


ALTER TABLE public.miembros_comunidad OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 16532)
-- Name: multimedia_publicacion_id_mult_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.multimedia_publicacion_id_mult_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999
    CACHE 1;


ALTER TABLE public.multimedia_publicacion_id_mult_seq OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 16534)
-- Name: multimedia_publicacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.multimedia_publicacion (
    id_pub bigint,
    contenido_mult text,
    id_type bigint,
    id_filtro bigint,
    id_mult bigint DEFAULT nextval('public.multimedia_publicacion_id_mult_seq'::regclass) NOT NULL
);


ALTER TABLE public.multimedia_publicacion OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 16541)
-- Name: notif_detalle; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notif_detalle (
    id_notif bigint,
    id_usuario bigint
)
WITH (autovacuum_enabled='true');


ALTER TABLE public.notif_detalle OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 16544)
-- Name: notificaciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notificaciones (
    id_notif bigint NOT NULL,
    contenido_notif text,
    fecha_hora_notif timestamp with time zone,
    leida_notif boolean
)
WITH (autovacuum_enabled='true');


ALTER TABLE public.notificaciones OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 16550)
-- Name: notificaciones_id_notif_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.notificaciones_id_notif_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notificaciones_id_notif_seq OWNER TO postgres;

--
-- TOC entry 3380 (class 0 OID 0)
-- Dependencies: 242
-- Name: notificaciones_id_notif_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notificaciones_id_notif_seq OWNED BY public.notificaciones.id_notif;


--
-- TOC entry 243 (class 1259 OID 16552)
-- Name: organizador; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.organizador (
    id_organizador bigint NOT NULL,
    id_evento bigint,
    id_usuario bigint
)
WITH (autovacuum_enabled='true');


ALTER TABLE public.organizador OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 16555)
-- Name: organizador_id_organizador_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.organizador_id_organizador_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.organizador_id_organizador_seq OWNER TO postgres;

--
-- TOC entry 3381 (class 0 OID 0)
-- Dependencies: 244
-- Name: organizador_id_organizador_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.organizador_id_organizador_seq OWNED BY public.organizador.id_organizador;


--
-- TOC entry 245 (class 1259 OID 16557)
-- Name: productos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productos (
    id_producto bigint NOT NULL,
    nombre_producto text,
    descripcion_producto text,
    imagen_product text,
    precio_product double precision,
    id_mark bigint
);


ALTER TABLE public.productos OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 16563)
-- Name: productos_id_producto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.productos_id_producto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.productos_id_producto_seq OWNER TO postgres;

--
-- TOC entry 3382 (class 0 OID 0)
-- Dependencies: 246
-- Name: productos_id_producto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.productos_id_producto_seq OWNED BY public.productos.id_producto;


--
-- TOC entry 247 (class 1259 OID 16565)
-- Name: publicacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.publicacion (
    id_pub bigint NOT NULL,
    contenido_pub text,
    fecha_bub timestamp without time zone,
    id_usuario bigint DEFAULT nextval('public.usuario_id_usuario_seq'::regclass),
    id_type bigint
)
WITH (autovacuum_enabled='true');


ALTER TABLE public.publicacion OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 16572)
-- Name: publicacion_id_pub_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.publicacion_id_pub_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.publicacion_id_pub_seq OWNER TO postgres;

--
-- TOC entry 3383 (class 0 OID 0)
-- Dependencies: 248
-- Name: publicacion_id_pub_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.publicacion_id_pub_seq OWNED BY public.publicacion.id_pub;


--
-- TOC entry 249 (class 1259 OID 16574)
-- Name: reacciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reacciones (
    id_reac bigint NOT NULL,
    nom_reac text
)
WITH (autovacuum_enabled='true');


ALTER TABLE public.reacciones OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 16580)
-- Name: reacciones_id_reac_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reacciones_id_reac_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reacciones_id_reac_seq OWNER TO postgres;

--
-- TOC entry 3384 (class 0 OID 0)
-- Dependencies: 250
-- Name: reacciones_id_reac_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reacciones_id_reac_seq OWNED BY public.reacciones.id_reac;


--
-- TOC entry 251 (class 1259 OID 16582)
-- Name: tipo_evento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_evento (
    id_tipo bigint NOT NULL,
    nombre_tipo text,
    id_evento bigint
)
WITH (autovacuum_enabled='true');


ALTER TABLE public.tipo_evento OWNER TO postgres;

--
-- TOC entry 252 (class 1259 OID 16588)
-- Name: tipo_evento_id_tipo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipo_evento_id_tipo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_evento_id_tipo_seq OWNER TO postgres;

--
-- TOC entry 3385 (class 0 OID 0)
-- Dependencies: 252
-- Name: tipo_evento_id_tipo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipo_evento_id_tipo_seq OWNED BY public.tipo_evento.id_tipo;


--
-- TOC entry 253 (class 1259 OID 16590)
-- Name: tipo_notif; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_notif (
    id_tipo_notif bigint NOT NULL,
    nombre_tipo_notif bigint
);


ALTER TABLE public.tipo_notif OWNER TO postgres;

--
-- TOC entry 254 (class 1259 OID 16593)
-- Name: tipo_notif_id_tipo_notif_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipo_notif_id_tipo_notif_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_notif_id_tipo_notif_seq OWNER TO postgres;

--
-- TOC entry 3386 (class 0 OID 0)
-- Dependencies: 254
-- Name: tipo_notif_id_tipo_notif_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipo_notif_id_tipo_notif_seq OWNED BY public.tipo_notif.id_tipo_notif;


--
-- TOC entry 255 (class 1259 OID 16595)
-- Name: tipo_pub; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_pub (
    id_type bigint NOT NULL,
    cont_type text
)
WITH (autovacuum_enabled='true');


ALTER TABLE public.tipo_pub OWNER TO postgres;

--
-- TOC entry 256 (class 1259 OID 16601)
-- Name: tipo_pub_id_type_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipo_pub_id_type_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_pub_id_type_seq OWNER TO postgres;

--
-- TOC entry 3387 (class 0 OID 0)
-- Dependencies: 256
-- Name: tipo_pub_id_type_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipo_pub_id_type_seq OWNED BY public.tipo_pub.id_type;


--
-- TOC entry 257 (class 1259 OID 16603)
-- Name: usuario_chat; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario_chat (
    id_usuario bigint,
    id_chat bigint
)
WITH (autovacuum_enabled='true');


ALTER TABLE public.usuario_chat OWNER TO postgres;

--
-- TOC entry 258 (class 1259 OID 16606)
-- Name: view_eventos; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_eventos AS
 SELECT invitados_evento.id_invitado,
    evento.nombre_evento,
    invitados_evento.id_evento,
    invitados_evento.estado_evento,
    invitados_evento.id_usuario,
    usuario.nom_usuario,
    usuario.imagen_usuario,
    ( SELECT organizador.id_usuario
           FROM public.organizador
          WHERE (organizador.id_evento = invitados_evento.id_evento)) AS organizador
   FROM ((public.invitados_evento
     JOIN public.evento ON ((invitados_evento.id_evento = evento.id_evento)))
     JOIN public.usuario ON ((invitados_evento.id_usuario = usuario.id_usuario)))
  ORDER BY invitados_evento.id_invitado DESC;


ALTER TABLE public.view_eventos OWNER TO postgres;

--
-- TOC entry 259 (class 1259 OID 16611)
-- Name: view_get_comentarios; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_get_comentarios AS
 SELECT comentario.id_com,
    comentario.contenido_com,
    comentario.id_pub,
    comentario.id_usuario,
    comentario.fecha_hora_com,
    usuario.nom_usuario,
    ( SELECT usuario.nom_usuario
           FROM public.publicacion
          WHERE (publicacion.id_pub = comentario.id_pub)) AS autor_publicacion
   FROM (public.comentario
     JOIN public.usuario ON ((comentario.id_usuario = usuario.id_usuario)));


ALTER TABLE public.view_get_comentarios OWNER TO postgres;

--
-- TOC entry 260 (class 1259 OID 16616)
-- Name: view_get_reaccion; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_get_reaccion AS
 SELECT cant_reac.id_cant_reac AS id_can_reac,
    cant_reac.id_pub,
    cant_reac.id_usuario,
    cant_reac.id_reac,
    usuario.nom_usuario
   FROM ((public.cant_reac
     JOIN public.publicacion ON ((cant_reac.id_pub = publicacion.id_pub)))
     JOIN public.usuario ON ((cant_reac.id_usuario = usuario.id_usuario)))
  ORDER BY cant_reac.id_cant_reac;


ALTER TABLE public.view_get_reaccion OWNER TO postgres;

--
-- TOC entry 261 (class 1259 OID 16620)
-- Name: view_mensaje; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_mensaje AS
 SELECT mensaje.id_mensaje,
    mensaje.mensaje,
    mensaje.estado,
    mensaje.fecha_hora_mensaje,
    mensaje.ruta_archivo,
    mensaje.file_name,
    usuario.id_usuario,
    usuario.nom_usuario,
    usuario.imagen_usuario,
    chat.id_chat,
    chat.fecha
   FROM ((public.mensaje
     JOIN public.usuario ON ((mensaje.id_usuario = usuario.id_usuario)))
     JOIN public.chat ON ((mensaje.id_chat = chat.id_chat)))
  ORDER BY mensaje.id_mensaje DESC;


ALTER TABLE public.view_mensaje OWNER TO postgres;

--
-- TOC entry 3063 (class 2604 OID 16625)
-- Name: archivo id_archivo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.archivo ALTER COLUMN id_archivo SET DEFAULT nextval('public.archivo_id_archivo_seq'::regclass);


--
-- TOC entry 3064 (class 2604 OID 16626)
-- Name: cant_reac id_cant_reac; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cant_reac ALTER COLUMN id_cant_reac SET DEFAULT nextval('public.cant_reac_id_can_reac_seq'::regclass);


--
-- TOC entry 3065 (class 2604 OID 16627)
-- Name: catalogo id_catalogo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catalogo ALTER COLUMN id_catalogo SET DEFAULT nextval('public.catalogo_id_catalogo_seq'::regclass);


--
-- TOC entry 3061 (class 2604 OID 16628)
-- Name: chat id_chat; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat ALTER COLUMN id_chat SET DEFAULT nextval('public.chat_id_chat_seq'::regclass);


--
-- TOC entry 3066 (class 2604 OID 16629)
-- Name: comentario id_com; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comentario ALTER COLUMN id_com SET DEFAULT nextval('public.comentario_id_com_seq'::regclass);


--
-- TOC entry 3067 (class 2604 OID 16630)
-- Name: comentario_respuesta id_com_resp; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comentario_respuesta ALTER COLUMN id_com_resp SET DEFAULT nextval('public.comentario_respuesta_id_com_resp_seq'::regclass);


--
-- TOC entry 3070 (class 2604 OID 16631)
-- Name: compra_venta id_comp_vent; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compra_venta ALTER COLUMN id_comp_vent SET DEFAULT nextval('public.compra_venta_id_comp_vent_seq'::regclass);


--
-- TOC entry 3071 (class 2604 OID 16632)
-- Name: comunidades id_comunidad; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comunidades ALTER COLUMN id_comunidad SET DEFAULT nextval('public.comunidades_id_comunidad_seq'::regclass);


--
-- TOC entry 3060 (class 2604 OID 16633)
-- Name: filtros id_filtro; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.filtros ALTER COLUMN id_filtro SET DEFAULT nextval('public."Filtros_id_filtro_seq"'::regclass);


--
-- TOC entry 3074 (class 2604 OID 16634)
-- Name: historias id_historia; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historias ALTER COLUMN id_historia SET DEFAULT nextval('public.historias_id_historia_seq'::regclass);


--
-- TOC entry 3075 (class 2604 OID 16635)
-- Name: invitados_evento id_invitado; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invitados_evento ALTER COLUMN id_invitado SET DEFAULT nextval('public.invitados_evento_id_invitado_seq'::regclass);


--
-- TOC entry 3077 (class 2604 OID 16636)
-- Name: mark_place id_mark; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mark_place ALTER COLUMN id_mark SET DEFAULT nextval('public.mark_place_id_mark_seq'::regclass);


--
-- TOC entry 3078 (class 2604 OID 16637)
-- Name: mensaje id_mensaje; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mensaje ALTER COLUMN id_mensaje SET DEFAULT nextval('public.mensaje_id_mensaje_seq'::regclass);


--
-- TOC entry 3080 (class 2604 OID 16638)
-- Name: notificaciones id_notif; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notificaciones ALTER COLUMN id_notif SET DEFAULT nextval('public.notificaciones_id_notif_seq'::regclass);


--
-- TOC entry 3081 (class 2604 OID 16639)
-- Name: organizador id_organizador; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organizador ALTER COLUMN id_organizador SET DEFAULT nextval('public.organizador_id_organizador_seq'::regclass);


--
-- TOC entry 3082 (class 2604 OID 16640)
-- Name: productos id_producto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos ALTER COLUMN id_producto SET DEFAULT nextval('public.productos_id_producto_seq'::regclass);


--
-- TOC entry 3084 (class 2604 OID 16641)
-- Name: publicacion id_pub; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.publicacion ALTER COLUMN id_pub SET DEFAULT nextval('public.publicacion_id_pub_seq'::regclass);


--
-- TOC entry 3085 (class 2604 OID 16642)
-- Name: reacciones id_reac; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reacciones ALTER COLUMN id_reac SET DEFAULT nextval('public.reacciones_id_reac_seq'::regclass);


--
-- TOC entry 3086 (class 2604 OID 16643)
-- Name: tipo_evento id_tipo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_evento ALTER COLUMN id_tipo SET DEFAULT nextval('public.tipo_evento_id_tipo_seq'::regclass);


--
-- TOC entry 3087 (class 2604 OID 16644)
-- Name: tipo_notif id_tipo_notif; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_notif ALTER COLUMN id_tipo_notif SET DEFAULT nextval('public.tipo_notif_id_tipo_notif_seq'::regclass);


--
-- TOC entry 3088 (class 2604 OID 16645)
-- Name: tipo_pub id_type; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_pub ALTER COLUMN id_type SET DEFAULT nextval('public.tipo_pub_id_type_seq'::regclass);


--
-- TOC entry 3068 (class 2604 OID 16646)
-- Name: usuario id_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id_usuario SET DEFAULT nextval('public.usuario_id_usuario_seq'::regclass);


--
-- TOC entry 3305 (class 0 OID 16401)
-- Dependencies: 202
-- Data for Name: amigos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.amigos (es_aceptada, fecha_emision_amigo, fecha_aceptacion_amigo, es_seguido, es_seguidor, es_bloqueado, id_usuario, id_amigo) FROM stdin;
t	2020-12-03	\N	f	f	f	27	28
t	2020-12-03	\N	f	f	f	28	27
t	2020-12-03	\N	f	f	f	27	29
f	2020-12-03	\N	f	f	f	29	28
t	2020-12-03	\N	f	f	f	28	29
t	2020-12-03	\N	f	f	f	29	27
t	2020-12-03	\N	f	f	f	27	30
f	2020-12-03	\N	f	f	f	30	29
t	2020-12-03	\N	f	f	f	29	30
f	2020-12-03	\N	f	f	f	30	28
t	2020-12-03	\N	f	f	f	28	30
t	2020-12-03	\N	f	f	f	30	27
t	2020-12-03	\N	f	f	f	27	31
f	2020-12-03	\N	f	f	f	31	28
t	2020-12-03	\N	f	f	f	28	31
t	2020-12-03	\N	f	f	f	30	31
t	2020-12-03	\N	f	f	f	31	27
t	2020-12-03	\N	f	f	f	31	30
t	2021-07-22	\N	f	f	f	34	33
t	2021-07-22	\N	f	f	f	33	34
\.


--
-- TOC entry 3308 (class 0 OID 16412)
-- Dependencies: 205
-- Data for Name: archivo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.archivo (id_archivo, nombre_archivo, id_chat) FROM stdin;
\.


--
-- TOC entry 3310 (class 0 OID 16421)
-- Dependencies: 207
-- Data for Name: cant_reac; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cant_reac (id_pub, id_usuario, id_reac, id_cant_reac) FROM stdin;
145	27	2	23
146	31	2	24
\.


--
-- TOC entry 3312 (class 0 OID 16426)
-- Dependencies: 209
-- Data for Name: catalogo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.catalogo (id_catalogo, nombre_catalogo) FROM stdin;
1	Vehiculos
2	Articulos Deportivos
3	Articulos para hogar
4	Electronica
5	Entretenimiento
6	Indumentaria
7	Instrumentos Musicales
8	materiales para reforma de Hogar
\.


--
-- TOC entry 3306 (class 0 OID 16404)
-- Dependencies: 203
-- Data for Name: chat; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chat (id_chat, fecha, nomb_chat) FROM stdin;
139	2020-11-27	Frank290595
140	2020-11-27	Frank290595
141	2020-11-27	Frank290595
142	2020-11-27	Frank290595
143	2020-11-27	Frank290595
144	2020-11-27	Frank290595
145	2020-11-27	Henvisi16!
146	2020-11-27	Frank290595
147	2020-11-27	Frank290595
148	2020-11-27	Frank290595
149	2020-11-27	Frank290595
150	2020-11-27	Frank290595
151	2020-11-27	Frank290595
152	2020-11-27	Frank290595
153	2020-11-27	Frank290595
154	2020-11-27	Henvisi16!
155	2020-11-27	Frank290595
156	2020-11-27	Frank290595
157	2020-11-27	Frank290595
158	2020-11-27	Frank290595
159	2020-11-27	Frank290595
160	2020-11-27	Henvisi16!
161	2020-11-27	ricardo1!
162	2020-12-03	ElVirgilio!
163	2020-12-03	TheGillgard
164	2020-12-03	TheGillgard
165	2020-12-03	TheGillgard
166	2020-12-03	ElVirgilio!
167	2020-12-03	ElVirgilio!
168	2020-12-03	ElVirgilio!
169	2020-12-03	ElVirgilio!
170	2020-12-03	TheGillgard
171	2020-12-03	ElVirgilio!
172	2020-12-03	ElVirgilio!
173	2020-12-03	ElVirgilio!
174	2020-12-03	ElVirgilio!
175	2020-12-03	ElVirgilio!
176	2020-12-03	ElVirgilio!
177	2020-12-03	ElVirgilio!
178	2020-12-03	ElVirgilio!
179	2020-12-03	ElVirgilio!
180	2020-12-03	ElVirgilio!
181	2020-12-03	ElVirgilio!
182	2020-12-03	TheGillgard
183	2020-12-03	TheGillgard
184	2020-12-03	ElVirgilio!
185	2020-12-03	ElVirgilio!
186	2020-12-03	ElVirgilio!
187	2020-12-03	ElVirgilio!
188	2020-12-03	ElVirgilio!
189	2020-12-03	ElVirgilio!
190	2020-12-03	ElVirgilio!
191	2020-12-03	ElVirgilio!
192	2020-12-03	Frank29!
193	2020-12-03	ElVirgilio!
194	2020-12-03	TheGillgard
195	2021-07-22	reimax01
196	2021-07-22	reimax01
197	2021-07-22	reimax01
198	2021-07-22	reimax01
199	2021-07-22	reimax01
200	2021-07-22	reimax01
201	2021-07-22	reimax01
202	2021-07-22	ricky
203	2021-07-22	ricky
204	2021-07-22	ricky
205	2021-07-22	ricky
206	2021-07-22	reimax01
207	2021-07-22	reimax01
208	2021-07-22	ricky
209	2021-07-22	ricky
210	2021-07-22	ricky
211	2021-07-22	ricky
212	2021-07-22	ricky
213	2021-07-22	ricky
214	2021-07-22	ricky
215	2021-07-22	ricky
216	2021-07-22	ricky
217	2021-07-22	ricky
218	2021-07-22	ricky
219	2021-07-22	ricky
220	2021-07-22	ricky
221	2021-07-22	ricky
222	2021-07-22	ricky
223	2021-07-22	ricky
224	2021-07-22	ricky
225	2021-07-22	ricky
226	2021-07-22	ricky
227	2021-07-22	reimax01
228	2021-07-22	reimax01
229	2021-07-22	reimax01
\.


--
-- TOC entry 3314 (class 0 OID 16434)
-- Dependencies: 211
-- Data for Name: comentario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comentario (id_com, contenido_com, fecha_hora_com, id_usuario, id_pub) FROM stdin;
65	Bonito Estadio	2020-12-03 08:24:19.845-05	31	146
\.


--
-- TOC entry 3315 (class 0 OID 16440)
-- Dependencies: 212
-- Data for Name: comentario_detalle; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comentario_detalle (id_com, id_com_resp) FROM stdin;
\.


--
-- TOC entry 3317 (class 0 OID 16445)
-- Dependencies: 214
-- Data for Name: comentario_respuesta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comentario_respuesta (id_com_resp, contenido_com_resp, fecha_hora_com_resp, id_usuario) FROM stdin;
\.


--
-- TOC entry 3321 (class 0 OID 16461)
-- Dependencies: 218
-- Data for Name: compra_venta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.compra_venta (id_comp_vent, tipo, descuento_comp_vent, impuesto0_comp_vent, impuesto_comp_vent, subtotal_comp_vent, total_comp_vent, id_usuario) FROM stdin;
\.


--
-- TOC entry 3323 (class 0 OID 16467)
-- Dependencies: 220
-- Data for Name: comunidades; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comunidades (id_comunidad, nombre_comunidad, descripcion_comunidad, imagen_comunidad, id_usuario) FROM stdin;
\.


--
-- TOC entry 3325 (class 0 OID 16475)
-- Dependencies: 222
-- Data for Name: detalle_comp_vent; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.detalle_comp_vent (id_producto, id_comp_vent) FROM stdin;
\.


--
-- TOC entry 3326 (class 0 OID 16478)
-- Dependencies: 223
-- Data for Name: detalle_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.detalle_product (id_catalogo, id_producto) FROM stdin;
6	8
6	10
6	10
\.


--
-- TOC entry 3328 (class 0 OID 16483)
-- Dependencies: 225
-- Data for Name: evento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.evento (id_evento, fecha_hora_evento, lugar_evento, logo, nombre_evento, fecha_finalizacion) FROM stdin;
2	2020-10-03 03:03:38-05	dsdsdsd	http://localhost:4000/eventos/undefined-1606982673051.jpeg	sdsdsd	2020-10-03 03:03:38-05
3	2020-10-10 08:30:00-05	Machala	http://localhost:4000/eventos/undefined-1607002237639.jpeg	Fiesta De Fin DE Anio	2020-10-26 08:30:00-05
4	2021-05-21 21:18:37-05	Mi Casa	http://localhost:4000/eventos/undefined-1626920351597.jpeg		2021-06-01 21:18:00-05
5	2021-05-21 21:18:37-05	Mi Casa	http://localhost:4000/eventos/undefined-1626920351693.jpeg		2021-06-01 21:18:00-05
6	2021-05-30 21:20:00-05	Mi casita	http://localhost:4000/eventos/undefined-1626920423975.jpeg	After	2021-06-01 21:20:00-05
\.


--
-- TOC entry 3303 (class 0 OID 16396)
-- Dependencies: 200
-- Data for Name: filtros; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.filtros (id_filtro, nombre_filtro, imagen_filtro) FROM stdin;
\.


--
-- TOC entry 3330 (class 0 OID 16492)
-- Dependencies: 227
-- Data for Name: genero; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.genero (id_genero, nombre_genero) FROM stdin;
1	Masculino
2	Femenino
\.


--
-- TOC entry 3331 (class 0 OID 16496)
-- Dependencies: 228
-- Data for Name: historia_detalle; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.historia_detalle (id_historia, id_usuario, id_reaccion) FROM stdin;
\.


--
-- TOC entry 3332 (class 0 OID 16499)
-- Dependencies: 229
-- Data for Name: historias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.historias (id_historia, imagen_historia, id_usuario) FROM stdin;
23	http://localhost:4000/historias/undefined-1606982285170.jpeg	27
24	http://localhost:4000/historias/undefined-1607001976542.jpeg	27
\.


--
-- TOC entry 3334 (class 0 OID 16507)
-- Dependencies: 231
-- Data for Name: invitados_evento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.invitados_evento (id_invitado, id_evento, estado_evento, id_usuario) FROM stdin;
2	2	asistir             	31
3	3	asistir             	27
4	3	no asistire         	30
5	6	asistir             	34
6	6	asistir             	34
7	6	asistir             	34
\.


--
-- TOC entry 3336 (class 0 OID 16512)
-- Dependencies: 233
-- Data for Name: mark_place; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mark_place (id_mark, contenido_mark, lugar_mark, id_usuario) FROM stdin;
1	Marathon	Machala	27
2	Nike	Machala	27
4	Hyunday	Machala	31
5	House Sport	Machala	27
\.


--
-- TOC entry 3338 (class 0 OID 16521)
-- Dependencies: 235
-- Data for Name: mensaje; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mensaje (id_mensaje, mensaje, estado, fecha_hora_mensaje, id_chat, id_usuario, ruta_archivo, file_name) FROM stdin;
50	Hola	false               	2020-10-03 02:40:28-05	165	31	\N	\N
51	Hola\n	false               	2020-10-03 02:40:22-05	165	31	\N	\N
52	Hola	false               	2020-10-03 02:42:03-05	166	27	\N	\N
53		false               	2020-10-03 02:42:05-05	166	27	\N	\N
54	holaaa	false               	2020-10-03 02:42:37-05	166	27	\N	\N
55	holaaaaa	false               	2020-10-03 02:43:08-05	166	27	\N	\N
56		false               	2020-10-03 02:43:26-05	166	27	http://localhost:4000/chat/undefined-1606981406295.jpeg	undefined-1606981406295.jpeg
57		false               	2020-10-03 02:43:29-05	166	27	\N	\N
58	hola	false               	2020-10-03 02:47:47-05	167	27	\N	\N
59		false               	2020-10-03 02:48:09-05	167	27	http://localhost:4000/chat/undefined-1606981689899.jpeg	undefined-1606981689899.jpeg
60	jjjjjjjjjjj	false               	2020-10-03 02:50:08-05	168	27	\N	\N
61	hola	false               	2020-10-03 02:51:50-05	169	27	\N	\N
62	Hola	false               	2020-10-03 02:56:07-05	170	30	\N	\N
63		false               	2020-10-03 02:56:23-05	170	30	http://localhost:4000/chat/undefined-1606982183261.jpeg	undefined-1606982183261.jpeg
64		false               	2020-10-03 02:56:33-05	170	30	http://localhost:4000/chat/undefined-1606982193808.pdf	undefined-1606982193808.pdf
65		false               	2020-10-03 02:56:41-05	170	30	http://localhost:4000/chat/undefined-1606982201834.vnd.openxmlformats-officedocument.wordprocessingml.document	undefined-1606982201834.vnd.openxmlformats-officedocument.wordprocessingml.document
66	hola	false               	2020-10-03 03:52:00-05	180	27	\N	\N
67	Hola	false               	2020-10-03 03:59:23-05	181	27	\N	\N
68		false               	2020-10-03 03:59:25-05	181	27	\N	\N
69	Hola	false               	2020-10-03 03:59:51-05	182	31	\N	\N
70	Hola	false               	2020-10-03 04:00:24-05	183	31	\N	\N
71	..........	false               	2020-10-03 04:00:48-05	184	27	\N	\N
72	jjjjjj	false               	2020-10-03 04:01:25-05	184	27	\N	\N
73	que tal	false               	2020-10-03 04:01:37-05	183	31	\N	\N
74	hhhhhhhhhhh	false               	2020-10-03 04:01:51-05	183	31	\N	\N
75	Hola	false               	2020-10-03 04:03:12-05	185	27	\N	\N
76	Holaa	false               	2020-10-03 04:08:18-05	187	27	\N	\N
77	Hola	false               	2020-10-03 04:22:12-05	188	27	\N	\N
78	eiii	false               	2020-10-03 04:23:25-05	190	27	\N	\N
79	EIii que tal 	false               	2020-10-03 04:29:52-05	191	27	\N	\N
80	COmo te va	false               	2020-10-03 04:30:14-05	191	31	\N	\N
81		false               	2020-10-03 04:30:37-05	191	27	http://localhost:4000/chat/undefined-1606987837217.jpeg	undefined-1606987837217.jpeg
82	QUe mas 	false               	2020-10-03 04:30:55-05	192	31	\N	\N
83	Hola bryan 	false               	2020-10-03 08:36:40-05	193	27	\N	\N
84	Hola	false               	2020-10-03 08:36:56-05	194	31	\N	\N
85	como estas	false               	2020-10-03 08:37:07-05	194	31	\N	\N
86		false               	2020-10-03 08:37:31-05	194	27	http://localhost:4000/chat/undefined-1607002651673.jpeg	undefined-1607002651673.jpeg
87		false               	2020-10-03 08:37:58-05	194	31	http://localhost:4000/chat/undefined-1607002678069.pdf	undefined-1607002678069.pdf
88	Hola	false               	2021-05-21 21:21:08-05	196	34	\N	\N
89	dfgdfgdfg	false               	2021-05-21 21:22:21-05	221	33	\N	\N
90	que mas ve	false               	2021-05-21 21:22:31-05	221	33	\N	\N
91	chuta loco no hay trago	false               	2021-05-21 21:22:46-05	221	34	\N	\N
92	hey	false               	2021-05-21 22:02:59-05	229	34	\N	\N
93	vente 	false               	2021-05-21 22:03:21-05	229	33	\N	\N
\.


--
-- TOC entry 3340 (class 0 OID 16529)
-- Dependencies: 237
-- Data for Name: miembros_comunidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.miembros_comunidad (id_comunidad, id_usuario) FROM stdin;
\.


--
-- TOC entry 3342 (class 0 OID 16534)
-- Dependencies: 239
-- Data for Name: multimedia_publicacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.multimedia_publicacion (id_pub, contenido_mult, id_type, id_filtro, id_mult) FROM stdin;
141	http://localhost:4000/publicaciones/undefined-1606932097220.png	1	0	12
142	http://localhost:4000/publicaciones/undefined-1606933032821.png	1	0	13
143	http://localhost:4000/publicaciones/undefined-1606936767834.png	1	0	14
144	http://localhost:4000/publicaciones/undefined-1606974313477.jpeg	1	4	15
145	http://localhost:4000/publicaciones/undefined-1606974358714.jpeg	1	0	16
147	http://localhost:4000/publicaciones/undefined-1607001776234.jpeg	1	0	17
146	http://localhost:4000/publicaciones/undefined-1607001848265.jpeg	1	0	18
\.


--
-- TOC entry 3343 (class 0 OID 16541)
-- Dependencies: 240
-- Data for Name: notif_detalle; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notif_detalle (id_notif, id_usuario) FROM stdin;
191	27
192	27
193	27
194	32
195	32
196	27
197	31
198	31
199	33
200	33
201	33
\.


--
-- TOC entry 3344 (class 0 OID 16544)
-- Dependencies: 241
-- Data for Name: notificaciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notificaciones (id_notif, contenido_notif, fecha_hora_notif, leida_notif) FROM stdin;
132	El usuario Frank1995! ha realizado una publicacion	2020-10-14 21:07:57-05	f
133	El usuario Frank1995! ha comentado una publicacion de: Frank1995!	2020-10-14 21:08:01-05	f
134	El usuario Frank1995! ha realizado una publicacion	2020-10-14 21:10:19-05	f
135	El usuario Frank1995! ha comentado una publicacion de: Frank1995!	2020-10-14 21:10:26-05	f
136	El usuario Frank1995! ha realizado una publicacion	2020-10-14 21:12:22-05	f
137	El usuario Frank1995! ha comentado una publicacion de: Frank1995!	2020-10-14 21:12:28-05	f
138	El usuario Frank1995! ha realizado una publicacion	2020-10-14 21:15:07-05	f
139	El usuario Frank1995! ha comentado una publicacion de: Frank1995!	2020-10-14 21:15:12-05	f
140	El usuario Frank1995! ha realizado una publicacion	2020-10-14 21:16:23-05	f
141	El usuario Frank1995! ha comentado una publicacion de: Frank1995!	2020-10-14 21:16:28-05	f
142	El usuario Frank1995! ha realizado una publicacion	2020-10-14 21:27:10-05	f
143	El usuario Frank1995! ha comentado una publicacion de: Frank1995!	2020-10-14 21:27:20-05	f
144	El usuario null ha comentado una publicacion de: null	2020-10-14 21:27:31-05	f
145	El usuario Frank1995! ha realizado una publicacion	2020-10-14 21:28:34-05	f
146	El usuario Frank1995! ha comentado una publicacion de: Frank1995!	2020-10-14 21:28:40-05	f
147	El usuario Frank1995! ha realizado una publicacion	2020-10-14 21:35:34-05	f
148	El usuario Frank1995! ha comentado una publicacion de: Frank1995!	2020-10-14 21:35:46-05	f
149	El usuario Frank1995! ha realizado una publicacion	2020-10-14 21:38:53-05	f
150	El usuario Frank1995! ha comentado una publicacion de: Frank1995!	2020-10-14 21:39:03-05	f
151	El usuario Frank1995! ha realizado una publicacion	2020-10-14 22:02:48-05	f
152	El usuario Frank1995! ha comentado una publicacion de: Frank1995!	2020-10-14 22:02:52-05	f
153	El usuario Frank1995! ha comentado una publicacion de: Frank1995!	2020-10-14 22:15:05-05	f
154	El usuario Frank1995! ha comentado una publicacion de: Frank1995!	2020-10-14 22:18:18-05	f
155	El usuario Frank1995! ha comentado una publicacion de: Frank1995!	2020-10-14 22:19:11-05	f
156	El usuario null ha comentado una publicacion de: null	2020-10-14 22:40:14-05	f
157	El usuario Frank1995! ha comentado una publicacion de: Frank1995!	2020-10-14 22:43:53-05	f
158	El usuario null ha comentado una publicacion de: null	2020-10-14 22:44:12-05	f
159	El usuario Frank1995! ha comentado una publicacion de: Frank1995!	2020-10-14 22:48:54-05	f
160	El usuario Frank1995! ha comentado una publicacion de: Frank1995!	2020-10-14 22:49:28-05	f
161	El usuario Frank1995! ha comentado una publicacion de: Frank1995!	2020-10-14 22:49:43-05	f
162	El usuario Frank1995! ha comentado una publicacion de: Frank1995!	2020-10-14 22:49:52-05	f
163	El usuario Frank1995! ha realizado una publicacion	2020-10-14 22:58:14-05	f
164	El usuario Frank1995! ha comentado una publicacion de: undefined	2020-10-14 22:58:21-05	f
165	El usuario Frank1995! ha comentado una publicacion de: Frank1995!	2020-10-16 12:24:59-05	f
166	El usuario Frank1995! ha comentado una publicacion de: Frank1995!	2020-10-16 12:39:18-05	f
167	El usuario Frank1995! ha comentado una publicacion de: Frank1995!	2020-10-16 12:39:51-05	f
168	El usuario Frank1995! ha comentado una publicacion de: undefined	2020-10-16 12:43:07-05	f
169	El usuario Frank1995! ha comentado una publicacion de: undefined	2020-10-16 12:47:35-05	f
170	El usuario Frank1995! ha comentado una publicacion de: Frank1995!	2020-10-16 12:48:22-05	f
171	El usuario Frank1995! ha comentado una publicacion de: undefined	2020-10-16 12:50:02-05	f
172	El usuario Frank1995! ha realizado una publicacion	2020-10-16 13:05:37-05	f
173	El usuario Frank1995! ha comentado una publicacion de: Frank1995!	2020-10-16 13:05:54-05	f
174	El usuario null ha realizado una publicacion	2020-10-26 23:27:01-05	f
175	El usuario null ha realizado una publicacion	2020-10-26 23:29:47-05	f
176	El usuario null ha realizado una publicacion	2020-10-26 23:30:28-05	f
177	El usuario null ha realizado una publicacion	2020-10-26 23:31:09-05	f
178	El usuario null ha realizado una publicacion	2020-10-27 00:45:28-05	f
179	El usuario null ha realizado una publicacion	2020-10-27 00:48:33-05	f
180	El usuario null ha realizado una publicacion	2020-10-27 00:48:54-05	f
181	El usuario null ha realizado una publicacion	2020-10-27 00:49:54-05	f
182	El usuario null ha realizado una publicacion	2020-10-27 00:50:30-05	f
183	El usuario Frank290595 ha realizado una publicacion	2020-10-27 10:19:54-05	f
184	El usuario Frank290595 ha realizado una publicacion	2020-10-27 10:20:16-05	f
185	El usuario Henvisi16! ha realizado un evento	2020-10-27 10:39:45-05	f
186	El usuario Henvisi16! ha realizado una publicacion	2020-11-01 19:02:41-05	f
187	El usuario Henvisi16! ha realizado una publicacion	2020-11-02 13:01:37-05	f
188	El usuario Henvisi16! ha comentado una publicacion de: Henvisi16!	2020-11-02 13:05:24-05	f
189	El usuario Henvisi16! ha realizado una publicacion	2020-11-02 13:17:12-05	f
190	El usuario Henvisi16! ha realizado una publicacion	2020-11-02 14:19:27-05	f
191	El usuario TheGillgard ha realizado una publicacion	2020-11-03 00:45:13-05	f
192	El usuario TheGillgard ha realizado una publicacion	2020-11-03 00:45:58-05	f
193	El usuario TheGillgard ha realizado un evento	2020-11-03 03:04:33-05	f
194	El usuario Marvin572! ha realizado una publicacion	2020-11-03 08:22:40-05	f
195	El usuario Marvin572! ha realizado una publicacion	2020-11-03 08:22:56-05	f
196	El usuario TheGillgard ha realizado una publicacion	2020-11-03 08:24:08-05	f
197	El usuario ElVirgilio! ha comentado una publicacion de: ElVirgilio!	2020-11-03 08:24:54-05	f
198	El usuario ElVirgilio! ha realizado un evento	2020-11-03 08:30:37-05	f
199	El usuario reimax01 ha realizado un evento	2021-06-21 21:19:11-05	f
200	El usuario reimax01 ha realizado un evento	2021-06-21 21:19:11-05	f
201	El usuario reimax01 ha realizado un evento	2021-06-21 21:20:24-05	f
\.


--
-- TOC entry 3346 (class 0 OID 16552)
-- Dependencies: 243
-- Data for Name: organizador; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.organizador (id_organizador, id_evento, id_usuario) FROM stdin;
2	2	27
3	3	31
4	4	33
5	5	33
6	6	33
\.


--
-- TOC entry 3348 (class 0 OID 16557)
-- Dependencies: 245
-- Data for Name: productos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.productos (id_producto, nombre_producto, descripcion_producto, imagen_product, precio_product, id_mark) FROM stdin;
7	dsds	dsdsds	http://localhost:4000/productos/undefined-1606978294509.jpeg	105	2
8	Camiseta Nike	Camiseta Deportiva color rojo	http://localhost:4000/productos/undefined-1606978357527.jpeg	105	1
9	Vehiculo Hyunday	Color negro	http://localhost:4000/productos/undefined-1606979531882.jpeg	25000	4
10	Camiseta Manchester United	Camiseta Deportiva	http://localhost:4000/productos/undefined-1607002151856.jpeg	85	1
\.


--
-- TOC entry 3350 (class 0 OID 16565)
-- Dependencies: 247
-- Data for Name: publicacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.publicacion (id_pub, contenido_pub, fecha_bub, id_usuario, id_type) FROM stdin;
145	\N	2020-11-03 00:44:19	27	\N
146	\N	2020-11-03 00:45:26	27	\N
147	\N	2020-11-03 08:21:45	32	\N
148	\N	2020-11-03 08:22:47	32	\N
149	\N	2020-11-03 08:23:54	27	\N
\.


--
-- TOC entry 3352 (class 0 OID 16574)
-- Dependencies: 249
-- Data for Name: reacciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reacciones (id_reac, nom_reac) FROM stdin;
1	Me gusta
2	Me Encanta
3	Me divierte
4	Me Sorprende
5	Me Entristece
6	Me Enoja
\.


--
-- TOC entry 3354 (class 0 OID 16582)
-- Dependencies: 251
-- Data for Name: tipo_evento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tipo_evento (id_tipo, nombre_tipo, id_evento) FROM stdin;
\.


--
-- TOC entry 3356 (class 0 OID 16590)
-- Dependencies: 253
-- Data for Name: tipo_notif; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tipo_notif (id_tipo_notif, nombre_tipo_notif) FROM stdin;
\.


--
-- TOC entry 3358 (class 0 OID 16595)
-- Dependencies: 255
-- Data for Name: tipo_pub; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tipo_pub (id_type, cont_type) FROM stdin;
1	imagen
2	video
\.


--
-- TOC entry 3319 (class 0 OID 16453)
-- Dependencies: 216
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario (id_usuario, nombres_usuario, apellidos_usuario, fecha_nac_usuario, email_usuario, contrasena_usuario, presentacion_usuario, telefono_usuario, nom_usuario, imagen_usuario, id_genero) FROM stdin;
27	Ricardo	Ramon Ramon	1998-01-03	ricardoramonramon@gmail.com	$2b$10$AeADZb5NpAO6cUzSuhLAXO0BdTtKFrZJOzYPU93aVI2q8tzY8yloW			TheGillgard	http://localhost:4000/usuarios/ricardo-1606974226211.jpeg	1
28	Henry Vinicio	Simbana	1994-07-08	henvisi1994@hotmail.com	$2b$10$4dfNzW3dQOlg7H17W.ZoTOrlwSLwQCinfgf5PLNstVMCYjIPOOz.O			HenvisiC	http://localhost:4000/usuarios/IMG_0112-1606974520760.jpeg	1
29	Elvis	Paredes Demera	1998-03-14	elvis-paredes@live.com	$2b$10$rtWaoZvcIUg1JBYMPbxUUOEPQh2GLanBgA2UDhXtX8Lbe/h4Qs4oS			eparedes3	http://localhost:4000/usuarios/elvis-1606974791844.jpeg	1
30	Frank	Narvaez	1995-05-29	frankwilliams2905@gmail.com	$2b$10$k2IvEb95gMOS5pUhiZBipemES2liMR5112jd3s14we.Q9rflB3.vG			Frank29!	http://localhost:4000/usuarios/foto perfil-1606974994885.jpeg	1
31	Bryan	Gonzalez	1995-11-17	bigonzalez@gmail.com	$2b$10$nI3Ty9qDq/AApdoUg2wbmO8CzFnCxqOPfdmeQZQrzmR8UxY/dNDvq			ElVirgilio!	http://localhost:4000/usuarios/virgilio-1606975501417.jpeg	1
32	Marvin	Valarezo	1989-06-12	marvinv572@gmailcom	$2b$10$H7WjXWAL/bEhM/M9lSWS4OvUpeLOaaVsC3N0Ii0L8MuBe1ltJKR9G			Marvin572!	http://localhost:4000/usuarios/camiseta-542x390-1607001658328.jpeg	1
33	Jorge 	Palacios	1994-07-01	reinaldomn48@gmail.com	$2b$10$MbqKdAxB3QOml.QqtM7vfutoOcmFMqHDqWygsT/tccL/1wCjKkSPy			reimax01	http://localhost:4000/usuarios/modsy-seinfeld-700x467-c-1626919408071.jpeg	1
34	Ricardo	Milos	1998-11-06	reynald0010794@gmail.com	$2b$10$gV6Crl5zipojNex.jGmgFO48s2.HpxGjRfyfLp7XCShIVxD9qpDu2			ricky	http://localhost:4000/usuarios/upsplash-california-kitchen-700x467-c-1626919572855.jpeg	1
\.


--
-- TOC entry 3360 (class 0 OID 16603)
-- Dependencies: 257
-- Data for Name: usuario_chat; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario_chat (id_usuario, id_chat) FROM stdin;
\.


--
-- TOC entry 3388 (class 0 OID 0)
-- Dependencies: 201
-- Name: Filtros_id_filtro_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Filtros_id_filtro_seq"', 1, false);


--
-- TOC entry 3389 (class 0 OID 0)
-- Dependencies: 206
-- Name: archivo_id_archivo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.archivo_id_archivo_seq', 1, false);


--
-- TOC entry 3390 (class 0 OID 0)
-- Dependencies: 208
-- Name: cant_reac_id_can_reac_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cant_reac_id_can_reac_seq', 24, true);


--
-- TOC entry 3391 (class 0 OID 0)
-- Dependencies: 210
-- Name: catalogo_id_catalogo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.catalogo_id_catalogo_seq', 1, false);


--
-- TOC entry 3392 (class 0 OID 0)
-- Dependencies: 204
-- Name: chat_id_chat_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.chat_id_chat_seq', 229, true);


--
-- TOC entry 3393 (class 0 OID 0)
-- Dependencies: 213
-- Name: comentario_id_com_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comentario_id_com_seq', 65, true);


--
-- TOC entry 3394 (class 0 OID 0)
-- Dependencies: 215
-- Name: comentario_respuesta_id_com_resp_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comentario_respuesta_id_com_resp_seq', 1, false);


--
-- TOC entry 3395 (class 0 OID 0)
-- Dependencies: 219
-- Name: compra_venta_id_comp_vent_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.compra_venta_id_comp_vent_seq', 1, false);


--
-- TOC entry 3396 (class 0 OID 0)
-- Dependencies: 221
-- Name: comunidades_id_comunidad_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comunidades_id_comunidad_seq', 1, false);


--
-- TOC entry 3397 (class 0 OID 0)
-- Dependencies: 224
-- Name: evento_id_evento_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.evento_id_evento_seq', 6, true);


--
-- TOC entry 3398 (class 0 OID 0)
-- Dependencies: 226
-- Name: genero_id_genero_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.genero_id_genero_seq', 1, false);


--
-- TOC entry 3399 (class 0 OID 0)
-- Dependencies: 230
-- Name: historias_id_historia_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.historias_id_historia_seq', 24, true);


--
-- TOC entry 3400 (class 0 OID 0)
-- Dependencies: 232
-- Name: invitados_evento_id_invitado_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.invitados_evento_id_invitado_seq', 7, true);


--
-- TOC entry 3401 (class 0 OID 0)
-- Dependencies: 234
-- Name: mark_place_id_mark_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mark_place_id_mark_seq', 5, true);


--
-- TOC entry 3402 (class 0 OID 0)
-- Dependencies: 236
-- Name: mensaje_id_mensaje_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mensaje_id_mensaje_seq', 93, true);


--
-- TOC entry 3403 (class 0 OID 0)
-- Dependencies: 238
-- Name: multimedia_publicacion_id_mult_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.multimedia_publicacion_id_mult_seq', 18, true);


--
-- TOC entry 3404 (class 0 OID 0)
-- Dependencies: 242
-- Name: notificaciones_id_notif_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notificaciones_id_notif_seq', 201, true);


--
-- TOC entry 3405 (class 0 OID 0)
-- Dependencies: 244
-- Name: organizador_id_organizador_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.organizador_id_organizador_seq', 6, true);


--
-- TOC entry 3406 (class 0 OID 0)
-- Dependencies: 246
-- Name: productos_id_producto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productos_id_producto_seq', 10, true);


--
-- TOC entry 3407 (class 0 OID 0)
-- Dependencies: 248
-- Name: publicacion_id_pub_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.publicacion_id_pub_seq', 149, true);


--
-- TOC entry 3408 (class 0 OID 0)
-- Dependencies: 250
-- Name: reacciones_id_reac_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reacciones_id_reac_seq', 1, false);


--
-- TOC entry 3409 (class 0 OID 0)
-- Dependencies: 252
-- Name: tipo_evento_id_tipo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipo_evento_id_tipo_seq', 1, false);


--
-- TOC entry 3410 (class 0 OID 0)
-- Dependencies: 254
-- Name: tipo_notif_id_tipo_notif_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipo_notif_id_tipo_notif_seq', 1, false);


--
-- TOC entry 3411 (class 0 OID 0)
-- Dependencies: 256
-- Name: tipo_pub_id_type_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipo_pub_id_type_seq', 1, false);


--
-- TOC entry 3412 (class 0 OID 0)
-- Dependencies: 217
-- Name: usuario_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_id_usuario_seq', 34, true);


--
-- TOC entry 3090 (class 2606 OID 16648)
-- Name: filtros Filtros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.filtros
    ADD CONSTRAINT "Filtros_pkey" PRIMARY KEY (id_filtro);


--
-- TOC entry 3094 (class 2606 OID 16650)
-- Name: archivo PK_archivo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.archivo
    ADD CONSTRAINT "PK_archivo" PRIMARY KEY (id_archivo);


--
-- TOC entry 3096 (class 2606 OID 16652)
-- Name: catalogo PK_catalogo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catalogo
    ADD CONSTRAINT "PK_catalogo" PRIMARY KEY (id_catalogo);


--
-- TOC entry 3104 (class 2606 OID 16654)
-- Name: compra_venta PK_compra_venta; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compra_venta
    ADD CONSTRAINT "PK_compra_venta" PRIMARY KEY (id_comp_vent);


--
-- TOC entry 3116 (class 2606 OID 16656)
-- Name: mark_place PK_mark_place; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mark_place
    ADD CONSTRAINT "PK_mark_place" PRIMARY KEY (id_mark);


--
-- TOC entry 3126 (class 2606 OID 16658)
-- Name: productos PK_productos; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT "PK_productos" PRIMARY KEY (id_producto);


--
-- TOC entry 3128 (class 2606 OID 16660)
-- Name: publicacion PK_publicacion; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.publicacion
    ADD CONSTRAINT "PK_publicacion" PRIMARY KEY (id_pub);


--
-- TOC entry 3130 (class 2606 OID 16662)
-- Name: reacciones PK_reacciones; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reacciones
    ADD CONSTRAINT "PK_reacciones" PRIMARY KEY (id_reac);


--
-- TOC entry 3132 (class 2606 OID 16664)
-- Name: tipo_evento PK_tipo_evento; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_evento
    ADD CONSTRAINT "PK_tipo_evento" PRIMARY KEY (id_tipo);


--
-- TOC entry 3134 (class 2606 OID 16666)
-- Name: tipo_notif PK_tipo_notif; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_notif
    ADD CONSTRAINT "PK_tipo_notif" PRIMARY KEY (id_tipo_notif);


--
-- TOC entry 3136 (class 2606 OID 16668)
-- Name: tipo_pub PK_tipo_pub; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_pub
    ADD CONSTRAINT "PK_tipo_pub" PRIMARY KEY (id_type);


--
-- TOC entry 3092 (class 2606 OID 16670)
-- Name: chat chat_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat
    ADD CONSTRAINT chat_pkey PRIMARY KEY (id_chat);


--
-- TOC entry 3098 (class 2606 OID 16672)
-- Name: comentario comentario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comentario
    ADD CONSTRAINT comentario_pkey PRIMARY KEY (id_com);


--
-- TOC entry 3100 (class 2606 OID 16674)
-- Name: comentario_respuesta comentario_respuesta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comentario_respuesta
    ADD CONSTRAINT comentario_respuesta_pkey PRIMARY KEY (id_com_resp);


--
-- TOC entry 3106 (class 2606 OID 16676)
-- Name: comunidades comunidades_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comunidades
    ADD CONSTRAINT comunidades_pkey PRIMARY KEY (id_comunidad);


--
-- TOC entry 3108 (class 2606 OID 16678)
-- Name: evento evento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evento
    ADD CONSTRAINT evento_pkey PRIMARY KEY (id_evento);


--
-- TOC entry 3110 (class 2606 OID 16680)
-- Name: genero genero_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genero
    ADD CONSTRAINT genero_pk PRIMARY KEY (id_genero);


--
-- TOC entry 3112 (class 2606 OID 16682)
-- Name: historias historias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historias
    ADD CONSTRAINT historias_pkey PRIMARY KEY (id_historia);


--
-- TOC entry 3114 (class 2606 OID 16684)
-- Name: invitados_evento invitados_evento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invitados_evento
    ADD CONSTRAINT invitados_evento_pkey PRIMARY KEY (id_invitado);


--
-- TOC entry 3118 (class 2606 OID 16686)
-- Name: mensaje mensaje_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mensaje
    ADD CONSTRAINT mensaje_pkey PRIMARY KEY (id_mensaje);


--
-- TOC entry 3120 (class 2606 OID 16688)
-- Name: multimedia_publicacion multimedia_publicacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.multimedia_publicacion
    ADD CONSTRAINT multimedia_publicacion_pkey PRIMARY KEY (id_mult);


--
-- TOC entry 3122 (class 2606 OID 16690)
-- Name: notificaciones notificaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notificaciones
    ADD CONSTRAINT notificaciones_pkey PRIMARY KEY (id_notif);


--
-- TOC entry 3124 (class 2606 OID 16692)
-- Name: organizador organizador_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organizador
    ADD CONSTRAINT organizador_pkey PRIMARY KEY (id_organizador);


--
-- TOC entry 3102 (class 2606 OID 16694)
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_usuario);


--
-- TOC entry 3147 (class 2606 OID 16695)
-- Name: usuario Relationship4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT "Relationship4" FOREIGN KEY (id_genero) REFERENCES public.genero(id_genero);


--
-- TOC entry 3152 (class 2606 OID 16700)
-- Name: detalle_product fk_catalogo_detalle_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_product
    ADD CONSTRAINT fk_catalogo_detalle_product FOREIGN KEY (id_catalogo) REFERENCES public.catalogo(id_catalogo);


--
-- TOC entry 3139 (class 2606 OID 16705)
-- Name: archivo fk_chat_archivo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.archivo
    ADD CONSTRAINT fk_chat_archivo FOREIGN KEY (id_chat) REFERENCES public.chat(id_chat);


--
-- TOC entry 3158 (class 2606 OID 16710)
-- Name: mensaje fk_chat_mensaje; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mensaje
    ADD CONSTRAINT fk_chat_mensaje FOREIGN KEY (id_chat) REFERENCES public.chat(id_chat) NOT VALID;


--
-- TOC entry 3167 (class 2606 OID 16715)
-- Name: usuario_chat fk_chat_usuario_chat; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_chat
    ADD CONSTRAINT fk_chat_usuario_chat FOREIGN KEY (id_chat) REFERENCES public.chat(id_chat);


--
-- TOC entry 3144 (class 2606 OID 16720)
-- Name: comentario_detalle fk_comentario_comentario_det; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comentario_detalle
    ADD CONSTRAINT fk_comentario_comentario_det FOREIGN KEY (id_com) REFERENCES public.comentario(id_com);


--
-- TOC entry 3145 (class 2606 OID 16725)
-- Name: comentario_detalle fk_comentario_comentario_resp; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comentario_detalle
    ADD CONSTRAINT fk_comentario_comentario_resp FOREIGN KEY (id_com_resp) REFERENCES public.comentario_respuesta(id_com_resp);


--
-- TOC entry 3150 (class 2606 OID 16730)
-- Name: detalle_comp_vent fk_comp_vent_detalle_comp_vent; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_comp_vent
    ADD CONSTRAINT fk_comp_vent_detalle_comp_vent FOREIGN KEY (id_comp_vent) REFERENCES public.compra_venta(id_comp_vent);


--
-- TOC entry 3160 (class 2606 OID 16735)
-- Name: miembros_comunidad fk_comunidad_mienbros; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miembros_comunidad
    ADD CONSTRAINT fk_comunidad_mienbros FOREIGN KEY (id_comunidad) REFERENCES public.comunidades(id_comunidad);


--
-- TOC entry 3154 (class 2606 OID 16740)
-- Name: historia_detalle fk_historia_historia_detalle; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historia_detalle
    ADD CONSTRAINT fk_historia_historia_detalle FOREIGN KEY (id_historia) REFERENCES public.historias(id_historia);


--
-- TOC entry 3162 (class 2606 OID 16745)
-- Name: notif_detalle fk_notificacion_notificacion_detalle; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notif_detalle
    ADD CONSTRAINT fk_notificacion_notificacion_detalle FOREIGN KEY (id_notif) REFERENCES public.notificaciones(id_notif);


--
-- TOC entry 3151 (class 2606 OID 16750)
-- Name: detalle_comp_vent fk_producto_detalle_comp_vent; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_comp_vent
    ADD CONSTRAINT fk_producto_detalle_comp_vent FOREIGN KEY (id_producto) REFERENCES public.productos(id_producto);


--
-- TOC entry 3153 (class 2606 OID 16755)
-- Name: detalle_product fk_producto_detalle_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_product
    ADD CONSTRAINT fk_producto_detalle_product FOREIGN KEY (id_producto) REFERENCES public.productos(id_producto);


--
-- TOC entry 3140 (class 2606 OID 16760)
-- Name: cant_reac fk_publicaciones_cant_reac; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cant_reac
    ADD CONSTRAINT fk_publicaciones_cant_reac FOREIGN KEY (id_pub) REFERENCES public.publicacion(id_pub);


--
-- TOC entry 3141 (class 2606 OID 16765)
-- Name: cant_reac fk_reaccion_cat_reac; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cant_reac
    ADD CONSTRAINT fk_reaccion_cat_reac FOREIGN KEY (id_reac) REFERENCES public.reacciones(id_reac);


--
-- TOC entry 3137 (class 2606 OID 16770)
-- Name: amigos fk_usuario_amigo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.amigos
    ADD CONSTRAINT fk_usuario_amigo FOREIGN KEY (id_amigo) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3138 (class 2606 OID 16775)
-- Name: amigos fk_usuario_amigos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.amigos
    ADD CONSTRAINT fk_usuario_amigos FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3142 (class 2606 OID 16780)
-- Name: cant_reac fk_usuario_cant_reac; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cant_reac
    ADD CONSTRAINT fk_usuario_cant_reac FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3143 (class 2606 OID 16785)
-- Name: comentario fk_usuario_comentario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comentario
    ADD CONSTRAINT fk_usuario_comentario FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario) NOT VALID;


--
-- TOC entry 3146 (class 2606 OID 16790)
-- Name: comentario_respuesta fk_usuario_comentario_resp; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comentario_respuesta
    ADD CONSTRAINT fk_usuario_comentario_resp FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario) NOT VALID;


--
-- TOC entry 3148 (class 2606 OID 16795)
-- Name: compra_venta fk_usuario_comp_venta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compra_venta
    ADD CONSTRAINT fk_usuario_comp_venta FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3149 (class 2606 OID 16800)
-- Name: comunidades fk_usuario_comunidad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comunidades
    ADD CONSTRAINT fk_usuario_comunidad FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3156 (class 2606 OID 16805)
-- Name: historias fk_usuario_historia; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historias
    ADD CONSTRAINT fk_usuario_historia FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3155 (class 2606 OID 16810)
-- Name: historia_detalle fk_usuario_historia_detalle; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historia_detalle
    ADD CONSTRAINT fk_usuario_historia_detalle FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3157 (class 2606 OID 16815)
-- Name: invitados_evento fk_usuario_invitado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invitados_evento
    ADD CONSTRAINT fk_usuario_invitado FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3159 (class 2606 OID 16820)
-- Name: mensaje fk_usuario_mensaje; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mensaje
    ADD CONSTRAINT fk_usuario_mensaje FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario) NOT VALID;


--
-- TOC entry 3161 (class 2606 OID 16825)
-- Name: miembros_comunidad fk_usuario_miembros; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miembros_comunidad
    ADD CONSTRAINT fk_usuario_miembros FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3163 (class 2606 OID 16830)
-- Name: notif_detalle fk_usuario_notificacion_detalle; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notif_detalle
    ADD CONSTRAINT fk_usuario_notificacion_detalle FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3164 (class 2606 OID 16835)
-- Name: organizador fk_usuario_organizador; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organizador
    ADD CONSTRAINT fk_usuario_organizador FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3166 (class 2606 OID 16840)
-- Name: publicacion fk_usuario_publicacion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.publicacion
    ADD CONSTRAINT fk_usuario_publicacion FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3168 (class 2606 OID 16845)
-- Name: usuario_chat fk_usuario_usuario_chat; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_chat
    ADD CONSTRAINT fk_usuario_usuario_chat FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3165 (class 2606 OID 16850)
-- Name: productos productos_id_mark_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_id_mark_fkey FOREIGN KEY (id_mark) REFERENCES public.mark_place(id_mark) NOT VALID;


-- Completed on 2021-07-23 22:23:57

--
-- PostgreSQL database dump complete
--

