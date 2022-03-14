--
-- PostgreSQL database dump
--

-- Dumped from database version 14.0
-- Dumped by pg_dump version 14.0

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: shop_brand; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shop_brand (
    id bigint NOT NULL,
    name character varying(32) NOT NULL
);


ALTER TABLE public.shop_brand OWNER TO postgres;

--
-- Name: shop_brand_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shop_brand_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_brand_id_seq OWNER TO postgres;

--
-- Name: shop_brand_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shop_brand_id_seq OWNED BY public.shop_brand.id;


--
-- Name: shop_cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shop_cart (
    id bigint NOT NULL,
    total_costs double precision NOT NULL,
    customer_id bigint NOT NULL,
    freight double precision NOT NULL,
    ready_to_checkout boolean NOT NULL
);


ALTER TABLE public.shop_cart OWNER TO postgres;

--
-- Name: shop_cart_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shop_cart_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_cart_id_seq OWNER TO postgres;

--
-- Name: shop_cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shop_cart_id_seq OWNED BY public.shop_cart.id;


--
-- Name: shop_cart_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shop_cart_item (
    id bigint NOT NULL,
    quantity bigint NOT NULL,
    subtotal_costs double precision NOT NULL,
    cart_id bigint NOT NULL,
    inventory_id bigint NOT NULL,
    CONSTRAINT shop_cart_item_quantity_check CHECK ((quantity >= 0))
);


ALTER TABLE public.shop_cart_item OWNER TO postgres;

--
-- Name: shop_cart_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shop_cart_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_cart_item_id_seq OWNER TO postgres;

--
-- Name: shop_cart_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shop_cart_item_id_seq OWNED BY public.shop_cart_item.id;


--
-- Name: shop_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shop_category (
    id bigint NOT NULL,
    name character varying(32) NOT NULL
);


ALTER TABLE public.shop_category OWNER TO postgres;

--
-- Name: shop_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shop_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_category_id_seq OWNER TO postgres;

--
-- Name: shop_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shop_category_id_seq OWNED BY public.shop_category.id;


--
-- Name: shop_customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shop_customer (
    id bigint NOT NULL,
    gender character varying(16),
    email character varying(256) NOT NULL,
    phone_number character varying(32),
    account_type character varying(16) NOT NULL,
    date_of_birth date,
    password character varying(32) NOT NULL,
    name character varying(64) NOT NULL,
    token character varying(256),
    is_email_verified boolean NOT NULL
);


ALTER TABLE public.shop_customer OWNER TO postgres;

--
-- Name: shop_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shop_customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_customer_id_seq OWNER TO postgres;

--
-- Name: shop_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shop_customer_id_seq OWNED BY public.shop_customer.id;


--
-- Name: shop_favorite_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shop_favorite_item (
    id bigint NOT NULL,
    customer_id bigint NOT NULL,
    product_id bigint NOT NULL
);


ALTER TABLE public.shop_favorite_item OWNER TO postgres;

--
-- Name: shop_favorite_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shop_favorite_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_favorite_item_id_seq OWNER TO postgres;

--
-- Name: shop_favorite_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shop_favorite_item_id_seq OWNED BY public.shop_favorite_item.id;


--
-- Name: shop_inventory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shop_inventory (
    id bigint NOT NULL,
    color_id bigint NOT NULL,
    size_id bigint NOT NULL,
    inventory integer NOT NULL,
    quantity_sold integer NOT NULL,
    product_id bigint NOT NULL,
    CONSTRAINT shop_inventory_inventory_check CHECK ((inventory >= 0)),
    CONSTRAINT shop_inventory_quantity_sold_check CHECK ((quantity_sold >= 0))
);


ALTER TABLE public.shop_inventory OWNER TO postgres;

--
-- Name: shop_inventory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shop_inventory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_inventory_id_seq OWNER TO postgres;

--
-- Name: shop_inventory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shop_inventory_id_seq OWNED BY public.shop_inventory.id;


--
-- Name: shop_order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shop_order (
    id bigint NOT NULL,
    type character varying(32) NOT NULL,
    final_costs double precision NOT NULL,
    paid_date timestamp with time zone,
    customer_id bigint NOT NULL,
    address character varying(128) NOT NULL,
    arrived_date timestamp with time zone,
    picked_up_date timestamp with time zone,
    shipped_date timestamp with time zone,
    ordered_date timestamp with time zone NOT NULL,
    name_of_picker character varying(64) NOT NULL,
    phone_number_of_picker character varying(32) NOT NULL
);


ALTER TABLE public.shop_order OWNER TO postgres;

--
-- Name: shop_order_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shop_order_item (
    id bigint NOT NULL,
    quantity bigint NOT NULL,
    subtotal_costs double precision NOT NULL,
    inventory_id bigint NOT NULL,
    order_id bigint NOT NULL,
    CONSTRAINT shop_order_item_quantity_check CHECK ((quantity >= 0))
);


ALTER TABLE public.shop_order_item OWNER TO postgres;

--
-- Name: shop_order_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shop_order_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_order_item_id_seq OWNER TO postgres;

--
-- Name: shop_order_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shop_order_item_id_seq OWNED BY public.shop_order_item.id;


--
-- Name: shop_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shop_payment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_payment_id_seq OWNER TO postgres;

--
-- Name: shop_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shop_payment_id_seq OWNED BY public.shop_order.id;


--
-- Name: shop_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shop_product (
    id bigint NOT NULL,
    name character varying(32) NOT NULL,
    unit_price double precision NOT NULL,
    description text,
    brand_id bigint NOT NULL,
    category_id bigint NOT NULL
);


ALTER TABLE public.shop_product OWNER TO postgres;

--
-- Name: shop_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shop_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_product_id_seq OWNER TO postgres;

--
-- Name: shop_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shop_product_id_seq OWNED BY public.shop_product.id;


--
-- Name: shop_product_picture; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shop_product_picture (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    picture character varying(1024) NOT NULL,
    specification_id bigint NOT NULL
);


ALTER TABLE public.shop_product_picture OWNER TO postgres;

--
-- Name: shop_product_picture_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shop_product_picture_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_product_picture_id_seq OWNER TO postgres;

--
-- Name: shop_product_picture_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shop_product_picture_id_seq OWNED BY public.shop_product_picture.id;


--
-- Name: shop_product_specification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shop_product_specification (
    id bigint NOT NULL,
    "group" character varying(32) NOT NULL,
    detail character varying(64) NOT NULL,
    product_id bigint NOT NULL
);


ALTER TABLE public.shop_product_specification OWNER TO postgres;

--
-- Name: shop_product_specification_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shop_product_specification_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_product_specification_id_seq OWNER TO postgres;

--
-- Name: shop_product_specification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shop_product_specification_id_seq OWNED BY public.shop_product_specification.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: shop_brand id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_brand ALTER COLUMN id SET DEFAULT nextval('public.shop_brand_id_seq'::regclass);


--
-- Name: shop_cart id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_cart ALTER COLUMN id SET DEFAULT nextval('public.shop_cart_id_seq'::regclass);


--
-- Name: shop_cart_item id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_cart_item ALTER COLUMN id SET DEFAULT nextval('public.shop_cart_item_id_seq'::regclass);


--
-- Name: shop_category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_category ALTER COLUMN id SET DEFAULT nextval('public.shop_category_id_seq'::regclass);


--
-- Name: shop_customer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_customer ALTER COLUMN id SET DEFAULT nextval('public.shop_customer_id_seq'::regclass);


--
-- Name: shop_favorite_item id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_favorite_item ALTER COLUMN id SET DEFAULT nextval('public.shop_favorite_item_id_seq'::regclass);


--
-- Name: shop_inventory id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_inventory ALTER COLUMN id SET DEFAULT nextval('public.shop_inventory_id_seq'::regclass);


--
-- Name: shop_order id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_order ALTER COLUMN id SET DEFAULT nextval('public.shop_payment_id_seq'::regclass);


--
-- Name: shop_order_item id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_order_item ALTER COLUMN id SET DEFAULT nextval('public.shop_order_item_id_seq'::regclass);


--
-- Name: shop_product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_product ALTER COLUMN id SET DEFAULT nextval('public.shop_product_id_seq'::regclass);


--
-- Name: shop_product_picture id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_product_picture ALTER COLUMN id SET DEFAULT nextval('public.shop_product_picture_id_seq'::regclass);


