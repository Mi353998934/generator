package ${generator.packageName}.servlet;

import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myl.annotation.RequestParam;
import com.myl.util.RequestUtil;

import ${generator.packageName}.bean.${table.className};

@WebServlet("/${table.objectName}")
public class ${table.className}Servlet extends BaseServlet{

    private static final long serialVersionUID = 1L;

    public String list(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("data", ${table.objectName}Dao.selectAll());
        return PROJECT_FORWARD + "${table.objectName}List.jsp";
    }

    public String insert(HttpServletRequest request, HttpServletResponse response) throws InstantiationException, IllegalAccessException, NoSuchFieldException, SecurityException, IllegalArgumentException, NoSuchMethodException, InvocationTargetException, ParseException {
        String method = request.getMethod();
        if(method.equals("POST")) {
            ${table.className} ${table.objectName} = RequestUtil.paramRequest(${table.className}.class, request);
            ${table.objectName}Dao.insert(${table.objectName});
            return PROJECT_REDIRECT + "/${table.objectName}?method=list";
        }
        return PROJECT_FORWARD + "insert${table.className}.jsp";
    }

    public String update(HttpServletRequest request, HttpServletResponse response) throws IllegalArgumentException, IllegalAccessException, InstantiationException, NoSuchFieldException, SecurityException, NoSuchMethodException, InvocationTargetException, ParseException {
        if(request.getMethod().equals("POST")) {
            ${table.className} ${table.objectName} = RequestUtil.paramRequest(${table.className}.class, request);
            ${table.objectName}Dao.update(${table.objectName});
            return PROJECT_REDIRECT + "/${table.objectName}?method=list";
        }
        return PROJECT_FORWARD + "update${table.className}.jsp";
    }

    public String delete(@RequestParam("id") String id, HttpServletResponse response) {
        ${table.objectName}Dao.delete(id);
        return PROJECT_REDIRECT + "/${table.objectName}?method=list";
    }
}