/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.edu.teste.interceptor;

import br.com.caelum.vraptor.InterceptionException;
import br.com.caelum.vraptor.Intercepts;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.Validator;
import br.com.caelum.vraptor.core.InterceptorStack;
import br.com.caelum.vraptor.interceptor.Interceptor;
import br.com.caelum.vraptor.resource.ResourceMethod;
import br.com.caelum.vraptor.validator.ValidationMessage;
import com.edu.teste.controller.HomeController;
import com.edu.teste.controller.dao.UsuarioDao;
import java.util.Arrays;

/**
 *
 * @author eduardo
 */
@Intercepts
public class AuthorizationInterceptor implements Interceptor {
    
    private final UserInfo info;
    private final UsuarioDao dao;
    private final Result result;

    public AuthorizationInterceptor(UserInfo info, UsuarioDao dao, Result result) {
        this.info = info;
        this.dao = dao;
        this.result = result;
    }

    @Override
    public void intercept(InterceptorStack stack, ResourceMethod method, Object resourceInstance) throws InterceptionException {
        /**
    	 * You can use the result even in interceptors.
    	 */
    	if (info.getUsuario()== null) {
            // remember added parameters will survive one more request, when there is a redirect
            result.include("errors", Arrays.asList(new ValidationMessage("Usuário não está logado!", "usuario")));
            result.forwardTo(HomeController.class).login();
    	} else {
            //dao.refresh(info.getUsuario());
            // continues execution
            stack.next(method, resourceInstance);
    	}
    }

    @Override
    public boolean accepts(ResourceMethod method) {
        return !method.containsAnnotation(Public.class);
    }
    
}
