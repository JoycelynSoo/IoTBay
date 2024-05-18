
package beans;

import java.math.BigDecimal;
import java.util.Date;

public class Payment {
    private int paymentId;
    private String paymentNameOnCard;
    private String paymentCardNumber;
    private int paymentExpiryMonth;
    private int paymentExpiryYear;
    private int paymentCvv;
    private double amount;
    private String paymentDate;
    private String customerEmail;

    // Constructor
    public Payment(String paymentNameOnCard, String paymentCardNumber, int paymentExpiryMonth, 
                   int paymentExpiryYear, int paymentCvv, double amount, String paymentDate, String customerEmail) {
        this.paymentNameOnCard = paymentNameOnCard;
        this.paymentCardNumber = paymentCardNumber;
        this.paymentExpiryMonth = paymentExpiryMonth;
        this.paymentExpiryYear = paymentExpiryYear;
        this.paymentCvv = paymentCvv;
        this.amount = amount;
        this.paymentDate = paymentDate;
        this.customerEmail = customerEmail;
    }


    public String getPaymentNameOnCard() {
        return paymentNameOnCard;
    }

    public String getPaymentCardNumber() {
        return paymentCardNumber;
    }

    public int getPaymentExpiryMonth() {
        return paymentExpiryMonth;
    }

    public int getPaymentExpiryYear() {
        return paymentExpiryYear;
    }

    public int getPaymentCvv() {
        return paymentCvv;
    }

    public double getAmount() {
        return amount;
    }

    public String getPaymentDate() {
        return paymentDate;
    }

    public String getCustomerEmail() {
        return customerEmail;
    }
}
