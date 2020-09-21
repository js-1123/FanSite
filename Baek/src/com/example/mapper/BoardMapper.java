package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.RowBounds;

import com.example.bean.BoardInfoBean;
import com.example.bean.ContentBean;

public interface BoardMapper {

	@Select("select board_info_idx, board_info_name " +
			"from board_info_table2 " + 
			"order by board_info_idx")
	List<BoardInfoBean> getBoardMenuList();
	
	
	@Insert("insert into content_table2(content_idx, content_subject, content_text, " + 
					"content_file, content_writer_idx, content_board_idx, content_date) " +
			"values (next value for content_seq, #{content_subject}, #{content_text}, #{content_file}, " +
					"#{content_writer_idx}, #{content_board_idx}, #{content_date})")
	void addContentInfo(ContentBean writeContentBean);
	
	
	@Select("select board_info_name " + 
			"from board_info_table2 " + 
			"where board_info_idx=#{board_info_idx}")
	String getBoardInfoName(int board_info_idx);
	
	@Select("select a1.content_idx, a1.content_subject, a2.user_name as content_writer_name, a1.content_date " + 
			"from content_table2 a1, user_table a2 " + 
			"where a1.content_writer_idx = a2.user_idx " + 
			"and a1.content_board_idx = #{board_info_idx} " + 
			"order by a1.content_idx desc")
	List<ContentBean> getContentList(int board_info_idx, RowBounds rowBounds);
	
	@Select("select a2.user_name as content_writer_name, " + 
			"a1.content_subject, a1.content_text, a1.content_file, a1.content_writer_idx, a1.content_date " + 
			"from content_table2 a1, user_table a2 " + 
			"where a1.content_writer_idx = a2.user_idx " + 
			"and content_idx = #{content_idx}")
	ContentBean getContentInfo(int content_idx);
	
	@Update("update content_table2 " + 
					"set content_subject = #{content_subject}, content_text = #{content_text}, " +
					"content_file = #{content_file} " + 
					"where content_idx = #{content_idx}")
	void modifyContentInfo(ContentBean modifyContentBean);
	
	@Delete("delete from content_table2 where content_idx = #{content_idx}")
	void deleteContentInfo(int content_idx);
	
	@Select("select count(*) from content_table2 where content_board_idx = #{content_board_idx}")
		int getContentCnt(int content_board_idx);
	
	
}
