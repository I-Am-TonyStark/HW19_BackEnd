package com.mamalimomen.services.impl;

import com.mamalimomen.base.services.BaseServiceImpl;
import com.mamalimomen.domains.Prescription;
import com.mamalimomen.repositories.PrescriptionRepository;
import com.mamalimomen.services.PrescriptionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;
import java.util.UUID;

@Service
public class PrescriptionServiceImpl extends BaseServiceImpl<Prescription, Long, PrescriptionRepository> implements PrescriptionService {

    public PrescriptionServiceImpl(@Autowired PrescriptionRepository repository) {
        super(repository);
    }

    @Override
    public String createNewPrescription(Prescription prescription) {
        Optional<Prescription> oPrescription = saveOrUpdateOne(prescription);

        if (oPrescription.isPresent()) {
            return "This prescription was created successfully!";
        } else {
            return "Could not save prescription cause some constraints!";
        }
    }

    @Override
    public String deleteExistPrescription(Prescription prescription) {
        deleteOneById(prescription.getId());

        return "This prescription was deleted successfully!";
    }
}
