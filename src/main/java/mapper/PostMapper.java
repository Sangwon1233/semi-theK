package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import vo.Post;

public interface PostMapper {
	List<Post> selectList(int cno);
	
	Post selectOne(int pno);
	
	@Select("select now()")
	String now();
	
	List<Post> lastList();

	List<Post> lastList2();
	
	int write(Post post);
	
	int insert(Post post);
	
//	int getCount(C);
	
	int update(Post post);
	
	int increaseViewCount(int pno);
	
	int delete(int pno);
}
