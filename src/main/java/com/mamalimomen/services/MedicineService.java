package com.mamalimomen.services;

import com.mamalimomen.base.services.BaseService;
import com.mamalimomen.domains.Medicine;

import java.util.UUID;

public interface MedicineService extends BaseService<Medicine, Long> {

    String updateMedicine(Medicine medicine);

    String createNewMedicine(Medicine medicine);

    String deleteExistMedicine(Medicine medicine);
}
