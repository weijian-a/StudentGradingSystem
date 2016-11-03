<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@include file="DBConnection.jsp" %>  
  <%@page import="java.sql.*" %>
    
  <%
  	final String searchModuleTerms = request.getParameter("searchModuleTerms");
  	
  	if(searchModuleTerms !=null && searchModuleTerms.trim().length() > 0)
  	{
  		String[] moduleName = null;
  		int[] moduleCode = null;
  		String[] moduleDesc = null;
  		
  		int rowCounts = 0;
  		Statement st = con.createStatement();
  		ResultSet rs = null;
  		
 	  	final String[] rowCountQuery = {"SELECT COUNT(*) FROM module WHERE idMod LIKE '" + searchModuleTerms + "%';",
										"SELECT COUNT(*) FROM module WHERE modName LIKE '%" + searchModuleTerms + "%';",
										"SELECT COUNT(*) FROM module WHERE modDesc LIKE '%" + searchModuleTerms + "%';"};

		final String[] moduleRecordQuery = {"SELECT * FROM module WHERE idMod LIKE '" + searchModuleTerms + "%';",
											"SELECT * FROM module WHERE modName LIKE '%" + searchModuleTerms + "%';",
											"SELECT * FROM module WHERE modDesc LIKE '%" + searchModuleTerms + "%';"};
		final int arrSize = 3;
		
		for(int i=0;i<arrSize;i++)
		{
			rs = st.executeQuery(rowCountQuery[i]);
			
			System.out.println("Executing SQL Statement: " + rowCountQuery[i]);
			
			if(rs != null && rs.next())
  	  		{
  	  			rowCounts = rs.getInt(1);
  	  		}//end of IF
  	  		
			System.out.println("COUNT: " + rowCounts);
			
  	  		//Flush all contents in the Statement object and ResultSet
  	  		st.clearBatch();
  	  		rs.close();    //Closes the ResultSet
  	  		
  	  		if(rowCounts > 0)
 	  		{
 	  			moduleName = new String[rowCounts];
 	  	  		moduleCode = new int[rowCounts];
 	  	  		moduleDesc = new String[rowCounts];
 	  	  		
 	  			rs = st.executeQuery(moduleRecordQuery[i]);
 	  			
 	  			for(int j=0;j<rowCounts;j++)
 	  			{
 	  				rs.next();
 	  				
 	  				moduleCode[j] = rs.getInt(1);
 	  				moduleName[j] = rs.getString(2);
 	  				moduleDesc[j] = rs.getString(3);
 	  				
 	  				System.out.println("Module Code: " + moduleCode[j]);
 	  	  			System.out.println("Module Name: " + moduleName[j]);
 	  	  			System.out.println("Module Description: " + moduleDesc[j]);
 	  			}//Inner For-Loop
 	  				
 	  			break; // Breaks the outer loop as we've found the match of the keyword
 	  			
 	  		}
  	  		
  	  		//Flush all contents in the Statement object and ResultSet so that the Statement object and
  	  		//ResultSet could be ready for use for the respective SQL queries on the next loop iterations
  	  		st.clearBatch();
  	  				
 	  		rs.close();    //Closes the ResultSet
  	  		
		}//Outer For-Loop
  			
		//Flushes all contents in the Statement object as it is possible that the Statement object
		//isn't flushed (cleared) as the loop was escaped after executing the break statement..
  		st.clearBatch();
  		
		// Closes the ResultSet if the ResultSet isn't closed maybe due to the break loop statement was executed.
  		if(!rs.isClosed())
  		{
  			rs.close();
  		}
  		
		//Finally closes the Statement and the Connections object as there isn't any further database queries to execute.
  		st.close();
		con.close();
  		
  		request.setAttribute("moduleCode", moduleCode);
  		request.setAttribute("moduleName", moduleName);
  		request.setAttribute("moduleDesc", moduleDesc);
  		request.getRequestDispatcher("student_searchmoduleinforesults.jsp").forward(request, response);
  		
  	}
  	
  %>