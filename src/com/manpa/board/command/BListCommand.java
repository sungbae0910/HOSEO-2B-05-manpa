package com.manpa.board.command;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.manpa.board.Dao.BDao;
import com.manpa.board.Dto.BDto;
import com.manpa.board.Dto.BPaging;
public class BListCommand implements BCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub


		 BDao dao = new BDao(); 
		 ArrayList dtos;
		 int page = request.getParameter("page")==null ? 1 : Integer.parseInt(request.getParameter("page"));
		 String opt = request.getParameter("opt");
		 String condi = request.getParameter("condi");
		 
		 HashMap<String, Object> listopt = new HashMap<String, Object>();
		 listopt.put("opt", opt);
		 listopt.put("condi", condi);
		 int totalCount = dao.getListCount(listopt);
		 
		 BPaging paging = new BPaging();
		 paging.setPageNo(page);
		 paging.setPageSize(10);
		 paging.setTotalCount(totalCount);
		 
		 page = (page-1)*10;
		 
		 
		 dtos = dao.list(page, paging.getPageSize(), listopt);
		 
		 
		/* request.setAttribute("list", list); */
		 request.setAttribute("paging", paging);
		 request.setAttribute("list", dtos);

	}
}
