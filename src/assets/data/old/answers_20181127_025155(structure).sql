--
-- PostgreSQL database dump
--

-- Dumped from database version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 11.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: survey_api_prod; Type: DATABASE; Schema: -; Owner: survey_admin
--

CREATE DATABASE survey_api_prod WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';


ALTER DATABASE survey_api_prod OWNER TO survey_admin;

\connect survey_api_prod

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: answers; Type: TABLE; Schema: public; Owner: survey_admin
--

CREATE TABLE public.answers (
    id bigint NOT NULL,
    pseudonym character varying(255),
    user_id integer,
    survey_id integer,
    survey_answers jsonb,
    inserted_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.answers OWNER TO survey_admin;

--
-- Name: answers_id_seq; Type: SEQUENCE; Schema: public; Owner: survey_admin
--

CREATE SEQUENCE public.answers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.answers_id_seq OWNER TO survey_admin;

--
-- Name: answers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: survey_admin
--

ALTER SEQUENCE public.answers_id_seq OWNED BY public.answers.id;


--
-- Name: surveys; Type: TABLE; Schema: public; Owner: survey_admin
--

CREATE TABLE public.surveys (
    id bigint NOT NULL,
    name character varying(255),
    survey_id integer,
    survey_design jsonb,
    inserted_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.surveys OWNER TO survey_admin;

--
-- Name: surveys_id_seq; Type: SEQUENCE; Schema: public; Owner: survey_admin
--

CREATE SEQUENCE public.surveys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.surveys_id_seq OWNER TO survey_admin;

--
-- Name: surveys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: survey_admin
--

ALTER SEQUENCE public.surveys_id_seq OWNED BY public.surveys.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: survey_admin
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    pseudonym character varying(255),
    user_id integer,
    inserted_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.users OWNER TO survey_admin;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: survey_admin
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO survey_admin;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: survey_admin
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: answers id; Type: DEFAULT; Schema: public; Owner: survey_admin
--

ALTER TABLE ONLY public.answers ALTER COLUMN id SET DEFAULT nextval('public.answers_id_seq'::regclass);


--
-- Name: surveys id; Type: DEFAULT; Schema: public; Owner: survey_admin
--

ALTER TABLE ONLY public.surveys ALTER COLUMN id SET DEFAULT nextval('public.surveys_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: survey_admin
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: answers answers_pkey; Type: CONSTRAINT; Schema: public; Owner: survey_admin
--

ALTER TABLE ONLY public.answers
    ADD CONSTRAINT answers_pkey PRIMARY KEY (id);


--
-- Name: surveys surveys_pkey; Type: CONSTRAINT; Schema: public; Owner: survey_admin
--

ALTER TABLE ONLY public.surveys
    ADD CONSTRAINT surveys_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: survey_admin
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

