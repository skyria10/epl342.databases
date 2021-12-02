<?php 
	session_start(); 
?>
<html>
<body>
<?php
	if (isset($_POST['connect'])) {
		echo "<br/>Setting session variables!<br/>";
		// collect value of input field
		$sqlDBname = "skyria10";
		$sqlUser = "skyria10";
		$sqlPass = "BhmDq6pe";
	
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
	
	<!-- <a href="q1.php">1) Insert a company with its manager</a><br> -->
	<a href="q3_Preview.php">1) Add new User</a><br>
	<a>2) Search For a User Using username:</a><br>
	<form action="q4_Search.php" method="get">
			Search a User using username: <input type="int" name="RecordNum"><br>
    <input type="submit" name="connect">
</form>
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
		<input type="submit" value="Menu" formaction="chooseQuery.php">
	</form> 

</body>
</html>
