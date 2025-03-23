public class Hotel {

    private Integer chainId;
    private Integer hotelId;
    private String hotelName;
    private String address;
    private int rating;
    private int numOfRoom;

    /**
     * Constructor to create Hotel object with chainId, hotelId, hotelName, address, rating, numOfRoom
     *
     * @param chainId id of hotel chain
     * @param hotelId id of hotel
     * @param hotelName name of hotel
     * @param address address of hotel
     * @param rating rating of hotel
     * @param numOfRoom number of rooms belonging to the hotel
     */
    public Hotel(Integer chainId, Integer hotelId, String hotelName, String address, int rating, int numOfRoom) {
        this.chainId = chainId;
        this.hotelId = hotelId;
        this.hotelName = hotelName;
        this.address = address;
        this.rating = rating;
        this.numOfRoom = numOfRoom;
    }

    /**
     * Constructor to create Hotel object with hotelName, address, rating, numOfRoom
     *
     * @param hotelName name of hotel
     * @param address address of hotel
     * @param rating rating of hotel
     * @param numOfRoom number of hotels belonging to the hotel
     */
    public Hotel(String hotelName, String address, int rating, int numOfRoom) {
        this.hotelName = hotelName;
        this.address = address;
        this.rating = rating;
        this.numOfRoom = numOfRoom;
    }

    /* Getters */
    public Integer getChainId() { return this.chainId; }
    public Integer getHotelId() { return this.hotelId; }
    public String getHotelName() { return this.hotelName; }
    public String getAddress() {return this.address; }
    public int getRating() { return this.rating; }
    public int getNumOfRoom() { return this.numOfRoom; }

    /* Setters */
    public void setChainId(int id) { this.chainId = id; }
    public void setHotelId(int id) { this.hotelId = id; }
    public void setHotelName(String name) { this.hotelName = name; }
    public void setAddress(String address) { this.address = address; }
    public void setRating(int rating) { this.rating = rating; }
    public void setNumOfRoom(int num) { this.numOfRoom = num; }

    @Override
    public String toString() {
        return "<ul>"
                + "<li>Hotel= " + hotelName + "</li>"
                + "<li>Hotel= " + address + "</li>"
                + "<li>Hotel= " + rating + "</li>"
                + "<li>Hotel= " + numOfRoom + "</li>";
    }
}
