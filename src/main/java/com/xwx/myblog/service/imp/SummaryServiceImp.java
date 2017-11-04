package com.xwx.myblog.service.imp;

import com.xwx.myblog.dao.SummaryDao;
import com.xwx.myblog.entity.Summary;
import com.xwx.myblog.service.SummaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 73667 on 2017/10/30.
 */
@Service
public class SummaryServiceImp implements SummaryService{
    @Autowired
    private SummaryDao dao;
    public void addSummary(Summary summary) {
        dao.addSummary(summary);
    }

    public Summary getSummary(int aid) {
        return dao.getSummary(aid);
    }
}
