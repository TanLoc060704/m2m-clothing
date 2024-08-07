package m2m_phase2.clothing.clothing.api;

import jakarta.servlet.http.HttpSession;
import m2m_phase2.clothing.clothing.data.dto.ShopAdminDto;
import m2m_phase2.clothing.clothing.data.dto.ShopDto;
import m2m_phase2.clothing.clothing.data.dto.UserDto;
import m2m_phase2.clothing.clothing.data.entity.Category;
import m2m_phase2.clothing.clothing.data.entity.Product;
import m2m_phase2.clothing.clothing.data.entity.ShopE;
import m2m_phase2.clothing.clothing.data.entity.UserE;
import m2m_phase2.clothing.clothing.data.model.ShopM;
import m2m_phase2.clothing.clothing.data.model.UserM;
import m2m_phase2.clothing.clothing.repository.CategoryRepo;
import m2m_phase2.clothing.clothing.repository.ProductRepo;
import m2m_phase2.clothing.clothing.service.AccountService;
import m2m_phase2.clothing.clothing.service.ShopAdminService;
import m2m_phase2.clothing.clothing.service.ShopService;
import m2m_phase2.clothing.clothing.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static m2m_phase2.clothing.clothing.data.variable.StaticVariable.sessionEmail;


@RestController
public class ShopApi {
    private static final Path CURRENT_FOLDER = Paths.get(System.getProperty("user.dir"));

    @Autowired
    private ShopAdminService shopAdminService;

    @Autowired
    UserService userService;
    @Autowired
    private HttpSession session;
    @Autowired
    private ShopService shopService;
    @Autowired
    private ProductRepo productRepo;
    @Autowired
    private CategoryRepo categoryRepo;
    @Autowired
    private AccountService accountService;

