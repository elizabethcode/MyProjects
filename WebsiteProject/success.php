<!DOCTYPE html>

<html lang="en">

<head>
	<title>The Book Shop</title>
	<link href="Style.css" rel="stylesheet" type="text/css">
	<script src="https://kit.fontawesome.com/a076d05399.js"></script>
</head>

<body>
	<header>
		<section class="row">
			<section class="logo">
				<img src="images/bookLogo.jpg">
			</section>	
			
			<ul class="main-navigation">
				<li class="active"><a href="Index.html"> HOME </a></li>
				<li><a href="Page2.html"> ABOUT US </a></li>
				<li><a href="Page3.html"> CONTACT US </a></li>
			</ul>
		</section>
		
		<section class="main-title-pages">
			<h1>The book Shop</h1>
		</section>
	</header>
	
	<section class="successful">
		<section class="message">
			You have successfully entered your credit card details
		</section>

	
	</section>
	
	<?php
		$x = $_POST[hidden];
		if($x==1){
			//insert record into db
			//prep '$v2','$v3','$v4'
			$sql = INSERT INTO card ('#' 'ccnum', 'exdate', 'seccode') value ('$v1','$v2','$v3','$v4')
			//process ccum 124123412341234
			//try to make all digity accept last 4 digits
			echo 'xxxx xxxx xxxx.$last_4';
		}
	?>
	
	
	
	
	
		<footer id="footer">
			<section class="copyright">
				<p>Copyright &copy; 2021, Book Club</p>
			</section>
			<br>				
		</footer>
</body>
</html>