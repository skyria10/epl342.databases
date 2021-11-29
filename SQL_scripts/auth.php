
<html>

<head>
	<title>Login</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="css/style.css">
</head>

<style>
	.myDiv {
		background-color: lightgray;
		text-align: center;
	}
</style>

<body class="img js-fullheight" style="background-image: url(https://www.yerun.eu/wp-content/uploads/2021/07/UCY-SOCIAL-ACTIVITIES-1600x1071.jpg);">
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 col-lg-4">
					<div class="login-wrap p-0">
						<!-- <div class="myDiv"> -->
							Connecting to SQL server (mssql.cs.ucy.ac.cy)<br/>Database: lpapal03, SQL User: lpapal03<br/><br/>Trying to authenticate to T1-Users!<br/>Executing query: {call Authenticate(?,?)}) with Username: ssofok02<br/><hr>Authentication Unsuccessful!<br>QueryTime: 56.22 ms</b>
							<hr>
							<form action="authenticated.php" method="post" class="signin-form">
								<div class="form-group">
									<button type="submit" name="authenticate" class="form-control btn btn-primary submit px-3">Proceed</button>
								</div>
							</form>

							<form method="post" action="logout.php">
								<button type="submit" name="disconnect" class="form-control btn btn-primary submit px-3">Disconnect</button>
							</form>
						<!-- </div> -->
					</div>
				</div>
			</div>
		</div>
	</section>


</body>

</html>