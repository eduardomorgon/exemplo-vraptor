<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>VRaptor | Novo Usu&aacute;rio [listagem]</title>
        <link href="<c:url value="/css/bootstrap.css" />" rel="stylesheet">
        <script type="text/javascript" src="<c:url value="/js/jquery-2.0.2.min.js" />"></script> 
        <style>
            body {
                padding-top: 60px;
                padding-bottom: 40px;
            }
            .sidebar-nav {
                padding: 9px 0;
            }
        </style>
    </head>
    <body>
        <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container-fluid">
                    <a class="brand" href="#">Project name</a>
                    <div class="nav-collapse collapse">
                        <p class="navbar-text pull-right">
                            Logged in as <a href="#" class="navbar-link">Username</a>
                        </p>
                        <ul class="nav">
                            <li class="active"><a href="#">Home</a></li>
                            <li><a href="#about">About</a></li>
                            <li><a href="#contact">Contact</a></li>
                        </ul>
                    </div><!--/.nav-collapse -->
                </div>
            </div>
        </div>

        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span3">
                    <div class="well sidebar-nav" style="height: 500px;">
                        <ul class="nav nav-list">
                            <li class="nav-header">Menu</li>
                            <li class="active"><a href="#">Link</a></li>
                            <li><a href="#">Link</a></li>
                            <li><a href="#">Link</a></li>
                            <li><a href="#">Link</a></li>

                        </ul>
                    </div><!--/.well -->
                </div><!--/span-->
                <div class="span9" >
                    <div class="row" style="height: 400px;">
                        <form action="<c:url value='/usuario'/>" method="post">
                            Email:<input type="text" name="usuario.email" value="${usuario.email}" /><br/>
                            Nome: <input type="text" name="usuario.nome" value="${usuario.nome}"/><br/>
                            Senha:<input type="password" name="usuario.senha" value="${usuario.senha}"/><br/>
                            <input type="submit" value="Salvar" />
                        </form>
                    </div>
                </div><!--/span-->
            </div><!--/row-->

            <hr>

            <footer>
                <p>&copy; Company 2012</p>
            </footer>

        </div><!--/.fluid-container-->
    </body>
</html>
