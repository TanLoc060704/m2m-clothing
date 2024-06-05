package m2m_phase2.clothing.clothing.api;


import lombok.extern.slf4j.Slf4j;
import m2m_phase2.clothing.clothing.data.dto.CommentDTO;
import m2m_phase2.clothing.clothing.data.dto.ProductDTO;
import m2m_phase2.clothing.clothing.data.entity.Category;
import m2m_phase2.clothing.clothing.data.entity.Product;
import m2m_phase2.clothing.clothing.data.mgt.ResponseObject;
import m2m_phase2.clothing.clothing.data.model.ProductM;
import m2m_phase2.clothing.clothing.service.ProductService;
import m2m_phase2.clothing.clothing.service.impl.CategoryImpl;
import m2m_phase2.clothing.clothing.service.impl.CommentServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.oauth2.client.OAuth2AuthorizedClient;
import org.springframework.security.oauth2.client.OAuth2AuthorizedClientService;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.security.oauth2.client.registration.ClientRegistrationRepository;
import org.springframework.security.oauth2.core.OAuth2AccessToken;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static m2m_phase2.clothing.clothing.data.variable.StaticVariable.sessionEmail;


@RestController
@Slf4j
public class ProductApi {

    @Autowired
    private ProductService productService;

    @Autowired
    private CommentServiceImpl commentService;


    @Autowired
    private CategoryImpl categoryimpl;

    @GetMapping("/allproductapi")
    public List<ProductM> getAllProduct() {
        return productService.findAll();
    }

    @GetMapping("/findbyproductidapi")
    public ProductM getfindbyproductid(@RequestParam String slug_url) {
        return productService.findByslug_url(slug_url);
    }

    @GetMapping("/findcategorynamebyproductidapi")
    public Category getfindcategorynamebyproductid(@RequestParam Integer product_id) {
        return productService.findCategoryNameByProductId(product_id);
    }

    @GetMapping("/allcategoryapi")
    public List<Category> getallcategoryapi() {
        return categoryimpl.findAll();
    }

    @GetMapping("/findTop6ByOrderByGiaBanDesc")
    public List<Product> findTop6ByOrderByGiaBanDesc() {
        return productService.findTop6ByOrderByGiaBanDesc();
    }


    @GetMapping("/sale")
    public List<Product> productWithSaleInfo() {
        return productService.findProductsWithSaleInfo();
    }

    @PostMapping("/insertProduct")
    public ResponseEntity<?> insertProduct(@RequestBody ProductDTO productDTO) {
        try {
            productService.insertProduct(productDTO);
            productService.saveImgAndVideo(productDTO);
        } catch (Exception e) {
            System.out.println("Call API Failed: /insertProduct");
            throw new RuntimeException(e);
        }
        return ResponseEntity.ok("Product inserted successfully.");

    }

    @PostMapping("/updateProduct")
    public ResponseEntity<?> updateProduct(@RequestBody ProductDTO productDTO) {
        try {
            productService.updateProduct(productDTO);
            productService.saveImgAndVideo(productDTO);
        } catch (Exception e) {
            System.out.println("Call API Failed: /update");
            throw new RuntimeException(e);
        }
        return ResponseEntity.ok("Product update successfully.");
    }

    @DeleteMapping("/products/{product_id}")
    public void deleteProductById(@PathVariable("product_id") int productId) {
        productService.deleteByProductId(productId);
    }

    @PostMapping("/saveComment")
    public ResponseEntity<?> doPostSaveComment(@RequestBody CommentDTO commentDTO) {
        byte rowEffected;
        try {
            rowEffected = commentService.saveComment(commentDTO);
        } catch (Exception e) {
            System.out.println("Call API Failed: /saveComment");
            throw new RuntimeException(e);
        }
        return ResponseEntity.ok(rowEffected);
    }

    @PostMapping("/createComment")
    public ResponseEntity<?> doPostCreateComment(@RequestBody CommentDTO commentDTO) {
        byte rowEffected;
        try {
            rowEffected = commentService.createComment(commentDTO);
        } catch (Exception e) {
            System.out.println("Call API Failed: /createComment");
            throw new RuntimeException(e);
        }
        return ResponseEntity.ok(rowEffected);
    }

    @Autowired
    private ClientRegistrationRepository clientRegistrationRepository;

    @Autowired
    private OAuth2AuthorizedClientService authorizedClientService;

    @GetMapping("/testloginwithgg")
    public Map<String, Object> currentUser(OAuth2AuthenticationToken oAuth2AuthenticationToken) {
        Map<String, Object> userInfo = new HashMap<>();

        //lay thong tin nguoi dung
        Map<String, Object> attributes = oAuth2AuthenticationToken.getPrincipal().getAttributes();
        userInfo.putAll(attributes);

        //lay accesstoken
        String clientRegistrationId = oAuth2AuthenticationToken.getAuthorizedClientRegistrationId();
        OAuth2AuthorizedClient oAuth2AuthorizedClient = authorizedClientService.loadAuthorizedClient(clientRegistrationId, oAuth2AuthenticationToken.getName());
        OAuth2AccessToken accessToken = oAuth2AuthorizedClient.getAccessToken();
        userInfo.put("access_token", accessToken.getTokenValue());

        //lay danh sach quyen truy cap
        userInfo.put("scopes", accessToken.getScopes());

        return userInfo;

//		return oAuth2AuthenticationToken.getPrincipal().getAttributes();
    }

    @GetMapping("/api-public-getListProductByCategoryAndShopEmail")
    public ResponseEntity<?> findProductByShopCategory(@RequestParam Integer categoryId) {
        Map<String, Object> result = new HashMap<>();
        try {
            result.put("status", true);
            result.put("message", "Call Api Success");
            result.put("data", productService.findProductByShopCategory(categoryId, sessionEmail));
        } catch (Exception e) {
            result.put("status", false);
            result.put("message", "Call Api Fail");
            result.put("data", null);
        }
        return ResponseEntity.ok(result);
    }

    @GetMapping("/api-public/getProductsInfoForSearchRecommend")
    public ResponseObject<?> doGetProductsInfoForSearchRecommend() {
        var response = new ResponseObject<>();
        try {
            var list = productService.getProductsInfoForSearchRecommend();
            response.setData(list);
            response.setStatus("Succeed");
            response.setMessage("Get products info for search recommendation successfully!");
        } catch (Exception e) {
            response.setStatus("Failed");
            response.setMessage("An error occurred during progress!");
            e.printStackTrace();
        }
        return response;
    }

}
