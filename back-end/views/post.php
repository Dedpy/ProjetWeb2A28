<?php
    session_start();

	// Vérifiez si l'utilisateur est connecté, sinon redirigez-le vers la page de connexion
	if(!isset($_SESSION["id"])){
    var_dump($_SESSION);
		header("Location: ../views/connexion.php");
		exit(); 
	}
?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Dashboard - SB Admin</title>
        <link href="css/styles.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <a class="navbar-brand" href="../dist/index.php">BACK END YANA</a>
            <button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
                <div class="input-group">
                    <input class="form-control" type="text" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2" />
                    <div class="input-group-append">
                        <button class="btn btn-primary" type="button"><i class="fas fa-search"></i></button>
                    </div>
                </div>
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ml-auto ml-md-0">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="userDropdown" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                    
                        <a class="dropdown-item" href="../views/logout.php">Logout</a>
                    </div>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Core</div>
                            <a class="nav-link" href="../dist/index.php">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Dashboard
                            </a>
                            <div class="sb-sidenav-menu-heading">Interface</div>
                            <a class="nav-link" href="../dist/specialites.php">
                            <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                Spécialités
                            </a>
                            <div class="sb-sidenav-menu-heading">Interface</div>
                            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                Layouts
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="layout-static.html">Static Navigation</a>
                                    <a class="nav-link" href="layout-sidenav-light.html">Light Sidenav</a>
                                </nav>
                            </div>
                           
                            
                            <div class="sb-sidenav-menu-heading">Addons</div>
                            <a class="nav-link" href="../views/forum.php">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                Blog
                            </a>
                            <a class="nav-link" href="../dist/enregistrements.php">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Les enregistrements des RDV
                            </a>
                            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                               
                                Tables
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="../views/afficherPatient.php">Table Patients</a>
                                    <a class="nav-link" href="../views/afficherMedecin.php">Tables Medecins</a>
                                </nav>
                            </div>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        YANA admin groupe 3
                    </div>
                </nav>
            </div>
<div id="layoutSidenav_content">
			<div class="shop-main-area">
				<!-- cart-main-area-start -->
				<div class="cart-main-area">
					<div class="container">
						<div class="row">
							<div class="col-lg-10">
								<div class="contact-form">
									<h3><i class="fa fa-envelope-o"></i>Poster</h3>
									<form name="formulaire" onsubmit="verif()" action="ajouter-post.php" method="POST">
									<div class="row">
										<div class="col-lg-12">
												<div class="checkout-form-list">
													<input type="text"  name="titre" id="titre"  placeholder="Titre" />
													<input name="id_client"  type="hidden" value="00" />
											</div>
										</div>
										
									<div class="col-lg-12 ">
											<div class="country-select">
												
												<select name="categorie" id="categorie" class="chosen-select" tabindex="1" style="width:100%;" data-placeholder="Default Sorting">
													<option >Selectioner Une Categorie</option>
													<option value="Depression">Depression</option>
													<option value="Maladie mentale">Maladie mentale</option>
													<option value="Developement personnel">Developement personnel</option>

												</select>
											</div>

									</div>
								

									
									<div class="col-lg-12 ">
											<div class="checkout-form-list">
										
											<textarea  cols="130" rows="4"  name="msg" placeholder="Post"></textarea>
									</div>
									</div>	
									</div>
									<div class="single-register">
											<input class="confirmer" type="submit" value="Poster">
									</div>
									</form>
								</div>	
							</div>
						</div>
					</div>
				</div>
				<!-- cart-main-area-end -->
			</div>
			</div>
      <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; YANA 2020</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/datatables-demo.js"></script>
    </body>
</html>