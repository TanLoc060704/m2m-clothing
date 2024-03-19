package m2m_phase2.clothing.clothing.controller;

import java.io.Console;
import java.security.SecureRandom;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;
import m2m_phase2.clothing.clothing.entity.Account;
import m2m_phase2.clothing.clothing.entity.Otp;
import m2m_phase2.clothing.clothing.service.impl.AccountServiceImpl;
import m2m_phase2.clothing.clothing.utils.PasswordEncoderUtil;

@Controller
public class HomeController {

	@Autowired
	private AccountServiceImpl accountServiceImpl;
	@Autowired
	private HttpSession session;

	@GetMapping("/login")
	public String getLog(Model model) {

		Account accountlog = new Account();
		model.addAttribute("accountlog", accountlog);
		System.out.println(session.getAttribute("loggedInUser"));
		return "Front_End/pages/sign-in";

	}
	@PostMapping("/submitLogin")
	public String submitLogin(@ModelAttribute("accountlog") Account accountRequest, Model model) {
	    // Lấy email và mật khẩu từ đối tượng accountRequest
	    String email = accountRequest.getEmail();
	    String password = accountRequest.getHashedPassword();
	    
	    
	    // Kiểm tra xem tài khoản có tồn tại trong cơ sở dữ liệu không
	    Account existingAccount = accountServiceImpl.findByEmail(email);
	    
	    // Nếu không tìm thấy tài khoản
	    if(existingAccount == null) {
	        // Xử lý thông báo lỗi hoặc chuyển hướng đến trang đăng nhập với thông báo lỗi
	        model.addAttribute("error", "Tài khoản không tồn tại");
	        return "Front_End/pages/sign-in";
	    }
	    
	    // Kiểm tra tính hợp lệ của mật khẩu
	    boolean passwordMatch = PasswordEncoderUtil.verifyPassword(password, existingAccount.getHashedPassword());
	    
	    // Nếu mật khẩu không trùng khớp
	    if(!passwordMatch) {
	        // Xử lý thông báo lỗi hoặc chuyển hướng đến trang đăng nhập với thông báo lỗi
	        model.addAttribute("error", "Mật khẩu không đúng");
	        return "Front_End/pages/sign-in";
	    }
	    
	    // Lưu thông tin đăng nhập vào session hoặc làm bất kỳ xử lý nào khác cần thiết
	    session.setAttribute("loggedInUser", accountRequest.getEmail());
	    System.out.println(session.getAttribute("loggedInUser"));
	    // Chuyển hướng đến trang chính sau khi đăng nhập thành công
	    // Kiểm tra và xử lý vai trò admin
	    if(accountServiceImpl.isAdmin(existingAccount)) {
	        // Nếu là admin, chuyển hướng đến trang quản trị
	        return "Front_End/pages/User(Management)"; // Điều hướng đến trang quản trị
	    } else {
	        // Nếu không phải admin, chuyển hướng đến trang chính
	        return "Front_End/TrangChu"; // Điều hướng đến trang người dùng
	    }
	}
	
	
	@GetMapping("/admin")
	public String logAdmin(Model model) {

		Account accountlog = new Account();
		model.addAttribute("accountlog", accountlog);
		System.out.println(session.getAttribute("loggedInUser"));
		return "Front_End/pages/sign-in";

	}
	
	
	@GetMapping("/register") // hàm phatteacher
	public String getHome(Model model) {

		Account account = new Account();
		model.addAttribute("account", account);
		return "Front_End/pages/sign-up";

	}

	@PostMapping("/submitRegister") // hàm phatteacher
	public String submitRegister(@ModelAttribute("account") Account accountRequest, Model model) {

		session.setAttribute("acc", accountRequest);

		// Tạo mã OTP ngẫu nhiên gồm 6 chữ số
		String otp = accountServiceImpl.generateOTP();
       
		// Gửi mã OTP qua email
		accountServiceImpl.sendOTPEmail(accountRequest.getEmail(), otp);

		// Lưu mã OTP vào session để kiểm tra xác thực sau này
		session.setAttribute("otp", otp);
		session.setAttribute("email", accountRequest.getEmail());

		//tạo entity otp
		Otp otpNhap = new Otp();
		model.addAttribute("otpNhap", otpNhap);

		return "Front_End/pages/ConfirmPassword-signup";

	}

	@PostMapping("/otp") // hàm phatteacher
	public String otp(@ModelAttribute("otp") Otp otp, Model model) {
		
		//lấy account người dùng nhập ở trang đăng kí 
		Account accountSession =  (Account) session.getAttribute("acc");

		//lấy otp người dùng nhập vào
		String enteredOTP = otp.getOtp1() + otp.getOtp2() + otp.getOtp3() + otp.getOtp4() + otp.getOtp5()
				+ otp.getOtp6();
		//lấy otp ở trong session
		String sessionOTP = (String) session.getAttribute("otp");

		//so sánh hai otp nếu giống thì return về trang sign in khác thì return về trang sign up
		if (enteredOTP.equals(sessionOTP)) {
			// Mã OTP hợp lệ, thực hiện các hành động tiếp theo
			String hashCode = accountSession.getHashedPassword();
			accountSession.setHashedPassword(PasswordEncoderUtil.encodePassword(hashCode));
			accountServiceImpl.saveAccount(accountSession);
			
			return "Front_End/pages/sign-in";

		} else {
			return "Front_End/pages/sign-up";
		}

	}

}
