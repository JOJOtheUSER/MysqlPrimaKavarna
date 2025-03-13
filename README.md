UVOD

-ukazka: https://good-coffee.kvalitne.cz/
-vytvořeno pouze na základě vanilla PHP, JS a HTML + CSS
-projekt využívá databázový systém MySQL
-zahrnuje možnost editace webu po přihlášeni administrátora


INSTALACE

-instalace není nutná (obsahuje i vendor)
-pro provoz je potřeba pouze lokální server, MySQL a mailer
-zmíněné požadavky lze splnit napr balíčekem XAMPP (pro Windows)


PROJEKT POUZIVA

-Thunderer/Shortcode (podpora shortcodes)
-pouziti PhotoSwipe a PHPMailer (SMTP)
-TinyMCE (WYSIWYG editor) a Responsive FileManager pro TinyMCE
-Responsive FileManager (od PrimaKurzy): 


BEZPECNOST

-pro zbyseni bezpecnosti je vhodne soubor config.php umistit "nad" verejny adresar
-na hostingu je casto k dispozici jiz pripraveny verejny adresar kam vlozime zbytek projektu
-config.php pak umistit na uroven daneho adresare
-alternativne je mozne pouzit .htaccess pro presmerovani provozu
-pokud je config.php umisten "nad" verejnym adresarem, v souboru stranky.php zmenit nacitani config.php
-zmena na: require __DIR__ . "/../config.php";









