package com.jk.service.Impl;

import com.jk.dao.GlDao;
import com.jk.pojo.Tree;
import com.jk.service.GlService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.List;
@Service
public class GlServiceImpl implements GlService{

    @Autowired
    private GlDao glDao;

    @Override
    public List<Tree> queryTree(){
        List<Tree> treeList = this.formarttree("0");
        return treeList;
    }


    public List<Tree> formarttree(String pid) {
        List<Tree> menus = glDao.queryTree(pid);
        if (menus != null && menus.size() > 0) {
            for (int i = 0; i < menus.size(); i++) {
                List<com.jk.pojo.Tree> menu2 = formarttree(menus.get(i).getId());
                menus.get(i).setNodes(menu2);
            }
        }
        return menus;
    }

}
