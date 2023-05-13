--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2023-05-13 17:49:48

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

DROP DATABASE "Shop";
--
-- TOC entry 3384 (class 1262 OID 16568)
-- Name: Shop; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "Shop" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';


ALTER DATABASE "Shop" OWNER TO postgres;

\connect "Shop"

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
-- TOC entry 215 (class 1259 OID 16570)
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.category OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16569)
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_id_seq OWNER TO postgres;

--
-- TOC entry 3385 (class 0 OID 0)
-- Dependencies: 214
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;


--
-- TOC entry 217 (class 1259 OID 16577)
-- Name: image; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.image (
    id integer NOT NULL,
    file_name character varying(255),
    product_id integer NOT NULL
);


ALTER TABLE public.image OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16576)
-- Name: image_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.image_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.image_id_seq OWNER TO postgres;

--
-- TOC entry 3386 (class 0 OID 0)
-- Dependencies: 216
-- Name: image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.image_id_seq OWNED BY public.image.id;


--
-- TOC entry 219 (class 1259 OID 16584)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    count integer NOT NULL,
    date_time timestamp(6) without time zone,
    number character varying(255),
    price real NOT NULL,
    status smallint,
    person_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16583)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO postgres;

--
-- TOC entry 3387 (class 0 OID 0)
-- Dependencies: 218
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- TOC entry 221 (class 1259 OID 16591)
-- Name: person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.person (
    id integer NOT NULL,
    login character varying(100),
    password character varying(255),
    role character varying(255)
);


ALTER TABLE public.person OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16590)
-- Name: person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.person_id_seq OWNER TO postgres;

--
-- TOC entry 3388 (class 0 OID 0)
-- Dependencies: 220
-- Name: person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.person_id_seq OWNED BY public.person.id;


--
-- TOC entry 223 (class 1259 OID 16600)
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    id integer NOT NULL,
    date_time timestamp(6) without time zone,
    description text NOT NULL,
    price real NOT NULL,
    seller character varying(255) NOT NULL,
    title text NOT NULL,
    warehouse character varying(255) NOT NULL,
    category_id integer NOT NULL,
    CONSTRAINT product_price_check CHECK ((price >= (1)::double precision))
);


ALTER TABLE public.product OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16610)
-- Name: product_cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_cart (
    id integer NOT NULL,
    person_id integer,
    product_id integer
);


ALTER TABLE public.product_cart OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16609)
-- Name: product_cart_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_cart_id_seq OWNER TO postgres;

--
-- TOC entry 3389 (class 0 OID 0)
-- Dependencies: 224
-- Name: product_cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_cart_id_seq OWNED BY public.product_cart.id;


--
-- TOC entry 222 (class 1259 OID 16599)
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_id_seq OWNER TO postgres;

--
-- TOC entry 3390 (class 0 OID 0)
-- Dependencies: 222
-- Name: product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;


--
-- TOC entry 3198 (class 2604 OID 16573)
-- Name: category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- TOC entry 3199 (class 2604 OID 16580)
-- Name: image id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image ALTER COLUMN id SET DEFAULT nextval('public.image_id_seq'::regclass);


--
-- TOC entry 3200 (class 2604 OID 16587)
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- TOC entry 3201 (class 2604 OID 16594)
-- Name: person id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person ALTER COLUMN id SET DEFAULT nextval('public.person_id_seq'::regclass);


--
-- TOC entry 3202 (class 2604 OID 16603)
-- Name: product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);


--
-- TOC entry 3203 (class 2604 OID 16613)
-- Name: product_cart id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart ALTER COLUMN id SET DEFAULT nextval('public.product_cart_id_seq'::regclass);


--
-- TOC entry 3368 (class 0 OID 16570)
-- Dependencies: 215
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.category (id, name) VALUES (1, 'Датчик');
INSERT INTO public.category (id, name) VALUES (2, 'Привод');
INSERT INTO public.category (id, name) VALUES (3, 'ПЛК');


