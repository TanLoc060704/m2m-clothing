package m2m_phase2.clothing.clothing.service.impl;

import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import m2m_phase2.clothing.clothing.constant.AccountEnum;
import m2m_phase2.clothing.clothing.data.dto.AccountDto;
import m2m_phase2.clothing.clothing.data.entity.Account;
import m2m_phase2.clothing.clothing.data.variable.StaticVariable;
import m2m_phase2.clothing.clothing.repository.AccountGGRepo;
import m2m_phase2.clothing.clothing.repository.AccountRepo;
import m2m_phase2.clothing.clothing.service.AccountService;
import m2m_phase2.clothing.clothing.utils.PasswordEncoderUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.security.SecureRandom;
import java.sql.SQLException;
import java.util.Objects;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class AccountServiceImpl implements AccountService {

    @Autowired
    private AccountRepo repo;
    @Autowired
    private AccountGGRepo accountGGRepo;
    @Autowired
    private JavaMailSender emailSender;
    private final HttpSession session;
    //    private final UserService userService;
    @Autowired
    private HttpServletRequest request;

    @Override
    public Account saveAccount(Account account) {
        // TODO Auto-generated method stub
        return repo.save(account);
    }

    @Override
    public Account findByemail(String email) {
        // TODO Auto-generated method stub
        return repo.findByemail(email);
    }

    @Override
    public Account findByusername(String username) {
        // TODO Auto-generated method stub
        return repo.findByusername(username);
    }

    @Override
    public void sendOTPEmail(String toEmail, String otp, String subject) {
        try {
            MimeMessage message = emailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true);

            helper.setFrom("kaisamaslain+Nerdyers@gmail.com");
            helper.setTo(toEmail);
            helper.setSubject(subject);
            String htmlMsg = "<div style='font-family: Arial, sans-serif;'>" +
                    "<h2 style='color: #f44336;'>Hello,</h2>" +
                    "<p>Your OTP code is: <b style='color: #4CAF50;'>" + otp + "</b></p>" +
                    "<p>Please do not share this code with anyone.</p>" +
                    "<hr>" +
                    "<p style='color: #555;'>Best regards,</p>" +
                    "<p style='color: #555;'>Our Support Team</p>" +
                    "</div>";

            helper.setText(htmlMsg, true);
            emailSender.send(message);
            session.setAttribute("otp", otp);
            session.setAttribute("email", toEmail);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean verifyOTP(String otp) {
        String sessionOtp = (String) session.getAttribute("otp");
        return sessionOtp != null && sessionOtp.equals(otp);
    }

    @Override
    public String generateOTP() {
        SecureRandom random = new SecureRandom();
        int otpValue = 100000 + random.nextInt(900000);
        return String.valueOf(otpValue);
    }

    public boolean checkUsername(Account account, Model model) {
        if (findByusername(account.getUsername()) != null) {
            String messError = "Username already exists";
            model.addAttribute("messError", messError);
            return false;
        }
        return true;
    }

    @Override
    public boolean checkEmail(Account account, Model model) {
        if (findByemail(account.getEmail()) != null) {
            String messError = "Email already exists";
            model.addAttribute("messError", messError);
            return false;
        }
        return true;
    }

    @Override
    public boolean checkFillRegister(Model model, String... args) {
        for (String string : args) {
            if (string.equals("")) {
                String messError = "Please fill in complete information";
                model.addAttribute("messError", messError);
                return false;
            }
        }
        return true;

    }

    @Override
    public boolean checkFillOtp(Model model, String... args) {
        for (String string : args) {
            if (string.equals("")) {
                String messError = "Please fill in complete otp";
                model.addAttribute("messError", messError);
                return false;
            }
        }
        return true;
    }

    @Override
    public String concatOtp(String... args) {
        String otpConcatSuccess = "";
        for (int i = 0; i < args.length; i++) {
            otpConcatSuccess += args[i];
        }
        return otpConcatSuccess;
    }

    @Override
    public Account findByuserId(Integer id) {
        return repo.findByuserId(id);
    }

    @Override
    public boolean isDisable(Account account) {
        // TODO Auto-generated method stub
        return account != null && account.isDisable();
    }

    //	@Override
//	public List<UserM> findAll() throws SQLException {
//		List<Account> listAccount = repo.findAll();
//		return UserM.convertListAccountToListUserM(listAccount);
//	}
    @Override
    public String sendUrl(String token) {
        String baseUrl = String.format("%s://%s:%d", request.getScheme(), request.getServerName(), request.getServerPort());
        String resetPasswordUrl = baseUrl + "/confirmPasswordForgot/" + token;
        return resetPasswordUrl;
    }

    public static String token;

    @Override
    public void sendLinkEmail(String toEmail) {
        try {
            MimeMessage message = emailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true);

            token = UUID.randomUUID().toString();
            String resetPasswordUrl = sendUrl(token);

            helper.setFrom("kaisamaslain+Nerdyers@gmail.com");
            helper.setTo(toEmail);
            helper.setSubject("Link to reset password");
            String htmlMsg = "<h3>Hello,</h3>"
                    + "<p>You requested a password reset. Please click the link below to change your password:</p>"
                    + "<a href='" + resetPasswordUrl + "'>Reset Password</a>"
                    + "<p>If you didn’t ask to change your password, you can ignore this email.</p>"
                    + "<p>Thanks,</p>"
                    + "<p>Your Team</p>";

            helper.setText(htmlMsg, true);
            emailSender.send(message);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public Account findByUsernameAndEmail(String username, String email) {
        return repo.findByUsernameAndEmail(username, email);
    }

    @Override
    public String createAccount(AccountDto accountDto)
            throws SQLException, NullPointerException {
        if (!accountDto.getPassword()
                .equals(accountDto.getConfirmPassword()))
            return AccountEnum.not_matched.getValue();
        var account = repo.findByUsernameOrEmail(accountDto.getUsername(), accountDto.getEmail());
        if (Objects.nonNull(account)) {
            return AccountEnum.existed.getValue();
        }
        var createdAccount = repo.save(AccountDto.convertAccountDtoToAccount(accountDto));
        return AccountEnum.succeed.getValue();
    }

    @Override
    public long getTotalAccounts() {
        long totalAccountsFromAccount = repo.count();
        long totalAccountsFromAccountGG = accountGGRepo.count();
        return totalAccountsFromAccount + totalAccountsFromAccountGG;
    }

    @Override
    public long getGGAccount() {
        long totalAccountsFromAccountGG = accountGGRepo.count();
        return totalAccountsFromAccountGG;
    }

    @Override
    public long getDKAccount() {
        long totalAccountsFromAccount = repo.count();
        return totalAccountsFromAccount;
    }

    @Override
    public boolean isLoggedIn(HttpSession session) {
        // Lấy thông tin người dùng từ session
        Object loggedInUser = session.getAttribute("loggedInUser");

        // Kiểm tra nếu thông tin người dùng không null và là một chuỗi không rỗng
        return loggedInUser instanceof String && !((String) loggedInUser).isEmpty();
    }
}
