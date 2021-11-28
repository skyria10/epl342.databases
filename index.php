<?php 
	session_start(); 
?>
<html>
<body>
<?php
	if (isset($_POST['connect'])) {
		echo "<br/>Setting session variables!<br/>";
		// collect value of input field
		$sqlDBname = "skyria10";//$_POST['dbName'];
		$sqlUser ="skyria10"; //$_POST['userName'];
		$sqlPass = "BhmDq6pe";//$_POST['pswd'];
	
		if (empty($sqlDBname)) echo "Database name is empty!<br/>";
		if (empty($sqlUser)) echo "Username is empty!<br/>";
		if (empty($sqlPass)) echo "Password name is empty!<br/>";

		if (!(empty($sqlDBname) || empty($sqlDBname) || empty($sqlDBname))) {
			// Set session variables
			$_SESSION["serverName"] = "mssql.cs.ucy.ac.cy";
			$_SESSION["connectionOptions"] = array(
				"Database" => $sqlDBname,
				"Uid" => $sqlUser,
				"PWD" => $sqlPass
			);
		} else {
			session_unset();
			session_destroy();
			echo "<br/>Cannot setup the session variables! Redirecting back in 5 seconds<br/>";
			die('<meta http-equiv="refresh" content="5; url=index.php" />');
		}
	}
?>
<body>
	<table cellSpacing=0 cellPadding=5 width="100%" border=0>
	<tr>
		<td vAlign=top width=170><img height=91 alt=UCY src="images/ucy.jpg" width=94>
			<h5>
				<a href="http://www.ucy.ac.cy/">University of Cyprus</a><BR/>
				<a href="http://www.cs.ucy.ac.cy/">Dept. of Computer Science</a>
			</h5>
		</td>
		<td vAlign=center align=middle><h2>Welcome to the EPL342 project test page</h2></td>
	</tr>
    </table>
	<hr>
	<a href="q1.php">1) Insert a company with its manager</a><br>
	<a href="q1.php">2) Q2</a><br>
	<a href="q1.php">3) Q3</a><br>
	<a href="q1.php">4) Q4</a><br>
	<a href="q1.php">5) Q5</a><br>
	<a href="q1.php">6) Q6</a><br>
	<a href="q1.php">7) Q7</a><br>
	<a href="q1.php">8) Q8</a><br>
	<a href="q1.php">9) Q9</a><br>
	<a href="q1.php">10) Q10</a><br>
	<a href="q1.php">11) Q11</a><br>
	<a href="q1.php">12) Insert a company with its manager</a><br>
	<a href="q1.php">13) Insert a company with its manager</a><br>
	<a href="q1.php">14) Insert a company with its manager</a><br>
	<a href="q1.php">15) Insert a company with its manager</a><br>
	<a href="q1.php">16) Insert a company with its manager</a><br>
	<a href="q1.php">17) Insert a company with its manager</a><br>
	<hr>
	<?php
		if(isset($_POST['disconnect'])) { 
			echo "Clossing session and redirecting to start page"; 
			session_unset();
			session_destroy();
			die('<meta http-equiv="refresh" content="2; url=index.php" />');
		} 
	?> 
	
	<form method="post"> 
		<input type="submit" name="disconnect" value="Disconnect"/> 
	</form> 

</body>
</html>
