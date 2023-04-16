
'use strict';

let viewContra=()=>{
     $(document).ready(() => {

    $('#btnRegister').click(() => {
        $('#LgMain').hide('slow');
        $('#RgMain').show('slow');
    });

    $('#btnInicio').click(() => {

        $('#LgMain').show('slow');
        $('#RgMain').hide('slow');
    });

});
}

let mostrarContrasena=()=>{
      var tipo = document.getElementById("first_name");
      let imgProfile=document.getElementById("BtnMostrar");
      if(tipo.type == "password"){
          tipo.type = "text";
          imgProfile.src="Img/visibilidad.png";
      }else{
          tipo.type = "password";
           imgProfile.src="Img/No_Visible.png";
      }
       };

// Por medio del click que haga el usuario sabremos si lo quiere eliminar o efectivamente nop.
let DeleteInfo = (event) => {

    const setId = $(event).val();

    swal({
        title: "¿Estas seguro que quiere eliminar la data de la DB?",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    }).then((isDelete) => {
        if (isDelete) {
            location.href = "./Modificador_Admin?TipoUsuario=UsuarioAdmin&Opcion=Eliminar&id=" + setId;
        } else {
            return false;
        }
    });
}

let getValue = (event) => {

    let Datos_Input = [];

    let btnModificar = $(event).val();
    let data_form = document.getElementById("data_box" + btnModificar).children;
    let data_input = document.querySelector("#form-data").children;

    for (let index = 0; index <= 5; index++) {
        Datos_Input.push(data_form[index].textContent.trim());
    }

    for (let iterador = 0; iterador < data_input.length; iterador++) {
        data_input[iterador].value = Datos_Input[iterador];
    }
}

let DefLocalStorage=()=>{
     let LocalData=sessionStorage.getItem("Session");
   
          if(LocalData=="session_invalidate"){
              $('.menu').remove();
              $('#tbl_vinculos').remove();
              $('#tbl_vinculos').hide();
              $('#perfil_admini').remove();
              $('#btn_add').remove();
          }
          
}

let setValue = (event) => {

    let Datos_Input = [];

    let btnModificar = $(event).val();
    let data_form = document.getElementById("databox" + btnModificar).children;
    let data_input = document.querySelector("#form-data").children;

    for (let index = 0; index <= 5; index++) {
        Datos_Input.push(data_form[index].textContent.trim());
    }

    for (let iterador = 0; iterador < data_input.length; iterador++) {
        data_input[iterador].value = Datos_Input[iterador];
    }
};
        
let setId = () => {
    let data = $('#Cmb_Id').val();
    let StrlSplit = data.split(',')[0];

    if (data == 'Seleccionar un [Id]') {
        $('#txt_user_id').hide('slow');
    } else {
        $('#txt_user_id').val(StrlSplit).show('slow');
    }
};


    
viewContra();
DefLocalStorage();


