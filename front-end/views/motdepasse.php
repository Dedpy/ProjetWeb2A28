<?php
include_once '../Model/patient.php';
require('../config.php');
session_start();

if (isset($_POST['email'])){

    $email=$_POST['email'];

    $sql="SELECT * FROM patient WHERE email='" . $email . "'";
			$db = config::getConnexion();
			try{
				$query=$db->prepare($sql);
				$query->execute();
                $count=$query->rowCount();
                if($count==1){
				$user=$query->fetch();
               // var_dump($user);
                $_SESSION['email'] = $email;
                $_SESSION['login'] = $user['login'];
                $login=$user['login'];
                //$_SESSION['id'] = $user['id'];
                $code=mt_rand(1000,9999);
                    $sql="UPDATE patient SET code= '" . $code . "' WHERE email='" . $email . "'";
                    $db = config::getConnexion();
			    
				$query1=$db->prepare($sql);
				$query1->execute();

                
                     $email1="behijabenghorbel@gmail.com";    
                     $dest = $email;
                     $sujet = "Réinitialisation du mot de passe";
                   $corp =" Bonjour $login voici votre code de verification $code " ;
                    $headers = 'From: ' .$email1 . "\r\n".'Reply-To: ' . $email1. "\r\n".'X-Mailer: PHP/' . phpversion();
                     if (mail($dest, $sujet, $corp, $headers)) {
                        echo "Email envoyé avec succès à $dest ...";
                    } else {
                         echo "Échec de l'envoi de l'email...";
                         }
                     header("Location: verifpassword.php");
                        }
			}
			catch (Exception $e){
				die('Erreur: '.$e->getMessage());
            }
        } 

	// $email = stripslashes($_REQUEST['email']);
	// $email = mysqli_real_escape_string($conn, $email);
	
    // $query="SELECT password FROM patient WHERE email='" . $email . "'";
	// $result = mysqli_query($conn,$query) or die(mysql_error());
    // $rows = mysqli_num_rows($result);
    
    // //$query1="UPDATE patient SET code= '" . $code . "'";
	// if($rows==1){

    //     $_SESSION['email'] = $email;
    //     $code=mt_rand(1000,9999);
    //     $query1="UPDATE patient SET code= '" . $code . "' WHERE email='" . $email . "'";
    //     $result1 = mysqli_query($conn,$query1) or die(mysql_error());
        
    //     $email1="behijabenghorbel@gmail.com";    
    //     $dest = $email;
    //     $sujet = "Réinitialisation du mot de passe";
    //     $corp =" Bonjour $email voici votre code de verification $code " ;
    //     $headers = 'From: ' .$email1 . "\r\n".'Reply-To: ' . $email1. "\r\n".'X-Mailer: PHP/' . phpversion();
    //     if (mail($dest, $sujet, $corp, $headers)) {
    //         echo "Email envoyé avec succès à $dest ...";
    //     } else {
    //         echo "Échec de l'envoi de l'email...";
    //         }
	//     header("Location: verifpassword.php");
	// }else{
	// 	echo $message = "L'email est incorrect.";
	// }


?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>mot de passe oublié</title>
        <link href="styles.css" rel="stylesheet"/>
        
    </head>

    <body class="bg-primary">
    
        
        <div id="error">
            <?//php echo $error; ?>
        </div>
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-7">
                            <div class="card shadow-lg border-0 rounded-lg mt-5">
                                <div class="card-header">
                                    <h1 class="text-center font-weight-light my-4">Mot de passe oublié</h1>
                                </div>
                                <div class="card-body">
                                    <form action="" method="POST">
                                        <table  align="center">
                                           
                                            
                                            <tr>
                                                <td>
                                                    <label class="small mb-1" for="email">Adresse mail:</label>
                                                </td>
                                                <td>
                                                    <input class="form-control" type="email" name="email" id="email" pattern=".+@gmail.com|.+@esprit.tn|.+@yahoo.com|.+@yahoo.fr" placeholder="Entrer l'adresse mail">
                                                </td>
                                            </tr>

                                            

                                </div>
                                            <tr>
                                                <td></td>
                                                <td>
                                                
                                                    <input class="btn btn-primary btn-block" type="submit" value="Envoyer" > 
                                                   

                                                </td>
                                            </tr>
                                            
                                            <tr>
                                                <td></td>
                                                <td>
                                                    <input class="btn btn-primary btn-block" type="reset" value="Annuler" >
                                                </td>
                                            </tr>
                                        </table>
                                    </form>
                            </div>
                        </div>
                    </div>
                </div>                         
            </div>
        </div>
    </body>
</html>
