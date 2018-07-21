<%@ include file="/WEB-INF/views/includes/includes.jsp" %>
<!DOCTYPE html>
<html lang="fr">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Gestion de paie mvc</title>

    <!-- Bootstrap Core CSS -->
    <link href="<%=request.getContextPath() %>/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="<%=request.getContextPath() %>/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<%=request.getContextPath() %>/resources/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<%=request.getContextPath() %>/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	
	<link href="<%=request.getContextPath() %>/resources/css/jquery.datetimepicker.css" rel="stylesheet">
	
	<link href="<%=request.getContextPath() %>/resources/css/clockface.css" rel="stylesheet">
	
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <%@ include file="/WEB-INF/views/menu_top/topMenu.jsp" %>
            <!-- /.navbar-top-links -->

            <%@ include file="/WEB-INF/views/menu_left/leftMenu.jsp" %>
            <!-- /.navbar-static-side -->
        </nav>

        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h2 class="page-header"><fmt:message code="common.prestationInfo" /></h2>
                    </div>
                 </div>
                <!-- /.row -->
                 <div class="row">
                    <div class="col-lg-12">   
                    <div class="panel panel-primary">
                    <div class="panel-heading">
                    </div>
                    <div class="panel-body">
                    <c:url value="/employer/prestation/enregistrer" var="lienEnregistrer" />
                     <f:form modelAttribute="prestation" action="${lienEnregistrer }" method="POST">
                     <f:hidden path="idPrest"/>
									<div class="form-group">
										<label><fmt:message code="common.periode" /></label>
										<f:select name="periode" id="periode" path="periode"
											itemLabel="periode" itemValue="periode" class="form-control">
											<option value="${prestation.getPeriode()}">${prestation.getPeriode()}</option>
											<option value="janvier 2018">Janvier 2018</option>
											<option value="Févirier 2018">Février 2018</option>
											<option value="Mars 2018">Mars 2018</option>
											<option value="Avril 2018">Avril 2018</option>
											<option value="Mai 2018">Mai 2018</option>
											<option value="Juin 2018">Juin 2018</option>
											<option value="Juillet 2018">Juillet 2018</option>
											<option value="Août 2018">Août 2018</option>
											<option value="Septembre 2018">Septembre 2018</option>
											<option value="Octobre 2018">Octobre 2018</option>
											<option value="Novembre 2018">Novembre 2018</option>
											<option value="Décembre 2018">Décembre 2018</option>
										</f:select>
										<span id="error_periode" class="text-danger"></span>
									</div>
									<div class="form-group">
                            	<label><fmt:message code="common.date" />: </label>
                            	<f:input id="datetimepicker" path="datePrestation" class="form-control" placeholder="Entrer du texte" />
                          	</div>
									
									<div class="form-group">
                            	<label><fmt:message code="common.employe" />: </label>
                            	<f:select path="employe.idEmpl"  items="${employes }" itemLabel="nomEmpl" itemValue="idEmpl" class="form-control" placeholder="Entrer du texte" />
                          	</div>
                          	<div class="form-group">
                            	<label><fmt:message code="common.employe.affectation" />: </label>
                            	<f:select path="lieu_affectation.idLieu"  items="${affectations }" itemLabel="nomLieu" itemValue="idLieu" class="form-control" placeholder="Entrer du texte" />
                          	</div>
                            
                       
                          	<div class="input-append">
                            	<label><fmt:message code="common.heureDebut" />: </label>
                            	<f:input id="h_debut" path="heureDebut" class="input-small" readonly="" />
                            	<button class="btn" type="button" id="toggle-btn">
                            		<i class="glyphicon glyphicon-collapse-down"></i>
                            	</button>
                            </div> 
                            
                            <div class="input-append">
                            	<label><fmt:message code="common.heureFin" />: &nbsp;&nbsp;&nbsp;&nbsp;</label>
                            	<f:input id="h_fin" path="heureFin" class="input-small" readonly="" />
                            	<button class="btn" type="button" id="toggle-btn2">
                            		<i class="glyphicon glyphicon-collapse-down"></i>
                            	</button>
                            </div> 
                            
                            <div class="form-group">
                            	<label><fmt:message code="common.heurePrest" />: </label>
                            	<f:input id="h_prest" path="heurePrest" class="form-control" readonly="" />
                            </div>
                            <div class="panel-footer">
                            	<button type="submit" class="btn btn-primary"><i class="fa fa-save">&nbsp;<fmt:message code="common.enregistrer" /></i></button>
                            	<a href="<c:url value="/employer/prestation" />" class="btn btn-danger"><i class="fa fa-save">&nbsp;<fmt:message code="common.annuler" /></i></a>
                            </div> 
                      </f:form>
                     </div>  
                    </div>
                    </div>
                    <!-- /.col-lg-12 -->
                
            </div>
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="<%=request.getContextPath() %>/resources/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="<%=request.getContextPath() %>/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="<%=request.getContextPath() %>/resources/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="<%=request.getContextPath() %>/resources/dist/js/sb-admin-2.js"></script>
    
    <!-- Custom Theme JavaScript -->
    <script src="<%=request.getContextPath() %>/resources/javascript/prestation.js"></script>
    <script src="<%=request.getContextPath() %>/resources/javascript/jquery.datetimepicker.full.js"></script>
    <script>
    	$("#datetimepicker").datetimepicker();
    </script>
	
	<script src="<%=request.getContextPath() %>/resources/javascript/clockface.js"></script>
	<script>
    $(function(){
        $('#h_debut').clockface({
            format: 'HH:mm',
            trigger: 'manual'
        });  
        
        $('#h_fin').clockface({
            format: 'HH:mm',
            trigger: 'manual'
        }); 
     
        $('#toggle-btn').click(function(e){   
            e.stopPropagation();
            $('#h_debut').clockface('toggle');
        });
        
        $('#toggle-btn2').click(function(e){   
            e.stopPropagation();
            $('#h_fin').clockface('toggle');
        });
    });
    </script>
</body>

</html>
