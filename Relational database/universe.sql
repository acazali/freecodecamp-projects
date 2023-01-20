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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(20)
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text,
    galaxy_type integer,
    galaxy_age_in_milion_years integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20),
    moon_radius_in_km numeric(4,1),
    planet_id integer NOT NULL,
    age_in_million_years integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(20) NOT NULL,
    number_of_moons integer,
    star_id integer,
    has_moons boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(20) NOT NULL,
    star_radius_in_km numeric(3,2),
    galaxy_id integer,
    has_planets boolean,
    number_of_planets integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 2, 'Andromeda');
INSERT INTO public.constellation VALUES (2, 6, 'Coma berenices');
INSERT INTO public.constellation VALUES (3, 4, 'Corvus');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky way', 'thats the galaxy were we are :)', NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'This is going to collide with the milky way', NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Whirlpool', 'Its name is an appliance brand', NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Antennae', 'It looks like a insect antennae', NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Backward', 'It rotates backwards', NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Black eye', 'Has a black band so it looks like a black and evil eye', NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', NULL, 1, NULL);
INSERT INTO public.moon VALUES (2, 'Pandora', NULL, 2, NULL);
INSERT INTO public.moon VALUES (3, 'Europa', NULL, 2, NULL);
INSERT INTO public.moon VALUES (4, 'Callisto', NULL, 2, NULL);
INSERT INTO public.moon VALUES (5, 'Carpo', NULL, 2, NULL);
INSERT INTO public.moon VALUES (6, 'Ganymede', NULL, 2, NULL);
INSERT INTO public.moon VALUES (7, 'Io', NULL, 2, NULL);
INSERT INTO public.moon VALUES (8, 'Cyllene', NULL, 2, NULL);
INSERT INTO public.moon VALUES (9, 'Thebe', NULL, 2, NULL);
INSERT INTO public.moon VALUES (10, 'Eurydome', NULL, 2, NULL);
INSERT INTO public.moon VALUES (11, 'Dia', NULL, 2, NULL);
INSERT INTO public.moon VALUES (12, 'Arche', NULL, 2, NULL);
INSERT INTO public.moon VALUES (13, 'Herse', NULL, 2, NULL);
INSERT INTO public.moon VALUES (14, 'Euporie', NULL, 2, NULL);
INSERT INTO public.moon VALUES (15, 'Valetudo', NULL, 2, NULL);
INSERT INTO public.moon VALUES (16, 'Elara', NULL, 2, NULL);
INSERT INTO public.moon VALUES (17, 'Ersa', NULL, 2, NULL);
INSERT INTO public.moon VALUES (18, 'Aitne', NULL, 2, NULL);
INSERT INTO public.moon VALUES (19, 'Hermippe', NULL, 2, NULL);
INSERT INTO public.moon VALUES (20, 'Sinope', NULL, 2, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 1, true);
INSERT INTO public.planet VALUES (2, 'Jupiter', 80, 1, true);
INSERT INTO public.planet VALUES (3, 'Kepler-186f', NULL, 3, false);
INSERT INTO public.planet VALUES (4, 'Mercury', NULL, 1, NULL);
INSERT INTO public.planet VALUES (5, 'Venus', NULL, 1, NULL);
INSERT INTO public.planet VALUES (6, 'Mars', NULL, 1, NULL);
INSERT INTO public.planet VALUES (7, 'Saturn', NULL, 1, NULL);
INSERT INTO public.planet VALUES (8, 'Neptune', NULL, 1, NULL);
INSERT INTO public.planet VALUES (9, 'Uranus', NULL, 1, NULL);
INSERT INTO public.planet VALUES (10, 'Pluto', NULL, 1, NULL);
INSERT INTO public.planet VALUES (11, 'Kepler-11b', NULL, 3, NULL);
INSERT INTO public.planet VALUES (12, 'kepler-11c', NULL, 3, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', NULL, 1, true, NULL);
INSERT INTO public.star VALUES (2, 'Kepler-32', NULL, 1, true, NULL);
INSERT INTO public.star VALUES (3, 'Kepler-11', NULL, 1, true, NULL);
INSERT INTO public.star VALUES (4, 'Alpha centauri', NULL, 1, false, NULL);
INSERT INTO public.star VALUES (5, 'Rigil Kentaurus', NULL, 1, true, NULL);
INSERT INTO public.star VALUES (6, 'Toliman', NULL, 1, true, NULL);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 3, true);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: constellation unique_constellation_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT unique_constellation_id UNIQUE (constellation_id);


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
-- Name: star unique_star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_id UNIQUE (star_id);


--
-- Name: constellation constellation_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_sistem_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_sistem_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

