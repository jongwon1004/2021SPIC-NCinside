package com.ecc.ncinside.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeContorller {
    @RequestMapping("/")
    public String main() {
        return "index";
    }
}