--
-- Name: shop_product_specification id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_product_specification ALTER COLUMN id SET DEFAULT nextval('public.shop_product_specification_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add brand	1	add_brand
2	Can change brand	1	change_brand
3	Can delete brand	1	delete_brand
4	Can view brand	1	view_brand
5	Can add cart	2	add_cart
6	Can change cart	2	change_cart
7	Can delete cart	2	delete_cart
8	Can view cart	2	view_cart
9	Can add category	3	add_category
10	Can change category	3	change_category
11	Can delete category	3	delete_category
12	Can view category	3	view_category
13	Can add customer	4	add_customer
14	Can change customer	4	change_customer
15	Can delete customer	4	delete_customer
16	Can view customer	4	view_customer
17	Can add product	5	add_product
18	Can change product	5	change_product
19	Can delete product	5	delete_product
20	Can view product	5	view_product
21	Can add product_picture	6	add_product_picture
22	Can change product_picture	6	change_product_picture
23	Can delete product_picture	6	delete_product_picture
24	Can view product_picture	6	view_product_picture
25	Can add cart_item	7	add_cart_item
26	Can change cart_item	7	change_cart_item
27	Can delete cart_item	7	delete_cart_item
28	Can view cart_item	7	view_cart_item
29	Can add payment	8	add_payment
30	Can change payment	8	change_payment
31	Can delete payment	8	delete_payment
32	Can view payment	8	view_payment
33	Can add log entry	9	add_logentry
34	Can change log entry	9	change_logentry
35	Can delete log entry	9	delete_logentry
36	Can view log entry	9	view_logentry
37	Can add permission	10	add_permission
38	Can change permission	10	change_permission
39	Can delete permission	10	delete_permission
40	Can view permission	10	view_permission
41	Can add group	11	add_group
42	Can change group	11	change_group
43	Can delete group	11	delete_group
44	Can view group	11	view_group
45	Can add user	12	add_user
46	Can change user	12	change_user
47	Can delete user	12	delete_user
48	Can view user	12	view_user
49	Can add content type	13	add_contenttype
50	Can change content type	13	change_contenttype
51	Can delete content type	13	delete_contenttype
52	Can view content type	13	view_contenttype
53	Can add session	14	add_session
54	Can change session	14	change_session
55	Can delete session	14	delete_session
56	Can view session	14	view_session
57	Can add favorite_item	15	add_favorite_item
58	Can change favorite_item	15	change_favorite_item
59	Can delete favorite_item	15	delete_favorite_item
60	Can view favorite_item	15	view_favorite_item
61	Can add product_specification	16	add_product_specification
62	Can change product_specification	16	change_product_specification
63	Can delete product_specification	16	delete_product_specification
64	Can view product_specification	16	view_product_specification
65	Can add inventory	17	add_inventory
66	Can change inventory	17	change_inventory
67	Can delete inventory	17	delete_inventory
68	Can view inventory	17	view_inventory
69	Can add order_item	18	add_order_item
70	Can change order_item	18	change_order_item
71	Can delete order_item	18	delete_order_item
72	Can view order_item	18	view_order_item
73	Can add order	8	add_order
74	Can change order	8	change_order
75	Can delete order	8	delete_order
76	Can view order	8	view_order
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$260000$lAE6fcZODRzBLHZTybxS7K$doizfLhfgps4yZSGSpZyyZ8xJQ32O5UgKzFwKeRXEv8=	2022-02-24 23:53:57.508375+08	t	admin			admin@test.com	t	t	2021-12-21 06:25:29.445558+08
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2021-12-21 06:35:01.391415+08	1	Nike	1	[{"added": {}}]	1	1
2	2021-12-21 06:35:15.696863+08	1	Nike	3		1	1
3	2021-12-22 06:10:19.507084+08	1	3C用品	1	[{"added": {}}]	3	1
4	2021-12-22 06:10:26.599249+08	2	家電	1	[{"added": {}}]	3	1
5	2021-12-22 06:11:30.58862+08	3	服飾	1	[{"added": {}}]	3	1
6	2021-12-22 06:12:00.35558+08	4	體育用品	1	[{"added": {}}]	3	1
7	2021-12-22 06:12:21.594401+08	2	Apple	1	[{"added": {}}]	1	1
8	2021-12-22 06:12:36.203533+08	3	Samsung	1	[{"added": {}}]	1	1
9	2021-12-22 06:12:41.626088+08	4	Sony	1	[{"added": {}}]	1	1
10	2021-12-22 06:12:47.451763+08	5	LG	1	[{"added": {}}]	1	1
11	2021-12-22 06:12:50.974318+08	6	Nike	1	[{"added": {}}]	1	1
12	2021-12-22 06:12:56.203221+08	7	Addidas	1	[{"added": {}}]	1	1
13	2021-12-22 06:13:15.210841+08	8	Uniqlo	1	[{"added": {}}]	1	1
14	2021-12-22 06:13:27.359025+08	9	Roots	1	[{"added": {}}]	1	1
15	2021-12-22 06:13:51.437041+08	10	Net	1	[{"added": {}}]	1	1
16	2021-12-22 06:14:16.553347+08	11	Panasonic	1	[{"added": {}}]	1	1
17	2021-12-22 06:16:55.279746+08	1	iPhone 13	1	[{"added": {}}]	5	1
18	2021-12-22 06:19:10.61271+08	12	Alphabet	1	[{"added": {}}]	1	1
19	2021-12-22 06:20:13.131287+08	2	Google Pixel 6	1	[{"added": {}}]	5	1
20	2021-12-22 06:21:30.062803+08	3	荒野景緻系列 戶外元素刷毛圓領上衣	1	[{"added": {}}]	5	1
21	2021-12-22 10:16:43.747095+08	1	iPhone 13	2	[]	5	1
22	2022-01-22 06:51:33.075419+08	4	brand_four	3		1	1
23	2022-01-22 06:51:33.101795+08	3	brand_three	3		1	1
24	2022-01-22 06:51:33.102785+08	2	brand_two	3		1	1
25	2022-01-22 06:51:33.103785+08	1	brand_one	3		1	1
26	2022-01-22 06:51:43.290389+08	2	category_two	3		3	1
27	2022-01-22 06:51:43.293387+08	1	category_one	3		3	1
28	2022-01-22 06:53:23.887003+08	3	Blazers	1	[{"added": {}}]	3	1
29	2022-01-22 06:53:32.073345+08	4	Collection	1	[{"added": {}}]	3	1
30	2022-01-22 06:53:42.479388+08	5	Dresses	1	[{"added": {}}]	3	1
31	2022-01-22 06:53:50.422524+08	6	Jackets	1	[{"added": {}}]	3	1
32	2022-01-22 06:53:56.007691+08	7	Jeans	1	[{"added": {}}]	3	1
33	2022-01-22 06:54:05.715641+08	8	Jumpsuits	1	[{"added": {}}]	3	1
34	2022-01-22 06:54:14.576958+08	9	Knitwear	1	[{"added": {}}]	3	1
35	2022-01-22 06:54:28.244426+08	10	Sweatshirts	1	[{"added": {}}]	3	1
36	2022-01-22 06:57:15.929386+08	5	MyBrand	1	[{"added": {}}]	1	1
37	2022-01-22 07:02:19.029381+08	12	Leather belt with square buckle	1	[{"added": {}}]	5	1
38	2022-01-22 07:04:43.822819+08	13	Mirror lens cat eye sunglasses	1	[{"added": {}}]	5	1
39	2022-01-22 07:06:59.759429+08	14	Oversized poplin shirt	1	[{"added": {}}]	5	1
40	2022-01-22 07:07:56.236589+08	15	Round neck sweater	1	[{"added": {}}]	5	1
41	2022-01-22 07:09:00.930859+08	16	Scalloped leather court shoes	1	[{"added": {}}]	5	1
42	2022-01-22 07:09:54.962184+08	17	Short check trench coat	1	[{"added": {}}]	5	1
43	2022-01-22 07:10:50.330291+08	18	Soft faux fur coat	1	[{"added": {}}]	5	1
44	2022-01-22 07:12:03.690926+08	19	Stretch t-shirt	1	[{"added": {}}]	5	1
45	2022-01-22 07:13:31.986136+08	20	Textured faux shearling coat	1	[{"added": {}}]	5	1
46	2022-01-22 07:14:20.937211+08	21	Z1975 metallic jeans	1	[{"added": {}}]	5	1
47	2022-01-22 07:15:53.958667+08	22	Basic asymmetrical t-shirt	1	[{"added": {}}]	5	1
48	2022-01-22 07:17:44.897721+08	23	Basic asymmetrical t-shirt	1	[{"added": {}}]	5	1
49	2022-01-22 07:18:23.323485+08	24	Basic asymmetrical t-shirt	1	[{"added": {}}]	5	1
50	2022-01-22 07:19:16.200034+08	25	Check shirt	1	[{"added": {}}]	5	1
51	2022-01-22 07:20:01.161372+08	26	Contrast metallic shirt	1	[{"added": {}}]	5	1
52	2022-01-22 07:20:49.661662+08	27	Fleece jacket	1	[{"added": {}}]	5	1
53	2022-01-22 07:21:53.310876+08	28	Flowing bomber jacket	1	[{"added": {}}]	5	1
54	2022-01-22 07:22:44.26289+08	29	Frock coat with zips	1	[{"added": {}}]	5	1
55	2022-01-22 07:23:23.544724+08	30	High-heel leather boots	1	[{"added": {}}]	5	1
56	2022-01-22 07:24:39.561741+08	31	Hooded coat	1	[{"added": {}}]	5	1
57	2022-01-22 07:27:16.851978+08	32	Jeans zw premium high waist ciga	1	[{"added": {}}]	5	1
58	2022-01-22 07:28:47.503041+08	33	Ribbed knit sweater	1	[{"added": {}}]	5	1
59	2022-01-22 07:29:57.635197+08	34	Soft leather high-heel boots	1	[{"added": {}}]	5	1
60	2022-01-22 07:56:24.973799+08	35	Minimal collection long dress	1	[{"added": {}}]	5	1
61	2022-01-22 07:59:52.350811+08	36	Check asymmetric mini skirt	1	[{"added": {}}]	5	1
62	2022-01-22 08:39:31.968683+08	28	Flowing bomber jacket	2	[{"changed": {"fields": ["Description"]}}]	5	1
63	2022-01-22 08:40:06.044089+08	23	Basic asymmetrical t-shirt	2	[{"changed": {"fields": ["Description"]}}]	5	1
64	2022-01-22 08:40:24.826532+08	22	Basic asymmetrical t-shirt	2	[{"changed": {"fields": ["Description"]}}]	5	1
65	2022-01-22 08:40:39.345856+08	21	Z1975 metallic jeans	2	[{"changed": {"fields": ["Description"]}}]	5	1
66	2022-01-22 08:40:49.08206+08	20	Textured faux shearling coat	2	[{"changed": {"fields": ["Description"]}}]	5	1
67	2022-01-22 08:40:57.722165+08	19	Stretch t-shirt	2	[{"changed": {"fields": ["Description"]}}]	5	1
68	2022-01-22 08:41:10.140774+08	17	Short check trench coat	2	[{"changed": {"fields": ["Description"]}}]	5	1
69	2022-01-22 08:41:27.891036+08	14	Oversized poplin shirt	2	[{"changed": {"fields": ["Description"]}}]	5	1
70	2022-01-22 08:44:11.135503+08	12	Leather belt with square buckle	2	[{"changed": {"fields": ["Category"]}}]	5	1
71	2022-01-22 08:44:24.343757+08	13	Mirror lens cat eye sunglasses	2	[{"changed": {"fields": ["Category"]}}]	5	1
72	2022-01-22 08:44:55.510049+08	14	Oversized poplin shirt	2	[{"changed": {"fields": ["Category"]}}]	5	1
73	2022-01-22 08:45:13.811403+08	15	Round neck sweater	2	[{"changed": {"fields": ["Category"]}}]	5	1
74	2022-01-22 08:45:23.261026+08	16	Scalloped leather court shoes	2	[{"changed": {"fields": ["Category"]}}]	5	1
75	2022-01-22 08:46:00.89743+08	17	Short check trench coat	2	[{"changed": {"fields": ["Category"]}}]	5	1
76	2022-01-22 08:46:08.166809+08	18	Soft faux fur coat	2	[{"changed": {"fields": ["Category"]}}]	5	1
77	2022-01-22 08:46:26.586147+08	19	Stretch t-shirt	2	[{"changed": {"fields": ["Category"]}}]	5	1
78	2022-01-22 08:46:39.412762+08	20	Textured faux shearling coat	2	[{"changed": {"fields": ["Category"]}}]	5	1
79	2022-01-22 08:46:49.322938+08	21	Z1975 metallic jeans	2	[{"changed": {"fields": ["Category"]}}]	5	1
80	2022-01-22 08:47:42.856315+08	22	Basic asymmetrical t-shirt	2	[]	5	1
81	2022-01-22 08:48:18.554562+08	27	Fleece jacket	2	[{"changed": {"fields": ["Category"]}}]	5	1
82	2022-01-22 08:48:42.918488+08	28	Flowing bomber jacket	2	[{"changed": {"fields": ["Category"]}}]	5	1
83	2022-01-22 08:48:48.854697+08	29	Frock coat with zips	2	[{"changed": {"fields": ["Category"]}}]	5	1
84	2022-01-22 08:49:10.523613+08	31	Hooded coat	2	[{"changed": {"fields": ["Category"]}}]	5	1
85	2022-01-22 08:52:55.882709+08	33	Ribbed knit sweater	2	[{"changed": {"fields": ["Category"]}}]	5	1
86	2022-01-22 08:53:17.416867+08	33	Ribbed knit sweater	2	[{"changed": {"fields": ["Category"]}}]	5	1
87	2022-01-22 08:55:37.359065+08	36	Check asymmetric mini skirt	2	[{"changed": {"fields": ["Category"]}}]	5	1
88	2022-01-22 08:56:15.374093+08	37	Leather stiletto-heel ankle boot	1	[{"added": {}}]	5	1
89	2022-01-22 08:56:17.863999+08	37	Leather stiletto-heel ankle boot	2	[]	5	1
90	2022-01-22 08:56:58.978711+08	38	Leather strappy high-heel sandal	1	[{"added": {}}]	5	1
91	2022-01-30 17:22:26.905923+08	1	Alice	1	[{"added": {}}]	4	1
92	2022-01-30 17:42:16.221611+08	1	Alice	2	[{"changed": {"fields": ["Token"]}}]	4	1
93	2022-01-30 17:42:22.114418+08	1	Alice	2	[]	4	1
94	2022-01-30 17:46:06.570363+08	1	Alice	2	[{"changed": {"fields": ["Token"]}}]	4	1
95	2022-01-30 17:48:37.558367+08	1	Alice	2	[{"changed": {"fields": ["Token"]}}]	4	1
96	2022-01-30 17:57:05.16109+08	1	Alice	2	[{"changed": {"fields": ["Token"]}}]	4	1
97	2022-01-30 18:00:57.663059+08	1	Alice	2	[{"changed": {"fields": ["Token"]}}]	4	1
98	2022-01-30 18:03:16.99584+08	1	Alice	2	[{"changed": {"fields": ["Token"]}}]	4	1
99	2022-01-30 18:07:17.183424+08	1	Alice	2	[{"changed": {"fields": ["Token"]}}]	4	1
100	2022-01-30 18:09:54.99011+08	1	Alice	2	[{"changed": {"fields": ["Token"]}}]	4	1
101	2022-01-30 18:26:34.487798+08	1	Alice	2	[{"changed": {"fields": ["Token"]}}]	4	1
102	2022-01-30 18:27:16.051451+08	1	Alice	2	[]	4	1
103	2022-01-30 18:34:17.8751+08	1	Alice	2	[{"changed": {"fields": ["Token"]}}]	4	1
104	2022-01-30 18:37:50.84448+08	1	Alice	2	[{"changed": {"fields": ["Token"]}}]	4	1
105	2022-01-30 18:50:34.788294+08	1	Alice	2	[{"changed": {"fields": ["Token"]}}]	4	1
106	2022-01-30 18:52:25.104248+08	1	Alice	2	[{"changed": {"fields": ["Token"]}}]	4	1
107	2022-01-30 18:54:54.003254+08	1	Alice	2	[{"changed": {"fields": ["Token"]}}]	4	1
108	2022-01-30 18:55:54.413572+08	1	Alice	2	[{"changed": {"fields": ["Token"]}}]	4	1
109	2022-01-30 19:29:36.685522+08	1	Alice	2	[]	4	1
110	2022-01-30 19:32:57.686428+08	1	Alice	2	[]	4	1
111	2022-01-30 19:35:21.447281+08	1	Alice	2	[{"changed": {"fields": ["Token"]}}]	4	1
112	2022-01-30 19:38:37.57094+08	1	Alice	2	[{"changed": {"fields": ["Token"]}}]	4	1
113	2022-01-31 04:52:52.97011+08	2	Jamison	2	[{"changed": {"fields": ["Token"]}}]	4	1
114	2022-02-02 02:43:28.176234+08	1	Jeans zw premium high waist ciga / color / blue	1	[{"added": {}}]	16	1
115	2022-02-02 02:43:53.246028+08	2	Jeans zw premium high waist ciga / color / black	1	[{"added": {}}]	16	1
116	2022-02-02 02:44:08.231886+08	3	Jeans zw premium high waist ciga / size / S	1	[{"added": {}}]	16	1
117	2022-02-02 02:44:15.668017+08	4	Jeans zw premium high waist ciga / size / M	1	[{"added": {}}]	16	1
118	2022-02-02 02:44:21.446389+08	5	Jeans zw premium high waist ciga / size / L	1	[{"added": {}}]	16	1
119	2022-02-02 02:44:28.732781+08	6	Jeans zw premium high waist ciga / size / XL	1	[{"added": {}}]	16	1
120	2022-02-02 02:44:41.444171+08	7	Basic asymmetrical t-shirt / color / white	1	[{"added": {}}]	16	1
121	2022-02-02 02:44:53.290714+08	8	Basic asymmetrical t-shirt / color / pink	1	[{"added": {}}]	16	1
122	2022-02-02 02:45:10.255504+08	9	Basic asymmetrical t-shirt / color / black	1	[{"added": {}}]	16	1
123	2022-02-02 02:45:16.393147+08	10	Basic asymmetrical t-shirt / size / S	1	[{"added": {}}]	16	1
124	2022-02-02 02:45:21.9537+08	11	Basic asymmetrical t-shirt / size / M	1	[{"added": {}}]	16	1
125	2022-02-02 02:45:28.379564+08	12	Basic asymmetrical t-shirt / size / L	1	[{"added": {}}]	16	1
126	2022-02-02 02:45:59.632878+08	13	Check shirt / size / M	1	[{"added": {}}]	16	1
127	2022-02-02 02:46:22.318091+08	14	Check shirt / color / white	1	[{"added": {}}]	16	1
128	2022-02-02 02:46:43.771434+08	15	Contrast metallic shirt / size / M	1	[{"added": {}}]	16	1
129	2022-02-02 02:46:50.855244+08	16	Contrast metallic shirt / size / L	1	[{"added": {}}]	16	1
130	2022-02-02 02:47:26.263365+08	17	Contrast metallic shirt / color / black	1	[{"added": {}}]	16	1
131	2022-02-02 02:48:05.498241+08	18	High-heel leather boots / size / 7	1	[{"added": {}}]	16	1
132	2022-02-02 02:48:11.506599+08	19	High-heel leather boots / size / 7.5	1	[{"added": {}}]	16	1
133	2022-02-02 02:48:17.047232+08	20	High-heel leather boots / size / 8	1	[{"added": {}}]	16	1
134	2022-02-02 02:48:28.480653+08	21	High-heel leather boots / size / 8.5	1	[{"added": {}}]	16	1
135	2022-02-02 02:48:34.878639+08	22	High-heel leather boots / size / 9	1	[{"added": {}}]	16	1
136	2022-02-02 02:48:51.298958+08	23	Soft leather high-heel boots / size / M	1	[{"added": {}}]	16	1
137	2022-02-02 02:49:32.979598+08	24	Soft leather high-heel boots / color / brown	1	[{"added": {}}]	16	1
138	2022-02-02 02:49:41.182621+08	25	Minimal collection long dress / size / M	1	[{"added": {}}]	16	1
139	2022-02-02 02:49:48.840248+08	26	Minimal collection long dress / color / white	1	[{"added": {}}]	16	1
140	2022-02-02 02:49:58.084971+08	27	Hooded coat / size / L	1	[{"added": {}}]	16	1
141	2022-02-02 02:50:07.221686+08	28	Hooded coat / color / brown	1	[{"added": {}}]	16	1
142	2022-02-02 02:50:15.289744+08	29	Basic asymmetrical t-shirt / size / S	1	[{"added": {}}]	16	1
143	2022-02-02 02:50:33.109331+08	30	Basic asymmetrical t-shirt / color / blu	1	[{"added": {}}]	16	1
144	2022-02-02 02:50:38.86225+08	30	Basic asymmetrical t-shirt / color / blue	2	[{"changed": {"fields": ["Detail"]}}]	16	1
145	2022-02-02 02:50:45.050776+08	31	Basic asymmetrical t-shirt / color / green	1	[{"added": {}}]	16	1
146	2022-02-02 02:58:04.07159+08	32	Basic asymmetrical t-shirt / size / XL	1	[{"added": {}}]	16	1
147	2022-02-02 02:58:14.34181+08	33	Basic asymmetrical t-shirt / color / red	1	[{"added": {}}]	16	1
148	2022-02-02 04:33:54.94415+08	34	Fleece jacket / color / brown	1	[{"added": {}}]	16	1
149	2022-02-02 04:34:02.577915+08	35	Flowing bomber jacket / size / L	1	[{"added": {}}]	16	1
150	2022-02-02 04:34:10.58603+08	36	Flowing bomber jacket / color / black	1	[{"added": {}}]	16	1
151	2022-02-02 04:34:18.402754+08	37	Flowing bomber jacket / size / XL	1	[{"added": {}}]	16	1
152	2022-02-02 04:34:30.125867+08	38	Frock coat with zips / color / black	1	[{"added": {}}]	16	1
153	2022-02-02 04:34:37.041046+08	39	Frock coat with zips / size / XL	1	[{"added": {}}]	16	1
154	2022-02-02 04:34:58.080582+08	40	Short check trench coat / color / gray	1	[{"added": {}}]	16	1
155	2022-02-02 04:35:03.906776+08	41	Short check trench coat / size / XL	1	[{"added": {}}]	16	1
156	2022-02-02 04:35:21.896176+08	42	Leather belt with square buckle / color / black	1	[{"added": {}}]	16	1
157	2022-02-02 04:35:39.143815+08	43	Leather belt with square buckle / size / default	1	[{"added": {}}]	16	1
158	2022-02-02 04:35:54.794966+08	44	Mirror lens cat eye sunglasses / color / default	1	[{"added": {}}]	16	1
159	2022-02-02 04:36:15.364235+08	45	Mirror lens cat eye sunglasses / size / default	1	[{"added": {}}]	16	1
160	2022-02-02 04:36:25.910062+08	46	Oversized poplin shirt / color / white	1	[{"added": {}}]	16	1
161	2022-02-02 04:36:31.447261+08	47	Oversized poplin shirt / size / XL	1	[{"added": {}}]	16	1
162	2022-02-02 04:36:38.812818+08	48	Round neck sweater / color / white	1	[{"added": {}}]	16	1
163	2022-02-02 04:36:45.814138+08	49	Round neck sweater / size / M	1	[{"added": {}}]	16	1
164	2022-02-02 04:36:54.685043+08	50	Scalloped leather court shoes / color / black	1	[{"added": {}}]	16	1
165	2022-02-02 04:37:03.957863+08	51	Scalloped leather court shoes / size / 7	1	[{"added": {}}]	16	1
166	2022-02-02 04:37:17.570439+08	52	Soft faux fur coat / color / white	1	[{"added": {}}]	16	1
167	2022-02-02 04:37:31.59856+08	53	Soft faux fur coat / size / L	1	[{"added": {}}]	16	1
168	2022-02-02 04:37:45.559909+08	54	Stretch t-shirt / color / blue	1	[{"added": {}}]	16	1
169	2022-02-02 04:37:54.83984+08	55	Stretch t-shirt / size / M	1	[{"added": {}}]	16	1
170	2022-02-02 04:38:02.301312+08	56	Textured faux shearling coat / color / white	1	[{"added": {}}]	16	1
171	2022-02-02 04:38:10.406932+08	57	Textured faux shearling coat / size / XL	1	[{"added": {}}]	16	1
172	2022-02-02 04:38:20.108675+08	58	Z1975 metallic jeans / color / blue	1	[{"added": {}}]	16	1
173	2022-02-02 04:38:26.9783+08	59	Z1975 metallic jeans / size / M	1	[{"added": {}}]	16	1
174	2022-02-02 04:38:34.940545+08	60	Ribbed knit sweater / color / gray	1	[{"added": {}}]	16	1
175	2022-02-02 04:38:40.765831+08	61	Ribbed knit sweater / size / L	1	[{"added": {}}]	16	1
176	2022-02-02 04:38:48.972035+08	62	Check asymmetric mini skirt / color / pink	1	[{"added": {}}]	16	1
177	2022-02-02 04:38:58.190913+08	63	Check asymmetric mini skirt / size / S	1	[{"added": {}}]	16	1
178	2022-02-02 04:39:10.675923+08	64	Leather stiletto-heel ankle boot / color / brown	1	[{"added": {}}]	16	1
179	2022-02-02 04:39:16.31363+08	65	Leather stiletto-heel ankle boot / size / 8	1	[{"added": {}}]	16	1
180	2022-02-02 04:39:25.950423+08	66	Leather strappy high-heel sandal / color / black	1	[{"added": {}}]	16	1
181	2022-02-02 04:39:31.663599+08	67	Leather strappy high-heel sandal / size / 8	1	[{"added": {}}]	16	1
182	2022-02-02 06:16:49.598583+08	4	Jeans zw premium high waist ciga (Jeans zw premium high waist ciga / color / blue, Jeans zw premium high waist ciga / size / S): 11/1	1	[{"added": {}}]	17	1
183	2022-02-02 06:17:24.355796+08	5	Jeans zw premium high waist ciga (Jeans zw premium high waist ciga / color / blue, Jeans zw premium high waist ciga / size / M): 22/12	1	[{"added": {}}]	17	1
184	2022-02-02 06:17:48.092167+08	6	Jeans zw premium high waist ciga (Jeans zw premium high waist ciga / color / blue, Jeans zw premium high waist ciga / size / L): 12/2	1	[{"added": {}}]	17	1
185	2022-02-02 06:18:07.470663+08	7	Jeans zw premium high waist ciga (Jeans zw premium high waist ciga / color / black, Jeans zw premium high waist ciga / size / S): 21/1	1	[{"added": {}}]	17	1
186	2022-02-06 19:05:24.662079+08	32	Jeans zw premium high waist ciga	2	[{"changed": {"fields": ["Description"]}}]	5	1
187	2022-02-06 19:41:41.777412+08	1	Jamison's cart	3		2	1
188	2022-02-06 19:43:24.026813+08	2	Jamison's cart	3		2	1
189	2022-02-14 10:32:34.920622+08	3	Bob	3		4	1
190	2022-02-14 10:34:08.260484+08	4	Bob	3		4	1
191	2022-02-15 03:36:01.471864+08	2	Jamison's order	3		8	1
192	2022-02-15 04:15:35.835229+08	6	123	3		4	1
193	2022-02-24 23:54:13.438946+08	5	Bob	3		4	1
194	2022-02-24 23:54:20.560877+08	1	Alice	3		4	1
195	2022-02-24 23:55:22.484391+08	2	Bing-Yang Chen	2	[{"changed": {"fields": ["Email"]}}]	4	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	shop	brand
2	shop	cart
3	shop	category
4	shop	customer
5	shop	product
6	shop	product_picture
7	shop	cart_item
9	admin	logentry
10	auth	permission
11	auth	group
12	auth	user
13	contenttypes	contenttype
14	sessions	session
15	shop	favorite_item
16	shop	product_specification
17	shop	inventory
8	shop	order
18	shop	order_item
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-12-19 00:45:26.114052+08
2	auth	0001_initial	2021-12-19 00:45:26.319052+08
3	admin	0001_initial	2021-12-19 00:45:26.378049+08
4	admin	0002_logentry_remove_auto_add	2021-12-19 00:45:26.394047+08
5	admin	0003_logentry_add_action_flag_choices	2021-12-19 00:45:26.41307+08
6	contenttypes	0002_remove_content_type_name	2021-12-19 00:45:26.46405+08
7	auth	0002_alter_permission_name_max_length	2021-12-19 00:45:26.478048+08
8	auth	0003_alter_user_email_max_length	2021-12-19 00:45:26.493048+08
9	auth	0004_alter_user_username_opts	2021-12-19 00:45:26.508049+08
10	auth	0005_alter_user_last_login_null	2021-12-19 00:45:26.528051+08
11	auth	0006_require_contenttypes_0002	2021-12-19 00:45:26.540078+08
12	auth	0007_alter_validators_add_error_messages	2021-12-19 00:45:26.561048+08
13	auth	0008_alter_user_username_max_length	2021-12-19 00:45:26.597051+08
14	auth	0009_alter_user_last_name_max_length	2021-12-19 00:45:26.621088+08
15	auth	0010_alter_group_name_max_length	2021-12-19 00:45:26.643047+08
16	auth	0011_update_proxy_permissions	2021-12-19 00:45:26.66105+08
17	auth	0012_alter_user_first_name_max_length	2021-12-19 00:45:26.680052+08
18	sessions	0001_initial	2021-12-19 00:45:26.721056+08
19	shop	0001_initial	2021-12-19 00:45:26.901051+08
20	shop	0002_auto_20211218_0412	2021-12-19 00:45:27.015047+08
21	shop	0003_cart_products	2021-12-19 00:45:27.02705+08
22	shop	0004_auto_20211220_1758	2021-12-20 17:59:37.419343+08
23	shop	0004_auto_20211220_1818	2021-12-20 18:18:51.52656+08
24	shop	0005_auto_20211221_0639	2021-12-21 06:39:19.295782+08
25	shop	0006_alter_product_description	2021-12-22 06:17:51.089161+08
26	shop	0007_product_quantity_sold	2022-01-04 23:11:06.731904+08
27	shop	0008_auto_20220127_2011	2022-01-30 13:10:35.804739+08
28	shop	0009_customer_token	2022-01-30 15:25:41.103722+08
29	shop	0010_favorite_item	2022-02-01 03:07:38.093721+08
30	shop	0011_auto_20220202_0240	2022-02-02 02:40:20.89446+08
31	shop	0012_auto_20220202_0339	2022-02-02 03:40:21.481082+08
44	shop	0013_auto_20220202_0615	2022-02-02 06:15:33.194592+08
45	shop	0014_auto_20220203_0531	2022-02-06 18:58:03.709697+08
46	shop	0015_auto_20220203_0536	2022-02-06 18:58:03.791694+08
47	shop	0016_alter_cart_total_costs	2022-02-06 18:58:03.805699+08
48	shop	0017_alter_cart_item_unique_together	2022-02-06 18:58:03.821696+08
49	shop	0018_auto_20220205_0546	2022-02-06 18:58:03.861696+08
50	shop	0019_auto_20220207_0651	2022-02-07 06:52:06.866399+08
51	shop	0020_auto_20220207_0700	2022-02-07 07:00:33.630955+08
52	shop	0021_auto_20220212_1438	2022-02-13 21:22:44.530467+08
53	shop	0022_auto_20220220_1149	2022-02-23 19:27:12.892262+08
54	shop	0023_alter_order_customer	2022-02-23 19:27:12.946268+08
55	shop	0024_auto_20220220_2326	2022-02-23 19:27:13.064286+08
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
ctva0623f5xxcijmpzygw6uuwfw7w5w7	.eJxVjEEOwiAQRe_C2pDCDCAu3fcMBGZGqZo2Ke3KeHfbpAvd_vfef6uU16WmtcmcBlYXZdTpdyuZnjLugB95vE-apnGZh6J3RR-06X5ieV0P9--g5la32pt8BsuAgYuXSNDdOkG0JgJEi86RBSJwSJ4jQhDm4DdqhND4AurzBb5wNt8:1mzR6Z:4sRkwfW9deyOfscqj0PVCD8zr0e437xtZgkhDW2_H4k	2022-01-04 06:26:03.495155+08
7azrbd7gr062r7pkk6d9jbywto12aahf	.eJxVjEEOwiAQRe_C2pDCDCAu3fcMBGZGqZo2Ke3KeHfbpAvd_vfef6uU16WmtcmcBlYXZdTpdyuZnjLugB95vE-apnGZh6J3RR-06X5ieV0P9--g5la32pt8BsuAgYuXSNDdOkG0JgJEi86RBSJwSJ4jQhDm4DdqhND4AurzBb5wNt8:1nB2kD:wemOOvtYGThA2s9K53la6k8sXAVW9bHuS8YG4iCSyx8	2022-02-05 06:50:57.95027+08
7wbfr2zcs2vinu47o0icfa4vn211g5e8	.eJxVjEEOwiAQRe_C2pDCDCAu3fcMBGZGqZo2Ke3KeHfbpAvd_vfef6uU16WmtcmcBlYXZdTpdyuZnjLugB95vE-apnGZh6J3RR-06X5ieV0P9--g5la32pt8BsuAgYuXSNDdOkG0JgJEi86RBSJwSJ4jQhDm4DdqhND4AurzBb5wNt8:1nE6Of:wv6ZMxLeQ70fcqp_biHqK3pwkoTiRj_cyp_ZihrL52M	2022-02-13 17:21:21.814725+08
2niynsx5m4tr9rtdo710946agxu45vu6	.eJxVjEEOwiAQRe_C2pDCDCAu3fcMBGZGqZo2Ke3KeHfbpAvd_vfef6uU16WmtcmcBlYXZdTpdyuZnjLugB95vE-apnGZh6J3RR-06X5ieV0P9--g5la32pt8BsuAgYuXSNDdOkG0JgJEi86RBSJwSJ4jQhDm4DdqhND4AurzBb5wNt8:1nE6e8:HzP_a6PssIDZw43SKMXUkcWQIB8lXQPng3CCOhwE5TU	2022-02-13 17:37:20.120758+08
yjhdbzo0wjbqd026eq5rba8umccw7d1x	.eJxVjEEOwiAQRe_C2pDCDCAu3fcMBGZGqZo2Ke3KeHfbpAvd_vfef6uU16WmtcmcBlYXZdTpdyuZnjLugB95vE-apnGZh6J3RR-06X5ieV0P9--g5la32pt8BsuAgYuXSNDdOkG0JgJEi86RBSJwSJ4jQhDm4DdqhND4AurzBb5wNt8:1nE6iV:noY6l-xSi4XwJrk1Lh-N2I_t62OoF2saYRDcitYLcrQ	2022-02-13 17:41:51.110626+08
z0jyv7ipwz8278wb52gwor1i05iklhl8	.eJxVjEEOwiAQRe_C2pDCDCAu3fcMBGZGqZo2Ke3KeHfbpAvd_vfef6uU16WmtcmcBlYXZdTpdyuZnjLugB95vE-apnGZh6J3RR-06X5ieV0P9--g5la32pt8BsuAgYuXSNDdOkG0JgJEi86RBSJwSJ4jQhDm4DdqhND4AurzBb5wNt8:1nE6ox:ogXidAtRXqEvq5X3LAJCG5qvJnWf-vg4sHQPpPZLKag	2022-02-13 17:48:31.55184+08
82zu0nx65ikbvaomci52oyarjvpdyqwi	.eJxVjEEOwiAQRe_C2pDCDCAu3fcMBGZGqZo2Ke3KeHfbpAvd_vfef6uU16WmtcmcBlYXZdTpdyuZnjLugB95vE-apnGZh6J3RR-06X5ieV0P9--g5la32pt8BsuAgYuXSNDdOkG0JgJEi86RBSJwSJ4jQhDm4DdqhND4AurzBb5wNt8:1nE70t:Rd2hG-bnZM42tEi2z6gzYjh0vLQLHkblaZ76W-lahBo	2022-02-13 18:00:51.556672+08
dk2z7x35zfpsbxmra8eutt10iyh453cm	.eJxVjEEOwiAQRe_C2pDCDCAu3fcMBGZGqZo2Ke3KeHfbpAvd_vfef6uU16WmtcmcBlYXZdTpdyuZnjLugB95vE-apnGZh6J3RR-06X5ieV0P9--g5la32pt8BsuAgYuXSNDdOkG0JgJEi86RBSJwSJ4jQhDm4DdqhND4AurzBb5wNt8:1nE739:xrguyjsboGpG2lf0KlWaGmgT8VSc2d5CIF8YMD9CxRc	2022-02-13 18:03:11.3886+08
r5m2mlt51aepb2cqgbx23dh60binmm35	.eJxVjEEOwiAQRe_C2pDCDCAu3fcMBGZGqZo2Ke3KeHfbpAvd_vfef6uU16WmtcmcBlYXZdTpdyuZnjLugB95vE-apnGZh6J3RR-06X5ieV0P9--g5la32pt8BsuAgYuXSNDdOkG0JgJEi86RBSJwSJ4jQhDm4DdqhND4AurzBb5wNt8:1nE771:zPGH0qkqUSB5y3uskSMP3oIhadFI6q3llSOHuKddlTQ	2022-02-13 18:07:11.131148+08
zafmq69gossjhcscy21o2nng2jkbi9wv	.eJxVjEEOwiAQRe_C2pDCDCAu3fcMBGZGqZo2Ke3KeHfbpAvd_vfef6uU16WmtcmcBlYXZdTpdyuZnjLugB95vE-apnGZh6J3RR-06X5ieV0P9--g5la32pt8BsuAgYuXSNDdOkG0JgJEi86RBSJwSJ4jQhDm4DdqhND4AurzBb5wNt8:1nE79Z:uUN-SPTWkZWS8YShm84uUkNDYpt-yyvTcLE0Tpr6tbk	2022-02-13 18:09:49.190165+08
egvwthzn57qebiw8wqyqq2m0hxs3tsjd	.eJxVjEEOwiAQRe_C2pDCDCAu3fcMBGZGqZo2Ke3KeHfbpAvd_vfef6uU16WmtcmcBlYXZdTpdyuZnjLugB95vE-apnGZh6J3RR-06X5ieV0P9--g5la32pt8BsuAgYuXSNDdOkG0JgJEi86RBSJwSJ4jQhDm4DdqhND4AurzBb5wNt8:1nE7QN:dLGKa65mG82dJvoUk3a_n5VgiFUtdGeAQorwaiEN8wA	2022-02-13 18:27:11.393947+08
eegph2if1vvi44m8fojdz9kdcfrpvu8z	.eJxVjEEOwiAQRe_C2pDCDCAu3fcMBGZGqZo2Ke3KeHfbpAvd_vfef6uU16WmtcmcBlYXZdTpdyuZnjLugB95vE-apnGZh6J3RR-06X5ieV0P9--g5la32pt8BsuAgYuXSNDdOkG0JgJEi86RBSJwSJ4jQhDm4DdqhND4AurzBb5wNt8:1nE7aW:GvFXaNF9Hf0oFG5x9kkGkYbacUbLkyAyRsP1qaC_Eu0	2022-02-13 18:37:40.905371+08
n6ystbmj0469kgwpu9zeu6p31d07frp8	.eJxVjEEOwiAQRe_C2pDCDCAu3fcMBGZGqZo2Ke3KeHfbpAvd_vfef6uU16WmtcmcBlYXZdTpdyuZnjLugB95vE-apnGZh6J3RR-06X5ieV0P9--g5la32pt8BsuAgYuXSNDdOkG0JgJEi86RBSJwSJ4jQhDm4DdqhND4AurzBb5wNt8:1nE7mu:4bkacA29zsxjd47CjPN0yBLizRnBLp7I4IF7p5fg9i0	2022-02-13 18:50:28.232417+08
7rc8f9scq27c9vjskmhrq4032sdggf3q	.eJxVjEEOwiAQRe_C2pDCDCAu3fcMBGZGqZo2Ke3KeHfbpAvd_vfef6uU16WmtcmcBlYXZdTpdyuZnjLugB95vE-apnGZh6J3RR-06X5ieV0P9--g5la32pt8BsuAgYuXSNDdOkG0JgJEi86RBSJwSJ4jQhDm4DdqhND4AurzBb5wNt8:1nE7oi:ZoMC0gzSxQ8eDEvJUJ_H5hqJu2rA91CwJQ7UNgDAEx4	2022-02-13 18:52:20.143763+08
jw8t0lmt8klq2ots5nwbkyrr48s3zzhp	.eJxVjEEOwiAQRe_C2pDCDCAu3fcMBGZGqZo2Ke3KeHfbpAvd_vfef6uU16WmtcmcBlYXZdTpdyuZnjLugB95vE-apnGZh6J3RR-06X5ieV0P9--g5la32pt8BsuAgYuXSNDdOkG0JgJEi86RBSJwSJ4jQhDm4DdqhND4AurzBb5wNt8:1nE7r5:G86mlzbgUI9N5xvL9Sd8hq_pzEWcZBR5XZfAJXr46fc	2022-02-13 18:54:47.837438+08
09tavik9p18flk9iqxlnwyeuz0fgq5q6	.eJxVjEEOwiAQRe_C2pDCDCAu3fcMBGZGqZo2Ke3KeHfbpAvd_vfef6uU16WmtcmcBlYXZdTpdyuZnjLugB95vE-apnGZh6J3RR-06X5ieV0P9--g5la32pt8BsuAgYuXSNDdOkG0JgJEi86RBSJwSJ4jQhDm4DdqhND4AurzBb5wNt8:1nE7s5:A41yTtci8J3e6n4DiFstrLm0B9moTqttLlBL45AqkaM	2022-02-13 18:55:49.51616+08
2uw1h4nsic584pymafe2fu6yf4ylj9ae	.eJxVjEEOwiAQRe_C2pDCDCAu3fcMBGZGqZo2Ke3KeHfbpAvd_vfef6uU16WmtcmcBlYXZdTpdyuZnjLugB95vE-apnGZh6J3RR-06X5ieV0P9--g5la32pt8BsuAgYuXSNDdOkG0JgJEi86RBSJwSJ4jQhDm4DdqhND4AurzBb5wNt8:1nE8OY:6_heMY-aSfMc5CULCkH1K546po8-Gbdm_z_Nw7EDZlk	2022-02-13 19:29:22.634948+08
h6lammdadqr3wu8junhxcmjf9e4192sf	.eJxVjEEOwiAQRe_C2pDCDCAu3fcMBGZGqZo2Ke3KeHfbpAvd_vfef6uU16WmtcmcBlYXZdTpdyuZnjLugB95vE-apnGZh6J3RR-06X5ieV0P9--g5la32pt8BsuAgYuXSNDdOkG0JgJEi86RBSJwSJ4jQhDm4DdqhND4AurzBb5wNt8:1nEHEz:eI6kttzRbfadecrX2eSqIzXG3KNr-9UF4pRWHR_73y8	2022-02-14 04:56:05.948973+08
xrwsy2nt8awz4lalgshh6zuni96vl556	.eJxVjEEOwiAQRe_C2pDCDCAu3fcMBGZGqZo2Ke3KeHfbpAvd_vfef6uU16WmtcmcBlYXZdTpdyuZnjLugB95vE-apnGZh6J3RR-06X5ieV0P9--g5la32pt8BsuAgYuXSNDdOkG0JgJEi86RBSJwSJ4jQhDm4DdqhND4AurzBb5wNt8:1nJFJp:urdOcZvl7RyB-MVVZAH4cWPVoJYgn6MFhro622ip4yU	2022-02-27 21:53:37.059745+08
n4pms4tbv3qiivv40ehtvcmi3042ud4a	.eJxVjEEOwiAQRe_C2pDCDCAu3fcMBGZGqZo2Ke3KeHfbpAvd_vfef6uU16WmtcmcBlYXZdTpdyuZnjLugB95vE-apnGZh6J3RR-06X5ieV0P9--g5la32pt8BsuAgYuXSNDdOkG0JgJEi86RBSJwSJ4jQhDm4DdqhND4AurzBb5wNt8:1nK520:G_r-kXBiaLUWc6N-djdyftirowRNklDW12_cMbxyWqI	2022-03-02 05:06:40.820612+08
28opl1k3oxqbrp88705y7dyopd17e9mc	.eJxVjDkOwjAQRe_iGllelFhDSc8ZrPEsOIBsKUuFuDtESgHtf-_9l8m4rTVvi8x5YnM23px-t4L0kLYDvmO7dUu9rfNU7K7Ygy722lmel8P9O6i41G-dYAQNkmAATcysLBBJyVMQFxhVoovEBZU5KoeAA_jgiiMigVHN-wMcZDm6:1nNGRJ:t44zqzTRlSA5a5tmBKmAskEIEv96VhgnkfzDjMwGw3c	2022-03-10 23:53:57.521201+08
\.


--
-- Data for Name: shop_brand; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shop_brand (id, name) FROM stdin;
5	MyBrand
\.


--
-- Data for Name: shop_cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shop_cart (id, total_costs, customer_id, freight, ready_to_checkout) FROM stdin;
6	45	2	5	f
\.


--
-- Data for Name: shop_cart_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shop_cart_item (id, quantity, subtotal_costs, cart_id, inventory_id) FROM stdin;
25	1	45	6	4
\.


--
-- Data for Name: shop_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shop_category (id, name) FROM stdin;
3	Blazers
4	Collection
5	Dresses
6	Jackets
7	Jeans
8	Jumpsuits
9	Knitwear
10	Sweatshirts
\.


--
-- Data for Name: shop_customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shop_customer (id, gender, email, phone_number, account_type, date_of_birth, password, name, token, is_email_verified) FROM stdin;
7	\N	jamisonforeverandever@gmail.com	0983990429	Normal	\N	123123123	Jamison	\N	t
2	Male	106208004@g.nccu.edu.tw	0983990429	Normal	1999-04-29	123123123	陳秉洋	PKHzBaMptbs3n6eFbfUBqFHOz8fO4tn87F7T0NPSE5LeEMGVKS1vwTmgUXG7MqEX	t
\.


--
-- Data for Name: shop_favorite_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shop_favorite_item (id, customer_id, product_id) FROM stdin;
54	2	31
55	2	32
\.


--
-- Data for Name: shop_inventory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shop_inventory (id, color_id, size_id, inventory, quantity_sold, product_id) FROM stdin;
6	1	5	12	2	32
7	2	3	20	2	32
5	1	4	21	13	32
4	1	3	8	4	32
\.


--
-- Data for Name: shop_order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shop_order (id, type, final_costs, paid_date, customer_id, address, arrived_date, picked_up_date, shipped_date, ordered_date, name_of_picker, phone_number_of_picker) FROM stdin;
1	Cash On Delivery	135	\N	2	7-11	\N	\N	\N	2022-02-14 10:56:59.248203+08	Jamison	0900000000
3	Cash On Delivery	50	\N	2	FamilyMart	\N	\N	\N	2022-02-15 04:33:33.546145+08	123	1
\.


--
-- Data for Name: shop_order_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shop_order_item (id, quantity, subtotal_costs, inventory_id, order_id) FROM stdin;
1	1	45	7	1
2	1	45	5	1
3	1	45	4	1
5	1	45	4	3
\.


--
-- Data for Name: shop_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shop_product (id, name, unit_price, description, brand_id, category_id) FROM stdin;
24	Basic asymmetrical t-shirt	34	Tall black leather boots. Maxi-fringing detail on the back. Pointed toes. Soft leg.  Fits skirts and dresses.	5	4
25	Check shirt	26	Fitted T-shirt in a polyamide blend. Featuring a wide round neckline and sleeves that reach below the elbow. Fits perfectly basic pants and skirts. Height of model: 175	5	4
26	Contrast metallic shirt	40	Coat with a collar with flaps. Long Sleeve. Indoor pockets on the seam line on the sides. Fastening to the indoor latch at the front.  Height of model: 178	5	4
30	High-heel leather boots	60	Ladies’ black ballerinas, made of high-quality nubuck and patent leather, are an exceptional version of a classic cut. Concealed wedge heels give an original character to the ballerinas.	5	4
34	Soft leather high-heel boots	75	Fitted T-shirt in a polyamide blend. Featuring a wide round neckline and sleeves that reach below the elbow. Fits perfectly basic pants and skirts.	5	4
35	Minimal collection long dress	44	Ladies’ black ballerinas, made of high-quality nubuck and patent leather, are an exceptional version of a classic cut. Concealed wedge heels give an original character to the ballerinas.	5	5
31	Hooded coat	53	Ladies’ black ballerinas, made of high-quality nubuck and patent leather, are an exceptional version of a classic cut. Concealed wedge heels give an original character to the ballerinas.	5	6
23	Basic asymmetrical t-shirt	34	Loose-fitting T-shirt with V-neckline and short sleeves. Fits perfectly basic pants and skirts. Care for fiber: TENCEL Lyocell.	5	4
22	Basic asymmetrical t-shirt	34	Round neck T-shirt with short sleeves. Features a photographic print with bead appliques. Fashion has always been so temporary and uncertain. You can’t keep up with it? This social phenomenon is very whimsical.	5	4
27	Fleece jacket	34	Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation.	5	6
28	Flowing bomber jacket	40	Round neck T-shirt with short sleeves. Features a photographic print with bead appliques. Fashion has always been so temporary and uncertain. You can’t keep up with it?	5	6
29	Frock coat with zips	47	Mustard yellow crossbody bag in contrasting materials. Split suede foldover flap and front body. Gold metal hardware. Long adjustable strap. Lined interior. Round metal piece for fastening.	5	6
17	Short check trench coat	73	Loose-fitting T-shirt with V-neckline and short sleeves. Fits perfectly basic pants and skirts. Care for fiber: TENCEL Lyocell.	5	6
12	Leather belt with square buckle	25		5	4
13	Mirror lens cat eye sunglasses	40	Ladies’ black ballerinas, made of high-quality nubuck and patent leather, are an exceptional version of a classic cut. Concealed wedge heels give an original character to the ballerinas.	5	4
14	Oversized poplin shirt	54	Loose-fitting T-shirt with V-neckline and short sleeves. Fits perfectly basic pants and skirts. Care for fiber: TENCEL Lyocell.	5	4
15	Round neck sweater	35	Mustard yellow crossbody bag in contrasting materials. Split suede foldover flap and front body. Gold metal hardware. Long adjustable strap. Lined interior. Round metal piece for fastening.	5	9
16	Scalloped leather court shoes	55	Flat shoes are available in several colors. Tassel details on the front. Fit perfectly for daily use. Stylish and attractive.	5	4
18	Soft faux fur coat	90	Fitted T-shirt in a polyamide blend. Featuring a wide round neckline and sleeves that reach below the elbow. Fits perfectly basic pants and skirts.	5	6
19	Stretch t-shirt	25	Loose-fitting T-shirt with V-neckline and short sleeves. Fits perfectly basic pants and skirts. Care for fiber: TENCEL Lyocell.	5	10
20	Textured faux shearling coat	75	Loose-fitting T-shirt with V-neckline and short sleeves. Fits perfectly basic pants and skirts. Care for fiber: TENCEL Lyocell.	5	6
21	Z1975 metallic jeans	45	Round neck T-shirt with short sleeves. Features a photographic print with bead appliques. Fashion has always been so temporary and uncertain. You can’t keep up with it? This social phenomenon is very whimsical.	5	7
33	Ribbed knit sweater	44	Ladies’ black ballerinas, made of high-quality nubuck and patent leather, are an exceptional version of a classic cut. Concealed wedge heels give an original character to the ballerinas.	5	9
36	Check asymmetric mini skirt	34	Flat shoes are available in several colors. Tassel details on the front. Fit perfectly for daily use. Stylish and attractive.	5	5
37	Leather stiletto-heel ankle boot	57	Fitted T-shirt in a polyamide blend. Featuring a wide round neckline and sleeves that reach below the elbow. Fits perfectly basic pants and skirts.	5	4
38	Leather strappy high-heel sandal	30	Fitted T-shirt in a polyamide blend. Featuring a wide round neckline and sleeves that reach below the elbow. Fits perfectly basic pants and skirts.	5	4
32	Jeans zw premium high waist ciga	45	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras finibus leo nec neque auctor, vitae tincidunt odio dictum. Sed a interdum urna. Vivamus sit amet massa dolor.	5	7
\.


--
-- Data for Name: shop_product_picture; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shop_product_picture (id, product_id, picture, specification_id) FROM stdin;
\.


--
-- Data for Name: shop_product_specification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shop_product_specification (id, "group", detail, product_id) FROM stdin;
1	color	blue	32
2	color	black	32
3	size	S	32
4	size	M	32
5	size	L	32
6	size	XL	32
7	color	white	24
8	color	pink	24
9	color	black	24
10	size	S	24
11	size	M	24
12	size	L	24
13	size	M	25
14	color	white	25
15	size	M	26
16	size	L	26
17	color	black	26
18	size	7	30
19	size	7.5	30
20	size	8	30
21	size	8.5	30
22	size	9	30
23	size	M	34
24	color	brown	34
25	size	M	35
26	color	white	35
27	size	L	31
28	color	brown	31
29	size	S	23
30	color	blue	23
31	color	green	23
32	size	XL	22
33	color	red	22
34	color	brown	27
35	size	L	28
36	color	black	28
37	size	XL	28
38	color	black	29
39	size	XL	29
40	color	gray	17
41	size	XL	17
42	color	black	12
43	size	default	12
44	color	default	13
45	size	default	13
46	color	white	14
47	size	XL	14
48	color	white	15
49	size	M	15
50	color	black	16
51	size	7	16
52	color	white	18
53	size	L	18
54	color	blue	19
55	size	M	19
56	color	white	20
57	size	XL	20
58	color	blue	21
59	size	M	21
60	color	gray	33
61	size	L	33
62	color	pink	36
63	size	S	36
64	color	brown	37
65	size	8	37
66	color	black	38
67	size	8	38
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 76, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 195, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 18, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 55, true);


