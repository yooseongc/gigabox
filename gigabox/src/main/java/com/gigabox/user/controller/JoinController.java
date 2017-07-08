package com.gigabox.user.controller;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gigabox.user.enc.utils.BCrypt;
import com.gigabox.user.enc.utils.SHA256;
import com.gigabox.user.enc.utils.SimpleCrypto;
import com.gigabox.user.service.JoinService;
import com.gigabox.user.util.ZipcodeSearchTO;
import com.gigabox.user.util.ZipcodeVO;
import com.gigabox.user.vo.UserVO;
import com.google.gson.Gson;

import net.tanesha.recaptcha.ReCaptchaImpl;
import net.tanesha.recaptcha.ReCaptchaResponse;

@Controller
@RequestMapping("/user")
public class JoinController {
	
	@Inject
	private JoinService service;
	
	@Inject
	private JavaMailSender mailSender;
	
	private static final Logger logger = LoggerFactory.getLogger(JoinController.class);
	
	public static final String ZIPCODE_API_KEY = "e515c666f2ef27ff51496904073254";
    public static final String ZIPCODE_API_URL = "https://biz.epost.go.kr/KpostPortal/openapi"; // 요청 URL
	
    //약관동의 폼 출력하기
  	@RequestMapping(value = "/joinAgreeForm", method = RequestMethod.GET)
  	public String joinAgreeGET(){
  		logger.info("JOINAGREEFORM PAGE LOADING...");
  		return "/user/join/joinAgreeForm";
  	}
  	
    //약관동의 확인시 회원가입 폼으로 이동
  	@RequestMapping(value = "/joinFormLoad", method = RequestMethod.GET)
  	public String joinFormLoadGET(){
  		logger.info("JOIN FORM LOADING... Redirect to /user/joinForm");
  		// 매핑 ==> /joinForm  joinFormGET()으로 이동
  		return "forward:/user/joinForm";
  	}
    
	//가입 폼 출력하기
    @RequestMapping(value="/joinForm", method=RequestMethod.GET)
	public String joinFormGET(@RequestParam(value="join_user_agree", required=false, defaultValue="0") int user, 
			@RequestParam(value="join_priv_agree", required=false, defaultValue="0") int priv) {
		logger.info("JOINFORM PAGE LOADING...");
		logger.info("user agree= " + user + ". priv_agree= " + priv);
		if (!(user == 1 && priv == 1)) {
			return "redirect:/user/joinAgreeForm";
		}
		return "/user/join/joinForm";
	}
	
