/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.edu.teste.interceptor;

import br.com.caelum.vraptor.ioc.Component;
import br.com.caelum.vraptor.ioc.SessionScoped;
import com.edu.teste.model.Usuario;

/**
 *
 * @author eduardo
 */
@Component
@SessionScoped
public class UserInfo {

    private Usuario usuario;

    public Usuario getUsuario() {
        return usuario;
    }

    public void login(Usuario usuario) {
        this.usuario = usuario;
    }

    public void logout() {
        this.usuario = null;
    }

}

