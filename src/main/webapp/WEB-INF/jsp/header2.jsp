<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

  <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="<c:url value='/index.htm'/>">
                    <img src="http://placehold.it/150x50&text=Home" alt="">
                </a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                                             <li>
                        <a href="#" data-toggle="modal" data-target="#weekoverviewmodal">Weekoverzicht</a>
                    </li>
                                                <li>
                        <a href="#" data-toggle="modal" data-target="#addordermodal">Voeg bestelling toe</a>
                    </li>
                                                                                                 <li>
                        <a href="#" data-toggle="modal" data-target="#addpersonmodal">Voeg persoon toe</a>
                    </li>


                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
  
  
    <!-- Add person modal -->
       <div class="modal fade addpersonmodal" tabindex="-1" role="dialog" aria-labelledby="addpersonmodal" aria-hidden="false" id="addpersonmodal">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-content">

                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="myModalLabel">Voeg persoon toe</h4>
                    </div>
                    <div class="modal-body">
                        <form id="addpersonform" method="POST" action="./person/add.htm" name="addpersonform">

                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                    <input id="first_name" type="text" class="form-control" placeholder="Voornaam" name="firstname" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                    <input id="last_name" type="text" class="form-control" placeholder="Achternaam" name="lastname" />
                                </div>
                            </div>

                        </form>
                    </div>
                    <div class="modal-footer">
                        <input type="submit" class="btn btn-blue" form="addpersonform" value="Submit"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
     <!-- Add order modal -->
       <div class="modal fade addordermodal" tabindex="-1" role="dialog" aria-labelledby="addordermodal" aria-hidden="false" id="addordermodal">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-content">

                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="myModalLabel">Maak een nieuwe bestelling</h4>
                    </div>
                    <div class="modal-body">
                        <form id="addorderform" method="POST" action="order/add.htm" name="requestacallform">

                                                        <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                     <input id="date" class="form-control" type="text" placeholder="Datum (dd/mm/yyyy)" pattern="\d{1,2}/\d{1,2}/\d{4}" required name="date" />
                                </div>
                            </div>
                           
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                    <input id="amount" type="text" class="form-control" placeholder="Totale prijs" name="amount" />
                                </div>
                            </div>
                            

                            Bestellen voor:
                                 
                             <div class="form-group">
                                 
                             <c:forEach var="person" items="${persons}">

                                 <div class="checkbox-inline no_indent">
                                      <label><input type="checkbox" name="persons" value='<c:out value="${person.id}" />'><c:out value="${person.name}" /></label>
                                </div>
                                
                                 
                             </c:forEach>     
                                 
                            </div>

                        </form>
                    </div>
                    <div class="modal-footer">
                        <input type="submit" class="btn btn-blue" form="addorderform" value="Submit"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
     
       <!-- Week overview modal -->
       <div class="modal fade weekoverviewmodal" tabindex="-1" role="dialog" aria-labelledby="weekoverviewmodal" aria-hidden="false" id="weekoverviewmodal">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-content">

                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="myModalLabel">Bestelling per week</h4>
                    </div>
                    <div class="modal-body">
                        <form id="requestacallform" method="POST" name="requestacallform">

                             <div class='row'>
                             <div class="col-xs-2">
                             <a href="#" class="btn btn-info btn-sm">
          <span class="glyphicon glyphicon-chevron-left"></span>
        </a>
                            </div>
                             
                              <div class="form-group col-xs-8">
                                <div class="input-group">
                                    <h4>29/03/16</h4>
                                </div>
                            </div>
                             <div class="col-xs-2">
                             <a href="#" class="btn btn-info btn-sm">
          <span class="glyphicon glyphicon-chevron-right"></span>
        </a>
                            </div>
                            </div>
                              
                              
                               <p>Totale prijs: 12.45 €</p>
                               
                            
                            
                             
                            
                             <div class="form-group">
                                Besteld voor:
                                <ul>
                                    <li>Pieter Laermans</li>
                                    <li>Charlotte Luckx</li>
                                    <li>Joris Houteven</li>
                                    <li>Rani Limme</li>
                                </ul>
                                                                  
                                 
                            </div>

                        </form>
                    </div>

                </div>
            </div>
        </div>
    </div>
       

