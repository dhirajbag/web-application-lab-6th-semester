<%
	response.setContentType("text/event-stream");
	response.setCharacterEncoding("UTF-8");
	try{
		while(true){
			java.util.Random rand=new java.util.Random();
		out.print("data: stock-A : "+"2"+rand.nextFloat()+"\n"+"data: stock-B : "+"3"+rand.nextFloat()+"\n\n");
		out.flush();
		Thread.sleep(2000);
		}
	}
	catch(Exception e){
		out.println(e);
	}
	
%>