--
-- PostgreSQL database dump
--

-- Dumped from database version 14.11 (Ubuntu 14.11-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.11 (Ubuntu 14.11-0ubuntu0.22.04.1)

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
-- Name: delete_bl(); Type: FUNCTION; Schema: public; Owner: tarzan
--

CREATE FUNCTION public.delete_bl(OUT is_query_executed boolean) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
begin
delete from public.bcweb_bordereau;
IF NOT FOUND THEN
is_query_executed:=0;
raise notice 'Value:%',is_query_executed;
ELSE
is_query_executed:=1;
raise notice 'Value:%',is_query_executed;
END IF;
end;$$;


ALTER FUNCTION public.delete_bl(OUT is_query_executed boolean) OWNER TO tarzan;

--
-- Name: delete_pieces(); Type: FUNCTION; Schema: public; Owner: tarzan
--

CREATE FUNCTION public.delete_pieces(OUT is_query_executed boolean) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
begin
delete from public.bcweb_piece;
IF NOT FOUND THEN
is_query_executed:=0;
raise notice 'Value:%',is_query_executed;
ELSE
is_query_executed:=1;
raise notice 'Value:%',is_query_executed;
END IF;
end;
$$;


ALTER FUNCTION public.delete_pieces(OUT is_query_executed boolean) OWNER TO tarzan;

--
-- Name: delete_produits(); Type: FUNCTION; Schema: public; Owner: tarzan
--

CREATE FUNCTION public.delete_produits(OUT is_query_executed boolean) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
begin
delete from public.bcweb_produit;
IF NOT FOUND THEN
is_query_executed:=0;
raise notice 'Value:%',is_query_executed;
ELSE
is_query_executed:=1;
raise notice 'Value:%',is_query_executed;
END IF;
end;
$$;


ALTER FUNCTION public.delete_produits(OUT is_query_executed boolean) OWNER TO tarzan;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: accounts_customuser; Type: TABLE; Schema: public; Owner: tarzan
--

CREATE TABLE public.accounts_customuser (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.accounts_customuser OWNER TO tarzan;

--
-- Name: accounts_customuser_groups; Type: TABLE; Schema: public; Owner: tarzan
--

CREATE TABLE public.accounts_customuser_groups (
    id integer NOT NULL,
    customuser_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.accounts_customuser_groups OWNER TO tarzan;

--
-- Name: accounts_customuser_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: tarzan
--

CREATE SEQUENCE public.accounts_customuser_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_customuser_groups_id_seq OWNER TO tarzan;

--
-- Name: accounts_customuser_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tarzan
--

ALTER SEQUENCE public.accounts_customuser_groups_id_seq OWNED BY public.accounts_customuser_groups.id;


--
-- Name: accounts_customuser_id_seq; Type: SEQUENCE; Schema: public; Owner: tarzan
--

CREATE SEQUENCE public.accounts_customuser_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_customuser_id_seq OWNER TO tarzan;

--
-- Name: accounts_customuser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tarzan
--

ALTER SEQUENCE public.accounts_customuser_id_seq OWNED BY public.accounts_customuser.id;


--
-- Name: accounts_customuser_user_permissions; Type: TABLE; Schema: public; Owner: tarzan
--

CREATE TABLE public.accounts_customuser_user_permissions (
    id integer NOT NULL,
    customuser_id bigint NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.accounts_customuser_user_permissions OWNER TO tarzan;

--
-- Name: accounts_customuser_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: tarzan
--

CREATE SEQUENCE public.accounts_customuser_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_customuser_user_permissions_id_seq OWNER TO tarzan;

--
-- Name: accounts_customuser_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tarzan
--

ALTER SEQUENCE public.accounts_customuser_user_permissions_id_seq OWNED BY public.accounts_customuser_user_permissions.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: tarzan
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO tarzan;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: tarzan
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO tarzan;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tarzan
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: tarzan
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO tarzan;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: tarzan
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO tarzan;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tarzan
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: tarzan
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO tarzan;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: tarzan
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO tarzan;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tarzan
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: bcweb_bordereau; Type: TABLE; Schema: public; Owner: tarzan
--

CREATE TABLE public.bcweb_bordereau (
    bc_num character varying(20) NOT NULL,
    bc_num_affaire character varying(20),
    bc_affaire character varying(50),
    bc_etat_affaire character varying(20),
    bc_client character varying(50),
    bc_etat_bl character varying(25),
    bc_chantier character varying(50),
    bc_adresse_livraison character varying(50),
    bc_ville_livraison character varying(50),
    bc_cp_livraison character varying(20),
    bc_transporteur character varying(50),
    bc_date_creation timestamp with time zone,
    bc_date_chargement_prev timestamp with time zone,
    bc_date_livraison_prev timestamp with time zone,
    bc_poste character varying(10),
    bc_date_bt timestamp with time zone,
    bc_date_web timestamp with time zone,
    bc_webuser character varying(20),
    bc_observ_web text,
    bc_observ text,
    bc_statut character varying(20)
);


ALTER TABLE public.bcweb_bordereau OWNER TO tarzan;

--
-- Name: bcweb_command; Type: TABLE; Schema: public; Owner: tarzan
--

CREATE TABLE public.bcweb_command (
    id bigint NOT NULL,
    bc_num character varying(20),
    iduser character varying(20),
    command character varying(70),
    application_id_id character varying(20)
);


ALTER TABLE public.bcweb_command OWNER TO tarzan;

--
-- Name: bcweb_command_id_seq; Type: SEQUENCE; Schema: public; Owner: tarzan
--

CREATE SEQUENCE public.bcweb_command_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bcweb_command_id_seq OWNER TO tarzan;

--
-- Name: bcweb_command_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tarzan
--

ALTER SEQUENCE public.bcweb_command_id_seq OWNED BY public.bcweb_command.id;


--
-- Name: bcweb_machine; Type: TABLE; Schema: public; Owner: tarzan
--

CREATE TABLE public.bcweb_machine (
    device_id character varying(100) NOT NULL,
    scandit_device_id character varying(100),
    entreprise character varying(50),
    utilisateur character varying(50),
    record_date timestamp with time zone,
    actif boolean,
    nb_conn integer
);


ALTER TABLE public.bcweb_machine OWNER TO tarzan;

--
-- Name: bcweb_param; Type: TABLE; Schema: public; Owner: tarzan
--

CREATE TABLE public.bcweb_param (
    id bigint NOT NULL,
    "addOK" boolean
);


ALTER TABLE public.bcweb_param OWNER TO tarzan;

--
-- Name: bcweb_param_id_seq; Type: SEQUENCE; Schema: public; Owner: tarzan
--

CREATE SEQUENCE public.bcweb_param_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bcweb_param_id_seq OWNER TO tarzan;

--
-- Name: bcweb_param_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tarzan
--

ALTER SEQUENCE public.bcweb_param_id_seq OWNED BY public.bcweb_param.id;


--
-- Name: bcweb_piece; Type: TABLE; Schema: public; Owner: tarzan
--

CREATE TABLE public.bcweb_piece (
    id bigint NOT NULL,
    pce_num character varying(20),
    pce_ref_client character varying(20),
    pce_etat character varying(5),
    pce_nom_etude character varying(100),
    pce_ref_etude character varying(5),
    pce_type_pdt character varying(30),
    pce_qte numeric(14,4),
    pce_unit character varying(3),
    pce_poids numeric(14,4),
    pce_prop_charge boolean,
    pce_charge boolean,
    pce_observ_bc text,
    pce_date_prod timestamp with time zone,
    pce_observ_pce text,
    pce_date_planif timestamp with time zone,
    pce_date_bt timestamp with time zone,
    pce_date_web timestamp with time zone,
    pce_webuser character varying(20),
    pce_observ_web text,
    pce_num_bl_id character varying(20) NOT NULL
);


ALTER TABLE public.bcweb_piece OWNER TO tarzan;

--
-- Name: bcweb_piece_id_seq; Type: SEQUENCE; Schema: public; Owner: tarzan
--

CREATE SEQUENCE public.bcweb_piece_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bcweb_piece_id_seq OWNER TO tarzan;

--
-- Name: bcweb_piece_id_seq1; Type: SEQUENCE; Schema: public; Owner: tarzan
--

CREATE SEQUENCE public.bcweb_piece_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bcweb_piece_id_seq1 OWNER TO tarzan;

--
-- Name: bcweb_piece_id_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: tarzan
--

ALTER SEQUENCE public.bcweb_piece_id_seq1 OWNED BY public.bcweb_piece.id;


--
-- Name: bcweb_printdebug; Type: TABLE; Schema: public; Owner: tarzan
--

CREATE TABLE public.bcweb_printdebug (
    id bigint NOT NULL,
    message text,
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE public.bcweb_printdebug OWNER TO tarzan;

--
-- Name: bcweb_printdebug_id_seq; Type: SEQUENCE; Schema: public; Owner: tarzan
--

CREATE SEQUENCE public.bcweb_printdebug_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bcweb_printdebug_id_seq OWNER TO tarzan;

--
-- Name: bcweb_printdebug_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tarzan
--

ALTER SEQUENCE public.bcweb_printdebug_id_seq OWNED BY public.bcweb_printdebug.id;


--
-- Name: bcweb_produit; Type: TABLE; Schema: public; Owner: tarzan
--

CREATE TABLE public.bcweb_produit (
    id bigint NOT NULL,
    pdt_code integer,
    pdt_num_serie character varying(50),
    pdt_libel text,
    pdt_qte double precision,
    pdt_unit character varying(3),
    pdt_prop_charge boolean,
    pdt_charge boolean,
    pdt_observ_bc text,
    pdt_consigne boolean,
    pdt_date_bt timestamp with time zone,
    pdt_date_web timestamp with time zone,
    pdt_webuser character varying(20),
    pdt_observ_web text,
    pdt_num_bl_id character varying(20) NOT NULL
);


ALTER TABLE public.bcweb_produit OWNER TO tarzan;

--
-- Name: bcweb_produit_id_seq; Type: SEQUENCE; Schema: public; Owner: tarzan
--

CREATE SEQUENCE public.bcweb_produit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bcweb_produit_id_seq OWNER TO tarzan;

--
-- Name: bcweb_produit_id_seq1; Type: SEQUENCE; Schema: public; Owner: tarzan
--

CREATE SEQUENCE public.bcweb_produit_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bcweb_produit_id_seq1 OWNER TO tarzan;

--
-- Name: bcweb_produit_id_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: tarzan
--

ALTER SEQUENCE public.bcweb_produit_id_seq1 OWNED BY public.bcweb_produit.id;


--
-- Name: bcweb_qrpiece; Type: TABLE; Schema: public; Owner: tarzan
--

CREATE TABLE public.bcweb_qrpiece (
    qrp_num character varying(20) NOT NULL,
    qrp_ref_client character varying(20),
    qrp_etat character varying(5),
    qrp_nom_etude character varying(100),
    qrp_ref_etude character varying(5),
    qrp_type_pdt character varying(30),
    qrp_qte numeric(14,4),
    qrp_unit character varying(5),
    qrp_poids numeric(14,4),
    qrp_prop_charge boolean,
    qrp_charge boolean,
    qrp_observ_pce text,
    qrp_num_bl character varying(20),
    qrp_nom_client character varying(50),
    qrp_nom_affaire character varying(50),
    qrp_num_affaire character varying(10),
    qrp_etat_affaire character varying(20),
    qrp_etat_prod character varying(100),
    qrp_cahier_plan character varying(255),
    qrp_dessinateur character varying(255),
    qrp_etude_par character varying(255),
    qrp_redige_par character varying(255),
    qrp_atelier character varying(50),
    qrp_date_fabr_prevue timestamp with time zone,
    qrp_date_livr_prevue timestamp with time zone,
    qrp_date_charge timestamp with time zone,
    qrp_date_livraison timestamp with time zone,
    qrp_etat_bl character varying(25),
    qrp_num_phase integer,
    qrp_date_phase timestamp with time zone,
    qrp_prix_unit numeric(14,4),
    qrp_num_nc integer,
    qrp_num_facture character varying(10),
    qrp_etat_facture character varying(10),
    qrp_date_facture timestamp with time zone,
    qrp_surface numeric(14,4),
    qrp_volume numeric(14,4),
    qrp_longueur numeric(14,4),
    qrp_largeur numeric(14,4),
    qrp_hauteur numeric(14,4),
    qrp_beton character varying(150)
);


ALTER TABLE public.bcweb_qrpiece OWNER TO tarzan;

--
-- Name: bcweb_qrpiece_article; Type: TABLE; Schema: public; Owner: tarzan
--

CREATE TABLE public.bcweb_qrpiece_article (
    id bigint NOT NULL,
    qrpa_unit character varying(5),
    qrpa_libel character varying(50),
    qrpa_qte numeric(14,4),
    qrpa_observ character varying(255),
    qrpa_origine character varying(255),
    qrpa_prix_unit numeric(14,4),
    qrpa_qrp_num_id character varying(20)
);


ALTER TABLE public.bcweb_qrpiece_article OWNER TO tarzan;

--
-- Name: bcweb_qrpiece_article_id_seq; Type: SEQUENCE; Schema: public; Owner: tarzan
--

CREATE SEQUENCE public.bcweb_qrpiece_article_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bcweb_qrpiece_article_id_seq OWNER TO tarzan;

--
-- Name: bcweb_qrpiece_article_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tarzan
--

ALTER SEQUENCE public.bcweb_qrpiece_article_id_seq OWNED BY public.bcweb_qrpiece_article.id;


--
-- Name: btapps_application; Type: TABLE; Schema: public; Owner: tarzan
--

CREATE TABLE public.btapps_application (
    name character varying(20) NOT NULL,
    nb_conn_max integer,
    version character varying(25)
);


ALTER TABLE public.btapps_application OWNER TO tarzan;

--
-- Name: btapps_code; Type: TABLE; Schema: public; Owner: tarzan
--

CREATE TABLE public.btapps_code (
    code character varying(20) NOT NULL,
    description character varying(254)
);


ALTER TABLE public.btapps_code OWNER TO tarzan;

--
-- Name: btapps_droit; Type: TABLE; Schema: public; Owner: tarzan
--

CREATE TABLE public.btapps_droit (
    id bigint NOT NULL,
    utilisateur character varying(50),
    client character varying(50),
    application_id character varying(20) NOT NULL
);


ALTER TABLE public.btapps_droit OWNER TO tarzan;

--
-- Name: btapps_droit_id_seq; Type: SEQUENCE; Schema: public; Owner: tarzan
--

CREATE SEQUENCE public.btapps_droit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.btapps_droit_id_seq OWNER TO tarzan;

--
-- Name: btapps_droit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tarzan
--

ALTER SEQUENCE public.btapps_droit_id_seq OWNED BY public.btapps_droit.id;


--
-- Name: btapps_session; Type: TABLE; Schema: public; Owner: tarzan
--

CREATE TABLE public.btapps_session (
    id bigint NOT NULL,
    utilisateur character varying(50),
    token text,
    fingerprint character varying(100),
    sessionid text,
    application_id character varying(20) NOT NULL
);


ALTER TABLE public.btapps_session OWNER TO tarzan;

--
-- Name: btapps_session_id_seq; Type: SEQUENCE; Schema: public; Owner: tarzan
--

CREATE SEQUENCE public.btapps_session_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.btapps_session_id_seq OWNER TO tarzan;

--
-- Name: btapps_session_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tarzan
--

ALTER SEQUENCE public.btapps_session_id_seq OWNED BY public.btapps_session.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: tarzan
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO tarzan;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: tarzan
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO tarzan;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tarzan
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: tarzan
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO tarzan;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: tarzan
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO tarzan;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tarzan
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: tarzan
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO tarzan;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: tarzan
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO tarzan;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tarzan
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: tarzan
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO tarzan;

--
-- Name: accounts_customuser id; Type: DEFAULT; Schema: public; Owner: tarzan
--

ALTER TABLE ONLY public.accounts_customuser ALTER COLUMN id SET DEFAULT nextval('public.accounts_customuser_id_seq'::regclass);


--
-- Name: accounts_customuser_groups id; Type: DEFAULT; Schema: public; Owner: tarzan
--

ALTER TABLE ONLY public.accounts_customuser_groups ALTER COLUMN id SET DEFAULT nextval('public.accounts_customuser_groups_id_seq'::regclass);


--
-- Name: accounts_customuser_user_permissions id; Type: DEFAULT; Schema: public; Owner: tarzan
--

ALTER TABLE ONLY public.accounts_customuser_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.accounts_customuser_user_permissions_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: tarzan
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: tarzan
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: tarzan
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: bcweb_command id; Type: DEFAULT; Schema: public; Owner: tarzan
--

ALTER TABLE ONLY public.bcweb_command ALTER COLUMN id SET DEFAULT nextval('public.bcweb_command_id_seq'::regclass);


--
-- Name: bcweb_param id; Type: DEFAULT; Schema: public; Owner: tarzan
--

ALTER TABLE ONLY public.bcweb_param ALTER COLUMN id SET DEFAULT nextval('public.bcweb_param_id_seq'::regclass);


--
-- Name: bcweb_piece id; Type: DEFAULT; Schema: public; Owner: tarzan
--

ALTER TABLE ONLY public.bcweb_piece ALTER COLUMN id SET DEFAULT nextval('public.bcweb_piece_id_seq1'::regclass);


--
-- Name: bcweb_printdebug id; Type: DEFAULT; Schema: public; Owner: tarzan
--

ALTER TABLE ONLY public.bcweb_printdebug ALTER COLUMN id SET DEFAULT nextval('public.bcweb_printdebug_id_seq'::regclass);


--
-- Name: bcweb_produit id; Type: DEFAULT; Schema: public; Owner: tarzan
--

ALTER TABLE ONLY public.bcweb_produit ALTER COLUMN id SET DEFAULT nextval('public.bcweb_produit_id_seq1'::regclass);


--
-- Name: bcweb_qrpiece_article id; Type: DEFAULT; Schema: public; Owner: tarzan
--

ALTER TABLE ONLY public.bcweb_qrpiece_article ALTER COLUMN id SET DEFAULT nextval('public.bcweb_qrpiece_article_id_seq'::regclass);


--
-- Name: btapps_droit id; Type: DEFAULT; Schema: public; Owner: tarzan
--

ALTER TABLE ONLY public.btapps_droit ALTER COLUMN id SET DEFAULT nextval('public.btapps_droit_id_seq'::regclass);


--
-- Name: btapps_session id; Type: DEFAULT; Schema: public; Owner: tarzan
--

ALTER TABLE ONLY public.btapps_session ALTER COLUMN id SET DEFAULT nextval('public.btapps_session_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: tarzan
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: tarzan
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: tarzan
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: accounts_customuser; Type: TABLE DATA; Schema: public; Owner: tarzan
--

COPY public.accounts_customuser (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$320000$hWBukhEibsY0Sv8E6PfdMe$M/gajAn7eq0uDAQtfwY5KTUyotYsHc109rDw8k/F+I4=	\N	t	monkey			mks@mks.fr	t	t	2024-01-26 10:15:17.760394+00
2	pbkdf2_sha256$320000$X5rKKrK3LSceQZtQeaALvB$pT2snqHLEyIPT+plzMVp9CNokghKJ9rFC/HkNKDzMok=	\N	f	lpb654			lpb654@lpb.fr	f	t	2024-01-26 10:18:43.342054+00
4	pbkdf2_sha256$320000$4IT0JiBP3shBUfdDIjw7Fu$mmCpfGdMjAk/jnVMPUkUqSwxCZASklOj57SiX7vLIPQ=	\N	f	Marlène			marlene@lpb.fr	f	t	2024-01-26 10:22:26.533654+00
\.


--
-- Data for Name: accounts_customuser_groups; Type: TABLE DATA; Schema: public; Owner: tarzan
--

COPY public.accounts_customuser_groups (id, customuser_id, group_id) FROM stdin;
\.


--
-- Data for Name: accounts_customuser_user_permissions; Type: TABLE DATA; Schema: public; Owner: tarzan
--

COPY public.accounts_customuser_user_permissions (id, customuser_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: tarzan
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: tarzan
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: tarzan
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add bordereau	6	add_bordereau
22	Can change bordereau	6	change_bordereau
23	Can delete bordereau	6	delete_bordereau
24	Can view bordereau	6	view_bordereau
25	Can add machine	7	add_machine
26	Can change machine	7	change_machine
27	Can delete machine	7	delete_machine
28	Can view machine	7	view_machine
29	Can add param	8	add_param
30	Can change param	8	change_param
31	Can delete param	8	delete_param
32	Can view param	8	view_param
33	Can add print debug	9	add_printdebug
34	Can change print debug	9	change_printdebug
35	Can delete print debug	9	delete_printdebug
36	Can view print debug	9	view_printdebug
37	Can add qrpiece	10	add_qrpiece
38	Can change qrpiece	10	change_qrpiece
39	Can delete qrpiece	10	delete_qrpiece
40	Can view qrpiece	10	view_qrpiece
41	Can add qrpiece_article	11	add_qrpiece_article
42	Can change qrpiece_article	11	change_qrpiece_article
43	Can delete qrpiece_article	11	delete_qrpiece_article
44	Can view qrpiece_article	11	view_qrpiece_article
45	Can add produit	12	add_produit
46	Can change produit	12	change_produit
47	Can delete produit	12	delete_produit
48	Can view produit	12	view_produit
49	Can add piece	13	add_piece
50	Can change piece	13	change_piece
51	Can delete piece	13	delete_piece
52	Can view piece	13	view_piece
53	Can add command	14	add_command
54	Can change command	14	change_command
55	Can delete command	14	delete_command
56	Can view command	14	view_command
57	Can add application	15	add_application
58	Can change application	15	change_application
59	Can delete application	15	delete_application
60	Can view application	15	view_application
61	Can add code	16	add_code
62	Can change code	16	change_code
63	Can delete code	16	delete_code
64	Can view code	16	view_code
65	Can add session	17	add_session
66	Can change session	17	change_session
67	Can delete session	17	delete_session
68	Can view session	17	view_session
69	Can add droit	18	add_droit
70	Can change droit	18	change_droit
71	Can delete droit	18	delete_droit
72	Can view droit	18	view_droit
73	Can add user	19	add_customuser
74	Can change user	19	change_customuser
75	Can delete user	19	delete_customuser
76	Can view user	19	view_customuser
\.


--
-- Data for Name: bcweb_bordereau; Type: TABLE DATA; Schema: public; Owner: tarzan
--

COPY public.bcweb_bordereau (bc_num, bc_num_affaire, bc_affaire, bc_etat_affaire, bc_client, bc_etat_bl, bc_chantier, bc_adresse_livraison, bc_ville_livraison, bc_cp_livraison, bc_transporteur, bc_date_creation, bc_date_chargement_prev, bc_date_livraison_prev, bc_poste, bc_date_bt, bc_date_web, bc_webuser, bc_observ_web, bc_observ, bc_statut) FROM stdin;
000635	240100544	BLEU MERCURE Soutènements 17 PERIGNY	Signée	PIANAZZA ETS	BCHAREDIT	\N	\N	\N	\N	\N	2024-01-17 00:00:00+00	\N	\N	LPB	\N	2024-02-01 10:23:52+00	lpb654	\N	\N	en cours
000648	240300578	test maj factures	Signée	PRECAST BUILDING	Initial	\N	\N	\N	\N	\N	2024-03-22 00:00:00+00	\N	\N	LPB	\N	2024-04-17 16:13:30+00	\N	\N	\N	en cours
000649	240300578	test maj factures	Signée	PRECAST BUILDING	Initial	\N	\N	\N	\N	\N	2024-03-22 00:00:00+00	\N	\N	LPB	\N	2024-04-17 16:13:30+00	\N	\N	\N	en cours
\.


--
-- Data for Name: bcweb_command; Type: TABLE DATA; Schema: public; Owner: tarzan
--

COPY public.bcweb_command (id, bc_num, iduser, command, application_id_id) FROM stdin;
2	0	lpb654	> ok	\N
3	0	Marlène	> ok	\N
\.


--
-- Data for Name: bcweb_machine; Type: TABLE DATA; Schema: public; Owner: tarzan
--

COPY public.bcweb_machine (device_id, scandit_device_id, entreprise, utilisateur, record_date, actif, nb_conn) FROM stdin;
\.


--
-- Data for Name: bcweb_param; Type: TABLE DATA; Schema: public; Owner: tarzan
--

COPY public.bcweb_param (id, "addOK") FROM stdin;
\.


--
-- Data for Name: bcweb_piece; Type: TABLE DATA; Schema: public; Owner: tarzan
--

COPY public.bcweb_piece (id, pce_num, pce_ref_client, pce_etat, pce_nom_etude, pce_ref_etude, pce_type_pdt, pce_qte, pce_unit, pce_poids, pce_prop_charge, pce_charge, pce_observ_bc, pce_date_prod, pce_observ_pce, pce_date_planif, pce_date_bt, pce_date_web, pce_webuser, pce_observ_web, pce_num_bl_id) FROM stdin;
225	052092	20	OK	Longrines 20x60	20	LONGRINES BA PLEINES	6.0000	\N	1.8000	t	t	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000648
226	052093	20	OK	Longrines 20x60	20	LONGRINES BA PLEINES	6.0000	\N	1.8000	t	t	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000648
227	052094	20	OK	Longrines 20x60	20	LONGRINES BA PLEINES	6.0000	\N	1.8000	t	t	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000648
228	052095	20	OK	Longrines 20x60	20	LONGRINES BA PLEINES	6.0000	\N	1.8000	t	t	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000648
229	052069	30	OK	Longrines 20x70	30	LONGRINES BA PLEINES	7.0000	\N	2.4500	t	t	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000648
230	052100	30	OK	Longrines 20x70	30	LONGRINES BA PLEINES	7.0000	\N	2.4500	t	t	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000648
231	052102	30	OK	Longrines 20x70	30	LONGRINES BA PLEINES	7.0000	\N	2.4500	t	t	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000648
232	052108	30	OK	Longrines 20x70	30	LONGRINES BA PLEINES	7.0000	\N	2.4500	t	t	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000648
233	052114	30	OK	Longrines 20x70	30	LONGRINES BA PLEINES	7.0000	\N	2.4500	t	t	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000648
234	052120	30	OK	Longrines 20x70	30	LONGRINES BA PLEINES	7.0000	\N	2.4500	t	t	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000648
235	052126	30	OK	Longrines 20x70	30	LONGRINES BA PLEINES	7.0000	\N	2.4500	t	t	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000648
236	052132	30	OK	Longrines 20x70	30	LONGRINES BA PLEINES	7.0000	\N	2.4500	t	t	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000648
237	052138	30	OK	Longrines 20x70	30	LONGRINES BA PLEINES	7.0000	\N	2.4500	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000648
238	052144	30	OK	Longrines 20x70	30	LONGRINES BA PLEINES	7.0000	\N	2.4500	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000648
239	052070	40	OK	Longrines 20x80	15	LONGRINES BA PLEINES	8.0000	\N	3.2000	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000648
240	052101	40	OK	Longrines 20x80	15	LONGRINES BA PLEINES	8.0000	\N	3.2000	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000648
241	052103	40	OK	Longrines 20x80	15	LONGRINES BA PLEINES	8.0000	\N	3.2000	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000648
242	052109	40	OK	Longrines 20x80	15	LONGRINES BA PLEINES	8.0000	\N	3.2000	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000648
243	052115	40	OK	Longrines 20x80	15	LONGRINES BA PLEINES	8.0000	\N	3.2000	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000648
244	052121	40	OK	Longrines 20x80	15	LONGRINES BA PLEINES	8.0000	\N	3.2000	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000648
245	052127	40	OK	Longrines 20x80	15	LONGRINES BA PLEINES	8.0000	\N	3.2000	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000648
246	052133	40	OK	Longrines 20x80	15	LONGRINES BA PLEINES	8.0000	\N	3.2000	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000648
247	052139	40	OK	Longrines 20x80	15	LONGRINES BA PLEINES	8.0000	\N	3.2000	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000648
248	052145	40	OK	Longrines 20x80	15	LONGRINES BA PLEINES	8.0000	\N	3.2000	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000648
249	052071	50	OK	Poutres 20x50	50	POUTRES	5.0000	\N	1.2500	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000648
250	052096	50	OK	Poutres 20x50	50	POUTRES	5.0000	\N	1.2500	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000648
251	052104	50	OK	Poutres 20x50	50	POUTRES	5.0000	\N	1.2500	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000648
252	052110	50	OK	Poutres 20x50	50	POUTRES	5.0000	\N	1.2500	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000648
253	052116	50	OK	Poutres 20x50	50	POUTRES	5.0000	\N	1.2500	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000648
254	052122	50	OK	Poutres 20x50	50	POUTRES	5.0000	\N	1.2500	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000648
255	052128	50	OK	Poutres 20x50	50	POUTRES	5.0000	\N	1.2500	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000648
256	052134	50	OK	Poutres 20x50	50	POUTRES	5.0000	\N	1.2500	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000648
257	052140	50	OK	Poutres 20x50	50	POUTRES	5.0000	\N	1.2500	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000648
258	052146	50	OK	Poutres 20x50	50	POUTRES	5.0000	\N	1.2500	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000648
259	052072	60	OK	Poutres 20x60	60	POUTRES	6.0000	\N	1.8000	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000648
260	052097	60	OK	Poutres 20x60	60	POUTRES	6.0000	\N	1.8000	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000648
261	052105	60	OK	Poutres 20x60	60	POUTRES	6.0000	\N	1.8000	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000648
262	052111	60	OK	Poutres 20x60	60	POUTRES	6.0000	\N	1.8000	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000648
263	052117	60	OK	Poutres 20x60	60	POUTRES	6.0000	\N	1.8000	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000648
264	052123	60	OK	Poutres 20x60	60	POUTRES	6.0000	\N	1.8000	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000648
265	052129	60	OK	Poutres 20x60	60	POUTRES	6.0000	\N	1.8000	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000648
266	052135	60	OK	Poutres 20x60	60	POUTRES	6.0000	\N	1.8000	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000648
267	052141	60	OK	Poutres 20x60	60	POUTRES	6.0000	\N	1.8000	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000648
268	052147	60	OK	Poutres 20x60	60	POUTRES	6.0000	\N	1.8000	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000648
269	052073	70	OK	Poutres 20x70	85	POUTRES	7.0000	\N	2.4500	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000648
270	052098	70	OK	Poutres 20x70	85	POUTRES	7.0000	\N	2.4500	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000648
271	052106	70	OK	Poutres 20x70	85	POUTRES	7.0000	\N	2.4500	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000648
272	052112	70	OK	Poutres 20x70	85	POUTRES	7.0000	\N	2.4500	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000648
273	052118	70	OK	Poutres 20x70	85	POUTRES	7.0000	\N	2.4500	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000648
274	052124	70	OK	Poutres 20x70	85	POUTRES	7.0000	\N	2.4500	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000648
275	052130	70	OK	Poutres 20x70	85	POUTRES	7.0000	\N	2.4500	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000648
276	052136	70	OK	Poutres 20x70	85	POUTRES	7.0000	\N	2.4500	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000648
277	052142	70	OK	Poutres 20x70	85	POUTRES	7.0000	\N	2.4500	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000648
278	052148	70	OK	Poutres 20x70	85	POUTRES	7.0000	\N	2.4500	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000648
279	052074	80	OK	Poutres 20x80	80	POUTRES	8.0000	\N	3.2000	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000648
280	052099	80	OK	Poutres 20x80	80	POUTRES	8.0000	\N	3.2000	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000648
281	052107	80	OK	Poutres 20x80	80	POUTRES	8.0000	\N	3.2000	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000648
282	052113	80	OK	Poutres 20x80	80	POUTRES	8.0000	\N	3.2000	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000648
283	052119	80	OK	Poutres 20x80	80	POUTRES	8.0000	\N	3.2000	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000648
284	052125	80	OK	Poutres 20x80	80	POUTRES	8.0000	\N	3.2000	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000648
285	052131	80	OK	Poutres 20x80	80	POUTRES	8.0000	\N	3.2000	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000648
286	052137	80	OK	Poutres 20x80	80	POUTRES	8.0000	\N	3.2000	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000648
287	052143	80	OK	Poutres 20x80	80	POUTRES	8.0000	\N	3.2000	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000648
288	052149	80	OK	Poutres 20x80	80	POUTRES	8.0000	\N	3.2000	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000648
289	052138	30	OK	Longrines 20x70	30	LONGRINES BA PLEINES	7.0000	\N	2.4500	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000649
290	052144	30	OK	Longrines 20x70	30	LONGRINES BA PLEINES	7.0000	\N	2.4500	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000649
291	052070	40	OK	Longrines 20x80	15	LONGRINES BA PLEINES	8.0000	\N	3.2000	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000649
292	052101	40	OK	Longrines 20x80	15	LONGRINES BA PLEINES	8.0000	\N	3.2000	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000649
293	052103	40	OK	Longrines 20x80	15	LONGRINES BA PLEINES	8.0000	\N	3.2000	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000649
294	052109	40	OK	Longrines 20x80	15	LONGRINES BA PLEINES	8.0000	\N	3.2000	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000649
295	052115	40	OK	Longrines 20x80	15	LONGRINES BA PLEINES	8.0000	\N	3.2000	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000649
296	052121	40	OK	Longrines 20x80	15	LONGRINES BA PLEINES	8.0000	\N	3.2000	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000649
297	052127	40	OK	Longrines 20x80	15	LONGRINES BA PLEINES	8.0000	\N	3.2000	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000649
298	052133	40	OK	Longrines 20x80	15	LONGRINES BA PLEINES	8.0000	\N	3.2000	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000649
299	052139	40	OK	Longrines 20x80	15	LONGRINES BA PLEINES	8.0000	\N	3.2000	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000649
300	052145	40	OK	Longrines 20x80	15	LONGRINES BA PLEINES	8.0000	\N	3.2000	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000649
301	052071	50	OK	Poutres 20x50	50	POUTRES	5.0000	\N	1.2500	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000649
302	052096	50	OK	Poutres 20x50	50	POUTRES	5.0000	\N	1.2500	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000649
303	052104	50	OK	Poutres 20x50	50	POUTRES	5.0000	\N	1.2500	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000649
304	052110	50	OK	Poutres 20x50	50	POUTRES	5.0000	\N	1.2500	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000649
305	052116	50	OK	Poutres 20x50	50	POUTRES	5.0000	\N	1.2500	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000649
306	052122	50	OK	Poutres 20x50	50	POUTRES	5.0000	\N	1.2500	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000649
307	052128	50	OK	Poutres 20x50	50	POUTRES	5.0000	\N	1.2500	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000649
308	052134	50	OK	Poutres 20x50	50	POUTRES	5.0000	\N	1.2500	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000649
309	052140	50	OK	Poutres 20x50	50	POUTRES	5.0000	\N	1.2500	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000649
310	052146	50	OK	Poutres 20x50	50	POUTRES	5.0000	\N	1.2500	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000649
311	052072	60	OK	Poutres 20x60	60	POUTRES	6.0000	\N	1.8000	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000649
312	052097	60	OK	Poutres 20x60	60	POUTRES	6.0000	\N	1.8000	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000649
313	052105	60	OK	Poutres 20x60	60	POUTRES	6.0000	\N	1.8000	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000649
314	052111	60	OK	Poutres 20x60	60	POUTRES	6.0000	\N	1.8000	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000649
315	052117	60	OK	Poutres 20x60	60	POUTRES	6.0000	\N	1.8000	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000649
316	052123	60	OK	Poutres 20x60	60	POUTRES	6.0000	\N	1.8000	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000649
317	052129	60	OK	Poutres 20x60	60	POUTRES	6.0000	\N	1.8000	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000649
318	052135	60	OK	Poutres 20x60	60	POUTRES	6.0000	\N	1.8000	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000649
319	052141	60	OK	Poutres 20x60	60	POUTRES	6.0000	\N	1.8000	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000649
320	052147	60	OK	Poutres 20x60	60	POUTRES	6.0000	\N	1.8000	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000649
321	052073	70	OK	Poutres 20x70	85	POUTRES	7.0000	\N	2.4500	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000649
322	052098	70	OK	Poutres 20x70	85	POUTRES	7.0000	\N	2.4500	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000649
323	052106	70	OK	Poutres 20x70	85	POUTRES	7.0000	\N	2.4500	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000649
324	052112	70	OK	Poutres 20x70	85	POUTRES	7.0000	\N	2.4500	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000649
325	052118	70	OK	Poutres 20x70	85	POUTRES	7.0000	\N	2.4500	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000649
326	052124	70	OK	Poutres 20x70	85	POUTRES	7.0000	\N	2.4500	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000649
327	052130	70	OK	Poutres 20x70	85	POUTRES	7.0000	\N	2.4500	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000649
328	052136	70	OK	Poutres 20x70	85	POUTRES	7.0000	\N	2.4500	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000649
329	052142	70	OK	Poutres 20x70	85	POUTRES	7.0000	\N	2.4500	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000649
330	052148	70	OK	Poutres 20x70	85	POUTRES	7.0000	\N	2.4500	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000649
331	052074	80	OK	Poutres 20x80	80	POUTRES	8.0000	\N	3.2000	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000649
332	052099	80	OK	Poutres 20x80	80	POUTRES	8.0000	\N	3.2000	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000649
333	052107	80	OK	Poutres 20x80	80	POUTRES	8.0000	\N	3.2000	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000649
334	052113	80	OK	Poutres 20x80	80	POUTRES	8.0000	\N	3.2000	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000649
335	052119	80	OK	Poutres 20x80	80	POUTRES	8.0000	\N	3.2000	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000649
336	052125	80	OK	Poutres 20x80	80	POUTRES	8.0000	\N	3.2000	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000649
337	052131	80	OK	Poutres 20x80	80	POUTRES	8.0000	\N	3.2000	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000649
338	052137	80	OK	Poutres 20x80	80	POUTRES	8.0000	\N	3.2000	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000649
339	052143	80	OK	Poutres 20x80	80	POUTRES	8.0000	\N	3.2000	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000649
340	052149	80	OK	Poutres 20x80	80	POUTRES	8.0000	\N	3.2000	f	f	\N	2024-03-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000649
197	045388	PB-L1.5	OK	PB-L 1.5 - Mur en L - Hauteur 1.50ml en ép.10cm - Semelle 85cm en ép.10cm	030	SOUTENEMENT	2.5000	\N	1.4350	f	f	                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    	2023-10-12 00:00:00+00	\N	\N	\N	\N	\N	\N	000635
198	048878	PB-L1.5	OK	PB-L 1.5 - Mur en L - Hauteur 1.50ml en ép.10cm - Semelle 85cm en ép.10cm	030	SOUTENEMENT	2.5000	\N	1.4350	f	f	                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    	2023-09-20 00:00:00+00	\N	\N	\N	\N	\N	\N	000635
199	048879	PB-L1.5	OK	PB-L 1.5 - Mur en L - Hauteur 1.50ml en ép.10cm - Semelle 85cm en ép.10cm	030	SOUTENEMENT	2.5000	\N	1.4350	f	f	                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    	2023-09-20 00:00:00+00	\N	\N	\N	\N	\N	\N	000635
200	048880	PB-L1.5	OK	PB-L 1.5 - Mur en L - Hauteur 1.50ml en ép.10cm - Semelle 85cm en ép.10cm	030	SOUTENEMENT	2.5000	\N	1.4350	f	f	                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    	2023-09-22 00:00:00+00	\N	\N	\N	\N	\N	\N	000635
201	048882	PB-L1.5	OK	PB-L 1.5 - Mur en L - Hauteur 1.50ml en ép.10cm - Semelle 85cm en ép.10cm	030	SOUTENEMENT	2.5000	\N	1.4350	f	f	                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    	2023-09-22 00:00:00+00	\N	\N	\N	\N	\N	\N	000635
202	048884	PB-L1.5	OK	PB-L 1.5 - Mur en L - Hauteur 1.50ml en ép.10cm - Semelle 85cm en ép.10cm	030	SOUTENEMENT	2.5000	\N	1.4350	f	f	                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    	2023-09-21 00:00:00+00	\N	\N	\N	\N	\N	\N	000635
203	048885	PB-L1.5	OK	PB-L 1.5 - Mur en L - Hauteur 1.50ml en ép.10cm - Semelle 85cm en ép.10cm	030	SOUTENEMENT	2.5000	\N	1.4350	f	f	                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    	2023-10-12 00:00:00+00	\N	\N	\N	\N	\N	\N	000635
204	048886	PB-L1.5	OK	PB-L 1.5 - Mur en L - Hauteur 1.50ml en ép.10cm - Semelle 85cm en ép.10cm	030	SOUTENEMENT	2.5000	\N	1.4350	f	f	                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    	2023-10-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000635
205	048904	PB-L1.5	OK	PB-L 1.5 - Mur en L - Hauteur 1.50ml en ép.10cm - Semelle 85cm en ép.10cm	030	SOUTENEMENT	2.5000	\N	1.4350	f	t	                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    	2024-01-11 00:00:00+00	\N	\N	\N	\N	\N	\N	000635
206	048905	PB-L1.5	OK	PB-L 1.5 - Mur en L - Hauteur 1.50ml en ép.10cm - Semelle 85cm en ép.10cm	030	SOUTENEMENT	2.5000	\N	1.4350	f	t	                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    	2024-01-11 00:00:00+00	\N	\N	\N	\N	\N	\N	000635
207	048906	PB-L1.5	OK	PB-L 1.5 - Mur en L - Hauteur 1.50ml en ép.10cm - Semelle 85cm en ép.10cm	030	SOUTENEMENT	2.5000	\N	1.4350	f	t	                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    	2024-01-05 00:00:00+00	\N	\N	\N	\N	\N	\N	000635
208	048907	PB-L1.5	OK	PB-L 1.5 - Mur en L - Hauteur 1.50ml en ép.10cm - Semelle 85cm en ép.10cm	030	SOUTENEMENT	2.5000	\N	1.4350	f	t	                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    	2024-01-05 00:00:00+00	\N	\N	\N	\N	\N	\N	000635
209	048908	PB-L1.5	OK	PB-L 1.5 - Mur en L - Hauteur 1.50ml en ép.10cm - Semelle 85cm en ép.10cm	030	SOUTENEMENT	2.5000	\N	1.4350	f	t	                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    	2024-01-05 00:00:00+00	\N	\N	\N	\N	\N	\N	000635
210	048911	PB-L1.5	OK	PB-L 1.5 - Mur en L - Hauteur 1.50ml en ép.10cm - Semelle 85cm en ép.10cm	030	SOUTENEMENT	2.5000	\N	1.4350	f	t	                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    	2024-01-05 00:00:00+00	\N	\N	\N	\N	\N	\N	000635
211	048912	PB-L1.5	OK	PB-L 1.5 - Mur en L - Hauteur 1.50ml en ép.10cm - Semelle 85cm en ép.10cm	030	SOUTENEMENT	2.5000	\N	1.4350	f	t	                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    	2024-01-09 00:00:00+00	\N	\N	\N	\N	\N	\N	000635
212	048914	PB-L1.5	OK	PB-L 1.5 - Mur en L - Hauteur 1.50ml en ép.10cm - Semelle 85cm en ép.10cm	030	SOUTENEMENT	2.5000	\N	1.4350	f	t	                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    	2023-05-31 00:00:00+00	\N	\N	\N	\N	\N	\N	000635
213	048915	PB-L1.5	OK	PB-L 1.5 - Mur en L - Hauteur 1.50ml en ép.10cm - Semelle 85cm en ép.10cm	030	SOUTENEMENT	2.5000	\N	1.4350	f	t	                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    	2023-05-25 00:00:00+00	\N	\N	\N	\N	\N	\N	000635
214	048916	PB-L1.5	OK	PB-L 1.5 - Mur en L - Hauteur 1.50ml en ép.10cm - Semelle 85cm en ép.10cm	030	SOUTENEMENT	2.5000	\N	1.4350	f	t	                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    	2023-05-12 00:00:00+00	\N	\N	\N	\N	\N	\N	000635
215	048917	PB-L1.5	OK	PB-L 1.5 - Mur en L - Hauteur 1.50ml en ép.10cm - Semelle 85cm en ép.10cm	030	SOUTENEMENT	2.5000	\N	1.4350	f	f	                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    	2023-05-25 00:00:00+00	\N	\N	\N	\N	\N	\N	000635
216	048919	PB-L1.5	OK	PB-L 1.5 - Mur en L - Hauteur 1.50ml en ép.10cm - Semelle 85cm en ép.10cm	030	SOUTENEMENT	2.5000	\N	1.4350	f	f	                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    	2024-01-10 00:00:00+00	\N	\N	\N	\N	\N	\N	000635
217	048920	PB-L1.5	OK	PB-L 1.5 - Mur en L - Hauteur 1.50ml en ép.10cm - Semelle 85cm en ép.10cm	030	SOUTENEMENT	2.5000	\N	1.4350	f	f	                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    	2024-01-10 00:00:00+00	\N	\N	\N	\N	\N	\N	000635
218	048921	PB-L1.5	OK	PB-L 1.5 - Mur en L - Hauteur 1.50ml en ép.10cm - Semelle 85cm en ép.10cm	030	SOUTENEMENT	2.5000	\N	1.4350	f	f	                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    	2024-01-09 00:00:00+00	\N	\N	\N	\N	\N	\N	000635
219	048922	PB-L1.5	OK	PB-L 1.5 - Mur en L - Hauteur 1.50ml en ép.10cm - Semelle 85cm en ép.10cm	030	SOUTENEMENT	2.5000	\N	1.4350	f	f	                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    	2024-01-08 00:00:00+00	\N	\N	\N	\N	\N	\N	000635
220	048923	PB-L1.5	OK	PB-L 1.5 - Mur en L - Hauteur 1.50ml en ép.10cm - Semelle 85cm en ép.10cm	030	SOUTENEMENT	2.5000	\N	1.4350	f	f	                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    	2024-01-08 00:00:00+00	\N	\N	\N	\N	\N	\N	000635
221	051433	PB-L1.5	OK	PB-L 1.5 - Mur en L - Hauteur 1.50ml en ép.10cm - Semelle 85cm en ép.10cm	030	SOUTENEMENT	2.5000	\N	1.4350	f	f	                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    	2024-01-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000635
222	051434	PB-L1.5	OK	PB-L 1.5 - Mur en L - Hauteur 1.50ml en ép.10cm - Semelle 85cm en ép.10cm	030	SOUTENEMENT	2.5000	\N	1.4350	f	f	                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    	2024-01-16 00:00:00+00	\N	\N	\N	\N	\N	\N	000635
223	051435	PB-L1.5	OK	PB-L 1.5 - Mur en L - Hauteur 1.50ml en ép.10cm - Semelle 85cm en ép.10cm	030	SOUTENEMENT	2.5000	\N	1.4350	f	f	                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    	2024-01-12 00:00:00+00	\N	\N	\N	\N	\N	\N	000635
224	051436	PB-L1.5	OK	PB-L 1.5 - Mur en L - Hauteur 1.50ml en ép.10cm - Semelle 85cm en ép.10cm	030	SOUTENEMENT	2.5000	\N	1.4350	f	f	                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    	2024-01-12 00:00:00+00	\N	\N	\N	\N	\N	\N	000635
\.


--
-- Data for Name: bcweb_printdebug; Type: TABLE DATA; Schema: public; Owner: tarzan
--

COPY public.bcweb_printdebug (id, message, created_at) FROM stdin;
1	passage ds la fonction checkifUserHasCommandLine...lpb654	2024-01-26 10:34:21.787005+00
2	création nouvelle ligne de commande pour un utilisateur : passage ds la fonction checkifUserHasCommandLinelpb654 error : Command matching query does not exist.	2024-01-26 10:34:21.791269+00
3	passage ds la fonction reprise...lpb654	2024-01-26 10:34:22.190794+00
4	passage ds la fonction cmdeActualiserBcs...lpb654	2024-01-26 10:34:53.574124+00
5	passage ds la fonction checkok...lpb654	2024-01-26 10:34:54.268212+00
6	passage ds la fonction checkok...lpb654	2024-01-26 10:34:54.957575+00
7	passage ds la fonction checkok...lpb654	2024-01-26 10:34:55.631135+00
8	passage ds la fonction checkok...lpb654	2024-01-26 10:34:56.319956+00
9	passage ds la fonction checkok...lpb654	2024-01-26 10:34:56.999532+00
10	passage ds la fonction checkok...lpb654	2024-01-26 10:34:57.710279+00
11	passage ds la fonction checkok...lpb654	2024-01-26 10:34:58.386918+00
12	passage ds la fonction checkok...lpb654	2024-01-26 10:34:59.065767+00
13	passage ds la fonction checkok...lpb654	2024-01-26 10:34:59.751559+00
14	passage ds la fonction checkok...lpb654	2024-01-26 10:35:00.423833+00
15	passage ds la fonction checkok...lpb654	2024-01-26 10:35:01.113339+00
16	passage ds la fonction checkok...lpb654	2024-01-26 10:35:01.803911+00
17	passage ds la fonction checkok...lpb654	2024-01-26 10:35:02.478192+00
18	passage ds la fonction checkok...lpb654	2024-01-26 10:35:03.156821+00
19	passage ds la fonction checkok...lpb654	2024-01-26 10:35:03.84715+00
20	passage ds la fonction checkok...lpb654	2024-01-26 10:35:04.527449+00
21	passage ds la fonction checkok...lpb654	2024-01-26 10:35:05.220585+00
22	passage ds la fonction checkok...lpb654	2024-01-26 10:35:05.904016+00
23	passage ds la fonction checkok...lpb654	2024-01-26 10:35:06.602635+00
24	passage ds la fonction checkok...lpb654	2024-01-26 10:35:07.276194+00
25	passage ds la fonction reprise...lpb654	2024-01-26 10:41:00.878074+00
26	passage ds la fonction cmdeActualiserBcs...lpb654	2024-01-26 10:41:03.90691+00
27	passage ds la fonction checkok...lpb654	2024-01-26 10:41:04.66658+00
28	passage ds la fonction checkok...lpb654	2024-01-26 10:41:05.408824+00
29	passage ds la fonction checkok...lpb654	2024-01-26 10:41:06.191005+00
30	passage ds la fonction checkok...lpb654	2024-01-26 10:41:06.910344+00
31	passage ds la fonction checkok...lpb654	2024-01-26 10:41:07.648155+00
32	passage ds la fonction checkok...lpb654	2024-01-26 10:41:08.410644+00
33	passage ds la fonction checkok...lpb654	2024-01-26 10:41:09.162963+00
34	passage ds la fonction checkok...lpb654	2024-01-26 10:41:09.915222+00
35	passage ds la fonction checkok...lpb654	2024-01-26 10:41:10.65876+00
36	passage ds la fonction checkok...lpb654	2024-01-26 10:41:11.419013+00
37	passage ds la fonction checkok...lpb654	2024-01-26 10:41:12.178933+00
38	passage ds la fonction checkok...lpb654	2024-01-26 10:41:12.915919+00
39	anomalie checkok: pas de ligne de commande pour user lpb654; error :Command matching query does not exist.	2024-01-26 10:41:12.919247+00
40	passage ds la fonction reprise...lpb654	2024-01-26 10:41:13.503624+00
41	anomalie reprise : pas de ligne de commande pour user lpb654; error :Command matching query does not exist.	2024-01-26 10:41:13.506006+00
42	passage ds la fonction cmdeActualiserBcs...lpb654	2024-01-26 10:41:18.136705+00
43	passage ds la fonction userapplogout (lpb654)	2024-01-26 10:42:05.776763+00
44	passage ds la fonction checkifUserHasCommandLine...lpb654	2024-01-26 10:42:06.464518+00
45	création nouvelle ligne de commande pour un utilisateur : passage ds la fonction checkifUserHasCommandLinelpb654 error : Command matching query does not exist.	2024-01-26 10:42:06.468343+00
46	passage ds la fonction reprise...lpb654	2024-01-26 10:42:06.950683+00
47	passage ds la fonction cmdeActualiserBcs...lpb654	2024-01-26 10:42:17.636798+00
48	passage ds la fonction checkok...lpb654	2024-01-26 10:42:18.357102+00
49	passage ds la fonction reprise...lpb654	2024-01-26 10:42:18.777777+00
50	passage ds la fonction ouvrir...lpb654 bc_num : 000635 	2024-01-26 10:42:45.74842+00
51	passage ds la fonction checkok...lpb654	2024-01-26 10:42:46.465113+00
52	passage ds la fonction reprise...lpb654	2024-01-26 10:42:49.661277+00
53	passage ds la fonction valider...lpb654 bc_num : 000635	2024-01-26 10:44:21.723083+00
54	passage ds la fonction checkok...lpb654	2024-01-26 10:44:22.575714+00
55	passage ds la fonction reprise...lpb654	2024-01-26 10:44:23.427692+00
56	passage ds la fonction ouvrir...lpb654 bc_num : 000635 	2024-01-26 10:44:34.273461+00
57	passage ds la fonction checkok...lpb654	2024-01-26 10:44:34.98755+00
58	passage ds la fonction reprise...lpb654	2024-01-26 10:44:37.932069+00
59	passage ds la fonction fermer/réinitialiser...lpb654 bc_num : 000635	2024-01-26 10:44:56.407874+00
60	passage ds la fonction checkok...lpb654	2024-01-26 10:44:57.294029+00
61	passage ds la fonction reprise...lpb654	2024-01-26 10:44:58.165804+00
62	passage ds la fonction reprise...lpb654	2024-01-26 10:45:08.098082+00
63	passage ds la fonction ouvrir...lpb654 bc_num : 000635 	2024-01-26 10:45:12.142923+00
64	passage ds la fonction checkok...lpb654	2024-01-26 10:45:12.909142+00
65	passage ds la fonction reprise...lpb654	2024-01-26 10:45:16.05555+00
66	passage ds la fonction fermer/réinitialiser...lpb654 bc_num : 000635	2024-01-26 10:45:21.660695+00
67	passage ds la fonction checkok...lpb654	2024-01-26 10:45:22.472815+00
68	passage ds la fonction checkok...lpb654	2024-01-26 10:45:23.305678+00
69	passage ds la fonction reprise...lpb654	2024-01-26 10:45:24.118245+00
70	passage ds la fonction cmdeActualiserBcs...lpb654	2024-01-26 10:45:31.904232+00
71	passage ds la fonction checkok...lpb654	2024-01-26 10:45:32.617581+00
72	passage ds la fonction reprise...lpb654	2024-01-26 10:45:33.121749+00
73	passage ds la fonction cmdeActualiserBcs...lpb654	2024-01-26 10:45:41.724573+00
74	passage ds la fonction checkok...lpb654	2024-01-26 10:45:42.434067+00
75	passage ds la fonction reprise...lpb654	2024-01-26 10:45:42.88779+00
76	passage ds la fonction reprise...lpb654	2024-01-26 10:45:50.452843+00
77	passage ds la fonction ouvrir...lpb654 bc_num : 000635 	2024-01-26 10:45:55.905025+00
78	passage ds la fonction checkok...lpb654	2024-01-26 10:45:56.655169+00
79	passage ds la fonction reprise...lpb654	2024-01-26 10:45:59.807479+00
80	passage ds la fonction reprise...lpb654	2024-01-26 10:47:02.83372+00
81	passage ds la fonction userapplogout (lpb654)	2024-01-26 10:47:09.65582+00
82	passage ds la fonction checkifUserHasCommandLine...lpb654	2024-02-01 09:10:37.446826+00
83	passage ds la fonction reprise...lpb654	2024-02-01 09:10:37.610983+00
84	passage ds la fonction ouvrir...lpb654 bc_num : 000635 	2024-02-01 09:12:14.693368+00
85	passage ds la fonction checkok...lpb654	2024-02-01 09:12:15.285185+00
86	passage ds la fonction reprise...lpb654	2024-02-01 09:12:16.336642+00
87	passage ds la fonction sendok...lpb654	2024-02-01 09:12:17.283273+00
88	passage ds la fonction PiecesToPatch...	2024-02-01 09:12:33.173948+00
89	passage ds la fonction PiecesToPatch...	2024-02-01 09:12:33.277641+00
90	passage ds la fonction PiecesToPatch...	2024-02-01 09:12:33.346497+00
91	passage ds la fonction sendok...lpb654	2024-02-01 09:12:35.420703+00
92	passage ds la fonction PiecesToPatch...	2024-02-01 09:12:44.260686+00
93	passage ds la fonction PiecesToPatch...	2024-02-01 09:12:44.338029+00
94	passage ds la fonction PiecesToPatch...	2024-02-01 09:12:44.412824+00
95	passage ds la fonction valider...lpb654 bc_num : 000635	2024-02-01 09:12:44.556654+00
96	passage ds la fonction checkok...lpb654	2024-02-01 09:12:45.123418+00
97	passage ds la fonction checkok...lpb654	2024-02-01 09:12:45.687357+00
98	passage ds la fonction checkok...lpb654	2024-02-01 09:12:46.247074+00
99	passage ds la fonction reprise...lpb654	2024-02-01 09:12:46.358798+00
100	passage ds la fonction sendok...lpb654	2024-02-01 09:12:46.388786+00
101	passage ds la fonction reprise...lpb654	2024-02-01 09:23:23.286935+00
102	passage ds la fonction ouvrir...lpb654 bc_num : 000635 	2024-02-01 09:23:29.73788+00
103	passage ds la fonction checkok...lpb654	2024-02-01 09:23:30.33189+00
104	passage ds la fonction reprise...lpb654	2024-02-01 09:23:31.226657+00
105	passage ds la fonction sendok...lpb654	2024-02-01 09:23:31.688331+00
106	passage ds la fonction PiecesToPatch...	2024-02-01 09:23:40.796467+00
107	passage ds la fonction PiecesToPatch...	2024-02-01 09:23:52.108238+00
108	passage ds la fonction valider...lpb654 bc_num : 000635	2024-02-01 09:23:52.301412+00
109	passage ds la fonction checkok...lpb654	2024-02-01 09:23:52.863088+00
110	passage ds la fonction checkok...lpb654	2024-02-01 09:23:53.416798+00
111	passage ds la fonction reprise...lpb654	2024-02-01 09:23:53.526479+00
112	passage ds la fonction sendok...lpb654	2024-02-01 09:23:54.545181+00
113	passage ds la fonction ouvrir...lpb654 bc_num : 000635 	2024-02-01 12:09:53.58242+00
114	passage ds la fonction checkok...lpb654	2024-02-01 12:09:54.169535+00
115	passage ds la fonction reprise...lpb654	2024-02-01 12:09:55.127859+00
116	passage ds la fonction sendok...lpb654	2024-02-01 12:09:55.989441+00
117	passage ds la fonction userapplogout (lpb654)	2024-02-07 14:44:05.60324+00
118	passage ds la fonction checkifUserHasCommandLine...lpb654	2024-02-07 14:44:05.932866+00
119	passage ds la fonction reprise...lpb654	2024-02-07 14:44:06.102342+00
120	passage ds la fonction ouvrir...lpb654 bc_num : 000635 	2024-02-07 14:44:10.961159+00
121	passage ds la fonction checkok...lpb654	2024-02-07 14:44:11.550358+00
122	passage ds la fonction checkok...lpb654	2024-02-07 14:44:12.102166+00
123	passage ds la fonction checkok...lpb654	2024-02-07 14:44:12.667027+00
124	passage ds la fonction checkok...lpb654	2024-02-07 14:44:13.226195+00
125	passage ds la fonction checkok...lpb654	2024-02-07 14:44:13.777007+00
126	passage ds la fonction checkok...lpb654	2024-02-07 14:44:14.334987+00
127	passage ds la fonction checkok...lpb654	2024-02-07 14:44:14.890814+00
128	passage ds la fonction checkok...lpb654	2024-02-07 14:44:15.476224+00
129	passage ds la fonction checkok...lpb654	2024-02-07 14:44:16.043387+00
130	passage ds la fonction reprise...lpb654	2024-02-07 14:44:16.402915+00
131	passage ds la fonction userapplogout (lpb654)	2024-02-07 14:44:33.055123+00
132	passage ds la fonction checkifUserHasCommandLine...lpb654	2024-02-07 14:44:33.388493+00
133	passage ds la fonction reprise...lpb654	2024-02-07 14:44:33.499073+00
134	passage ds la fonction userapplogout (lpb654)	2024-02-08 16:38:58.220049+00
135	passage ds la fonction checkifUserHasCommandLine...lpb654	2024-02-08 16:38:58.739349+00
136	passage ds la fonction reprise...lpb654	2024-02-08 16:38:58.910784+00
137	passage ds la fonction reprise...lpb654	2024-02-09 07:58:57.169211+00
138	passage ds la fonction reprise...lpb654	2024-02-09 07:59:00.286472+00
139	passage ds la fonction userapplogout (lpb654)	2024-02-09 14:41:57.517495+00
140	passage ds la fonction checkifUserHasCommandLine...lpb654	2024-02-09 14:41:57.8258+00
141	passage ds la fonction reprise...lpb654	2024-02-09 14:41:57.910085+00
142	passage ds la fonction userapplogout (lpb654)	2024-02-09 14:42:34.234303+00
143	passage ds la fonction checkifUserHasCommandLine...lpb654	2024-02-09 14:42:34.524001+00
144	passage ds la fonction reprise...lpb654	2024-02-09 14:42:34.590958+00
145	passage ds la fonction userapplogout (lpb654)	2024-02-09 14:47:18.225597+00
146	passage ds la fonction checkifUserHasCommandLine...lpb654	2024-02-09 14:47:18.514257+00
147	passage ds la fonction reprise...lpb654	2024-02-09 14:47:18.595911+00
148	passage ds la fonction ouvrir...lpb654 bc_num : 000635 	2024-02-09 14:47:39.857296+00
149	passage ds la fonction checkok...lpb654	2024-02-09 14:47:40.414252+00
150	passage ds la fonction checkok...lpb654	2024-02-09 14:47:40.964575+00
151	passage ds la fonction reprise...lpb654	2024-02-09 14:47:41.447571+00
152	passage ds la fonction reprise...lpb654	2024-02-09 14:47:54.4783+00
153	passage ds la fonction cmdeActualiserBcs...lpb654	2024-02-09 14:47:56.29378+00
154	passage ds la fonction checkok...lpb654	2024-02-09 14:47:56.830518+00
155	passage ds la fonction reprise...lpb654	2024-02-09 14:47:56.897946+00
156	passage ds la fonction cmdeActualiserBcs...lpb654	2024-02-09 14:58:17.603906+00
157	passage ds la fonction checkok...lpb654	2024-02-09 14:58:18.149377+00
158	passage ds la fonction checkok...lpb654	2024-02-09 14:58:18.684818+00
159	passage ds la fonction reprise...lpb654	2024-02-09 14:58:18.768308+00
160	passage ds la fonction checkifUserHasCommandLine...Marlène	2024-02-19 13:29:29.103287+00
161	création nouvelle ligne de commande pour un utilisateur : passage ds la fonction checkifUserHasCommandLineMarlène error : Command matching query does not exist.	2024-02-19 13:29:29.113251+00
162	passage ds la fonction reprise...Marlène	2024-02-19 13:29:29.528264+00
163	passage ds la fonction reprise...Marlène	2024-02-19 13:29:29.632171+00
164	passage ds la fonction cmdeActualiserBcs...Marlène	2024-02-19 13:29:43.01754+00
165	passage ds la fonction checkok...Marlène	2024-02-19 13:29:43.74676+00
166	passage ds la fonction reprise...Marlène	2024-02-19 13:29:44.066527+00
167	passage ds la fonction ouvrir...Marlène bc_num : 000635 	2024-02-19 13:30:44.682921+00
168	passage ds la fonction checkok...Marlène	2024-02-19 13:30:45.344597+00
169	passage ds la fonction reprise...Marlène	2024-02-19 13:30:47.972907+00
170	passage ds la fonction reprise...Marlène	2024-02-19 13:30:57.632464+00
171	passage ds la fonction userapplogout (Marlène)	2024-02-19 13:31:11.708433+00
172	passage ds la fonction checkifUserHasCommandLine...Marlène	2024-02-19 13:31:12.05216+00
173	passage ds la fonction reprise...Marlène	2024-02-19 13:31:12.354784+00
174	passage ds la fonction userapplogout (Marlène)	2024-02-19 13:31:16.177105+00
175	passage ds la fonction userapplogout (lpb654)	2024-03-11 10:05:08.13081+00
176	passage ds la fonction checkifUserHasCommandLine...lpb654	2024-03-11 10:05:08.612576+00
177	passage ds la fonction reprise...lpb654	2024-03-11 10:05:08.77034+00
178	passage ds la fonction ouvrir...lpb654 bc_num : 000635 	2024-03-11 10:05:25.450212+00
179	passage ds la fonction checkok...lpb654	2024-03-11 10:05:26.027704+00
180	passage ds la fonction checkok...lpb654	2024-03-11 10:05:26.584585+00
181	passage ds la fonction reprise...lpb654	2024-03-11 10:05:26.852546+00
182	passage ds la fonction checkifUserHasCommandLine...Marlène	2024-04-17 09:07:05.278084+00
183	passage ds la fonction reprise...Marlène	2024-04-17 09:07:05.367177+00
184	passage ds la fonction cmdeActualiserBcs...Marlène	2024-04-17 09:07:10.080525+00
185	passage ds la fonction checkok...Marlène	2024-04-17 09:07:10.627543+00
186	passage ds la fonction checkok...Marlène	2024-04-17 09:07:11.283372+00
187	passage ds la fonction checkok...Marlène	2024-04-17 09:07:11.847678+00
188	passage ds la fonction checkok...Marlène	2024-04-17 09:07:12.390225+00
189	passage ds la fonction checkok...Marlène	2024-04-17 09:07:12.933921+00
190	passage ds la fonction checkok...Marlène	2024-04-17 09:07:13.483326+00
191	passage ds la fonction checkok...Marlène	2024-04-17 09:07:14.026488+00
192	passage ds la fonction checkok...Marlène	2024-04-17 09:07:14.571712+00
193	passage ds la fonction checkok...Marlène	2024-04-17 09:07:15.117856+00
194	passage ds la fonction checkok...Marlène	2024-04-17 09:07:15.664355+00
195	passage ds la fonction checkok...Marlène	2024-04-17 09:07:16.322297+00
196	passage ds la fonction checkok...Marlène	2024-04-17 09:07:17.323965+00
197	passage ds la fonction checkok...Marlène	2024-04-17 09:07:17.867773+00
198	passage ds la fonction checkok...Marlène	2024-04-17 09:07:18.408987+00
199	passage ds la fonction checkok...Marlène	2024-04-17 09:07:18.951598+00
200	passage ds la fonction checkok...Marlène	2024-04-17 09:07:19.487129+00
201	passage ds la fonction checkok...Marlène	2024-04-17 09:07:20.026354+00
202	passage ds la fonction checkok...Marlène	2024-04-17 09:07:20.563909+00
203	passage ds la fonction checkok...Marlène	2024-04-17 09:07:21.104747+00
204	passage ds la fonction checkok...Marlène	2024-04-17 09:07:21.656947+00
205	passage ds la fonction reprise...Marlène	2024-04-17 09:07:24.218394+00
206	passage ds la fonction cmdeActualiserBcs...Marlène	2024-04-17 09:07:25.709554+00
207	passage ds la fonction checkok...Marlène	2024-04-17 09:07:26.250902+00
208	passage ds la fonction checkok...Marlène	2024-04-17 09:07:26.796596+00
209	passage ds la fonction checkok...Marlène	2024-04-17 09:07:27.34427+00
210	passage ds la fonction checkok...Marlène	2024-04-17 09:07:27.879732+00
211	passage ds la fonction checkok...Marlène	2024-04-17 09:07:28.430537+00
212	passage ds la fonction checkok...Marlène	2024-04-17 09:07:28.980916+00
213	passage ds la fonction checkok...Marlène	2024-04-17 09:07:29.528726+00
214	passage ds la fonction checkok...Marlène	2024-04-17 09:07:30.075629+00
215	passage ds la fonction checkok...Marlène	2024-04-17 09:07:30.623629+00
216	passage ds la fonction checkok...Marlène	2024-04-17 09:07:31.170802+00
217	passage ds la fonction checkok...Marlène	2024-04-17 09:07:31.720889+00
218	passage ds la fonction checkok...Marlène	2024-04-17 09:07:32.264549+00
219	passage ds la fonction checkok...Marlène	2024-04-17 09:07:32.817102+00
220	passage ds la fonction checkok...Marlène	2024-04-17 09:07:33.362843+00
221	passage ds la fonction checkok...Marlène	2024-04-17 09:07:33.91606+00
222	passage ds la fonction checkok...Marlène	2024-04-17 09:07:34.459422+00
223	passage ds la fonction checkok...Marlène	2024-04-17 09:07:35.010274+00
224	passage ds la fonction checkok...Marlène	2024-04-17 09:07:35.558242+00
225	passage ds la fonction checkok...Marlène	2024-04-17 09:07:36.096498+00
226	passage ds la fonction checkok...Marlène	2024-04-17 09:07:36.648142+00
227	passage ds la fonction userapplogout (lpb654)	2024-04-17 14:11:28.684733+00
228	passage ds la fonction checkifUserHasCommandLine...lpb654	2024-04-17 14:11:29.157117+00
229	passage ds la fonction reprise...lpb654	2024-04-17 14:11:29.514336+00
230	passage ds la fonction ouvrir...lpb654 bc_num : 000635 	2024-04-17 14:11:36.222294+00
231	passage ds la fonction checkok...lpb654	2024-04-17 14:11:36.89976+00
232	passage ds la fonction checkok...lpb654	2024-04-17 14:11:37.520471+00
233	passage ds la fonction checkok...lpb654	2024-04-17 14:11:38.135052+00
234	passage ds la fonction checkok...lpb654	2024-04-17 14:11:38.74207+00
235	passage ds la fonction checkok...lpb654	2024-04-17 14:11:39.353266+00
236	passage ds la fonction checkok...lpb654	2024-04-17 14:11:39.977203+00
237	passage ds la fonction checkok...lpb654	2024-04-17 14:11:40.599674+00
238	passage ds la fonction checkok...lpb654	2024-04-17 14:11:41.211305+00
239	passage ds la fonction checkok...lpb654	2024-04-17 14:11:41.817638+00
240	passage ds la fonction checkok...lpb654	2024-04-17 14:11:42.438505+00
241	passage ds la fonction checkok...lpb654	2024-04-17 14:11:43.036844+00
242	passage ds la fonction checkok...lpb654	2024-04-17 14:11:43.651987+00
243	passage ds la fonction checkok...lpb654	2024-04-17 14:11:44.252011+00
244	passage ds la fonction checkok...lpb654	2024-04-17 14:11:44.856797+00
245	passage ds la fonction checkok...lpb654	2024-04-17 14:11:45.477768+00
246	passage ds la fonction checkok...lpb654	2024-04-17 14:11:46.096752+00
247	passage ds la fonction checkok...lpb654	2024-04-17 14:11:46.711921+00
248	passage ds la fonction checkok...lpb654	2024-04-17 14:11:47.346359+00
249	passage ds la fonction checkok...lpb654	2024-04-17 14:11:47.972745+00
250	passage ds la fonction checkok...lpb654	2024-04-17 14:11:48.59309+00
251	passage ds la fonction userapplogout (lpb654)	2024-04-17 14:14:22.165827+00
252	passage ds la fonction checkifUserHasCommandLine...lpb654	2024-04-17 14:14:22.518142+00
253	passage ds la fonction reprise...lpb654	2024-04-17 14:14:22.74908+00
254	passage ds la fonction ouvrir...lpb654 bc_num : 000648 	2024-04-17 14:14:31.72057+00
255	passage ds la fonction checkok...lpb654	2024-04-17 14:14:32.3335+00
256	passage ds la fonction reprise...lpb654	2024-04-17 14:14:32.80373+00
257	passage ds la fonction reprise...lpb654	2024-04-17 19:19:05.275954+00
258	passage ds la fonction reprise...Marlène	2024-04-18 05:56:07.855043+00
259	passage ds la fonction reprise...lpb654	2024-04-18 07:12:27.897591+00
260	passage ds la fonction ouvrir...lpb654 bc_num : 000649 	2024-04-18 07:12:33.637171+00
261	passage ds la fonction checkok...lpb654	2024-04-18 07:12:34.242589+00
262	passage ds la fonction reprise...lpb654	2024-04-18 07:12:34.537227+00
263	passage ds la fonction reprise...lpb654	2024-04-18 07:12:51.484329+00
264	passage ds la fonction reprise...lpb654	2024-04-18 09:29:37.570767+00
265	passage ds la fonction cmdeActualiserBcs...Marlène	2024-04-18 14:22:19.098047+00
266	passage ds la fonction checkok...Marlène	2024-04-18 14:22:19.641892+00
267	passage ds la fonction checkok...Marlène	2024-04-18 14:22:20.185285+00
268	passage ds la fonction reprise...Marlène	2024-04-18 14:22:20.275655+00
269	passage ds la fonction userapplogout (Marlène)	2024-04-18 14:25:46.704504+00
270	passage ds la fonction checkifUserHasCommandLine...Marlène	2024-04-18 14:25:47.200332+00
271	passage ds la fonction reprise...Marlène	2024-04-18 14:25:47.578104+00
272	passage ds la fonction reprise...Marlène	2024-04-18 14:26:12.460952+00
273	passage ds la fonction userapplogout (Marlène)	2024-04-18 14:26:20.217906+00
274	passage ds la fonction checkifUserHasCommandLine...Marlène	2024-04-18 14:28:36.760279+00
275	passage ds la fonction reprise...Marlène	2024-04-18 14:28:37.044778+00
276	passage ds la fonction userapplogout (Marlène)	2024-04-18 14:28:51.716001+00
277	passage ds la fonction checkifUserHasCommandLine...Marlène	2024-04-18 14:29:10.209568+00
278	passage ds la fonction reprise...Marlène	2024-04-18 14:29:10.496941+00
279	passage ds la fonction userapplogout (Marlène)	2024-04-18 14:29:14.889417+00
280	passage ds la fonction checkifUserHasCommandLine...Marlène	2024-04-18 14:29:17.837702+00
281	passage ds la fonction reprise...Marlène	2024-04-18 14:29:18.10252+00
282	passage ds la fonction cmdeActualiserBcs...Marlène	2024-04-18 14:29:26.198225+00
283	passage ds la fonction checkok...Marlène	2024-04-18 14:29:26.902485+00
284	passage ds la fonction reprise...Marlène	2024-04-18 14:29:27.16027+00
\.


--
-- Data for Name: bcweb_produit; Type: TABLE DATA; Schema: public; Owner: tarzan
--

COPY public.bcweb_produit (id, pdt_code, pdt_num_serie, pdt_libel, pdt_qte, pdt_unit, pdt_prop_charge, pdt_charge, pdt_observ_bc, pdt_consigne, pdt_date_bt, pdt_date_web, pdt_webuser, pdt_observ_web, pdt_num_bl_id) FROM stdin;
\.


--
-- Data for Name: bcweb_qrpiece; Type: TABLE DATA; Schema: public; Owner: tarzan
--

COPY public.bcweb_qrpiece (qrp_num, qrp_ref_client, qrp_etat, qrp_nom_etude, qrp_ref_etude, qrp_type_pdt, qrp_qte, qrp_unit, qrp_poids, qrp_prop_charge, qrp_charge, qrp_observ_pce, qrp_num_bl, qrp_nom_client, qrp_nom_affaire, qrp_num_affaire, qrp_etat_affaire, qrp_etat_prod, qrp_cahier_plan, qrp_dessinateur, qrp_etude_par, qrp_redige_par, qrp_atelier, qrp_date_fabr_prevue, qrp_date_livr_prevue, qrp_date_charge, qrp_date_livraison, qrp_etat_bl, qrp_num_phase, qrp_date_phase, qrp_prix_unit, qrp_num_nc, qrp_num_facture, qrp_etat_facture, qrp_date_facture, qrp_surface, qrp_volume, qrp_longueur, qrp_largeur, qrp_hauteur, qrp_beton) FROM stdin;
\.


--
-- Data for Name: bcweb_qrpiece_article; Type: TABLE DATA; Schema: public; Owner: tarzan
--

COPY public.bcweb_qrpiece_article (id, qrpa_unit, qrpa_libel, qrpa_qte, qrpa_observ, qrpa_origine, qrpa_prix_unit, qrpa_qrp_num_id) FROM stdin;
\.


--
-- Data for Name: btapps_application; Type: TABLE DATA; Schema: public; Owner: tarzan
--

COPY public.btapps_application (name, nb_conn_max, version) FROM stdin;
bcweb	3	1-260124
\.


--
-- Data for Name: btapps_code; Type: TABLE DATA; Schema: public; Owner: tarzan
--

COPY public.btapps_code (code, description) FROM stdin;
\.


--
-- Data for Name: btapps_droit; Type: TABLE DATA; Schema: public; Owner: tarzan
--

COPY public.btapps_droit (id, utilisateur, client, application_id) FROM stdin;
1	lpb654	MKS	bcweb
2	Marlène	LPB	bcweb
3	monkey	MKS	bcweb
\.


--
-- Data for Name: btapps_session; Type: TABLE DATA; Schema: public; Owner: tarzan
--

COPY public.btapps_session (id, utilisateur, token, fingerprint, sessionid, application_id) FROM stdin;
16	lpb654	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzE0MjI3MjYyLCJpYXQiOjE3MTMzNjMyNjIsImp0aSI6IjVlYzg3MzdkYzUzZTQ4NzM5N2Q3YzY0ZjkxMzJjZWRhIiwidXNlcl9pZCI6Mn0.Ii9RAHBxrxLQ3JZIplJFzVA6RXxBMh2Mele9qg5bC1M	1369212997	\N	bcweb
20	Marlène	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzE0MzE0NTU3LCJpYXQiOjE3MTM0NTA1NTcsImp0aSI6ImZkZTBmZjRhMGE1MTQ0YzI5Mzg4MWEzODI5MjM4M2JkIiwidXNlcl9pZCI6NH0.Hmn_5TSaBlYeeXR46q2PJwvMsBIOReiXO60vcRY9giE	1338141743	\N	bcweb
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: tarzan
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: tarzan
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	bcweb	bordereau
7	bcweb	machine
8	bcweb	param
9	bcweb	printdebug
10	bcweb	qrpiece
11	bcweb	qrpiece_article
12	bcweb	produit
13	bcweb	piece
14	bcweb	command
15	btapps	application
16	btapps	code
17	btapps	session
18	btapps	droit
19	accounts	customuser
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: tarzan
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2024-01-26 09:47:37.933886+00
2	contenttypes	0002_remove_content_type_name	2024-01-26 09:47:37.93944+00
3	auth	0001_initial	2024-01-26 09:47:37.982393+00
4	auth	0002_alter_permission_name_max_length	2024-01-26 09:47:37.988729+00
5	auth	0003_alter_user_email_max_length	2024-01-26 09:47:37.993626+00
6	auth	0004_alter_user_username_opts	2024-01-26 09:47:37.998438+00
7	auth	0005_alter_user_last_login_null	2024-01-26 09:47:38.003073+00
8	auth	0006_require_contenttypes_0002	2024-01-26 09:47:38.00489+00
9	auth	0007_alter_validators_add_error_messages	2024-01-26 09:47:38.009896+00
10	auth	0008_alter_user_username_max_length	2024-01-26 09:47:38.014559+00
11	auth	0009_alter_user_last_name_max_length	2024-01-26 09:47:38.019231+00
12	auth	0010_alter_group_name_max_length	2024-01-26 09:47:38.024357+00
13	auth	0011_update_proxy_permissions	2024-01-26 09:47:38.029577+00
14	auth	0012_alter_user_first_name_max_length	2024-01-26 09:47:38.03434+00
15	accounts	0001_initial	2024-01-26 09:47:38.077901+00
16	admin	0001_initial	2024-01-26 09:47:38.102689+00
17	admin	0002_logentry_remove_auto_add	2024-01-26 09:47:38.110071+00
18	admin	0003_logentry_add_action_flag_choices	2024-01-26 09:47:38.116834+00
19	btapps	0001_initial	2024-01-26 09:47:38.161718+00
20	bcweb	0001_initial	2024-01-26 09:47:38.262424+00
21	sessions	0001_initial	2024-01-26 09:47:38.275615+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: tarzan
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Name: accounts_customuser_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tarzan
--

SELECT pg_catalog.setval('public.accounts_customuser_groups_id_seq', 1, false);


--
-- Name: accounts_customuser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tarzan
--

SELECT pg_catalog.setval('public.accounts_customuser_id_seq', 4, true);


--
-- Name: accounts_customuser_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tarzan
--

SELECT pg_catalog.setval('public.accounts_customuser_user_permissions_id_seq', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tarzan
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tarzan
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tarzan
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 76, true);


--
-- Name: bcweb_command_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tarzan
--

SELECT pg_catalog.setval('public.bcweb_command_id_seq', 3, true);


--
-- Name: bcweb_param_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tarzan
--

SELECT pg_catalog.setval('public.bcweb_param_id_seq', 1, false);


--
-- Name: bcweb_piece_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tarzan
--

SELECT pg_catalog.setval('public.bcweb_piece_id_seq', 8267, true);


--
-- Name: bcweb_piece_id_seq1; Type: SEQUENCE SET; Schema: public; Owner: tarzan
--

SELECT pg_catalog.setval('public.bcweb_piece_id_seq1', 340, true);


--
-- Name: bcweb_printdebug_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tarzan
--

SELECT pg_catalog.setval('public.bcweb_printdebug_id_seq', 284, true);


--
-- Name: bcweb_produit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tarzan
--

SELECT pg_catalog.setval('public.bcweb_produit_id_seq', 560, true);


--
-- Name: bcweb_produit_id_seq1; Type: SEQUENCE SET; Schema: public; Owner: tarzan
--

SELECT pg_catalog.setval('public.bcweb_produit_id_seq1', 1, false);


--
-- Name: bcweb_qrpiece_article_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tarzan
--

SELECT pg_catalog.setval('public.bcweb_qrpiece_article_id_seq', 1, false);


--
-- Name: btapps_droit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tarzan
--

SELECT pg_catalog.setval('public.btapps_droit_id_seq', 1, false);


--
-- Name: btapps_session_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tarzan
--

SELECT pg_catalog.setval('public.btapps_session_id_seq', 20, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tarzan
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tarzan
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 19, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tarzan
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 21, true);


--
-- Name: accounts_customuser_groups accounts_customuser_groups_customuser_id_group_id_c074bdcb_uniq; Type: CONSTRAINT; Schema: public; Owner: tarzan
--

ALTER TABLE ONLY public.accounts_customuser_groups
    ADD CONSTRAINT accounts_customuser_groups_customuser_id_group_id_c074bdcb_uniq UNIQUE (customuser_id, group_id);


--
-- Name: accounts_customuser_groups accounts_customuser_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: tarzan
--

ALTER TABLE ONLY public.accounts_customuser_groups
    ADD CONSTRAINT accounts_customuser_groups_pkey PRIMARY KEY (id);


--
-- Name: accounts_customuser accounts_customuser_pkey; Type: CONSTRAINT; Schema: public; Owner: tarzan
--

ALTER TABLE ONLY public.accounts_customuser
    ADD CONSTRAINT accounts_customuser_pkey PRIMARY KEY (id);


--
-- Name: accounts_customuser_user_permissions accounts_customuser_user_customuser_id_permission_9632a709_uniq; Type: CONSTRAINT; Schema: public; Owner: tarzan
--

ALTER TABLE ONLY public.accounts_customuser_user_permissions
    ADD CONSTRAINT accounts_customuser_user_customuser_id_permission_9632a709_uniq UNIQUE (customuser_id, permission_id);


--
-- Name: accounts_customuser_user_permissions accounts_customuser_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: tarzan
--

ALTER TABLE ONLY public.accounts_customuser_user_permissions
    ADD CONSTRAINT accounts_customuser_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: accounts_customuser accounts_customuser_username_key; Type: CONSTRAINT; Schema: public; Owner: tarzan
--

ALTER TABLE ONLY public.accounts_customuser
    ADD CONSTRAINT accounts_customuser_username_key UNIQUE (username);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: tarzan
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: tarzan
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: tarzan
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: tarzan
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: tarzan
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: tarzan
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: bcweb_bordereau bcweb_bordereau_pkey; Type: CONSTRAINT; Schema: public; Owner: tarzan
--

ALTER TABLE ONLY public.bcweb_bordereau
    ADD CONSTRAINT bcweb_bordereau_pkey PRIMARY KEY (bc_num);


--
-- Name: bcweb_command bcweb_command_iduser_application_id_id_4b1f1e9c_uniq; Type: CONSTRAINT; Schema: public; Owner: tarzan
--

ALTER TABLE ONLY public.bcweb_command
    ADD CONSTRAINT bcweb_command_iduser_application_id_id_4b1f1e9c_uniq UNIQUE (iduser, application_id_id);


--
-- Name: bcweb_command bcweb_command_pkey; Type: CONSTRAINT; Schema: public; Owner: tarzan
--

ALTER TABLE ONLY public.bcweb_command
    ADD CONSTRAINT bcweb_command_pkey PRIMARY KEY (id);


--
-- Name: bcweb_machine bcweb_machine_pkey; Type: CONSTRAINT; Schema: public; Owner: tarzan
--

ALTER TABLE ONLY public.bcweb_machine
    ADD CONSTRAINT bcweb_machine_pkey PRIMARY KEY (device_id);


--
-- Name: bcweb_param bcweb_param_pkey; Type: CONSTRAINT; Schema: public; Owner: tarzan
--

ALTER TABLE ONLY public.bcweb_param
    ADD CONSTRAINT bcweb_param_pkey PRIMARY KEY (id);


--
-- Name: bcweb_piece bcweb_piece_pkey; Type: CONSTRAINT; Schema: public; Owner: tarzan
--

ALTER TABLE ONLY public.bcweb_piece
    ADD CONSTRAINT bcweb_piece_pkey PRIMARY KEY (id);


--
-- Name: bcweb_printdebug bcweb_printdebug_pkey; Type: CONSTRAINT; Schema: public; Owner: tarzan
--

ALTER TABLE ONLY public.bcweb_printdebug
    ADD CONSTRAINT bcweb_printdebug_pkey PRIMARY KEY (id);


--
-- Name: bcweb_produit bcweb_produit_pkey; Type: CONSTRAINT; Schema: public; Owner: tarzan
--

ALTER TABLE ONLY public.bcweb_produit
    ADD CONSTRAINT bcweb_produit_pkey PRIMARY KEY (id);


--
-- Name: bcweb_qrpiece_article bcweb_qrpiece_article_pkey; Type: CONSTRAINT; Schema: public; Owner: tarzan
--

ALTER TABLE ONLY public.bcweb_qrpiece_article
    ADD CONSTRAINT bcweb_qrpiece_article_pkey PRIMARY KEY (id);


--
-- Name: bcweb_qrpiece bcweb_qrpiece_pkey; Type: CONSTRAINT; Schema: public; Owner: tarzan
--

ALTER TABLE ONLY public.bcweb_qrpiece
    ADD CONSTRAINT bcweb_qrpiece_pkey PRIMARY KEY (qrp_num);


--
-- Name: btapps_application btapps_application_pkey; Type: CONSTRAINT; Schema: public; Owner: tarzan
--

ALTER TABLE ONLY public.btapps_application
    ADD CONSTRAINT btapps_application_pkey PRIMARY KEY (name);


--
-- Name: btapps_code btapps_code_pkey; Type: CONSTRAINT; Schema: public; Owner: tarzan
--

ALTER TABLE ONLY public.btapps_code
    ADD CONSTRAINT btapps_code_pkey PRIMARY KEY (code);


--
-- Name: btapps_droit btapps_droit_application_id_utilisateur_3b14cc5c_uniq; Type: CONSTRAINT; Schema: public; Owner: tarzan
--

ALTER TABLE ONLY public.btapps_droit
    ADD CONSTRAINT btapps_droit_application_id_utilisateur_3b14cc5c_uniq UNIQUE (application_id, utilisateur);


--
-- Name: btapps_droit btapps_droit_pkey; Type: CONSTRAINT; Schema: public; Owner: tarzan
--

ALTER TABLE ONLY public.btapps_droit
    ADD CONSTRAINT btapps_droit_pkey PRIMARY KEY (id);


--
-- Name: btapps_session btapps_session_application_id_utilisate_7c96f74e_uniq; Type: CONSTRAINT; Schema: public; Owner: tarzan
--

ALTER TABLE ONLY public.btapps_session
    ADD CONSTRAINT btapps_session_application_id_utilisate_7c96f74e_uniq UNIQUE (application_id, utilisateur, token, fingerprint);


--
-- Name: btapps_session btapps_session_pkey; Type: CONSTRAINT; Schema: public; Owner: tarzan
--

ALTER TABLE ONLY public.btapps_session
    ADD CONSTRAINT btapps_session_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: tarzan
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: tarzan
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: tarzan
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: tarzan
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: tarzan
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: accounts_customuser_groups_customuser_id_bc55088e; Type: INDEX; Schema: public; Owner: tarzan
--

CREATE INDEX accounts_customuser_groups_customuser_id_bc55088e ON public.accounts_customuser_groups USING btree (customuser_id);


--
-- Name: accounts_customuser_groups_group_id_86ba5f9e; Type: INDEX; Schema: public; Owner: tarzan
--

CREATE INDEX accounts_customuser_groups_group_id_86ba5f9e ON public.accounts_customuser_groups USING btree (group_id);


--
-- Name: accounts_customuser_user_permissions_customuser_id_0deaefae; Type: INDEX; Schema: public; Owner: tarzan
--

CREATE INDEX accounts_customuser_user_permissions_customuser_id_0deaefae ON public.accounts_customuser_user_permissions USING btree (customuser_id);


--
-- Name: accounts_customuser_user_permissions_permission_id_aea3d0e5; Type: INDEX; Schema: public; Owner: tarzan
--

CREATE INDEX accounts_customuser_user_permissions_permission_id_aea3d0e5 ON public.accounts_customuser_user_permissions USING btree (permission_id);


--
-- Name: accounts_customuser_username_722f3555_like; Type: INDEX; Schema: public; Owner: tarzan
--

CREATE INDEX accounts_customuser_username_722f3555_like ON public.accounts_customuser USING btree (username varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: tarzan
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: tarzan
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: tarzan
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: tarzan
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: bcweb_bordereau_bc_num_a7939a28_like; Type: INDEX; Schema: public; Owner: tarzan
--

CREATE INDEX bcweb_bordereau_bc_num_a7939a28_like ON public.bcweb_bordereau USING btree (bc_num varchar_pattern_ops);


--
-- Name: bcweb_command_application_id_id_51f82730; Type: INDEX; Schema: public; Owner: tarzan
--

CREATE INDEX bcweb_command_application_id_id_51f82730 ON public.bcweb_command USING btree (application_id_id);


--
-- Name: bcweb_command_application_id_id_51f82730_like; Type: INDEX; Schema: public; Owner: tarzan
--

CREATE INDEX bcweb_command_application_id_id_51f82730_like ON public.bcweb_command USING btree (application_id_id varchar_pattern_ops);


--
-- Name: bcweb_machine_device_id_1cc29f8c_like; Type: INDEX; Schema: public; Owner: tarzan
--

CREATE INDEX bcweb_machine_device_id_1cc29f8c_like ON public.bcweb_machine USING btree (device_id varchar_pattern_ops);


--
-- Name: bcweb_piece_pce_num_bl_id_0359a9df; Type: INDEX; Schema: public; Owner: tarzan
--

CREATE INDEX bcweb_piece_pce_num_bl_id_0359a9df ON public.bcweb_piece USING btree (pce_num_bl_id);


--
-- Name: bcweb_piece_pce_num_bl_id_0359a9df_like; Type: INDEX; Schema: public; Owner: tarzan
--

CREATE INDEX bcweb_piece_pce_num_bl_id_0359a9df_like ON public.bcweb_piece USING btree (pce_num_bl_id varchar_pattern_ops);


--
-- Name: bcweb_produit_pdt_num_bl_id_921e3ace; Type: INDEX; Schema: public; Owner: tarzan
--

CREATE INDEX bcweb_produit_pdt_num_bl_id_921e3ace ON public.bcweb_produit USING btree (pdt_num_bl_id);


--
-- Name: bcweb_produit_pdt_num_bl_id_921e3ace_like; Type: INDEX; Schema: public; Owner: tarzan
--

CREATE INDEX bcweb_produit_pdt_num_bl_id_921e3ace_like ON public.bcweb_produit USING btree (pdt_num_bl_id varchar_pattern_ops);


--
-- Name: bcweb_qrpiece_article_qrpa_qrp_num_id_68ea750d; Type: INDEX; Schema: public; Owner: tarzan
--

CREATE INDEX bcweb_qrpiece_article_qrpa_qrp_num_id_68ea750d ON public.bcweb_qrpiece_article USING btree (qrpa_qrp_num_id);


--
-- Name: bcweb_qrpiece_article_qrpa_qrp_num_id_68ea750d_like; Type: INDEX; Schema: public; Owner: tarzan
--

CREATE INDEX bcweb_qrpiece_article_qrpa_qrp_num_id_68ea750d_like ON public.bcweb_qrpiece_article USING btree (qrpa_qrp_num_id varchar_pattern_ops);


--
-- Name: bcweb_qrpiece_qrp_num_efcdaead_like; Type: INDEX; Schema: public; Owner: tarzan
--

CREATE INDEX bcweb_qrpiece_qrp_num_efcdaead_like ON public.bcweb_qrpiece USING btree (qrp_num varchar_pattern_ops);


--
-- Name: btapps_application_name_3939f719_like; Type: INDEX; Schema: public; Owner: tarzan
--

CREATE INDEX btapps_application_name_3939f719_like ON public.btapps_application USING btree (name varchar_pattern_ops);


--
-- Name: btapps_code_code_d95c9f57_like; Type: INDEX; Schema: public; Owner: tarzan
--

CREATE INDEX btapps_code_code_d95c9f57_like ON public.btapps_code USING btree (code varchar_pattern_ops);


--
-- Name: btapps_droit_application_id_7f624ed0; Type: INDEX; Schema: public; Owner: tarzan
--

CREATE INDEX btapps_droit_application_id_7f624ed0 ON public.btapps_droit USING btree (application_id);


--
-- Name: btapps_droit_application_id_7f624ed0_like; Type: INDEX; Schema: public; Owner: tarzan
--

CREATE INDEX btapps_droit_application_id_7f624ed0_like ON public.btapps_droit USING btree (application_id varchar_pattern_ops);


--
-- Name: btapps_session_application_id_d1808fa3; Type: INDEX; Schema: public; Owner: tarzan
--

CREATE INDEX btapps_session_application_id_d1808fa3 ON public.btapps_session USING btree (application_id);


--
-- Name: btapps_session_application_id_d1808fa3_like; Type: INDEX; Schema: public; Owner: tarzan
--

CREATE INDEX btapps_session_application_id_d1808fa3_like ON public.btapps_session USING btree (application_id varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: tarzan
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: tarzan
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: tarzan
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: tarzan
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: accounts_customuser_user_permissions accounts_customuser__customuser_id_0deaefae_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: tarzan
--

ALTER TABLE ONLY public.accounts_customuser_user_permissions
    ADD CONSTRAINT accounts_customuser__customuser_id_0deaefae_fk_accounts_ FOREIGN KEY (customuser_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_customuser_groups accounts_customuser__customuser_id_bc55088e_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: tarzan
--

ALTER TABLE ONLY public.accounts_customuser_groups
    ADD CONSTRAINT accounts_customuser__customuser_id_bc55088e_fk_accounts_ FOREIGN KEY (customuser_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_customuser_user_permissions accounts_customuser__permission_id_aea3d0e5_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: tarzan
--

ALTER TABLE ONLY public.accounts_customuser_user_permissions
    ADD CONSTRAINT accounts_customuser__permission_id_aea3d0e5_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_customuser_groups accounts_customuser_groups_group_id_86ba5f9e_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: tarzan
--

ALTER TABLE ONLY public.accounts_customuser_groups
    ADD CONSTRAINT accounts_customuser_groups_group_id_86ba5f9e_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: tarzan
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: tarzan
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: tarzan
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bcweb_command bcweb_command_application_id_id_51f82730_fk_btapps_ap; Type: FK CONSTRAINT; Schema: public; Owner: tarzan
--

ALTER TABLE ONLY public.bcweb_command
    ADD CONSTRAINT bcweb_command_application_id_id_51f82730_fk_btapps_ap FOREIGN KEY (application_id_id) REFERENCES public.btapps_application(name) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bcweb_piece bcweb_piece_pce_num_bl_id_0359a9df_fk_bcweb_bordereau_bc_num; Type: FK CONSTRAINT; Schema: public; Owner: tarzan
--

ALTER TABLE ONLY public.bcweb_piece
    ADD CONSTRAINT bcweb_piece_pce_num_bl_id_0359a9df_fk_bcweb_bordereau_bc_num FOREIGN KEY (pce_num_bl_id) REFERENCES public.bcweb_bordereau(bc_num) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bcweb_produit bcweb_produit_pdt_num_bl_id_921e3ace_fk_bcweb_bordereau_bc_num; Type: FK CONSTRAINT; Schema: public; Owner: tarzan
--

ALTER TABLE ONLY public.bcweb_produit
    ADD CONSTRAINT bcweb_produit_pdt_num_bl_id_921e3ace_fk_bcweb_bordereau_bc_num FOREIGN KEY (pdt_num_bl_id) REFERENCES public.bcweb_bordereau(bc_num) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bcweb_qrpiece_article bcweb_qrpiece_articl_qrpa_qrp_num_id_68ea750d_fk_bcweb_qrp; Type: FK CONSTRAINT; Schema: public; Owner: tarzan
--

ALTER TABLE ONLY public.bcweb_qrpiece_article
    ADD CONSTRAINT bcweb_qrpiece_articl_qrpa_qrp_num_id_68ea750d_fk_bcweb_qrp FOREIGN KEY (qrpa_qrp_num_id) REFERENCES public.bcweb_qrpiece(qrp_num) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: btapps_droit btapps_droit_application_id_7f624ed0_fk_btapps_application_name; Type: FK CONSTRAINT; Schema: public; Owner: tarzan
--

ALTER TABLE ONLY public.btapps_droit
    ADD CONSTRAINT btapps_droit_application_id_7f624ed0_fk_btapps_application_name FOREIGN KEY (application_id) REFERENCES public.btapps_application(name) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: btapps_session btapps_session_application_id_d1808fa3_fk_btapps_ap; Type: FK CONSTRAINT; Schema: public; Owner: tarzan
--

ALTER TABLE ONLY public.btapps_session
    ADD CONSTRAINT btapps_session_application_id_d1808fa3_fk_btapps_ap FOREIGN KEY (application_id) REFERENCES public.btapps_application(name) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: tarzan
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_accounts_customuser_id; Type: FK CONSTRAINT; Schema: public; Owner: tarzan
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_accounts_customuser_id FOREIGN KEY (user_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

