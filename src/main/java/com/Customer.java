package com;

public class Customer {

    private String customerId;
    private String registrationDate;
    private String firstName;
    private String lastName;
    private String idType;
    private String address;


    /**
     * Constructor to create com.Customer object with customerId, registrationDate, firstName, lastName, idType, address
     *
     * @param customerId id of customer
     * @param registrationDate registration date of customer
     * @param firstName first name of customer
     * @param lastName last name of customer
     * @param idType id type given from customer
     * @param address address of customer
     */
    public Customer(String customerId, String registrationDate, String firstName, String lastName, String idType, String address) {
        this.customerId = customerId;
        this.registrationDate = registrationDate;
        this.firstName = firstName;
        this.lastName = lastName;
        this.idType = idType;
        this.address = address;
    }

    /**
     * Constructor to create com.Customer object with registrationDate, firstName, lastName, idType, address
     *
     * @param registrationDate registration date of customer
     * @param firstName first name of customer
     * @param lastName last name of customer
     * @param idType id type given from customer
     * @param address address of customer
     */
    public Customer(String registrationDate, String firstName, String lastName, String idType, String address) {
        this.registrationDate = registrationDate;
        this.firstName = firstName;
        this.lastName = lastName;
        this.idType = idType;
        this.address = address;
    }

    /* Getters */
    public String getCustomerId() { return this.customerId; }
    public String getRegistrationDate() { return this.registrationDate; }
    public String getFirstName() { return this.firstName; }
    public String getLastName() { return this.lastName; }
    public String getIdType() { return this.idType; }
    public String getAddress() { return this.address; }

    /* Setters */
    public void setCustomerId(String id) { this.customerId = id; }
    public void setRegistrationDate(String date) { this.registrationDate = date; }
    public void setFirstName(String name) { this.firstName = name; }
    public void setLastName(String name) { this.lastName = name; }
    public void setIdType(String type) { this.idType = type; }
    public void setAddress(String address) { this.address = address; }

    @Override
    public String toString() {
        return "<ul>"
                + "<li>com.Customer= " + registrationDate + "</li>"
                + "<li>com.Customer= " + firstName + "</li>"
                + "<li>com.Customer= " + lastName + "</li>"
                + "<li>com.Customer= " + idType + "</li>"
                + "<li>com.Customer= " + address + "</li>";
    }
}
