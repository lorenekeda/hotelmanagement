package com;

public class Employee {

    private Integer ssn;
    private Integer chainId;
    private Integer hotelId;
    private String firstName;
    private String lastName;
    private String address;
    private String position;
    private String password;


    /**
     * Constructor to create com.Employee object with chainId, hotelId, ssn, firstName, lastName, address, position, password
     *
     * @param ssn ssn of employee
     * @param chainId id of hotel chain
     * @param hotelId id of hotel
     * @param firstName first name of employee
     * @param lastName last name of employee
     * @param address address of employee
     * @param position position of employee
     * @param password password of employee
     */
    public Employee(Integer ssn, Integer chainId, Integer hotelId, String firstName, String lastName, String address, String position, String password) {
        this.chainId = chainId;
        this.hotelId = hotelId;
        this.ssn = ssn;
        this.firstName = firstName;
        this.lastName = lastName;
        this.address = address;
        this.position = position;
        this.password = password;
    }

    /* Getters */
    public Integer getChainId() { return this.chainId; }
    public Integer getHotelId() { return this.hotelId; }
    public Integer getSsn() { return this.ssn; }
    public String getFirstName() { return this.firstName; }
    public String getLastName() { return this.lastName; }
    public String getAddress() { return this.address; }
    public String getPosition() { return this.position; }
    public String getPassword() { return this.password; }


    /* Setters */
    public void setChainId(Integer id) { this.chainId = id; }
    public void setHotelId(Integer id) { this.hotelId = id; }
    public void setSsn(Integer ssn) { this.ssn = ssn; }
    public void setFirstName(String name) { this.firstName = name; }
    public void setLastName(String name) { this.lastName = name; }
    public void setAddress(String address) { this.address = address; }
    public void setPosition(String position) { this.position = position; }
    public void setPassword(String password) { this.password = password; }

    @Override
    public String toString() {
        return "<ul>"
                + "<li>com.Employee= " + firstName + "</li>"
                + "<li>com.Employee= " + lastName + "</li>"
                + "<li>com.Employee= " + address + "</li>"
                + "<li>com.Employee= " + position + "</li>"
                + "<li>com.Employee= " + password + "</li>";
    }
}
