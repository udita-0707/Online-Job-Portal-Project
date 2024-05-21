package myPackage;

import jakarta.servlet.*;

import java.io.InputStream;
import java.util.List;
import java.util.stream.Collectors;

import com.google.gson.Gson;

import java.io.FileNotFoundException;

import java.io.InputStreamReader;
import java.io.*;
import java.util.*;

public class JobService{
	private JobsContainer jobsContainer;
	public JobService(ServletContext servletContext) {
		Gson gson = new Gson();
		try {
			InputStream is = servletContext.getResourceAsStream("/jobs.json");
	        if (is == null) {
	            throw new FileNotFoundException("Cannot find 'jobs.json'");
	        }
	        jobsContainer = gson.fromJson(new InputStreamReader(is), JobsContainer.class);
		}
		catch(Exception e) {
			throw new RuntimeException("Cannot find 'jobs.json'",e);
		}
	}	
	

	public List<Job> getFilteredJobs(String jobCategory){
		List<Job> totalJobs = jobsContainer.getJobs();
		if(jobCategory.equalsIgnoreCase("all")) {
			return jobsContainer.getJobs();
		}
		else {
			List<Job> ans = new ArrayList<Job>();
			if (jobCategory != null && !jobCategory.isEmpty()) {
				return totalJobs.stream()
						.filter(job -> jobCategory.equalsIgnoreCase(job.getTypeOfJob()))
						.collect(Collectors.toList());
	                                       
				}
			return ans;
		}
	}
	
}