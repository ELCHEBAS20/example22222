<%-- 
  Integrantes: Paula Bonilla,Kevin Cañon,Juan Suarez.
  Descripcion: "Login con [JAVA WEB] con dos diferentes roles tanto para usuario como para admin."
  fecha_de_entrega: XXX-XXX-XXX
  Version: 1.0
--%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="Frontend/AdminStyle.css"/>
         <link rel="icon" href="Img/LogoJava.png"/>
         <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
         <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
         <title>Administrador</title>
         
    </head>
    <body id="body">
        
        <!<!-- Logo para el CSS. -->
        
        <div id="LogosAdmin"> 
        
            <div id="ImgIzqu">
            <img src="Img/Patita_Negra.png" id="pata1"alt="alt"/>
            <img src="Img/Patita_Negra.png" id="pata2" alt="alt"/>
            <img src="Img/Patita_Negra.png"  id="pata3" alt="alt"/>
            <img src="Img/Patita_Negra.png"  id="pata4" alt="alt"/>
            </div>
            
            <div id="ImgDere" >
            
                <img src="Img/Patita_Negra.png" id="pata5"alt="alt"/>
            <img src="Img/Patita_Negra.png" id="pata6" alt="alt"/>
            <img src="Img/Patita_Negra.png"  id="pata7" alt="alt"/>
            <img src="Img/Patita_Negra.png"  id="pata8" alt="alt"/>
                
            </div>
        </div>
        
        
        <div id="Container-data"> 
            
            <div id="loadImg"> 
              
            </div>
          
            <div id="content-box">
            
                <form name="form-group" id="form-group" action="">
                    
                    <input type="text" class="form-control" id="txt_admin" name="txt_admin"  placeholder="Ingresar usuario"  required>
                    <input type="password" class="form-control" id="txt_pswd" name="txt_pswd_admin"  placeholder="Ingresar contraseña" required>
                     <button type="button" class="btn btn-primary" onclick="validarData()">Submit</button>
                     
                </form>
                
            </div>
            
            <div id="Content_Msg"></div>
           
        </div>
        
        <script> 
          
          
         


          let validarData=()=>{
            $('#loadImg').show();
          let Msg="";
          let data=$('#form-group').serialize();
          let nickname=$('#txt_admin').val();
          
          $.ajax({
        
             type:'POST',
             url:'Api_Admin_',
             data:data,
             dataType: 'JSON',
             success: function (data) {
                        
                        Msg=data[0]['msg'];
                        
                        if(Msg=="null"){
                            $('#Content_Msg').html("<h4>¡Hay campos vacios!</h4>");
                            $('#loadImg').hide('slow');
                            return false;
                        }else{
                            if(Msg=="true"){
                            $('#loadImg').html('<img src="Img/cargando.gif" width="160px" height="140px" alt="alt"/>');
                           setTimeout(()=>{
                                
                                let Hipervinculo=document.createElement("a");
                                Hipervinculo.textContent="Por favor ingresa a este ¡LINK!.";
                                Hipervinculo.id="Hpvinculo";
                                Hipervinculo.href="Inicio_Admin.jsp";
                                
                                $('#Content_Msg').append(Hipervinculo);
                                $('#loadImg').hide('slow');
                                $('h4').hide('slow');
                                 sessionStorage.setItem("Session","") // remueve la sesion de Localstorage.
                           },2000);
                        }else{
                            $('#loadImg').html('<img src="Img/cargando.gif" width="160px" height="140px" alt="alt"/>');
                           setTimeout(()=>{
                               
                                $('#Content_Msg').html("<h4>Not data found in the DB.</h4>");
                                $('#loadImg').hide('slow');
                                $('#Hpvinculo').hide('slow');
                           },2000);
                           return false;
                        };
                        }
                         
                    }
          });
          console.log(nickname);
          };
          
            </script>
       
    </body>
</html>
