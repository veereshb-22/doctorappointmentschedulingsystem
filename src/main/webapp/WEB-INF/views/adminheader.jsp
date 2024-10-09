 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <style>
    /* Custom Styles */
    .navbar {
        background-color: #e0f7fa; /* Light blue background color for navbar */
        position: fixed; /* Fixes the navbar at the top of the page */
        width: 100%; /* Ensures the navbar spans the entire width */
        top: 0; /* Ensures the navbar is at the top */
        left: 0; /* Ensures the navbar is aligned to the left */
        z-index: 1030; /* Ensures the navbar is above other content */
        padding: 0.5rem 1rem; /* Adds padding to make the navbar items more visible */
    }
    .navbar-brand {
        font-weight: bold;
        color: #007bff; /* Primary color for the brand name */
    }
    .navbar-nav {
        display: flex; /* Use flexbox to align items */
        flex: 1; /* Ensures the navbar items take up available space */
    }
    .navbar-nav .nav-link {
        color: #007bff; /* Primary color for the nav links */
        font-weight: 500; /* Medium font weight for nav links */
        border: 1px solid transparent; /* Default border for button styling */
        border-radius: .25rem; /* Rounded corners */
        padding: .375rem .75rem; /* Padding for button-like appearance */
        margin: 0 .25rem; /* Margin between buttons */
        transition: background-color 0.3s, color 0.3s; /* Smooth transition for hover effect */
        background-color: #e0f7fa; /* Match the background color of the navbar */
    }
    .navbar-nav .nav-link:hover {
        color: #fff; /* White color for text on hover */
        background-color: #007bff; /* Blue background color on hover */
        text-decoration: none; /* Remove underline on hover */
    }
    .logout-link {
        margin-left: auto; /* Pushes the logout link to the right end */
        color: #007bff; /* Color for the logout link */
        font-weight: 500; /* Medium font weight */
        border: 1px solid transparent; /* Default border for button styling */
        border-radius: .25rem; /* Rounded corners */
        padding: .375rem .75rem; /* Padding for button-like appearance */
        transition: background-color 0.3s, color 0.3s; /* Smooth transition for hover effect */
        background-color: #e0f7fa; /* Match the background color of the navbar */
    }
    .logout-link:hover {
        color: #fff; /* White color for text on hover */
        background-color: #007bff; /* Blue background color on hover */
        text-decoration: none; /* Remove underline on hover */
    }
    h2 {
        color: #343a40; /* Dark gray color for the heading */
    }
    p {
        color: #6c757d; /* Lighter gray color for the paragraph text */
    }
</style>
 <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#" style="color :  #000080;">RGS</a>
        <div class="navbar-nav me-auto">
     
        	<a class="nav-link" href="<c:url value='/user/home'/>">Home</a>
            <a class="nav-link" href="<c:url value='/doctors/displayalldoctors'/>"> Manage Doctor</a>
            <a class="nav-link" href="<c:url value='/user/list'/>">User</a> 
            <a class="nav-link" href="<c:url value='/appointment/displayallappointment'/>">Appointment</a>
        	<a class="nav-link" href="<c:url value='/transaction/alltransaction'/>">Transaction</a>       	
        </div>
        <a class="nav-link logout-link" href="<c:url value='/loginpage/logout'/>">Logout</a>
    </nav>