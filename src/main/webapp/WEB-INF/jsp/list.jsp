<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>员工列表</title>
    <%
        //服务器路径（http://localhost:3306/项目名）
        pageContext.setAttribute("APP_PATH",request.getContextPath());
    %>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <script type="text/javascript" src="${APP_PATH}/statics/js/jquery-1.8.3.min.js"></script>
    <link rel="stylesheet" href="${APP_PATH}/statics/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${APP_PATH}/statics/bootstrap-3.3.7-dist/js/bootstrap.min.css">
</head>
<body>
<%--此页面进行传参，页面框架已定--%>
<%--搭建显示页面--%>
<div class="container">
    <%--标题--%>
    <div class="row"></div>
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
        <%--按钮--%>
    <div class="row"></div>
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary">新增</button>
            <button class="btn btn-danger">删除</button>
        </div>
        <%--显示表格数据--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover">
                <tr>
                    <th>#</th>
                    <th>emoName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>deptName</th>
                    <th>操作</th>

                </tr>
                <c:forEach items="${pageInfo.list}" var="emp">
                    <tr>
                        <th>${emp.empId}</th>
                        <th>${emp.empName}</th>
                        <th>${emp.gender=="M"? "男": "女"}</th>
                        <th>${emp.email}</th>
                        <th>${emp.tnlDept.deptName}</th>
                        <th>
                            <button class="btn btn-primary btn-sm">
                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                编辑
                            </button>
                            <button class="btn btn-danger btn-sm">
                                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                删除
                            </button>
                        </th>
                    </tr>

                </c:forEach>

               
            </table>
        </div>
    </div>
        <%--显示分页信息--%>
    <div class="row">
        <%--分页信息--%>
        <div class="col-md-6">
            第${pageInfo.pageNum}页/共${pageInfo.pages}页 &nbsp;&nbsp;当前总记录数（${pageInfo.total}）页
        </div>
        <div class="col-md-6">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li><a href="${APP_PATH}/emps?pn=1">首页</a></li>
                    <c:if test="${pageInfo.hasPreviousPage}">
                        <li>
                            <a href="${APP_PATH}/emps?pn=${pageInfo.pageNum-1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <c:forEach items="${pageInfo.navigatepageNums}" var="page_Num">
                        <c:if test="${page_Num == pageInfo.pageNum }">
                            <li class="active"><a href="#">${page_Num}</a></li>
                        </c:if>
                        <c:if test="${page_Num != pageInfo.pageNum}">
                            <li><a href="${APP_PATH}/emps?pn=${page_Num}">${page_Num}</a></li>
                        </c:if>
                    </c:forEach>
                    <c:if test="${pageInfo.hasNextPage}">
                        <li>
                            <a href="${APP_PATH}/emps?pn=${pageInfo.pageNum+1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>

                    <li><a href="${APP_PATH}/emps?pn=${pageInfo.pages}">末页</a></li>
                </ul>
            </nav>
        </div>
    </div>

</div>
</body>
</html>
