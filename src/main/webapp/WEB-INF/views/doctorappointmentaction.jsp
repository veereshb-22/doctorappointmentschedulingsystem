<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Appointment List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <style>
        body {
            font-family: Arial, sans-serif;
           
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
            background-color: #add8e6; /* Light blue background */
            border-bottom: 1px solid #dee2e6;
            padding: 0.75rem 1.25rem;
            border-top-left-radius: 0.25rem;
            border-top-right-radius: 0.25rem;
        }
        .card-title {
            margin: 0;
            font-size: 1.25rem;
            font-weight: 500;
            color: #003366; /* Navy blue color */
        }
        .card-body {
            padding: 1.25rem;
        }
        .alert {
            margin-top: 1rem;
        }
        .table thead th {
            background-color: #add8e6; /* Light blue header */
            color: #003366; /* Navy blue text */
        }
        .table tbody td {
            color: #343a40; /* Dark text for table body */
        }
    </style>
    <script>
        function updateStatus(appointmentID, status) {
            fetch(`/appointment/updateStatus?appointmentID=${appointmentID}&status=${status}`, {
                method: 'GET',
                headers: {
                    'Content-Type': 'application/json'
                }
            }).then(response => {
                if (response.redirected) {
                    window.location.href = response.url;
                }
            }).catch(error => {
                console.error('Error updating status:', error);
            });
        }

        document.addEventListener('DOMContentLoaded', function() {
            document.querySelectorAll('.status-dropdown').forEach(function(select) {
                select.addEventListener('change', function() {
                    const appointmentID = this.getAttribute('data-appointment-id');
                    const status = this.value;
                    updateStatus(appointmentID, status);
                });
            });
        });
    </script>
</head>
<body>
    <jsp:include page="doctorheader.jsp"></jsp:include>
    <div class="container">
        <!-- Display success or error messages -->
        <c:if test="${not empty message}">
            <div class="alert alert-success" role="alert">${message}</div>
        </c:if>
        <c:if test="${not empty error}">
            <div class="alert alert-danger" role="alert">${error}</div>
        </c:if>
		<br>
        <br>
        <div class="card">
            <div class="card-header">
            <h1 class="card-title" style="text-align: center; ">Appointment List</h1>
                
            </div>
            <div class="card-body">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Appointment ID</th>
                            <th>Patient Name</th>
                            <th>Date</th>
                            <th>Time</th>
                            <th>Fees</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="appointment" items="${appointments}">
                            <tr>
                                <td>${appointment.appointmentID}</td>
                                <td>${appointment.patientID.patientName}</td>
                                <td>${appointment.appointmentDate}</td>
                                <td>${appointment.appointmentTime}</td>
                                <td>${appointment.appointmentFees}</td>                                
                                <td>${appointment.appointmentStatus} </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
