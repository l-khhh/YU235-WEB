

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class startServlet
 */
@WebServlet(name = "start", urlPatterns = { "/start" })
public class startServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public startServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
    public void init(ServletConfig conf) throws ServletException {// ������ �ʱ�ȭ�� db����
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver"); // �����ͺ��̽��� �����ϱ� ���� DriverManager�� ����Ѵ�.
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("DB connect Succeeded"); // db���� �ֿܼ��� Ȯ��
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		request.setCharacterEncoding("euc-kr");

		String str = (String) request.getParameter("userId");
		System.out.println(str);

		try {
			DO x = new DO(); // do ��ü ����
			DAO y = new DAO(); // dao ��ü ����

			// ����������
			x.setId(str); // post�� �Ѿ�� id���� x�� id�� set
			x.setOnoff("on");
			
			System.out.println("startServlet ����");
			System.out.println("ID : " + x.getId() + "입니다.");
			System.out.println("onoff : " + x.getOnoff() + " 입니다.");
			
			y.startItem(x);// dao�� updateitem �޼ҵ忡 ����
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}

}
