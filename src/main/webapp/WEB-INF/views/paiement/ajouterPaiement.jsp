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
	<style>
  .box
  {
   width:800px;
   margin:0 auto;
  }
  .active_tab1
  {
   background-color:#fff;
   color:#333;
   font-weight: 600;
  }
  .inactive_tab1
  {
   background-color: #f5f5f5;
   color: #333;
   cursor: not-allowed;
  }
  .has-error
  {
   border-color:#cc0000;
   background-color:#ffff99;
  }
  </style>
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
                        <h2 align="center" class="page-header"><fmt:message code="paiement.assistant" /></h2>
                    </div>
                 </div>
                <!-- /.row -->
                 <div class="row">
                    <div class="col-lg-12">   
                    <c:url value="/paie/paiement/enregistrer" var="lienEnregistrer" />
                    <f:form modelAttribute="paiement" action="${lienEnregistrer }" method="post" id="register_form">
    <ul class="nav nav-tabs">
     <li class="nav-item">
      <a class="nav-link active_tab1" style="border:1px solid #ccc" id="list_bulletin_details"><fmt:message code="paiement.selectBulletin" /></a>
     </li>
     <li class="nav-item">
      <a class="nav-link inactive_tab1" id="list_employe_details" style="border:1px solid #ccc"><fmt:message code="paiement.selectEmploye" /></a>
     </li>
     <li class="nav-item">
      <a class="nav-link inactive_tab1" id="list_paiement_details" style="border:1px solid #ccc"><fmt:message code="paiement.info" /></a>
     </li>
     <li class="nav-item">
      <a class="nav-link inactive_tab1" id="list_avantage_details" style="border:1px solid #ccc"><fmt:message code="anvantage.detail" /></a>
     </li>
     <li class="nav-item">
      <a class="nav-link inactive_tab1" id="list_deduction_details" style="border:1px solid #ccc"><fmt:message code="deduction.detail" /></a>
     </li>
     <li class="nav-item">
      <a class="nav-link inactive_tab1" id="list_reduction_details" style="border:1px solid #ccc"><fmt:message code="reduction.detail" /></a>
     </li>
    </ul>
    <div class="tab-content" style="margin-top:16px;">
     
     <div class="tab-pane active" id="bulletin_details">
      <div class="panel panel-default">
       <div class="panel-heading"><fmt:message code="paiement.selectBulletin" /></div>
       <div class="panel-body">
        <div class="form-group">
         <label><fmt:message code="common.paie.bul" /></label>
         
         <f:select name="bul" id="bul" path="bulletin.idBulletin"  items="${bulletins }" itemLabel="nomBul" itemValue="idBulletin" class="form-control" />
         <span id="error_bul" class="text-danger"></span>
        </div>
        <div class="form-group">
          <a href="<c:url value="/paie/bulletin/nouveau" />"><i class="fa fa-plus">&nbsp;<fmt:message code="paiement.addBulletin" /></i></a>
        </div>
        <div class="form-group">
         <label><fmt:message code="common.periode" /></label>
         <f:select name="periode" id="periode" path="periode" itemLabel="periode" itemValue="periode" class="form-control" >
         	<option value="Janvier 2018">Janvier 2018</option>
         	<option value="Février 2018">Février 2018</option>
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
        <br />
        <div align="center">
         <button type="button" name="btn_bulletin_details" id="btn_bulletin_details" class="btn btn-info btn-lg">Next</button>
        </div>
        <br />
       </div>
      </div>
     </div>
     
     <div class="tab-pane fade" id="employe_details">
      <div class="panel panel-default">
       <div class="panel-heading"><fmt:message code="paiement.selectEmploye" /></div>
       <div class="panel-body">
        <div class="form-group">
         <label><fmt:message code="common.employe" /></label>
         <f:select name="empl" id="empl" path="employe.idEmpl"  items="${employes }" itemLabel="nomEmpl" itemValue="idEmpl" class="form-control" />
         <span id="error_empl" class="text-danger"></span>
        </div>
        <div class="form-group">
          <a href="<c:url value="/employer/nouveau" />"><i class="fa fa-plus">&nbsp;<fmt:message code="paiement.addEmploye" /></i></a>
        </div>
        
        <br />
        <div align="center">
         <button type="button" name="previous_btn_employe_details" id="previous_btn_employe_details" class="btn btn-default btn-lg">Previous</button>
         <button type="button" name="btn_employe_details" id="btn_employe_details" class="btn btn-info btn-lg">Next</button>
        </div>
        <br />
       </div>
      </div>
     </div>
     
     <div class="tab-pane fade" id="paiement_details">
      <div class="panel panel-default">
       <div class="panel-heading"><fmt:message code="paiement.detail" /></div>
       <div class="panel-body">
        <div class="form-group">
         <label><fmt:message code="common.code" /></label>
         <f:input path="codeSalaire" name="codeSalaire"  id="codeSalaire" class="form-control" readonly="true" />
         
        </div>
        
        <div class="form-group">
         <label><fmt:message code="common.prime" /></label>
         <f:input path="primeFonction" name="primeFonction"  id="primeFonction" class="form-control" placeholder="Entrer du texte" />
         <span id="error_primeFonction" class="text-danger"></span>
        </div>
        <div class="form-group">
         <label><fmt:message code="common.primeDip" /></label>
         <f:input path="primeDipmlome" name="primeDipmlome"  id="primeDipmlome" class="form-control" placeholder="Entrer du texte" />
         <span id="error_primeDipmlome" class="text-danger"></span>
        </div>
        <div class="form-group">
         <label><fmt:message code="common.annuite" /></label>
         <f:input path="annuites" name="annuites"  id="annuites" class="form-control" placeholder="Entrer du texte" />
         <span id="error_annuites" class="text-danger"></span>
        </div>
        <div class="form-group">
         <label><fmt:message code="common.regularisation" /></label>
         <f:input path="regularisation" name="regularisation"  id="regularisation" class="form-control" placeholder="Entrer du texte" />
         <span id="error_regularisation" class="text-danger"></span>
        </div>
        <br />
        <div align="center">
         <button type="button" name="previous_btn_paiement_details" id="previous_btn_paiement_details" class="btn btn-default btn-lg">Previous</button>
         
         <button type="button" name="btn_paiement_details" id="btn_paiement_details" class="btn btn-info btn-lg">Next</button>
        </div>
        <br />
       </div>
      </div>
     </div>
     
     <div class="tab-pane fade" id="avantage_details">
      <div class="panel panel-default">
       <div class="panel-heading"><fmt:message code="anvantage.detail" /></div>
       <div class="panel-body">
        <div class="form-group">
         <label><fmt:message code="common.logement" /></label>
         <f:input path="logement" name="logement"  id="logement" class="form-control"  placeholder="Entrer du texte"/>
         
        </div>
        
        <div class="form-group">
         <label><fmt:message code="common.transport" /></label>
         <f:input path="transport" name="transport"  id="transport" class="form-control" placeholder="Entrer du texte" />
        </div>
        <div class="form-group">
         <label><fmt:message code="common.familliale" /></label>
         <f:input path="familliale" name="familliale"  id="familliale" class="form-control" placeholder="Entrer du texte" />
        </div>
        <br />
        <div align="center">
         <button type="button" name="previous_btn_avantage_details" id="previous_btn_avantage_details" class="btn btn-default btn-lg">Previous</button>
         <button type="button" name="btn_avantage_details" id="btn_avantage_details" class="btn btn-success btn-lg">Register</button>
        </div>
        <br />
       </div>
      </div>
     </div>
     
     <div class="tab-pane fade" id="deduction_details">
      <div class="panel panel-default">
       <div class="panel-heading"><fmt:message code="deduction.detail" /></div>
       <div class="panel-body">
        <div class="form-group">
         <label><fmt:message code="common.inss" /></label>
         <f:input path="inss" name="inss"  id="inss" class="form-control"   />
         
        </div>
        
        <div class="form-group">
         <label><fmt:message code="common.ipr" /></label>
         <f:input path="retenu" name="retenu"  id="retenu" class="form-control"  />
        </div>
        <br />
        <div align="center">
         <button type="button" name="previous_btn_deduction_details" id="previous_btn_deduction_details" class="btn btn-default btn-lg">Previous</button>
         <button type="button" name="btn_deduction_details" id="btn_deduction_details" class="btn btn-success btn-lg">Register</button>
        </div>
        <br />
       </div>
      </div>
     </div>
     
     
     <div class="tab-pane fade" id="reduction_details">
      <div class="panel panel-default">
       <div class="panel-heading"><fmt:message code="reduction.detail" /></div>
       <div class="panel-body">
        <div class="form-group">
         <label><fmt:message code="common.avance" /></label>
         <f:input path="avance" name="avance"  id="avance" class="form-control"  placeholder="Entrer du texte" />
         
        </div>
        
        <div class="form-group">
         <label><fmt:message code="common.acompte" /></label>
         <f:input path="acompte" name="acompte"  id="acompte" class="form-control" placeholder="Entrer du texte" />
        </div>
        <label><fmt:message code="common.pretEchus" /></label>
         <f:input path="pretEchus" name="pretEchus"  id="pretEchus" class="form-control"  placeholder="Entrer du texte" />
         
        
        <label><fmt:message code="common.epargne" /></label>
         <f:input path="epargne" name="epargne"  id="epargne" class="form-control"  placeholder="Entrer du texte" />
         
        
        
        <div class="form-group">
         <label><fmt:message code="common.contribution" /></label>
         <f:input path="contribution" name="contribution"  id="contribution" class="form-control" placeholder="Entrer du texte" />
        </div>
        <label><fmt:message code="common.suspendu" /></label>
         <f:input path="suspendu" name="suspendu"  id="suspendu" class="form-control"  placeholder="Entrer du texte" />
         
        
        
        <div class="form-group">
         <label><fmt:message code="common.muso" /></label>
         <f:input path="muso" name="muso"  id="muso" class="form-control" placeholder="Entrer du texte" />
        </div>
        <label><fmt:message code="common.ferme" /></label>
         <f:input path="ferme" name="ferme"  id="ferme" class="form-control"  placeholder="Entrer du texte" />
         
         
        
        <br />
        <div align="center">
         <button type="button" name="previous_btn_reduction_details" id="previous_btn_reduction_details" class="btn btn-default btn-lg">Previous</button>
         <button type="button" name="btn_reduction_details" id="btn_reduction_details" class="btn btn-success btn-lg">Register</button>
        </div>
        
        
       </div>
      </div>
     </div>
     
   </f:form>
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
<script>
$(document).ready(function(){
 
 $('#btn_bulletin_details').click(function(){
  
  var error_bul = '';
  
  if($.trim($('#bul').val()).length == 0)
  {
   error_email = 'Bulletin is required';
   $('#error_bul').text(error_bul);
   $('#bul').addClass('has-error');
  }
   else
   {
    error_bul = '';
    $('#error_bul').text(error_bul);
    $('#bul').removeClass('has-error');
   }
  
  

  if(error_bul != '')
  {
   return false;
  }
  else
  {
   $('#list_bulletin_details').removeClass('active active_tab1');
   $('#list_bulletin_details').removeAttr('href data-toggle');
   $('#bulletin_details').removeClass('active');
   $('#list_bulletin_details').addClass('inactive_tab1');
   $('#list_employe_details').removeClass('inactive_tab1');
   $('#list_employe_details').addClass('active_tab1 active');
   $('#list_employe_details').attr('href', '#employe_details');
   $('#list_employe_details').attr('data-toggle', 'tab');
   $('#employe_details').addClass('active in');
  }
 });
 
 $('#previous_btn_employe_details').click(function(){
  $('#list_employe_details').removeClass('active active_tab1');
  $('#list_employe_details').removeAttr('href data-toggle');
  $('#employe_details').removeClass('active in');
  $('#list_employe_details').addClass('inactive_tab1');
  $('#list_bulletin_details').removeClass('inactive_tab1');
  $('#list_bulletin_details').addClass('active_tab1 active');
  $('#list_bulletin_details').attr('href', '#bulletin_details');
  $('#list_bulletin_details').attr('data-toggle', 'tab');
  $('#bulletin_details').addClass('active in');
 });
 
 $('#btn_employe_details').click(function(){
  var error_empl = '';
  
  
  if($.trim($('#empl').val()).length == 0)
  {
   error_empl = 'Employe is required';
   $('#error_empl').text(error_empl);
   $('#empl').addClass('has-error');
  }
  else
  {
   error_empl = '';
   $('#error_empl').text(error_empl);
   $('#empl').removeClass('has-error');
  }
  
  

  if(error_empl != '')
  {
   return false;
  }
  else
  {
   $('#list_employe_details').removeClass('active active_tab1');
   $('#list_employe_details').removeAttr('href data-toggle');
   $('#employe_details').removeClass('active');
   $('#list_employe_details').addClass('inactive_tab1');
   $('#list_paiement_details').removeClass('inactive_tab1');
   $('#list_paiement_details').addClass('active_tab1 active');
   $('#list_paiement_details').attr('href', '#paiement_details');
   $('#list_paiement_details').attr('data-toggle', 'tab');
   $('#paiement_details').addClass('active in');
  }
 });
 
 $('#previous_btn_paiement_details').click(function(){
  $('#list_paiement_details').removeClass('active active_tab1');
  $('#list_paiement_details').removeAttr('href data-toggle');
  $('#paiement_details').removeClass('active in');
  $('#list_paiement_details').addClass('inactive_tab1');
  $('#list_employe_details').removeClass('inactive_tab1');
  $('#list_employe_details').addClass('active_tab1 active');
  $('#list_employe_details').attr('href', '#employe_details');
  $('#list_employe_details').attr('data-toggle', 'tab');
  $('#employe_details').addClass('active in');
 });
 
 $('#previous_btn_avantage_details').click(function(){
	  $('#list_avantage_details').removeClass('active active_tab1');
	  $('#list_avantage_details').removeAttr('href data-toggle');
	  $('#avantage_details').removeClass('active in');
	  $('#list_avantage_details').addClass('inactive_tab1');
	  $('#list_paiement_details').removeClass('inactive_tab1');
	  $('#list_paiement_details').addClass('active_tab1 active');
	  $('#list_paiement_details').attr('href', '#paiement_details');
	  $('#list_paiement_details').attr('data-toggle', 'tab');
	  $('#paiement_details').addClass('active in');
});
 
 $('#previous_btn_deduction_details').click(function(){
	  $('#list_deduction_details').removeClass('active active_tab1');
	  $('#list_deduction_details').removeAttr('href data-toggle');
	  $('#deduction_details').removeClass('active in');
	  $('#list_deduction_details').addClass('inactive_tab1');
	  $('#list_avantage_details').removeClass('inactive_tab1');
	  $('#list_avantage_details').addClass('active_tab1 active');
	  $('#list_avantage_details').attr('href', '#avantage_details');
	  $('#list_avantage_details').attr('data-toggle', 'tab');
	  $('#avantage_details').addClass('active in');
});
 
 $('#previous_btn_reduction_details').click(function(){
	  $('#list_reduction_details').removeClass('active active_tab1');
	  $('#list_reduction_details').removeAttr('href data-toggle');
	  $('#reduction_details').removeClass('active in');
	  $('#list_reduction_details').addClass('inactive_tab1');
	  $('#list_deduction_details').removeClass('inactive_tab1');
	  $('#list_deduction_details').addClass('active_tab1 active');
	  $('#list_deduction_details').attr('href', '#deduction_details');
	  $('#list_deduction_details').attr('data-toggle', 'tab');
	  $('#deduction_details').addClass('active in');
});
 
 $('#btn_paiement_details').click(function(){
  var error_primeFonction = '';
  var error_primeDipmlome = '';
  var error_annuites = '';
  var error_regularisation = '';
  
  
  
  
  if($.trim($('#primeFonction').val()).length == 0)
  {
   error_primeFonction = 'Prime fonction is required';
   $('#error_primeFonction').text(error_primeFonction);
   $('#primeFonction').addClass('has-error');
  }
  else
  {
   error_primeFonction = '';
   $('#error_primeFonction').text(error_primeFonction);
   $('#primeFonction').removeClass('has-error');
  }
  
  if($.trim($('#primeDipmlome').val()).length == 0)
  {
   error_primeDipmlome = 'Prime diplome is required';
   $('#error_primeDipmlome').text(error_primeDipmlome);
   $('#primeDipmlome').addClass('has-error');
  }
  else
  {
   error_primeDipmlome = '';
   $('#error_primeDipmlome').text(error_primeDipmlome);
   $('#primeDipmlome').removeClass('has-error');
  }
  
  if($.trim($('#annuites').val()).length == 0)
  {
   error_annuites = 'annuites is required';
   $('#error_annuites').text(error_annuites);
   $('#annuites').addClass('has-error');
  }
  else
  {
   error_annuites = '';
   $('#error_annuites').text(error_annuites);
   $('#annuites').removeClass('has-error');
  }
  
  if($.trim($('#regularisation').val()).length == 0)
  {
   error_annuites = 'regularisation is required';
   $('#error_regularisation').text(error_regularisation);
   $('#regularisation').addClass('has-error');
  }
  else
  {
   error_regularisation = '';
   $('#error_regularisation').text(error_regularisation);
   $('#regularisation').removeClass('has-error');
  }
  
  
  if( error_primeFonction != '' || error_primeDipmlome != '' || error_annuites != '' || error_regularisation != '' )
  {
   return false;
  }
  else
  {
	  $('#list_paiement_details').removeClass('active active_tab1');
	   $('#list_paiement_details').removeAttr('href data-toggle');
	   $('#paiement_details').removeClass('active');
	   $('#list_paiement_details').addClass('inactive_tab1');
	   $('#list_avantage_details').removeClass('inactive_tab1');
	   $('#list_avantage_details').addClass('active_tab1 active');
	   $('#list_avantage_details').attr('href', '#avantage_details');
	   $('#list_avantage_details').attr('data-toggle', 'tab');
	   $('#avantage_details').addClass('active in');
  }
  
 });
 
 
 $('#btn_avantage_details').click(function(){
	  
	 $('#list_avantage_details').removeClass('active active_tab1');
	   $('#list_avantage_details').removeAttr('href data-toggle');
	   $('#avantage_details').removeClass('active');
	   $('#list_avantage_details').addClass('inactive_tab1');
	   
	   $('#list_deduction_details').removeClass('inactive_tab1');
	   $('#list_deduction_details').addClass('active_tab1 active');
	   $('#list_deduction_details').attr('href', '#deduction_details');
	   $('#list_deduction_details').attr('data-toggle', 'tab');
	   $('#deduction_details').addClass('active in');
	  
	  
});
 
 $('#btn_deduction_details').click(function(){
	  
	 $('#list_deduction_details').removeClass('active active_tab1');
	   $('#list_deduction_details').removeAttr('href data-toggle');
	   $('#deduction_details').removeClass('active');
	   $('#list_deduction_details').addClass('inactive_tab1');
	   
	   $('#list_reduction_details').removeClass('inactive_tab1');
	   $('#list_reduction_details').addClass('active_tab1 active');
	   $('#list_reduction_details').attr('href', '#reduction_details');
	   $('#list_reduction_details').attr('data-toggle', 'tab');
	   $('#reduction_details').addClass('active in');
	  
	  
});
 
 $('#btn_reduction_details').click(function(){
	  
	  
	  
	   $('#btn_reduction_details').attr("disabled", "disabled");
	   $(document).css('cursor', 'prgress');
	   $("#register_form").submit();
	  
	  
});
 
 
});
</script>