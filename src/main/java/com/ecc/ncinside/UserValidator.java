package com.ecc.ncinside;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class UserValidator implements Validator {
    /**
     * 검증하려는 클래스를 체크
     * clazz 가 User또는 그 자손인지 확인
     */
    @Override
    public boolean supports(Class<?> clazz) {
        return User.class.isAssignableFrom(clazz);
    }

    /**
     * 검증 로직
     */
    @Override
    public void validate(Object target, Errors errors) {
        System.out.println("UserValidator.validator() is called");
        User user = (User) target;
        String id = user.getId();

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "id", "required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "id", "required");

        if(id == null || id.length() < 5 || id.length() > 12) {
            errors.rejectValue("id", "invalidLength", new String[]{"5", "12"}, null);
        }
    }
}
