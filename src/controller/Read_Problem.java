package controller;

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.List;

public class Read_Problem {
	private List <String> problem = new ArrayList<>();
	private List <String> answer = new ArrayList<>();
	
	public List<String> getAnswer() {return answer;	}
	public List<String> getProblem() {return problem;}
	
	public void setAnswer(List<String> answer) {this.answer = answer;}
	public void setProblem(List<String> problem) {this.problem = problem;}
	
	
	
	//Constructor
	public void read_file (String filename) {
		   BufferedReader br = null;
		   StringBuffer result = new StringBuffer();
		   boolean toggle=false;
		   int no=0;
		   problem.add(0, "");
		   answer.add(0, "");
		   try {
		      FileReader fr = new FileReader(filename);
		      br = new BufferedReader(fr);
		      while (br.ready()){
		    	  String current_Line = br.readLine();
		    	  if((current_Line.indexOf("Pass Any Exam. Any Time."))!=-1) continue;
		    	  if((current_Line.indexOf("Oracle 1z0"))!=-1) continue;
		    	  if ((current_Line.indexOf("QUESTION NO: "))!=-1){
		    		  no=(Integer.parseInt(current_Line.substring(13)));	
		    		  toggle=true;
		    		  continue;
		    		} 
		    	  // When "Answer" is encountered. 
		    	  if (toggle==true&&(current_Line.indexOf("Answer"))!=-1){
	    			  toggle=false;
	    			  if (result!=null) { 
	    				  problem.add(no, result.toString());
	    				  result.setLength(0);
	    			  }
	    			  answer.add(no, current_Line.substring(8).replace(",", "<br/>"));
		    	  }
		    	  if (toggle==true) { 
		    		   if (current_Line.indexOf("A.")!=-1 ) result.append("<br/><br/>");	
		    		   result.append(current_Line).append("<br>");
		    		   if (current_Line.indexOf(":.")!=-1 ) result.append("<br/><br/>"); 
		    	  }
		     }
		      br.close();
		   } catch (Exception e){e.printStackTrace();}
	} 
}

