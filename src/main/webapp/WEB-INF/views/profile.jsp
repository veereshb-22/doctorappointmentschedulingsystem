<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <!-- Bootstrap CSS from CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <!-- Font Awesome for icons (optional) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        /* Custom Styles */
        html, body {
            height: 100%; /* Ensures the html and body elements occupy the full viewport height */
            margin: 0; /* Removes default margin */
            display: flex;
            justify-content: center; /* Centers horizontally */
            align-items: center; /* Centers vertically */
            background-image: url('https://blog.digitalinfobytes.com/wp-content/uploads/2022/06/software-for-healthcare-organizations-2048x874.jpg'); /* Background image URL */
            background-size: cover; /* Ensures the image covers the entire background */
            background-position: center; /* Centers the image */
            background-repeat: no-repeat; /* Prevents the image from repeating */
            color: #343a40; /* Text color to ensure readability against the background */
            padding-top: 56px; /* Ensures content is not hidden behind the fixed navbar */
        }
        .centered-card {
            background-color: rgba(255, 255, 255, 0.8); /* White background with transparency */
            padding: 20px; /* Padding inside the card */
            border-radius: 8px; /* Rounded corners for the card */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); 
            max-width: 600px; 
            width: 100%;
        }
        .btn-custom-green {
            background-color: #28a745;
            color: white; 
        }
        .btn-custom-green:hover {
            background-color: #218838; 
        }
        .error-message {
            color: red; 
            font-size: 0.875em; 
            display: none; 
        }
    </style>
</head>
<body>
    <jsp:include page="userheader.jsp"></jsp:include>
    <div class="centered-card">
        <h1>Welcome, 
            <% 
                String patientName = (String) session.getAttribute("patientNameSession");
                out.print(patientName != null ? patientName : "Guest");
            %>!
        </h1>
        <div class="card mt-4">
            <div class="card-body">
                <h5 class="card-title">Patient Information</h5>
                <p class="card-text"><strong>Patient ID:</strong> 
                    <% 
                        String patientID = (String) session.getAttribute("patientIDSession");
                        out.print(patientID != null ? patientID : "Not Available");
                    %>
                </p>
                <p class="card-text"><strong>Wallet Balance:</strong> 
                    <% 
                        Integer patientWallet = (Integer) session.getAttribute("patientwalletSession");
                        out.print(patientWallet != null ? patientWallet : "Not Available");
                    %>
                </p>
            </div>
        </div>
        <form action="recharge" method="post" class="text-center">
            <div class="mb-3">
                <label for="amount" class="form-label">Amount</label>
                <input type="number" id="amount" name="amount" class="form-control mx-auto" min="0" required oninput="validateAmount(this)" style="max-width: 200px;"/>
                <div id="amountError" class="error-message">Amount must be greater than 500.</div>
            </div>
            <button type="submit" class="btn btn-custom-green" disabled>Recharge</button>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const amountInput = document.getElementById('amount');
            const errorDiv = document.getElementById('amountError');
            const rechargeButton = document.querySelector('form button[type="submit"]');

            const validateAmount = () => {
                const amount = parseFloat(amountInput.value);
                
                if (amount <= 500 || isNaN(amount)) {
                    errorDiv.style.display = 'block';
                    amountInput.classList.add('is-invalid');
                    rechargeButton.disabled = true; // Disable button if validation fails
                } else {
                    errorDiv.style.display = 'none';
                    amountInput.classList.remove('is-invalid');
                    rechargeButton.disabled = false; // Enable button if validation passes
                }
            };

            // Add input event listener to validate on user input
            amountInput.addEventListener('input', validateAmount);

            // Initial validation state
            validateAmount();
        });
    </script>
</body>
</html>
