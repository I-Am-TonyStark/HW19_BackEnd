package com.mamalimomen.domains;

import com.mamalimomen.base.domains.BaseEntity;
import com.mamalimomen.base.utilities.InValidDataException;
import org.springframework.context.annotation.Scope;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.HashSet;
import java.util.Set;
import java.util.stream.Collectors;

@Component("prescription")
@Scope("prototype")
@Entity
@Table(name = "tbl_prescription")
public class Prescription extends BaseEntity {

    @Column(nullable = false, unique = true)
    private Long code;

    //@Temporal(TemporalType.DATE)
    //@DateTimeFormat(pattern = "dd.MM.yyy")
    @Column
    private LocalDate emissionDate;

    //@Temporal(TemporalType.DATE)
    //@DateTimeFormat(pattern = "dd.MM.yyy")
    @Column
    private LocalDate patientReferralDate;

    @ManyToMany(cascade = {CascadeType.PERSIST}, fetch = FetchType.EAGER)
    @JoinTable(name = "tbl_prescription_medicine"
            , joinColumns = @JoinColumn(name = "prescription_id")
            , inverseJoinColumns = @JoinColumn(name = "medicine_id"))
    private Set<Medicine> medicines = new HashSet<>();

    public Long getCode() {
        return code;
    }

    public void setCode(Long code) throws InValidDataException {
        if (code == null || code <= 0) {
            throw new InValidDataException("Code");
        }
        this.code = code;
    }

    public LocalDate getEmissionDate() {
        return emissionDate;
    }

    public void setEmissionDate(LocalDate emissionDate) throws InValidDataException {
        if (emissionDate.isBefore(LocalDate.now())) {
            throw new InValidDataException("EmissionDate");
        }
        this.emissionDate = emissionDate;
    }

    public LocalDate getPatientReferralDate() {
        return patientReferralDate;
    }

    public void setPatientReferralDate(LocalDate patientReferralDate) throws InValidDataException {
        if (patientReferralDate.isBefore(LocalDate.now())) {
            throw new InValidDataException("PatientReferralDate");
        }
        this.patientReferralDate = patientReferralDate;
    }

    public Set<Medicine> getMedicines() {
        return medicines;
    }

    public void setMedicines(Set<Medicine> medicines) {
        this.medicines = medicines;
    }

    public void addMedicines(Medicine medicine) {
        this.medicines.add(medicine);
    }

    public String printMedicines() {
        return getMedicines()
                .stream()
                .map(Medicine::getName)
                .collect(Collectors.joining(", \n"));
    }
}
