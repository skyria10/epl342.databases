<?php 
	session_start(); 
?>
<html>
<body>
<?php
	if (isset($_POST['login'])) {
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
	<form action="q3.php" method="get">
		1) Insert a company with its manager</a><br><br>
			Company Details:<br>
			Record Number: <input type="text" name="RecordNum"><br>
			Name: <input type="text" name="Name"><br>
			Entry Date: <input type="date" name="EntryDate" ><br>
			<br>Manager Details:<br>
			User ID: <input type="int" name="UserID" ><br>
			Username<input type="text" name="username" ><br>
			Password: <input type="text" name="password" ><br>
			Full Name: <input type="text" name="FName" ><br>
			Last Name: <input type="text" name="LName" ><br>
			Birth Date: <input type="text" name="BDate"><br>
			Sex: <input type="text" name="Sex" ><br>
			Admin Username: <input type="text" name="adminUsername" ><br>
    <input type="submit" name="Query 3">
	</form>

	<a href="q2.php">2) Company with its manager (edit/add/preview)</a><br>
	<a href="q3.php">3) Insert simple user</a><br>
	<a href="q4.php">4) Insert/edit/show simple user</a><br>
	<a href="q5.php">5) Manage questions</a><br>
	<a href="q6.php">6) Manage questionaires</a><br>
	<a href="q7.php">7) Company's Questionnaires</a><br>
	<a href="q8.php">8) Most popular questions</a><br>
	<a href="q9.php">9) Number of questions per questionnaire</a><br>
	<a href="q10.php">10) Average number of questions per company</a><br>
	<a href="q11.php">11) Find large questionnaires</a><br>
	<a href="q12.php">12) Find Small questionnaires</a><br>
	<a href="q13.php">13) Find questionnaires with same questions</a><br>
	<a href="q14.php">14) Find common questions</a><br>
	<a href="q15.php">15) Find x questions with least participation </a><br>
	<a href="q16.php">16) Questions that are included in all questionnaires</a><br>
	<a href="q17.php">17) Number of questions of this questionnaire</a><br>

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
