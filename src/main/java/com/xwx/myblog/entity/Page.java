package com.xwx.myblog.entity;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by 73667 on 2017/11/2.
 */
public class Page<T> {
    //每页数量
    private int pageSize = 5;
    //当前页数
    private int pageNo = 1;
    //总页数
    private int pageNum;
    private List<T> list = new ArrayList<T>();
    //总数
    private int count = list.size();
    public int getPageNum() {
        return count%pageSize == 0? (count/pageSize==0?1:count/pageSize):count/pageSize+1;
    }

    public void setPageNum(int pageNum) {
        this.pageNum = pageNum;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getCount() {
        return list.size();
    }

    public void setCount(int count) {
        this.count = count;
    }

    public int getPageNo() {
        return pageNo;
    }

    public void setPageNo(int pageNo) {
        this.pageNo = pageNo;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }
    public List<T> getData() {
        return list.subList((pageNo-1)*5,list.size()>5?pageNo*5-1:list.size());
    }
    public List<T> getFirstThree() {
        if(list.size()  > 2){
            return list.subList(0,3);
        }else {
            return list.subList(0,list.size()==0?0:list.size()-1);
        }

    }
}
