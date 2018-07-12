<!DOCTYPE html>
<html lang="en">
<head>
    <style>
        .editBtn{
            background-color: #007bff;
            color: #fff;
            padding: 5px 5px;
            margin: 10px 0 ;
            border: none;
            cursor: pointer;
            width: 10%;
            border-radius: 20px;
        }
        a.editBtn:hover{
            text-decoration: none;
            opacity: 0.9;
            background-color: cornflowerblue;
            color:white;
        }

    </style>
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/blog-home.css" rel="stylesheet">

</head>
<body>
    <!-- Blog Post -->
    <#list articulos as articulo>
        <div class="card mb-4">
            <img class="card-img-top" src="http://placehold.it/750x300" alt="Card image cap">
            <div class="card-body">
                <#if logUser??>
                    <#if logUser.administrador || logUser.autor>
                        <a href="/editarArticulo/${articulo.id}" class="editBtn">Editar</a>
                        <br>
                        <br>
                    </#if>
                </#if>
                <h2 class="card-title">${articulo.titulo}</h2>
                <p class="card-text">
                ${articulo.textoResumido()}
                </p>
                <a href="/leerArticuloCompleto/${articulo.id}" class="btn btn-primary">Leer más &rarr;</a>
            </div>
            <div class="card-footer text-muted">
                Subido en ${articulo.fechaText()} por
                <a href="#">${articulo.autor.nombre}</a>
            </div>
        </div>
    </#list>

    <!-- Pagination -->
    <ul class="pagination justify-content-center mb-4">
        <#if validP??>
            <li class="page-item">
                <a class="page-link prev-btn">&larr; Older</a>
            </li>
        <#else>
            <li class="page-item disabled">
                <a class="page-link prev-btn">&larr; Older</a>
            </li>
        </#if>
        <#if validN??>
            <li class="page-item">
                <a class="page-link next-btn">Newer &rarr;</a>
            </li>
        <#else>
            <li class="page-item disabled">
                <a class="page-link next-btn">Newer &rarr;</a>
            </li>
        </#if>
    </ul>
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script>
        var prevPage = "${prevPage}";
        var nextPage = "${nextPage}";

        $(".prev-btn").on("click", function(){
                console.log("Prev Page: " + prevPage);
                $("#articulos-container").load("/pagina?page=" + prevPage);
        });

        // handling the next-btn
        $(".next-btn").on("click", function(){
            $("#articulos-container").load("/pagina?page=" + nextPage);
                console.log("Next Page: " + nextPage);

        });

    </script>
</body>
</html>