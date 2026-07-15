--
-- PostgreSQL database dump
--

\restrict mk5TDUUnwtivdLYeobCdIJvcPC5BriQnOsONEADsxqiJ3qtq24jgEqBexcOHfAN

-- Dumped from database version 15.15 (Debian 15.15-1.pgdg13+1)
-- Dumped by pg_dump version 15.15 (Debian 15.15-1.pgdg13+1)

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
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

SET SESSION AUTHORIZATION DEFAULT;

ALTER TABLE public.categories DISABLE TRIGGER ALL;

COPY public.categories (id, title, slug, created_at, updated_at) FROM stdin;
1	Inicio Rápido	inicio-rapido	2026-03-26 14:01:47.313516	2026-03-26 14:01:47.313572
2	Cuenta y Seguridad	cuenta-y-seguridad	2026-03-26 14:01:47.313516	2026-03-26 14:01:47.313572
3	Facturación y Pagos	facturacion-y-pagos	2026-03-26 14:01:47.313516	2026-03-26 14:01:47.313572
4	Integraciones	integraciones	2026-03-26 14:01:47.313516	2026-03-26 14:01:47.313572
5	Solución de Problemas	solucion-de-problemas	2026-03-26 14:01:47.313516	2026-03-26 14:01:47.313572
6	Notificaciones	notificaciones	2026-03-26 14:01:47.313516	2026-03-26 14:01:47.313572
7	Configuración de Usuario	configuracion-de-usuario	2026-03-26 14:01:47.313516	2026-03-26 14:01:47.313572
8	Soporte Técnico	soporte-tecnico	2026-03-26 14:01:47.313516	2026-03-26 14:01:47.313572
9	Privacidad y Datos	privacidad-y-datos	2026-03-26 14:01:47.313516	2026-03-26 14:01:47.313572
10	Actualizaciones del Sistema	actualizaciones-del-sistema	2026-03-26 14:01:47.313516	2026-03-26 14:01:47.313572
\.


ALTER TABLE public.categories ENABLE TRIGGER ALL;

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.users DISABLE TRIGGER ALL;

COPY public.users (id, code, name, last_name, second_surname, email, avatar, status, password, phone, token_firebase, created_at, updated_at) FROM stdin;
1	1	admin	admin	admin	admin@admin.com	admin-avatar	online	$2b$12$mtR90ImnrmCsD7.H4RQdFesUtY/FlUT84t5Y9MJs6yh1H2n.MPzFa	123456789	token-firebase	2026-03-26 14:01:46.987244	2026-03-26 14:01:46.987268
2	2	client	client	client	client@client.com	client-avatar	busy	$2b$12$rvIL0.XWAwQnPMCjvt7jaem/Mar7GFTEKvfxrn2wWfzSg3nELu8zC	1234567891	token-firebase	2026-03-26 14:01:46.987244	2026-03-26 14:01:46.987268
3	1	admin	admin	admin	admin@admin.com	admin-avatar	online	$2b$12$KNaIUlNrz62U2Bzyqw6p8u9YZFZF61f/rguzwK5feT9aVeQ/cJrsu	123456789	token-firebase	2026-03-26 14:14:42.890091	2026-03-26 14:14:42.89016
4	2	client	client	client	client@client.com	client-avatar	busy	$2b$12$2OrwWRxGjjC2xaCtRzrnSumGqUMcBw268rK1D0RkAaHzFjZxCfnBW	1234567891	token-firebase	2026-03-26 14:14:42.890091	2026-03-26 14:14:42.89016
6	1	admin	admin	admin	admin@admin.com	admin-avatar	online	$2b$12$Xc62Ui.tANwHoTnflRx34.LGJCnJgooc9pTrSzyUaT/5zELypswZa	123456789	token-firebase	2026-03-26 15:24:12.08706	2026-03-26 15:24:12.087131
7	2	client	client	client	client@client.com	client-avatar	busy	$2b$12$1BtlBMKGv/CBj6d0bs6kIuMW7/CsRjo8fGcQ0NPM2.sMkofVaYdlm	1234567891	token-firebase	2026-03-26 15:24:12.08706	2026-03-26 15:24:12.087131
8	1	admin	admin	admin	admin@admin.com	admin-avatar	online	$2b$12$41okrABBtyAsEniZlp5Pne/bbnIlIPzuBgLrt9BQ4DdD1o0pLWT1u	123456789	token-firebase	2026-03-26 16:32:26.489403	2026-03-26 16:32:26.489472
9	2	client	client	client	client@client.com	client-avatar	busy	$2b$12$a9zGQMfr4rbZjGNbg7sr/ub5bC8jsUgtszQh9bvW.MpzuthXFzipq	1234567891	token-firebase	2026-03-26 16:32:26.489403	2026-03-26 16:32:26.489472
10	1	admin	admin	admin	admin@admin.com	admin-avatar	online	$2b$12$56PaghW0GUK2AGN7FAjBNONrbacWK.fBPqg2z4WWkpflZrG7ocTy6	123456789	token-firebase	2026-03-26 16:43:26.903986	2026-03-26 16:43:26.904062
11	2	client	client	client	client@client.com	client-avatar	busy	$2b$12$HzjbRch.Haepm4SlAZ5mxeOPI11XlJvVFPzRpT2NnCmBFEvn80EtG	1234567891	token-firebase	2026-03-26 16:43:26.903986	2026-03-26 16:43:26.904062
12	1	admin	admin	admin	admin@admin.com	admin-avatar	online	$2b$12$WXutocVUXlWHcieE4iZ4JejAYkbMhj65G1dPJnuCmnzybvsZYiNhm	123456789	token-firebase	2026-03-26 17:07:37.129822	2026-03-26 17:07:37.129893
13	2	client	client	client	client@client.com	client-avatar	busy	$2b$12$zqLeGYLHYXJ67jC4ninxs.HV1Ih6r7zv5wSaKAJNArRYXtLPArH4m	1234567891	token-firebase	2026-03-26 17:07:37.129822	2026-03-26 17:07:37.129893
14	2	Daleska 	Teran 	Moreira	dctm2507@gmail.com	static/avatars/Daleska__Teran__2.png	online	$2b$12$QH0wJHQqmG.WRwkDi/KNRefG9CSogVaOJPp29i2P14OSQtejVfy6m	64957120	null	2026-03-26 17:07:37.129822	2026-03-26 17:07:37.129893
15	12345	Daleska Carola	Teran 	Moreira	daleskateranmoreira@gmail.com	static/avatars/Daleska_Carola_Teran__12345.png	online	$2b$12$0GczX.OFWwgAZy4FkMmpqOk/bVto3tAXEfSRRYiEI/yXSB9eMMrWm	67576078		2026-03-26 17:07:37.129822	2026-03-26 17:07:37.129893
18	1	admin	admin	admin	admin@admin.com	admin-avatar	online	$2b$12$NdxTSA./heqI.xW4i2lvCOJhn.LVGyozoaHeF1b0N/ggPvIXbI3uy	123456789	token-firebase	2026-03-26 19:34:53.222716	2026-03-26 19:34:53.222802
19	2	client	client	client	client@client.com	client-avatar	busy	$2b$12$T9wZdhBW4xznxuCSfu4lluA6iVpkrapcx196lZ9xemM3zv3pnOK4i	1234567891	token-firebase	2026-03-26 19:34:53.222716	2026-03-26 19:34:53.222802
20	CODPERA30C7D	Pedro 	Perez		perez@gmail.com	\N	online	$2b$12$tqTMTINtawuSeD8pm5t7VufIv4k9WyJlX7l3qxT.AnpYQDf8sS08C	67579866		2026-03-26 19:34:53.222716	2026-03-26 19:34:53.222802
21	1	admin	admin	admin	admin@admin.com	admin-avatar	online	$2b$12$c9ODYMWoXAkDnKzB71POfuVPCRFnrDo7RlXdIyuD9eWWahoxyHDyu	123456789	token-firebase	2026-03-27 22:03:50.658426	2026-03-27 22:03:50.658501
22	2	client	client	client	client@client.com	client-avatar	busy	$2b$12$1TYxzJcL/MZsCPsPSo1TZ.ZmcaMolgNKveU0wPIk.lQH/56MLUm8G	1234567891	token-firebase	2026-03-27 22:03:50.658426	2026-03-27 22:03:50.658501
23	1	admin	admin	admin	admin@admin.com	admin-avatar	online	$2b$12$SrnCkJhAPamUxo0RZM5QxeRSJ6w0RBrRVDP9QkZrOY/HAH7OLla.q	123456789	token-firebase	2026-03-29 18:44:35.731102	2026-03-29 18:44:35.731191
24	2	client	client	client	client@client.com	client-avatar	busy	$2b$12$oHZD6hc7wwHeoQgGGbMwWuTD8qQ1yffq7vhOv6SV3qa5R/dM51P6O	1234567891	token-firebase	2026-03-29 18:44:35.731102	2026-03-29 18:44:35.731191
26	CODPER4F3069	Fanor	Teran		fanort@gmail.com	\N	online	$2b$12$HCBVQ4/NH/BrivegLvWOoOmEsjlozGmqk0QbUdo71meOVILrp4USG	64886789		2026-03-29 18:44:35.731102	2026-03-29 18:44:35.731191
27	CODPER9EBFB8	Patty	Moreira	 	patty@gmail.com	static/avatars/Patty_Moreira_CODPER9EBFB8.png	online	$2b$12$r4r9HHQuxfup4hVAmZqtKueq8rLrgNVKo57NCkgkznbASrDF67iJC	67576078		2026-03-29 18:44:35.731102	2026-03-29 18:44:35.731191
28	CODPER3B7DA3	Daleska	Teran	Moreira	dctm2507@gmail.com	static/avatars/Daleska_Teran_CODPER3B7DA3.png	online	$2b$12$c6q0mKQVf8LxDtIHGy.HyusHPJ2bwUwOzKMtWLgZB8vInOl.va7Rm	64957120		2026-06-16 12:15:07.421102	2026-06-16 12:15:07.421127
29	CODPERA17DF3	Carola	Moreira		daleskateranmoreira@gmail.com	\N	online	$2b$12$3QW8tLm5dG3TpK2Q6LcCPumCDVqFRHJu1p9Wg.V1m5rsOVkqN2/ki	64957120		2026-06-16 12:15:07.421102	2026-06-16 12:15:07.421127
\.


