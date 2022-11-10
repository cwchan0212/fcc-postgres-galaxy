--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    designations character varying(200),
    constellation character varying(50),
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    astronomer character varying(50),
    discover_year integer,
    semimajor_axis numeric,
    period numeric,
    diameter integer,
    mass character varying(10),
    density character varying(10),
    planet_id integer,
    planet_name character varying(50)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    mass numeric,
    diameter integer,
    density integer,
    gravity numeric,
    escape_velocity numeric,
    rotation_period numeric,
    length_of_day numeric,
    distance_from_sun numeric,
    perihelion numeric,
    aphelion numeric,
    orbital_period numeric,
    orbital_velocity numeric,
    orbital_inclination numeric,
    orbital_eccentricity numeric,
    obliquity_to_orbit numeric,
    mean_temperature integer,
    surface_pressure numeric,
    number_of_moons integer,
    has_ring_system boolean,
    has_global_magnetic_field boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: satellite; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.satellite (
    satellite_id integer NOT NULL,
    name character varying(50) NOT NULL,
    gm character varying(50),
    radius character varying(50),
    density character varying(50),
    magnitude character varying(50),
    albedo character varying(50),
    planet_id integer,
    planet_name character varying(50)
);


ALTER TABLE public.satellite OWNER TO freecodecamp;

--
-- Name: satellite_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.satellite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.satellite_id_seq OWNER TO freecodecamp;

