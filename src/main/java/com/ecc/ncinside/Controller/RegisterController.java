package com.ecc.ncinside.Controller;

import com.ecc.ncinside.User;
import com.ecc.ncinside.UserValidator;
import com.ecc.ncinside.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.validation.Validator;

import javax.validation.Valid;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/register")
public class RegisterController {

    final int FAIL = 0;

    @Autowired
    UserDao userDao;

    /**
     * @InitBinder 어노테이션은 해당 컨트롤러가 호출될때마다 메소드가 수행되게 함.
     */

    @InitBinder
    public void toDate(WebDataBinder binder) {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(df, false));
        binder.setValidator(new UserValidator()); // UserValidator를 WebDataBinder의 로컬 validator로 등록
        List<Validator> validatorList = binder.getValidators();
        System.out.println("validatorList = " + validatorList);

    }


    @GetMapping("/save")
    public String register() {
        return "registerForm";
    }

    /**
     * BindingResult 는 검증을 수행하면서 에러를 담는 객체이다.
     * 검증이 끝난후 BindingResult.hasErrors()를 이용하면 에러가 있었는지 체크할 수 있고
     * getFiledErrors() 로 에러 목록을 가져올 수 있다.
     */

    @PostMapping("/save")
    public String registerAdd(@Valid User user, BindingResult result, Model m) {
        System.out.println("result = " + result);
        System.out.println("user = " + user);

        // User객체를 검증한 결과 에러가 있으면, registerForm을 이용해서 에러를 보여줘야 함.
        if(result.hasErrors())
            return "registerForm";

        // 검증했을때 에러가 없으면 , DB에 유저를 신규등록하고 , insert 할때 에러가 없으면 registerInfo로 이동
        if(FAIL==userDao.insertUser(user))
            return "registerForm";

        return "registerInfo";
    }
}
