
<%@page import="java.io.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="objectClasses.people.Person"%>
<%@page import="objectClasses.people.Student"%>

<%@page import="objectClasses.*"%>
<%@page import="dao.GroupModule"%>
<%@page import="java.util.List"%>
<% 
 //File creation
 String strPath = "E:\\wamp\\www\\groupism\\data.json";
 File strFile = new File(strPath);
 boolean fileCreated = strFile.createNewFile();
 if (fileCreated) out.print(strFile.getAbsolutePath());
 //File appending
 Writer writer = new BufferedWriter(new FileWriter(strFile));

 
List<Group> l = dao.GroupModule.getAllGroups(); 
	String data="";
	int count=1;
	Map students = new HashMap();
	
	List<Person> x = dao.GroupModule.getAllStudents();
	writer.write("{\"nodes\":[");
	writer.write("{\"name\": \"root\",\"group\": 4 }");
	for (Person student : x){
		if (!students.containsKey(student.getId())){
			students.put(student.getId(), count++);
			writer.write(",\n{\"name\": \""+student.getId()+"\",\"group\": "+4+" }");
		}
	}
	writer.write("],");
%>



<% 
String link,link2;
List<String> links = new ArrayList<String>();
writer.write("\"links\":[");
writer.write ("{\"source\": "+0+",\"target\": "+0+",\"value\": 1}");
for (Group g : l){
	List<Student> sl = GroupModule.getMemberStudents(g);
	for (Student s : sl){
		for (Student s2 : sl){
			if (s.getId()!= s2.getId()){
				link = ",\n{\"source\": "+students.get(s.getId())+",\"target\": "+students.get(s2.getId())+",\"value\": 1}";
				link2 = ",\n{\"source\": "+students.get(s2.getId())+",\"target\": "+students.get(s.getId())+",\"value\": 1}";
				if (!links.contains(link) && !links.contains(link2)){
					links.add(link);
					writer.write(link+"\n");
				}
			}
		}
	}
}

writer.write("] }");

writer.flush();
writer.close();
response.sendRedirect("http://localhost/groupism/index.php");
%>
