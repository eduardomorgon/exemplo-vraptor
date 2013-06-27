/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.edu.teste.controller.dao;

import br.com.caelum.vraptor.ioc.Component;
import com.edu.teste.model.Usuario;
import java.util.Collection;
import javax.persistence.EntityManager;


/**
 *
 * @author eduardo
 */
@Component
public class UsuarioDao implements GenericDao<Usuario>{
    
    private EntityManager em;

    public UsuarioDao(EntityManager em) {
        this.em = em;
    }

    @Override
    public Collection<Usuario> all() {
        return em.createQuery("SELECT u FROM Usuario u").getResultList();
    }

    @Override
    public Usuario find(Usuario entity) {
        return em.find(Usuario.class, entity.getEmail());
    }

    @Override
    public void remove(Usuario entity) {
        em.remove(entity);
    }

    @Override
    public void save(Usuario entity) {
        if(exists(entity)){
            em.merge(entity);
        }else{
            em.persist(entity);
        }
    }

    @Override
    public Boolean exists(Usuario entity) {
        Usuario u = em.find(Usuario.class, entity.getEmail());
        if(u == null){
            return false;
        }else{
            return true;
        }
    }
    
}
