package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BookDAO;
import model.BookVO;
import model.CustomerDAO;
import model.CustomerVO;
import model.RoomDAO;
import model.RoomVO;

/**
 * Servlet implementation class CustomerIdBookChkServlet
 */
@WebServlet("/Mypage/bookchk")
public class CustomerIdBookChkServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String val=request.getParameter("email");//값 받아오기
		BookDAO dao=new BookDAO();//dao 획득
		CustomerDAO dao2=new CustomerDAO();//비교용 dao 획득
		RoomDAO dao3=new RoomDAO();
		try {
			CustomerVO bo2=dao2.customer_search_email(val);//customer_id 구하기
			List<BookVO> vo=dao.bookSelectCustId(bo2.getCustomer_id());//vo 획득 및 회원 아이디로 검색
			
			List<RoomVO> vo3=new ArrayList<RoomVO>();
			for(BookVO lv:vo) {
				vo3.add(dao3.selectByRoomId(lv.getRoom_id()));
			}
			
			request.setAttribute("list", vo); //값 저장
			request.setAttribute("list2", vo3); //값 저장
			RequestDispatcher rd=request.getRequestDispatcher("../BookCheck/BookCheckResultList.jsp");
			rd.forward(request, response);//값 전달
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	

}
