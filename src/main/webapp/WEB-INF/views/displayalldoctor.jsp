<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Doctors</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-image: url('https://blog.digitalinfobytes.com/wp-content/uploads/2022/06/software-for-healthcare-organizations-2048x874.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            color: #343a40;
            padding-top: 56px;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            min-height: 100vh;
            position: relative;
        }
        .text-center-custom {
            text-align: center;
            color: #004080; /* Deeper blue color for better visibility */
        }
        .card {
            background-color: #e0f7fa; /* Lighter blue color for card background */
        }
        .card-img-top {
            max-height: 200px;
            object-fit: cover;
        }
        .btn-primary {
            background-color: #004080; /* Dark blue color for button */
            border: none;
        }
        .btn-primary:hover {
            background-color: #003366; /* Even darker blue on hover */
        }
    </style>
    <script>
        function confirmAction(event, action) {
            const message = action === 'deactivate'
                ? "Are you sure you want to deactivate this doctor?"
                : "Are you sure you want to activate this doctor?";
                
            if (!confirm(message)) {
                event.preventDefault(); // Prevent navigation if user cancels
            }
        }
    </script>
</head>
<body>
    <jsp:include page="adminheader.jsp"></jsp:include>
    <div class="container mt-5">
        <h4 class="mb-4 text-center-custom">DOCTOR DETAILS</h4>
        <div class="row">
            <div class="col-12 text-center mb-4">
                <a class="btn btn-primary" href="<c:url value='/doctors/createdoctor'/>" role="button">
                    <i class="fas fa-user-plus"></i> Add New Doctor
                </a>
            </div>
            <c:forEach var="doctor" items="${doctors}">
                <div class="col-md-4 mb-4">
                    <div class="card">
                        <img src="${doctor.doctorImage}" class="card-img-top" alt="Doctor Image"/>
                        <div class="card-body">
                            <h5 class="card-title">${doctor.doctorName}</h5>
                            <p class="card-text">
                                <strong>Email:</strong> ${doctor.doctorEmail}<br>
                                <strong>Phone Number:</strong> ${doctor.doctorPhonenumber}<br>
                                <strong>Speciality:</strong> ${doctor.doctorSpeciality}<br>
                                <strong>Experience:</strong> ${doctor.doctorExperience}<br>
                                <strong>Status:</strong> ${doctor.doctorStatus}
                            </p>
                            <c:choose>
                                <c:when test="${doctor.doctorStatus == 'Active'}">
                                    <a href="${pageContext.request.contextPath}/doctors/deactivate/${doctor.doctorID}" class="btn btn-warning" onclick="confirmAction(event, 'deactivate')">Deactivate</a>
                                    <a href="#" class="btn btn-success disabled">Activate</a>
                                </c:when>
                                <c:otherwise>
                                    <a href="#" class="btn btn-warning disabled">Deactivate</a>
                                    <a href="${pageContext.request.contextPath}/doctors/activate/${doctor.doctorID}" class="btn btn-success" onclick="confirmAction(event, 'activate')">Activate</a>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>
