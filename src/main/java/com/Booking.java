package com;

public class Booking {

    private Integer chainId;
    private Integer hotelId;
    private Integer roomNum;
    private String startDate;
    private String endDate;
    private String customerId;


    /**
     * Constructor to create com.Booking object with chainId, hotelId, roomNum, startDate, endDate, customerId
     *
     * @param chainId id of hotel chain
     * @param hotelId id of hotel
     * @param roomNum room number
     * @param startDate starting date for booking
     * @param endDate starting date for booking
     * @param customerId id of customer making booking
     */
    public Booking(Integer chainId, Integer hotelId, Integer roomNum, String startDate, String endDate, String customerId) {
        this.chainId = chainId;
        this.hotelId = hotelId;
        this.roomNum = roomNum;
        this.startDate = startDate;
        this.endDate = endDate;
        this.customerId = customerId;
    }

    /* Getters */
    public Integer getChainId() { return this.chainId; }
    public Integer getHotelId() { return this.hotelId; }
    public Integer getRoomNum() { return this.roomNum; }
    public String getStartDate() { return this.startDate; }
    public String getEndDate() { return this.endDate; }
    public String getCustomerId() { return this.customerId; }

    /* Setters */
    public void setChainId(int id) { this.chainId = id; }
    public void setHotelId(int id) { this.hotelId = id; }
    public void setRoomNum(int num) { this.roomNum = num; }
    public void setStartDate(String date) { this.startDate = date; }
    public void setEndDate(String date) { this.endDate = date; }
    public void setCustomerId(String id) { this.customerId = id; }

    @Override
    public String toString() {
        return "<ul>"
                + "<li>com.Booking= " + chainId + "</li>"
                + "<li>com.Booking= " + hotelId + "</li>"
                + "<li>com.Booking= " + roomNum + "</li>"
                + "<li>com.Booking= " + startDate + "</li>"
                + "<li>com.Booking= " + endDate + "</li>"
                + "<li>com.Booking= " + customerId + "</li>";
    }
}
