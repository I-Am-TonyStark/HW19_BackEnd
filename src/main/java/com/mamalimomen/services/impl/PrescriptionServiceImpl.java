package com.mamalimomen.services.impl;

import com.mamalimomen.base.services.BaseServiceImpl;
import com.mamalimomen.domains.Prescription;
import com.mamalimomen.repositories.PrescriptionRepository;
import com.mamalimomen.services.PrescriptionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
public class PrescriptionServiceImpl extends BaseServiceImpl<Prescription, UUID, PrescriptionRepository> implements PrescriptionService {

    public PrescriptionServiceImpl(@Autowired PrescriptionRepository repository) {
        super(repository);
    }

    @Override
    public String createNewPrescription(Prescription prescription) {
        saveOrUpdateOne(prescription);

        return "This prescription was created successfully!";
    }

    @Override
    public String deleteExistPrescription(Prescription prescription) {
        deleteOneById(prescription.getUuid());

        return "This prescription was deleted successfully!";
    }
}
