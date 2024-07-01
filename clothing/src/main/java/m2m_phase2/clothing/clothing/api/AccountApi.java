package m2m_phase2.clothing.clothing.api;

import jakarta.servlet.http.HttpSession;
import m2m_phase2.clothing.clothing.constant.AccountEnum;
import m2m_phase2.clothing.clothing.data.dto.AccountDto;
import m2m_phase2.clothing.clothing.data.entity.Account;
import m2m_phase2.clothing.clothing.data.variable.StaticVariable;
import m2m_phase2.clothing.clothing.service.AccountService;
import m2m_phase2.clothing.clothing.service.impl.AccountServiceImpl;
import m2m_phase2.clothing.clothing.utils.PasswordEncoderUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

@RestController
public class AccountApi {

    @Autowired
    AccountServiceImpl accountImpl;

    @Autowired
    HttpSession session;

    @GetMapping("/getAccountByUsernameAndEmail")
    public Account findByUsernameAndEmail(@RequestParam("username") String username, @RequestParam("email") String email) {
        return accountImpl.findByUsernameAndEmail(username, email);
    }

    @PostMapping("/api/account/getAccountByUsernameAndEmail")
    public ResponseEntity<?> findByUsernameAndEmail2(@RequestBody AccountDto accountDto) {
        Map<String, Object> response = new HashMap<>();
        System.out.println(accountDto.getUsername());
        try {
            if (accountImpl.findByusername(accountDto.getUsername()) != null) {
                response.put("data", null);
                response.put("message", "Username already exists");
                response.put("status", true);
                return ResponseEntity.ok(response);
            }
            if (accountImpl.findByemail(accountDto.getEmail()) != null) {
                response.put("data", null);
                response.put("message", "Email already exists");
                response.put("status", true);
                return ResponseEntity.ok(response);
            }
            response.put("data", null);
            response.put("message", "OTP sent to email");
            response.put("status", true);
            String otp = accountImpl.generateOTP();
            accountImpl.sendOTPEmail(accountDto.getEmail(), otp, "OTP for Registering Account");
            session.setAttribute("otpRegisterAccount", otp);
            session.setAttribute("otpTimeLimit", System.currentTimeMillis());
            session.setAttribute("accountRegister", accountDto);
            session.setMaxInactiveInterval(60);
        } catch (Exception e) {
            response.put("data", null);
            response.put("message", "Call API Failed");
            response.put("status", false);
        }
        return ResponseEntity.ok(response);
    }

    @PostMapping("/api/account/verifyOtpRegister")
    public ResponseEntity<?> verifyOtpRegister(@RequestParam("otp") String otp) {
        Map<String, Object> response = new HashMap<>();
        try {
            String sessionOtp = (String) session.getAttribute("otpRegisterAccount");
            long sessionTimeLimit = (long) session.getAttribute("otpTimeLimit");
            if (sessionOtp != null && sessionOtp.equals(otp) && System.currentTimeMillis() - sessionTimeLimit < 60000) {
                response.put("data", null);
                response.put("message", "OTP is correct");
                response.put("status", true);
                AccountDto accountDto = (AccountDto) session.getAttribute("accountRegister");
                accountImpl.saveAccount(AccountDto.convertAccountDtoToAccount(accountDto));
            } else if (System.currentTimeMillis() - sessionTimeLimit > 60000) {
                response.put("data", null);
                response.put("message", "OTP is expired");
                response.put("status", true);
            } else if (sessionOtp != null && !sessionOtp.equals(otp)) {
                response.put("data", null);
                response.put("message", "OTP is incorrect");
                response.put("status", true);
            }
        } catch (Exception e) {
            response.put("data", null);
            response.put("message", "Call API Failed");
            response.put("status", false);
        }
        return ResponseEntity.ok(response);
    }

    @PostMapping("/api/account/resendOtpRegister")
    public ResponseEntity<?> resendOtpRegister() {
        Map<String, Object> response = new HashMap<>();
        try {
            AccountDto accountDto = (AccountDto) session.getAttribute("accountRegister");
            String otp = accountImpl.generateOTP();
            accountImpl.sendOTPEmail(accountDto.getEmail(), otp, "OTP for Registering Account");
            session.setAttribute("otpRegisterAccount", otp);
            session.setAttribute("otpTimeLimit", System.currentTimeMillis());
            session.setMaxInactiveInterval(60);
            response.put("data", null);
            response.put("message", "OTP sent to email");
            response.put("status", true);
        } catch (Exception e) {
            response.put("data", null);
            response.put("message", "Call API Failed");
            response.put("status", false);
        }
        return ResponseEntity.ok(response);
    }

