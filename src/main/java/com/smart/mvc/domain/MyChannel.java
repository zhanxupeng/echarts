package com.smart.mvc.domain;

/**
 * Created by 占大帅 on 2017/8/5.
 */
public class MyChannel {
    private String channel;
    private String time;

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getChannel() {
        return channel;
    }

    public void setChannel(String channel) {
        this.channel = channel;
    }
    @Override
    public String toString(){
        return channel+","+time;
    }
}
