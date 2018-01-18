package com.jk.controller;

import com.jk.pojo.Tree;
import com.jk.service.GlService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import java.util.List;


@Controller
@RequestMapping("gl")
@EnableAutoConfiguration
public class GlController {

    @Autowired
    private GlService glService;


    @ResponseBody
    @RequestMapping("queryTree")
    public List<Tree> queryTree(){
        List<Tree> list= glService.queryTree();
        return list;
    }

}
