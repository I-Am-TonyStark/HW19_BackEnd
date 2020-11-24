package com.mamalimomen.services.impl;

import com.mamalimomen.base.services.BaseServiceImpl;
import com.mamalimomen.base.utilities.InValidDataException;
import com.mamalimomen.domains.Medicine;
import com.mamalimomen.repositories.MedicineRepository;
import com.mamalimomen.services.MedicineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;
import java.util.UUID;

@Service
public class MedicineServiceImpl extends BaseServiceImpl<Medicine, UUID, MedicineRepository> implements MedicineService {

    public MedicineServiceImpl(@Autowired MedicineRepository repository) {
        super(repository);
    }

    @Override
    public String updateMedicine(Medicine medicine) {

        try {
            Optional<Medicine> oPersistedMedicine = repository.findOneByCode(medicine.getCode());

            if (oPersistedMedicine.isPresent()) {
                final Medicine persistedMedicine = oPersistedMedicine.get();

                persistedMedicine.setName(medicine.getName());

                persistedMedicine.setPrice(medicine.getPrice());

                persistedMedicine.setDescription(medicine.getDescription());

                saveOrUpdateOne(persistedMedicine);
            }
        } catch (InValidDataException e) {
            return e.getMessage();
        }
        return "This medicine was updated successfully!";
    }

    @Override
    public String createNewMedicine(Medicine medicine) {
        saveOrUpdateOne(medicine);

        return "This medicine was created successfully!";
    }

    @Override
    public String deleteExistMedicine(Medicine medicine) {
        deleteOneById(medicine.getUuid());

        return "This medicine was deleted successfully!";
    }
}
