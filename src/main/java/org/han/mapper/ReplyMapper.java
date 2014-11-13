package org.han.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.han.vo.ReplyVO;

public interface ReplyMapper {
	
	@Select("select * from tbl_reply where bno= #{bno}")
	public List<ReplyVO> list(int bno);
}
