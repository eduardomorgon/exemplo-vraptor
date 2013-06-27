<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>VRaptor | Usu&aacute;rio [listagem]</title>
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
                            <li><a href="${pageContext.request.contextPath}/usuario/novo">Novo</a></li>
                            <li><a href="${pageContext.request.contextPath}/usuario/usuarios.json">Json</a></li>
                            <li><a href="#" onclick="testeJson();">Json Jquery</a></li>

                        </ul>
                    </div><!--/.well -->
                </div><!--/span-->
                <div class="span9" >
                    <div class="row" style="height: 600px;">
                        
                        <br/>
                        <br/>
                        <table class="table table-bordered" style="width: 600px;">
                            <thead>
                                <tr>
                                    <th style="text-align: center;">E-mail</th>
                                    <th style="text-align: center;">Nome</th>
                                    <!--<th style="text-align: center;">Senha</th>-->
                                    <th style="text-align: center;">Editar</th>
                                    <th style="text-align: center;">Excluir</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${listUsuario}" var="_v">
                                    <tr>
                                        <td>${_v.email}</td>
                                        <td>${_v.nome}</td>
                                        <!--<td> {_v.senha} </td>-->
                                        <td style="text-align: center;">
                                            <form action="<c:url value='/usuario'/>" method="post">
                                                <input type='hidden' name='_method' value='put'/>
                                                <input type='hidden' name='usuario.email' value='${_v.email}'/>
                                                <input class="btn btn-mini" type="submit" value="Editar"/>
                                            </form>
                                        </td>
                                        <td style="text-align: center;">
                                            <form action="<c:url value='/usuario'/>" method="post">
                                                <input type='hidden' name='_method' value='delete'/>
                                                <input type='hidden' name='usuario.email' value='${_v.email}'/>
                                                <input class="btn btn-mini" type="submit" value="Excluir"/>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div><!--/span-->
            </div><!--/row-->

            <hr>

            <footer>
                <p>&copy; Company 2012</p>
            </footer>

        </div><!--/.fluid-container-->
        
        <script>
            // <![CDATA[
            function testeJson(){
                $.getJSON("<c:url value='/usuario/usuarios.json'/>", "", function(json) {     
                    for(var i=0;i < json.list.length;i++){
                        alert("E-mail: "+json.list[i].email+" - Nome: "+json.list[i].nome); 
                    }
                });    
            }
            // ]]>
        </script>
    </body>
</html>
