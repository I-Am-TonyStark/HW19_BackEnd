package com.mamalimomen.services;

import com.mamalimomen.base.services.BaseService;
import com.mamalimomen.domains.Prescription;

import java.util.UUID;

public interface PrescriptionService extends BaseService<Prescription, UUID> {

    String createNewPrescription(Prescription prescription);

    String deleteExistPrescription(Prescription prescription);
}
