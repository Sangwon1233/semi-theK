package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mapper.UserMapper;
import utils.MybatisInit;
import vo.User;

public class UserServiceImpl implements UserService {

	@Override
	public String register(User user) {
		try(SqlSession session = MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			UserMapper mapper = session.getMapper(UserMapper.class);
				return mapper.insert(user);
		}
	}

	@Override
	public User findBy(String id) {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			UserMapper mapper=session.getMapper(UserMapper.class);
				return mapper.selectOne(id);
	
		}
	}
	public static void main(String[] args) {
		User t =  new UserServiceImpl().findBy("eee");
		System.out.println(t);

	}
	@Override
	public boolean login(String id, String pw) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<User> list() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean remove(String id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean modify(User user) {
		// TODO Auto-generated method stub
		return false;
	}


}
