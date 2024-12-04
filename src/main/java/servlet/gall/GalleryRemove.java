package servlet.gall;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.PostService;
import service.PostServiceImpl;
import service.common.ServiceCommon;
import utils.Commons;
import vo.Post;

@SuppressWarnings("serial")
@WebServlet("/kallery/remove")
public class GalleryRemove extends HttpServlet{
	private PostService service = new PostServiceImpl();

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pno = req.getParameter("pno");
		Post post = Post.builder().pno(Integer.parseInt(pno)).build();
		System.out.println("0000");
		service.removelikes(post);
		System.out.println("1111");
		service.remove(Integer.parseInt(pno));
		System.out.println("22222");
		Commons.printMsg("삭제 되었습니다.", "/k/kallery", resp);
		
		/*
		 * req.getRequestDispatcher("/WEB-INF/k/gall/galleryView.jsp").forward(req,
		 * resp);
		 */
	}

	
	
}
	