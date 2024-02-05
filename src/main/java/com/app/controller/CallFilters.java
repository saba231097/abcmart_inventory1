package com.app.controller;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/")
public class CallFilters implements Filter{

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req=(HttpServletRequest) request;
		System.out.println("In Filkter Calls");
		((HttpServletResponse)response).addHeader("Access-Control-Allow-Origin", "*");
		((HttpServletResponse)response).addHeader("Access-Control-Allow-Methods", "GET,POST");
		((HttpServletResponse)response).addHeader("Access-Control-Allow-Header", "*");
		chain.doFilter(request, response);
	}
	

}
