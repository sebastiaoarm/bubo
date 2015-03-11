
<?php
	session_start();
	if ((isset($_SESSION['logado'])) && ($_SESSION['logado'])) {
		$_SESSION['logado'] = FALSE;
		$_SESSION['email'] = NULL;
		$_SESSION['nome'] = NULL;		
		$_SESSION['perfil'] = NULL;
		$db = new PDO('sqlite:dados.db3');
		$sql = "INSERT INTO log (id_usuario, acao) VALUES (?, ?);";
		$statement = $db->prepare($sql);
		$statement->execute(array($_SESSION['id'], 'LOGOUT'));
		unset($db);
	}
	header("Location: ./");
?>