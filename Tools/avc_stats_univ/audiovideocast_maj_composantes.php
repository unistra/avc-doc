
<html>
    <head>
        <title>statistiques</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"> 
	 <link rel="stylesheet" type="text/css" href="style.css" media="screen">
    </head>


<body>
<div id="container">
<div id="topbar"> <h1 align="center">Statistiques à Moodle</h1></div>
<div id="navbar"><h2 align="center">Gestions des categories obsoletes</h2></div>
<div id="helpbar"><h3 >Les categories à modifier</h3></div>

<div id="main">
<div id="column_left"> 
<?


set_time_limit(30);
error_reporting(E_ERROR);
ini_set('error_reporting', E_ERROR);
ini_set('display_errors',1);

include 'config.php';
// connect
$ldapconn = ldap_connect($ldapserver,$ldapport) or die("Could not connect to LDAP server.");

ldap_set_option($ldapconn, LDAP_OPT_PROTOCOL_VERSION, 3);
ldap_set_option($ldapconn, LDAP_OPT_REFERRALS, 0);



$connection = pg_connect ("host=$host dbname=$db user=$user password=$pass");
if (!$connection)
{
	die("Could not open connection to database server");
}


$ldapbind = ldap_bind($ldapconn, $ldapuser, $ldappass) or 
	die ("<br>Error trying to bind: ".ldap_error($ldapconn));
//recuperer le tableau des composantes




//Compter le nombre d'enregistrements
//liste des blocks
$queryc = "select userid, login,email, firstname,lastname,profile, establishment,etp,activate, institute from \"user\" where type ='ldap'  "; 
$dbresultc = pg_query($connection, $queryc);
$rowsc = pg_num_rows($dbresultc);

$rowperpage=10000;
$numpages =  (int)($rowsc/$rowperpage);
$newpagenumber = $_GET['newpagenumber'];
$pagenumber=empty($newpagenumber)?1:$newpagenumber;
$premier = ($pagenumber - 1) * $rowperpage;
//echo $rowsc." ".$numpages." ".$premier;
for($k==1;$k<$numpages;$k++)
{ if ($pagenumber==$k) $page = "<b>$k</b>"; else $page="$k"; ?> 
	
	<a href="audiovideocast_maj_composantes.php?newpagenumber=<?echo $k;?>"><?echo $page;?></a>-
	
<?}
$query = $queryc."  OFFSET $premier limit $rowperpage "; 
$dbresult = pg_query($connection, $query) ;
pg_last_error($connection);

// get the number of rows in the resultset
// this is PG-specific
$rows = pg_num_rows($dbresult);
?>
<table  border="1" width="100%" cellpadding="1" cellspacing="1"> 
	<tr>
	<th>userid</th> 
	<th>login</th> 
	<th>email</th>                 
	<th>firstname</th> 
	<th>lastname</th> 
	<th>profile</th>                 
	<th>establishment</th> 
	<th>etp</th>
	<th>activate</th>
	<th>institute</th>  
        </tr>
<?

