--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.3
-- Dumped by pg_dump version 9.5.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF-8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: barrios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE barrios (
    codigo_ba character(3) NOT NULL,
    nombre_ba character varying(20),
    estrato_ba smallint
);


ALTER TABLE barrios OWNER TO postgres;

--
-- Name: candidatos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE candidatos (
    codigo_can character(3) NOT NULL,
    nombre_can character varying(20) NOT NULL,
    partido character(2) NOT NULL
);


ALTER TABLE candidatos OWNER TO postgres;

--
-- Name: ciudadanos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ciudadanos (
    cedula_ciu character(4) NOT NULL,
    nombre_ciu character varying(20),
    sexo_ciu character(1),
    edad_ciu smallint,
    barrio_ciu character(3) NOT NULL,
    partido_ciu character(2) NOT NULL
);


ALTER TABLE ciudadanos OWNER TO postgres;

--
-- Name: mesas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE mesas (
    codigo_mes character(2) NOT NULL,
    descripcion_mes character varying(20),
    barrio_mes character(3) NOT NULL
);


ALTER TABLE mesas OWNER TO postgres;

--
-- Name: partidos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE partidos (
    codigo_par character(2) NOT NULL,
    nombre_par character varying(20)
);


ALTER TABLE partidos OWNER TO postgres;

--
-- Name: puestos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE puestos (
    ciudadano_p character(4) NOT NULL,
    mesa_p character(2) NOT NULL
);


ALTER TABLE puestos OWNER TO postgres;

--
-- Name: votaciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE votaciones (
    ciudadano_v character(4) NOT NULL,
    candidato_v character(3)
);


ALTER TABLE votaciones OWNER TO postgres;

--
-- Data for Name: barrios; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO barrios (codigo_ba, nombre_ba, estrato_ba) VALUES ('100', 'San Andr�s', 3);
INSERT INTO barrios (codigo_ba, nombre_ba, estrato_ba) VALUES ('101', 'El Churo', 1);
INSERT INTO barrios (codigo_ba, nombre_ba, estrato_ba) VALUES ('102', 'Aire Libre', 2);
INSERT INTO barrios (codigo_ba, nombre_ba, estrato_ba) VALUES ('200', 'Atahualpa', 3);
INSERT INTO barrios (codigo_ba, nombre_ba, estrato_ba) VALUES ('201', 'F�tima', 2);
INSERT INTO barrios (codigo_ba, nombre_ba, estrato_ba) VALUES ('202', 'Caicedonia', 1);
INSERT INTO barrios (codigo_ba, nombre_ba, estrato_ba) VALUES ('300', 'El Ejido', 1);
INSERT INTO barrios (codigo_ba, nombre_ba, estrato_ba) VALUES ('301', 'Los Pinos', 3);
INSERT INTO barrios (codigo_ba, nombre_ba, estrato_ba) VALUES ('302', 'Popular', 1);
INSERT INTO barrios (codigo_ba, nombre_ba, estrato_ba) VALUES ('400', 'Miraflores', 3);
INSERT INTO barrios (codigo_ba, nombre_ba, estrato_ba) VALUES ('401', 'Doce de Octubre', 1);
INSERT INTO barrios (codigo_ba, nombre_ba, estrato_ba) VALUES ('402', 'El Tejar', 2);
INSERT INTO barrios (codigo_ba, nombre_ba, estrato_ba) VALUES ('500', 'Cantarana', 1);
INSERT INTO barrios (codigo_ba, nombre_ba, estrato_ba) VALUES ('501', 'Bachue', 4);
INSERT INTO barrios (codigo_ba, nombre_ba, estrato_ba) VALUES ('502', 'Agualongo', 3);
INSERT INTO barrios (codigo_ba, nombre_ba, estrato_ba) VALUES ('600', 'Niza', 4);
INSERT INTO barrios (codigo_ba, nombre_ba, estrato_ba) VALUES ('601', 'Sumatambo', 3);
INSERT INTO barrios (codigo_ba, nombre_ba, estrato_ba) VALUES ('602', 'El Bosque', 5);
INSERT INTO barrios (codigo_ba, nombre_ba, estrato_ba) VALUES ('700', 'San Ignacio', 4);
INSERT INTO barrios (codigo_ba, nombre_ba, estrato_ba) VALUES ('701', 'Las Acacias', 5);
INSERT INTO barrios (codigo_ba, nombre_ba, estrato_ba) VALUES ('702', 'San Felipe', 3);
INSERT INTO barrios (codigo_ba, nombre_ba, estrato_ba) VALUES ('800', 'Las Margaritas', 5);
INSERT INTO barrios (codigo_ba, nombre_ba, estrato_ba) VALUES ('801', 'Mariluz', 3);
INSERT INTO barrios (codigo_ba, nombre_ba, estrato_ba) VALUES ('802', 'Quintas de San Pedro', 4);
INSERT INTO barrios (codigo_ba, nombre_ba, estrato_ba) VALUES ('900', 'Morasurco', 6);
INSERT INTO barrios (codigo_ba, nombre_ba, estrato_ba) VALUES ('901', 'El Aljibe', 4);
INSERT INTO barrios (codigo_ba, nombre_ba, estrato_ba) VALUES ('902', 'Brice�o', 6);


--
-- Data for Name: candidatos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO candidatos (codigo_can, nombre_can, partido) VALUES ('C10', 'RODRIGO PARDO', 'LB');
INSERT INTO candidatos (codigo_can, nombre_can, partido) VALUES ('C20', 'ANDRES PASTRANA', 'CV');
INSERT INTO candidatos (codigo_can, nombre_can, partido) VALUES ('C30', 'JAIME GARZON', 'PD');
INSERT INTO candidatos (codigo_can, nombre_can, partido) VALUES ('C40', 'JUAN SANTOS', 'PU');
INSERT INTO candidatos (codigo_can, nombre_can, partido) VALUES ('C50', 'CARLOS LLERAS', 'CR');
INSERT INTO candidatos (codigo_can, nombre_can, partido) VALUES ('C60', 'ANTANAS MOKUS', 'VR');
INSERT INTO candidatos (codigo_can, nombre_can, partido) VALUES ('C70', 'ANDRES CEPEDA', 'PN');
INSERT INTO candidatos (codigo_can, nombre_can, partido) VALUES ('C80', 'ALBERTO HENAO', 'MR');