	//가입 구현하기
    @Transactional
	@RequestMapping(value="/joinForm", method=RequestMethod.POST)
	public String userJoinInsert(@ModelAttribute UserVO uvo) throws Exception {
		logger.info("userJoinInsert 호출 성공");
		logger.info(uvo.toString());
		
		// 암호화 적용
		int pwEncryptionResult =0;
		String orgPass = uvo.getUserPw(); 
		
		String shaPass = "";
		try {
			SHA256 sha = SHA256.getInsatnce();
			shaPass = sha.getSha256(orgPass.getBytes());
			String bcPass = BCrypt.hashpw(shaPass, BCrypt.gensalt());
			uvo.setUserPw(bcPass);
			pwEncryptionResult = service.pwEncryptionExec(uvo);
			
			logger.info("PW ENCRYPTION RESULT= " + pwEncryptionResult);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// 인증 메일 보내기
		String key = uvo.getUserName(); 
		String idEncrypt = SimpleCrypto.encrypt(key, uvo.getUserId());
		uvo.setUserJoinAuth(idEncrypt);
		
		String authAddr = "http://localhost:8080/user/emailAuth/" + idEncrypt;
		logger.info("=======================================================");
		logger.info("EMAIL SEND START");
			
		StringBuilder sb = new StringBuilder();
		sb.append("<hr>");
		sb.append("<h4> 본 메일은 GIGABOX 회원 가입 인증용 이메일 입니다.</h4>");
		sb.append("<hr>");
		sb.append("<p>회원 가입 인증을 완료하시려면 아래 링크를 클릭해 주세요.</p>");
		sb.append("<p><a href='" + authAddr + "'>" + authAddr + "</a></p>");
		sb.append("<hr>");
		
		MimeMessage message = mailSender.createMimeMessage(); 
		MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8"); 
		messageHelper.setTo(uvo.getUserEmail()); 
		messageHelper.setText(sb.toString(), true); 
		messageHelper.setFrom("gigabox777@gmail.com"); 
		messageHelper.setSubject("GIGABOX 회원 가입 인증용 이메일입니다.");	
		mailSender.send(message);
		
		logger.info("EMAIL SEND END");
		logger.info("=======================================================");
		
		int result = 0;
		String url = "";
		
		// DB에 입력
		result = service.userJoin(uvo);
		
		if(result ==1){
			url = "/?pageAction=login";
		}
		return "redirect:" + url;
	}
    
    // 이메일 인증 확인
    @Transactional
    @RequestMapping(value="/emailAuth/{enc}", method=RequestMethod.GET)
    public String emailAuth(@PathVariable String enc) {
    	
    	logger.info("====================================================");
    	logger.info("이메일 인증을 시작합니다.");
    	int result = service.emailAuthConfirm(enc);
    	logger.info("result= " + result);
    	
    	if (result == 1) {
    		logger.info("정상 인증, 메인 페이지 로그인으로 넘어갑니다.");
    		logger.info("===================================================");
    		return "redirect:/?pageAction=emailAuthOK";
    	} else {
    		logger.info("인증 실패, 메인 페이지에서 경고를 띄웁니다.");
    		logger.info("===================================================");
    		return "redirect:/?pageAction=emailAuthError";
    	}
    	
    }
	
	//아이디 중복확인
	@ResponseBody
	@RequestMapping(value="/idduplicationcheck", method=RequestMethod.POST)
	public String idDuplicationCheck(@RequestBody UserVO vo) {
		logger.info("ID DUPLICATION CHECK PROCESS START...");
		logger.info("PARSED USERID= " + vo.getUserId());
		
		int result = service.idDuplicationCheck(vo.getUserId());
		
		// 0이면 중복아님, 1이면 중복!
		logger.info("ID DUPLICATION CHECK RESULT=" + result);
		return result + "";
	}
	
	
	/**
	 * 구글 리캡챠 적용 메소드
	 * 
	 */
	@ResponseBody
	@RequestMapping(value = "/validateRecaptcha", method=RequestMethod.POST)
	public String validateRecaptcha(@RequestParam Map<String, String> paramMap) {
	    
		logger.info("RECAPCHA VALIDATION PROCESS START...");
		
	    String check = "Y";
	     
	    ReCaptchaImpl reCaptcha = new ReCaptchaImpl();
	    reCaptcha.setPrivateKey("6Lf3xCQUAAAAAOGHizcuAhxSyG14CUL5qEmjjTm-");
	 
	    String host = paramMap.get("host");
	    String challenge = paramMap.get("challenge");
	    String res = paramMap.get("response");
	     
	    logger.info("RECAPCHA HOST=" + host);
	    logger.info("RECAPCHA CHALLENGE=" + challenge);
	    logger.info("RECAPCHA RESPONSE=" + res);
	    
	    ReCaptchaResponse reCaptchaResponse = reCaptcha.checkAnswer(host, challenge, res);
	 
	    if (reCaptchaResponse.isValid()) {
	        check = "Y";
	    } else {
	        check = "N";
	    }
	    
	    logger.info("RECAPCHA CHECK ANSWER=" + check);
	    
	    return check;
	 
	}
	
	/**
	 * 우편 번호 검색 적용 메소드
	 * @param searchTO
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/zipcode/list", method = RequestMethod.POST, produces="text/plain;charset=UTF-8")
    public String list(@ModelAttribute ZipcodeSearchTO searchTO) throws Exception {
         
		logger.info("ZIPCODE LIST PRINT METHOD START...");
		
        Map<String, Object> paramMap = new HashMap<String, Object>();
         
        // 요청 URL 생성
        StringBuilder queryUrl = new StringBuilder();
        queryUrl.append(ZIPCODE_API_URL);
        queryUrl.append("?regkey=");
        queryUrl.append(ZIPCODE_API_KEY);
        queryUrl.append("&target=");
        queryUrl.append(searchTO.getTarget());  // 서비스 종류 (지번/도로명, 새우편번호 지번/도로명)
        queryUrl.append("&query=");
        // ex) 세종로 17 로 입력하면 세종로와 17사이의 빈칸 때문에 에러가 발생하기 때문에 빈칸을 없앤다.
        queryUrl.append(URLEncoder.encode(searchTO.getQuery().replaceAll(" ", ""),"EUC-KR"));       // 검색어
        queryUrl.append("&currentPage=");
        queryUrl.append("" + searchTO.getCurrentPage());
 
        logger.info("QUERY URL=" + queryUrl.toString());
        
        Document document = Jsoup.connect(queryUrl.toString()).get();
         
        String errorCode = document.select("error_code").text();
        String totalCount = document.select("totalCount").text();
        String totalPage = document.select("totalPage").text();
        
        
        // 요청 결과가 정상일 경우 내용을 파싱하여 List 에 담는다.
        if (null == errorCode || "".equals(errorCode)) {
            Elements elements = document.select("item");
            List<ZipcodeVO> list = new ArrayList<ZipcodeVO>();
            ZipcodeVO zipcodeVO = null;
             
            for (Element element : elements) {
                zipcodeVO = new ZipcodeVO();
                zipcodeVO.setZipcode(element.select("postcd").text());
                // 도로명 검색일 경우
                if (searchTO.getTarget().indexOf("Road") > -1) {
                    zipcodeVO.setAddress(element.select("rnaddress").text());
                    zipcodeVO.setLnmAddress(element.select("lnmaddress").text());
                     
                    // 지번 검색일 경우
                } else {
                    zipcodeVO.setAddress(element.select("address").text());
                }
                 
                list.add(zipcodeVO);
            }
             
            paramMap.put("addrList", list);
            paramMap.put("totalCount", totalCount);
            paramMap.put("totalPage", totalPage);
            // 요청 결과가 정상이 아닐 경우 에러 내용을 담는다.
        } else {
            String errorMessage = document.select("message").text();
             
            paramMap.put("errorCode", errorCode);
            paramMap.put("errorMessage", errorMessage);
        }
         
        return (new Gson()).toJson(paramMap);
    }
	
	
	
}
