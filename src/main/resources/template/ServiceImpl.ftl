package ${generator.packageName}.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import ${generator.packageName}.mapper.${table.className}Mapper;
import ${generator.packageName}.pojo.${table.className};
import ${generator.packageName}.pojo.${table.className}Example;

@Service
public class ${table.className}ServiceImpl implements ${table.className}Service{

    @Autowired
    private ${table.className}Mapper ${table.objectName}Mapper;

    @Override
    public int countByExample(${table.className}Example example) {
        return ${table.objectName}Mapper.countByExample(example);
    }

    @Override
    public int deleteByExample(${table.className}Example example) {
        return ${table.objectName}Mapper.deleteByExample(example);
    }

    @Override
    public int deleteByPrimaryKey(String id) {
        return ${table.objectName}Mapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(${table.className} record) {
        return ${table.objectName}Mapper.insert(record);
    }

    @Override
    public int insertSelective(${table.className} record) {
        return ${table.objectName}Mapper.insertSelective(record);
    }

    @Override
    public List<${table.className}> selectByExample(int pageNum, int pageSize, ${table.className}Example example) {
        PageHelper.startPage(pageNum, pageSize);
        return ${table.objectName}Mapper.selectByExample(example);
    }

    @Override
    public ${table.className} selectByPrimaryKey(String id) {
        return ${table.objectName}Mapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByExampleSelective(${table.className} record, ${table.className}Example example) {
        return ${table.objectName}Mapper.updateByExampleSelective(record, example);
    }

    @Override
    public int updateByExample(${table.className} record, ${table.className}Example example) {
        return ${table.objectName}Mapper.updateByExample(record, example);
    }

    @Override
    public int updateByPrimaryKeySelective(${table.className} record) {
        return ${table.objectName}Mapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(${table.className} record) {
        return ${table.objectName}Mapper.updateByPrimaryKey(record);
    }

}