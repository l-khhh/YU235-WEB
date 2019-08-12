import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

/**
 * Servlet implementation class insertServlet
 */

@WebServlet(name = "insert", description = "방등록", urlPatterns = { "/insert" }) // ���� ����
public class insertServlet extends HttpServlet {
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

	public insertServlet() { // ������
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

		try {
			DO x = new DO(); // do ��ü ����
			DAO y = new DAO(); // dao ��ü ����

			// ����������
			x.setId(request.getParameter("id")); // post�� �Ѿ�� id���� x�� id�� set
			x.setName(request.getParameter("name")); // post�� �Ѿ�� name���� x�� name���� set
			x.setHori(request.getParameter("hori"));// post�� �Ѿ�� sex���� x�� sex���� set
			x.setVert(request.getParameter("vert"));// post�� �Ѿ�� position���� x�� position���� set

			// �Ѿ�� ������ ���������� �� �Ѿ�Դ��� �ֿܼ��� Ȯ��
			System.out.println("insertServlet ����");
			System.out.println("ID : " + x.getId() + "입니다.");
			System.out.println("name : " + x.getName() + " 입니다.");
			System.out.println("hori : " + x.getHori() + " 입니다.");
			System.out.println("vert : " + x.getVert() + " 입니다.");

			y.insertItem(x); // dao�� insertitem �޼ҵ忡 ����
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}