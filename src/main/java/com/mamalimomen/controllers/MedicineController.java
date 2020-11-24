package com.mamalimomen.controllers;

import com.mamalimomen.base.utilities.InValidDataException;
import com.mamalimomen.domains.Medicine;
import com.mamalimomen.domains.Patient;
import com.mamalimomen.services.impl.MedicineServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Controller
@RequestMapping(value = "/medicine")
public class MedicineController {

    private final MedicineServiceImpl service;
    private final ApplicationContext context;

    @Autowired
    public MedicineController(MedicineServiceImpl service, ApplicationContext context) {
        this.service = service;
        this.context = context;
    }

    @GetMapping(value = "/create")
    public String createMedicine() {
        return "medicine_create";
    }

    @PostMapping(value = "/create")
    public String createMedicine(HttpServletRequest request, ModelMap modelMap) {
        Medicine medicine = context.getBean("medicine", Medicine.class);
        try {
            medicine.setName(request.getParameter("name"));
            medicine.setCode(Long.valueOf(request.getParameter("code")));
            medicine.setPrice(BigDecimal.valueOf(Double.parseDouble(request.getParameter("price"))));
            medicine.setDescription(request.getParameter("description"));
            String message = service.createNewMedicine(medicine);
            modelMap.addAttribute("message", message);
            return "medicine_create";
        } catch (InValidDataException e) {
            modelMap.addAttribute("message", e.getMessage());
            return "medicine_create";
        }
    }

    @GetMapping(value = "/see")
    public String seeMedicines(Model model) {
        List<Medicine> medicines = service.findAll();
        model.addAttribute("medicines", medicines);
        return "medicines_see";
    }

    @GetMapping("/modify")
    public String modifyMedicine(@RequestParam(value = "id") final String uuid, Model model) {

        Optional<Medicine> oMedicine = service.findOneById(UUID.fromString(uuid));

        if (oMedicine.isPresent()) {
            model.addAttribute("existMedicine", oMedicine.get());
            model.addAttribute("newMedicine", context.getBean("medicine"));

            return "medicine_modify";
        } else {
            model.addAttribute("message", "There is not any Medicine with this id!");
            return "medicines_see";
        }
    }

    @PostMapping(value = "/modify")
    public String modifyMedicine(@ModelAttribute(name = "medicine") Medicine medicine, @RequestParam(value = "id") final String uuid, Model model) {

        medicine.setUuid(UUID.fromString(uuid));
        String message = service.updateMedicine(medicine);

        model.addAttribute("medicines", service.findAll());
        model.addAttribute("message", message);
        return "medicines_see";
    }

    @RequestMapping(value = "/delete")
    public String deleteMedicine(@RequestParam(value = "id") final String uuid, Model model) {

        Optional<Medicine> oMedicine = service.findOneById(UUID.fromString(uuid));

        if (oMedicine.isPresent()) {
            String message = service.deleteExistMedicine(oMedicine.get());
            model.addAttribute("medicines", service.findAll());
            model.addAttribute("message", message);
        } else {
            model.addAttribute("message", "There is not any Patient with this id!");
        }
        return "medicines_see";
    }
}
