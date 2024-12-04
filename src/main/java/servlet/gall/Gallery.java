package servlet.gall;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Criteria;
import dto.PageDto;
import dto.PostDto;
import service.PostService;
import service.PostServiceImpl;
import service.common.ServiceCommon;
import vo.Post;
import vo.User;

@SuppressWarnings("serial")
@WebServlet("/kallery")
public class Gallery extends HttpServlet{
	private PostService service = new PostServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Criteria cri = new Criteria(req);
		User user = (vo.User)req.getSession().getAttribute("user");
		cri.setCno(2); // 갤러리 카테고리
		cri.setAmount(8); // 보여지는 갯수 8개
		if(user==null) {
			req.getRequestDispatcher("/WEB-INF/k/user/intro.jsp").forward(req, resp);
	        return;
		}
		
		List<PostDto> postDtos = service.postAndLike(cri,user.getId());
		
		req.setAttribute("userId", user.getId());
		req.setAttribute("posts", postDtos);
		req.setAttribute("currentPage", "kallery");
		req.setAttribute("pageDto", new PageDto(cri, service.count(cri)));
		
		
		req.getRequestDispatcher("/WEB-INF/k/gall/gallery.jsp").forward(req, resp);
	}

	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Post post = ServiceCommon.getJson(req, Post.class);
		
		req.setAttribute("post", service.view(post.getPno()));
	}

	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Post post = ServiceCommon.getJson(req, Post.class);
		boolean likeCk = service.removelikes(post);
		System.out.println("del");
		if(likeCk) {
			ServiceCommon.sendJson(resp, "success");
		}else {
			ServiceCommon.sendJson(resp, "fail");
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Post post = ServiceCommon.getJson(req, Post.class);
		boolean likeCk = service.likes(post);
		System.out.println("in");
		if(likeCk) {
			ServiceCommon.sendJson(resp, "success");
		}else {
			ServiceCommon.sendJson(resp, "fail");
		}
		
	}
	
	
}
