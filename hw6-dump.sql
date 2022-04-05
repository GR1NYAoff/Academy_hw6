--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Debian 12.9-1.pgdg110+1)
-- Dumped by pg_dump version 12.8

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

DROP DATABASE IF EXISTS hw6;
--
-- Name: hw6; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE hw6 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE hw6 OWNER TO postgres;

\connect hw6

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
-- Name: currency; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.currency (
    id integer NOT NULL,
    name character varying(3) NOT NULL
);


ALTER TABLE public.currency OWNER TO postgres;

--
-- Name: currency_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.currency_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.currency_id_seq OWNER TO postgres;

--
-- Name: currency_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.currency_id_seq OWNED BY public.currency.id;


--
-- Name: direction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.direction (
    id integer NOT NULL,
    name character varying(7) NOT NULL
);


ALTER TABLE public.direction OWNER TO postgres;

--
-- Name: direction_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.direction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.direction_id_seq OWNER TO postgres;

--
-- Name: direction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.direction_id_seq OWNED BY public.direction.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    user_id integer,
    direction_id integer,
    currency_id integer,
    amount numeric(10,2),
    comment text,
    status_id integer,
    create_date timestamp without time zone
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_full; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.orders_full AS
SELECT
    NULL::integer AS id,
    NULL::text AS "user",
    NULL::numeric(10,2) AS amount,
    NULL::character varying(3) AS currency,
    NULL::character varying(7) AS direction,
    NULL::character varying(50) AS status,
    NULL::timestamp without time zone AS create_date,
    NULL::text AS comment;


ALTER TABLE public.orders_full OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.status (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.status OWNER TO postgres;

--
-- Name: status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.status_id_seq OWNER TO postgres;

--
-- Name: status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.status_id_seq OWNED BY public.status.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    email character varying(50) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: currency id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.currency ALTER COLUMN id SET DEFAULT nextval('public.currency_id_seq'::regclass);


--
-- Name: direction id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.direction ALTER COLUMN id SET DEFAULT nextval('public.direction_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: status id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.status ALTER COLUMN id SET DEFAULT nextval('public.status_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: currency currency_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.currency
    ADD CONSTRAINT currency_pk PRIMARY KEY (id);


--
-- Name: direction direction_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.direction
    ADD CONSTRAINT direction_pk PRIMARY KEY (id);


--
-- Name: orders orders_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pk PRIMARY KEY (id);


--
-- Name: status status_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.status
    ADD CONSTRAINT status_pk PRIMARY KEY (id);


--
-- Name: users users_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pk PRIMARY KEY (id);


--
-- Name: currency_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX currency_id_uindex ON public.currency USING btree (id);


--
-- Name: currency_name_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX currency_name_uindex ON public.currency USING btree (name);


--
-- Name: direction_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX direction_id_uindex ON public.direction USING btree (id);


--
-- Name: direction_name_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX direction_name_uindex ON public.direction USING btree (name);


--
-- Name: orders_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX orders_id_uindex ON public.orders USING btree (id);


--
-- Name: status_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX status_id_uindex ON public.status USING btree (id);


--
-- Name: status_name_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX status_name_uindex ON public.status USING btree (name);


--
-- Name: users_email_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX users_email_uindex ON public.users USING btree (email);


--
-- Name: users_first_name_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX users_first_name_uindex ON public.users USING btree (first_name);


--
-- Name: users_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX users_id_uindex ON public.users USING btree (id);


--
-- Name: users_last_name_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX users_last_name_uindex ON public.users USING btree (last_name);


--
-- Name: orders_full _RETURN; Type: RULE; Schema: public; Owner: postgres
--

CREATE OR REPLACE VIEW public.orders_full AS
 SELECT o.id,
    ( SELECT concat(u.first_name, ' ', u.last_name) AS full_name
           FROM public.users u
          WHERE (o.user_id = u.id)
          GROUP BY u.id) AS "user",
    o.amount,
    ( SELECT c.name
           FROM public.currency c
          WHERE (o.currency_id = c.id)
          GROUP BY c.name) AS currency,
    ( SELECT d.name
           FROM public.direction d
          WHERE (o.direction_id = d.id)
          GROUP BY d.name) AS direction,
    ( SELECT s.name
           FROM public.status s
          WHERE (o.status_id = s.id)
          GROUP BY s.name) AS status,
    o.create_date,
    o.comment
   FROM public.orders o
  GROUP BY o.id, o.amount, ( SELECT c.name
           FROM public.currency c
          WHERE (o.currency_id = c.id)
          GROUP BY c.name), ( SELECT d.name
           FROM public.direction d
          WHERE (o.direction_id = d.id)
          GROUP BY d.name), ( SELECT s.name
           FROM public.status s
          WHERE (o.status_id = s.id)
          GROUP BY s.name), o.create_date, o.comment;


--
-- PostgreSQL database dump complete
--

