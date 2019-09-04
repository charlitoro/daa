--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5
-- Dumped by pg_dump version 11.5

-- Started on 2019-09-04 08:16:21

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

SET default_with_oids = false;

--
-- TOC entry 196 (class 1259 OID 16394)
-- Name: barrios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.barrios (
    codbarrio character(3) NOT NULL,
    nombarrio character varying(30),
    estbarrio smallint,
    comuna smallint,
    CONSTRAINT chk_estbarrio CHECK ((estbarrio = ANY (ARRAY[1, 2, 3, 4, 5, 6])))
);


ALTER TABLE public.barrios OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 16398)
-- Name: ciudades; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ciudades (
    codciudad character(5) NOT NULL,
    nomciudad character varying(20),
    departamento character(2) NOT NULL
);


ALTER TABLE public.ciudades OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 16401)
-- Name: decanos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.decanos (
    coddecano character(2) NOT NULL,
    nomdecano character varying(40),
    facultad character(2) NOT NULL
);


ALTER TABLE public.decanos OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 16404)
-- Name: departamentos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departamentos (
    coddepto character(2) NOT NULL,
    nomdepto character varying(30)
);


ALTER TABLE public.departamentos OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16407)
-- Name: estudiantes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estudiantes (
    codestudiante character(4) NOT NULL,
    nomestudiante character varying(30) NOT NULL,
    edaestudiante smallint DEFAULT 0,
    fechestudiante date,
    sexestudiante character(1),
    barrio character(3) NOT NULL,
    ciudad character(5) NOT NULL,
    programa character(2) NOT NULL,
    CONSTRAINT chk_edaestudiante CHECK ((edaestudiante >= 0)),
    CONSTRAINT estudiantes_sexestudiante_check CHECK ((sexestudiante = ANY (ARRAY['F'::bpchar, 'M'::bpchar])))
);


ALTER TABLE public.estudiantes OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16413)
-- Name: facultades; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.facultades (
    codfacultad character(2) NOT NULL,
    nomfacultad character varying(30)
);


ALTER TABLE public.facultades OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16416)
-- Name: materias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.materias (
    codmateria character(2) NOT NULL,
    nommateria character varying(20),
    cremateria smallint DEFAULT 0
);


ALTER TABLE public.materias OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16420)
-- Name: profesores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profesores (
    codprofesor character(2) NOT NULL,
    nomprofesor character varying(30),
    catprofesor character(10)
);


ALTER TABLE public.profesores OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16423)
-- Name: programas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.programas (
    codprograma character(2) NOT NULL,
    nomprograma character varying(30),
    facultad character(2) NOT NULL
);


ALTER TABLE public.programas OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16426)
-- Name: regnotas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.regnotas (
    estudiante character(4) NOT NULL,
    materia character(2) NOT NULL,
    profesor character(2) NOT NULL,
    parcial1 numeric(3,1) DEFAULT 0,
    parcial2 numeric(3,1) DEFAULT 0,
    efinal numeric(3,1) DEFAULT 0,
    nfinal numeric(3,1) DEFAULT 0,
    estado character(1),
    CONSTRAINT regnotas_efinal_check CHECK (((efinal >= (0)::numeric) AND (efinal <= 5.0))),
    CONSTRAINT regnotas_parcial1_check CHECK (((parcial1 >= (0)::numeric) AND (parcial1 <= 5.0))),
    CONSTRAINT regnotas_parcial2_check CHECK (((parcial2 >= (0)::numeric) AND (parcial2 <= 5.0)))
);


ALTER TABLE public.regnotas OWNER TO postgres;

--
-- TOC entry 2899 (class 0 OID 16394)
-- Dependencies: 196
-- Data for Name: barrios; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.barrios (codbarrio, nombarrio, estbarrio, comuna) VALUES ('101', 'El Churo', 1, 1);
INSERT INTO public.barrios (codbarrio, nombarrio, estbarrio, comuna) VALUES ('102', 'Aire Libre', 2, 1);
INSERT INTO public.barrios (codbarrio, nombarrio, estbarrio, comuna) VALUES ('200', 'Atahualpa', 3, 2);
INSERT INTO public.barrios (codbarrio, nombarrio, estbarrio, comuna) VALUES ('201', 'Fátima', 2, 2);
INSERT INTO public.barrios (codbarrio, nombarrio, estbarrio, comuna) VALUES ('202', 'Caicedonia', 1, 2);
INSERT INTO public.barrios (codbarrio, nombarrio, estbarrio, comuna) VALUES ('300', 'El Ejido', 1, 3);
INSERT INTO public.barrios (codbarrio, nombarrio, estbarrio, comuna) VALUES ('301', 'Los Pinos', 3, 3);
INSERT INTO public.barrios (codbarrio, nombarrio, estbarrio, comuna) VALUES ('302', 'Popular', 1, 3);
INSERT INTO public.barrios (codbarrio, nombarrio, estbarrio, comuna) VALUES ('400', 'Miraflores', 3, 4);
INSERT INTO public.barrios (codbarrio, nombarrio, estbarrio, comuna) VALUES ('401', 'Doce de Octubre', 1, 4);
INSERT INTO public.barrios (codbarrio, nombarrio, estbarrio, comuna) VALUES ('402', 'El Tejar', 2, 4);
INSERT INTO public.barrios (codbarrio, nombarrio, estbarrio, comuna) VALUES ('500', 'Cantarana', 1, 5);
INSERT INTO public.barrios (codbarrio, nombarrio, estbarrio, comuna) VALUES ('501', 'Bachue', 4, 5);
INSERT INTO public.barrios (codbarrio, nombarrio, estbarrio, comuna) VALUES ('502', 'Agualongo', 3, 5);
INSERT INTO public.barrios (codbarrio, nombarrio, estbarrio, comuna) VALUES ('600', 'Niza', 4, 6);
INSERT INTO public.barrios (codbarrio, nombarrio, estbarrio, comuna) VALUES ('601', 'Sumatambo', 3, 6);
INSERT INTO public.barrios (codbarrio, nombarrio, estbarrio, comuna) VALUES ('602', 'El Bosque', 5, 6);
INSERT INTO public.barrios (codbarrio, nombarrio, estbarrio, comuna) VALUES ('700', 'San Ignacio', 4, 7);
INSERT INTO public.barrios (codbarrio, nombarrio, estbarrio, comuna) VALUES ('701', 'Las Acacias', 5, 7);
INSERT INTO public.barrios (codbarrio, nombarrio, estbarrio, comuna) VALUES ('702', 'San Felipe', 3, 7);
INSERT INTO public.barrios (codbarrio, nombarrio, estbarrio, comuna) VALUES ('800', 'Las Margaritas', 5, 8);
INSERT INTO public.barrios (codbarrio, nombarrio, estbarrio, comuna) VALUES ('801', 'Mariluz', 3, 8);
INSERT INTO public.barrios (codbarrio, nombarrio, estbarrio, comuna) VALUES ('802', 'Quintas de San Pedro', 4, 8);
INSERT INTO public.barrios (codbarrio, nombarrio, estbarrio, comuna) VALUES ('900', 'Morasurco', 6, 9);
INSERT INTO public.barrios (codbarrio, nombarrio, estbarrio, comuna) VALUES ('901', 'El Aljibe', 4, 9);
INSERT INTO public.barrios (codbarrio, nombarrio, estbarrio, comuna) VALUES ('902', 'Briceño', 6, 9);
INSERT INTO public.barrios (codbarrio, nombarrio, estbarrio, comuna) VALUES ('100', 'San Andrés', 3, 1);


--
-- TOC entry 2900 (class 0 OID 16398)
-- Dependencies: 197
-- Data for Name: ciudades; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ciudades (codciudad, nomciudad, departamento) VALUES ('91001', 'Leticia', '91');
INSERT INTO public.ciudades (codciudad, nomciudad, departamento) VALUES ('05001', 'Medellín', '05');
INSERT INTO public.ciudades (codciudad, nomciudad, departamento) VALUES ('81001', 'Arauca', '81');
INSERT INTO public.ciudades (codciudad, nomciudad, departamento) VALUES ('08001', 'Barranquílla', '08');
INSERT INTO public.ciudades (codciudad, nomciudad, departamento) VALUES ('13001', 'Cartagena', '13');
INSERT INTO public.ciudades (codciudad, nomciudad, departamento) VALUES ('15001', 'Tunja', '15');
INSERT INTO public.ciudades (codciudad, nomciudad, departamento) VALUES ('17001', 'Manizales', '17');
INSERT INTO public.ciudades (codciudad, nomciudad, departamento) VALUES ('18001', 'Florencia', '18');
INSERT INTO public.ciudades (codciudad, nomciudad, departamento) VALUES ('85001', 'Yopal', '85');
INSERT INTO public.ciudades (codciudad, nomciudad, departamento) VALUES ('19001', 'Popayán', '19');
INSERT INTO public.ciudades (codciudad, nomciudad, departamento) VALUES ('20001', 'Valledupar', '20');
INSERT INTO public.ciudades (codciudad, nomciudad, departamento) VALUES ('27001', 'Quibdó', '27');
INSERT INTO public.ciudades (codciudad, nomciudad, departamento) VALUES ('23001', 'Montería', '23');
INSERT INTO public.ciudades (codciudad, nomciudad, departamento) VALUES ('25001', 'Bogotá', '25');
INSERT INTO public.ciudades (codciudad, nomciudad, departamento) VALUES ('94001', 'Inírida', '94');
INSERT INTO public.ciudades (codciudad, nomciudad, departamento) VALUES ('95001', 'San José de Guaviare', '95');
INSERT INTO public.ciudades (codciudad, nomciudad, departamento) VALUES ('41001', 'Neiva', '41');
INSERT INTO public.ciudades (codciudad, nomciudad, departamento) VALUES ('44001', 'Riohacha', '44');
INSERT INTO public.ciudades (codciudad, nomciudad, departamento) VALUES ('47001', 'Santa Marta', '47');
INSERT INTO public.ciudades (codciudad, nomciudad, departamento) VALUES ('50001', 'Villavicencio', '50');
INSERT INTO public.ciudades (codciudad, nomciudad, departamento) VALUES ('52001', 'Pasto', '52');
INSERT INTO public.ciudades (codciudad, nomciudad, departamento) VALUES ('54001', 'Cúcuta', '54');
INSERT INTO public.ciudades (codciudad, nomciudad, departamento) VALUES ('86001', 'Mocoa', '86');
INSERT INTO public.ciudades (codciudad, nomciudad, departamento) VALUES ('63001', 'Armenia', '63');
INSERT INTO public.ciudades (codciudad, nomciudad, departamento) VALUES ('66001', 'Pereira', '66');
INSERT INTO public.ciudades (codciudad, nomciudad, departamento) VALUES ('88001', 'San Andrés', '88');
INSERT INTO public.ciudades (codciudad, nomciudad, departamento) VALUES ('68001', 'Bucaramanga', '68');
INSERT INTO public.ciudades (codciudad, nomciudad, departamento) VALUES ('70001', 'Sincelejo', '70');
INSERT INTO public.ciudades (codciudad, nomciudad, departamento) VALUES ('73001', 'Ibagué', '73');
INSERT INTO public.ciudades (codciudad, nomciudad, departamento) VALUES ('76001', 'Cali', '76');
INSERT INTO public.ciudades (codciudad, nomciudad, departamento) VALUES ('97001', 'Mitú', '97');
INSERT INTO public.ciudades (codciudad, nomciudad, departamento) VALUES ('99001', 'Puerto Carreño', '99');


--
-- TOC entry 2901 (class 0 OID 16401)
-- Dependencies: 198
-- Data for Name: decanos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.decanos (coddecano, nomdecano, facultad) VALUES ('11', 'Hugo Ferney Leonel', '11');
INSERT INTO public.decanos (coddecano, nomdecano, facultad) VALUES ('16', 'Ayda Paulina Davila Solarte ', '16');
INSERT INTO public.decanos (coddecano, nomdecano, facultad) VALUES ('20', 'William Albarracin Hernández', '20');
INSERT INTO public.decanos (coddecano, nomdecano, facultad) VALUES ('19', 'Eduardo Delio Gómez', '19');
INSERT INTO public.decanos (coddecano, nomdecano, facultad) VALUES ('15', 'Hernn Abdon García', '15');
INSERT INTO public.decanos (coddecano, nomdecano, facultad) VALUES ('12', 'Ana Patricia Palacios Montenegro', '12');
INSERT INTO public.decanos (coddecano, nomdecano, facultad) VALUES ('14', 'María Elena Eraso Coral', '14');
INSERT INTO public.decanos (coddecano, nomdecano, facultad) VALUES ('18', 'Nelson Torres Vega', '18');
INSERT INTO public.decanos (coddecano, nomdecano, facultad) VALUES ('17', 'Leonardo A. Enriquez Martinez', '17');
INSERT INTO public.decanos (coddecano, nomdecano, facultad) VALUES ('13', 'Jorgue Guido Pantoja Rodriguez', '13');
INSERT INTO public.decanos (coddecano, nomdecano, facultad) VALUES ('10', 'Gerardo Hernando Sanchez Delgado', '10');


--
-- TOC entry 2902 (class 0 OID 16404)
-- Dependencies: 199
-- Data for Name: departamentos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.departamentos (coddepto, nomdepto) VALUES ('05', 'ANTIOQUIA');
INSERT INTO public.departamentos (coddepto, nomdepto) VALUES ('08', 'ATLANTICO');
INSERT INTO public.departamentos (coddepto, nomdepto) VALUES ('11', 'BOGOTA');
INSERT INTO public.departamentos (coddepto, nomdepto) VALUES ('13', 'BOLIVAR');
INSERT INTO public.departamentos (coddepto, nomdepto) VALUES ('15', 'BOYACA');
INSERT INTO public.departamentos (coddepto, nomdepto) VALUES ('17', 'CALDAS');
INSERT INTO public.departamentos (coddepto, nomdepto) VALUES ('18', 'CAQUETA');
INSERT INTO public.departamentos (coddepto, nomdepto) VALUES ('19', 'CAUCA');
INSERT INTO public.departamentos (coddepto, nomdepto) VALUES ('20', 'CESAR');
INSERT INTO public.departamentos (coddepto, nomdepto) VALUES ('23', 'CORDOBA');
INSERT INTO public.departamentos (coddepto, nomdepto) VALUES ('25', 'CUNDINAMARCA');
INSERT INTO public.departamentos (coddepto, nomdepto) VALUES ('27', 'CHOCO');
INSERT INTO public.departamentos (coddepto, nomdepto) VALUES ('41', 'HUILA');
INSERT INTO public.departamentos (coddepto, nomdepto) VALUES ('44', 'LA GUAJIRA');
INSERT INTO public.departamentos (coddepto, nomdepto) VALUES ('47', 'MAGDALENA');
INSERT INTO public.departamentos (coddepto, nomdepto) VALUES ('50', 'META');
INSERT INTO public.departamentos (coddepto, nomdepto) VALUES ('52', 'NARIÑO');
INSERT INTO public.departamentos (coddepto, nomdepto) VALUES ('54', 'N. DE SANTANDER');
INSERT INTO public.departamentos (coddepto, nomdepto) VALUES ('63', 'QUINDIO');
INSERT INTO public.departamentos (coddepto, nomdepto) VALUES ('66', 'RISARALDA');
INSERT INTO public.departamentos (coddepto, nomdepto) VALUES ('68', 'SANTANDER');
INSERT INTO public.departamentos (coddepto, nomdepto) VALUES ('70', 'SUCRE');
INSERT INTO public.departamentos (coddepto, nomdepto) VALUES ('73', 'TOLIMA');
INSERT INTO public.departamentos (coddepto, nomdepto) VALUES ('76', 'VALLE DEL CAUCA');
INSERT INTO public.departamentos (coddepto, nomdepto) VALUES ('81', 'ARAUCA');
INSERT INTO public.departamentos (coddepto, nomdepto) VALUES ('85', 'CASANARE');
INSERT INTO public.departamentos (coddepto, nomdepto) VALUES ('86', 'PUTUMAYO');
INSERT INTO public.departamentos (coddepto, nomdepto) VALUES ('88', 'SAN ANDRES');
INSERT INTO public.departamentos (coddepto, nomdepto) VALUES ('91', 'AMAZONAS');
INSERT INTO public.departamentos (coddepto, nomdepto) VALUES ('94', 'GUAINIA');
INSERT INTO public.departamentos (coddepto, nomdepto) VALUES ('95', 'GUAVIARE');
INSERT INTO public.departamentos (coddepto, nomdepto) VALUES ('97', 'VAUPES');
INSERT INTO public.departamentos (coddepto, nomdepto) VALUES ('99', 'VICHADA');


