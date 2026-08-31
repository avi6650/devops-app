package com.devopsproject.devops_app;

import com.devopsproject.common.CompanyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    @GetMapping("/hello")
    public String hello() {
        return CompanyUtils.getEnvironmentMessage();
    }
}
