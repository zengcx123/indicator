package com.oceansoft.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.oceansoft.service.InfoService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.*;

/**
 * Created by zeng on 2017/5/26.
 */
@Controller
@RequestMapping("info")
public class InfoController {

    @Resource
    private InfoService infoService;

    @RequestMapping("index")
    public ModelAndView index() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("info");
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping("message")
    public Object getMessage(String starttime, String endtime) {
        List<Map<String, Object>> mapList = infoService.getStatMessage(starttime, endtime, "1");
        return JSON.parse(JSONArray.toJSONString(mapList));
    }

}
