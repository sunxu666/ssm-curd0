package com.ssm.web;

import com.ssm.entity.Msg;
import com.ssm.entity.TnlDept;
import com.ssm.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 功能描述:
 *
 * @param: 员工-处理员工部门
 * @return:
 * @auther: sunxu
 * @date: 2017-05-10 10:31
 */
@Controller
public class DepartmentController {
    @Autowired
    private DepartmentService departmentService;

    /**
     * 在使用@RequestMapping后，返回值通常解析为跳转路径。加上@responsebody后，返回结果直接写入HTTP response body中，
     * 不会被解析为跳转路径。比如异步请求，希望响应的结果是json数据，那么加上@responsebody后，就会直接返回json数据。
     * @return
     */
    @RequestMapping(value = "/depts")
    @ResponseBody
    public Msg getDepts(){
        List<TnlDept> list = departmentService.getAll();

        return Msg.success().add("depts",list);
    }

}