--
-- Name: shop_brand_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shop_brand_id_seq', 5, true);


--
-- Name: shop_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shop_cart_id_seq', 6, true);


--
-- Name: shop_cart_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shop_cart_item_id_seq', 25, true);


--
-- Name: shop_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shop_category_id_seq', 10, true);


--
-- Name: shop_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shop_customer_id_seq', 7, true);


--
-- Name: shop_favorite_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shop_favorite_item_id_seq', 55, true);


--
-- Name: shop_inventory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shop_inventory_id_seq', 7, true);


--
-- Name: shop_order_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shop_order_item_id_seq', 5, true);


--
-- Name: shop_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shop_payment_id_seq', 3, true);


--
-- Name: shop_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shop_product_id_seq', 38, true);


--
-- Name: shop_product_picture_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shop_product_picture_id_seq', 1, false);


--
-- Name: shop_product_specification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shop_product_specification_id_seq', 67, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: shop_brand shop_brand_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_brand
    ADD CONSTRAINT shop_brand_pkey PRIMARY KEY (id);


--
-- Name: shop_cart shop_cart_customer_id_f4c598f5_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_cart
    ADD CONSTRAINT shop_cart_customer_id_f4c598f5_uniq UNIQUE (customer_id);


--
-- Name: shop_cart_item shop_cart_item_inventory_id_cart_id_086d83d6_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_cart_item
    ADD CONSTRAINT shop_cart_item_inventory_id_cart_id_086d83d6_uniq UNIQUE (inventory_id, cart_id);


