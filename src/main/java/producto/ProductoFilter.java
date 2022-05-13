package producto;

import model.CategoryDao;

import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class ProductoFilter extends HttpServlet implements Filter {
    private static final long serialVersionUID = 1L;
    List<Producto> productoList = new ArrayList<>();
    public void doFilter(ServletRequest Request, ServletResponse Response, FilterChain filterChain)
            throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) Request;
        HttpServletResponse response = (HttpServletResponse) Response;
        HttpSession session = request.getSession();
        String url = request.getServletPath();
        String contextPath = request.getContextPath();

        if (url.equals(""))
            url += "/";
        if(!url.startsWith("/index.html"))
        {
            ProductoDao productoDao = new ProductoDao();
            productoList = productoDao.findAll();

        }
        filterChain.doFilter(Request, Response);
    }

    public void init(FilterConfig arg0) throws ServletException {
    }

}
