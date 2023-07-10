<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container mt-5 mb-5">
    <div class="row">
        <%--form search--%>
        <div class="col-3 p-3 card">
            <form>
                <div class="product-search-info mt-3">
                    <label for="keyword" class="mb-1"><b>Tên sản phẩm:</b></label>
                    <input name="keyword" value="${param.keyword}" class="form-control"
                           placeholder="Nhập tên sản phẩm để tìm"/>
                </div>

                <div class="brand-search-info mt-3">
                    <label for="brandId"><b>Loại sản phẩm:</b></label>
                    <div class="mt-2">
                        <input type="radio" name="categoryId" checked value=""/>
                        <span>Tất cả</span>
                    </div>
                    <c:forEach var="category" items="${categoryList}">
                        <div class="mt-1">
                            <input name="categoryId" type="radio" value="${category.id}"
                                    <c:if test="${param.categoryId==category.id}">
                                        checked
                                    </c:if>/>
                            <span>${category.name}</span>
                        </div>
                    </c:forEach>
                </div>

                <div class="price-search-info mt-3">
                    <label for="priceRange"><b>Mức giá:</b></label>
                    <c:forEach var="priceRange" items="${priceRangeList}">
                        <div class="mt-2">
                            <input type="radio" name="priceRangeId" value="${priceRange.id}"
                                    <c:if test="${param.priceRangeId==priceRange.id}">
                                        checked
                                    </c:if>/>
                            <span>${priceRange.display}</span>
                        </div>
                    </c:forEach>
                </div>
                <button type="submit" class="btn btn-primary mt-4 mb-4">Tìm kiếm</button>
            </form>
        </div>
        <%--product List--%>
        <div class="col-9">
            <ul class="list-unstyled row">
                <c:forEach var="product" items="${productPage.content}">
                    <li class="list-item col-sm-4 mt-3">
                        <div class="item-container d-flex justify-content-center">
                            <a href="/detail/${product.id}" class="product-item">
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
            <nav aria-label="Page navigation example">
                <ul class="pagination">
                    <li class="page-item">
                        <a class="page-link"
                           href="/?page=0&keyword=${param.keyword}&categoryId=${param.categoryId}&priceRangeId=${param.priceRangeId}">Đầu</a>
                    </li>
                    <li class="page-item">
                        <a class="page-link"
                           href="/?page=${productPage.number-1<0?0:productPage.number-1}&keyword=${param.keyword}&categoryId=${param.categoryId}&priceRangeId=${param.priceRangeId}">Trước</a>
                    </li>
                    <li class="page-item">
                        <a class="page-link"
                           href="/?page=${productPage.totalPages>0&&productPage.number+1<=productPage.totalPages-1?productPage.number+1:productPage.totalPages}&keyword=${param.keyword}&categoryId=${param.categoryId}&priceRangeId=${param.priceRangeId}">Tiếp</a>
                    </li>
                    <li class="page-item">
                        <a class="page-link"
                           href="/?page=${productPage.totalPages==0?0:productPage.totalPages-1}&keyword=${param.keyword}&categoryId=${param.categoryId}&priceRangeId=${param.priceRangeId}">Cuối</a>
                    </li>
                </ul>
            </nav>
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