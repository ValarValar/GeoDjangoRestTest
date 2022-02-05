--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

-- Started on 2022-02-05 20:20:25

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
-- TOC entry 8 (class 2615 OID 17990)
-- Name: topology; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA topology;


ALTER SCHEMA topology OWNER TO postgres;

--
-- TOC entry 5045 (class 0 OID 0)
-- Dependencies: 8
-- Name: SCHEMA topology; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA topology IS 'PostGIS Topology schema';


--
-- TOC entry 2 (class 3079 OID 16395)
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- TOC entry 5046 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';


--
-- TOC entry 3 (class 3079 OID 17433)
-- Name: postgis_raster; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis_raster WITH SCHEMA public;


--
-- TOC entry 5047 (class 0 OID 0)
-- Dependencies: 3
-- Name: EXTENSION postgis_raster; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_raster IS 'PostGIS raster types and functions';


--
-- TOC entry 4 (class 3079 OID 17991)
-- Name: postgis_topology; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis_topology WITH SCHEMA topology;


--
-- TOC entry 5048 (class 0 OID 0)
-- Dependencies: 4
-- Name: EXTENSION postgis_topology; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_topology IS 'PostGIS topology spatial types and functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 237 (class 1259 OID 18169)
-- Name: TestTask_building; Type: TABLE; Schema: public; Owner: geo
--

CREATE TABLE public."TestTask_building" (
    id bigint NOT NULL,
    address character varying(100),
    geom public.geometry(Geometry,4326) NOT NULL
);


ALTER TABLE public."TestTask_building" OWNER TO geo;

--
-- TOC entry 236 (class 1259 OID 18168)
-- Name: TestTask_building_id_seq; Type: SEQUENCE; Schema: public; Owner: geo
--

CREATE SEQUENCE public."TestTask_building_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."TestTask_building_id_seq" OWNER TO geo;

--
-- TOC entry 5049 (class 0 OID 0)
-- Dependencies: 236
-- Name: TestTask_building_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geo
--

ALTER SEQUENCE public."TestTask_building_id_seq" OWNED BY public."TestTask_building".id;


--
-- TOC entry 243 (class 1259 OID 18195)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: geo
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO geo;

--
-- TOC entry 242 (class 1259 OID 18194)
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: geo
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO geo;

--
-- TOC entry 5050 (class 0 OID 0)
-- Dependencies: 242
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geo
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- TOC entry 245 (class 1259 OID 18204)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: geo
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO geo;

--
-- TOC entry 244 (class 1259 OID 18203)
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: geo
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO geo;

--
-- TOC entry 5051 (class 0 OID 0)
-- Dependencies: 244
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geo
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- TOC entry 241 (class 1259 OID 18188)
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: geo
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO geo;

--
-- TOC entry 240 (class 1259 OID 18187)
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: geo
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO geo;

--
-- TOC entry 5052 (class 0 OID 0)
-- Dependencies: 240
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geo
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- TOC entry 247 (class 1259 OID 18211)
-- Name: auth_user; Type: TABLE; Schema: public; Owner: geo
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
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


ALTER TABLE public.auth_user OWNER TO geo;

--
-- TOC entry 249 (class 1259 OID 18220)
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: geo
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO geo;

--
-- TOC entry 248 (class 1259 OID 18219)
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: geo
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO geo;

--
-- TOC entry 5053 (class 0 OID 0)
-- Dependencies: 248
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geo
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- TOC entry 246 (class 1259 OID 18210)
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: geo
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO geo;

--
-- TOC entry 5054 (class 0 OID 0)
-- Dependencies: 246
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geo
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- TOC entry 251 (class 1259 OID 18227)
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: geo
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO geo;

--
-- TOC entry 250 (class 1259 OID 18226)
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: geo
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO geo;

--
-- TOC entry 5055 (class 0 OID 0)
-- Dependencies: 250
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geo
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- TOC entry 253 (class 1259 OID 18286)
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: geo
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO geo;

--
-- TOC entry 252 (class 1259 OID 18285)
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: geo
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO geo;

--
-- TOC entry 5056 (class 0 OID 0)
-- Dependencies: 252
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geo
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- TOC entry 239 (class 1259 OID 18179)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: geo
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO geo;

