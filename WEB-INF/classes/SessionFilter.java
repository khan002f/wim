package sessions.filter;

import java.io.IOException;
//import java.util.ArrayList;
import java.util.*;
import java.util.StringTokenizer;
 
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
 
public class SessionFilter implements Filter {
 
    private ArrayList urlList;
    private int totalURLS;
 
    public void destroy() {
    }
 
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {

HttpServletRequest request = (HttpServletRequest) req;
HttpServletResponse response = (HttpServletResponse) res;

String url = request.getServletPath();
String contextPath = request.getContextPath();
boolean allowedRequest = false;

for(int i=0; i<totalURLS; i++) {
if(url.contains(urlList.get(i))) {
allowedRequest = true;
break;
}
}
if (!allowedRequest) {
HttpSession session = request.getSession();
if (null == session) {
response.sendRedirect(contextPath+"/jsp/loginError.jsp");
}else{
String logged = (String) session.getAttribute("logged-in");
if (logged == null){
response.sendRedirect(contextPath+"/jsp/loginError.jsp");
}else{
chain.doFilter(request, response);
}
}
} else{
chain.doFilter(request, response);
}

}
 
    public void init(FilterConfig config) throws ServletException {
        String urls = config.getInitParameter("avoid-urls");
        StringTokenizer token = new StringTokenizer(urls, ",");
 
        urlList = new ArrayList<String>();
 
        while (token.hasMoreTokens()) {
           urlList.add(token.nextToken());

        }
        totalURLS = urlList.size();
    }
}