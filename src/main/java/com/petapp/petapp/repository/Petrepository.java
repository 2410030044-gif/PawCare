package com.petapp.petapp.repository;
import org.springframework.data.jpa.repository.JpaRepository;
import com.petapp.petapp.model.Pet;
public interface Petrepository extends JpaRepository<Pet, Integer> {
}