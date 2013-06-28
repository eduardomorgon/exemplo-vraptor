<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<tiles:insertTemplate template="/WEB-INF/jsp/template.jsp">

    <tiles:putAttribute name="body">
        <form action="<c:url value='/usuario'/>" method="post">
            Email:<input type="text" name="usuario.email" value="${usuario.email}" /><br/>
            Nome: <input type="text" name="usuario.nome" value="${usuario.nome}"/><br/>
            Senha:<input type="password" name="usuario.senha" value="${usuario.senha}"/><br/>
            <input type="submit" value="Salvar" />
        </form>
        
    </tiles:putAttribute>

</tiles:insertTemplate>