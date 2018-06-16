--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.6
-- Dumped by pg_dump version 9.6.9

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
-- Name: graphql; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA graphql;


ALTER SCHEMA graphql OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: artist; Type: TABLE; Schema: graphql; Owner: postgres
--

CREATE TABLE graphql.artist (
    id integer NOT NULL,
    name character varying,
    nationality character varying,
    birth_year character varying,
    death_year character varying
);


ALTER TABLE graphql.artist OWNER TO postgres;

--
-- Name: artist_id_seq; Type: SEQUENCE; Schema: graphql; Owner: postgres
--

CREATE SEQUENCE graphql.artist_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE graphql.artist_id_seq OWNER TO postgres;

--
-- Name: artist_id_seq; Type: SEQUENCE OWNED BY; Schema: graphql; Owner: postgres
--

ALTER SEQUENCE graphql.artist_id_seq OWNED BY graphql.artist.id;


--
-- Name: auction; Type: TABLE; Schema: graphql; Owner: postgres
--

CREATE TABLE graphql.auction (
    id integer NOT NULL,
    auction_house_id integer NOT NULL,
    title character varying,
    number_of_lots integer,
    location character varying,
    start_date character varying,
    end_date character varying,
    description text,
    sale_id character varying NOT NULL
);


ALTER TABLE graphql.auction OWNER TO postgres;

--
-- Name: auction_id_seq; Type: SEQUENCE; Schema: graphql; Owner: postgres
--

CREATE SEQUENCE graphql.auction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE graphql.auction_id_seq OWNER TO postgres;

--
-- Name: auction_id_seq; Type: SEQUENCE OWNED BY; Schema: graphql; Owner: postgres
--

ALTER SEQUENCE graphql.auction_id_seq OWNED BY graphql.auction.id;


--
-- Name: auctionhouse; Type: TABLE; Schema: graphql; Owner: postgres
--

