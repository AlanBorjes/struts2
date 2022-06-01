<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html data-ng-app="categoria" lang="en">
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

<body ng-controller="controladorcategoria" style=" background: #FAF7F2;">

<!-- Menu -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Tienda</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" href="categoria.jsp">Categoria</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="index.jsp">Productos</a>
                </li>
            </ul>

        </div>
    </div>
</nav>
<!-- Fin Menu -->
<div class="container">
    <div class="row ">
        <div class="d-md-flex justify-content-center ">
            <div class="row">
                <div style="margin-top: 20px; color: #325C59;" class="col-12">
                    <h1 style="font-size: 50px; font-family: Georgia; text-align: center">Tienda Don Pancho
                    </h1>

                </div>
                <div style="margin-top: 12px" class="col-12">
                    <div class="row justify-content-center" style="margin-left: 10px;">
                        <div class="col-12 d-md-flex justify-content-center  ">
                            <h1 style="font-family: Palatino; color: #325C59;">Categorias</h1>
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
            <div class="col-auto p-5" ng-if="(data.categoryList | filter : busqueda) == '' ">
                    <span class="badge rounded-pill" style="background-color: #003049; font-size: 18px;">No hay
                        registros</span>
            </div>
        </div>
        <div class="col-12">
            <div class="row">
                <div class="col-lg-3 col-md-6 mb-4 mb-lg-0" style="margin-top: 15px"
                     ng-repeat="category in data.categoryList | filter : busqueda">
                    <div class="card" id="cards" >

                        <div class="card-body">
                            <div class="row">
                                <div (click)="info(category.id)" ng-click="info(category.id)" data-bs-toggle="modal" data-bs-target="#ModaDetall">
                                    <h2 class="card-title">{{category.nombre|uppercase}}</h2>
                                    <p class="small text-muted font-italic" style="height: auto">
                                        {{category.descripcion}} </p>
                                </div>
                                <div class="row justify-content-center">
                                    <input type="hidden" ng-model="category.id"  />
                                    <button type="button" ng-click="modify(category.id)" data-bs-toggle="modal"
                                            data-bs-target="#ModalModificar" class="btn col-3"
                                            style="background-color: #FFD600; color: white; "><i class="fas fa-edit"></i></button>

                                    <button class="btn col-3" ng-click="delete(category.id)"
                                            style=" margin-left: 10px; background-color: #FF5F4E; color: white;"><i
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
</div>

<!-- Inicio del modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">
                    Registro Categoria
                </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form class="row g-3">
                <div class="modal-body">
                    <div class="mb-3 row">
                        <label class="col-sm-10 col-form-label" for="validationDefault01">Nombre de la
                            categoria :<font style="color: #D62828">*</font>  </label>
                        <div class="col-sm-12">
                            <input ng-change="validate()" type="text" class="form-control"
                                   ng-model="category.nombre" id="validationDefault01" required />
                            <span style="color: #D62828;" ng-show="errorNombre">El nombre es
                                    requerido</span>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-sm-10 col-form-label">Descripcion de la categoria:<font style="color: #D62828">*</font> </label>
                        <div class="col-sm-12">
                                <textarea ng-change="validate()" rows="5" cols="30" class="form-control"
                                          aria-label="With textarea" ng-model="category.descripcion" required></textarea>
                            <span style="color: #D62828;" ng-show="errorDescripcion">La Descripcion es
                                    requerido</span>

                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" ng-click="clear()" data-bs-dismiss="modal">
                        Close
                    </button>
                    <button   ng-disabled='disabledFlag' class="btn btn-info btn-primary" type="submit" ng-click="register()"
                            data-bs-dismiss="modal"> Guardar</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- Fin Modal -->

<!-- Inicio del modal Modificar-->
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
                    <label  class="col-sm-10 col-form-label">Nombre de la categoria:</label>
                    <div class="col-sm-12">
                        <input ng-change="validateUpdate()" disabled type="text" class="form-control" ng-model="nombre" />
                        <span style="color: #D62828;" ng-show="errorNombre">El nombre es
                                    requerido</span>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label class="col-sm-10 col-form-label">Descripcion del categoria</label>
                    <div class="col-sm-12">
                            <textarea ng-change="validateUpdate()" rows="5" class="form-control" aria-label="With textarea"
                                      ng-model="descripcion"></textarea>
                        <span style="color: #D62828;" ng-show="errorDescripcion">La Descripcion es
                                    requerido</span>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                    Close
                </button>
                <button ng-disabled='disabledFlag2' class="btn btn-info btn-primary" ng-click="modificar()" data-bs-dismiss="modal">Modificar</button>
            </div>
        </div>
    </div>
</div>
<!-- Fin Modal -->

<!-- Inicio del modal Detalles -->
<div class="modal fade" id="ModaDetall" tabindex="-1" aria-labelledby="ModaDetall" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="ModaDetalls">
                    Productos de la categoria
                </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="row justify-content-center">
                    <div class="col-4 " ng-if="(dat.info) == '' ">
                            <span class="badge rounded-pill"
                                  style="background-color: #003049; font-size: 18px; margin-top: 70px; margin-bottom: 70px; ">No
                                hay
                                registros</span>
                    </div>
                    <div class="col-lg-6 col-md-4" style="margin-top: 15px" ng-repeat="producto in dat.info ">
                        <div class="cards2 " id="cards2">
                            <div class="card-body">
                                <h2 class="card-title">{{producto.nombre|uppercase}}</h2>
                                <h4>{{producto.marca}}</h4>
                                <p class="small text-muted font-italic">{{producto.precio | currency:"$"}} -
                                    Unidades disponibles:
                                    {{producto.unidades}} </p>
                            </div>
                        </div>
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
<!-- Fin Modal -->


<script src="JS/scrip.js">

</script>

<script src="https://kit.fontawesome.com/afd8979cda.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>

</html>
