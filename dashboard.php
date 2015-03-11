<?php
	require_once('global.php');
	session_start();
	if ((isset($_SESSION['logado'])) && ($_SESSION['logado'])) {
		// ...
	}
	else {
		header("Location: login.php");
	}
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
						<p><strong><?php echo $_SESSION['email']; ?></strong> [ <a href="logout.php">logout</a> ]</p>
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
						<div class="h_title">&#8250; Relat&oacute;rios</div>
						<ul id="home">
							<li class="b1"><a class="icon report" href="">Estat&iacute;sticas</a></li>
						</ul>
					</div>
					
					<div class="box">
						<div class="h_title">&#8250; Conte&uacute;do</div>
						<ul>
							<li class="b1"><a class="icon category" href="">Curso</a></li>
							<li class="b2"><a class="icon category" href="">Disciplina</a></li>
							<li class="b1"><a class="icon page" href="">Material</a></li>
						</ul>
					</div>
					<div class="box">
						<div class="h_title">&#8250; Contas de usu&aacute;rios</div>
						<ul>
							<li class="b1"><a class="icon users" href="">Todos as contas</a></li>
						</ul>
					</div>
					<div class="box">
						<div class="h_title">&#8250; Prefer&ecirc;ncias</div>
						<ul>
							<li class="b1"><a class="icon config" href="">Configura&ccedil;&otilde;es</a></li>
						</ul>
					</div>
				</div>
				<div id="main">
										
					<div class="clear"></div>
					
					<div class="full_w">
						<div class="h_title">Controles</div>
						<h1>Level 1 header</h1>
						<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumyeirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diamvoluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takim</p>
						<h2>Level 2 header</h2>
						<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumyeirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diamvoluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumyeirmod tempor i</p>
						<h3>Level 3 header</h3>
						<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumyeirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diamvolupt</p>
						<h3>Unordered list</h3>
						<ul>
							<li>first list item, Lorem ipsum dolor sit amet, consete</li>
							<li>second list item, Lorem ipsum dolor sit amet, consete</li>
							<li>third list item, Lorem ipsum dolor sit amet, consete</li>
							<li>fourth list item, Lorem ipsum dolor sit amet, consete</li>
						</ul>
						<h3>Ordered list</h3>
						<ol>
							<li>first list item, Lorem ipsum dolor sit amet, consete</li>
							<li>second list item, Lorem ipsum dolor sit amet, consete</li>
							<li>third list item, Lorem ipsum dolor sit amet, consete</li>
							<li>fourth list item, Lorem ipsum dolor sit amet, consete</li>
						</ol>
		                <div class="n_warning"><p>Attention notification. Lorem ipsum dolor sit amet, consetetur, sed diam nonumyeirmod tempor.</p></div>
						<div class="n_ok"><p>Success notification. Lorem ipsum dolor sit amet, consetetur, sed diam nonumyeirmod tempor.</p></div>
						<div class="n_error"><p>Error notification. Lorem ipsum dolor sit amet, consetetur, sed diam nonumyeirmod tempor.</p></div>		
					</div>
					
					<div class="full_w">
						<div class="h_title">Add new page - form elements</div>
						<form action="" method="post">
							<div class="element">
								<label for="name">Page title <span class="red">(required)</span></label>
								<input id="name" name="name" class="text err" />
							</div>
							<div class="element">
								<label for="category">Category <span class="red">(required)</span></label>
								<select name="category" class="err">
									<option value="0">-- select category</option>
									<option value="1">Category 1</option>
									<option value="2">Category 4</option>
									<option value="3">Category 3</option>
								</select>
							</div>
							<div class="element">
								<label for="comments">Comments</label>
								<input type="radio" name="comments" value="on" checked="checked" /> Enabled <input type="radio" name="comments" value="off" /> Disabled
							</div>
							<div class="element">
								<label for="attach">Attachments</label>
								<input type="file" name="attach" />
							</div>
							<div class="element">
								<label for="content">Page content <span>(required)</span></label>
								<textarea name="content" class="textarea" rows="10"></textarea>
							</div>
							<div class="entry">
								<button type="submit">Preview</button> <button type="submit" class="add">Save page</button> <button class="cancel">Cancel</button>
							</div>
						</form>
					</div>
					
					<div class="full_w">
						<div class="h_title">Manage pages - table</div>
						<h2>Lorem ipsum dolor sit ame</h2>
						<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumyeirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diamvolupt</p>
						
						<div class="entry">
							<div class="sep"></div>
						</div>
						<table>
							<thead>
								<tr>
									<th scope="col">ID</th>
									<th scope="col">Title</th>
									<th scope="col">Author</th>
									<th scope="col">Date</th>
									<th scope="col">Category</th>
									<th scope="col" style="width: 65px;">Modify</th>
								</tr>
							</thead>
								
							<tbody>
								<tr>
									<td class="align-center">2</td>
									<td>Home</td>
									<td>Paweł B.</td>
									<td>22-03-2012</td>
									<td>-</td>
									<td>
										<a href="#" class="table-icon edit" title="Edit"></a>
										<a href="#" class="table-icon archive" title="Archive"></a>
										<a href="#" class="table-icon delete" title="Delete"></a>
									</td>
								</tr>
								<tr>
									<td class="align-center">3</td>
									<td>Our offer</td>
									<td>Paweł B.</td>
									<td>22-03-2012</td>
									<td>-</td>
									<td>
										<a href="#" class="table-icon edit" title="Edit"></a>
										<a href="#" class="table-icon archive" title="Archive"></a>
										<a href="#" class="table-icon delete" title="Delete"></a>
									</td>
								</tr>
									
								<tr>
									<td class="align-center">5</td>
									<td>About</td>
									<td>Admin</td>
									<td>23-03-2012</td>
									<td>-</td>
									<td>
										<a href="#" class="table-icon edit" title="Edit"></a>
										<a href="#" class="table-icon archive" title="Archive"></a>
										<a href="#" class="table-icon delete" title="Delete"></a>
									</td>
								</tr>
									
								<tr>
									<td class="align-center">12</td>
									<td>Contact</td>
									<td>Admin</td>
									<td>25-03-2012</td>
									<td>-</td>
									<td>
										<a href="#" class="table-icon edit" title="Edit"></a>
										<a href="#" class="table-icon archive" title="Archive"></a>
										<a href="#" class="table-icon delete" title="Delete"></a>
									</td>
								</tr>						
								<tr>
									<td class="align-center">114</td>
									<td>Portfolio</td>
									<td>Paweł B.</td>
									<td>22-03-2012</td>
									<td>-</td>
									<td>
										<a href="#" class="table-icon edit" title="Edit"></a>
										<a href="#" class="table-icon archive" title="Archive"></a>
										<a href="#" class="table-icon delete" title="Delete"></a>
									</td>
								</tr>
									
								<tr>
									<td class="align-center">116</td>
									<td>Clients</td>
									<td>Admin</td>
									<td>23-03-2012</td>
									<td>-</td>
									<td>
										<a href="#" class="table-icon edit" title="Edit"></a>
										<a href="#" class="table-icon archive" title="Archive"></a>
										<a href="#" class="table-icon delete" title="Delete"></a>
									</td>
								</tr>
									
								<tr>
									<td class="align-center">131</td>
									<td>Customer reviews</td>
									<td>Admin</td>
									<td>25-03-2012</td>
									<td>-</td>
									<td>
										<a href="#" class="table-icon edit" title="Edit"></a>
										<a href="#" class="table-icon archive" title="Archive"></a>
										<a href="#" class="table-icon delete" title="Delete"></a>
									</td>
								</tr>
							</tbody>
						</table>
						<div class="entry">
							<div class="pagination">
								<span>« First</span>
								<span class="active">1</span>
								<a href="">2</a>
								<a href="">3</a>
								<a href="">4</a>
								<span>...</span>
								<a href="">23</a>
								<a href="">24</a>
								<a href="">Last »</a>
							</div>
							<div class="sep"></div>		
							<a class="button add" href="">Add new page</a> <a class="button" href="">Categories</a> 
						</div>
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
