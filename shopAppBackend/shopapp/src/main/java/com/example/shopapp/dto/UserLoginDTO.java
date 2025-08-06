package com.example.shopapp.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;
import org.springframework.web.bind.annotation.RestController;

@Data
public class UserLoginDTO {
    @NotBlank(message = "phone number can not be blank")
    @JsonProperty("phone_number")
    private String phoneNumber;

    @NotBlank(message = "password can not be blank")
    private String password;

}
