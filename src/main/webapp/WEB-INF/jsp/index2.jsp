<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <jsp:include page="head2.jsp">
        <jsp:param name="title" value="Betalingsoverzicht" />
    </jsp:include>


    <body>

            <%@include file="header2.jsp" %>

           
            <main>
              
    <!-- Page Content -->
    <div class="container">
        <div class="row box">
            <div class="col-lg-12">






                <h1>Overzicht</h1>
                <p>Klik op een naam voor extra info, druk op het +-teken om een betaling voor de bijhorende persoon toe te voegen</p>

                <table class="table table-inverse table-hover">
                    <thead>
                        <tr>
                            <th>Naam</th>

                            <th>Huidig saldo</th>
                            <th>Bestelling voor deze week</th>
                            <th>Betaling toevoegen</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:set var="total" value="${0}"/>    
                        <c:forEach var="person" items="${persons}">
                             <tr class='clickable-row' data-url='./person.htm?personid=<c:out value="${person.id}" />'>
                            <td><c:out value="${person.name}" /></td>

                            <td><c:out value="${person.saldo}" /> €</td>

                            <td>-2.25 €</td>
                            <td>
                                <button class="btn btn-success" data-toggle="modal" data-target="#addpayment" onclick="setAddPaymentId('<c:out value="${person.id}" />')">+</button>
                            </td>

                            </tr>
                            <c:set var="total" value="${total + person.saldo}"/> 
                        </c:forEach>
                        
                        <tr>
                            <th>Totaal:</th>

                            <td><c:out value="${total}" /> €</td>

                            <td>-4.50 €</td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>

            </div>
        </div>
    </div>
    <!-- /.container -->
            </main>


    
    
            <!-- Add payment modal -->
       <div class="modal fade addpayment" tabindex="-1" role="dialog" aria-labelledby="addpayment" aria-hidden="false" id="addpayment">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-content">

                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="myModalLabel">Voeg een betaling toe</h4>
                    </div>
                    <div class="modal-body">
                        <form id="addPaymentForm" action="payment/add/-1.htm" method="POST" name="requestacallform">

                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                    <input type="text" class="form-control" placeholder="Bedrag" name="addPaymentAmount" />
                                   
                                </div>
                            </div>

                        </form>
                    </div>
                    <div class="modal-footer">
                        <input type="submit" class="btn btn-blue" form="addPaymentForm" value="Submit"/>
                    </div>






                </div>
            </div>
        </div>
    </div>
    
    </body>
</html>