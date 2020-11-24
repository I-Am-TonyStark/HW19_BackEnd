package com.mamalimomen.controllers;

import com.mamalimomen.base.utilities.InValidDataException;
import com.mamalimomen.domains.Patient;
import com.mamalimomen.domains.Prescription;
import com.mamalimomen.services.impl.PatientServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.time.LocalDate;
import java.util.*;

@Controller
@RequestMapping("/patient")
public class PatientController {

    private final PatientServiceImpl service;
    private final ApplicationContext context;

    public PatientController(@Autowired PatientServiceImpl patientService, @Autowired ApplicationContext context) {
        this.service = patientService;
        this.context = context;
    }

    @GetMapping(value = "/add")
    public ModelAndView createPatient() {
        Map<String, Object> map = new HashMap<>();
        map.put("patient", context.getBean("patient"));
        map.put("prescription", context.getBean("prescription"));

        return new ModelAndView("patient_create", map);
    }

    @PostMapping(value = "/create")
    public ModelAndView createPatient(@ModelAttribute(name = "patient") Patient patient
            , @RequestParam(name = "code"/*, required = true, defaultValue = ""*/) String code
            , @RequestParam(name = "emissionDate"/*, required = true, defaultValue = ""*/) String emissionDate
            , @RequestParam(name = "patientReferralDate"/*, required = true, defaultValue = ""*/) String patientReferralDate) {
        String message;
        try {
            Prescription prescription = context.getBean("prescription", Prescription.class);
            prescription.setCode(Long.valueOf(code));
            prescription.setEmissionDate(LocalDate.parse(emissionDate));
            prescription.setPatientReferralDate(LocalDate.parse(patientReferralDate));
            patient.addPrescription(prescription);
            message = service.createNewPatient(patient);
        } catch (InValidDataException e) {
            message = e.getMessage();
        }
        Map<String, Object> map = new HashMap<>();
        map.put("message", message);
        map.put("patient", context.getBean("patient"));
        map.put("prescriptions", context.getBean("prescription"));
        return new ModelAndView("patient_create", map);
    }

    @GetMapping(value = "see")
    public String seePatients(Model model) {
        model.addAttribute("patients", service.findAll());
        return "patients_see";
    }

    @GetMapping(value = "details")
    public String patientDetails(@RequestParam(value = "id") final String uuid, Model model) {

        Optional<Patient> oPatient = service.findOneById(UUID.fromString(uuid));

        if (oPatient.isPresent()) {
            model.addAttribute("existPatient", oPatient.get());
            return "patient_details";
        } else {
            model.addAttribute("message", "There is not any Patient with this id!");
            return "patients_see";
        }
    }

    @GetMapping("/modify")
    public String modifyPatient(@RequestParam(value = "id") final String uuid, Model model) {

        Optional<Patient> oPatient = service.findOneById(UUID.fromString(uuid));

        if (oPatient.isPresent()) {
            model.addAttribute("existPatient", oPatient.get());
            model.addAttribute("newPatient", context.getBean("patient"));

            return "patient_modify";
        } else {
            model.addAttribute("message", "There is not any Patient with this id!");
            return "patients_see";
        }
    }

    @PostMapping(value = "/modify")
    public String modifyPatient(@ModelAttribute(name = "patient") Patient patient, @RequestParam(value = "id") final String uuid, Model model) {

        patient.setUuid(UUID.fromString(uuid));
        String message = service.updatePatient(patient);

        model.addAttribute("patients", service.findAll());
        model.addAttribute("message", message);
        return "patients_see";
    }

    @GetMapping(value = "/delete")
    public String deletePatient(@RequestParam(value = "id") final String uuid, Model model) {

        Optional<Patient> oPatient = service.findOneById(UUID.fromString(uuid));

        if (oPatient.isPresent()) {
            String message = service.deleteExistPatient(oPatient.get());
            model.addAttribute("patients", service.findAll());
            model.addAttribute("message", message);
        } else {
            model.addAttribute("message", "There is not any Patient with this id!");
        }
        return "patients_see";
    }
}
