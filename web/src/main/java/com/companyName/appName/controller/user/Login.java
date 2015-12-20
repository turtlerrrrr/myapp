package com.companyName.appName.controller.user;

import com.google.gson.Gson;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;

/**
 * Created by peter on 15-12-18.
 */
@Controller
public class Login {
    private final Logger logger = LoggerFactory.getLogger(Login.class);


    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String showLogin() {
        logger.debug("login() is executed!");
        return "login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public void login(@RequestParam("username") String username,
                        @RequestParam("password") String password,
                        HttpServletResponse response) throws Exception{
        logger.debug("username="+username);
        logger.debug("password="+password);
        Gson gson=new Gson();
        response.setContentType("text/html; charset=utf-8");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().print(gson.toJson(new result(true,"登陆成功","000000")));
    }

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String showHome(){
        return "home";
    }


    public class result {
        private boolean success;
        private String message;
        private String code;

        public result(boolean success, String message, String code) {
            this.success = success;
            this.message = message;
            this.code = code;
        }

        public boolean isSuccess() {
            return success;
        }

        public void setSuccess(boolean success) {
            this.success = success;
        }

        public String getMessage() {
            return message;
        }

        public void setMessage(String message) {
            this.message = message;
        }

        public String getCode() {
            return code;
        }

        public void setCode(String code) {
            this.code = code;
        }
    }
}
