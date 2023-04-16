<%-- 
  Integrantes: Paula Bonilla,Kevin Cañon,Juan Suarez.
  Descripcion: "Login con [JAVA WEB] con dos diferentes roles tanto para usuario como para admin."
  fecha_de_entrega: XXX-XXX-XXX
  Version: 1.0
--%>
<%@page import="Modelo.UsersMain"%>
<%@page import="javax.servlet.http.HttpServletResponse" %>
<%@page import="Controlador.ControllerUser"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="Img/LogoJava.png"/>
      
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
        <link rel="stylesheet" href="Frontend/Style.css"/>
        <!-- Compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

        <!-- Compiled and minified JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
        <title>Login-SignUp</title>

    </head>
    <body>

        <section>

            <div class="imgBx">
                <img src="Img/Fondo.jpg" alt="alt"/>

            </div>

            <div class="contentBx">

                <div id="DivContent">

                    <!<!-- =================================================================================================== -->        
                    <!<!-- Login Principal -->
                    <div id="LgMain"> 
                        <img src="Img/Profile.png" width="90px" alt="alt"/> 

                        <form name="form-group" id="form-group">
                            <div class="InputUser">
                                <div class="input-field col s6">
                                    <input value="" id="txt_user" type="text" name="txt_usuario"  class="validate">
                                    <label class="active" for="first_name2">Usuario</label>
                                </div>
                            </div>

                            <div class="InputPswd">
                                <div class="input-field col s6">
                                    <input value="" id="first_name" type="password" name="txt_pwd" class="validate">
                                    <label class="active" for="first_name">Contraseña</label>
                                </div>
                            </div>
                            <input type="button" value="Submit" id="BtnSubmit" name="btn_submit" onclick="onclickValidar()" class="button"/>
                        </form>

                        <input type="button" id="btnRegister" onclick="click()" value="SignUp" />  
                        <input type="image" src="Img/No_Visible.png" id="BtnMostrar" onclick="mostrarContrasena();" width="20px"  height="20px" width="170"/> 

                        <div class="MsgError"></div>

                        <div id="load_img"></div>

                    </div>


                    <!<!-- Aca se cierra el login principal -->

                    <!<!-- =================================================================================================== -->   

                    <!<!-- Register Principal -->
                    <div id="RgMain" style="display: none;">
                         
                        
                        <img src="Img/registro.png"  height="100px" id="ImgRegistro" style="margin-left: 70px" alt="alt"/>
                        
                        <div id="form_main"> 
                        <form name="form-group" id="data-form">
                            <div class="InputUser_register">
                                <div class="input-field col s6">
                                    <input  id="txt_user" type="text" name="txt_usuario" class="validate">
                                    <label class="active" for="txt_user">Nombre</label>
                                </div>
                            </div>

                            <div class="InputSurname_register">
                                <div class="input-field col s6">
                                    <input id="Apellido" type="text" name="txt_apellido" class="validate">
                                    <label class="active" for="Apellido">Apellido</label>
                                </div>
                            </div>
                            
                            <div class="InputPswd_register">
                                <div class="input-field col s6">
                                    <input id="Contra" type="password" name="txt_Contrasena" class="validate">
                                    <label class="active" for="Contra">Contraseña</label>
                                </div>
                            </div>
                            
                            <div class="InputAddres_register">
                                <div class="input-field col s6">
                                    <input id="Direccion" type="text" name="txt_Direccion" class="validate">
                                    <label class="active" for="Direccion">Direccion</label>
                                </div>
                            </div>
                            
                            <div class="InputEmail_register">
                                <div class="input-field col s6">
                                    <input id="Email" type="text" name="txt_Email" class="validate">
                                    <label class="active" for="Email">E-Mail</label>
                                </div>
                            </div>
                            
                            <div class="alert alert-danger" id="No_validate_register"  style="margin-left: -20px;display: none;" role="alert">

                            </div>
                            
                            <input type="button" value="Submit" id="BtnSubmit_register" style="width: 150px;" name="btn_submit" onclick="RegisterUser();" class="button"/>
                        </form>
                        </div>
                        
                        <div id="div_box_effect"> 
                         <div id="Class_btn_Register" class="Register_Btn" >
                           <button class="btn_hover" value="X" id="btnInicio" class="button"><i class="fa-solid fa-x"></i></button>
                        </div>
                        </div>
                    </div> 
                    
                    
                    <!-- Cerramos el Register Principal --> 
                </div>

            </div>

        </section>


        <!<!-- Script para efectos.-->
       

        <script src="./Vista/api.js">
            
            /*Validar las peticiones por AJAX */

            let onclickValidar = () => {

                let Msg = "";
                let data = $('#form-group').serialize();

                $.ajax({

                    type: 'POST',
                    url: 'ApiUser',
                    data: data,
                    dataType: 'JSON',
                    success: function (data) {

                        Msg = data[0]['msg'];

                        if (Msg == "1") {
                            $('.MsgError').html("<p style='color:black;'>Cargando Info.. </p>");
                            $('#load_img').html("<img src='Img/cargando.gif' width='50px' height='50px'/>").show();
                            setTimeout(() => {
                                 sessionStorage.setItem("Session","");
                                window.location.replace('Inicio.jsp');
                            }, 2000);
                        } else {
                            $('.MsgError').html("<p style='color:black;'>Cargando Info.. </p>");
                            $('#load_img').html("<img src='Img/cargando.gif' width='50px' height='50px'/>");

                            setTimeout(() => {
                                $('.MsgError').html("<p style='color:red';>Not data found in DB.</p>");
                                $('#load_img').hide();
                            }, 4000);
                            return false;
                        }
                    }
                });

            };
            
            let RegisterUser=()=>{
              
              let data=$('#data-form').serialize();
              
              $.ajax({
            
               type: 'POST',
               url: "Api_Register",
               data: data,
               dataType: 'JSON', 
               success: function (data) {
                        
                        let Msg=data[0]['MsgFinal'];  
 
                     if(Msg==false){
                         $('#No_validate_register').hide('fast').
                                 removeClass("alert alert-success").
                                 addClass("alert alert-danger").
                                 html('<p><b>Por favor los campos estan vacios.</b></p>');;
                         
                         $('#No_validate_register').show('slow');                 
                     }else{
                         $('#No_validate_register').hide('fast').removeClass("alert alert-danger").addClass("alert alert-success");
                         $('#No_validate_register').html('<p><b>Registrado correctame el usuario.</b></p>').show('slow');
                         
                     }
                    
                    }
              });  
            };

            $(document).ready(function () {
                M.updateTextFields();
            });
        </script>

    </body>
</html>