--
-- Data for Name: ciudadanos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO ciudadanos (cedula_ciu, nombre_ciu, sexo_ciu, edad_ciu, barrio_ciu, partido_ciu) VALUES ('1000', 'PABLO PEREZ', 'M', 18, '100', 'LB');
INSERT INTO ciudadanos (cedula_ciu, nombre_ciu, sexo_ciu, edad_ciu, barrio_ciu, partido_ciu) VALUES ('1100', 'ALEXANDRA ACOSTA', 'F', 22, '100', 'CR');
INSERT INTO ciudadanos (cedula_ciu, nombre_ciu, sexo_ciu, edad_ciu, barrio_ciu, partido_ciu) VALUES ('1200', 'LEIDY BENAVIDES', 'F', 25, '101', 'CV');
INSERT INTO ciudadanos (cedula_ciu, nombre_ciu, sexo_ciu, edad_ciu, barrio_ciu, partido_ciu) VALUES ('1300', 'LAURA CORDOBA', 'F', 23, '101', 'LB');
INSERT INTO ciudadanos (cedula_ciu, nombre_ciu, sexo_ciu, edad_ciu, barrio_ciu, partido_ciu) VALUES ('1400', 'ANDRES ESTRELLA', 'M', 30, '102', 'MR');
INSERT INTO ciudadanos (cedula_ciu, nombre_ciu, sexo_ciu, edad_ciu, barrio_ciu, partido_ciu) VALUES ('1500', 'CARLOS LONGA PEREZ', 'M', 20, '102', 'LB');
INSERT INTO ciudadanos (cedula_ciu, nombre_ciu, sexo_ciu, edad_ciu, barrio_ciu, partido_ciu) VALUES ('1600', 'ADRIANA GUERRERO', 'F', 40, '200', 'PD');
INSERT INTO ciudadanos (cedula_ciu, nombre_ciu, sexo_ciu, edad_ciu, barrio_ciu, partido_ciu) VALUES ('1700', 'SOLEY INSUASTY', 'F', 45, '201', 'PN');
INSERT INTO ciudadanos (cedula_ciu, nombre_ciu, sexo_ciu, edad_ciu, barrio_ciu, partido_ciu) VALUES ('1800', 'HAROLD JACOME', 'M', 57, '202', 'PU');
INSERT INTO ciudadanos (cedula_ciu, nombre_ciu, sexo_ciu, edad_ciu, barrio_ciu, partido_ciu) VALUES ('1900', 'JHON PERALTA', 'M', 60, '300', 'VR');
INSERT INTO ciudadanos (cedula_ciu, nombre_ciu, sexo_ciu, edad_ciu, barrio_ciu, partido_ciu) VALUES ('2000', 'MARTHA BARRETO', 'F', 25, '301', 'CV');
INSERT INTO ciudadanos (cedula_ciu, nombre_ciu, sexo_ciu, edad_ciu, barrio_ciu, partido_ciu) VALUES ('2500', 'DIEGO ROSERO', 'M', 27, '302', 'CV');
INSERT INTO ciudadanos (cedula_ciu, nombre_ciu, sexo_ciu, edad_ciu, barrio_ciu, partido_ciu) VALUES ('3000', 'LEONARDO JARA', 'M', 30, '400', 'PD');
INSERT INTO ciudadanos (cedula_ciu, nombre_ciu, sexo_ciu, edad_ciu, barrio_ciu, partido_ciu) VALUES ('3500', 'CARLOS MENDEZ', 'M', 33, '401', 'PD');
INSERT INTO ciudadanos (cedula_ciu, nombre_ciu, sexo_ciu, edad_ciu, barrio_ciu, partido_ciu) VALUES ('4000', 'JUAN FONTECHE', 'M', 39, '402', 'PU');
INSERT INTO ciudadanos (cedula_ciu, nombre_ciu, sexo_ciu, edad_ciu, barrio_ciu, partido_ciu) VALUES ('4500', 'MILADY CORAL', 'F', 40, '500', 'PU');
INSERT INTO ciudadanos (cedula_ciu, nombre_ciu, sexo_ciu, edad_ciu, barrio_ciu, partido_ciu) VALUES ('5000', 'MARGARITA ORBES', 'F', 43, '501', 'CR');
INSERT INTO ciudadanos (cedula_ciu, nombre_ciu, sexo_ciu, edad_ciu, barrio_ciu, partido_ciu) VALUES ('5500', 'LAURA CORDOBA', 'F', 46, '502', 'CR');
INSERT INTO ciudadanos (cedula_ciu, nombre_ciu, sexo_ciu, edad_ciu, barrio_ciu, partido_ciu) VALUES ('6000', 'ISABEL MARTINEZ', 'F', 60, '600', 'VR');
INSERT INTO ciudadanos (cedula_ciu, nombre_ciu, sexo_ciu, edad_ciu, barrio_ciu, partido_ciu) VALUES ('6500', 'CARLOS DORADO', 'M', 65, '601', 'VR');
INSERT INTO ciudadanos (cedula_ciu, nombre_ciu, sexo_ciu, edad_ciu, barrio_ciu, partido_ciu) VALUES ('7000', 'HERNAN CHAVES', 'M', 70, '602', 'PN');
INSERT INTO ciudadanos (cedula_ciu, nombre_ciu, sexo_ciu, edad_ciu, barrio_ciu, partido_ciu) VALUES ('7500', 'HERMES PACHAJOA', 'M', 20, '700', 'PN');
INSERT INTO ciudadanos (cedula_ciu, nombre_ciu, sexo_ciu, edad_ciu, barrio_ciu, partido_ciu) VALUES ('8000', 'SOFIA MONTENEGRO', 'F', 22, '701', 'MR');
INSERT INTO ciudadanos (cedula_ciu, nombre_ciu, sexo_ciu, edad_ciu, barrio_ciu, partido_ciu) VALUES ('8500', 'ANDREA CASTILLO', 'F', 25, '702', 'MR');
INSERT INTO ciudadanos (cedula_ciu, nombre_ciu, sexo_ciu, edad_ciu, barrio_ciu, partido_ciu) VALUES ('9000', 'LUIS CHUMPITAZ', 'M', 65, '800', 'LB');
INSERT INTO ciudadanos (cedula_ciu, nombre_ciu, sexo_ciu, edad_ciu, barrio_ciu, partido_ciu) VALUES ('9500', 'ERNESTO LASERNA', 'M', 68, '801', 'CV');
INSERT INTO ciudadanos (cedula_ciu, nombre_ciu, sexo_ciu, edad_ciu, barrio_ciu, partido_ciu) VALUES ('9600', 'AMANDA SARASTY', 'F', 45, '802', 'PD');
INSERT INTO ciudadanos (cedula_ciu, nombre_ciu, sexo_ciu, edad_ciu, barrio_ciu, partido_ciu) VALUES ('9700', 'JESUS ACOSTA', 'M', 70, '900', 'PU');
INSERT INTO ciudadanos (cedula_ciu, nombre_ciu, sexo_ciu, edad_ciu, barrio_ciu, partido_ciu) VALUES ('2100', 'JUAN ALBAN', 'M', 30, '901', 'LB');
INSERT INTO ciudadanos (cedula_ciu, nombre_ciu, sexo_ciu, edad_ciu, barrio_ciu, partido_ciu) VALUES ('2200', 'CARLOS LATORRE', 'M', 45, '902', 'CR');
INSERT INTO ciudadanos (cedula_ciu, nombre_ciu, sexo_ciu, edad_ciu, barrio_ciu, partido_ciu) VALUES ('2300', 'INGRID CHANTRE', 'F', 33, '200', 'CV');
INSERT INTO ciudadanos (cedula_ciu, nombre_ciu, sexo_ciu, edad_ciu, barrio_ciu, partido_ciu) VALUES ('2400', 'LEIDY CALDON', 'F', 28, '200', 'MR');
INSERT INTO ciudadanos (cedula_ciu, nombre_ciu, sexo_ciu, edad_ciu, barrio_ciu, partido_ciu) VALUES ('3100', 'JENIFER DELGADO', 'F', 22, '300', 'PD');
INSERT INTO ciudadanos (cedula_ciu, nombre_ciu, sexo_ciu, edad_ciu, barrio_ciu, partido_ciu) VALUES ('3200', 'INES FLOREZ', 'F', 21, '300', 'PN');
INSERT INTO ciudadanos (cedula_ciu, nombre_ciu, sexo_ciu, edad_ciu, barrio_ciu, partido_ciu) VALUES ('3300', 'MARIA VERGARA', 'F', 50, '300', 'PU');
INSERT INTO ciudadanos (cedula_ciu, nombre_ciu, sexo_ciu, edad_ciu, barrio_ciu, partido_ciu) VALUES ('3400', 'DANIELA IDROBO', 'F', 55, '400', 'VR');
INSERT INTO ciudadanos (cedula_ciu, nombre_ciu, sexo_ciu, edad_ciu, barrio_ciu, partido_ciu) VALUES ('4100', 'MARCELA LOPEZ', 'F', 32, '400', 'VR');
INSERT INTO ciudadanos (cedula_ciu, nombre_ciu, sexo_ciu, edad_ciu, barrio_ciu, partido_ciu) VALUES ('4200', 'ERICK MALDONADO', 'M', 32, '400', 'PU');
INSERT INTO ciudadanos (cedula_ciu, nombre_ciu, sexo_ciu, edad_ciu, barrio_ciu, partido_ciu) VALUES ('4300', 'LAURA MARTINEZ', 'F', 18, '500', 'PN');
INSERT INTO ciudadanos (cedula_ciu, nombre_ciu, sexo_ciu, edad_ciu, barrio_ciu, partido_ciu) VALUES ('4400', 'RODRIGO MENDEZ', 'M', 18, '500', 'PD');
INSERT INTO ciudadanos (cedula_ciu, nombre_ciu, sexo_ciu, edad_ciu, barrio_ciu, partido_ciu) VALUES ('5100', 'JAIME MONTILLA', 'M', 22, '500', 'MR');
INSERT INTO ciudadanos (cedula_ciu, nombre_ciu, sexo_ciu, edad_ciu, barrio_ciu, partido_ciu) VALUES ('5200', 'HECTOR MESIAS', 'M', 25, '600', 'CV');
INSERT INTO ciudadanos (cedula_ciu, nombre_ciu, sexo_ciu, edad_ciu, barrio_ciu, partido_ciu) VALUES ('5300', 'DIEGO SAMBONI', 'M', 65, '600', 'CR');
INSERT INTO ciudadanos (cedula_ciu, nombre_ciu, sexo_ciu, edad_ciu, barrio_ciu, partido_ciu) VALUES ('5400', 'ANDRES NEGRETE', 'M', 68, '700', 'LB');
INSERT INTO ciudadanos (cedula_ciu, nombre_ciu, sexo_ciu, edad_ciu, barrio_ciu, partido_ciu) VALUES ('6100', 'JHON COLLAZOS', 'M', 45, '700', 'CV');
INSERT INTO ciudadanos (cedula_ciu, nombre_ciu, sexo_ciu, edad_ciu, barrio_ciu, partido_ciu) VALUES ('6200', 'YINER RAMOS', 'F', 18, '800', 'LB');


