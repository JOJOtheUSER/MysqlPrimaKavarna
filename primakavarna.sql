-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Pát 07. bře 2025, 14:13
-- Verze serveru: 10.4.32-MariaDB
-- Verze PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `primakavarna`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `stranka`
--

DROP TABLE IF EXISTS `stranka`;
CREATE TABLE `stranka` (
  `id` varchar(100) NOT NULL,
  `titulek` text DEFAULT NULL,
  `menu` text DEFAULT NULL,
  `obsah` text DEFAULT NULL,
  `poradi` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `stranka`
--

INSERT INTO `stranka` (`id`, `titulek`, `menu`, `obsah`, `poradi`) VALUES
('404', 'Stránka neexistuje', '', '<p> </p>\r\n<!-- budeme to chtit nastylovat a proto nemuze byt class=404 (v css nemuze byt class cislo) i kdyz by to bylo zretelnejsi -->\r\n<div class=\"stranka-neexistuje\">\r\n<h1>Stránka neexistuje</h1>\r\n<div class=\"obrazek\"><img src=\"img/error.png\" alt=\"Stránka neexistuje\" /></div>\r\n</div>', 5),
('galerie', 'PrimaKavárna - Fotogalerie', 'Galerie', '<div class=\"galerie\">\r\n<div class=\"obsah\">\r\n<div class=\"container\">\r\n<h1>Galerie</h1>\r\n<p>Podívejte se na prostředí naší kavárny ještě dříve než se u nás zastavíte na lahodný zákusek nebo kafe. Prostor naší kavárny Vám bude evokovat doby dávno minulé a pokud jste si oblíbili třicátá léta minulého století, budete se u nás cítit jako doma. Těšíme se na Vaší návštěvu jsme připraveni Vám nabídnout jen to nejlepší.</p>\r\n<p></p>\r\n<p>[fotogalerie slozka=\"dezerty\"]</p>\r\n<div class=\"fotky\"><a href=\"img/galerie/dezert1.jpg\"></a> <br /><br /><br /></div>\r\n</div>\r\n<!-- container --></div>\r\n<!-- obsah --></div>\r\n<!-- nabidka -->\r\n<p></p>', 2),
('kontakt', 'PrimaKavárna - Kontakt', 'Kontakt', '<div class=\"kontakt\">\r\n<div class=\"info\">\r\n<div class=\"container\">\r\n<h1>Kontakt</h1>\r\n<div class=\"informace\">\r\n<div class=\"adresa\">\r\n<h2>Adresa</h2>\r\n<address><a href=\"https://mapy.cz/s/fovudugoro\" target=\"_blank\" rel=\"noopener\"> PrimaKavárna<br />Jablonského 2<br />Praha, Holešovice </a></address>\r\n<ul class=\"kontakt\">\r\n<li><i class=\"fa-solid fa-phone\"></i> Telefon <a href=\"tel:606123456\">606 123 456</a></li>\r\n<li><i class=\"fa-solid fa-at\"></i> E-mail <a href=\"mailto:606123456\">info@primakavarna.cz</a></li>\r\n</ul>\r\n<!-- kontakt --></div>\r\n<!-- adresa -->\r\n<div class=\"otevreno\">\r\n<h2>Otevřeno</h2>\r\n<table>\r\n<tbody>\r\n<tr>\r\n<th>Po - Pá:</th>\r\n<td>8 - 20h</td>\r\n</tr>\r\n<tr>\r\n<th>So:</th>\r\n<td>10h - 22h</td>\r\n</tr>\r\n<tr>\r\n<th>Ne:</th>\r\n<td>12h - 20h</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n<!-- otevreno --></div>\r\n<!-- informace --></div>\r\n<!-- container --></div>\r\n<!-- info -->\r\n<div class=\"mapa\"><iframe src=\"https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d20471.163797059093!2d14.4410536!3d50.1069634!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x470b94b58406182b%3A0x1f35b827dff20972!2sJablonsk%C3%A9ho%20640%2F2%2C%20170%2000%20Praha%207-Hole%C5%A1ovice!5e0!3m2!1scs!2scz!4v1723644857833!5m2!1scs!2scz\" width=\"100%\" height=\"450\" style=\"border: 0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe></div>\r\n[kontaktni-formular email=\"spravce@primakavarna.cz\"] <!-- kontakt -->\r\n<p></p>\r\n</div>', 4),
('nabidka', 'PrimaKavárna - Nabídka', 'Nabídka', '<div class=\"nabidka\">\r\n<div class=\"obsah\">\r\n<div class=\"container\">\r\n<h1>Nabídka</h1>\r\n<p>Každý den pro Vás náš personál připravuje spoutu výtečných pochoutek, laskomin, vynkající kávu, domácí limonády a to vše si můžete vybrat právě zde. Už máte chuť? Stavte se u nás:)</p>\r\n<div class=\"boxy\">\r\n<div class=\"karta\">\r\n<div class=\"obrazek\">\r\n<h2>Espresso</h2>\r\n<img src=\"img/nabidka-espresso.jpg\" alt=\"Espresso\" width=\"500\" height=\"333\" /></div>\r\n<!-- obrazek -->\r\n<div class=\"cenik\">\r\n<table>\r\n<tbody>\r\n<tr>\r\n<th>Espresso</th>\r\n<td>45  Kč</td>\r\n</tr>\r\n<tr>\r\n<th>Espresso Macchiato</th>\r\n<td>55 Kč</td>\r\n</tr>\r\n<tr>\r\n<th>Cappuccino</th>\r\n<td>60 Kč</td>\r\n</tr>\r\n<tr>\r\n<th>Double espresso</th>\r\n<td>65 Kč</td>\r\n</tr>\r\n<tr>\r\n<th>Flat White</th>\r\n<td>60 Kč</td>\r\n</tr>\r\n<tr>\r\n<th>Cafe Latte</th>\r\n<td>80 Kč</td>\r\n</tr>\r\n<tr>\r\n<th>Espresso Tonic</th>\r\n<td>80 Kč</td>\r\n</tr>\r\n<tr>\r\n<th>Irish Coffee</th>\r\n<td>135 Kč</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n<!-- cenik --></div>\r\n<!-- karta -->\r\n<div class=\"karta\">\r\n<div class=\"obrazek\">\r\n<h2>Dezerty</h2>\r\n<img src=\"img/nabidka-dezerty.jpg\" alt=\"Dezerty\" width=\"500\" height=\"333\" /></div>\r\n<!-- obrazek -->\r\n<div class=\"cenik\">\r\n<table>\r\n<tbody>\r\n<tr>\r\n<th>Cheesecake</th>\r\n<td>69 Kč</td>\r\n</tr>\r\n<tr>\r\n<th>Mrkvový dortík</th>\r\n<td>79 Kč</td>\r\n</tr>\r\n<tr>\r\n<th>Muffin čokoládový</th>\r\n<td>50 Kč</td>\r\n</tr>\r\n<tr>\r\n<th>Skořicový rohlíček</th>\r\n<td>59 Kč</td>\r\n</tr>\r\n<tr>\r\n<th>Apple Pie</th>\r\n<td>49 Kč</td>\r\n</tr>\r\n<tr>\r\n<th>Panna Cotta</th>\r\n<td>55 Kč</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n<!-- cenik --></div>\r\n<!-- karta -->\r\n<div class=\"karta\">\r\n<div class=\"obrazek\">\r\n<h2>Snídaně</h2>\r\n<img src=\"img/nabidka-snidane.jpg\" alt=\"Snídaně\" width=\"500\" height=\"333\" /></div>\r\n<!-- obrazek -->\r\n<div class=\"cenik\">\r\n<table>\r\n<tbody>\r\n<tr>\r\n<th>Vejce Benedict soufflé</th>\r\n<td>135 Kč</td>\r\n</tr>\r\n<tr>\r\n<th>Vejce Florenine soufflé</th>\r\n<td>135 Kč</td>\r\n</tr>\r\n<tr>\r\n<th>Bürcher müsli s mátovým sirupem a ovocem</th>\r\n<td>90 Kč</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n<!-- cenik --></div>\r\n<!-- karta -->\r\n<div class=\"karta\">\r\n<div class=\"obrazek\">\r\n<h2>Nealko</h2>\r\n<img src=\"img/nabidka-nealko.jpg\" alt=\"Nealko\" width=\"500\" height=\"333\" /></div>\r\n<!-- obrazek -->\r\n<div class=\"cenik\">\r\n<table>\r\n<tbody>\r\n<tr>\r\n<th>Domácí limonády 0,25l</th>\r\n<td>40 Kč</td>\r\n</tr>\r\n<tr>\r\n<th>Fentimans Giner beer 0,125l</th>\r\n<td>65 Kč</td>\r\n</tr>\r\n<tr>\r\n<th>Fentimans limonády 0,275l</th>\r\n<td>65 Kč</td>\r\n</tr>\r\n<tr>\r\n<th>Thomas Henry Grapefruit 0,2l</th>\r\n<td>55 Kč</td>\r\n</tr>\r\n<tr>\r\n<th>Fritz Cola 0,33l</th>\r\n<td>45 Kč</td>\r\n</tr>\r\n<tr>\r\n<th>Fritz Cola light 0,33l</th>\r\n<td>40 Kč</td>\r\n</tr>\r\n<tr>\r\n<th>Juice 0,2l</th>\r\n<td>30 Kč</td>\r\n</tr>\r\n<tr>\r\n<th>John Lemon limonády 0,33l</th>\r\n<td>32 Kč</td>\r\n</tr>\r\n<tr>\r\n<th>Minerální voda Coralba 0,25l</th>\r\n<td>20 Kč</td>\r\n</tr>\r\n<tr>\r\n<th>Minerální voda Coralba 0,75l</th>\r\n<td>40 Kč</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n<!-- cenik --></div>\r\n<!-- karta --></div>\r\n<!-- boxy --></div>\r\n<!-- container --></div>\r\n<!-- obsah --></div>\r\n<!-- nabidka -->', 1),
('rezervace', 'PrimaKavárna - Rezervace', 'Rezervace', '<div class=\"rezervace\">\r\n<div class=\"obsah\">\r\n<div class=\"container\">\r\n<h1>Rezervace</h1>\r\n<p>Pokud si chcete odpočinout v příjemném prostředí naší kavárny, pobavit se s přáteli či obchodními partnery, rozhodně Vám doporučujeme zarezervovat si vhodný počet míst.</p>\r\n<ul class=\"kontakt\">\r\n<li><i class=\"fa-solid fa-phone\"></i> Volat můžete na tel.: <a href=\"tel:606123456\">606 123 456</a></li>\r\n<li><i class=\"fa-solid fa-at\"></i> Psát na e-mail: <a href=\"mailto:606123456\">rezervace@primakavarna.cz</a></li>\r\n<li><i class=\"fa-brands fa-wpforms\"></i> Nebo můžete využít následující rezervační formulář</li>\r\n</ul>\r\n<!-- kontakt --> [kontaktni-formular email=\"spravce@primakavarna.cz\"]\r\n<h2>Těšíme se na Vaši návši návštěvu, brzy na viděnou.</h2>\r\n</div>\r\n<!-- container --></div>\r\n<!-- obsah --></div>\r\n<!-- rezervace -->\r\n<p></p>', 3),
('uvod', 'PrimaKavárna', 'Domů', '<div class=\"domu\">\r\n<div class=\"onas\">\r\n<div class=\"container\">\r\n<h1>O nás</h1>\r\n<p>Naše PrimaKavárna je originální a příjemné místo inspirované prostředím francouzských kaváren. V nabídce najdete prvotřídní vína z Francie, Itálie i Čech. Především pro pány máma čepované tradiční české pivo Únětice a řadu lahodných lehkých jídel. Nechybí skvělá káva a dobré čaje, a tak si každý přijde na své. Návštěvou naší kavárny potěšíte nejen své chuťové buňky, ale také potrápíte mozkové závity při hraní deskových her, které si můžete vypůjčit :).</p>\r\n<div class=\"boxy\">\r\n<div class=\"karta\"><img src=\"img/pribeh-kava.jpg\" alt=\"Káva\" width=\"300\" height=\"200\" />\r\n<div class=\"text\">\r\n<h2>Káva</h2>\r\n<p>Kávovník je ovocný strom, jehož plodem jsou peckovice. Kávová zrna jsou tedy vlastně pecky kávových třešní. Samotný plod je jedlý a sušený se v některých zemích používá k výrobě čaje zvaného cascara.</p>\r\n<a href=\"nabidka\">Více <i class=\"fa-solid fa-angles-right\"></i></a></div>\r\n</div>\r\n<div class=\"karta\"><img src=\"img/pribeh-dobroty.jpg\" alt=\"Dobroty\" width=\"300\" height=\"200\" />\r\n<div class=\"text\">\r\n<h2>Dobroty</h2>\r\n<p>Dáváme si záležet na tom, aby naše pokrmy byly lehké, jednoduché a chutné. Ze zásady pracujeme pouze s chlazeným masem, pečivo si připravujeme sami, vyhýbáme se polotovarům a snažíme se připravovat všechny pokrmy kompletně sami - to je naše vnímání domácí kuchyně.</p>\r\n<a href=\"nabidka\">Více <i class=\"fa-solid fa-angles-right\"></i></a></div>\r\n</div>\r\n<div class=\"karta\"><img src=\"img/pribeh-zakusky.jpg\" alt=\"Zákusky\" width=\"300\" height=\"200\" />\r\n<div class=\"text\">\r\n<h2>Zákusky</h2>\r\n<p>Mezi naše oblíbené zákusky patří větrníky, věnečky, špičky, kremrole, indiánci, nejrůznější typy řezů, dortíků či rolád.</p>\r\n<a href=\"nabidka\">Více <i class=\"fa-solid fa-angles-right\"></i></a></div>\r\n</div>\r\n</div>\r\n<!-- boxy --></div>\r\n<!-- container --></div>\r\n<!-- onas -->\r\n<div class=\"akce\">\r\n<div class=\"levy\">\r\n<div class=\"boxy\">\r\n<div class=\"box\"></div>\r\n<h2>Každé pondělí cappuccino zdarma</h2>\r\n<p>Zajděte si k nám v pondělí dopoledne pro cappuccino s sebou a získáte pro Vaše hezčí pondělí druhé cappuccino ZDARMA! Děláme vše pro vaše hezké pondělky!</p>\r\n<div class=\"box\"></div>\r\n<h2>Sleva pro stále zákazníky</h2>\r\n<p>Už víte, že máme tu nejlepší kávu, skvělé zákusky, lahodné dezerty a úžasný tým, který Vám splní vše co si budete přát. Aby jste k nám chodili s ještě větší láskou stačí si na baru zažádat o naší věrnostní kartičku. Věřte, že nebudete litovat :)</p>\r\n</div>\r\n</div>\r\n<!-- levy -->\r\n<div class=\"pravy\">\r\n<div class=\"lista\"></div>\r\n</div>\r\n<!-- pravy --></div>\r\n<!-- akce -->\r\n<div class=\"tip\">\r\n<div class=\"container\">\r\n<div class=\"fotky\"><img src=\"img/tip-chleba.jpg\" alt=\"Chleba\" width=\"300\" height=\"450\" /> <img src=\"img/tip-vareni.jpg\" alt=\"Vaření\" width=\"300\" height=\"450\" /></div>\r\n<div class=\"text\">\r\n<h2>Náš tip</h2>\r\n<p>Také milujete čerstvé měkké pečivo a voňavý chléb s křupavou kůrčičkou a nestojíte o davy lidí v supermarketu? Vynikající chléb, rohlíky a housky pro vás připravujeme každý den.</p>\r\n<p>Využíváme naší osvědčenou recepturu, kterou naši pekaři vypiplali k naprosté dokonalosti. Těšíte se na ten nejlepší chléb?</p>\r\n</div>\r\n</div>\r\n<!-- container --></div>\r\n<!-- tip --></div>\r\n<!-- domu -->\r\n<p></p>', 0);

--
-- Indexy pro exportované tabulky
--

--
-- Indexy pro tabulku `stranka`
--
ALTER TABLE `stranka`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