--
-- Name: shop_cart_item shop_cart_item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_cart_item
    ADD CONSTRAINT shop_cart_item_pkey PRIMARY KEY (id);


--
-- Name: shop_cart shop_cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_cart
    ADD CONSTRAINT shop_cart_pkey PRIMARY KEY (id);


--
-- Name: shop_category shop_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_category
    ADD CONSTRAINT shop_category_pkey PRIMARY KEY (id);


--
-- Name: shop_customer shop_customer_email_d3fdf104_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_customer
    ADD CONSTRAINT shop_customer_email_d3fdf104_uniq UNIQUE (email);


--
-- Name: shop_customer shop_customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_customer
    ADD CONSTRAINT shop_customer_pkey PRIMARY KEY (id);


--
-- Name: shop_customer shop_customer_token_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_customer
    ADD CONSTRAINT shop_customer_token_key UNIQUE (token);


--
-- Name: shop_favorite_item shop_favorite_item_customer_id_product_id_41ce4777_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_favorite_item
    ADD CONSTRAINT shop_favorite_item_customer_id_product_id_41ce4777_uniq UNIQUE (customer_id, product_id);


--
-- Name: shop_favorite_item shop_favorite_item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_favorite_item
    ADD CONSTRAINT shop_favorite_item_pkey PRIMARY KEY (id);


