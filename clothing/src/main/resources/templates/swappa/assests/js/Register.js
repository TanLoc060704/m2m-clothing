$(document).ready(function () {
    const register = async () => {
        let username = $('#username').val();
        let password = $('#password').val();
        let confirmPass = $('#confirmPass').val();
        let email = $('#email').val();

        if (username === '' || password === '' || confirmPass === '' || email === '') {
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
        if (confirmPass !== password) {
            Swal.fire({
                icon: "error",
                title: `Password does not match`,
                showConfirmButton: true,
                timer: 3000
            })
            return;
        }
        await axios.post("/api/account/getAccountByUsernameAndEmail",
            {
                username: username,
                email: email,
                password: password,
                confirmPassword: confirmPass
            })
            .then(response => {
                let data = response.data;
                if (data.message === 'Username already exists') {
                    Swal.fire({
                        icon: "error",
                        title: `Username already exists`,
                        showConfirmButton: true,
                        timer: 3000
                    })
                    return;
                } else if (data.message === 'Email already exists') {
                    Swal.fire({
                        icon: "error",
                        title: `Email already exists`,
                        showConfirmButton: true,
                        timer: 3000
                    })
                    return;
                } else if (data.message === 'OTP sent to email') {
                    Swal.fire({
                        icon: "success",
                        title: `OTP has been sent to your email <br>` +
                            `<span style="color: #bb2025">OTP time limit is 1 minute</span>`,
                        showConfirmButton: true,
                        timer: 5000
                    }).then((result) => {
                        if (result.dismiss === Swal.DismissReason.timer || result.isConfirmed) {
                            window.location.href = "/verifyOtpRegister";
                        }
                    });
                }
            })
            .catch(error => {
                    console.log(error);
                }
            )
    }
    $('#register').click(register);
    $('#username, #password, #confirmPass, #email').keypress(function (e) {
        if (e.which === 13) {
            register();
        }
    })

    const confirmRegisterOtp = async () => {
        let otp = $('#otp1').val() + $('#otp2').val() + $('#otp3').val() + $('#otp4').val() + $('#otp5').val() + $('#otp6').val();
        if (otp.length !== 6) {
            Swal.fire({
                icon: "error",
                title: `Invalid OTP`,
                showConfirmButton: true,
                timer: 3000
            })
            return;
        }
        if (isNaN(otp)) {
            Swal.fire({
                icon: "error",
                title: `OTP must be a number`,
                showConfirmButton: true,
                timer: 3000
            })
            return;
        }
        await axios.post("/api/account/verifyOtpRegister", null,
            {
                params: {
                    otp: otp
                }
            })
            .then(response => {
                let data = response.data;
                if (data.message === 'OTP is correct') {
                    Swal.fire({
                        icon: "success",
                        title: `Create account successfully`,
                        showConfirmButton: true,
                        timer: 3000
                    }).then((result) => {
                        if (result.dismiss === Swal.DismissReason.timer || result.isConfirmed) {
                            window.location.href = "/loginacount";
                        }
                    });
                    return;
                } else if (data.message === 'OTP is incorrect') {
                    Swal.fire({
                        icon: "error",
                        title: `Invalid OTP`,
                        showConfirmButton: true,
                        timer: 3000
                    })
                    return;
                } else if (data.message === 'OTP is expired') {
                    Swal.fire({
                        icon: "error",
                        title: `OTP has expired`,
                        showConfirmButton: true,
                        timer: 3000
                    })
                    return;
                }
            })
            .catch(error => {
                    console.log(error);
                }
            )
    }
    $('#btnConFirmRegisterOtp').click(confirmRegisterOtp);

    const resendOtp = async () => {
        await axios.post("/api/account/resendOtpRegister")
            .then(response => {
                let data = response.data;
                if (data.message === 'OTP sent to email') {
                    Swal.fire({
                        icon: "success",
                        title: `OTP has been sent to your email <br>` +
                            `<span style="color: #bb2025">OTP time limit is 1 minute</span>`,
                        showConfirmButton: true,
                        timer: 5000
                    });
                }
            })
            .catch(error => {
                    console.log(error);
                }
            )
    }
    $('#btnResendRegisterOtp').click(resendOtp);


    // js focus của otp
    $('.otp-input').on('input', function () {
        const currentInput = $(this);
        if (currentInput.val().length === 1) {
            const nextInput = currentInput.next('.otp-input');
            if (nextInput.length) {
                nextInput.focus();
            }
        }
    });

    $('.otp-input').on('keydown', function (event) {
        const currentInput = $(this);
        if (event.key === 'Enter') {
            event.preventDefault();
            confirmRegisterOtp();
        }
        if (event.key === 'Backspace' && currentInput.val().length === 0) {
            const prevInput = currentInput.prev('.otp-input');
            if (prevInput.length) {
                prevInput.focus();
            }
        }
    });
    $('#otp1').focus();
})