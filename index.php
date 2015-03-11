<?php
	require_once('global.php');
	session_start();
?>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>BUBO.</title>
		<link rel="stylesheet" type="text/css" href="css/style.css" media="screen" />
		<link rel="stylesheet" type="text/css" href="css/navi.css" media="screen" />
		<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
		<script type="text/javascript">
			$(function(){
				$(".box .h_title").not(this).next("ul").hide("normal");
				$(".box .h_title").not(this).next("#home").show("normal");
				$(".box").children(".h_title").click( function() { $(this).next("ul").slideToggle(); });
			});
		</script>
	</head>
	<body>
		<div class="wrap">
			<div id="header">
				<div id="top">
					<div class="left">
						<p><?php echo ((isset($_SESSION['logado'])) && ($_SESSION['logado'])) ? '<strong>' . $_SESSION['email'] . '</strong> [ <a href="logout.php">logout</a> ]' : 'Ol&aacute;, visitante [ <a href="login.php">login</a> ]'; ?></p>
					</div>
					<div class="right">
						<div class="align-right">
							<p>Atualizado em <strong><?php echo date('d/m/Y H:i:s'); ?></strong></p>
						</div>
					</div>
				</div>
				<div id="nav">
					<ul>
						<li class="upp"><a href="./">In&iacute;cio</a></li>
						<li class="upp"><a href="dashboard.php">Painel de controle</a></li>
					</ul>
				</div>
			</div>
			
			<div id="content">
				<div id="sidebar">
					<div class="box">
						<div class="h_title">Menu</div>
						<ul id="home">
							<li class="b2"><a class="icon report" href="#afazer">A fazer</a></li>
						</ul>
					</div>
				</div>
				<div id="main">
					<div class="full_w">
						<div id="afazer" class="h_title">A fazer</div>						
						<br />
						<ul>
							<li>first list item, Lorem ipsum dolor sit amet, consete</li>
							<li>second list item, Lorem ipsum dolor sit amet, consete</li>
							<li>third list item, Lorem ipsum dolor sit amet, consete</li>
							<li>fourth list item, Lorem ipsum dolor sit amet, consete</li>
						</ul>
						<br />	
					</div>
				</div>
				<div class="clear"></div>
			</div>
			<div id="footer">
				<div class="left">
					<p>Design: <a href="http://kilab.pl">Paweł Balicki</a> | Admin Panel: <a href="">YourSite.com</a></p>
				</div>
				<div class="right">
					<p><a href="">Example link 1</a> | <a href="">Example link 2</a></p>
				</div>
			</div>
		</div>
	</body>
</html>
