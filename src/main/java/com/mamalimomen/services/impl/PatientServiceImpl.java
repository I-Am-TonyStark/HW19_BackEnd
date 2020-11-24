package com.mamalimomen.services.impl;

import com.mamalimomen.base.services.BaseServiceImpl;
import com.mamalimomen.base.utilities.InValidDataException;
import com.mamalimomen.domains.Medicine;
import com.mamalimomen.domains.Patient;
import com.mamalimomen.repositories.PatientRepository;
import com.mamalimomen.services.PatientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;
import java.util.UUID;

@Service
public class PatientServiceImpl extends BaseServiceImpl<Patient, UUID, PatientRepository> implements PatientService {

    public PatientServiceImpl(@Autowired PatientRepository repository) {
        super(repository);
    }

    @Override
    public String updatePatient(Patient patient) {

        try {
            Optional<Patient> oPersistedPatient = repository.findById(patient.getUuid());

            if (oPersistedPatient.isPresent()) {
                final Patient persistedPatient = oPersistedPatient.get();

                persistedPatient.setFirstName(patient.getFirstName());

                persistedPatient.setLastName(patient.getLastName());

                persistedPatient.setGender(patient.getGender());

                persistedPatient.setPrescriptions(patient.getPrescriptions());

                saveOrUpdateOne(persistedPatient);
            }
        } catch (InValidDataException e) {
            return e.getMessage();
        }
        return "This patient was updated successfully!";
    }

    @Override
    public String createNewPatient(Patient patient) {
        saveOrUpdateOne(patient);

        return "This patient was created successfully!";
    }

    @Override
    public String deleteExistPatient(Patient patient) {
        deleteOneById(patient.getUuid());

        return "This patient was deleted successfully!";
    }
}
