<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Time Slot List</title>
    <!-- Bootstrap CSS from CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <style>
        body {
            padding: 20px;
           
           
            color: #343a40; /* Text color to ensure readability against the background */
            padding-top: 56px; /* Ensures content is not hidden behind the fixed navbar */
        
        }
        .btn-custom {
            background-color: #007bff; /* Navigation blue color */
            color: white; /* White text */
        }
        .btn-custom:hover {
            background-color: #0056b3; /* Darker shade on hover */
        }
        thead {
            background-color: #add8e6; /* Light blue header */
        }
        table {
            margin-top: 20px;
            width: 100%;
        }
    </style>
</head>
<body>
	 <jsp:include page="doctorheader.jsp"></jsp:include>
	<h2 class="mt-4" style="text-align: center; color: #add8e6;">Time Slot List</h2>
    <a href="${pageContext.request.contextPath}/timeslots/createslot" class="btn btn-custom">
        <i class="fas fa-plus-circle" style="font-size: 1.5em;"></i> Add New Time Slot
    </a>
    <table class="table table-bordered mt-3">
        <thead>
            <tr>
                <th>Slot ID</th>
                <th>Start Slot Date</th>
                <th>End Slot Date</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${dateSlots}" var="slot">
                <tr>
                    <td>${slot.slotId}</td>
                    <td>${slot.slotStartTime}</td>
                    <td>${slot.slotEndTime}</td>
                    <td>${slot.slotStatus}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/js/all.min.js"></script>
</body>
</html>
