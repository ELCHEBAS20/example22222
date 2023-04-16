<%-- 
  Integrantes: Paula Bonilla,Kevin Cañon,Juan Suarez.
  Descripcion: "Login con [JAVA WEB] con dos diferentes roles tanto para usuario como para admin."
  fecha_de_entrega: XXX-XXX-XXX
  Version: 1.0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cerrar Sesion</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
       <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

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
    position: absolute;
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
    font-size: 8    0px;
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
        
        
        
    </head>
    <body>
        
        
       <%
       String nombre = request.getSession().getAttribute("Adress").toString();
       request.getSession().invalidate();
       request.getSession().removeAttribute("Adress");       
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