--
-- Data for Name: mesas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO mesas (codigo_mes, descripcion_mes, barrio_mes) VALUES ('10', 'MESA 1', '100');
INSERT INTO mesas (codigo_mes, descripcion_mes, barrio_mes) VALUES ('20', 'MESA 2', '100');
INSERT INTO mesas (codigo_mes, descripcion_mes, barrio_mes) VALUES ('30', 'MESA 3', '101');
INSERT INTO mesas (codigo_mes, descripcion_mes, barrio_mes) VALUES ('40', 'MESA 4', '101');
INSERT INTO mesas (codigo_mes, descripcion_mes, barrio_mes) VALUES ('50', 'MESA 5', '102');
INSERT INTO mesas (codigo_mes, descripcion_mes, barrio_mes) VALUES ('60', 'MESA 6', '102');
INSERT INTO mesas (codigo_mes, descripcion_mes, barrio_mes) VALUES ('70', 'MESA 7', '200');
INSERT INTO mesas (codigo_mes, descripcion_mes, barrio_mes) VALUES ('80', 'MESA 8', '200');
INSERT INTO mesas (codigo_mes, descripcion_mes, barrio_mes) VALUES ('85', 'MESA 9', '201');
INSERT INTO mesas (codigo_mes, descripcion_mes, barrio_mes) VALUES ('87', 'MESA 10', '201');
INSERT INTO mesas (codigo_mes, descripcion_mes, barrio_mes) VALUES ('90', 'MESA 11', '202');
INSERT INTO mesas (codigo_mes, descripcion_mes, barrio_mes) VALUES ('91', 'MESA 12', '202');
INSERT INTO mesas (codigo_mes, descripcion_mes, barrio_mes) VALUES ('92', 'MESA 13', '300');
INSERT INTO mesas (codigo_mes, descripcion_mes, barrio_mes) VALUES ('93', 'MESA 14', '300');
INSERT INTO mesas (codigo_mes, descripcion_mes, barrio_mes) VALUES ('94', 'MESA 15', '301');
INSERT INTO mesas (codigo_mes, descripcion_mes, barrio_mes) VALUES ('95', 'MESA 16', '301');
INSERT INTO mesas (codigo_mes, descripcion_mes, barrio_mes) VALUES ('96', 'MESA 17', '302');
INSERT INTO mesas (codigo_mes, descripcion_mes, barrio_mes) VALUES ('97', 'MESA 18', '302');
INSERT INTO mesas (codigo_mes, descripcion_mes, barrio_mes) VALUES ('98', 'MESA 19', '400');
INSERT INTO mesas (codigo_mes, descripcion_mes, barrio_mes) VALUES ('99', 'MESA 20', '400');
INSERT INTO mesas (codigo_mes, descripcion_mes, barrio_mes) VALUES ('11', 'MESA 21', '401');
INSERT INTO mesas (codigo_mes, descripcion_mes, barrio_mes) VALUES ('12', 'MESA 22', '401');
INSERT INTO mesas (codigo_mes, descripcion_mes, barrio_mes) VALUES ('13', 'MESA 23', '402');
INSERT INTO mesas (codigo_mes, descripcion_mes, barrio_mes) VALUES ('14', 'MESA 24', '402');
INSERT INTO mesas (codigo_mes, descripcion_mes, barrio_mes) VALUES ('15', 'MESA 25', '501');
INSERT INTO mesas (codigo_mes, descripcion_mes, barrio_mes) VALUES ('16', 'MESA 26', '501');
INSERT INTO mesas (codigo_mes, descripcion_mes, barrio_mes) VALUES ('17', 'MESA 27', '502');
INSERT INTO mesas (codigo_mes, descripcion_mes, barrio_mes) VALUES ('18', 'MESA 28', '502');
INSERT INTO mesas (codigo_mes, descripcion_mes, barrio_mes) VALUES ('19', 'MESA 29', '601');
INSERT INTO mesas (codigo_mes, descripcion_mes, barrio_mes) VALUES ('21', 'MESA 30', '601');
INSERT INTO mesas (codigo_mes, descripcion_mes, barrio_mes) VALUES ('22', 'MESA 31', '602');
INSERT INTO mesas (codigo_mes, descripcion_mes, barrio_mes) VALUES ('23', 'MESA 32', '500');
INSERT INTO mesas (codigo_mes, descripcion_mes, barrio_mes) VALUES ('24', 'MESA 33', '500');
INSERT INTO mesas (codigo_mes, descripcion_mes, barrio_mes) VALUES ('25', 'MESA 34', '600');
INSERT INTO mesas (codigo_mes, descripcion_mes, barrio_mes) VALUES ('26', 'MESA 35', '600');
INSERT INTO mesas (codigo_mes, descripcion_mes, barrio_mes) VALUES ('27', 'MESA 36', '700');
INSERT INTO mesas (codigo_mes, descripcion_mes, barrio_mes) VALUES ('28', 'MESA 37', '700');
INSERT INTO mesas (codigo_mes, descripcion_mes, barrio_mes) VALUES ('29', 'MESA 38', '701');
INSERT INTO mesas (codigo_mes, descripcion_mes, barrio_mes) VALUES ('31', 'MESA 39', '702');
INSERT INTO mesas (codigo_mes, descripcion_mes, barrio_mes) VALUES ('32', 'MESA 40', '702');
INSERT INTO mesas (codigo_mes, descripcion_mes, barrio_mes) VALUES ('33', 'MESA 41', '800');
INSERT INTO mesas (codigo_mes, descripcion_mes, barrio_mes) VALUES ('34', 'MESA 42', '800');
INSERT INTO mesas (codigo_mes, descripcion_mes, barrio_mes) VALUES ('35', 'MESA 43', '801');
INSERT INTO mesas (codigo_mes, descripcion_mes, barrio_mes) VALUES ('36', 'MESA 44', '801');
INSERT INTO mesas (codigo_mes, descripcion_mes, barrio_mes) VALUES ('37', 'MESA 45', '802');
INSERT INTO mesas (codigo_mes, descripcion_mes, barrio_mes) VALUES ('38', 'MESA 46', '802');
INSERT INTO mesas (codigo_mes, descripcion_mes, barrio_mes) VALUES ('39', 'MESA 47', '900');
INSERT INTO mesas (codigo_mes, descripcion_mes, barrio_mes) VALUES ('41', 'MESA 48', '900');
INSERT INTO mesas (codigo_mes, descripcion_mes, barrio_mes) VALUES ('42', 'MESA 49', '901');
INSERT INTO mesas (codigo_mes, descripcion_mes, barrio_mes) VALUES ('43', 'MESA 50', '901');
INSERT INTO mesas (codigo_mes, descripcion_mes, barrio_mes) VALUES ('44', 'MESA 51', '902');
INSERT INTO mesas (codigo_mes, descripcion_mes, barrio_mes) VALUES ('45', 'MESA 52', '902');


