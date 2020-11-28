package com.mamalimomen.repositories;

import com.mamalimomen.base.repositories.BaseRepository;
import com.mamalimomen.domains.Medicine;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@Repository
@Transactional
public interface MedicineRepository extends BaseRepository<Medicine, Long> {

    //@Query("SELECT m FROM #{#entityName} m WHERE m.code = ?1") //SpEl
    //@Query("SELECT m FROM Medicine m WHERE m.code = ?1")
    //@Query(value = "SELECT m.* FROM tbl_medicine AS m WHERE m.code = ?1", nativeQuery = true)
    Optional<Medicine> findOneByCode(Long code);
}
