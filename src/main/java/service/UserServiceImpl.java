package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import at.favre.lib.crypto.bcrypt.BCrypt;
import at.favre.lib.crypto.bcrypt.BCrypt.Result;
import mapper.UserMapper;
import utils.MybatisInit;
import vo.User;
import vo.UserDetail;

public class UserServiceImpl implements UserService {

	

	@Override
	public int register(User user) {
		try(SqlSession session = MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			UserMapper mapper = session.getMapper(UserMapper.class);
				return mapper.insert(user);
		}
	}
	public int register(UserDetail userDetail) {
		try(SqlSession session = MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			UserMapper mapper = session.getMapper(UserMapper.class);
				return mapper.insertDetail(userDetail);
		}
	}

	@Override
	public User findBy(String id) {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			UserMapper mapper=session.getMapper(UserMapper.class);
				return mapper.selectOne(id);
	
		}
	}
	public User findByNick(User nickName) {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			UserMapper mapper=session.getMapper(UserMapper.class);
				return mapper.findByNickName(nickName);
	
		}
	}
	
	@Override
	public boolean login(String id, String pw) {
		User u =findBy(id);
		System.out.println(pw);
		Result result = BCrypt.verifyer().verify(pw.toCharArray(),u.getPw());  //첫번쟤는 클라이언트에서 오는 pw 두번째가 vo에서  꺼낼 값
		return result.verified;
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
	public int modify(User user) {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			UserMapper mapper=session.getMapper(UserMapper.class);
				return mapper.update(user);
					
		}
	}


}