--
-- Name: satellite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.satellite_id_seq OWNED BY public.satellite.satellite_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    constellation character varying(50),
    bayern_designation character varying(200),
    designation character varying(50),
    approval_date date,
    galaxy_id integer,
    galaxy_name character varying(50)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: satellite satellite_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite ALTER COLUMN satellite_id SET DEFAULT nextval('public.satellite_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.galaxy (galaxy_id, name, designations, constellation, description) FROM stdin;
1	Antennae Galaxy	NGC 4038 & 4039, PGC 37967 & 37969	Corvus	This is a dual galaxy. It gets its name because it is said to look like a pair of insect antennae.
2	Black Eye Galaxy	Evil Eye Galaxy, M64, NGC 4826, PGC 44182	Coma Berenices	It looks like an eye with a dark stripe underneath
3	Butterfly Galaxies	NGC 4567 & 4568, UGC 7776 & 7777, PGC 42064 & 42069	Virgo	Binary galaxies. It looks like a pair of butterfly wings.
4	Centaurus A	NGC 5128, Arp 153, PGC 46957	Centaurus	Named because it’s located in the Centaurus constellation
5	Circinus	ESO 97-G13	Circinus	Latin for compass. Named after the constellation of the same name.
6	Comet Galaxy	VCC 1217, IC 3418	Sculptor	It’s unusually shaped like a comet
7	Eye of Sauron	NGC 4151, UGC 7166, PGC 38739	Canes Venatici	Looks like the eye of Sauron, from Lord of the rings.
8	Hockey stick galaxy	UGC 7907, PGC 42863	Canes Venatici	Looks like a hockey stick. It might be 3 galaxies.
9	Large Magellanic Cloud	ESO 56- G 115, PGC 17223	Dorado	Named after Ferdinand Magellan
10	Little Sombrero Galaxy	NGC 7814, UGC 8, PGC 218	Pegasus	It looks like a sombrero, but it’s smaller than the Sombrero Galaxy
11	Medusa Merger	NGC 4194, UGC 7241, PGC 39068	Ursa Major	Named after the snakes in the Greek myth of Medusa
12	Mice Galaxies	NGC 4676, UGC 7938 / 7939, PGC 43062 / 43065	Coma Berenices	Two galaxies with long tails that look like a mouse
13	Mayall’s Object	APG 148, VV 032	Ursa Major	Named after its discoverer, Nicholas Mayall
14	Needle Galaxy	NGC 4565, UGC 7772, PGC 42038	Coma Berenices	Named because of its thin appearance
15	Pinwheel Galaxy	M101, NGC 5457, UGC 8981, PGC 50063	Ursa Major	It looks like a paper pinwheel
16	Sombrero Galaxy	M104, NGC 4594, UGC 293, PGC 42407	Virgo	Looks like a sombrero
17	Sunflower Galaxy	M63, NGC 5055, PGC 46153, UGC 8334	Canes Venatici	Named because it looks a bit a sunflower
18	Triangulum Galaxy	NGC 0598, UGC 1117, PGC 5818	Triangulum	It’s located in the Triangulum Constellation
19	Andromeda	M31, NGC 224, UGC 454, PGC 2557	Andromeda	In mythology, Andromeda is the daughter of the kings of Ethiopia and is said to be more beautiful than the Nereids. She becomes queen of Greece when she marries Perseus.
20	Backward Galaxy	NGC 4622, PGC 42701	Centaurus	It seems to rotate in the opposite direction to what it should according to its shape.
21	Bode’s Galaxy	M81, NGC 3031, UGC 5318, PGC 28630	Ursa Major	Named after the astronomer who discovered it, Johann Elert Bode
22	Cartwheel Galaxy	PGC 2248	Sculptor	It looks a bit like a cartwheel
23	Cigar Galaxy	M82, NGC 3034, UGC 5322, PGC 28655	Ursa Major	It is shaped like a cigar
24	Coma Pinwheel Galaxy	NGC 4254, PGC 39578	Coma Berenices	It looks like a paper pinwheel
25	Cosmos Redshift 7		Sextans	It’s the brightest of the distant galaxies. It contains some of the oldest stars we know of.
26	Fireworks Galaxy	NGC 6946, UGC 11597, PGC 65001	Cygnus	It is extremely bright and has lots of colors.
27	Hoag’s Galaxy	PGC 54559	Serpens	Named after its discoverer, Art Hoag
28	Lindsay-Shapley Ring	PGC 19481, AM 0644-741, ESO 34-11	Volans	Ring galaxy, named after its discoverer Eric Lindsay
29	Malin 1	PGC 42102, LEDA 42102, VPC 1091	Coma Berenices	Named after its discoverer, David Malin
30	Sculptor Dwarf Galaxy	PGC 3589	Sculptor	Named because it’s located in the Sculptor constellation
31	Small Magellanic Cloud	NGC 292, PGC 3085	Tucana	Named after Ferdinand Magellan
32	Milky Way			Our own galaxy. It is said to look like a band of light
33	Wolf-Lundmark-Melotte	UGCA 444, PGC 143	Cetus	Named after the astronomers that co-discovered it
34	Sculptor Galaxy	NGC 253, UGCA 13, PGC 2789	Sculptor	Named because it’s located in the Sculptor constellation
35	Southern Pinwheel Galaxy	M83, NGC 5236, PGC 48082	Hydra	Named because it looks similar to the Pinwheel Galaxy
36	Tadpole Galaxy	UGC 10214, Arp 188, PGC 57129	Draco	It has a long tail, like a tadpole
37	Whirlpool Galaxy	M51a, NGC 5194, UGC 8493, PGC 47404	Canes Venatici	Named because it looks like a whirlpool
\.


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.moon (moon_id, name, astronomer, discover_year, semimajor_axis, period, diameter, mass, density, planet_id, planet_name) FROM stdin;
1	Moon		0	384	27.32	3476	735	3.3	3	Earth
2	Phobos	Hall	1877	9.4	0.32	23	6	2	4	Mars
3	Deimos	Hall	1877	23.5	1.26	13	15	1.7	4	Mars
4	Amalthea	Barnard	1892	181	0.5	200			5	Jupiter
5	Thebe	Voyager	1979	222	0.67	90			5	Jupiter
6	Io	Galileo	1610	422	1.77	3630	894	3.6	5	Jupiter
7	Europa	Galileo	1610	671	3.55	3138	480	3	5	Jupiter
8	Ganymede	Galileo	1610	1070	7.16	5262	1482	1.9	5	Jupiter
9	Callisto	Galileo	1610	1883	16.69	4800	1077	1.9	5	Jupiter
10	Himalia	Perrine	1904	11460	251	170			5	Jupiter
11	Pan	Voyager	1985	133.6	0.58	20	25		6	Saturn
12	Atlas	Voyager	1980	137.7	0.6	40			6	Saturn
13	Prometheus	Voyager	1980	139.4	0.61	80			6	Saturn
14	Pandora	Voyager	1980	141.7	0.63	100			6	Saturn
15	Janus	Dollfus	1966	151.4	0.69	190			6	Saturn
16	Epimetheus	Fountain, Larson 	1980	151.4	0.69	120			6	Saturn
17	Mimas	Herschel	1789	186	0.94	394	0.4	1.2	6	Saturn
18	Enceladus	Herschel	1789	238	1.37	502	0.8	1.2	6	Saturn
19	Tethys	Cassini	1684	295	1.89	1048	7.5	1.3	6	Saturn
20	Dione	Cassini	1684	377	2.74	1120	11	1.3	6	Saturn
21	Rhea	Cassini	1672	527	4.52	1530	25	1.3	6	Saturn
22	Titan	Huygens	1655	1222	15.95	5150	1346	1.9	6	Saturn
23	Hyperion	Bond, Lassell 	1848	1481	21.3	270			6	Saturn
24	Iapetus	Cassini	1671	3561	79.3	1435	19	1.2	6	Saturn
25	Phoebe	Pickering	1898	12950	550	220			6	Saturn
26	Puck	Voyager	1985	86	0.76	170			7	Uranus
27	Miranda	Kuiper	1948	130	1.41	485	0.8	1.3	7	Uranus
28	Ariel	Lassell	1851	191	2.52	1160	13	1.6	7	Uranus
29	Umbriel	Lassell	1851	266	4.14	1190	13	1.4	7	Uranus
30	Titania	Herschel	1787	436	8.71	1610	35	1.6	7	Uranus
31	Oberon	Herschel	1787	583	13.5	1550	29	1.5	7	Uranus
32	Despina	Voyager	1989	53	0.33	150			8	Neptune
33	Galatea	Voyager	1989	62	0.4	150			8	Neptune
34	Larissa	Voyager	1989	118	1.12	400			8	Neptune
35	Triton	Lassell	1846	355	5.88	2720	220	2.1	8	Neptune
36	Nereid	Kuiper	1949	5511	360	340			8	Neptune
37	Charon	Christy	1978	19.7	6.39	1200		1.7	\N	Pluto
38	Styx	Showalter et al	2012	42	20	20			\N	Pluto
39	Nix	Weaver et al	2005	48	24	46		2.1	\N	Pluto
40	Kerberos	Showalter et al	2011	58	24	28		1.4	\N	Pluto
41	Hydra	Weaver et al	2005	65	38	61		0.8	\N	Pluto
42	Dysnomea	Brown et al	2005	38	16	684			\N	Eris
43	(MK2)	Parker et al	2016	0	0.0	160	0.0	0.0	\N	Makemake
44	Hi’iaka	Brown et al	2005	50	49	400			\N	Haumea
45	Namaka	Brown et al	2005	39	35	200			\N	Haumea
\.


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.planet (planet_id, name, mass, diameter, density, gravity, escape_velocity, rotation_period, length_of_day, distance_from_sun, perihelion, aphelion, orbital_period, orbital_velocity, orbital_inclination, orbital_eccentricity, obliquity_to_orbit, mean_temperature, surface_pressure, number_of_moons, has_ring_system, has_global_magnetic_field, star_id) FROM stdin;
1	Mercury	0.33	4879	5427	3.7	4.3	1407.6	4222.6	57.9	46	69.8	88	47.4	7	0.205	0.034	167	0	0	f	t	\N
2	Venus	4.87	12104	5243	8.9	10.4	-5832.5	2802	108.2	107.5	108.9	224.7	35	3.4	0.007	177.4	464	92	0	f	f	\N
3	Earth	5.97	12756	5514	9.8	11.2	23.9	24	149.6	147.1	152.1	365.2	29.8	0	0.017	23.4	15	1	1	f	t	\N
4	Mars	0.642	6792	3933	3.7	5	24.6	24.7	227.9	206.6	249.2	687	24.1	1.9	0.094	25.2	-65	0.01	2	f	f	\N
5	Jupiter	1898	142984	1326	23.1	59.5	9.9	9.9	778.6	740.5	816.6	4331	13.1	1.3	0.049	3.1	-110	0	79	t	t	\N
6	Saturn	568	120536	687	9	35.5	10.7	10.7	1433.5	1352.6	1514.5	10747	9.7	2.5	0.057	26.7	-140	0	62	t	t	\N
7	Uranus	86.8	51118	1271	8.7	21.3	-17.2	17.2	2872.5	2741.3	3003.6	30589	6.8	0.8	0.046	97.8	-195	0	27	t	t	\N
8	Neptune	102	49528	1638	11	23.5	16.1	16.1	4495.1	4444.5	4545.7	59800	5.4	1.8	0.011	28.3	-200	0	14	t	t	\N
9	Plutogalaxy	0.0146	2370	2095	0.7	1.3	-153.3	153.3	5906.4	4436.8	7375.9	90560	4.7	17.2	0.244	122.5	-225	0.00001	5	f	f	\N
10	dummy1	0.33	4879	5427	3.7	4.3	1407.6	4222.6	57.9	46	69.8	88	47.4	7	0.205	0.034	167	0	0	f	t	\N
11	dummy2	4.87	12104	5243	8.9	10.4	-5832.5	2802	108.2	107.5	108.9	224.7	35	3.4	0.007	177.4	464	92	0	f	f	\N
12	dummy3	5.97	12756	5514	9.8	11.2	23.9	24	149.6	147.1	152.1	365.2	29.8	0	0.017	23.4	15	1	1	f	t	\N
\.


--
-- Data for Name: satellite; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.satellite (satellite_id, name, gm, radius, density, magnitude, albedo, planet_id, planet_name) FROM stdin;
1	Moon	4902.801Â±0.001	1737.5Â±0.1	3.344Â±0.005	-12.74	0.12	3	Earth
2	Phobos	0.0007112Â±0.0000010	11.1Â±0.15	1.872Â±0.076	11.4Â±0.2	0.071Â±0.012	4	Mars
3	Deimos	0.0000985Â±0.0000024	6.2Â±0.18	1.471Â±0.166	12.45Â±0.05	0.068Â±0.007	4	Mars
4	Io	5959.916Â±0.012	1821.6Â±0.5	3.528Â±0.006	5.02Â±0.03	0.63Â±0.02	5	Jupiter
5	Europa	3202.739Â±0.009	1560.8Â±0.5	3.013Â±0.005	5.29Â±0.02	0.67Â±0.03	5	Jupiter
6	Ganymede	9887.834Â±0.017	2631.2Â±1.7	1.942Â±0.005	4.61Â±0.03	0.43Â±0.02	5	Jupiter
7	Callisto	7179.289Â±0.013	2410.3Â±1.5	1.834Â±0.004	5.65Â±0.10	0.17Â±0.02	5	Jupiter
8	Amalthea	0.138Â±0.030	83.45Â±2.4	0.849Â±0.199	14.1Â±0.2	0.090Â±0.005	5	Jupiter
9	Himalia	0.45	85	2.6	14.2R	0.04	5	Jupiter
10	Elara	0.058	43	2.6	16.0R	0.04	5	Jupiter
11	Pasiphae	0.02	30	2.6	16.8R	0.04	5	Jupiter
12	Sinope	0.005	19	2.6	18.2R	0.04	5	Jupiter
13	Lysithea	0.0042	18	2.6	18.1R	0.04	5	Jupiter
14	Carme	0.0088	23	2.6	18.1R	0.04	5	Jupiter
15	Ananke	0.002	14	2.6	19.1R	0.04	5	Jupiter
16	Leda	0.00073	10	2.6	19.2R	0.04	5	Jupiter
17	Thebe	0.1	49.3Â±2.0	3	16	0.047Â±0.003	5	Jupiter
18	Adrastea	0.0005	8.2Â±2.0	3	18.7	0.1Â±0.045	5	Jupiter
19	Metis	0.008	21.5Â±2.0	3	17.5	0.061Â±0.003	5	Jupiter
20	Callirrhoe	0.000058	4.3	2.6	20.8R	0.04	5	Jupiter
21	Themisto	0.000046	4	2.6	21.0R	0.04	5	Jupiter
22	Megaclite	0.000014	2.7	2.6	21.7R	0.04	5	Jupiter
23	Taygete	0.000011	2.5	2.6	21.9R	0.04	5	Jupiter
24	Chaldene	0.000005	1.9	2.6	22.5R	0.04	5	Jupiter
25	Harpalyke	0.000008	2.2	2.6	22.2R	0.04	5	Jupiter
26	Kalyke	0.000013	2.6	2.6	21.8R	0.04	5	Jupiter
27	Iocaste	0.000013	2.6	2.6	21.8R	0.04	5	Jupiter
28	Erinome	0.000003	1.6	2.6	22.8R	0.04	5	Jupiter
29	Isonoe	0.000005	1.9	2.6	22.5R	0.04	5	Jupiter
30	Praxidike	0.000029	3.4	2.6	21.2R	0.04	5	Jupiter
31	Autonoe	0.000006	2	2.6	22.0R	0.04	5	Jupiter
32	Thyone	0.000006	2	2.6	22.3R	0.04	5	Jupiter
33	Hermippe	0.000006	2	2.6	22.1R	0.04	5	Jupiter
34	Aitne	0.000003	1.5	2.6	22.7R	0.04	5	Jupiter
35	Eurydome	0.000003	1.5	2.6	22.7R	0.04	5	Jupiter
36	Euanthe	0.000003	1.5	2.6	22.8R	0.04	5	Jupiter
37	Euporie	0.000001	1	2.6	23.1R	0.04	5	Jupiter
38	Orthosie	0.000001	1	2.6	23.1R	0.04	5	Jupiter
39	Sponde	0.000001	1	2.6	23.0R	0.04	5	Jupiter
40	Kale	0.000001	1	2.6	23.0R	0.04	5	Jupiter
41	Pasithee	0.000001	1	2.6	23.2R	0.04	5	Jupiter
42	Hegemone	0.000003	1.5	2.6	22.8R	0.04	5	Jupiter
43	Mneme	0.000001	1	2.6	23.3R	0.04	5	Jupiter
44	Aoede	0.000006	2	2.6	22.5R	0.04	5	Jupiter
45	Thelxinoe	0.000001	1	2.6	23.5R	0.04	5	Jupiter
46	Arche	0.000003	1.5	2.6	22.8R	0.04	5	Jupiter
47	Kallichore	0.000001	1	2.6	23.7R	0.04	5	Jupiter
48	Helike	0.000006	2	2.6	22.6R	0.04	5	Jupiter
49	Carpo	0.000003	1.5	2.6	23.0R	0.04	5	Jupiter
50	Eukelade	0.000006	2	2.6	22.6R	0.04	5	Jupiter
51	Cyllene	0.000001	1	2.6	23.2R	0.04	5	Jupiter
52	Kore	0.000001	1	2.6	23.6R	0.04	5	Jupiter
53	Herse	0.000001	1	2.6	23.4R	0.04	5	Jupiter
54	S/2000 J11	0.000001	1	2.6	22.4R	0.04	5	Jupiter
55	S/2003 J2	0.000001	1	2.6	23.2R	0.04	5	Jupiter
56	S/2003 J3	0.000001	1	2.6	23.4R	0.04	5	Jupiter
57	S/2003 J4	0.000001	1	2.6	23.0R	0.04	5	Jupiter
58	S/2003 J5	0.000006	2	2.6	22.4R	0.04	5	Jupiter
59	S/2003 J9	0.0000001	0.5	2.6	23.7R	0.04	5	Jupiter
60	S/2003 J10	0.000001	1	2.6	23.6R	0.04	5	Jupiter
61	S/2003 J12	0.0000001	0.5	2.6	23.9R	0.04	5	Jupiter
62	S/2003 J15	0.000001	1	2.6	23.5R	0.04	5	Jupiter
63	S/2003 J16	0.000001	1	2.6	23.3R	0.04	5	Jupiter
64	S/2003 J18	0.000001	1	2.6	23.4R	0.04	5	Jupiter
65	S/2003 J19	0.000001	1	2.6	23.7R	0.04	5	Jupiter
66	S/2003 J23	0.000001	1	2.6	23.6R	0.04	5	Jupiter
67	S/2010 J1	0.000001	1	2.6	23.2r	0.04	5	Jupiter
68	S/2010 J2	0.000001	1	2.6	24.0r	0.04	5	Jupiter
69	S/2011 J1	0.000001	1	2.6	23.7R	0.04	5	Jupiter
70	S/2011 J2	0.000001	1	2.6	23.5R	0.04	5	Jupiter
71	Mimas	2.5026Â±0.0006	198.20Â±0.25	1.150Â±0.004	12.8	0.962Â±0.004	6	Saturn
72	Enceladus	7.2027Â±0.0125	252.10Â±0.10	1.608Â±0.003	11.8	1.375Â±0.008	6	Saturn
73	Tethys	41.2067Â±0.0038	533.00Â±0.70	0.973Â±0.004	10.2	1.229Â±0.005	6	Saturn
74	Dione	73.1146Â±0.0015	561.70Â±0.45	1.476Â±0.004	10.4	0.998Â±0.004	6	Saturn
75	Rhea	153.9426Â±0.0037	764.30Â±1.10	1.233Â±0.005	9.6	0.949Â±0.003	6	Saturn
76	Titan	8978.1382Â±0.0020	2574.73Â±0.09	1.882Â±0.001	8.4	0.2	6	Saturn
77	Hyperion	0.3727Â±0.0012	135.00Â±4.00	0.544Â±0.050	14.4	0.3	6	Saturn
78	Iapetus	120.5038Â±0.0080	735.60Â±1.50	1.083Â±0.007	11	0.6	6	Saturn
79	Phoebe	0.5532Â±0.0006	106.50Â±0.70	1.638Â±0.033	16.4	0.081Â±0.002	6	Saturn
80	Janus	0.1263Â±0.0087	89.5Â±1.5	0.630Â±0.030	14.4	0.71Â±0.02	6	Saturn
81	Epimetheus	0.0351Â±0.0047	58.1Â±1.8	0.640Â±0.062	15.6	0.73Â±0.03	6	Saturn
82	Helene	0.00076	17.6Â±0.4	0.5	18.4	1.67Â±0.20	6	Saturn
83	Telesto	0.00027	12.4Â±0.4	0.5	18.5	1	6	Saturn
84	Calypso	0.00017	10.7Â±0.7	0.5	18.7	1.34Â±0.10	6	Saturn
85	Atlas	0.00044Â±0.00015	15.1Â±1.2	0.460Â±0.110	19	0.4	6	Saturn
86	Prometheus	0.01074Â±0.00285	43.1Â±2.7	0.480Â±0.090	15.8	0.6	6	Saturn
87	Pandora	0.00924Â±0.00152	40.7Â±1.5	0.490Â±0.060	16.4	0.5	6	Saturn
88	Pan	0.00033Â±0.00015	14.1Â±1.3	0.420Â±0.150	19.4	0.5	6	Saturn
89	Methone	0.0000006	1.6Â±0.6	0.5	?	?	6	Saturn
90	Pallene	0.0000022	2.5Â±0.6	0.5	?	?	6	Saturn
91	Polydeuces	0.0000003	1.3Â±0.4	0.5	?	?	6	Saturn
92	Daphnis	0.0000052Â±0.0000052	3.8Â±0.8	0.340Â±0.260	?	?	6	Saturn
93	Anthe	0.0000001	0.9	0.5	?	?	6	Saturn
94	Aegaeon	0.000000004	0.3	0.5	?	?	6	Saturn
95	Ymir	0.00033	9	2.3	21.9R	0.06	6	Saturn
96	Paaliaq	0.00055	11	2.3	21.1R	0.06	6	Saturn
97	Tarvos	0.00018	7.5	2.3	22.7R	0.06	6	Saturn
98	Ijiraq	0.00008	6	2.3	22.6R	0.06	6	Saturn
99	Suttungr	0.000014	3.5	2.3	23.9R	0.06	6	Saturn
100	Kiviuq	0.00022	8	2.3	22.1R	0.06	6	Saturn
101	Mundilfari	0.000014	3.5	2.3	23.8R	0.06	6	Saturn
102	Albiorix	0.0014	16	2.3	20.5R	0.06	6	Saturn
103	Skathi	0.000021	4	2.3	23.6R	0.06	6	Saturn
104	Erriapus	0.000051	5	2.3	23.4R	0.06	6	Saturn
105	Siarnaq	0.0026	20	2.3	19.9R	0.06	6	Saturn
106	Thrymr	0.000014	3.5	2.3	23.9R	0.06	6	Saturn
107	Narvi	0.000023	3.5	2.3	23.8R	0.04	6	Saturn
108	Aegir	0	3	2.3	24.4R	0.04	6	Saturn
109	Bebhionn	0	3	2.3	24.1R	0.04	6	Saturn
110	Bergelmir	0	3	2.3	24.2R	0.04	6	Saturn
111	Bestla	0	3.5	2.3	23.8R	0.04	6	Saturn
112	Farbauti	0	2.5	2.3	24.7R	0.04	6	Saturn
113	Fenrir	0	2	2.3	25.0R	0.04	6	Saturn
114	Fornjot	0	3	2.3	24.6R	0.04	6	Saturn
115	Hati	0	3	2.3	24.4R	0.04	6	Saturn
116	Hyrrokkin	0	3	2.3	23.5R	0.04	6	Saturn
117	Kari	0	3	2.3	23.9R	0.04	6	Saturn
118	Loge	0	3	2.3	24.6R	0.04	6	Saturn
119	Skoll	0	3	2.3	24.5R	0.04	6	Saturn
120	Surtur	0	3	2.3	24.8R	0.04	6	Saturn
121	Jarnsaxa	0	3	2.3	24.7R	0.04	6	Saturn
122	Greip	0	3	2.3	24.4R	0.04	6	Saturn
123	Tarqeq	0	3	2.3	23.9R	0.04	6	Saturn
124	S/2004 S7	0	3	2.3	24.5R	0.04	6	Saturn
125	S/2004 S12	0	2.5	2.3	24.8R	0.04	6	Saturn
126	S/2004 S13	0	3	2.3	24.5R	0.04	6	Saturn
127	S/2004 S17	0	2	2.3	25.2R	0.04	6	Saturn
128	S/2006 S1	0	3	2.3	24.6R	0.04	6	Saturn
129	S/2006 S3	0	2.5	2.3	24.6R	0.04	6	Saturn
130	S/2007 S2	0	3	2.3	24.4R	0.04	6	Saturn
131	S/2007 S3	0	2	2.3	24.9R	0.04	6	Saturn
132	Ariel	86.4Â±5.0	578.9Â±0.6	1.592Â±0.092	13.70Â±0.04	0.39Â±0.04	7	Uranus
133	Umbriel	81.5Â±5.0	584.7Â±2.8	1.459Â±0.092	14.47Â±0.04	0.21Â±0.02	7	Uranus
134	Titania	228.2Â±5.0	788.9Â±1.8	1.662Â±0.038	13.49Â±0.04	0.27Â±0.03	7	Uranus
135	Oberon	192.4Â±7.0	761.4Â±2.6	1.559Â±0.059	13.70Â±0.04	0.23Â±0.03	7	Uranus
136	Miranda	4.4Â±0.4	235.8Â±0.7	1.214Â±0.109	15.79Â±0.04	0.32Â±0.03	7	Uranus
137	Cordelia	0.003	20.1Â±3.	1.3	23.62Â±0.35	0.07	7	Uranus
138	Ophelia	0.0036	21.4Â±4.	1.3	23.26Â±0.25	0.07	7	Uranus
139	Bianca	0.0062	27Â±2	1.3	22.52Â±0.24	0.065Â±0.010	7	Uranus
140	Cressida	0.0229	41Â±2	1.3	21.58Â±0.11	0.069Â±0.007	7	Uranus
141	Desdemona	0.0119	35Â±4	1.3	21.99Â±0.16	0.084Â±0.019	7	Uranus
142	Juliet	0.0372	53Â±4	1.3	21.12Â±0.05	0.075Â±0.011	7	Uranus
143	Portia	0.1122	70Â±4	1.3	20.42Â±0.05	0.069Â±0.008	7	Uranus
144	Rosalind	0.017	36Â±6	1.3	21.79Â±0.13	0.072Â±0.024	7	Uranus
145	Belinda	0.0238	45Â±8	1.3	21.47Â±0.09	0.067Â±0.024	7	Uranus
146	Puck	0.1931	81Â±2	1.3	19.75Â±0.05	0.104Â±0.006	7	Uranus
147	Caliban	0.02	36	1.5	22.4R	0.04	7	Uranus
148	Sycorax	0.18	75	1.5	20.8R	0.04	7	Uranus
149	Prospero	0.0066	25	1.5	23.2R	0.04	7	Uranus
150	Setebos	0.0058	24	1.5	23.3R	0.04	7	Uranus
151	Stephano	0.0017	16	1.5	24.1R	0.04	7	Uranus
152	Trinculo	0.00031	9	1.5	25.4R	0.04	7	Uranus
153	Francisco	0.00056	11	1.5	25.0R	0.04	7	Uranus
154	Margaret	0.00042	10	1.5	25.2R	0.04	7	Uranus
155	Ferdinand	0.00042	10	1.5	25.1R	0.04	7	Uranus
156	Perdita	0.0012	13Â±1	1.3	23.6V	0.070Â±0.006	7	Uranus
157	Mab	0.0006	12Â±1	1.3	24.6V	0.103Â±0.006	7	Uranus
158	Cupid	0.0002	9Â±1	1.3	25.8V	0.070Â±0.006	7	Uranus
159	Triton	1427.6Â±1.9	1353.4Â±0.9	2.059Â±0.005	13.54	0.719	8	Neptune
160	Nereid	2.06	170.Â±25.	1.5	19.2R	0.155	8	Neptune
161	Naiad	0.013	33.Â±3.	1.3	23.91	0.072	8	Neptune
162	Thalassa	0.025	41.Â±3.	1.3	23.32	0.091	8	Neptune
163	Despina	0.14	75.Â±3.	1.3	22	0.09	8	Neptune
164	Galatea	0.25	88.Â±4.	1.3	21.85	0.079	8	Neptune
165	Larissa	0.33	97.Â±3.	1.3	21.49	0.091	8	Neptune
166	Proteus	3.36	210.Â±7.	1.3	19.75	0.096	8	Neptune
167	Halimede	0.012	31	1.5	24.5R	0.04	8	Neptune
168	Psamathe	0.0033	20	1.5	25.5R	0.04	8	Neptune
169	Sao	0.0045	22	1.5	25.5R	0.04	8	Neptune
170	Laomedeia	0.0039	21	1.5	25.5R	0.04	8	Neptune
171	Neso	0.011	30	1.5	24.6R	0.04	8	Neptune
172	S/2004 N1	0.0003	9	1.3	26.5V	0.1	8	Neptune
173	Charon	102.3Â±0.2	603.6Â±1.4	1.664Â±0.012	17.26Â±0.01	0.372Â±0.012	\N	Pluto
174	Nix	0.0013Â±0.0023	23.0Â±2.	2.1	23.4VÂ±0.2	0.35	\N	Pluto
175	Hydra	0.0065Â±0.0022	30.5Â±4.	0.8	22.9VÂ±0.1	0.35	\N	Pluto
176	Kerberos	0.0011Â±0.0005	14	1.4	26.1VÂ±0.3	0.35	\N	Pluto
177	Styx	0.0000Â±0.0008	10	?	27.0VÂ±0.3	0.35	\N	Pluto
\.


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.star (star_id, name, constellation, bayern_designation, designation, approval_date, galaxy_id, galaxy_name) FROM stdin;
1	Acamar	Eridanus	θ1 Eridani A	HR 897	2016-07-20	\N	
2	Achernar	Eridanus	α Eridani A	HR 472	2016-06-30	\N	
3	Achird	Cassiopeia	η Cassiopeiae A	HR 219	2017-09-05	\N	
4	Acrab	Scorpius	β1 Scorpii Aa	HR 5984	2016-08-21	\N	
5	Acrux	Crux	α Crucis Aa	HR 4730	2016-07-20	\N	
6	Acubens	Cancer	α Cancri Aa	HR 3572	2016-07-20	\N	
7	Adhafera	Leo	ζ Leonis Aa	HR 4031	2016-07-20	\N	
8	Adhara	Canis Major	ε Canis Majoris A	HR 2618	2016-08-21	\N	
9	Adhil	Andromeda	ξ Andromedae	HR 390	2016-08-21	19	Andromeda
10	Ain	Taurus	ε Tauri Aa1	HR 1409	2015-12-15	\N	
11	Ainalrami	Sagittarius	ν1 Sagittarii A	HR 7116	2017-09-05	\N	
12	Aladfar	Lyra	η Lyrae Aa	HR 7298	2017-09-05	\N	
13	Albaldah	Sagittarius	π Sagittarii A	HR 7264	2017-09-05	\N	
14	Albali	Aquarius	ε Aquarii	HR 7950	2016-09-12	\N	
15	Albireo	Cygnus	β1 Cygni Aa	HR 7417	2016-07-20	26	Fireworks Galaxy
16	Alchiba	Corvus	α Corvi	HR 4623	2016-09-12	1	Antennae Galaxy
17	Alcor	Ursa Major	80 Ursae Majoris Ca	HR 5062	2016-06-30	21	Bode’s Galaxy
18	Alcyone	Taurus	η Tauri A	HR 1165	2016-06-30	\N	
19	Aldebaran	Taurus	α Tauri	HR 1457	2016-06-30	\N	
20	Alderamin	Cepheus	α Cephei	HR 8162	2016-07-20	\N	
21	Aldhanab	Grus	γ Gruis	HR 8353	2017-09-05	\N	
22	Aldhibah	Draco	ζ Draconis A	HR 6396	2017-09-05	36	Tadpole Galaxy
23	Aldulfin	Delphinus	ε Delphini	HR 7852	2017-09-05	\N	
24	Alfirk	Cepheus	β Cephei Aa	HR 8238	2016-08-21	\N	
25	Algedi	Capricornus	α2 Capricorni	HR 7754	2016-08-21	\N	
26	Algenib	Pegasus	γ Pegasi	HR 39	2016-06-30	10	Little Sombrero Galaxy
27	Algieba	Leo	γ1 Leonis	HR 4057	2016-07-20	\N	
28	Algol	Perseus	β Persei Aa1	HR 936	2016-06-30	\N	
29	Algorab	Corvus	δ Corvi A	HR 4757	2016-07-20	1	Antennae Galaxy
30	Alhena	Gemini	γ Geminorum Aa	HR 2421	2016-07-20	\N	
31	Alioth	Ursa Major	ε Ursae Majoris A	HR 4905	2016-06-30	21	Bode’s Galaxy
32	Aljanah	Cygnus	ε Cygni Aa	HR 7949	2017-06-30	26	Fireworks Galaxy
33	Alkaid	Ursa Major	η Ursae Majoris	HR 5191	2016-06-30	21	Bode’s Galaxy
34	Alkalurops	Boötes	μ1 Boötis Aa	HR 5733	2016-08-21	\N	
35	Alkaphrah	Ursa Major	κ Ursae Majoris A	HR 3594	2017-09-05	21	Bode’s Galaxy
36	Alkarab	Pegasus	υ Pegasi	HR 8905	2017-09-05	10	Little Sombrero Galaxy
37	Alkes	Crater	α Crateris	HR 4287	2016-09-12	\N	
38	Almaaz	Auriga	ε Aurigae	HR 1605	2017-02-01	\N	
39	Almach	Andromeda	γ Andromedae A	HR 603	2016-07-20	19	Andromeda
40	Alnair	Grus	α Gruis	HR 8425	2016-07-20	\N	
41	Alnasl	Sagittarius	γ2 Sagittarii	HR 6746	2016-08-21	\N	
42	Alnilam	Orion	ε Orionis	HR 1903	2016-07-20	\N	
43	Alnitak	Orion	ζ Orionis Aa	HR 1948	2016-07-20	\N	
44	Alniyat	Scorpius	σ Scorpii Aa1	HR 6084	2017-02-01	\N	
45	Alphard	Hydra	α Hydrae	HR 3748	2016-07-20	35	Southern Pinwheel Galaxy
46	Alphecca	Corona Borealis	α Coronae Borealis	HR 5793	2016-07-20	\N	
47	Alpheratz	Andromeda	α Andromedae Aa	HR 15	2016-06-30	19	Andromeda
48	Alpherg	Pisces	η Piscium A	HR 437	2018-06-01	\N	
49	Alrakis	Draco	μ Draconis A	HR 6370	2017-02-01	36	Tadpole Galaxy
50	Alrescha	Pisces	α Piscium A	HR 596	2016-08-21	\N	
51	Alruba	Draco	HD 161693	HR 6618	2018-06-01	36	Tadpole Galaxy
52	Alsafi	Draco	σ Draconis	HR 7462	2017-06-30	36	Tadpole Galaxy
53	Alsciaukat	Lynx	31 Lyncis	HR 3275	2017-06-30	\N	
54	Alsephina	Vela	δ Velorum Aa	HR 3485	2017-09-05	\N	
55	Alshain	Aquila	β Aquilae A	HR 7602	2016-08-21	\N	
56	Alshat	Capricornus	ν Capricorni A	HR 7773	2017-06-30	\N	
57	Altair	Aquila	α Aquilae	HR 7557	2016-06-30	\N	
58	Altais	Draco	δ Draconis	HR 7310	2016-08-21	36	Tadpole Galaxy
59	Alterf	Leo	λ Leonis	HR 3773	2017-02-01	\N	
60	Aludra	Canis Major	η Canis Majoris	HR 2827	2016-07-20	\N	
61	Alula Australis	Ursa Major	ξ Ursae Majoris Aa	HR 4375	2016-07-20	21	Bode’s Galaxy
62	Alula Borealis	Ursa Major	ν Ursae Majoris	HR 4377	2016-07-20	21	Bode’s Galaxy
63	Alya	Serpens	θ1 Serpentis A	HR 7141	2016-08-21	27	Hoag’s Galaxy
64	Alzirr	Gemini	ξ Geminorum	HR 2484	2017-06-30	\N	
65	Ancha	Aquarius	θ Aquarii	HR 8499	2016-09-12	\N	
66	Angetenar	Eridanus	τ2 Eridani	HR 850	2017-06-30	\N	
67	Ankaa	Phoenix	α Phoenicis	HR 99	2016-07-20	\N	
68	Anser	Vulpecula	α Vulpeculae	HR 7405	2017-06-30	\N	
69	Antares	Scorpius	α Scorpii A	HR 6134	2016-06-30	\N	
70	Arcturus	Boötes	α Boötis	HR 5340	2016-06-30	\N	
71	Arkab Posterior	Sagittarius	β2 Sagittarii	HR 7343	2016-10-05	\N	
72	Arkab Prior	Sagittarius	β1 Sagittarii	HR 7337	2016-10-05	\N	
73	Arneb	Lepus	α Leporis A	HR 1865	2016-07-20	\N	
74	Ascella	Sagittarius	ζ Sagittarii A	HR 7194	2016-09-12	\N	
75	Asellus Australis	Cancer	δ Cancri Aa	HR 3461	2016-11-06	\N	
76	Asellus Borealis	Cancer	γ Cancri Aa	HR 3449	2016-11-06	\N	
77	Ashlesha	Hydra	ε Hydrae A	HR 3482	2018-06-01	35	Southern Pinwheel Galaxy
78	Aspidiske	Carina	ι Carinae	HR 3699	2016-07-20	\N	
79	Asterope	nan	nan	HR 1151	2016-08-21	\N	
80	Athebyne	Draco	η Draconis A	HR 6132	2017-09-05	36	Tadpole Galaxy
81	Atik	Perseus	ο Persei A	HR 1131	2016-09-12	\N	
82	Atlas	Taurus	27 Tauri Aa1	HR 1178	2016-08-21	\N	
83	Atria	Triangulum Australe	α Trianguli Australis	HR 6217	2016-07-20	\N	
84	Avior	Carina	ε Carinae A	HR 3307	2016-07-20	\N	
85	Azelfafage	Cygnus	π1 Cygni	HR 8301	2016-09-12	26	Fireworks Galaxy
86	Azha	Eridanus	η Eridani	HR 874	2016-09-12	\N	
87	Azmidi	Puppis	ξ Puppis	HR 3045	2018-06-01	\N	
88	Barnard’s Star	Ophiuchus	V2500 Ophiuchi	GJ 699	2017-02-01	\N	
89	Baten Kaitos	Cetus	ζ Ceti Aa	HR 539	2016-09-12	33	Wolf-Lundmark-Melotte
90	Beemim	Eridanus	υ3 Eridani	HR 1393	2017-06-30	\N	
91	Beid	Eridanus	ο1 Eridani	HR 1298	2016-09-12	\N	
92	Bellatrix	Orion	γ Orionis	HR 1790	2016-06-30	\N	
93	Betelgeuse	Orion	α Orionis Aa	HR 2061	2016-06-30	\N	
94	Bharani	Aries	41 Arietis Aa	HR 838	2017-06-30	\N	
95	Biham	Pegasus	θ Pegasi	HR 8450	2016-08-21	10	Little Sombrero Galaxy
96	Botein	Aries	δ Arietis	HR 951	2016-09-12	\N	
97	Brachium	Libra	σ Librae A	HR 5603	2017-09-05	\N	
98	Bunda	Aquarius	ξ Aquarii A	HR 8264	2018-06-01	\N	
99	Canopus	Carina	α Carinae A	HR 2326	2016-06-30	\N	
100	Capella	Auriga	α Aurigae Aa	HR 1708	2016-06-30	\N	
101	Caph	Cassiopeia	β Cassiopeiae A	HR 21	2016-06-30	\N	
102	Castor	Gemini	α Geminorum Aa	HR 2891	2016-06-30	\N	
103	Castula	Cassiopeia	υ2 Cassiopeiae	HR 265	2017-09-05	\N	
104	Cebalrai	Ophiuchus	β Ophiuchi	HR 6603	2016-08-21	\N	
105	Celaeno	Taurus	16 Tauri	HR 1140	2016-08-21	\N	
106	Cervantes	Ara	μ Arae	HR 6585	2015-12-15	\N	
107	Chalawan	Ursa Major	47 Ursae Majoris	HR 4277	2015-12-15	21	Bode’s Galaxy
108	Chamukuy	Taurus	θ2 Tauri Aa	HR 1412	2017-09-05	\N	
109	Chara	Canes Venatici	β Canum Venaticorum Aa	HR 4785	2016-07-20	7	Eye of Sauron
110	Chertan	Leo	θ Leonis	HR 4359	2016-07-20	\N	
111	Copernicus	Cancer	55 Cancri A	HR 3522	2015-12-15	\N	
112	Cor Caroli	Canes Venatici	α2 Canum Venaticorum Aa	HR 4915	2016-07-20	7	Eye of Sauron
113	Cujam	Hercules	ω Herculis A	HR 6117	2017-02-01	\N	
114	Cursa	Eridanus	β Eridani	HR 1666	2016-07-20	\N	
115	Dabih	Capricornus	β1 Capricorni Aa	HR 7776	2016-08-21	\N	
116	Dalim	Fornax	α Fornacis A	HR 963	2017-09-05	\N	
117	Deneb	Cygnus	α Cygni	HR 7924	2016-06-30	26	Fireworks Galaxy
118	Deneb Algedi	Capricornus	δ Capricorni Aa	HR 8322	2017-02-01	\N	
119	Denebola	Leo	β Leonis	HR 4534	2016-06-30	\N	
120	Diadem	Coma Berenices	α Comae Berenices A	HR 4968	2017-02-01	2	Black Eye Galaxy
121	Diphda	Cetus	β Ceti	HR 188	2016-08-21	33	Wolf-Lundmark-Melotte
122	Dschubba	Scorpius	δ Scorpii A	HR 5953	2016-08-21	\N	
123	Dubhe	Ursa Major	α Ursae Majoris A	HR 4301	2016-06-30	21	Bode’s Galaxy
124	Dziban	Draco	ψ1 Draconis A	HR 6636	2017-09-05	36	Tadpole Galaxy
125	Edasich	Draco	ι Draconis	HR 5744	2015-12-15	36	Tadpole Galaxy
126	Electra	Taurus	17 Tauri	HR 1142	2016-08-21	\N	
127	Elgafar	Virgo	φ Virginis A	HR 5409	2018-06-01	16	Sombrero Galaxy
128	Elkurud	Columba	θ Columbae	HR 2177	2018-06-01	\N	
129	Elnath	Taurus	β Tauri Aa	HR 1791	2016-07-20	\N	
130	Eltanin	Draco	γ Draconis	HR 6705	2016-08-21	36	Tadpole Galaxy
131	Enif	Pegasus	ε Pegasi	HR 8308	2016-07-20	10	Little Sombrero Galaxy
132	Errai	Cepheus	γ Cephei Aa	HR 8974	2015-12-15	\N	
133	Fafnir	Draco	42 Draconis A	HR 6945	2015-12-15	36	Tadpole Galaxy
134	Fang	Scorpius	π Scorpii Aa	HR 5944	2017-06-30	\N	
135	Fawaris	Cygnus	δ Cygni A	HR 7528	2018-06-01	26	Fireworks Galaxy
136	Felis	Hydra	HD 85951	HR 3923	2018-06-01	35	Southern Pinwheel Galaxy
137	Fomalhaut	Piscis Austrinus	α Piscis Austrini A	HR 8728	2015-12-15	\N	
138	Fulu	Cassiopeia	ζ Cassiopeiae	HR 153	2017-06-30	\N	
139	Fumalsamakah	Pisces	β Piscium	HR 8773	2018-06-01	\N	
140	Furud	Canis Major	ζ Canis Majoris Aa	HR 2282	2016-07-20	\N	
141	Fuyue	Scorpius	G Scorpii	HR 6630	2017-06-30	\N	
142	Gacrux	Crux	γ Crucis	HR 4763	2016-07-20	\N	
143	Giausar	Draco	λ Draconis	HR 4434	2017-02-01	36	Tadpole Galaxy
144	Gienah	Corvus	γ Corvi A	HR 4662	2016-11-06	1	Antennae Galaxy
145	Ginan	Crux	ε Crucis	HR 4700	2017-11-19	\N	
146	Gomeisa	Canis Minor	β Canis Minoris A	HR 2845	2016-07-20	\N	
147	Grumium	Draco	ξ Draconis A	HR 6688	2016-09-12	36	Tadpole Galaxy
148	Gudja	Serpens	κ Serpentis	HR 5879	2018-08-10	27	Hoag’s Galaxy
149	Guniibuu	Ophiuchus	36 Ophiuchi A	HR 6402	2018-08-10	\N	
150	Hadar	Centaurus	β Centauri Aa	HR 5267	2016-08-21	20	Backward Galaxy
151	Haedus	Auriga	η Aurigae	HR 1641	2017-06-30	\N	
152	Hamal	Aries	α Arietis	HR 617	2016-07-20	\N	
153	Hassaleh	Auriga	ι Aurigae	HR 1577	2017-06-30	\N	
154	Hatysa	Orion	ι Orionis Aa	HR 1899	2017-09-05	\N	
155	Helvetios	Pegasus	51 Pegasi	HR 8729	2015-12-15	10	Little Sombrero Galaxy
156	Heze	Virgo	ζ Virginis A	HR 5107	2018-06-01	16	Sombrero Galaxy
157	Homam	Pegasus	ζ Pegasi A	HR 8634	2016-08-21	10	Little Sombrero Galaxy
158	Iklil	Scorpius	ρ Scorpii Aa	HR 5928	2017-09-05	\N	
159	Imai	Crux	δ Crucis	HR 4656	2018-08-10	\N	
160	Intercrus	Ursa Major	41 Lyncis	HR 3743	2015-12-15	21	Bode’s Galaxy
161	Izar	Boötes	ε Boötis A	HR 5506	2016-08-21	\N	
162	Jabbah	Scorpius	ν Scorpii Aa	HR 6027	2017-06-30	\N	
163	Jishui	Gemini	ο Geminorum	HR 2930	2017-06-30	\N	
164	Kaffaljidhma	Cetus	γ Ceti A	HR 804	2017-02-01	33	Wolf-Lundmark-Melotte
165	Kang	Virgo	κ Virginis	HR 5315	2017-06-30	16	Sombrero Galaxy
166	Kaus Australis	Sagittarius	ε Sagittarii A	HR 6879	2016-07-20	\N	
167	Kaus Borealis	Sagittarius	λ Sagittarii	HR 6913	2016-07-20	\N	
168	Kaus Media	Sagittarius	δ Sagittarii	HR 6859	2016-07-20	\N	
169	Keid	Eridanus	ο2 Eridani A	HR 1325	2016-09-12	\N	
170	Khambalia	Virgo	λ Virginis A	HR 5359	2017-09-05	16	Sombrero Galaxy
171	Kitalpha	Equuleus	α Equulei A	HR 8131	2016-08-21	\N	
172	Kochab	Ursa Minor	β Ursae Minoris	HR 5563	2016-07-20	\N	
173	Kornephoros	Hercules	β Herculis Aa	HR 6148	2016-08-21	\N	
174	Kraz	Corvus	β Corvi	HR 4786	2018-06-01	1	Antennae Galaxy
175	Kurhah	Cepheus	ξ Cephei Aa	HR 8417	2016-09-12	\N	
176	La Superba	Canes Venatici	Y Canum Venaticorum	HR 4846	2018-08-10	7	Eye of Sauron
177	Larawag	Scorpius	ε Scorpii	HR 6241	2017-11-19	\N	
178	Lesath	Scorpius	υ Scorpii	HR 6508	2016-08-21	\N	
179	Libertas	Aquila	ξ Aquilae A	HR 7595	2015-12-15	\N	
180	Lich	Virgo	PSR B1257+12	PSR B1257+12	2015-12-15	16	Sombrero Galaxy
181	Lilii Borea	Aries	39 Arietis	HR 824	2017-09-05	\N	
182	Maasym	Hercules	λ Herculis	HR 6526	2016-09-12	\N	
183	Mahasim	Auriga	θ Aurigae A	HR 2095	2017-06-30	\N	
184	Maia	Taurus	20 Tauri	HR 1149	2016-07-20	\N	
185	Marfik	Ophiuchus	λ Ophiuchi A	HR 6149	2016-09-12	\N	
186	Markab	Pegasus	α Pegasi	HR 8781	2016-06-30	10	Little Sombrero Galaxy
187	Markeb	Vela	κ Velorum	HR 3734	2017-09-05	\N	
188	Marsic	Hercules	κ Herculis A	HR 6008	2017-02-01	\N	
189	Matar	Pegasus	η Pegasi Aa	HR 8650	2016-08-21	10	Little Sombrero Galaxy
190	Mebsuta	Gemini	ε Geminorum	HR 2473	2016-07-20	\N	
191	Megrez	Ursa Major	δ Ursae Majoris	HR 4660	2016-06-30	21	Bode’s Galaxy
192	Meissa	Orion	λ Orionis A	HR 1879	2016-07-20	\N	
193	Mekbuda	Gemini	ζ Geminorum Aa	HR 2650	2016-09-12	\N	
194	Meleph	Cancer	ε Cancri Aa	HR 3429	2017-09-05	\N	
195	Menkalinan	Auriga	β Aurigae Aa	HR 2088	2016-07-20	\N	
196	Menkar	Cetus	α Ceti	HR 911	2016-06-30	33	Wolf-Lundmark-Melotte
197	Menkent	Centaurus	θ Centauri	HR 5288	2016-08-21	20	Backward Galaxy
198	Menkib	Perseus	ξ Persei	HR 1228	2016-09-12	\N	
199	Merak	Ursa Major	β Ursae Majoris	HR 4295	2016-06-30	21	Bode’s Galaxy
200	Merga	Boötes	38 Boötis	HR 5533	2016-09-12	\N	
201	Meridiana	Corona Australis	α Coronae Australis	HR 7254	2017-09-05	\N	
202	Merope	Taurus	23 Tauri Aa	HR 1156	2016-07-20	\N	
203	Mesarthim	Aries	γ1 Arietis A	HR 546	2016-08-21	\N	
204	Miaplacidus	Carina	β Carinae	HR 3685	2016-07-20	\N	
205	Mimosa	Crux	β Crucis	HR 4853	2016-07-20	\N	
206	Minchir	Hydra	σ Hydrae	HR 3418	2017-09-05	35	Southern Pinwheel Galaxy
207	Minelauva	Virgo	δ Virginis	HR 4910	2017-06-30	16	Sombrero Galaxy
208	Mintaka	Orion	δ Orionis Aa	HR 1852	2016-07-20	\N	
209	Mira	Cetus	ο Ceti Aa	HR 681	2016-06-30	33	Wolf-Lundmark-Melotte
210	Mirach	Andromeda	β Andromedae	HR 337	2016-06-30	19	Andromeda
211	Miram	Perseus	η Persei A	HR 834	2017-09-05	\N	
212	Mirfak	Perseus	α Persei	HR 1017	2016-07-20	\N	
213	Mirzam	Canis Major	β Canis Majoris	HR 2294	2016-07-20	\N	
214	Misam	Perseus	κ Persei Aa	HR 941	2017-09-05	\N	
215	Mizar	Ursa Major	ζ Ursae Majoris Aa	HR 5054	2016-06-30	21	Bode’s Galaxy
216	Mothallah	Triangulum	α Trianguli	HR 544	2016-08-21	18	Triangulum Galaxy
217	Muliphein	Canis Major	γ Canis Majoris	HR 2657	2016-08-21	\N	
218	Muphrid	Boötes	η Boötis Aa	HR 5235	2016-09-12	\N	
219	Muscida	Ursa Major	ο Ursae Majoris A	HR 3323	2016-07-20	21	Bode’s Galaxy
220	Musica	Delphinus	18 Delphini	HR 8030	2015-12-15	\N	
221	Nahn	Cancer	ξ Cancri A	HR 3627	2018-06-01	\N	
222	Naos	Puppis	ζ Puppis	HR 3165	2016-08-21	\N	
223	Nashira	Capricornus	γ Capricorni A	HR 8278	2016-08-21	\N	
224	Nekkar	Boötes	β Boötis	HR 5602	2016-08-21	\N	
225	Nembus	Andromeda	51 Andromedae	HR 464	2017-09-05	19	Andromeda
226	Nihal	Lepus	β Leporis A	HR 1829	2016-07-20	\N	
227	Nunki	Sagittarius	σ Sagittarii Aa	HR 7121	2016-08-21	\N	
228	Nusakan	Corona Borealis	β Coronae Borealis A	HR 5747	2016-09-12	\N	
229	Ogma	Hercules	HD 149026	HD 149026	2015-12-15	\N	
230	Okab	Aquila	ζ Aquilae A	HR 7235	2018-06-01	\N	
231	Paikauhale	Scorpius	τ Scorpii A	HR 6165	2018-08-10	\N	
232	Peacock	Pavo	α Pavonis Aa	HR 7790	2016-07-20	\N	
233	Phact	Columba	α Columbae	HR 1956	2016-07-20	\N	
234	Phecda	Ursa Major	γ Ursae Majoris Aa	HR 4554	2016-07-20	21	Bode’s Galaxy
235	Pherkad	Ursa Minor	γ Ursae Minoris	HR 5735	2016-08-21	\N	
236	Piautos	Cancer	λ Cancri	HR 3268	2018-06-01	\N	
237	Pipirima	Scorpius	μ2 Scorpii A	HR 6252	2017-09-05	\N	
238	Pleione	Taurus	28 Tauri Aa	HR 1180	2016-06-30	\N	
239	Polaris	Ursa Minor	α Ursae Minoris	HR 424	2016-06-30	\N	
240	Polaris Australis	Octans	σ Octantis	HR 7228	2017-09-05	\N	
241	Polis	Sagittarius	μ Sagittarii Aa	HR 6812	2017-09-05	\N	
242	Pollux	Gemini	β Geminorum	HR 2990	2015-12-15	\N	
243	Porrima	Virgo	γ Virginis A	HR 4825	2016-07-20	16	Sombrero Galaxy
244	Praecipua	Leo Minor	46 Leonis Minoris	HR 4247	2017-06-30	\N	
245	Prima Hyadum	Taurus	γ Tauri A	HR 1346	2017-09-05	\N	
246	Procyon	Canis Minor	α Canis Minoris A	HR 2943	2016-06-30	\N	
247	Propus	Gemini	η Geminorum A	HR 2216	2016-07-20	\N	
248	Proxima Centauri	Centaurus	α Centauri C	GJ 551	2016-08-21	20	Backward Galaxy
249	Ran	Eridanus	ε Eridani	HR 1084	2015-12-15	\N	
250	Rasalas	Leo	μ Leonis	HR 3905	2016-09-12	\N	
251	Rasalgethi	Hercules	α1 Herculis Aa	HR 6406	2016-06-30	\N	
252	Rasalhague	Ophiuchus	α Ophiuchi A	HR 6556	2016-07-20	\N	
253	Rastaban	Draco	β Draconis A	HR 6536	2016-08-21	36	Tadpole Galaxy
254	Regulus	Leo	α Leonis A	HR 3982	2016-06-30	\N	
255	Revati	Pisces	ζ Piscium A	HR 361	2017-06-30	\N	
256	Rigel	Orion	β Orionis A	HR 1713	2016-06-30	\N	
257	Rigil Kentaurus	Centaurus	α Centauri A	HR 5459	2016-11-06	20	Backward Galaxy
258	Rotanev	Delphinus	β Delphini A	HR 7882	2016-09-12	\N	
259	Ruchbah	Cassiopeia	δ Cassiopeiae Aa	HR 403	2016-08-21	\N	
260	Rukbat	Sagittarius	α Sagittarii	HR 7348	2016-07-20	\N	
261	Sabik	Ophiuchus	η Ophiuchi A	HR 6378	2016-08-21	\N	
262	Saclateni	Auriga	ζ Aurigae A	HR 1612	2017-06-30	\N	
263	Sadachbia	Aquarius	γ Aquarii Aa	HR 8518	2016-08-21	\N	
264	Sadalbari	Pegasus	μ Pegasi	HR 8684	2016-08-21	10	Little Sombrero Galaxy
265	Sadalmelik	Aquarius	α Aquarii A	HR 8414	2016-08-21	\N	
266	Sadalsuud	Aquarius	β Aquarii A	HR 8232	2016-08-21	\N	
267	Sadr	Cygnus	γ Cygni A	HR 7796	2016-08-21	26	Fireworks Galaxy
268	Saiph	Orion	κ Orionis	HR 2004	2016-07-20	\N	
269	Salm	Pegasus	τ Pegasi	HR 8880	2017-09-05	10	Little Sombrero Galaxy
270	Sargas	Scorpius	θ Scorpii A	HR 6553	2016-08-21	\N	
271	Sarin	Hercules	δ Herculis Aa	HR 6410	2016-09-12	\N	
272	Sceptrum	Eridanus	53 Eridani A	HR 1481	2017-06-30	\N	
273	Scheat	Pegasus	β Pegasi	HR 8775	2016-06-30	10	Little Sombrero Galaxy
274	Schedar	Cassiopeia	α Cassiopeiae	HR 168	2016-08-21	\N	
275	Secunda Hyadum	Taurus	δ Tauri Aa	HR 1373	2017-09-05	\N	
276	Segin	Cassiopeia	ε Cassiopeiae	HR 0542	2017-09-05	\N	
277	Seginus	Boötes	γ Boötis Aa	HR 5435	2016-08-21	\N	
278	Sham	Sagitta	α Sagittae	HR 7479	2016-09-12	\N	
279	Shaula	Scorpius	λ Scorpii Aa	HR 6527	2016-07-20	\N	
280	Sheliak	Lyra	β Lyrae Aa1	HR 7106	2016-08-21	\N	
281	Sheratan	Aries	β Arietis A	HR 553	2016-07-20	\N	
282	Sirius	Canis Major	α Canis Majoris A	HR 2491	2016-06-30	\N	
283	Situla	Aquarius	κ Aquarii A	HR 8610	2016-09-12	\N	
284	Skat	Aquarius	δ Aquarii A	HR 8709	2016-08-21	\N	
285	Spica	Virgo	α Virginis Aa	HR 5056	2016-06-30	16	Sombrero Galaxy
286	Sualocin	Delphinus	α Delphini Aa	HR 7906	2016-09-12	\N	
287	Subra	Leo	ο Leonis Aa	HR 3852	2016-09-12	\N	
288	Suhail	Vela	λ Velorum	HR 3634	2016-08-21	\N	
289	Sulafat	Lyra	γ Lyrae	HR 7178	2016-08-21	\N	
290	Syrma	Virgo	ι Virginis	HR 5338	2016-09-12	16	Sombrero Galaxy
291	Tabit	Orion	π3 Orionis	HR 1543	2017-09-05	\N	
292	Taiyangshou	Ursa Major	χ Ursae Majoris	HR 4518	2017-06-30	21	Bode’s Galaxy
293	Taiyi	Draco	8 Draconis	HR 4916	2017-06-30	36	Tadpole Galaxy
294	Talitha	Ursa Major	ι Ursae Majoris Aa	HR 3569	2016-07-20	21	Bode’s Galaxy
295	Tania Australis	Ursa Major	μ Ursae Majoris A	HR 4069	2016-07-20	21	Bode’s Galaxy
296	Tania Borealis	Ursa Major	λ Ursae Majoris A	HR 4033	2016-07-20	21	Bode’s Galaxy
297	Tarazed	Aquila	γ Aquilae	HR 7525	2016-08-21	\N	
298	Tarf	Cancer	β Cancri A	HR 3249	2018-06-01	\N	
299	Taygeta	Taurus	19 Tauri Aa	HR 1145	2016-08-21	\N	
300	Tegmine	Cancer	ζ1 Cancri A	HR 3208	2016-09-12	\N	
301	Tejat	Gemini	μ Geminorum Aa	HR 2286	2017-02-01	\N	
302	Terebellum	Sagittarius	ω Sagittarii A	HR 7597	2017-09-05	\N	
303	Theemin	Eridanus	υ2 Eridani	HR 1464	2017-02-01	\N	
304	Thuban	Draco	α Draconis A	HR 5291	2016-06-30	36	Tadpole Galaxy
305	Tiaki	Grus	β Gruis	HR 8636	2017-09-05	\N	
306	Tianguan	Taurus	ζ Tauri A	HR 1910	2017-06-30	\N	
307	Tianyi	Draco	7 Draconis	HR 4863	2017-06-30	36	Tadpole Galaxy
308	Titawin	Andromeda	υ Andromedae A	HR 458	2015-12-15	19	Andromeda
309	Toliman	Centaurus	α Centauri B	HR 5460	2018-08-10	20	Backward Galaxy
310	Tonatiuh	Camelopardalis	HD 104985	HR 4609	2015-12-15	\N	
311	Torcular	Pisces	ο Piscium A	HR 510	2017-09-05	\N	
312	Tureis	Puppis	ρ Puppis A	HR 3185	2016-09-12	\N	
313	Ukdah	Hydra	ι Hydrae	HR 3845	2018-06-01	35	Southern Pinwheel Galaxy
314	Unukalhai	Serpens	α Serpentis	HR 5854	2016-08-21	27	Hoag’s Galaxy
315	Unurgunite	Canis Major	σ Canis Majoris	HR 2646	2017-09-05	\N	
316	Vega	Lyra	α Lyrae	HR 7001	2016-06-30	\N	
317	Veritate	Andromeda	14 Andromedae A	HR 8930	2015-12-15	19	Andromeda
318	Vindemiatrix	Virgo	ε Virginis	HR 4932	2016-07-20	16	Sombrero Galaxy
319	Wasat	Gemini	δ Geminorum Aa	HR 2777	2016-08-21	\N	
320	Wazn	Columba	β Columbae	HR 2040	2016-07-20	\N	
321	Wezen	Canis Major	δ Canis Majoris Aa	HR 2693	2016-07-20	\N	
322	Wurren	Phoenix	ζ Phoenicis Aa	HR 338	2017-11-19	\N	
323	Xamidimura	Scorpius	μ1 Scorpii Aa	HR 6247	2017-09-05	\N	
324	Xuange	Boötes	λ Boötis	HR 5351	2017-06-30	\N	
325	Yed Posterior	Ophiuchus	ε Ophiuchi	HR 6075	2016-10-05	\N	
326	Yed Prior	Ophiuchus	δ Ophiuchi	HR 6056	2016-10-05	\N	
327	Yildun	Ursa Minor	δ Ursae Minoris	HR 6789	2016-08-21	\N	
328	Zaniah	Virgo	η Virginis Aa	HR 4689	2016-09-12	16	Sombrero Galaxy
329	Zaurak	Eridanus	γ Eridani	HR 1231	2016-07-20	\N	
330	Zavijava	Virgo	β Virginis	HR 4540	2016-08-21	16	Sombrero Galaxy
331	Zhang	Hydra	υ1 Hydrae A	HR 3903	2017-06-30	35	Southern Pinwheel Galaxy
332	Zibal	Eridanus	ζ Eridani Aa	HR 984	2016-09-12	\N	
333	Zosma	Leo	δ Leonis	HR 4357	2016-07-20	\N	
334	Zubenelgenubi	Libra	α2 Librae Aa	HR 5531	2016-08-21	\N	
335	Zubenelhakrabi	Libra	γ Librae A	HR 5787	2017-09-05	\N	
336	Zubeneschamali	Libra	β Librae	HR 5685	2016-08-21	\N	
\.


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 37, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 45, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 12, true);


--
-- Name: satellite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.satellite_id_seq', 177, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 336, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: satellite satellite_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_pkey PRIMARY KEY (satellite_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_id UNIQUE (galaxy_id);


--
-- Name: moon unique_moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_id UNIQUE (moon_id);


--
-- Name: planet unique_planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_id UNIQUE (planet_id);


--
-- Name: satellite unique_satellite_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT unique_satellite_id UNIQUE (satellite_id);


--
-- Name: star unique_star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_id UNIQUE (star_id);


--
-- Name: moon fk_moon_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: satellite fk_satellite_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT fk_satellite_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star fk_star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

