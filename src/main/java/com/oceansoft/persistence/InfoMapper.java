package com.oceansoft.persistence;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface InfoMapper{

    List<Map<String,Object>> getStatMessage(@Param("starttime") String starttime, @Param("endtime") String endtime, @Param("type") String type);

    List<Map<String,Object>> getStatMessage2(@Param("starttime") String starttime, @Param("endtime") String endtime, @Param("type") String type);

}
