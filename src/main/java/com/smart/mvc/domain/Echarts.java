package com.smart.mvc.domain;

import java.util.List;

/**
 * Created by 占大帅 on 2017/8/5.
 */
public class Echarts {
    private List<String> time;
    private List<Integer> number;

    public List<String> getTime() {
        return time;
    }

    public void setTime(List<String> time) {
        this.time = time;
    }

    public List<Integer> getNumber() {
        return number;
    }

    public void setNumber(List<Integer> number) {
        this.number = number;
    }
}
