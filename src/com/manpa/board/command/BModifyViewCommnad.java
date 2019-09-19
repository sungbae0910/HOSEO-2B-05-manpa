package com.manpa.board.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.manpa.board.Dao.BDao;
import com.manpa.board.Dto.BDto;

public class BModifyViewCommnad implements BCommand {
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String id = request.getParameter("id");
		BDao dao = new BDao();
		BDto dto = dao.contentView(id);
		
		request.setAttribute("modify_view", dto);
		
	}
}
