import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import org.apache.commons.fileupload.*;
import java.util.*;

public class FileUploadCommons extends HttpServlet {
  public void doPost(HttpServletRequest request,
                     HttpServletResponse response)
  throws IOException, ServletException {

    response.setContentType("text/html");
    PrintWriter out = response.getWriter();

    out.println("<html>");
    out.print("File upload success. <a href=\"/jspbook/files/");
    out.print("\">Click here to browse through all uploaded ");
    out.println("files.</a><br>");

    ServletContext sc = getServletContext();
    String path = sc.getRealPath("/files");
    org.apache.commons.fileupload.FileUpload fu = new org.apache.commons.fileupload.FileUpload();
    fu.setSizeMax(-1);
    fu.setRepositoryPath(path);
    try {
      List l = fu.parseRequest(request);
      Iterator i = l.iterator();
      while (i.hasNext()) {
        FileItem fi = (FileItem)i.next();
        fi.write(path+"/"+fi.getName());
      }
    }
    catch (Exception e) {
      throw new ServletException(e);
    }

    out.println("</html>");
  }
  public void doGet(HttpServletRequest request,
                    HttpServletResponse response)
  throws IOException, ServletException {
    doPost(request, response);
  }
}