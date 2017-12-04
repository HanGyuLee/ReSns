package com.spring.jsr.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

//DAO선언---
//Repository 선언

@Repository
public class JsrDAO implements InterJsrDAO {
	
	//의존객체 주입(DI : Dependency Injection)
	@Autowired
	private SqlSessionTemplate sqlsession;

	
	
	//팔로우 리스트 가지고 오는 메소드
	@Override
	public List<HashMap<String, String>> getFollowList(HashMap<String, String> map) {
		List<HashMap<String, String>> followList = sqlsession.selectList("jsrresns.getFollowList",map);
		return followList;
	}

	
	//팔로워 리스트
	@Override
	public List<HashMap<String, String>> getFollowerList(HashMap<String, String> map) {
		List<HashMap<String, String>> followerList = sqlsession.selectList("jsrresns.getFollowerList",map);
		System.out.println("팔로워 리스트 넘어오나요1");
		return followerList;
	}



/*--------------------------------------------------------------------------------------------------------------------------*/
	
	//이미 팔로우 되어 있는지 확인
	@Override
	public int followCheck(HashMap<String, String> map) {
		int c = sqlsession.selectOne("jsrresns.followCheck",map);
		//팔로우 되어 있는 값이 있으면 1 리턴.
		return c;
	}
	
	
/*--------------------------------------------------------------------------------------------------------------------------*/
	
	//팔로우 하기
	@Override
	public int followAdd(HashMap<String, String> map) {
	 //System.out.println("로그인 아이디 확인::"+map.get("login_id"));
	 //System.out.println("팔로우 아이디 확인::"+map.get("follow_id"));
		int followAdd = sqlsession.insert("jsrresns.followAdd",map);
	 
		return followAdd;
	}

	//팔로우 후에 팔로우 수 팔로워 수 증가 시켜주기
	@Override
	public int followupdate(HashMap<String, String> map) {
		 int n = sqlsession.insert("jsrresns.followupdate",map);	
		return n;
	}

	@Override
	public int followerupdate(HashMap<String, String> map) {
		 int m = sqlsession.insert("jsrresns.followerupdate",map);
		return m;
	}

/*--------------------------------------------------------------------------------------------------------------------------*/	
	
	//언팔하기
	@Override
	public int unFollow(HashMap<String, String> map) {
		int unfollow = sqlsession.delete("jsrresns.unFollow",map);
		return unfollow;
	}

	//언팔 후 팔로우, 팔로워 수 감소
	@Override
	public int unfollowupdate(HashMap<String, String> map) {
		 int n = sqlsession.insert("jsrresns.unfollowupdate",map);	
		return n;
	}

	@Override
	public int unfollowerupdate(HashMap<String, String> map) {
		 int m = sqlsession.insert("jsrresns.unfollowerupdate",map);
		return m;
	}




	
	
	

}
