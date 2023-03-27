package com.codingdojo.adminDash.validator;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import com.codingdojo.adminDash.models.User;
@Component
public class UserValidator implements Validator {
    
    //    1      -- the 'supports(Class<?>)' Specifies that a instance of the User Domain Model can be validated
	// with this custom validator
    @Override
    public boolean supports(Class<?> clazz) { // what hecc is clazz??
        return User.class.equals(clazz);
    }
    
    // 2     --validate(Object, Errors): Creating our custom validation. We can add errors via 
    // .rejectValue(String, String)
    @Override
    public void validate(Object object, Errors errors) {
        User user = (User) object;
        
        if (!user.getPasswordConfirmation().equals(user.getPassword())) {
            // 3   -- .rejectValue(String, String): the first argument is the member variable of our Domain model
        	//  that we are validating. The second argument is a code for us to use to set an error message.
            errors.rejectValue("passwordConfirmation", "Match");
        }         
    }
}