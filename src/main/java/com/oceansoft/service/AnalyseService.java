package com.oceansoft.service;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;
import javax.jws.soap.SOAPBinding.Style;
import java.util.List;
import java.util.Map;

@WebService(targetNamespace = "http://10.44.0.135:3220/indicator/webservice/analyse")
//@SOAPBinding(style = Style.RPC)
public interface AnalyseService {

    @WebResult(name = "result")
    String getStatMessage(@WebParam(name = "starttime") String starttime, @WebParam(name = "endtime") String endtime, @WebParam(name = "type") String type);

}
