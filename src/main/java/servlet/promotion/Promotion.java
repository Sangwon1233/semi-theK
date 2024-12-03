package servlet.promotion;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Criteria;
import dto.PageDto;
import service.PostService;
import service.PostServiceImpl;
import vo.Post;

@WebServlet("/promotion")
public class Promotion extends HttpServlet{
	PostService postService = new PostServiceImpl();
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userId = ((String)req.getSession().getAttribute("userRealId"));
		Criteria cri = new Criteria(req);
		int idx = req.getQueryString().indexOf('=');
		String cno = req.getQueryString().substring(idx+1);
		cri.setCno(3); // 프로모션 카테고리
		cri.setAmount(8); // 보여지는 갯수 8개
		if(userId == null) {
			req.getRequestDispatcher("/WEB-INF/k/user/intro.jsp").forward(req, resp);
	        return;
		}
		List<Post> postList = postService.listPost(cri);
		req.setAttribute("posts", postList);
		req.setAttribute("userId", userId);
		req.setAttribute("pageDto", new PageDto(cri, postService.count(cri)));
		req.setAttribute("currentPage", "promotion");
		req.setAttribute("cno", cno);
		
		req.getRequestDispatcher("/WEB-INF/k/promotion/promotion.jsp").forward(req, resp);
	}
}
