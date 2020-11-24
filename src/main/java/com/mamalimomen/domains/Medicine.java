package com.mamalimomen.domains;

import com.mamalimomen.base.domains.BaseEntity;
import com.mamalimomen.base.utilities.InValidDataException;
import com.mamalimomen.base.utilities.Regex;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.math.BigDecimal;

@Component("medicine")
@Scope("prototype")
@Entity
@Table(name = "tbl_medicine")
public class Medicine extends BaseEntity {

    @Column(nullable = false)
    private String name;

    @Column(nullable = false, unique = true)
    private Long code;

    @Column(nullable = false, precision = 2, scale = 10, columnDefinition = "DECIMAL")
    private BigDecimal price;

    @Column(nullable = false, columnDefinition = "TEXT")
    private String description;

    public String getName() {
        return name;
    }

    public void setName(String name) throws InValidDataException {
        if (name == null || !Regex.matches(Regex.medicineName, name)) {
            throw new InValidDataException("Name");
        }
        this.name = name;
    }

    public Long getCode() {
        return code;
    }

    public void setCode(Long code) throws InValidDataException {
        if (code == null || code <= 0) {
            throw new InValidDataException("Code");
        }
        this.code = code;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) throws InValidDataException {
        if (price == null || price.doubleValue() <= 0.0) {
            throw new InValidDataException("Price");
        }
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) throws InValidDataException {
        if (description == null || !Regex.matches(Regex.description, description)) {
            throw new InValidDataException("Description");
        }
        this.description = description;
    }
}
