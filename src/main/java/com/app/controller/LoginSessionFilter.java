package com.app.controller;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter("/*")
public class LoginSessionFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        System.out.println("---------------Request Recevied At Filter---------------------- ");
        HttpServletRequest req=(HttpServletRequest)request;
        HttpSession session=req.getSession(false);
        boolean isLoggedin=session!=null && session.getAttribute("user")!=null;
        boolean isLoginRequest=req.getRequestURI().endsWith("authUser");
        System.out.println("Is Loggin Request = "+isLoginRequest);
        if(isLoggedin || isLoginRequest){
            System.out.println("Found active session");
            chain.doFilter(request,response);
        }else{
            System.out.println("No Session Found Please login ");
            RequestDispatcher dispatcher=((HttpServletRequest)request).getRequestDispatcher("index.jsp");
            dispatcher.forward(request, response);
        }


    }
}
