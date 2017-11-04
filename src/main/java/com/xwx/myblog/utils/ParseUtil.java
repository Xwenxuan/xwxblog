package com.xwx.myblog.utils;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

/**
 * Created by 73667 on 2017/10/31.
 */
public class ParseUtil {
    public static String getNote(String html) {
        Document doc = Jsoup.parse(html);
        Elements links = doc.select("*");
        StringBuffer sb = new StringBuffer();
        int i = 0;
        for(Element link:links) {
            if(i == 4) {
                break;
            }
            sb.append(link.text());
            i++;
        }
        return sb.toString();
    }
    public static String getFirstImgAddr(String html) {
        Document doc = Jsoup.parse(html);
        String address = doc.select("img").first().attr("src");
        return address;
    }
}
