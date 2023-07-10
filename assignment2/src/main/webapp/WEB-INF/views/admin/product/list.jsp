<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<div class="container mt-2 mb-5">
    <div class="row">
        <%--@elvariable id="product" type=""--%>
        <form:form action="/admin/product/create" modelAttribute="product" method="post"
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
                            <td>Tên sản phẩm:</td>
                            <td>
                                <form:input path="name" class="form-control"/>
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
                                    <form:input path="price" type="number" min="0" class="form-control"/>
                                    <span class="input-group-text">VND</span>
                                </div>
                                <form:errors path="price" cssStyle="color: red"/>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <button type="submit" class="btn btn-primary">Tạo mới</button>
                </div>
            </div>
        </form:form>
    </div>
    <hr>
    <div class="row">
        <%--product List--%>
        <div class="col-12">
            <ul class="list-unstyled row">
                <c:forEach var="product" items="${productList}">
                    <li class="list-item col-sm-4 mt-3">
                        <div class="item-container d-flex justify-content-center">
                            <a href="/admin/product/edit/${product.id}" class="product-item">
                                <img src="/static/images/${product.image}" class="product-image" alt=""/>
                                <div class="item-info">
                                    <div>
                                        <span class="product-name">${product.name}</span>
                                    </div>
                                    <div>
                                        <span class="price-title">Giá bán :</span>
                                        <span class="price">${product.price} ₫</span>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
</div>
<style>
    .product-image {
        max-width: 95%;
        max-height: 200px;
    }

    .price-title {
        font-style: italic;
        font-size: 14px;
    }

    .price {
        font-size: 16px;
        font-weight: bold;
    }

    .product-item,
    .product-item:link,
    .product-item:hover,
    .product-item:visited {
        text-decoration: none;
        color: black;
    }

    .item-container {
        position: relative;
        height: 100%;
        padding-bottom: 50px;
    }

    .item-container:hover {
        cursor: pointer;
        background-color: antiquewhite;
        border-radius: 20px 20px;
    }

    .item-info {
        position: absolute;
        bottom: 0px;
        height: 50px;
    }
</style>