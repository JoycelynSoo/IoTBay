package beans.controller;

import java.io.Serializable;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import jakarta.servlet.http.HttpSession; 

public class StaffValidator implements Serializable { 

    private String idPattern = "\\d{1,5}"; //means any digit/number that is 1-5 characters long
    private String firstNamePattern = "[A-Z][a-z]+"; 
    private String lastNamePattern = "[A-Z][a-z]+";
    private String emailPattern = "([a-zA-Z0-9]+)(([._-])([a-zA-Z0-9]+))(@)([a-z]+)(.)([a-z]{3})((([.])[a-z]{0,2}))";
    private String positionPattern = "[A-Za-z]+"; 
    private String addressPattern = ".+"; // Any non-empty string
    private String statusPattern = "true|false"; // Boolean value represented as string

    public StaffValidator() { }

    public boolean validate(String pattern, String input) {
        Pattern regEx = Pattern.compile(pattern);
        Matcher match = regEx.matcher(input);

        return match.matches(); 
    }

    public boolean checkEmpty(int staffId, String firstName, String lastName, String email, String position) {
        return  staffId == 0 ||
                firstName == null || firstName.isEmpty() ||
                lastName == null || lastName.isEmpty() ||
                email == null || email.isEmpty() ||
                position == null || position.isEmpty();
    }

    public boolean validateID(String id) {
        return validate(idPattern, id);
    }

    public boolean validateFirstName(String firstName) {
        return validate(firstNamePattern, firstName); 
    }

    public boolean validateLastName(String lastName) {
        return validate(lastNamePattern, lastName); 
    }

    public boolean validateEmail(String email) {
        return validate(emailPattern, email);
    }

    public boolean validatePosition(String position) {
        return validate(positionPattern, position); 
    }
    public boolean validateAddress(String address) {
        return validate(addressPattern, address); 
    }

    public boolean validateStatus(String status) {
        return validate(statusPattern, status); 
    }

    public void clear(HttpSession session) {
        session.setAttribute("idErr", "Enter ID");
        session.setAttribute("firstNameErr", "Enter first name");
        session.setAttribute("lastNameErr", "Enter last name");
        session.setAttribute("emailErr", "Enter email");
        session.setAttribute("positionErr", "Enter position");
        session.setAttribute("addressErr", "Enter address");
        session.setAttribute("statusErr", "Select status");
    }
}