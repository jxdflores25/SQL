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
-- Name: clima; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.clima (
    clima_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.clima OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    age_in_millions_of_years integer,
    rotacion_periodo integer,
    distance_from_earth numeric(4,1),
    description text NOT NULL,
    is_spherical boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    age_in_millions_of_years integer,
    rotacion_periodo integer,
    distance_from_earth numeric(4,1),
    description text NOT NULL,
    is_spherical boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    age_in_millions_of_years integer,
    rotacion_periodo integer,
    distance_from_earth numeric(4,1),
    description text NOT NULL,
    is_spherical boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    age_in_millions_of_years integer,
    rotacion_periodo integer,
    distance_from_earth numeric(4,1),
    description text NOT NULL,
    is_spherical boolean,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Data for Name: clima; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.clima VALUES (1, 'calor', 'asdfasdfa');
INSERT INTO public.clima VALUES (2, 'frio', 'asdfasdf');
INSERT INTO public.clima VALUES (3, 'templado', 'asdfasdf');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 20, 3, 256.4, 'asdfasdfasdfasdf', true);
INSERT INTO public.galaxy VALUES (2, 'b', 25, 10, 365.4, 'asdasd', true);
INSERT INTO public.galaxy VALUES (3, 'c', 15, 8, 246.4, 'asdfasdfasdfasdf', true);
INSERT INTO public.galaxy VALUES (4, 'd', 65, 5, 204.4, 'asdasd', true);
INSERT INTO public.galaxy VALUES (5, 'e', 11, 5, 266.4, 'asdfasdfasdfasdf', true);
INSERT INTO public.galaxy VALUES (6, 'f', 52, 6, 274.4, 'asdasd', true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'a', 20, 3, 256.4, 'asdfasdfasdfasdf', true, 1);
INSERT INTO public.moon VALUES (2, 'b', 25, 10, 365.4, 'asdasd', true, 1);
INSERT INTO public.moon VALUES (3, 'c', 15, 8, 246.4, 'asdfasdfasdfasdf', true, 2);
INSERT INTO public.moon VALUES (4, 'd', 65, 5, 204.4, 'asdasd', true, 1);
INSERT INTO public.moon VALUES (5, 'e', 11, 5, 266.4, 'asdfasdfasdfasdf', true, 3);
INSERT INTO public.moon VALUES (6, 'f', 52, 6, 274.4, 'asdasd', true, 4);
INSERT INTO public.moon VALUES (7, 'g', 20, 3, 256.4, 'asdfasdfasdfasdf', true, 5);
INSERT INTO public.moon VALUES (8, 'h', 25, 10, 365.4, 'asdasd', true, 3);
INSERT INTO public.moon VALUES (9, 'j', 15, 8, 246.4, 'asdfasdfasdfasdf', true, 2);
INSERT INTO public.moon VALUES (10, 'k', 65, 5, 204.4, 'asdasd', true, 2);
INSERT INTO public.moon VALUES (11, 'y', 11, 5, 266.4, 'asdfasdfasdfasdf', true, 4);
INSERT INTO public.moon VALUES (12, 'i', 52, 6, 274.4, 'asdasd', true, 5);
INSERT INTO public.moon VALUES (13, 'v', 20, 3, 256.4, 'asdfasdfasdfasdf', true, 8);
INSERT INTO public.moon VALUES (14, 'x', 25, 10, 365.4, 'asdasd', true, 10);
INSERT INTO public.moon VALUES (15, 'l', 15, 8, 246.4, 'asdfasdfasdfasdf', true, 7);
INSERT INTO public.moon VALUES (16, 'p', 65, 5, 204.4, 'asdasd', true, 11);
INSERT INTO public.moon VALUES (20, 'z', 25, 10, 365.4, 'asdasd', true, 10);
INSERT INTO public.moon VALUES (19, 'ks', 20, 3, 256.4, 'asdfasdfasdfasdf', true, 5);
INSERT INTO public.moon VALUES (17, 'hs', 20, 3, 256.4, 'asdfasdfasdfasdf', true, 6);
INSERT INTO public.moon VALUES (18, 'js', 25, 10, 365.4, 'asdasd', true, 3);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'a', 20, 3, 256.4, 'asdfasdfasdfasdf', true, 1);
INSERT INTO public.planet VALUES (2, 'b', 25, 10, 365.4, 'asdasd', true, 1);
INSERT INTO public.planet VALUES (3, 'c', 15, 8, 246.4, 'asdfasdfasdfasdf', true, 2);
INSERT INTO public.planet VALUES (4, 'd', 65, 5, 204.4, 'asdasd', true, 1);
INSERT INTO public.planet VALUES (5, 'e', 11, 5, 266.4, 'asdfasdfasdfasdf', true, 3);
INSERT INTO public.planet VALUES (6, 'f', 52, 6, 274.4, 'asdasd', true, 4);
INSERT INTO public.planet VALUES (7, 'g', 20, 3, 256.4, 'asdfasdfasdfasdf', true, 5);
INSERT INTO public.planet VALUES (8, 'h', 25, 10, 365.4, 'asdasd', true, 3);
INSERT INTO public.planet VALUES (9, 'j', 15, 8, 246.4, 'asdfasdfasdfasdf', true, 2);
INSERT INTO public.planet VALUES (10, 'k', 65, 5, 204.4, 'asdasd', true, 2);
INSERT INTO public.planet VALUES (11, 'y', 11, 5, 266.4, 'asdfasdfasdfasdf', true, 4);
INSERT INTO public.planet VALUES (12, 'i', 52, 6, 274.4, 'asdasd', true, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'a', 20, 3, 256.4, 'asdfasdfasdfasdf', true, 1);
INSERT INTO public.star VALUES (2, 'b', 25, 10, 365.4, 'asdasd', true, 1);
INSERT INTO public.star VALUES (3, 'c', 15, 8, 246.4, 'asdfasdfasdfasdf', true, 2);
INSERT INTO public.star VALUES (4, 'd', 65, 5, 204.4, 'asdasd', true, 1);
INSERT INTO public.star VALUES (5, 'e', 11, 5, 266.4, 'asdfasdfasdfasdf', true, 3);
INSERT INTO public.star VALUES (6, 'f', 52, 6, 274.4, 'asdasd', true, 4);


--
-- Name: clima clima_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.clima
    ADD CONSTRAINT clima_pkey PRIMARY KEY (clima_id);


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
-- Name: planet name_sd; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT name_sd UNIQUE (name);


--
-- Name: galaxy name_sp; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT name_sp UNIQUE (name);


--
-- Name: moon name_sq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT name_sq UNIQUE (name);


--
-- Name: clima name_st; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.clima
    ADD CONSTRAINT name_st UNIQUE (name);


--
-- Name: star name_sw; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT name_sw UNIQUE (name);


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
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--
