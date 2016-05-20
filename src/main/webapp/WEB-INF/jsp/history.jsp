<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <jsp:include page="head2.jsp">
        <jsp:param name="title" value="Persoonlijke geschiedenis" />
    </jsp:include>


    <body>

            <%@include file="header2.jsp" %>

           
            <main>
              
    <!-- Page Content -->
    <div class="container">
        <div class="row box">
            <div class="col-lg-12">






                <h1><c:out value="${person.name}"/></h1>
                <p></p>

                <table class="table table-inverse">
                    <thead>
                        <tr>
                            <th>Datum</th>

                            <th>Bedrag</th>
                            <th>Type</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="transaction" items="${transactions}">
                        <tr>
                            <td><c:out value="${transaction.formattedDate}"/></td>

                            <td><c:out value="${transaction.transactionValue}"/> €</td>

                            <td><c:out value="${transaction.type}"/></td>

                        </tr>
                        </c:forEach>
                    </tbody>
                </table>

            </div>
        </div>
    </div>
    <!-- /.container -->