--
-- Name: shop_inventory shop_inventory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_inventory
    ADD CONSTRAINT shop_inventory_pkey PRIMARY KEY (id);


--
-- Name: shop_inventory shop_inventory_product_id_color_size_f6ebd228_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_inventory
    ADD CONSTRAINT shop_inventory_product_id_color_size_f6ebd228_uniq UNIQUE (product_id, color_id, size_id);


--
-- Name: shop_order_item shop_order_item_inventory_id_order_id_1f400925_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_order_item
    ADD CONSTRAINT shop_order_item_inventory_id_order_id_1f400925_uniq UNIQUE (inventory_id, order_id);


--
-- Name: shop_order_item shop_order_item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_order_item
    ADD CONSTRAINT shop_order_item_pkey PRIMARY KEY (id);


--
-- Name: shop_order shop_payment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_order
    ADD CONSTRAINT shop_payment_pkey PRIMARY KEY (id);


--
-- Name: shop_product_picture shop_product_picture_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_product_picture
    ADD CONSTRAINT shop_product_picture_pkey PRIMARY KEY (id);


--
-- Name: shop_product shop_product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_product
    ADD CONSTRAINT shop_product_pkey PRIMARY KEY (id);


--
-- Name: shop_product_specification shop_product_specificati_product_id_group_detail_14aedbca_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_product_specification
    ADD CONSTRAINT shop_product_specificati_product_id_group_detail_14aedbca_uniq UNIQUE (product_id, "group", detail);