--
-- TOC entry 238 (class 1259 OID 18178)
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: geo
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO geo;

--
-- TOC entry 5057 (class 0 OID 0)
-- Dependencies: 238
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geo
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- TOC entry 235 (class 1259 OID 18160)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: geo
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO geo;

--
-- TOC entry 234 (class 1259 OID 18159)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: geo
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO geo;

--
-- TOC entry 5058 (class 0 OID 0)
-- Dependencies: 234
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geo
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- TOC entry 254 (class 1259 OID 18315)
-- Name: django_session; Type: TABLE; Schema: public; Owner: geo
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO geo;

--
-- TOC entry 4794 (class 2604 OID 18172)
-- Name: TestTask_building id; Type: DEFAULT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public."TestTask_building" ALTER COLUMN id SET DEFAULT nextval('public."TestTask_building_id_seq"'::regclass);


--
-- TOC entry 4797 (class 2604 OID 18198)
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- TOC entry 4798 (class 2604 OID 18207)
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 4796 (class 2604 OID 18191)
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- TOC entry 4799 (class 2604 OID 18214)
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- TOC entry 4800 (class 2604 OID 18223)
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- TOC entry 4801 (class 2604 OID 18230)
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- TOC entry 4802 (class 2604 OID 18289)
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- TOC entry 4795 (class 2604 OID 18182)
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- TOC entry 4793 (class 2604 OID 18163)
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- TOC entry 5022 (class 0 OID 18169)
-- Dependencies: 237
-- Data for Name: TestTask_building; Type: TABLE DATA; Schema: public; Owner: geo
--

COPY public."TestTask_building" (id, address, geom) FROM stdin;
57	\N	0103000020E6100000010000000400000000000000000000000000000000000000000000000000F03F000000000000F03F0000000000000000000000000000F03F00000000000000000000000000000000
58	\N	0103000020E6100000010000000400000000000000000000000000000000000000000000000000F03F000000000000F03F0000000000000000000000000000F03F00000000000000000000000000000000
59	\N	0103000020E6100000010000000400000000000000000000000000000000000000000000000000F03F000000000000F03F0000000000000000000000000000F03F00000000000000000000000000000000
60	\N	0103000020E6100000010000000400000000000000000000000000000000000000000000000000F03F000000000000F03F0000000000000000000000000000F03F00000000000000000000000000000000
61	\N	0103000020E6100000010000000400000000000000000000400000000000000040000000000000084000000000000008400000000000000040000000000000084000000000000000400000000000000040
62	\N	0103000020E6100000010000000400000000000000000010400000000000001040000000000000144000000000000014400000000000001040000000000000144000000000000010400000000000001040
63	\N	0103000020E61000000100000004000000000000000000184000000000000018400000000000001C400000000000001C4000000000000018400000000000001C4000000000000018400000000000001840
64	\N	0103000020E6100000010000000400000000000000000020400000000000002040000000000000224000000000000022400000000000002040000000000000224000000000000020400000000000002040
65	\N	0103000020E6100000010000000400000000000000000024400000000000002440000000000000264000000000000026400000000000002440000000000000264000000000000024400000000000002440
66	\N	0103000020E61000000100000004000000000000000000284000000000000028400000000000002A400000000000002A4000000000000028400000000000002A4000000000000028400000000000002840
67	\N	0103000020E610000001000000040000000000000000002C400000000000002C400000000000002E400000000000002E400000000000002C400000000000002E400000000000002C400000000000002C40
68	\N	0103000020E6100000010000000400000000000000000030400000000000003040000000000000314000000000000031400000000000003040000000000000314000000000000030400000000000003040
69	\N	0103000020E6100000010000000400000000000000000032400000000000003240000000000000334000000000000033400000000000003240000000000000334000000000000032400000000000003240
\.


--
-- TOC entry 5028 (class 0 OID 18195)
-- Dependencies: 243
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: geo
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- TOC entry 5030 (class 0 OID 18204)
-- Dependencies: 245
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: geo
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- TOC entry 5026 (class 0 OID 18188)
-- Dependencies: 241
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: geo
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
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add building	7	add_building
26	Can change building	7	change_building
27	Can delete building	7	delete_building
28	Can view building	7	view_building
\.


