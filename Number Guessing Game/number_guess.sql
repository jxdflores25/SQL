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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer,
    number_of_attemps integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22)
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.games (game_id, user_id, number_of_attemps) FROM stdin;
269	129	594
270	129	359
271	130	158
272	130	760
273	129	788
274	129	125
275	129	593
276	131	896
277	131	514
278	132	587
279	132	73
280	131	947
281	131	187
282	131	276
283	133	822
284	133	908
285	134	312
286	134	822
287	133	799
288	133	72
289	133	927
290	135	8
291	135	549
292	136	846
293	136	805
294	135	784
295	135	217
296	135	810
297	137	881
298	137	614
299	138	343
300	138	604
301	137	792
302	137	925
303	137	248
304	139	218
305	139	486
306	140	997
307	140	237
308	139	441
309	139	369
310	139	450
311	141	127
312	141	872
313	142	203
314	142	241
315	141	893
316	141	184
317	141	900
318	143	735
319	143	627
320	144	306
321	144	440
322	143	69
323	143	173
324	143	978
325	145	764
326	145	817
327	146	697
328	146	263
329	145	494
330	145	28
331	145	723
332	147	10
333	148	717
334	148	364
335	149	574
336	149	795
337	148	378
338	148	71
339	148	983
340	150	592
341	150	530
342	151	604
343	151	41
344	150	81
345	150	13
346	150	746
347	152	972
348	152	113
349	153	502
350	153	912
351	152	696
352	152	974
353	152	659
354	154	760
355	154	857
356	155	474
357	155	565
358	154	98
359	154	320
360	154	90
361	156	725
362	156	2
363	157	14
364	157	102
365	156	311
366	156	439
367	156	41
368	158	466
369	158	271
370	159	145
371	159	363
372	158	841
373	158	641
374	158	272
375	147	6
376	160	26
377	160	136
378	161	741
379	161	943
380	160	673
381	160	209
382	160	409
383	162	688
384	162	557
385	163	627
386	163	918
387	162	730
388	162	61
389	162	76
390	164	340
391	164	158
392	165	788
393	165	23
394	164	77
395	164	937
396	164	446
397	166	694
398	166	585
399	167	97
400	167	652
401	166	514
402	166	167
403	166	685
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.users (user_id, username) FROM stdin;
129	user_1696700003368
130	user_1696700003367
131	user_1696700015864
132	user_1696700015863
133	user_1696700088465
134	user_1696700088464
135	user_1696700101674
136	user_1696700101673
137	user_1696700120405
138	user_1696700120404
139	user_1696700134107
140	user_1696700134106
141	user_1696700220830
142	user_1696700220829
143	user_1696700285753
144	user_1696700285752
145	user_1696700605156
146	user_1696700605155
147	carmen
148	user_1696700933251
149	user_1696700933250
150	user_1696700938728
151	user_1696700938727
152	user_1696700943002
153	user_1696700943001
154	user_1696700947686
155	user_1696700947685
156	user_1696700952882
157	user_1696700952881
158	user_1696701136286
159	user_1696701136285
160	user_1696701354158
161	user_1696701354157
162	user_1696701386925
163	user_1696701386924
164	user_1696701392847
165	user_1696701392846
166	user_1696701399235
167	user_1696701399234
128	juan
\.


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 403, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 167, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--