ALTER TABLE public.users ENABLE TRIGGER ALL;

--
-- Data for Name: contact_support; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.contact_support DISABLE TRIGGER ALL;

COPY public.contact_support (id, name, email, title, message, phone, created_at, updated_at, user_id) FROM stdin;
\.


ALTER TABLE public.contact_support ENABLE TRIGGER ALL;

--
-- Data for Name: devices; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.devices DISABLE TRIGGER ALL;

COPY public.devices (id, code, name, password, status, created_at, updated_at, user_id) FROM stdin;
\.


ALTER TABLE public.devices ENABLE TRIGGER ALL;

--
-- Data for Name: devices_registration; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.devices_registration DISABLE TRIGGER ALL;

COPY public.devices_registration (id, location, wifi, device_id, created_at, updated_at) FROM stdin;
\.


ALTER TABLE public.devices_registration ENABLE TRIGGER ALL;

--
-- Data for Name: emergency_alerts; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.emergency_alerts DISABLE TRIGGER ALL;

COPY public.emergency_alerts (id, user_id, latitude, longitude, description, device_name, status, created_at, updated_at) FROM stdin;
\.


ALTER TABLE public.emergency_alerts ENABLE TRIGGER ALL;

--
-- Data for Name: emergency_contacts; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.emergency_contacts DISABLE TRIGGER ALL;

COPY public.emergency_contacts (id, user_id, name, line, phone, created_at, updated_at) FROM stdin;
\.


ALTER TABLE public.emergency_contacts ENABLE TRIGGER ALL;

--
-- Data for Name: faqs; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.faqs DISABLE TRIGGER ALL;

