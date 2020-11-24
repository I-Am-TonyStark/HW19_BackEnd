package com.mamalimomen.base.services;

import com.mamalimomen.base.domains.BaseEntity;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.List;
import java.util.Optional;

public interface BaseService<E extends BaseEntity, ID extends Serializable> {
    Optional<E> saveOrUpdateOne(E e);

    void deleteOneById(ID id);

    Optional<E> findOneById(ID id);

    List<E> findAll();
}
