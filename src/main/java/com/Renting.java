package com;

public class Renting {

    private Integer chainId;
    private Integer hotelId;
    private Integer roomNum;
    private String startDate;
    private String endDate;
    private String customerId;
    private Integer employeeSsn;


    /**
     * Constructor to create com.Renting object with chainId, hotelId, roomNum, startDate, endDate, customerId, employeeSsn
     *
     * @param chainId id of hotel chain
     * @param hotelId id of hotel
     * @param roomNum room number
     * @param startDate starting date for renting
     * @param endDate starting date for renting
     * @param customerId id of customer the renting is for
     * @param employeeSsn ssn of employee making renting
     */
    public Renting(Integer chainId, Integer hotelId, Integer roomNum, String startDate, String endDate, String customerId, Integer employeeSsn) {
        this.chainId = chainId;
        this.hotelId = hotelId;
        this.roomNum = roomNum;
        this.startDate = startDate;
        this.endDate = endDate;
        this.customerId = customerId;
        this.employeeSsn = employeeSsn;
    }

    /* Getters */
    public Integer getChainId() { return this.chainId; }
    public Integer getHotelId() { return this.hotelId; }
    public Integer getRoomNum() { return this.roomNum; }
    public String getStartDate() { return this.startDate; }
    public String getEndDate() { return this.endDate; }
    public String getCustomerId() { return this.customerId; }
    public Integer getEmployeeSsn() { return this.employeeSsn; }

    /* Setters */
    public void setChainId(int id) { this.chainId = id; }
    public void setHotelId(int id) { this.hotelId = id; }
    public void setRoomNum(int num) { this.roomNum = num; }
    public void setStartDate(String date) { this.startDate = date; }
    public void setEndDate(String date) { this.endDate = date; }
    public void setCustomerId(String id) { this.customerId = id; }
    public void setEmployeeSsn(Integer ssn) { this.employeeSsn = ssn; }

    @Override
    public String toString() {
        return "<ul>"
                + "<li>com.Renting= " + chainId + "</li>"
                + "<li>com.Renting= " + hotelId + "</li>"
                + "<li>com.Renting= " + roomNum + "</li>"
                + "<li>com.Renting= " + startDate + "</li>"
                + "<li>com.Renting= " + endDate + "</li>"
                + "<li>com.Renting= " + customerId + "</li>"
                + "<li>com.Renting= " + employeeSsn + "</li>";
    }
}
