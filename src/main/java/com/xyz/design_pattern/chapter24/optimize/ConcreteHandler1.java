package com.xyz.design_pattern.chapter24.optimize;

/**
 * Created with IntelliJ IDEA.
 * User: vuclip123
 * Date: 5/21/14
 * Time: 11:26 AM
 * To change this template use File | Settings | File Templates.
 */
public class ConcreteHandler1 extends Handler {
    @Override
    public void handleRequest(int request) {

        // 0到10 处理该请求
        if (request >=0 && request < 10) {
            System.out.println(this.getClass().getName() + " 来处理 " + request);
        }

        // 转移到下一位
        else if (successor != null) {
            successor.handleRequest(request);
        }
    }
}
