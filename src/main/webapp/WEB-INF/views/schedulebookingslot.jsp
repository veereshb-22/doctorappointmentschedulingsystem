<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Available Time Slots</title>
    <style>
        body {
            background-image: url('https://blog.digitalinfobytes.com/wp-content/uploads/2022/06/software-for-healthcare-organizations-2048x874.jpg'); /* Replace with your background image URL */
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            margin: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh; /* Full viewport height */
            color: #fff; /* Default text color */
        }
        .container {
            background-color: rgba(255, 255, 255, 0.2); /* Very light, transparent background to blend with the image */
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            text-align: center;
            max-width: 80%; /* Max width for better alignment */
            width: 100%;
        }
        h1 {
            color: #003366; /* Dark navy blue color */
            margin-bottom: 20px;
        }
        .slot-button {
            padding: 15px 25px; /* Larger padding for bigger buttons */
            margin: 10px;
            border: none;
            cursor: pointer;
            color: white;
            font-size: 1.2rem; /* Larger font size for readability */
            border-radius: 5px; /* Rounded corners */
            width: 150px; /* Fixed width for buttons */
        }
        .available {
            background-color: #28a745; /* Green for available slots */
        }
        .booked {
            background-color: #dc3545; /* Red for booked slots */
            cursor: not-allowed;
        }
        .inactive {
            background-color: #6c757d; /* Gray for inactive slots */
            cursor: not-allowed;
        }
        .slot-button:hover {
            opacity: 0.9; /* Slightly reduce opacity on hover for a visual effect */
        }
        form {
            display: flex;
            flex-wrap: wrap;
            justify-content: center; /* Center buttons */
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Available Time Slots for Doctor: ${doctorName} on ${appointmentDate}</h1>
        
        <c:if test="${not empty message}">
            <p>${message}</p>
        </c:if>

        <form action="${pageContext.request.contextPath}/appointment/bookappointment" method="post">
            <input type="hidden" name="doctorID" value="${doctorID}" />
            <input type="hidden" name="appointmentDate" value="${appointmentDate}" />
            
            <div>
                <c:forEach items="${timeSlots}" var="timeSlot">
                    <c:choose>
                        <c:when test="${availableTimes.contains(timeSlot)}">
                            <button type="submit" class="slot-button available" name="appointmentTime" value="${timeSlot}">
                                ${timeSlot}
                            </button>
                        </c:when>
                        <c:otherwise>
                            <button class="slot-button booked" disabled>
                                ${timeSlot}
                            </button>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </div>
        </form>
    </div>
</body>
</html>