--
-- Data for Name: partidos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO partidos (codigo_par, nombre_par) VALUES ('LB', 'LIBERAL');
INSERT INTO partidos (codigo_par, nombre_par) VALUES ('CV', 'CONSERVADOR');
INSERT INTO partidos (codigo_par, nombre_par) VALUES ('PD', 'POLO DEMOCRATICO');
INSERT INTO partidos (codigo_par, nombre_par) VALUES ('PU', 'PARTIDO U');
INSERT INTO partidos (codigo_par, nombre_par) VALUES ('CR', 'CAMBIO RADICAL');
INSERT INTO partidos (codigo_par, nombre_par) VALUES ('VR', 'VERDE');
INSERT INTO partidos (codigo_par, nombre_par) VALUES ('PN', 'PIN');
INSERT INTO partidos (codigo_par, nombre_par) VALUES ('MR', 'MIRA');


--
-- Data for Name: puestos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO puestos (ciudadano_p, mesa_p) VALUES ('1000', '10');
INSERT INTO puestos (ciudadano_p, mesa_p) VALUES ('1500', '20');
INSERT INTO puestos (ciudadano_p, mesa_p) VALUES ('2000', '30');
INSERT INTO puestos (ciudadano_p, mesa_p) VALUES ('2500', '40');
INSERT INTO puestos (ciudadano_p, mesa_p) VALUES ('3000', '50');
INSERT INTO puestos (ciudadano_p, mesa_p) VALUES ('3500', '60');
INSERT INTO puestos (ciudadano_p, mesa_p) VALUES ('4000', '70');
INSERT INTO puestos (ciudadano_p, mesa_p) VALUES ('4500', '80');
INSERT INTO puestos (ciudadano_p, mesa_p) VALUES ('5000', '85');
INSERT INTO puestos (ciudadano_p, mesa_p) VALUES ('5500', '87');
INSERT INTO puestos (ciudadano_p, mesa_p) VALUES ('6000', '90');
INSERT INTO puestos (ciudadano_p, mesa_p) VALUES ('6500', '91');
INSERT INTO puestos (ciudadano_p, mesa_p) VALUES ('7000', '92');
INSERT INTO puestos (ciudadano_p, mesa_p) VALUES ('7500', '93');
INSERT INTO puestos (ciudadano_p, mesa_p) VALUES ('8000', '94');
INSERT INTO puestos (ciudadano_p, mesa_p) VALUES ('8500', '95');
INSERT INTO puestos (ciudadano_p, mesa_p) VALUES ('9000', '96');
INSERT INTO puestos (ciudadano_p, mesa_p) VALUES ('9500', '97');
INSERT INTO puestos (ciudadano_p, mesa_p) VALUES ('9600', '98');
INSERT INTO puestos (ciudadano_p, mesa_p) VALUES ('9700', '99');
INSERT INTO puestos (ciudadano_p, mesa_p) VALUES ('1100', '11');
INSERT INTO puestos (ciudadano_p, mesa_p) VALUES ('1200', '11');
INSERT INTO puestos (ciudadano_p, mesa_p) VALUES ('1300', '12');
INSERT INTO puestos (ciudadano_p, mesa_p) VALUES ('1400', '12');
INSERT INTO puestos (ciudadano_p, mesa_p) VALUES ('1600', '13');
INSERT INTO puestos (ciudadano_p, mesa_p) VALUES ('1700', '13');
INSERT INTO puestos (ciudadano_p, mesa_p) VALUES ('1800', '14');
INSERT INTO puestos (ciudadano_p, mesa_p) VALUES ('1900', '15');
INSERT INTO puestos (ciudadano_p, mesa_p) VALUES ('2100', '15');
INSERT INTO puestos (ciudadano_p, mesa_p) VALUES ('2200', '16');
INSERT INTO puestos (ciudadano_p, mesa_p) VALUES ('2300', '16');
INSERT INTO puestos (ciudadano_p, mesa_p) VALUES ('2400', '16');
INSERT INTO puestos (ciudadano_p, mesa_p) VALUES ('3100', '17');
INSERT INTO puestos (ciudadano_p, mesa_p) VALUES ('3200', '17');
INSERT INTO puestos (ciudadano_p, mesa_p) VALUES ('3300', '17');
INSERT INTO puestos (ciudadano_p, mesa_p) VALUES ('3400', '18');
INSERT INTO puestos (ciudadano_p, mesa_p) VALUES ('4100', '18');
INSERT INTO puestos (ciudadano_p, mesa_p) VALUES ('4200', '19');
INSERT INTO puestos (ciudadano_p, mesa_p) VALUES ('4300', '21');
INSERT INTO puestos (ciudadano_p, mesa_p) VALUES ('4400', '21');


