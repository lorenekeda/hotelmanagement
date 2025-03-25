package com;

public class Payment {

    private Integer cardNumber;
    private int cvv;
    private String expiryDate;
    private String customerId;

    /**
     * Constructor to create com.Payment object with cardNumber, cvv, expiryDate, customerId
     *
     * @param cardNumber card number of payment
     * @param cvv cvv of payment
     * @param expiryDate expiry date of payment
     * @param customerId id of customer the payment belongs to
     */
    public Payment(Integer cardNumber, Integer cvv, String expiryDate, String customerId) {
        this.cardNumber = cardNumber;
        this.cvv = cvv;
        this.expiryDate = expiryDate;
        this.customerId = customerId;
    }

    /* Getters */
    public Integer getCardNumber() { return this.cardNumber; }
    public Integer getCvv() { return this.cvv; }
    public String getExpiryDate() { return this.expiryDate; }
    public String getCustomerId() { return this.customerId; }

    /* Setters */
    public void setCardNumber(int number) { this.cardNumber = number; }
    public void setCvv(int cvv) { this.cvv = cvv; }
    public void setExpiryDate(String date) { this.expiryDate = date; }
    public void setCustomerId(String id) { this.customerId = id; }

    @Override
    public String toString() {
        return "<ul>"
                + "<li>com.Payment= " + cardNumber + "</li>"
                + "<li>com.Payment= " + cvv + "</li>"
                + "<li>com.Payment= " + expiryDate + "</li>"
                + "<li>com.Payment= " + customerId + "</li>";
    }
}
