package com.oceansoft.service.impl;

import com.oceansoft.persistence.InfoMapper;
import com.oceansoft.service.InfoService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class InfoServiceImpl implements InfoService {

    @Resource
    private InfoMapper infoMapper;

    @Override
    public List<Map<String, Object>> getStatMessage(String starttime,String endtime,String type) {
//        List<Map<String, Object>> mapList = infoMapper.getStatMessage(starttime, endtime, type);
        List<Map<String, Object>> mapList = infoMapper.getStatMessage2(starttime, endtime, type);
        return mapList;
    }
}