if ($rows > 0)
{
	$i=0;$queryupdate ="";$queryupdatetotal ="";
	for ($i==0; $i<$rows; $i++) 
	{
		if($i==0) $queryupdatetotal ="";
		$row = pg_fetch_row($dbresult, $i);
		$userid = empty($row[0])?"/":$row[0]; 
		$login = empty($row[1])?"/":$row[1]; 
		$email = empty($row[2])?"/":$row[2];  
		$firstname = empty($row[3])?"/":$row[3]; 
		$lastname =  empty($row[4])?"/":$row[4];  
		$profile =  empty($row[5])?"/":$row[5];  
		$establishment =  empty($row[6])?"/":$row[6]; 
		$etp =  empty($row[7])?"/":$row[7];
		$activate =  empty($row[8])?"/":$row[8];
		$institute = empty($row[9])?"/":$row[9];

		
		//Rechercher les valeurs ldap 
		$filtre="(uid=$login)";
     	        $result = ldap_search($ldapconn,$ldaptree, $filtre) or die ("Error in search query: ".ldap_error($ldapconn));
		$nbr = ldap_count_entries ( $ldapconn,$result );


		$ldaplogin="/";
			$ldapemail="/";
			$ldapfirstname="/";
			$ldaplastname="/";
			$ldapprofile="/";
			$ldapestablishment="/";
			$ldapetp="/";
			$ldapactivate="/";
			$ldapinstitute="/";
		
		if ($nbr>0)
		{
			$entry = ldap_first_entry($ldapconn,$result);
			$values = ldap_get_values($ldapconn, $entry, "uid");
			for ($j=0; $j < $values["count"]; $j++) {
	    			$ldaplogin = $values[$j];
			}

			$entry = ldap_first_entry($ldapconn,$result);
			$values = ldap_get_values($ldapconn, $entry, "givenName");
			for ($j=0; $j < $values["count"]; $j++) {
	    			$ldapfirstname = $values[$j];
			}
			$values = ldap_get_values($ldapconn, $entry, "sn");
			for ($j=0; $j < $values["count"]; $j++) {
	    			$ldaplastname =$values[$j]; 
			}
			$values = ldap_get_values($ldapconn, $entry, "eduPersonPrimaryAffiliation");
			for ($j=0; $j < $values["count"]; $j++) {
				$ldapprofile =$values[$j];
			}
			//seulement pour les etudiants
			if($ldapprofile=="student")
			{
				$values = ldap_get_values($ldapconn, $entry, "udsPrimaryEtpCode");
				for ($j=0; $j < $values["count"]; $j++) {
	    				$ldapetp = $values[$j];
				}
			}
			else $ldapetp="/";

			$values = ldap_get_values($ldapconn, $entry, "udsDepartmentCode");
			for ($j=0; $j < $values["count"]; $j++) {
	    			$ldapcomposante = $values[$j];
			}
			$values = ldap_get_values($ldapconn, $entry, "supannEtablissement");
			for ($j=0; $j < $values["count"]; $j++) {
	    			$ldapestablishment =$values[$j];
			}
			$values = ldap_get_values($ldapconn, $entry, "udsActive");
			for ($j=0; $j < $values["count"]; $j++) {
	    			$ldapactivate =$values[$j];
			}
			$values = ldap_get_values($ldapconn, $entry, "mail");
			for ($j=0; $j < $values["count"]; $j++) {
	    			$ldapemail = $values[$j];
			}

			$attributinstitute = "supannEntiteAffectationPrincipale";
			if($ldapprofile=="student") $attributinstitute = "udsMainDepartmentCode";
			$values = ldap_get_values($ldapconn, $entry, $attributinstitute);
			for ($j=0; $j < $values["count"]; $j++) {
	    			$ldapinstitute = $values[$j];
			}
			

			if($email!=$ldapemail) $queryupdate = "UPDATE \"user\" set email ='$ldapemail' where userid = $userid and login='$login';";
			if($firstname!=$ldapfirstname) $queryupdate .= "UPDATE \"user\" set firstname ='$ldapfirstname' where userid = $userid and login='$login';"; 
			if($lastname!=$ldaplastname) $queryupdate .= "UPDATE \"user\" set lastname ='$ldaplastname' where userid = $userid and login='$login';"; 
			if($profile!=$ldapprofile) $queryupdate .= "UPDATE \"user\" set profile ='$ldapprofile' where userid = $userid and login='$login';";
			if($establishment!=$ldapestablishment) $queryupdate .= "UPDATE \"user\" set establishment ='$ldapestablishment' where userid = $userid and login='$login';"; 
			if($etp!=$ldapetp) $queryupdate .= "UPDATE \"user\" set etp ='$ldapetp' where userid = $userid and login='$login';"; 
			if($institute!=$ldapinstitute) $queryupdate .= "UPDATE \"user\" set institute ='$ldapinstitute' where userid = $userid and login='$login';";
			pg_query($connection, $queryupdate);
			
			
			
		} else
		{
			$ldaplogin="<b>Compte non trouvé dans le ldap </b>";
			$ldapemail="/";
			$ldapfirstname="/";
			$ldaplastname="/";
			$ldapprofile="/";
			$ldapestablishment="/";
			$ldapetp="/";
			$ldapactivate="/";
			$ldapcomposant="/";
			//si pas d'enregistrement désactiver le compte
			if($activate=='t') $queryupdate = "UPDATE \"user\" set activate ='f' where userid = $userid and login='$login';";
			pg_query($connection, $queryupdate);	
		}
		
		
		?>
			<tr>
			<td><? echo $userid; ?></td>
			<td><? echo $login; ?></td>
			<td><? echo $email; ?></td>
			<td><? echo $firstname; ?></td>
			<td><? echo $lastname; ?></td>
			<td><? echo $profile; ?></td>
			<td><? echo $establishment; ?></td>
			<td><? echo $etp; ?></td>  
			<td><? echo $activate; ?></td>  
			<td><? echo $institute; ?></td>  
			
			</tr>
		<? if  ($nbr>0)
		{?>
			<tr>
			<td><? echo "/"; ?></td>
			<td><? echo $ldaplogin; ?></td>
			<td><? echo $ldapemail; ?></td>
			<td><? echo $ldapfirstname; ?></td>
			<td><? echo $ldaplastname; ?></td>
			<td><? echo $ldapprofile; ?></td>
			<td><? echo $ldapestablishment; ?></td>
			<td><? echo $ldapetp; ?></td> 
			<td><? echo $ldapactivate; ?></td>
			<td><? echo $ldapinstitute; ?></td>       
			</tr>	
			<tr><td colspan="10"><?echo $queryupdate;?></td></tr>	
		<?
		}
		else 
		{?>
			<tr>
			<td colspan=10><? echo $ldaplogin; ?></td>  
			</tr>	
			<tr><td colspan="10"><?echo $queryupdate;?></td></tr>	
		<?}
		
		$queryupdate ="";



	}

}
echo "<br>";
//echo $queryupdatetotal;

// all done? clean up
ldap_close($ldapconn);




?>
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
