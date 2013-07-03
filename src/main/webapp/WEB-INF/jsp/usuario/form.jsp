<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<tiles:insertTemplate template="/WEB-INF/jsp/template.jsp">

    <tiles:putAttribute name="body">
        <form id="fomrUsuario" action="<c:url value='/usuario'/>" method="post">
            <fmt:message key="user.email"/>:<input type="text" name="usuario.email" value="${usuario.email}" /><br/>
            <fmt:message key="user.nome"/>: <input type="text" name="usuario.nome" value="${usuario.nome}"/><br/>
            <fmt:message key="user.senha"/>:<input type="password" name="usuario.senha"/><br/>
            
            <input type="button" class="btn btn-mini" value="Novo" onclick="formTelefone();"/>
            <br/>
            <br/>
            <table id="tableTelefones" class="table table-bordered">
                <thead>
                    <tr>
                        <th style="text-align: center;"><fmt:message key="telefone.tipo"/></th>
                        <th style="text-align: center;"><fmt:message key="telefone.telefone"/></th>
                        <th style="text-align: center;"><fmt:message key="editar"/></th>
                        <th style="text-align: center;"><fmt:message key="excluir"/></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${usuario.telefones}" var="_v">
                        <tr>
                            <td class="tel">${_v.telefonePk.telefone}</td>
                            <td class="tipo">${_v.tipo}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

        <input type="submit" value="<fmt:message key="salvar"/>" />
        <input type="button" value="teste Table" onclick="salvarUsuario()"/>
        </form>
             
        <div id="dialogFormTel" title="Telefones">
            <form id="formTel">
                <fmt:message key="telefone.telefone"/>: <input type="text" id="tipoTel" name="telefone.tipo"/><br/>
                <fmt:message key="telefone.tipo"/>:<input type="text" id="telefone" name="telefone.telefonePk.telefone"  /><br/>
                <input type="button" value="<fmt:message key="salvar"/>" onclick="addTelefone();"/>
            </form>
        </div>
               
            
        <script>
        // <![CDATA[
             
            function addTelefone() {
                
                $('#tableTelefones > tbody:last')
                        .append('<tr>'+
                                    '<td>'+$('#tipoTel').val()+'</td>'+
                                    '<td>'+$('#telefone').val()+'</td>'+
                                    '<td><input type="submit" value="<fmt:message key="editar"/>"/></td>'+
                                    '<td><input type="submit" value="<fmt:message key="excluir"/>"/></td>'+
                                '</tr>');
                $('#dialogFormTel').dialog('close');
            }
            
            function formTelefone() {
                $("#tipoTel").val("");
                $("#telefone").val("");
                $('#dialogFormTel').dialog('open');

            }
            
            
            function salvarUsuario(){
                var row = -1;
                $('#tableTelefones tr').each(function (){
                    $(this).find('td:nth-child(1)').each(function(){
                        var input = $("<input/>").attr("type", "hidden").attr("name","usuario.telefones["+row+"].telefonePk.telefone").val($(this).text());
                        $('#fomrUsuario').append($(input));
                    });
                    $(this).find('td:nth-child(2)').each(function(){
                        var input = $("<input/>").attr("type", "hidden").attr("name","usuario.telefones["+row+"].tipo").val($(this).text());
                        $('#fomrUsuario').append($(input));
                    });
                    row++;
                });
                $('#fomrUsuario').submit();
            }
            
     
            function loadJsonTelefone() {
                $.getJSON("<c:url value='/usuario/usuarios.json'/>", "", function(json) {   
                $("#tableTelefones tbody tr").remove();
                $("#tableTelefones").addClass("table table-bordered");
                for(var i=0;i < json.list.length;i++){
                    $( "#tableTelefones tbody" ).append( "<tr>" +
                        "<td>" + json.list[i].telefonePk.telefone + "</td>" +
                        "<td>" + json.list[i].tipo + "</td>" +
                        "<td>  <input type='submit' value='<fmt:message key='excluir'/>'/></td>"+
                        "<td>  <input type='submit' value='<fmt:message key='editar'/>'/></td>"+
                      "</tr>" );
                }
                $("#tableTelefones td input").addClass("btn btn-mini");
            });    
            }
            $(function() {
                $("#dialogFormTel").dialog({autoOpen: false,
                                   resizable: false});
                                        });
            
        
        // ]]>
        </script>
        
    </tiles:putAttribute>

</tiles:insertTemplate>