let prototipo = angular.module("prototipo", ['ngRoute']);
let categoria = angular.module("categoria", ['ngRoute']);


prototipo.controller("controladorProductos", function ($scope, $http) {
    $scope.disabledFlag = true;
    $scope.disabledFlag2 = false;
    $scope.base64Output = "";

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
        console.log("mal");
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
                },(function errorCallback(response) {
                    console.log("aadadaa");
                }));
            }
        })

    }

    $scope.register = () => {
        console.log($scope.producto)
        Swal.fire({
            title: '¿Quieres registrar la categoría?',
            showCancelButton: true,
            confirmButtonText: 'Guardar',
            cancelButtonText: 'Cancelar',
            icon: 'question'
        }).then((result) => {
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

                    if(response.data.result.registered == true){
                        Swal.fire({
                            position: 'top-end',
                            icon: 'success',
                            title: '¡Se ha registrado la categoría!',
                            showConfirmButton: false,
                            timer: 2000
                        })
                    }else{
                        Swal.fire({
                            icon: 'error',
                            title: 'Oops...',
                            text: 'El producto ya existe  ',
                        })
                    }
                    $scope.getAll()
                    $scope.clear()
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

    $scope.validateUpdate= () =>{
        if ($scope.nombre == undefined || $scope.nombre === "") {
            $scope.errorNombre = true;
            $scope.errorMarca = false;
            $scope.errorPrecio = false;
            $scope.errorcategory = false;
            $scope.errorUnidades = false;
            $scope.errorDescription = false;
            $scope.disabledFlag2 = true;
        } else
        if ($scope.marca == undefined || $scope.marca === "") {
            $scope.errorMarca = true;
            $scope.errorNombre= false;
            $scope.errorPrecio = false;
            $scope.errorcategory = false;
            $scope.errorUnidades = false;
            $scope.errorDescription = false
            $scope.disabledFlag2 = true;
        } else
        if($scope.category == undefined || $scope.category === ""){
            $scope.errorcategory = true;
            $scope.errorMarca = false;
            $scope.errorNombre= false;
            $scope.errorPrecio = false;
            $scope.errorUnidades = false;
            $scope.errorDescription = false;
            $scope.disabledFlag2 = true;
        }else
        if($scope.precio == undefined || $scope.precio === ""){
            $scope.errorPrecio = true;
            $scope.errorMarca = false;
            $scope.errorNombre= false;
            $scope.errorcategory = false;
            $scope.errorUnidades = false;
            $scope.errorDescription = false;
            $scope.disabledFlag2 = true;
        }else
        if($scope.unidades == undefined || $scope.unidades === ""){
            $scope.errorUnidades = true;
            $scope.errorMarca = false;
            $scope.errorNombre= false;
            $scope.errorPrecio = false;
            $scope.errorcategory = false;
            $scope.errorDescription = false;
            $scope.disabledFlag2 = true;
        }else
        if($scope.description == undefined || $scope.description === ""){
            $scope.errorDescription = true;
            $scope.errorMarca = false;
            $scope.errorNombre= false;
            $scope.errorPrecio = false;
            $scope.errorcategory = false;
            $scope.errorUnidades = false;
            $scope.disabledFlag2 = true;
        }else {
            $scope.errorMarca = false;
            $scope.errorNombre= false;
            $scope.errorPrecio = false;
            $scope.errorcategory = false;
            $scope.errorUnidades = false;
            $scope.errorDescription = false;
            $scope.disabledFlag2 = false;
            ;
        }
    }

    $scope.validate = () => {
        if ($scope.producto.nombre == undefined || $scope.producto.nombre === "") {
            $scope.errorNombre = true;
            $scope.errorMarca = false;
            $scope.errorPrecio = false;
            $scope.errorcategory = false;
            $scope.errorUnidades = false;
            $scope.errorDescription = false;
            $scope.disabledFlag = true;
        } else
        if ($scope.producto.marca == undefined || $scope.producto.marca === "") {
            $scope.errorMarca = true;
            $scope.errorNombre= false;
            $scope.errorPrecio = false;
            $scope.errorcategory = false;
            $scope.errorUnidades = false;
            $scope.errorDescription = false
            $scope.disabledFlag = true;
        } else
        if($scope.producto.category == undefined || $scope.producto.category === ""){
            $scope.errorcategory = true;
            $scope.errorMarca = false;
            $scope.errorNombre= false;
            $scope.errorPrecio = false;
            $scope.errorUnidades = false;
            $scope.errorDescription = false;
            $scope.disabledFlag = true;
        }else
        if($scope.producto.precio == undefined || $scope.producto.precio === ""){
            $scope.errorPrecio = true;
            $scope.errorMarca = false;
            $scope.errorNombre= false;
            $scope.errorcategory = false;
            $scope.errorUnidades = false;
            $scope.errorDescription = false;
            $scope.disabledFlag = true;
        }else
        if($scope.producto.unidades == undefined || $scope.producto.unidades === ""){
            $scope.errorUnidades = true;
            $scope.errorMarca = false;
            $scope.errorNombre= false;
            $scope.errorPrecio = false;
            $scope.errorcategory = false;
            $scope.errorDescription = false;
            $scope.disabledFlag = true;
        }else
        if($scope.producto.description == undefined || $scope.producto.description === ""){
            $scope.errorDescription = true;
            $scope.errorMarca = false;
            $scope.errorNombre= false;
            $scope.errorPrecio = false;
            $scope.errorcategory = false;
            $scope.errorUnidades = false;
            $scope.disabledFlag = true;
        }else {
            $scope.errorMarca = false;
            $scope.errorNombre= false;
            $scope.errorPrecio = false;
            $scope.errorcategory = false;
            $scope.errorUnidades = false;
            $scope.errorDescription = false;
            $scope.disabledFlag = false
            ;
        }
    }

    $scope.clear = () =>{
        $scope.producto.nombre = "";
        $scope.producto.marca = "";
        $scope.producto.precio = "";
        $scope.producto.unidades = "";
        $scope.producto.description = "";
        $scope.disabledFlag = true;
    }

});

categoria.controller("controladorcategoria", function ($scope, $http) {
    $scope.disabledFlag = true;
    $scope.disabledFlag2 = false;

    $http({
        method: 'GET',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        url: 'http://localhost:8080/Strust2CRUD/findAll'
    }).then(function successCallback(response) {
        $scope.data = response.data
        console.log($scope.data);
    }, function errorCallback(response) {

    });

    $scope.getAll = () => {
        $http({
            method: 'GET',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            url: 'http://localhost:8080/Strust2CRUD/findAll'
        }).then(function successCallback(response) {
            $scope.data = response.data
        }, function errorCallback(response) {
            console.log("aaa");
        });
    }

    $scope.info = (id) => {
        let categoryInfo = new Object();
        categoryInfo.id = id;
        console.log(categoryInfo);
        $http({
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            url: 'http://localhost:8080/Strust2CRUD/findCategory',
            data: "params=" + JSON.stringify(categoryInfo),
        }).then(function successCallback(response) {
            console.log(response)
            $scope.dat = response.data.result
            console.log($scope.dat)
        }, function errorCallback(response) {
            console.log("aaa");
        });


    }

    $scope.delete = (id) => {
        let categoryDelete = new Object();
        categoryDelete.id = id
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
                    url: 'http://localhost:8080/Strust2CRUD/deleteCategory',
                    data: "params=" + JSON.stringify(categoryDelete),
                }).then(function successCallback(response) {
                    console.log(response.data);
                    $scope.errorDescription = false;
                    $scope.errorName = false;
                    $scope.category = {}
                    $scope.goRegister = true;
                    if (response.data.result.deleted != false) {
                        Swal.fire({
                            position: 'top-end',
                            icon: 'success',
                            title: '¡Se ha eliminado El producto!',
                            showConfirmButton: false,
                            timer: 1500
                        })
                    } else {
                        Swal.fire({
                            icon: 'error',
                            title: 'Oops...',
                            text: 'Esta categoria no se puede eliminar  \n Ya que todavia tiene productos conectados a su categoria',
                        })
                    }
                    $scope.getAll()
                }, function errorCallback(response) {
                    console.log("aaa");
                });
            }
        })
    }

    $scope.modify = (id) => {
        console.log("Voy bien")
        for (let i = 0; i < $scope.data.categoryList.length; i++) {
            if ($scope.data.categoryList[i].id == id) {
                $scope.id = $scope.data.categoryList[i].id;
                $scope.nombre = $scope.data.categoryList[i].nombre;
                $scope.descripcion = $scope.data.categoryList[i].descripcion;
            }
        }
    }

    $scope.modificar = () => {
        Swal.fire({
            title: '¿Quieres modificar la categoría?',
            showCancelButton: true,
            confirmButtonText: 'Modificar',
            cancelButtonText: 'Cancelar',
            icon: 'question'
        }).then((result) => {
            if (result.isConfirmed) {
                let categoryModify = new Object();
                categoryModify.id = $scope.id
                categoryModify.nombre = $scope.nombre
                categoryModify.descripcion = $scope.descripcion
                $http({
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded',
                    },
                    url: 'http://localhost:8080/Strust2CRUD/modifCategory',
                    data: "params=" + JSON.stringify(categoryModify),
                }).then(function successCallback(response) {
                    console.log(response)
                    if (response.data.result.updated) {
                        Swal.fire({
                            position: 'top-end',
                            icon: 'success',
                            title: '¡Se ha actualizado la categoria!',
                            showConfirmButton: false,
                            timer: 1500
                        })
                    } else {
                        Swal.fire({
                            icon: 'error',
                            title: 'Oops...',
                            text: 'Porfavor de colocar datos validos ',
                        })
                    }
                    $scope.getAll()
                }, function errorCallback(response) {
                    console.log("aadadaa");
                });
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
            if ($scope.category == ""){
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'Porfavor de colocar datos validos ',
                })

            }else {
                if (result.isConfirmed) {
                    $http({
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/x-www-form-urlencoded',
                        },
                        url: 'http://localhost:8080/Strust2CRUD/register',
                        data: "params=" + JSON.stringify($scope.category),
                    }).then(function successCallback(response) {
                        console.log(response);
                        if (response.data.result.registered == true) {
                            Swal.fire({
                                position: 'top-end',
                                icon: 'success',
                                title: '¡Se ha registrado la categoria!',
                                showConfirmButton: false,
                                timer: 1500
                            })
                        }else{
                            Swal.fire({
                                icon: 'error',
                                title: 'Oops...',
                                text: 'La categoria ya existe  ',
                            })
                        }
                        $scope.getAll()
                        $scope.clear()
                    }, function errorCallback(response) {
                        Swal.fire({
                            icon: 'error',
                            title: 'Oops...',
                            text: 'Porfavor de colocar datos validos   ',

                        })
                    });
                }

            }
        })

    }

    $scope.validate = () =>{
        if($scope.category.nombre == undefined || $scope.category.nombre === ""){
            $scope.errorNombre= false;
            $scope.errorDescription = false;
            $scope.disabledFlag = true;
        }else
        if($scope.category.descripcion == undefined || $scope.category.descripcion === ""){
            $scope.errorNombre= false;
            $scope.errorDescription = true;
            $scope.disabledFlag = true;
        }else {
            $scope.errorNombre= false;
            $scope.errorDescription = false;
            $scope.disabledFlag = false
            ;
        }
    }

    $scope.validateUpdate = ()=>{
        if($scope.nombre == undefined || $scope.nombre === ""){
            $scope.errorNombre= false;
            $scope.errorDescription = false;
            $scope.disabledFlag2 = true;
        }else
        if($scope.descripcion == undefined || $scope.descripcion === ""){
            $scope.errorNombre= false;
            $scope.errorDescription = true;
            $scope.disabledFlag2 = true;
        }else {
            $scope.errorNombre= false;
            $scope.errorDescription = false;
            $scope.disabledFlag2= false
            ;
        }
    }

    $scope.clear = () =>{
        $scope.category.nombre = ""
        $scope.category.descripcion =""
        $scope.disabledFlag = true;
    }

});