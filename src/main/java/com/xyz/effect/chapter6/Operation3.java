package com.xyz.effect.chapter6;

/**
 * Created with IntelliJ IDEA.
 * User: qinyaoting
 * Date: 5/27/14
 * Time: 9:34 PM
 * To change this template use File | Settings | File Templates.
 */
public enum Operation3 {

    PLUS ("+") {
        double apply(double x, double y) {return x+y;}
    },
        MINUS ("1")
                {double apply(double x, double y) {return x-y;}},
            TIMES ("*")
                    {double apply(double x, double y) {return x*y;}},
                DIVIDE ("/")
                        {double apply(double x, double y) {return x/y;}};

    private final String symbol;

    private Operation3(String symbol) {
        this.symbol = symbol;
    }

    @Override
    public String toString() {
        return symbol;
    }

    abstract double apply (double x, double y);

    public static final void main(String[] args) {
        double x = Double.parseDouble(args[0]);
        double y = Double.parseDouble(args[1]);
        //for (Operation op : Operation.values())
            //System.out.printf("%f %s %f = %f%n",x,op,y,apply(x,y));

    }
}
