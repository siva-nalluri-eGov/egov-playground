<%--
  ~ eGov suite of products aim to improve the internal efficiency,transparency,
  ~    accountability and the service delivery of the government  organizations.
  ~
  ~     Copyright (C) <2015>  eGovernments Foundation
  ~
  ~     The updated version of eGov suite of products as by eGovernments Foundation
  ~     is available at http://www.egovernments.org
  ~
  ~     This program is free software: you can redistribute it and/or modify
  ~     it under the terms of the GNU General Public License as published by
  ~     the Free Software Foundation, either version 3 of the License, or
  ~     any later version.
  ~
  ~     This program is distributed in the hope that it will be useful,
  ~     but WITHOUT ANY WARRANTY; without even the implied warranty of
  ~     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  ~     GNU General Public License for more details.
  ~
  ~     You should have received a copy of the GNU General Public License
  ~     along with this program. If not, see http://www.gnu.org/licenses/ or
  ~     http://www.gnu.org/licenses/gpl.html .
  ~
  ~     In addition to the terms of the GPL license to be adhered to in using this
  ~     program, the following additional terms are to be complied with:
  ~
  ~         1) All versions of this program, verbatim or modified must carry this
  ~            Legal Notice.
  ~
  ~         2) Any misrepresentation of the origin of the material is prohibited. It
  ~            is required that all modified versions of this material be marked in
  ~            reasonable ways as different from the original version.
  ~
  ~         3) This license does not grant any rights to any user of the program
  ~            with regards to rights under trademark law for use of the trade names
  ~            or trademarks of eGovernments Foundation.
  ~
  ~   In case of any queries, you can reach eGovernments Foundation at contact@egovernments.org.
  --%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="/WEB-INF/taglib/cdn.tld" prefix="cdn" %>
<div class="row">
	<div class="col-md-12">
		<form:form  id="complaintRouterSuccess" method ="post" class="form-horizontal form-groups-bordered" modelAttribute="complaintRouter" >
	 		<c:if test="${not empty message}">
                   <div class="alert alert-success" role="alert"><spring:message code="${message}"/></div>
            </c:if>
			<div class="panel panel-primary" data-collapsed="0">
				<div class="panel-heading">
					<div class="panel-title">
						<strong><spring:message code="${routerHeading}"/></strong>
					</div>
				</div> 
				<div class="panel-body">
					<div class="row add-border">
						<div class="col-md-3 col-xs-6 add-margin"><spring:message code="lbl.router.complaintType"/></div>
						<div class="col-md-9 col-xs-6 add-margin" id="ct-name">
							<c:choose>
								<c:when test="${not empty complaintRouter.complaintType.name}">
									<strong><c:out value="${complaintRouter.complaintType.name}"></c:out></strong>
								</c:when>
								<c:otherwise><spring:message code="msg.not.applicable" /></c:otherwise>
							</c:choose>
						</div>
					</div>
					<div class="row add-border">
						<div class="col-md-3 col-xs-6 add-margin"><spring:message code="lbl.router.boundaryType"/></div>
						<div class="col-md-9 col-xs-6 add-margin" id="bt-name">
							<c:choose>
								<c:when test="${not empty complaintRouter.boundary.boundaryType.name}">
									<strong><c:out value="${complaintRouter.boundary.boundaryType.name}"></c:out></strong>
								</c:when>
								<c:otherwise><spring:message code="msg.not.applicable" /></c:otherwise>
							</c:choose>
							<input id="routerId" type="hidden" value="<c:out value="${complaintRouter.id}" />" />  
						</div>
					</div>
					<div class="row add-border">
						<div class="col-md-3 col-xs-6 add-margin"><spring:message code="lbl.router.boundary"/></div>
						<div class="col-md-9 col-xs-6 add-margin" id="b-name">
							<c:choose>
								<c:when test="${not empty complaintRouter.boundary.name}">
									<strong><c:out value="${complaintRouter.boundary.name}"></c:out></strong>
								</c:when>
								<c:otherwise><spring:message code="msg.not.applicable" /></c:otherwise>
							</c:choose>
						</div>
					</div>
					<div class="row add-border">
						<div class="col-md-3 col-xs-6 add-margin"><spring:message code="lbl.router.position"/></div>
						<div class="col-md-9 col-xs-6 add-margin" id="pos-name">
							<strong><c:out value="${complaintRouter.position.name}"></c:out></strong>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="text-center">
					<button type="submit" id="routerCreateBtn" class="btn btn-primary">
                    	<spring:message code="lbl.create"/>
                    </button>
                    <button type="submit" id="routerUpdateBtn" class="btn btn-primary">
                    	<spring:message code="lbl.edit"/>
                    </button>
                    <button type="submit" id="routerDeleteBtn" class="btn btn-primary">
                    	<spring:message code="lbl.delete"/>
                    </button>	
	       			<button type="button" class="btn btn-default" data-dismiss="modal" onclick="self.close()">
	       				<spring:message code="lbl.close"/>
	       			</button>
				</div>
			</div>
		</form:form>
	</div>
</div>

<script src="<cdn:url  value='/resources/js/app/complaintroutingsuccess.js?rnd=${app_release_no}'/>"></script>