--
-- Data for Name: votaciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO votaciones (ciudadano_v, candidato_v) VALUES ('1000', 'C10');
INSERT INTO votaciones (ciudadano_v, candidato_v) VALUES ('1500', 'C20');
INSERT INTO votaciones (ciudadano_v, candidato_v) VALUES ('2000', 'C30');
INSERT INTO votaciones (ciudadano_v, candidato_v) VALUES ('2500', 'C40');
INSERT INTO votaciones (ciudadano_v, candidato_v) VALUES ('3000', 'C50');
INSERT INTO votaciones (ciudadano_v, candidato_v) VALUES ('3500', 'C60');
INSERT INTO votaciones (ciudadano_v, candidato_v) VALUES ('4000', 'C70');
INSERT INTO votaciones (ciudadano_v, candidato_v) VALUES ('4500', 'C80');
INSERT INTO votaciones (ciudadano_v, candidato_v) VALUES ('5000', 'C10');
INSERT INTO votaciones (ciudadano_v, candidato_v) VALUES ('5500', 'C10');
INSERT INTO votaciones (ciudadano_v, candidato_v) VALUES ('6000', 'C30');
INSERT INTO votaciones (ciudadano_v, candidato_v) VALUES ('6500', 'C30');
INSERT INTO votaciones (ciudadano_v, candidato_v) VALUES ('7000', 'C30');
INSERT INTO votaciones (ciudadano_v, candidato_v) VALUES ('7500', 'C40');
INSERT INTO votaciones (ciudadano_v, candidato_v) VALUES ('8000', 'C60');
INSERT INTO votaciones (ciudadano_v, candidato_v) VALUES ('8500', 'C60');
INSERT INTO votaciones (ciudadano_v, candidato_v) VALUES ('9000', 'C60');
INSERT INTO votaciones (ciudadano_v, candidato_v) VALUES ('9500', 'C60');
INSERT INTO votaciones (ciudadano_v, candidato_v) VALUES ('1100', 'C10');
INSERT INTO votaciones (ciudadano_v, candidato_v) VALUES ('1200', 'C10');
INSERT INTO votaciones (ciudadano_v, candidato_v) VALUES ('1300', 'C10');
INSERT INTO votaciones (ciudadano_v, candidato_v) VALUES ('1400', 'C20');
INSERT INTO votaciones (ciudadano_v, candidato_v) VALUES ('1600', 'C20');
INSERT INTO votaciones (ciudadano_v, candidato_v) VALUES ('1700', 'C30');
INSERT INTO votaciones (ciudadano_v, candidato_v) VALUES ('1800', 'C30');
INSERT INTO votaciones (ciudadano_v, candidato_v) VALUES ('1900', 'C10');
INSERT INTO votaciones (ciudadano_v, candidato_v) VALUES ('2100', 'C10');
INSERT INTO votaciones (ciudadano_v, candidato_v) VALUES ('2200', 'C20');
INSERT INTO votaciones (ciudadano_v, candidato_v) VALUES ('2300', 'C20');
INSERT INTO votaciones (ciudadano_v, candidato_v) VALUES ('2400', 'C20');
INSERT INTO votaciones (ciudadano_v, candidato_v) VALUES ('3100', 'C30');
INSERT INTO votaciones (ciudadano_v, candidato_v) VALUES ('3200', 'C30');
INSERT INTO votaciones (ciudadano_v, candidato_v) VALUES ('3300', 'C30');
INSERT INTO votaciones (ciudadano_v, candidato_v) VALUES ('3400', 'C30');
INSERT INTO votaciones (ciudadano_v, candidato_v) VALUES ('4100', 'C30');
INSERT INTO votaciones (ciudadano_v, candidato_v) VALUES ('4200', 'C30');
INSERT INTO votaciones (ciudadano_v, candidato_v) VALUES ('4300', 'C30');
INSERT INTO votaciones (ciudadano_v, candidato_v) VALUES ('4400', 'C30');


