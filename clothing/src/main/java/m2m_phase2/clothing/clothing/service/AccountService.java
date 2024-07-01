package m2m_phase2.clothing.clothing.service;

import jakarta.servlet.http.HttpSession;
import m2m_phase2.clothing.clothing.data.dto.AccountDto;
import m2m_phase2.clothing.clothing.data.entity.Account;
import org.springframework.ui.Model;

import java.sql.SQLException;

public interface AccountService {

    Account saveAccount(Account account);

    Account findByusername(String username);

    Account findByemail(String email);


    void sendOTPEmail(String toEmail, String otp,String subject);

    String generateOTP();

    boolean checkEmail(Account account, Model model);

    boolean checkFillRegister(Model model, String... args);

    boolean checkFillOtp(Model model, String... args);

    String concatOtp(String... args);

    Account findByuserId(Integer id);

    boolean isDisable(Account account);

//	List<UserM> findAll() throws SQLException;

    void sendLinkEmail(String toEmail);

    String sendUrl(String token);

    Account findByUsernameAndEmail(String username, String email);

    // create new account from admin
    String createAccount(AccountDto accountDto) throws SQLException, NullPointerException;

    public long getTotalAccounts();

    public long getGGAccount();

    public long getDKAccount();

    boolean isLoggedIn(HttpSession session);
}