--
-- Name: shop_product_specification shop_product_specification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_product_specification
    ADD CONSTRAINT shop_product_specification_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: shop_cart_item_cart_id_e5f5126c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_cart_item_cart_id_e5f5126c ON public.shop_cart_item USING btree (cart_id);


--
-- Name: shop_cart_item_inventory_id_0a31c309; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_cart_item_inventory_id_0a31c309 ON public.shop_cart_item USING btree (inventory_id);


--
-- Name: shop_customer_email_d3fdf104_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_customer_email_d3fdf104_like ON public.shop_customer USING btree (email varchar_pattern_ops);


--
-- Name: shop_customer_token_8bd9a9bf_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_customer_token_8bd9a9bf_like ON public.shop_customer USING btree (token varchar_pattern_ops);


--
-- Name: shop_favorite_item_customer_id_8fad2bf4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_favorite_item_customer_id_8fad2bf4 ON public.shop_favorite_item USING btree (customer_id);


--
-- Name: shop_favorite_item_product_id_ef38feba; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_favorite_item_product_id_ef38feba ON public.shop_favorite_item USING btree (product_id);


--
-- Name: shop_inventory_color_id_9bae196d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_inventory_color_id_9bae196d ON public.shop_inventory USING btree (color_id);


--
-- Name: shop_inventory_product_id_17905599; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_inventory_product_id_17905599 ON public.shop_inventory USING btree (product_id);


