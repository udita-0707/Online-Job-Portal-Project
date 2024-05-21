package myPackage;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import com.google.gson.Gson;

/**
 * Servlet implementation class MyServlet
 */
public class MyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyServlet() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String jobCategory = request.getParameter("jobCategory");
        Gson gson = new Gson();

        // Assuming JobService is a class that provides job data based on the context
        JobService jobService = new JobService(getServletContext());
        List<Job> filteredJobs = jobService.getFilteredJobs(jobCategory);
        System.out.println(filteredJobs);

        String jsonJobs = gson.toJson(filteredJobs);

        // Set the JSON string as a request attribute
        request.setAttribute("jobsData", jsonJobs);

        // Forward the request to index.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
        dispatcher.forward(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