    @PostMapping("/api/account/submitLogin")
    public ResponseEntity<?> submitLogin(@RequestBody AccountDto accountDto) {
        Map<String, Object> response = new HashMap<>();
        try {
            if (accountImpl.findByemail(accountDto.getEmail()) == null) {
                response.put("data", null);
                response.put("message", "Email does not exists");
                response.put("status", true);
                return ResponseEntity.ok(response);
            }
            Account account = accountImpl.findByemail(accountDto.getEmail());
            boolean checkPass = PasswordEncoderUtil.verifyPassword(accountDto.getPassword(), account.getHashedPassword());
            if (checkPass) {
                response.put("data", null);
                response.put("message", "Login success");
                response.put("status", true);
                // Lưu thông tin đăng nhập vào session hoặc làm bất kỳ xử lý nào khác cần thiết
                session.setAttribute("loggedInUser", account.getEmail());
                StaticVariable.sessionEmail = account.getEmail();
                session.setAttribute("iduser", account.getUserId());
                session.setAttribute("email", account.getEmail());
                PasswordEncoderUtil.email = account.getEmail();
            } else {
                response.put("data", null);
                response.put("message", "Password is incorrect");
                response.put("status", true);
            }

        } catch (Exception e) {
            response.put("data", null);
            response.put("message", "Call API Failed");
            response.put("status", false);
        }
        return ResponseEntity.ok(response);
    }

    @PostMapping("/api/account/forgotPassword")
    public ResponseEntity<?> forgotPassword(@RequestBody AccountDto accountDto) {
        Map<String, Object> response = new HashMap<>();
        try {
            Account account = accountImpl.findByemail(accountDto.getEmail());
            if (account == null) {
                response.put("data", null);
                response.put("message", "Email does not exists");
                response.put("status", true);
                return ResponseEntity.ok(response);
            }
            accountImpl.sendLinkEmail(accountDto.getEmail());
            session.setAttribute("email", accountDto.getEmail());
            response.put("data", null);
            response.put("message", "Call API Successfully");
            response.put("status", true);
        } catch (Exception e) {
            response.put("data", null);
            response.put("message", "Call API Failed");
            response.put("status", false);
        }
        return ResponseEntity.ok(response);
    }

    @PostMapping("/api/account/confirmPasswordForgot")
    public ResponseEntity<?> confirmPasswordForgot(@RequestBody AccountDto accountDto) {
        Map<String, Object> response = new HashMap<>();
        try {
            String email = (String) session.getAttribute("email");
            Account account = accountImpl.findByemail(email);
            account.setHashedPassword(PasswordEncoderUtil.encodePassword(accountDto.getPassword()));
            accountImpl.saveAccount(account);
            response.put("data", null);
            response.put("message", "Password changed successfully");
            response.put("status", true);
        } catch (Exception e) {
            response.put("data", null);
            response.put("message", "Call API Failed");
            response.put("status", false);
        }
        return ResponseEntity.ok(response);
    }


    @PostMapping("/api-admin/postCreateAccount")
    public ResponseEntity<?> doPostCreateAccount(@RequestBody AccountDto accountDto) {
        String insertStatus;
        try {
            insertStatus = accountImpl.createAccount(accountDto);
        } catch (SQLException | NullPointerException e) {
            insertStatus = AccountEnum.error.getValue();
        }
        return ResponseEntity.ok(insertStatus);
    }

    @GetMapping("/api-public/user/checkLoginStatus")
    @ResponseBody
    public boolean isLoggedIn(HttpSession session) {
        // Lấy thông tin người dùng từ session
        Object loggedInUser = session.getAttribute("loggedInUser");

        // Kiểm tra nếu thông tin người dùng không null và là một chuỗi không rỗng
        return loggedInUser instanceof String && !((String) loggedInUser).isEmpty();
    }

}
