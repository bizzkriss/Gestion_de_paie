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
                        <h1 class="page-header"><fmt:message code="common.employe" /></h1>
                    </div>
                 </div>
                <!-- /.row -->
                 <div class="row">
                    <div class="col-lg-12">   
                    <div class="panel panel-primary">
                    <div class="panel-heading">
                    </div>
                    <div class="panel-body">
                    <c:url value="/employer/enregistrer" var="lienEnregistrer" />
                     <f:form modelAttribute="employe" action="${lienEnregistrer }" method="POST" enctype="multipart/form-data">
                     <f:hidden path="idEmpl"/>
                     <f:hidden path="photo"/>
                            <div class="form-group">
                            	<label><fmt:message code="common.nom" />: </label>
                            	<f:input path="nomEmpl" class="form-control" placeholder="Entrer du texte" />
                          	</div>
                       
                           	<div class="form-group">
                            	<label><fmt:message code="common.departement" />: </label>
                            	<f:select path="departement.idDep"  items="${departements }" itemLabel="nomDep" itemValue="idDep" class="form-control" placeholder="Entrer du texte" />
                          	</div>
                          	<div class="form-group">
                            	<label><fmt:message code="common.adresse" />: </label>
                            	<f:input path="adress" class="form-control" placeholder="Entrer du texte" />
                            </div> 
                            
                            <div class="form-group">
                            	<label><fmt:message code="common.mail" />: </label>
                            	<f:input path="mail" class="form-control" placeholder="Entrer du texte" />
                            </div> 
                            
                            <div class="form-group">
                            	<label><fmt:message code="common.photo" />: </label>
                            	<input type="file"  name="file" />
                            </div>
                            <div class="panel-footer">
                            	<button type="submit" class="btn btn-primary"><i class="fa fa-save">&nbsp;<fmt:message code="common.enregistrer" /></i></button>
                            	<a href="<c:url value="/employer/" />" class="btn btn-danger"><i class="fa fa-save">&nbsp;<fmt:message code="common.annuler" /></i></a>
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

</body>

</html>
