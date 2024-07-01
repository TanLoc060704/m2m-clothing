package m2m_phase2.clothing.clothing.controller;

import jakarta.servlet.http.HttpSession;
import m2m_phase2.clothing.clothing.data.dto.UserDto;
import m2m_phase2.clothing.clothing.data.entity.Account;
import m2m_phase2.clothing.clothing.data.entity.Product;
import m2m_phase2.clothing.clothing.data.model.ProductM;
import m2m_phase2.clothing.clothing.data.model.UserM;
import m2m_phase2.clothing.clothing.service.AccountService;
import m2m_phase2.clothing.clothing.service.ProductService;
import m2m_phase2.clothing.clothing.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.sql.SQLException;
import java.util.List;

@Controller
public class HomeController {


    @Autowired
    private AccountService accountService;
    @Autowired
    public HttpSession session;
    @Autowired
    private UserServiceImpl userService;
    @Autowired
    private ProductService productService;

    @GetMapping("/")
    public String defaultPage(Model model) {
        List<ProductM> list = productService.findAll();
        model.addAttribute("products", list);
        model.addAttribute("iduser", session.getAttribute("iduser"));
        model.addAttribute("email", session.getAttribute("email"));
        return "swappa/assests/html/trangchu";
    }

    @GetMapping("/trangchu")
    public String getTrangchu(Model model) {
        List<ProductM> list = productService.findAll();
        model.addAttribute("products", list);
        model.addAttribute("iduser", session.getAttribute("iduser"));
        model.addAttribute("activeLogin",session.getAttribute("email"));
        return "swappa/assests/html/trangchu";
    }


    @GetMapping("/Setting")
    public String getSetting() {
        return "swappa/assests/html/admin";
    }


    @GetMapping("/giohang")
    public String getGioHang(Model model) {
        if (accountService.isLoggedIn(session)) {
            List<ProductM> list = productService.findAll();
            model.addAttribute("listSp", list);
            return "swappa/assests/html/card";
        } else {
            return "redirect:/loginacount";
        }

    }

    @GetMapping("/thanhtoan")
    public String getThanhToan(HttpSession session, Model model) throws SQLException {
        if (accountService.isLoggedIn(session)) {
            UserDto userDto = new UserDto();
            userDto.setEmail(session.getAttribute("loggedInUser") + "");
            UserM userM = userService.getUserByEmail(userDto);
            model.addAttribute("user", userM);
            return "swappa/assests/html/payment";
        } else {
            return "redirect:/userprofile";
        }
    }

    @GetMapping("/loginacount")
    public String getLog() {
        return "swappa/assests/html/acc_login2";
    }

    @GetMapping("/userprofile")
    public String userProfileGet(Model model) throws SQLException {
        // Kiểm tra xem người dùng đã đăng nhập hay chưa
        if (accountService.isLoggedIn(session)) {
            // Nếu đã đăng nhập, chuyển hướng đến trang profile của người dùng
            UserDto userDto = new UserDto();
            userDto.setEmail(session.getAttribute("loggedInUser") + "");
            System.out.println(">>session: " + session.getAttribute("loggedInUser"));
            UserM userM = userService.getUserByEmail(userDto);
            System.out.println(">>current user: " + userM.toString());
            model.addAttribute("userM", userM);
            return "swappa/assests/html/userpage";
        } else {
            // Nếu chưa đăng nhập, chuyển hướng đến trang đăng nhập
            return "redirect:/loginacount";
        }
    }

    @GetMapping("/account/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

    @GetMapping("/searchProduct")
    public String search( Model model){
        return "swappa/assests/html/searchProduct";
    }

    @GetMapping("/vouchers")
    public String doGetViewAllVouchers() {
        return "swappa/assests/html/vouchers";
    }
    @GetMapping("/viewSearchShop")
    public String doGetViewSearchedShop() {
        return "swappa/assests/html/searchShop";
    }

    @GetMapping("/search_Product")
    public String searchProduct(@RequestParam() String key_search, @RequestParam() String type_search) {
        return "swappa/assests/html/productAll";
    }

}
