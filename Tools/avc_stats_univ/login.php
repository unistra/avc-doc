<?php

$login_valide = "****";
$pwd_valide = "****";
$loginOK = false;

if ( isset($_POST) && (!empty($_POST['login'])) && (!empty($_POST['pwd'])) )
{

	$login = $_POST['login'];
        $pwd = $_POST['pwd'];
	if ($login_valide == $login && $pwd_valide == $pwd) 
	{

		session_start ();
		$_SESSION['loginOK'] =true;
		
		// on redirige notre visiteur vers une page de notre section membre
		header ('location: audiovideocast_stats.php');
	}
	else 
	{
		echo '<body onLoad="alert(\'Les données ne permettent pas de vous authentifier...\')">';
		echo '<meta http-equiv="refresh" content="0;URL=index.php">';
	}
}
else
{
	echo '<body onLoad="alert(\'Il faut remplir le formulaire...\')">';
	echo '<meta http-equiv="refresh" content="0;URL=index.php">';
}
?>
