<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<html ng-app="prototipo" lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width" />
    <title>Tienda</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="estilo.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.32/angular.min.js"></script>
    <script src="https://code.angularjs.org/1.2.21/angular-route.min.js"></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</head>

<body ng-controller="controladorProductos" style=" background: #e8cbc0;
    background: -webkit-linear-gradient(to right, #e8cbc0, #636fa4);
    background: linear-gradient(to right, #e8cbc0, #636fa4);
    min-height: 100vh;">
<!-- Menu -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Tienda</a>
        <button
                class="navbar-toggler"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent"
                aria-expanded="false"
                aria-label="Toggle navigation"
        >
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active"  href="categoria.jsp"
                    >Categoria</a
                    >
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="index.jsp">Productos</a>
                </li>
            </ul>
        </div>
    </div>
</nav><!-- Fin Menu -->
<div class="container">
    <div class="row ">
        <div class="d-md-flex justify-content-center ">
            <div class="row">
                <div style="margin-top: 20px" class="col-12">
                    <h1 style="font-size: 50px; font-family: Georgia; text-align: center">Tienda Don Pancho
                    </h1>
                </div>
                <div style="margin-top: 20px" class="col-12">
                    <div class="row" style="margin-left: 10px;">
                            <div class="col-12 d-md-flex justify-content-center  " >
                                <h1 style="font-family: Palatino">Productos</h1>
                            </div>
                        <div class="col-10">
                            <div class="row">
                                <span class="input-group-text col-2" id="inputGroup-sizing-sm">Buscar</span>
                                <input type="search" class="col-10" aria-label="Sizing example input"
                                       aria-describedby="inputGroup-sizing-sm" ng-model="busqueda"
                                       placeholder="Zucaritas" />
                            </div>
                        </div>
                        <div class="col-1">
                            <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                    data-bs-target="#exampleModal">
                                <i class="fas fa-plus"></i>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Inicio tabla -->
        <div class="m-0 row justify-content-center">
            <div class="col-auto p-5" ng-if="(data.productoList | filter : busqueda) == '' ">
                    <span class="badge rounded-pill" style="background-color: #003049; font-size: 18px;">No hay
                        registros</span>
            </div>
        </div>
        <div class="col-12">
            <div class="row">
                <div class="col-lg-3 col-md-6 mb-4 mb-lg-0" style="margin-top: 15px"
                     ng-repeat="producto in data.productoList | filter : busqueda">
                    <div class="card" id="cards" >
                        <div class="card-body">
                            <div class="row ">
                                <div (click)="modify(producto.id)" ng-click="modify(producto.id)" data-bs-toggle="modal" data-bs-target="#ModaDetall">

                                <div class="col-12  justify-content-center" id="caja">
                            <img  class="img-fluid rounded d-block m-l-none" style="height: 150px; width: 100%; " src="{{producto.image}}">
                            </div>
                            <h2 class="card-title">{{producto.nombre|uppercase}}</h2>
                            <h4>{{producto.marca}}</h4>
                            <p class="small text-muted font-italic">{{producto.precio | currency:"$"}} -
                                Unidades disponibles:
                                {{producto.unidades}} </p>
                                </div>
                            <div class="row justify-content-center">
                                <button type="button" ng-click="modify(producto.id)" data-bs-toggle="modal"
                                        data-bs-target="#ModalModificar" class="btn col-3"
                                        style="background-color: #FFD700 "><i class="fas fa-edit"></i></button>
                                <button type="button" ng-click="modify(producto.id)" data-bs-toggle="modal"
                                        data-bs-target="#ModaDetall" class="btn col-3"
                                        style="background-color: #0FBAFC; margin-left: 10px;"><i class="fas fa-info"></i></button>
                                <button class="btn col-3" ng-click="delete(producto.id)"
                                        style=" margin-left: 10px; background-color: #D62828; color: white;"><i
                                        class="fas fa-trash"></i></button>
                            </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </div>
        <!-- Fin tabla -->
    </div>
    <!-- Fin tabla -->
</div>


<!-- Inicio Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">
                    Registro producto
                </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="mb-3 row">
                    <label class="col-sm-10 col-form-label">Nombre del Producto :</label>
                    <div class="col-sm-12">
                        <input ng-change="validate()" type="text" class="form-control" ng-model="producto.nombre" required  />
                        <span style="color: #D62828;" ng-show="errorNombre">El nombre es requerido</span>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label class="col-sm-10 col-form-label">Marca del Producto</label>
                    <div class="col-sm-12">
                        <input ng-change="validate()" type="text" class="form-control" ng-model="producto.marca" required/>
                        <span style="color: #D62828;" ng-show="errorMarca">La marca es requerida</span>
                    </div>
                </div>

                <div class="mb-3 row">
                    <div class="mb-3 row">
                        <label for="mySelect" class="col-5">Categoria del Producto:</label>

                        <div class="col-sm-12">
                            <select ng-change="validate()" class="form-select" aria-label="Default select example"   name="mySelect" id="mySelect"
                                    ng-options="category.nombre for category in catef.categoryList track by category.id"
                                    ng-model="producto.category" required></select>
                        </div>
                        <span style="color: #D62828;" ng-show="errorCategoria">La Categoria es requerido</span>
                    </div>
                </div>
                <div class="mb-3 row">
                    <div class="col-6 row">
                        <label class="col-sm-10 col-form-label">Precio del Producto</label>
                        <div class="col-sm-12">
                            <input ng-change="validate()" type="number" class="form-control" ng-model="producto.precio" />
                            <span style="color: #D62828;" ng-show="errorPrecio" required>El precio es requerido</span>
                        </div>
                    </div>

                    <div class="col-6 row">
                        <label class="col-sm-10 col-form-label">Unidades disponibles</label>
                        <div class="col-sm-12">
                            <input ng-change="validate()" type="number" class="form-control" ng-model="producto.unidades" required/>
                            <span style="color: #D62828;" ng-show="errorUnidades">La Unidades es requerido</span>
                        </div>
                    </div>

                </div>

                <div class="mb-3 row">
                    <label class="col-sm-10 col-form-label">Descripcion del Producto</label>
                    <div class="col-sm-12">
                        <textarea ng-change="validate()" rows="5" cols="30" class="form-control" aria-label="With textarea" ng-model="producto.description" required></textarea>
                        <span style="color: #D62828;"  ng-show="errorDescription">La Unidades es requerido</span>

                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                    Close
                </button>
                <a class="btn btn-info btn-primary"  ng-click="register()" data-bs-dismiss="modal">Save
                </a>
            </div>
        </div>
    </div>
</div>
<!--Fin de primer modal -->
<div class="modal fade" id="ModaDetall" tabindex="-1" aria-labelledby="ModaDetall" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="ModaDetalls">
                    Detalles producto
                </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="mb-3 row">
                    <input type="hidden" class="form-control" aria-describedby="emailHelp" ng-model="id" />
                    <label class="col-sm-10 col-form-label">Nombre del Producto :</label>
                    <div class="col-sm-12">
                        <input type="text" disabled class="form-control" ng-model="nombre" />
                    </div>
                </div>
                <div class="mb-3 row">
                    <label class="col-sm-10 col-form-label">Marca del Producto:</label>
                    <div class="col-sm-12">
                        <input type="text" disabled class="form-control" ng-model="marca" />
                    </div>
                </div>
                <div class="mb-3 row">
                    <label class="col-sm-10 col-form-label">Precio del Producto</label>
                    <div class="col-sm-12">
                        <input type="number" disabled class="form-control" ng-model="precio" />
                    </div>
                </div>
                <div class="mb-3 row">
                    <label class="col-sm-10 col-form-label">Categoria del Producto</label>
                    <div class="col-sm-12">
                        <input type="hidden" class="form-control" ng-model="category.id" />
                        <input type="text" disabled class="form-control" ng-model="category.nombre" />
                        <input type="hidden" class="form-control" ng-model="category.descripcion" />

                    </div>
                </div>

                <div class="mb-3 row">
                    <label class="col-sm-10 col-form-label">Unidades del Producto</label>
                    <div class="col-sm-12">
                        <input type="number" disabled class="form-control" ng-model="unidades" />
                    </div>
                </div>
                <div class="mb-3 row">
                    <label class="col-sm-10 col-form-label">Descripcion del Producto</label>
                    <div class="col-sm-12">
                        <textarea class="form-control" disabled ng-model="description" aria-label="With textarea" ng-model="producto.description"></textarea>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                    Close
                </button>
            </div>
        </div>
    </div>
</div>

<!-- Inicio de modal modificar -->
<div class="modal fade" id="ModalModificar" tabindex="-1" aria-labelledby="ModalModificar" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="ModalModificars">
                    Modificacion producto
                </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="mb-3 row">
                    <input type="hidden" class="form-control" aria-describedby="emailHelp" ng-model="id" />
                    <label class="col-sm-10 col-form-label">Nombre del Producto :</label>
                    <div class="col-sm-12">
                        <input type="text" class="form-control" ng-model="nombre" />
                    </div>
                </div>
                <div class="mb-3 row">
                    <label class="col-sm-10 col-form-label">Marca del Producto:</label>
                    <div class="col-sm-12">
                        <input type="text" class="form-control" ng-model="marca" />
                    </div>
                </div>
                <div class="mb-3 row">
                    <label class="col-sm-10 col-form-label">Precio del Producto</label>
                    <div class="col-sm-12">
                        <input type="number" class="form-control" ng-model="precio" />
                    </div>
                </div>
                <div class="mb-3 row">
                        <label for="mySelect2" class="col-5">Categoria del Producto:</label>

                    <div class="col-sm-12">
                        <select class="form-select" aria-label="Default select example"   name="mySelect2" id="mySelect2"
                                ng-options="category.nombre for category in catef.categoryList track by category.id"
                                ng-model="category"></select>
                    </div>

                </div>

                <div class="mb-3 row">
                    <label class="col-sm-10 col-form-label">Unidades del Producto</label>
                    <div class="col-sm-12">
                        <input type="number" class="form-control" ng-model="unidades" />
                    </div>
                </div>
                <div class="mb-3 row">
                    <label class="col-sm-10 col-form-label">Descripcion del Producto</label>
                    <div class="col-sm-12">
                        <textarea rows="5" class="form-control" aria-label="With textarea" ng-model="description"></textarea>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                    Close
                </button>
                <a class="btn btn-info btn-primary" ng-click="modificar()" data-bs-dismiss="modal">Modificar
                </a>
            </div>
        </div>
    </div>
</div>

</body>
<!-- Fin Modal -->

<script>
    let prototipo = angular.module("prototipo", ['ngRoute']);

    prototipo.controller("controladorProductos", function ($scope, $http) {
        $http({
            method: 'GET',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            url: 'http://localhost:8080/Strust2CRUD/findAll'
        }).then(function successCallback(response) {
            $scope.catef = response.data
            console.log($scope.catef);
        }, function errorCallback(response) {

        });

        $http({
            method: 'GET',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            url: 'http://localhost:8080/Strust2CRUD/findAllProducto'
        }).then(function successCallback(response) {
            $scope.data = response.data
        }, function errorCallback(response) {
            console.log("aaa");
        });

        $scope.getAll = () => {
            $http({
                method: 'GET',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                url: 'http://localhost:8080/Strust2CRUD/findAllProducto'
            }).then(function successCallback(response) {
                $scope.data = response.data
            }, function errorCallback(response) {
                console.log("aaa");
            });
        }

        $scope.modificar = () => {
            Swal.fire({
                title: '¿Quieres modificar el producto?',
                showCancelButton: true,
                confirmButtonText: 'Modificar',
                cancelButtonText: 'Cancelar',
                icon: 'question'
            }).then((result) => {
                if (result.isConfirmed) {
                    let productoModify = new Object();
                    productoModify.id = $scope.id
                    productoModify.nombre = $scope.nombre
                    productoModify.marca = $scope.marca
                    productoModify.precio = $scope.precio
                    productoModify.unidades = $scope.unidades
                    productoModify.category = $scope.category
                    productoModify.description = $scope.description
                    $http({
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/x-www-form-urlencoded',
                        },
                        url: 'http://localhost:8080/Strust2CRUD/modifProducto',
                        data: "params=" + JSON.stringify(productoModify),
                    }).then(function successCallback(response) {
                        Swal.fire({
                            position: 'top-end',
                            icon: 'success',
                            title: '¡Se ha modificado la producto!',
                            showConfirmButton: false,
                            timer: 1500
                        })
                        $scope.getAll()
                    }.catch (function errorCallback(response) {
                        console.log("aadadaa");
                    }));
                }
            })

        }

        $scope.register = () => {
        Swal.fire({
            title: '¿Quieres registrar la categoría?',
            showCancelButton: true,
            confirmButtonText: 'Guardar',
            cancelButtonText: 'Cancelar',
            icon: 'question'
        }).then((result) => {
            console.log($scope.producto)

            if (result.isConfirmed) {
                $http({
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded',
                    },
                    url: 'http://localhost:8080/Strust2CRUD/registerProducto',
                    data: "params=" + JSON.stringify($scope.producto),

                }).then(function successCallback(response) {
                    console.log(response.data);
                    $scope.errorMarca = false;
                    $scope.errorNombre = false;
                    $scope.category = {}
                    $scope.goRegister = true;
                    Swal.fire({
                        position: 'top-end',
                        icon: 'success',
                        title: '¡Se ha registrado la categoría!',
                        showConfirmButton: false,
                        timer: 2000
                    })
                    $scope.getAll()
                }, function errorCallback(response) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'Hubo un error    ',

                    })
                });
            }
        })
        }


        $scope.modify = (id) => {
            for (let i = 0; i < $scope.data.productoList.length; i++) {
                if ($scope.data.productoList[i].id == id) {
                    $scope.id = $scope.data.productoList[i].id;
                    $scope.nombre = $scope.data.productoList[i].nombre;
                    $scope.description = $scope.data.productoList[i].description;
                    $scope.marca = $scope.data.productoList[i].marca;
                    $scope.precio = $scope.data.productoList[i].precio;
                    $scope.unidades = $scope.data.productoList[i].unidades
                    $scope.category = $scope.data.productoList[i].category;
                }
            }

        }

        $scope.delete = (id) => {
            let productodelet = new Object();
            productodelet.id = id
            Swal.fire({
                title: '¿Quieres eliminar El producto?',
                showCancelButton: true,
                confirmButtonText: 'Eliminar',
                cancelButtonText: 'Cancelar',
                icon: 'question'
            }).then((result) => {
                if (result.isConfirmed) {
                    $http({
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/x-www-form-urlencoded',
                        },
                        url: 'http://localhost:8080/Strust2CRUD/delete',
                        data: "params=" + JSON.stringify(productodelet),
                    }).then(function successCallback(response) {
                        console.log(response.data);
                        $scope.errorDescription = false;
                        $scope.errorName = false;
                        $scope.category = {}
                        $scope.goRegister = true;
                        if (response.result != false){
                        Swal.fire({
                            position: 'top-end',
                            icon: 'success',
                            title: '¡Se ha eliminado El producto!',
                            showConfirmButton: false,
                            timer: 1500
                        })
                        }else{
                            Swal.fire({
                                icon: 'error',
                                title: 'Oops...',
                                text: 'Hubo un error    ',
                            })
                        }
                        $scope.getAll()
                    }, function errorCallback(response) {
                        console.log("aaa");
                    });
                }
            })

        }

        $scope.validate = () => {
            if ($scope.producto.nombre == undefined || $scope.producto.nombre === "") {
                $scope.errorNombre = true;
            } else
            if ($scope.producto.marca == undefined || $scope.producto.marca === "") {
                $scope.errorMarca = true;
            } else
            if($scope.producto.precio == undefined || $scope.producto.precio === ""){
                $scope.errorPrecio = true;
            }else
            if($scope.producto.category == undefined || $scope.producto.category === ""){
                $scope.errorcategory = true;
            }else
            if($scope.producto.unidades == undefined || $scope.producto.unidades === ""){
                $scope.errorUnidades = true;
            }else
            if($scope.producto.description == undefined || $scope.producto.description === ""){
                $scope.errorDescription = true;
            }else {
                $scope.errorMarca = false;
                $scope.errorNombre= false;
                $scope.errorPrecio = false;
                $scope.errorcategory = false;
                $scope.errorUnidades = false;
                $scope.errorDescription = false;
            }
        }
    });
</script>
<script src="https://kit.fontawesome.com/afd8979cda.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>