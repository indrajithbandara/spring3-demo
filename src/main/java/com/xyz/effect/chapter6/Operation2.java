package com.xyz.effect.chapter6;

/**
 * Created with IntelliJ IDEA.
 * User: qinyaoting
 * Date: 5/27/14
 * Time: 9:34 PM
 * To change this template use File | Settings | File Templates.
 */
public enum Operation2 {

    PLUS {double apply(double x, double y) {return x+y;}},
        MINUS {double apply(double x, double y) {return x-y;}},
            TIMES {double apply(double x, double y) {return x*y;}},
                DIVIDE {double apply(double x, double y) {return x/y;}};

    abstract double apply (double x, double y);
}
