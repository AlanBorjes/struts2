<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html ng-app="categoria" lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width" />
    <title>Tienda</title>
    <!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.32/angular.min.js"></script>
    <script src="https://code.angularjs.org/1.2.21/angular-route.min.js"></script>
</head>

<body ng-controller="controladorcategoria">

<!-- Menu -->
<div ng-include src="'./nav.jsp'"></div>
<!-- Fin Menu -->
<div class="container">
    <div style="margin-top: 20px">
        <h1 style="font-size: 50px; font-style: oblique">Tienda Don Pancho</h1>
    </div>
    <div class="sticky-lg-top" style="margin-top: 20px">
        <div class="row ">
            <div class="col-10">
                <div class="row">
                    <span style="margin-left: 15px;" class="input-group-text col-1" id="inputGroup-sizing-sm">Buscar</span>
                    <input type="text" class="col-10" aria-label="Sizing example input"
                           aria-describedby="inputGroup-sizing-sm" ng-model="busqueda" />
                </div>
            </div>
            <div class="col-2">
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Registrar Producto
                </button>
            </div>
        </div>

        <!-- Inicio tabla -->
        <table class="table table-dark table-hover" style="margin-top: 10px; text-align: center">
            <thead>
            <tr>
                <th scope="col">Nombre</th>
                <th scope="col">Descripción</th>
                <th scope="col">Acciones</th>
            </tr>
            </thead>
            <tbody>
            <tr ng-repeat=" categoria in categorias | filter: busqueda  ">
                <td>{{categoria.name}}</td>
                <td>{{categoria.Descripcion}}</td>
                <td>
                    <a class="btn btn-danger btn-primary" style="margin: 10px;"
                       ng-click="ElminarProducto(producto.id)">Elminar
                    </a>
                    <button class="btn btn-info" style="margin: 10px;">Modificar</button>
                </td>
            </tr>
            </tbody>
        </table>
        <!-- Fin tabla -->
    </div>
</div>

<!-- Inicio Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">
                    Registrar categoria
                </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="mb-3 row">
                    <label  class="col-sm-10 col-form-label">Nombre del Producto :</label>
                    <div class="col-sm-12">
                        <input type="text" class="form-control" ng-model="prducotNombreExtra" />
                    </div>
                </div>

                <div class="mb-3 row">
                    <label class="col-sm-10 col-form-label">Descripcion del Producto</label>
                    <div class="col-sm-12">
                        <input type="text" class="form-control" ng-model="DescripcioneExtra" />
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                    Close
                </button>
                <a class="btn btn-info btn-primary" ng-click="mostrarCategoria()" data-bs-dismiss="modal">Save
                </a>
            </div>
        </div>
    </div>
</div>
<!-- Fin Modal -->

<script>
    var categoria = angular.module("categoria", []);

    categoria.controller("controladorcategoria", [
        "$scope",
        function ($scope) {
            $scope.categorias = [
                {
                    name: "Danonino",
                    Descripcion: "Comida",
                },
                {
                    name: "Jumex mango",
                    Descripcion: "Jugo",
                },
                {
                    name: "Doritos",
                    Descripcion: "doritos",
                },
                {
                    name: "Fabulos",
                    Descripcion: "limpia pisos",
                },
            ];

            $scope.mostrarCategoria = function () {
                var categoriaNew = {
                    name: $scope.prducotNombreExtra,
                    Descripcion: $scope.DescripcioneExtra,
                };
                $scope.categorias.push(categoriaNew);
            };
        },
    ]);
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>

</html>
