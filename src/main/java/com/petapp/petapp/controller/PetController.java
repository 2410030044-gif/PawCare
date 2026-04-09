package com.petapp.petapp.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;
import com.petapp.petapp.model.Pet;
import com.petapp.petapp.repository.Petrepository;

@RestController
@CrossOrigin
public class PetController {

    private final Petrepository repo;

    public PetController(Petrepository repo) {
        this.repo = repo;
    }

    @PostMapping("/add")
    public Pet addPet(@RequestBody Pet pet) {
        return repo.save(pet);
    }

    @GetMapping("/pets")
    public List<Pet> getPets() {
        return repo.findAll();
    }

    @PutMapping("/pets/{id}/status")
    public ResponseEntity<Pet> updateStatus(@PathVariable int id, @RequestBody java.util.Map<String, String> body) {
        return repo.findById(id).map(pet -> {
            pet.setStatus(body.get("status"));
            return ResponseEntity.ok(repo.save(pet));
        }).orElse(ResponseEntity.notFound().build());
    }

    @DeleteMapping("/pets/{id}")
    public ResponseEntity<Void> deletePet(@PathVariable int id) {
        if (!repo.existsById(id)) return ResponseEntity.notFound().build();
        repo.deleteById(id);
        return ResponseEntity.ok().build();
    }
}
