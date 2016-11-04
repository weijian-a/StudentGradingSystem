<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@include file="DBConnection.jsp" %>  
  <%@page import="java.sql.*" %>
    
  <%
  	final String searchModuleTerms = request.getParameter("searchModuleTerms").toString();
  	
  	if(searchModuleTerms !=null && searchModuleTerms.trim().length() > 0)
  	{
  		String[] moduleName = null;
  		int[] moduleCode = null;
  		String[] moduleDesc = null;
  		
  		int rowCounts = 0;
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
  	  			rowCounts = rs.getInt(1);
  	  		}//end of IF
  	  		
			System.out.println("COUNT: " + rowCounts);
			
			//Closes the current instance of the PreparedStatement object to release it from memory
			//as the ResultSet for the rowCount query is no longer needed.
  	  		ps.close();
  	  		rs.close();    //Closes the ResultSet
  	  		
  	  		if(rowCounts > 0)
 	  		{
 	  			moduleName = new String[rowCounts];
 	  	  		moduleCode = new int[rowCounts];
 	  	  		moduleDesc = new String[rowCounts];
 	  	  		
 	  	  		//Create a new instance of PreparedStatement object.
 	  			ps = con.prepareStatement(moduleRecordQuery[i]);
 	  			//Setting the corresponding String query pattern (wildcards) as the String parameter 
 				//to the PreparedStatement.
 	  			ps.setString(1, (0 == i)?querySearchPattern[0]:querySearchPattern[1]);
 	  			rs = ps.executeQuery();
 	  			System.out.println("Executing SQL Statement: " + ps.toString());
 	  			
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
 	  				
 	  			//Closes the current instance of the PreparedStatement object to release it from memory
 	  			//at the end of each loop iteration.
  	  			ps.close();
  	  				
 	  			rs.close();    //Closes the ResultSet
 	  			
 	  		}
  	  		
		}//Outer For-Loop
  		
		//Finally closes the Connections object as there isn't any further database queries to execute.
		con.close();
  		
  		request.setAttribute("moduleCode", moduleCode);
  		request.setAttribute("moduleName", moduleName);
  		request.setAttribute("moduleDesc", moduleDesc);
  		request.getRequestDispatcher("student_searchmoduleinforesults.jsp").forward(request, response);
  		
  	}
  	
  %>