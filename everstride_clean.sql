--
-- PostgreSQL database dump
--

-- Dumped from database version 10.23 (Ubuntu 10.23-0ubuntu0.18.04.2)
-- Dumped by pg_dump version 10.23 (Ubuntu 10.23-0ubuntu0.18.04.2)

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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.items (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    price integer DEFAULT 1 NOT NULL,
    image character varying(255) NOT NULL
);


--
-- Name: items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.items_id_seq OWNED BY public.items.id;


--
-- Name: processed_workouts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.processed_workouts (
    id integer NOT NULL,
    user_id integer NOT NULL,
    workout_id bigint NOT NULL,
    recorded_at timestamp without time zone DEFAULT now()
);


--
-- Name: processed_workouts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.processed_workouts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: processed_workouts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.processed_workouts_id_seq OWNED BY public.processed_workouts.id;


--
-- Name: quests; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.quests (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(800) NOT NULL,
    goal_steps integer NOT NULL,
    result_description character varying(800) NOT NULL,
    option_1 character varying(255) NOT NULL,
    option_2 character varying(255) NOT NULL,
    success_message character varying(800) NOT NULL,
    failure_message character varying(800) NOT NULL
);


--
-- Name: quests_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.quests_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: quests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.quests_id_seq OWNED BY public.quests.id;


