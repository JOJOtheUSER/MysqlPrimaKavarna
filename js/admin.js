$("#stranky").sortable({
	update: () => {
		const sortedIDs = $("#stranky").sortable("toArray");
		console.log(sortedIDs);

		$.ajax({
			url: "admin.php",
			data: {"poradi" : sortedIDs,}
		})
	}
});

$("#stranky .smazat").click((udalost) => {
	if (confirm("Opravdu chcete danou stranku smazat?") == false)
	{
		//preruseni udalosti smazat - uzivatel si nepreje smazani
		udalost.preventDefault();
	}
});