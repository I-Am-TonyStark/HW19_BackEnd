package com.mamalimomen.domains;

import com.mamalimomen.base.domains.BaseEntity;
import com.mamalimomen.base.utilities.InValidDataException;
import com.mamalimomen.base.utilities.Regex;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Component("patient")
@Scope("prototype")
@Entity
@Table(name = "tbl_patient")
public class Patient extends BaseEntity {

    @Column(nullable = false)
    private String firstName;

    @Column
    private String lastName;

    @Column(nullable = false)
    @Enumerated(value = EnumType.STRING)
    private Gender gender;

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, orphanRemoval = true)
    @JoinColumn(name = "fk_patient", nullable = false)
    private Set<Prescription> prescriptions = new HashSet<>();

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) throws InValidDataException {
        if (firstName == null || !Regex.matches(Regex.personName, firstName)) {
            throw new InValidDataException("FirstName");
        }
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) throws InValidDataException {
        if (lastName == null || !Regex.matches(Regex.personName, lastName)) {
            throw new InValidDataException("LastName");
        }
        this.lastName = lastName;
    }

    public Gender getGender() {
        return gender;
    }

    public void setGender(Gender gender) {
        this.gender = gender;
    }

    public Set<Prescription> getPrescriptions() {
        return prescriptions;
    }

    public void setPrescriptions(Set<Prescription> prescriptions) {
        this.prescriptions = prescriptions;
    }

    public void addPrescription(Prescription prescription) {
        this.getPrescriptions().add(prescription);
    }
}
