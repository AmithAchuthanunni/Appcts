<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%

String dateData = (String)session.getAttribute("dateData");
System.out.println(dateData);

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

Date d =sdf.parse(dateData);

SimpleDateFormat sdf1 = new SimpleDateFormat("EEEEE");
String day = sdf1.format(d);

SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy");
String year = sdf2.format(d);

SimpleDateFormat sdf3 = new SimpleDateFormat("MM");
String month = sdf3.format(d);

SimpleDateFormat sdf4 = new SimpleDateFormat("dd");
String date = sdf4.format(d);

System.out.println(year);
System.out.println(month);
System.out.println(date);
%>
<% 
int noOfdays[]={31,28,31,30,31,30,31,31,30,31,30,31};
String days[]={"Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"};
int monDays = noOfdays[Integer.parseInt(month.trim())-1];

int start=0;
int end=0;

ArrayList<String> al = new ArrayList<String>();

for(int i=1;i<=monDays;){
	String modDate=year+"-"+month+"-"+i;
	String augDays = sdf1.format(sdf.parse(modDate));
	System.out.println(i+" "+augDays);
	
	if(!augDays.equalsIgnoreCase("Saturday") && !augDays.equalsIgnoreCase("Sunday"))
	{
		start=i;
		for(int j=0;j<days.length;j++)
		{
			if(days[j].equalsIgnoreCase(augDays))
			{
				i=i+(4-j);
				end=i;
				i=i+3;
				break;
			}
		}
		if(end<=monDays){
			System.out.println(start+"-"+end);
			al.add(start+"-"+end);
			
		}
		else{
			System.out.println(start+"-"+monDays);
			al.add(start+"-"+monDays);
		}
	}
	else if(augDays.equalsIgnoreCase("Saturday")){
		i=i+2;
	}
	else
	{
		i=i+1;
	}
	
}

%>

<table align="center">

<tr> 
	<th>Non Ticketing Activity</th>
	<%
for(String s:al){
%>
<th><%=s %></th>

<%} %>
</tr>
<tr>
<td>Activity 1</td>
<td><input type="number"></td>
<td><input type="number"></td>
<td><input type="number"></td>
<td><input type="number"></td>
<td><input type="number"></td>
</tr>
</table>




</body>
</html>