<?php
	require "stranky.php";

	session_start();

	$chyba = "";

	// zpracovani prihlasovaciho formulare
	if (array_key_exists("prihlasit", $_POST))
	{
		$jmeno = $_POST["jmeno"];
		$heslo = $_POST["heslo"];

		if ($jmeno == ADMIN_USER && $heslo == ADMIN_PASSWORD)
		{
			// uzivatel zadal platne prihlasovaci udaje
			$_SESSION["prihlasenyUzivatel"] = $jmeno;
		}
		else
		{
			// spatne prihlasovaci udaje
			$chyba = "Nespravné údaje";
		}
	}

	// zpracovani odhlasovaciho formulare
	if (array_key_exists("odhlasit", $_POST))
	{
		unset($_SESSION["prihlasenyUzivatel"]);
		header("Location: ?");
	}
	
	// zpracovani akcí v administraci je pouze pro prihlasene uzivatele
	if (array_key_exists("prihlasenyUzivatel", $_SESSION))
	{
		// promenna predstavujici stranku s kterou zrovna editujeme
		$instanceAktualniStranky = null;

		// zpracovani vyberu aktualni stranky

		if (array_key_exists("stranka", $_GET))
		{
			$idStranky = $_GET["stranka"];
			$instanceAktualniStranky = $seznamStranek[$idStranky];
		}

		// zpracovani tlacitka pridat
		if (array_key_exists("pridat", $_GET))
		{
			$instanceAktualniStranky = new Stranka("", "", "");
		}

		// zpracovani mazani
		if (array_key_exists("smazat", $_GET))
		{
			$instanceAktualniStranky->smazat();
			// po smazani stranky se musime presmerovat "domu"
			header("Location: ?");
		}

		// zpracovani formulare pro ulozeni
		if (array_key_exists("ulozit", $_POST))
		{
			// poznamename si puvodni id nez si ho prepiseme
			$puvodniId = $instanceAktualniStranky->id;

			$instanceAktualniStranky->id = $_POST["id"];
			$instanceAktualniStranky->titulek = $_POST["titulek"];
			$instanceAktualniStranky->menu = $_POST["menu"];
			
			// zavolame funkci pro ulozeni zmenenych hodnot do databaze
			$instanceAktualniStranky->ulozit($puvodniId);
			
			// ukladani obsahu stranky
			$obsah = $_POST["obsah"];
			$instanceAktualniStranky->setObsah($obsah);

			// presmerujeme se na url s editaci stranky s novym id
				// protoze kdyby se id zmenilo tak nesmime zustat na puvodni url
			header("Location: ?stranka=".urlencode($instanceAktualniStranky->id));
			//urlencode zajisti ze kdyby nekdo do id dal naprikald mezeru nebo jiny znak ktery v url byt nemuze tak se to nerozbije
		}

		// zpracovani pozadavku zmeny poradi stranek z JS (ajaxem)
		if (array_key_exists("poradi", $_GET))
		{
			$poradi = $_GET["poradi"];

			//zavolani funkce pro nastaveni poradi a ulozeni do db
			Stranka::nastavitPoradi($poradi);

			// odpovime jen ze srandy JS ze je to ok
			echo "OK";

			// skript ukoncime aby do JS se negeneroval zbytek html stranky
			exit;
		}
	}
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Administrace</title>
	<link rel="stylesheet" href="fontawesome/css/all.min.css">
	<!-- bootstrap -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	
	 <link rel="stylesheet" href="css/admin.css"><!-- admin.css -->
	 
	 <script src="https://code.jquery.com/jquery-3.7.1.js"></script> <!-- jquery -->
	 <script src="https://code.jquery.com/ui/1.14.0/jquery-ui.js"></script> <!-- jquery UI -->
