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
    
    <!-- DataTables CSS -->
    <link href="<%=request.getContextPath() %>/resources/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="<%=request.getContextPath() %>/resources/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

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
                        <h2 align="center" class="page-header"><fmt:message code="common.employe.allBulletin" /></h2>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
            </div>
            <div class="row">
            	<div class="col-lg-12">
            		<ol class="breadcrumb">
					  <li><a href="<c:url value="/paie/bulletin/nouveau" />"><i class="fa fa-plus">&nbsp;<fmt:message code="common.ajouter" /></i></a></li>
					  <li><a href="#"><i class="fa fa-download">&nbsp;<fmt:message code="common.exporter" /></i></a></li>
					  <li><a href="#"><i class="fa fa-upload">&nbsp;<fmt:message code="common.importer" /></i></a></li>
					</ol>
            	</div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <fmt:message code="common.employe.listBulletin" />
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                    	<th><fmt:message code="common.reference" /></th>
                                        <th><fmt:message code="common.lot" /></th>
                                        <th><fmt:message code="common.dateDebut" /></th>
                                        <th><fmt:message code="common.dateFin" /></th>
                                        <th><fmt:message code="common.total" /></th>
                                    </tr>
                                </thead>
                                <tbody>
                                
                                <c:forEach items="${bulletins }" var="bulletin">
                                	<tr class="odd gradeX">
                                		<td>${bulletin.getCodeBulletin()}</td>
                                        <td>${bulletin.getPeriode() }</td>
                                        <td>${bulletin.getDateDeb()}</td>
                                        <td>${bulletin.getDateFin()}</td>
                                        <td>${bulletin.getTotalBulletin()}</td>
                                        <td class="center">
                                        	<c:url value="/paie/bulletin/modifier/${bulletin.getIdBulletin() }" var="lienModifier" />
                                        	<a href="${lienModifier }"><i class="fa fa-edit">&nbsp;</i></a>
                                        	&nbsp;|&nbsp;
                                        	<a href="javascript:void(0);" data-toggle="modal" data-target="#modalEmploye${bulletin.getIdBulletin() }"><i class="fa fa-trash-o"></i></a>
	                                        	<div class="modal fade" id="modalEmploye${bulletin.getIdBulletin() }" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
													<div class="modal-dialog">
														<div class="modal-content">
															<div class="modal-header">
																<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
																<h4 class="modal-title" id="myModalLabel"><fmt:message code="common.confirm.suppression" /></h4>
															</div>
															<div class="modal-body">
																<fmt:message code="common.confirm.suppression.msg" />
															</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-default" data-dismiss="modal"><fmt:message code="common.annuler" /></button>
																<c:url value="/paie/bulletin/supprimer/${bulletin.getIdBulletin() }" var="urlSuppression" />
																<a href="${urlSuppression }" class="btn btn-danger"><i class="fa fa-trash-o"></i>&nbsp;<fmt:message code="common.confirmer" /></a>
															</div>
														</div>
														<!-- /.modal-content -->
													</div>
													<!-- /.modal-dialog -->
												</div>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <!-- /.table-responsive -->
                            
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
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

    <!-- DataTables JavaScript -->
    <script src="<%=request.getContextPath() %>/resources/vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/vendor/datatables-responsive/dataTables.responsive.js"></script>

	<!-- Custom Theme JavaScript -->
    <script src="<%=request.getContextPath() %>/resources/dist/js/sb-admin-2.js"></script>

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
            responsive: true
        });
    });
    </script>
</body>

</html>
