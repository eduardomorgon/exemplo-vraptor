/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.edu.teste.controller.dao;

import br.com.caelum.vraptor.ioc.Component;
import com.edu.teste.model.Usuario;
import java.util.Collection;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;


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
        
        Usuario u;
        try {
            u = (Usuario) em.createQuery("SELECT u FROM Usuario u WHERE u.email = :email")
                    .setParameter("email", entity.getEmail())
                    .getSingleResult();
            } catch (NoResultException e) {
            return false;
        }
        return true;
    }
    
    public Usuario findByLogin(String user, String password) {
        
        try {
            return (Usuario) em.createQuery("SELECT u FROM Usuario u WHERE u.email = :email AND u.senha = :senha")
                    .setParameter("email", user)
                    .setParameter("senha", password)
                    .getSingleResult();
        } catch (NoResultException e) {
            return null;
        }
        
    }

    @Override
    public void refresh(Usuario entity) {
        em.refresh(entity);
    }
    
}