COPY public.faqs (id, question, answer, created_at, updated_at, user_id, category_id) FROM stdin;
1	¿Cómo empiezo a usar la plataforma?	Puedes comenzar registrándote con tu correo electrónico y siguiendo el asistente de configuración inicial.	2026-03-26 14:01:47.333846	2026-03-26 14:01:47.333886	\N	1
2	¿Necesito instalar algo para empezar?	No, nuestra plataforma es 100% web. Solo necesitas un navegador actualizado.	2026-03-26 14:01:47.333846	2026-03-26 14:01:47.333886	\N	1
3	¿Cómo cambio mi contraseña?	Ve a Configuración > Seguridad y selecciona 'Cambiar contraseña'.	2026-03-26 14:01:47.333846	2026-03-26 14:01:47.333886	\N	2
4	¿Qué hago si olvidé mi contraseña?	Haz clic en '¿Olvidaste tu contraseña?' en la página de inicio de sesión y sigue las instrucciones.	2026-03-26 14:01:47.333846	2026-03-26 14:01:47.333886	\N	2
5	¿Qué métodos de pago aceptan?	Aceptamos tarjetas de crédito, débito y pagos mediante PayPal.	2026-03-26 14:01:47.333846	2026-03-26 14:01:47.333886	\N	3
6	¿Dónde puedo ver mis facturas?	Accede a tu cuenta y ve a la sección de Facturación para ver y descargar tus facturas.	2026-03-26 14:01:47.333846	2026-03-26 14:01:47.333886	\N	3
7	¿Cómo conecto mi cuenta con WhatsApp?	Dirígete a Integraciones y selecciona WhatsApp. Sigue las instrucciones para escanear el código QR con tu app de WhatsApp.	2026-03-26 14:01:47.333846	2026-03-26 14:01:47.333886	\N	4
8	La aplicación no carga, ¿qué hago?	Verifica tu conexión a internet. Si el problema persiste, limpia la caché o contacta a soporte.	2026-03-26 14:01:47.333846	2026-03-26 14:01:47.333886	\N	5
9	¿Puedo desactivar las notificaciones por correo?	Sí, en Configuración > Notificaciones puedes activar o desactivar las notificaciones por correo electrónico.	2026-03-26 14:01:47.333846	2026-03-26 14:01:47.333886	\N	6
10	¿Puedo cambiar mi nombre de usuario?	Sí, desde Configuración > Perfil puedes editar tu nombre de usuario.	2026-03-26 14:01:47.333846	2026-03-26 14:01:47.333886	\N	7
11	¿Cómo empiezo a usar la plataforma?	Puedes comenzar registrándote con tu correo electrónico y siguiendo el asistente de configuración inicial.	2026-03-26 14:14:43.64958	2026-03-26 14:14:43.649708	\N	1
12	¿Necesito instalar algo para empezar?	No, nuestra plataforma es 100% web. Solo necesitas un navegador actualizado.	2026-03-26 14:14:43.64958	2026-03-26 14:14:43.649708	\N	1
13	¿Cómo cambio mi contraseña?	Ve a Configuración > Seguridad y selecciona 'Cambiar contraseña'.	2026-03-26 14:14:43.64958	2026-03-26 14:14:43.649708	\N	2
14	¿Qué hago si olvidé mi contraseña?	Haz clic en '¿Olvidaste tu contraseña?' en la página de inicio de sesión y sigue las instrucciones.	2026-03-26 14:14:43.64958	2026-03-26 14:14:43.649708	\N	2
15	¿Qué métodos de pago aceptan?	Aceptamos tarjetas de crédito, débito y pagos mediante PayPal.	2026-03-26 14:14:43.64958	2026-03-26 14:14:43.649708	\N	3
16	¿Dónde puedo ver mis facturas?	Accede a tu cuenta y ve a la sección de Facturación para ver y descargar tus facturas.	2026-03-26 14:14:43.64958	2026-03-26 14:14:43.649708	\N	3
17	¿Cómo conecto mi cuenta con WhatsApp?	Dirígete a Integraciones y selecciona WhatsApp. Sigue las instrucciones para escanear el código QR con tu app de WhatsApp.	2026-03-26 14:14:43.64958	2026-03-26 14:14:43.649708	\N	4
18	La aplicación no carga, ¿qué hago?	Verifica tu conexión a internet. Si el problema persiste, limpia la caché o contacta a soporte.	2026-03-26 14:14:43.64958	2026-03-26 14:14:43.649708	\N	5
19	¿Puedo desactivar las notificaciones por correo?	Sí, en Configuración > Notificaciones puedes activar o desactivar las notificaciones por correo electrónico.	2026-03-26 14:14:43.64958	2026-03-26 14:14:43.649708	\N	6
20	¿Puedo cambiar mi nombre de usuario?	Sí, desde Configuración > Perfil puedes editar tu nombre de usuario.	2026-03-26 14:14:43.64958	2026-03-26 14:14:43.649708	\N	7
21	¿Cómo empiezo a usar la plataforma?	Puedes comenzar registrándote con tu correo electrónico y siguiendo el asistente de configuración inicial.	2026-03-26 15:24:13.031969	2026-03-26 15:24:13.032118	\N	1
22	¿Necesito instalar algo para empezar?	No, nuestra plataforma es 100% web. Solo necesitas un navegador actualizado.	2026-03-26 15:24:13.031969	2026-03-26 15:24:13.032118	\N	1
23	¿Cómo cambio mi contraseña?	Ve a Configuración > Seguridad y selecciona 'Cambiar contraseña'.	2026-03-26 15:24:13.031969	2026-03-26 15:24:13.032118	\N	2
24	¿Qué hago si olvidé mi contraseña?	Haz clic en '¿Olvidaste tu contraseña?' en la página de inicio de sesión y sigue las instrucciones.	2026-03-26 15:24:13.031969	2026-03-26 15:24:13.032118	\N	2
25	¿Qué métodos de pago aceptan?	Aceptamos tarjetas de crédito, débito y pagos mediante PayPal.	2026-03-26 15:24:13.031969	2026-03-26 15:24:13.032118	\N	3
26	¿Dónde puedo ver mis facturas?	Accede a tu cuenta y ve a la sección de Facturación para ver y descargar tus facturas.	2026-03-26 15:24:13.031969	2026-03-26 15:24:13.032118	\N	3
27	¿Cómo conecto mi cuenta con WhatsApp?	Dirígete a Integraciones y selecciona WhatsApp. Sigue las instrucciones para escanear el código QR con tu app de WhatsApp.	2026-03-26 15:24:13.031969	2026-03-26 15:24:13.032118	\N	4
28	La aplicación no carga, ¿qué hago?	Verifica tu conexión a internet. Si el problema persiste, limpia la caché o contacta a soporte.	2026-03-26 15:24:13.031969	2026-03-26 15:24:13.032118	\N	5
29	¿Puedo desactivar las notificaciones por correo?	Sí, en Configuración > Notificaciones puedes activar o desactivar las notificaciones por correo electrónico.	2026-03-26 15:24:13.031969	2026-03-26 15:24:13.032118	\N	6
30	¿Puedo cambiar mi nombre de usuario?	Sí, desde Configuración > Perfil puedes editar tu nombre de usuario.	2026-03-26 15:24:13.031969	2026-03-26 15:24:13.032118	\N	7
31	¿Cómo empiezo a usar la plataforma?	Puedes comenzar registrándote con tu correo electrónico y siguiendo el asistente de configuración inicial.	2026-03-26 16:32:26.963637	2026-03-26 16:32:26.963728	\N	1
32	¿Necesito instalar algo para empezar?	No, nuestra plataforma es 100% web. Solo necesitas un navegador actualizado.	2026-03-26 16:32:26.963637	2026-03-26 16:32:26.963728	\N	1
33	¿Cómo cambio mi contraseña?	Ve a Configuración > Seguridad y selecciona 'Cambiar contraseña'.	2026-03-26 16:32:26.963637	2026-03-26 16:32:26.963728	\N	2
34	¿Qué hago si olvidé mi contraseña?	Haz clic en '¿Olvidaste tu contraseña?' en la página de inicio de sesión y sigue las instrucciones.	2026-03-26 16:32:26.963637	2026-03-26 16:32:26.963728	\N	2
35	¿Qué métodos de pago aceptan?	Aceptamos tarjetas de crédito, débito y pagos mediante PayPal.	2026-03-26 16:32:26.963637	2026-03-26 16:32:26.963728	\N	3
36	¿Dónde puedo ver mis facturas?	Accede a tu cuenta y ve a la sección de Facturación para ver y descargar tus facturas.	2026-03-26 16:32:26.963637	2026-03-26 16:32:26.963728	\N	3
37	¿Cómo conecto mi cuenta con WhatsApp?	Dirígete a Integraciones y selecciona WhatsApp. Sigue las instrucciones para escanear el código QR con tu app de WhatsApp.	2026-03-26 16:32:26.963637	2026-03-26 16:32:26.963728	\N	4
38	La aplicación no carga, ¿qué hago?	Verifica tu conexión a internet. Si el problema persiste, limpia la caché o contacta a soporte.	2026-03-26 16:32:26.963637	2026-03-26 16:32:26.963728	\N	5
39	¿Puedo desactivar las notificaciones por correo?	Sí, en Configuración > Notificaciones puedes activar o desactivar las notificaciones por correo electrónico.	2026-03-26 16:32:26.963637	2026-03-26 16:32:26.963728	\N	6
40	¿Puedo cambiar mi nombre de usuario?	Sí, desde Configuración > Perfil puedes editar tu nombre de usuario.	2026-03-26 16:32:26.963637	2026-03-26 16:32:26.963728	\N	7
41	¿Cómo empiezo a usar la plataforma?	Puedes comenzar registrándote con tu correo electrónico y siguiendo el asistente de configuración inicial.	2026-03-26 16:43:27.673801	2026-03-26 16:43:27.673906	\N	1
42	¿Necesito instalar algo para empezar?	No, nuestra plataforma es 100% web. Solo necesitas un navegador actualizado.	2026-03-26 16:43:27.673801	2026-03-26 16:43:27.673906	\N	1
43	¿Cómo cambio mi contraseña?	Ve a Configuración > Seguridad y selecciona 'Cambiar contraseña'.	2026-03-26 16:43:27.673801	2026-03-26 16:43:27.673906	\N	2
44	¿Qué hago si olvidé mi contraseña?	Haz clic en '¿Olvidaste tu contraseña?' en la página de inicio de sesión y sigue las instrucciones.	2026-03-26 16:43:27.673801	2026-03-26 16:43:27.673906	\N	2
45	¿Qué métodos de pago aceptan?	Aceptamos tarjetas de crédito, débito y pagos mediante PayPal.	2026-03-26 16:43:27.673801	2026-03-26 16:43:27.673906	\N	3
46	¿Dónde puedo ver mis facturas?	Accede a tu cuenta y ve a la sección de Facturación para ver y descargar tus facturas.	2026-03-26 16:43:27.673801	2026-03-26 16:43:27.673906	\N	3
47	¿Cómo conecto mi cuenta con WhatsApp?	Dirígete a Integraciones y selecciona WhatsApp. Sigue las instrucciones para escanear el código QR con tu app de WhatsApp.	2026-03-26 16:43:27.673801	2026-03-26 16:43:27.673906	\N	4
48	La aplicación no carga, ¿qué hago?	Verifica tu conexión a internet. Si el problema persiste, limpia la caché o contacta a soporte.	2026-03-26 16:43:27.673801	2026-03-26 16:43:27.673906	\N	5
49	¿Puedo desactivar las notificaciones por correo?	Sí, en Configuración > Notificaciones puedes activar o desactivar las notificaciones por correo electrónico.	2026-03-26 16:43:27.673801	2026-03-26 16:43:27.673906	\N	6
50	¿Puedo cambiar mi nombre de usuario?	Sí, desde Configuración > Perfil puedes editar tu nombre de usuario.	2026-03-26 16:43:27.673801	2026-03-26 16:43:27.673906	\N	7
51	¿Cómo empiezo a usar la plataforma?	Puedes comenzar registrándote con tu correo electrónico y siguiendo el asistente de configuración inicial.	2026-03-26 17:07:38.086661	2026-03-26 17:07:38.08676	\N	1
52	¿Necesito instalar algo para empezar?	No, nuestra plataforma es 100% web. Solo necesitas un navegador actualizado.	2026-03-26 17:07:38.086661	2026-03-26 17:07:38.08676	\N	1
53	¿Cómo cambio mi contraseña?	Ve a Configuración > Seguridad y selecciona 'Cambiar contraseña'.	2026-03-26 17:07:38.086661	2026-03-26 17:07:38.08676	\N	2
54	¿Qué hago si olvidé mi contraseña?	Haz clic en '¿Olvidaste tu contraseña?' en la página de inicio de sesión y sigue las instrucciones.	2026-03-26 17:07:38.086661	2026-03-26 17:07:38.08676	\N	2
55	¿Qué métodos de pago aceptan?	Aceptamos tarjetas de crédito, débito y pagos mediante PayPal.	2026-03-26 17:07:38.086661	2026-03-26 17:07:38.08676	\N	3
56	¿Dónde puedo ver mis facturas?	Accede a tu cuenta y ve a la sección de Facturación para ver y descargar tus facturas.	2026-03-26 17:07:38.086661	2026-03-26 17:07:38.08676	\N	3
57	¿Cómo conecto mi cuenta con WhatsApp?	Dirígete a Integraciones y selecciona WhatsApp. Sigue las instrucciones para escanear el código QR con tu app de WhatsApp.	2026-03-26 17:07:38.086661	2026-03-26 17:07:38.08676	\N	4
58	La aplicación no carga, ¿qué hago?	Verifica tu conexión a internet. Si el problema persiste, limpia la caché o contacta a soporte.	2026-03-26 17:07:38.086661	2026-03-26 17:07:38.08676	\N	5
59	¿Puedo desactivar las notificaciones por correo?	Sí, en Configuración > Notificaciones puedes activar o desactivar las notificaciones por correo electrónico.	2026-03-26 17:07:38.086661	2026-03-26 17:07:38.08676	\N	6
60	¿Puedo cambiar mi nombre de usuario?	Sí, desde Configuración > Perfil puedes editar tu nombre de usuario.	2026-03-26 17:07:38.086661	2026-03-26 17:07:38.08676	\N	7
61	¿Cómo empiezo a usar la plataforma?	Puedes comenzar registrándote con tu correo electrónico y siguiendo el asistente de configuración inicial.	2026-03-26 19:20:50.672753	2026-03-26 19:20:50.672848	\N	1
62	¿Necesito instalar algo para empezar?	No, nuestra plataforma es 100% web. Solo necesitas un navegador actualizado.	2026-03-26 19:20:50.672753	2026-03-26 19:20:50.672848	\N	1
63	¿Cómo cambio mi contraseña?	Ve a Configuración > Seguridad y selecciona 'Cambiar contraseña'.	2026-03-26 19:20:50.672753	2026-03-26 19:20:50.672848	\N	2
64	¿Qué hago si olvidé mi contraseña?	Haz clic en '¿Olvidaste tu contraseña?' en la página de inicio de sesión y sigue las instrucciones.	2026-03-26 19:20:50.672753	2026-03-26 19:20:50.672848	\N	2
65	¿Qué métodos de pago aceptan?	Aceptamos tarjetas de crédito, débito y pagos mediante PayPal.	2026-03-26 19:20:50.672753	2026-03-26 19:20:50.672848	\N	3
66	¿Dónde puedo ver mis facturas?	Accede a tu cuenta y ve a la sección de Facturación para ver y descargar tus facturas.	2026-03-26 19:20:50.672753	2026-03-26 19:20:50.672848	\N	3
67	¿Cómo conecto mi cuenta con WhatsApp?	Dirígete a Integraciones y selecciona WhatsApp. Sigue las instrucciones para escanear el código QR con tu app de WhatsApp.	2026-03-26 19:20:50.672753	2026-03-26 19:20:50.672848	\N	4
68	La aplicación no carga, ¿qué hago?	Verifica tu conexión a internet. Si el problema persiste, limpia la caché o contacta a soporte.	2026-03-26 19:20:50.672753	2026-03-26 19:20:50.672848	\N	5
69	¿Puedo desactivar las notificaciones por correo?	Sí, en Configuración > Notificaciones puedes activar o desactivar las notificaciones por correo electrónico.	2026-03-26 19:20:50.672753	2026-03-26 19:20:50.672848	\N	6
70	¿Puedo cambiar mi nombre de usuario?	Sí, desde Configuración > Perfil puedes editar tu nombre de usuario.	2026-03-26 19:20:50.672753	2026-03-26 19:20:50.672848	\N	7
71	¿Cómo empiezo a usar la plataforma?	Puedes comenzar registrándote con tu correo electrónico y siguiendo el asistente de configuración inicial.	2026-03-26 19:34:53.926346	2026-03-26 19:34:53.926597	\N	1
72	¿Necesito instalar algo para empezar?	No, nuestra plataforma es 100% web. Solo necesitas un navegador actualizado.	2026-03-26 19:34:53.926346	2026-03-26 19:34:53.926597	\N	1
73	¿Cómo cambio mi contraseña?	Ve a Configuración > Seguridad y selecciona 'Cambiar contraseña'.	2026-03-26 19:34:53.926346	2026-03-26 19:34:53.926597	\N	2
74	¿Qué hago si olvidé mi contraseña?	Haz clic en '¿Olvidaste tu contraseña?' en la página de inicio de sesión y sigue las instrucciones.	2026-03-26 19:34:53.926346	2026-03-26 19:34:53.926597	\N	2
75	¿Qué métodos de pago aceptan?	Aceptamos tarjetas de crédito, débito y pagos mediante PayPal.	2026-03-26 19:34:53.926346	2026-03-26 19:34:53.926597	\N	3
76	¿Dónde puedo ver mis facturas?	Accede a tu cuenta y ve a la sección de Facturación para ver y descargar tus facturas.	2026-03-26 19:34:53.926346	2026-03-26 19:34:53.926597	\N	3
77	¿Cómo conecto mi cuenta con WhatsApp?	Dirígete a Integraciones y selecciona WhatsApp. Sigue las instrucciones para escanear el código QR con tu app de WhatsApp.	2026-03-26 19:34:53.926346	2026-03-26 19:34:53.926597	\N	4
78	La aplicación no carga, ¿qué hago?	Verifica tu conexión a internet. Si el problema persiste, limpia la caché o contacta a soporte.	2026-03-26 19:34:53.926346	2026-03-26 19:34:53.926597	\N	5
79	¿Puedo desactivar las notificaciones por correo?	Sí, en Configuración > Notificaciones puedes activar o desactivar las notificaciones por correo electrónico.	2026-03-26 19:34:53.926346	2026-03-26 19:34:53.926597	\N	6
80	¿Puedo cambiar mi nombre de usuario?	Sí, desde Configuración > Perfil puedes editar tu nombre de usuario.	2026-03-26 19:34:53.926346	2026-03-26 19:34:53.926597	\N	7
81	¿Cómo empiezo a usar la plataforma?	Puedes comenzar registrándote con tu correo electrónico y siguiendo el asistente de configuración inicial.	2026-03-27 22:03:48.823606	2026-03-27 22:03:48.823742	\N	1
82	¿Necesito instalar algo para empezar?	No, nuestra plataforma es 100% web. Solo necesitas un navegador actualizado.	2026-03-27 22:03:48.823606	2026-03-27 22:03:48.823742	\N	1
83	¿Cómo cambio mi contraseña?	Ve a Configuración > Seguridad y selecciona 'Cambiar contraseña'.	2026-03-27 22:03:48.823606	2026-03-27 22:03:48.823742	\N	2
84	¿Qué hago si olvidé mi contraseña?	Haz clic en '¿Olvidaste tu contraseña?' en la página de inicio de sesión y sigue las instrucciones.	2026-03-27 22:03:48.823606	2026-03-27 22:03:48.823742	\N	2
85	¿Qué métodos de pago aceptan?	Aceptamos tarjetas de crédito, débito y pagos mediante PayPal.	2026-03-27 22:03:48.823606	2026-03-27 22:03:48.823742	\N	3
86	¿Dónde puedo ver mis facturas?	Accede a tu cuenta y ve a la sección de Facturación para ver y descargar tus facturas.	2026-03-27 22:03:48.823606	2026-03-27 22:03:48.823742	\N	3
87	¿Cómo conecto mi cuenta con WhatsApp?	Dirígete a Integraciones y selecciona WhatsApp. Sigue las instrucciones para escanear el código QR con tu app de WhatsApp.	2026-03-27 22:03:48.823606	2026-03-27 22:03:48.823742	\N	4
88	La aplicación no carga, ¿qué hago?	Verifica tu conexión a internet. Si el problema persiste, limpia la caché o contacta a soporte.	2026-03-27 22:03:48.823606	2026-03-27 22:03:48.823742	\N	5
89	¿Puedo desactivar las notificaciones por correo?	Sí, en Configuración > Notificaciones puedes activar o desactivar las notificaciones por correo electrónico.	2026-03-27 22:03:48.823606	2026-03-27 22:03:48.823742	\N	6
90	¿Puedo cambiar mi nombre de usuario?	Sí, desde Configuración > Perfil puedes editar tu nombre de usuario.	2026-03-27 22:03:48.823606	2026-03-27 22:03:48.823742	\N	7
91	¿Cómo empiezo a usar la plataforma?	Puedes comenzar registrándote con tu correo electrónico y siguiendo el asistente de configuración inicial.	2026-03-29 18:44:36.810163	2026-03-29 18:44:36.810271	\N	1
92	¿Necesito instalar algo para empezar?	No, nuestra plataforma es 100% web. Solo necesitas un navegador actualizado.	2026-03-29 18:44:36.810163	2026-03-29 18:44:36.810271	\N	1
93	¿Cómo cambio mi contraseña?	Ve a Configuración > Seguridad y selecciona 'Cambiar contraseña'.	2026-03-29 18:44:36.810163	2026-03-29 18:44:36.810271	\N	2
94	¿Qué hago si olvidé mi contraseña?	Haz clic en '¿Olvidaste tu contraseña?' en la página de inicio de sesión y sigue las instrucciones.	2026-03-29 18:44:36.810163	2026-03-29 18:44:36.810271	\N	2
95	¿Qué métodos de pago aceptan?	Aceptamos tarjetas de crédito, débito y pagos mediante PayPal.	2026-03-29 18:44:36.810163	2026-03-29 18:44:36.810271	\N	3
96	¿Dónde puedo ver mis facturas?	Accede a tu cuenta y ve a la sección de Facturación para ver y descargar tus facturas.	2026-03-29 18:44:36.810163	2026-03-29 18:44:36.810271	\N	3
97	¿Cómo conecto mi cuenta con WhatsApp?	Dirígete a Integraciones y selecciona WhatsApp. Sigue las instrucciones para escanear el código QR con tu app de WhatsApp.	2026-03-29 18:44:36.810163	2026-03-29 18:44:36.810271	\N	4
98	La aplicación no carga, ¿qué hago?	Verifica tu conexión a internet. Si el problema persiste, limpia la caché o contacta a soporte.	2026-03-29 18:44:36.810163	2026-03-29 18:44:36.810271	\N	5
99	¿Puedo desactivar las notificaciones por correo?	Sí, en Configuración > Notificaciones puedes activar o desactivar las notificaciones por correo electrónico.	2026-03-29 18:44:36.810163	2026-03-29 18:44:36.810271	\N	6
100	¿Puedo cambiar mi nombre de usuario?	Sí, desde Configuración > Perfil puedes editar tu nombre de usuario.	2026-03-29 18:44:36.810163	2026-03-29 18:44:36.810271	\N	7
101	¿Cómo empiezo a usar la plataforma?	Puedes comenzar registrándote con tu correo electrónico y siguiendo el asistente de configuración inicial.	2026-03-30 07:34:25.171212	2026-03-30 07:34:25.171316	\N	1
102	¿Necesito instalar algo para empezar?	No, nuestra plataforma es 100% web. Solo necesitas un navegador actualizado.	2026-03-30 07:34:25.171212	2026-03-30 07:34:25.171316	\N	1
103	¿Cómo cambio mi contraseña?	Ve a Configuración > Seguridad y selecciona 'Cambiar contraseña'.	2026-03-30 07:34:25.171212	2026-03-30 07:34:25.171316	\N	2
104	¿Qué hago si olvidé mi contraseña?	Haz clic en '¿Olvidaste tu contraseña?' en la página de inicio de sesión y sigue las instrucciones.	2026-03-30 07:34:25.171212	2026-03-30 07:34:25.171316	\N	2
105	¿Qué métodos de pago aceptan?	Aceptamos tarjetas de crédito, débito y pagos mediante PayPal.	2026-03-30 07:34:25.171212	2026-03-30 07:34:25.171316	\N	3
106	¿Dónde puedo ver mis facturas?	Accede a tu cuenta y ve a la sección de Facturación para ver y descargar tus facturas.	2026-03-30 07:34:25.171212	2026-03-30 07:34:25.171316	\N	3
107	¿Cómo conecto mi cuenta con WhatsApp?	Dirígete a Integraciones y selecciona WhatsApp. Sigue las instrucciones para escanear el código QR con tu app de WhatsApp.	2026-03-30 07:34:25.171212	2026-03-30 07:34:25.171316	\N	4
108	La aplicación no carga, ¿qué hago?	Verifica tu conexión a internet. Si el problema persiste, limpia la caché o contacta a soporte.	2026-03-30 07:34:25.171212	2026-03-30 07:34:25.171316	\N	5
109	¿Puedo desactivar las notificaciones por correo?	Sí, en Configuración > Notificaciones puedes activar o desactivar las notificaciones por correo electrónico.	2026-03-30 07:34:25.171212	2026-03-30 07:34:25.171316	\N	6
110	¿Puedo cambiar mi nombre de usuario?	Sí, desde Configuración > Perfil puedes editar tu nombre de usuario.	2026-03-30 07:34:25.171212	2026-03-30 07:34:25.171316	\N	7
111	¿Cómo empiezo a usar la plataforma?	Puedes comenzar registrándote con tu correo electrónico y siguiendo el asistente de configuración inicial.	2026-04-15 19:40:06.361732	2026-04-15 19:40:06.361834	\N	1
112	¿Necesito instalar algo para empezar?	No, nuestra plataforma es 100% web. Solo necesitas un navegador actualizado.	2026-04-15 19:40:06.361732	2026-04-15 19:40:06.361834	\N	1
113	¿Cómo cambio mi contraseña?	Ve a Configuración > Seguridad y selecciona 'Cambiar contraseña'.	2026-04-15 19:40:06.361732	2026-04-15 19:40:06.361834	\N	2
114	¿Qué hago si olvidé mi contraseña?	Haz clic en '¿Olvidaste tu contraseña?' en la página de inicio de sesión y sigue las instrucciones.	2026-04-15 19:40:06.361732	2026-04-15 19:40:06.361834	\N	2
115	¿Qué métodos de pago aceptan?	Aceptamos tarjetas de crédito, débito y pagos mediante PayPal.	2026-04-15 19:40:06.361732	2026-04-15 19:40:06.361834	\N	3
116	¿Dónde puedo ver mis facturas?	Accede a tu cuenta y ve a la sección de Facturación para ver y descargar tus facturas.	2026-04-15 19:40:06.361732	2026-04-15 19:40:06.361834	\N	3
117	¿Cómo conecto mi cuenta con WhatsApp?	Dirígete a Integraciones y selecciona WhatsApp. Sigue las instrucciones para escanear el código QR con tu app de WhatsApp.	2026-04-15 19:40:06.361732	2026-04-15 19:40:06.361834	\N	4
118	La aplicación no carga, ¿qué hago?	Verifica tu conexión a internet. Si el problema persiste, limpia la caché o contacta a soporte.	2026-04-15 19:40:06.361732	2026-04-15 19:40:06.361834	\N	5
119	¿Puedo desactivar las notificaciones por correo?	Sí, en Configuración > Notificaciones puedes activar o desactivar las notificaciones por correo electrónico.	2026-04-15 19:40:06.361732	2026-04-15 19:40:06.361834	\N	6
120	¿Puedo cambiar mi nombre de usuario?	Sí, desde Configuración > Perfil puedes editar tu nombre de usuario.	2026-04-15 19:40:06.361732	2026-04-15 19:40:06.361834	\N	7
121	¿Cómo empiezo a usar la plataforma?	Puedes comenzar registrándote con tu correo electrónico y siguiendo el asistente de configuración inicial.	2026-05-13 23:55:37.891071	2026-05-13 23:55:37.891189	\N	1
122	¿Necesito instalar algo para empezar?	No, nuestra plataforma es 100% web. Solo necesitas un navegador actualizado.	2026-05-13 23:55:37.891071	2026-05-13 23:55:37.891189	\N	1
123	¿Cómo cambio mi contraseña?	Ve a Configuración > Seguridad y selecciona 'Cambiar contraseña'.	2026-05-13 23:55:37.891071	2026-05-13 23:55:37.891189	\N	2
124	¿Qué hago si olvidé mi contraseña?	Haz clic en '¿Olvidaste tu contraseña?' en la página de inicio de sesión y sigue las instrucciones.	2026-05-13 23:55:37.891071	2026-05-13 23:55:37.891189	\N	2
125	¿Qué métodos de pago aceptan?	Aceptamos tarjetas de crédito, débito y pagos mediante PayPal.	2026-05-13 23:55:37.891071	2026-05-13 23:55:37.891189	\N	3
126	¿Dónde puedo ver mis facturas?	Accede a tu cuenta y ve a la sección de Facturación para ver y descargar tus facturas.	2026-05-13 23:55:37.891071	2026-05-13 23:55:37.891189	\N	3
127	¿Cómo conecto mi cuenta con WhatsApp?	Dirígete a Integraciones y selecciona WhatsApp. Sigue las instrucciones para escanear el código QR con tu app de WhatsApp.	2026-05-13 23:55:37.891071	2026-05-13 23:55:37.891189	\N	4
128	La aplicación no carga, ¿qué hago?	Verifica tu conexión a internet. Si el problema persiste, limpia la caché o contacta a soporte.	2026-05-13 23:55:37.891071	2026-05-13 23:55:37.891189	\N	5
129	¿Puedo desactivar las notificaciones por correo?	Sí, en Configuración > Notificaciones puedes activar o desactivar las notificaciones por correo electrónico.	2026-05-13 23:55:37.891071	2026-05-13 23:55:37.891189	\N	6
130	¿Puedo cambiar mi nombre de usuario?	Sí, desde Configuración > Perfil puedes editar tu nombre de usuario.	2026-05-13 23:55:37.891071	2026-05-13 23:55:37.891189	\N	7
131	¿Cómo empiezo a usar la plataforma?	Puedes comenzar registrándote con tu correo electrónico y siguiendo el asistente de configuración inicial.	2026-06-03 18:40:25.365492	2026-06-03 18:40:25.365534	\N	1
132	¿Necesito instalar algo para empezar?	No, nuestra plataforma es 100% web. Solo necesitas un navegador actualizado.	2026-06-03 18:40:25.365492	2026-06-03 18:40:25.365534	\N	1
133	¿Cómo cambio mi contraseña?	Ve a Configuración > Seguridad y selecciona 'Cambiar contraseña'.	2026-06-03 18:40:25.365492	2026-06-03 18:40:25.365534	\N	2
134	¿Qué hago si olvidé mi contraseña?	Haz clic en '¿Olvidaste tu contraseña?' en la página de inicio de sesión y sigue las instrucciones.	2026-06-03 18:40:25.365492	2026-06-03 18:40:25.365534	\N	2
135	¿Qué métodos de pago aceptan?	Aceptamos tarjetas de crédito, débito y pagos mediante PayPal.	2026-06-03 18:40:25.365492	2026-06-03 18:40:25.365534	\N	3
136	¿Dónde puedo ver mis facturas?	Accede a tu cuenta y ve a la sección de Facturación para ver y descargar tus facturas.	2026-06-03 18:40:25.365492	2026-06-03 18:40:25.365534	\N	3
137	¿Cómo conecto mi cuenta con WhatsApp?	Dirígete a Integraciones y selecciona WhatsApp. Sigue las instrucciones para escanear el código QR con tu app de WhatsApp.	2026-06-03 18:40:25.365492	2026-06-03 18:40:25.365534	\N	4
138	La aplicación no carga, ¿qué hago?	Verifica tu conexión a internet. Si el problema persiste, limpia la caché o contacta a soporte.	2026-06-03 18:40:25.365492	2026-06-03 18:40:25.365534	\N	5
139	¿Puedo desactivar las notificaciones por correo?	Sí, en Configuración > Notificaciones puedes activar o desactivar las notificaciones por correo electrónico.	2026-06-03 18:40:25.365492	2026-06-03 18:40:25.365534	\N	6
140	¿Puedo cambiar mi nombre de usuario?	Sí, desde Configuración > Perfil puedes editar tu nombre de usuario.	2026-06-03 18:40:25.365492	2026-06-03 18:40:25.365534	\N	7
141	¿Cómo empiezo a usar la plataforma?	Puedes comenzar registrándote con tu correo electrónico y siguiendo el asistente de configuración inicial.	2026-06-16 12:15:07.769284	2026-06-16 12:15:07.769326	\N	1
142	¿Necesito instalar algo para empezar?	No, nuestra plataforma es 100% web. Solo necesitas un navegador actualizado.	2026-06-16 12:15:07.769284	2026-06-16 12:15:07.769326	\N	1
143	¿Cómo cambio mi contraseña?	Ve a Configuración > Seguridad y selecciona 'Cambiar contraseña'.	2026-06-16 12:15:07.769284	2026-06-16 12:15:07.769326	\N	2
144	¿Qué hago si olvidé mi contraseña?	Haz clic en '¿Olvidaste tu contraseña?' en la página de inicio de sesión y sigue las instrucciones.	2026-06-16 12:15:07.769284	2026-06-16 12:15:07.769326	\N	2
145	¿Qué métodos de pago aceptan?	Aceptamos tarjetas de crédito, débito y pagos mediante PayPal.	2026-06-16 12:15:07.769284	2026-06-16 12:15:07.769326	\N	3
146	¿Dónde puedo ver mis facturas?	Accede a tu cuenta y ve a la sección de Facturación para ver y descargar tus facturas.	2026-06-16 12:15:07.769284	2026-06-16 12:15:07.769326	\N	3
147	¿Cómo conecto mi cuenta con WhatsApp?	Dirígete a Integraciones y selecciona WhatsApp. Sigue las instrucciones para escanear el código QR con tu app de WhatsApp.	2026-06-16 12:15:07.769284	2026-06-16 12:15:07.769326	\N	4
148	La aplicación no carga, ¿qué hago?	Verifica tu conexión a internet. Si el problema persiste, limpia la caché o contacta a soporte.	2026-06-16 12:15:07.769284	2026-06-16 12:15:07.769326	\N	5
149	¿Puedo desactivar las notificaciones por correo?	Sí, en Configuración > Notificaciones puedes activar o desactivar las notificaciones por correo electrónico.	2026-06-16 12:15:07.769284	2026-06-16 12:15:07.769326	\N	6
150	¿Puedo cambiar mi nombre de usuario?	Sí, desde Configuración > Perfil puedes editar tu nombre de usuario.	2026-06-16 12:15:07.769284	2026-06-16 12:15:07.769326	\N	7
151	¿Cómo empiezo a usar la plataforma?	Puedes comenzar registrándote con tu correo electrónico y siguiendo el asistente de configuración inicial.	2026-07-14 19:04:23.896778	2026-07-14 19:04:23.896821	\N	1
152	¿Necesito instalar algo para empezar?	No, nuestra plataforma es 100% web. Solo necesitas un navegador actualizado.	2026-07-14 19:04:23.896778	2026-07-14 19:04:23.896821	\N	1
153	¿Cómo cambio mi contraseña?	Ve a Configuración > Seguridad y selecciona 'Cambiar contraseña'.	2026-07-14 19:04:23.896778	2026-07-14 19:04:23.896821	\N	2
154	¿Qué hago si olvidé mi contraseña?	Haz clic en '¿Olvidaste tu contraseña?' en la página de inicio de sesión y sigue las instrucciones.	2026-07-14 19:04:23.896778	2026-07-14 19:04:23.896821	\N	2
155	¿Qué métodos de pago aceptan?	Aceptamos tarjetas de crédito, débito y pagos mediante PayPal.	2026-07-14 19:04:23.896778	2026-07-14 19:04:23.896821	\N	3
156	¿Dónde puedo ver mis facturas?	Accede a tu cuenta y ve a la sección de Facturación para ver y descargar tus facturas.	2026-07-14 19:04:23.896778	2026-07-14 19:04:23.896821	\N	3
157	¿Cómo conecto mi cuenta con WhatsApp?	Dirígete a Integraciones y selecciona WhatsApp. Sigue las instrucciones para escanear el código QR con tu app de WhatsApp.	2026-07-14 19:04:23.896778	2026-07-14 19:04:23.896821	\N	4
158	La aplicación no carga, ¿qué hago?	Verifica tu conexión a internet. Si el problema persiste, limpia la caché o contacta a soporte.	2026-07-14 19:04:23.896778	2026-07-14 19:04:23.896821	\N	5
159	¿Puedo desactivar las notificaciones por correo?	Sí, en Configuración > Notificaciones puedes activar o desactivar las notificaciones por correo electrónico.	2026-07-14 19:04:23.896778	2026-07-14 19:04:23.896821	\N	6
160	¿Puedo cambiar mi nombre de usuario?	Sí, desde Configuración > Perfil puedes editar tu nombre de usuario.	2026-07-14 19:04:23.896778	2026-07-14 19:04:23.896821	\N	7
161	¿Cómo empiezo a usar la plataforma?	Puedes comenzar registrándote con tu correo electrónico y siguiendo el asistente de configuración inicial.	2026-07-15 18:18:29.816846	2026-07-15 18:18:29.816888	\N	1
162	¿Necesito instalar algo para empezar?	No, nuestra plataforma es 100% web. Solo necesitas un navegador actualizado.	2026-07-15 18:18:29.816846	2026-07-15 18:18:29.816888	\N	1
163	¿Cómo cambio mi contraseña?	Ve a Configuración > Seguridad y selecciona 'Cambiar contraseña'.	2026-07-15 18:18:29.816846	2026-07-15 18:18:29.816888	\N	2
164	¿Qué hago si olvidé mi contraseña?	Haz clic en '¿Olvidaste tu contraseña?' en la página de inicio de sesión y sigue las instrucciones.	2026-07-15 18:18:29.816846	2026-07-15 18:18:29.816888	\N	2
165	¿Qué métodos de pago aceptan?	Aceptamos tarjetas de crédito, débito y pagos mediante PayPal.	2026-07-15 18:18:29.816846	2026-07-15 18:18:29.816888	\N	3
166	¿Dónde puedo ver mis facturas?	Accede a tu cuenta y ve a la sección de Facturación para ver y descargar tus facturas.	2026-07-15 18:18:29.816846	2026-07-15 18:18:29.816888	\N	3
167	¿Cómo conecto mi cuenta con WhatsApp?	Dirígete a Integraciones y selecciona WhatsApp. Sigue las instrucciones para escanear el código QR con tu app de WhatsApp.	2026-07-15 18:18:29.816846	2026-07-15 18:18:29.816888	\N	4
168	La aplicación no carga, ¿qué hago?	Verifica tu conexión a internet. Si el problema persiste, limpia la caché o contacta a soporte.	2026-07-15 18:18:29.816846	2026-07-15 18:18:29.816888	\N	5
169	¿Puedo desactivar las notificaciones por correo?	Sí, en Configuración > Notificaciones puedes activar o desactivar las notificaciones por correo electrónico.	2026-07-15 18:18:29.816846	2026-07-15 18:18:29.816888	\N	6
170	¿Puedo cambiar mi nombre de usuario?	Sí, desde Configuración > Perfil puedes editar tu nombre de usuario.	2026-07-15 18:18:29.816846	2026-07-15 18:18:29.816888	\N	7
\.