--
-- Name: barrios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY barrios
    ADD CONSTRAINT barrios_pkey PRIMARY KEY (codigo_ba);


--
-- Name: candidatos_nombre_can_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY candidatos
    ADD CONSTRAINT candidatos_nombre_can_key UNIQUE (nombre_can);


--
-- Name: candidatos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY candidatos
    ADD CONSTRAINT candidatos_pkey PRIMARY KEY (codigo_can);


--
-- Name: ciudadanos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ciudadanos
    ADD CONSTRAINT ciudadanos_pkey PRIMARY KEY (cedula_ciu);


--
-- Name: mesas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mesas
    ADD CONSTRAINT mesas_pkey PRIMARY KEY (codigo_mes);


--
-- Name: partidos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY partidos
    ADD CONSTRAINT partidos_pkey PRIMARY KEY (codigo_par);


--
-- Name: puestos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY puestos
    ADD CONSTRAINT puestos_pkey PRIMARY KEY (ciudadano_p, mesa_p);


--
-- Name: votaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY votaciones
    ADD CONSTRAINT votaciones_pkey PRIMARY KEY (ciudadano_v);


--
-- Name: candidatos_partido_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY candidatos
    ADD CONSTRAINT candidatos_partido_fkey FOREIGN KEY (partido) REFERENCES partidos(codigo_par);


--
-- Name: ciudadanos_barrio_ciu_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ciudadanos
    ADD CONSTRAINT ciudadanos_barrio_ciu_fkey FOREIGN KEY (barrio_ciu) REFERENCES barrios(codigo_ba);


--
-- Name: ciudadanos_partido_ciu_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ciudadanos
    ADD CONSTRAINT ciudadanos_partido_ciu_fkey FOREIGN KEY (partido_ciu) REFERENCES partidos(codigo_par);


--
-- Name: mesas_barrio_mes_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mesas
    ADD CONSTRAINT mesas_barrio_mes_fkey FOREIGN KEY (barrio_mes) REFERENCES barrios(codigo_ba);


--
-- Name: puestos_ciudadano_p_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY puestos
    ADD CONSTRAINT puestos_ciudadano_p_fkey FOREIGN KEY (ciudadano_p) REFERENCES ciudadanos(cedula_ciu);


--
-- Name: puestos_mesa_p_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY puestos
    ADD CONSTRAINT puestos_mesa_p_fkey FOREIGN KEY (mesa_p) REFERENCES mesas(codigo_mes);


--
-- Name: votaciones_candidato_v_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY votaciones
    ADD CONSTRAINT votaciones_candidato_v_fkey FOREIGN KEY (candidato_v) REFERENCES candidatos(codigo_can);


--
-- Name: votaciones_ciudadano_v_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY votaciones
    ADD CONSTRAINT votaciones_ciudadano_v_fkey FOREIGN KEY (ciudadano_v) REFERENCES ciudadanos(cedula_ciu);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

/*
-- CUESTIONARIO
-- Crear la base de datos votacionesdb
-- Realizar las siguientes consultas
-- =========================================================================================================
--
--   1. VISUALIZAR EL N�MERO y PORCENTAJE DE LOS CIUDADANOS DE LOS ESTRATOS BAJOS  DE LOS PARTIDOS 
--   CONSERVADOR, LIBERAL Y POLO DEMOCRATICO QUE VOTARON (votantes) y los que NO VOTARON (abstencionistas), totalizando los resultados y 
--   ordenados por porcentaje descendentemente (2 PUNTOS)
--   Se debe clasificar los ciudadanos de acuerdo a este criterio
--   bajo (1,2)
--   medio (3,4)
--   alto (5,6)
--  ==========================================================================================================
-- 2. VISUALIZAR CUALES CANDIDATOS CON SU PARTIDO, OBTUVIERON EL MAXIMO PORCENTAJE DE VOTACIONES ORDENADO POR CANDIDATO (1 PUNTO)
--
-- ===========================================================================================================
-- 3.Cuales fueron las MESAS con el mayor numero de ciudadanos votantes (1 punto)

-- ======================================================================
-- 4.Cuales fueron los barrios con un alto n�mero de votantes ORDENADOS POR BARRIO (1 punto)
-- alto >=4
-- medio >=2 y < 4
-- bajo <=1 
-- =====================================================================
*/

