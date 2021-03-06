<%-- 
    Document   : objects
    Created on : Jun 19, 2017, 2:24:59 PM
    Author     : Mr.Minakov
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body class="page">
        <div class="cont-page">
            <div class="row">
                <div class="col-md-3">
                    <div class="profile text-center">
                        <h4>${user.name}</h4>
                        <img class="avatar" src="avatars/004-agreement.png" width="128px" height="128px">
                        <h5>${user.getRecordIdCompany().name}</h5>
                        <c:if test="${user.position ne null}">
                            <h5>${user.position}</h5>
                        </c:if>                        
                        <p>активных объектов: <strong>${objects.size()}</strong></p>
                        <button type="button" class="btn btn-primary btn-xs">Профиль</button>
                        <button type="button" class="btn btn-primary btn-xs">Настройки</button>
                        <button type="button" class="btn btn-primary btn-xs">Добавить пользователя</button>
                    </div>
                    <div class="info text-center">                        
                        <h4>Объекты строительства</h4><button type="button" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#addObjModal">Добавить</button>
                        <button type="button" class="btn btn-primary btn-xs">Удалить</button>
                        <a href="#active-obj" data-toggle="collapse" id="btn-collapse">
                            <strong><p>Активные объекты</p></strong>
                        </a>
                        <ul class="nav nav-pills nav-stacked collapse" id="active-obj">
                            <c:forEach var="object" items="${objects}">
                                <a data-toggle="pill" href="#obj-content${object.recordId}" class="objectName"><li>${object.name}</li></a>     
                                    </c:forEach>
                        </ul>

                        <div class="modal fade" id="addObjModal" role="dialog">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">×</button>
                                        <h4>Добавление объекта строительства</h4>
                                    </div>
                                    <div class="modal-body" style="color: #2D2D30">                                        
                                        <form method="POST" action="objects" class="reg-attr">
                                            <p>
                                                <label for="nameObj">Название объекта строительства</label>
                                                <input type="text" name="nameObj" class="form-control" id="nameObj" placeholder="Введите название объекта:">                                    
                                            </p>
                                            <p>
                                                <label for="addressObj">Адрес объекта строительства</label>
                                                <input type="text" name="addressObj" class="form-control" id="addressObj" placeholder="Введите адрес объекта:">                                    
                                            </p>
                                            <p>
                                                <label for="nameCustomerObj">Название компании заказчика</label>
                                                <input type="text" name="nameCustomerObj" class="form-control" id="nameCustomerObj" placeholder="Заказчик:">                                    
                                            </p>
                                            <p>
                                                <label for="nameGenBuilderObj">Название компании генподрядчика</label>
                                                <input type="text" name="nameGenBuilderObj" class="form-control" id="nameGenBuilderObj" placeholder="Генподрядчик:">                                    
                                            </p>
                                            <p>
                                                <label for="dateStartObj">Дата начала работ</label>
                                                <input type="date" name="dateStartObj" class="form-control" id="dateStartObj" placeholder="Введите дату в формате 'ДД:ММ:ГГГГ':">                                    
                                            </p>
                                            <p>
                                                <button type="submit" class="btn btn-primary">Добавить</button>                                    
                                            </p>                                            
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="col-md-9">
                    <div class="tab-content text-center" id="tab-cont">
                        <c:forEach var="object" items="${objects}">
                            <div id="obj-content${object.recordId}" class="tab-pane fade">
                                <div class="objects-about">
                                    <h4><strong>объект: ${object.name}</strong></h4>
                                    <h5>адрес: <strong>${object.address}</strong></h5>
                                    <h5>заказчик: <strong>${object.customer}</strong></h5>
                                    <h5>генеральный подрядчик: <strong>${object.generalBuilder}</strong></h5>
                                </div>
                                <div class="objects-places">
                                    <h4>Участки строительства</h4>
                                    <button type="button" class="btn btn-primary btn-md">Добавить</button>
                                    <button type="button" class="btn btn-primary btn-md">Удалить</button>
                                    <ul class="nav nav-pills nav-stacked" id="places">
                                        <c:if test="${object.getPlacesCollection().size() eq 0}">
                                            <h3>Объект не имеет участков строительства</h3>
                                            <h4>Чтобы добавить участок нажмите на соответствующую кнопку сверху</h4>
                                        </c:if>                                            
                                        <c:if test="${object.getPlacesCollection().size() gt 0}">
                                            <c:forEach var="place" items="${object.getPlacesCollection()}">
                                                <li><a href="#"><p>${place.name}</p></a></li>
                                                        </c:forEach>
                                                    </c:if>
                                    </ul>                        
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
