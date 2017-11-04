package com.xwx.myblog.utils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by 73667 on 2017/10/31.
 */
public class StringUtils {
    public static String getContent(String md) {
        String regex = "#";
        String result = md.replaceAll(regex,"").length()>120? md.replaceAll(regex,"").substring(0,120):md.replaceAll(regex,"");
        return result;
    }
    public static String getImgUrl(String md) {
        String reg = "!\\[.*\\]\\(.*\\)";
        Pattern pattern = Pattern.compile(reg);
        Matcher matcher = pattern.matcher(md);
        String preUrl = null;
        String url = null;
        if(matcher.find()) {
            preUrl = matcher.group();
            int index1 = preUrl.indexOf("(");
            int index2 = preUrl.indexOf(")");
            url = preUrl.substring(index1+1,index2);
        }else {
            url = "https://img.abiosgaming.com/competitors/Douyu-TV-Logo.png";
        }
        return url;
    }

}
