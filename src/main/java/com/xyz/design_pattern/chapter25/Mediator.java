package com.xyz.design_pattern.chapter25;

/**
 * Created with IntelliJ IDEA.
 * User: vuclip123
 * Date: 5/21/14
 * Time: 12:01 PM
 * To change this template use File | Settings | File Templates.
 */
abstract class Mediator {

    // [ˈmidiˌetɚ]  调停者；调解人；传递者；中介物

    public abstract void send(String message, Colleague colleague);
}
