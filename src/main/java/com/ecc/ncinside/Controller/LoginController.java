package com.ecc.ncinside.Controller;

import com.ecc.ncinside.User;
import com.ecc.ncinside.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/login")
public class LoginController {

    @Autowired
    UserDao userDao;

    @GetMapping("/login")
    public String login() {
        return "loginForm";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session, RedirectAttributes rattr) {
        session.invalidate();
        rattr.addFlashAttribute("msg", "LOGOUT");

        return "redirect:/";
    }

    @PostMapping("/login")
    public String login(String id, String pwd, HttpServletRequest request, HttpServletResponse response, Model m) {
        // 1. id와 pwd를 확인
        if(!loginCheck(id, pwd)) {
            // 일치하지 않으면, loginForm으로 이동
            m.addAttribute("msg","IDまたはパスワードが間違っています");
            return "redirect:/login/login";
        }

        // id와 pwd가 일치하면 세션 객체에 id를 저장
        HttpSession session = request.getSession();
        session.setAttribute("id", id);


            // 아이디 기억을 체크하면 쿠키를 생성해줌
        if(loginCheck(id, pwd)) {
            Cookie cookie = new Cookie("id", id);
            response.addCookie(cookie);
        }else {
            Cookie cookie = new Cookie("id", id);
            cookie.setMaxAge(0);
            response.addCookie(cookie);
        }
        return "redirect:/";
    }

    private boolean loginCheck(String id, String pwd) {
        User user = userDao.selectUser(id);
        // DB로 유저 검색해서 대조하는것은 나중에 수정하고 일시적으로 지정아이디,비번
//        return id.equals("admin") & pwd.equals("dnflwlq1408");
        if(user == null)
            return false;
        return id.equals(user.getId()) && pwd.equals(user.getPwd());
    }

}
