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
        color: #007bff; 
        font-weight: 500; 
        border: 1px solid transparent;
        border-radius: .25rem; 
        padding: .375rem .75rem; 
        margin: 0 .25rem; 
        transition: background-color 0.3s, color 0.3s; 
        background-color: #e0f7fa; 
    }
    .navbar-nav .nav-link:hover {
        color: #fff; 
        background-color: #007bff;
        text-decoration: none; 
    }
    .logout-link {
    	 margin: 0 .25rem; 
        margin-left: auto; 
        color: #007bff;
        font-weight: 500; 
        border: 1px solid transparent; 
        border-radius: .25rem; 
        padding: .375rem .75rem; 
        transition: background-color 0.3s, color 0.3s; 
        background-color: #e0f7fa; 
            }
    .logout-link:hover {
        color: #fff; 
        background-color: #007bff; 
        text-decoration: none; 
    }
    h2 {
        color: #343a40;
    }
    p {
        color: #6c757d; 
    }
</style>

 <nav class="navbar navbar-expand-lg navbar-light bg-light">
 
      <a class="navbar-brand" href="#" style="color :  #000080;">RGS</a>
        <div class="navbar-nav me-auto">
            <a class="nav-link" href="<c:url value='/doctors/doctorhome'/>">Home</a>
          
            <a class="nav-link" href="<c:url value='/timeslots/list'/>">Manage Slot</a>
           
            <a class="nav-link" href="<c:url value='/appointment/listslotfordoctor'/>">Appointment Schedule</a>
        </div>
        <a class="nav-link logout-link" href="<c:url value='/loginpage/logout'/>">Logout</a>            
 
</nav>
    