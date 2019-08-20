import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

/**
 * Servlet implementation class insertServlet
 */

@WebServlet(name = "update", description = "방갱신", urlPatterns = { "/update" })
public class updateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */

	public void init(ServletConfig conf) throws ServletException {// ������ �ʱ�ȭ�� db����
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver"); // �����ͺ��̽��� �����ϱ� ���� DriverManager�� ����Ѵ�.
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("DB connect Succeeded"); // db���� �ֿܼ��� Ȯ��
	}

	public updateServlet() {// ������
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

		request.setCharacterEncoding("utf-8");

		String str = (String) request.getParameter("userId");

		try {
			DO x = new DO(); 
			DAO y = new DAO(); 

			
			x.setId(str); 
			x.setName(request.getParameter("name"));
			x.setHori(request.getParameter("hori"));
			x.setVert(request.getParameter("vert"));

			System.out.println("updateServlet ����");
			System.out.println("ID : " + x.getId() + "입니다.");
			System.out.println("name : " + x.getName() + " 입니다.");
			System.out.println("hori : " + x.getHori() + " 입니다.");
			System.out.println("vert : " + x.getVert() + " 입니다.");
			
			y.updateItem(x);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}