</head>
<body>

	<div class="admin-body">

		<?php

			if (array_key_exists("prihlasenyUzivatel", $_SESSION) == false)
			{
				// sekce pro neprihlasene uzivatele
		?>

				<main class="form-signin w-100 m-auto">
					<form method="post">

						<h1 class="h3 mb-3 fw-normal">Přihlašte se prosím</h1>

						
							<?php if ($chyba != "")
							{ ?>
							<div class="alert alert-danger" role="alert">
							<?php echo $chyba; ?>
							</div>
							<?php
							} ?>

						<div class="form-floating">
							<input name="jmeno" type="text" class="form-control" id="floatingInput" placeholder="login">
							<label for="floatingInput">Přihlašovací jméno</label>
						</div>

						<div class="form-floating">
							<input name="heslo" type="password" class="form-control" id="floatingPassword" placeholder="Heslo">
							<label for="floatingPassword">Heslo</label>
						</div>

						<button name="prihlasit" class="btn btn-primary w-100 py-2" type="submit">Přihlásit</button>

					</form>
				</main>

		<?php

			}
			else
			{
				// sekce pro prihlasene uzivatele
				echo "<main class=admin>";
		
		?>

				<div class="container">
					<header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">

					<div>Přihlášený uživatel: <?php echo $_SESSION["prihlasenyUzivatel"]; ?></div>

					<div class="col-md-3 text-end">
						<form method=post>
							<button name=odhlasit class="btn btn-outline-primary me-2">Odhlásit</button>
						</form>
					</div>

					</header>
			 	</div>

		<?php

				// vypiseme seznam stranek ktere lze editovat
				echo "<ul id='stranky' class='list-group'>";
				foreach ($seznamStranek as $idStranky => $instanceStranky)
				{
					$active = '';
					$buttonClass = 'btn-primary';

					if ($instanceStranky == $instanceAktualniStranky )
					{
						$active = 'active';
						$buttonClass = 'btn-secondary';
					}

					echo
					"<li class='list-group-item $active' id='$instanceStranky->id'>
						<a class='btn $buttonClass' href=?stranka=$instanceStranky->id><i class='fa-solid fa-pen-to-square'></i></a>
						<a class='smazat btn $buttonClass' href=?stranka=$instanceStranky->id&smazat><i class='fa-solid fa-trash-can'></i></a>
						<a class='btn $buttonClass' href=$instanceStranky->id target=_blank><i class='fa-solid fa-eye'></i></a>
						<span><b>$instanceStranky->id</b></span>
					</li>";
				}
				echo "</ul>";

				// formular s tlacitkem pro pridani stranky
				?>

				<div class="container">
					<header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
						<div class="col-md-3 text-start">
							<form>
								<button name='pridat' class="btn btn-outline-primary me-2">Přidat</button>
							</form>
						</div>
					</header>
			 	</div>
				<?php

				// editacni formular
				// zobrazit pokud je nejaka stranka vybrana k editaci
				if ($instanceAktualniStranky != null)
				{
					echo "<div class='alert alert-secondary' role='alert'><h1>";
					if ($instanceAktualniStranky->id == "")
					{
						echo "Přidávání stránky";
					}
					else
					{
						echo "Editace stránky: $instanceAktualniStranky->id";
					}
					echo "</h1></div>";

		?>

					<form method="post">

						<div class="form-floating">
							<input
								class="form-control" type="text" name="id" id="id" placeholder="Id"
								value="<?php echo htmlspecialchars($instanceAktualniStranky->id) ?>">
							<label for="id">Id</label>
						</div>

						<div class="form-floating">
							<input
								class="form-control" type="text" name="titulek" id="titulek" placeholder="Titulek"
								value="<?php echo htmlspecialchars($instanceAktualniStranky->titulek) ?>">
							<label for="titulek">Titulek</label>
						</div>

						<div class="form-floating">
							<input
								class="form-control" type="menu" name="menu" id="menu" placeholder="Menu"
								value="<?php echo htmlspecialchars($instanceAktualniStranky->menu) ?>">
							<label for="menu">Menu</label>
						</div>

						<textarea name="obsah" cols="80" rows="15" id="obsah">
							<?php
								echo htmlspecialchars($instanceAktualniStranky->getObsah());
							?>
						</textarea>
						<br>
						<button class="btn btn-primary" name="ulozit"><i class="fa-solid fa-floppy-disk"></i> Uložit</button>
					</form>
					<script src="vendor\tinymce\tinymce\tinymce.min.js" referrerpolicy="origin"></script>
					<script>
						tinymce.init({
							selector: '#obsah',
							license_key: 'gpl|<your-license-key>',
							language: 'cs',
							language_url: '<?php echo dirname($_SERVER["PHP_SELF"]); ?>/vendor/tweeb/tinymce-i18n/langs/cs.js',
							height: '50vh',
							entity_encoding: "raw",
							verify_html: false,
							content_css:
							[
								"css/reset.css",
								"css/section.css",
								"css/style.css",
								"fontawesome/css/all.min.css",
							],
							body_id: "content",
							plugins: 'advlist anchor autolink charmap code colorpicker contextmenu directionality emoticons fullscreen hr image imagetools insertdatetime link lists nonbreaking noneditable pagebreak paste preview print save searchreplace tabfocus table textcolor textpattern visualchars',
							toolbar1: "insertfile undo redo | styleselect | fontselect | fontsizeselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | forecolor backcolor",
							toolbar2: "link unlink anchor | fontawesome | image media | responsivefilemanager | preview code",
							external_plugins:
							{
							'responsivefilemanager': '<?php echo dirname($_SERVER['PHP_SELF']); ?>/vendor/primakurzy/responsivefilemanager/tinymce/plugins/responsivefilemanager/plugin.min.js',
							'filemanager': '<?php echo dirname($_SERVER['PHP_SELF']); ?>/vendor/primakurzy/responsivefilemanager/tinymce/plugins/filemanager/plugin.min.js',
							},
							external_filemanager_path: "<?php echo dirname($_SERVER['PHP_SELF']); ?>/vendor/primakurzy/responsivefilemanager/filemanager/",
							filemanager_title: "Správce souborů",
						});
					</script>

					<?php

				}

				echo "</main>";

			}

		?>

	</div>

	<script src="js/admin.js"></script>
</body>
</html>