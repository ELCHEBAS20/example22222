<!<!-- De aqui comienza el dashboard -->

        <div class="d-flex"> 
        
            <div id="sidebar-container">
                <div class="logo">
                    <h4>WELCOME</h4>
                </div>        
                 <div class="menu"> 
            <a href="Inicio_Admin.jsp" class="d-block  p-4 ml-2"><i class="fa-solid fa-layer-group mr-2 "></i>Dashboard</a>
                    <a href="ProfileAdmin.jsp" class="d-block p-4 ml-2" ><i class="fa-sharp fa-solid fa-user mr-2 lead"></i>Perfil</a>
                      <a href="UsuarioAdmin.jsp" class="d-block  p-4 ml-2" ><i class="fa-solid fa-database mr-2 "></i>Usuarios</a>
                       <a href="MascotaAdmin.jsp" class="d-block  p-4 ml-2"><i class="fa-solid fa-database mr-2"></i>Mascotas</a>
                        <a href="InfoChipAdmin.jsp" class="d-block  p-4 ml-2"><i class="fa-solid fa-database mr-2"></i>InfoChip</a>
                </div>
            </div> 
            
            <!<!-- Navbar -->
            
            <div class="w-100">
             <nav class="navbar navbar-expand-lg navbar-light" id="container">
 
                 <div class="container">
                   <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav ml-auto" >
     
        <li class="nav-item dropdown" id="perfil_admini">
        <a id="user-text" class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <img src="Img/admin01.png" class="img-fluid rounded-circle avatar mr-2">
         ${NameUser}
        </a>
        <div class="dropdown-menu"  id="drop_menu" aria-labelledby="navbarDropdown">
            <a class="dropdown-item" id="Lg_Sign_off" href="Sing_Off_Admin.jsp"><i class="fa-solid fa-right-from-bracket"></i> <strong>Cerrar Sesion</strong></a>
        </div>
      </li>
    </ul>
  </div>
                 </div>
</nav>
            </div>
        
      