ALTER TABLE public.faqs ENABLE TRIGGER ALL;

--
-- Data for Name: guides; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.guides DISABLE TRIGGER ALL;

COPY public.guides (id, slug, title, subtitle, content, created_at, updated_at, user_id, category_id) FROM stdin;
1	primeros-pasos-en-la-plataforma	Primeros pasos en la plataforma	Configura tu cuenta y da los primeros pasos	Esta guía te ayudará a crear tu cuenta, verificar tu correo electrónico y comenzar a explorar las funcionalidades básicas.	2026-03-26 14:01:47.431953	2026-03-26 14:01:47.431994	\N	1
2	cambiar-contrasena-segura	Cambia tu contraseña de forma segura	Evita accesos no autorizados con una nueva contraseña	Accede a Configuración > Seguridad y sigue las instrucciones para actualizar tu contraseña de manera segura.	2026-03-26 14:01:47.431953	2026-03-26 14:01:47.431994	\N	2
3	actualizar-metodos-de-pago	Actualiza tus métodos de pago	Gestiona tus tarjetas y formas de pago	Aprende a agregar, modificar o eliminar métodos de pago desde la sección de Facturación.	2026-03-26 14:01:47.431953	2026-03-26 14:01:47.431994	\N	3
4	conectar-whatsapp	Conecta tu cuenta con WhatsApp	Guía paso a paso para integrar WhatsApp Business	Ve a Integraciones > WhatsApp, genera el código QR y escanéalo desde tu app de WhatsApp Business.	2026-03-26 14:01:47.431953	2026-03-26 14:01:47.431994	\N	4
5	resolver-problemas-comunes	Resuelve problemas comunes	Errores frecuentes y sus soluciones	Esta guía aborda problemas típicos como errores de carga, sesiones que expiran y más.	2026-03-26 14:01:47.431953	2026-03-26 14:01:47.431994	\N	5
6	configurar-notificaciones	Configura tus notificaciones	Recibe solo las alertas que te interesan	Personaliza qué tipo de notificaciones recibirás por correo, dentro de la app o por SMS.	2026-03-26 14:01:47.431953	2026-03-26 14:01:47.431994	\N	6
7	personalizar-perfil	Personaliza tu perfil de usuario	Haz tu cuenta más personal	Edita tu nombre, imagen de perfil, idioma y otras preferencias desde el panel de usuario.	2026-03-26 14:01:47.431953	2026-03-26 14:01:47.431994	\N	7
8	contactar-soporte-tecnico	Contacta al soporte técnico	Recibe ayuda del equipo de soporte	Sigue estos pasos para enviar un ticket, iniciar un chat o escribirnos por correo electrónico.	2026-03-26 14:01:47.431953	2026-03-26 14:01:47.431994	\N	8
9	administrar-privacidad	Administra tu privacidad	Controla cómo usamos tus datos	Configura qué información compartes y consulta nuestras políticas de privacidad.	2026-03-26 14:01:47.431953	2026-03-26 14:01:47.431994	\N	9
10	novedades-plataforma	Conoce las novedades de la plataforma	Nuevas funciones y mejoras	Consulta las funcionalidades más recientes, mejoras en rendimiento y corrección de errores.	2026-03-26 14:01:47.431953	2026-03-26 14:01:47.431994	\N	10
\.


