package com.xwx.myblog.dao;

import com.xwx.myblog.entity.Summary;

/**
 * Created by 73667 on 2017/10/30.
 */
public interface SummaryDao {
    public void addSummary(Summary summary);
    public Summary getSummary(int aid);
}