/*
 * 2. VISUALIZAR CUALES CANDIDATOS CON SU PARTIDO, 
 * 	  OBTUVIERON EL MAXIMO PORCENTAJE DE VOTACIONES 
 *    ORDENADO POR CANDIDATO (1 PUNTO) 
 */

--
select nombre_can, nombre_par, count(*)*100/(select count(*) from votaciones) as porcentaje
from candidatos join partidos on partido=codigo_par 
	join votaciones on codigo_can=candidato_v
group by 1,2;

-- maximo
select max(t1.porcentaje)
from (select nombre_can, nombre_par, count(*)*100/(select count(*) from votaciones) as porcentaje
	from candidatos join partidos on partido=codigo_par 
		join votaciones on codigo_can=candidato_v
	group by 1,2) t1
	
-- final
select nombre_can, nombre_par, count(*)*100/(select count(*) from votaciones) as porcentaje
from candidatos join partidos on partido=codigo_par 
	join votaciones on codigo_can=candidato_v
group by 1,2
having count(*)*100/(select count(*) from votaciones) = 
	(select max(t1.porcentaje)
	from (select nombre_can, nombre_par, count(*)*100/(select count(*) from votaciones) as porcentaje
		from candidatos join partidos on partido=codigo_par 
			join votaciones on codigo_can=candidato_v
		group by 1,2) t1);

/*
 * 3.Cuales fueron las MESAS con el mayor numero de 
 *   ciudadanos votantes (1 punto)
 */
select descripcion_mes, count(ciudadano_v) as votos
from mesas join puestos on mesa_p=codigo_mes
	join ciudadanos on ciudadano_p=cedula_ciu
	join votaciones on cedula_ciu=ciudadano_v
group by 1;
--
select max(t1.votos)
from (select descripcion_mes, count(ciudadano_v) as votos
	from mesas join puestos on mesa_p=codigo_mes
		join ciudadanos on ciudadano_p=cedula_ciu
		join votaciones on cedula_ciu=ciudadano_v
	group by 1) t1
	
-- final
select descripcion_mes, count(ciudadano_v) as votos
from mesas join puestos on mesa_p=codigo_mes
	join ciudadanos on ciudadano_p=cedula_ciu
	join votaciones on cedula_ciu=ciudadano_v
group by 1
having  count(ciudadano_v) = (select max(t1.votos)
				from (select descripcion_mes, count(ciudadano_v) as votos
					from mesas join puestos on mesa_p=codigo_mes
						join ciudadanos on ciudadano_p=cedula_ciu
						join votaciones on cedula_ciu=ciudadano_v
					group by 1) t1);
/*
 * 4.Cuales fueron los barrios con un alto n�mero de 
 * votantes ORDENADOS POR BARRIO (1 punto)
 * 
 * alto >=4
 * medio >=2 y < 4
 * bajo <=1
 */
(select nombre_ba, count(candidato_v) as votos
from barrios join ciudadanos on codigo_ba=barrio_ciu
	join votaciones on cedula_ciu=ciudadano_v
group by 1);
--
select t1.nombre_ba , case when t1.votos >=4 then 'alto'
	   when t1.votos >=2 and 
			t1.votos <=4 then 'medio'
	   when t1.votos <=1 then 'bajo'
	   end as nivel
from (select nombre_ba, count(candidato_v) as votos
	from barrios join ciudadanos on codigo_ba=barrio_ciu
		join votaciones on cedula_ciu=ciudadano_v
	group by 1) t1;
-- final
select *
from (select t1.nombre_ba , case when t1.votos >=4 then 'alto'
			   when t1.votos >=2 and 
					t1.votos <=4 then 'medio'
			   when t1.votos <=1 then 'bajo'
			   end as nivel
		from (select nombre_ba, count(candidato_v) as votos
			from barrios join ciudadanos on codigo_ba=barrio_ciu
				join votaciones on cedula_ciu=ciudadano_v
			group by 1) t1) t2
where t2.nivel='alto'
order by 1;

/*
*1. VISUALIZAR EL N�MERO y PORCENTAJE DE LOS CIUDADANOS DE LOS 
*	ESTRATOS BAJOS  DE LOS PARTIDOS 
*	CONSERVADOR, LIBERAL Y POLO DEMOCRATICO 
*	QUE VOTARON (votantes) y los que NO VOTARON (abstencionistas), 
*	totalizando los resultados y 
*	ordenados por porcentaje descendentemente (2 PUNTOS)
*	Se debe clasificar los ciudadanos de acuerdo a este criterio
*	bajo (1,2)
*	medio (3,4)
*	alto (5,6)
*/
-- visualizar el numero y porcentaje de los estratos bajos de los partidos
--
-- total ciudadanos por niveles
select count(*)
from  (select *, case when estrato_ba in ('1','2') then 'bajo'
					when estrato_ba in ('3','4') then 'medio'
					when estrato_ba in ('5','6') then 'alto'
				  end nivel_est
		from ciudadanos join barrios on barrio_ciu=codigo_ba) t1
	join partidos on t1.partido_ciu=codigo_par
where t1.nivel_est='bajo' and (lower(nombre_par) like '%conservador%' or
	  lower(nombre_par) like '%liberal%' or
	  lower(nombre_par) like '%polo%democratico%');		
--
-- ciudadanos que votaron
--
select t1.nombre_ciu, 'Votante' as votante
from (ciudadanos join votaciones on cedula_ciu=ciudadano_v join barrios on barrio_ciu=codigo_ba join partidos on partido_ciu=codigo_par) t2
	join (select *, case when estrato_ba in ('1','2') then 'bajo'
					when estrato_ba in ('3','4') then 'medio'
					when estrato_ba in ('5','6') then 'alto'
				  end nivel_est
		from ciudadanos join barrios on barrio_ciu=codigo_ba) t1
	on t1.cedula_ciu=t2.cedula_ciu
where t1.nivel_est='bajo' and (lower(nombre_par) like '%conservador%' or
	  lower(nombre_par) like '%liberal%' or
	  lower(nombre_par) like '%polo%democratico%')
