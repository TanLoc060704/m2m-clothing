$(document).ready(function () {
    const forgotPass = async () => {
        let email = $('#email').val();

        if (email === '') {
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
        await axios.post("/api/account/forgotPassword",
            {
                email: email
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
                } else if (data.message === 'Call API Successfully') {
                    Swal.fire({
                        icon: "success",
                        title: `Please check your email to reset password`,
                        showConfirmButton: true,
                        timer: 3000
                    }).then((result) => {
                        if (result.dismiss === Swal.DismissReason.timer || result.isConfirmed) {
                            window.location.href = "/loginacount";
                        }
                    })
                    return;
                }
            })
            .catch(error => {
                console.log(error);
            })
    }

    $('#forgotPass').click(() => {
        forgotPass();
    })

    $('#email').keypress((e) => {
        if (e.key === 'Enter') {
            forgotPass();
        }
    })

    const changePass = async () => {
        let password = $('#password').val();
        let confirmPassword = $('#confirmPassword').val();

        if (password === '' || confirmPassword === '') {
            Swal.fire({
                icon: "error",
                title: `Please fill all the fields`,
                showConfirmButton: true,
                timer: 3000
            })
            return;
        }
        if (password !== confirmPassword) {
            Swal.fire({
                icon: "error",
                title: `Password and Confirm Password do not match`,
                showConfirmButton: true,
                timer: 3000
            })
            return;
        }
        await axios.post("/api/account/confirmPasswordForgot",
            {
                password: password,
                confirmPassword: confirmPassword
            })
            .then(response => {
                let data = response.data;
                if (data.message === 'Password changed successfully') {
                    Swal.fire({
                        icon: "success",
                        title: `Password changed successfully`,
                        showConfirmButton: true,
                        timer: 3000
                    }).then((result) => {
                        if (result.dismiss === Swal.DismissReason.timer || result.isConfirmed) {
                            window.location.href = "/loginacount";
                        }
                    })
                    return;
                }
            })
            .catch(error => {
                console.log(error);
            })
    }

    $('#confirmForgotPass').click(() => {
        changePass();
    })
    $('#password,#confirmPassword').keypress((e) => {
        if (e.key === 'Enter') {
            changePass();
        }
    })

})