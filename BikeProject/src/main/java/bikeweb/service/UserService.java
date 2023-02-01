package bikeweb.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bikeWeb.vo.MemberVo;

import bikeweb.dao.UserDao;

@Service
public class UserService {
	@Autowired(required = false)
	private UserDao dao;
	
	public void signup(MemberVo ins) {
		if(ins.getWeight()==0) ins.setWeight(65);
		System.out.println(ins.getId());
		System.out.println(ins.getAuth());
		System.out.println(ins.getName());
		System.out.println(ins.getWeight());
		System.out.println(ins.getPass());
		System.out.println(ins.getEmail());
		System.out.println(ins.getPhoneNumber());
		dao.signup(ins);
	}
	
	public int invalidId(String id) {
		return dao.invalidId(id);
	}
	public int login(MemberVo login) {
		return dao.login(login);
	}
	
}