ALTER TABLE public.guides ENABLE TRIGGER ALL;

--
-- Data for Name: missing; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.missing DISABLE TRIGGER ALL;

COPY public.missing (id, user_id, name, last_name, age, gender, description, birthdate, disappearance_date, place_of_disappearance, status_missing, photo, characteristics, reporter_name, reporter_phone, event_photo, created_at, updated_at) FROM stdin;
1	\N	Shasha Katerin	Villanueva Rodriguez	23	Femenino	xxxxxxxxxxxxxxxxxxxx	2025-07-09	2026-02-26	Alpacoma Bajo	progress	static/missing/perfil_Shasha_Katerin_Villanueva_Rodriguez_2026-02-26.png	Blusa celeste oscuro, pantalón jean, tenis negro	Daleska Carola	64957120	static/missing/evento_Shasha_Katerin_Villanueva_Rodriguez_2026-02-26.png	2026-03-26 14:14:44.473577	2026-03-26 14:14:44.47365
3	\N	Jhoel Deybert	Condori Aliaga	12	Masculino	Lorem ipsum	2025-07-09	2026-03-06	Zona Alto Pura Pura	progress	static/missing/perfil_Jhoel_Deybert_Condori_Aliaga_2026-03-06.png	Blusa celeste oscuro, pantalón jean, tenis negro	Daleska Carola	64957120	static/missing/evento_Jhoel_Deybert_Condori_Aliaga_2026-03-06.png	2026-03-30 07:34:26.773009	2026-03-30 07:34:26.773067
4	\N	Maria Belen 	Chavarria Quisbert	18	Femenino	prueba	2025-07-09	2026-03-06	Alpacoma Bajo	progress	static/missing/perfil_Maria_Belen__Chavarria_Quisbert_2026-03-06.png	Blusa celeste oscuro, pantalón jean, tenis negro	Daleska Carola	64957120	static/missing/evento_Maria_Belen__Chavarria_Quisbert_2026-03-06.png	2026-03-30 07:34:26.773009	2026-03-30 07:34:26.773067
6	\N	Carola	Moreira	10	Femenino	prueba	2017-06-07	2026-06-16	xxx x xx 	pending	static/missing/perfil_Carola_Moreira_2026-06-16.png	xx xxx 	Prueba	67879817	static/missing/evento_Carola_Moreira_2026-06-16.png	2026-06-16 12:15:08.361619	2026-07-14 19:04:24.481258
5	\N	Maria Belen 	Chavarria Quisbert	18	Femenino	xxxxxxxxx xxxxxxxxxxxxx	2026-04-23	2026-04-08	Alpacoma Bajo	pending	static/missing/perfil_Maria_Belen__Chavarria_Quisbert_2026-04-08.png	Blusa celeste oscuro, pantalón jean, tenis negro	Maria Belen 	64957120	static/missing/evento_Maria_Belen__Chavarria_Quisbert_2026-04-08.png	2026-04-15 19:40:10.00345	2026-07-14 19:04:24.481258
\.


