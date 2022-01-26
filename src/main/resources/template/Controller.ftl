package ${generator.packageName}.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ${generator.packageName}.pojo.${table.className};
import ${generator.packageName}.pojo.${table.className}Example;
import ${generator.packageName}.service.${table.className}Service;
import com.myl.data.DataSet;
import com.myl.util.GeneratorSSMUtil;

import java.util.UUID;

@Controller
public class ${table.className}Controller {

    @Autowired
    private ${table.className}Service ${table.objectName}Service;

    @RequestMapping("/${table.objectName}List")
    public String ${table.objectName}List(${table.className} ${table.objectName}, Model model, HttpSession session){
        ${table.className}Example example = new ${table.className}Example();
        GeneratorSSMUtil.addLimit(${table.objectName}, example);
        model.addAttribute("data", new DataSet("", 200, ${table.objectName}Service.selectByExample(0, 10000, example), ${table.objectName}Service.countByExample(example)));
        return "${table.objectName}List";
    }

    @RequestMapping("/${table.objectName}s")
    public @ResponseBody DataSet ${table.objectName}s(${table.className} ${table.objectName}, Model model, HttpSession session){
        ${table.className}Example example = new ${table.className}Example();
        GeneratorSSMUtil.addLimit(${table.objectName}, example);
        return new DataSet("", 200, ${table.objectName}Service.selectByExample(0, 10000, example), ${table.objectName}Service.countByExample(example));
    }

    @RequestMapping(value = "/insert${table.className}", method = RequestMethod.GET)
    public String insert${table.className}(Model model) {
        model.addAttribute("id", UUID.randomUUID().toString().replace("-", "").substring(0,12));
        return "insert${table.className}";
    }

    @RequestMapping(value = "/insert${table.className}", method = RequestMethod.POST)
    public @ResponseBody DataSet insert${table.className}(@RequestBody ${table.className} ${table.objectName}) {
        if(${table.objectName}Service.selectByPrimaryKey(${table.objectName}.get${table.primaryKeyC}()) != null)
            return new DataSet("添加失败，该条记录已存在！", 1, ${table.objectName}, 1);

        if(${table.objectName}Service.insertSelective(${table.objectName}) > 0)
            return new DataSet("添加成功！", 200, ${table.objectName}, 1);
        return new DataSet("添加失败！", 0);
    }

    @RequestMapping(value = "/update${table.className}", method = RequestMethod.GET)
    public String update${table.className}(String id, Model model) {
        model.addAttribute("data", new DataSet("", 200, ${table.objectName}Service.selectByPrimaryKey(id), 1));
        return "update${table.className}";
    }

    @RequestMapping(value = "/update${table.className}", method = RequestMethod.POST)
    public @ResponseBody DataSet update${table.className}(@RequestBody ${table.className} ${table.objectName}) {
        if(${table.objectName}Service.selectByPrimaryKey(${table.objectName}.get${table.primaryKeyC}()) == null)
        return new DataSet("修改失败，该条记录不存在！", 1, ${table.objectName}, 1);

        if(${table.objectName}Service.updateByPrimaryKeySelective(${table.objectName}) > 0)
            return new DataSet("修改成功！", 200, ${table.objectName}, 1);
        return new DataSet("修改失败！", 0);
    }

    @RequestMapping("/delete${table.className}")
    public @ResponseBody DataSet delete${table.className}(@RequestBody ${table.className} ${table.objectName}) {
        if(${table.objectName}Service.selectByPrimaryKey(${table.objectName}.get${table.primaryKeyC}()) == null)
            return new DataSet("删除失败，该条记录不存在！", 1, ${table.objectName}, 1);

        if(${table.objectName}Service.deleteByPrimaryKey(${table.objectName}.get${table.primaryKeyC}()) > 0)
            return new DataSet("删除成功！", 200, ${table.objectName}, 1);
        return new DataSet("删除失败！", 0);
    }

}