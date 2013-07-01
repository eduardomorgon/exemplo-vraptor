<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<tiles:insertTemplate template="/WEB-INF/jsp/template.jsp">

    <tiles:putAttribute name="body">
        <table class="table table-bordered" style="width: 600px;">
            <thead>
                <tr>
                    <th style="text-align: center;"><fmt:message key="user.email"/></th>
                    <th style="text-align: center;"><fmt:message key="user.nome"/></th>
                    <th style="text-align: center;"><fmt:message key="editar"/></th>
                    <th style="text-align: center;"><fmt:message key="excluir"/></th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${listUsuario}" var="_v">
                <tr>
                    <td>${_v.email}</td>
                    <td>${_v.nome}</td>
                    <td style="text-align: center;">
                        <form action="<c:url value='/usuario'/>" method="post">
                            <input type='hidden' name='_method' value='put'/>
                            <input type='hidden' name='usuario.email' value='${_v.email}'/>
                            <input class="btn btn-mini" type="submit" value="<fmt:message key="editar"/>"/>
                        </form>
                    </td>
                    <td style="text-align: center;">
                        <form action="<c:url value='/usuario'/>" method="post">
                            <input type='hidden' name='_method' value='delete'/>
                            <input type='hidden' name='usuario.email' value='${_v.email}'/>
                            <input class="btn btn-mini" type="submit" value="<fmt:message key="excluir"/>"/>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <br/>
    <br/>
        
    <div id="dialog" title="Usuarios">
        <table id="users" class="table table-bordered">
            <thead>
                <tr class="ui-widget-header ">
                    <th>Email</th>
                    <th>Nome</th>
                </tr>
            </thead>
            <tbody>

            </tbody>
        </table>
    </div> 

   <script>
        // <![CDATA[
        function testeJson(){
            $.getJSON("<c:url value='/usuario/usuarios.json'/>", "", function(json) {   
                $("#users tbody tr").remove();
                for(var i=0;i < json.list.length;i++){
                    $( "#users tbody" ).append( "<tr>" +
                        "<td>" + json.list[i].email + "</td>" +
                        "<td>" + json.list[i].nome + "</td>" +
                      "</tr>" );
                }
            });    
            $( "#dialog" ).dialog( "open" );
        }
        $(function() {
            $( "#dialog" ).dialog({autoOpen: false,
                                   resizable: false});
        });




        // ]]>
    </script>
    </tiles:putAttribute>

</tiles:insertTemplate>