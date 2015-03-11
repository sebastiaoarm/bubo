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
			$_SESSION['email'] = $result[0]['email'];
			$_SESSION['nome'] = $result[0]['nome'];
			$_SESSION['perfil'] = $result[0]['perfil'];
			header("Location: dashboard.php");
		}
		unset($db);
	}
?>
<!DOCTYPE html>
<html lang="pt-br" dir="ltr">
	<head>
		<title>AVAGPI - login</title>
		<meta charset="utf-8">
		<!-- Stylesheets -->
		<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Droid+Sans:400,700">
		<link rel="stylesheet" href="css/dashboard.css">
		<!-- Optimize for mobile devices -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	</head>
	<body>
		<!-- TOP BAR -->
		<div id="top-bar">	
			<div class="page-full-width">
				<a href="javascript: history.back(1)" class="round button dark ic-left-arrow image-left ">Voltar &agrave; p&aacute;gina anterior</a>
			</div> <!-- end full-width -->	
		</div> <!-- end top-bar -->
		<!-- HEADER -->
		<div id="header">
			<div class="page-full-width cf">
				<div id="login-intro" class="fl">
					<h1>Login</h1>
					<h5>Informe suas credenciais</h5>
				</div> <!-- login-intro -->
				<!-- Change this image to your own company's logo -->
				<!-- The logo will automatically be resized to 39px height. -->
				<a href="./" id="company-branding" class="fr"><img src="<?php echo LOGO_PEQUENA ?>" alt="APRENDE" /></a>
			</div> <!-- end full-width -->	
		</div> <!-- end header -->
		<!-- MAIN CONTENT -->
		<div id="content">
			<form action="login.php" method="POST" id="login-form">
				<fieldset>
					<p><label for="email">e-mail</label><input type="text" id="email" name="email" class="round full-width-input" autofocus /></p>
					<p><label for="senha">senha</label><input type="password" id="senha" name="senha" class="round full-width-input" /></p>
					<p><a href="./">Esqueci a senha</a>.</p>
					<input type="submit" style="display:none"/>
					<a href="javascript:;" onclick="document.getElementById('login-form').submit();" class="button round blue image-right ic-right-arrow">LOGIN</a>
				</fieldset>
			</form>
		</div> <!-- end content -->
		<!-- FOOTER -->
		<div id="footer">
			<p>Theme by <a href="http://www.adipurdila.com">Adi Purdila</a>. Thank you!</p>
		</div> <!-- end footer -->
	</body>
</html>