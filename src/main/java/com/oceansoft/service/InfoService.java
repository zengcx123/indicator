package com.oceansoft.service;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;
import javax.jws.soap.SOAPBinding.Style;
import java.util.List;
import java.util.Map;


public interface InfoService{

    List<Map<String, Object>> getStatMessage(String starttime, String endtime, String type);

}
