package com;

public class Manager {
    private Integer ssn;
    private Integer chainId;
    private Integer hotelId;
    private String firstName;
    private String lastName;
    private String address;
    private String position;



    /**
     *  Constructor to create com.Manager object with ssn, position , hotelId, chainId, firstName, lastName, address
     * @param ssn
     * @param position
     * @param hotelId
     * @param chainId
     * @param firstName
     * @param lastName
     * @param address
     */
    public Manager(Integer ssn, String position, Integer hotelId, Integer chainId, String firstName,String lastName, String address) {
        this.chainId = chainId;
        this.hotelId = hotelId;
        this.ssn = ssn;
        this.firstName = firstName;
        this.lastName = lastName;
        this.address = address;
        this.position = position;

    }

    /* Getters */
    public Integer getChainId() { return this.chainId; }
    public Integer getHotelId() { return this.hotelId; }
    public Integer getSsn() { return this.ssn; }
    public String getFirstName() { return this.firstName; }
    public String getLastName() { return this.lastName; }
    public String getAddress() { return this.address; }
    public String getPosition() { return this.position; }



    /* Setters */
    public void setChainId(Integer id) { this.chainId = id; }
    public void setHotelId(Integer id) { this.hotelId = id; }
    public void setSsn(Integer ssn) { this.ssn = ssn; }
    public void setFirstName(String name) { this.firstName = name; }
    public void setLastName(String name) { this.lastName = name; }
    public void setAddress(String address) { this.address = address; }
    public void setPosition(String position) { this.position = position; }

    @Override
    public String toString() {
        return "<ul>"
                + "<li>com.Employee= " + firstName + "</li>"
                + "<li>com.Employee= " + lastName + "</li>"
                + "<li>com.Employee= " + address + "</li>"
                + "<li>com.Employee= " + position + "</li>";
    }

}
