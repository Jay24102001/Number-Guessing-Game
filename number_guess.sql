--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    guesses integer NOT NULL
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
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0 NOT NULL,
    best_game integer
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

INSERT INTO public.games VALUES (1, 33, 972);
INSERT INTO public.games VALUES (2, 33, 69);
INSERT INTO public.games VALUES (3, 34, 621);
INSERT INTO public.games VALUES (4, 34, 556);
INSERT INTO public.games VALUES (5, 33, 918);
INSERT INTO public.games VALUES (6, 33, 41);
INSERT INTO public.games VALUES (7, 33, 38);
INSERT INTO public.games VALUES (8, 36, 34);
INSERT INTO public.games VALUES (9, 36, 644);
INSERT INTO public.games VALUES (10, 37, 27);
INSERT INTO public.games VALUES (11, 37, 375);
INSERT INTO public.games VALUES (12, 36, 994);
INSERT INTO public.games VALUES (13, 36, 905);
INSERT INTO public.games VALUES (14, 36, 405);
INSERT INTO public.games VALUES (15, 38, 842);
INSERT INTO public.games VALUES (16, 38, 969);
INSERT INTO public.games VALUES (17, 39, 773);
INSERT INTO public.games VALUES (18, 39, 98);
INSERT INTO public.games VALUES (19, 38, 909);
INSERT INTO public.games VALUES (20, 38, 87);
INSERT INTO public.games VALUES (21, 38, 680);
INSERT INTO public.games VALUES (22, 40, 531);
INSERT INTO public.games VALUES (23, 40, 785);
INSERT INTO public.games VALUES (24, 41, 919);
INSERT INTO public.games VALUES (25, 41, 526);
INSERT INTO public.games VALUES (26, 40, 366);
INSERT INTO public.games VALUES (27, 40, 12);
INSERT INTO public.games VALUES (28, 40, 503);
INSERT INTO public.games VALUES (29, 42, 153);
INSERT INTO public.games VALUES (30, 42, 425);
INSERT INTO public.games VALUES (31, 43, 383);
INSERT INTO public.games VALUES (32, 43, 962);
INSERT INTO public.games VALUES (33, 42, 977);
INSERT INTO public.games VALUES (34, 42, 838);
INSERT INTO public.games VALUES (35, 42, 722);
INSERT INTO public.games VALUES (36, 44, 893);
INSERT INTO public.games VALUES (37, 44, 81);
INSERT INTO public.games VALUES (38, 45, 310);
INSERT INTO public.games VALUES (39, 45, 584);
INSERT INTO public.games VALUES (40, 44, 152);
INSERT INTO public.games VALUES (41, 44, 816);
INSERT INTO public.games VALUES (42, 44, 108);
INSERT INTO public.games VALUES (43, 46, 173);
INSERT INTO public.games VALUES (44, 46, 4);
INSERT INTO public.games VALUES (45, 47, 836);
INSERT INTO public.games VALUES (46, 47, 873);
INSERT INTO public.games VALUES (47, 46, 837);
INSERT INTO public.games VALUES (48, 46, 297);
INSERT INTO public.games VALUES (49, 46, 424);
INSERT INTO public.games VALUES (50, 35, 16);
INSERT INTO public.games VALUES (51, 48, 683);
INSERT INTO public.games VALUES (52, 48, 380);
INSERT INTO public.games VALUES (53, 49, 181);
INSERT INTO public.games VALUES (54, 49, 68);
INSERT INTO public.games VALUES (55, 48, 609);
INSERT INTO public.games VALUES (56, 48, 849);
INSERT INTO public.games VALUES (57, 48, 11);
INSERT INTO public.games VALUES (58, 50, 919);
INSERT INTO public.games VALUES (59, 50, 58);
INSERT INTO public.games VALUES (60, 51, 189);
INSERT INTO public.games VALUES (61, 51, 189);
INSERT INTO public.games VALUES (62, 50, 874);
INSERT INTO public.games VALUES (63, 50, 569);
INSERT INTO public.games VALUES (64, 50, 988);
INSERT INTO public.games VALUES (65, 52, 132);
INSERT INTO public.games VALUES (66, 52, 866);
INSERT INTO public.games VALUES (67, 53, 633);
INSERT INTO public.games VALUES (68, 53, 597);
INSERT INTO public.games VALUES (69, 52, 799);
INSERT INTO public.games VALUES (70, 52, 763);
INSERT INTO public.games VALUES (71, 52, 852);
INSERT INTO public.games VALUES (72, 54, 888);
INSERT INTO public.games VALUES (73, 54, 875);
INSERT INTO public.games VALUES (74, 55, 555);
INSERT INTO public.games VALUES (75, 55, 397);
INSERT INTO public.games VALUES (76, 54, 706);
INSERT INTO public.games VALUES (77, 54, 963);
INSERT INTO public.games VALUES (78, 54, 730);
INSERT INTO public.games VALUES (79, 56, 683);
INSERT INTO public.games VALUES (80, 56, 75);
INSERT INTO public.games VALUES (81, 57, 823);
INSERT INTO public.games VALUES (82, 57, 425);
INSERT INTO public.games VALUES (83, 56, 810);
INSERT INTO public.games VALUES (84, 56, 385);
INSERT INTO public.games VALUES (85, 56, 560);
INSERT INTO public.games VALUES (86, 58, 927);
INSERT INTO public.games VALUES (87, 58, 219);
INSERT INTO public.games VALUES (88, 59, 199);
INSERT INTO public.games VALUES (89, 59, 83);
INSERT INTO public.games VALUES (90, 58, 847);
INSERT INTO public.games VALUES (91, 58, 396);
INSERT INTO public.games VALUES (92, 58, 845);
INSERT INTO public.games VALUES (93, 60, 554);
INSERT INTO public.games VALUES (94, 60, 715);
INSERT INTO public.games VALUES (95, 61, 696);
INSERT INTO public.games VALUES (96, 61, 839);
INSERT INTO public.games VALUES (97, 60, 709);
INSERT INTO public.games VALUES (98, 60, 476);
INSERT INTO public.games VALUES (99, 60, 822);
INSERT INTO public.games VALUES (100, 62, 700);
INSERT INTO public.games VALUES (101, 62, 191);
INSERT INTO public.games VALUES (102, 63, 861);
INSERT INTO public.games VALUES (103, 63, 518);
INSERT INTO public.games VALUES (104, 62, 793);
INSERT INTO public.games VALUES (105, 62, 438);
INSERT INTO public.games VALUES (106, 62, 572);
INSERT INTO public.games VALUES (107, 64, 225);
INSERT INTO public.games VALUES (108, 64, 808);
INSERT INTO public.games VALUES (109, 65, 532);
INSERT INTO public.games VALUES (110, 65, 878);
INSERT INTO public.games VALUES (111, 64, 466);
INSERT INTO public.games VALUES (112, 64, 540);
INSERT INTO public.games VALUES (113, 64, 860);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (2, 'user_1749370282564', 2, 469);
INSERT INTO public.users VALUES (1, 'user_1749370282565', 5, 269);
INSERT INTO public.users VALUES (4, 'user_1749370469723', 2, 671);
INSERT INTO public.users VALUES (3, 'user_1749370469724', 5, 45);
INSERT INTO public.users VALUES (6, 'user_1749370744076', 2, 89);
INSERT INTO public.users VALUES (5, 'user_1749370744077', 5, 26);
INSERT INTO public.users VALUES (8, 'user_1749370755452', 2, 195);
INSERT INTO public.users VALUES (7, 'user_1749370755453', 5, 258);
INSERT INTO public.users VALUES (9, 'user_1749370919548', 0, NULL);
INSERT INTO public.users VALUES (10, 'user_1749370919547', 0, NULL);
INSERT INTO public.users VALUES (11, 'user_1749371048033', 0, NULL);
INSERT INTO public.users VALUES (12, 'user_1749371048032', 0, NULL);
INSERT INTO public.users VALUES (13, 'user_1749371689157', 0, NULL);
INSERT INTO public.users VALUES (14, 'user_1749371689156', 0, NULL);
INSERT INTO public.users VALUES (15, 'user_1749371808494', 0, NULL);
INSERT INTO public.users VALUES (16, 'user_1749371808493', 0, NULL);
INSERT INTO public.users VALUES (17, 'user_1749372106645', 0, NULL);
INSERT INTO public.users VALUES (18, 'user_1749372106644', 0, NULL);
INSERT INTO public.users VALUES (19, 'user_1749372181148', 0, NULL);
INSERT INTO public.users VALUES (20, 'user_1749372181147', 0, NULL);
INSERT INTO public.users VALUES (21, 'user_1749372225723', 0, NULL);
INSERT INTO public.users VALUES (22, 'user_1749372225722', 0, NULL);
INSERT INTO public.users VALUES (23, 'user_1749372259860', 0, NULL);
INSERT INTO public.users VALUES (24, 'user_1749372259859', 0, NULL);
INSERT INTO public.users VALUES (25, 'user_1749372272276', 0, NULL);
INSERT INTO public.users VALUES (26, 'user_1749372272275', 0, NULL);
INSERT INTO public.users VALUES (27, 'user_1749372350563', 0, NULL);
INSERT INTO public.users VALUES (28, 'user_1749372350562', 0, NULL);
INSERT INTO public.users VALUES (29, 'user_1749372388807', 0, NULL);
INSERT INTO public.users VALUES (30, 'user_1749372388806', 0, NULL);
INSERT INTO public.users VALUES (31, 'user_1749372394789', 0, NULL);
INSERT INTO public.users VALUES (32, 'user_1749372394788', 0, NULL);
INSERT INTO public.users VALUES (33, 'user_1749372492113', 0, NULL);
INSERT INTO public.users VALUES (34, 'user_1749372492112', 0, NULL);
INSERT INTO public.users VALUES (35, 'Jayesh', 0, NULL);
INSERT INTO public.users VALUES (36, 'user_1749372753921', 0, NULL);
INSERT INTO public.users VALUES (37, 'user_1749372753920', 0, NULL);
INSERT INTO public.users VALUES (38, 'user_1749372839351', 0, NULL);
INSERT INTO public.users VALUES (39, 'user_1749372839350', 0, NULL);
INSERT INTO public.users VALUES (40, 'user_1749372932913', 0, NULL);
INSERT INTO public.users VALUES (41, 'user_1749372932912', 0, NULL);
INSERT INTO public.users VALUES (42, 'user_1749373030303', 0, NULL);
INSERT INTO public.users VALUES (43, 'user_1749373030302', 0, NULL);
INSERT INTO public.users VALUES (44, 'user_1749373095507', 0, NULL);
INSERT INTO public.users VALUES (45, 'user_1749373095506', 0, NULL);
INSERT INTO public.users VALUES (46, 'user_1749373248655', 0, NULL);
INSERT INTO public.users VALUES (47, 'user_1749373248654', 0, NULL);
INSERT INTO public.users VALUES (48, 'user_1749373362277', 0, NULL);
INSERT INTO public.users VALUES (49, 'user_1749373362276', 0, NULL);
INSERT INTO public.users VALUES (50, 'user_1749373378797', 0, NULL);
INSERT INTO public.users VALUES (51, 'user_1749373378796', 0, NULL);
INSERT INTO public.users VALUES (52, 'user_1749373559736', 0, NULL);
INSERT INTO public.users VALUES (53, 'user_1749373559735', 0, NULL);
INSERT INTO public.users VALUES (54, 'user_1749373668259', 0, NULL);
INSERT INTO public.users VALUES (55, 'user_1749373668258', 0, NULL);
INSERT INTO public.users VALUES (56, 'user_1749373994744', 0, NULL);
INSERT INTO public.users VALUES (57, 'user_1749373994743', 0, NULL);
INSERT INTO public.users VALUES (58, 'user_1749374168035', 0, NULL);
INSERT INTO public.users VALUES (59, 'user_1749374168034', 0, NULL);
INSERT INTO public.users VALUES (60, 'user_1749374644283', 0, NULL);
INSERT INTO public.users VALUES (61, 'user_1749374644282', 0, NULL);
INSERT INTO public.users VALUES (62, 'user_1749374660837', 0, NULL);
INSERT INTO public.users VALUES (63, 'user_1749374660836', 0, NULL);
INSERT INTO public.users VALUES (64, 'user_1749375917516', 0, NULL);
INSERT INTO public.users VALUES (65, 'user_1749375917515', 0, NULL);


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 113, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 65, true);


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

