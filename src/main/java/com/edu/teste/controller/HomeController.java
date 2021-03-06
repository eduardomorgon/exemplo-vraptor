/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.edu.teste.controller;

import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.Validator;
import br.com.caelum.vraptor.validator.ValidationMessage;
import com.edu.teste.controller.dao.UsuarioDao;
import com.edu.teste.interceptor.Public;
import com.edu.teste.interceptor.UserInfo;
import com.edu.teste.model.Usuario;
import com.google.common.hash.Hashing;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 *
 * @author eduardo
 */
@Resource
public class HomeController {
    
    private final Result result;
    private final UserInfo userInfo;
    private final UsuarioDao dao;
    private final Validator validator;
    private final Logger logger = LoggerFactory.getLogger(this.getClass()); 

    public HomeController(Result result, UserInfo userInfo, UsuarioDao dao, Validator validator) {
        this.result = result;
        this.userInfo = userInfo;
        this.dao = dao;
        this.validator = validator;
    }
    
    @Get("/")
    @Public
    public void login(){
    }
    
    @Post
    @Public
    public void login(String login, String password) {
        Usuario currentUser;
        try {
            currentUser = dao.findByLogin(login, Hashing.md5().hashString(password).toString());
            if(currentUser != null){
                userInfo.login(currentUser);
                result.redirectTo(HomeController.class).home();
            }else{
                validator.add(new ValidationMessage("Login e/ou senha inválidos", "usuario.login"));
                validator.onErrorForwardTo(HomeController.class).login();
            }
        } catch (NullPointerException e) {
            logger.error("Login e/ou senha nulo");
            validator.add(new ValidationMessage("Login e/ou senha inválidos", "usuario.login"));
            validator.onErrorForwardTo(HomeController.class).login();
        }
      
    }
    
    @Path("/login/logout")
    public void logout(){
        userInfo.logout();
        result.redirectTo(this).login();
    }
    
    @Get("/home")
    public void home(){
        
    }
}
