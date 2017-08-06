package com.smart.mvc.controller;

import com.smart.mvc.domain.Echarts;
import com.smart.mvc.domain.MyChannel;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Arrays;
import java.util.List;

/**
 * Created by 占大帅 on 2017/8/5.
 */
@Controller
public class HelloController {
    @RequestMapping("/index")
    public String hello() {
        return "index";
    }

    @RequestMapping(value = "/jsontest", produces = "application/json;charset=UTF-8")//接收为json数据，自动转化
    public @ResponseBody Echarts json(@RequestBody MyChannel myChannel) {
        System.out.println(myChannel);
        Echarts echarts = new Echarts();
        List<String> time = Arrays.asList("7-2", "7-3", "7-4", "7-5", "7-6","7-7","7-8");
        List<Integer> number = null;
        if ("xiaomi".equals(myChannel.getChannel())) {//这里我们根据不同的前台数据，给出不同的注册量
            number = Arrays.asList(2, 4, 6, 2, 8, 8, 4, 8, 2, 4, 6, 4, 2, 1, 9);
        } else if ("meizu".equals(myChannel.getChannel())) {
            number = Arrays.asList(3, 5, 6, 12, 3, 8, 2, 9, 1, 5, 9, 5, 4, 6, 8);
        } else if ("huawei".equals(myChannel.getChannel())) {
            number = Arrays.asList(2, 5, 1, 3, 6, 4, 2, 5, 5, 8, 1, 6, 23, 1, 4);
        } else {
            number = Arrays.asList(4, 8, 2, 4, 6, 3, 1, 9, 5, 2, 5, 6, 3, 4, 2);
        }
        echarts.setTime(time);
        echarts.setNumber(number);
        return echarts;
    }

    @RequestMapping("/echarts")
    public String echarts() {
        return "echarts";
    }

    @RequestMapping("/one")
    public String toOne() {
        return "one";
    }
}















