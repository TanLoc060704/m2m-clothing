$(document).ready(function () {
    const login = async () => {
        let email = $('#email').val();
        let password = $('#password').val();

        if (email === '' || password === '') {
            Swal.fire({
                icon: "error",
                title: `Please fill all the fields`,
                showConfirmButton: true,
                timer: 3000
            })
            return;
        }
        let patternEmail = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
        if (!patternEmail.test(email)) {
            Swal.fire({
                icon: "error",
                title: `Invalid email`,
                showConfirmButton: true,
                timer: 3000
            })
            return;
        }
        await axios.post("/api/account/submitLogin",
            {
                email: email,
                password: password
            })
            .then(response => {
                let data = response.data;
                if (data.message === 'Email does not exists') {
                    Swal.fire({
                        icon: "error",
                        title: `Email does not exists`,
                        showConfirmButton: true,
                        timer: 3000
                    })
                    return;
                } else if (data.message === 'Login success') {
                    Swal.fire({
                        icon: "success",
                        title: `Login success`,
                        showConfirmButton: true,
                        timer: 3000
                    }).then((result) => {
                        if (result.dismiss === Swal.DismissReason.timer || result.isConfirmed) {
                            window.location.href = "/";
                        }
                    })
                    return;
                } else if (data.message === 'Password is incorrect') {
                    Swal.fire({
                        icon: "error",
                        title: `Password is incorrect`,
                        showConfirmButton: true,
                        timer: 3000
                    })
                    return;
                }
            })
            .catch(error => {
                console.log(error);
            })
    }
    $('#login').click(function () {
        login();
    })
    $('#email,#password').keypress(function (e) {
        if (e.which === 13) {
            login();
        }
    })

})