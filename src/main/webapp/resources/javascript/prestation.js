$(document).ready(function() {
	$("#h_fin").on("keyup", function() {
		h_finKeyUpFunction();
	});
});

h_finKeyUpFunction = function() {
	var h_debut = $("#h_debut").val();
	var h_fin = $("#h_fin").val();
	var h_prest = parseFloat(parseFloat(h_fin) - parseFloat(h_debut) );
	$("#h_prest").val(h_prest);
}