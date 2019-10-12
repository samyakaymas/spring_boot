// package com.mobile.mobile.validator;

// import com.mobile.mobile.entity.users;
// import com.mobile.mobile.service.UserService;
// import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.stereotype.Component;
// import org.springframework.validation.Errors;
// import org.springframework.validation.ValidationUtils;
// import org.springframework.validation.Validator;

// @Component
// public class UserValidator implements Validator {
//     @Autowired
//     private UserService userService;

//     @Override
//     public boolean supports(Class<?> aClass) {
//         return users.class.equals(aClass);
//     }

//     @Override
//     public void validate(Object o, Errors errors) {
//         users user = (users) o;

//         ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username", "NotEmpty");
//         if (user.getUsername().length() < 6 || user.getUsername().length() > 32) {
//             errors.rejectValue("username", "Size.userForm.username");
//         }
//         if (userService.findByUsername(user.getUsername()) != null) {
//             errors.rejectValue("username", "Duplicate.userForm.username");
//         }

//         ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "NotEmpty");
//         if (user.getPassword().length() < 8 || user.getPassword().length() > 32) {
//             errors.rejectValue("password", "Size.userForm.password");
//         }
//     }
// }