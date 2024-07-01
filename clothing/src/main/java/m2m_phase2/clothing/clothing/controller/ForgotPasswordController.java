package m2m_phase2.clothing.clothing.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import m2m_phase2.clothing.clothing.data.entity.Account;
import m2m_phase2.clothing.clothing.service.impl.AccountServiceImpl;
import m2m_phase2.clothing.clothing.service.impl.UserServiceImpl;
import m2m_phase2.clothing.clothing.utils.PasswordEncoderUtil;

import java.util.concurrent.TimeUnit;

import static m2m_phase2.clothing.clothing.service.impl.AccountServiceImpl.token;

@Controller
public class ForgotPasswordController {
    @Autowired
    private AccountServiceImpl accountServiceImpl;
    @Autowired
    private HttpSession session;
    @Autowired
    private UserServiceImpl userService;

    @GetMapping("/forgot-password")
    public String forgotPassword() {
        return "swappa/assests/html/acc_forgot_pass2";
    }

    @GetMapping("/confirmPasswordForgot/{token}")
    public String ForgotLink(@PathVariable("token") String token, Model model) {
        if (token == null || token.equals("") || !token.equals(AccountServiceImpl.token)) {
            return "swappa/assests/html/acc_forgot_pass2";
        }
        return "swappa/assests/html/acc_forgot_pass_xacnhan2";
    }
}
