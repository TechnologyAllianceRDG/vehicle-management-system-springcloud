package com.ycx.lend.web;

import com.ycx.lend.exception.ParamException;
import com.ycx.lend.pojo.AuditEnd;
import com.dra.pojo.msg.FormatData;
import com.ycx.lend.service.AuditEndService;
import com.ycx.lend.utils.EmptyChecker;
import com.ycx.lend.utils.WebCheck;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.text.ParseException;
import java.util.List;

/**
 * @Author ycx
 * @Date 2022/1/29 20:43
 * @Description
 */
@RestController
@RequestMapping("/auditEnd")
public class AuditEndController {
    @Autowired
    AuditEndService auditEndService;

    /**
     * 添加
     * 单个审核分配
     *
     * @param applicationId 申请单号
     * @return 操作成功信息
     * @description 手动分配单个审核单
     */
    @RequestMapping("/allotOne.do")
    public FormatData<Object> allotAudit(@RequestParam("applicationId") String applicationId) throws ParamException {
        int i = auditEndService.allotOneAuditEnd(applicationId);
        WebCheck.isError(i);
        return new FormatData<>(i);
    }


    /**
     * 删除
     *
     * @param auditId 审核单号
     * @return 操作成功信息
     * @description 删除终审单
     */
    @RequestMapping("/del.do")
    public FormatData<Object> delAudit(@RequestParam("auditId") String auditId) throws ParamException {
        int i = auditEndService.delAuditEnd(auditId);
        WebCheck.isError(i);
        return new FormatData<>(i);
    }

    /**
     * 修改
     *
     * @param auditId   申请单号
     * @param auditorId 审核员编号
     * @return 操作成功信息
     * @description 手动重新分配审核，修改审核表对应的审核员
     */
    @RequestMapping("/reassign.do")
    public FormatData<Object> reassign(@RequestParam("auditId") String auditId,
                                       @RequestParam("auditorId") String auditorId) throws ParamException {
        int i = auditEndService.updateAuditEnd(auditId, auditorId);
        WebCheck.isError(i);
        return new FormatData<>(i);
    }

    /**
     * 修改
     *
     * @param auditId    申请单号
     * @param status     状态码
     * @param changeTime 当前时间
     * @return 操作成功信息
     * @description 修改审核单审核状态，同步更新申请表中审核状态
     */
    @RequestMapping("/changeStatus.do")
    public FormatData<Object> changeStatus(@RequestParam("auditId") String auditId,
                                           @RequestParam("status") Integer status,
                                           @RequestParam("changeTime") String changeTime) throws ParamException, ParseException {
        int i = auditEndService.changeStatus(auditId, status, changeTime);
        if (i==-11)
            throw new ParamException("车辆不是闲置状态", 441);
        WebCheck.isError(i);
        return new FormatData<>(i);
    }

    /**
     * 查询
     *
     * @param pageNum  页数
     * @param pageSize 每页大小
     * @return 全部审核表
     * @description 查询全部审核表
     */
    @RequestMapping("/queryAll.do")
    public FormatData<Object> queryAllAudit(@RequestParam("pageNum") int pageNum,
                                            @RequestParam("pageSize") int pageSize,
                                            @RequestParam("auditorId") String auditorId) throws ParamException {
        List<AuditEnd> auditEnds = auditEndService.queryAllAuditEnd(pageNum, pageSize,auditorId);
        if (EmptyChecker.notEmpty(auditEnds)) {
            Integer auditStatus = auditEnds.get(0).getEndStatus();
            if (auditEnds.get(0).getAuditId() == null) {
                WebCheck.isError(auditStatus);
            }
        }
        return new FormatData<>(auditEnds);
    }

    /**
     * 查询
     *
     * @param auditorId 审核员编号
     * @param date      当前时间
     * @return 审核员对应的审核表
     * @description 审核员查询自己的所有审核单，将状态置为 正在审核
     */
    @RequestMapping("/getAudit.do")
    public FormatData<Object> getAudit(@RequestParam("auditorId") String auditorId,
                                       @RequestParam("date") String date) throws ParamException, ParseException {
        List<AuditEnd> auditEnd = auditEndService.getAuditEnd(auditorId, date);
        if (EmptyChecker.notEmpty(auditEnd)) {
            Integer auditStatus = auditEnd.get(0).getEndStatus();
            if (auditEnd.get(0).getAuditId() == null) {
                WebCheck.isError(auditStatus);
            }
        }
        return new FormatData<>(auditEnd);
    }

}
