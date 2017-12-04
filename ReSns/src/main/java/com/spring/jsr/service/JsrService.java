package com.spring.jsr.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.spring.jsr.model.InterJsrDAO;


//service  선언
@Service
public class JsrService implements InterJsrService {
	
	//의존객체 주입
	@Autowired
	private InterJsrDAO jdao;

	
	
	//팔로우 리스트 가져오기
	@Override
	public List<HashMap<String, String>> followList(HashMap<String, String> map) {
		List<HashMap<String, String>> followList = jdao.getFollowList(map);
		return followList;
	}


	//팔로워 리스트
	@Override
	public List<HashMap<String, String>> followerList(HashMap<String, String> map) {
		List<HashMap<String, String>> followerList = jdao.getFollowerList(map);
		System.out.println("팔로워 리스트 넘어오나요2");
		return followerList;
	}

	
	
	

	//팔로우 하기
	@Override
	//팔로우, 팔로워 업데이트 해주기 위해
	@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.READ_COMMITTED, rollbackFor={Throwable.class})
	public int followAdd(HashMap<String, String> map) throws Throwable{
		
		int followCheck = 0; //중복팔롱 확인
		int followAddlist =0; //팔로우 하기
		int n = 0;//팔로우 값 1 증가
		int m = 0;//팔로워 값 1 증가
		int followAdd = 0; //팔로우 완료
		
		//이미 팔로우가 되어 있는지 확인
		followCheck = jdao.followCheck(map);
		
		if (followCheck == 1){
			//이미 팔로우를 한 상태이다.
			followAdd = -3;		
		}

		else if (followCheck == 0){
			followAddlist = jdao.followAdd(map);
			//팔로우 하기

			if(followAddlist > 0){
				//팔로우, 팔로워 값 증가하기
				n = jdao.followupdate(map);
				m = jdao.followerupdate(map);	

				int nm = n+m;

				if (nm >1){
					//증가 완료 했다면 팔로우 최종 승인해주기.
					followAdd = 1;
				}//end of if nm>1		

			}//end of followAddlist > 0 팔로우 추가 완료

		}//end of else if followCheck ==0
			
		return followAdd;
	}


	//언팔로우하기
	@Override
	public int unFollow(HashMap<String, String> map) {
		
		int followCheck = 0; //팔로 상태 확인
		int unFollowAdd =0; //언팔로우 하기
		int n = 0;//팔로우 값 1 감소
		int m = 0;//팔로워 값 1 감소
		int unFollowAddEnd = 0; //언팔로우 완료
		
		
		followCheck = jdao.followCheck(map);
		
		
		if (followCheck == 0){
			//이미 팔로우를 한 상태이다.
			unFollowAddEnd = -3;		
		}
		
		else if (followCheck == 1){
			unFollowAdd = jdao.unFollow(map);
			//언팔로우 하기

			if(unFollowAdd > 0){
				//팔로우, 팔로워 값 증가하기
				n = jdao.unfollowupdate(map);
				m = jdao.unfollowerupdate(map);	

				int nm = n+m;

				if (nm >1){
					//증가 완료 했다면 팔로우 최종 승인해주기.
					unFollowAddEnd = 1;
				}//end of if nm>1		

			}//end of followAddlist > 0 팔로우 추가 완료

		}//end of else if followCheck ==0
		
		return unFollowAddEnd;
	}

	
	

	
	
	
}//end of service