--
-- TOC entry 2903 (class 0 OID 16407)
-- Dependencies: 200
-- Data for Name: estudiantes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('1000', 'Oscar Arteaga', 18, '2001-05-12', 'M', '100', '52001', '01');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('1100', 'Gonzalo Bedoya', 19, '2000-01-23', 'M', '101', '76001', '01');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('1200', 'Giovanni Bolaños', 20, '1999-02-10', 'M', '102', '25001', '01');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('1300', 'Yineth Noguera', 21, '1998-03-12', 'F', '200', '05001', '01');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('1400', 'Diana Marin', 22, '1997-04-04', 'F', '201', '08001', '01');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('1500', 'Jeson España', 23, '1996-01-12', 'M', '202', '19001', '11');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('1600', 'Karen Gómez', 24, '1995-05-30', 'F', '700', '86001', '11');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('1700', 'Guillermo Pantoja', 25, '1994-06-15', 'M', '800', '52001', '11');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('1800', 'Keneth Portilla', 26, '1993-09-13', 'M', '900', '76001', '11');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('1900', 'Alejandra Rojas', 18, '2001-01-11', 'F', '902', '25001', '11');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('7000', 'Pablo Vazquez', 18, '2001-03-21', 'M', '100', '05001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('7001', 'Carla Ortiz', 19, '2000-01-14', 'F', '101', '08001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('7002', 'Carolina Moreno', 20, '1998-10-02', 'F', '102', '19001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('7003', 'Tomas Ortega', 21, '1998-02-15', 'M', '200', '86001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('7004', 'Ignacio Hernandez', 22, '1997-04-29', 'M', '201', '52001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('7005', 'Arturo Ortiz', 23, '1995-11-24', 'M', '202', '76001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('7006', 'Pablo Morales', 24, '1994-12-13', 'M', '700', '25001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('7007', 'Daniela Peña', 25, '1994-05-12', 'F', '800', '05001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('7008', 'Carolina Bravo', 26, '1992-06-12', 'F', '900', '08001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('7009', 'Valeria Fuentes', 18, '2001-02-17', 'F', '902', '19001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('7010', 'Marcos Castro', 19, '1999-06-19', 'M', '100', '86001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('7011', 'Marina Castillo', 20, '1999-01-10', 'F', '101', '52001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('7012', 'Teresa Reyes', 21, '1997-09-11', 'F', '102', '76001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('7013', 'Guillermo Garcia', 22, '1997-02-06', 'M', '200', '25001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('7014', 'Helena Perez', 23, '1995-08-10', 'F', '201', '05001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('7015', 'Érika Delgado', 24, '1994-12-30', 'F', '202', '08001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('7016', 'Alexandra Peña', 25, '1993-09-22', 'F', '700', '19001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('7017', 'Jorge Blanco', 26, '1992-08-16', 'M', '800', '86001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('7018', 'Arturo Casas', 18, '2000-08-25', 'M', '900', '52001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('7019', 'Isabel Muñoz ', 19, '2000-04-01', 'F', '902', '76001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('7020', 'Javier Lopez ', 20, '1999-03-29', 'M', '100', '25001', '21');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('7021', 'Iván Diaz', 21, '1997-11-24', 'M', '101', '05001', '21');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('7022', 'Jesús Hernandez', 22, '1996-09-03', 'M', '102', '08001', '21');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('7023', 'Adriana Dominguez ', 23, '1995-08-24', 'F', '200', '19001', '21');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('7024', 'Patricia Herrera', 24, '1994-10-19', 'F', '201', '86001', '21');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('7025', 'Joaquín Cabrera ', 25, '1993-07-28', 'M', '202', '52001', '81');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('7026', 'Valeria Delgado ', 26, '1992-09-01', 'F', '700', '76001', '81');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('7027', 'Sandra Rubio', 18, '2001-03-14', 'F', '800', '25001', '81');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('7028', 'Sofía Delgado', 19, '2000-05-18', 'F', '900', '05001', '81');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('7029', 'Eduardo Lozano', 20, '1998-12-13', 'M', '902', '08001', '81');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('8000', 'Cristian Sanchez', 18, '2001-02-23', 'M', '100', '52001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('8001', 'Samuel Perez', 19, '2000-01-01', 'M', '101', '76001', '54');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('8002', 'José Ferrer', 20, '1999-05-18', 'M', '102', '25001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('8003', 'Beatriz Mora', 21, '1998-10-05', 'F', '200', '05001', '54');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('8004', 'Valeria Nuñez', 22, '1997-05-30', 'F', '201', '08001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('8005', 'Marta Pujol', 23, '1996-06-22', 'F', '202', '19001', '54');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('8006', 'Mireia Gimenez', 24, '1995-02-21', 'F', '700', '86001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('8007', 'Silvia Moreno', 25, '1994-12-25', 'F', '800', '52001', '54');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('8008', 'Diego Herrera', 26, '1993-01-18', 'M', '900', '76001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('8009', 'Carla Marquez', 18, '2001-01-08', 'F', '902', '25001', '54');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('8010', 'Arnau Aguilar', 19, '2000-04-17', 'M', '100', '05001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('8011', 'Asier Pujol', 20, '1999-06-06', 'M', '101', '08001', '71');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('8012', 'Celia Herrera', 21, '1998-09-13', 'F', '102', '19001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('8013', 'Omar Rovira', 22, '1997-10-12', 'M', '200', '86001', '71');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('8014', 'Marina Martin', 23, '1996-03-15', 'F', '201', '52001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('8015', 'Adrián Fernandez', 24, '1995-08-22', 'M', '202', '76001', '71');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('8016', 'Adrián Bosch', 25, '1994-06-09', 'M', '700', '25001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('8017', 'Berta Ferrer', 26, '1993-09-27', 'F', '800', '05001', '71');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('8018', 'Saray Fuentes', 18, '2001-02-11', 'F', '900', '08001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('8019', 'Laia Romero', 19, '2000-01-08', 'F', '902', '19001', '71');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('8020', 'Lucas Garrido', 20, '1999-11-14', 'M', '100', '86001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('8021', 'Silvia Nuñez', 21, '1998-06-27', 'F', '101', '52001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('8022', 'Manuel Cano', 22, '1997-12-15', 'M', '102', '76001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('8023', 'Alexia Herrera', 23, '1996-05-13', 'F', '200', '25001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('8024', 'Óliver Perez', 24, '1995-03-08', 'M', '201', '05001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('8025', 'Andrea Iglesias', 25, '1994-06-27', 'F', '202', '08001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('8026', 'Eduardo Caballero', 26, '1993-07-16', 'M', '700', '19001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('8027', 'Inés Vargas', 18, '2001-04-11', 'F', '800', '86001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('8028', 'Silvia Tomas', 19, '2000-08-09', 'F', '900', '52001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('8029', 'Ismael Melo', 20, '1999-08-23', 'M', '902', '76001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('7500', 'Jesús Pascual', 18, '2001-03-11', 'M', '100', '52001', '21');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('7501', 'Diana Vargas', 19, '2000-06-09', 'F', '101', '76001', '21');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('7502', 'Arnau Nuñez', 20, '1999-05-22', 'M', '102', '25001', '21');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('7503', 'Mikel Costa', 21, '1998-04-13', 'M', '200', '05001', '21');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('7504', 'Nuria Pascual', 22, '1997-11-10', 'F', '201', '08001', '21');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('7505', 'Iris Leon', 23, '1996-11-09', 'F', '202', '19001', '41');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('7506', 'Cristina Ruiz', 24, '1995-02-25', 'F', '700', '86001', '41');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('7507', 'Saúl Cruz', 25, '1994-01-06', 'M', '800', '52001', '41');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('7508', 'Rocío Cabrera', 26, '1993-09-08', 'F', '900', '76001', '41');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('7509', 'Diego Perrera', 18, '2001-03-12', 'M', '902', '25001', '41');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('7510', 'Luis Nuñez', 19, '2000-10-22', 'M', '100', '05001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('7511', 'Eva Mora', 20, '1999-07-24', 'F', '101', '08001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('7512', 'Marcos Moreno', 21, '1998-03-14', 'M', '102', '19001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('7513', 'Isaac Vila', 22, '1997-08-17', 'M', '200', '86001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('7514', 'Julia Costa', 23, '1996-11-06', 'F', '201', '52001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('7515', 'Olivia Sanchez', 24, '1995-05-12', 'F', '202', '76001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('7516', 'Aitana Moya', 25, '1994-01-15', 'F', '700', '25001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('7517', 'Diego Medina', 26, '1993-06-16', 'M', '800', '05001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('7518', 'Alba Jimenez', 18, '2001-09-20', 'F', '900', '08001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('7519', 'Omar Hidalgo', 19, '2000-04-27', 'M', '902', '19001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('7520', 'Pablo Parra', 20, '1999-11-23', 'M', '100', '86001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('7521', 'Carmen Ruiz', 21, '1998-02-13', 'F', '101', '52001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('7522', 'Marcos Ferrer', 22, '1997-01-22', 'M', '102', '76001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('7523', 'Rubén Navarro', 23, '1996-07-11', 'M', '200', '25001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('7524', 'Beatriz Carmona', 24, '1995-04-09', 'F', '201', '05001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('7525', 'Cristina Pascual', 25, '1994-07-23', 'F', '202', '08001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('7526', 'Anna Cabrera', 26, '1993-02-13', 'F', '700', '19001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('7527', 'Ángel Gutierrez', 18, '2001-03-17', 'M', '800', '86001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('7528', 'Jana Lozano', 19, '2000-11-26', 'F', '900', '52001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('7529', 'Ian Mendez', 20, '1999-07-28', 'M', '902', '76001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('9800', 'Fredery Gomez', 18, '2001-02-02', 'M', '100', '52001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('9801', 'Ruth Pinchao', 19, '2000-01-01', 'F', '101', '76001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('9802', 'Wilson Arteaga', 20, '1999-01-20', 'M', '102', '25001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('9803', 'Laura Vallejos', 21, '1998-03-25', 'F', '200', '05001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('9804', 'Wilmer Rubio', 22, '1997-04-30', 'M', '201', '08001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('9805', 'Sandra Guerrero', 23, '1996-02-03', 'F', '202', '19001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('9806', 'Pablo Escobar', 24, '1995-05-02', 'M', '700', '86001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('9807', 'Estela Florez', 25, '1995-01-02', 'F', '800', '52001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('9808', 'Alejandro Melo', 26, '1993-02-27', 'M', '900', '76001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('9809', 'Alba Morales', 18, '2001-03-29', 'F', '902', '25001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('9810', 'Cristian Escobar', 19, '2000-04-12', 'M', '100', '05001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('9811', 'Maria Villareal', 20, '1999-05-10', 'F', '101', '08001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('9812', 'Rodman Salas', 21, '1998-03-11', 'M', '102', '19001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('9813', 'Jimena Coral', 22, '1997-02-07', 'F', '200', '86001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('9814', 'Byron Patiño', 23, '1996-05-15', 'M', '201', '52001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('9815', 'Tania Bolaños', 24, '1995-04-04', 'F', '202', '76001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('9816', 'Jose Bustos', 25, '1994-01-10', 'M', '700', '25001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('9817', 'Tatiana Luna', 26, '1993-02-06', 'F', '800', '05001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('9818', 'Orlando Diaz', 18, '2001-03-02', 'M', '900', '08001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('9819', 'Lucia Castrillon', 19, '2000-03-08', 'F', '902', '19001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('9820', 'Ricardo Chamorro', 20, '1999-05-16', 'M', '100', '86001', '64');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('9821', 'Isbelia Arteaga', 21, '1998-04-17', 'F', '101', '52001', '64');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('9822', 'David Insandara', 22, '1997-04-20', 'M', '102', '76001', '64');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('9823', 'Dayana Almeida', 23, '1996-05-12', 'F', '200', '25001', '64');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('9824', 'Duvan Malua', 24, '1995-01-21', 'M', '201', '05001', '64');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('9825', 'Daniela Bravo', 25, '1994-01-22', 'F', '202', '08001', '81');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('9826', 'Franco Castro', 26, '1993-02-26', 'M', '700', '19001', '81');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('9827', 'Lorena Acosta', 18, '2001-02-11', 'F', '800', '86001', '81');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('9828', 'Camilo Pantoja', 19, '2000-05-19', 'M', '900', '52001', '81');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('9829', 'Alexandra Ordoñes', 20, '1999-03-05', 'F', '902', '76001', '81');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('6800', 'Ana Gómez', 23, '1996-04-21', 'F', '100', '52001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('6801', 'Amanda Muñoz', 21, '1998-08-04', 'F', '101', '76001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('6802', 'Leonardo Lopez', 23, '1997-05-22', 'M', '102', '25001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('6803', 'Esteban Urbano', 20, '1999-03-20', 'M', '200', '08001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('6804', 'Arley Gallardo', 24, '1995-09-15', 'M', '201', '05001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('6805', 'Natalia Solarte', 18, '2001-03-13', 'F', '202', '19001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('6806', 'Daniel Toro', 21, '1998-02-10', 'F', '700', '86001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('6807', 'Francisco Delgado', 23, '1996-10-23', 'M', '800', '52001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('6808', 'Camila Coronel', 22, '1997-05-02', 'F', '900', '76001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('6809', 'Javier Toro', 26, '1993-07-17', 'F', '902', '25001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('6810', 'Eduardo Guerrero', 25, '1994-11-09', 'M', '100', '08001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('6811', 'Segundo Gómez', 23, '1996-06-16', 'M', '101', '05001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('6812', 'Tomas Ordoñez', 20, '1999-04-18', 'M', '102', '19001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('6813', 'Oscar Gómez', 22, '1997-08-27', 'M', '200', '86001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('6814', 'Maria Buesaquillo', 23, '1996-01-23', 'F', '201', '52001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('6815', 'Ostin Hernández', 24, '1995-05-04', 'M', '202', '76001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('6816', 'Diego Melo', 22, '1997-10-12', 'M', '700', '25001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('6817', 'Sebastian Delgado', 25, '1995-08-03', 'M', '800', '08001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('6818', 'Milena Martinez', 24, '1995-03-27', 'F', '900', '05001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('6819', 'Sandra Coronel', 22, '1997-02-18', 'F', '902', '19001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('6820', 'Libardo Muñoz', 22, '1997-12-07', 'M', '100', '86001', '55');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('6821', 'Sara Muñoz', 23, '1996-12-17', 'F', '101', '52001', '55');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('6822', 'Edgar Lopez', 21, '1998-06-22', 'M', '102', '76001', '55');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('6823', 'Manuel Chavez', 21, '1998-04-05', 'M', '200', '25001', '55');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('6824', 'Soria Mafla', 22, '1997-11-21', 'F', '201', '08001', '55');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('6825', 'Daniela Jurado', 19, '2000-03-07', 'F', '202', '05001', '21');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('6826', 'David Guerrero', 18, '2001-08-24', 'M', '700', '19001', '21');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('6827', 'Pedro Delgado', 20, '1999-02-20', 'M', '800', '86001', '21');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('6828', 'Hugo Flores', 18, '2001-09-09', 'M', '900', '52001', '21');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('6829', 'Ana Burbano', 19, '2000-12-30', 'F', '902', '76001', '21');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('9500', 'sofia diaz', 18, '2001-02-01', 'F', '100', '52001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('9501', 'laura marcela ortiz', 19, '2000-03-20', 'F', '101', '76001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('9502', 'santiago guerrero', 20, '1999-04-29', 'M', '102', '25001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('9503', 'angelica fernandez', 21, '1998-05-15', 'F', '200', '05001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('9504', 'wilson carrillo', 22, '1997-06-13', 'M', '201', '08001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('9505', 'carlos gaviria', 23, '1996-07-17', 'M', '202', '19001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('9506', 'alejandro moreno', 24, '1995-08-15', 'M', '700', '86001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('9507', 'lizeth montilla', 25, '1994-09-09', 'F', '800', '52001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('9508', 'jessica linares', 26, '1993-10-30', 'F', '900', '76001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('9509', 'valeria cabrera', 18, '2001-11-12', 'F', '901', '25001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('9510', 'ivana castillos rodrigues', 19, '2000-12-31', 'F', '901', '05001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('9511', 'andrea arteaga bolaños', 20, '1999-01-07', 'F', '100', '08001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('9512', 'daniela leyton', 21, '1998-02-14', 'F', '101', '19001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('9513', 'alejandra españa', 22, '1997-01-31', 'F', '102', '86001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('9514', 'sofia timana', 23, '1996-04-18', 'F', '200', '52001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('9515', 'daniel osejo', 24, '1995-05-17', 'M', '201', '76001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('9516', 'veronica arturo', 25, '1994-06-03', 'F', '202', '25001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('9517', 'leydi palacios', 26, '1993-07-04', 'F', '700', '05001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('9518', 'natalia jurado', 18, '2001-08-09', 'F', '800', '08001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('9519', 'leonardo coral', 19, '2000-09-16', 'M', '900', '19001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('9520', 'david burbano', 20, '1999-10-21', 'M', '902', '86001', '11');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('9521', 'gabriel revelo', 21, '1998-11-28', 'M', '100', '52001', '11');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('9522', 'gabriela botina', 22, '1997-12-31', 'F', '101', '76001', '11');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('9523', 'fabiana parra', 23, '1996-01-05', 'F', '102', '25001', '11');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('9524', 'david ortega', 24, '1995-02-02', 'M', '200', '05001', '11');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('9525', 'sebastian revelo', 25, '1994-03-01', 'M', '201', '08001', '61');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('9526', 'karolina garzon', 26, '1993-04-19', 'F', '202', '19001', '61');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('9527', 'dayanna costanza', 18, '2001-05-20', 'F', '700', '86001', '61');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('9528', 'valentina garces', 19, '2000-06-13', 'F', '800', '52001', '61');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('9529', 'sylvana acosta', 20, '1999-07-26', 'F', '900', '76001', '61');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('2300', 'Karen Lopez', 18, '2001-01-08', 'F', '100', '52001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('2301', 'Javier Cabrera', 19, '2000-03-20', 'M', '101', '76001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('2302', 'Juan Cardona', 20, '1999-04-29', 'M', '102', '25001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('2303', 'Lizeth Montilla', 21, '1998-05-15', 'F', '200', '05001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('2304', 'Cristian Lescobar', 22, '1997-06-13', 'M', '201', '08001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('2305', 'Juan Villota', 23, '1996-07-17', 'M', '202', '19001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('2306', 'Juliana Revelo', 24, '1995-08-15', 'F', '700', '86001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('2307', 'Tatiana Rosero', 25, '1994-09-09', 'F', '800', '52001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('2308', 'Gabriela Leon', 26, '1993-10-30', 'F', '900', '76001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('2309', 'Ana Polanco', 18, '2001-11-12', 'F', '902', '25001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('2310', 'Johan Matituy', 19, '2000-12-31', 'M', '902', '05001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('2311', 'Maria Ceballos', 20, '1999-01-07', 'F', '100', '08001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('2312', 'Valentina Eraso', 21, '1998-02-14', 'F', '101', '19001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('2313', 'Natalia Romo', 22, '1997-01-31', 'F', '102', '86001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('2314', 'Salome Delgado', 23, '1996-04-18', 'F', '200', '52001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('2315', 'Valeria Suarez', 24, '1995-05-17', 'M', '201', '76001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('2316', 'Karoll Salazar', 25, '1994-06-03', 'F', '202', '25001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('2317', 'Neider Enriquez', 26, '1993-07-04', 'M', '700', '05001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('2318', 'Luisa Palacios', 18, '2001-08-09', 'F', '800', '08001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('2319', 'Juan Arellano', 19, '2000-09-16', 'M', '900', '19001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('2320', 'Karina Ramirez', 20, '1999-10-21', 'F', '902', '86001', '11');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('2321', 'Gabriel Benavides', 21, '1998-11-28', 'M', '100', '52001', '11');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('2322', 'Marlon Puello', 22, '1997-12-31', 'M', '101', '76001', '11');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('2323', 'Juan Manuel Ortega', 23, '1996-01-05', 'M', '102', '25001', '11');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('2324', 'Pablo Rivera', 24, '1995-02-02', 'M', '200', '05001', '11');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('2325', 'Jhon Salazar', 25, '1994-03-01', 'M', '201', '08001', '61');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('2326', 'Leslie Hernandez', 26, '1993-04-19', 'F', '202', '19001', '61');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('2327', 'Estefania Pantoja', 18, '2001-05-20', 'F', '700', '86001', '61');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('2328', 'Dario Bravo', 19, '2000-06-13', 'M', '800', '52001', '61');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('2329', 'Manuel Gustin', 20, '1999-07-26', 'M', '900', '76001', '61');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('4300', 'Ivan Montes', 18, '2008-12-31', 'M', '100', '52001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('4301', 'Ruben Diaz', 19, '2002-04-11', 'M', '101', '76001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('4302', 'Alberto  Garcia', 18, '2005-07-21', 'M', '102', '25001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('4303', 'Amparo  Torres', 21, '2007-03-12', 'F', '200', '05001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('4304', 'Ana  Rodríguez', 22, '2001-01-25', 'F', '201', '08001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('4305', 'Angel Aldeguer', 23, '2010-02-28', 'M', '202', '19001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('4306', 'Juan Serrano', 24, '2011-04-10', 'M', '700', '86001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('4307', 'Luis Chazarra', 25, '2002-05-12', 'M', '800', '52001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('4308', 'Enrique Maldonado', 26, '2012-11-12', 'M', '900', '76001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('4309', 'Esther Martinez', 18, '2006-04-14', 'F', '902', '25001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('4310', 'Carlos Llorente', 19, '2009-02-12', 'M', '100', '05001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('4311', 'Cristian Benavides', 20, '2013-05-12', 'M', '101', '08001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('4312', 'Cristina de la fuente', 21, '2004-02-05', 'F', '102', '19001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('4313', 'Eduardo Albaladejo', 22, '2001-05-14', 'M', '200', '86001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('4314', 'Javier Manzanaro', 23, '2016-03-01', 'M', '201', '52001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('4315', 'Emilio Albaladejo', 24, '2017-05-28', 'M', '202', '76001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('4316', 'Esther Diaz', 25, '2008-05-12', 'F', '700', '25001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('4317', 'Esther Fernandez', 26, '2009-03-30', 'F', '800', '05001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('4318', 'Felipe Mendez', 18, '2014-02-21', 'M', '900', '08001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('4319', 'Fernanda Bastidas', 19, '2006-06-18', 'F', '902', '19001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('4320', 'Fernando Albaladejo', 20, '2001-05-12', 'M', '100', '86001', '02');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('4321', 'Gerardo Ruano', 21, '2015-06-12', 'M', '101', '52001', '02');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('4322', 'Helena Griñan', 22, '2005-04-02', 'F', '102', '76001', '02');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('4323', 'Irene Tejada', 23, '2012-06-12', 'F', '200', '25001', '02');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('4324', 'Maria Ortiz', 24, '2012-12-11', 'F', '201', '05001', '02');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('4325', 'Antonio Alonso', 25, '2015-12-13', 'M', '202', '08001', '55');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('4326', 'Antonio Alarcon', 26, '2004-06-12', 'M', '700', '19001', '55');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('4327', 'Berta Monteliu', 18, '2001-06-12', 'F', '800', '86001', '55');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('4328', 'Carmen  Montesinos', 19, '2003-04-11', 'F', '900', '52001', '55');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('4329', 'Cecilia jaramillo', 20, '2015-06-16', 'F', '902', '76001', '55');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('5000', 'Milvia Benitez', 18, '2001-03-05', 'F', '100', '52001', '03');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('5001', 'Rober Caicedo', 19, '2000-02-11', 'M', '101', '76001', '03');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('5002', 'Angie Diaz', 20, '1999-11-10', 'F', '102', '25001', '03');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('5003', 'Camila Arévalo', 21, '1998-01-01', 'F', '200', '05001', '03');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('5004', 'Meliza Moreno', 22, '1997-10-04', 'F', '201', '08001', '03');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('5005', 'Julio Escobar', 23, '1996-02-02', 'M', '202', '19001', '57');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('5006', 'Edwin Pineda', 24, '1995-05-29', 'M', '700', '86001', '57');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('5007', 'Angie Paredes', 25, '1994-02-28', 'F', '800', '52001', '57');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('5008', 'Karol Pineda', 26, '1993-05-31', 'F', '900', '76001', '57');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('5009', 'Diana Ortega', 18, '2001-01-07', 'F', '902', '25001', '57');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('5010', 'Juan Bravo', 19, '2000-10-08', 'M', '100', '05001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('5011', 'Oscar Iguad', 20, '1999-12-07', 'M', '101', '08001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('5012', 'Eduardo Mora', 21, '1998-02-09', 'M', '102', '19001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('5013', 'Ana Molina', 22, '1997-03-13', 'F', '200', '86001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('5014', 'Rosa España', 23, '1996-06-04', 'F', '201', '52001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('5015', 'Brayan Botina', 24, '1995-03-19', 'M', '202', '76001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('5016', 'Sofía Suarez', 25, '1994-05-01', 'F', '700', '25001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('5017', 'Erika Valencia', 26, '1993-09-19', 'F', '800', '05001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('5018', 'Jesús Bastidas', 18, '2001-08-20', 'M', '900', '08001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('5019', 'Esteban Sánchez', 19, '2000-10-08', 'M', '902', '19001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('5020', 'Yorlady Salazar', 20, '1999-01-06', 'F', '100', '86001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('5021', 'Joaquín Arteaga', 21, '1998-02-07', 'M', '101', '52001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('5022', 'Daniela Perez', 22, '1997-03-08', 'F', '102', '76001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('5023', 'Nicol Nasmuta', 23, '1996-04-09', 'F', '200', '25001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('5024', 'Pablo Paredes', 24, '1995-05-10', 'M', '201', '05001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('5025', 'Pedro Sanchez', 25, '1994-06-11', 'M', '202', '08001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('5026', 'Paola Tobar', 26, '1993-07-12', 'F', '700', '19001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('5027', 'María Lombana', 18, '2001-08-13', 'F', '800', '86001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('5028', 'Felipe Muñoz', 19, '2000-09-14', 'M', '900', '52001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('5029', 'Sonia Ortiz', 20, '1999-12-30', 'F', '902', '76001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('6000', 'Juan Guerra', 18, '2001-07-13', 'M', '100', '52001', '63');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('6001', 'Cristhian Bastidas', 19, '2000-02-07', 'M', '101', '76001', '63');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('6002', 'Indira Santacruz', 20, '1999-08-22', 'F', '102', '25001', '63');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('6003', 'Jorge Sanchez', 21, '1998-01-02', 'M', '200', '05001', '63');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('6004', 'Carolina Martinez', 22, '1997-07-17', 'F', '201', '08001', '63');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('6005', 'Daniel Guerrero', 23, '1996-03-30', 'M', '202', '19001', '13');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('6006', 'Daniela Betancourt', 24, '1995-05-28', 'F', '700', '86001', '13');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('6007', 'Tatiana Delgado', 25, '1994-12-30', 'F', '800', '52001', '13');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('6008', 'Camilo Noguera', 26, '1993-04-27', 'M', '900', '76001', '13');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('6009', 'Lizeth Pantoja', 18, '2001-01-23', 'F', '902', '25001', '13');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('6010', 'Luisa Restrepo', 19, '2000-04-02', 'F', '100', '05001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('6011', 'Daniela Quiroz', 20, '1999-05-22', 'F', '101', '08001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('6012', 'Miller Reina', 21, '1998-08-07', 'M', '102', '19001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('6013', 'Andres Narvaez', 22, '1997-10-08', 'M', '200', '86001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('6014', 'Jhonathan Santacruz', 23, '1996-12-25', 'M', '201', '52001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('6015', 'Sebastian Portilla', 24, '1995-01-13', 'M', '202', '76001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('6016', 'Katherine Goyes', 25, '1994-05-12', 'F', '700', '25001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('6017', 'Alexander Saavedra', 26, '1993-10-19', 'M', '800', '05001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('6018', 'Jorge Montenegro', 18, '2001-01-29', 'M', '900', '08001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('6019', 'Isabel Vallejo', 19, '2000-12-30', 'F', '902', '19001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('6020', 'Cristian Ortega', 20, '1999-11-20', 'M', '100', '86001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('6021', 'Kevin Timaran', 21, '1998-07-23', 'M', '101', '52001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('6022', 'Fernando Gomez', 22, '1997-09-12', 'M', '102', '76001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('6023', 'Marcela Riascos', 23, '1996-04-14', 'F', '200', '25001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('6024', 'Diana Portilla', 24, '1995-06-10', 'F', '201', '05001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('6025', 'Sebastian Diaz', 25, '1994-09-25', 'M', '202', '08001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('6026', 'James Grijalba', 26, '1993-11-23', 'M', '700', '19001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('6027', 'Wilson Tobar', 18, '2001-05-27', 'M', '800', '86001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('6028', 'Luisa Guerrero', 19, '2000-03-06', 'F', '900', '52001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('6029', 'David Andrade', 20, '1999-10-01', 'M', '902', '76001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('3800', 'Alejandro useche', 18, '2001-12-12', 'M', '100', '52001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('3801', 'Sandra Caicedo', 19, '2000-07-08', 'F', '101', '76001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('3802', 'Yesenia Landazury', 20, '1999-05-31', 'F', '102', '25001', '41');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('3803', 'Diana Torres', 21, '1998-06-06', 'F', '200', '05001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('3804', 'Manuel Cuero', 22, '1997-09-14', 'M', '201', '08001', '35');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('3805', 'Nicolas Cabezas', 23, '1996-09-24', 'M', '202', '19001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('3806', 'Jose Valencia', 24, '1995-07-16', 'M', '700', '86001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('3807', 'Elizabeth Castro', 25, '1994-11-08', 'M', '800', '52001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('3808', 'Melina Castillo', 26, '1993-04-28', 'M', '900', '76001', '41');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('3809', 'Javier Torres', 18, '2001-01-12', 'M', '902', '25001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('3810', 'Laura Coral', 19, '2000-07-28', 'F', '100', '25001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('3811', 'Yeison Agreda', 20, '1999-02-02', 'M', '101', '52001', '35');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('3812', 'Vanessa Caicedo', 21, '1998-12-30', 'F', '102', '19001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('3813', 'Gustavo Caicedo', 22, '1997-03-24', 'M', '200', '52001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('3814', 'Hetty Valencia', 23, '1996-04-01', 'F', '201', '25001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('3815', 'Sara Mendoza', 24, '1995-08-09', 'F', '202', '05001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('3816', 'Nicole Hinestroza', 25, '1994-08-08', 'F', '700', '52001', '35');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('3817', 'Brayan Olmedo', 26, '1993-01-01', 'M', '800', '25001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('3818', 'Ingrid España', 18, '2001-02-13', 'F', '900', '05001', '35');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('3819', 'Maria Delgado', 19, '2000-11-17', 'F', '902', '76001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('3820', 'Emir Caicedo', 20, '1999-08-23', 'F', '100', '19001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('3821', 'Mario Barreiro', 21, '1998-08-08', 'M', '101', '86001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('3822', 'Daniel Martinez', 22, '1997-12-08', 'M', '102', '19001', '35');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('3823', 'Jackson Valencia', 23, '1996-07-09', 'M', '200', '05001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('3824', 'David Hernandez', 24, '1995-09-10', 'M', '201', '86001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('3825', 'Alejandra Jaramillo', 25, '1994-09-14', 'F', '202', '86001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('3826', 'Duvan Bernal', 26, '1993-05-30', 'M', '700', '05001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('3827', 'Katherine Duque', 18, '2001-03-15', 'F', '800', '76001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('3828', 'Fernanda Calzada', 19, '2000-04-26', 'F', '900', '08001', '91');
INSERT INTO public.estudiantes (codestudiante, nomestudiante, edaestudiante, fechestudiante, sexestudiante, barrio, ciudad, programa) VALUES ('3829', 'Diego Salcedo', 20, '1999-09-21', 'M', '902', '76001', '41');


--
-- TOC entry 2904 (class 0 OID 16413)
-- Dependencies: 201
-- Data for Name: facultades; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.facultades (codfacultad, nomfacultad) VALUES ('10', 'Artes');
INSERT INTO public.facultades (codfacultad, nomfacultad) VALUES ('11', 'Ciencias Agrícolas');
INSERT INTO public.facultades (codfacultad, nomfacultad) VALUES ('12', 'Ciencias de la Salud');
INSERT INTO public.facultades (codfacultad, nomfacultad) VALUES ('13', 'Ciencias Económicas Admin.');
INSERT INTO public.facultades (codfacultad, nomfacultad) VALUES ('14', 'Ciencias Humanas');
INSERT INTO public.facultades (codfacultad, nomfacultad) VALUES ('15', 'Ciencias Exactas y Naturales');
INSERT INTO public.facultades (codfacultad, nomfacultad) VALUES ('16', 'Ciencias Pecuarias');
INSERT INTO public.facultades (codfacultad, nomfacultad) VALUES ('17', 'Derecho');
INSERT INTO public.facultades (codfacultad, nomfacultad) VALUES ('18', 'Educación');
INSERT INTO public.facultades (codfacultad, nomfacultad) VALUES ('19', 'Ingeniería');
INSERT INTO public.facultades (codfacultad, nomfacultad) VALUES ('20', 'Ingeniería Agroindustrial');


--
-- TOC entry 2905 (class 0 OID 16416)
-- Dependencies: 202
-- Data for Name: materias; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.materias (codmateria, nommateria, cremateria) VALUES ('01', 'Bases de Datos', 4);
INSERT INTO public.materias (codmateria, nommateria, cremateria) VALUES ('02', 'Ing. de Software', 3);
INSERT INTO public.materias (codmateria, nommateria, cremateria) VALUES ('03', 'Programación O-O', 4);
INSERT INTO public.materias (codmateria, nommateria, cremateria) VALUES ('04', 'Algoritmia', 3);
INSERT INTO public.materias (codmateria, nommateria, cremateria) VALUES ('05', 'TGS', 2);
INSERT INTO public.materias (codmateria, nommateria, cremateria) VALUES ('06', 'Calculo', 5);
INSERT INTO public.materias (codmateria, nommateria, cremateria) VALUES ('07', 'Estructura Datos', 3);
INSERT INTO public.materias (codmateria, nommateria, cremateria) VALUES ('08', 'Centros Cómputo', 2);
INSERT INTO public.materias (codmateria, nommateria, cremateria) VALUES ('09', 'Telemática', 3);
INSERT INTO public.materias (codmateria, nommateria, cremateria) VALUES ('10', 'Física', 4);


--
-- TOC entry 2906 (class 0 OID 16420)
-- Dependencies: 203
-- Data for Name: profesores; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.profesores (codprofesor, nomprofesor, catprofesor) VALUES ('01', 'Ricardo Timarán', 'Titular   ');
INSERT INTO public.profesores (codprofesor, nomprofesor, catprofesor) VALUES ('02', 'Alexander Barón', 'Asociado  ');
INSERT INTO public.profesores (codprofesor, nomprofesor, catprofesor) VALUES ('03', 'Gonzalo Hernández', 'Asistente ');
INSERT INTO public.profesores (codprofesor, nomprofesor, catprofesor) VALUES ('04', 'Nelson Jaramillo', 'Asistente ');
INSERT INTO public.profesores (codprofesor, nomprofesor, catprofesor) VALUES ('05', 'Delio Gómez', 'Asistente ');
INSERT INTO public.profesores (codprofesor, nomprofesor, catprofesor) VALUES ('06', 'Luis Jimenez', 'Asociado  ');
INSERT INTO public.profesores (codprofesor, nomprofesor, catprofesor) VALUES ('07', 'Manuel Bolaños', 'Asistente ');
INSERT INTO public.profesores (codprofesor, nomprofesor, catprofesor) VALUES ('08', 'Carlos Rodriguez', 'Auxiliar  ');
INSERT INTO public.profesores (codprofesor, nomprofesor, catprofesor) VALUES ('09', 'Juan Carlos Castillo', 'Asociado  ');
INSERT INTO public.profesores (codprofesor, nomprofesor, catprofesor) VALUES ('10', 'Jaime Rodriguez', 'Auxiliar  ');


--
-- TOC entry 2907 (class 0 OID 16423)
-- Dependencies: 204
-- Data for Name: programas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.programas (codprograma, nomprograma, facultad) VALUES ('01', 'Arquitectura', '10');
INSERT INTO public.programas (codprograma, nomprograma, facultad) VALUES ('02', 'Diseño Gráfico', '10');
INSERT INTO public.programas (codprograma, nomprograma, facultad) VALUES ('03', 'Lic. en Música', '10');
INSERT INTO public.programas (codprograma, nomprograma, facultad) VALUES ('04', 'Diseño Industrial', '10');
INSERT INTO public.programas (codprograma, nomprograma, facultad) VALUES ('05', 'Lic. en Artes Visuales', '10');
INSERT INTO public.programas (codprograma, nomprograma, facultad) VALUES ('06', 'Artes Visuales', '10');
INSERT INTO public.programas (codprograma, nomprograma, facultad) VALUES ('11', 'Ingeniería Agroforestal', '11');
INSERT INTO public.programas (codprograma, nomprograma, facultad) VALUES ('12', 'Ingeniería Agronómica', '11');
INSERT INTO public.programas (codprograma, nomprograma, facultad) VALUES ('13', 'Ingeniería Ambiental', '11');
INSERT INTO public.programas (codprograma, nomprograma, facultad) VALUES ('21', 'Medicina', '12');
INSERT INTO public.programas (codprograma, nomprograma, facultad) VALUES ('22', 'Promoción de la Salud', '12');
INSERT INTO public.programas (codprograma, nomprograma, facultad) VALUES ('31', 'Administración de Empresas', '13');
INSERT INTO public.programas (codprograma, nomprograma, facultad) VALUES ('32', 'Comercio Internacional', '13');
INSERT INTO public.programas (codprograma, nomprograma, facultad) VALUES ('33', 'Contaduría Publica', '13');
INSERT INTO public.programas (codprograma, nomprograma, facultad) VALUES ('34', 'Economía', '13');
INSERT INTO public.programas (codprograma, nomprograma, facultad) VALUES ('35', 'Mercadeo', '13');
INSERT INTO public.programas (codprograma, nomprograma, facultad) VALUES ('41', 'Geografía', '14');
INSERT INTO public.programas (codprograma, nomprograma, facultad) VALUES ('51', 'Lic. en Ciencias Sociales', '14');
INSERT INTO public.programas (codprograma, nomprograma, facultad) VALUES ('52', 'Lic. en Español e Inglés', '14');
INSERT INTO public.programas (codprograma, nomprograma, facultad) VALUES ('53', 'Lic. en Educación Básica', '14');
INSERT INTO public.programas (codprograma, nomprograma, facultad) VALUES ('54', 'Lic. en Filosofía y Letras', '14');
INSERT INTO public.programas (codprograma, nomprograma, facultad) VALUES ('55', 'Lic. en Inglés y Francés', '14');
INSERT INTO public.programas (codprograma, nomprograma, facultad) VALUES ('56', 'Lic. en Lenguas Extranjeras', '14');
INSERT INTO public.programas (codprograma, nomprograma, facultad) VALUES ('57', 'Psicología', '14');
INSERT INTO public.programas (codprograma, nomprograma, facultad) VALUES ('58', 'Sociología', '14');
INSERT INTO public.programas (codprograma, nomprograma, facultad) VALUES ('61', 'Biología', '15');
INSERT INTO public.programas (codprograma, nomprograma, facultad) VALUES ('62', 'Física', '15');
INSERT INTO public.programas (codprograma, nomprograma, facultad) VALUES ('63', 'Lic. en Informática', '15');
INSERT INTO public.programas (codprograma, nomprograma, facultad) VALUES ('64', 'Lic. en Matemáticas', '15');
INSERT INTO public.programas (codprograma, nomprograma, facultad) VALUES ('65', 'Química', '15');
INSERT INTO public.programas (codprograma, nomprograma, facultad) VALUES ('71', 'Ing. Acuícola', '16');
INSERT INTO public.programas (codprograma, nomprograma, facultad) VALUES ('72', 'Medicina Veterinaria', '16');
INSERT INTO public.programas (codprograma, nomprograma, facultad) VALUES ('73', 'Zootecnia', '16');
INSERT INTO public.programas (codprograma, nomprograma, facultad) VALUES ('81', 'Derecho', '17');
INSERT INTO public.programas (codprograma, nomprograma, facultad) VALUES ('85', 'Lic.en Lengua Castellana', '18');
INSERT INTO public.programas (codprograma, nomprograma, facultad) VALUES ('86', 'Lic. en Ciencias Naturales', '18');
INSERT INTO public.programas (codprograma, nomprograma, facultad) VALUES ('91', 'Ingeniería de Sistemas', '19');
INSERT INTO public.programas (codprograma, nomprograma, facultad) VALUES ('92', 'Ingeniería Electrónica', '19');
INSERT INTO public.programas (codprograma, nomprograma, facultad) VALUES ('93', 'Ingeniería Civil', '19');
INSERT INTO public.programas (codprograma, nomprograma, facultad) VALUES ('95', 'Ingeniería Agroindustrial', '20');


--
-- TOC entry 2908 (class 0 OID 16426)
-- Dependencies: 205
-- Data for Name: regnotas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9801', '05', '05', 5.0, 2.0, 3.2, 3.4, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9801', '06', '06', 2.6, 4.1, 3.1, 3.3, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9802', '07', '07', 3.8, 3.8, 3.4, 3.6, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9802', '08', '08', 1.2, 2.0, 3.0, 2.2, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9802', '09', '09', 1.7, 4.0, 3.5, 3.1, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9803', '10', '10', 4.0, 3.9, 4.5, 4.2, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9803', '01', '01', 2.5, 2.6, 3.0, 2.7, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9803', '02', '02', 5.0, 5.0, 1.0, 3.4, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9804', '03', '03', 3.4, 3.2, 3.6, 3.4, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9804', '04', '04', 4.3, 1.2, 5.0, 3.7, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9804', '05', '05', 1.2, 3.0, 4.0, 2.9, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9805', '06', '06', 2.3, 2.1, 3.4, 2.7, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9805', '07', '07', 5.0, 4.1, 2.3, 3.7, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9805', '08', '08', 2.3, 1.2, 3.1, 2.3, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9806', '09', '09', 3.5, 3.1, 3.4, 3.3, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9806', '10', '10', 2.0, 2.5, 3.6, 2.8, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9806', '01', '01', 1.3, 2.4, 4.5, 2.9, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9807', '02', '02', 2.3, 4.1, 3.2, 3.2, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9807', '03', '03', 1.2, 2.5, 4.0, 2.7, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9807', '04', '04', 0.0, 5.0, 2.9, 2.7, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9808', '05', '05', 2.8, 2.7, 3.5, 3.1, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9808', '06', '06', 3.7, 2.9, 3.4, 3.3, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9808', '07', '07', 0.3, 3.5, 4.9, 3.1, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9809', '08', '08', 2.7, 3.6, 2.8, 3.0, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9809', '09', '09', 3.6, 2.4, 4.7, 3.7, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9809', '10', '10', 1.9, 2.4, 3.5, 2.7, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9810', '01', '01', 2.0, 3.9, 2.3, 2.7, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9810', '02', '02', 4.8, 3.9, 3.4, 4.0, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9810', '03', '03', 4.5, 4.5, 4.0, 4.3, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9811', '04', '04', 2.9, 3.6, 4.8, 3.9, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9811', '05', '05', 1.4, 3.0, 2.7, 2.4, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9811', '06', '06', 3.0, 4.1, 3.1, 3.4, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9812', '07', '07', 4.1, 3.4, 1.4, 2.8, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9812', '08', '08', 3.0, 3.0, 2.9, 3.0, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9812', '09', '09', 2.7, 3.6, 3.8, 3.4, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9813', '10', '10', 1.9, 4.2, 3.7, 3.3, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9813', '01', '01', 3.9, 4.1, 4.3, 4.1, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9813', '02', '02', 2.0, 2.2, 2.4, 2.2, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9814', '03', '03', 2.6, 3.0, 3.4, 3.0, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9814', '04', '04', 3.6, 3.7, 3.7, 3.7, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9814', '05', '05', 3.4, 2.6, 1.0, 2.2, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9815', '06', '06', 3.1, 2.4, 4.9, 3.6, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9815', '07', '07', 1.0, 2.4, 2.8, 2.1, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9815', '08', '08', 2.9, 3.1, 3.3, 3.1, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9816', '09', '09', 3.3, 3.6, 3.9, 3.6, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9816', '10', '10', 4.1, 4.9, 4.5, 4.5, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9816', '01', '01', 1.5, 1.9, 2.5, 2.0, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9817', '02', '02', 3.4, 2.7, 2.0, 2.6, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9817', '03', '03', 3.7, 3.4, 3.0, 3.3, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9817', '04', '04', 2.6, 3.7, 4.0, 3.5, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9818', '05', '05', 1.3, 1.6, 2.9, 2.0, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9818', '06', '06', 2.5, 2.8, 3.2, 2.9, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9818', '07', '07', 4.1, 4.3, 4.5, 4.3, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9819', '08', '08', 3.5, 3.7, 3.9, 3.7, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9819', '09', '09', 1.4, 1.7, 4.0, 2.5, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9819', '10', '10', 3.1, 3.7, 3.4, 3.4, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('1000', '02', '02', 4.5, 4.4, 4.3, 4.4, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('1000', '03', '03', 3.7, 2.1, 3.2, 3.0, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('1100', '04', '04', 4.0, 4.0, 4.0, 4.0, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('1100', '06', '06', 3.4, 3.6, 3.2, 3.4, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('1200', '07', '07', 4.9, 4.1, 4.2, 4.4, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('1200', '08', '08', 3.5, 3.2, 3.3, 3.3, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('1200', '09', '09', 3.8, 5.0, 4.0, 4.2, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('1400', '03', '03', 4.5, 4.3, 4.2, 4.3, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('1400', '04', '04', 3.2, 3.3, 3.3, 3.3, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('1500', '06', '06', 3.0, 3.0, 3.0, 3.0, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('1600', '09', '09', 4.0, 4.5, 3.0, 3.8, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('1600', '10', '10', 3.2, 3.4, 3.3, 3.3, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('1600', '01', '01', 4.5, 4.3, 4.1, 4.3, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('1700', '03', '03', 4.5, 2.3, 3.5, 3.4, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('1700', '04', '04', 2.8, 3.5, 3.1, 3.1, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('1800', '05', '05', 3.1, 3.3, 3.2, 3.2, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('1800', '06', '06', 4.2, 4.0, 4.1, 4.1, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('1900', '08', '08', 4.2, 2.1, 2.9, 3.1, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('1900', '09', '09', 3.3, 3.6, 3.5, 3.5, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('1000', '01', '01', 2.5, 2.7, 2.4, 2.5, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('1100', '05', '05', 3.2, 2.1, 2.0, 2.4, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('1300', '10', '10', 2.3, 2.3, 2.3, 2.3, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('1300', '01', '01', 1.8, 1.9, 2.4, 2.1, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('1300', '02', '02', 1.3, 2.5, 2.4, 2.1, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('1400', '05', '05', 2.0, 2.1, 2.2, 2.1, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('1500', '07', '07', 2.0, 2.4, 2.5, 2.3, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('1500', '08', '08', 3.0, 2.1, 2.2, 2.4, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('1700', '02', '02', 2.5, 2.8, 3.0, 2.8, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('1800', '07', '07', 2.3, 2.9, 2.8, 2.7, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('1900', '10', '10', 2.3, 2.6, 2.9, 2.6, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9820', '01', '01', 1.0, 4.5, 3.1, 2.9, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9820', '02', '02', 2.9, 3.9, 1.9, 2.8, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9820', '03', '03', 4.5, 3.5, 2.5, 3.4, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9821', '04', '04', 1.5, 0.5, 1.5, 1.2, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9821', '05', '05', 2.8, 3.2, 3.5, 3.2, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9821', '06', '06', 3.8, 4.2, 4.5, 4.2, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9822', '07', '07', 1.2, 1.4, 2.6, 1.8, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9822', '08', '08', 4.1, 2.8, 1.4, 2.6, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9822', '09', '09', 3.4, 2.7, 3.9, 3.4, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9823', '10', '10', 2.8, 1.9, 4.1, 3.1, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9823', '01', '01', 3.5, 2.1, 4.3, 3.4, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9823', '02', '02', 1.9, 3.8, 3.5, 3.1, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9824', '03', '03', 1.4, 2.6, 4.7, 3.1, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9824', '04', '04', 3.1, 4.2, 5.0, 4.2, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9824', '05', '05', 2.9, 3.4, 3.5, 3.3, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9825', '06', '06', 1.6, 3.1, 1.4, 2.0, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9825', '07', '07', 5.0, 4.5, 4.0, 4.5, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9825', '08', '08', 4.9, 4.8, 4.7, 4.8, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9826', '09', '09', 1.0, 3.0, 5.0, 3.2, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9826', '10', '10', 1.5, 3.4, 1.7, 2.2, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9826', '01', '01', 3.0, 1.4, 3.6, 2.8, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9827', '02', '02', 3.7, 4.2, 3.6, 3.8, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9827', '03', '03', 2.8, 2.4, 2.0, 2.4, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9827', '04', '04', 1.6, 1.4, 2.3, 1.8, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9828', '05', '05', 2.4, 2.6, 2.5, 2.5, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9828', '06', '06', 3.1, 2.5, 4.1, 3.3, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9828', '07', '07', 4.5, 4.6, 4.0, 4.3, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9829', '08', '08', 0.4, 5.0, 1.5, 2.2, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9829', '09', '09', 2.0, 1.3, 2.4, 2.0, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9829', '10', '10', 3.5, 2.0, 2.2, 2.5, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5000', '01', '01', 2.9, 1.6, 1.2, 1.8, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5000', '02', '02', 4.6, 4.4, 4.4, 4.5, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5000', '03', '03', 2.9, 1.7, 4.0, 3.0, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5001', '04', '04', 4.1, 1.0, 3.1, 2.8, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5001', '05', '05', 2.6, 1.3, 1.8, 1.9, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5001', '06', '06', 3.9, 4.3, 4.0, 4.1, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5002', '07', '07', 1.5, 4.0, 1.1, 2.1, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5002', '08', '08', 4.4, 1.0, 4.3, 3.3, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5002', '09', '09', 2.8, 4.6, 1.4, 2.8, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5003', '10', '10', 3.9, 1.3, 3.9, 3.1, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5003', '01', '01', 2.1, 2.0, 2.1, 2.1, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5003', '02', '02', 5.0, 5.0, 4.7, 4.9, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5004', '03', '03', 4.7, 4.2, 2.1, 3.5, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5004', '04', '04', 3.4, 1.0, 1.9, 2.1, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5004', '05', '05', 2.4, 3.2, 4.0, 3.3, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5005', '06', '06', 4.9, 4.8, 1.6, 3.6, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5005', '07', '07', 5.0, 3.8, 3.5, 4.0, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5005', '08', '08', 1.3, 1.4, 4.9, 2.8, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5006', '09', '09', 4.7, 1.4, 3.1, 3.1, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5006', '10', '10', 3.7, 2.6, 4.6, 3.7, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5006', '01', '01', 4.1, 3.5, 4.3, 4.0, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5007', '02', '02', 1.8, 2.3, 2.7, 2.3, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5007', '03', '03', 4.4, 1.1, 5.0, 3.7, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5007', '04', '04', 2.5, 3.9, 3.9, 3.5, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5008', '05', '05', 2.4, 5.0, 3.1, 3.5, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5008', '06', '06', 3.5, 1.5, 2.5, 2.5, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5008', '07', '07', 3.1, 2.5, 3.1, 2.9, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5009', '08', '08', 3.6, 3.9, 1.6, 2.9, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5009', '09', '09', 4.2, 3.1, 4.5, 4.0, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5009', '10', '10', 4.7, 4.8, 1.3, 3.4, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5010', '01', '01', 3.5, 4.2, 1.2, 2.8, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5010', '02', '02', 3.0, 2.9, 1.1, 2.2, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5010', '03', '03', 3.7, 3.2, 3.3, 3.4, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5011', '04', '04', 2.5, 1.7, 4.1, 2.9, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5011', '05', '05', 3.2, 2.7, 2.6, 2.8, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5011', '06', '06', 4.4, 4.9, 3.2, 4.1, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5012', '07', '07', 3.6, 4.9, 3.2, 3.8, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5012', '08', '08', 3.5, 2.8, 2.7, 3.0, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5012', '09', '09', 3.2, 1.6, 1.7, 2.1, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5013', '10', '10', 3.7, 4.0, 1.9, 3.1, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5013', '01', '01', 1.4, 1.7, 2.2, 1.8, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5013', '02', '02', 2.3, 2.8, 1.3, 2.1, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5014', '03', '03', 1.9, 1.7, 3.2, 2.4, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5014', '04', '04', 3.7, 4.6, 4.6, 4.3, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5014', '05', '05', 2.6, 4.9, 2.7, 3.3, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5015', '06', '06', 1.6, 2.9, 4.6, 3.2, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5015', '07', '07', 4.3, 5.0, 4.1, 4.4, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5015', '08', '08', 2.3, 3.6, 3.6, 3.2, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5016', '09', '09', 2.7, 4.5, 4.5, 4.0, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5016', '10', '10', 1.7, 4.7, 4.6, 3.8, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5016', '01', '01', 2.8, 3.8, 1.6, 2.6, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5017', '02', '02', 3.5, 4.6, 4.6, 4.3, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5017', '03', '03', 1.4, 5.0, 3.5, 3.3, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5017', '04', '04', 3.5, 1.1, 2.8, 2.5, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5018', '05', '05', 3.0, 4.6, 2.8, 3.4, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5018', '06', '06', 2.7, 3.0, 1.7, 2.4, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5018', '07', '07', 3.6, 1.5, 3.8, 3.1, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5019', '08', '08', 3.2, 3.3, 2.2, 2.8, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5019', '09', '09', 4.1, 4.7, 2.1, 3.5, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5019', '10', '10', 4.8, 3.3, 3.5, 3.8, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5020', '01', '01', 1.4, 2.3, 1.6, 1.8, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5020', '02', '02', 4.5, 3.8, 2.8, 3.6, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5020', '03', '03', 1.1, 2.0, 1.6, 1.6, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5021', '04', '04', 2.1, 3.4, 3.3, 3.0, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5021', '05', '05', 2.1, 1.5, 1.3, 1.6, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5021', '06', '06', 1.2, 1.6, 4.7, 2.7, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5022', '07', '07', 4.7, 2.3, 4.2, 3.8, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5022', '08', '08', 4.6, 2.9, 4.8, 4.2, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5022', '09', '09', 4.0, 1.2, 1.3, 2.1, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5023', '10', '10', 1.3, 1.7, 4.7, 2.8, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5023', '01', '01', 5.0, 2.7, 3.4, 3.7, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5023', '02', '02', 3.5, 1.8, 3.0, 2.8, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5024', '03', '03', 2.7, 1.7, 2.4, 2.3, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5024', '04', '04', 4.9, 2.1, 3.3, 3.4, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5024', '05', '05', 4.2, 3.6, 3.3, 3.7, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5025', '06', '06', 1.2, 2.9, 3.2, 2.5, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5025', '07', '07', 2.1, 3.7, 4.8, 3.7, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5025', '08', '08', 1.4, 1.4, 4.4, 2.6, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5026', '09', '09', 1.3, 3.5, 5.0, 3.4, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5026', '10', '10', 4.4, 2.2, 4.4, 3.7, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5026', '01', '01', 1.5, 3.2, 4.8, 3.3, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5027', '02', '02', 2.7, 2.2, 2.3, 2.4, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5027', '03', '03', 2.7, 2.3, 4.5, 3.3, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5027', '04', '04', 2.6, 4.7, 3.6, 3.6, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5028', '05', '05', 3.3, 1.8, 5.0, 3.5, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5028', '06', '06', 3.6, 4.1, 2.3, 3.2, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5028', '07', '07', 1.3, 3.9, 4.7, 3.4, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5029', '08', '08', 3.4, 4.0, 1.6, 2.9, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5029', '09', '09', 3.5, 4.9, 2.0, 3.3, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('5029', '10', '10', 4.1, 3.7, 2.3, 3.3, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6000', '01', '01', 3.9, 2.6, 2.2, 2.8, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6000', '02', '02', 0.5, 4.0, 1.6, 2.0, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6000', '03', '03', 4.8, 2.1, 3.7, 3.6, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6001', '04', '04', 1.8, 4.0, 4.6, 3.6, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6001', '05', '05', 4.4, 4.7, 3.1, 4.0, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6001', '06', '06', 1.7, 3.4, 4.6, 3.4, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6002', '07', '07', 2.0, 4.7, 4.4, 3.8, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6002', '08', '08', 4.5, 2.6, 4.8, 4.1, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6002', '09', '09', 1.9, 3.2, 3.6, 3.0, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6003', '10', '10', 1.6, 2.2, 2.2, 2.0, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6003', '01', '01', 2.5, 4.0, 4.8, 3.9, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6003', '02', '02', 4.4, 4.2, 1.1, 3.0, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6004', '03', '03', 3.4, 3.4, 3.0, 3.2, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6004', '04', '04', 3.1, 3.7, 2.8, 3.2, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6004', '05', '05', 1.4, 3.5, 2.0, 2.3, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6005', '06', '06', 2.6, 2.3, 4.1, 3.1, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6005', '07', '07', 2.5, 2.1, 2.3, 2.3, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6005', '08', '08', 4.4, 2.2, 2.0, 2.8, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6006', '09', '09', 4.8, 3.7, 4.9, 4.5, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6006', '10', '10', 4.6, 3.6, 2.4, 3.4, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6006', '01', '01', 1.1, 3.8, 1.2, 2.0, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6007', '02', '02', 3.3, 2.4, 2.4, 2.7, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6007', '03', '03', 3.8, 2.5, 2.6, 2.9, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6007', '04', '04', 0.2, 2.6, 4.2, 2.5, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6008', '05', '05', 1.8, 4.9, 3.5, 3.4, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6008', '06', '06', 4.1, 4.3, 4.6, 4.4, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6008', '07', '07', 1.2, 3.5, 4.6, 3.3, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6009', '08', '08', 3.8, 4.9, 3.5, 4.0, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6009', '09', '09', 3.2, 2.4, 4.5, 3.5, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6009', '10', '10', 2.1, 2.4, 1.8, 2.1, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6010', '01', '01', 4.3, 2.5, 1.8, 2.8, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6010', '02', '02', 2.8, 4.4, 4.9, 4.1, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6010', '03', '03', 3.7, 4.8, 3.7, 4.0, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6011', '04', '04', 3.6, 2.5, 3.3, 3.2, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6011', '05', '05', 1.8, 3.8, 1.9, 2.4, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6011', '06', '06', 1.4, 2.9, 4.9, 3.3, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6012', '07', '07', 1.0, 4.2, 2.1, 2.4, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6012', '08', '08', 1.2, 3.4, 3.7, 2.9, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6012', '09', '09', 2.2, 4.4, 2.7, 3.1, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6013', '10', '10', 3.5, 2.2, 3.9, 3.3, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6013', '01', '01', 2.4, 2.2, 2.7, 2.5, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6013', '02', '02', 1.2, 4.6, 4.8, 3.7, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6014', '03', '03', 0.0, 4.7, 2.4, 2.4, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6014', '04', '04', 0.6, 3.8, 3.8, 2.8, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6014', '05', '05', 0.2, 3.1, 4.9, 3.0, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6015', '06', '06', 4.1, 3.3, 3.3, 3.5, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6015', '07', '07', 1.6, 3.2, 3.6, 2.9, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6015', '08', '08', 2.2, 2.7, 4.1, 3.1, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6016', '09', '09', 0.4, 4.4, 2.7, 2.5, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6016', '10', '10', 3.4, 3.7, 2.1, 3.0, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6016', '01', '01', 1.7, 3.8, 2.3, 2.6, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6017', '02', '02', 0.0, 4.2, 1.1, 1.7, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6017', '03', '03', 1.4, 3.0, 4.4, 3.1, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6017', '04', '04', 0.8, 4.8, 3.2, 3.0, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6018', '05', '05', 1.8, 4.1, 2.4, 2.7, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6018', '06', '06', 0.8, 3.0, 2.7, 2.2, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6018', '07', '07', 3.5, 3.2, 4.6, 3.9, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6019', '08', '08', 1.4, 4.3, 2.4, 2.7, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6019', '09', '09', 2.4, 4.8, 1.8, 2.9, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6019', '10', '10', 3.2, 2.5, 1.7, 2.4, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6020', '01', '01', 2.6, 4.9, 4.6, 4.1, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6020', '02', '02', 0.4, 3.8, 1.8, 2.0, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6020', '03', '03', 3.8, 2.1, 1.0, 2.2, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6021', '04', '04', 2.7, 2.2, 2.1, 2.3, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6021', '05', '05', 3.4, 3.0, 5.0, 3.9, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6021', '06', '06', 1.7, 4.4, 1.8, 2.6, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6022', '07', '07', 0.6, 2.5, 3.2, 2.2, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6022', '08', '08', 2.6, 3.6, 1.2, 2.3, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6022', '09', '09', 3.6, 3.5, 2.7, 3.2, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6023', '10', '10', 4.7, 3.3, 2.0, 3.2, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6023', '01', '01', 2.0, 4.1, 3.0, 3.0, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6023', '02', '02', 2.0, 2.1, 1.7, 1.9, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6024', '03', '03', 1.1, 3.9, 1.4, 2.1, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6024', '04', '04', 1.5, 4.0, 3.3, 3.0, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6024', '05', '05', 1.5, 2.7, 3.8, 2.8, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6025', '06', '06', 3.5, 2.8, 1.4, 2.5, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6025', '07', '07', 0.5, 4.0, 4.1, 3.0, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6025', '08', '08', 1.0, 3.6, 3.7, 2.9, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6026', '09', '09', 1.2, 2.9, 3.5, 2.6, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6026', '10', '10', 0.6, 3.9, 3.7, 2.8, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6026', '01', '01', 4.3, 4.8, 4.0, 4.3, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6027', '02', '02', 4.2, 2.2, 3.1, 3.2, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6027', '03', '03', 3.4, 4.3, 4.0, 3.9, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6027', '04', '04', 1.2, 3.5, 2.2, 2.3, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6028', '05', '05', 3.1, 3.6, 1.2, 2.5, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6028', '06', '06', 3.2, 4.6, 3.6, 3.8, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6028', '07', '07', 4.9, 2.7, 2.4, 3.2, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6029', '08', '08', 4.1, 3.0, 1.6, 2.8, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6029', '09', '09', 1.8, 4.1, 2.7, 2.9, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6029', '10', '10', 2.9, 2.9, 2.9, 2.9, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7500', '01', '01', 3.8, 1.7, 4.4, 3.4, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7500', '02', '02', 2.7, 3.6, 3.4, 3.3, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7500', '03', '03', 2.4, 4.4, 3.4, 3.4, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7501', '04', '04', 1.5, 2.6, 3.8, 2.8, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7501', '05', '05', 3.5, 4.8, 3.0, 3.7, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7501', '06', '06', 4.5, 2.3, 2.2, 2.9, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7502', '07', '07', 4.3, 2.1, 2.0, 2.7, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7502', '08', '08', 2.8, 1.5, 3.6, 2.7, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7502', '09', '09', 2.7, 2.8, 1.7, 2.3, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7503', '10', '10', 4.6, 3.7, 2.5, 3.5, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7503', '01', '01', 1.9, 3.0, 2.9, 2.6, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7503', '02', '02', 2.4, 4.2, 4.8, 3.9, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7504', '03', '03', 3.0, 2.1, 2.3, 2.5, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7504', '04', '04', 1.7, 1.0, 3.5, 2.2, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7504', '05', '05', 1.8, 3.3, 3.8, 3.1, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7505', '06', '06', 2.6, 3.0, 4.8, 3.6, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7505', '07', '07', 4.0, 2.8, 3.3, 3.4, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7505', '08', '08', 4.3, 2.9, 4.1, 3.8, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7506', '09', '09', 3.5, 2.2, 3.8, 3.2, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7506', '10', '10', 1.5, 1.3, 4.0, 2.4, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7506', '01', '01', 3.1, 1.6, 1.4, 2.0, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7507', '02', '02', 1.0, 4.7, 1.7, 2.4, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7507', '03', '03', 4.1, 4.3, 1.1, 3.0, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7507', '04', '04', 2.0, 4.9, 4.2, 3.8, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7508', '05', '05', 2.9, 1.5, 2.6, 2.4, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7508', '06', '06', 4.8, 3.2, 1.9, 3.2, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7508', '07', '07', 1.7, 4.6, 4.1, 3.5, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7509', '08', '08', 2.2, 3.8, 3.6, 3.2, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7509', '09', '09', 3.0, 4.6, 4.6, 4.1, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7509', '10', '10', 2.8, 4.8, 1.6, 2.9, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7510', '01', '01', 3.8, 2.7, 4.1, 3.6, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7510', '02', '02', 3.0, 3.8, 4.0, 3.6, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7510', '03', '03', 2.8, 1.9, 2.0, 2.2, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7511', '04', '04', 4.1, 4.6, 4.9, 4.6, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7511', '05', '05', 4.3, 4.5, 4.2, 4.3, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7511', '06', '06', 3.1, 1.5, 2.1, 2.2, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7512', '07', '07', 4.8, 4.6, 3.7, 4.3, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7512', '08', '08', 2.3, 1.8, 4.7, 3.1, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7512', '09', '09', 4.1, 1.2, 3.2, 2.9, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7513', '10', '10', 3.0, 3.3, 1.6, 2.5, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7513', '01', '01', 2.0, 4.4, 4.5, 3.7, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7513', '02', '02', 2.2, 1.6, 4.6, 3.0, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7514', '03', '03', 1.6, 2.3, 2.6, 2.2, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7514', '04', '04', 3.5, 3.7, 4.6, 4.0, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7514', '05', '05', 2.4, 4.0, 4.6, 3.8, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7515', '06', '06', 2.4, 3.5, 1.0, 2.2, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7515', '07', '07', 1.6, 4.8, 3.7, 3.4, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7515', '08', '08', 2.5, 1.8, 2.3, 2.2, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7516', '09', '09', 2.0, 3.8, 3.0, 2.9, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7516', '10', '10', 1.5, 3.3, 2.1, 2.3, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7516', '01', '01', 1.8, 2.7, 2.0, 2.2, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7517', '02', '02', 1.6, 1.4, 4.8, 2.8, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7517', '03', '03', 1.1, 4.8, 3.9, 3.3, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7517', '04', '04', 4.8, 2.9, 3.4, 3.7, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7518', '05', '05', 2.6, 3.0, 1.7, 2.4, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7518', '06', '06', 4.8, 1.7, 2.6, 3.0, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7518', '07', '07', 2.3, 3.2, 2.5, 2.7, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7519', '08', '08', 1.2, 2.4, 3.4, 2.4, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7519', '09', '09', 4.9, 4.3, 4.8, 4.7, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7519', '10', '10', 4.4, 1.0, 3.9, 3.2, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7520', '01', '01', 3.5, 2.4, 4.2, 3.5, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7520', '02', '02', 4.1, 1.4, 1.3, 2.2, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7520', '03', '03', 2.1, 2.1, 1.6, 1.9, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7521', '04', '04', 1.3, 1.2, 4.7, 2.6, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7521', '05', '05', 1.8, 1.3, 1.3, 1.5, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7521', '06', '06', 2.0, 1.9, 4.9, 3.1, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7522', '07', '07', 1.5, 1.4, 1.5, 1.5, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7522', '08', '08', 3.8, 4.6, 3.0, 3.7, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7522', '09', '09', 1.8, 2.1, 2.2, 2.1, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7523', '10', '10', 2.1, 4.2, 1.8, 2.6, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7523', '01', '01', 1.7, 3.3, 1.6, 2.1, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7523', '02', '02', 2.0, 3.1, 4.8, 3.5, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7524', '03', '03', 3.8, 3.6, 3.7, 3.7, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7524', '04', '04', 3.2, 4.1, 2.9, 3.4, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7524', '05', '05', 2.3, 3.0, 4.1, 3.2, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7525', '06', '06', 3.2, 2.0, 2.4, 2.5, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7525', '07', '07', 4.3, 1.0, 3.5, 3.0, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7525', '08', '08', 1.2, 2.9, 3.0, 2.4, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7526', '09', '09', 4.9, 2.8, 2.1, 3.2, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7526', '10', '10', 4.1, 1.6, 2.9, 2.9, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7526', '01', '01', 3.9, 2.1, 2.5, 2.8, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7527', '02', '02', 4.2, 4.6, 4.5, 4.4, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7527', '03', '03', 4.0, 4.1, 1.9, 3.2, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7527', '04', '04', 1.0, 1.8, 1.7, 1.5, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7528', '05', '05', 4.5, 1.5, 4.6, 3.6, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7528', '06', '06', 4.5, 1.7, 2.6, 2.9, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7528', '07', '07', 1.6, 1.7, 4.0, 2.6, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7529', '08', '08', 2.0, 1.2, 3.7, 2.4, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7529', '09', '09', 3.9, 4.1, 3.4, 3.8, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7529', '10', '10', 4.3, 4.4, 3.3, 3.9, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8000', '01', '01', 4.2, 3.1, 3.0, 3.4, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8000', '02', '02', 3.2, 2.5, 4.4, 3.5, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8000', '03', '03', 4.1, 1.1, 0.8, 1.9, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8001', '04', '04', 3.0, 3.1, 4.3, 3.6, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8001', '05', '05', 3.7, 4.5, 3.3, 3.8, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8001', '06', '06', 3.8, 0.9, 4.2, 3.1, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8002', '07', '07', 3.2, 2.3, 3.0, 2.9, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8002', '08', '08', 3.1, 3.9, 3.7, 3.6, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8002', '09', '09', 3.8, 1.4, 3.8, 3.1, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8003', '10', '10', 4.0, 4.2, 3.2, 3.7, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8003', '01', '01', 4.2, 4.3, 3.1, 3.8, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8003', '02', '02', 3.9, 3.2, 3.8, 3.7, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8004', '03', '03', 3.1, 2.8, 4.4, 3.5, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8004', '04', '04', 2.8, 3.1, 4.6, 3.6, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8004', '05', '05', 2.2, 2.5, 3.7, 2.9, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8005', '06', '06', 4.3, 4.9, 3.1, 4.0, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8005', '07', '07', 5.0, 4.1, 2.4, 3.7, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8005', '08', '08', 3.1, 2.9, 2.1, 2.6, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8006', '09', '09', 3.8, 3.1, 4.3, 3.8, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8006', '10', '10', 1.3, 2.1, 5.0, 3.0, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8006', '01', '01', 4.0, 4.3, 3.1, 3.7, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8007', '02', '02', 2.0, 1.7, 3.2, 2.4, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8007', '03', '03', 3.3, 1.6, 1.4, 2.0, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8007', '04', '04', 3.6, 2.3, 4.8, 3.7, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8008', '05', '05', 2.4, 3.4, 1.1, 2.2, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8008', '06', '06', 1.0, 2.4, 2.1, 1.9, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8008', '07', '07', 3.0, 4.8, 3.1, 3.6, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8009', '08', '08', 4.4, 1.1, 2.6, 2.7, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8009', '09', '09', 0.8, 2.1, 1.2, 1.4, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8009', '10', '10', 2.2, 3.3, 3.1, 2.9, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8010', '01', '01', 3.8, 2.5, 4.6, 3.7, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8010', '02', '02', 1.3, 3.9, 0.1, 1.6, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8010', '03', '03', 4.0, 1.3, 2.4, 2.6, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8011', '04', '04', 4.1, 4.6, 3.9, 4.2, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8011', '05', '05', 3.1, 1.8, 1.5, 2.1, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8011', '06', '06', 2.7, 3.7, 4.4, 3.7, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8012', '07', '07', 3.0, 3.7, 4.5, 3.8, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8012', '08', '08', 2.4, 2.1, 3.2, 2.6, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8012', '09', '09', 4.1, 2.0, 2.9, 3.0, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8013', '10', '10', 4.5, 4.2, 3.2, 3.9, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8013', '01', '01', 2.8, 1.6, 2.5, 2.3, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8013', '02', '02', 3.9, 2.1, 4.1, 3.4, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8014', '03', '03', 2.9, 3.3, 4.2, 3.5, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8014', '04', '04', 4.2, 3.2, 2.1, 3.1, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8014', '05', '05', 1.9, 4.1, 3.1, 3.0, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8015', '06', '06', 1.8, 4.3, 2.1, 2.7, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8015', '07', '07', 2.2, 3.3, 4.2, 3.3, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8015', '08', '08', 3.3, 4.2, 3.2, 3.5, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8016', '09', '09', 2.3, 3.0, 4.1, 3.2, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8016', '10', '10', 4.7, 3.7, 3.0, 3.7, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8016', '01', '01', 1.0, 3.8, 3.7, 2.9, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8017', '02', '02', 2.0, 3.2, 3.8, 3.1, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8017', '03', '03', 3.2, 3.1, 3.2, 3.2, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8017', '04', '04', 2.4, 3.8, 3.1, 3.1, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8018', '05', '05', 3.8, 4.4, 3.8, 4.0, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8018', '06', '06', 1.2, 4.6, 4.0, 3.3, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8018', '07', '07', 4.5, 3.7, 4.2, 4.1, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8019', '08', '08', 1.7, 3.1, 3.9, 3.0, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8019', '09', '09', 3.7, 2.4, 3.1, 3.1, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8019', '10', '10', 3.7, 2.1, 2.8, 2.9, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8020', '01', '01', 2.3, 4.4, 2.2, 2.9, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8020', '02', '02', 2.2, 2.5, 4.3, 3.1, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8020', '03', '03', 4.1, 3.1, 5.0, 4.2, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8021', '04', '04', 1.5, 3.2, 3.1, 2.7, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8021', '05', '05', 2.0, 1.4, 3.8, 2.5, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8021', '06', '06', 3.3, 4.1, 1.3, 2.7, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8022', '07', '07', 3.2, 2.1, 4.0, 3.2, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8022', '08', '08', 3.0, 3.9, 3.1, 3.3, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8022', '09', '09', 1.4, 4.1, 2.5, 2.7, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8023', '10', '10', 2.6, 4.3, 1.1, 2.5, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8023', '01', '01', 1.1, 3.3, 3.1, 2.6, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8023', '02', '02', 4.2, 4.2, 4.5, 4.3, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8024', '03', '03', 2.5, 3.0, 0.9, 2.0, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8024', '04', '04', 1.2, 3.7, 2.3, 2.4, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8024', '05', '05', 3.1, 3.8, 3.9, 3.6, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8025', '06', '06', 2.0, 3.2, 1.4, 2.1, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8025', '07', '07', 3.9, 3.1, 4.2, 3.8, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8025', '08', '08', 2.1, 3.8, 4.3, 3.5, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8025', '09', '09', 4.1, 4.4, 3.2, 3.8, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8026', '10', '10', 4.8, 4.6, 2.8, 3.9, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8026', '01', '01', 2.2, 3.7, 3.1, 3.0, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8027', '02', '02', 3.9, 3.1, 2.5, 3.1, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8027', '03', '03', 3.8, 2.4, 4.9, 3.8, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8027', '04', '04', 1.3, 2.1, 4.1, 2.7, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8028', '05', '05', 0.2, 4.4, 2.9, 2.5, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8028', '06', '06', 4.6, 4.5, 3.1, 4.0, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8028', '07', '07', 4.5, 3.1, 2.1, 3.1, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8029', '08', '08', 2.7, 3.2, 4.3, 3.5, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8029', '09', '09', 3.1, 1.4, 1.7, 2.0, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('8029', '10', '10', 4.0, 4.1, 1.6, 3.1, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7000', '01', '01', 4.1, 0.7, 3.1, 2.7, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7000', '02', '02', 1.1, 2.2, 0.5, 1.2, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7000', '03', '03', 4.4, 3.0, 4.5, 4.0, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7001', '04', '04', 3.2, 1.5, 1.7, 2.1, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7001', '05', '05', 3.4, 2.5, 0.5, 2.0, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7001', '06', '06', 0.2, 1.3, 3.5, 1.9, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7002', '07', '07', 1.8, 1.4, 4.9, 2.9, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7002', '08', '08', 0.2, 3.7, 1.5, 1.8, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7002', '09', '09', 3.4, 1.2, 2.5, 2.4, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7003', '10', '10', 1.7, 2.0, 4.8, 3.0, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7003', '01', '01', 3.5, 1.4, 0.5, 1.7, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7003', '02', '02', 3.8, 4.6, 4.3, 4.2, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7004', '03', '03', 4.8, 2.0, 4.0, 3.6, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7004', '04', '04', 0.4, 3.3, 2.3, 2.0, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7004', '05', '05', 0.8, 0.9, 1.0, 0.9, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7005', '06', '06', 3.8, 3.4, 1.6, 2.8, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7005', '07', '07', 2.8, 3.3, 4.2, 3.5, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7005', '08', '08', 0.7, 3.2, 3.5, 2.6, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7006', '09', '09', 3.4, 1.2, 1.6, 2.0, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7006', '10', '10', 4.7, 3.2, 4.7, 4.3, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7006', '01', '01', 0.2, 0.0, 3.4, 1.4, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7007', '02', '02', 3.9, 3.8, 1.9, 3.1, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7007', '03', '03', 1.1, 0.4, 2.9, 1.6, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7007', '04', '04', 5.0, 1.0, 2.6, 2.8, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7008', '05', '05', 1.3, 3.7, 1.2, 2.0, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7008', '06', '06', 5.0, 0.4, 4.4, 3.4, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7008', '07', '07', 4.9, 2.6, 4.8, 4.2, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7009', '08', '08', 3.4, 1.8, 1.4, 2.1, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7009', '09', '09', 1.2, 1.8, 2.0, 1.7, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7009', '10', '10', 3.1, 3.6, 1.5, 2.6, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7010', '01', '01', 1.7, 0.2, 1.2, 1.1, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7010', '02', '02', 1.2, 1.5, 0.7, 1.1, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7010', '03', '03', 1.2, 4.7, 3.9, 3.3, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7011', '04', '04', 3.2, 5.0, 3.8, 4.0, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7011', '05', '05', 2.2, 1.5, 1.0, 1.5, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7011', '06', '06', 1.2, 3.7, 1.2, 2.0, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7012', '07', '07', 0.5, 3.2, 2.2, 2.0, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7012', '08', '08', 0.2, 0.2, 3.4, 1.5, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7012', '09', '09', 0.6, 2.1, 1.9, 1.6, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7013', '10', '10', 3.3, 0.6, 4.5, 3.0, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7013', '01', '01', 2.6, 3.7, 4.0, 3.5, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7013', '02', '02', 2.4, 2.7, 3.3, 2.9, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7014', '03', '03', 1.9, 1.0, 4.2, 2.6, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7014', '04', '04', 0.4, 0.9, 4.4, 2.2, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7014', '05', '05', 2.3, 2.0, 2.5, 2.3, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7015', '06', '06', 0.8, 4.9, 2.5, 2.7, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7015', '07', '07', 1.8, 4.8, 0.2, 2.1, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7015', '08', '08', 3.3, 3.2, 2.0, 2.8, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7016', '09', '09', 5.0, 3.9, 0.8, 3.0, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7016', '10', '10', 2.6, 1.3, 4.2, 2.9, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7016', '01', '01', 4.3, 1.1, 4.4, 3.4, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7017', '02', '02', 2.7, 0.7, 0.2, 1.1, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7017', '03', '03', 1.0, 0.6, 4.2, 2.2, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7017', '04', '04', 2.9, 4.5, 3.5, 3.6, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7018', '05', '05', 1.6, 0.2, 1.2, 1.0, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7018', '06', '06', 3.1, 1.2, 3.1, 2.5, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7018', '07', '07', 1.6, 3.8, 4.0, 3.2, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7019', '08', '08', 0.0, 1.0, 2.1, 1.1, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7019', '09', '09', 4.2, 4.2, 0.8, 2.8, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7019', '10', '10', 3.5, 0.7, 4.9, 3.2, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7020', '01', '01', 0.5, 4.3, 3.7, 2.9, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7020', '02', '02', 2.8, 1.8, 1.0, 1.8, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7020', '03', '03', 4.6, 1.1, 3.2, 3.0, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7021', '04', '04', 0.0, 0.0, 4.9, 2.0, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7021', '05', '05', 4.9, 3.3, 2.5, 3.5, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7021', '06', '06', 3.4, 0.9, 4.0, 2.9, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7022', '07', '07', 4.6, 1.0, 5.0, 3.7, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7022', '08', '08', 3.5, 4.0, 2.2, 3.1, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7022', '09', '09', 1.6, 0.7, 1.8, 1.4, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7023', '10', '10', 3.4, 2.8, 3.3, 3.2, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7023', '01', '01', 4.6, 2.0, 1.3, 2.5, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7023', '02', '02', 2.6, 3.2, 0.0, 1.7, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7024', '03', '03', 0.9, 0.7, 3.4, 1.8, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7024', '04', '04', 0.0, 1.6, 4.3, 2.2, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7024', '05', '05', 2.8, 1.2, 2.2, 2.1, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7025', '06', '06', 3.2, 0.9, 2.8, 2.4, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7025', '07', '07', 4.6, 3.4, 2.2, 3.3, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7025', '08', '08', 0.7, 0.9, 3.9, 2.0, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7026', '09', '09', 2.1, 1.0, 4.8, 2.9, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7026', '10', '10', 2.2, 2.2, 1.5, 1.9, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7026', '01', '01', 4.7, 2.0, 2.7, 3.1, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7027', '02', '02', 3.1, 3.4, 3.9, 3.5, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7027', '03', '03', 2.0, 3.8, 3.3, 3.1, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7027', '04', '04', 3.6, 4.1, 4.4, 4.1, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7028', '05', '05', 3.4, 1.7, 1.8, 2.3, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7028', '06', '06', 3.8, 2.2, 4.4, 3.6, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7028', '07', '07', 3.2, 4.6, 2.6, 3.4, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7029', '08', '08', 1.1, 1.6, 4.8, 2.7, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7029', '09', '09', 0.4, 3.6, 2.8, 2.3, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('7029', '10', '10', 4.0, 3.5, 3.3, 3.6, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2300', '01', '01', 1.3, 4.2, 4.9, 3.6, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2300', '02', '02', 3.2, 2.6, 5.0, 3.7, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2300', '03', '03', 0.7, 0.5, 1.5, 1.0, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2301', '04', '04', 4.1, 0.9, 4.9, 3.5, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2301', '05', '05', 0.3, 4.9, 1.4, 2.1, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2301', '06', '06', 3.2, 4.5, 0.9, 2.7, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2302', '07', '07', 3.2, 0.3, 0.3, 1.2, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2302', '08', '08', 1.7, 4.3, 3.8, 3.3, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2302', '09', '09', 3.6, 0.4, 3.5, 2.6, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2303', '10', '10', 0.8, 1.7, 2.8, 1.9, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2303', '01', '01', 3.6, 1.7, 2.6, 2.6, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2303', '02', '02', 1.0, 5.0, 3.0, 3.0, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2304', '03', '03', 3.1, 0.2, 1.4, 1.6, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2304', '04', '04', 4.1, 0.4, 4.8, 3.3, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2304', '05', '05', 3.8, 4.4, 2.9, 3.6, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2305', '06', '06', 3.9, 0.8, 3.7, 2.9, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2305', '07', '07', 1.0, 2.8, 0.3, 1.3, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2305', '08', '08', 3.8, 3.3, 4.8, 4.1, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2306', '09', '09', 2.2, 0.9, 4.2, 2.6, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2306', '10', '10', 2.1, 0.5, 3.0, 2.0, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2306', '01', '01', 4.5, 1.1, 1.0, 2.1, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2307', '02', '02', 4.1, 1.1, 3.2, 2.8, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2307', '03', '03', 1.9, 1.7, 0.5, 1.3, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2307', '04', '04', 2.5, 4.6, 1.5, 2.7, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2308', '05', '05', 0.9, 1.4, 3.6, 2.1, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2308', '06', '06', 2.4, 3.1, 3.2, 2.9, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2308', '07', '07', 2.7, 0.2, 4.7, 2.8, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2309', '08', '08', 2.1, 2.6, 1.6, 2.1, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2309', '09', '09', 1.6, 0.1, 0.8, 0.8, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2309', '10', '10', 4.7, 4.4, 1.5, 3.3, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2310', '01', '01', 0.8, 0.5, 2.1, 1.2, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2310', '02', '02', 3.2, 3.8, 1.1, 2.5, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2310', '03', '03', 1.7, 1.8, 1.3, 1.6, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2311', '04', '04', 0.9, 4.9, 0.7, 2.0, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2311', '05', '05', 3.7, 2.1, 1.3, 2.3, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2311', '06', '06', 3.4, 0.5, 1.7, 1.9, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2312', '07', '07', 1.4, 3.5, 0.7, 1.8, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2312', '08', '08', 1.8, 4.6, 0.4, 2.1, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2312', '09', '09', 3.8, 0.7, 0.4, 1.5, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2313', '10', '10', 0.2, 4.7, 1.5, 2.1, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2313', '01', '01', 5.0, 1.9, 0.7, 2.4, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2313', '02', '02', 1.4, 2.7, 0.5, 1.4, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2314', '03', '03', 4.2, 0.7, 4.8, 3.4, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2314', '04', '04', 4.1, 2.8, 2.0, 2.9, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2314', '05', '05', 0.8, 2.6, 0.1, 1.1, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2315', '06', '06', 2.3, 0.6, 1.2, 1.4, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2315', '07', '07', 4.0, 2.2, 1.2, 2.3, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2315', '08', '08', 1.2, 3.6, 2.6, 2.5, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2316', '09', '09', 3.7, 2.5, 1.9, 2.6, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2316', '10', '10', 4.1, 1.9, 3.8, 3.3, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2316', '01', '01', 4.9, 1.7, 4.2, 3.7, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2317', '02', '02', 3.9, 2.6, 2.0, 2.8, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2317', '03', '03', 0.5, 4.0, 3.5, 2.8, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2317', '04', '04', 4.9, 2.7, 4.0, 3.9, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2318', '05', '05', 3.3, 1.4, 1.2, 1.9, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2318', '06', '06', 4.4, 3.7, 4.1, 4.1, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2318', '07', '07', 3.1, 1.6, 3.7, 2.9, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2319', '08', '08', 2.9, 4.7, 4.9, 4.2, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2319', '09', '09', 3.6, 0.6, 4.5, 3.1, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2319', '10', '10', 3.9, 4.8, 2.5, 3.6, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2320', '01', '01', 4.0, 0.3, 3.0, 2.5, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2320', '02', '02', 3.9, 1.0, 4.9, 3.4, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2320', '03', '03', 4.4, 4.4, 3.2, 3.9, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2321', '04', '04', 4.7, 1.9, 2.5, 3.0, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2321', '05', '05', 4.8, 0.8, 2.1, 2.5, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2321', '06', '06', 2.7, 3.7, 1.8, 2.6, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2322', '07', '07', 4.0, 0.1, 4.8, 3.2, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2322', '08', '08', 3.2, 2.2, 1.4, 2.2, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2322', '09', '09', 1.8, 0.1, 1.2, 1.1, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2323', '10', '10', 0.4, 1.7, 4.4, 2.4, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2323', '01', '01', 4.5, 1.6, 3.8, 3.4, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2323', '02', '02', 1.1, 0.7, 1.1, 1.0, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2324', '03', '03', 0.8, 0.4, 2.5, 1.4, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2324', '04', '04', 2.7, 3.2, 0.4, 1.9, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2324', '05', '05', 4.8, 3.5, 4.7, 4.4, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2325', '06', '06', 2.8, 2.6, 2.0, 2.4, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2325', '07', '07', 1.3, 2.1, 0.1, 1.1, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2325', '08', '08', 1.1, 3.1, 4.2, 2.9, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2326', '09', '09', 4.5, 5.0, 2.3, 3.8, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2326', '10', '10', 3.1, 0.3, 3.1, 2.3, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2326', '01', '01', 3.4, 1.3, 4.8, 3.3, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2327', '02', '02', 2.9, 1.0, 2.7, 2.3, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2327', '03', '03', 4.0, 4.3, 3.2, 3.8, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2327', '04', '04', 3.1, 3.5, 1.8, 2.7, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2328', '05', '05', 3.3, 3.1, 3.5, 3.3, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2328', '06', '06', 3.0, 0.1, 2.3, 1.9, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2328', '07', '07', 2.0, 0.8, 4.1, 2.5, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2329', '08', '08', 0.3, 4.2, 0.1, 1.4, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2329', '09', '09', 1.6, 0.6, 2.0, 1.5, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('2329', '10', '10', 4.3, 2.9, 4.2, 3.8, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6800', '01', '01', 3.4, 1.6, 3.9, 3.1, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6800', '02', '02', 2.4, 1.9, 1.7, 2.0, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6800', '03', '03', 3.4, 3.9, 4.5, 4.0, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6801', '04', '04', 1.3, 1.6, 4.0, 2.5, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6801', '05', '05', 2.8, 2.9, 3.7, 3.2, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6801', '06', '06', 3.6, 4.5, 4.6, 4.3, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6802', '07', '07', 3.7, 4.0, 3.5, 3.7, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6802', '08', '08', 3.7, 4.1, 1.3, 2.9, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6802', '09', '09', 1.9, 2.5, 4.9, 3.3, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6803', '10', '10', 4.4, 3.5, 1.0, 2.8, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6803', '01', '01', 1.8, 4.9, 3.3, 3.3, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6803', '02', '02', 1.9, 1.9, 3.3, 2.5, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6804', '03', '03', 2.8, 3.4, 3.9, 3.4, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6804', '04', '04', 1.7, 1.4, 4.2, 2.6, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6804', '05', '05', 2.9, 1.1, 4.3, 2.9, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6805', '06', '06', 4.8, 2.8, 3.2, 3.6, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6805', '07', '07', 1.7, 4.2, 1.7, 2.5, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9800', '01', '01', 4.0, 3.9, 5.0, 4.4, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9800', '02', '02', 1.8, 3.2, 4.0, 3.1, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9800', '03', '03', 2.5, 1.7, 4.0, 2.9, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9801', '04', '04', 3.0, 3.5, 2.9, 3.1, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6805', '08', '08', 3.4, 1.3, 3.4, 2.8, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6806', '09', '09', 2.7, 2.7, 1.1, 2.1, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6806', '10', '10', 1.8, 3.5, 2.6, 2.6, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6806', '01', '01', 4.0, 2.8, 1.6, 2.7, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6807', '02', '02', 4.0, 1.8, 2.6, 2.8, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6807', '03', '03', 3.8, 2.6, 2.2, 2.8, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6807', '04', '04', 4.2, 2.1, 3.9, 3.5, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6808', '05', '05', 3.5, 1.1, 3.9, 2.9, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6808', '06', '06', 2.7, 1.7, 4.1, 3.0, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6808', '07', '07', 3.3, 2.3, 4.7, 3.6, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6809', '08', '08', 4.6, 3.6, 2.4, 3.4, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6809', '09', '09', 2.5, 2.4, 3.9, 3.0, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6809', '10', '10', 3.0, 2.9, 3.1, 3.0, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6810', '01', '01', 2.5, 2.5, 1.8, 2.2, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6810', '02', '02', 2.5, 3.8, 4.8, 3.8, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6810', '03', '03', 4.3, 3.9, 1.5, 3.1, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6811', '04', '04', 3.2, 1.3, 3.7, 2.8, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6811', '05', '05', 4.0, 4.9, 2.2, 3.6, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6811', '06', '06', 4.4, 3.5, 2.0, 3.2, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6812', '07', '07', 3.6, 2.6, 2.0, 2.7, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6812', '08', '08', 2.5, 1.3, 2.7, 2.2, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6812', '09', '09', 3.8, 3.1, 3.6, 3.5, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6813', '10', '10', 2.5, 4.1, 2.0, 2.8, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6813', '01', '01', 2.0, 3.9, 4.6, 3.6, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6813', '02', '02', 3.3, 4.0, 4.2, 3.9, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6814', '03', '03', 4.0, 1.1, 3.0, 2.7, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6814', '04', '04', 4.8, 3.1, 1.2, 2.9, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6814', '05', '05', 4.5, 2.3, 3.7, 3.5, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6815', '06', '06', 2.6, 1.8, 3.5, 2.7, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6815', '07', '07', 4.8, 3.8, 1.6, 3.2, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6815', '08', '08', 2.0, 3.6, 2.1, 2.5, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6816', '09', '09', 4.8, 3.7, 4.2, 4.2, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6816', '10', '10', 2.9, 2.4, 2.3, 2.5, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6816', '01', '01', 3.6, 4.5, 1.6, 3.1, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6817', '02', '02', 5.0, 4.9, 4.4, 4.7, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6817', '03', '03', 2.2, 1.6, 3.3, 2.5, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6817', '04', '04', 5.0, 1.1, 4.2, 3.5, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6818', '05', '05', 3.7, 3.9, 2.7, 3.4, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6818', '06', '06', 1.8, 3.8, 3.2, 3.0, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6818', '07', '07', 3.4, 3.0, 1.3, 2.4, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6819', '08', '08', 4.3, 1.5, 4.6, 3.6, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6819', '09', '09', 2.0, 2.3, 3.6, 2.7, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6819', '10', '10', 4.5, 1.7, 4.1, 3.5, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6820', '01', '01', 4.0, 3.9, 4.2, 4.1, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6820', '03', '03', 4.0, 2.6, 2.6, 3.0, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6821', '04', '04', 3.0, 1.4, 3.0, 2.5, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6821', '05', '05', 1.1, 3.4, 2.1, 2.2, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6821', '06', '06', 2.2, 2.0, 4.6, 3.1, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6822', '07', '07', 3.0, 3.5, 2.1, 2.8, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6822', '08', '08', 4.0, 4.8, 1.7, 3.3, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6822', '09', '09', 4.8, 1.8, 2.7, 3.1, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6823', '10', '10', 2.7, 3.9, 2.3, 2.9, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6823', '01', '01', 3.7, 1.5, 1.9, 2.3, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6823', '02', '02', 4.2, 4.7, 1.7, 3.4, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6824', '03', '03', 4.4, 1.1, 2.2, 2.5, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6824', '04', '04', 2.1, 2.6, 2.9, 2.6, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6824', '05', '05', 1.4, 3.2, 1.8, 2.1, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6825', '06', '06', 3.8, 3.9, 3.3, 3.6, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6825', '07', '07', 3.0, 2.0, 4.1, 3.1, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6825', '08', '08', 1.5, 1.9, 4.8, 2.9, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6826', '09', '09', 3.8, 1.1, 2.2, 2.4, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6826', '10', '10', 4.4, 2.4, 4.2, 3.7, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6826', '01', '01', 4.4, 3.3, 4.2, 4.0, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6827', '02', '02', 1.7, 2.4, 2.6, 2.3, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6827', '03', '03', 3.5, 1.2, 2.3, 2.3, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6827', '04', '04', 4.7, 4.1, 3.6, 4.1, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6828', '05', '05', 2.7, 3.0, 4.3, 3.4, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6828', '06', '06', 2.4, 3.2, 3.4, 3.0, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6828', '07', '07', 3.5, 2.1, 3.2, 3.0, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6829', '08', '08', 1.7, 4.2, 1.4, 2.3, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6829', '09', '09', 3.8, 4.7, 4.9, 4.5, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6829', '10', '10', 3.2, 2.2, 2.7, 2.7, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9500', '01', '01', 3.5, 3.3, 1.0, 2.4, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9500', '02', '02', 4.5, 3.9, 4.9, 4.5, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9500', '03', '03', 1.6, 1.8, 3.5, 2.4, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9501', '04', '04', 3.6, 1.8, 1.2, 2.1, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9501', '05', '05', 1.7, 4.5, 3.6, 3.3, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9501', '06', '06', 1.6, 2.4, 1.5, 1.8, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9502', '07', '07', 1.5, 4.2, 2.1, 2.6, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9502', '08', '08', 2.8, 2.3, 2.7, 2.6, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9502', '09', '09', 1.3, 3.6, 2.1, 2.3, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9503', '10', '10', 4.5, 4.5, 1.8, 3.4, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9503', '01', '01', 2.3, 2.3, 1.5, 2.0, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9503', '02', '02', 2.7, 2.6, 3.1, 2.8, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9504', '03', '03', 4.0, 3.3, 4.4, 4.0, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9504', '04', '04', 1.8, 2.6, 4.1, 3.0, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9504', '05', '05', 4.4, 3.1, 1.1, 2.7, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9505', '06', '06', 4.4, 2.5, 4.4, 3.8, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9505', '07', '07', 1.2, 4.4, 3.2, 3.0, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9505', '08', '08', 3.5, 1.4, 2.3, 2.4, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9506', '09', '09', 4.7, 4.1, 3.3, 4.0, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9506', '10', '10', 3.9, 1.4, 2.8, 2.7, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9506', '01', '01', 4.6, 1.4, 2.0, 2.6, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9507', '02', '02', 3.5, 1.2, 4.6, 3.3, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9507', '03', '03', 1.1, 2.2, 4.9, 3.0, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9507', '04', '04', 4.5, 4.1, 2.6, 3.6, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9508', '05', '05', 4.5, 3.3, 3.6, 3.8, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9508', '06', '06', 4.3, 4.8, 4.0, 4.3, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9508', '07', '07', 4.6, 4.2, 3.0, 3.8, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9509', '08', '08', 4.5, 4.8, 4.5, 4.6, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9509', '09', '09', 3.1, 4.5, 4.7, 4.2, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9509', '10', '10', 3.8, 4.4, 2.3, 3.4, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9510', '01', '01', 3.8, 2.2, 2.4, 2.8, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('6820', '02', '02', 2.8, 4.7, 1.3, 2.8, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9510', '02', '02', 2.4, 3.2, 1.2, 2.2, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9510', '03', '03', 2.8, 3.4, 1.2, 2.3, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9511', '04', '04', 3.6, 2.0, 4.2, 3.4, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9511', '05', '05', 2.1, 2.6, 3.8, 2.9, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9511', '06', '06', 2.5, 4.2, 2.7, 3.1, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9512', '07', '07', 3.4, 1.8, 1.5, 2.2, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9512', '08', '08', 2.4, 2.5, 1.2, 2.0, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9512', '09', '09', 3.1, 5.0, 4.8, 4.4, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9513', '10', '10', 2.2, 2.7, 4.2, 3.2, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9513', '01', '01', 1.5, 3.3, 3.0, 2.6, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9513', '02', '02', 1.5, 1.3, 1.1, 1.3, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9514', '03', '03', 1.6, 3.5, 3.5, 2.9, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9514', '04', '04', 3.7, 2.8, 1.2, 2.4, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9514', '05', '05', 3.5, 2.4, 4.6, 3.6, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9515', '06', '06', 4.6, 4.1, 4.2, 4.3, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9515', '07', '07', 1.6, 2.2, 3.6, 2.6, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9515', '08', '08', 1.6, 3.0, 1.4, 1.9, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9516', '09', '09', 2.1, 2.1, 4.4, 3.0, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9516', '10', '10', 2.8, 4.7, 1.8, 3.0, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9516', '01', '01', 3.7, 3.2, 1.6, 2.7, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9517', '02', '02', 3.9, 3.2, 3.6, 3.6, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9517', '03', '03', 4.4, 3.8, 2.1, 3.3, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9517', '04', '04', 1.8, 2.4, 1.4, 1.8, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9518', '05', '05', 4.5, 1.9, 4.8, 3.8, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9518', '06', '06', 1.2, 3.4, 3.4, 2.7, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9518', '07', '07', 2.7, 3.9, 3.1, 3.2, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9519', '08', '08', 1.0, 2.4, 2.9, 2.2, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9519', '09', '09', 4.8, 4.8, 3.2, 4.2, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9519', '10', '10', 1.5, 4.0, 3.6, 3.1, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9520', '01', '01', 1.7, 3.4, 1.8, 2.3, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9520', '02', '02', 4.6, 2.9, 1.2, 2.7, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9520', '03', '03', 2.0, 1.8, 4.6, 3.0, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9521', '04', '04', 4.2, 4.7, 5.0, 4.7, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9521', '05', '05', 4.3, 2.8, 1.9, 2.9, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9521', '06', '06', 3.8, 2.0, 2.4, 2.7, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9522', '07', '07', 3.7, 2.9, 2.4, 2.9, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9522', '08', '08', 4.0, 4.2, 4.3, 4.2, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9522', '09', '09', 2.0, 1.8, 3.4, 2.5, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9523', '10', '10', 4.8, 4.8, 3.3, 4.2, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9523', '01', '01', 1.4, 3.8, 1.2, 2.0, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9523', '02', '02', 2.2, 3.1, 1.3, 2.1, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9524', '03', '03', 4.5, 3.6, 1.2, 2.9, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9524', '04', '04', 4.8, 1.4, 1.7, 2.5, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9524', '05', '05', 1.6, 4.5, 2.9, 3.0, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9525', '06', '06', 4.8, 4.8, 3.1, 4.1, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9525', '07', '07', 2.3, 4.3, 4.7, 3.9, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9525', '08', '08', 3.3, 2.0, 2.9, 2.8, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9526', '09', '09', 3.1, 1.7, 2.3, 2.4, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9526', '10', '10', 4.8, 4.9, 2.0, 3.7, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9526', '01', '01', 3.6, 2.1, 4.3, 3.4, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9527', '02', '02', 3.4, 2.2, 4.6, 3.5, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9527', '03', '03', 4.4, 4.0, 3.8, 4.0, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9527', '04', '04', 5.0, 2.4, 2.8, 3.3, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9528', '05', '05', 1.5, 2.4, 3.6, 2.6, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9528', '06', '06', 1.3, 3.5, 1.4, 2.0, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9528', '07', '07', 3.5, 1.6, 1.5, 2.1, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9529', '08', '08', 2.1, 2.8, 5.0, 3.5, 'A');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9529', '09', '09', 2.9, 2.0, 2.8, 2.6, 'R');
INSERT INTO public.regnotas (estudiante, materia, profesor, parcial1, parcial2, efinal, nfinal, estado) VALUES ('9529', '10', '10', 3.9, 1.3, 1.5, 2.2, 'R');


--
-- TOC entry 2732 (class 2606 OID 16437)
-- Name: barrios barrios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.barrios
    ADD CONSTRAINT barrios_pkey PRIMARY KEY (codbarrio);


--
-- TOC entry 2734 (class 2606 OID 16439)
-- Name: ciudades ciudades_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ciudades
    ADD CONSTRAINT ciudades_pkey PRIMARY KEY (codciudad);


--
-- TOC entry 2761 (class 2606 OID 16441)
-- Name: regnotas ck_estudiante_materia_profesor; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regnotas
    ADD CONSTRAINT ck_estudiante_materia_profesor UNIQUE (estudiante, materia, profesor);


--
-- TOC entry 2742 (class 2606 OID 16443)
-- Name: estudiantes ck_nomestudiante; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiantes
    ADD CONSTRAINT ck_nomestudiante UNIQUE (nomestudiante);


--
-- TOC entry 2737 (class 2606 OID 16445)
-- Name: decanos decanos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.decanos
    ADD CONSTRAINT decanos_pkey PRIMARY KEY (coddecano);


--
-- TOC entry 2744 (class 2606 OID 16447)
-- Name: estudiantes estudiantes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiantes
    ADD CONSTRAINT estudiantes_pkey PRIMARY KEY (codestudiante);


--
-- TOC entry 2751 (class 2606 OID 16449)
-- Name: facultades facultades_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facultades
    ADD CONSTRAINT facultades_pkey PRIMARY KEY (codfacultad);


--
-- TOC entry 2740 (class 2606 OID 16451)
-- Name: departamentos pk_coddepto; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departamentos
    ADD CONSTRAINT pk_coddepto PRIMARY KEY (coddepto);


--
-- TOC entry 2754 (class 2606 OID 16453)
-- Name: materias pk_codmateria; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materias
    ADD CONSTRAINT pk_codmateria PRIMARY KEY (codmateria);


--
-- TOC entry 2768 (class 2606 OID 16455)
-- Name: regnotas pk_estudiante_materia; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regnotas
    ADD CONSTRAINT pk_estudiante_materia PRIMARY KEY (estudiante, materia);


--
-- TOC entry 2756 (class 2606 OID 16457)
-- Name: profesores profesores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profesores
    ADD CONSTRAINT profesores_pkey PRIMARY KEY (codprofesor);


--
-- TOC entry 2759 (class 2606 OID 16459)
-- Name: programas programas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.programas
    ADD CONSTRAINT programas_pkey PRIMARY KEY (codprograma);


--
-- TOC entry 2745 (class 1259 OID 16460)
-- Name: idx_barrio; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_barrio ON public.estudiantes USING btree (barrio);


--
-- TOC entry 2746 (class 1259 OID 16461)
-- Name: idx_ciudad; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_ciudad ON public.estudiantes USING btree (ciudad);


--
-- TOC entry 2738 (class 1259 OID 16462)
-- Name: idx_decanos_facultad; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_decanos_facultad ON public.decanos USING btree (facultad);


--
-- TOC entry 2735 (class 1259 OID 16463)
-- Name: idx_departamento; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_departamento ON public.ciudades USING btree (departamento);


--
-- TOC entry 2747 (class 1259 OID 16464)
-- Name: idx_edaestudiante; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_edaestudiante ON public.estudiantes USING btree (edaestudiante);


--
-- TOC entry 2762 (class 1259 OID 16465)
-- Name: idx_estado; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_estado ON public.regnotas USING btree (estado);


--
-- TOC entry 2763 (class 1259 OID 16466)
-- Name: idx_estudiante; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_estudiante ON public.regnotas USING btree (estudiante);


--
-- TOC entry 2757 (class 1259 OID 16467)
-- Name: idx_facultad; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_facultad ON public.programas USING btree (facultad);


--
-- TOC entry 2764 (class 1259 OID 16468)
-- Name: idx_materia; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_materia ON public.regnotas USING btree (materia);


--
-- TOC entry 2765 (class 1259 OID 16469)
-- Name: idx_nfinal; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_nfinal ON public.regnotas USING btree (nfinal);


--
-- TOC entry 2752 (class 1259 OID 16470)
-- Name: idx_nommateria; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_nommateria ON public.materias USING btree (nommateria);


--
-- TOC entry 2766 (class 1259 OID 16471)
-- Name: idx_profesor; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_profesor ON public.regnotas USING btree (profesor);


--
-- TOC entry 2748 (class 1259 OID 16472)
-- Name: idx_programa; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_programa ON public.estudiantes USING btree (programa);


--
-- TOC entry 2749 (class 1259 OID 16473)
-- Name: idx_sexestudiante; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_sexestudiante ON public.estudiantes USING btree (sexestudiante);


--
-- TOC entry 2770 (class 2606 OID 16474)
-- Name: decanos decanos_facultad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.decanos
    ADD CONSTRAINT decanos_facultad_fkey FOREIGN KEY (facultad) REFERENCES public.facultades(codfacultad);


--
-- TOC entry 2771 (class 2606 OID 16479)
-- Name: estudiantes fk_barrio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiantes
    ADD CONSTRAINT fk_barrio FOREIGN KEY (barrio) REFERENCES public.barrios(codbarrio);


--
-- TOC entry 2772 (class 2606 OID 16484)
-- Name: estudiantes fk_ciudad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiantes
    ADD CONSTRAINT fk_ciudad FOREIGN KEY (ciudad) REFERENCES public.ciudades(codciudad);


--
-- TOC entry 2769 (class 2606 OID 16489)
-- Name: ciudades fk_departamento; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ciudades
    ADD CONSTRAINT fk_departamento FOREIGN KEY (departamento) REFERENCES public.departamentos(coddepto);


--
-- TOC entry 2773 (class 2606 OID 16494)
-- Name: estudiantes fk_programa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiantes
    ADD CONSTRAINT fk_programa FOREIGN KEY (programa) REFERENCES public.programas(codprograma);


--
-- TOC entry 2774 (class 2606 OID 16499)
-- Name: programas programas_facultad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.programas
    ADD CONSTRAINT programas_facultad_fkey FOREIGN KEY (facultad) REFERENCES public.facultades(codfacultad);


--
-- TOC entry 2775 (class 2606 OID 16504)
-- Name: regnotas regnotas_estudiante_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regnotas
    ADD CONSTRAINT regnotas_estudiante_fkey FOREIGN KEY (estudiante) REFERENCES public.estudiantes(codestudiante);


--
-- TOC entry 2776 (class 2606 OID 16509)
-- Name: regnotas regnotas_materia_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regnotas
    ADD CONSTRAINT regnotas_materia_fkey FOREIGN KEY (materia) REFERENCES public.materias(codmateria);


--
-- TOC entry 2777 (class 2606 OID 16514)
-- Name: regnotas regnotas_profesor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regnotas
    ADD CONSTRAINT regnotas_profesor_fkey FOREIGN KEY (profesor) REFERENCES public.profesores(codprofesor);


-- Completed on 2019-09-04 08:16:22

--
-- PostgreSQL database dump complete
--