ALTER TABLE public.missing ENABLE TRIGGER ALL;

--
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.permissions DISABLE TRIGGER ALL;

COPY public.permissions (id, name, action, model, created_at, updated_at) FROM stdin;
1	visualizar usuarios	view users	users	2026-03-26 14:01:48.406068	2026-03-26 14:01:48.40607
2	crear usuarios	create users	users	2026-03-26 14:01:48.406071	2026-03-26 14:01:48.406071
3	visualizar usuario	show user	users	2026-03-26 14:01:48.406071	2026-03-26 14:01:48.406073
4	actualizar usuarios	update users	users	2026-03-26 14:01:48.406074	2026-03-26 14:01:48.406074
5	eliminar usuarios	delete users	users	2026-03-26 14:01:48.406074	2026-03-26 14:01:48.406074
6	visualizar roles	view roles	roles	2026-03-26 14:01:48.406075	2026-03-26 14:01:48.406075
7	crear roles	create roles	roles	2026-03-26 14:01:48.406075	2026-03-26 14:01:48.406075
8	visualizar rol	show role	roles	2026-03-26 14:01:48.406075	2026-03-26 14:01:48.406075
9	actualizar roles	update roles	roles	2026-03-26 14:01:48.406076	2026-03-26 14:01:48.406076
10	eliminar roles	delete roles	roles	2026-03-26 14:01:48.406076	2026-03-26 14:01:48.406076
11	asignar roles	assign roles	roles	2026-03-26 14:01:48.406076	2026-03-26 14:01:48.406076
12	visualizar permisos	view permissions	permissions	2026-03-26 14:01:48.406076	2026-03-26 14:01:48.406077
13	asignar permisos	assign permissions	permissions	2026-03-26 14:01:48.406077	2026-03-26 14:01:48.406077
14	visualizar categorias	view categories	categories	2026-03-26 14:01:48.406077	2026-03-26 14:01:48.406077
15	crear categorias	create categories	categories	2026-03-26 14:01:48.406077	2026-03-26 14:01:48.406077
16	visualizar categoria	show category	categories	2026-03-26 14:01:48.406077	2026-03-26 14:01:48.406078
17	actualizar categorias	update categories	categories	2026-03-26 14:01:48.406078	2026-03-26 14:01:48.406078
18	eliminar categorias	delete categories	categories	2026-03-26 14:01:48.406078	2026-03-26 14:01:48.406078
19	visualizar preguntas frecuentes	view faqs	faqs	2026-03-26 14:01:48.406078	2026-03-26 14:01:48.406078
20	crear preguntas frecuentes	create faqs	faqs	2026-03-26 14:01:48.406079	2026-03-26 14:01:48.406079
21	visualizar pregunta frecuente	show faq	faqs	2026-03-26 14:01:48.406079	2026-03-26 14:01:48.406079
22	actualizar preguntas frecuentes	update faqs	faqs	2026-03-26 14:01:48.406079	2026-03-26 14:01:48.406079
23	eliminar pregunta frecuentes	delete faqs	faqs	2026-03-26 14:01:48.406079	2026-03-26 14:01:48.406079
24	visualizar guias	view guides	guides	2026-03-26 14:01:48.40608	2026-03-26 14:01:48.40608
25	crear guias	create guides	guides	2026-03-26 14:01:48.40608	2026-03-26 14:01:48.40608
26	visualizar guia	show guide	guides	2026-03-26 14:01:48.40608	2026-03-26 14:01:48.40608
27	actualizar guias	update guides	guides	2026-03-26 14:01:48.40608	2026-03-26 14:01:48.406081
28	eliminar guia	delete guides	guides	2026-03-26 14:01:48.406081	2026-03-26 14:01:48.406081
29	visualizar contactos de soporte	view contacts-support	contacts-support	2026-03-26 14:01:48.406081	2026-03-26 14:01:48.406081
30	crear contacto de soporte	create contacts-support	contacts-support	2026-03-26 14:01:48.406081	2026-03-26 14:01:48.406081
31	visualizar contacto de soporte	show contact-support	contacts-support	2026-03-26 14:01:48.406082	2026-03-26 14:01:48.406082
32	actualizar contacto de soporte	update contacts-support	contacts-support	2026-03-26 14:01:48.406082	2026-03-26 14:01:48.406082
33	eliminar contacto de soporte	delete contacts-support	contacts-support	2026-03-26 14:01:48.406082	2026-03-26 14:01:48.406082
34	visualizar dispositivos	view devices	devices	2026-03-26 14:01:48.406082	2026-03-26 14:01:48.406082
35	crear dispositivo	create devices	devices	2026-03-26 14:01:48.406083	2026-03-26 14:01:48.406083
36	visualizar dispositivo	show device	devices	2026-03-26 14:01:48.406083	2026-03-26 14:01:48.406083
37	actualizar dispositivos	update devices	devices	2026-03-26 14:01:48.406083	2026-03-26 14:01:48.406083
38	eliminar dispositivo	delete devices	devices	2026-03-26 14:01:48.406083	2026-03-26 14:01:48.406084
39	visualizar registro de dispositivos	view devices-registration	devices-registration	2026-03-26 14:01:48.406084	2026-03-26 14:01:48.406084
40	crear registro de dispositivo	create devices-registration	devices-registration	2026-03-26 14:01:48.406084	2026-03-26 14:01:48.406084
41	visualizar registro de dispositivo	show device-registration	devices-registration	2026-03-26 14:01:48.406084	2026-03-26 14:01:48.406084
42	actualizar registro de dispositivo	update devices-registration	devices-registration	2026-03-26 14:01:48.406085	2026-03-26 14:01:48.406085
43	eliminar registro de dispositivo	delete devices-registration	devices-registration	2026-03-26 14:01:48.406085	2026-03-26 14:01:48.406085
44	visualizar contactos de emergencia	view emergency-contacts	emergency-contacts	2026-03-26 14:01:48.406085	2026-03-26 14:01:48.406085
45	crear contacto de emergencia	create emergency-contacts	emergency-contacts	2026-03-26 14:01:48.406085	2026-03-26 14:01:48.406086
46	visualizar contacto de emergencia	show emergency-contact	emergency-contacts	2026-03-26 14:01:48.406086	2026-03-26 14:01:48.406086
47	actualizar contacto de emergencia	update emergency-contacts	emergency-contacts	2026-03-26 14:01:48.406086	2026-03-26 14:01:48.406086
48	eliminar contacto de emergencia	delete emergency-contacts	emergency-contacts	2026-03-26 14:01:48.406086	2026-03-26 14:01:48.406086
49	visualizar solicitudes	view requests	requests	2026-03-26 14:01:48.406086	2026-03-26 14:01:48.406087
50	crear solicitud	create requests	requests	2026-03-26 14:01:48.406087	2026-03-26 14:01:48.406087
51	visualizar solicitud	show request	requests	2026-03-26 14:01:48.406087	2026-03-26 14:01:48.406087
52	actualizar solicitud	update requests	requests	2026-03-26 14:01:48.406087	2026-03-26 14:01:48.406087
53	eliminar solicitud	delete requests	requests	2026-03-26 14:01:48.406087	2026-03-26 14:01:48.406088
54	visualizar solicitudes de desaparecidos	view missing	missing	2026-03-26 14:01:48.406088	2026-03-26 14:01:48.406088
55	crear solicitud de desaparecido	create missing	missing	2026-03-26 14:01:48.406088	2026-03-26 14:01:48.406088
56	visualizar solicitud de desaparecido	show missing	missing	2026-03-26 14:01:48.406088	2026-03-26 14:01:48.406088
57	actualizar solicitud de desaparecido	update missing	missing	2026-03-26 14:01:48.406089	2026-03-26 14:01:48.406089
58	eliminar solicitud de desaparecido	delete missing	missing	2026-03-26 14:01:48.406089	2026-03-26 14:01:48.406089
59	visualizar reportes de desaparecido	view reports	report	2026-03-26 14:01:48.406089	2026-03-26 14:01:48.406089
60	registrar reporte de desaparecido	create reports	report	2026-03-26 14:01:48.406089	2026-03-26 14:01:48.40609
61	visualizar reporte de desaparecido	show report	report	2026-03-26 14:01:48.40609	2026-03-26 14:01:48.40609
62	editar reporte de desaparecido	update reports	report	2026-03-26 14:01:48.40609	2026-03-26 14:01:48.40609
63	eliminar reporte de desaparecido	delete reports	report	2026-03-26 14:01:48.40609	2026-03-26 14:01:48.40609
\.


