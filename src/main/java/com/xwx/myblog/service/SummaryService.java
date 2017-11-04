package com.xwx.myblog.service;

import com.xwx.myblog.entity.Summary;

/**
 * Created by 73667 on 2017/10/30.
 */
public interface SummaryService {
    public void addSummary(Summary summary);
    public Summary getSummary(int aid);
}
