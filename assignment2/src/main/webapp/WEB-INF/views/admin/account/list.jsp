<%@ page pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<div class="container mt-2 mb-5">
    <div class="row">
        <%--@elvariable id="account" type=""--%>
        <form:form action="/admin/account/create" modelAttribute="account" method="post"
                   enctype="multipart/form-data">
            <div class="row">
                <div class="col-6">
                    <div class="mt-3 col-6">
                        <label for="formFileSm" class="form-label">Chọn ảnh</label>
                        <input name="fileImage" class="form-control form-control-sm" id="formFileSm" type="file"/>
                    </div>
                </div>
                <div class="col-6 mt-5">
                    <table class="table">
                        <tbody>
                        <tr>
                            <td>User Name</td>
                            <td>
                                <form:input path="userName" class="form-control"/>
                                <form:errors path="userName" cssStyle="color: red"/>
                            </td>
                        </tr>
                        <tr>
                            <td>Password:</td>
                            <td>
                                <form:input path="passWord" class="form-control"/>
                                <form:errors path="passWord" cssStyle="color: red"/>
                            </td>
                        </tr>
                        <tr>
                            <td>Fullname:</td>
                            <td>
                                <form:input path="fullName" class="form-control"/>
                                <form:errors path="fullName" cssStyle="color: red"/>
                            </td>
                        </tr>
                        <tr>
                            <td>Email:</td>
                            <td>
                                <form:input path="email" type="email" class="form-control"/>
                                <form:errors path="email" cssStyle="color: red"/>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <button type="submit" class="btn btn-primary">Tạo mới</button>
                </div>
            </div>
        </form:form>
    </div>
    <div class="row">
        <table class="table table-hover	table-bordered">
            <thead>
            <tr class="table-primary text-center">
                <th>User</th>
                <th>Password</th>
                <th>fullname</th>
                <th>email</th>
                <th>photo</th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="account" items="${accountList}">
                <tr class="table-danger text-center">
                    <td>${account.userName}</td>
                    <td>${account.passWord}</td>
                    <td>${account.fullName}</td>
                    <td>${account.email}</td>
                    <td><img src="/static/photos/${account.photo}" class="account-photo" alt=""/></td>
                    <td><a class="btn btn-primary" href="/admin/account/edit/${account.userName}">Sửa</a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<style>
    .account-photo {
        width: 100px;
        height: 100px;
    }
</style>