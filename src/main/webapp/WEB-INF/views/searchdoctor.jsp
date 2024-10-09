<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Doctor</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>
        body {
            background-color: transparent; /* Remove background color */
        }
        h3, h4 {
            color: #000080; /* Navy blue color for headings */
        }
        .btn-book-appointment {
            background-color: #003366; /* Navy blue button background */
            color: white; /* White text for button */
            border: none; /* Remove button border */
        }
        .btn-book-appointment:hover {
            background-color: #002244; /* Darker navy blue on hover */
        }
        .card {
            background-color: #add8e6; /* Light blue background for cards */
            border: 1px solid #dee2e6; /* Border for cards */
            border-radius: 0.25rem; /* Rounded corners */
            box-shadow: 0 0.125rem 0.25rem rgba(0,0,0,0.075); /* Shadow for cards */
        }
        .card-body {
            padding: 1.25rem;
            color: #003366; /* Navy blue text color inside cards */
        }
        .form-inline {
            justify-content: center; /* Center align the form */
            margin-bottom: 1rem; /* Add some space below the form */
        }
    </style>
</head>
<body>
    <div class="container">
        <jsp:include page="userheader.jsp"></jsp:include>
        <br>
        <br>
        <h3 class="mt-4 text-center">Search Active Doctors</h3>
        
        <!-- Search Form -->
        <form action="/doctorappointmentschedulingsystem/doctors/searchActiveDoctors" method="post" class="form-inline my-2 my-lg-0">     
            <input class="form-control mr-sm-2" type="search" name="description" placeholder="Search by description" aria-label="Search">
            <button class="btn btn-book-appointment my-2 my-sm-0" type="submit">Search</button>
        </form>

        <!-- Display message -->
        <c:if test="${not empty searchTerm}">
            <h4 class="mt-4 text-center">Search Results for "<c:out value="${searchTerm}"/>":</h4>
        </c:if>

        <!-- Display doctors -->
        <div class="row mt-4">
            <c:forEach var="doctor" items="${doctors}">
                <div class="col-md-4 mb-4">
                    <div class="card">
                        <img class="card-img-top" src="${doctor.doctorImage}" alt="${doctor.doctorName}">
                        <div class="card-body">
                            <h5 class="card-title">${doctor.doctorName}</h5>
                            <p class="card-text"><strong>Speciality:</strong> ${doctor.doctorSpeciality}</p>
                            <p class="card-text"><strong>Experience:</strong> ${doctor.doctorExperience} years</p>
                            <p class="card-text"><strong>Appointment Fees</strong>500</p>

                            <a href="${pageContext.request.contextPath}/appointment/bookappointment?doctorID=${doctor.doctorID}" class="btn btn-book-appointment">Book Appointment</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>	
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
