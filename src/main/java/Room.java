public class Room {

    private Integer chainId;
    private Integer hotelId;
    private Integer roomNum;
    private String view;
    private boolean extendable;
    private int price;
    private String capacity;


    /**
     * Constructor to create Room object with chainId, hotelId, roomNum, view, extendable, price, capacity
     *
     * @param chainId id of hotel chain
     * @param hotelId id of hotel
     * @param roomNum room number
     * @param view view for room
     * @param extendable if room can be extended
     * @param price price of room
     * @param capacity capacity of room
     */
    public Room(Integer chainId, Integer hotelId, Integer roomNum, String view, boolean extendable, int price, String capacity) {
        this.chainId = chainId;
        this.hotelId = hotelId;
        this.roomNum = roomNum;
        this.view = view;
        this.extendable = extendable;
        this.price = price;
        this.capacity = capacity;
    }

    /**
     * Constructor to create Room object with view, extendable, price, capacity
     *
     * @param view view for room
     * @param extendable if room can be extended
     * @param price price of room
     * @param capacity capacity of room
     */
    public Room(String view, boolean extendable, int price, String capacity) {
        this.view = view;
        this.extendable = extendable;
        this.price = price;
        this.capacity = capacity;
    }

    /* Getters */
    public Integer getChainId() { return this.chainId; }
    public Integer getHotelId() { return this.hotelId; }
    public Integer getRoomNum() { return this.roomNum; }
    public String getView() { return this.view; }
    public boolean getExtendable() { return this.extendable; }
    public int getPrice() { return this.price; }
    public String getCapacity() { return this.capacity; }

    /* Setters */
    public void setChainId(int id) { this.chainId = id; }
    public void setHotelId(int id) { this.hotelId = id; }
    public void setRoomNum(int num) { this.roomNum = num; }
    public void setView(String view) { this.view = view; }
    public void setExtendable(boolean extendable) { this.extendable = extendable; }
    public void setPrice(int price) { this.price = price; }
    public void setCapacity(String capacity) { this.capacity = capacity; }

    @Override
    public String toString() {
        return "<ul>"
                + "<li>Room= " + view + "</li>"
                + "<li>Room= " + extendable + "</li>"
                + "<li>Room= " + price + "</li>"
                + "<li>Room= " + capacity + "</li>";
    }
}
