<html ng-app="prototipo" lang="en">

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

<body ng-controller="controladorProductos">
<!-- Menu -->
<div ng-include src="'./plantilla/nav.jsp'"></div>
<!-- Fin Menu -->
<div class="container">
    <div style="margin-top: 20px">
        <h1 style="font-size: 50px; font-style: oblique">Tienda Don Pancho</h1>
    </div>

    <div style="margin-top: 20px">
        <div class="row ">
            <div class="col-10">
                <div class="row">
                        <span style="margin-left: 15px;" class="input-group-text col-1"
                              id="inputGroup-sizing-sm">Buscar</span>
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
        <div class="row">
            <div class="col-12">
                <table class="table table-dark table-hover" style="margin-top: 10px; text-align: center">
                    <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Nombre</th>
                        <th scope="col">Marca</th>
                        <th scope="col">Precio</th>
                        <th scope="col">Categoría</th>
                        <th scope="col">
                            Unidades <br />
                            Existentes
                        </th>
                        <th scope="col">Acciones</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr ng-repeat=" producto in productos | filter: busqueda  ">
                        <td>{{producto.id}}</td>
                        <td>{{producto.name}}</td>
                        <td>{{producto.Marca}}</td>
                        <td>{{producto.Precio | currency:"$"}}</td>
                        <td>{{producto.Categoria}}</td>
                        <td>{{producto.Unidades}}</td>
                        <td>
                            <a class="btn btn-danger btn-primary" style="margin: 10px;"
                               ng-click="ElminarProducto(producto.id)">Elminar
                            </a>
                            <button class="btn btn-info" style="margin: 10px;">Modificar</button>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- Fin tabla -->
    </div>
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
                    <label  class="col-sm-10 col-form-label">id del Producto</label>
                    <div class="col-sm-12">
                        <input type="number" class="form-control" ng-model="IdExtra" />
                    </div>
                </div>
                <div class="mb-3 row">
                    <label  class="col-sm-10 col-form-label">Nombre del Producto :</label>
                    <div class="col-sm-12">
                        <input type="text" class="form-control" ng-model="prducotNombreExtra" />
                    </div>
                </div>
                <div class="mb-3 row">
                    <label  class="col-sm-10 col-form-label">Marca del Producto</label>
                    <div class="col-sm-12">
                        <input type="text" class="form-control" ng-model="MarcaExtra" />
                    </div>
                </div>
                <div class="mb-3 row">
                    <label  class="col-sm-10 col-form-label">Precio del Producto</label>
                    <div class="col-sm-12">
                        <input type="number" class="form-control" ng-model="PrecioExtra" />
                    </div>
                </div>
                <div class="mb-3 row">
                    <label  class="col-sm-10 col-form-label">Categoria del Producto</label>
                    <div class="col-sm-12">
                        <input type="text" class="form-control" ng-model="CategoriaExtra" />
                    </div>
                </div>

                <div class="mb-3 row">
                    <label  class="col-sm-10 col-form-label">Unidades del Producto</label>
                    <div class="col-sm-12">
                        <input type="number" class="form-control" ng-model="UnidadesExtra" />
                    </div>
                </div>
                <div class="mb-3 row">
                    <label  class="col-sm-10 col-form-label">Descripcion del Producto</label>
                    <div class="col-sm-12">
                        <input type="text" class="form-control" ng-model="DescripcioneExtra" />
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                    Close
                </button>
                <a class="btn btn-info btn-primary" ng-click="mostrarProductos()" data-bs-dismiss="modal">Save
                </a>
            </div>
        </div>
    </div>
</div>
<!-- Fin Modal -->

<script>
    var prototipo = angular.module("prototipo", []);

    prototipo.controller("controladorProductos", [
        "$scope",
        function ($scope) {
            $scope.productos = [
                {
                    id: 1,
                    name: "Danonino",
                    Marca: "Danonino",
                    Precio: 11,
                    Categoria: "Comida",
                    Unidades: 1,
                    Descripcion: "Comida",
                },
                {
                    id: 2,
                    name: "Jumex mango",
                    Marca: "Jumex",
                    Precio: 10,
                    Categoria: "Jugos",
                    Unidades: 15,
                    Descripcion: "Jugo",
                },
                {
                    id: 3,
                    name: "Doritos",
                    Marca: "Sabritas",
                    Precio: 11,
                    Categoria: "papas",
                    Unidades: 45,
                    Descripcion: "doritos",
                },
                {
                    id: 4,
                    name: "Fabulos",
                    Marca: "Fabuloso",
                    Precio: 15,
                    Categoria: "Limpieza",
                    Unidades: 45,
                    Descripcion: "limpia pisos",
                },
            ];

            $scope.mostrarProductos = function () {
                var productoNew = {
                    id: $scope.IdExtra,
                    name: $scope.prducotNombreExtra,
                    Marca: $scope.MarcaExtra,
                    Precio: $scope.PrecioExtra,
                    Categoria: $scope.CategoriaExtra,
                    Unidades: $scope.UnidadesExtra,
                    Descripcion: $scope.DescripcioneExtra,
                };
                $scope.productos.push(productoNew);
            };

            $scope.ElminarProducto = function (id) {
                productos.splice(id, 2);
                console.log(productos);
            };
        },
    ]);
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>

</html>