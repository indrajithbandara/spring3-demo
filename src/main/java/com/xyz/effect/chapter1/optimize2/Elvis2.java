package com.xyz.effect.chapter1.optimize2;

/**
 * Created with IntelliJ IDEA.
 * User: vuclip123
 * Date: 5/14/14
 * Time: 3:45 PM
 * To change this template use File | Settings | File Templates.
 */
public enum Elvis2 {



    INSTANCE;

    // 无偿的提供了序列话机制，绝对防止多次实例化
    // 单元素的枚举已经成了实现singleton的最佳方法

}
