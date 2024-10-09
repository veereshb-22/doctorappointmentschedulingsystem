<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Create Time Slot</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: url('https://wallpaperaccess.com/full/4112935.png') no-repeat center center fixed;
            background-size: cover;
            margin: 0;
        }
        .form-container {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 30px; 
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 400px; 
        }
        .btn-primary {
            width: 100%;
        }
        .error-message {
            color: red; 
            font-size: 0.875em; 
            display: none; 
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2 class="text-center">Create Time Slot</h2>
        <form action="${pageContext.request.contextPath}/timeslots/save" method="post">
            <table class="table">
                <tr>
                    <td>Start Time:</td>
                    <td>
                        <input type="date" id="slotStartTime" name="slotStartTime" required oninput="validateStartDate()" />
                        <div id="startError" class="error-message">Enter Valid Date</div>
                    </td>
                </tr>
                <tr>
                    <td>End Time:</td>
                    <td>
                        <input type="date" id="slotEndTime" name="slotEndTime" required oninput="validateEndDate()" />
                        <div id="endError" class="error-message">Enter Valid Date</div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="hidden" name="slotStatus" value="Available" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <button type="submit" class="btn btn-primary" id="saveButton" disabled>Save</button>
                    </td>
                </tr>
            </table>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <script>
        const startTimeInput = document.getElementById('slotStartTime');
        const endTimeInput = document.getElementById('slotEndTime');
        const saveButton = document.getElementById('saveButton');
        const startError = document.getElementById('startError');
        const endError = document.getElementById('endError');

        function validateStartDate() {
            const today = new Date();
            const todayString = today.toISOString().split('T')[0];
            const startTime = startTimeInput.value;

            // Reset error message
            startError.style.display = 'none';
            saveButton.disabled = true;

            // Validate start date
            if (startTime < todayString) {
                startError.style.display = 'block';
            } else {
                validateAll();
            }
        }

        function validateEndDate() {
            const today = new Date();
            const todayString = today.toISOString().split('T')[0];
            const endTime = endTimeInput.value;

            // Reset error message
            endError.style.display = 'none';
            saveButton.disabled = true;

            // Validate end date
            if (endTime < todayString) {
                endError.style.display = 'block';
            } else {
                validateAll();
            }
        }

        function validateAll() {
            const startTime = startTimeInput.value;
            const endTime = endTimeInput.value;

            // Enable the button only if both dates are valid
            if (startTime && endTime && startTime >= (new Date().toISOString().split('T')[0]) && endTime >= (new Date().toISOString().split('T')[0])) {
                saveButton.disabled = false;
            }
        }
    </script>
</body>
</html>
