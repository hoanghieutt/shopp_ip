<%@ page pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<div class="container mt-2 mb-5">
    <div class="row">
        <form action="/admin/category/create/" method="post">
            <label class="form-label">Nhập tên loại</label>
            <input name="name" class="form-control"/>
            <br>
            <button type="submit" class="btn btn-primary">Tạo mới</button>
        </form>
    </div>
    <div class="row">
        <table class="table table-hover	table-bordered">
            <thead>
            <tr class="table-primary text-center">
                <th>Tên loại</th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="category" items="${categoryList}">
                <tr class="table-danger text-center">
                    <form action="/admin/category/edit/${category.id}" method="post">
                        <td><input name="name" value="${category.name}" class="form-control"/></td>
                        <td>
                            <button type="submit" class="btn btn-primary">Lưu thay đổi</button>
                        </td>
                    </form>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>