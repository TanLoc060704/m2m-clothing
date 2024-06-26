package m2m_phase2.clothing.clothing.security;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import m2m_phase2.clothing.clothing.data.dto.AccountGGDTO;
import m2m_phase2.clothing.clothing.data.dto.UserDto;
import m2m_phase2.clothing.clothing.data.entity.AccountGGE;
import m2m_phase2.clothing.clothing.data.entity.UserE;
import m2m_phase2.clothing.clothing.service.AccountGGService;
import m2m_phase2.clothing.clothing.service.UserService;
import m2m_phase2.clothing.clothing.service.impl.AccountGGServiceImpl;
import m2m_phase2.clothing.clothing.utils.PasswordEncoderUtil;
import m2m_phase2.clothing.clothing.utils.PasswordUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.security.authentication.event.AuthenticationSuccessEvent;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.oauth2.client.OAuth2AuthorizedClient;
import org.springframework.security.oauth2.client.OAuth2AuthorizedClientService;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.security.oauth2.client.authentication.OAuth2LoginAuthenticationToken;
import org.springframework.security.oauth2.client.registration.ClientRegistrationRepository;
import org.springframework.security.oauth2.core.OAuth2AccessToken;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

@Component
public class AuthenticationSuccessEventListener implements ApplicationListener<AuthenticationSuccessEvent> {

    @Autowired
    private UserService userService;

    @Autowired
    private AccountGGService accountGGService;

    @Autowired
    AccountGGServiceImpl accountGGServiceimpl;

    @Autowired
    private HttpSession httpSession;

    @Override
    public void onApplicationEvent(AuthenticationSuccessEvent event) {
        Map<String, Object> userInfo = new HashMap<>();
        Object source = event.getSource();
        String eventType = source.getClass().getSimpleName();
        System.out.println(eventType);
        if ( source instanceof OAuth2LoginAuthenticationToken ) {
            OAuth2LoginAuthenticationToken authenticationToken = ((OAuth2LoginAuthenticationToken) source);
            OAuth2AccessToken accessToken = authenticationToken.getAccessToken();
            if(Objects.nonNull(accessToken)){
                String accessTokenValue = accessToken.getTokenValue();
                Map<String , Object> attributes = authenticationToken.getPrincipal().getAttributes();

                userInfo.putAll(attributes);
                userInfo.put("access_token", accessTokenValue);
            }
            String email  = (String) userInfo.get("email");
            try {
                saveAccGG(userInfo);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            httpSession.setAttribute("loggedInUser", email);
        } else {
            System.out.println("Không phải là OAuth2AuthenticationToken hoặc OAuth2LoginAuthenticationToken");
        }
    }

    private void saveAccGG(Map<String, Object> userInfo) throws SQLException {
        AccountGGDTO accountGGDTO = new AccountGGDTO();
        accountGGDTO.setEmailGG((String) userInfo.get("email"));
        accountGGDTO.setUsernameGG((String) userInfo.get("sub"));
        accountGGDTO.setAccessTokenGG((String) userInfo.get("access_token"));
        accountGGDTO.setSubGG((String) userInfo.get("sub"));
        accountGGService.saveAccountGG(accountGGDTO);
    }
}
