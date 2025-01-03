package servlet.manage.mng;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Criteria;
import dto.PageDto;
import service.manage.MngUserService;
import service.manage.MngUserServiceImpl;

@SuppressWarnings("serial")
@WebServlet("/manage/user")
public class MngUserList extends HttpServlet {
	private MngUserService service = new MngUserServiceImpl();
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Criteria cri = new Criteria(req);
		
		req.setAttribute("menu", "manage");
		req.setAttribute("tab", "u");
		req.setAttribute("users", service.userList(cri));
		req.setAttribute("currentPage", "user");
		req.setAttribute("pageDto", new PageDto(cri, service.count(cri)));
		
		req.getRequestDispatcher("/WEB-INF/k/manage/manageUser.jsp").forward(req, resp);
	}
}
