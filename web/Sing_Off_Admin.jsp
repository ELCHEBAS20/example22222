<%-- 
    Document   : Sing_Off_Admin
    Created on : 22-oct-2022, 20:01:42
    Author     : Juan Sebastian S
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
    <style>

        body{
            background:#1b1b38;
        }

        .container_box_info{
            width: 100%;
            height: 100vh;
            background-color:#1b1b38;
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
        }

        span{
            font: bold 80px/1 arial;
            text-transform: uppercase;
            color: #c69c1e;
            text-shadow: 0  2px 0 #8b6e15,
                0  4px 0 #7c6213,
                0  6px 0 #6e5611,
                0  8px 0 #5f4b0e,
                0 10px 0 #503f0c,
                0 12px 0 #41330a;
        }


        span{
            display: block;
            white-space: nowrap;
            color: #fff;
            border-right: 5px solid #a16eff;
            width: 23.5ch;
            font-size: 20px;
            animation: Writer 5s steps(26),
                Parpadeo 1s infinite alternate;
            overflow: hidden;
        }



        @keyframes Writer{
            from {
                width:0;
            }
        }

        @keyframes Parpadeo{
            70% {
                border-color:transparent;
            }
        }



        span img{
            position: absolute;
        }

        #btn_volver{
            position: relative;
            top: 600px;
            left: 580px;
            width: 400px;
            font-size: 20px;
            font-weight: bold;
            text-decoration: underline;
        }
</style>
    <body>
        
         <%
       String nombre = request.getSession().getAttribute("NameUser").toString();
       request.getSession().invalidate();
       request.getSession().removeAttribute("NameUser");       
       %>
        
       
       <input type="button" value="Volver" id="btn_volver" onclick="location.href='indexRol.jsp'" class="btn btn-danger"/>
         
       <div class="container_box_info">
       
           <span>¡FINALIZADA LA SESION!</span>
           
           <img src="Img/Bye.png" alt="alt"/>
       </div>
       
        <script>
           sessionStorage.setItem('Session','session_invalidate');   
       </script>
       
    </body>
</html>
