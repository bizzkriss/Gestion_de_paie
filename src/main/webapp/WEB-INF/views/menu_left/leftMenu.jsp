
<div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li class="sidebar-search">
                            <div class="input-group custom-search-form">
                                <input type="text" class="form-control" placeholder="Recherche...">
                                <span class="input-group-btn">
                                    <button class="btn btn-default" type="button">
                                        <i class="fa fa-search"></i>
                                    </button>
                                </span>
                            </div>
                            <!-- /input-group -->
                        </li>
                        <c:url value="/home/" var="home" />
                        <li>
                            <a href="${home }"><i class="fa fa-dashboard fa-fw"></i> <fmt:message code="common.dashboard" /></a>
                        </li>
                        
                        <c:url value="/employer/" var="empl" />
                        <li>
                            <a href="#"><i class="fa fa-user fa-fw"></i> <fmt:message code="common.employe" /><span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="${empl }"><fmt:message code="common.employe.employes" /></a>
                                </li>
                                <c:url value="/employer/contrat/" var="contr" />
                                <li>
                                    <a href="${contr }"><fmt:message code="common.employe.contrat" /></a>
                                </li>
                                <c:url value="/employer/departement/" var="dep" />
                                <li>
                                    <a href="${dep }"><fmt:message code="common.employe.departement" /></a>
                                </li>
                                <c:url value="/employer/affectation/" var="affect" />
                                <li>
                                    <a href="${affect }"><fmt:message code="common.employe.affectation" /></a>
                                </li>
                                <c:url value="/employer/prestation/" var="prest" />
                                <li>
                                    <a href="${prest }"><fmt:message code="common.employe.prestation" /></a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        
                        <li>
                            <a href="#"><i class="fa fa-money fa-fw"></i> <fmt:message code="common.paie" /><span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                            <c:url value="/paie/bulletin/" var="bul" />
                                <li>
                                    <a href="${bul }"><fmt:message code="common.paie.bulletin" /></a>
                                </li>
                                <c:url value="/paie/paiement/" var="paie" />
                                <li>
                                    <a href="${paie }"><fmt:message code="common.paiement" /></a>
                                </li>
                                
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        
                        <li>
                            <a href="#"><i class="fa fa-wrench fa-fw"></i> <fmt:message code="common.paramettre" /><span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                            <c:url value="/paramettre/utilisateur/" var="util" />
                                <li>
                                    <a href="${util}"><fmt:message code="common.paramettre.utilisateur" /></a>
                                </li>
                                
                                
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        
                        
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>