<%@ page pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<div class="container mt-5 mb-5">
    <div class="row">
        <%--@elvariable id="account" type=""--%>
        <form:form action="/admin/account/update" modelAttribute="account" method="post"
                   enctype="multipart/form-data">
            <input type="hidden" name="userName" value="${account.userName}"/>
            <input type="hidden" name="photo" value="${account.photo}"/>
            <div class="row">
                <div class="col-6">
                    <img alt="" class="product-detail-image" src="/static/photos/${account.photo}"/>
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
                                <b>${account.userName}</b>
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
                    <a class="btn btn-secondary" href="/admin/account/index">Quay lại</a>
                    <button type="submit" class="btn btn-primary">Lưu cập nhật</button>
                </div>
            </div>
        </form:form>
    </div>
</div>

<style>
    .product-detail-image {
        width: 400px;
        height: 500px;
    }
</style>