--
-- PostgreSQL database dump
--

-- Dumped from database version 13.10
-- Dumped by pg_dump version 15.4 (Debian 15.4-1.pgdg110+1)

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
-- Name: public; Type: SCHEMA; Schema: -; Owner: mdatamanager
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO mdatamanager;

--
-- Name: fuzzystrmatch; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS fuzzystrmatch WITH SCHEMA public;


--
-- Name: EXTENSION fuzzystrmatch; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION fuzzystrmatch IS 'determine similarities and distance between strings';


--
-- Name: pg_trgm; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_trgm WITH SCHEMA public;


--
-- Name: EXTENSION pg_trgm; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_trgm IS 'text similarity measurement and index searching based on trigrams';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: queue_classic_notify(); Type: FUNCTION; Schema: public; Owner: mdatamanager
--

CREATE FUNCTION public.queue_classic_notify() RETURNS trigger
    LANGUAGE plpgsql
    AS $$ BEGIN
  perform pg_notify(new.q_name, ''); RETURN NULL;
END $$;


ALTER FUNCTION public.queue_classic_notify() OWNER TO mdatamanager;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: active_admin_comments; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.active_admin_comments (
    id bigint NOT NULL,
    namespace character varying,
    body text,
    resource_type character varying,
    resource_id bigint,
    author_type character varying,
    author_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.active_admin_comments OWNER TO mdatamanager;

--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.active_admin_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_admin_comments_id_seq OWNER TO mdatamanager;

--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.active_admin_comments_id_seq OWNED BY public.active_admin_comments.id;


--
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.active_storage_attachments OWNER TO mdatamanager;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_attachments_id_seq OWNER TO mdatamanager;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    byte_size bigint NOT NULL,
    checksum character varying NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.active_storage_blobs OWNER TO mdatamanager;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_blobs_id_seq OWNER TO mdatamanager;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: admin_users; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.admin_users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.admin_users OWNER TO mdatamanager;

--
-- Name: admin_users_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.admin_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_users_id_seq OWNER TO mdatamanager;

--
-- Name: admin_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.admin_users_id_seq OWNED BY public.admin_users.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO mdatamanager;

--
-- Name: availabilities; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.availabilities (
    id bigint NOT NULL,
    specialist_id bigint NOT NULL,
    days integer[] DEFAULT '{}'::integer[],
    start_time time without time zone,
    end_time time without time zone,
    schedule_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.availabilities OWNER TO mdatamanager;

--
-- Name: availabilities_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.availabilities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.availabilities_id_seq OWNER TO mdatamanager;

--
-- Name: availabilities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.availabilities_id_seq OWNED BY public.availabilities.id;


--
-- Name: bookings; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.bookings (
    id bigint NOT NULL,
    uid text,
    specialist_id bigint NOT NULL,
    event_id bigint NOT NULL,
    title text,
    description text,
    start_time timestamp without time zone,
    end_time timestamp without time zone,
    status character varying,
    paid boolean,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    personable_type character varying NOT NULL,
    personable_id bigint NOT NULL
);


ALTER TABLE public.bookings OWNER TO mdatamanager;

--
-- Name: bookings_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.bookings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bookings_id_seq OWNER TO mdatamanager;

--
-- Name: bookings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.bookings_id_seq OWNED BY public.bookings.id;


--
-- Name: catalog_area_codes_level_1; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.catalog_area_codes_level_1 (
    id bigint NOT NULL,
    level integer,
    region_code character varying,
    region_name character varying,
    sub_region_code integer,
    sub_region_name character varying,
    iadb_region_code character varying,
    iadb_region_name character varying,
    intermediate_region_code integer,
    intermediate_region_name character varying,
    country_name_en character varying,
    country_name_es character varying,
    m49code integer,
    isoalpha2 character varying,
    isoalpha3 character varying,
    subregion_name character varying,
    subregion_type character varying,
    iso3166_2 character varying,
    "FIPS" character varying,
    "HASC" character varying,
    ine01_2020 integer,
    keywords character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.catalog_area_codes_level_1 OWNER TO mdatamanager;

--
-- Name: catalog_area_codes_level_1_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.catalog_area_codes_level_1_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.catalog_area_codes_level_1_id_seq OWNER TO mdatamanager;

--
-- Name: catalog_area_codes_level_1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.catalog_area_codes_level_1_id_seq OWNED BY public.catalog_area_codes_level_1.id;


--
-- Name: catalog_entity_type; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.catalog_entity_type (
    id bigint NOT NULL,
    description character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.catalog_entity_type OWNER TO mdatamanager;

--
-- Name: catalog_entity_type_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.catalog_entity_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.catalog_entity_type_id_seq OWNER TO mdatamanager;

--
-- Name: catalog_entity_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.catalog_entity_type_id_seq OWNED BY public.catalog_entity_type.id;


--
-- Name: catalog_form; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.catalog_form (
    id bigint NOT NULL,
    data_type character varying,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.catalog_form OWNER TO mdatamanager;

--
-- Name: catalog_form_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.catalog_form_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.catalog_form_id_seq OWNER TO mdatamanager;

--
-- Name: catalog_form_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.catalog_form_id_seq OWNED BY public.catalog_form.id;


--
-- Name: catalog_general_procedures; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.catalog_general_procedures (
    id bigint NOT NULL,
    description character varying
);


ALTER TABLE public.catalog_general_procedures OWNER TO mdatamanager;

--
-- Name: catalog_general_procedures_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.catalog_general_procedures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.catalog_general_procedures_id_seq OWNER TO mdatamanager;

--
-- Name: catalog_general_procedures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.catalog_general_procedures_id_seq OWNED BY public.catalog_general_procedures.id;


--
-- Name: catalog_instances_interest; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.catalog_instances_interest (
    id bigint NOT NULL,
    description character varying
);


ALTER TABLE public.catalog_instances_interest OWNER TO mdatamanager;

--
-- Name: catalog_instances_interest_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.catalog_instances_interest_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.catalog_instances_interest_id_seq OWNER TO mdatamanager;

--
-- Name: catalog_instances_interest_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.catalog_instances_interest_id_seq OWNED BY public.catalog_instances_interest.id;


--
-- Name: catalog_institutions; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.catalog_institutions (
    id bigint NOT NULL,
    description character varying
);


ALTER TABLE public.catalog_institutions OWNER TO mdatamanager;

--
-- Name: catalog_institutions_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.catalog_institutions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.catalog_institutions_id_seq OWNER TO mdatamanager;

--
-- Name: catalog_institutions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.catalog_institutions_id_seq OWNED BY public.catalog_institutions.id;


--
-- Name: catalog_jurisdiction; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.catalog_jurisdiction (
    id bigint NOT NULL,
    description character varying
);


ALTER TABLE public.catalog_jurisdiction OWNER TO mdatamanager;

--
-- Name: catalog_jurisdiction_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.catalog_jurisdiction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.catalog_jurisdiction_id_seq OWNER TO mdatamanager;

--
-- Name: catalog_jurisdiction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.catalog_jurisdiction_id_seq OWNED BY public.catalog_jurisdiction.id;


--
-- Name: catalog_languages; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.catalog_languages (
    id bigint NOT NULL,
    description character varying
);


ALTER TABLE public.catalog_languages OWNER TO mdatamanager;

--
-- Name: catalog_languages_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.catalog_languages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.catalog_languages_id_seq OWNER TO mdatamanager;

--
-- Name: catalog_languages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.catalog_languages_id_seq OWNED BY public.catalog_languages.id;


--
-- Name: catalog_legal_services; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.catalog_legal_services (
    id bigint NOT NULL,
    description character varying
);


ALTER TABLE public.catalog_legal_services OWNER TO mdatamanager;

--
-- Name: catalog_legal_services_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.catalog_legal_services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.catalog_legal_services_id_seq OWNER TO mdatamanager;

--
-- Name: catalog_legal_services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.catalog_legal_services_id_seq OWNED BY public.catalog_legal_services.id;


--
-- Name: catalog_matter; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.catalog_matter (
    id bigint NOT NULL,
    description character varying
);


ALTER TABLE public.catalog_matter OWNER TO mdatamanager;

--
-- Name: catalog_matter_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.catalog_matter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.catalog_matter_id_seq OWNER TO mdatamanager;

--
-- Name: catalog_matter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.catalog_matter_id_seq OWNED BY public.catalog_matter.id;


--
-- Name: catalog_scope_government; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.catalog_scope_government (
    id bigint NOT NULL,
    description character varying
);


ALTER TABLE public.catalog_scope_government OWNER TO mdatamanager;

--
-- Name: catalog_scope_government_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.catalog_scope_government_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.catalog_scope_government_id_seq OWNER TO mdatamanager;

--
-- Name: catalog_scope_government_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.catalog_scope_government_id_seq OWNED BY public.catalog_scope_government.id;


--
-- Name: catalog_specialist_type; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.catalog_specialist_type (
    id bigint NOT NULL,
    description character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.catalog_specialist_type OWNER TO mdatamanager;

--
-- Name: catalog_specialist_type_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.catalog_specialist_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.catalog_specialist_type_id_seq OWNER TO mdatamanager;

--
-- Name: catalog_specialist_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.catalog_specialist_type_id_seq OWNED BY public.catalog_specialist_type.id;


--
-- Name: catalog_specific_issues; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.catalog_specific_issues (
    id bigint NOT NULL,
    description character varying
);


ALTER TABLE public.catalog_specific_issues OWNER TO mdatamanager;

--
-- Name: catalog_specific_issues_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.catalog_specific_issues_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.catalog_specific_issues_id_seq OWNER TO mdatamanager;

--
-- Name: catalog_specific_issues_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.catalog_specific_issues_id_seq OWNED BY public.catalog_specific_issues.id;


--
-- Name: catalog_subject_expertise; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.catalog_subject_expertise (
    id bigint NOT NULL,
    legal_subject character varying,
    expertise character varying,
    subexpertise character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.catalog_subject_expertise OWNER TO mdatamanager;

--
-- Name: catalog_subject_expertise_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.catalog_subject_expertise_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.catalog_subject_expertise_id_seq OWNER TO mdatamanager;

--
-- Name: catalog_subject_expertise_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.catalog_subject_expertise_id_seq OWNED BY public.catalog_subject_expertise.id;


--
-- Name: document_annexes; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.document_annexes (
    id bigint NOT NULL,
    title character varying,
    description text,
    document_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    file_data text
);


ALTER TABLE public.document_annexes OWNER TO mdatamanager;

--
-- Name: document_annexes_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.document_annexes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.document_annexes_id_seq OWNER TO mdatamanager;

--
-- Name: document_annexes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.document_annexes_id_seq OWNED BY public.document_annexes.id;


--
-- Name: document_comments; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.document_comments (
    id bigint NOT NULL,
    description text,
    document_version_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id bigint
);


ALTER TABLE public.document_comments OWNER TO mdatamanager;

--
-- Name: document_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.document_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.document_comments_id_seq OWNER TO mdatamanager;

--
-- Name: document_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.document_comments_id_seq OWNED BY public.document_comments.id;


--
-- Name: document_notifications; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.document_notifications (
    id bigint NOT NULL,
    user_id bigint,
    document_id bigint,
    "all" boolean,
    status_change boolean,
    version_upload boolean,
    document_edit boolean,
    document_delete boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    comment_create boolean
);


ALTER TABLE public.document_notifications OWNER TO mdatamanager;

--
-- Name: document_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.document_notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.document_notifications_id_seq OWNER TO mdatamanager;

--
-- Name: document_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.document_notifications_id_seq OWNED BY public.document_notifications.id;


--
-- Name: document_types; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.document_types (
    id bigint NOT NULL,
    title character varying,
    abbreviation character varying,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.document_types OWNER TO mdatamanager;

--
-- Name: document_types_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.document_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.document_types_id_seq OWNER TO mdatamanager;

--
-- Name: document_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.document_types_id_seq OWNED BY public.document_types.id;


--
-- Name: document_versions; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.document_versions (
    id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    document_id bigint,
    file_data text,
    status integer DEFAULT 0,
    user_id bigint,
    deleted boolean,
    file_size bigint,
    file_name character varying,
    file_type character varying,
    s3_path character varying
);


ALTER TABLE public.document_versions OWNER TO mdatamanager;

--
-- Name: document_versions_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.document_versions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.document_versions_id_seq OWNER TO mdatamanager;

--
-- Name: document_versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.document_versions_id_seq OWNED BY public.document_versions.id;


--
-- Name: documents; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.documents (
    id bigint NOT NULL,
    title character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    folder_id bigint,
    document_type_id bigint,
    organization_id bigint,
    user_id bigint,
    keywords character varying,
    name character varying,
    deleted boolean,
    document_date date,
    status integer DEFAULT 0,
    confidential boolean DEFAULT false
);


ALTER TABLE public.documents OWNER TO mdatamanager;

--
-- Name: documents_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.documents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.documents_id_seq OWNER TO mdatamanager;

--
-- Name: documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.documents_id_seq OWNED BY public.documents.id;


--
-- Name: documents_specialists; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.documents_specialists (
    id bigint NOT NULL,
    user_id uuid,
    user_type character varying,
    title character varying,
    document_type character varying,
    file_key character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.documents_specialists OWNER TO mdatamanager;

--
-- Name: documents_specialists_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.documents_specialists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.documents_specialists_id_seq OWNER TO mdatamanager;

--
-- Name: documents_specialists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.documents_specialists_id_seq OWNED BY public.documents_specialists.id;


--
-- Name: documents_users; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.documents_users (
    user_id bigint NOT NULL,
    document_id bigint NOT NULL,
    role integer
);


ALTER TABLE public.documents_users OWNER TO mdatamanager;

--
-- Name: educations; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.educations (
    id bigint NOT NULL,
    title character varying,
    descripcion character varying,
    school_name character varying,
    start_date date,
    end_date date,
    is_actual boolean,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    uuid uuid DEFAULT public.uuid_generate_v4(),
    user_id uuid,
    type_user character varying,
    location character varying,
    grade character varying
);


ALTER TABLE public.educations OWNER TO mdatamanager;

--
-- Name: educations_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.educations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.educations_id_seq OWNER TO mdatamanager;

--
-- Name: educations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.educations_id_seq OWNED BY public.educations.id;


--
-- Name: events; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.events (
    id bigint NOT NULL,
    title character varying,
    description text,
    length integer,
    time_zone character varying,
    currency character varying,
    specialist_id bigint NOT NULL,
    schedule_id bigint NOT NULL,
    price numeric(8,2),
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.events OWNER TO mdatamanager;

--
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.events_id_seq OWNER TO mdatamanager;

--
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.events_id_seq OWNED BY public.events.id;


--
-- Name: expertise; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.expertise (
    id bigint NOT NULL,
    user_id uuid,
    description character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.expertise OWNER TO mdatamanager;

--
-- Name: expertise_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.expertise_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.expertise_id_seq OWNER TO mdatamanager;

--
-- Name: expertise_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.expertise_id_seq OWNED BY public.expertise.id;


--
-- Name: favorites; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.favorites (
    id bigint NOT NULL,
    user_id integer,
    type_user character varying,
    specialist_id integer
);


ALTER TABLE public.favorites OWNER TO mdatamanager;

--
-- Name: favorites_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.favorites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.favorites_id_seq OWNER TO mdatamanager;

--
-- Name: favorites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.favorites_id_seq OWNED BY public.favorites.id;


--
-- Name: folders; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.folders (
    id bigint NOT NULL,
    title character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    ancestry character varying,
    deleted boolean
);


ALTER TABLE public.folders OWNER TO mdatamanager;

--
-- Name: folders_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.folders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.folders_id_seq OWNER TO mdatamanager;

--
-- Name: folders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.folders_id_seq OWNED BY public.folders.id;


--
-- Name: folders_users; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.folders_users (
    folder_id bigint NOT NULL,
    user_id bigint NOT NULL,
    role integer DEFAULT 0
);


ALTER TABLE public.folders_users OWNER TO mdatamanager;

--
-- Name: intances_of_interests; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.intances_of_interests (
    id bigint NOT NULL,
    user_id uuid,
    description character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.intances_of_interests OWNER TO mdatamanager;

--
-- Name: intances_of_interests_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.intances_of_interests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.intances_of_interests_id_seq OWNER TO mdatamanager;

--
-- Name: intances_of_interests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.intances_of_interests_id_seq OWNED BY public.intances_of_interests.id;


--
-- Name: languages; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.languages (
    id bigint NOT NULL,
    user_id uuid,
    description character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.languages OWNER TO mdatamanager;

--
-- Name: languages_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.languages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.languages_id_seq OWNER TO mdatamanager;

--
-- Name: languages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.languages_id_seq OWNED BY public.languages.id;


--
-- Name: legal_profiles; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.legal_profiles (
    id bigint NOT NULL,
    user_id uuid,
    bachelor_deegre character varying,
    academic_degree character varying,
    university character varying,
    cedula character varying,
    "internLetter" boolean,
    letter character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.legal_profiles OWNER TO mdatamanager;

--
-- Name: legal_profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.legal_profiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.legal_profiles_id_seq OWNER TO mdatamanager;

--
-- Name: legal_profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.legal_profiles_id_seq OWNED BY public.legal_profiles.id;


--
-- Name: legal_subject; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.legal_subject (
    id bigint NOT NULL,
    user_id uuid,
    description character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.legal_subject OWNER TO mdatamanager;

--
-- Name: legal_subject_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.legal_subject_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.legal_subject_id_seq OWNER TO mdatamanager;

--
-- Name: legal_subject_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.legal_subject_id_seq OWNED BY public.legal_subject.id;


--
-- Name: level_of_goverment; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.level_of_goverment (
    id bigint NOT NULL,
    user_id uuid,
    description character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.level_of_goverment OWNER TO mdatamanager;

--
-- Name: level_of_goverment_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.level_of_goverment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.level_of_goverment_id_seq OWNER TO mdatamanager;

--
-- Name: level_of_goverment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.level_of_goverment_id_seq OWNED BY public.level_of_goverment.id;


--
-- Name: milestones; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.milestones (
    id bigint NOT NULL,
    title character varying,
    description text,
    project_id bigint NOT NULL,
    folder_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.milestones OWNER TO mdatamanager;

--
-- Name: milestones_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.milestones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.milestones_id_seq OWNER TO mdatamanager;

--
-- Name: milestones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.milestones_id_seq OWNED BY public.milestones.id;


--
-- Name: organizations; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.organizations (
    id bigint NOT NULL,
    name character varying,
    abbreviation character varying,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.organizations OWNER TO mdatamanager;

--
-- Name: organizations_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.organizations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.organizations_id_seq OWNER TO mdatamanager;

--
-- Name: organizations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.organizations_id_seq OWNED BY public.organizations.id;


--
-- Name: other_languages; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.other_languages (
    id bigint NOT NULL,
    user_id uuid,
    description character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.other_languages OWNER TO mdatamanager;

--
-- Name: other_languages_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.other_languages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.other_languages_id_seq OWNER TO mdatamanager;

--
-- Name: other_languages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.other_languages_id_seq OWNED BY public.other_languages.id;


--
-- Name: other_legal_subject; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.other_legal_subject (
    id bigint NOT NULL,
    user_id uuid,
    description character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.other_legal_subject OWNER TO mdatamanager;

--
-- Name: other_legal_subject_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.other_legal_subject_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.other_legal_subject_id_seq OWNER TO mdatamanager;

--
-- Name: other_legal_subject_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.other_legal_subject_id_seq OWNED BY public.other_legal_subject.id;


--
-- Name: other_level_of_goverment; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.other_level_of_goverment (
    id bigint NOT NULL,
    user_id uuid,
    description character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.other_level_of_goverment OWNER TO mdatamanager;

--
-- Name: other_level_of_goverment_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.other_level_of_goverment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.other_level_of_goverment_id_seq OWNER TO mdatamanager;

--
-- Name: other_level_of_goverment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.other_level_of_goverment_id_seq OWNED BY public.other_level_of_goverment.id;


--
-- Name: other_service_type; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.other_service_type (
    id bigint NOT NULL,
    user_id integer,
    description character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.other_service_type OWNER TO mdatamanager;

--
-- Name: other_service_type_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.other_service_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.other_service_type_id_seq OWNER TO mdatamanager;

--
-- Name: other_service_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.other_service_type_id_seq OWNED BY public.other_service_type.id;


--
-- Name: other_state_power_institutions; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.other_state_power_institutions (
    id bigint NOT NULL,
    user_id uuid,
    description character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.other_state_power_institutions OWNER TO mdatamanager;

--
-- Name: other_state_power_institutions_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.other_state_power_institutions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.other_state_power_institutions_id_seq OWNER TO mdatamanager;

--
-- Name: other_state_power_institutions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.other_state_power_institutions_id_seq OWNED BY public.other_state_power_institutions.id;


--
-- Name: project_reports; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.project_reports (
    id bigint NOT NULL,
    report jsonb,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    project_id bigint
);


ALTER TABLE public.project_reports OWNER TO mdatamanager;

--
-- Name: project_reports_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.project_reports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.project_reports_id_seq OWNER TO mdatamanager;

--
-- Name: project_reports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.project_reports_id_seq OWNED BY public.project_reports.id;


--
-- Name: projects; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.projects (
    id bigint NOT NULL,
    title character varying,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    eliminated boolean DEFAULT false,
    image_data text,
    folder_id bigint NOT NULL,
    projectable_type character varying NOT NULL,
    projectable_id bigint NOT NULL
);


ALTER TABLE public.projects OWNER TO mdatamanager;

--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.projects_id_seq OWNER TO mdatamanager;

--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;


--
-- Name: projects_users; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.projects_users (
    project_id bigint NOT NULL,
    user_id bigint NOT NULL,
    role integer DEFAULT 0
);


ALTER TABLE public.projects_users OWNER TO mdatamanager;

--
-- Name: proofs; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.proofs (
    id bigint NOT NULL,
    milestone_id bigint NOT NULL,
    title character varying,
    description text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    proofable_type character varying NOT NULL,
    proofable_id bigint NOT NULL
);


ALTER TABLE public.proofs OWNER TO mdatamanager;

--
-- Name: proofs_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.proofs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.proofs_id_seq OWNER TO mdatamanager;

--
-- Name: proofs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.proofs_id_seq OWNED BY public.proofs.id;


--
-- Name: question_additionals; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.question_additionals (
    id bigint NOT NULL,
    question_id character varying,
    questions jsonb,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.question_additionals OWNER TO mdatamanager;

--
-- Name: question_additionals_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.question_additionals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.question_additionals_id_seq OWNER TO mdatamanager;

--
-- Name: question_additionals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.question_additionals_id_seq OWNED BY public.question_additionals.id;


--
-- Name: question_answers; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.question_answers (
    id bigint NOT NULL,
    answer character varying,
    question_id uuid,
    user_id uuid,
    type_user character varying,
    resolved boolean,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    uuid uuid DEFAULT public.uuid_generate_v4()
);


ALTER TABLE public.question_answers OWNER TO mdatamanager;

--
-- Name: question_answers_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.question_answers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.question_answers_id_seq OWNER TO mdatamanager;

--
-- Name: question_answers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.question_answers_id_seq OWNED BY public.question_answers.id;


--
-- Name: question_answers_votes; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.question_answers_votes (
    id bigint NOT NULL,
    user_id uuid,
    type_user character varying,
    question_id uuid,
    answer_id uuid,
    vote boolean,
    unvote boolean,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    uuid uuid DEFAULT public.uuid_generate_v4()
);


ALTER TABLE public.question_answers_votes OWNER TO mdatamanager;

--
-- Name: question_answers_votes_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.question_answers_votes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.question_answers_votes_id_seq OWNER TO mdatamanager;

--
-- Name: question_answers_votes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.question_answers_votes_id_seq OWNED BY public.question_answers_votes.id;


--
-- Name: question_expertises; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.question_expertises (
    id bigint NOT NULL,
    question_id uuid,
    option character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.question_expertises OWNER TO mdatamanager;

--
-- Name: question_expertises_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.question_expertises_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.question_expertises_id_seq OWNER TO mdatamanager;

--
-- Name: question_expertises_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.question_expertises_id_seq OWNED BY public.question_expertises.id;


--
-- Name: question_institutions; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.question_institutions (
    id bigint NOT NULL,
    question_id uuid,
    option character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.question_institutions OWNER TO mdatamanager;

--
-- Name: question_institutions_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.question_institutions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.question_institutions_id_seq OWNER TO mdatamanager;

--
-- Name: question_institutions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.question_institutions_id_seq OWNED BY public.question_institutions.id;


--
-- Name: question_jurisdictions; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.question_jurisdictions (
    id bigint NOT NULL,
    question_id uuid,
    option character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.question_jurisdictions OWNER TO mdatamanager;

--
-- Name: question_jurisdictions_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.question_jurisdictions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.question_jurisdictions_id_seq OWNER TO mdatamanager;

--
-- Name: question_jurisdictions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.question_jurisdictions_id_seq OWNED BY public.question_jurisdictions.id;


--
-- Name: question_name_institutions; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.question_name_institutions (
    id bigint NOT NULL,
    question_id uuid,
    option character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.question_name_institutions OWNER TO mdatamanager;

--
-- Name: question_name_institutions_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.question_name_institutions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.question_name_institutions_id_seq OWNER TO mdatamanager;

--
-- Name: question_name_institutions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.question_name_institutions_id_seq OWNED BY public.question_name_institutions.id;


--
-- Name: question_name_procedures; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.question_name_procedures (
    id bigint NOT NULL,
    question_id uuid,
    option character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.question_name_procedures OWNER TO mdatamanager;

--
-- Name: question_name_procedures_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.question_name_procedures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.question_name_procedures_id_seq OWNER TO mdatamanager;

--
-- Name: question_name_procedures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.question_name_procedures_id_seq OWNED BY public.question_name_procedures.id;


--
-- Name: question_scope_governments; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.question_scope_governments (
    id bigint NOT NULL,
    question_id uuid,
    option character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.question_scope_governments OWNER TO mdatamanager;

--
-- Name: question_scope_governments_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.question_scope_governments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.question_scope_governments_id_seq OWNER TO mdatamanager;

--
-- Name: question_scope_governments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.question_scope_governments_id_seq OWNED BY public.question_scope_governments.id;


--
-- Name: question_subexpertises; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.question_subexpertises (
    id bigint NOT NULL,
    question_id character varying,
    option character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.question_subexpertises OWNER TO mdatamanager;

--
-- Name: question_subexpertises_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.question_subexpertises_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.question_subexpertises_id_seq OWNER TO mdatamanager;

--
-- Name: question_subexpertises_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.question_subexpertises_id_seq OWNED BY public.question_subexpertises.id;


--
-- Name: question_subjects; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.question_subjects (
    id bigint NOT NULL,
    question_id uuid,
    option character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.question_subjects OWNER TO mdatamanager;

--
-- Name: question_subjects_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.question_subjects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.question_subjects_id_seq OWNER TO mdatamanager;

--
-- Name: question_subjects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.question_subjects_id_seq OWNED BY public.question_subjects.id;


--
-- Name: question_type_procedures; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.question_type_procedures (
    id bigint NOT NULL,
    question_id uuid,
    option character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.question_type_procedures OWNER TO mdatamanager;

--
-- Name: question_type_procedures_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.question_type_procedures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.question_type_procedures_id_seq OWNER TO mdatamanager;

--
-- Name: question_type_procedures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.question_type_procedures_id_seq OWNED BY public.question_type_procedures.id;


--
-- Name: question_votes; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.question_votes (
    id bigint NOT NULL,
    user_id uuid,
    type_user character varying,
    question_id uuid,
    vote boolean,
    unvote boolean,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    uuid uuid DEFAULT public.uuid_generate_v4()
);


ALTER TABLE public.question_votes OWNER TO mdatamanager;

--
-- Name: question_votes_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.question_votes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.question_votes_id_seq OWNER TO mdatamanager;

--
-- Name: question_votes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.question_votes_id_seq OWNED BY public.question_votes.id;


--
-- Name: questions; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.questions (
    id bigint NOT NULL,
    user_id uuid,
    type_user character varying,
    question_name character varying,
    question character varying,
    need_enddate boolean,
    min_enddate timestamp without time zone,
    max_enddate timestamp without time zone,
    resolved boolean,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    uuid uuid DEFAULT public.uuid_generate_v4()
);


ALTER TABLE public.questions OWNER TO mdatamanager;

--
-- Name: questions_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questions_id_seq OWNER TO mdatamanager;

--
-- Name: questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.questions_id_seq OWNED BY public.questions.id;


--
-- Name: queue_classic_jobs; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.queue_classic_jobs (
    id bigint NOT NULL,
    q_name text NOT NULL,
    method text NOT NULL,
    args jsonb NOT NULL,
    locked_at timestamp with time zone,
    locked_by integer,
    created_at timestamp with time zone DEFAULT now(),
    scheduled_at timestamp with time zone DEFAULT now(),
    CONSTRAINT queue_classic_jobs_method_check CHECK ((length(method) > 0)),
    CONSTRAINT queue_classic_jobs_q_name_check CHECK ((length(q_name) > 0))
);


ALTER TABLE public.queue_classic_jobs OWNER TO mdatamanager;

--
-- Name: queue_classic_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.queue_classic_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.queue_classic_jobs_id_seq OWNER TO mdatamanager;

--
-- Name: queue_classic_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.queue_classic_jobs_id_seq OWNED BY public.queue_classic_jobs.id;


--
-- Name: related_documents; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.related_documents (
    id bigint NOT NULL,
    document_a_id integer NOT NULL,
    document_b_id integer NOT NULL
);


ALTER TABLE public.related_documents OWNER TO mdatamanager;

--
-- Name: related_documents_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.related_documents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.related_documents_id_seq OWNER TO mdatamanager;

--
-- Name: related_documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.related_documents_id_seq OWNED BY public.related_documents.id;


--
-- Name: schedules; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.schedules (
    id bigint NOT NULL,
    name character varying,
    time_zone character varying,
    specialist_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.schedules OWNER TO mdatamanager;

--
-- Name: schedules_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.schedules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.schedules_id_seq OWNER TO mdatamanager;

--
-- Name: schedules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.schedules_id_seq OWNED BY public.schedules.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO mdatamanager;

--
-- Name: service_type; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.service_type (
    id bigint NOT NULL,
    user_id character varying,
    description character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.service_type OWNER TO mdatamanager;

--
-- Name: service_type_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.service_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.service_type_id_seq OWNER TO mdatamanager;

--
-- Name: service_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.service_type_id_seq OWNED BY public.service_type.id;


--
-- Name: specialists; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.specialists (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    confirmation_token character varying,
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    unconfirmed_email character varying,
    failed_attempts integer DEFAULT 0 NOT NULL,
    unlock_token character varying,
    locked_at timestamp without time zone,
    name character varying,
    lastname character varying,
    second_surname character varying,
    no_surname character varying,
    birthdate character varying,
    nationality character varying,
    gender character varying,
    curp character varying,
    rfc character varying,
    homoclave character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    deactivated boolean DEFAULT false,
    pending_status character varying DEFAULT 'pending'::character varying,
    second_lastname character varying,
    bachelor_degree character varying,
    university character varying,
    cedula character varying,
    academic_degree character varying,
    intern_letter character varying,
    registration_step1 boolean,
    registration_step2 boolean,
    registration_step3 boolean,
    registration_step4 boolean,
    specialist_type character varying,
    legal_service_id bigint,
    country character varying,
    state character varying,
    lat numeric(10,6),
    lng numeric(10,6),
    appointment_type character varying,
    address character varying,
    zip_code character varying,
    specialist_entity_type character varying,
    uuid uuid DEFAULT public.uuid_generate_v4()
);


ALTER TABLE public.specialists OWNER TO mdatamanager;

--
-- Name: specialists_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.specialists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.specialists_id_seq OWNER TO mdatamanager;

--
-- Name: specialists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.specialists_id_seq OWNED BY public.specialists.id;


--
-- Name: state_power_institutions; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.state_power_institutions (
    id bigint NOT NULL,
    user_id uuid,
    description character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.state_power_institutions OWNER TO mdatamanager;

--
-- Name: state_power_institutions_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.state_power_institutions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.state_power_institutions_id_seq OWNER TO mdatamanager;

--
-- Name: state_power_institutions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.state_power_institutions_id_seq OWNED BY public.state_power_institutions.id;


--
-- Name: subexpertise; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.subexpertise (
    id bigint NOT NULL,
    user_id uuid,
    description character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.subexpertise OWNER TO mdatamanager;

--
-- Name: subexpertise_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.subexpertise_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subexpertise_id_seq OWNER TO mdatamanager;

--
-- Name: subexpertise_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.subexpertise_id_seq OWNED BY public.subexpertise.id;


--
-- Name: territorial_jurisdictions; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.territorial_jurisdictions (
    id bigint NOT NULL,
    user_id uuid,
    description character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.territorial_jurisdictions OWNER TO mdatamanager;

--
-- Name: territorial_jurisdictions_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.territorial_jurisdictions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.territorial_jurisdictions_id_seq OWNER TO mdatamanager;

--
-- Name: territorial_jurisdictions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.territorial_jurisdictions_id_seq OWNED BY public.territorial_jurisdictions.id;


--
-- Name: trn_metadata; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.trn_metadata (
    id bigint NOT NULL,
    user_created integer DEFAULT 0 NOT NULL,
    date_of_answer character varying DEFAULT ''::character varying,
    type_of_answer character varying DEFAULT ''::character varying NOT NULL,
    issue_reason character varying DEFAULT ''::character varying NOT NULL,
    subject character varying DEFAULT ''::character varying NOT NULL,
    type_of_attribute character varying DEFAULT ''::character varying NOT NULL,
    message character varying DEFAULT ''::character varying NOT NULL,
    uuid character varying,
    deleted boolean,
    created_at timestamp without time zone,
    type_of_shipment character varying DEFAULT ''::character varying
);


ALTER TABLE public.trn_metadata OWNER TO mdatamanager;

--
-- Name: trn_metadata_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.trn_metadata_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trn_metadata_id_seq OWNER TO mdatamanager;

--
-- Name: trn_metadata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.trn_metadata_id_seq OWNED BY public.trn_metadata.id;


--
-- Name: trn_user_ccs; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.trn_user_ccs (
    id bigint NOT NULL,
    uuid character varying DEFAULT ''::character varying NOT NULL,
    user_id character varying DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.trn_user_ccs OWNER TO mdatamanager;

--
-- Name: trn_user_ccs_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.trn_user_ccs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trn_user_ccs_id_seq OWNER TO mdatamanager;

--
-- Name: trn_user_ccs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.trn_user_ccs_id_seq OWNED BY public.trn_user_ccs.id;


--
-- Name: trn_user_documents; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.trn_user_documents (
    id bigint NOT NULL,
    user_assigned integer DEFAULT 0 NOT NULL,
    id_project integer NOT NULL,
    "boolean" timestamp without time zone,
    request_response character varying DEFAULT ''::character varying NOT NULL,
    date_response timestamp without time zone,
    id_document character varying DEFAULT ''::character varying NOT NULL,
    uuid character varying
);


ALTER TABLE public.trn_user_documents OWNER TO mdatamanager;

--
-- Name: trn_user_documents_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.trn_user_documents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trn_user_documents_id_seq OWNER TO mdatamanager;

--
-- Name: trn_user_documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.trn_user_documents_id_seq OWNED BY public.trn_user_documents.id;


--
-- Name: type_of_general_procedures; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.type_of_general_procedures (
    id bigint NOT NULL,
    user_id uuid,
    description character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.type_of_general_procedures OWNER TO mdatamanager;

--
-- Name: type_of_general_procedures_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.type_of_general_procedures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.type_of_general_procedures_id_seq OWNER TO mdatamanager;

--
-- Name: type_of_general_procedures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.type_of_general_procedures_id_seq OWNED BY public.type_of_general_procedures.id;


--
-- Name: type_of_specific_issues; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.type_of_specific_issues (
    id bigint NOT NULL,
    user_id uuid,
    description character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.type_of_specific_issues OWNER TO mdatamanager;

--
-- Name: type_of_specific_issues_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.type_of_specific_issues_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.type_of_specific_issues_id_seq OWNER TO mdatamanager;

--
-- Name: type_of_specific_issues_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.type_of_specific_issues_id_seq OWNED BY public.type_of_specific_issues.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    failed_attempts integer DEFAULT 0 NOT NULL,
    unlock_token character varying,
    locked_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    admin boolean DEFAULT false NOT NULL,
    organization_id bigint,
    name character varying,
    deactivated boolean DEFAULT false,
    provider character varying,
    uid character varying,
    confirmation_token character varying,
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    unconfirmed_email character varying,
    uuid uuid DEFAULT public.uuid_generate_v4()
);


ALTER TABLE public.users OWNER TO mdatamanager;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO mdatamanager;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: work_experiences; Type: TABLE; Schema: public; Owner: mdatamanager
--

CREATE TABLE public.work_experiences (
    id bigint NOT NULL,
    title character varying,
    descripcion character varying,
    company character varying,
    start_date date,
    end_date date,
    is_actual boolean,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    uuid uuid DEFAULT public.uuid_generate_v4(),
    user_id uuid,
    type_user character varying,
    location character varying
);


ALTER TABLE public.work_experiences OWNER TO mdatamanager;

--
-- Name: work_experiences_id_seq; Type: SEQUENCE; Schema: public; Owner: mdatamanager
--

CREATE SEQUENCE public.work_experiences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.work_experiences_id_seq OWNER TO mdatamanager;

--
-- Name: work_experiences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdatamanager
--

ALTER SEQUENCE public.work_experiences_id_seq OWNED BY public.work_experiences.id;


--
-- Name: active_admin_comments id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.active_admin_comments ALTER COLUMN id SET DEFAULT nextval('public.active_admin_comments_id_seq'::regclass);


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: admin_users id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.admin_users ALTER COLUMN id SET DEFAULT nextval('public.admin_users_id_seq'::regclass);


--
-- Name: availabilities id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.availabilities ALTER COLUMN id SET DEFAULT nextval('public.availabilities_id_seq'::regclass);


--
-- Name: bookings id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.bookings ALTER COLUMN id SET DEFAULT nextval('public.bookings_id_seq'::regclass);


--
-- Name: catalog_area_codes_level_1 id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.catalog_area_codes_level_1 ALTER COLUMN id SET DEFAULT nextval('public.catalog_area_codes_level_1_id_seq'::regclass);


--
-- Name: catalog_entity_type id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.catalog_entity_type ALTER COLUMN id SET DEFAULT nextval('public.catalog_entity_type_id_seq'::regclass);


--
-- Name: catalog_form id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.catalog_form ALTER COLUMN id SET DEFAULT nextval('public.catalog_form_id_seq'::regclass);


--
-- Name: catalog_general_procedures id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.catalog_general_procedures ALTER COLUMN id SET DEFAULT nextval('public.catalog_general_procedures_id_seq'::regclass);


--
-- Name: catalog_instances_interest id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.catalog_instances_interest ALTER COLUMN id SET DEFAULT nextval('public.catalog_instances_interest_id_seq'::regclass);


--
-- Name: catalog_institutions id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.catalog_institutions ALTER COLUMN id SET DEFAULT nextval('public.catalog_institutions_id_seq'::regclass);


--
-- Name: catalog_jurisdiction id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.catalog_jurisdiction ALTER COLUMN id SET DEFAULT nextval('public.catalog_jurisdiction_id_seq'::regclass);


--
-- Name: catalog_languages id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.catalog_languages ALTER COLUMN id SET DEFAULT nextval('public.catalog_languages_id_seq'::regclass);


--
-- Name: catalog_legal_services id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.catalog_legal_services ALTER COLUMN id SET DEFAULT nextval('public.catalog_legal_services_id_seq'::regclass);


--
-- Name: catalog_matter id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.catalog_matter ALTER COLUMN id SET DEFAULT nextval('public.catalog_matter_id_seq'::regclass);


--
-- Name: catalog_scope_government id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.catalog_scope_government ALTER COLUMN id SET DEFAULT nextval('public.catalog_scope_government_id_seq'::regclass);


--
-- Name: catalog_specialist_type id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.catalog_specialist_type ALTER COLUMN id SET DEFAULT nextval('public.catalog_specialist_type_id_seq'::regclass);


--
-- Name: catalog_specific_issues id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.catalog_specific_issues ALTER COLUMN id SET DEFAULT nextval('public.catalog_specific_issues_id_seq'::regclass);


--
-- Name: catalog_subject_expertise id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.catalog_subject_expertise ALTER COLUMN id SET DEFAULT nextval('public.catalog_subject_expertise_id_seq'::regclass);


--
-- Name: document_annexes id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.document_annexes ALTER COLUMN id SET DEFAULT nextval('public.document_annexes_id_seq'::regclass);


--
-- Name: document_comments id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.document_comments ALTER COLUMN id SET DEFAULT nextval('public.document_comments_id_seq'::regclass);


--
-- Name: document_notifications id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.document_notifications ALTER COLUMN id SET DEFAULT nextval('public.document_notifications_id_seq'::regclass);


--
-- Name: document_types id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.document_types ALTER COLUMN id SET DEFAULT nextval('public.document_types_id_seq'::regclass);


--
-- Name: document_versions id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.document_versions ALTER COLUMN id SET DEFAULT nextval('public.document_versions_id_seq'::regclass);


--
-- Name: documents id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.documents ALTER COLUMN id SET DEFAULT nextval('public.documents_id_seq'::regclass);


--
-- Name: documents_specialists id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.documents_specialists ALTER COLUMN id SET DEFAULT nextval('public.documents_specialists_id_seq'::regclass);


--
-- Name: educations id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.educations ALTER COLUMN id SET DEFAULT nextval('public.educations_id_seq'::regclass);


--
-- Name: events id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.events ALTER COLUMN id SET DEFAULT nextval('public.events_id_seq'::regclass);


--
-- Name: expertise id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.expertise ALTER COLUMN id SET DEFAULT nextval('public.expertise_id_seq'::regclass);


--
-- Name: favorites id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.favorites ALTER COLUMN id SET DEFAULT nextval('public.favorites_id_seq'::regclass);


--
-- Name: folders id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.folders ALTER COLUMN id SET DEFAULT nextval('public.folders_id_seq'::regclass);


--
-- Name: intances_of_interests id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.intances_of_interests ALTER COLUMN id SET DEFAULT nextval('public.intances_of_interests_id_seq'::regclass);


--
-- Name: languages id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.languages ALTER COLUMN id SET DEFAULT nextval('public.languages_id_seq'::regclass);


--
-- Name: legal_profiles id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.legal_profiles ALTER COLUMN id SET DEFAULT nextval('public.legal_profiles_id_seq'::regclass);


--
-- Name: legal_subject id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.legal_subject ALTER COLUMN id SET DEFAULT nextval('public.legal_subject_id_seq'::regclass);


--
-- Name: level_of_goverment id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.level_of_goverment ALTER COLUMN id SET DEFAULT nextval('public.level_of_goverment_id_seq'::regclass);


--
-- Name: milestones id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.milestones ALTER COLUMN id SET DEFAULT nextval('public.milestones_id_seq'::regclass);


--
-- Name: organizations id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.organizations ALTER COLUMN id SET DEFAULT nextval('public.organizations_id_seq'::regclass);


--
-- Name: other_languages id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.other_languages ALTER COLUMN id SET DEFAULT nextval('public.other_languages_id_seq'::regclass);


--
-- Name: other_legal_subject id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.other_legal_subject ALTER COLUMN id SET DEFAULT nextval('public.other_legal_subject_id_seq'::regclass);


--
-- Name: other_level_of_goverment id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.other_level_of_goverment ALTER COLUMN id SET DEFAULT nextval('public.other_level_of_goverment_id_seq'::regclass);


--
-- Name: other_service_type id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.other_service_type ALTER COLUMN id SET DEFAULT nextval('public.other_service_type_id_seq'::regclass);


--
-- Name: other_state_power_institutions id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.other_state_power_institutions ALTER COLUMN id SET DEFAULT nextval('public.other_state_power_institutions_id_seq'::regclass);


--
-- Name: project_reports id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.project_reports ALTER COLUMN id SET DEFAULT nextval('public.project_reports_id_seq'::regclass);


--
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- Name: proofs id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.proofs ALTER COLUMN id SET DEFAULT nextval('public.proofs_id_seq'::regclass);


--
-- Name: question_additionals id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.question_additionals ALTER COLUMN id SET DEFAULT nextval('public.question_additionals_id_seq'::regclass);


--
-- Name: question_answers id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.question_answers ALTER COLUMN id SET DEFAULT nextval('public.question_answers_id_seq'::regclass);


--
-- Name: question_answers_votes id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.question_answers_votes ALTER COLUMN id SET DEFAULT nextval('public.question_answers_votes_id_seq'::regclass);


--
-- Name: question_expertises id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.question_expertises ALTER COLUMN id SET DEFAULT nextval('public.question_expertises_id_seq'::regclass);


--
-- Name: question_institutions id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.question_institutions ALTER COLUMN id SET DEFAULT nextval('public.question_institutions_id_seq'::regclass);


--
-- Name: question_jurisdictions id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.question_jurisdictions ALTER COLUMN id SET DEFAULT nextval('public.question_jurisdictions_id_seq'::regclass);


--
-- Name: question_name_institutions id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.question_name_institutions ALTER COLUMN id SET DEFAULT nextval('public.question_name_institutions_id_seq'::regclass);


--
-- Name: question_name_procedures id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.question_name_procedures ALTER COLUMN id SET DEFAULT nextval('public.question_name_procedures_id_seq'::regclass);


--
-- Name: question_scope_governments id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.question_scope_governments ALTER COLUMN id SET DEFAULT nextval('public.question_scope_governments_id_seq'::regclass);


--
-- Name: question_subexpertises id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.question_subexpertises ALTER COLUMN id SET DEFAULT nextval('public.question_subexpertises_id_seq'::regclass);


--
-- Name: question_subjects id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.question_subjects ALTER COLUMN id SET DEFAULT nextval('public.question_subjects_id_seq'::regclass);


--
-- Name: question_type_procedures id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.question_type_procedures ALTER COLUMN id SET DEFAULT nextval('public.question_type_procedures_id_seq'::regclass);


--
-- Name: question_votes id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.question_votes ALTER COLUMN id SET DEFAULT nextval('public.question_votes_id_seq'::regclass);


--
-- Name: questions id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.questions ALTER COLUMN id SET DEFAULT nextval('public.questions_id_seq'::regclass);


--
-- Name: queue_classic_jobs id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.queue_classic_jobs ALTER COLUMN id SET DEFAULT nextval('public.queue_classic_jobs_id_seq'::regclass);


--
-- Name: related_documents id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.related_documents ALTER COLUMN id SET DEFAULT nextval('public.related_documents_id_seq'::regclass);


--
-- Name: schedules id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.schedules ALTER COLUMN id SET DEFAULT nextval('public.schedules_id_seq'::regclass);


--
-- Name: service_type id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.service_type ALTER COLUMN id SET DEFAULT nextval('public.service_type_id_seq'::regclass);


--
-- Name: specialists id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.specialists ALTER COLUMN id SET DEFAULT nextval('public.specialists_id_seq'::regclass);


--
-- Name: state_power_institutions id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.state_power_institutions ALTER COLUMN id SET DEFAULT nextval('public.state_power_institutions_id_seq'::regclass);


--
-- Name: subexpertise id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.subexpertise ALTER COLUMN id SET DEFAULT nextval('public.subexpertise_id_seq'::regclass);


--
-- Name: territorial_jurisdictions id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.territorial_jurisdictions ALTER COLUMN id SET DEFAULT nextval('public.territorial_jurisdictions_id_seq'::regclass);


--
-- Name: trn_metadata id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.trn_metadata ALTER COLUMN id SET DEFAULT nextval('public.trn_metadata_id_seq'::regclass);


--
-- Name: trn_user_ccs id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.trn_user_ccs ALTER COLUMN id SET DEFAULT nextval('public.trn_user_ccs_id_seq'::regclass);


--
-- Name: trn_user_documents id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.trn_user_documents ALTER COLUMN id SET DEFAULT nextval('public.trn_user_documents_id_seq'::regclass);


--
-- Name: type_of_general_procedures id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.type_of_general_procedures ALTER COLUMN id SET DEFAULT nextval('public.type_of_general_procedures_id_seq'::regclass);


--
-- Name: type_of_specific_issues id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.type_of_specific_issues ALTER COLUMN id SET DEFAULT nextval('public.type_of_specific_issues_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: work_experiences id; Type: DEFAULT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.work_experiences ALTER COLUMN id SET DEFAULT nextval('public.work_experiences_id_seq'::regclass);


--
-- Data for Name: active_admin_comments; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.active_admin_comments (id, namespace, body, resource_type, resource_id, author_type, author_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: active_storage_attachments; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) FROM stdin;
\.


--
-- Data for Name: active_storage_blobs; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) FROM stdin;
\.


--
-- Data for Name: admin_users; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.admin_users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, created_at, updated_at) FROM stdin;
1	dev@habitalia.mx	$2a$11$bUYnfFo91Fc6IVS64rToE.JZYsmQorBPOxiX6JHoaTHbLprSWYlFK	\N	\N	\N	2023-09-07 06:03:41.640803	2023-09-07 06:03:41.640803
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	production	2023-09-07 06:03:30.686213	2023-09-07 06:03:30.686213
\.


--
-- Data for Name: availabilities; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.availabilities (id, specialist_id, days, start_time, end_time, schedule_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: bookings; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.bookings (id, uid, specialist_id, event_id, title, description, start_time, end_time, status, paid, created_at, updated_at, personable_type, personable_id) FROM stdin;
\.


--
-- Data for Name: catalog_area_codes_level_1; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.catalog_area_codes_level_1 (id, level, region_code, region_name, sub_region_code, sub_region_name, iadb_region_code, iadb_region_name, intermediate_region_code, intermediate_region_name, country_name_en, country_name_es, m49code, isoalpha2, isoalpha3, subregion_name, subregion_type, iso3166_2, "FIPS", "HASC", ine01_2020, keywords, created_at, updated_at) FROM stdin;
1	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.57614	2023-09-07 06:03:43.57614
2	19	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.587576	2023-09-07 06:03:43.587576
3	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.591682	2023-09-07 06:03:43.591682
4	419	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.595889	2023-09-07 06:03:43.595889
5	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.601377	2023-09-07 06:03:43.601377
6	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.604803	2023-09-07 06:03:43.604803
7	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.608187	2023-09-07 06:03:43.608187
8	13	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.611605	2023-09-07 06:03:43.611605
9	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.615026	2023-09-07 06:03:43.615026
10	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.618444	2023-09-07 06:03:43.618444
11	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.621694	2023-09-07 06:03:43.621694
12	484	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.625045	2023-09-07 06:03:43.625045
13	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.628336	2023-09-07 06:03:43.628336
14	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.638404	2023-09-07 06:03:43.638404
15	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.641973	2023-09-07 06:03:43.641973
16	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.64584	2023-09-07 06:03:43.64584
17	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.649426	2023-09-07 06:03:43.649426
18	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.652773	2023-09-07 06:03:43.652773
19	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.656406	2023-09-07 06:03:43.656406
20	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.661266	2023-09-07 06:03:43.661266
21	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.667463	2023-09-07 06:03:43.667463
22	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.673467	2023-09-07 06:03:43.673467
23	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.676816	2023-09-07 06:03:43.676816
24	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.680053	2023-09-07 06:03:43.680053
25	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.684597	2023-09-07 06:03:43.684597
26	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.687749	2023-09-07 06:03:43.687749
27	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.692037	2023-09-07 06:03:43.692037
28	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.696857	2023-09-07 06:03:43.696857
29	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.708666	2023-09-07 06:03:43.708666
30	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.712829	2023-09-07 06:03:43.712829
31	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.716282	2023-09-07 06:03:43.716282
32	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.719703	2023-09-07 06:03:43.719703
33	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.722904	2023-09-07 06:03:43.722904
34	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.726358	2023-09-07 06:03:43.726358
35	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.729674	2023-09-07 06:03:43.729674
36	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.733014	2023-09-07 06:03:43.733014
37	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.741274	2023-09-07 06:03:43.741274
38	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.745902	2023-09-07 06:03:43.745902
39	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.749386	2023-09-07 06:03:43.749386
40	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.752635	2023-09-07 06:03:43.752635
41	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.75862	2023-09-07 06:03:43.75862
42	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.762388	2023-09-07 06:03:43.762388
43	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.765551	2023-09-07 06:03:43.765551
44	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.770828	2023-09-07 06:03:43.770828
45	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.775185	2023-09-07 06:03:43.775185
46	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.778669	2023-09-07 06:03:43.778669
47	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.781943	2023-09-07 06:03:43.781943
48	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.785075	2023-09-07 06:03:43.785075
49	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.788095	2023-09-07 06:03:43.788095
50	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.791139	2023-09-07 06:03:43.791139
51	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.794373	2023-09-07 06:03:43.794373
52	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.797545	2023-09-07 06:03:43.797545
53	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.803515	2023-09-07 06:03:43.803515
54	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.808009	2023-09-07 06:03:43.808009
55	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.811106	2023-09-07 06:03:43.811106
56	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.814109	2023-09-07 06:03:43.814109
57	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.818719	2023-09-07 06:03:43.818719
58	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.821929	2023-09-07 06:03:43.821929
59	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.825507	2023-09-07 06:03:43.825507
60	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.830617	2023-09-07 06:03:43.830617
61	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.833958	2023-09-07 06:03:43.833958
62	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.837104	2023-09-07 06:03:43.837104
63	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.840222	2023-09-07 06:03:43.840222
64	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.848389	2023-09-07 06:03:43.848389
65	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.852132	2023-09-07 06:03:43.852132
66	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.855331	2023-09-07 06:03:43.855331
67	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.85865	2023-09-07 06:03:43.85865
68	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.862079	2023-09-07 06:03:43.862079
69	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.872077	2023-09-07 06:03:43.872077
70	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.880921	2023-09-07 06:03:43.880921
71	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.884927	2023-09-07 06:03:43.884927
72	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.890536	2023-09-07 06:03:43.890536
73	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.895089	2023-09-07 06:03:43.895089
74	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.898641	2023-09-07 06:03:43.898641
75	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.901991	2023-09-07 06:03:43.901991
76	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.906517	2023-09-07 06:03:43.906517
77	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.909869	2023-09-07 06:03:43.909869
78	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.913646	2023-09-07 06:03:43.913646
79	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.916829	2023-09-07 06:03:43.916829
80	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.923406	2023-09-07 06:03:43.923406
81	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.926824	2023-09-07 06:03:43.926824
82	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.929998	2023-09-07 06:03:43.929998
83	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.934539	2023-09-07 06:03:43.934539
84	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.938388	2023-09-07 06:03:43.938388
85	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.944425	2023-09-07 06:03:43.944425
86	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.948865	2023-09-07 06:03:43.948865
87	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.952196	2023-09-07 06:03:43.952196
88	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.955544	2023-09-07 06:03:43.955544
89	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.961794	2023-09-07 06:03:43.961794
90	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.965416	2023-09-07 06:03:43.965416
91	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.969515	2023-09-07 06:03:43.969515
92	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.974848	2023-09-07 06:03:43.974848
93	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.978301	2023-09-07 06:03:43.978301
94	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.985895	2023-09-07 06:03:43.985895
95	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.989088	2023-09-07 06:03:43.989088
96	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.992274	2023-09-07 06:03:43.992274
97	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.995283	2023-09-07 06:03:43.995283
98	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:43.998868	2023-09-07 06:03:43.998868
99	7	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.002298	2023-09-07 06:03:44.002298
100	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.006312	2023-09-07 06:03:44.006312
101	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.013118	2023-09-07 06:03:44.013118
102	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.01865	2023-09-07 06:03:44.01865
103	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.023481	2023-09-07 06:03:44.023481
104	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.035096	2023-09-07 06:03:44.035096
105	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.046719	2023-09-07 06:03:44.046719
106	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.05058	2023-09-07 06:03:44.05058
107	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.054193	2023-09-07 06:03:44.054193
108	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.060215	2023-09-07 06:03:44.060215
109	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.063986	2023-09-07 06:03:44.063986
110	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.067713	2023-09-07 06:03:44.067713
111	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.071963	2023-09-07 06:03:44.071963
112	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.07609	2023-09-07 06:03:44.07609
113	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.080042	2023-09-07 06:03:44.080042
114	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.08631	2023-09-07 06:03:44.08631
115	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.091185	2023-09-07 06:03:44.091185
116	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.0952	2023-09-07 06:03:44.0952
117	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.101603	2023-09-07 06:03:44.101603
118	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.106861	2023-09-07 06:03:44.106861
119	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.111799	2023-09-07 06:03:44.111799
120	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.115473	2023-09-07 06:03:44.115473
121	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.12107	2023-09-07 06:03:44.12107
122	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.126857	2023-09-07 06:03:44.126857
123	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.131913	2023-09-07 06:03:44.131913
124	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.13999	2023-09-07 06:03:44.13999
125	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.143113	2023-09-07 06:03:44.143113
126	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.146321	2023-09-07 06:03:44.146321
127	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.149522	2023-09-07 06:03:44.149522
128	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.153697	2023-09-07 06:03:44.153697
129	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.157201	2023-09-07 06:03:44.157201
130	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.160518	2023-09-07 06:03:44.160518
131	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.163799	2023-09-07 06:03:44.163799
132	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.167155	2023-09-07 06:03:44.167155
133	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.1741	2023-09-07 06:03:44.1741
134	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.178737	2023-09-07 06:03:44.178737
135	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.182246	2023-09-07 06:03:44.182246
136	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.185554	2023-09-07 06:03:44.185554
137	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.190093	2023-09-07 06:03:44.190093
138	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.194278	2023-09-07 06:03:44.194278
139	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.197634	2023-09-07 06:03:44.197634
140	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.211112	2023-09-07 06:03:44.211112
141	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.21498	2023-09-07 06:03:44.21498
142	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.218542	2023-09-07 06:03:44.218542
143	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.222083	2023-09-07 06:03:44.222083
144	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.226179	2023-09-07 06:03:44.226179
145	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.229674	2023-09-07 06:03:44.229674
146	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.233106	2023-09-07 06:03:44.233106
147	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.236531	2023-09-07 06:03:44.236531
148	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.239826	2023-09-07 06:03:44.239826
149	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.24584	2023-09-07 06:03:44.24584
150	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.250641	2023-09-07 06:03:44.250641
151	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.254146	2023-09-07 06:03:44.254146
152	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.257557	2023-09-07 06:03:44.257557
153	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.262482	2023-09-07 06:03:44.262482
154	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.265777	2023-09-07 06:03:44.265777
155	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.269127	2023-09-07 06:03:44.269127
156	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.273704	2023-09-07 06:03:44.273704
157	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.277031	2023-09-07 06:03:44.277031
158	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.280256	2023-09-07 06:03:44.280256
159	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.283405	2023-09-07 06:03:44.283405
160	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.286604	2023-09-07 06:03:44.286604
161	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.290368	2023-09-07 06:03:44.290368
162	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.293455	2023-09-07 06:03:44.293455
163	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.296734	2023-09-07 06:03:44.296734
164	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.299988	2023-09-07 06:03:44.299988
165	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.305729	2023-09-07 06:03:44.305729
166	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.3103	2023-09-07 06:03:44.3103
167	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.313663	2023-09-07 06:03:44.313663
168	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.31743	2023-09-07 06:03:44.31743
169	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.324047	2023-09-07 06:03:44.324047
170	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.32855	2023-09-07 06:03:44.32855
171	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.331912	2023-09-07 06:03:44.331912
172	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.336523	2023-09-07 06:03:44.336523
173	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.340779	2023-09-07 06:03:44.340779
174	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.344415	2023-09-07 06:03:44.344415
175	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.34768	2023-09-07 06:03:44.34768
176	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.351137	2023-09-07 06:03:44.351137
177	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.355659	2023-09-07 06:03:44.355659
178	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.358879	2023-09-07 06:03:44.358879
179	12	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.362122	2023-09-07 06:03:44.362122
180	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.365276	2023-09-07 06:03:44.365276
181	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.370948	2023-09-07 06:03:44.370948
182	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.376617	2023-09-07 06:03:44.376617
183	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.380177	2023-09-07 06:03:44.380177
184	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.383257	2023-09-07 06:03:44.383257
185	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.38772	2023-09-07 06:03:44.38772
186	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.390908	2023-09-07 06:03:44.390908
187	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.394114	2023-09-07 06:03:44.394114
188	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.398857	2023-09-07 06:03:44.398857
189	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.401943	2023-09-07 06:03:44.401943
190	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.405102	2023-09-07 06:03:44.405102
191	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.408598	2023-09-07 06:03:44.408598
192	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.413014	2023-09-07 06:03:44.413014
193	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.420128	2023-09-07 06:03:44.420128
194	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.426364	2023-09-07 06:03:44.426364
195	11	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.430324	2023-09-07 06:03:44.430324
196	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.434126	2023-09-07 06:03:44.434126
197	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.439988	2023-09-07 06:03:44.439988
198	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.444851	2023-09-07 06:03:44.444851
199	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.448104	2023-09-07 06:03:44.448104
200	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.451687	2023-09-07 06:03:44.451687
201	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.459715	2023-09-07 06:03:44.459715
202	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.463132	2023-09-07 06:03:44.463132
203	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.466312	2023-09-07 06:03:44.466312
204	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.470839	2023-09-07 06:03:44.470839
205	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.474151	2023-09-07 06:03:44.474151
206	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.477391	2023-09-07 06:03:44.477391
207	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.480582	2023-09-07 06:03:44.480582
208	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.483885	2023-09-07 06:03:44.483885
209	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.486991	2023-09-07 06:03:44.486991
210	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.490356	2023-09-07 06:03:44.490356
211	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.494929	2023-09-07 06:03:44.494929
212	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.500686	2023-09-07 06:03:44.500686
213	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.510979	2023-09-07 06:03:44.510979
214	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.520692	2023-09-07 06:03:44.520692
215	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.524181	2023-09-07 06:03:44.524181
216	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.528983	2023-09-07 06:03:44.528983
217	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.532402	2023-09-07 06:03:44.532402
218	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.535784	2023-09-07 06:03:44.535784
219	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.540535	2023-09-07 06:03:44.540535
220	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.544184	2023-09-07 06:03:44.544184
221	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.549109	2023-09-07 06:03:44.549109
222	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.553802	2023-09-07 06:03:44.553802
223	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.558307	2023-09-07 06:03:44.558307
224	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.561543	2023-09-07 06:03:44.561543
225	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.564857	2023-09-07 06:03:44.564857
226	14	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.568365	2023-09-07 06:03:44.568365
227	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.571596	2023-09-07 06:03:44.571596
228	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.581421	2023-09-07 06:03:44.581421
229	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.587181	2023-09-07 06:03:44.587181
230	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.591399	2023-09-07 06:03:44.591399
231	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.596642	2023-09-07 06:03:44.596642
232	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.606445	2023-09-07 06:03:44.606445
233	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.61076	2023-09-07 06:03:44.61076
234	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.614288	2023-09-07 06:03:44.614288
235	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.621996	2023-09-07 06:03:44.621996
236	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.625304	2023-09-07 06:03:44.625304
237	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.62993	2023-09-07 06:03:44.62993
238	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.633374	2023-09-07 06:03:44.633374
239	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.636881	2023-09-07 06:03:44.636881
240	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.640158	2023-09-07 06:03:44.640158
241	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.643338	2023-09-07 06:03:44.643338
242	15	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.646647	2023-09-07 06:03:44.646647
243	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.649804	2023-09-07 06:03:44.649804
244	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.655661	2023-09-07 06:03:44.655661
245	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.660076	2023-09-07 06:03:44.660076
246	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.663096	2023-09-07 06:03:44.663096
247	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.666165	2023-09-07 06:03:44.666165
248	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.670536	2023-09-07 06:03:44.670536
249	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.673622	2023-09-07 06:03:44.673622
250	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.676711	2023-09-07 06:03:44.676711
251	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.681069	2023-09-07 06:03:44.681069
252	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.684242	2023-09-07 06:03:44.684242
253	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.687379	2023-09-07 06:03:44.687379
254	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.690365	2023-09-07 06:03:44.690365
255	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.69347	2023-09-07 06:03:44.69347
256	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.696665	2023-09-07 06:03:44.696665
257	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.699676	2023-09-07 06:03:44.699676
258	16	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.703879	2023-09-07 06:03:44.703879
259	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.709553	2023-09-07 06:03:44.709553
260	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.715928	2023-09-07 06:03:44.715928
261	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.720441	2023-09-07 06:03:44.720441
262	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.723828	2023-09-07 06:03:44.723828
263	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.727015	2023-09-07 06:03:44.727015
264	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.731502	2023-09-07 06:03:44.731502
265	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.73486	2023-09-07 06:03:44.73486
266	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.738096	2023-09-07 06:03:44.738096
267	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.742429	2023-09-07 06:03:44.742429
268	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.745532	2023-09-07 06:03:44.745532
269	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.748918	2023-09-07 06:03:44.748918
270	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.752143	2023-09-07 06:03:44.752143
271	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.755251	2023-09-07 06:03:44.755251
272	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.758285	2023-09-07 06:03:44.758285
273	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.761333	2023-09-07 06:03:44.761333
274	17	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.767875	2023-09-07 06:03:44.767875
275	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.771132	2023-09-07 06:03:44.771132
276	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.777778	2023-09-07 06:03:44.777778
277	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.78377	2023-09-07 06:03:44.78377
278	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.787177	2023-09-07 06:03:44.787177
279	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.790538	2023-09-07 06:03:44.790538
280	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.795181	2023-09-07 06:03:44.795181
281	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.798337	2023-09-07 06:03:44.798337
282	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.802652	2023-09-07 06:03:44.802652
283	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.80753	2023-09-07 06:03:44.80753
284	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.811698	2023-09-07 06:03:44.811698
285	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.814842	2023-09-07 06:03:44.814842
286	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.818519	2023-09-07 06:03:44.818519
287	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.821617	2023-09-07 06:03:44.821617
288	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.824918	2023-09-07 06:03:44.824918
289	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.828103	2023-09-07 06:03:44.828103
290	18	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.831342	2023-09-07 06:03:44.831342
291	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.834688	2023-09-07 06:03:44.834688
292	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.840401	2023-09-07 06:03:44.840401
293	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.844925	2023-09-07 06:03:44.844925
294	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.848038	2023-09-07 06:03:44.848038
295	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.852246	2023-09-07 06:03:44.852246
296	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.856812	2023-09-07 06:03:44.856812
297	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.861147	2023-09-07 06:03:44.861147
298	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.866845	2023-09-07 06:03:44.866845
299	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.872523	2023-09-07 06:03:44.872523
300	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.875781	2023-09-07 06:03:44.875781
301	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.878933	2023-09-07 06:03:44.878933
302	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.882744	2023-09-07 06:03:44.882744
303	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.886062	2023-09-07 06:03:44.886062
304	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.889371	2023-09-07 06:03:44.889371
305	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.892509	2023-09-07 06:03:44.892509
306	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.897098	2023-09-07 06:03:44.897098
307	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.902883	2023-09-07 06:03:44.902883
308	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.90842	2023-09-07 06:03:44.90842
309	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.913072	2023-09-07 06:03:44.913072
310	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.916296	2023-09-07 06:03:44.916296
311	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.92141	2023-09-07 06:03:44.92141
312	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.925075	2023-09-07 06:03:44.925075
313	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.928247	2023-09-07 06:03:44.928247
314	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.933069	2023-09-07 06:03:44.933069
315	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.936704	2023-09-07 06:03:44.936704
316	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.94001	2023-09-07 06:03:44.94001
317	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.943286	2023-09-07 06:03:44.943286
318	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.946622	2023-09-07 06:03:44.946622
319	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.949788	2023-09-07 06:03:44.949788
320	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.953571	2023-09-07 06:03:44.953571
321	20	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.962729	2023-09-07 06:03:44.962729
322	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.966344	2023-09-07 06:03:44.966344
323	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.973299	2023-09-07 06:03:44.973299
324	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.978197	2023-09-07 06:03:44.978197
325	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.981533	2023-09-07 06:03:44.981533
326	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.984718	2023-09-07 06:03:44.984718
327	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.989088	2023-09-07 06:03:44.989088
328	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.99253	2023-09-07 06:03:44.99253
329	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:44.995829	2023-09-07 06:03:44.995829
330	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.000526	2023-09-07 06:03:45.000526
331	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.064757	2023-09-07 06:03:45.064757
332	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.087302	2023-09-07 06:03:45.087302
333	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.095254	2023-09-07 06:03:45.095254
334	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.098917	2023-09-07 06:03:45.098917
335	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.123809	2023-09-07 06:03:45.123809
336	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.131793	2023-09-07 06:03:45.131793
337	21	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.145907	2023-09-07 06:03:45.145907
338	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.175206	2023-09-07 06:03:45.175206
339	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.191971	2023-09-07 06:03:45.191971
340	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.214659	2023-09-07 06:03:45.214659
341	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.220823	2023-09-07 06:03:45.220823
342	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.260308	2023-09-07 06:03:45.260308
343	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.270969	2023-09-07 06:03:45.270969
344	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.276218	2023-09-07 06:03:45.276218
345	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.282568	2023-09-07 06:03:45.282568
346	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.29012	2023-09-07 06:03:45.29012
347	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.298366	2023-09-07 06:03:45.298366
348	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.303814	2023-09-07 06:03:45.303814
349	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.309477	2023-09-07 06:03:45.309477
350	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.3147	2023-09-07 06:03:45.3147
351	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.320236	2023-09-07 06:03:45.320236
352	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.363665	2023-09-07 06:03:45.363665
353	22	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.368569	2023-09-07 06:03:45.368569
354	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.377161	2023-09-07 06:03:45.377161
355	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.386522	2023-09-07 06:03:45.386522
356	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.393196	2023-09-07 06:03:45.393196
357	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.397879	2023-09-07 06:03:45.397879
358	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.408668	2023-09-07 06:03:45.408668
359	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.420384	2023-09-07 06:03:45.420384
360	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.427411	2023-09-07 06:03:45.427411
361	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.431637	2023-09-07 06:03:45.431637
362	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.464898	2023-09-07 06:03:45.464898
363	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.46865	2023-09-07 06:03:45.46865
364	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.472165	2023-09-07 06:03:45.472165
365	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.475676	2023-09-07 06:03:45.475676
366	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.479064	2023-09-07 06:03:45.479064
367	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.482534	2023-09-07 06:03:45.482534
368	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.485952	2023-09-07 06:03:45.485952
369	23	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.489589	2023-09-07 06:03:45.489589
370	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.497002	2023-09-07 06:03:45.497002
371	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.503155	2023-09-07 06:03:45.503155
372	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.507897	2023-09-07 06:03:45.507897
373	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.511382	2023-09-07 06:03:45.511382
374	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.514748	2023-09-07 06:03:45.514748
375	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.519644	2023-09-07 06:03:45.519644
376	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.522917	2023-09-07 06:03:45.522917
377	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.526261	2023-09-07 06:03:45.526261
378	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.530818	2023-09-07 06:03:45.530818
379	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.534059	2023-09-07 06:03:45.534059
380	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.537397	2023-09-07 06:03:45.537397
381	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.540519	2023-09-07 06:03:45.540519
382	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.543609	2023-09-07 06:03:45.543609
383	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.546842	2023-09-07 06:03:45.546842
384	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.550258	2023-09-07 06:03:45.550258
385	25	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.553553	2023-09-07 06:03:45.553553
386	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.55663	2023-09-07 06:03:45.55663
387	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.562396	2023-09-07 06:03:45.562396
388	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.567082	2023-09-07 06:03:45.567082
389	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.570293	2023-09-07 06:03:45.570293
390	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.573351	2023-09-07 06:03:45.573351
391	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.578771	2023-09-07 06:03:45.578771
392	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.58251	2023-09-07 06:03:45.58251
393	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.588835	2023-09-07 06:03:45.588835
394	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.598	2023-09-07 06:03:45.598
395	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.60228	2023-09-07 06:03:45.60228
396	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.605509	2023-09-07 06:03:45.605509
397	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.608735	2023-09-07 06:03:45.608735
398	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.611989	2023-09-07 06:03:45.611989
399	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.615199	2023-09-07 06:03:45.615199
400	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.618495	2023-09-07 06:03:45.618495
401	24	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.622512	2023-09-07 06:03:45.622512
402	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.625824	2023-09-07 06:03:45.625824
403	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.632712	2023-09-07 06:03:45.632712
404	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.637668	2023-09-07 06:03:45.637668
405	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.641047	2023-09-07 06:03:45.641047
406	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.655693	2023-09-07 06:03:45.655693
407	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.662356	2023-09-07 06:03:45.662356
408	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.666056	2023-09-07 06:03:45.666056
409	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.669927	2023-09-07 06:03:45.669927
410	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.674523	2023-09-07 06:03:45.674523
411	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.677738	2023-09-07 06:03:45.677738
412	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.681368	2023-09-07 06:03:45.681368
413	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.685824	2023-09-07 06:03:45.685824
414	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.6891	2023-09-07 06:03:45.6891
415	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.692636	2023-09-07 06:03:45.692636
416	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.696123	2023-09-07 06:03:45.696123
417	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.699588	2023-09-07 06:03:45.699588
418	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.70327	2023-09-07 06:03:45.70327
419	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.709867	2023-09-07 06:03:45.709867
420	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.714656	2023-09-07 06:03:45.714656
421	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.718081	2023-09-07 06:03:45.718081
422	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.721697	2023-09-07 06:03:45.721697
423	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.726457	2023-09-07 06:03:45.726457
424	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.729595	2023-09-07 06:03:45.729595
425	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.732902	2023-09-07 06:03:45.732902
426	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.737804	2023-09-07 06:03:45.737804
427	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.741935	2023-09-07 06:03:45.741935
428	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.745723	2023-09-07 06:03:45.745723
429	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.748977	2023-09-07 06:03:45.748977
430	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.752713	2023-09-07 06:03:45.752713
431	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.756928	2023-09-07 06:03:45.756928
432	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.760216	2023-09-07 06:03:45.760216
433	27	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.764346	2023-09-07 06:03:45.764346
434	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.767677	2023-09-07 06:03:45.767677
435	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.783662	2023-09-07 06:03:45.783662
436	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.791055	2023-09-07 06:03:45.791055
437	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.796445	2023-09-07 06:03:45.796445
438	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.800164	2023-09-07 06:03:45.800164
439	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.804994	2023-09-07 06:03:45.804994
440	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.808192	2023-09-07 06:03:45.808192
441	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.811503	2023-09-07 06:03:45.811503
442	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.816101	2023-09-07 06:03:45.816101
443	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.819289	2023-09-07 06:03:45.819289
444	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.822458	2023-09-07 06:03:45.822458
445	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.825576	2023-09-07 06:03:45.825576
446	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.828752	2023-09-07 06:03:45.828752
447	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.833497	2023-09-07 06:03:45.833497
448	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.839696	2023-09-07 06:03:45.839696
449	28	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.843149	2023-09-07 06:03:45.843149
450	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.846441	2023-09-07 06:03:45.846441
451	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.85261	2023-09-07 06:03:45.85261
452	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.857255	2023-09-07 06:03:45.857255
453	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.860607	2023-09-07 06:03:45.860607
454	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.863914	2023-09-07 06:03:45.863914
455	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.868861	2023-09-07 06:03:45.868861
456	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.872125	2023-09-07 06:03:45.872125
457	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.875225	2023-09-07 06:03:45.875225
458	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.880094	2023-09-07 06:03:45.880094
459	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.883277	2023-09-07 06:03:45.883277
460	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.886804	2023-09-07 06:03:45.886804
461	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.889908	2023-09-07 06:03:45.889908
462	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.893232	2023-09-07 06:03:45.893232
463	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.896375	2023-09-07 06:03:45.896375
464	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.899691	2023-09-07 06:03:45.899691
465	29	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.903166	2023-09-07 06:03:45.903166
466	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.909997	2023-09-07 06:03:45.909997
467	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.916275	2023-09-07 06:03:45.916275
468	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.921625	2023-09-07 06:03:45.921625
469	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.925077	2023-09-07 06:03:45.925077
470	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.928589	2023-09-07 06:03:45.928589
471	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.933188	2023-09-07 06:03:45.933188
472	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.936646	2023-09-07 06:03:45.936646
473	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.940051	2023-09-07 06:03:45.940051
474	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.944739	2023-09-07 06:03:45.944739
475	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.948041	2023-09-07 06:03:45.948041
476	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.951517	2023-09-07 06:03:45.951517
477	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.954759	2023-09-07 06:03:45.954759
478	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.958995	2023-09-07 06:03:45.958995
479	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.962518	2023-09-07 06:03:45.962518
480	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.966461	2023-09-07 06:03:45.966461
481	30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.970435	2023-09-07 06:03:45.970435
482	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.973908	2023-09-07 06:03:45.973908
483	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.98069	2023-09-07 06:03:45.98069
484	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.993142	2023-09-07 06:03:45.993142
485	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:45.997049	2023-09-07 06:03:45.997049
486	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:46.00065	2023-09-07 06:03:46.00065
487	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:46.012912	2023-09-07 06:03:46.012912
488	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:46.017376	2023-09-07 06:03:46.017376
489	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:46.021517	2023-09-07 06:03:46.021517
490	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:46.026381	2023-09-07 06:03:46.026381
491	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:46.029652	2023-09-07 06:03:46.029652
492	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:46.033247	2023-09-07 06:03:46.033247
493	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:46.036634	2023-09-07 06:03:46.036634
494	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:46.03989	2023-09-07 06:03:46.03989
495	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:46.043454	2023-09-07 06:03:46.043454
496	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:46.046995	2023-09-07 06:03:46.046995
497	31	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:46.050873	2023-09-07 06:03:46.050873
498	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:46.054051	2023-09-07 06:03:46.054051
499	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:46.060842	2023-09-07 06:03:46.060842
500	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:46.071807	2023-09-07 06:03:46.071807
501	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:46.075187	2023-09-07 06:03:46.075187
502	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:46.078396	2023-09-07 06:03:46.078396
503	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:46.083048	2023-09-07 06:03:46.083048
504	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:46.087768	2023-09-07 06:03:46.087768
505	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:46.09454	2023-09-07 06:03:46.09454
506	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:46.099483	2023-09-07 06:03:46.099483
507	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:46.104729	2023-09-07 06:03:46.104729
508	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:46.108121	2023-09-07 06:03:46.108121
509	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:46.111204	2023-09-07 06:03:46.111204
510	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:46.114479	2023-09-07 06:03:46.114479
511	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:46.126159	2023-09-07 06:03:46.126159
512	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:46.131911	2023-09-07 06:03:46.131911
513	32	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:46.135354	2023-09-07 06:03:46.135354
514	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:03:46.138729	2023-09-07 06:03:46.138729
\.


--
-- Data for Name: catalog_entity_type; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.catalog_entity_type (id, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: catalog_form; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.catalog_form (id, data_type, name, created_at, updated_at) FROM stdin;
1	level_of_goverment	Municipal	2023-09-07 06:03:41.650531	2023-09-07 06:03:41.650531
2	level_of_goverment	Estatal/Departamental	2023-09-07 06:03:41.653451	2023-09-07 06:03:41.653451
3	level_of_goverment	Federal	2023-09-07 06:03:41.655966	2023-09-07 06:03:41.655966
4	level_of_goverment	Internacional	2023-09-07 06:03:41.658466	2023-09-07 06:03:41.658466
5	level_of_goverment	Otros	2023-09-07 06:03:41.661374	2023-09-07 06:03:41.661374
6	service_type	Asesoría legal remota o presencial	2023-09-07 06:03:41.664165	2023-09-07 06:03:41.664165
7	service_type	Revisión de contratos y escritos	2023-09-07 06:03:41.666508	2023-09-07 06:03:41.666508
8	service_type	Generación de contratos y escritos	2023-09-07 06:03:41.668928	2023-09-07 06:03:41.668928
9	service_type	Gestión de trámites administrativos	2023-09-07 06:03:41.671267	2023-09-07 06:03:41.671267
10	service_type	Gestión de trámites judiciales	2023-09-07 06:03:41.674275	2023-09-07 06:03:41.674275
11	service_type	Servicios de conciliación y mediación	2023-09-07 06:03:41.676675	2023-09-07 06:03:41.676675
12	service_type	Servicios notariales y de correduría pública	2023-09-07 06:03:41.679934	2023-09-07 06:03:41.679934
13	service_type	Representación legal en litigios	2023-09-07 06:03:41.682183	2023-09-07 06:03:41.682183
14	service_type	Otros	2023-09-07 06:03:41.685995	2023-09-07 06:03:41.685995
15	languages	Inglés	2023-09-07 06:03:41.688445	2023-09-07 06:03:41.688445
16	languages	Portugués	2023-09-07 06:03:41.691182	2023-09-07 06:03:41.691182
17	languages	Francés	2023-09-07 06:03:41.693625	2023-09-07 06:03:41.693625
18	languages	Náhuatl	2023-09-07 06:03:41.696034	2023-09-07 06:03:41.696034
19	languages	Maya	2023-09-07 06:03:41.698293	2023-09-07 06:03:41.698293
20	languages	Mixteco	2023-09-07 06:03:41.701152	2023-09-07 06:03:41.701152
21	languages	Zapoteco	2023-09-07 06:03:41.704685	2023-09-07 06:03:41.704685
22	document_type	Credencial para votar (frente)	2023-09-07 06:03:41.708303	2023-09-07 06:03:41.708303
23	document_type	Credencial para votar (reverso)	2023-09-07 06:03:41.710802	2023-09-07 06:03:41.710802
24	document_type	Credencial para votar (selfie)	2023-09-07 06:03:41.713389	2023-09-07 06:03:41.713389
25	document_type	Pasaporte (frente)	2023-09-07 06:03:41.715939	2023-09-07 06:03:41.715939
26	document_type	Pasaporte (reverso)	2023-09-07 06:03:41.719493	2023-09-07 06:03:41.719493
27	document_type	Pasaporte (selfie)	2023-09-07 06:03:41.721992	2023-09-07 06:03:41.721992
28	document_type	Cédula profesional (Otra)	2023-09-07 06:03:41.724338	2023-09-07 06:03:41.724338
29	document_type	Cédula profesional (Licenciatura en derecho)	2023-09-07 06:03:41.726686	2023-09-07 06:03:41.726686
30	document_type	Carta de pasante	2023-09-07 06:03:41.729322	2023-09-07 06:03:41.729322
31	grade	Primaria	2023-09-07 06:03:41.731962	2023-09-07 06:03:41.731962
32	grade	Secundaria	2023-09-07 06:03:41.734305	2023-09-07 06:03:41.734305
33	grade	Preparatoria	2023-09-07 06:03:41.736788	2023-09-07 06:03:41.736788
34	grade	Pasante	2023-09-07 06:03:41.739446	2023-09-07 06:03:41.739446
35	grade	Licenciatura	2023-09-07 06:03:41.743157	2023-09-07 06:03:41.743157
36	grade	Especialización	2023-09-07 06:03:41.745504	2023-09-07 06:03:41.745504
37	grade	Maestría	2023-09-07 06:03:41.748985	2023-09-07 06:03:41.748985
38	grade	Doctorado	2023-09-07 06:03:41.751416	2023-09-07 06:03:41.751416
39	grade	Cursos y diplomados	2023-09-07 06:03:41.753846	2023-09-07 06:03:41.753846
40	grade	Otros	2023-09-07 06:03:41.756365	2023-09-07 06:03:41.756365
41	gender	Hombre	2023-09-07 06:03:41.759058	2023-09-07 06:03:41.759058
42	gender	Mujer	2023-09-07 06:03:41.76251	2023-09-07 06:03:41.76251
43	gender	Otro	2023-09-07 06:03:41.766383	2023-09-07 06:03:41.766383
44	gender	No especifica	2023-09-07 06:03:41.76876	2023-09-07 06:03:41.76876
45	evidence_type	Documento	2023-09-07 06:03:41.771245	2023-09-07 06:03:41.771245
46	evidence_type	Acción	2023-09-07 06:03:41.780958	2023-09-07 06:03:41.780958
47	evidence_type	Reunión	2023-09-07 06:03:41.783807	2023-09-07 06:03:41.783807
48	currencies	MXN	2023-09-07 06:03:41.786404	2023-09-07 06:03:41.786404
49	currencies	USD	2023-09-07 06:03:41.789962	2023-09-07 06:03:41.789962
50	status	Completado	2023-09-07 06:03:41.792428	2023-09-07 06:03:41.792428
51	status	En proceso	2023-09-07 06:03:41.795032	2023-09-07 06:03:41.795032
52	status	En espera	2023-09-07 06:03:41.797612	2023-09-07 06:03:41.797612
53	status	Cancelado	2023-09-07 06:03:41.803292	2023-09-07 06:03:41.803292
\.


--
-- Data for Name: catalog_general_procedures; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.catalog_general_procedures (id, description) FROM stdin;
\.


--
-- Data for Name: catalog_instances_interest; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.catalog_instances_interest (id, description) FROM stdin;
\.


--
-- Data for Name: catalog_institutions; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.catalog_institutions (id, description) FROM stdin;
\.


--
-- Data for Name: catalog_jurisdiction; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.catalog_jurisdiction (id, description) FROM stdin;
\.


--
-- Data for Name: catalog_languages; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.catalog_languages (id, description) FROM stdin;
\.


--
-- Data for Name: catalog_legal_services; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.catalog_legal_services (id, description) FROM stdin;
\.


--
-- Data for Name: catalog_matter; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.catalog_matter (id, description) FROM stdin;
\.


--
-- Data for Name: catalog_scope_government; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.catalog_scope_government (id, description) FROM stdin;
\.


--
-- Data for Name: catalog_specialist_type; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.catalog_specialist_type (id, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: catalog_specific_issues; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.catalog_specific_issues (id, description) FROM stdin;
\.


--
-- Data for Name: catalog_subject_expertise; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.catalog_subject_expertise (id, legal_subject, expertise, subexpertise, created_at, updated_at) FROM stdin;
1	administrativo	actos administrativos ambientales	evaluación de impacto ambiental	2023-09-07 06:03:41.813207	2023-09-07 06:03:41.813207
2	administrativo	aduanero	comercio exterior	2023-09-07 06:03:41.819837	2023-09-07 06:03:41.819837
3	administrativo	aduanero	importación de vehículos	2023-09-07 06:03:41.822425	2023-09-07 06:03:41.822425
4	administrativo	aduanero	impuesto aduanero	2023-09-07 06:03:41.825121	2023-09-07 06:03:41.825121
5	administrativo	aduanero	impuestos aduaneros	2023-09-07 06:03:41.82775	2023-09-07 06:03:41.82775
6	administrativo	ambiental	contaminación ambiental	2023-09-07 06:03:41.830286	2023-09-07 06:03:41.830286
7	administrativo	ambiental	desecho de sustancias peligrosas	2023-09-07 06:03:41.83279	2023-09-07 06:03:41.83279
8	administrativo	autorizaciones sanitarias	consumo de canabis	2023-09-07 06:03:41.836304	2023-09-07 06:03:41.836304
9	administrativo	aviación civil	drones	2023-09-07 06:03:41.839418	2023-09-07 06:03:41.839418
10	administrativo	bancos	derechos de usuarios de servicios financieros	2023-09-07 06:03:41.842047	2023-09-07 06:03:41.842047
11	administrativo	coacción administrativa	infracciones y sanciones	2023-09-07 06:03:41.844498	2023-09-07 06:03:41.844498
12	administrativo	comercio exterior	derechos aduanales	2023-09-07 06:03:41.847242	2023-09-07 06:03:41.847242
13	administrativo	concesiones	uso del espectro radioeléctrico	2023-09-07 06:03:41.849642	2023-09-07 06:03:41.849642
14	administrativo	construcción	clausuras	2023-09-07 06:03:41.852276	2023-09-07 06:03:41.852276
15	administrativo	construcción	permisos de construcción	2023-09-07 06:03:41.854672	2023-09-07 06:03:41.854672
16	administrativo	contencioso administrativo	nulidad de acto administrativo	2023-09-07 06:03:41.856999	2023-09-07 06:03:41.856999
17	administrativo	contencioso administrativo	recursos	2023-09-07 06:03:41.86022	2023-09-07 06:03:41.86022
18	administrativo	contencioso administrativo	revisión	2023-09-07 06:03:41.862681	2023-09-07 06:03:41.862681
19	administrativo	contencioso administrativo local	procedimiento administrativo de ejecución	2023-09-07 06:03:41.865007	2023-09-07 06:03:41.865007
20	administrativo	defensa del ciudadano	recursos administrativos	2023-09-07 06:03:41.867412	2023-09-07 06:03:41.867412
21	administrativo	delitos de abuso de autoridad y uso ilegal de la fuerza pública	abuso de autoridad	2023-09-07 06:03:41.869829	2023-09-07 06:03:41.869829
22	administrativo	derecho al agua	uso de agua	2023-09-07 06:03:41.872538	2023-09-07 06:03:41.872538
23	administrativo	derecho ambiental	contencioso administrativo	2023-09-07 06:03:41.875107	2023-09-07 06:03:41.875107
24	administrativo	derecho ambiental	regulación	2023-09-07 06:03:41.884401	2023-09-07 06:03:41.884401
25	administrativo	derecho de autor	extinción	2023-09-07 06:03:41.887073	2023-09-07 06:03:41.887073
26	administrativo	derecho de autor	registro	2023-09-07 06:03:41.889903	2023-09-07 06:03:41.889903
27	administrativo	derecho de la alimentación	auditorías	2023-09-07 06:03:41.892252	2023-09-07 06:03:41.892252
28	administrativo	derecho de la alimentación	normas técnicas	2023-09-07 06:03:41.894694	2023-09-07 06:03:41.894694
29	administrativo	derecho de la alimentación	permiso y licencias	2023-09-07 06:03:41.897123	2023-09-07 06:03:41.897123
30	administrativo	derecho de la alimentación	políticas públicas	2023-09-07 06:03:41.899666	2023-09-07 06:03:41.899666
31	administrativo	derecho de la alimentación	procedimientos de inspección	2023-09-07 06:03:41.902291	2023-09-07 06:03:41.902291
32	administrativo	derecho de la cultura	protección de datos personales	2023-09-07 06:03:41.904638	2023-09-07 06:03:41.904638
33	administrativo	derecho de la inmigración	cumplimiento normativo	2023-09-07 06:03:41.907051	2023-09-07 06:03:41.907051
34	administrativo	derecho de los consumidores	usuarios de telefonía móvil	2023-09-07 06:03:41.909424	2023-09-07 06:03:41.909424
35	administrativo	derecho de los consumidores	usuarios de transporte aéreo	2023-09-07 06:03:41.911792	2023-09-07 06:03:41.911792
36	administrativo	derecho de los transportes	contratos públicos	2023-09-07 06:03:41.914172	2023-09-07 06:03:41.914172
37	administrativo	derecho electoral	delitos electorales	2023-09-07 06:03:41.916509	2023-09-07 06:03:41.916509
38	administrativo	derechos de autor	infracciones en materia de derechos de autor	2023-09-07 06:03:41.918954	2023-09-07 06:03:41.918954
39	administrativo	derechos de autor	regalías	2023-09-07 06:03:41.921394	2023-09-07 06:03:41.921394
40	administrativo	derechos de autor	uso	2023-09-07 06:03:41.923911	2023-09-07 06:03:41.923911
41	administrativo	derechos de autor	violación al derecho de autor	2023-09-07 06:03:41.926185	2023-09-07 06:03:41.926185
42	administrativo	derechos del consumidor	audiencia de conciliación profeco	2023-09-07 06:03:41.928441	2023-09-07 06:03:41.928441
43	administrativo	derechos del consumidor	baja de servicio	2023-09-07 06:03:41.930751	2023-09-07 06:03:41.930751
44	administrativo	derechos del consumidor	calidad en el servicio	2023-09-07 06:03:41.933174	2023-09-07 06:03:41.933174
45	administrativo	derechos del consumidor	cobro indebido	2023-09-07 06:03:41.935492	2023-09-07 06:03:41.935492
46	administrativo	derechos del consumidor	contratos de adhesión	2023-09-07 06:03:41.937775	2023-09-07 06:03:41.937775
47	administrativo	derechos del consumidor	garantía de productos	2023-09-07 06:03:41.940076	2023-09-07 06:03:41.940076
48	administrativo	derechos del consumidor	negativa de servicio al público en general	2023-09-07 06:03:41.942393	2023-09-07 06:03:41.942393
49	administrativo	derechos del consumidor	negativa de venta al público en general	2023-09-07 06:03:41.944741	2023-09-07 06:03:41.944741
50	administrativo	derechos laborales	contrato de trabajo	2023-09-07 06:03:41.946992	2023-09-07 06:03:41.946992
51	administrativo	educación superior	certificado de estudios	2023-09-07 06:03:41.949374	2023-09-07 06:03:41.949374
52	administrativo	educación superior	derechos estudiantiles	2023-09-07 06:03:41.951639	2023-09-07 06:03:41.951639
53	administrativo	educación superior	reconocimiento de títulos profesionales	2023-09-07 06:03:41.954001	2023-09-07 06:03:41.954001
54	administrativo	educación superior	sanciones	2023-09-07 06:03:41.956403	2023-09-07 06:03:41.956403
55	administrativo	ejido	propiedad ejidal	2023-09-07 06:03:41.958805	2023-09-07 06:03:41.958805
56	administrativo	expropiación	bienes culturales	2023-09-07 06:03:41.961284	2023-09-07 06:03:41.961284
57	administrativo	expropiación	indemnización constitucional	2023-09-07 06:03:41.963556	2023-09-07 06:03:41.963556
58	administrativo	extranjeria	deportación	2023-09-07 06:03:41.965958	2023-09-07 06:03:41.965958
59	administrativo	extranjeria	solicitud de refugio	2023-09-07 06:03:41.96845	2023-09-07 06:03:41.96845
60	administrativo	extranjería	infracciones migratorias	2023-09-07 06:03:41.970745	2023-09-07 06:03:41.970745
61	administrativo	extranjería	inspección migratoria	2023-09-07 06:03:41.973088	2023-09-07 06:03:41.973088
62	administrativo	extranjería	residencia temporal	2023-09-07 06:03:41.975482	2023-09-07 06:03:41.975482
63	administrativo	permisos administrativos	cerrajería	2023-09-07 06:03:41.977847	2023-09-07 06:03:41.977847
64	administrativo	permisos administrativos locales	permisos de filmación	2023-09-07 06:03:41.980138	2023-09-07 06:03:41.980138
65	administrativo	permisos adminsitrativos	registro vehicular	2023-09-07 06:03:41.98241	2023-09-07 06:03:41.98241
66	administrativo	permisos locales a la propiedad	uso de suelo	2023-09-07 06:03:41.984755	2023-09-07 06:03:41.984755
67	administrativo	permisos vehiculares	licencia de conducir para personas con discapacidad visual	2023-09-07 06:03:41.987026	2023-09-07 06:03:41.987026
68	administrativo	presupuesto de egresos	control de gasto público	2023-09-07 06:03:41.989587	2023-09-07 06:03:41.989587
69	administrativo	propiedad intelectual	marca	2023-09-07 06:03:41.992077	2023-09-07 06:03:41.992077
70	administrativo	propiedad intelectual	marcas	2023-09-07 06:03:41.99443	2023-09-07 06:03:41.99443
71	administrativo	protección civil	riesgo habitacional	2023-09-07 06:03:41.996894	2023-09-07 06:03:41.996894
72	administrativo	protección de animales	actos de crueldad animal	2023-09-07 06:03:41.999194	2023-09-07 06:03:41.999194
73	administrativo	protección de datos personales	derechos arco	2023-09-07 06:03:42.009362	2023-09-07 06:03:42.009362
74	administrativo	registro de vehículos automotorez	alta de dueño	2023-09-07 06:03:42.014522	2023-09-07 06:03:42.014522
75	administrativo	registro vehicular	licencia de conducir	2023-09-07 06:03:42.017239	2023-09-07 06:03:42.017239
76	administrativo	reglamento víal	detención por infracciones	2023-09-07 06:03:42.020616	2023-09-07 06:03:42.020616
77	administrativo	reglamento víal	infracciones de tránsito	2023-09-07 06:03:42.023254	2023-09-07 06:03:42.023254
78	administrativo	reglamento víal	uso para personas con discapacidad	2023-09-07 06:03:42.026839	2023-09-07 06:03:42.026839
79	administrativo	regulación sanitaria	disposición de restos fúnebres	2023-09-07 06:03:42.029969	2023-09-07 06:03:42.029969
80	administrativo	responsabilidad del estado	responsabilidad patrimonial	2023-09-07 06:03:42.032417	2023-09-07 06:03:42.032417
81	administrativo	seguridad pública	selección de personal policial	2023-09-07 06:03:42.034904	2023-09-07 06:03:42.034904
82	administrativo	seguridad social	pensiones	2023-09-07 06:03:42.040396	2023-09-07 06:03:42.040396
83	administrativo	servidores públicos	deberes de servidores públicos	2023-09-07 06:03:42.04398	2023-09-07 06:03:42.04398
84	administrativo	órgano interno de control	quejas contra funcionarios públicos	2023-09-07 06:03:42.04701	2023-09-07 06:03:42.04701
85	civil	alimentos	pensión alimenticia	2023-09-07 06:03:42.059067	2023-09-07 06:03:42.059067
86	civil	arrendamiento	contrato	2023-09-07 06:03:42.064838	2023-09-07 06:03:42.064838
87	civil	capacidad	voluntad anticipada	2023-09-07 06:03:42.070485	2023-09-07 06:03:42.070485
88	civil	condominio	administración	2023-09-07 06:03:42.075634	2023-09-07 06:03:42.075634
89	civil	condominio	conflictos vecinales	2023-09-07 06:03:42.089138	2023-09-07 06:03:42.089138
90	civil	condominio	reglamento de condominio	2023-09-07 06:03:42.103707	2023-09-07 06:03:42.103707
91	civil	contrato	arrendamiento	2023-09-07 06:03:42.107712	2023-09-07 06:03:42.107712
92	civil	contrato	incumplimiento de contrato	2023-09-07 06:03:42.110784	2023-09-07 06:03:42.110784
93	civil	contrato	prestación de servicios profesionales	2023-09-07 06:03:42.113982	2023-09-07 06:03:42.113982
94	civil	contratos	arrendamiento vivienda de interes social	2023-09-07 06:03:42.116959	2023-09-07 06:03:42.116959
95	civil	contratos	comodato	2023-09-07 06:03:42.120443	2023-09-07 06:03:42.120443
96	civil	contratos	compraventa de bien mueble	2023-09-07 06:03:42.123891	2023-09-07 06:03:42.123891
97	civil	contratos	compraventa de bienes muebles	2023-09-07 06:03:42.127908	2023-09-07 06:03:42.127908
98	civil	contratos	compraventa de inmuebles	2023-09-07 06:03:42.133509	2023-09-07 06:03:42.133509
99	civil	contratos	contrato de adhesión	2023-09-07 06:03:42.136542	2023-09-07 06:03:42.136542
100	civil	contratos	fideicomiso	2023-09-07 06:03:42.141022	2023-09-07 06:03:42.141022
101	civil	contratos	incumplimiento de contratos	2023-09-07 06:03:42.144535	2023-09-07 06:03:42.144535
102	civil	contratos	mútuo	2023-09-07 06:03:42.147932	2023-09-07 06:03:42.147932
103	civil	contratos	permuta	2023-09-07 06:03:42.153618	2023-09-07 06:03:42.153618
104	civil	deuda	documentación de deuda	2023-09-07 06:03:42.160747	2023-09-07 06:03:42.160747
105	civil	deuda	ejecución de embargo	2023-09-07 06:03:42.163696	2023-09-07 06:03:42.163696
106	civil	deuda	extinción de obligaciones	2023-09-07 06:03:42.167071	2023-09-07 06:03:42.167071
107	civil	deuda	fiador solidario	2023-09-07 06:03:42.177153	2023-09-07 06:03:42.177153
108	civil	deuda	insolvencia	2023-09-07 06:03:42.190566	2023-09-07 06:03:42.190566
109	civil	deuda	tercería	2023-09-07 06:03:42.196615	2023-09-07 06:03:42.196615
110	civil	estado civil de las personas	defunción	2023-09-07 06:03:42.204602	2023-09-07 06:03:42.204602
111	civil	jurisdicción voluntaria	aclaración de identidad	2023-09-07 06:03:42.208115	2023-09-07 06:03:42.208115
112	civil	matrimonio	liquidación de sociedad conyugal	2023-09-07 06:03:42.211974	2023-09-07 06:03:42.211974
113	civil	matrimonio	sociedad conyugal	2023-09-07 06:03:42.214737	2023-09-07 06:03:42.214737
114	civil	personas morales	asociación civil	2023-09-07 06:03:42.219755	2023-09-07 06:03:42.219755
115	civil	procedimiento civiles	declaraciones ad perpetuam	2023-09-07 06:03:42.224077	2023-09-07 06:03:42.224077
116	civil	procedimientos civiles	acción de cobro	2023-09-07 06:03:42.228341	2023-09-07 06:03:42.228341
117	civil	procedimientos civiles	acción pro forma	2023-09-07 06:03:42.231914	2023-09-07 06:03:42.231914
118	civil	procedimientos civiles	apeo y deslinde	2023-09-07 06:03:42.235376	2023-09-07 06:03:42.235376
119	civil	procedimientos civiles	contestación de demanda	2023-09-07 06:03:42.238108	2023-09-07 06:03:42.238108
120	civil	procedimientos civiles	defensa del derecho a la vida privada, al honor y la propia imagen	2023-09-07 06:03:42.240919	2023-09-07 06:03:42.240919
121	civil	procedimientos civiles	desalojo de inmueble	2023-09-07 06:03:42.244353	2023-09-07 06:03:42.244353
122	civil	procedimientos civiles	ejecución de sentencia	2023-09-07 06:03:42.248022	2023-09-07 06:03:42.248022
123	civil	procedimientos civiles	hipotecario	2023-09-07 06:03:42.252276	2023-09-07 06:03:42.252276
124	civil	procedimientos civiles	interdicción	2023-09-07 06:03:42.255409	2023-09-07 06:03:42.255409
125	civil	procedimientos civiles	interdictos	2023-09-07 06:03:42.258661	2023-09-07 06:03:42.258661
126	civil	procedimientos civiles	jurisdicción voluntaria	2023-09-07 06:03:42.261467	2023-09-07 06:03:42.261467
127	civil	procedimientos civiles	notificaciones	2023-09-07 06:03:42.264178	2023-09-07 06:03:42.264178
128	civil	procedimientos civiles	nulidad de actuaciones judiciales	2023-09-07 06:03:42.267048	2023-09-07 06:03:42.267048
129	civil	procedimientos civiles	peritajes	2023-09-07 06:03:42.270106	2023-09-07 06:03:42.270106
130	civil	procedimientos civiles	saneamiento por evicción	2023-09-07 06:03:42.273441	2023-09-07 06:03:42.273441
131	civil	propiedad	prescripción positiva	2023-09-07 06:03:42.276836	2023-09-07 06:03:42.276836
132	civil	propiedad	regularización de la titularidad	2023-09-07 06:03:42.279637	2023-09-07 06:03:42.279637
133	civil	propiedad	uso, goce y disfrute	2023-09-07 06:03:42.282648	2023-09-07 06:03:42.282648
134	civil	propiedad	usucapión	2023-09-07 06:03:42.285235	2023-09-07 06:03:42.285235
135	civil	propiedad	vicios ocultos	2023-09-07 06:03:42.288074	2023-09-07 06:03:42.288074
136	civil	registro civil	nombre legal	2023-09-07 06:03:42.290851	2023-09-07 06:03:42.290851
137	civil	responsabilidad civil	daño moral	2023-09-07 06:03:42.294539	2023-09-07 06:03:42.294539
138	civil	responsabilidad civil	responsabilidad extracontractual	2023-09-07 06:03:42.297858	2023-09-07 06:03:42.297858
139	civil	sucesión	intestado	2023-09-07 06:03:42.301146	2023-09-07 06:03:42.301146
140	civil	sucesión	sucesión ante notario	2023-09-07 06:03:42.304325	2023-09-07 06:03:42.304325
141	civil	sucesión	testamento	2023-09-07 06:03:42.307565	2023-09-07 06:03:42.307565
142	constitucional	absolucion	absolucion de la instancia	2023-09-07 06:03:42.310473	2023-09-07 06:03:42.310473
143	constitucional	absolucion	absolucion penal	2023-09-07 06:03:42.313399	2023-09-07 06:03:42.313399
144	constitucional	acciones	accion constitucional	2023-09-07 06:03:42.31661	2023-09-07 06:03:42.31661
145	constitucional	acciones	accion de inconstitucionalidad	2023-09-07 06:03:42.319874	2023-09-07 06:03:42.319874
146	constitucional	acciones	accion popular	2023-09-07 06:03:42.323119	2023-09-07 06:03:42.323119
147	constitucional	acciones	acciones de inconstitucionalidad	2023-09-07 06:03:42.32664	2023-09-07 06:03:42.32664
148	constitucional	acciones	acciones de los trabajadores	2023-09-07 06:03:42.329915	2023-09-07 06:03:42.329915
149	constitucional	activo de las empresas	activo de las empresas determinacion del impuesto	2023-09-07 06:03:42.333041	2023-09-07 06:03:42.333041
150	constitucional	activo de las empresas	activo de las empresas, constitucional	2023-09-07 06:03:42.33628	2023-09-07 06:03:42.33628
292	familia	concubinato	concubina	2023-09-07 06:03:42.848952	2023-09-07 06:03:42.848952
151	constitucional	actos tutelados por la constitución	acto aplicacion	2023-09-07 06:03:42.339111	2023-09-07 06:03:42.339111
152	constitucional	actos tutelados por la constitución	acto concreto de aplicacion	2023-09-07 06:03:42.34254	2023-09-07 06:03:42.34254
153	constitucional	actos tutelados por la constitución	acto de imposible reparacion	2023-09-07 06:03:42.346512	2023-09-07 06:03:42.346512
154	constitucional	actos tutelados por la constitución	acto de molestia	2023-09-07 06:03:42.349449	2023-09-07 06:03:42.349449
155	constitucional	actos tutelados por la constitución	acto de privacion	2023-09-07 06:03:42.351953	2023-09-07 06:03:42.351953
156	constitucional	actos tutelados por la constitución	acto definitivo	2023-09-07 06:03:42.354378	2023-09-07 06:03:42.354378
157	constitucional	actos tutelados por la constitución	acto inconstitucional	2023-09-07 06:03:42.357594	2023-09-07 06:03:42.357594
158	constitucional	actos tutelados por la constitución	acto no definitivo	2023-09-07 06:03:42.362527	2023-09-07 06:03:42.362527
159	constitucional	actos tutelados por la constitución	actos administrativos	2023-09-07 06:03:42.366836	2023-09-07 06:03:42.366836
160	constitucional	actos tutelados por la constitución	actos de autoridad	2023-09-07 06:03:42.369993	2023-09-07 06:03:42.369993
161	constitucional	actos tutelados por la constitución	actos de molestia	2023-09-07 06:03:42.372963	2023-09-07 06:03:42.372963
162	constitucional	actos tutelados por la constitución	actos privativos	2023-09-07 06:03:42.375773	2023-09-07 06:03:42.375773
163	constitucional	administracion de justicia	administracion de justicia, auxiliares	2023-09-07 06:03:42.378474	2023-09-07 06:03:42.378474
164	constitucional	administracion de justicia	administracion de justicia, municipal	2023-09-07 06:03:42.391521	2023-09-07 06:03:42.391521
165	constitucional	administracion de justicia	administracion de justicia, pronta y expedita	2023-09-07 06:03:42.396624	2023-09-07 06:03:42.396624
166	constitucional	administracion de justicia	administracion de justicia, servicio publico	2023-09-07 06:03:42.39994	2023-09-07 06:03:42.39994
167	constitucional	aguas	aguas del subsuelo	2023-09-07 06:03:42.403463	2023-09-07 06:03:42.403463
168	constitucional	aguas	aguas maritimas interiores	2023-09-07 06:03:42.407632	2023-09-07 06:03:42.407632
169	constitucional	aguas	aguas nacionales	2023-09-07 06:03:42.411136	2023-09-07 06:03:42.411136
170	constitucional	aguas	aguas, derechos y tarifa	2023-09-07 06:03:42.414723	2023-09-07 06:03:42.414723
171	constitucional	aguas	aguas, proporcionalidad	2023-09-07 06:03:42.420056	2023-09-07 06:03:42.420056
172	constitucional	ambitos de las normas	ambito de validez	2023-09-07 06:03:42.423599	2023-09-07 06:03:42.423599
173	constitucional	ambitos de las normas	ambito espacial	2023-09-07 06:03:42.427293	2023-09-07 06:03:42.427293
174	constitucional	ambitos de las normas	ambito temporal	2023-09-07 06:03:42.430566	2023-09-07 06:03:42.430566
175	constitucional	ambitos de las normas	ambito territorial	2023-09-07 06:03:42.443255	2023-09-07 06:03:42.443255
176	constitucional	amnistia	amnistia, concesion en una ley	2023-09-07 06:03:42.446546	2023-09-07 06:03:42.446546
177	constitucional	amnistia	amnistia, naturaleza juridica	2023-09-07 06:03:42.449045	2023-09-07 06:03:42.449045
178	constitucional	amnistia	amnistia, reduccion de penas	2023-09-07 06:03:42.451617	2023-09-07 06:03:42.451617
179	constitucional	amparo	amparo agrario	2023-09-07 06:03:42.454292	2023-09-07 06:03:42.454292
180	constitucional	amparo	amparo contra leyes	2023-09-07 06:03:42.456997	2023-09-07 06:03:42.456997
181	constitucional	amparo	amparo en revision	2023-09-07 06:03:42.459317	2023-09-07 06:03:42.459317
182	constitucional	amparo	amparo improcedente	2023-09-07 06:03:42.468586	2023-09-07 06:03:42.468586
183	constitucional	amparo	amparo, constitucionalidad de preceptos	2023-09-07 06:03:42.472435	2023-09-07 06:03:42.472435
184	constitucional	amparo	amparo, procedimiento	2023-09-07 06:03:42.475122	2023-09-07 06:03:42.475122
185	constitucional	amparo	amparo, representacion	2023-09-07 06:03:42.478044	2023-09-07 06:03:42.478044
186	constitucional	amparo	amparo, violaciones constitucionales	2023-09-07 06:03:42.480798	2023-09-07 06:03:42.480798
187	constitucional	aplicacion	aplicacion inmediata	2023-09-07 06:03:42.48361	2023-09-07 06:03:42.48361
188	constitucional	armas	armas de fuego, portacion sin licencia	2023-09-07 06:03:42.486383	2023-09-07 06:03:42.486383
189	constitucional	armas	armas de uso exclusivo, de las fuerzas armadas	2023-09-07 06:03:42.489269	2023-09-07 06:03:42.489269
190	constitucional	armas	armas, portacion	2023-09-07 06:03:42.491999	2023-09-07 06:03:42.491999
191	constitucional	arrendamiento	arrendamiento, impuesto	2023-09-07 06:03:42.496435	2023-09-07 06:03:42.496435
192	constitucional	arresto	arresto, facultades de las legislaturas locales	2023-09-07 06:03:42.503635	2023-09-07 06:03:42.503635
193	constitucional	arresto	arresto, medida de apremio	2023-09-07 06:03:42.508763	2023-09-07 06:03:42.508763
194	constitucional	articulo 27 constitucional	articulo 27 constitucional bienes nacionales	2023-09-07 06:03:42.514525	2023-09-07 06:03:42.514525
195	constitucional	articulo 31 constitucional	articulo 31 constitucional impuesto sobre la renta	2023-09-07 06:03:42.519024	2023-09-07 06:03:42.519024
196	constitucional	articulo 31 constitucional	articulo 31 constitucional impuesto sobre nominas	2023-09-07 06:03:42.522121	2023-09-07 06:03:42.522121
197	constitucional	articulo 31 constitucional	articulo 31 constitucional, fraccion iv	2023-09-07 06:03:42.525347	2023-09-07 06:03:42.525347
198	constitucional	articulo 31 constitucional	articulo 31 constitucional, impuesto al valor agregado	2023-09-07 06:03:42.528558	2023-09-07 06:03:42.528558
199	constitucional	articulo 31 constitucional	articulo 31 constitucional, impuesto predial	2023-09-07 06:03:42.531572	2023-09-07 06:03:42.531572
200	constitucional	articulo 4o. constitucional	articulo 4o. constitucional, ley de extranjeros	2023-09-07 06:03:42.534615	2023-09-07 06:03:42.534615
201	constitucional	articulo 4o. constitucional	articulo 4o. constitucional, ley de vias generales de comunicación	2023-09-07 06:03:42.537842	2023-09-07 06:03:42.537842
202	constitucional	articulo 4o. constitucional	articulo 4o. constitucional, ley del impuesto sobre la renta	2023-09-07 06:03:42.540649	2023-09-07 06:03:42.540649
203	constitucional	articulo 4o. constitucional	articulo 4o. constitucional, ley federal del trabajo	2023-09-07 06:03:42.544549	2023-09-07 06:03:42.544549
204	constitucional	articulo 4o. constitucional	articulo 4o. constitucional, ley general de profesiones	2023-09-07 06:03:42.552178	2023-09-07 06:03:42.552178
205	constitucional	articulo 73 constitucional	articulo 73, fraccion vii, constitucional, energia electrica, facultades del congreso	2023-09-07 06:03:42.557869	2023-09-07 06:03:42.557869
206	constitucional	articulo 73 constitucional	articulo 73, fraccion x, constitucional, energia electrica, facultades del congreso	2023-09-07 06:03:42.561516	2023-09-07 06:03:42.561516
207	constitucional	articulo 73 constitucional	articulo 73, fraccion xxix, constitucional, energia electrica, facultades del congreso	2023-09-07 06:03:42.564435	2023-09-07 06:03:42.564435
208	constitucional	autoridad	autoridad ejecutora	2023-09-07 06:03:42.56716	2023-09-07 06:03:42.56716
209	constitucional	autoridad	autoridad responsable	2023-09-07 06:03:42.570066	2023-09-07 06:03:42.570066
210	constitucional	bienes	bienes comunales	2023-09-07 06:03:42.574617	2023-09-07 06:03:42.574617
211	constitucional	bienes	bienes de dominio privado, de la federacion	2023-09-07 06:03:42.578991	2023-09-07 06:03:42.578991
212	constitucional	bienes	bienes de la iglesia	2023-09-07 06:03:42.582609	2023-09-07 06:03:42.582609
213	constitucional	bienes	bienes nacionales	2023-09-07 06:03:42.585805	2023-09-07 06:03:42.585805
214	constitucional	bienes	bienes nacionalizacion	2023-09-07 06:03:42.588223	2023-09-07 06:03:42.588223
215	constitucional	bienes	bienes, de la iglesia, nacionalizacion	2023-09-07 06:03:42.590725	2023-09-07 06:03:42.590725
216	constitucional	bienes	bienes, dominio publico	2023-09-07 06:03:42.593657	2023-09-07 06:03:42.593657
217	constitucional	bienes en manos de los particulares	latifundios	2023-09-07 06:03:42.596201	2023-09-07 06:03:42.596201
218	constitucional	derecho al libre desarrollo de la pesonalidad	imagen propia	2023-09-07 06:03:42.598983	2023-09-07 06:03:42.598983
219	constitucional	derecho de nacionalidad	reconocimiento	2023-09-07 06:03:42.601665	2023-09-07 06:03:42.601665
220	constitucional	derechos de audiencia	audiencia constitucional	2023-09-07 06:03:42.604151	2023-09-07 06:03:42.604151
221	constitucional	derechos de audiencia	audiencia previa	2023-09-07 06:03:42.606634	2023-09-07 06:03:42.606634
222	constitucional	derechos de audiencia	audiencia, garantia de, laudos	2023-09-07 06:03:42.609229	2023-09-07 06:03:42.609229
223	constitucional	discriminación	extranjería	2023-09-07 06:03:42.611766	2023-09-07 06:03:42.611766
224	constitucional	igualdad	edad	2023-09-07 06:03:42.614348	2023-09-07 06:03:42.614348
225	constitucional	interpretación constitucional	analogia, ley	2023-09-07 06:03:42.627709	2023-09-07 06:03:42.627709
226	constitucional	interpretación constitucional	analogia, sentencias	2023-09-07 06:03:42.630627	2023-09-07 06:03:42.630627
227	constitucional	juicio de amparo	amparo indirecto	2023-09-07 06:03:42.633226	2023-09-07 06:03:42.633226
228	constitucional	libertad de tránsito	restricción ilegal de movimiento	2023-09-07 06:03:42.63605	2023-09-07 06:03:42.63605
229	constitucional	territorio	municipio	2023-09-07 06:03:42.639569	2023-09-07 06:03:42.639569
230	familia	actas de defuncion	actas de defuncion, prueba	2023-09-07 06:03:42.64313	2023-09-07 06:03:42.64313
231	familia	actas de matrimonio	prueba de filiación mediante el acta de matrimonio	2023-09-07 06:03:42.645701	2023-09-07 06:03:42.645701
232	familia	actas de nacimiento	actas de nacimiento, falsas	2023-09-07 06:03:42.648696	2023-09-07 06:03:42.648696
233	familia	actas de nacimiento	actas de nacimiento, hijos naturales	2023-09-07 06:03:42.651356	2023-09-07 06:03:42.651356
234	familia	actas de nacimiento	actas de nacimiento, nulidad	2023-09-07 06:03:42.653939	2023-09-07 06:03:42.653939
235	familia	actas de nacimiento	actas de nacimiento, rectificacion	2023-09-07 06:03:42.656518	2023-09-07 06:03:42.656518
236	familia	actas de nacimiento falsas	actas de nacimiento de hijos naturales	2023-09-07 06:03:42.670765	2023-09-07 06:03:42.670765
237	familia	actas del registro civil	actas del registro civil para el nombre	2023-09-07 06:03:42.674419	2023-09-07 06:03:42.674419
238	familia	actas del registro civil	actas del registro civil, estado civil	2023-09-07 06:03:42.678031	2023-09-07 06:03:42.678031
239	familia	actas del registro civil	actas del registro civil, filiacion, hijos nacidos de matrimonio	2023-09-07 06:03:42.680774	2023-09-07 06:03:42.680774
240	familia	actas del registro civil	actas del registro civil, hijos naturales, reconocimiento	2023-09-07 06:03:42.685999	2023-09-07 06:03:42.685999
241	familia	actas del registro civil	actas del registro civil, nombre	2023-09-07 06:03:42.690229	2023-09-07 06:03:42.690229
242	familia	actas del registro civil	actas del registro civil, nulidad	2023-09-07 06:03:42.693438	2023-09-07 06:03:42.693438
243	familia	actas del registro civil	nulidad de actas del registro civil	2023-09-07 06:03:42.696447	2023-09-07 06:03:42.696447
244	familia	actos de los albaceas	honorarios de los albaceas	2023-09-07 06:03:42.701774	2023-09-07 06:03:42.701774
245	familia	actos de los albaceas	muerte de los albaceas	2023-09-07 06:03:42.704444	2023-09-07 06:03:42.704444
246	familia	actos de los albaceas	validez de los actos de los albaceas	2023-09-07 06:03:42.70712	2023-09-07 06:03:42.70712
247	familia	adopcion	adopcion de menores	2023-09-07 06:03:42.710456	2023-09-07 06:03:42.710456
248	familia	adopcion	adopcion, efectos	2023-09-07 06:03:42.713276	2023-09-07 06:03:42.713276
249	familia	albacea	albacea definitivo	2023-09-07 06:03:42.717954	2023-09-07 06:03:42.717954
250	familia	albacea	albacea especial	2023-09-07 06:03:42.721695	2023-09-07 06:03:42.721695
251	familia	albacea	albacea judicial	2023-09-07 06:03:42.729301	2023-09-07 06:03:42.729301
252	familia	albacea	albacea provisional	2023-09-07 06:03:42.733795	2023-09-07 06:03:42.733795
253	familia	albacea	albacea testamentario	2023-09-07 06:03:42.736521	2023-09-07 06:03:42.736521
254	familia	albaceas	albaceas, actos, validez	2023-09-07 06:03:42.739119	2023-09-07 06:03:42.739119
255	familia	albaceas	albaceas, administracion	2023-09-07 06:03:42.741872	2023-09-07 06:03:42.741872
256	familia	albaceas	albaceas, bienes hereditarios	2023-09-07 06:03:42.745105	2023-09-07 06:03:42.745105
257	familia	albaceas	albaceas, cambio	2023-09-07 06:03:42.74791	2023-09-07 06:03:42.74791
258	familia	albaceas	albaceas, honorarios	2023-09-07 06:03:42.75272	2023-09-07 06:03:42.75272
259	familia	albaceas	albaceas, inventarios y avaluos	2023-09-07 06:03:42.756672	2023-09-07 06:03:42.756672
260	familia	albaceas	albaceas, muerte	2023-09-07 06:03:42.761068	2023-09-07 06:03:42.761068
261	familia	albaceas	albaceas, nombramiento	2023-09-07 06:03:42.76667	2023-09-07 06:03:42.76667
262	familia	albaceas	albaceas, personalidad	2023-09-07 06:03:42.772983	2023-09-07 06:03:42.772983
263	familia	albaceas	albaceas, rendicion de cuentas	2023-09-07 06:03:42.77607	2023-09-07 06:03:42.77607
264	familia	alimentos	alimentos entre conyuges	2023-09-07 06:03:42.778527	2023-09-07 06:03:42.778527
265	familia	alimentos	alimentos, accion de pago	2023-09-07 06:03:42.780932	2023-09-07 06:03:42.780932
266	familia	alimentos	alimentos, acreedor alimentario	2023-09-07 06:03:42.783491	2023-09-07 06:03:42.783491
267	familia	alimentos	alimentos, cancelacion	2023-09-07 06:03:42.786033	2023-09-07 06:03:42.786033
268	familia	alimentos	alimentos, derecho	2023-09-07 06:03:42.788477	2023-09-07 06:03:42.788477
269	familia	alimentos	alimentos, deudores alimentarios	2023-09-07 06:03:42.791008	2023-09-07 06:03:42.791008
270	familia	alimentos	alimentos, garantia	2023-09-07 06:03:42.793445	2023-09-07 06:03:42.793445
271	familia	alimentos	alimentos, hijos mayores de edad	2023-09-07 06:03:42.796153	2023-09-07 06:03:42.796153
272	familia	alimentos	alimentos, ministracion	2023-09-07 06:03:42.798591	2023-09-07 06:03:42.798591
273	familia	alimentos	alimentos, monto, fijacion	2023-09-07 06:03:42.801099	2023-09-07 06:03:42.801099
274	familia	alimentos	alimentos, obligacion de proporcionarlos	2023-09-07 06:03:42.803638	2023-09-07 06:03:42.803638
275	familia	alimentos	alimentos, pago	2023-09-07 06:03:42.805995	2023-09-07 06:03:42.805995
276	familia	alimentos	alimentos, pension	2023-09-07 06:03:42.80859	2023-09-07 06:03:42.80859
277	familia	alimentos	alimentos, perdida	2023-09-07 06:03:42.811125	2023-09-07 06:03:42.811125
278	familia	alimentos	alimentos, procedencia	2023-09-07 06:03:42.813632	2023-09-07 06:03:42.813632
279	familia	alimentos	alimentos, proporcionalidad	2023-09-07 06:03:42.816333	2023-09-07 06:03:42.816333
280	familia	alimentos	alimentos, prueba, carga de la	2023-09-07 06:03:42.81879	2023-09-07 06:03:42.81879
281	familia	bienes hereditarios	bienes hereditarios, adjudicacion	2023-09-07 06:03:42.821539	2023-09-07 06:03:42.821539
282	familia	bienes hereditarios	bienes hereditarios, cesion	2023-09-07 06:03:42.824014	2023-09-07 06:03:42.824014
283	familia	bienes hereditarios	bienes hereditarios, particion	2023-09-07 06:03:42.82636	2023-09-07 06:03:42.82636
284	familia	bienes hereditarios	bienes hereditarios, posesion	2023-09-07 06:03:42.828745	2023-09-07 06:03:42.828745
285	familia	bienes hereditarios	bienes hereditarios, propiedad	2023-09-07 06:03:42.83126	2023-09-07 06:03:42.83126
286	familia	bienes hereditarios	bienes hereditarios, venta	2023-09-07 06:03:42.833799	2023-09-07 06:03:42.833799
287	familia	bienes hereditarios	partición de los bienes hereditarios	2023-09-07 06:03:42.836241	2023-09-07 06:03:42.836241
288	familia	capitulaciones matrimoniales	capitulaciones matrimoniales, bienes	2023-09-07 06:03:42.838565	2023-09-07 06:03:42.838565
289	familia	capitulaciones matrimoniales	capitulaciones matrimoniales, celebracion	2023-09-07 06:03:42.841073	2023-09-07 06:03:42.841073
290	familia	capitulaciones matrimoniales	capitulaciones matrimoniales, falta	2023-09-07 06:03:42.843759	2023-09-07 06:03:42.843759
291	familia	capitulaciones matrimoniales	capitulaciones matrimoniales, inscripcion	2023-09-07 06:03:42.846375	2023-09-07 06:03:42.846375
293	familia	concubinato	concubinario	2023-09-07 06:03:42.851578	2023-09-07 06:03:42.851578
294	familia	concubinato	concubinato, existencia	2023-09-07 06:03:42.853996	2023-09-07 06:03:42.853996
295	familia	concubinato	concubinato, prueba	2023-09-07 06:03:42.856638	2023-09-07 06:03:42.856638
296	familia	conyuge culpable	conyuge culpable, alimentos	2023-09-07 06:03:42.859061	2023-09-07 06:03:42.859061
297	familia	conyuge culpable	conyuge culpable, patria potestad, perdida	2023-09-07 06:03:42.861595	2023-09-07 06:03:42.861595
298	familia	conyuge superstite	conyuge superstite, bienes, administracion de	2023-09-07 06:03:42.864101	2023-09-07 06:03:42.864101
299	familia	conyuge superstite	conyuge superstite, derechos	2023-09-07 06:03:42.866631	2023-09-07 06:03:42.866631
300	familia	conyuge superstite	conyuge superstite, posesion	2023-09-07 06:03:42.86906	2023-09-07 06:03:42.86906
301	familia	conyuge superstite	conyuge superstite, sucesiones	2023-09-07 06:03:42.87143	2023-09-07 06:03:42.87143
302	familia	conyuges	conyuges abandonados	2023-09-07 06:03:42.873955	2023-09-07 06:03:42.873955
303	familia	conyuges	conyuges, alimentos entre	2023-09-07 06:03:42.876415	2023-09-07 06:03:42.876415
304	familia	conyuges	conyuges, bienes	2023-09-07 06:03:42.878675	2023-09-07 06:03:42.878675
305	familia	conyuges	conyuges, contratos entre	2023-09-07 06:03:42.881253	2023-09-07 06:03:42.881253
306	familia	conyuges	conyuges, disolucion del vinculo matrimonial	2023-09-07 06:03:42.883672	2023-09-07 06:03:42.883672
307	familia	conyuges	conyuges, domicilio	2023-09-07 06:03:42.886085	2023-09-07 06:03:42.886085
308	familia	conyuges	conyuges, guarda y custodia de menores	2023-09-07 06:03:42.888702	2023-09-07 06:03:42.888702
309	familia	conyuges	conyuges, injurias	2023-09-07 06:03:42.89108	2023-09-07 06:03:42.89108
310	familia	conyuges	conyuges, obligaciones	2023-09-07 06:03:42.896375	2023-09-07 06:03:42.896375
311	familia	conyuges	conyuges, patria potestad	2023-09-07 06:03:42.898993	2023-09-07 06:03:42.898993
312	familia	conyuges	conyuges, separacion	2023-09-07 06:03:42.901791	2023-09-07 06:03:42.901791
313	familia	conyuges	conyuges, sociedad conyugal	2023-09-07 06:03:42.904229	2023-09-07 06:03:42.904229
314	familia	cónyuge superstite	derechos del cónyuge superstite	2023-09-07 06:03:42.906741	2023-09-07 06:03:42.906741
315	familia	divorcio	divorcio necesario	2023-09-07 06:03:42.909374	2023-09-07 06:03:42.909374
316	familia	divorcio	divorcio por mutuo consentimiento	2023-09-07 06:03:42.911933	2023-09-07 06:03:42.911933
317	familia	divorcio	divorcio, abandono de hogar	2023-09-07 06:03:42.914569	2023-09-07 06:03:42.914569
318	familia	divorcio	divorcio, accion	2023-09-07 06:03:42.917489	2023-09-07 06:03:42.917489
319	familia	divorcio	divorcio, acusacion calumniosa	2023-09-07 06:03:42.92038	2023-09-07 06:03:42.92038
320	familia	divorcio	divorcio, adulterio	2023-09-07 06:03:42.922811	2023-09-07 06:03:42.922811
321	familia	divorcio	divorcio, alimentos	2023-09-07 06:03:42.925418	2023-09-07 06:03:42.925418
322	familia	divorcio	divorcio, amenazas	2023-09-07 06:03:42.927826	2023-09-07 06:03:42.927826
323	familia	divorcio	divorcio, causales	2023-09-07 06:03:42.930493	2023-09-07 06:03:42.930493
324	familia	divorcio	divorcio, competencia	2023-09-07 06:03:42.932995	2023-09-07 06:03:42.932995
325	familia	divorcio	divorcio, convenio	2023-09-07 06:03:42.935516	2023-09-07 06:03:42.935516
326	familia	divorcio	divorcio, conyuge culpable	2023-09-07 06:03:42.937917	2023-09-07 06:03:42.937917
327	familia	divorcio	divorcio, conyuge inocente	2023-09-07 06:03:42.945956	2023-09-07 06:03:42.945956
328	familia	divorcio	divorcio, hijos, situacion	2023-09-07 06:03:42.948958	2023-09-07 06:03:42.948958
329	familia	divorcio	divorcio, incompatibilidad de caracteres	2023-09-07 06:03:42.951604	2023-09-07 06:03:42.951604
330	familia	divorcio	divorcio, injurias graves	2023-09-07 06:03:42.954228	2023-09-07 06:03:42.954228
331	familia	divorcio	divorcio, malos tratos	2023-09-07 06:03:42.956802	2023-09-07 06:03:42.956802
332	familia	divorcio	divorcio, menores, guarda y custodia	2023-09-07 06:03:42.959203	2023-09-07 06:03:42.959203
333	familia	divorcio	divorcio, patria potestad, perdida	2023-09-07 06:03:42.961736	2023-09-07 06:03:42.961736
334	familia	divorcio	divorcio, sentencias	2023-09-07 06:03:42.964395	2023-09-07 06:03:42.964395
335	familia	divorcio	divorcio, separacion	2023-09-07 06:03:42.967063	2023-09-07 06:03:42.967063
336	familia	divorcio	divorcio, sevicias	2023-09-07 06:03:42.969555	2023-09-07 06:03:42.969555
337	familia	divorcio	divorcio, sociedad conyugal	2023-09-07 06:03:42.972034	2023-09-07 06:03:42.972034
338	familia	domicilio	domicilio convencional	2023-09-07 06:03:42.974476	2023-09-07 06:03:42.974476
339	familia	domicilio	domicilio conyugal	2023-09-07 06:03:42.977053	2023-09-07 06:03:42.977053
340	familia	domicilio	domicilio del autor de la herencia	2023-09-07 06:03:42.979498	2023-09-07 06:03:42.979498
341	familia	domicilio	domicilio familiar	2023-09-07 06:03:42.981885	2023-09-07 06:03:42.981885
342	familia	domicilio	domicilio legal	2023-09-07 06:03:42.984487	2023-09-07 06:03:42.984487
343	familia	domicilio	domicilio real	2023-09-07 06:03:42.98682	2023-09-07 06:03:42.98682
344	familia	estado civil	estado civil de las personas	2023-09-07 06:03:42.989244	2023-09-07 06:03:42.989244
345	familia	estado civil	estado civil, actas	2023-09-07 06:03:42.991757	2023-09-07 06:03:42.991757
346	familia	estado civil	estado civil, certificacion	2023-09-07 06:03:42.994339	2023-09-07 06:03:42.994339
347	familia	estado civil	estado civil, comprobacion	2023-09-07 06:03:42.99694	2023-09-07 06:03:42.99694
348	familia	familia	familia, alimentos	2023-09-07 06:03:42.999656	2023-09-07 06:03:42.999656
349	familia	familia	familia, concepto de	2023-09-07 06:03:43.005744	2023-09-07 06:03:43.005744
350	familia	familia	familia, orden y estabilidad	2023-09-07 06:03:43.008427	2023-09-07 06:03:43.008427
351	familia	familia	familia, patrimonio de	2023-09-07 06:03:43.011742	2023-09-07 06:03:43.011742
352	familia	filiacion	filiacion con relacion a la madre	2023-09-07 06:03:43.014404	2023-09-07 06:03:43.014404
353	familia	filiacion	filiacion legitima	2023-09-07 06:03:43.017172	2023-09-07 06:03:43.017172
354	familia	filiacion	filiacion, acta de nacimiento	2023-09-07 06:03:43.019885	2023-09-07 06:03:43.019885
355	familia	filiacion	filiacion, cambio de	2023-09-07 06:03:43.022706	2023-09-07 06:03:43.022706
356	familia	filiacion	filiacion, demostracion	2023-09-07 06:03:43.025288	2023-09-07 06:03:43.025288
357	familia	filiacion	filiacion, hijos	2023-09-07 06:03:43.027811	2023-09-07 06:03:43.027811
358	familia	filiacion	filiacion, prueba	2023-09-07 06:03:43.031135	2023-09-07 06:03:43.031135
359	familia	gananciales	gananciales, derecho a los	2023-09-07 06:03:43.033828	2023-09-07 06:03:43.033828
360	familia	guarda y custodia	guarda y custodia de menor	2023-09-07 06:03:43.036301	2023-09-07 06:03:43.036301
361	familia	guarda y custodia	guarda y custodia, patria potestad	2023-09-07 06:03:43.038957	2023-09-07 06:03:43.038957
362	familia	guarda y custodia	guarda y custodia, perdida	2023-09-07 06:03:43.041532	2023-09-07 06:03:43.041532
363	familia	herederos	herederos instituidos	2023-09-07 06:03:43.044405	2023-09-07 06:03:43.044405
364	familia	herederos	herederos legitimos	2023-09-07 06:03:43.04724	2023-09-07 06:03:43.04724
365	familia	herederos	herederos menores de edad	2023-09-07 06:03:43.049831	2023-09-07 06:03:43.049831
366	familia	herederos	herederos no reconocidos	2023-09-07 06:03:43.052414	2023-09-07 06:03:43.052414
367	familia	herederos	herederos preferentes	2023-09-07 06:03:43.055588	2023-09-07 06:03:43.055588
368	familia	herederos	herederos presuntos	2023-09-07 06:03:43.058303	2023-09-07 06:03:43.058303
369	familia	herederos	herederos testamentarios	2023-09-07 06:03:43.060903	2023-09-07 06:03:43.060903
370	familia	herederos	herederos, calidad de	2023-09-07 06:03:43.063516	2023-09-07 06:03:43.063516
371	familia	herederos	herederos, copropietarios	2023-09-07 06:03:43.066354	2023-09-07 06:03:43.066354
372	familia	herederos	herederos, declaracion de	2023-09-07 06:03:43.068843	2023-09-07 06:03:43.068843
373	familia	herederos	herederos, derechos	2023-09-07 06:03:43.071386	2023-09-07 06:03:43.071386
374	familia	herederos	herederos, desconocimiento	2023-09-07 06:03:43.073803	2023-09-07 06:03:43.073803
375	familia	herederos	herederos, facultades	2023-09-07 06:03:43.076346	2023-09-07 06:03:43.076346
376	familia	herederos	herederos, impugnacion	2023-09-07 06:03:43.079005	2023-09-07 06:03:43.079005
377	familia	herederos	herederos, indemnizacion	2023-09-07 06:03:43.081457	2023-09-07 06:03:43.081457
378	familia	herederos	herederos, interes juridico	2023-09-07 06:03:43.084119	2023-09-07 06:03:43.084119
379	familia	herederos	herederos, juicio intestamentario	2023-09-07 06:03:43.086525	2023-09-07 06:03:43.086525
380	familia	herederos	herederos, junta de	2023-09-07 06:03:43.088954	2023-09-07 06:03:43.088954
381	familia	herederos	herederos, peticion de herencia	2023-09-07 06:03:43.091799	2023-09-07 06:03:43.091799
382	familia	herederos	herederos, reconocimiento	2023-09-07 06:03:43.094926	2023-09-07 06:03:43.094926
383	familia	herederos	herederos, sucesion legitima	2023-09-07 06:03:43.1011	2023-09-07 06:03:43.1011
384	familia	herederos	herederos, venta de bienes	2023-09-07 06:03:43.104024	2023-09-07 06:03:43.104024
385	familia	herencias	herencias legitimas	2023-09-07 06:03:43.106904	2023-09-07 06:03:43.106904
386	familia	herencias	herencias, aceptacion	2023-09-07 06:03:43.10938	2023-09-07 06:03:43.10938
387	familia	herencias	herencias, adjudicacion	2023-09-07 06:03:43.111921	2023-09-07 06:03:43.111921
388	familia	herencias	herencias, autor	2023-09-07 06:03:43.11461	2023-09-07 06:03:43.11461
389	familia	herencias	herencias, avaluo	2023-09-07 06:03:43.117584	2023-09-07 06:03:43.117584
390	familia	herencias	herencias, bienes	2023-09-07 06:03:43.120376	2023-09-07 06:03:43.120376
391	familia	herencias	herencias, cesion	2023-09-07 06:03:43.122941	2023-09-07 06:03:43.122941
392	familia	herencias	herencias, division	2023-09-07 06:03:43.125497	2023-09-07 06:03:43.125497
393	familia	herencias	herencias, liquidacion	2023-09-07 06:03:43.127962	2023-09-07 06:03:43.127962
394	familia	herencias	herencias, particion	2023-09-07 06:03:43.130467	2023-09-07 06:03:43.130467
395	familia	hijos	hijos de matrimonio	2023-09-07 06:03:43.140685	2023-09-07 06:03:43.140685
396	familia	hijos	hijos fuera de matrimonio	2023-09-07 06:03:43.146842	2023-09-07 06:03:43.146842
397	familia	hijos	hijos legitimos	2023-09-07 06:03:43.150502	2023-09-07 06:03:43.150502
398	familia	hijos	hijos mayores de edad	2023-09-07 06:03:43.153712	2023-09-07 06:03:43.153712
399	familia	hijos	hijos menores de edad	2023-09-07 06:03:43.156528	2023-09-07 06:03:43.156528
400	familia	hijos	hijos nacidos de matrimonio	2023-09-07 06:03:43.160221	2023-09-07 06:03:43.160221
401	familia	hijos	hijos nacidos fuera de matrimonio	2023-09-07 06:03:43.162824	2023-09-07 06:03:43.162824
402	familia	hijos	hijos naturales	2023-09-07 06:03:43.166509	2023-09-07 06:03:43.166509
403	familia	hijos	hijos, custodia	2023-09-07 06:03:43.169455	2023-09-07 06:03:43.169455
404	familia	hijos	hijos, educacion	2023-09-07 06:03:43.173442	2023-09-07 06:03:43.173442
405	familia	hijos	hijos, guarda y custodia	2023-09-07 06:03:43.176316	2023-09-07 06:03:43.176316
406	familia	hijos	hijos, patria potestad	2023-09-07 06:03:43.179122	2023-09-07 06:03:43.179122
407	familia	hijos	hijos, posesion de estado de	2023-09-07 06:03:43.181683	2023-09-07 06:03:43.181683
408	familia	hijos	hijos, reconocimiento	2023-09-07 06:03:43.185284	2023-09-07 06:03:43.185284
409	familia	hijos	hijos, situacion de los	2023-09-07 06:03:43.188081	2023-09-07 06:03:43.188081
410	familia	interdiccion	interdiccion, estado de	2023-09-07 06:03:43.190707	2023-09-07 06:03:43.190707
411	familia	interdiccion	interdiccion, estado de, declaracion	2023-09-07 06:03:43.193424	2023-09-07 06:03:43.193424
412	familia	interventores	interventores, facultades	2023-09-07 06:03:43.196114	2023-09-07 06:03:43.196114
413	familia	interventores	interventores, legitimacion	2023-09-07 06:03:43.198752	2023-09-07 06:03:43.198752
414	laboral	derechos de los trabajadores	derechos de asociación	2023-09-07 06:03:43.201669	2023-09-07 06:03:43.201669
415	laboral	derechos de los trabajadores	derechos de los trabajadores en el comercio	2023-09-07 06:03:43.204354	2023-09-07 06:03:43.204354
416	laboral	derechos de los trabajadores	indemnizaciones	2023-09-07 06:03:43.207065	2023-09-07 06:03:43.207065
417	laboral	derechos de los trabajadores	protección contra riesgos biológicos	2023-09-07 06:03:43.209687	2023-09-07 06:03:43.209687
418	laboral	derechos de los trabajadores	protección contra riesgos ergonómicos	2023-09-07 06:03:43.212377	2023-09-07 06:03:43.212377
419	laboral	derechos de los trabajadores	protección contra riesgos físicos	2023-09-07 06:03:43.215081	2023-09-07 06:03:43.215081
420	laboral	derechos de los trabajadores	protección contra riesgos psicosociales	2023-09-07 06:03:43.217687	2023-09-07 06:03:43.217687
421	laboral	derechos de los trabajadores	protección contra riesgos químicos	2023-09-07 06:03:43.220432	2023-09-07 06:03:43.220432
422	laboral	derechos de los trabajadores	regulación del trabajo en condiciones extremas	2023-09-07 06:03:43.222948	2023-09-07 06:03:43.222948
423	laboral	derechos de los trabajadores	salud y seguridad en el trabajo	2023-09-07 06:03:43.22574	2023-09-07 06:03:43.22574
424	laboral	derechos laborales	accidente de trabajo	2023-09-07 06:03:43.228295	2023-09-07 06:03:43.228295
425	laboral	derechos laborales	acoso laboral	2023-09-07 06:03:43.230974	2023-09-07 06:03:43.230974
426	laboral	derechos laborales	bienestar laboral	2023-09-07 06:03:43.238906	2023-09-07 06:03:43.238906
427	laboral	derechos laborales	contrato colectivo	2023-09-07 06:03:43.248604	2023-09-07 06:03:43.248604
428	laboral	derechos laborales	descanso	2023-09-07 06:03:43.256268	2023-09-07 06:03:43.256268
429	laboral	derechos laborales	discriminación laboral	2023-09-07 06:03:43.259134	2023-09-07 06:03:43.259134
430	laboral	derechos laborales	lugar de trabajo	2023-09-07 06:03:43.261846	2023-09-07 06:03:43.261846
431	laboral	derechos laborales	obligaciones del patrón	2023-09-07 06:03:43.264384	2023-09-07 06:03:43.264384
432	laboral	derechos laborales	pagos hechos con exceso al trabajador	2023-09-07 06:03:43.267283	2023-09-07 06:03:43.267283
433	laboral	derechos laborales	prescripción	2023-09-07 06:03:43.271458	2023-09-07 06:03:43.271458
434	laboral	derechos laborales	reparto de utilidades	2023-09-07 06:03:43.274052	2023-09-07 06:03:43.274052
435	laboral	derechos laborales	salario	2023-09-07 06:03:43.276935	2023-09-07 06:03:43.276935
436	laboral	derechos laborales	subcontratación	2023-09-07 06:03:43.279687	2023-09-07 06:03:43.279687
437	laboral	derechos laborales	trabajos de médicos residentes	2023-09-07 06:03:43.284958	2023-09-07 06:03:43.284958
438	laboral	derechos sindicales	condiciones de trabajo	2023-09-07 06:03:43.290961	2023-09-07 06:03:43.290961
439	laboral	derechos sindicales	prevención de acoso laboral	2023-09-07 06:03:43.301539	2023-09-07 06:03:43.301539
440	laboral	derechos sindicales	regulación del trabajo de personas con enfermedades crónicas	2023-09-07 06:03:43.306794	2023-09-07 06:03:43.306794
441	laboral	derechoslaborales	despido	2023-09-07 06:03:43.314889	2023-09-07 06:03:43.314889
442	laboral	derechoslaborales	horas extra	2023-09-07 06:03:43.319769	2023-09-07 06:03:43.319769
443	laboral	derechoslaborales	jornada de trabajo	2023-09-07 06:03:43.325372	2023-09-07 06:03:43.325372
444	laboral	derechoslaborales	renuncia	2023-09-07 06:03:43.328078	2023-09-07 06:03:43.328078
445	laboral	derechoslaborales	rescisión de contrato	2023-09-07 06:03:43.330972	2023-09-07 06:03:43.330972
446	laboral	derechoslaborales	seguridad e higiene laboral	2023-09-07 06:03:43.333657	2023-09-07 06:03:43.333657
447	laboral	derechoslaborales	teletrabajo	2023-09-07 06:03:43.338046	2023-09-07 06:03:43.338046
448	laboral	derechoslaborales	vacaciones	2023-09-07 06:03:43.340799	2023-09-07 06:03:43.340799
449	laboral	empleo juvenil	contratos de aprendizaje	2023-09-07 06:03:43.343705	2023-09-07 06:03:43.343705
450	laboral	seguridad e higiene laboral	contratos a término indefinido	2023-09-07 06:03:43.346508	2023-09-07 06:03:43.346508
451	laboral	trabajo decente	contratos a término fijo	2023-09-07 06:03:43.349122	2023-09-07 06:03:43.349122
452	penal	autoria	coparticipación	2023-09-07 06:03:43.351771	2023-09-07 06:03:43.351771
453	penal	defensa penal	prescripción de la acción penal	2023-09-07 06:03:43.354505	2023-09-07 06:03:43.354505
454	penal	delito contra el libre desarrollo de la personalidad	lenocinio	2023-09-07 06:03:43.357283	2023-09-07 06:03:43.357283
455	penal	delito contra la intimidad sexual	abuso sexual	2023-09-07 06:03:43.359929	2023-09-07 06:03:43.359929
456	penal	delito contra la intimidad sexual	fotografías íntimas	2023-09-07 06:03:43.362489	2023-09-07 06:03:43.362489
457	penal	delito de fraude	fraude	2023-09-07 06:03:43.371344	2023-09-07 06:03:43.371344
458	penal	delito de fraude	fraude cibernético	2023-09-07 06:03:43.382123	2023-09-07 06:03:43.382123
459	penal	delitos ante el ministerio público, autoridad judicial o administrativa	simulación de elementos de prueba	2023-09-07 06:03:43.390431	2023-09-07 06:03:43.390431
460	penal	delitos cometidos en el ejercicio de una profesión	ejercicio ilegal de una profesión	2023-09-07 06:03:43.399889	2023-09-07 06:03:43.399889
461	penal	delitos contra el ambiente	contraminación por ruido	2023-09-07 06:03:43.408916	2023-09-07 06:03:43.408916
462	penal	delitos contra el libre desarrollo de la personalidad	explotración laboral de menores	2023-09-07 06:03:43.4162	2023-09-07 06:03:43.4162
463	penal	delitos contra el patrimonio	abuso de confianza	2023-09-07 06:03:43.419039	2023-09-07 06:03:43.419039
464	penal	delitos contra el patrimonio	administración fraudulenta	2023-09-07 06:03:43.421666	2023-09-07 06:03:43.421666
465	penal	delitos contra el patrimonio	daño en propiedad ajena	2023-09-07 06:03:43.42411	2023-09-07 06:03:43.42411
466	penal	delitos contra el patrimonio	daño en propiedad privada	2023-09-07 06:03:43.426895	2023-09-07 06:03:43.426895
467	penal	delitos contra el patrimonio	despojo	2023-09-07 06:03:43.429672	2023-09-07 06:03:43.429672
468	penal	delitos contra el patrimonio	robo	2023-09-07 06:03:43.433401	2023-09-07 06:03:43.433401
469	penal	delitos contra el patrimonio	robo agravado	2023-09-07 06:03:43.437532	2023-09-07 06:03:43.437532
470	penal	delitos contra el patrimonio	robo automotor	2023-09-07 06:03:43.447161	2023-09-07 06:03:43.447161
471	penal	delitos contra la familia	violencia familiar	2023-09-07 06:03:43.452939	2023-09-07 06:03:43.452939
472	penal	delitos contra la integridad	amenazas	2023-09-07 06:03:43.465513	2023-09-07 06:03:43.465513
473	penal	delitos contra la integridad	lesiones	2023-09-07 06:03:43.475701	2023-09-07 06:03:43.475701
474	penal	delitos contra la libertad personal	privación ilegal de la libertad	2023-09-07 06:03:43.481176	2023-09-07 06:03:43.481176
475	penal	delitos contra la libertad personal	secuestro	2023-09-07 06:03:43.491429	2023-09-07 06:03:43.491429
476	penal	delitos contra la libertad y seguridad sexuales	acoso sexual	2023-09-07 06:03:43.496904	2023-09-07 06:03:43.496904
477	penal	delitos contra la libertad y seguridad sexuales	videos sexuales	2023-09-07 06:03:43.502548	2023-09-07 06:03:43.502548
478	penal	delitos contra la libertad y seguridad sexuales	vídeos sexuales	2023-09-07 06:03:43.50555	2023-09-07 06:03:43.50555
479	penal	delitos contra la paz, la seguridad de las personas y la inviolabilidad del domicilio	allanamiento de morada	2023-09-07 06:03:43.513014	2023-09-07 06:03:43.513014
480	penal	delitos contra la paz, la seguridad de las personas y la inviolabilidad del domicilio	cobranza ilegítima	2023-09-07 06:03:43.521275	2023-09-07 06:03:43.521275
481	penal	delitos contra la protección a la fauna	maltrato a animal no humano	2023-09-07 06:03:43.524632	2023-09-07 06:03:43.524632
482	penal	delitos contra la salud	consumo de estupefacientes	2023-09-07 06:03:43.527143	2023-09-07 06:03:43.527143
483	penal	delitos contra la seguridad de las personas	usurpación de identidad	2023-09-07 06:03:43.529586	2023-09-07 06:03:43.529586
484	penal	delitos contra la seguridad de las personas	violación de domicilio	2023-09-07 06:03:43.532366	2023-09-07 06:03:43.532366
485	penal	delitos contra la seguridad y el normal funcionamiento de las vías de comunicación	violación de la comunicación privada	2023-09-07 06:03:43.535026	2023-09-07 06:03:43.535026
486	penal	delitos contra la vida	homicidio	2023-09-07 06:03:43.537401	2023-09-07 06:03:43.537401
487	penal	delitos contra las vías de comunicación	obstaculización de vía	2023-09-07 06:03:43.539828	2023-09-07 06:03:43.539828
488	penal	delitos de abuso de autoridad y uso ilegal de la fuerza pública	negación del servicio público	2023-09-07 06:03:43.542414	2023-09-07 06:03:43.542414
489	penal	delitos de abuso de autoridad y uso ilegal de la fuerza pública	uso ilegal de la fuerza pública	2023-09-07 06:03:43.544768	2023-09-07 06:03:43.544768
490	penal	delitos relacionados con hechos de corrupción	uso ilegal de atribuciones y facultades	2023-09-07 06:03:43.547032	2023-09-07 06:03:43.547032
491	penal	delitos sexuales	corrupción de menores	2023-09-07 06:03:43.549549	2023-09-07 06:03:43.549549
492	penal	delitos sexuales	violación	2023-09-07 06:03:43.553475	2023-09-07 06:03:43.553475
\.


--
-- Data for Name: document_annexes; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.document_annexes (id, title, description, document_id, created_at, updated_at, file_data) FROM stdin;
\.


--
-- Data for Name: document_comments; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.document_comments (id, description, document_version_id, created_at, updated_at, user_id) FROM stdin;
\.


--
-- Data for Name: document_notifications; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.document_notifications (id, user_id, document_id, "all", status_change, version_upload, document_edit, document_delete, created_at, updated_at, comment_create) FROM stdin;
\.


--
-- Data for Name: document_types; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.document_types (id, title, abbreviation, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: document_versions; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.document_versions (id, created_at, updated_at, document_id, file_data, status, user_id, deleted, file_size, file_name, file_type, s3_path) FROM stdin;
\.


--
-- Data for Name: documents; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.documents (id, title, created_at, updated_at, folder_id, document_type_id, organization_id, user_id, keywords, name, deleted, document_date, status, confidential) FROM stdin;
\.


--
-- Data for Name: documents_specialists; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.documents_specialists (id, user_id, user_type, title, document_type, file_key, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: documents_users; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.documents_users (user_id, document_id, role) FROM stdin;
\.


--
-- Data for Name: educations; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.educations (id, title, descripcion, school_name, start_date, end_date, is_actual, created_at, updated_at, uuid, user_id, type_user, location, grade) FROM stdin;
\.


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.events (id, title, description, length, time_zone, currency, specialist_id, schedule_id, price, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: expertise; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.expertise (id, user_id, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: favorites; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.favorites (id, user_id, type_user, specialist_id) FROM stdin;
\.


--
-- Data for Name: folders; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.folders (id, title, created_at, updated_at, ancestry, deleted) FROM stdin;
\.


--
-- Data for Name: folders_users; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.folders_users (folder_id, user_id, role) FROM stdin;
\.


--
-- Data for Name: intances_of_interests; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.intances_of_interests (id, user_id, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: languages; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.languages (id, user_id, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: legal_profiles; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.legal_profiles (id, user_id, bachelor_deegre, academic_degree, university, cedula, "internLetter", letter, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: legal_subject; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.legal_subject (id, user_id, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: level_of_goverment; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.level_of_goverment (id, user_id, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: milestones; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.milestones (id, title, description, project_id, folder_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: organizations; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.organizations (id, name, abbreviation, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: other_languages; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.other_languages (id, user_id, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: other_legal_subject; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.other_legal_subject (id, user_id, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: other_level_of_goverment; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.other_level_of_goverment (id, user_id, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: other_service_type; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.other_service_type (id, user_id, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: other_state_power_institutions; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.other_state_power_institutions (id, user_id, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: project_reports; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.project_reports (id, report, created_at, updated_at, project_id) FROM stdin;
\.


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.projects (id, title, description, created_at, updated_at, eliminated, image_data, folder_id, projectable_type, projectable_id) FROM stdin;
\.


--
-- Data for Name: projects_users; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.projects_users (project_id, user_id, role) FROM stdin;
\.


--
-- Data for Name: proofs; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.proofs (id, milestone_id, title, description, created_at, updated_at, proofable_type, proofable_id) FROM stdin;
\.


--
-- Data for Name: question_additionals; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.question_additionals (id, question_id, questions, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: question_answers; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.question_answers (id, answer, question_id, user_id, type_user, resolved, created_at, updated_at, uuid) FROM stdin;
\.


--
-- Data for Name: question_answers_votes; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.question_answers_votes (id, user_id, type_user, question_id, answer_id, vote, unvote, created_at, updated_at, uuid) FROM stdin;
\.


--
-- Data for Name: question_expertises; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.question_expertises (id, question_id, option, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: question_institutions; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.question_institutions (id, question_id, option, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: question_jurisdictions; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.question_jurisdictions (id, question_id, option, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: question_name_institutions; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.question_name_institutions (id, question_id, option, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: question_name_procedures; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.question_name_procedures (id, question_id, option, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: question_scope_governments; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.question_scope_governments (id, question_id, option, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: question_subexpertises; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.question_subexpertises (id, question_id, option, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: question_subjects; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.question_subjects (id, question_id, option, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: question_type_procedures; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.question_type_procedures (id, question_id, option, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: question_votes; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.question_votes (id, user_id, type_user, question_id, vote, unvote, created_at, updated_at, uuid) FROM stdin;
\.


--
-- Data for Name: questions; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.questions (id, user_id, type_user, question_name, question, need_enddate, min_enddate, max_enddate, resolved, created_at, updated_at, uuid) FROM stdin;
\.


--
-- Data for Name: queue_classic_jobs; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.queue_classic_jobs (id, q_name, method, args, locked_at, locked_by, created_at, scheduled_at) FROM stdin;
\.


--
-- Data for Name: related_documents; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.related_documents (id, document_a_id, document_b_id) FROM stdin;
\.


--
-- Data for Name: schedules; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.schedules (id, name, time_zone, specialist_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.schema_migrations (version) FROM stdin;
20190906112111
20190906112922
20190906113032
20190906113135
20190906113856
20190906120308
20190906120912
20190906123046
20190906220958
20190908072543
20190918155816
20190918205807
20191013221055
20191014012343
20191014035912
20191016051035
20191018020212
20191018021626
20191018024017
20191018031542
20191018160951
20191018161501
20191018173228
20191018175209
20191018181642
20191018195712
20191021152656
20191021153159
20191021154412
20191026235456
20191027182339
20191027192238
20191027192642
20191027225307
20191027225320
20191105001939
20191107040047
20191117203535
20191117203540
20191119045728
20191120233735
20191128020805
20191218184030
20191220063722
20200324211327
20200628211955
20201003155129
20201003155130
20201003155131
20201003155132
20201003155133
20201003162656
20201027051822
20210505224111
20221201232952
20221215022955
20230108013351
20230112211833
20230203183344
20230203183601
20230204025605
20230303153922
20230316153922
20230318153922
20230318193922
20230318233922
20230319233922
20230319234302
20230319234401
20230407134519
20230513054156
20230513064330
20230602155542
20230605235324
20230605235937
20230606235443
20230613220914
20230618182643
20230618183834
20230622221945
20230626210009
20230626211402
20230627174357
20230627203321
20230628194341
20230628201931
20230628213631
20230629182943
20230629230546
20230703143754
20230703225738
20230704224357
20230705210020
20230710184147
20230712191635
20230714161456
20230724051858
20230725215243
20230725221634
20230726210619
20230726210754
20230728061514
20230731220304
20230804142333
20230804144609
20230804144801
20230807180316
20230809231427
20230809235647
20230810002553
20230810012052
20230810014431
20230810015943
20230810202743
20230811003029
20230811074112
20230814142738
20230816231244
20230821224152
20230823051550
20230824192413
20230904031521
20230904040620
20230904041213
20230907000659
20230907022525
20230907025249
20230907031558
20230907042418
\.


--
-- Data for Name: service_type; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.service_type (id, user_id, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: specialists; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.specialists (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, confirmation_token, confirmed_at, confirmation_sent_at, unconfirmed_email, failed_attempts, unlock_token, locked_at, name, lastname, second_surname, no_surname, birthdate, nationality, gender, curp, rfc, homoclave, created_at, updated_at, deactivated, pending_status, second_lastname, bachelor_degree, university, cedula, academic_degree, intern_letter, registration_step1, registration_step2, registration_step3, registration_step4, specialist_type, legal_service_id, country, state, lat, lng, appointment_type, address, zip_code, specialist_entity_type, uuid) FROM stdin;
1	heber.estrada1@gmail.com	$2a$11$kYwhTyaGSkOhYtU.P67IMO48FWNVK.pTAwyrEnNsxdW8jYzU45gwa	\N	\N	2023-09-07 06:04:43.898554	1	2023-09-07 06:04:43.909493	2023-09-07 06:04:43.909493	189.231.234.145	189.231.234.145	A6kF4zs-EUjcsXWtKA4E	2023-09-07 06:04:29.341901	2023-09-07 06:04:20.623093	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 06:04:20.622963	2023-09-07 06:04:43.90979	f	pending	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1c98200b-0ddf-42a3-8e11-0aec022478e4
\.


--
-- Data for Name: state_power_institutions; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.state_power_institutions (id, user_id, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: subexpertise; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.subexpertise (id, user_id, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: territorial_jurisdictions; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.territorial_jurisdictions (id, user_id, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: trn_metadata; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.trn_metadata (id, user_created, date_of_answer, type_of_answer, issue_reason, subject, type_of_attribute, message, uuid, deleted, created_at, type_of_shipment) FROM stdin;
\.


--
-- Data for Name: trn_user_ccs; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.trn_user_ccs (id, uuid, user_id) FROM stdin;
\.


--
-- Data for Name: trn_user_documents; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.trn_user_documents (id, user_assigned, id_project, "boolean", request_response, date_response, id_document, uuid) FROM stdin;
\.


--
-- Data for Name: type_of_general_procedures; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.type_of_general_procedures (id, user_id, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: type_of_specific_issues; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.type_of_specific_issues (id, user_id, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, failed_attempts, unlock_token, locked_at, created_at, updated_at, admin, organization_id, name, deactivated, provider, uid, confirmation_token, confirmed_at, confirmation_sent_at, unconfirmed_email, uuid) FROM stdin;
1	dev@habitalia.mx	$2a$11$Z7Y1EIbHkoFG8Uop.zfep.rfqjulFZKPYj.4CnxmaEj58xYEka0ji	\N	\N	\N	0	\N	\N	\N	\N	0	\N	\N	2023-09-07 06:03:40.946187	2023-09-07 06:03:40.946187	t	\N	Habitalia Developer	f	\N	\N	qoU5d91faSjZxrqpZyR5	\N	2023-09-07 06:03:40.946349	\N	b3e082bc-1134-4715-b7f2-fe4b09f1743c
\.


--
-- Data for Name: work_experiences; Type: TABLE DATA; Schema: public; Owner: mdatamanager
--

COPY public.work_experiences (id, title, descripcion, company, start_date, end_date, is_actual, created_at, updated_at, uuid, user_id, type_user, location) FROM stdin;
\.


--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.active_admin_comments_id_seq', 1, false);


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.active_storage_attachments_id_seq', 1, false);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.active_storage_blobs_id_seq', 1, false);


--
-- Name: admin_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.admin_users_id_seq', 1, true);


--
-- Name: availabilities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.availabilities_id_seq', 1, false);


--
-- Name: bookings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.bookings_id_seq', 1, false);


--
-- Name: catalog_area_codes_level_1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.catalog_area_codes_level_1_id_seq', 514, true);


--
-- Name: catalog_entity_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.catalog_entity_type_id_seq', 1, false);


--
-- Name: catalog_form_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.catalog_form_id_seq', 53, true);


--
-- Name: catalog_general_procedures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.catalog_general_procedures_id_seq', 1, false);


--
-- Name: catalog_instances_interest_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.catalog_instances_interest_id_seq', 1, false);


--
-- Name: catalog_institutions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.catalog_institutions_id_seq', 1, false);


--
-- Name: catalog_jurisdiction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.catalog_jurisdiction_id_seq', 1, false);


--
-- Name: catalog_languages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.catalog_languages_id_seq', 1, false);


--
-- Name: catalog_legal_services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.catalog_legal_services_id_seq', 1, false);


--
-- Name: catalog_matter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.catalog_matter_id_seq', 1, false);


--
-- Name: catalog_scope_government_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.catalog_scope_government_id_seq', 1, false);


--
-- Name: catalog_specialist_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.catalog_specialist_type_id_seq', 1, false);


--
-- Name: catalog_specific_issues_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.catalog_specific_issues_id_seq', 1, false);


--
-- Name: catalog_subject_expertise_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.catalog_subject_expertise_id_seq', 492, true);


--
-- Name: document_annexes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.document_annexes_id_seq', 1, false);


--
-- Name: document_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.document_comments_id_seq', 1, false);


--
-- Name: document_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.document_notifications_id_seq', 1, false);


--
-- Name: document_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.document_types_id_seq', 1, false);


--
-- Name: document_versions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.document_versions_id_seq', 1, false);


--
-- Name: documents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.documents_id_seq', 1, false);


--
-- Name: documents_specialists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.documents_specialists_id_seq', 1, false);


--
-- Name: educations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.educations_id_seq', 1, false);


--
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.events_id_seq', 1, false);


--
-- Name: expertise_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.expertise_id_seq', 1, false);


--
-- Name: favorites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.favorites_id_seq', 1, false);


--
-- Name: folders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.folders_id_seq', 1, false);


--
-- Name: intances_of_interests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.intances_of_interests_id_seq', 1, false);


--
-- Name: languages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.languages_id_seq', 1, false);


--
-- Name: legal_profiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.legal_profiles_id_seq', 1, false);


--
-- Name: legal_subject_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.legal_subject_id_seq', 1, false);


--
-- Name: level_of_goverment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.level_of_goverment_id_seq', 1, false);


--
-- Name: milestones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.milestones_id_seq', 1, false);


--
-- Name: organizations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.organizations_id_seq', 1, false);


--
-- Name: other_languages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.other_languages_id_seq', 1, false);


--
-- Name: other_legal_subject_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.other_legal_subject_id_seq', 1, false);


--
-- Name: other_level_of_goverment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.other_level_of_goverment_id_seq', 1, false);


--
-- Name: other_service_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.other_service_type_id_seq', 1, false);


--
-- Name: other_state_power_institutions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.other_state_power_institutions_id_seq', 1, false);


--
-- Name: project_reports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.project_reports_id_seq', 1, false);


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.projects_id_seq', 1, false);


--
-- Name: proofs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.proofs_id_seq', 1, false);


--
-- Name: question_additionals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.question_additionals_id_seq', 1, false);


--
-- Name: question_answers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.question_answers_id_seq', 1, false);


--
-- Name: question_answers_votes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.question_answers_votes_id_seq', 1, false);


--
-- Name: question_expertises_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.question_expertises_id_seq', 1, false);


--
-- Name: question_institutions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.question_institutions_id_seq', 1, false);


--
-- Name: question_jurisdictions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.question_jurisdictions_id_seq', 1, false);


--
-- Name: question_name_institutions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.question_name_institutions_id_seq', 1, false);


--
-- Name: question_name_procedures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.question_name_procedures_id_seq', 1, false);


--
-- Name: question_scope_governments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.question_scope_governments_id_seq', 1, false);


--
-- Name: question_subexpertises_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.question_subexpertises_id_seq', 1, false);


--
-- Name: question_subjects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.question_subjects_id_seq', 1, false);


--
-- Name: question_type_procedures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.question_type_procedures_id_seq', 1, false);


--
-- Name: question_votes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.question_votes_id_seq', 1, false);


--
-- Name: questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.questions_id_seq', 1, false);


--
-- Name: queue_classic_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.queue_classic_jobs_id_seq', 1, false);


--
-- Name: related_documents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.related_documents_id_seq', 1, false);


--
-- Name: schedules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.schedules_id_seq', 1, false);


--
-- Name: service_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.service_type_id_seq', 1, false);


--
-- Name: specialists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.specialists_id_seq', 1, true);


--
-- Name: state_power_institutions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.state_power_institutions_id_seq', 1, false);


--
-- Name: subexpertise_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.subexpertise_id_seq', 1, false);


--
-- Name: territorial_jurisdictions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.territorial_jurisdictions_id_seq', 1, false);


--
-- Name: trn_metadata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.trn_metadata_id_seq', 1, false);


--
-- Name: trn_user_ccs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.trn_user_ccs_id_seq', 1, false);


--
-- Name: trn_user_documents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.trn_user_documents_id_seq', 1, false);


--
-- Name: type_of_general_procedures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.type_of_general_procedures_id_seq', 1, false);


--
-- Name: type_of_specific_issues_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.type_of_specific_issues_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- Name: work_experiences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdatamanager
--

SELECT pg_catalog.setval('public.work_experiences_id_seq', 1, false);


--
-- Name: active_admin_comments active_admin_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.active_admin_comments
    ADD CONSTRAINT active_admin_comments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: admin_users admin_users_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: availabilities availabilities_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.availabilities
    ADD CONSTRAINT availabilities_pkey PRIMARY KEY (id);


--
-- Name: bookings bookings_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_pkey PRIMARY KEY (id);


--
-- Name: catalog_area_codes_level_1 catalog_area_codes_level_1_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.catalog_area_codes_level_1
    ADD CONSTRAINT catalog_area_codes_level_1_pkey PRIMARY KEY (id);


--
-- Name: catalog_entity_type catalog_entity_type_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.catalog_entity_type
    ADD CONSTRAINT catalog_entity_type_pkey PRIMARY KEY (id);


--
-- Name: catalog_form catalog_form_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.catalog_form
    ADD CONSTRAINT catalog_form_pkey PRIMARY KEY (id);


--
-- Name: catalog_general_procedures catalog_general_procedures_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.catalog_general_procedures
    ADD CONSTRAINT catalog_general_procedures_pkey PRIMARY KEY (id);


--
-- Name: catalog_instances_interest catalog_instances_interest_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.catalog_instances_interest
    ADD CONSTRAINT catalog_instances_interest_pkey PRIMARY KEY (id);


--
-- Name: catalog_institutions catalog_institutions_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.catalog_institutions
    ADD CONSTRAINT catalog_institutions_pkey PRIMARY KEY (id);


--
-- Name: catalog_jurisdiction catalog_jurisdiction_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.catalog_jurisdiction
    ADD CONSTRAINT catalog_jurisdiction_pkey PRIMARY KEY (id);


--
-- Name: catalog_languages catalog_languages_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.catalog_languages
    ADD CONSTRAINT catalog_languages_pkey PRIMARY KEY (id);


--
-- Name: catalog_legal_services catalog_legal_services_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.catalog_legal_services
    ADD CONSTRAINT catalog_legal_services_pkey PRIMARY KEY (id);


--
-- Name: catalog_matter catalog_matter_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.catalog_matter
    ADD CONSTRAINT catalog_matter_pkey PRIMARY KEY (id);


--
-- Name: catalog_scope_government catalog_scope_government_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.catalog_scope_government
    ADD CONSTRAINT catalog_scope_government_pkey PRIMARY KEY (id);


--
-- Name: catalog_specialist_type catalog_specialist_type_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.catalog_specialist_type
    ADD CONSTRAINT catalog_specialist_type_pkey PRIMARY KEY (id);


--
-- Name: catalog_specific_issues catalog_specific_issues_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.catalog_specific_issues
    ADD CONSTRAINT catalog_specific_issues_pkey PRIMARY KEY (id);


--
-- Name: catalog_subject_expertise catalog_subject_expertise_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.catalog_subject_expertise
    ADD CONSTRAINT catalog_subject_expertise_pkey PRIMARY KEY (id);


--
-- Name: document_annexes document_annexes_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.document_annexes
    ADD CONSTRAINT document_annexes_pkey PRIMARY KEY (id);


--
-- Name: document_comments document_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.document_comments
    ADD CONSTRAINT document_comments_pkey PRIMARY KEY (id);


--
-- Name: document_notifications document_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.document_notifications
    ADD CONSTRAINT document_notifications_pkey PRIMARY KEY (id);


--
-- Name: document_types document_types_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.document_types
    ADD CONSTRAINT document_types_pkey PRIMARY KEY (id);


--
-- Name: document_versions document_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.document_versions
    ADD CONSTRAINT document_versions_pkey PRIMARY KEY (id);


--
-- Name: documents documents_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT documents_pkey PRIMARY KEY (id);


--
-- Name: documents_specialists documents_specialists_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.documents_specialists
    ADD CONSTRAINT documents_specialists_pkey PRIMARY KEY (id);


--
-- Name: educations educations_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.educations
    ADD CONSTRAINT educations_pkey PRIMARY KEY (id);


--
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: expertise expertise_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.expertise
    ADD CONSTRAINT expertise_pkey PRIMARY KEY (id);


--
-- Name: favorites favorites_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_pkey PRIMARY KEY (id);


--
-- Name: folders folders_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.folders
    ADD CONSTRAINT folders_pkey PRIMARY KEY (id);


--
-- Name: intances_of_interests intances_of_interests_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.intances_of_interests
    ADD CONSTRAINT intances_of_interests_pkey PRIMARY KEY (id);


--
-- Name: languages languages_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.languages
    ADD CONSTRAINT languages_pkey PRIMARY KEY (id);


--
-- Name: legal_profiles legal_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.legal_profiles
    ADD CONSTRAINT legal_profiles_pkey PRIMARY KEY (id);


--
-- Name: legal_subject legal_subject_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.legal_subject
    ADD CONSTRAINT legal_subject_pkey PRIMARY KEY (id);


--
-- Name: level_of_goverment level_of_goverment_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.level_of_goverment
    ADD CONSTRAINT level_of_goverment_pkey PRIMARY KEY (id);


--
-- Name: milestones milestones_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.milestones
    ADD CONSTRAINT milestones_pkey PRIMARY KEY (id);


--
-- Name: organizations organizations_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.organizations
    ADD CONSTRAINT organizations_pkey PRIMARY KEY (id);


--
-- Name: other_languages other_languages_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.other_languages
    ADD CONSTRAINT other_languages_pkey PRIMARY KEY (id);


--
-- Name: other_legal_subject other_legal_subject_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.other_legal_subject
    ADD CONSTRAINT other_legal_subject_pkey PRIMARY KEY (id);


--
-- Name: other_level_of_goverment other_level_of_goverment_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.other_level_of_goverment
    ADD CONSTRAINT other_level_of_goverment_pkey PRIMARY KEY (id);


--
-- Name: other_service_type other_service_type_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.other_service_type
    ADD CONSTRAINT other_service_type_pkey PRIMARY KEY (id);


--
-- Name: other_state_power_institutions other_state_power_institutions_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.other_state_power_institutions
    ADD CONSTRAINT other_state_power_institutions_pkey PRIMARY KEY (id);


--
-- Name: project_reports project_reports_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.project_reports
    ADD CONSTRAINT project_reports_pkey PRIMARY KEY (id);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: proofs proofs_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.proofs
    ADD CONSTRAINT proofs_pkey PRIMARY KEY (id);


--
-- Name: question_additionals question_additionals_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.question_additionals
    ADD CONSTRAINT question_additionals_pkey PRIMARY KEY (id);


--
-- Name: question_answers question_answers_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.question_answers
    ADD CONSTRAINT question_answers_pkey PRIMARY KEY (id);


--
-- Name: question_answers_votes question_answers_votes_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.question_answers_votes
    ADD CONSTRAINT question_answers_votes_pkey PRIMARY KEY (id);


--
-- Name: question_expertises question_expertises_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.question_expertises
    ADD CONSTRAINT question_expertises_pkey PRIMARY KEY (id);


--
-- Name: question_institutions question_institutions_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.question_institutions
    ADD CONSTRAINT question_institutions_pkey PRIMARY KEY (id);


--
-- Name: question_jurisdictions question_jurisdictions_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.question_jurisdictions
    ADD CONSTRAINT question_jurisdictions_pkey PRIMARY KEY (id);


--
-- Name: question_name_institutions question_name_institutions_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.question_name_institutions
    ADD CONSTRAINT question_name_institutions_pkey PRIMARY KEY (id);


--
-- Name: question_name_procedures question_name_procedures_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.question_name_procedures
    ADD CONSTRAINT question_name_procedures_pkey PRIMARY KEY (id);


--
-- Name: question_scope_governments question_scope_governments_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.question_scope_governments
    ADD CONSTRAINT question_scope_governments_pkey PRIMARY KEY (id);


--
-- Name: question_subexpertises question_subexpertises_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.question_subexpertises
    ADD CONSTRAINT question_subexpertises_pkey PRIMARY KEY (id);


--
-- Name: question_subjects question_subjects_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.question_subjects
    ADD CONSTRAINT question_subjects_pkey PRIMARY KEY (id);


--
-- Name: question_type_procedures question_type_procedures_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.question_type_procedures
    ADD CONSTRAINT question_type_procedures_pkey PRIMARY KEY (id);


--
-- Name: question_votes question_votes_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.question_votes
    ADD CONSTRAINT question_votes_pkey PRIMARY KEY (id);


--
-- Name: questions questions_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (id);


--
-- Name: queue_classic_jobs queue_classic_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.queue_classic_jobs
    ADD CONSTRAINT queue_classic_jobs_pkey PRIMARY KEY (id);


--
-- Name: related_documents related_documents_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.related_documents
    ADD CONSTRAINT related_documents_pkey PRIMARY KEY (id);


--
-- Name: schedules schedules_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.schedules
    ADD CONSTRAINT schedules_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: service_type service_type_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.service_type
    ADD CONSTRAINT service_type_pkey PRIMARY KEY (id);


--
-- Name: specialists specialists_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.specialists
    ADD CONSTRAINT specialists_pkey PRIMARY KEY (id);


--
-- Name: state_power_institutions state_power_institutions_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.state_power_institutions
    ADD CONSTRAINT state_power_institutions_pkey PRIMARY KEY (id);


--
-- Name: subexpertise subexpertise_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.subexpertise
    ADD CONSTRAINT subexpertise_pkey PRIMARY KEY (id);


--
-- Name: territorial_jurisdictions territorial_jurisdictions_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.territorial_jurisdictions
    ADD CONSTRAINT territorial_jurisdictions_pkey PRIMARY KEY (id);


--
-- Name: trn_metadata trn_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.trn_metadata
    ADD CONSTRAINT trn_metadata_pkey PRIMARY KEY (id);


--
-- Name: trn_user_ccs trn_user_ccs_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.trn_user_ccs
    ADD CONSTRAINT trn_user_ccs_pkey PRIMARY KEY (id);


--
-- Name: trn_user_documents trn_user_documents_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.trn_user_documents
    ADD CONSTRAINT trn_user_documents_pkey PRIMARY KEY (id);


--
-- Name: type_of_general_procedures type_of_general_procedures_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.type_of_general_procedures
    ADD CONSTRAINT type_of_general_procedures_pkey PRIMARY KEY (id);


--
-- Name: type_of_specific_issues type_of_specific_issues_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.type_of_specific_issues
    ADD CONSTRAINT type_of_specific_issues_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: work_experiences work_experiences_pkey; Type: CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.work_experiences
    ADD CONSTRAINT work_experiences_pkey PRIMARY KEY (id);


--
-- Name: idx_qc_on_name_only_unlocked; Type: INDEX; Schema: public; Owner: mdatamanager
--

CREATE INDEX idx_qc_on_name_only_unlocked ON public.queue_classic_jobs USING btree (q_name, id) WHERE (locked_at IS NULL);


--
-- Name: idx_qc_on_scheduled_at_only_unlocked; Type: INDEX; Schema: public; Owner: mdatamanager
--

CREATE INDEX idx_qc_on_scheduled_at_only_unlocked ON public.queue_classic_jobs USING btree (scheduled_at, id) WHERE (locked_at IS NULL);


--
-- Name: index_active_admin_comments_on_author_type_and_author_id; Type: INDEX; Schema: public; Owner: mdatamanager
--

CREATE INDEX index_active_admin_comments_on_author_type_and_author_id ON public.active_admin_comments USING btree (author_type, author_id);


--
-- Name: index_active_admin_comments_on_namespace; Type: INDEX; Schema: public; Owner: mdatamanager
--

CREATE INDEX index_active_admin_comments_on_namespace ON public.active_admin_comments USING btree (namespace);


--
-- Name: index_active_admin_comments_on_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: mdatamanager
--

CREATE INDEX index_active_admin_comments_on_resource_type_and_resource_id ON public.active_admin_comments USING btree (resource_type, resource_id);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: mdatamanager
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: mdatamanager
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: mdatamanager
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_admin_users_on_email; Type: INDEX; Schema: public; Owner: mdatamanager
--

CREATE UNIQUE INDEX index_admin_users_on_email ON public.admin_users USING btree (email);


--
-- Name: index_admin_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: mdatamanager
--

CREATE UNIQUE INDEX index_admin_users_on_reset_password_token ON public.admin_users USING btree (reset_password_token);


--
-- Name: index_availabilities_on_schedule_id; Type: INDEX; Schema: public; Owner: mdatamanager
--

CREATE INDEX index_availabilities_on_schedule_id ON public.availabilities USING btree (schedule_id);


--
-- Name: index_availabilities_on_specialist_id; Type: INDEX; Schema: public; Owner: mdatamanager
--

CREATE INDEX index_availabilities_on_specialist_id ON public.availabilities USING btree (specialist_id);


--
-- Name: index_bookings_on_event_id; Type: INDEX; Schema: public; Owner: mdatamanager
--

CREATE INDEX index_bookings_on_event_id ON public.bookings USING btree (event_id);


--
-- Name: index_bookings_on_personable; Type: INDEX; Schema: public; Owner: mdatamanager
--

CREATE INDEX index_bookings_on_personable ON public.bookings USING btree (personable_type, personable_id);


--
-- Name: index_bookings_on_specialist_id; Type: INDEX; Schema: public; Owner: mdatamanager
--

CREATE INDEX index_bookings_on_specialist_id ON public.bookings USING btree (specialist_id);


--
-- Name: index_document_annexes_on_document_id; Type: INDEX; Schema: public; Owner: mdatamanager
--

CREATE INDEX index_document_annexes_on_document_id ON public.document_annexes USING btree (document_id);


--
-- Name: index_document_comments_on_document_version_id; Type: INDEX; Schema: public; Owner: mdatamanager
--

CREATE INDEX index_document_comments_on_document_version_id ON public.document_comments USING btree (document_version_id);


--
-- Name: index_document_comments_on_user_id; Type: INDEX; Schema: public; Owner: mdatamanager
--

CREATE INDEX index_document_comments_on_user_id ON public.document_comments USING btree (user_id);


--
-- Name: index_document_notifications_on_document_id; Type: INDEX; Schema: public; Owner: mdatamanager
--

CREATE INDEX index_document_notifications_on_document_id ON public.document_notifications USING btree (document_id);


--
-- Name: index_document_notifications_on_user_id; Type: INDEX; Schema: public; Owner: mdatamanager
--

CREATE INDEX index_document_notifications_on_user_id ON public.document_notifications USING btree (user_id);


--
-- Name: index_document_types_on_abbreviation; Type: INDEX; Schema: public; Owner: mdatamanager
--

CREATE UNIQUE INDEX index_document_types_on_abbreviation ON public.document_types USING btree (abbreviation);


--
-- Name: index_document_versions_on_document_id; Type: INDEX; Schema: public; Owner: mdatamanager
--

CREATE INDEX index_document_versions_on_document_id ON public.document_versions USING btree (document_id);


--
-- Name: index_document_versions_on_user_id; Type: INDEX; Schema: public; Owner: mdatamanager
--

CREATE INDEX index_document_versions_on_user_id ON public.document_versions USING btree (user_id);


--
-- Name: index_documents_on_document_type_id; Type: INDEX; Schema: public; Owner: mdatamanager
--

CREATE INDEX index_documents_on_document_type_id ON public.documents USING btree (document_type_id);


--
-- Name: index_documents_on_folder_id; Type: INDEX; Schema: public; Owner: mdatamanager
--

CREATE INDEX index_documents_on_folder_id ON public.documents USING btree (folder_id);


--
-- Name: index_documents_on_organization_id; Type: INDEX; Schema: public; Owner: mdatamanager
--

CREATE INDEX index_documents_on_organization_id ON public.documents USING btree (organization_id);


--
-- Name: index_documents_on_user_id; Type: INDEX; Schema: public; Owner: mdatamanager
--

CREATE INDEX index_documents_on_user_id ON public.documents USING btree (user_id);


--
-- Name: index_documents_users_on_document_id_and_user_id; Type: INDEX; Schema: public; Owner: mdatamanager
--

CREATE INDEX index_documents_users_on_document_id_and_user_id ON public.documents_users USING btree (document_id, user_id);


--
-- Name: index_documents_users_on_user_id_and_document_id; Type: INDEX; Schema: public; Owner: mdatamanager
--

CREATE INDEX index_documents_users_on_user_id_and_document_id ON public.documents_users USING btree (user_id, document_id);


--
-- Name: index_events_on_schedule_id; Type: INDEX; Schema: public; Owner: mdatamanager
--

CREATE INDEX index_events_on_schedule_id ON public.events USING btree (schedule_id);


--
-- Name: index_events_on_specialist_id; Type: INDEX; Schema: public; Owner: mdatamanager
--

CREATE INDEX index_events_on_specialist_id ON public.events USING btree (specialist_id);


--
-- Name: index_folders_on_ancestry; Type: INDEX; Schema: public; Owner: mdatamanager
--

CREATE INDEX index_folders_on_ancestry ON public.folders USING btree (ancestry);


--
-- Name: index_folders_users_on_folder_id; Type: INDEX; Schema: public; Owner: mdatamanager
--

CREATE INDEX index_folders_users_on_folder_id ON public.folders_users USING btree (folder_id);


--
-- Name: index_folders_users_on_user_id; Type: INDEX; Schema: public; Owner: mdatamanager
--

CREATE INDEX index_folders_users_on_user_id ON public.folders_users USING btree (user_id);


--
-- Name: index_milestones_on_folder_id; Type: INDEX; Schema: public; Owner: mdatamanager
--

CREATE INDEX index_milestones_on_folder_id ON public.milestones USING btree (folder_id);


--
-- Name: index_milestones_on_project_id; Type: INDEX; Schema: public; Owner: mdatamanager
--

CREATE INDEX index_milestones_on_project_id ON public.milestones USING btree (project_id);


--
-- Name: index_organizations_on_abbreviation; Type: INDEX; Schema: public; Owner: mdatamanager
--

CREATE UNIQUE INDEX index_organizations_on_abbreviation ON public.organizations USING btree (abbreviation);


--
-- Name: index_project_reports_on_project_id; Type: INDEX; Schema: public; Owner: mdatamanager
--

CREATE INDEX index_project_reports_on_project_id ON public.project_reports USING btree (project_id);


--
-- Name: index_projects_on_eliminated; Type: INDEX; Schema: public; Owner: mdatamanager
--

CREATE INDEX index_projects_on_eliminated ON public.projects USING btree (eliminated);


--
-- Name: index_projects_on_folder_id; Type: INDEX; Schema: public; Owner: mdatamanager
--

CREATE INDEX index_projects_on_folder_id ON public.projects USING btree (folder_id);


--
-- Name: index_projects_on_projectable; Type: INDEX; Schema: public; Owner: mdatamanager
--

CREATE INDEX index_projects_on_projectable ON public.projects USING btree (projectable_type, projectable_id);


--
-- Name: index_projects_users_on_project_id; Type: INDEX; Schema: public; Owner: mdatamanager
--

CREATE INDEX index_projects_users_on_project_id ON public.projects_users USING btree (project_id);


--
-- Name: index_projects_users_on_user_id; Type: INDEX; Schema: public; Owner: mdatamanager
--

CREATE INDEX index_projects_users_on_user_id ON public.projects_users USING btree (user_id);


--
-- Name: index_proofs_on_milestone_id; Type: INDEX; Schema: public; Owner: mdatamanager
--

CREATE INDEX index_proofs_on_milestone_id ON public.proofs USING btree (milestone_id);


--
-- Name: index_proofs_on_proofable; Type: INDEX; Schema: public; Owner: mdatamanager
--

CREATE INDEX index_proofs_on_proofable ON public.proofs USING btree (proofable_type, proofable_id);


--
-- Name: index_schedules_on_specialist_id; Type: INDEX; Schema: public; Owner: mdatamanager
--

CREATE INDEX index_schedules_on_specialist_id ON public.schedules USING btree (specialist_id);


--
-- Name: index_specialists_on_confirmation_token; Type: INDEX; Schema: public; Owner: mdatamanager
--

CREATE UNIQUE INDEX index_specialists_on_confirmation_token ON public.specialists USING btree (confirmation_token);


--
-- Name: index_specialists_on_email; Type: INDEX; Schema: public; Owner: mdatamanager
--

CREATE UNIQUE INDEX index_specialists_on_email ON public.specialists USING btree (email);


--
-- Name: index_specialists_on_legal_service_id; Type: INDEX; Schema: public; Owner: mdatamanager
--

CREATE INDEX index_specialists_on_legal_service_id ON public.specialists USING btree (legal_service_id);


--
-- Name: index_specialists_on_reset_password_token; Type: INDEX; Schema: public; Owner: mdatamanager
--

CREATE UNIQUE INDEX index_specialists_on_reset_password_token ON public.specialists USING btree (reset_password_token);


--
-- Name: index_specialists_on_unlock_token; Type: INDEX; Schema: public; Owner: mdatamanager
--

CREATE UNIQUE INDEX index_specialists_on_unlock_token ON public.specialists USING btree (unlock_token);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: mdatamanager
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_organization_id; Type: INDEX; Schema: public; Owner: mdatamanager
--

CREATE INDEX index_users_on_organization_id ON public.users USING btree (organization_id);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: mdatamanager
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: queue_classic_jobs queue_classic_notify; Type: TRIGGER; Schema: public; Owner: mdatamanager
--

CREATE TRIGGER queue_classic_notify AFTER INSERT ON public.queue_classic_jobs FOR EACH ROW EXECUTE FUNCTION public.queue_classic_notify();


--
-- Name: events fk_rails_0f9aa51f56; Type: FK CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT fk_rails_0f9aa51f56 FOREIGN KEY (schedule_id) REFERENCES public.schedules(id);


--
-- Name: project_reports fk_rails_204d3a9e68; Type: FK CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.project_reports
    ADD CONSTRAINT fk_rails_204d3a9e68 FOREIGN KEY (project_id) REFERENCES public.projects(id);


--
-- Name: documents fk_rails_2be0318c46; Type: FK CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT fk_rails_2be0318c46 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: availabilities fk_rails_336af303fb; Type: FK CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.availabilities
    ADD CONSTRAINT fk_rails_336af303fb FOREIGN KEY (specialist_id) REFERENCES public.specialists(id);


--
-- Name: schedules fk_rails_33cea49a2b; Type: FK CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.schedules
    ADD CONSTRAINT fk_rails_33cea49a2b FOREIGN KEY (specialist_id) REFERENCES public.specialists(id);


--
-- Name: documents fk_rails_38b1cebf1f; Type: FK CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT fk_rails_38b1cebf1f FOREIGN KEY (organization_id) REFERENCES public.organizations(id);


--
-- Name: specialists fk_rails_38fd532797; Type: FK CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.specialists
    ADD CONSTRAINT fk_rails_38fd532797 FOREIGN KEY (legal_service_id) REFERENCES public.service_type(id);


--
-- Name: document_notifications fk_rails_39326333e2; Type: FK CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.document_notifications
    ADD CONSTRAINT fk_rails_39326333e2 FOREIGN KEY (document_id) REFERENCES public.documents(id);


--
-- Name: documents fk_rails_404da7ca3d; Type: FK CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT fk_rails_404da7ca3d FOREIGN KEY (folder_id) REFERENCES public.folders(id);


--
-- Name: projects fk_rails_4a7d271921; Type: FK CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT fk_rails_4a7d271921 FOREIGN KEY (folder_id) REFERENCES public.folders(id);


--
-- Name: milestones fk_rails_659d159700; Type: FK CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.milestones
    ADD CONSTRAINT fk_rails_659d159700 FOREIGN KEY (folder_id) REFERENCES public.folders(id);


--
-- Name: document_notifications fk_rails_675be5a0a1; Type: FK CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.document_notifications
    ADD CONSTRAINT fk_rails_675be5a0a1 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: document_comments fk_rails_6ff46ece16; Type: FK CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.document_comments
    ADD CONSTRAINT fk_rails_6ff46ece16 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: events fk_rails_83ee9aac78; Type: FK CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT fk_rails_83ee9aac78 FOREIGN KEY (specialist_id) REFERENCES public.specialists(id);


--
-- Name: milestones fk_rails_9bd0a0c791; Type: FK CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.milestones
    ADD CONSTRAINT fk_rails_9bd0a0c791 FOREIGN KEY (project_id) REFERENCES public.projects(id);


--
-- Name: document_annexes fk_rails_b305bb064d; Type: FK CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.document_annexes
    ADD CONSTRAINT fk_rails_b305bb064d FOREIGN KEY (document_id) REFERENCES public.documents(id);


--
-- Name: document_versions fk_rails_bc4ae66a0a; Type: FK CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.document_versions
    ADD CONSTRAINT fk_rails_bc4ae66a0a FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: document_versions fk_rails_c81b8ae028; Type: FK CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.document_versions
    ADD CONSTRAINT fk_rails_c81b8ae028 FOREIGN KEY (document_id) REFERENCES public.documents(id);


--
-- Name: document_comments fk_rails_cc0ac03905; Type: FK CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.document_comments
    ADD CONSTRAINT fk_rails_cc0ac03905 FOREIGN KEY (document_version_id) REFERENCES public.document_versions(id);


--
-- Name: proofs fk_rails_d7b2a3e321; Type: FK CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.proofs
    ADD CONSTRAINT fk_rails_d7b2a3e321 FOREIGN KEY (milestone_id) REFERENCES public.milestones(id);


--
-- Name: users fk_rails_d7b9ff90af; Type: FK CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_rails_d7b9ff90af FOREIGN KEY (organization_id) REFERENCES public.organizations(id);


--
-- Name: availabilities fk_rails_e29e7dd168; Type: FK CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.availabilities
    ADD CONSTRAINT fk_rails_e29e7dd168 FOREIGN KEY (schedule_id) REFERENCES public.schedules(id);


--
-- Name: documents fk_rails_e77e122717; Type: FK CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT fk_rails_e77e122717 FOREIGN KEY (document_type_id) REFERENCES public.document_types(id);


--
-- Name: bookings fk_rails_ed4eb3baca; Type: FK CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT fk_rails_ed4eb3baca FOREIGN KEY (event_id) REFERENCES public.events(id);


--
-- Name: bookings fk_rails_f925945f20; Type: FK CONSTRAINT; Schema: public; Owner: mdatamanager
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT fk_rails_f925945f20 FOREIGN KEY (specialist_id) REFERENCES public.specialists(id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: mdatamanager
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

