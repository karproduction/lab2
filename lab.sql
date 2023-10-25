BEGIN;


CREATE TABLE IF NOT EXISTS public."hub_Clients"
(
    hk_id_client integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    bk_id_client integer NOT NULL,
    load_date date NOT NULL,
    record_source integer NOT NULL,
    CONSTRAINT "Clients_pkey" PRIMARY KEY (hk_id_client)
);

CREATE TABLE IF NOT EXISTS public."hub_Deals"
(
    hk_id_deal integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    bk_id_deal integer NOT NULL,
    load_date date NOT NULL,
    record_source integer NOT NULL,
    CONSTRAINT "Deals_pkey" PRIMARY KEY (hk_id_deal)
);

CREATE TABLE IF NOT EXISTS public."hub_Disks"
(
    hk_id_disk integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    bk_id_disk integer NOT NULL,
    load_date date NOT NULL,
    record_source integer NOT NULL
);

CREATE TABLE IF NOT EXISTS public."hub_Movies"
(
    hk_id_movie integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    bk_id_movie integer NOT NULL,
    load_date date NOT NULL,
    record_source integer NOT NULL,
    PRIMARY KEY (hk_id_movie)
);

CREATE TABLE IF NOT EXISTS public.link_clients_deals
(
    "hk_id_clients-deals" integer NOT NULL,
    hk_id_client integer NOT NULL,
    hk_id_deal integer NOT NULL,
    load_date date NOT NULL,
    record_source integer NOT NULL,
    PRIMARY KEY ("hk_id_clients-deals")
);

CREATE TABLE IF NOT EXISTS public.link_deals_disks
(
    "hk_id_deals-disks" integer NOT NULL,
    hk_id_disk integer NOT NULL,
    hk_id_deal integer NOT NULL,
    load_date date NOT NULL,
    record_source integer NOT NULL,
    PRIMARY KEY ("hk_id_deals-disks")
);

CREATE TABLE IF NOT EXISTS public.link_movies_disks
(
    "hk_id_disks-movie" integer NOT NULL,
    hk_id_disk integer NOT NULL,
    hk_id_movie integer NOT NULL,
    load_date date NOT NULL,
    record_source integer NOT NULL,
    PRIMARY KEY ("hk_id_disks-movie")
);

CREATE TABLE IF NOT EXISTS public.sat_clients
(
    hk_id_client integer NOT NULL,
    load_date date NOT NULL,
    record_source integer NOT NULL,
    surname character varying NOT NULL,
    name character varying NOT NULL,
    "passport num" integer NOT NULL,
    adress character varying NOT NULL,
    "phone num" numeric NOT NULL,
    PRIMARY KEY (load_date, hk_id_client)
);

CREATE TABLE IF NOT EXISTS public.sat_movies
(
    hk_id_movie integer NOT NULL,
    load_date date NOT NULL,
    record_source integer NOT NULL,
    title character varying NOT NULL,
    genre character varying NOT NULL,
    date date NOT NULL,
    director character varying NOT NULL,
    duration character varying NOT NULL,
    "main role" character varying NOT NULL,
    PRIMARY KEY (load_date, hk_id_movie)
);

CREATE TABLE IF NOT EXISTS public.sat_disks
