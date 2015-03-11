<?php
	require_once('global.php');
	session_start();
	// Se o USUÁRIO já houver LOGADO, é redirecionado para o PAINEL DE CONTROLE...
	if ((isset($_SESSION['logado'])) && ($_SESSION['logado'])) {
		header("Location: dashboard.php");
	}
	// SENÃO, se forem recebido E-MAIL e SENHA, VERIFICA se os dados existem no banco de dados.
	elseif ((isset($_POST['email'])) && (isset($_POST['senha']))) {
		$db = new PDO('sqlite:dados.db3');
		$sql = "SELECT u.*, p.nome as perfil FROM usuario u INNER JOIN perfil_usuario pu ON (u.id = pu.id_usuario) INNER JOIN perfil p ON (pu.id_perfil = p.id)  WHERE u.ativo = 'SIM' AND u.email = ? AND u.senha = ?;";
		$statement = $db->prepare($sql);
		$statement->execute(array($_POST['email'], md5($_POST['senha'])));
		$result = $statement->fetchAll();

		if (count($result) == 1) {
			$_SESSION['logado'] = TRUE;
			$_SESSION['id'] = $result[0]['id'];
			$_SESSION['email'] = $result[0]['email'];
			$_SESSION['nome'] = $result[0]['nome'];
			$_SESSION['perfil'] = $result[0]['perfil'];
			$sql = "INSERT INTO log (id_usuario, acao) VALUES (?, ?);";
			$statement = $db->prepare($sql);
			$statement->execute(array($result[0]['id'], 'LOGON'));
			header("Location: dashboard.php");
		}
		else {
			$mensagem_de_erro = 'Queira! Basta ser sincero e desejar profundo. Voc&ecirc; ser&aacute; capaz de sacudir o mundo. Vai! Tente outra vez!';
		}
		unset($db);
	}
?>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>BUBO.</title>
		<link rel="stylesheet" type="text/css" href="css/login.css" media="screen" />
	</head>
	<body>
		<div class="wrap">
			<div id="content">
				<div id="main">
					<div class="full_w">
						<form action="" method="post">
							<label for="email">E-mail:</label>
							<input id="email" name="email" class="text" />
							<label for="senha">Senha:</label>
							<input id="senha" name="senha" type="password" class="text" />
							<div class="sep"></div>
							<button type="submit" class="ok">Login</button> <a class="button" href="">Esqueci a senha.</a>
						</form>
					</div>
					<?php if ((isset($mensagem_de_erro)) && ($mensagem_de_erro <> '')) { ?>
					<div class="n_error"><p><?php echo $mensagem_de_erro; ?></p></div>
					<?php } ?>
					<!--
					<div class="footer">&raquo; <a href=""><?php echo $_SERVER['HTTP_HOST']; ?></a> | Admin Panel</div>
					-->
				</div>
			</div>
		</div>
	</body>
</html>
