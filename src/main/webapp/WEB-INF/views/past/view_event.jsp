<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><spring:message code="editevent.title" /></title>
	<!-- css -->
    <link href="<%= request.getContextPath() %>/css/bootstrap.css" rel="stylesheet">
    <link href="<%= request.getContextPath() %>/css/bootstrap-theme.css" rel="stylesheet">
    <link href="<%= request.getContextPath() %>/css/jquery.dataTables.css" rel="stylesheet">
    <link href="<%= request.getContextPath() %>/css/jquery.datetimepicker.css" rel="stylesheet">
    <link href="<%= request.getContextPath() %>/css/main.css" rel="stylesheet">

    <!-- js -->
    <script src="<%= request.getContextPath() %>/js/jquery.js"></script>
    <script src="<%= request.getContextPath() %>/js/bootstrap.min.js"></script>
    <script src="<%= request.getContextPath() %>/js/jquery.dataTables.js"></script>
    <script src="<%= request.getContextPath() %>/js/jquery.maphighlight.js"></script>
    <script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery.datetimepicker.js"></script>
    <script src="<%= request.getContextPath() %>/js/main.js"></script>  
    <script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery.alphanum.js"></script>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
    <style type="text/css">
    </style>
  </head>
  <body>
  
    
    <div class="container">
       <div class="row">
	<div class="col-xs-1 col-md-1"><a href="<c:url value="../index"/>"><img class="img-responsive" src="<%= request.getContextPath() %>/images/logo.png"></a></div>
	<div class="col-xs-6 col-md-9">
	   <h3>
		<a id="arrow_back" href="../index"><img src="<%= request.getContextPath() %>/images/arrow_back.png" title="<spring:message code="index.pageTitle" />"></a>&nbsp;
		<spring:message code="editevent.pageTitle" />
	   </h3>	
	 </div>   
	 </div>
    
    <div class="row">
	<div class="col-md-5">
	 	<form:form class="form-horizontal"  method="post" action="" modelAttribute="editEvent">
	    <div class="form-group">
	      <label for="title"><spring:message code="event.hName" />:</label>
	      <spring:message code="event.hName.hint" var="msg"/>
	      <c:out value="${editEvent.eventName}"></c:out>
	    </div>
	    <div class="form-group">
            <fmt:formatDate value="${editEvent.eventDate}" pattern="dd-MM-yyyy HH:mm" var="formattedDate"/>
	      <label for="eventDate"><spring:message code="event.hDatetime" />:</label>
	      <spring:message code="event.hDatetime.hint" var="msg"/>
	      <c:out value="${formattedDate}"></c:out>	      
	    </div>
	    <div class="form-group">
	      <label for="booking_time" id="label_booking"><spring:message code="event.hBooking" />:</label>
	      <spring:message code="event.hBooking.hint" var="msg"/>
	      <c:out value="${editEvent.bookingCancelTime}"></c:out>	  
	      
	    </div>
	   <div class="form-group">
	      <label for="booking_time" id="label_duration"><spring:message code="event.hDuration" />:</label>
	      <spring:message code="event.hDuration.hint" var="msg"/>
	      <c:out value="${editEvent.durationTime}"></c:out>	
	    </div>
	    <div class="form-group">
	      <form:errors path="sectorPriceSet" cssClass="sectorPrice-danger alert-danger" />
	      <c:forEach items="${editEvent.sectorPriceSet}" var="sectorPrice" varStatus="priceStatus">
	        <form:hidden  id="s${sectorPrice.sector.id}" path="sectorPriceSet[${priceStatus.index}].price"/>
	      </c:forEach>
	 	<form:hidden id="id" path="id"/>
	    </div>	    
      </form:form>	 

	</div>
	<spring:message code="event.sectorPrice.hint" var="msg"/>
	<div class="col-md-7">	    
	<img id="new_event_img" class="map" usemap="#stadium" src="<%= request.getContextPath() %>/images/stadium_plan.png">
	  <map name="stadium">
	   <c:forEach items="${editEvent.sectorPriceSet}" var="sectorPrice">	  	 
	      <input id="price_${sectorPrice.sector.id}" size="7" maxlength="7" value="${sectorPrice.price}" placeholder="${msg}" disabled/>
	   </c:forEach>
		<area id="1" alt="1" title="1" href="" shape="poly" coords="320,92,363,93,363,54,356,54,356,33,437,33,437,48,423,48,423,120,384,120,384,111,320,111" />
		<area id="2" alt="2" title="2" href="" shape="poly" coords="484,107,468,108,467,118,431,118,431,54,446,54,446,19,454,19,463,19,472,19,480,19,489,21,498,22,508,25,519,29"/>
		<area id="3" alt="3" title="3" href="" shape="poly" coords="579,105,576,99,497,136,494,132,492,127,489,125,485,122,524,31,532,35,540,39,548,43,557,50,566,59,574,69,580,80,585,90,590,101"/>
		<area id="4" alt="4" title="4" href="" shape="poly" coords="511,137,581,111,579,105,590,101,593,109,595,117,597,123,598,131,600,140,601,150,601,162,511,160"/>
		<area id="5" alt="5" title="5" href="" shape="poly" coords="500,178.8000030517578,513,178.8000030517578,513,167.8000030517578,588,166.8000030517578,588,161.8000030517578,601,161.8000030517578,601,221.8000030517578,589,221.8000030517578,588,217.8000030517578,501,217.8000030517578"/>
		<area id="6" alt="6" title="6" href="" shape="poly" coords="500,224.8000030517578,564,224.8000030517578,564,227.8000030517578,588,227.8000030517578,588,221.8000030517578,601,222.8000030517578,601,279.8000030517578,588,279.8000030517578,588,273.8000030517578,565,273.8000030517578,564,275.8000030517578,499,275.8000030517578"/>
		<area id="7" alt="7" title="7" href="" shape="poly" coords="500,282.8000030517578,564,282.8000030517578,564,286.8000030517578,588,286.8000030517578,589,280.8000030517578,601,280.8000030517578,601,336.8000030517578,588,336.8000030517578,588,330.8000030517578,565,330.8000030517578,565,332.8000030517578,500,333.8000030517578"/>
		<area id="8" alt="8" title="8" href="" shape="poly" coords="500,339.8000030517578,564,339.8000030517578,565,361.8000030517578,564,367.8000030517578,563,371.8000030517578,562,376.8000030517578,561,378.8000030517578,559,383.8000030517578,500,360.8000030517578"/>
		<area id="9" alt="9" title="9" href="" shape="poly" coords="497,366.8000030517578,556,390.8000030517578,551,398.8000030517578,547,406.8000030517578,542,412.8000030517578,536,417.8000030517578,531,422.8000030517578,525,426.8000030517578,521,430.8000030517578,516,432.8000030517578,510,435.8000030517578,486,377.8000030517578,492,374.8000030517578,494,371.8000030517578"/>
		<area id="10" alt="10" title="10" href="" shape="poly" coords="479,381.3999938964844,509,462.3999938964844,514,460.3999938964844,519,470.3999938964844,512,474.3999938964844,505,476.3999938964844,499,477.3999938964844,493,478.3999938964844,486,480.3999938964844,480,481.3999938964844,471,481.3999938964844,472,466.3999938964844,462,466.3999938964844,463,445.3999938964844,459,445.3999938964844,458,381.3999938964844"/>
		<area id="11" alt="11" title="11" href="" shape="poly" coords="451,381,451,446,447,446,447,466,404,467,404,447,401,447,401,381"/>
		<area id="12" alt="12" title="12" href="" shape="poly" coords="394,380.8000030517578,394,445.8000030517578,390,446.8000030517578,390,466.8000030517578,346,466.8000030517578,346,445.8000030517578,343,445.8000030517578,343,380.8000030517578"/>
		<area id="13" alt="13" title="13" href="" shape="poly" coords="336,381.6000061035156,336,446.6000061035156,333,446.6000061035156,333,467.6000061035156,288,467.6000061035156,289,445.6000061035156,284,445.6000061035156,284,381.6000061035156"/>
		<area id="14" alt="14" title="14" href="" shape="poly" coords="279,382,279,447,276,447,276,467,231,467,231,446,228,446,228,382"/>
		<area id="15" alt="15" title="15" href="" shape="poly" coords="221,382.1000061035156,221,446.1000061035156,217,446.1000061035156,217,468.1000061035156,173,468.1000061035156,173,446.1000061035156,170,446.1000061035156,170,382.1000061035156"/>
		<area id="16" alt="16" title="16" href="" shape="poly" coords="165,381.3999938964844,165,446.3999938964844,161,446.3999938964844,162,467.3999938964844,154,467.3999938964844,153,481.3999938964844,144,481.3999938964844,137,480.3999938964844,130,478.3999938964844,123,477.3999938964844,117,475.3999938964844,111,474.3999938964844,103,470.3999938964844,108,460.3999938964844,115,463.3999938964844,124,440.3999938964844,121,438.3999938964844,145,381.3999938964844"/>
		<area id="17" alt="17" title="17" href="" shape="poly" coords="126,366.3999938964844,131,373.3999938964844,139,377.3999938964844,102,457.3999938964844,108,460.3999938964844,103,470.3999938964844,98,467.3999938964844,92,465.3999938964844,87,462.3999938964844,82,459.3999938964844,76,454.3999938964844,69,449.3999938964844,61,442.3999938964844,54,435.3999938964844,49,429.3999938964844,44,421.3999938964844,41,414.3999938964844,38,410.3999938964844,34,401.3999938964844,44,396.3999938964844,47,403.3999938964844"/>
		<area id="18" alt="18" title="18" href="" shape="poly" coords="21,343,123,340,123,361,33,399,26,375"/>
		<area id="19" alt="19" title="19" href="" shape="poly" coords="123,282.5, 123,333.5, 35,333, 35,340.5, 22,340.5, 22,282.5"/>
		<area id="20" alt="20" title="20" href="" shape="rect" coords="22,224,123,275"/>
		<area id="21" alt="21" title="21" href="" shape="rect" coords="22,167,123,218"/>
		<area id="22" alt="22" title="22" href="" shape="poly" coords="123,161,22,160,22,151,22,142,24,133,26,123,28,116,30,110,32,103,123,141"/>
		<area id="23" alt="23" title="23" href="" shape="poly" coords="126,134,129,130,132,126,136,124,139,123,98,33,88,37,82,42,75,46,66,54,58,62,49,73,42,84,38,90,35,95"/>
		<area id="24" alt="24" title="24" href="" shape="poly" coords="192,121,146,121,103,29,111,26,122,23,132,21,143,19,156,19,166,19,175,18,180,18,179,54,192,54"/>
		<area id="25" alt="25" title="25" href="" shape="poly" coords="185,47,200,47,201,120,240,119,240,110,304,110,304,93,261,93,260,55,266,55,266,47,266,33,185,33"/>       
		<area id="26" alt="VIP A" title="VIP A" href="" shape="rect" coords="266,33,357,83"/>
		<area id="27" alt="VIP D" title="VIP D" href="" shape="rect" coords="154,473,469,501"/>
	  </map>
	  <br>

	  <script type="text/javascript">
    	$('#price_1, #price_2, #price_3, #price_4, #price_5, #price_6, #price_7, #price_8, ' +
	    '#price_9, #price_10, #price_11, #price_12, #price_13, #price_14, #price_15, #price_16, ' +
	    '#price_17, #price_18, #price_19, #price_20, #price_21, #price_22, #price_23, #price_24, ' +
	    '#price_25, #price_26, #price_27').numeric({
	    allowPlus: false,  // Allow the + sign
	    allowMinus: false,  // Allow the - sign
	    allowThouSep: false,  // Allow the thousands separator, default is the comma eg 12,000
	    allowDecSep: true,  // Allow the decimal separator, default is the fullstop eg 3.141
	    allowLeadingSpaces: false,
	    maxDigits: 7,     // The max number of digits
	    maxDecimalPlaces: 2,   // The max number of decimal places
	    maxPreDecimalPlaces: 4,   // The max number digits before the decimal point
	    max: NaN,   // The max numeric value allowed
	    min: NaN    // The min numeric value allowed
	    });

	    $('#booking_time').numeric({
	    allowPlus: false,
	    allowMinus: false,
	    allowThouSep: false,
	    allowDecSep: false,
	    allowLeadingSpaces: false,
	    maxDigits: 3,
	    max: NaN,
	    min: NaN
	    });
	        
	    $('#duration_time').numeric({
		allowPlus: false,
		allowMinus: false,
		allowThouSep: false,
		allowDecSep: false,
		allowLeadingSpaces: false,
		maxDigits: 3,
		max: NaN,
		min: NaN
		});
	  </script>
	</div>
      </div>
    </div>
  </body>
</html>