    @PostMapping("/saveShopAdmin")
    public Product saveShopAdmin(@RequestParam("pictures") MultipartFile[] pictures,
                                 @RequestParam(value = "video", required = false) MultipartFile video,
                                 @RequestParam("productName") String productName,
                                 @RequestParam("price") Float price,
                                 @RequestParam("quantity") int quantity,
                                 @RequestParam("description") String description,
                                 @RequestParam("categoryId") int categoryId) {
        // Lấy email từ session
        String email = sessionEmail;
        System.out.println(email);
        // Kiểm tra xem email có tồn tại trong hệ thống hay không và lấy shop tương ứng
        ShopE shop = shopService.findShopByEmail(email);
        if (shop == null) {
            throw new RuntimeException("Shop not found for the given email");
        }
        // Lưu file hình ảnh
        StringBuilder picturesPaths = new StringBuilder();
        for (MultipartFile picture : pictures) {
            try {
                Path path = CURRENT_FOLDER.resolve("src\\main\\resources\\templates\\swappa\\assests\\media").resolve(picture.getOriginalFilename());
                Files.copy(picture.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
                picturesPaths.append(picture.getOriginalFilename()).append(",");
            } catch (IOException e) {
                e.printStackTrace();
                throw new RuntimeException("Failed to store picture", e);
            }
        }

        // Lưu file video (nếu có)
        String videoPath = null;
        if (video != null && !video.isEmpty()) {
            try {
                Path path = CURRENT_FOLDER.resolve("src\\main\\resources\\templates\\swappa\\assests\\media").resolve(video.getOriginalFilename());
                Files.copy(video.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
                videoPath = video.getOriginalFilename();
            } catch (IOException e) {
                e.printStackTrace();
                throw new RuntimeException("Failed to store video", e);
            }
        }

        // Tạo đối tượng ShopAdminDto
        ShopAdminDto shopAdminDto = new ShopAdminDto();
        shopAdminDto.setProductName(productName);
        shopAdminDto.setPrice(price);
        shopAdminDto.setQuantity(quantity);
        shopAdminDto.setDescription(description);
        shopAdminDto.setPictures(picturesPaths.toString());
        shopAdminDto.setVideos(videoPath);
        shopAdminDto.setSlugUrl(productName.replaceAll("\\s+", "-"));
        shopAdminDto.setCategoryId(categoryId);
        shopAdminDto.setShopId(shop.getShopId()); // Giả sử bạn đã biết trước shopId


        // Lưu sản phẩm vào cơ sở dữ liệu
        return shopAdminService.saveProduct(shopAdminDto);
    }

    @GetMapping("/products")
    public ResponseEntity<List<Product>> getProductsByShopId() {
        String email = sessionEmail;
        System.out.println(email);
        // Kiểm tra xem email có tồn tại trong hệ thống hay không và lấy shop tương ứng
        ShopE shop = shopService.findShopByEmail(email);
        if (shop == null) {
            throw new RuntimeException("Shop not found for the given email");
        }
        List<Product> products = shopAdminService.findByShopId(shop.getShopId());
        return ResponseEntity.ok(products);
    }

    @GetMapping("/product/{productId}")
    public ResponseEntity<Product> getProductById(@PathVariable int productId) {
        Product product = productRepo.findByProductId(productId);

        return ResponseEntity.ok(product);
    }

    @PostMapping("/editProductShop")
    public Product updateProductShop(@RequestParam(value = "pictures", required = false) MultipartFile[] pictures,
                                     @RequestParam(value = "video", required = false) MultipartFile video,
                                     @RequestParam("productName") String productName,
                                     @RequestParam("price") Float price,
                                     @RequestParam("quantity") int quantity,
                                     @RequestParam("description") String description,
                                     @RequestParam("categoryId") int categoryId,
                                     @RequestParam("productId") int productId) {
        // Kiểm tra giá trị đầu vào
        if (productName == null || productName.isEmpty() || price == null || quantity <= 0) {
            throw new RuntimeException("Invalid input values");
        }

        // Lấy email từ session
        String email = sessionEmail;
        // Kiểm tra xem email có tồn tại trong hệ thống hay không và lấy shop tương ứng
        ShopE shop = shopService.findShopByEmail(email);
        if (shop == null) {
            throw new RuntimeException("Shop not found for the given email");
        }
        // Tìm sản phẩm hiện tại
        Product existingProduct = productRepo.findById(productId)
                .orElseThrow(() -> new RuntimeException("Product not found"));

        // Xử lý file hình ảnh
        if (pictures != null && pictures.length > 0) {
            StringBuilder picturesPaths = new StringBuilder();
            for (MultipartFile picture : pictures) {
                try {
                    Path path = CURRENT_FOLDER.resolve("src\\main\\resources\\templates\\swappa\\assests\\media").resolve(picture.getOriginalFilename());
                    Files.copy(picture.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
                    picturesPaths.append(picture.getOriginalFilename()).append(",");
                } catch (IOException e) {
                    e.printStackTrace();
                    throw new RuntimeException("Failed to store picture", e);
                }
            }
            existingProduct.setPictures(picturesPaths.toString());
        } else {
            // Giữ nguyên tên ảnh cũ nếu không có ảnh mới
            existingProduct.setPictures(existingProduct.getPictures());
        }

        // Xử lý file video (nếu có)
        if (video != null && !video.isEmpty()) {
            try {
                Path path = CURRENT_FOLDER.resolve("src\\main\\resources\\templates\\swappa\\assests\\media").resolve(video.getOriginalFilename());
                Files.copy(video.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
                existingProduct.setVideos(video.getOriginalFilename());
            } catch (IOException e) {
                e.printStackTrace();
                throw new RuntimeException("Failed to store video", e);
            }
        } else {
            // Giữ nguyên tên video cũ nếu không có video mới
            existingProduct.setVideos(existingProduct.getVideos());
        }

        // Cập nhật thông tin sản phẩm
        existingProduct.setProductName(productName);
        existingProduct.setPrice(price);
        existingProduct.setQuantity(quantity);
        existingProduct.setDescription(description);
        existingProduct.setSlugUrl(productName.replaceAll("\\s+", "-"));

        Category category = categoryRepo.findById(categoryId)
                .orElseThrow(() -> new RuntimeException("Category not found"));
        existingProduct.setCategory(category);

        existingProduct.setShopE(shop);

        return shopAdminService.updateProduct(existingProduct);
    }

    @GetMapping("/get-shop-by-user-email")
    public ResponseEntity<?> getShopByUserEmail() {
        Map<String, Object> result = new HashMap<>();
        try {
            result.put("status", true);
            result.put("message", "Call Api Success");
            result.put("data", shopService.findShopByUser(sessionEmail));
            result.put("data2", sessionEmail);
        } catch (Exception e) {
            result.put("status", false);
            result.put("message", "Call Api Fail");
            result.put("data", null);
        }
        return ResponseEntity.ok(result);
    }

    @PostMapping("/api/public/shopSignUp")
    public ResponseEntity<?> shopSignUp() {
        Map<String, Object> result = new HashMap<>();
        try {
            ShopDto shopDto = new ShopDto();
            shopDto.setNameShop("Shop");
            shopDto.setDateEstablished(new Date());

            UserDto userDto = new UserDto();
            userDto.setEmail(sessionEmail);

            UserM userM = userService.getUserByEmail(userDto);

            UserE userE = new UserE();
            userE.setId(userM.getId());

            shopDto.setUserE(userE);

            result.put("status", true);
            result.put("message", "Call Api Success");
            result.put("data", shopService.insertShop(shopDto));
        } catch (Exception e) {
            result.put("status", false);
            result.put("message", "Call Api Fail");
            result.put("data", null);
        }
        return ResponseEntity.ok(result);
    }

    @PostMapping("/api/public/updateShopInfo")
    public ResponseEntity<?> updateShopInfo(@RequestParam("logo") MultipartFile file,
                                            @RequestParam("nameShop") String nameShop,
                                            @RequestParam("email") String emailShop) {

        Map<String, Object> result = new HashMap<>();
        try {
            result.put("status", true);
            result.put("message", "Call Api Success");
            ShopM shopM = shopService.findShopByUser(emailShop);
            if (shopM.getLogo() != file.getOriginalFilename()) {
                try {
                    Path path = CURRENT_FOLDER.resolve("src\\main\\resources\\templates\\swappa\\assests\\shopImg").resolve(file.getOriginalFilename());
                    Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
                } catch (IOException e) {
                    e.printStackTrace();
                    throw new RuntimeException("Failed to store picture", e);
                }
            }
            result.put("data", shopService.updateShop(nameShop, file.getOriginalFilename(), emailShop));
        } catch (Exception e) {
            result.put("status", false);
            result.put("message", "Call Api Fail");
            result.put("data", null);
        }
        return ResponseEntity.ok(result);
    }

    @GetMapping("/api/shop")
    public ResponseEntity<List<Object[]>> doGetShopDetails(@RequestParam("shop_id") Integer shop_id) {
        var shop = shopService.getShopDetails(shop_id);
        return ResponseEntity.ok(shop);
    }

    //    @PostMapping("/download")
//    @ResponseStatus(HttpStatus.CREATED)
//    public Product downloadShopAdmin(@RequestBody ShopAdminDto shopAdminDto,
//                                     @RequestPart MultipartFile[] images) throws IOException {
//        // Đường dẫn tới các thư mục
//        Path templates = Paths.get("templates");
//        Path swappa = Paths.get("swappa");
//        Path assets = Paths.get("assets");
//        Path media = Paths.get("media");
//
//        // Kiểm tra và tạo các thư mục nếu chưa tồn tại
//        if (!Files.exists(CURRENT_FOLDER.resolve(templates).resolve(swappa).resolve(assets).resolve(media))) {
//            Files.createDirectories(CURRENT_FOLDER.resolve(templates).resolve(swappa).resolve(assets).resolve(media));
//        }
//
//        // Lưu từng tệp vào thư mục
//        for (MultipartFile image : images) {
//            Path file = CURRENT_FOLDER.resolve(templates)
//                    .resolve(swappa)
//                    .resolve(assets)
//                    .resolve(media)
//                    .resolve(image.getOriginalFilename());
//
//            // Ghi dữ liệu ảnh vào file
//            try (OutputStream os = Files.newOutputStream(file)) {
//                os.write(image.getBytes());
//            }
//        }
//
//        // Lưu thông tin sản phẩm và trả về đối tượng Product
//        return shopAdminService.saveProduct(shopAdminDto);
//    }
//    @PostMapping("/saveShopAdmin2")
//    public Product saveShopAdmin(
//            @RequestParam("productName") String productName,
//            @RequestParam("price") double price,
//            @RequestParam("quantity") int quantity,
//            @RequestParam("description") String description,
//            @RequestParam("slugUrl") String slugUrl,
//            @RequestParam("categoryId") int categoryId,
//            @RequestParam("shopId") int shopId,
//            @RequestParam("pictures") List<MultipartFile> pictures,
//            @RequestParam("videos") MultipartFile videos) {
//
//        // Xử lý lưu file vào thư mục
//        String uploadDir = "templates/swappa/assets/media/";
//        try {
//            for (MultipartFile picture : pictures) {
//                if (!picture.isEmpty()) {
//                    File dest = new File(uploadDir + picture.getOriginalFilename());
//                    picture.transferTo(dest);
//                }
//            }
//            if (!videos.isEmpty()) {
//                File dest = new File(uploadDir + videos.getOriginalFilename());
//                videos.transferTo(dest);
//            }
//        } catch (IOException e) {
//            e.printStackTrace();
//            throw new RuntimeException("Failed to store file", e);
//        }
//
//        // Tạo đối tượng ShopAdminDto
//        ShopAdminDto shopAdminDto = new ShopAdminDto();
//        shopAdminDto.setProductName(productName);
//        shopAdminDto.setPrice((float) price);
//        shopAdminDto.setQuantity(quantity);
//        shopAdminDto.setDescription(description);
//        shopAdminDto.setSlugUrl(slugUrl);
//        shopAdminDto.setCategoryId(categoryId);
//        shopAdminDto.setShopId(shopId);
//
//        // Thêm đường dẫn tới file vào DTO
//        shopAdminDto.setPictures(pictures.stream()
//                .map(MultipartFile::getOriginalFilename)
//                .collect(Collectors.joining(",")));
//        shopAdminDto.setVideos(videos.getOriginalFilename());
//
//        return shopAdminService.saveProduct(shopAdminDto);
//    }
    @GetMapping("/get-shop-by-user-id")
    public ResponseEntity<?> getShopById(@RequestParam int shopId) {
        ShopM shopM = shopService.getShopById(shopId);
        Map<String, Object> result = new HashMap<>();
        try {
            result.put("status", true);
            result.put("message", "Call Api Success");
            result.put("data", shopM);
        } catch (Exception e) {
            result.put("status", false);
            result.put("message", "Call Api Fail");
            result.put("data", null);
        }
        return ResponseEntity.ok(result);
    }

    @GetMapping("/get-shop-by-user-email-and-send-otp")
    public ResponseEntity<?> getShopByUserEmailAndSendOtp() {
        Map<String, Object> result = new HashMap<>();
        try {
            ShopM shopM = shopService.findShopByUser(sessionEmail);
            if (shopM != null) {
                String otp = accountService.generateOTP();
                accountService.sendOTPEmail(sessionEmail, otp, "OTP for Sign In Shop");
                session.setAttribute("otp", otp);
                session.setAttribute("otpCreationTime", System.currentTimeMillis());
                // Thiết lập thời gian hết hạn cho session (tính bằng giây)
                session.setMaxInactiveInterval(60); // 1 phút
                result.put("status", true);
                result.put("message", "Call Api Success");
                result.put("data", shopM);
            }
        } catch (Exception e) {
            result.put("status", false);
            result.put("message", "Call Api Fail");
            result.put("data", null);
        }
        return ResponseEntity.ok(result);
    }

    @PostMapping("/api/user/verify-otp")
    public ResponseEntity<?> shopOtp(@RequestParam("otp") String otp) {
        Map<String, Object> result = new HashMap<>();
        try {
            String sessionOtp = (String) session.getAttribute("otp");
            Long otpCreationTime = (Long) session.getAttribute("otpCreationTime");
            if (otp.equals(sessionOtp) && System.currentTimeMillis() - otpCreationTime <= 60000) {
                result.put("status", true);
                result.put("message", "OTP is correct");
            } else if (System.currentTimeMillis() - otpCreationTime > 60000) {
                result.put("status", true);
                result.put("message", "OTP is expired");
            } else {
                result.put("status", true);
                result.put("message", "OTP is incorrect");
            }
        } catch (Exception e) {
            result.put("status", false);
            result.put("message", "Call Api Fail");
        }
        return ResponseEntity.ok(result);
    }

    @PostMapping("/api/user/resend-otp")
    public ResponseEntity<?> resendOtp() {
        Map<String, Object> result = new HashMap<>();
        try {
            String otp = accountService.generateOTP();
            accountService.sendOTPEmail(sessionEmail, otp, "OTP for Sign In Shop");
            session.setAttribute("otp", otp);
            session.setAttribute("otpCreationTime", System.currentTimeMillis());
            // Thiết lập thời gian hết hạn cho session (tính bằng giây)
            session.setMaxInactiveInterval(60); // 1 phút
            result.put("status", true);
            result.put("message", "Call Api Success");
        } catch (Exception e) {
            result.put("status", false);
            result.put("message", "Call Api Fail");
        }
        return ResponseEntity.ok(result);
    }

    @GetMapping("/api/user/sendOTPForRegisterShop")
    public ResponseEntity<?> sendOTPForRegisterShop() {
        Map<String, Object> result = new HashMap<>();
        try {
            String otp = accountService.generateOTP();
            accountService.sendOTPEmail(sessionEmail, otp, "OTP for Register Shop");
            session.setAttribute("otpRegisterShop", otp);
            session.setAttribute("otpCreationTimeRegisterShop", System.currentTimeMillis());
            // Thiết lập thời gian hết hạn cho session (tính bằng giây)
            session.setMaxInactiveInterval(60); // 1 phút
            result.put("status", true);
            result.put("message", "Call Api Success");
            result.put("data", null);
        } catch (Exception e) {
            result.put("status", false);
            result.put("message", "Call Api Fail");
            result.put("data", null);
        }
        return ResponseEntity.ok(result);
    }
    @PostMapping("/api/user/shopRegisterOtp")
    public ResponseEntity<?> shopRegisterOtp(@RequestParam("otp") String otp) {
        Map<String, Object> result = new HashMap<>();
        try {
            String sessionOtp = (String) session.getAttribute("otpRegisterShop");
            Long otpCreationTime = (Long) session.getAttribute("otpCreationTimeRegisterShop");
            if (otp.equals(sessionOtp) && System.currentTimeMillis() - otpCreationTime <= 60000) {
                result.put("status", true);
                result.put("message", "OTP is correct");
            } else if (System.currentTimeMillis() - otpCreationTime > 60000) {
                result.put("status", true);
                result.put("message", "OTP is expired");
            } else {
                result.put("status", true);
                result.put("message", "OTP is incorrect");
            }
        } catch (Exception e) {
            result.put("status", false);
            result.put("message", "Call Api Fail");
        }
        return ResponseEntity.ok(result);
    }
    @PostMapping("/api/user/resendOtpForRegister")
    public ResponseEntity<?> resendOtpForRegister() {
        Map<String, Object> result = new HashMap<>();
        try {
            String otp = accountService.generateOTP();
            accountService.sendOTPEmail(sessionEmail, otp, "OTP for Register Shop");
            session.setAttribute("otpRegisterShop", otp);
            session.setAttribute("otpCreationTimeRegisterShop", System.currentTimeMillis());
            // Thiết lập thời gian hết hạn cho session (tính bằng giây)
            session.setMaxInactiveInterval(60); // 1 phút
            result.put("status", true);
            result.put("message", "Call Api Success");
        } catch (Exception e) {
            result.put("status", false);
            result.put("message", "Call Api Fail");
        }
        return ResponseEntity.ok(result);
    }
}
