package com.mamalimomen.controllers;

import com.mamalimomen.base.utilities.InValidDataException;
import com.mamalimomen.domains.Medicine;
import com.mamalimomen.domains.Patient;
import com.mamalimomen.domains.Prescription;
import com.mamalimomen.services.impl.MedicineServiceImpl;
import com.mamalimomen.services.impl.PatientServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.time.LocalDate;
import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Controller
@RequestMapping("/patient")
public class PatientController {

    private final PatientServiceImpl service;
    private final MedicineServiceImpl medicineService;
    private final ApplicationContext context;

    public PatientController(
            @Autowired PatientServiceImpl patientService,
            @Autowired ApplicationContext context,
            @Autowired MedicineServiceImpl medicineService) {
        this.service = patientService;
        this.medicineService = medicineService;
        this.context = context;
    }

    @GetMapping(value = "/add")
    public ModelAndView createPatient() {
        Map<String, Object> map = new HashMap<>();
        map.put("patient", context.getBean("patient"));
        map.put("prescription", context.getBean("prescription"));
        map.put("medicines", medicineService.findAll());

        return new ModelAndView("patient_create", map);
    }

    @PostMapping(value = "/create")
    public ModelAndView createPatient(@ModelAttribute(name = "patient") Patient patient
            , @RequestParam(name = "code"/*, required = true, defaultValue = ""*/) String code
            , @RequestParam(name = "emissionDate"/*, required = true, defaultValue = ""*/) String emissionDate
            , @RequestParam(name = "patientReferralDate"/*, required = true, defaultValue = ""*/) String patientReferralDate
            , @RequestParam(name = "medicines") String medicines) {
        String message;
        try {
            Prescription prescription = context.getBean("prescription", Prescription.class);
            prescription.setCode(Long.valueOf(code));
            if (!emissionDate.isEmpty()) {
                prescription.setEmissionDate(LocalDate.parse(emissionDate));
            }
            if (!patientReferralDate.isEmpty()) {
                prescription.setPatientReferralDate(LocalDate.parse(patientReferralDate));
            }
            prescription.setMedicines(medicineMultiSelectParser(medicines));
            patient.addPrescription(prescription);
            message = service.createNewPatient(patient);
        } catch (InValidDataException e) {
            message = e.getMessage();
        }
        Map<String, Object> map = new HashMap<>();
        map.put("message", message);
        map.put("patient", context.getBean("patient"));
        map.put("prescriptions", context.getBean("prescription"));
        map.put("medicines", medicineService.findAll());
        return new ModelAndView("patient_create", map);
    }

    @GetMapping(value = "see")
    public String seePatients(Model model) {
        model.addAttribute("patients", service.findAll());
        return "patients_see";
    }

    @GetMapping(value = "details")
    public String patientDetails(@RequestParam(value = "id") final String id, Model model) {

        Optional<Patient> oPatient = service.findOneById(Long.valueOf(id));

        if (oPatient.isPresent()) {
            model.addAttribute("existPatient", oPatient.get());
            return "patient_details";
        } else {
            model.addAttribute("patients", service.findAll());
            model.addAttribute("message", "There is not any Patient with this id!");
            return "patients_see";
        }
    }

    @GetMapping("/modify")
    public String modifyPatient(@RequestParam(value = "id") final String id, Model model) {

        Optional<Patient> oPatient = service.findOneById(Long.valueOf(id));

        if (oPatient.isPresent()) {
            model.addAttribute("existPatient", oPatient.get());
            model.addAttribute("newPatient", context.getBean("patient"));
            model.addAttribute("medicines", medicineService.findAll());

            return "patient_modify";
        } else {
            model.addAttribute("message", "There is not any Patient with this id!");
            model.addAttribute("patients", service.findAll());

            return "patients_see";
        }
    }

    @PostMapping(value = "/modify")
    public String modifyPatient(@ModelAttribute(name = "newPatient") Patient patient
            , @RequestParam(name = "code") String code
            , @RequestParam(name = "emissionDate") String emissionDate
            , @RequestParam(name = "patientReferralDate") String patientReferralDate
            , @RequestParam(name = "medicines") String medicines
            , Model model) {
        String message = "";

        try {
            Patient existPatient = service.findOneById(patient.getId()).get();
            existPatient.setFirstName(patient.getFirstName());
            existPatient.setLastName(patient.getLastName());
            existPatient.setGender(patient.getGender());

            if (!code.isEmpty() && !medicines.isEmpty()) {

                Prescription prescription = context.getBean("prescription", Prescription.class);
                prescription.setCode(Long.valueOf(code));
                if (!emissionDate.isEmpty()) {
                    prescription.setEmissionDate(LocalDate.parse(emissionDate));
                }
                if (!patientReferralDate.isEmpty()) {
                    prescription.setPatientReferralDate(LocalDate.parse(patientReferralDate));
                }
                prescription.setMedicines(medicineMultiSelectParser(medicines));

                existPatient.addPrescription(prescription);
            }
            message += " \n" + service.updatePatient(existPatient);
        } catch (InValidDataException e) {
            message = e.getMessage();
        }

        model.addAttribute("patients", service.findAll());
        model.addAttribute("message", message);
        return "patients_see";
    }

    @GetMapping(value = "/delete")
    public String deletePatient(@RequestParam(value = "id") final String id, Model model) {

        Optional<Patient> oPatient = service.findOneById(Long.valueOf(id));

        if (oPatient.isPresent()) {
            String message = service.deleteExistPatient(oPatient.get());
            model.addAttribute("message", message);
        } else {
            model.addAttribute("message", "There is not any Patient with this id!");
        }
        model.addAttribute("patients", service.findAll());
        return "patients_see";
    }

    @GetMapping(value = "/delete_prescription")
    public String deletePatient(@RequestParam(value = "patient_id") final String patientID
            , @RequestParam(value = "prescription_id") final String prescriptionID
            , Model model) {

        Optional<Patient> oPatient = service.findOneById(Long.valueOf(patientID));

        if (oPatient.isPresent()) {
            Patient patient = oPatient.get();
            patient.setPrescriptions(patient
                    .getPrescriptions()
                    .stream()
                    .filter(prescription -> !prescription
                            .getId()
                            .equals(Long.valueOf(prescriptionID)))
                    .collect(Collectors.toSet()));
            String message = service.updatePatient(patient);
            model.addAttribute("message", message);
            model.addAttribute("existPatient", patient);
            return "patient_details";
        } else {
            model.addAttribute("message", "There is not any Patient with this id!");
            model.addAttribute("patients", service.findAll());
            return "patients_see";
        }
    }

    private Set<Medicine> medicineMultiSelectParser(String medicines) {
        String[] medicinesID = medicines.split(",");
        return Stream
                .of(medicinesID)
                .map(Long::valueOf)
                .map(medicineService::findOneById)
                .filter(Optional::isPresent)
                .map(Optional::get)
                .collect(Collectors.toSet());
    }
}
