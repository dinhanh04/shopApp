package com.example.shopapp.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.validation.constraints.Size;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ProductImageDTO {
    @JsonProperty("product_id")
    private Long productId;

    @Size(min = 5, max = 200, message = "image's name")
    @JsonProperty("image_url")
    private String imageUrl;
}
