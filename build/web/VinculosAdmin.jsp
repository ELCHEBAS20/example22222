<%-- 
  Integrantes: Paula Bonilla,Kevin Cañon,Juan Suarez.
  Descripcion: "Login con [JAVA WEB] con dos diferentes roles tanto para usuario como para admin."
  fecha_de_entrega: XXX-XXX-XXX
  Version: 1.0
--%>

<%@page import="java.util.List"%>
<%@page import="Modelo.UsersMain"%>
<%@page import="Controlador.ControllerUser"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
              <link rel="icon" href="Img/LogoJava.png"/>

        <title>Vinculos_Usuario</title>
        
        <style>
  
            body{
              background:#1b1b38;
              font-family:'Open Sans,sans-serif';
          }
          
          #CardBox{
              display: flex;
              flex-wrap: wrap;
              padding: 40px;
             cursor: pointer;
          }
          
          .DivMain{
              width: 200px;
              height: 240px;
              background: rgba( 208, 208, 225, 0.2 );
              box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 );
              backdrop-filter: blur( 10px );
              -webkit-backdrop-filter: blur( 17px );
              border-radius: 10px;
              border: 1px solid rgba( 255, 255, 255, 0.18 );
              margin-left: 5rem;
              text-align: center;
          }  
          
          p{
              color: white;
              position: relative;
              font-size: 20px;
          }
        </style>
        
    </head>
    <body>
        
        <%  
               String rtsVinculo = request.getParameter("VinculoUser"); // Obtenemos GET por medio del REQUEST de la URL.
               ControllerUser ctrlUser = new ControllerUser();  // Instancia de un Objeto para llamar FUNCTION.
               String IdPets = "", NamePets = "", AgePets = "", EspeciePets = "", GeneroPets = "",RazaPets = ""; // Creamos atributos de la clase como NULL.
        %>
 
         <%
          List<Object[]>Listdato=ctrlUser.Vinculos(rtsVinculo); // Convertimos nuestro LIST en un Object[] para ser reccorrido externamente con un for in e internamente con un FOr.
           int lgnFinal=Listdato.size(); // Longitud de la consulta DB.
           
           boolean isNull=(lgnFinal!=0) ? true : false; // Condicional Ternaria.
           
           if(isNull==true){ // Si es true hace lo interno.
         for (Object[] elem : Listdato) {
                 for (int index = 0; index < elem.length; index++) { // Recorrido del Objecto[]
                     if (index == 0) {
                         IdPets += " " + elem[index];
                     } else if (index == 1) {
                         NamePets += " " + elem[index];
                     } else if (index == 2) {
                         AgePets += " " + elem[index];
                     } else if (index == 3) {
                         EspeciePets += " " + elem[index];
                     } else if(index==4){
                         GeneroPets += " " + elem[index];
                     }else if(index==5){
                         RazaPets += " " + elem[index];
                         }
                 }
             }
         %>

         <div id="CardBox">
             
         </div>

         <%
         } else {%>
            <script>
                swal("No data found.", "¡Sr@ <%=rtsVinculo%> no tiene ninguna mascota vinculada.!", "error"); // MsgError si no se encuentra DATA en la DB.
            </script> 
            <%
            }%>
         <script>
             
             let NcantidadPets=<%=lgnFinal%>
             
             let DivUser=[],IdPets=[],NamePets=[],AgePets=[],EspeciePets=[],GeneroPets=[],RazaPets=[];
             
             //Variables que llegan con _DATA_ de la JAVA,Se quitan espacios tanto de Izq-Dere/Dere-Izq.
             let StrlIdPets="<%=IdPets%>".trim();
             let StrlNamePets="<%=NamePets%>".trim();
             let StrlAgePets="<%=AgePets%>".trim();
             let StrlEspecie="<%=EspeciePets%>".trim();
             let StrlGenero="<%=GeneroPets%>".trim();
             let StrlRaza="<%=RazaPets%>".trim();
             
             // ============================================================================================ //
             
             //Se Separa La "Cadena" en Espacios volviendolo en un ARRAYSPLIT.
             const StrlSplitNamePets=StrlNamePets.split(" ");
             const StrlSplitAgePets=StrlAgePets.split(" ");
             const StrlSplitEspecie=StrlEspecie.split(" ");
             const StrlSplitGenero=StrlGenero.split(" ");
             const StrlSplitRaza=StrlRaza.split(" ");
              // Cierre de la cadena con el separador respectivo.
              
              for (let iterador = 0; iterador < (NcantidadPets-1)+1; iterador++) {
  
                         DivUser[iterador]=document.createElement("div");
                         DivUser[iterador].id="Caja"+(iterador+1);
                         DivUser[iterador].className="DivMain";
                         NamePets[iterador]=document.createElement("p");
                         NamePets[iterador].textContent=StrlSplitNamePets[iterador];   
                         AgePets[iterador]=document.createElement("p");
                         AgePets[iterador].textContent=StrlSplitAgePets[iterador];
                         EspeciePets[iterador]=document.createElement("p");
                         EspeciePets[iterador].textContent=StrlSplitEspecie[iterador];
                         GeneroPets[iterador]=document.createElement("p");
                         GeneroPets[iterador].textContent=StrlSplitGenero[iterador];
                         RazaPets[iterador]=document.createElement("p");
                         RazaPets[iterador].textContent=StrlSplitRaza[iterador];

                         $('#CardBox').append(DivUser[iterador]);
                         $('#Caja'+(iterador+1)).
                                 append(NamePets[iterador]).
                                 append(EspeciePets[iterador]).
                                 append(GeneroPets[iterador]).append(RazaPets[iterador]).    append(AgePets[iterador]);    
                     }
           </script>
    </body>
</html>