--
-- Name: user_friends; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_friends (
    id integer NOT NULL,
    user_id_1 integer NOT NULL,
    user_id_2 integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: user_friends_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_friends_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_friends_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.user_friends_id_seq OWNED BY public.user_friends.id;


--
-- Name: user_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_items (
    id integer NOT NULL,
    user_id integer NOT NULL,
    item_id integer NOT NULL
);


--
-- Name: user_items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.user_items_id_seq OWNED BY public.user_items.id;


--
-- Name: user_quests; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_quests (
    id integer NOT NULL,
    user_id integer NOT NULL,
    quest_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    completed boolean DEFAULT false
);


--
-- Name: user_quests_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_quests_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_quests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.user_quests_id_seq OWNED BY public.user_quests.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    distance_travelled_today integer DEFAULT 0,
    total_distance_travelled integer DEFAULT 0,
    last_total_distance integer DEFAULT 0,
    gold integer DEFAULT 0,
    colour character varying(12),
    last_travelled_today integer DEFAULT 0,
    accumulated_distance integer DEFAULT 0,
    equipped_hat integer,
    equipped_shirt integer,
    equipped_pants integer,
    equipped_boots integer,
    equipped_weapon integer
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: workouts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.workouts (
    id integer NOT NULL,
    user_id integer NOT NULL,
    distance integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: workouts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.workouts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: workouts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.workouts_id_seq OWNED BY public.workouts.id;


--
-- Name: items id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.items ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);


--
-- Name: processed_workouts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.processed_workouts ALTER COLUMN id SET DEFAULT nextval('public.processed_workouts_id_seq'::regclass);


--
-- Name: quests id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.quests ALTER COLUMN id SET DEFAULT nextval('public.quests_id_seq'::regclass);


--
-- Name: user_friends id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_friends ALTER COLUMN id SET DEFAULT nextval('public.user_friends_id_seq'::regclass);


--
-- Name: user_items id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_items ALTER COLUMN id SET DEFAULT nextval('public.user_items_id_seq'::regclass);


--
-- Name: user_quests id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_quests ALTER COLUMN id SET DEFAULT nextval('public.user_quests_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: workouts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.workouts ALTER COLUMN id SET DEFAULT nextval('public.workouts_id_seq'::regclass);


--
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.items (id, name, type, description, price, image) FROM stdin;
1	Hat of Wisdom	hat	Increases wisdom by 5.	300	hat1.png
2	Cap of Agility	hat	A lightweight cap that boosts agility by 3.	200	hat2.png
3	Helm of Endurance	hat	A sturdy helm that increases endurance by 7.	600	hat3.png
4	Crown of Mystics	hat	An ornate crown that enhances magic power by 10.	1000	hat4.png
5	Adventurer Tunic	shirt	A basic tunic that increases dexterity by 1.	300	shirt1.png
6	Robe of the Magi	shirt	A flowing robe that increases magic resistance by 8.	700	shirt2.png
7	Vest of Vigor	shirt	A leather vest that boosts health by 15.	600	shirt3.png
8	Chainmail Shirt	shirt	A shirt made of chainmail that adds armor by 10.	800	shirt4.png
9	Leggings of Speed	pants	Light leggings that increase speed by 5.	400	pants1.png
10	Pants of Might	pants	Durable pants that increase strength by 4.	500	pants2.png
11	Fortitude Greaves	pants	Metal greaves that boost armor by 7.	700	pants3.png
12	Trousers of Luck	pants	Comfortable trousers that improve critical chance by 2%.	300	pants4.png
13	Boots of Swiftness	boots	Sturdy boots that increase movement speed by 3.	400	boots1.png
14	Sandals of Serenity	boots	Simple sandals that improve focus and mana regeneration.	300	boots2.png
15	Basic Sword	weapon	A sharp blade that increases strength by 5.	500	sword1.png
16	Sword of Might	weapon	A royal blade that increases strength by 10.	1000	sword2.png
17	Staff of Fire	weapon	A magical staff that enables fire spells.	1000	staff1.png
18	Bow of Precision	weapon	A fine-crafted bow that increases critical hit chance.	700	bow1.png
\.


--
-- Data for Name: processed_workouts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.processed_workouts (id, user_id, workout_id, recorded_at) FROM stdin;
\.


--
-- Data for Name: quests; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.quests (id, name, description, goal_steps, result_description, option_1, option_2, success_message, failure_message) FROM stdin;
1	The Trail of the Everstride	Brave Adventurer, journey through the Plains of Perpetual Motion and conquer the Glade of Nimble Steps. Achieve 1,000 steps to reach the Sanctuary of Vitality and claim the title of Everstride Champion!	1000	With the final step, you enter the Sanctuary of Vitality, your body brimming with energy as the title of Everstride Champion is bestowed upon you. Suddenly, a rustle from the nearby trees catches your attention. From the shadows, a group of bandits emerges, eyes glinting with greed.	Flee from the bandits	Draw your weapon	You escape the bandits!	You escape with your life, but are no richer.
2	The Path of Thunderstride	Intrepid Traveler, embark on a journey through the Stormy Highlands. Traverse the Thunder Pass and outpace the Lightning Trails. Walk or run 1,500 steps to reach the Peak of Resilience and claim the title of Thunderstride Conqueror!	1500	As you near the summit, a thunderous roar shakes the earth, and a mysterious figure emerges from the mist, blocking your path.	Calm the storm	Draw your weapon	The figure dissolves into thin air!	The mist blinds you and you are forced to flee.
3	The Journey to Windwalker Ridge	Embark on a trek through the Whispering Valleys, ascend the rocky trails of Windwalker Ridge, and conquer the heights to earn the title of Windwalker Traveler. Traverse 2000 steps and face the challenges of the ridge!	2000	As you climb higher, a gust of wind knocks you off balance, and a whirlwind forms before you, swirling violently.	Draw your weapon	Take shelter and wait for calm	You fight against the winds and reach the summit!	The storm is too fierce, and you are forced to wait, losing valuable time.
4	The Crossing of Mirage Desert	Venture across the scorching sands of Mirage Desert, navigating treacherous dunes and avoiding illusions. Reach the Oasis of Serenity after walking 2,500 steps to gain the title of Desert Wanderer!	2500	Just as the heat becomes unbearable, a mirage of an oasis shimmers ahead, but you must decide if it is real or a trick.	Approach the oasis cautiously	Ignore it and continue walking	The oasis is real, providing shelter!	The mirage disappears, leaving you lost and parched.
5	The Dance of the Emberflame	Prepare yourself for the fiery trials within the Ashen Peaks. Perform the sacred dance of the Emberflame, completing 3,000 steps through volcanic terrain to reach the Heart of the Firestorm and become the Emberflame Dancer!	3000	After your final step, the fire surrounding you subsides, revealing a glowing emberstone at the peak. Before you can approach, a fiery guardian appears, its molten eyes staring you down.	Submit to the guardian	Battle the guardian	The guardian grants you the Emberstone, leaving you with newfound wisdom.	The battle is hard-fought, but you succumb to the flames, your dance unfinished.
6	The Quest for the Frostbound Crown	Brave Frostwanderer, traverse the frozen wastes of the Glacial Expanse. Complete 3,500 steps through icy tundras and blizzards to reach the Throne of the Frost King and claim the legendary Frostbound Crown!	3500	As you arrive at the throne, a shimmering figure appears. The Frost King himself, guarding the crown, rises from the ice with a cold glare.	Speak with the Frost King	Challenge the Frost King to a duel	The Frost King offers you the crown and a blessing of the frozen north!	Your duel ends in defeat, but the king allows you to return with your life, though the crown remains untouched.
7	The March of the Ironfoot	Warrior of the Forge, march across the Metal Plains, where the ground hums with the power of ancient forges. Walk 4,000 steps to reach the Iron Citadel and claim the title of Ironfoot Conqueror!	4000	Upon reaching the Iron Citadel, a massive gate opens, revealing a blacksmith guardian who questions your resolve. Before you can respond, an army of iron golems approaches!	Stand your ground	Bargain with the golems	You stand strong, and the golems, impressed by your courage, allow you entry!	The golems overwhelm you, but you escape with your life, only to find yourself further from your goal than before.
\.


--
-- Data for Name: user_friends; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_friends (id, user_id_1, user_id_2, created_at) FROM stdin;
1	1	2	2025-05-11 20:41:41.774099
6	1	4	2025-05-12 00:33:56.785577
\.


--
-- Data for Name: user_items; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_items (id, user_id, item_id) FROM stdin;
1	1	1
2	1	2
3	1	5
4	1	6
5	1	12
6	1	13
7	1	14
8	1	16
9	1	17
10	2	2
11	2	3
12	2	6
13	2	7
14	2	11
15	2	13
16	2	15
17	2	17
18	2	18
19	3	1
20	3	2
21	3	3
22	3	5
23	3	7
24	3	8
25	3	10
26	3	12
27	3	16
28	3	17
\.


--
-- Data for Name: user_quests; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_quests (id, user_id, quest_id, created_at, completed) FROM stdin;
2	2	2	2025-05-11 18:35:38.627599	f
4	4	1	2025-05-11 18:35:38.627599	f
5	5	2	2025-05-11 18:35:38.627599	f
1	1	1	2025-05-11 18:35:38.627599	t
3	3	1	2025-05-11 18:35:38.627599	t
7	3	2	2025-05-11 21:37:55.878706	t
8	3	3	2025-05-11 21:41:08.906004	f
6	1	2	2025-05-11 20:31:26.83518	t
9	1	3	2025-05-12 00:29:05.96255	f
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (id, name, email, created_at, distance_travelled_today, total_distance_travelled, last_total_distance, gold, colour, last_travelled_today, accumulated_distance, equipped_hat, equipped_shirt, equipped_pants, equipped_boots, equipped_weapon) FROM stdin;
2	Ben Hallam	b@b.com	2025-05-11 18:35:38.610824	300	2000	0	0	limegreen	0	0	\N	\N	\N	\N	\N
4	Leeroy Walker	j@l.com	2025-05-11 18:35:38.610824	324	0	0	324	turquoise	0	0	1	5	12	13	16
5	Jenna Johnson	y@j.com	2025-05-11 18:35:38.610824	44	6000	0	622	turquoise	0	0	2	6	11	13	17
6	Jimmy Jenkins	y@q.com	2025-05-11 18:35:38.610824	440	10000	0	440	turquoise	0	0	3	7	10	13	18
1	Kyle McParland	k@k.com	2025-05-11 18:35:38.610824	599	12619	0	5426	yellow	0	5100	\N	5	\N	\N	\N
3	Jon Hiebert	j@j.com	2025-05-11 18:35:38.610824	1269	3879	0	2927	limegreen	0	1555	\N	\N	\N	\N	\N
\.


--
-- Data for Name: workouts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.workouts (id, user_id, distance, created_at) FROM stdin;
1	1	1000	2025-01-09 15:36:02.673
2	2	300	2025-01-09 15:36:02.673
3	4	324	2025-01-09 15:36:02.673
4	5	44	2025-01-09 15:36:02.673
5	6	440	2025-01-09 15:36:02.673
6	1	1000	2025-01-09 15:38:11.002
7	2	300	2025-01-09 15:38:11.002
8	4	324	2025-01-09 15:38:11.002
9	5	44	2025-01-09 15:38:11.002
10	6	440	2025-01-09 15:38:11.002
11	1	1000	2025-01-09 15:38:29.098
12	2	300	2025-01-09 15:38:29.098
13	4	324	2025-01-09 15:38:29.098
14	5	44	2025-01-09 15:38:29.098
15	6	440	2025-01-09 15:38:29.098
16	1	1000	2025-01-09 15:39:29.485
17	2	300	2025-01-09 15:39:29.485
18	4	324	2025-01-09 15:39:29.485
19	5	44	2025-01-09 15:39:29.485
20	6	440	2025-01-09 15:39:29.485
21	1	1000	2025-01-09 15:40:47.937
22	2	300	2025-01-09 15:40:47.937
23	4	324	2025-01-09 15:40:47.937
24	5	44	2025-01-09 15:40:47.937
25	6	440	2025-01-09 15:40:47.937
26	1	1000	2025-01-09 15:42:25.634
27	2	300	2025-01-09 15:42:25.645
28	4	324	2025-01-09 15:42:25.655
29	5	44	2025-01-09 15:42:25.664
30	6	440	2025-01-09 15:42:25.673
31	1	1000	2025-01-09 15:43:26.603
32	2	300	2025-01-09 15:43:26.611
33	4	324	2025-01-09 15:43:26.618
34	5	44	2025-01-09 15:43:26.625
35	6	440	2025-01-09 15:43:26.631
36	1	1000	2025-01-09 15:43:35.735
37	2	300	2025-01-09 15:43:35.746
38	4	324	2025-01-09 15:43:35.755
39	5	44	2025-01-09 15:43:35.768
40	6	440	2025-01-09 15:43:35.778
41	1	1000	2025-01-09 15:44:10.302
42	2	300	2025-01-09 15:44:10.312
43	4	324	2025-01-09 15:44:10.321
44	5	44	2025-01-09 15:44:10.33
45	6	440	2025-01-09 15:44:10.339
46	1	1000	2025-01-09 15:44:15.688
47	2	300	2025-01-09 15:44:15.697
48	4	324	2025-01-09 15:44:15.707
49	5	44	2025-01-09 15:44:15.717
50	6	440	2025-01-09 15:44:15.726
51	1	1000	2025-01-09 15:45:08.434
52	2	300	2025-01-09 15:45:08.442
53	4	324	2025-01-09 15:45:08.448
54	5	44	2025-01-09 15:45:08.456
55	6	440	2025-01-09 15:45:08.464
56	1	1000	2025-01-09 15:45:45.774
57	2	300	2025-01-09 15:45:45.787
58	4	324	2025-01-09 15:45:45.797
59	5	44	2025-01-09 15:45:45.807
60	6	440	2025-01-09 15:45:45.818
61	1	1000	2025-01-09 15:46:14.028
62	2	300	2025-01-09 15:46:14.039
63	4	324	2025-01-09 15:46:14.049
64	5	44	2025-01-09 15:46:14.06
65	6	440	2025-01-09 15:46:14.069
66	1	1000	2025-01-09 15:47:34.498
67	2	300	2025-01-09 15:47:34.498
68	4	324	2025-01-09 15:47:34.498
69	5	44	2025-01-09 15:47:34.498
70	6	440	2025-01-09 15:47:34.498
71	1	1000	2025-01-09 15:47:52.412
72	2	300	2025-01-09 15:47:52.412
73	4	324	2025-01-09 15:47:52.412
74	5	44	2025-01-09 15:47:52.412
75	6	440	2025-01-09 15:47:52.412
76	1	1000	2025-01-09 15:48:03.817
77	2	300	2025-01-09 15:48:03.817
78	4	324	2025-01-09 15:48:03.817
79	5	44	2025-01-09 15:48:03.817
80	6	440	2025-01-09 15:48:03.817
81	1	1000	2025-01-09 21:49:13.165
82	2	300	2025-01-09 21:49:13.165
83	4	324	2025-01-09 21:49:13.165
84	5	44	2025-01-09 21:49:13.165
85	6	440	2025-01-09 21:49:13.165
86	1	1000	2025-01-09 21:49:22.97
87	2	300	2025-01-09 21:49:22.97
88	4	324	2025-01-09 21:49:22.97
89	5	44	2025-01-09 21:49:22.97
90	6	440	2025-01-09 21:49:22.97
91	1	1000	2025-01-09 21:50:26.659
92	2	300	2025-01-09 21:50:26.664
93	4	324	2025-01-09 21:50:26.667
94	5	44	2025-01-09 21:50:26.671
95	6	440	2025-01-09 21:50:26.675
96	1	1000	2025-01-09 21:52:00
97	2	300	2025-01-09 21:52:00
98	4	324	2025-01-09 21:52:00
99	5	44	2025-01-09 21:52:00
100	6	440	2025-01-09 21:52:00
\.


--
-- Name: items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.items_id_seq', 18, true);


--
-- Name: processed_workouts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.processed_workouts_id_seq', 1, false);


--
-- Name: quests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.quests_id_seq', 7, true);


--
-- Name: user_friends_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.user_friends_id_seq', 6, true);


--
-- Name: user_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.user_items_id_seq', 28, true);


--
-- Name: user_quests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.user_quests_id_seq', 9, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 6, true);


--
-- Name: workouts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.workouts_id_seq', 110, true);


--
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- Name: processed_workouts processed_workouts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.processed_workouts
    ADD CONSTRAINT processed_workouts_pkey PRIMARY KEY (id);


--
-- Name: processed_workouts processed_workouts_workout_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.processed_workouts
    ADD CONSTRAINT processed_workouts_workout_id_key UNIQUE (workout_id);


--
-- Name: quests quests_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.quests
    ADD CONSTRAINT quests_pkey PRIMARY KEY (id);


--
-- Name: user_friends user_friends_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_friends
    ADD CONSTRAINT user_friends_pkey PRIMARY KEY (id);


--
-- Name: user_items user_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_items
    ADD CONSTRAINT user_items_pkey PRIMARY KEY (id);


--
-- Name: user_quests user_quests_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_quests
    ADD CONSTRAINT user_quests_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: workouts workouts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.workouts
    ADD CONSTRAINT workouts_pkey PRIMARY KEY (id);


--
-- Name: user_friends user_friends_user_id_1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_friends
    ADD CONSTRAINT user_friends_user_id_1_fkey FOREIGN KEY (user_id_1) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: user_friends user_friends_user_id_2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_friends
    ADD CONSTRAINT user_friends_user_id_2_fkey FOREIGN KEY (user_id_2) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: user_items user_items_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_items
    ADD CONSTRAINT user_items_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.items(id) ON DELETE CASCADE;


--
-- Name: user_items user_items_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_items
    ADD CONSTRAINT user_items_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: user_quests user_quests_quest_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_quests
    ADD CONSTRAINT user_quests_quest_id_fkey FOREIGN KEY (quest_id) REFERENCES public.quests(id) ON DELETE CASCADE;


--
-- Name: user_quests user_quests_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_quests
    ADD CONSTRAINT user_quests_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: users users_equipped_boots_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_equipped_boots_fkey FOREIGN KEY (equipped_boots) REFERENCES public.items(id) ON DELETE SET NULL;


--
-- Name: users users_equipped_hat_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_equipped_hat_fkey FOREIGN KEY (equipped_hat) REFERENCES public.items(id) ON DELETE SET NULL;


--
-- Name: users users_equipped_pants_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_equipped_pants_fkey FOREIGN KEY (equipped_pants) REFERENCES public.items(id) ON DELETE SET NULL;


--
-- Name: users users_equipped_shirt_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_equipped_shirt_fkey FOREIGN KEY (equipped_shirt) REFERENCES public.items(id) ON DELETE SET NULL;


--
-- Name: users users_equipped_weapon_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_equipped_weapon_fkey FOREIGN KEY (equipped_weapon) REFERENCES public.items(id) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