ALTER TABLE public.permissions ENABLE TRIGGER ALL;

--
-- Data for Name: reports; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.reports DISABLE TRIGGER ALL;

COPY public.reports (id, missing_id, user_id, name, email, phone, location, date, description, created_at, updated_at) FROM stdin;
\.


ALTER TABLE public.reports ENABLE TRIGGER ALL;

--
-- Data for Name: report_has_files; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.report_has_files DISABLE TRIGGER ALL;

COPY public.report_has_files (id, path, name, report_id, created_at, updated_at) FROM stdin;
\.


ALTER TABLE public.report_has_files ENABLE TRIGGER ALL;

--
-- Data for Name: requests; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.requests DISABLE TRIGGER ALL;

COPY public.requests (id, device_id, address, location, wifi, created_at, updated_at) FROM stdin;
\.


ALTER TABLE public.requests ENABLE TRIGGER ALL;

--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.roles DISABLE TRIGGER ALL;

COPY public.roles (id, name, description, created_at, updated_at) FROM stdin;
1	admin	role can do everything	2026-03-26 14:01:46.953	2026-03-26 14:01:46.953133
2	cliente	client role	2026-03-26 14:01:46.953	2026-03-26 14:01:46.953133
3	visualizador	viewer role	2026-03-26 14:01:46.953	2026-03-26 14:01:46.953133
\.


