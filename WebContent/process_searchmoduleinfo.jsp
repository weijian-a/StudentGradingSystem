<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@include file="DBConnection.jsp" %>  
  <%@page import="java.sql.*" %>
    
  <%
  	final String searchModuleTerms = sanitizeInput(request.getParameter("searchModuleTerms").toString());
  
	String[] moduleName = null;
	int[] moduleCode = null;
	String[] moduleDesc = null;
  	
  	if(searchModuleTerms !=null && searchModuleTerms.trim().length() > 0)
  	{	
  		PreparedStatement ps = null;
  		ResultSet rs = null;
  		
 	  	final String[] rowCountQuery = {"SELECT COUNT(*) FROM module WHERE idMod LIKE ?;",
										"SELECT COUNT(*) FROM module WHERE modName LIKE ?;",
										"SELECT COUNT(*) FROM module WHERE modDesc LIKE ?;"};

		final String[] moduleRecordQuery = {"SELECT * FROM module WHERE idMod LIKE ?;",
											"SELECT * FROM module WHERE modName LIKE ?;",
											"SELECT * FROM module WHERE modDesc LIKE ?;"};
		
		final String[] querySearchPattern = {searchModuleTerms + "%", "%" + searchModuleTerms + "%"};
		final int arrSize = 3;
		
		int countWithHighestRecord = 0;
		int highestRecord = 0;
		
		for(int i=0;i<arrSize;i++)
		{
			//Create a new instance of PreparedStatement object.
			ps = con.prepareStatement(rowCountQuery[i]);
			//Setting the corresponding String query pattern (wildcards) as the String parameter 
			//to the PreparedStatement.
			ps.setString(1, (0 == i)?querySearchPattern[0]:querySearchPattern[1]);
			
			rs = ps.executeQuery();
			
			System.out.println("Executing SQL Statement: " + ps.toString());
			
			if(rs != null && rs.next())
  	  		{
  	  			int rowCounts = rs.getInt(1);
  	  			
  	  			System.out.println("COUNT: " + rowCounts);
  	  			
  	  			if(rowCounts > 0 && rowCounts > highestRecord)
  	  			{
  	  				highestRecord = rowCounts;
  	  				countWithHighestRecord = i;
  	  			}
  	  		}//end of IF
		}// End of For-Loop
  	  		
			
			
		//Closes the current instance of the PreparedStatement object to release it from memory
		//as the ResultSet for the rowCount query is no longer needed.
  	  	ps.close();
  	  	rs.close();    //Closes the ResultSet
  	  		
  	  	if(highestRecord > 0)
 	  	{
 	  		moduleName = new String[highestRecord];
 	  	  	moduleCode = new int[highestRecord];
 	  	  	moduleDesc = new String[highestRecord];
 	  	  		
 	  	  	//Create a new instance of PreparedStatement object.
 	  		ps = con.prepareStatement(moduleRecordQuery[countWithHighestRecord]);
 	  		//Setting the corresponding String query pattern (wildcards) as the String parameter 
 			//to the PreparedStatement.
 	  		ps.setString(1, (0 == countWithHighestRecord)?querySearchPattern[0]:querySearchPattern[1]);
 	  		rs = ps.executeQuery();
 	  		System.out.println("Executing SQL Statement: " + ps.toString());
 	  			
 	  		for(int j=0;j<highestRecord;j++)
 	  		{
 	  			rs.next();
 	  				
 	  			moduleCode[j] = rs.getInt(1);
 	  			moduleName[j] = rs.getString(2);
 	  			moduleDesc[j] = rs.getString(3);
 	  				
 	  			System.out.println("Module Code: " + moduleCode[j]);
 	  	  		System.out.println("Module Name: " + moduleName[j]);
 	  	  		System.out.println("Module Description: " + moduleDesc[j]);
 	  		}//Inner For-Loop
 	  				
 	  		//Closes the current instance of the PreparedStatement object to release it from memory
 	  		//at the end of each loop iteration.
  	  		ps.close();
  	  				
 	  		rs.close();    //Closes the ResultSet
 	  			
 	  	}
  		
		//Finally closes the Connections object as there isn't any further database queries to execute.
		con.close();
  		
  	}
		request.setAttribute("moduleCode", moduleCode);
		request.setAttribute("moduleName", moduleName);
		request.setAttribute("moduleDesc", moduleDesc);
		request.getRequestDispatcher("student_searchmoduleinforesults.jsp").forward(request, response);
  %>
  <%!
	private String sanitizeInput(final String inputToSanitize)
	{
	  	String sanitizedStr = "";
	  	final String[] patternsForFilter = {"<", ">", "!", "[", "]", "\"", "%", "{", "}"};
	  	final String[] filteredValue = {"lt", "gt", "!!", "![", "!]", "quot", "!%", "opcurbrace", "clocurbrace"};
		if(inputToSanitize != null && inputToSanitize.trim().length() > 0)
		{
			sanitizedStr = inputToSanitize.substring(0);
			
			for(int i=0;i<patternsForFilter.length;i++)
			{
				sanitizedStr = sanitizedStr.replace(patternsForFilter[i], filteredValue[i]);
			}
		}
		
		return sanitizedStr;
	}
  %>