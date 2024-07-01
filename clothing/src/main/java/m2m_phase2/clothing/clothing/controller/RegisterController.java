package m2m_phase2.clothing.clothing.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class RegisterController {
    @GetMapping("/register") // hàm phatteacher
    public String register() {
        return "swappa/assests/html/acc_register2";

    }

    @GetMapping("/verifyOtpRegister") // hàm phatteacher
    public String verifyOtpRegister() {
        return "swappa/assests/html/acc_register__OTP2";

    }

}
