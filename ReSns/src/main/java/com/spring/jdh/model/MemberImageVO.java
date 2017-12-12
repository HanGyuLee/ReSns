package com.spring.jdh.model;

import org.springframework.web.multipart.MultipartFile;

public class MemberImageVO {

	int uimg_seq;
	String fk_login_id;
	String uimg_profile_filename;		// WAS(톰캣)에 저장될 파일명(20161121324325454354353333432.png)
	String uimg_header_filename;		// WAS(톰캣)에 저장될 파일명(20161121324325454354353333432.png)
	String uimg_profile_orgfilename;	// 진짜 파일명(ex) --> 강아지.png)
	String uimg_header_orgfilename;		// 진짜 파일명(ex) --> 강아지.png)
	int uimg_profile_filesize;			// 진짜 파일 ==> WAS(톰캣) 디스크에 저장됨.
	int uimg_header_filesize;			// 진짜 파일 ==> WAS(톰캣) 디스크에 저장됨.
	
	
	/*
	   ===== #131. 파일첨부를 하도록 VO 수정하기
	                            먼저, 오라클에서 tblBoard 테이블에
	               3개 컬럼(fileName, orgFilename, fileSize)을 추가한 다음에
	                            아래의 작업을 해야 한다. ===== 
	*/
	
	private MultipartFile attach; // 진짜 파일 ==> WAS(톰캣) 디스크에 저장됨.
	    // MultipartFile attach 는 오라클 데이터베이스 tblBoard 테이블의 컬럼이 아니다.!!!!!!
	
	
	
	
	
	public MemberImageVO() {}
	
		public MemberImageVO(int uimg_seq, String fk_login_id, String uimg_profile_filename,
				String uimg_header_filename, String uimg_profile_orgfilename, String uimg_header_orgfilename,
				int uimg_profile_filesize, int uimg_header_filesize, MultipartFile attach) {
			
			this.uimg_seq = uimg_seq;
			this.fk_login_id = fk_login_id;
			this.uimg_profile_filename = uimg_profile_filename;
			this.uimg_header_filename = uimg_header_filename;
			this.uimg_profile_orgfilename = uimg_profile_orgfilename;
			this.uimg_header_orgfilename = uimg_header_orgfilename;
			this.uimg_profile_filesize = uimg_profile_filesize;
			this.uimg_header_filesize = uimg_header_filesize;
			this.attach = attach;
		}

		public int getUimg_seq() {
			return uimg_seq;
		}

		public void setUimg_seq(int uimg_seq) {
			this.uimg_seq = uimg_seq;
		}

		public String getFk_login_id() {
			return fk_login_id;
		}

		public void setFk_login_id(String fk_login_id) {
			this.fk_login_id = fk_login_id;
		}

		public String getUimg_profile_filename() {
			return uimg_profile_filename;
		}

		public void setUimg_profile_filename(String uimg_profile_filename) {
			this.uimg_profile_filename = uimg_profile_filename;
		}

		public String getUimg_header_filename() {
			return uimg_header_filename;
		}

		public void setUimg_header_filename(String uimg_header_filename) {
			this.uimg_header_filename = uimg_header_filename;
		}

		public String getUimg_profile_orgfilename() {
			return uimg_profile_orgfilename;
		}

		public void setUimg_profile_orgfilename(String uimg_profile_orgfilename) {
			this.uimg_profile_orgfilename = uimg_profile_orgfilename;
		}

		public String getUimg_header_orgfilename() {
			return uimg_header_orgfilename;
		}

		public void setUimg_header_orgfilename(String uimg_header_orgfilename) {
			this.uimg_header_orgfilename = uimg_header_orgfilename;
		}

		public int getUimg_profile_filesize() {
			return uimg_profile_filesize;
		}

		public void setUimg_profile_filesize(int uimg_profile_filesize) {
			this.uimg_profile_filesize = uimg_profile_filesize;
		}

		public int getUimg_header_filesize() {
			return uimg_header_filesize;
		}

		public void setUimg_header_filesize(int uimg_header_filesize) {
			this.uimg_header_filesize = uimg_header_filesize;
		}

		public MultipartFile getAttach() {
			return attach;
		}

		public void setAttach(MultipartFile attach) {
			this.attach = attach;
		}
	
	
}
