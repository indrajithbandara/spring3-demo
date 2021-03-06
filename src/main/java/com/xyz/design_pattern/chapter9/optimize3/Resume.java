package com.xyz.design_pattern.chapter9.optimize3;

/**
 * Created with IntelliJ IDEA.
 * User: vuclip123
 * Date: 6/4/14
 * Time: 11:04 AM
 * To change this template use File | Settings | File Templates.
 */
public class Resume implements Cloneable {

    private String name;
    private String sex;
    private String age;

    private WorkExperience work;

    public Resume(String name) {
        this.name = name;
        work = new WorkExperience();
    }

    public void setPersonalInfo(String sex, String age) {
        this.sex = sex;
        this.age = age;
    }

    public void setWorkExperience(String workDate, String company) {
        work.setWorkDate(workDate);
        work.setCompany(company);
    }

    public void display() {

        System.out.printf("个人信息 %s %s %s%n",name,sex,age);
        System.out.printf("工作经历 %s %s%n", work.getWorkDate(), work.getCompany());
    }

    @Override
    protected Object clone() throws CloneNotSupportedException {
        return super.clone();    //To change body of overridden methods use File | Settings | File Templates.
    }
}
