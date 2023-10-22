package com.hworld.base.recaptcha;

import java.io.IOException;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class RecaptchaController {
	@ResponseBody
	@PostMapping(value = "VerifyRecaptcha")
	public ResponseEntity<?> VerifyRecaptcha(String recaptcha) throws IOException {
        VerifyRecaptcha.setSecretKey("6LfBzbAoAAAAAGTTIhGWmubV0OSbwpF4T74QXVZb");     
        return ResponseEntity.status(HttpStatus.OK).body(VerifyRecaptcha.verify(recaptcha));
    }
}
