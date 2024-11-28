package servlet.post;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Criteria;
import service.PostService;
import service.PostServiceImpl;
import utils.Commons;
import vo.Post;
import vo.User;

@WebServlet("/list/modify")
public class Modify extends HttpServlet{
	private PostService service = new PostServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String pnoStr = req.getParameter("pno");
		Object userObj = req.getSession().getAttribute("user");
		Criteria criteria = new Criteria(req);
		String redirectURL = "list?" + criteria.getQs2();
		
		if(pnoStr == null || userObj == null) {
			Commons.printMsg("SYSTEM :: ERR / INVALID APPROACH", redirectURL, resp);
			return;
		}
		
		Integer pno = Integer.valueOf(pnoStr);
		User u = (User)userObj;
		if(!u.getId().equals(service.findBy(pno).getUserId())) {
			Commons.printMsg("SYSTEM :: ERR / POST CAN BE ONLY REMOVED BY WRITER OF IT\'S OWN", redirectURL, resp);
			return;
		}
		req.setAttribute("criteria", criteria);
		req.setAttribute("post", service.findBy(pno));
		req.getRequestDispatcher("/WEB-INF/jsp/post/modify.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PostService post = new PostServiceImpl();
		Object userObj = req.getSession().getAttribute("user");
		Criteria criteria = new Criteria(req);
		
		if(userObj == null) {
			Commons.printMsg("SYSTEM :: ERR / INVALID APPROACH", "list?" +criteria.getQs2(), resp);
			return;
		}
		User m = (User)userObj;
		
		String title = req.getParameter("title");		
		String content = req.getParameter("content");		
		String pnoStr = req.getParameter("pno");		
		Integer pno = Integer.parseInt(pnoStr);
		
		if(!m.getId().equals(service.findBy(pno).getUserId())) {
			Commons.printMsg("SYSTEM :: ERR / POST CAN BE ONLY MODED BY WRITER OF IT'S OWN", "list?" +criteria.getQs2(), resp);
			return;
		}
		
		service.update(Post.builder().title(title).content(content).pno(pno).build());
		resp.sendRedirect("view?pno="+pno+ "&" +criteria.getQs2());
	}
}
