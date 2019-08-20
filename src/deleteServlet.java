import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

/**
 * Servlet implementation class insertServlet
 */

@WebServlet(name = "delete", description = "삭제", urlPatterns = { "/delete" }) // ���� ����
public class deleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */

	public void init(ServletConfig conf) throws ServletException { // ������ �ʱ�ȭ�� db����
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver"); // �����ͺ��̽��� �����ϱ� ���� DriverManager�� ����Ѵ�.
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("DB connect Succeeded"); // db���� �ֿܼ��� Ȯ��
	}

	public deleteServlet() { // ������
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");

		String str = (String) request.getParameter("userId");

		try {
			DO x = new DO();
			DAO y = new DAO(); 

			x.setId(str); 

			
			System.out.println("deleteServlet 실행");
			System.out.println("ID : " + x.getId() );

			y.deleteItem(x); 
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}