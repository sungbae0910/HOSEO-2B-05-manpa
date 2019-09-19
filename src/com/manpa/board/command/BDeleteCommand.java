package com.manpa.board.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.manpa.board.Dao.BDao;

public class BDeleteCommand implements BCommand{
		
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String id= request.getParameter("id");
		BDao dao = new BDao();
		dao.delete(id);
		
	}

}
