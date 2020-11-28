package com.mamalimomen.base.services;

import com.mamalimomen.base.domains.BaseEntity;
import com.mamalimomen.base.repositories.BaseRepository;
import org.springframework.dao.DataIntegrityViolationException;

import java.io.Serializable;
import java.util.List;
import java.util.Optional;

public class BaseServiceImpl<E extends BaseEntity
        , ID extends Serializable
        , REP extends BaseRepository<E, ID>>
        implements BaseService<E, ID> {

    protected final REP repository;

    public BaseServiceImpl(REP repository) {
        this.repository = repository;
    }

    @Override
    public Optional<E> saveOrUpdateOne(E e) {
        try {
            return Optional.of(repository.save(e));
        } catch (DataIntegrityViolationException ex) {
            return Optional.empty();
        }
    }

    @Override
    public void deleteOneById(ID id) {
        repository.deleteById(id);
    }

    @Override
    public Optional<E> findOneById(ID id) {
        return repository.findById(id);
    }

    @Override
    public List<E> findAll() {
        return repository.findAll();
    }
}
