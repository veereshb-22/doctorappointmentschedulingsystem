<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Patient List</title>
    <style>
        /* Bootstrap 5 CSS */
        body {
            font-family: Arial, sans-serif;
   			 background-color: #E0F7FA; /* Lightest blue */
        }
        .container {
            margin-top: 2rem;
        }
        .card {
            border: 1px solid #dee2e6;
            border-radius: 0.25rem;
            box-shadow: 0 0.125rem 0.25rem rgba(0,0,0,0.075);
        }
        .card-header {
            background-color: #f8f9fa;
            border-bottom: 1px solid #dee2e6;
            padding: 0.75rem 1.25rem;
            border-top-left-radius: 0.25rem;
            border-top-right-radius: 0.25rem;
        }
        .card-title {
            margin: 5 ;
            font-size: 1.25rem;
            font-weight: 500;
        }
        .card-body {
            padding: 1.25rem;
        }
        .table {
            width: 100%;
            margin-bottom: 1rem;
            color: #212529;
            border-collapse: collapse;
        }
        .table-bordered {
            border: 1px solid #dee2e6;
        }
        .table-striped tbody tr:nth-of-type(odd) {
            background-color: #f9f9f9;
        }
        .table-dark {
            background-color: #212529;
            color: #fff;
        }
        .table-dark th {
            color: #fff;
        }
        .table th,
        .table td {
            padding: 0.75rem;
            vertical-align: top;
            border: 1px solid #dee2e6;
            text-align: center;
        }
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    
</head>
<body>
	<jsp:include page="userheader.jsp"></jsp:include>
	<br>
    <div class="container">
        <br>
        <div class="card">
            <div class="card-header">
                <h5 class="card-title" style="text-align: center;">APPOINTMENT</h5>
            </div>
            <div class="card-body">
                <table class="table table-striped table-bordered">
                <thead style="background-color: #b3e5fc; color: #01579b;">
                        <tr>
                            <th>AppointmentID</th>
                            <th>Doctor Name</th>
                            <th>Date</th>
                            <th>Time</th>
                            <th>Fees</th>
                            <th>Status</th> 
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="appointment" items="${appointmentbypatient}">
                            <tr>
                                <td>${appointment.appointmentID}</td>
                                <td>${appointment.doctorID.doctorName}</td> 
                                <td>${appointment.appointmentDate}</td>
                                <td>${appointment.appointmentTime}</td>
                                <td>${appointment.appointmentFees}</td>
                                <td>${appointment.appointmentStatus}</td>                             
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