--
-- TOC entry 5032 (class 0 OID 18211)
-- Dependencies: 247
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: geo
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$320000$ufJXJoebX7qOVQyqiVKhLa$3g+LZI4nc7C/BfpqqmVl6vV5yzJse5/sIWXbIXBn/r4=	2022-02-04 17:18:36.137425+03	t	super			super@mail.ru	t	t	2022-02-02 16:56:19.535185+03
\.


--
-- TOC entry 5034 (class 0 OID 18220)
-- Dependencies: 249
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: geo
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- TOC entry 5036 (class 0 OID 18227)
-- Dependencies: 251
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: geo
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- TOC entry 5038 (class 0 OID 18286)
-- Dependencies: 253
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: geo
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- TOC entry 5024 (class 0 OID 18179)
-- Dependencies: 239
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: geo
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	TestTask	building
\.


--
-- TOC entry 5020 (class 0 OID 18160)
-- Dependencies: 235
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: geo
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	TestTask	0001_initial	2022-02-02 16:55:23.404344+03
2	contenttypes	0001_initial	2022-02-02 16:55:23.513799+03
3	auth	0001_initial	2022-02-02 16:55:24.487227+03
4	admin	0001_initial	2022-02-02 16:55:24.6719+03
5	admin	0002_logentry_remove_auto_add	2022-02-02 16:55:24.679903+03
6	admin	0003_logentry_add_action_flag_choices	2022-02-02 16:55:24.690009+03
7	contenttypes	0002_remove_content_type_name	2022-02-02 16:55:24.759312+03
8	auth	0002_alter_permission_name_max_length	2022-02-02 16:55:24.767426+03
9	auth	0003_alter_user_email_max_length	2022-02-02 16:55:24.774425+03
10	auth	0004_alter_user_username_opts	2022-02-02 16:55:24.78153+03
11	auth	0005_alter_user_last_login_null	2022-02-02 16:55:24.788641+03
12	auth	0006_require_contenttypes_0002	2022-02-02 16:55:24.791078+03
13	auth	0007_alter_validators_add_error_messages	2022-02-02 16:55:24.798718+03
14	auth	0008_alter_user_username_max_length	2022-02-02 16:55:24.997014+03
15	auth	0009_alter_user_last_name_max_length	2022-02-02 16:55:25.004876+03
16	auth	0010_alter_group_name_max_length	2022-02-02 16:55:25.012904+03
17	auth	0011_update_proxy_permissions	2022-02-02 16:55:25.020914+03
18	auth	0012_alter_user_first_name_max_length	2022-02-02 16:55:25.028025+03
19	sessions	0001_initial	2022-02-02 16:55:25.223382+03
20	TestTask	0002_alter_building_geom	2022-02-02 19:18:46.356029+03
\.


--
-- TOC entry 5039 (class 0 OID 18315)
-- Dependencies: 254
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: geo
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
tzr6rw1ampqtbvfj1uwdq9bn2v6njc60	.eJxVjEEOwiAQRe_C2hBgKKBL9z0DmRlAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xSuIitDj9boT8yG0H6Y7tNkue27pMJHdFHrTLcU75eT3cv4OKvX5rIF1U8j6T8TYhInBQCv3ZEHgzWOecIsVsbWAAa9AD2hJc1iUEdoN4fwDblDdl:1nFzQ4:RXfAmTReVlZFtRxLw8eejmwdsOvd93VE8NvzYyr2wiI	2022-02-18 17:18:36.232725+03
\.


--
-- TOC entry 4786 (class 0 OID 16705)
-- Dependencies: 214
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- TOC entry 4787 (class 0 OID 17993)
-- Dependencies: 229
-- Data for Name: topology; Type: TABLE DATA; Schema: topology; Owner: postgres
--

COPY topology.topology (id, name, srid, "precision", hasz) FROM stdin;
\.


--
-- TOC entry 4788 (class 0 OID 18005)
-- Dependencies: 230
-- Data for Name: layer; Type: TABLE DATA; Schema: topology; Owner: postgres
--

