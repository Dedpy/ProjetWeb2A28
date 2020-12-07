<?PHP
	include "../controller/patientC.php";

	$patientC=new patientC();
	$listeUsers=$patientC->afficherPatient();
?>

<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title> Afficher Liste des patients </title>
    </head>
    <body>
		<div><a href="connexion.php">Ajouter un patient</a></div>
		
		<table border=1 align = 'center'>
			<tr>
				<th>Id</th>
				<th>Nom</th>
				<th>Prenom</th>
				<th>Date de naissance</th>
				<th>telephone</th>
				<th>Email</th>
				<th>Login</th>
				<th>Supprimer</th>
				<th>Modifier</th>
			</tr>

			<?PHP
				foreach($listeUsers as $user){
			?>
				<tr>
					<td><?PHP echo $user['id']; ?></td>
					<td><?PHP echo $user['nom']; ?></td>
					<td><?PHP echo $user['prenom']; ?></td>
					<td><?PHP echo $user['date_naissance']; ?></td>
					<td><?PHP echo $user['telephone']; ?></td>
					<td><?PHP echo $user['email']; ?></td>
					<td><?PHP echo $user['login']; ?></td>
					<td>
						<form method="POST" action="supprimerPatient.php">
						<input type="submit" name="supprimer" value="supprimer">
						<input type="hidden" value=<?PHP echo $user['id']; ?> name="id">
						</form>
					</td>
					<td>
						<a href="modifierPatient.php?id=<?PHP echo $user['id']; ?>"> Modifier </a>
					</td>
				</tr>
			<?PHP
				}
			?>
		</table>
	</body>
</html>
