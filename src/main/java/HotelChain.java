public class HotelChain {

    private Integer chainId;
    private String chainName;
    private int numOfHotel;

    /**
     * Constructor to create HotelChain object with chainId, chainName, numOfHotel
     *
     * @param chainId id of hotel chain
     * @param chainName name of hotel chain
     * @param numOfHotel number of hotels belonging to the hotel chain
     */
    public HotelChain(Integer chainId, String chainName, int numOfHotel) {
        this.chainId = chainId;
        this.chainName = chainName;
        this.numOfHotel = numOfHotel;
    }

    /**
     * Constructor to create HotelChain object with chainName, numOfHotel
     *
     * @param chainName name of hotel chain
     * @param numOfHotel number of hotels belonging to the hotel chain
     */
    public HotelChain(String chainName, int numOfHotel) {
        this.chainName = chainName;
        this.numOfHotel = numOfHotel;
    }

    /* Getters */
    public Integer getChainId() { return this.chainId; }
    public String getChainName() { return this.chainName; }
    public int getNumOfHotel() { return this.numOfHotel; }

    /* Setters */
    public void setChainId(int id) { this.chainId = id; }
    public void setChainName(String name) { this.chainName = name; }
    public void setNumOfHotel(int num) { this.numOfHotel = num; }

    @Override
    public String toString() {
        return "<ul>"
                + "<li>HotelChain= " + chainName + "</li>"
                + "<li>HotelChain= " + numOfHotel + "</li>";
    }
}