COPY topology.layer (topology_id, layer_id, schema_name, table_name, feature_column, feature_type, level, child_id) FROM stdin;
\.


--
-- TOC entry 5059 (class 0 OID 0)
-- Dependencies: 236
-- Name: TestTask_building_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geo
--

SELECT pg_catalog.setval('public."TestTask_building_id_seq"', 69, true);


--
-- TOC entry 5060 (class 0 OID 0)
-- Dependencies: 242
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geo
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- TOC entry 5061 (class 0 OID 0)
-- Dependencies: 244
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geo
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 5062 (class 0 OID 0)
-- Dependencies: 240
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geo
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 28, true);


--
-- TOC entry 5063 (class 0 OID 0)
-- Dependencies: 248
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geo
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- TOC entry 5064 (class 0 OID 0)
-- Dependencies: 246
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geo
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- TOC entry 5065 (class 0 OID 0)
-- Dependencies: 250
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geo
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 5066 (class 0 OID 0)
-- Dependencies: 252
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geo
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- TOC entry 5067 (class 0 OID 0)
-- Dependencies: 238
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geo
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 7, true);


--
-- TOC entry 5068 (class 0 OID 0)
-- Dependencies: 234
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geo
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 20, true);


--
-- TOC entry 4818 (class 2606 OID 18176)
-- Name: TestTask_building TestTask_building_pkey; Type: CONSTRAINT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public."TestTask_building"
    ADD CONSTRAINT "TestTask_building_pkey" PRIMARY KEY (id);


--
-- TOC entry 4830 (class 2606 OID 18313)
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 4835 (class 2606 OID 18243)
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- TOC entry 4838 (class 2606 OID 18209)
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 4832 (class 2606 OID 18200)
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 4825 (class 2606 OID 18234)
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- TOC entry 4827 (class 2606 OID 18193)
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 4846 (class 2606 OID 18225)
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 4849 (class 2606 OID 18258)
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- TOC entry 4840 (class 2606 OID 18216)
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- TOC entry 4852 (class 2606 OID 18232)
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 4855 (class 2606 OID 18272)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- TOC entry 4843 (class 2606 OID 18308)
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- TOC entry 4858 (class 2606 OID 18294)
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 4820 (class 2606 OID 18186)
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- TOC entry 4822 (class 2606 OID 18184)
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 4815 (class 2606 OID 18167)
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 4862 (class 2606 OID 18321)
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 4816 (class 1259 OID 18325)
-- Name: TestTask_building_geom_76ff94b4_id; Type: INDEX; Schema: public; Owner: geo
--

CREATE INDEX "TestTask_building_geom_76ff94b4_id" ON public."TestTask_building" USING gist (geom);


--
-- TOC entry 4828 (class 1259 OID 18314)
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: geo
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 4833 (class 1259 OID 18254)
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: geo
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- TOC entry 4836 (class 1259 OID 18255)
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: geo
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- TOC entry 4823 (class 1259 OID 18240)
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: geo
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- TOC entry 4844 (class 1259 OID 18270)
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: geo
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- TOC entry 4847 (class 1259 OID 18269)
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: geo
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- TOC entry 4850 (class 1259 OID 18284)
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: geo
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- TOC entry 4853 (class 1259 OID 18283)
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: geo
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- TOC entry 4841 (class 1259 OID 18309)
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: geo
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- TOC entry 4856 (class 1259 OID 18305)
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: geo
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- TOC entry 4859 (class 1259 OID 18306)
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: geo
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- TOC entry 4860 (class 1259 OID 18323)
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: geo
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- TOC entry 4863 (class 1259 OID 18322)
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: geo
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 4866 (class 2606 OID 18249)
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4865 (class 2606 OID 18244)
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4864 (class 2606 OID 18235)
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4868 (class 2606 OID 18264)
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4867 (class 2606 OID 18259)
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4870 (class 2606 OID 18278)
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4869 (class 2606 OID 18273)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4871 (class 2606 OID 18295)
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4872 (class 2606 OID 18300)
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2022-02-05 20:20:26

--
-- PostgreSQL database dump complete
--

