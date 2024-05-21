<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.google.gson.reflect.TypeToken" %>
    
<%@ page import="myPackage.Job" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Job Portal</title>
    <link rel="stylesheet" href="style.css">
    
    
</head>
<body>
    <header>
        <h1>Welcome to the Online Job Portal</h1>
    </header>
    <nav>
        <a href="#home">Home</a>
        <a href="#search">Search Jobs</a>
        <a href="#about">About Us</a>
        <a href="#contact">Contact</a>
    </nav>
    <section id="home">
        <h2>Find Your Dream Job</h2>
        <p>Welcome to your one-stop destination for exploring exciting job opportunities in various fields.</p>
    </section>
    <section id="search">
        <h2>Search for Jobs</h2>
        <div class="search-container">
        	<form action="MyServlet" method="post">
	            <select id="job-category" name="jobCategory">
	                <option value="all">All Jobs</option>
	                <option value="technical">Technical Jobs</option>
	                <option value="management">Management Jobs</option>
	                <option value="operational">Operational Jobs</option>
	                <option value="general">General Jobs</option>
	            </select>
	            <button type="submit">Search</button>
            </form>
        </div>
         <div id="search-results">
        <% 
            /* List<Job> jobs = (List<Job>) request.getAttribute("jobsData"); */
        		
        	String jobsDataJson = (String) request.getAttribute("jobsData");

        		// Deserialize the JSON string into a List<Job> using Gson
        		Gson gson = new Gson();
        		List<Job> jobs = gson.fromJson(jobsDataJson, new TypeToken<List<Job>>(){}.getType());
            if (jobs != null) {
                for (Job job : jobs) {
        %>
            <div class="jobs">
                <h3><strong>Role:   </strong><%= job.getTitle() %></h3>
                <p><strong>Company:</strong> <%= job.getCompany() %></p>
                <p><strong>Location:</strong> <%= job.getLocation() %></p>
                <p><strong>Description:</strong> <%= job.getDescription() %></p>
                <p><strong>Type of Job:</strong> <%= job.getTypeOfJob() %></p>
                <%-- <p><strong>Requirements:</strong> 
                    <% 
                        for (String requirement : job.getRequirements()) {
                            out.print(requirement);
                            out.print(", ");
                        }
                    %>
                </p> --%>
            </div>
        <%
                }
            }
        %>
    </div>
    </section>
    <section id="about">
        <h2>About Us</h2>
        <p>Learn more about our mission and how we connect job seekers with their ideal roles.</p>
    </section>
    <section id="contact">
        <h2>Contact Us</h2>
        <p>Have questions? Reach out to us!</p>
        <!-- Contact form or information -->
    </section>
    <footer>
        <p>© 2024 Online Job Portal</p>
        <p>Follow us on social media: <a href="#">Facebook</a> | <a href="#">Twitter</a> | <a href="#">LinkedIn</a></p>
    </footer>
</body>
</html>