ALTER TABLE public.roles ENABLE TRIGGER ALL;

--
-- Data for Name: role_has_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.role_has_permissions DISABLE TRIGGER ALL;

COPY public.role_has_permissions (role_id, permission_id) FROM stdin;
1	1
1	2
1	3
1	4
1	5
1	6
1	7
1	8
1	9
1	10
1	11
1	12
1	13
1	14
1	15
1	16
1	17
1	18
1	19
1	20
1	21
1	22
1	23
1	24
1	25
1	26
1	27
1	28
1	29
1	30
1	31
1	32
1	33
1	34
1	35
1	36
1	37
1	38
1	39
1	40
1	41
1	42
1	43
1	44
1	45
1	46
1	47
1	48
1	49
1	50
1	51
1	52
1	53
1	54
1	55
1	56
1	57
1	58
1	59
1	60
1	61
1	62
1	63
2	34
2	35
2	36
2	37
2	38
2	44
2	45
2	46
2	47
2	48
2	3
2	4
\.


ALTER TABLE public.role_has_permissions ENABLE TRIGGER ALL;

--
-- Data for Name: user_has_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.user_has_permissions DISABLE TRIGGER ALL;

COPY public.user_has_permissions (user_id, permission_id) FROM stdin;
1	1
1	2
1	3
1	4
1	5
1	6
1	7
1	8
1	9
1	10
1	11
1	12
1	13
1	14
1	15
1	16
1	17
1	18
1	19
1	20
1	21
1	22
1	23
1	24
1	25
1	26
1	27
1	28
1	29
1	30
1	31
1	32
1	33
1	34
1	35
1	36
1	37
1	38
1	39
1	40
1	41
1	42
1	43
1	44
1	45
1	46
1	47
1	48
1	49
1	50
1	51
1	52
1	53
1	54
1	55
1	56
1	57
1	58
1	59
1	60
1	61
1	62
1	63
\.


ALTER TABLE public.user_has_permissions ENABLE TRIGGER ALL;

--
-- Data for Name: user_has_roles; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.user_has_roles DISABLE TRIGGER ALL;

COPY public.user_has_roles (role_id, user_id) FROM stdin;
1	1
2	2
2	14
2	15
2	20
2	26
2	27
2	28
2	29
\.


ALTER TABLE public.user_has_roles ENABLE TRIGGER ALL;

--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.categories_id_seq', 26, true);


--
-- Name: contact_support_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.contact_support_id_seq', 1, false);


--
-- Name: devices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.devices_id_seq', 1, false);


--
-- Name: devices_registration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.devices_registration_id_seq', 1, false);


--
-- Name: emergency_alerts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.emergency_alerts_id_seq', 1, false);


--
-- Name: emergency_contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.emergency_contacts_id_seq', 1, false);


--
-- Name: faqs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.faqs_id_seq', 170, true);


--
-- Name: guides_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.guides_id_seq', 26, true);


--
-- Name: missing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.missing_id_seq', 6, true);


--
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.permissions_id_seq', 79, true);


--
-- Name: report_has_files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.report_has_files_id_seq', 1, false);


--
-- Name: reports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.reports_id_seq', 1, false);


--
-- Name: requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.requests_id_seq', 1, false);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.roles_id_seq', 19, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 29, true);


--
-- PostgreSQL database dump complete
--

\unrestrict mk5TDUUnwtivdLYeobCdIJvcPC5BriQnOsONEADsxqiJ3qtq24jgEqBexcOHfAN

