<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<tiles:insertTemplate template="/WEB-INF/jsp/template.jsp">

    <tiles:putAttribute name="body">
        <form action="<c:url value='/usuario'/>" method="post">
            <fmt:message key="user.email"/>:<input type="text" name="usuario.email" value="${usuario.email}" /><br/>
            <fmt:message key="user.nome"/>: <input type="text" name="usuario.nome" value="${usuario.nome}"/><br/>
            <fmt:message key="user.senha"/>:<input type="password" name="usuario.senha"/><br/>
            <c:forEach items="${usuario.telefones}" var="_v">
                <li>${_v.telefonePk.telefone}</li>
                <li>${_v.tipo}</li>
            </c:forEach>
            
            
            <input type="submit" value="<fmt:message key="salvar"/>" />
        </form>
        
    </tiles:putAttribute>

</tiles:insertTemplate>