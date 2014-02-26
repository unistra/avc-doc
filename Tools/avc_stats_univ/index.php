
<html>
    <head>
        <title>Statistique Audiovideocast</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"> 
	<link rel="stylesheet" type="text/css" href="style.css" media="screen">
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
    </head>


<body>
<div id="container">
<div id="topbar"> <h1 align="center">Statistiques AVC</h1></div>
<div id="navbar"></div>
<div id="helpbar"><h2>Connectez vous ici</h2> </div>

<div id="main">
<div id="column_left"> 
    <form action="login.php" method="post">
    Votre login : <input type="text" name="login">
    <br />
    Votre mot de passé : <input type="password" name="pwd"><br />
    <input type="submit" value="Connexion">
    </form>

  </div>
<div id="column_right"> <p align="left">

</p></div>
<!-- this layer solve some issue about the css design, forced the #main layer height equal to height of two column layer (#columnt_left and #column_right) inside itself -->
<div class="spacer"></div>
<!-- close #main content -->
</div>
<!-- close #container -->
</div>
</body>
</html>
