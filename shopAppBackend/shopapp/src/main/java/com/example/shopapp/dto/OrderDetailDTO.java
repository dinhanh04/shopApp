package com.example.shopapp.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.validation.constraints.Min;
import lombok.Data;

@Data
public class OrderDetailDTO {

    @JsonProperty("order_id")
    @Min(value = 1, message = "orderId must be >1")
    private Long orderId;

    @JsonProperty("product_id")
    @Min(value = 1, message = "productId must be >1")
    private Long productId;

    @Min(value = 0, message = "price must be >0")
    private Long price;

    @Min(value = 1, message = "number of product must be >1")
    @JsonProperty("number_of_product")
    private int numberOfProduct;

    @Min(value = 0, message = "total money must be >1")
    @JsonProperty("total_money")
    private Float totalMoney;

    private String color;
}
