package com.es.core.model.phone;

public class Stock {
    private Long phoneId;
    private Integer stock;
    private Integer reserved;

    public Stock() {
    }

    public Stock(Long phoneId, Integer stock, Integer reserved) {
        this.phoneId = phoneId;
        this.stock = stock;
        this.reserved = reserved;
    }

    public Stock(Stock stock) {
        this.phoneId = stock.phoneId;
        this.stock = stock.stock;
        this.reserved = stock.reserved;
    }

    public Long getPhoneId() {
        return phoneId;
    }

    public void setPhoneId(Long phoneId) {
        this.phoneId = phoneId;
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public Integer getReserved() {
        return reserved;
    }

    public void setReserved(Integer reserved) {
        this.reserved = reserved;
    }
}
