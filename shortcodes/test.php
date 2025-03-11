<?php

echo "Hello world";

// ted je potreba nacist podporu php v souboru kam budeme shortcode vkladat
// zapis pro nacteni kalsicky: require "vendor/autoload.php";
// simple example pak:
//	echo primakurzy\Shortcode\Processor::process('folder/with/shortcodes', 'random number: [rand from=5 to=10]');
//		-rikame zpracuj ty shortcody kdy uvadime cestu ke slozce s danymi shortcody
//		-soucasne tomu davame nejaky textovy obsah a ono to v tom najde ty shortcody a necha je to zpracovat