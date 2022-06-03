--
--
-- TURIST(#id_turist, nume, prenume, data_nastere)
-- ACHIZITIONEAZA(#cod_turist, #cod_excursie, #data_start, data_end, data_achizitie,
-- discount)
-- EXCURSIE(#id_excursie, denumire, pret, destinatie, durata, cod_agentie, nr_locuri)
-- AGENTIE(#id_agentie, denumire, oras)

-- Versiunea serverului Oracle

-- SELECT * FROM v$version;

-- Creare tabel turist


-- DROP TABLE  GLI_TURIST;

-- CREATE TABLE GLI_TURIST (
--     id_turist NUMBER PRIMARY KEY NOT NULL ,
--     nume VARCHAR2(50) NOT NULL,
--     prenume VARCHAR2(50) NOT NULL,
--     data_nastere DATE NOT NULL
-- );

-- Pentru oracle 11g nu trebuie creat un sequence prin intermediul caruia
-- cheia primara sa se autoincrementeze



-- CREATE SEQUENCE gli_turist_sequence;




-- Adaugam un trigger la inserarea turistilor in tabel

-- CREATE OR REPLACE TRIGGER gli_turist_on_insert
--     BEFORE INSERT ON GLI_TURIST
--     FOR EACH ROW
--     BEGIN
--         SELECT gli_turist_sequence.nextval
--             INTO :new.id_turist
--         FROM DUAL;
--     END;


-- Inserare de date in tabel
--
-- INSERT INTO GLI_TURIST (nume, prenume, data_nastere) VALUES ('Gheorghe', 'Liviu-Ionut', '18-FEB-2003');
-- INSERT INTO GLI_TURIST (nume, prenume, data_nastere) VALUES ('Alexandru', 'Lemnaru', '25-JUN-2003');
-- INSERT INTO GLI_TURIST (nume, prenume, data_nastere) VALUES ('Eusebiu', 'Georgescu', '04-JAN-2002');
-- INSERT INTO GLI_TURIST (nume, prenume, data_nastere) VALUES ('Beatrice', 'Niculescu', '15-MAR-2000');
-- INSERT INTO GLI_TURIST (nume, prenume, data_nastere) VALUES ('Alina', 'Raicu', '19-NOV-2001');


-- vizualizarea tuturor entry-urilor din tabel

-- SELECT * FROM GLI_TURIST;

-- COMMIT;


-- Creare tabel AGENTIE


-- CREATE TABLE GLI_AGENTIE (
--     id_agentie NUMBER PRIMARY KEY NOT NULL,
--     denumire VARCHAR2(50) NOT NULL ,
--     oras VARCHAR2(50) NOT NULL
-- );


-- Pentru oracle 11g nu trebuie creat un sequence prin intermediul caruia
-- cheia primara sa se autoincrementeze


-- CREATE SEQUENCE gli_agentie_sequence;


-- Adaugam un trigger la inserarea turistilor in tabel

-- CREATE OR REPLACE TRIGGER gli_agentie_on_insert
--     BEFORE INSERT ON GLI_AGENTIE
--     FOR EACH ROW
--     BEGIN
--         SELECT gli_agentie_sequence.nextval
--             INTO :new.id_agentie
--         FROM DUAL;
--     END;
--


-- Inserare de date in tabel
--
-- INSERT INTO GLI_AGENTIE (denumire, oras) VALUES ('Christian Tour', 'Bucuresti');
-- INSERT INTO GLI_AGENTIE (denumire, oras) VALUES ('Veltravel', 'Bucuresti');
-- INSERT INTO GLI_AGENTIE (denumire, oras) VALUES ('Eximtur', 'Bucuresti');
-- INSERT INTO GLI_AGENTIE (denumire, oras) VALUES ('Pietroasele Travel', 'Buzau');
-- INSERT INTO GLI_AGENTIE (denumire, oras) VALUES ('Aerocenter', 'Cluj Napoca');

--
-- SELECT * from GLI_AGENTIE;


-- Creare tabel EXCURSIE

--
-- CREATE TABLE GLI_EXCURSIE (
--     id_excursie NUMBER PRIMARY KEY NOT NULL ,
--     denumire VARCHAR2(50) NOT NULL,
--     pret NUMBER NOT NULL,
--     destinatie VARCHAR2(50) NOT NULL,
--     durata NUMBER NOT NULL,
--     cod_agentie NUMBER,
--     nr_locuri NUMBER,
--     CONSTRAINT fk_agentie
--         FOREIGN KEY (cod_agentie)
--         REFERENCES GLI_AGENTIE(id_agentie)
-- );


-- CREATE SEQUENCE gli_excursie_sequence;


-- Adaugam un trigger la inserarea excursiilor in tabel
--
-- CREATE OR REPLACE TRIGGER gli_excursie_on_insert
--     BEFORE INSERT ON GLI_EXCURSIE
--     FOR EACH ROW
--     BEGIN
--         SELECT gli_excursie_sequence.nextval
--             INTO :new.id_excursie
--         FROM DUAL;
--     END;
--
--
-- INSERT INTO GLI_EXCURSIE (denumire, pret, destinatie, durata, cod_agentie, nr_locuri)
--     VALUES ('Sejur 7 zile Grecia', 500, 'Grecia', 7, 1, 20);
--
--
-- INSERT INTO GLI_EXCURSIE (denumire, pret, destinatie, durata, cod_agentie, nr_locuri)
--     VALUES ('Sejur 14 zile Turcia', 800, 'Antalya', 14, 2, 20);
--
--
--
-- INSERT INTO GLI_EXCURSIE (denumire, pret, destinatie, durata, cod_agentie, nr_locuri)
--     VALUES ('Turul Europei', 4000, 'Europa', 30, 3, 50);
--
--
-- INSERT INTO GLI_EXCURSIE (denumire, pret, destinatie, durata, cod_agentie, nr_locuri)
--     VALUES ('Turul Asiei', 3500, 'Asia', 40, 4, 50);
--
--
--
--
-- INSERT INTO GLI_EXCURSIE (denumire, pret, destinatie, durata, cod_agentie, nr_locuri)
--     VALUES ('Tur USA', 10000, 'USA', 45, 5, 100);
--

--
-- SELECT * FROM GLI_EXCURSIE;


--
-- CREATE TABLE GLI_ACHIZITIONEAZA (
--     cod_turist NUMBER NOT NULL,
--     cod_excursie NUMBER NOT NULL,
--     data_start DATE NOT NULL,
--     data_end DATE NOT NULL,
--     data_achizitie DATE NOT NULL,
--     discount NUMBER NOT NULL,
--     CONSTRAINT gli_achizitioneaza_pk
--     PRIMARY KEY (cod_turist, cod_excursie, data_start),
--     CONSTRAINT cod_turist_fk
--     FOREIGN KEY (cod_turist)
--     REFERENCES GLI_TURIST(id_turist),
--     CONSTRAINT cod_excursie_fk
--     FOREIGN KEY (cod_excursie)
--     REFERENCES GLI_EXCURSIE(id_excursie)
-- )



-- Inserare date in tabelul de achizitii



--
-- INSERT INTO GLI_ACHIZITIONEAZA
-- VALUES (
-- 1,
-- 1,
-- '10-FEB-2023',
-- '17-FEB-2023',
-- '29-MAY-2022',
-- 0.05
-- );
--
--
-- INSERT INTO GLI_ACHIZITIONEAZA
-- VALUES (
-- 2,
-- 1,
-- '10-FEB-2023',
-- '17-FEB-2023',
-- '29-MAY-2022',
-- 0.05
-- );

-- INSERT INTO GLI_ACHIZITIONEAZA
-- VALUES (
-- 3,
-- 1,
-- '10-FEB-2023',
-- '17-FEB-2023',
-- '29-MAY-2022',
-- 0.05
-- );

-- INSERT INTO GLI_ACHIZITIONEAZA
-- VALUES (
-- 4,
-- 3,
-- '10-FEB-2023',
-- '17-FEB-2023',
-- '30-JUN-2022',
-- 0.05
-- );


-- 1.Să se afişeze denumirea primei excursii achizitionate

SELECT denumire
FROM (SELECT *
      FROM ACHIZITIONEAZA
               INNER JOIN EXCURSIE E on E.id_excursie = ACHIZITIONEAZA.cod_excursie
      ORDER BY data_achizitie) WHERE ROWNUM <= 1;


-- 2.Afişati de câte ori a fost achizitionată fiecare excursie.


SELECT DENUMIRE, "Nr de achizitii"
FROM (SELECT COD_EXCURSIE, COUNT(*) AS "Nr de achizitii" FROM ACHIZITIONEAZA GROUP BY COD_EXCURSIE) "EXC" INNER JOIN EXCURSIE
ON EXC.COD_EXCURSIE = EXCURSIE.ID_EXCURSIE;



-- 3.Să  se  afişeze  pentru  fiecare  agentie,  denumirea,  oraşul,  numărul  de  excursii  oferite, media preturilor excursiilor oferite.
SELECT AGENTIE.DENUMIRE, AGENTIE.ORAS, COUNT(*) AS "Nr excursii oferite", AVG(PRET) AS "Pret mediu excursie" FROM AGENTIE INNER JOIN EXCURSIE E on AGENTIE.ID_AGENTIE = E.COD_AGENTIE GROUP BY AGENTIE.DENUMIRE, AGENTIE.ORAS;



-- 4.
-- a. Să se obtină numele şi prenumele turiştilor care au achizitionat cel putin 2 excursii.
-- b. Să se obtină numărul turiştilor care au achizitionat cel putin 2 excursii.

-- a 
SELECT NUME, PRENUME  FROM ACHIZITIONEAZA INNER JOIN TURIST T on T.ID_TURIST = ACHIZITIONEAZA.COD_TURIST GROUP BY NUME, PRENUME HAVING COUNT(*) >= 2;


-- b
SELECT COUNT(*) AS "Nr turisti cu >= 2 excursii"
FROM (SELECT NUME, PRENUME AS "Nr excursii achizitionate"
      FROM ACHIZITIONEAZA
               INNER JOIN TURIST T on T.ID_TURIST = ACHIZITIONEAZA.COD_TURIST
      GROUP BY NUME, PRENUME
      HAVING COUNT(*) >= 2);


-- 5.Afişati informatii despre turiştii care nu au achizitionat excursii cu destinatia Paris.


SELECT NUME, PRENUME
FROM ( SELECT * FROM ACHIZITIONEAZA INNER JOIN TURIST T on T.ID_TURIST = ACHIZITIONEAZA.COD_TURIST) "AT*"
INNER JOIN EXCURSIE ON "AT*".COD_EXCURSIE = EXCURSIE.ID_EXCURSIE GROUP BY NUME, PRENUME
HAVING INSTR(LOWER(LISTAGG(EXCURSIE.DESTINATIE, ',') WITHIN GROUP (ORDER BY EXCURSIE.DESTINATIE)), 'paris') = 0;




-- 6. Afişati  codul şi  numele  turiştilor  care  au  achizitionat  excursii  spre  cel  putin  două destinatii diferite.



WITH BOOKINGS AS (SELECT DISTINCT COD_TURIST , NUME, PRENUME, DESTINATIE
FROM (SELECT COD_TURIST, NUME, PRENUME, COD_EXCURSIE
      FROM ACHIZITIONEAZA
               INNER JOIN TURIST T on T.ID_TURIST = ACHIZITIONEAZA.COD_TURIST) "TA*"
INNER JOIN EXCURSIE ON "TA*".COD_EXCURSIE = EXCURSIE.ID_EXCURSIE)
SELECT COD_TURIST, NUME FROM BOOKINGS GROUP BY COD_TURIST, NUME HAVING COUNT(*) >= 2;



-- 7. Să se afişeze pentru fiecare agentie, denumirea şi profitul obtinut.
-- (Profitul obtinut din vânzarea  unei  excursii  este pret  –  pret  *  discount.
-- Dacă  discountul  este  necunoscut profitul este pretul excursiei).




-- WITH BOOKINGS AS (
-- SELECT *
-- FROM (SELECT "AE*".*, AGENTIE.DENUMIRE AS "AGENTIE_DENUMIRE", AGENTIE.ID_AGENTIE, AGENTIE.ORAS
--       FROM (SELECT *
--             FROM ACHIZITIONEAZA
--                      INNER JOIN EXCURSIE E on E.ID_EXCURSIE = ACHIZITIONEAZA.COD_EXCURSIE) "AE*"
--                INNER JOIN AGENTIE ON AGENTIE.ID_AGENTIE = "AE*".COD_AGENTIE) BOOKINGS
-- )
-- SELECT * FROM BOOKINGS;

--
-- WITH BOOKINGS AS (
-- SELECT *
-- FROM (SELECT "AE*".*, AGENTIE.DENUMIRE AS "AGENTIE_DENUMIRE", AGENTIE.ID_AGENTIE, AGENTIE.ORAS
--       FROM (SELECT *
--             FROM ACHIZITIONEAZA
--                      INNER JOIN EXCURSIE E on E.ID_EXCURSIE = ACHIZITIONEAZA.COD_EXCURSIE) "AE*"
--                INNER JOIN AGENTIE ON AGENTIE.ID_AGENTIE = "AE*".COD_AGENTIE) BOOKINGS
-- )
--     SELECT AGENTIE_DENUMIRE, PRET - PRET * NVL(DISCOUNT, 0) AS "PRET_FINAL" FROM BOOKINGS;
--

-- WITH BOOKINGS AS (
-- SELECT *
-- FROM (SELECT "AE*".*, AGENTIE.DENUMIRE AS "AGENTIE_DENUMIRE", AGENTIE.ID_AGENTIE, AGENTIE.ORAS
--       FROM (SELECT *
--             FROM ACHIZITIONEAZA
--                      INNER JOIN EXCURSIE E on E.ID_EXCURSIE = ACHIZITIONEAZA.COD_EXCURSIE) "AE*"
--                INNER JOIN AGENTIE ON AGENTIE.ID_AGENTIE = "AE*".COD_AGENTIE) BOOKINGS
-- ) SELECT AGENTIE_DENUMIRE,
--          SUM(PRET - PRET * NVL(DISCOUNT, 0)) AS "Profit" FROM BOOKINGS
--     GROUP BY AGENTIE_DENUMIRE;


WITH BOOKINGS AS (SELECT *
                  FROM (SELECT "AE*".*, AGENTIE.DENUMIRE AS "AGENTIE_DENUMIRE", AGENTIE.ID_AGENTIE, AGENTIE.ORAS
                        FROM (SELECT *
                              FROM ACHIZITIONEAZA
                                       INNER JOIN EXCURSIE E on E.ID_EXCURSIE = ACHIZITIONEAZA.COD_EXCURSIE) "AE*"
                                 RIGHT OUTER JOIN AGENTIE ON AGENTIE.ID_AGENTIE = "AE*".COD_AGENTIE) BOOKINGS)
 SELECT AGENTIE_DENUMIRE,
         SUM(NVL(PRET, 0) - NVL(PRET, 0) * NVL(DISCOUNT, 0)) AS "Profit" FROM BOOKINGS
    GROUP BY AGENTIE_DENUMIRE;


-- 8. Să se afişeze denumirea şi oraşul pentru agentiile care au cel putin 3 excursii
-- oferite la un pret mai mic decăt 2000 euro.



WITH BOOKINGS AS (SELECT *
                  FROM (SELECT "AE*".*, AGENTIE.DENUMIRE AS "AGENTIE_DENUMIRE", AGENTIE.ID_AGENTIE, AGENTIE.ORAS
                        FROM (SELECT *
                              FROM ACHIZITIONEAZA
                                       INNER JOIN EXCURSIE E on E.ID_EXCURSIE = ACHIZITIONEAZA.COD_EXCURSIE) "AE*"
                                 RIGHT OUTER JOIN AGENTIE ON AGENTIE.ID_AGENTIE = "AE*".COD_AGENTIE) BOOKINGS)
SELECT DISTINCT AGENTIE_DENUMIRE, ORAS FROM BOOKINGS WHERE DESTINATIE IS NOT NULL AND PRET <= 2000
GROUP BY AGENTIE_DENUMIRE, ORAS HAVING COUNT(*) >= 3;


-- 9. Să se afişeze excursiile care nu au fost achizitionate de către nici un turist.


WITH BOOKINGS AS (SELECT *
                  FROM (SELECT "AE*".*, AGENTIE.DENUMIRE AS "AGENTIE_DENUMIRE", AGENTIE.ID_AGENTIE, AGENTIE.ORAS
                        FROM (SELECT *
                              FROM ACHIZITIONEAZA
                                       FULL OUTER JOIN EXCURSIE E on E.ID_EXCURSIE = ACHIZITIONEAZA.COD_EXCURSIE) "AE*"
                                 FULL OUTER JOIN AGENTIE ON AGENTIE.ID_AGENTIE = "AE*".COD_AGENTIE) BOOKINGS)
SELECT DENUMIRE FROM BOOKINGS WHERE ID_EXCURSIE IS NOT NULL AND COD_TURIST IS NULL;



-- Afişati  informatii  despre  excursii,  inclusiv  denumirea  agentiei.  Pentru,
-- excursiile pentru care nu este cunoscută agentia se va afişa textul “agentie necunoscuta”

WITH BOOKINGS AS (SELECT *
                  FROM (SELECT "AE*".*, AGENTIE.DENUMIRE AS "AGENTIE_DENUMIRE", AGENTIE.ID_AGENTIE, AGENTIE.ORAS
                        FROM (SELECT *
                              FROM ACHIZITIONEAZA
                                       FULL OUTER JOIN EXCURSIE E on E.ID_EXCURSIE = ACHIZITIONEAZA.COD_EXCURSIE) "AE*"
                                 FULL OUTER JOIN AGENTIE ON AGENTIE.ID_AGENTIE = "AE*".COD_AGENTIE) BOOKINGS)
SELECT DISTINCT DENUMIRE, DESTINATIE, NVL(AGENTIE_DENUMIRE, 'agentie necunoscuta') FROM BOOKINGS WHERE ID_EXCURSIE IS NOT NULL;


-- 11. Să  se  afişeze  informatii  despre  excursiile  care  au  pretul  mai  mare  decăt  excursia
-- cu denumirea “Orasul luminilor” existentă în oferta agentiei cu codul 10.

SELECT * FROM EXCURSIE WHERE PRET > (SELECT NVL(PRET, 0) FROM EXCURSIE WHERE DENUMIRE = 'Orasul luminilor' AND COD_AGENTIE = 10);


-- 12. Să  se  obtină  lista  turiştilor  care  au  achizitionat  excursii  cu  o  durata  mai  mare  de  10 zile.
-- (se va lua în considerare data_start şi data_end)


SELECT  DISTINCT ID_TURIST, NUME, PRENUME, DATA_NASTERE  FROM ACHIZITIONEAZA INNER JOIN TURIST T on T.ID_TURIST = ACHIZITIONEAZA.COD_TURIST
    WHERE DATA_END - DATA_START  >= 10;


-- 13. Să se obtină excursiile achizitionate de cel putin un turist vârsta mai mică de 30 de ani.


select EXCURSIE.*
from (SELECT DISTINCT COD_EXCURSIE
      FROM ACHIZITIONEAZA
               INNER JOIN TURIST T on T.ID_TURIST = ACHIZITIONEAZA.COD_TURIST
      WHERE DATA_NASTERE IS NOT NULL
        AND (SYSDATE - DATA_NASTERE) / 365 < 40) CODURI_EXC
INNER JOIN EXCURSIE ON CODURI_EXC.COD_EXCURSIE = EXCURSIE.ID_EXCURSIE;


-- 14. Să  se  obtină  turiştii  care  nu  au  achizitionat  nicio  excursie  oferită  de  agentii  din Bucuresti.


WITH "CET.*" AS (SELECT *
FROM (SELECT COD_EXCURSIE, T.*
      FROM ACHIZITIONEAZA
               INNER JOIN TURIST T on T.ID_TURIST = ACHIZITIONEAZA.COD_TURIST))
SELECT ID_TURIST, NUME, PRENUME, DATA_NASTERE
FROM (SELECT "CET.*".*, EXCURSIE.COD_AGENTIE
      FROM "CET.*"
               INNER JOIN EXCURSIE ON "CET.*".COD_EXCURSIE = EXCURSIE.ID_EXCURSIE) "BOOKING" INNER JOIN AGENTIE
                   ON BOOKING.COD_AGENTIE = AGENTIE.ID_AGENTIE
GROUP BY ID_TURIST, NUME, PRENUME, DATA_NASTERE
HAVING  INSTR(LOWER(LISTAGG(ORAS, ',') WITHIN GROUP (ORDER BY ORAS)), 'bucuresti') = 0;


-- 15. Să se obtină numele turiştilor care au achizitionat excursii care contin în denumire “1 mai”  de la o agentie din Bucureşti.


WITH "CET.*" AS (SELECT *
FROM (SELECT COD_EXCURSIE, T.*
      FROM ACHIZITIONEAZA
               INNER JOIN TURIST T on T.ID_TURIST = ACHIZITIONEAZA.COD_TURIST))
SELECT NUME
FROM (SELECT "CET.*".*, EXCURSIE.COD_AGENTIE, EXCURSIE.DENUMIRE AS "DENUMIRE_EXCURSIE"
      FROM "CET.*"
               INNER JOIN EXCURSIE ON "CET.*".COD_EXCURSIE = EXCURSIE.ID_EXCURSIE) "BOOKING" INNER JOIN AGENTIE
                   ON BOOKING.COD_AGENTIE = AGENTIE.ID_AGENTIE
WHERE INSTR(LOWER(DENUMIRE_EXCURSIE), '1 mai') > 0 AND LOWER(ORAS) = 'bucuresti';


-- 16. Să  se obtina numele,  prenume turiştilor şi excursiile oferite de agentia  “Smart Tour” achizitionate de către aceştia.


WITH BOOKINGS AS (SELECT *
                  FROM (SELECT "AE*".*, AGENTIE.DENUMIRE AS "AGENTIE_DENUMIRE", AGENTIE.ID_AGENTIE, AGENTIE.ORAS
                        FROM (SELECT *
                              FROM ACHIZITIONEAZA
                                       FULL OUTER JOIN EXCURSIE E on E.ID_EXCURSIE = ACHIZITIONEAZA.COD_EXCURSIE) "AE*"
                                 FULL OUTER JOIN AGENTIE ON AGENTIE.ID_AGENTIE = "AE*".COD_AGENTIE) BOOKINGS WHERE AGENTIE_DENUMIRE = 'Smart Tour')
SELECT NUME, PRENUME, LISTAGG(DENUMIRE, ',') WITHIN GROUP (ORDER BY DENUMIRE) AS "Excursii achizitionate" FROM BOOKINGS INNER JOIN TURIST ON BOOKINGS.COD_TURIST = TURIST.ID_TURIST
GROUP BY NUME, PRENUME;


-- 17.Să  se  afişeze  excursiile  pentru  care  nu  mai  există  locuri  pentru  data  de  plecare  14 -aug-2011

 --  Mai intai trebuie determinate toate achizitiile de excursii cu data de plecare 14-aug-2011

SELECT EXCURSIE.*
FROM (SELECT COD_EXCURSIE, COUNT(*) AS "NR_TURISTI"
      FROM ACHIZITIONEAZA
      WHERE DATA_START = '14-AUG-2011'
      GROUP BY COD_EXCURSIE) REZERVARI
INNER JOIN EXCURSIE ON REZERVARI.COD_EXCURSIE = EXCURSIE.ID_EXCURSIE
WHERE NR_LOCURI - NR_TURISTI = 0;



-- 18. Să se obtină codurile turiştilor şi codul ultimei excursii achizitionate de către aceştia.


SELECT COD_EXCURSIE AS "Cod excursie", LISTAGG(COD_TURIST, ',') WITHIN GROUP (ORDER BY COD_TURIST) AS "Coduri turisti"  FROM ACHIZITIONEAZA WHERE DATA_ACHIZITIE = (
SELECT MAX(DATA_ACHIZITIE) FROM ACHIZITIONEAZA
)
GROUP BY COD_EXCURSIE;

-- 19. Afişati topul celor mai scumpe excursii (primele 5).

 SELECT * FROM (SELECT * FROM EXCURSIE  ORDER BY PRET DESC) WHERE ROWNUM <= 5;

-- 20. Afişati  numele  turiştilor  care  au  achizitionat  excursii  cu  data  de  plecare
-- în  aceeaşi luna cu luna în care îşi serbează ziua de naştere.


SELECT NUME
FROM ( SELECT * FROM ACHIZITIONEAZA INNER JOIN TURIST T on T.ID_TURIST = ACHIZITIONEAZA.COD_TURIST) "AT*"
INNER JOIN EXCURSIE ON "AT*".COD_EXCURSIE = EXCURSIE.ID_EXCURSIE GROUP BY NUME, DATA_NASTERE
HAVING  INSTR(LISTAGG(EXTRACT(month FROM "AT*".DATA_ACHIZITIE), ',') WITHIN GROUP (ORDER BY "AT*".DATA_ACHIZITIE), EXTRACT(month FROM DATA_NASTERE)) > 0;


-- 21.Să se afişeze informatii despre turiştii care au achizitionat excursii de 2 persoane de la agentii din Constanta.


select DISTINCT ID_TURIST, NUME, PRENUME, DATA_NASTERE
from (SELECT COD_EXCURSIE, ID_TURIST, COD_AGENTIE, NUME, PRENUME, DATA_NASTERE
      FROM (SELECT *
            FROM ACHIZITIONEAZA
                     INNER JOIN TURIST T on T.ID_TURIST = ACHIZITIONEAZA.COD_TURIST) "AT*"
               INNER JOIN EXCURSIE ON "AT*".COD_EXCURSIE = EXCURSIE.ID_EXCURSIE
      WHERE NR_LOCURI = 2) "A*E"
INNER JOIN AGENTIE ON COD_AGENTIE = AGENTIE.ID_AGENTIE
WHERE ORAS = 'Constanta';

-- 22. În  functie  de  durata  excursiei  afişati  în  ordine  excursiile  cu  durata  mică
-- (durată  de maxim 5 zile),
-- medie (durata între 6 şi 19 de zile),
-- lunga (durata peste 20 de zile).

SELECT EXCURSIE.*, CASE WHEN (DURATA) <= 5 THEN 'mica' WHEN (DURATA) >= 6 AND (DURATA) <= 19 THEN 'medie' ELSE 'lunga' END AS "Tip durata"
FROM EXCURSIE ORDER BY DURATA;


-- 23.Afişati  numărul  excursiilor,  câte  excursii  sunt  oferite  de  agentii  din  Constanta,
-- câte sunt oferite de agentii din Bucureşti.


WITH EXCURSII AS (
    SELECT * FROM EXCURSIE FULL OUTER JOIN AGENTIE A2 on A2.ID_AGENTIE = EXCURSIE.COD_AGENTIE
)
SELECT * FROM (SELECT COUNT(*) AS "Numar excursii" FROM EXCURSII)
CROSS JOIN (SELECT COUNT(*) AS "Nr. ex Constanta" FROM EXCURSII WHERE EXCURSII.ORAS = 'Constanta')
CROSS JOIN (SELECT * FROM (SELECT COUNT(*) AS "Nr. ex Constanta" FROM EXCURSII WHERE EXCURSII.ORAS = 'Bucuresti') );



-- 24. Afişati excursiile care au fost achizitionate de toti turiştii în vârsta de 24 ani.

-- SELECT * FROM TURIST WHERE FLOOR(MONTHS_BETWEEN(SYSDATE, DATA_NASTERE) / 12) = 37;

SELECT COD_EXCURSIE, DENUMIRE FROM (SELECT *
              FROM (SELECT *
      FROM TURIST
               INNER JOIN ACHIZITIONEAZA A2 on TURIST.ID_TURIST = A2.COD_TURIST) "ACHIZITIE_TURIST"
INNER JOIN EXCURSIE ON ACHIZITIE_TURIST.COD_EXCURSIE = EXCURSIE.ID_EXCURSIE WHERE FLOOR(MONTHS_BETWEEN(SYSDATE, DATA_NASTERE) / 12) = 24)
    "ACHIZITII_TURISTI_VIZATI" GROUP BY COD_EXCURSIE, DENUMIRE HAVING COUNT(COD_TURIST) = (
        SELECT COUNT(*) FROM TURIST WHERE FLOOR(MONTHS_BETWEEN(SYSDATE, DATA_NASTERE) / 12) = 24
    );

-- 25. Afişati valoarea totală a excursiilor: 
--  -Pentru fiecare agentie şi în cadrul agentiei pentru fiecare destinatie.  
--  -Pentru fiecare agentie (indiferent de destinatie)
--  -Întreg tabelul.


--  -Pentru fiecare agentie şi în cadrul agentiei pentru fiecare destinatie.

SELECT DENUMIRE AS "NUME_AGENTIE", DESTINATIE, TOTAL FROM (SELECT COD_AGENTIE, DESTINATIE, SUM(PRET) AS "TOTAL" FROM EXCURSIE GROUP BY COD_AGENTIE, DESTINATIE) PRETURI
INNER JOIN AGENTIE ON PRETURI.COD_AGENTIE = AGENTIE.ID_AGENTIE;

--  -Pentru fiecare agentie (indiferent de destinatie)



SELECT DENUMIRE, COSTURI.TOTAL  FROM (SELECT EXCURSIE.COD_AGENTIE, SUM(PRET) AS "TOTAL" FROM EXCURSIE INNER JOIN AGENTIE A2 on EXCURSIE.COD_AGENTIE = A2.ID_AGENTIE
              GROUP BY A2.DENUMIRE, COD_AGENTIE) COSTURI
INNER JOIN AGENTIE ON COSTURI.COD_AGENTIE = AGENTIE.ID_AGENTIE;


--  -Întreg tabelul.
SELECT SUM(PRET)  AS "TOTAL" FROM EXCURSIE;


-- 26. Să  se  obtină  pentru  fiecare  agentie  media  preturilor  excursiilor  oferite  de  agentiile concurente
-- (situate în acelaşi oraş).



WITH MEDII_PRETURI AS (
    SELECT *  FROM (SELECT EXCURSIE.COD_AGENTIE, AVG(PRET) AS "MEDIE_PRETURI" FROM EXCURSIE INNER JOIN AGENTIE A2 on EXCURSIE.COD_AGENTIE = A2.ID_AGENTIE
              GROUP BY A2.DENUMIRE, COD_AGENTIE) COSTURI
INNER JOIN AGENTIE ON COSTURI.COD_AGENTIE = AGENTIE.ID_AGENTIE
) SELECT * FROM MEDII_PRETURI
CROSS JOIN (
    SELECT AVG(PRET) FROM EXCURSIE  WHERE (SELECT ORAS FROM AGENTIE INNER JOIN EXCURSIE E3 on AGENTIE.ID_AGENTIE = E3.COD_AGENTIE WHERE E3.COD_AGENTIE = EXCURSIE.COD_AGENTIE) = MEDII_PRETURI.ORAS AND EXCURSIE.COD_AGENTIE <> MEDII_PRETURI.COD_AGENTIE
)



-- 27. Afisati valoarea totala a excursiilor achizitionate:
-- -Pentru fiecare agentie si in cadrul agentiei pentru fiecare destinatie.
-- -Pentru fiecare agentie (indiferent de destinatie).
-- -Pentru fiecare destinatie (indiferent de agentie).
-- -Intreg tabelul.


--  -Pentru fiecare agentie şi în cadrul agentiei pentru fiecare destinatie.

SELECT DENUMIRE AS "NUME_AGENTIE", DESTINATIE, TOTAL FROM (SELECT COD_AGENTIE, DESTINATIE, SUM(PRET) AS "TOTAL" FROM EXCURSIE GROUP BY COD_AGENTIE, DESTINATIE) PRETURI
INNER JOIN AGENTIE ON PRETURI.COD_AGENTIE = AGENTIE.ID_AGENTIE;



--  -Pentru fiecare agentie (indiferent de destinatie)



SELECT DENUMIRE, COSTURI.TOTAL  FROM (SELECT EXCURSIE.COD_AGENTIE, SUM(PRET) AS "TOTAL" FROM EXCURSIE INNER JOIN AGENTIE A2 on EXCURSIE.COD_AGENTIE = A2.ID_AGENTIE
              GROUP BY A2.DENUMIRE, COD_AGENTIE) COSTURI
INNER JOIN AGENTIE ON COSTURI.COD_AGENTIE = AGENTIE.ID_AGENTIE;



-- -Pentru fiecare destinatie (indiferent de agentie).

SELECT DESTINATIE, SUM(PRET) AS "TOTAL_PER_DESTINATIE" FROM EXCURSIE INNER JOIN AGENTIE A2 on A2.ID_AGENTIE = EXCURSIE.COD_AGENTIE GROUP BY DESTINATIE;

--  -Întreg tabelul.
SELECT SUM(PRET)  AS "TOTAL" FROM EXCURSIE;



-- 28. Afisati valoarea totala a excursiilor achizitionate
-- -Pentru fiecare agentie in fiecare an in care a vandut excursii.
-- -Pentru intreg tabelul.


SELECT AGENTIE.DENUMIRE, EXTRACT(year FROM DATA_ACHIZITIE) AS "An Achizitie", SUM(PRET) AS "TOTAL"
FROM (SELECT *
      FROM ACHIZITIONEAZA
               INNER JOIN EXCURSIE E on E.ID_EXCURSIE = ACHIZITIONEAZA.COD_EXCURSIE) "AE*"
INNER JOIN AGENTIE ON "AE*".COD_AGENTIE = AGENTIE.ID_AGENTIE  GROUP BY AGENTIE.DENUMIRE, EXTRACT(year FROM DATA_ACHIZITIE) ORDER BY EXTRACT(year FROM DATA_ACHIZITIE);


SELECT SUM(PRET) AS "TOTAL_ACHIZITII" FROM ACHIZITIONEAZA INNER JOIN EXCURSIE E on E.ID_EXCURSIE = ACHIZITIONEAZA.COD_EXCURSIE;

-- 29. Sa se afiseze denumirea excursiilor cu codul agentiei necunoscut care nu au fost
-- achizitionate de niciun turist nascut in anul 1984.

SELECT * FROM (SELECT *
              FROM (SELECT * FROM EXCURSIE WHERE COD_AGENTIE IS NULL) "EXCURSII_AG_NULA"
INNER JOIN ACHIZITIONEAZA ON EXCURSII_AG_NULA.ID_EXCURSIE = ACHIZITIONEAZA.COD_EXCURSIE) "DATE_EXCURSII"
WHERE (SELECT COUNT(*) FROM ACHIZITIONEAZA WHERE COD_EXCURSIE = DATE_EXCURSII.COD_EXCURSIE AND EXTRACT(year FROM DATA_ACHIZITIE) = 1984) = 0;



-- 30.  Creati  copii  pentru  toate  tabelele  din  schema.
-- Adaugati  cheile  primare  si  externe.
--  Cheile  externe  vor  fi  create  astfel  incat  la  stergerea  unei  inregistrari  sa  se  stearga  si inregistrarile corelate.
--  Pentru urmatoarele exercitii se vor utiliza tabelele copie.



CREATE TABLE GLI_COPY_TURIST AS (SELECT * FROM TURIST);


-- Adaugare PK

ALTER TABLE GLI_COPY_TURIST ADD CONSTRAINT gli_copy_turist_pk PRIMARY KEY(ID_TURIST)



CREATE TABLE GLI_COPY_ACHIZITIONEAZA AS (SELECT * FROM ACHIZITIONEAZA);

-- Adaugare PK

ALTER TABLE GLI_COPY_ACHIZITIONEAZA ADD CONSTRAINT gli_copy_achizitioneaza_pk PRIMARY KEY(COD_TURIST, DATA_START)


SELECT * FROM GLI_COPY_ACHIZITIONEAZA;


-- Adaugare FK-uri


ALTER TABLE GLI_COPY_ACHIZITIONEAZA
ADD FOREIGN KEY (COD_EXCURSIE) REFERENCES EXCURSIE(ID_EXCURSIE) ON DELETE CASCADE;


ALTER TABLE GLI_COPY_ACHIZITIONEAZA
ADD FOREIGN KEY (COD_TURIST) REFERENCES TURIST(ID_TURIST) ON DELETE CASCADE;



CREATE TABLE GLI_COPY_EXCURSIE AS (SELECT * FROM EXCURSIE);
-- Adaugare PK
ALTER TABLE GLI_COPY_EXCURSIE ADD CONSTRAINT gli_copy_excursie_pk PRIMARY KEY(ID_EXCURSIE)



-- Adaugare FK-uri
ALTER TABLE GLI_COPY_EXCURSIE
ADD CONSTRAINT gli_copy_excursie_agentie_fk FOREIGN KEY (COD_AGENTIE) REFERENCES AGENTIE(ID_AGENTIE) ON DELETE CASCADE;

SELECT * FROM GLI_COPY_EXCURSIE;


CREATE TABLE GLI_COPY_AGENTIE AS (SELECT * FROM AGENTIE);

-- Adaugare PK
ALTER TABLE GLI_COPY_AGENTIE ADD CONSTRAINT gli_copy_agentie_pk PRIMARY KEY(ID_AGENTIE)


--
-- SELECT cols.table_name, cols.column_name, cols.position, cons.status, cons.owner, cons.constraint_type
-- FROM all_constraints cons, all_cons_columns cols
-- WHERE cols.table_name = 'GLI_COPY_AGENTIE'
-- AND cons.constraint_name = cols.constraint_name
-- AND cons.owner = cols.owner
-- ORDER BY cols.table_name, cols.position;



-- 31.  Modificati  discount-ul  obtinut  la  achizitioanrea  excursiilor  care  au  un  pret  peste medie
-- astfel  incat  sa  devina  egal  cu  maximul  discount-urilor
-- oferite  pana  acum.
-- Anulati modificarile.



-- SELECT * FROM GLI_COPY_ACHIZITIONEAZA;

--
-- SELECT * FROM GLI_COPY_ACHIZITIONEAZA INNER JOIN GLI_COPY_EXCURSIE on GLI_COPY_ACHIZITIONEAZA.COD_EXCURSIE = GLI_COPY_EXCURSIE.ID_EXCURSIE
-- WHERE PRET >= (
--         SELECT AVG(PRET) FROM GLI_COPY_EXCURSIE
--     );



UPDATE GLI_COPY_ACHIZITIONEAZA ACH SET DISCOUNT = ((SELECT MAX(DISCOUNT) FROM GLI_COPY_ACHIZITIONEAZA)) WHERE
(SELECT PRET FROM GLI_COPY_EXCURSIE INNER JOIN GLI_COPY_ACHIZITIONEAZA ON GLI_COPY_EXCURSIE.ID_EXCURSIE = GLI_COPY_ACHIZITIONEAZA.COD_EXCURSIE WHERE
       ID_EXCURSIE = ACH.COD_EXCURSIE AND COD_TURIST = ACH.COD_TURIST AND DATA_START = ACH.DATA_START) >= (SELECT AVG(PRET) FROM GLI_COPY_EXCURSIE)

SELECT MAX(DISCOUNT) FROM GLI_COPY_ACHIZITIONEAZA;


ROLLBACK;



-- 32. Stergeti toate excursiile care au pretul mai mic decat media preturilor din agentia care le pune la dispozitie. Anulati modificarile.



SELECT * FROM GLI_COPY_EXCURSIE;

DELETE FROM GLI_COPY_EXCURSIE EXC WHERE PRET < (SELECT AVG(PRET) FROM GLI_COPY_EXCURSIE WHERE COD_AGENTIE = EXC.COD_AGENTIE)

ROLLBACK;



--33.  Stergeti  constrangerea  de  cheie  externa  dintre tabelul  excursie  si  agentie.  Adaugati doua excursii cu coduri inexistente de agentii.
-- Modificati codul agentie pentru excursiile care nu corespund unei agnetii existente astfel incat sa fie cod necunoscut (null).
-- Anulati modificarile
ALTER TABLE GLI_COPY_EXCURSIE DROP CONSTRAINT gli_copy_excursie_agentie_fk;


SELECT * FROM GLI_COPY_EXCURSIE;

INSERT INTO GLI_COPY_EXCURSIE VALUES (402, 'Gura Humorului', 700, 'Romania', 3, 999, 300);
INSERT INTO GLI_COPY_EXCURSIE VALUES (455, 'Timisoara', 800, 'Romania', 10, 10832, 15);

UPDATE GLI_COPY_EXCURSIE SET COD_AGENTIE = NULL WHERE COD_AGENTIE NOT IN (SELECT ID_AGENTIE FROM GLI_COPY_AGENTIE);

ROLLBACK;


-- Creati  o  vizualizare  v_excursie  asupra  tabelului  excursie_***  care  sa  permita  inserarea in acesta doar a excursiilor oferite de agentie 10.
-- Testati inserarea unei noi inregistrari in tabelul excursie_*** prin intermediul vizualizarii v_excusie_***. Permanentizati modificarea.

CREATE OR REPLACE VIEW V_GLI_COPY_EXCURSIE AS
SELECT * FROM GLI_COPY_EXCURSIE
WHERE COD_AGENTIE = 10 WITH CHECK OPTION;


INSERT INTO V_GLI_COPY_EXCURSIE VALUES (400, 'uweduhweduwe', 2000, 'China', 55, 10, 19);
INSERT INTO V_GLI_COPY_EXCURSIE VALUES (787, 'wehdmjijbyhquwsh21e78e', 3000, 'Japonia', 12, 40, 91);

COMMIT;

-- 35. Stergeti toate inregistrarile din tabelul achizitioneaza_***. Creati un SAVEPOINT cu denumirea a.

DELETE FROM GLI_COPY_ACHIZITIONEAZA;

SAVEPOINT a;

