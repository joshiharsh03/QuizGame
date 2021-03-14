//this class is for executing query from database
package dao;

import java.io.InputStream;
import java.sql.*;
import java.util.*;

public class DAO {
	private Connection con;

	public DAO() throws Exception {
		//connection for mysql driver
		Class.forName("com.mysql.cj.jdbc.Driver");
		//connecting from mysql database
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/quizdb?allowPublicKeyRetrieval=true", "root",
				"Samar323@");

	}
//	this method return all questions & answer to the user
	public ArrayList<HashMap> getQuestion(String category) throws Exception {
//		this is prepared statement used to executing query
		PreparedStatement p = con.prepareStatement("select * from question where type=?");
		p.setString(1, category);
		ResultSet rs = p.executeQuery();
		ArrayList<HashMap> allQuestions = new ArrayList();
		while (rs.next()) {
			HashMap Question = new HashMap();
			Question.put("qno", rs.getInt("qno"));
			Question.put("question", rs.getString("question"));
			Question.put("option1", rs.getString("option1"));
			Question.put("option2", rs.getString("option2"));
			Question.put("option3", rs.getString("option3"));
			Question.put("option4", rs.getString("option4"));
			Question.put("ans", rs.getString("ans"));
			allQuestions.add(Question);
		}
		return allQuestions;
	}
//	this method returns the answer to the user
	public String getAnswer(String type, int qno) throws Exception {
		PreparedStatement p = con.prepareStatement("select * from question where type=? and qno=?");
		p.setString(1, type);
		p.setInt(2, qno);
		ResultSet rs = p.executeQuery();
		if (rs.next()) {
			return rs.getString("ans");
		} else {
			return null;
		}
	}
}