union 
select t1.nombre_ciu, 'Abstinente' as tipo_votante
from (ciudadanos join barrios on barrio_ciu=codigo_ba left join votaciones on cedula_ciu=ciudadano_v join partidos on partido_ciu=codigo_par) t2
		join (select *, case when estrato_ba in ('1','2') then 'bajo'
					when estrato_ba in ('3','4') then 'medio'
					when estrato_ba in ('5','6') then 'alto'
				  end nivel_est
				from ciudadanos join barrios on barrio_ciu=codigo_ba) t1
		on t1.cedula_ciu=t2.cedula_ciu
where ciudadano_v is null and t1.nivel_est='bajo' and
	(lower(nombre_par) like '%conservador%' or
	lower(nombre_par) like '%liberal%' or
	lower(nombre_par) like '%polo%democratico%');
----
/*
 * Final 
 */ 
select 'Abstinentes' as tipo_votante, count(*) as numero, count(*)*100/(select count(*)
	from  (select *, case when estrato_ba in ('1','2') then 'bajo'
						when estrato_ba in ('3','4') then 'medio'
						when estrato_ba in ('5','6') then 'alto'
					  end nivel_est
			from ciudadanos join barrios on barrio_ciu=codigo_ba) t1
		join partidos on t1.partido_ciu=codigo_par
	where t1.nivel_est='bajo' and (lower(nombre_par) like '%conservador%' or
		  lower(nombre_par) like '%liberal%' or
		  lower(nombre_par) like '%polo%democratico%')) as porcentaje
from (ciudadanos join barrios on barrio_ciu=codigo_ba left join votaciones on cedula_ciu=ciudadano_v join partidos on partido_ciu=codigo_par) t2
		join (select *, case when estrato_ba in ('1','2') then 'bajo'
					when estrato_ba in ('3','4') then 'medio'
					when estrato_ba in ('5','6') then 'alto'
				  end nivel_est
				from ciudadanos join barrios on barrio_ciu=codigo_ba) t1
		on t1.cedula_ciu=t2.cedula_ciu
where ciudadano_v is null and t1.nivel_est='bajo' and
	(lower(nombre_par) like '%conservador%' or
	lower(nombre_par) like '%liberal%' or
	lower(nombre_par) like '%polo%democratico%')
UNION
select 'Votantes' as tipo_votante, count(*), count(*)*100/(select count(*)
					from  (select *, case when estrato_ba in ('1','2') then 'bajo'
										when estrato_ba in ('3','4') then 'medio'
										when estrato_ba in ('5','6') then 'alto'
									  end nivel_est
							from ciudadanos join barrios on barrio_ciu=codigo_ba) t1
						join partidos on t1.partido_ciu=codigo_par
					where t1.nivel_est='bajo' and (lower(nombre_par) like '%conservador%' or
						  lower(nombre_par) like '%liberal%' or
						  lower(nombre_par) like '%polo%democratico%')) as porcentaje
from (ciudadanos join votaciones on cedula_ciu=ciudadano_v join barrios on barrio_ciu=codigo_ba join partidos on partido_ciu=codigo_par) t2
	join (select *, case when estrato_ba in ('1','2') then 'bajo'
					when estrato_ba in ('3','4') then 'medio'
					when estrato_ba in ('5','6') then 'alto'
				  end nivel_est
		from ciudadanos join barrios on barrio_ciu=codigo_ba) t1
	on t1.cedula_ciu=t2.cedula_ciu
where t1.nivel_est='bajo' and (lower(nombre_par) like '%conservador%' or
	  lower(nombre_par) like '%liberal%' or
	  lower(nombre_par) like '%polo%democratico%')
UNION
select 'Total' as tipo_votante, sum(t1.numero), sum(t1.porcentaje)
		from (select 'Abstinentes' as tipo_votante, count(*) as numero, count(*)*100/(select count(*)
			from  (select *, case when estrato_ba in ('1','2') then 'bajo'
								when estrato_ba in ('3','4') then 'medio'
								when estrato_ba in ('5','6') then 'alto'
							  end nivel_est
					from ciudadanos join barrios on barrio_ciu=codigo_ba) t1
				join partidos on t1.partido_ciu=codigo_par
			where t1.nivel_est='bajo' and (lower(nombre_par) like '%conservador%' or
				  lower(nombre_par) like '%liberal%' or
				  lower(nombre_par) like '%polo%democratico%')) as porcentaje
		from (ciudadanos join barrios on barrio_ciu=codigo_ba left join votaciones on cedula_ciu=ciudadano_v join partidos on partido_ciu=codigo_par) t2
				join (select *, case when estrato_ba in ('1','2') then 'bajo'
							when estrato_ba in ('3','4') then 'medio'
							when estrato_ba in ('5','6') then 'alto'
						  end nivel_est
						from ciudadanos join barrios on barrio_ciu=codigo_ba) t1
				on t1.cedula_ciu=t2.cedula_ciu
		where ciudadano_v is null and t1.nivel_est='bajo' and
			(lower(nombre_par) like '%conservador%' or
			lower(nombre_par) like '%liberal%' or
			lower(nombre_par) like '%polo%democratico%')
		UNION
		select 'Votantes' as tipo_votante, count(*), count(*)*100/(select count(*)
							from  (select *, case when estrato_ba in ('1','2') then 'bajo'
												when estrato_ba in ('3','4') then 'medio'
												when estrato_ba in ('5','6') then 'alto'
											  end nivel_est
									from ciudadanos join barrios on barrio_ciu=codigo_ba) t1
								join partidos on t1.partido_ciu=codigo_par
							where t1.nivel_est='bajo' and (lower(nombre_par) like '%conservador%' or
								  lower(nombre_par) like '%liberal%' or
								  lower(nombre_par) like '%polo%democratico%')) as porcentaje
		from (ciudadanos join votaciones on cedula_ciu=ciudadano_v join barrios on barrio_ciu=codigo_ba join partidos on partido_ciu=codigo_par) t2
			join (select *, case when estrato_ba in ('1','2') then 'bajo'
							when estrato_ba in ('3','4') then 'medio'
							when estrato_ba in ('5','6') then 'alto'
						  end nivel_est
				from ciudadanos join barrios on barrio_ciu=codigo_ba) t1
			on t1.cedula_ciu=t2.cedula_ciu
		where t1.nivel_est='bajo' and (lower(nombre_par) like '%conservador%' or
			  lower(nombre_par) like '%liberal%' or
			  lower(nombre_par) like '%polo%democratico%')) t1
order by 3 desc;

