

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class reserveServlet
 */
@WebServlet(name = "reserve", urlPatterns = { "/reserve" })
public class reserveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public reserveServlet() {
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
		request.setCharacterEncoding("utf-8");

		String str = (String) request.getParameter("userId");
		String time=(String) request.getParameter("time");
		try {
			DO x = new DO(); 
			DAO y = new DAO(); 

			
			x.setId(str);
			x.setReservation(time);
			
			System.out.println("startServlet 실행");
			System.out.println("ID : " + x.getId() + "입니다.");
			System.out.println("예약시간 : " + x.getReservation() + " 입니다.");
			
			y.reserveItem(x);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}

}
