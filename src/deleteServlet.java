import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

/**
 * Servlet implementation class insertServlet
 */

@WebServlet(name = "delete", description = "사원 삭제 서블릿", urlPatterns = { "/delete" }) // 서블릿 설명
public class deleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */

	public void init(ServletConfig conf) throws ServletException { // 서블릿의 초기화시 db연동
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver"); // 데이터베이스와 연동하기 위해 DriverManager에 등록한다.
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("DB connect Succeeded"); // db연동 콘솔에서 확인
	}

	public deleteServlet() { // 생성자
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
			DO x = new DO(); // do 객체 생성
			DAO y = new DAO(); // dao 객체 생성

			// 값가져오기
			x.setId(str); // post로 넘어온 id를 x의 id로 set한다

			// 넘어온 값들이 정상적으로 잘 넘어왔는지 콘솔에서 확인
			System.out.println("deleteServlet 실행");
			System.out.println("ID 값은 " + x.getId() + " 입니다.");

			y.deleteItem(x); // dao의 deleteitem 메소드에 접근
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}