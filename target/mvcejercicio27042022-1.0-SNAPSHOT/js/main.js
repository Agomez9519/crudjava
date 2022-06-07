/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

function edit(id, email, password) {
    Swal.fire({
        title: 'Deseas Editar el registro numero ' + id + "-" + email + " " + password + '?',
        text: "",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Editar!'
    }).then((result) => {

        if (result.value) {
           /* Swal.fire(
                    'Registro Editado!',
                    'success'
                    )*/
            
            window.location.href = "editar.jsp?id=" + id;
        }
    })

}


function del(id) {
    Swal.fire({
        title: 'Deseas Eliminar el registro numero ' + id + '?',
        text: "",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Eliminar!'
    }).then((result) => {

        if (result.value) {
            Swal.fire(
                    
                    'Registro eliminado!',
                    'success',
                    
                    )
                    let accion = "Delete";
                  window.location.href = "Controller?id="+ id+"&accion="+accion;
        }

    })
}
    


