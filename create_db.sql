CREATE DATABASE primakavarna COLLATE utf8_czech_ci;

CREATE Table stranka
(
	id VARCHAR(100) PRIMARY KEY,
	titulek TEXT,
	menu TEXT,
	obsah TEXT,
	poradi INT
);

INSERT INTO stranka SET
	id = "uvod",
	titulek = "PrimaKavárna",
	menu = "Domů",
	obsah = "...",
	poradi = 1;

	INSERT INTO stranka SET
	id = "nabidka",
	titulek = "PrimaKavárna - Nabídka",
	menu = "Nabídka",
	obsah = "...",
	poradi = 2;

	INSERT INTO stranka SET
	id = "galerie",
	titulek = "PrimaKavárna - Fotogalerie",
	menu = "Galerie",
	obsah = "...",
	poradi = 3;

	INSERT INTO stranka SET
	id = "rezervace",
	titulek = "PrimaKavárna - Rezervace",
	menu = "Rezervace",
	obsah = "...",
	poradi = 4;

	INSERT INTO stranka SET
	id = "kontakt",
	titulek = "PrimaKavárna - Kontakt",
	menu = "Kontakt",
	obsah = "...",
	poradi = 5;

	INSERT INTO stranka SET
	id = "404",
	titulek = "Stránka neexistuje",
	menu = "",
	obsah = "...",
	poradi = 6;

--testovaci stranka
	INSERT INTO stranka SET
	id = "test",
	titulek = "testovaci stranka",
	menu = "Test",
	obsah = "...",
	poradi = 7;

-- chyba v update dotazu
UPDATE stranka SET id = "test2", titulek = "...", menu = "..." WHERE id = "test2"
-- v podmince musi byt id puvodni a ne to nove test2
-- dotaz nemuze byt proveden spravne protoze menime id na test2 strance ktera ma mit udajne id test2 ale to jeste neprobehlo