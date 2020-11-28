package com.mamalimomen.services;

import com.mamalimomen.base.services.BaseService;
import com.mamalimomen.domains.Patient;

import java.util.UUID;

public interface PatientService extends BaseService<Patient, Long> {

    String updatePatient(Patient patient);

    String createNewPatient(Patient patient);

    String deleteExistPatient(Patient patient);
}