--
-- Name: shop_inventory_size_id_fd814fbc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_inventory_size_id_fd814fbc ON public.shop_inventory USING btree (size_id);


--
-- Name: shop_order_item_inventory_id_c571028f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_order_item_inventory_id_c571028f ON public.shop_order_item USING btree (inventory_id);


--
-- Name: shop_order_item_payment_id_13c2a47e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_order_item_payment_id_13c2a47e ON public.shop_order_item USING btree (order_id);


--
-- Name: shop_payment_customer_id_5500af9d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_payment_customer_id_5500af9d ON public.shop_order USING btree (customer_id);


--
-- Name: shop_product_brand_id_505fec11; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_product_brand_id_505fec11 ON public.shop_product USING btree (brand_id);


--
-- Name: shop_product_category_id_14d7eea8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_product_category_id_14d7eea8 ON public.shop_product USING btree (category_id);


--
-- Name: shop_product_picture_product_id_5a50a7ab; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_product_picture_product_id_5a50a7ab ON public.shop_product_picture USING btree (product_id);


--
-- Name: shop_product_picture_specification_id_8fc25708; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_product_picture_specification_id_8fc25708 ON public.shop_product_picture USING btree (specification_id);


--
-- Name: shop_product_specification_product_id_dfbb6a87; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_product_specification_product_id_dfbb6a87 ON public.shop_product_specification USING btree (product_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_cart shop_cart_customer_id_f4c598f5_fk_shop_customer_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_cart
    ADD CONSTRAINT shop_cart_customer_id_f4c598f5_fk_shop_customer_id FOREIGN KEY (customer_id) REFERENCES public.shop_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_cart_item shop_cart_item_cart_id_e5f5126c_fk_shop_cart_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_cart_item
    ADD CONSTRAINT shop_cart_item_cart_id_e5f5126c_fk_shop_cart_id FOREIGN KEY (cart_id) REFERENCES public.shop_cart(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_cart_item shop_cart_item_inventory_id_0a31c309_fk_shop_inventory_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_cart_item
    ADD CONSTRAINT shop_cart_item_inventory_id_0a31c309_fk_shop_inventory_id FOREIGN KEY (inventory_id) REFERENCES public.shop_inventory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_favorite_item shop_favorite_item_customer_id_8fad2bf4_fk_shop_customer_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_favorite_item
    ADD CONSTRAINT shop_favorite_item_customer_id_8fad2bf4_fk_shop_customer_id FOREIGN KEY (customer_id) REFERENCES public.shop_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_favorite_item shop_favorite_item_product_id_ef38feba_fk_shop_product_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_favorite_item
    ADD CONSTRAINT shop_favorite_item_product_id_ef38feba_fk_shop_product_id FOREIGN KEY (product_id) REFERENCES public.shop_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_inventory shop_inventory_color_id_9bae196d_fk_shop_prod; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_inventory
    ADD CONSTRAINT shop_inventory_color_id_9bae196d_fk_shop_prod FOREIGN KEY (color_id) REFERENCES public.shop_product_specification(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_inventory shop_inventory_product_id_17905599_fk_shop_product_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_inventory
    ADD CONSTRAINT shop_inventory_product_id_17905599_fk_shop_product_id FOREIGN KEY (product_id) REFERENCES public.shop_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_inventory shop_inventory_size_id_fd814fbc_fk_shop_prod; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_inventory
    ADD CONSTRAINT shop_inventory_size_id_fd814fbc_fk_shop_prod FOREIGN KEY (size_id) REFERENCES public.shop_product_specification(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_order_item shop_order_item_inventory_id_c571028f_fk_shop_inventory_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_order_item
    ADD CONSTRAINT shop_order_item_inventory_id_c571028f_fk_shop_inventory_id FOREIGN KEY (inventory_id) REFERENCES public.shop_inventory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_order_item shop_order_item_order_id_fb1c4e35_fk_shop_order_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_order_item
    ADD CONSTRAINT shop_order_item_order_id_fb1c4e35_fk_shop_order_id FOREIGN KEY (order_id) REFERENCES public.shop_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_order shop_payment_customer_id_5500af9d_fk_shop_customer_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_order
    ADD CONSTRAINT shop_payment_customer_id_5500af9d_fk_shop_customer_id FOREIGN KEY (customer_id) REFERENCES public.shop_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_product shop_product_brand_id_505fec11_fk_shop_brand_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_product
    ADD CONSTRAINT shop_product_brand_id_505fec11_fk_shop_brand_id FOREIGN KEY (brand_id) REFERENCES public.shop_brand(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_product shop_product_category_id_14d7eea8_fk_shop_category_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_product
    ADD CONSTRAINT shop_product_category_id_14d7eea8_fk_shop_category_id FOREIGN KEY (category_id) REFERENCES public.shop_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_product_picture shop_product_picture_product_id_5a50a7ab_fk_shop_product_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_product_picture
    ADD CONSTRAINT shop_product_picture_product_id_5a50a7ab_fk_shop_product_id FOREIGN KEY (product_id) REFERENCES public.shop_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_product_picture shop_product_picture_specification_id_8fc25708_fk_shop_prod; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_product_picture
    ADD CONSTRAINT shop_product_picture_specification_id_8fc25708_fk_shop_prod FOREIGN KEY (specification_id) REFERENCES public.shop_product_specification(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_product_specification shop_product_specifi_product_id_dfbb6a87_fk_shop_prod; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_product_specification
    ADD CONSTRAINT shop_product_specifi_product_id_dfbb6a87_fk_shop_prod FOREIGN KEY (product_id) REFERENCES public.shop_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

