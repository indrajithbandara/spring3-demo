package com.xyz.effect.chapter5.num25;

import java.util.ArrayList;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: qinyaoting
 * Date: 6/15/14
 * Time: 8:07 PM
 * To change this template use File | Settings | File Templates.
 */
public class Test {

    // 列表优先于数组

    // 数组是协变的 如果Sub是Super的子类型 那么Sub[] 就是 Super[]的子类

    // 泛型是不可变的：对于任意两个类型 Type1 Type2 List<Type1>既不是 List<Type2>的子类也不是超类、

    public static void main(String[] args) {
        Object[] objectArray = new Long[1];
        objectArray[0] = "I don't fit in";

        //运行时会发生异常

        //List<Object> ol = new ArrayList<Long>();  Incompatible types
        //ol.add("I don't fit in");

        //编译就不通过
    }



}