--
-- TOC entry 3370 (class 0 OID 16577)
-- Dependencies: 217
-- Data for Name: image; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.image (id, file_name, product_id) VALUES (1, '8a08ab22-aa93-4c1f-a381-cf768cae98d3.1.jpg', 1);
INSERT INTO public.image (id, file_name, product_id) VALUES (2, '6f752fa7-fb4e-46bb-8891-94cb9b7699d3.2.jpg', 1);
INSERT INTO public.image (id, file_name, product_id) VALUES (3, 'c7b0019f-706e-415a-b99a-5fdc3aa5c2cf.1.webp', 2);
INSERT INTO public.image (id, file_name, product_id) VALUES (4, 'd3b11648-4a86-48f5-acf6-c1b0735004e1.2.jpg', 2);
INSERT INTO public.image (id, file_name, product_id) VALUES (5, '9a35a77c-8afe-4f80-b6e0-4f190c46fb1b.1.jpg', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (6, '25ad9430-1536-4f66-bb7e-80415c5c3695.2.jpg', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (7, '6b7b072d-ffa1-4a9b-b844-abf8e6a1a23c.1.jpg', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (8, '60b3429b-1cfc-4960-97ea-566e3010d1a1.2.jpg', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (9, 'd053c6a4-8a14-4b83-a776-987cc761402d.1.jpg', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (10, '4321dac0-fc50-46a2-a3d0-a4874f6d710d.2.png', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (11, '55bd0545-8239-4d2b-a368-5814195a6aac.1.webp', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (12, 'e2598435-8387-4441-8d26-80ce5d772df6.2.webp', 6);


--
-- TOC entry 3372 (class 0 OID 16584)
-- Dependencies: 219
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (1, 1, '2023-05-13 17:48:14.980623', 'ee388a38-a441-4656-b523-ab7f79e4fa85', 20630, 1, 2, 1);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (2, 1, '2023-05-13 17:48:15.01976', 'ee388a38-a441-4656-b523-ab7f79e4fa85', 12806, 1, 2, 4);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (3, 1, '2023-05-13 17:48:43.164006', '2e4a52ba-5682-4272-bf94-e79a9fa617a6', 15250, 1, 3, 2);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (4, 1, '2023-05-13 17:48:43.176633', '2e4a52ba-5682-4272-bf94-e79a9fa617a6', 23587, 1, 3, 5);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (5, 1, '2023-05-13 17:49:05.589123', '54300428-28bd-44d6-bfff-6512cb1c997e', 15879, 1, 4, 3);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (6, 1, '2023-05-13 17:49:05.593778', '54300428-28bd-44d6-bfff-6512cb1c997e', 53069, 1, 4, 6);


--
-- TOC entry 3374 (class 0 OID 16591)
-- Dependencies: 221
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.person (id, login, password, role) VALUES (2, 'user1', '$2a$10$jYtDS8VH2tzPbCw216wGBeOX44PhMYTIUkOqYa/9WmIyEQR9SsCT2', 'ROLE_USER');
INSERT INTO public.person (id, login, password, role) VALUES (3, 'user2', '$2a$10$4kzuGbpjIa6mf5EL2YU7k.nO8pRq6Y6op2PlR5Kx2BVXdBnB2ZcKC', 'ROLE_USER');
INSERT INTO public.person (id, login, password, role) VALUES (4, 'user3', '$2a$10$NuIvxHXcxZ/5SUEkBtvb7OnyrkDx.mnwmKQsnmT.sL7MR35ZguHCi', 'ROLE_USER');
INSERT INTO public.person (id, login, password, role) VALUES (1, 'admin', '$2a$10$1lL0VWRgUvUC1eurt/7/Gec5YJF0mblRbyGHyYpytMGbiNmSFD4ZG', 'ROLE_ADMIN');


--
-- TOC entry 3376 (class 0 OID 16600)
-- Dependencies: 223
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (1, NULL, 'Артикул	060G1874
Код	119687
Производитель	Danfoss
Страна	Дания
Гарантия, лет	1
Вес, кг	0,2
Присоединение	G ½ дюймы
Диапазон измерений	0–6 бар
Напряжение питания	пост. ток - 9–32
Выходной сигнал	4–20 мА
Рабочая температура, °C	-40 ... +125 °С
Присоединение	Резьбовое
Макс. измеряемое давл., бар	6
Резьба	Наружная', 20630, 'https://tdkomfort.ru/', 'Danfoss MBS 3200 датчик давления', 'KZN', 1);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (2, '2023-05-13 17:21:11.941841', 'Модель AME 445
Страна производства Дания
Тип AME
Напряжение питания, В 24
Ход штока, мм 20
Приводное усилие, Н 400
Макс. рабочая температура, °C 130
Мин. рабочая температура, °C 0
Наличие возвратной пружины нет', 15250, 'https://termopartner.ru/', 'Danfoss AME 445 Электропривод', 'KZN', 2);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (3, '2023-05-13 17:24:38.270284', 'Напряжение питания	~/=24В
Цифровые входы	8 шт.
Релейные выходы	6 шт. (до 5А 220В)
Аналоговые выходы	2 шт. (0-10В)
Аналоговые входы	4 шт.
Интерфейс связи	НЕТ RS485', 15879, 'https://ventavtomatika.ru/', 'Danfoss UNIVERSE 6 (MCX06D) контроллер', 'KZN', 3);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (4, '2023-05-13 17:28:49.351189', '
Назначение	Температура воздуха
Рабочая температура, C°	0...+50
Класс защиты IP	IP30
Выходной сигнал	#N/A
Артикул производителя	QAA2012N
Датчики	Накладной
', 12806, 'https://siemens-rf.ru/', 'Siemens QAA2012N датчик температуры', 'KZN', 1);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (5, '2023-05-13 17:32:04.531992', 'Усилие 7 Н*м
Площадь заслонки 1,5 кв.м.
Напряжения питания 230 В
Наличие пружинного возврата есть
Наличие концевых выключателей нет
Управляющий сигнал 2P', 23587, 'https://pulseelectro.ru/', 'Siemens GMA321.1E привод воздушной заслонки', 'KZN', 2);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (6, '2023-05-13 17:35:34.237483', 'Артикул: 6ES72111BE400XB0
Производитель: SIEMENS
Серия: Simatic S7-1200
EAN код: 4047623402695
Код заказа: 6ES7211-1BE40-0XB0
Страна производства: Китай
Тип изделия: Контроллер CPU 1211C
Напряжение питания: 115/230В АС
Конфигурация: AC/DC/RLY
Актуальная серия: Да
Единицы измерения: шт
Вес: 0.38кг', 53069, 'https://electroguru.ru/', 'Siemens Simatic S7-1200 CPU 1211C контроллер', 'KZN', 3);


--
-- TOC entry 3378 (class 0 OID 16610)
-- Dependencies: 225
-- Data for Name: product_cart; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3391 (class 0 OID 0)
-- Dependencies: 214
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 1, false);


--
-- TOC entry 3392 (class 0 OID 0)
-- Dependencies: 216
-- Name: image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.image_id_seq', 12, true);


--
-- TOC entry 3393 (class 0 OID 0)
-- Dependencies: 218
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 6, true);


--
-- TOC entry 3394 (class 0 OID 0)
-- Dependencies: 220
-- Name: person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.person_id_seq', 4, true);


--
-- TOC entry 3395 (class 0 OID 0)
-- Dependencies: 224
-- Name: product_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_cart_id_seq', 8, true);


--
-- TOC entry 3396 (class 0 OID 0)
-- Dependencies: 222
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_id_seq', 6, true);


--
-- TOC entry 3206 (class 2606 OID 16575)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- TOC entry 3208 (class 2606 OID 16582)
-- Name: image image_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (id);


--
-- TOC entry 3210 (class 2606 OID 16589)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 3212 (class 2606 OID 16598)
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- TOC entry 3218 (class 2606 OID 16615)
-- Name: product_cart product_cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT product_cart_pkey PRIMARY KEY (id);


--
-- TOC entry 3214 (class 2606 OID 16608)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- TOC entry 3216 (class 2606 OID 16617)
-- Name: product uk_qka6vxqdy1dprtqnx9trdd47c; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT uk_qka6vxqdy1dprtqnx9trdd47c UNIQUE (title);


--
-- TOC entry 3220 (class 2606 OID 16623)
-- Name: orders fk1b0m4muwx1t377w9if3w6wwqn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk1b0m4muwx1t377w9if3w6wwqn FOREIGN KEY (person_id) REFERENCES public.person(id);


--
-- TOC entry 3222 (class 2606 OID 16633)
-- Name: product fk1mtsbur82frn64de7balymq9s; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT fk1mtsbur82frn64de7balymq9s FOREIGN KEY (category_id) REFERENCES public.category(id);


--
-- TOC entry 3221 (class 2606 OID 16628)
-- Name: orders fk787ibr3guwp6xobrpbofnv7le; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk787ibr3guwp6xobrpbofnv7le FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3219 (class 2606 OID 16618)
-- Name: image fkgpextbyee3uk9u6o2381m7ft1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT fkgpextbyee3uk9u6o2381m7ft1 FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3223 (class 2606 OID 16643)
-- Name: product_cart fkhpnrxdy3jhujameyod08ilvvw; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fkhpnrxdy3jhujameyod08ilvvw FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3224 (class 2606 OID 16638)
-- Name: product_cart fksgnkc1ko2i1o9yr2p63ysq3rn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fksgnkc1ko2i1o9yr2p63ysq3rn FOREIGN KEY (person_id) REFERENCES public.person(id);


-- Completed on 2023-05-13 17:49:48

--
-- PostgreSQL database dump complete
--

