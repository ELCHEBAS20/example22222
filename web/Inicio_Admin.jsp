<%-- 
  Integrantes: Paula Bonilla,Kevin Cañon,Juan Suarez.
  Descripcion: "Login con [JAVA WEB] con dos diferentes roles tanto para usuario como para admin."
  fecha_de_entrega: XXX-XXX-XXX
  Version: 1.0
--%>


<%@page import="Controlador.ControllerAdmin"%>
<%@page import="Controlador.ControllerInfoChip"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    
    <%
        String _Data_ = (String) request.getSession().getAttribute("DataProfile");
        String NCantidad = (String) request.getSession().getAttribute("Ncantidad");
        String[] StrlProfile = _Data_.split("\\,");
    %> 
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
         <link rel="icon" href="Img/LogoJava.png"/>
         
         <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
 <script src="https://cdn.jsdelivr.net/npm/chart.js@latest/dist/Chart.min.js"></script>
<link rel="stylesheet" href="Frontend/Dashboard.css"/>
        <title>Estadistica Dashboard</title>
    </head>
    <body>
        

        <jsp:include page="/Template_Dashboard/DashTemplate.jsp"/>
        
        <!<!-- Dashboard Vinculos del usuario.-->
       
        <div id="tbl_vinculos" class="Grafica"> 
            <canvas id="Grafica">
            
        </canvas> 

        </div> 

        <script>
        
        'use strict';
        
         let LocalData=sessionStorage.getItem("Session");
       
          if(LocalData=="session_invalidate"){
              $('.menu').remove();
              $('#tbl_vinculos').remove();
              $('#perfil_admini').remove();
          }
        
         let Graphic01=()=>{
   
         const Activo="<%=NCantidad.charAt(0)%>";
         const Inactivo="<%=NCantidad.charAt(1)%>";
         const Suspendido="<%=NCantidad.charAt(2)%>";
         
         let GraficaStatus=document.getElementById("Grafica");
         const etiquetas = ["Activo", "Inactivo","Suspendidos"];
           
            const RstStatus = {
    label: "Estados de un chip del animal en tiempo real.",
    data: [parseInt(Activo),parseInt(Inactivo),parseInt(Suspendido)], // La data es un arreglo que debe tener la misma cantidad de valores que la cantidad de etiquetas
   backgroundColor: [
        '#FF1313',
        '#61FF98',
        '#8194FF',
    ], // Color de fondo
    borderColor: '#fff', // Color del borde
    borderWidth: 3,// Ancho del borde
};

new Chart(GraficaStatus, {
    type: 'doughnut',// Tipo de gráfica
    data: {
        labels: etiquetas,
        datasets: [
            RstStatus,
        ]
    },
    // Aca podemos cambiar el color
    options:{
        legend:{
            position:'chartArea',
            padding:10,
            labels:{
                
                fontColor:'#fff',
                fontSize:15,
                font:'Open Sans,sans-serif'
            }
        }
    }
});
         }
        
         Graphic01();

        </script>
        
        
    </body>
</html>
