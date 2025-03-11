<?php

require "vendor/autoload.php";
require "stranky.php";

if(array_key_exists("stranka", $_GET))
{
	$stranka = $_GET["stranka"];

	// kontrola zda li zadana stranka existuje
	if (array_key_exists($stranka, $seznamStranek) == false)
	{
		// stranka neexistuje
			// (tzn musime zobrazit nejakou zastupnou prijemnou pro uzivatele)
			// (neexistujicim strankam se nejcasteji rika 404, jelikoz to odpovida http kodu ktery definuje ze ta URL neexistuje)
		$stranka = "404";

		// odeslani informace i vyhledavaci ze URL neexistuje
		http_response_code(404);
	}
}
else
{
	// zjistime prvni stranku z pole seznamStranek
	$stranka = array_key_first($seznamStranek);
}

?>

<!DOCTYPE html>
<html lang="cs">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title><?php echo $seznamStranek[$stranka]->titulek ?></title>
	<link rel="stylesheet" href="css/reset.css">
	<link rel="stylesheet" href="fontawesome/css/all.min.css">
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/header.css">
	<link rel="stylesheet" href="css/section.css">
	<link rel="stylesheet" href="css/footer.css">
	<link rel="shortcut icon" href="img/favicon.png" type="image/x-icon">
	<link rel="stylesheet" href="vendor\photoswipe\dist\photoswipe.css">
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
</head>

<body>
	<header>

		<menu>
			<div class="container">

				<a href="./uvod" class="logo">
					<img src="img/logo.png" alt="Logo PrimaKavárna" width="142" height="80">
				</a>
				
				<nav>
					<ul>
						<?php
							foreach($seznamStranek as $idStranky => $instanceStranky)
							{
								if ($instanceStranky->menu !="")
								{
									echo "<li><a href=$instanceStranky->id>$instanceStranky->menu</a></li>";
									/* misto $instanceStranky->id by slo klidne to $idStranky vyslo by to rovnocene */
								}
							}
						?>
					</ul>
				</nav>
			
			</div>
		</menu>

		<div class="nadpis">
			<h2>PrimaKavárna</h2>
			<h3>Jsme tu pro Vás již od roku 2002</h3>
			<div class="social">
				<a href="https://www.facebook.com/FIRMA" target="_blank"><i class="fa-brands fa-facebook"></i></a>
				<a href="https://www.instagram.com/FIRMA" target="_blank"><i class="fa-brands fa-instagram"></i></i></a>
				<a href="https://www.youtube.com/FIRMA" target="_blank"><i class="fa-brands fa-youtube"></i></i></a>
			</div>
		</div>

	</header>

	<section id="content">

		<?php
		$obsah = $seznamStranek[$stranka]->getObsah();
		echo primakurzy\Shortcode\Processor::process('shortcodes', $obsah);
		?>
		
	</section id="content">

	<footer>
		<div class="container">

			<nav>
				<h3>Menu</h3>
				<ul>
					<?php
						foreach($seznamStranek as $idStranky => $instanceStranky)
						{
							if ($instanceStranky->menu !="")
							{
								echo "<li><a href=$instanceStranky->id>$instanceStranky->menu</a></li>";
								/* misto $instanceStranky->id by slo klidne to $idStranky vyslo by to rovnocene */
							}
						}
					?>
				</ul>
			</nav>

			<div>
				<h3>Kontakt</h3>
				<address>
					<a href="https://mapy.cz/s/fovudugoro" target="_blank">
						PrimaKavárna<br>
						Jablonského 2<br>
						Praha, Holešovice
					</a>
				</address>
			</div>

			<div class="otevreno">
				<h3>Otevřeno</h3>
				<table>
					<tr>
						<th>Po - Pá:</th>
						<td>8 - 20h</td>
					</tr>
					<tr>
						<th>So:</th>
						<td>10h - 22h</td>
					</tr>
					<tr>
						<th>Ne:</th>
						<td>12h - 20h</td>
					</tr>
				</table>
			</div>

		</div>
	</footer>

	<div id="nahoru"><i class="fa-solid fa-angle-up"></i></div>

	<script src="js/index.js"></script>
</body>

</html>