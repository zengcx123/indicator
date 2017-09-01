package com.oceansoft.service.impl;

import com.oceansoft.persistence.AnalyseMapper;
import com.oceansoft.service.AnalyseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.jws.WebParam;
import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;
import javax.jws.soap.SOAPBinding.Style;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
@WebService(targetNamespace = "http://10.44.0.135:3220/indicator/webservice/analyse")
//@SOAPBinding(style = Style.RPC)
public class AnalyseServiceImpl implements AnalyseService {
    @Resource
    private AnalyseMapper analyseMapper;

    @Override
    public String getStatMessage(String starttime,String endtime,String type) {
        System.out.println("=======================查询开始==========================");
        List<Map<String, Object>> mapList = new ArrayList<>();
        try{
            mapList = analyseMapper.getStatMessage(starttime, endtime, type);
        }catch (Exception e){
            e.printStackTrace();
        }
        String flag = "1";
        if (mapList != null) {
            flag = "0";
        }
        Map<String, Object> map = mapList.get(0);
        String xml = "<RESULT>" +
                "<RESULTVALUE>" + flag + "</RESULTVALUE>" +
                "<REASON></REASON><STAT>" +
                "<PATROLREPORTNUM>" + map.get("PATROLREPORTNUM") + "</PATROLREPORTNUM>" +
                "<VALIDPATROLREPORTNUM>" + map.get("VALIDPATROLREPORTNUM") + "</VALIDPATROLREPORTNUM>" +
                "<PUBLICREPORTNUM>" + map.get("PUBLICREPORTNUM") + "</PUBLICREPORTNUM>" +
                "<VALIDPUBLICREPORTNUM>" + map.get("VALIDPUBLICREPORTNUM") + "</VALIDPUBLICREPORTNUM>" +
                "<VIDEOREPORTNUM>" + map.get("VIDEOREPORTNUM") + "</VIDEOREPORTNUM>" +
                "<VALIDVIDEOREPORTNUM>" + map.get("VALIDVIDEOREPORTNUM") + "</VALIDVIDEOREPORTNUM>" +
                "<TOTALREPORTNUM>" + map.get("TOTALREPORTNUM") + "</TOTALREPORTNUM>" +
                "<TOTALVALIDREPORTNUM>" + map.get("TOTALVALIDREPORTNUM") + "</TOTALVALIDREPORTNUM>" +
                "<INSTNUM>" + map.get("INSTNUM") + "</INSTNUM>" +
                "<INTIMEINSTNUM>" + map.get("INTIMEINSTNUM") + "</INTIMEINSTNUM>" +
                "<INSTNUM2>" + map.get("INSTNUM2") + "</INSTNUM2>" +
                "<INTIMEINSTNUM2>" + map.get("INTIMEINSTNUM2") + "</INTIMEINSTNUM2>" +
                "<INSTNUM3>" + map.get("INSTNUM3") + "</INSTNUM3>" +
                "<INTIMEINSTNUM3>" + map.get("INTIMEINSTNUM3") + "</INTIMEINSTNUM3>" +
                "<TOTALINSTNUM>" + map.get("TOTALINSTNUM") + "</TOTALINSTNUM>" +
                "<TOTALINTIMEINSTNUM>" + map.get("TOTALINTIMEINSTNUM") + "</TOTALINTIMEINSTNUM>" +
                "<NEEDDISPATCHNUM>" + map.get("NEEDDISPATCHNUM") + "</NEEDDISPATCHNUM>" +
                "<DISPATCHNUM>" + map.get("DISPATCHNUM") + "</DISPATCHNUM>" +
                "<ACCURDISPATCHNUM>" + map.get("ACCURDISPATCHNUM") + "</ACCURDISPATCHNUM>" +
                "<WRONGDISPATCHNUM>" + map.get("WRONGDISPATCHNUM") + "</WRONGDISPATCHNUM>" +
                "<INTIMEDISPACHNUM>" + map.get("INTIMEDISPACHNUM") + "</INTIMEDISPACHNUM>" +
                "<NEEDDISPATCHNUM2>" + map.get("NEEDDISPATCHNUM2") + "</NEEDDISPATCHNUM2>" +
                "<DISPATCHNUM2>" + map.get("DISPATCHNUM2") + "</DISPATCHNUM2>" +
                "<ACCURDISPATCHNUM2>" + map.get("ACCURDISPATCHNUM2") + "</ACCURDISPATCHNUM2>" +
                "<WRONGDISPATCHNUM2>" + map.get("WRONGDISPATCHNUM2") + "</WRONGDISPATCHNUM2>" +
                "<INTIMEDISPACHNUM2>" + map.get("INTIMEDISPACHNUM2") + "</INTIMEDISPACHNUM2>" +
                "<NEEDDISPATCHNUM3>" + map.get("NEEDDISPATCHNUM3") + "</NEEDDISPATCHNUM3>" +
                "<DISPATCHNUM3>" + map.get("DISPATCHNUM3") + "</DISPATCHNUM3>" +
                "<ACCURDISPATCHNUM3>" + map.get("ACCURDISPATCHNUM3") + "</ACCURDISPATCHNUM3>" +
                "<WRONGDISPATCHNUM3>" + map.get("WRONGDISPATCHNUM3") + "</WRONGDISPATCHNUM3>" +
                "<INTIMEDISPACHNUM3>" + map.get("INTIMEDISPACHNUM3") + "</INTIMEDISPACHNUM3>" +
                "<TOTALNEEDDISPATCHNUM>" + map.get("TOTALNEEDDISPATCHNUM") + "</TOTALNEEDDISPATCHNUM>" +
                "<TOTALDISPATCHNUM>" + map.get("TOTALDISPATCHNUM") + "</TOTALDISPATCHNUM>" +
                "<TOTALACCURDISPATCHNUM>" + map.get("TOTALACCURDISPATCHNUM") + "</TOTALACCURDISPATCHNUM>" +
                "<TOTALWRONGDISPATCHNUM>" + map.get("TOTALWRONGDISPATCHNUM") + "</TOTALWRONGDISPATCHNUM>" +
                "<TOTALINTIMEDISPACHNUM>" + map.get("TOTALINTIMEDISPACHNUM") + "</TOTALINTIMEDISPACHNUM>" +
                "<NEEDDISPOSENUM>" + map.get("NEEDDISPOSENUM") + "</NEEDDISPOSENUM>" +
                "<DISPOSENUM>" + map.get("DISPOSENUM") + "</DISPOSENUM>" +
                "<INTIMEDISPOSENUM>" + map.get("INTIMEDISPOSENUM") + "</INTIMEDISPOSENUM>" +
                "<NEEDDISPOSENUM2>" + map.get("NEEDDISPOSENUM2") + "</NEEDDISPOSENUM2>" +
                "<DISPOSENUM2>" + map.get("DISPOSENUM2") + "</DISPOSENUM2>" +
                "<INTIMEDISPOSENUM2>" + map.get("INTIMEDISPOSENUM2") + "</INTIMEDISPOSENUM2>" +
                "<NEEDDISPOSENUM3>" + map.get("NEEDDISPOSENUM3") + "</NEEDDISPOSENUM3>" +
                "<DISPOSENUM3>" + map.get("DISPOSENUM3") + "</DISPOSENUM3>" +
                "<INTIMEDISPOSENUM3>" + map.get("INTIMEDISPOSENUM3") + "</INTIMEDISPOSENUM3>" +
                "<TOTALNEEDDISPOSENUM>" + map.get("TOTALNEEDDISPOSENUM") + "</TOTALNEEDDISPOSENUM>" +
                "<TOTALDISPOSENUM>" + map.get("TOTALDISPOSENUM") + "</TOTALDISPOSENUM>" +
                "<TOTALINTIMEDISPOSENUM>" + map.get("TOTALINTIMEDISPOSENUM") + "</TOTALINTIMEDISPOSENUM>" +
                "<NEEDCHECKNUM>" + map.get("NEEDCHECKNUM") + "</NEEDCHECKNUM>" +
                "<CHECKNUM>" + map.get("CHECKNUM") + "</CHECKNUM>" +
                "<INTIMECHECKNUM>" + map.get("INTIMECHECKNUM") + "</INTIMECHECKNUM>" +
                "<NEEDCHECKNUM2>" + map.get("NEEDCHECKNUM2") + "</NEEDCHECKNUM2>" +
                "<CHECKNUM2>" + map.get("CHECKNUM2") + "</CHECKNUM2>" +
                "<INTIMECHECKNUM2>" + map.get("INTIMECHECKNUM2") + "</INTIMECHECKNUM2>" +
                "<NEEDCHECKNUM3>" + map.get("NEEDCHECKNUM3") + "</NEEDCHECKNUM3>" +
                "<CHECKNUM3>" + map.get("CHECKNUM3") + "</CHECKNUM3>" +
                "<INTIMECHECKNUM3>" + map.get("INTIMECHECKNUM3") + "</INTIMECHECKNUM3>" +
                "<TOTALNEEDCHECKNUM>" + map.get("TOTALNEEDCHECKNUM") + "</TOTALNEEDCHECKNUM>" +
                "<TOTALCHECKNUM>" + map.get("TOTALCHECKNUM") + "</TOTALCHECKNUM>" +
                "<TOTALINTIMECHECKNUM>" + map.get("TOTALINTIMECHECKNUM") + "</TOTALINTIMECHECKNUM>" +
                "<NEEDARCHIVENUM>" + map.get("NEEDARCHIVENUM") + "</NEEDARCHIVENUM>" +
                "<ARCHIVENUM>" + map.get("ARCHIVENUM") + "</ARCHIVENUM>" +
                "<INTIMEARCHIVENUM>" + map.get("INTIMEARCHIVENUM") + "</INTIMEARCHIVENUM>" +
                "<NEEDARCHIVENUM2>" + map.get("NEEDARCHIVENUM2") + "</NEEDARCHIVENUM2>" +
                "<ARCHIVENUM2>" + map.get("ARCHIVENUM2") + "</ARCHIVENUM2>" +
                "<INTIMEARCHIVENUM2>" + map.get("INTIMEARCHIVENUM2") + "</INTIMEARCHIVENUM2>" +
                "<NEEDARCHIVENUM3>" + map.get("NEEDARCHIVENUM3") + "</NEEDARCHIVENUM3>" +
                "<ARCHIVENUM3>" + map.get("ARCHIVENUM3") + "</ARCHIVENUM3>" +
                "<INTIMEARCHIVENUM3>" + map.get("INTIMEARCHIVENUM3") + "</INTIMEARCHIVENUM3>" +
                "<TOTALNEEDARCHIVENUM>" + map.get("TOTALNEEDARCHIVENUM") + "</TOTALNEEDARCHIVENUM>" +
                "<TOTALARCHIVENUM>" + map.get("TOTALARCHIVENUM") + "</TOTALARCHIVENUM>" +
                "<TOTALINTIMEARCHIVENUM>" + map.get("TOTALINTIMEARCHIVENUM") + "</TOTALINTIMEARCHIVENUM>" +
                "<DELAYNUM>" + map.get("DELAYNUM") + "</DELAYNUM>" +
                "<HUNGNUM>" + map.get("HUNGNUM") + "</HUNGNUM>" +
                "<TWICEDONENUM>" + map.get("TWICEDONENUM") + "</TWICEDONENUM>" +
                "<DELAYNUM2>" + map.get("DELAYNUM2") + "</DELAYNUM2>" +
                "<HUNGNUM2>" + map.get("HUNGNUM2") + "</HUNGNUM2>" +
                "<TWICEDONENUM2>" + map.get("TWICEDONENUM2") + "</TWICEDONENUM2>" +
                "<DELAYNUM3>" + map.get("DELAYNUM3") + "</DELAYNUM3>" +
                "<HUNGNUM3>" + map.get("HUNGNUM3") + "</HUNGNUM3>" +
                "<TWICEDONENUM3>" + map.get("TWICEDONENUM3") + "</TWICEDONENUM3>" +
                "<TOTALDELAYNUM>" + map.get("TOTALDELAYNUM") + "</TOTALDELAYNUM>" +
                "<TOTALHUNGNUM>" + map.get("TOTALHUNGNUM") + "</TOTALHUNGNUM>" +
                "<TOTALTWICEDONENUM>" + map.get("TOTALTWICEDONENUM") + "</TOTALTWICEDONENUM>" +
                "<RATE1>" + map.get("RATE1") + "</RATE1>" +
                "<RATE2>" + map.get("RATE2") + "</RATE2>" +
                "<RATE3>" + map.get("RATE3") + "</RATE3>" +
                "<RATE4>" + map.get("RATE4") + "</RATE4>" +
                "<RATE5>" + map.get("RATE5") + "</RATE5>" +
                "<RATE6>" + map.get("RATE6") + "</RATE6>" +
                "<RATE7>" + map.get("RATE7") + "</RATE7>" +
                "<RATE8>" + map.get("RATE8") + "</RATE8>" +
                "<RATE9>" + map.get("RATE9") + "</RATE9>" +
                "<RATE10>" + map.get("RATE10") + "</RATE10>" +
                "<RATE11>" + map.get("RATE11") + "</RATE11>" +
                "<RATE12>" + map.get("RATE12") + "</RATE12>" +
                "<RATE13>" + map.get("RATE13") + "</RATE13>" +
                "<RATE14>" + map.get("RATE14") + "</RATE14>" +
                "<RATE15>" + map.get("RATE15") + "</RATE15>" +
                "<RATE16>" + map.get("RATE16") + "</RATE16>" +
                "<RATE17>" + map.get("RATE17") + "</RATE17>" +
                "<RATE18>" + map.get("RATE18") + "</RATE18>" +
                "<RATE19>" + map.get("RATE19") + "</RATE19>" +
                "<RATE20>" + map.get("RATE20") + "</RATE20>" +
                "<RATE21>" + map.get("RATE21") + "</RATE21>" +
                "<RATE22>" + map.get("RATE22") + "</RATE22>" +
                "<TOP1NAME>" + map.get("TOP1NAME") + "</TOP1NAME>" +
                "<TOP1RATE>" + map.get("TOP1RATE") + "</TOP1RATE>" +
                "<TOP2NAME>" + map.get("TOP2NAME") + "</TOP2NAME>" +
                "<TOP2RATE>" + map.get("TOP2RATE") + "</TOP2RATE>" +
                "<TOP3NAME>" + map.get("TOP3NAME") + "</TOP3NAME>" +
                "<TOP3RATE>" + map.get("TOP3RATE") + "</TOP3RATE>" +
                "<TOP4NAME>" + map.get("TOP4NAME") + "</TOP4NAME>" +
                "<TOP4RATE>" + map.get("TOP4RATE") + "</TOP4RATE>" +
                "<TOP5NAME>" + map.get("TOP5NAME") + "</TOP5NAME>" +
                "<TOP5RATE>" + map.get("TOP5RATE") + "</TOP5RATE>" +
                "<TOP6NAME>" + map.get("TOP6NAME") + "</TOP6NAME>" +
                "<TOP6RATE>" + map.get("TOP6RATE") + "</TOP6RATE>" +
                "</STAT>" +
                "</RESULT>";
        System.out.println("xml:"+xml);
        System.out.println("=======================查询结束==========================");
        return xml;
    }
}
