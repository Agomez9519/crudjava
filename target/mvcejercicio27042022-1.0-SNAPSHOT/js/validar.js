            $(document).ready(()=>{
                $('.vacio').hide();
                $('.email').hide();
                $('.pass').hide();
                $("#frmLogin").submit(function(){
                    let email = $("#txtEmail").val().trim();
                    let pass = $("#txtPass").val().trim();
                    
                    
                    if (email == "" && pass == "") {
                    $('.vacio').show();
                    $('.email').hide();
                    $('.pass').hide();
                    return false;
                    }else if(email == ""){
                        $('.vacio').hide();
                        $('.email').show();
                        $('.pass').hide();
                        return false;
                    }else if(pass == ""){
                        $('.vacio').hide();
                        $('.pass').show();
                        $('.email').hide();
                        return false;
                    }else{
                        return;
                    }                 
                })
            })

