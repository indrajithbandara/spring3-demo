package com.xyz.design_pattern.chapter14.optimize3;

import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * User: vuclip123
 * Date: 6/20/14
 * Time: 3:30 PM
 * To change this template use File | Settings | File Templates.
 */
public class PlayingBasketballListener {

    public PlayingBasketballListener(){
        System.out.println("我正在打篮球 开始时间\t\t"+new Date());
    }
    public void stopPlayingBasketball(Date date){
        System.out.println("老师来了，快回到座位上，结束时间\t"+date);
    }
}
