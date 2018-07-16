<!DOCTYPE html>
<html lang="en">

  <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <meta name="description" content="">
      <meta name="author" content="">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

      <title>${titulo}</title>

      <!-- Bootstrap core CSS -->
      <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

      <!-- Custom styles for this template -->
      <link href="css/blog-home.css" rel="stylesheet">
      <style>
          .chatbubble {
              position: fixed;
              bottom: 0;
              right: 30px;
              transform: translateY(300px);
              transition: transform .3s ease-in-out;
          }
          .chatbubble.opened {
              transform: translateY(0)
          }
          .chatbubble .unexpanded {
              display: block;
              background-color: #e23e3e;
              padding: 10px 15px 10px;
              position: relative;
              cursor: pointer;
              width: 350px;
              border-radius: 10px 10px 0 0;
          }
          .chatbubble .expanded {
              height: 300px;
              width: 350px;
              background-color: #fff;
              text-align: left;
              padding: 10px;
              color: #333;
              text-shadow: none;
              font-size: 14px;
          }
          .chatbubble .chat-window {
              overflow: auto;
          }
          .chatbubble .loader-wrapper {
              margin-top: 50px;
              text-align: center;
          }
          .chatbubble .messages {
              display: none;
              list-style: none;
              margin: 0 0 50px;
              padding: 0;
          }
          .chatbubble .messages li {
              width: 85%;
              float: left;
              padding: 10px;
              border-radius: 5px 5px 5px 0;
              font-size: 14px;
              background: #c9f1e6;
              margin-bottom: 10px;
          }
          .chatbubble .messages li .sender {
              font-weight: 600;
          }
          .chatbubble .messages li.support {
              float: right;
              text-align: right;
              color: #fff;
              background-color: #e33d3d;
              border-radius: 5px 5px 0 5px;
          }
          .chatbubble .chats .input {
              position: absolute;
              bottom: 0;
              padding: 10px;
              left: 0;
              width: 100%;
              background: #f0f0f0;
              display: none;
          }
          .chatbubble .chats .input .form-group {
              width: 80%;
          }
          .chatbubble .chats .input input {
              width: 100%;
          }
          .chatbubble .chats .input button {
              width: 20%;
          }

          .chatbubble .chats {
              display: none;
          }
          .chatbubble .login-screen {
              margin-top: 20px;
              display: none;
          }
          .chatbubble .chats.active,
          .chatbubble .login-screen.active {
              display: block;
          }
      </style>
      <script>
          $(document).ready(function () {
              $('.chatbubble').find('.unexpanded').click(function () {
                  $('.chatbubble').toggleClass('opened');
                  if($('.chatbubble').hasClass('opened'))
                      showChatLogIn();

                  $('.chatbubble').find('.unexpanded').find('.title').text(
                          $('.chatbubble').hasClass('opened') ? 'Minimizar Chat' : 'Chat'
                  );
              });

          });

          function showChatLogIn() {
              $('.chatbubble').find('.chat-window').find('.chats').removeClass('active');
              $('.chatbubble').find('.chat-window').find('.login-screen').addClass('active');
          }
      </script>
  </head>

  <body>

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
        <div class="container">
            <a class="navbar-brand" href="/">Blog de Artículos A&E</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="/">Inicio
                            <span class="sr-only">(current)</span>
                        </a>
                    </li>
                    <#if logUser??>
                        <#if logUser.administrador || logUser.autor>
                            <li class="nav-item">
                                <a class="nav-link" href="/publicarArticulo">Artículos</a>
                            </li>
                        </#if>
                    </#if>

                    <#if logUser??>
                        <#if logUser.administrador>
                            <li class="nav-item">
                                <a class="nav-link" href="/listaUsuarios">Gestionar Usuarios</a>
                            </li>
                        </#if>
                    </#if>
                    <#if logUser??>
                        <li class="nav-item">
                            <a class="nav-link" href="/logout">Cerrar sesión</a>
                        </li>
                    <#else>
                        <li class="nav-item">
                            <a class="nav-link" href="/iniciarSesion">Iniciar sesión</a>
                        </li>
                    </#if>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Page Content -->
    <div class="container">

      <div class="row">

        <!-- Blog Entries Column -->
        <div class="col-md-8">
            <h1 class="my-4">Artículos
                <small>Últimas publicaciones</small>
            </h1>
            <div id="articulos-container">

            </div>


        </div>

        <!-- Sidebar Widgets Column -->
        <div class="col-md-4">

          <!-- Categories Widget -->
            <div class="card my-4">
                <h5 class="card-header">Tags</h5>
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-6">
                            <ul class="list-unstyled mb-0">
                                <#list tagsCol1 as t1>
                                    <li>
                                        <a href="/busquedaPorTag?page=1&tag=${t1}">${t1}</a>
                                    </li>
                                </#list>
                            </ul>
                        </div>
                        <div class="col-lg-6">
                            <ul class="list-unstyled mb-0">
                                <#list tagsCol2 as t2>
                                    <li>
                                        <a href="/busquedaPorTag?page=1&tag=${t2}">${t2}</a>
                                    </li>
                                </#list>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

        </div>

      </div>
      <!-- /.row -->
        <div class="chatbubble">
            <div class="unexpanded">
                <div class="title">Chat</div>
            </div>
            <div class="expanded chat-window">
                <div class="login-screen container">
                    <form id="loginScreenForm">
                        <div class="form-group">
                            <input type="text" class="form-control" id="fullname" placeholder="Nombre" required>
                        </div>
                        <button type="submit" class="btn btn-block btn-primary">Comenzar Chat</button>
                    </form>
                </div>
                <div class="chats">
                    <div class="loader-wrapper">
                        <div class="loader">
                            <span>{</span><span>}</span>
                        </div>
                    </div>
                    <ul class="messages clearfix">
                    </ul>
                    <div class="input">
                        <form class="form-inline" id="messageSupport">
                            <div class="form-group">
                                <input type="text" autocomplete="off" class="form-control" id="newMessage">
                            </div>
                            <button type="submit" class="btn btn-primary">Enviar</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /.container -->

    <!-- Footer -->
    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Your Website 2018</p>
      </div>
      <!-- /.container -->
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script>
        $("#articulos-container").load("/pagina?page=" + 1);
    </script>

  </body>

</html>
