package com.kpc.homes;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/aptinfo")
public class InfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public InfoServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String aptStr=null;
		
		InfoCraw info = new InfoCraw();
		ArrayList<InfoVO> list = info.getInfo(aptStr);

		RequestDispatcher rd = request.getRequestDispatcher("/apt_info.jsp");
		request.setAttribute("AptInfoKKK", list);
		rd.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
	}

}