CREATE TABLE graphql.auctionhouse (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE graphql.auctionhouse OWNER TO postgres;

--
-- Name: auctionhouse_id_seq; Type: SEQUENCE; Schema: graphql; Owner: postgres
--

CREATE SEQUENCE graphql.auctionhouse_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE graphql.auctionhouse_id_seq OWNER TO postgres;

--
-- Name: auctionhouse_id_seq; Type: SEQUENCE OWNED BY; Schema: graphql; Owner: postgres
--

ALTER SEQUENCE graphql.auctionhouse_id_seq OWNED BY graphql.auctionhouse.id;


--
-- Name: lot; Type: TABLE; Schema: graphql; Owner: postgres
--

CREATE TABLE graphql.lot (
    id integer NOT NULL,
    work_id integer NOT NULL,
    auction_id integer NOT NULL,
    title text,
    description text,
    estimate_low integer,
    estimate_high integer,
    hammer_price integer,
    hammer_price_bp integer,
    currency character varying,
    nth_in_auction integer,
    lot_number character varying,
    condition text,
    provenance text,
    exhibited text,
    literature text,
    essay text,
    external_image_url text,
    internal_image_url text
);


ALTER TABLE graphql.lot OWNER TO postgres;

--
-- Name: lot_id_seq; Type: SEQUENCE; Schema: graphql; Owner: postgres
--

CREATE SEQUENCE graphql.lot_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE graphql.lot_id_seq OWNER TO postgres;

--
-- Name: lot_id_seq; Type: SEQUENCE OWNED BY; Schema: graphql; Owner: postgres
--

ALTER SEQUENCE graphql.lot_id_seq OWNED BY graphql.lot.id;


--
-- Name: prediction; Type: TABLE; Schema: graphql; Owner: postgres
--

CREATE TABLE graphql.prediction (
    id integer NOT NULL,
    lot_id integer NOT NULL,
    predictions integer[] NOT NULL,
    created_by character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    from_prod boolean NOT NULL
);


ALTER TABLE graphql.prediction OWNER TO postgres;

--
-- Name: prediction_id_seq; Type: SEQUENCE; Schema: graphql; Owner: postgres
--

CREATE SEQUENCE graphql.prediction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE graphql.prediction_id_seq OWNER TO postgres;

--
-- Name: prediction_id_seq; Type: SEQUENCE OWNED BY; Schema: graphql; Owner: postgres
--

ALTER SEQUENCE graphql.prediction_id_seq OWNED BY graphql.prediction.id;


--
-- Name: work; Type: TABLE; Schema: graphql; Owner: postgres
--

CREATE TABLE graphql.work (
    id integer NOT NULL,
    artist_id integer NOT NULL,
    title text,
    dimensions character varying,
    medium character varying,
    materials character varying,
    submaterials character varying,
    structure character varying,
    edition character varying,
    date_of_execution character varying
);


ALTER TABLE graphql.work OWNER TO postgres;

--
-- Name: work_id_seq; Type: SEQUENCE; Schema: graphql; Owner: postgres
--

CREATE SEQUENCE graphql.work_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE graphql.work_id_seq OWNER TO postgres;

--
-- Name: work_id_seq; Type: SEQUENCE OWNED BY; Schema: graphql; Owner: postgres
--

ALTER SEQUENCE graphql.work_id_seq OWNED BY graphql.work.id;


--
-- Name: artist id; Type: DEFAULT; Schema: graphql; Owner: postgres
--

ALTER TABLE ONLY graphql.artist ALTER COLUMN id SET DEFAULT nextval('graphql.artist_id_seq'::regclass);


--
-- Name: auction id; Type: DEFAULT; Schema: graphql; Owner: postgres
--

ALTER TABLE ONLY graphql.auction ALTER COLUMN id SET DEFAULT nextval('graphql.auction_id_seq'::regclass);


--
-- Name: auctionhouse id; Type: DEFAULT; Schema: graphql; Owner: postgres
--

ALTER TABLE ONLY graphql.auctionhouse ALTER COLUMN id SET DEFAULT nextval('graphql.auctionhouse_id_seq'::regclass);


--
-- Name: lot id; Type: DEFAULT; Schema: graphql; Owner: postgres
--

ALTER TABLE ONLY graphql.lot ALTER COLUMN id SET DEFAULT nextval('graphql.lot_id_seq'::regclass);


--
-- Name: prediction id; Type: DEFAULT; Schema: graphql; Owner: postgres
--

ALTER TABLE ONLY graphql.prediction ALTER COLUMN id SET DEFAULT nextval('graphql.prediction_id_seq'::regclass);


--
-- Name: work id; Type: DEFAULT; Schema: graphql; Owner: postgres
--

ALTER TABLE ONLY graphql.work ALTER COLUMN id SET DEFAULT nextval('graphql.work_id_seq'::regclass);


--
-- Name: artist artist_pkey; Type: CONSTRAINT; Schema: graphql; Owner: postgres
--

ALTER TABLE ONLY graphql.artist
    ADD CONSTRAINT artist_pkey PRIMARY KEY (id);


--
-- Name: auction auction_pkey; Type: CONSTRAINT; Schema: graphql; Owner: postgres
--

ALTER TABLE ONLY graphql.auction
    ADD CONSTRAINT auction_pkey PRIMARY KEY (id);


--
-- Name: auctionhouse auctionhouse_pkey; Type: CONSTRAINT; Schema: graphql; Owner: postgres
--

ALTER TABLE ONLY graphql.auctionhouse
    ADD CONSTRAINT auctionhouse_pkey PRIMARY KEY (id);


--
-- Name: lot lot_pkey; Type: CONSTRAINT; Schema: graphql; Owner: postgres
--

ALTER TABLE ONLY graphql.lot
    ADD CONSTRAINT lot_pkey PRIMARY KEY (id);


--
-- Name: prediction prediction_pkey; Type: CONSTRAINT; Schema: graphql; Owner: postgres
--

ALTER TABLE ONLY graphql.prediction
    ADD CONSTRAINT prediction_pkey PRIMARY KEY (id);


--
-- Name: work work_pkey; Type: CONSTRAINT; Schema: graphql; Owner: postgres
--

ALTER TABLE ONLY graphql.work
    ADD CONSTRAINT work_pkey PRIMARY KEY (id);


--
-- Name: auction_auction_house_id; Type: INDEX; Schema: graphql; Owner: postgres
--

CREATE INDEX auction_auction_house_id ON graphql.auction USING btree (auction_house_id);


--
-- Name: auction_auction_house_id_sale_id; Type: INDEX; Schema: graphql; Owner: postgres
--

CREATE UNIQUE INDEX auction_auction_house_id_sale_id ON graphql.auction USING btree (auction_house_id, sale_id);


--
-- Name: lot_auction_id; Type: INDEX; Schema: graphql; Owner: postgres
--

CREATE INDEX lot_auction_id ON graphql.lot USING btree (auction_id);


--
-- Name: lot_work_id; Type: INDEX; Schema: graphql; Owner: postgres
--

CREATE INDEX lot_work_id ON graphql.lot USING btree (work_id);


--
-- Name: prediction_lot_id; Type: INDEX; Schema: graphql; Owner: postgres
--

CREATE INDEX prediction_lot_id ON graphql.prediction USING btree (lot_id);


--
-- Name: prediction_predictions; Type: INDEX; Schema: graphql; Owner: postgres
--

CREATE INDEX prediction_predictions ON graphql.prediction USING gin (predictions);


--
-- Name: work_artist_id; Type: INDEX; Schema: graphql; Owner: postgres
--

CREATE INDEX work_artist_id ON graphql.work USING btree (artist_id);


--
-- Name: auction auction_auction_house_id_fkey; Type: FK CONSTRAINT; Schema: graphql; Owner: postgres
--

ALTER TABLE ONLY graphql.auction
    ADD CONSTRAINT auction_auction_house_id_fkey FOREIGN KEY (auction_house_id) REFERENCES graphql.auctionhouse(id);


--
-- Name: lot lot_auction_id_fkey; Type: FK CONSTRAINT; Schema: graphql; Owner: postgres
--

ALTER TABLE ONLY graphql.lot
    ADD CONSTRAINT lot_auction_id_fkey FOREIGN KEY (auction_id) REFERENCES graphql.auction(id);


--
-- Name: lot lot_work_id_fkey; Type: FK CONSTRAINT; Schema: graphql; Owner: postgres
--

ALTER TABLE ONLY graphql.lot
    ADD CONSTRAINT lot_work_id_fkey FOREIGN KEY (work_id) REFERENCES graphql.work(id);


--
-- Name: prediction prediction_lot_id_fkey; Type: FK CONSTRAINT; Schema: graphql; Owner: postgres
--

ALTER TABLE ONLY graphql.prediction
    ADD CONSTRAINT prediction_lot_id_fkey FOREIGN KEY (lot_id) REFERENCES graphql.lot(id);


--
-- Name: work work_artist_id_fkey; Type: FK CONSTRAINT; Schema: graphql; Owner: postgres
--

ALTER TABLE ONLY graphql.work
    ADD CONSTRAINT work_artist_id_fkey FOREIGN KEY (artist_id) REFERENCES graphql.artist(id);


--
-- PostgreSQL database dump complete
--

