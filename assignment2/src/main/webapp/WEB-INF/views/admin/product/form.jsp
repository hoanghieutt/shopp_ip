<%@ page pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<div class="container mt-5 mb-5">
    <%--@elvariable id="product" type=""--%>
    <form:form action="/admin/product/update" modelAttribute="product" method="post"
               enctype="multipart/form-data">
        <input type="hidden" name="id" value="${product.id}"/>
        <input type="hidden" name="image" value="${product.image}"/>
        <div class="row">
            <div class="col-6">
                <img alt="" class="product-detail-image" src="/static/images/${product.image}"/>
                <div class="mt-3 col-6">
                    <label for="formFileSm" class="form-label">Chọn ảnh</label>
                    <input name="fileImage" class="form-control form-control-sm" id="formFileSm" type="file"/>
                </div>
            </div>
            <div class="col-6 mt-5">
                <table class="table">
                    <tbody>
                    <tr>
                        <td>Tên sản phẩm:</td>
                        <td><form:input path="name" class="form-control"/>
                            <form:errors path="name" cssStyle="color: red"/>
                        </td>
                    </tr>
                    <tr>
                        <td>Loại sản phẩm:</td>
                        <td>
                            <form:select path="category.id" class="form-select">
                                <form:options itemLabel="name" itemValue="id" items="${categoryList}"/>
                            </form:select>
                        </td>
                    </tr>
                    <tr>
                        <td>Giá bán:</td>
                        <td>
                            <div class="input-group mb-3">
                                <form:input path="price" class="form-control"/>
                                <span class="input-group-text">VND</span>
                            </div>
                            <form:errors path="price" cssStyle="color: red"/>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <br/>
                <a class="btn btn-secondary" href="/admin/product/index">Quay lại</a>
                <button type="submit" class="btn btn-primary">Lưu cập nhật</button>
            </div>
        </div>
    </form:form>
</div>

<style>
    .product-detail-image {
        max-width: 100%;
        max-height: 400px;
    }
</style>