package com.spring.pek.model;

public class MapVO {
	
	private int fk_seq_tbl_board; 
	private String map_we; 
	private String map_ky;
	private String map_name;
	
	public MapVO() {}
	
	
	public MapVO(int fk_seq_tbl_board, String map_we, String map_ky, String map_name) {
		
		this.fk_seq_tbl_board = fk_seq_tbl_board;
		this.map_we = map_we;
		this.map_ky = map_ky;
		this.map_name = map_name;
	}


	public int getFk_seq_tbl_board() {
		return fk_seq_tbl_board;
	}

	public void setFk_seq_tbl_board(int fk_seq_tbl_board) {
		this.fk_seq_tbl_board = fk_seq_tbl_board;
	}

	public String getMap_we() {
		return map_we;
	}

	public void setMap_we(String map_we) {
		this.map_we = map_we;
	}

	public String getMap_ky() {
		return map_ky;
	}

	public void setMap_ky(String map_ky) {
		this.map_ky = map_ky;
	}


	public String getMap_name() {
		return map_name;
	}


	public void setMap_name(String map_name) {
		this.map_name = map_name;
	}
	
	

}
