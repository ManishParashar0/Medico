/*
 * package com.manish.madico.filter;
 * 
 * import java.io.IOException; import java.io.PrintWriter;
 * 
 * import javax.servlet.Filter; import javax.servlet.FilterChain; import
 * javax.servlet.ServletException; import javax.servlet.ServletRequest; import
 * javax.servlet.ServletResponse;
 * 
 * public class MyFilter implements Filter {
 * 
 * @Override public void doFilter(ServletRequest request, ServletResponse
 * response, FilterChain chain) throws IOException, ServletException {
 * response.setContentType("text/html"); PrintWriter out = response.getWriter();
 * String uname = request.getParameter("name"); if (uname.startsWith("d")) {
 * out.println("Hello" + uname); } else {
 * out.println("name will start only with K"); } }
 * 
 * }
 */