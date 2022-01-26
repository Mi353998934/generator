package com.myl.generator;

import com.myl.bean.TableField;
import com.myl.generator.GeneratorBackEnd;
import com.myl.util.FreemarkerUtil;
import org.mybatis.generator.api.MyBatisGenerator;
import org.mybatis.generator.config.Configuration;
import org.mybatis.generator.config.xml.ConfigurationParser;
import org.mybatis.generator.internal.DefaultShellCallback;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

/**
 * @Author myl
 */
public class GeneratorAll {

    public static void main(String[] args) throws Exception {
        generatorFTL();
        generatorSSM();
    }

    public static void generatorSSM() throws Exception{
        List<String> warnings = new ArrayList<String>();
        boolean overwrite = true;
        //指定逆向工程配置文件
        File configFile = new File(FreemarkerUtil.getURL("classpath:generatorConfig.xml").getFile());
        ConfigurationParser cp = new ConfigurationParser(warnings);
        Configuration config = cp.parseConfiguration(configFile);
        DefaultShellCallback callback = new DefaultShellCallback(overwrite);
        MyBatisGenerator myBatisGenerator = new MyBatisGenerator(config,
                callback, warnings);
        myBatisGenerator.generate(null);
    }

    public static void generatorFTL() throws Exception {
        GeneratorBackEnd generatorBackEnd = new GeneratorBackEnd();
        generatorBackEnd.generator();
    }

}
