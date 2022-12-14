/*
 * Copyright 2002-2017 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.springframework.samples.petclinic.tanzu.customers.web;

import java.util.List;
import java.util.Optional;

import org.springframework.data.rest.webmvc.ResourceNotFoundException;
import org.springframework.http.HttpStatus;
import org.springframework.samples.petclinic.tanzu.customers.entity.Owner;
import org.springframework.samples.petclinic.tanzu.customers.entity.Pet;
import org.springframework.samples.petclinic.tanzu.customers.entity.PetType;
import org.springframework.samples.petclinic.tanzu.customers.repository.OwnerRepository;
import org.springframework.samples.petclinic.tanzu.customers.repository.PetRepository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

/**
 * @author Juergen Hoeller
 * @author Ken Krebs
 * @author Arjen Poutsma
 * @author Maciej Szarlinski
 */
@RestController
@RequiredArgsConstructor
@Slf4j
class PetResource {

  private final PetRepository petRepository;

  private final OwnerRepository ownerRepository;

  @GetMapping("/petTypes")
  public List<PetType> getPetTypes() {
    return petRepository.findPetTypes();
  }

  @PostMapping("/owners/{ownerId}/pets")
  @ResponseStatus(HttpStatus.CREATED)
  public Pet processCreationForm(
      @RequestBody PetRequest petRequest,
      @PathVariable("ownerId") int ownerId) {

    final Pet pet = new Pet();
    final Optional<Owner> optionalOwner = ownerRepository.findById(ownerId);
    Owner owner = optionalOwner.orElseThrow(() -> new ResourceNotFoundException("Owner " + ownerId + " not found"));
    owner.addPet(pet);

    return save(pet, petRequest);
  }

  @PutMapping("/owners/*/pets/{petId}")
  @ResponseStatus(HttpStatus.NO_CONTENT)
  public void processUpdateForm(@RequestBody PetRequest petRequest) {
    int petId = petRequest.getId();
    Pet pet = findPetById(petId);
    save(pet, petRequest);
  }

  private Pet save(final Pet pet, final PetRequest petRequest) {

    pet.setName(petRequest.getName());
    pet.setBirthDate(petRequest.getBirthDate());

    petRepository.findPetTypeById(petRequest.getTypeId())
        .ifPresent(pet::setType);

    log.info("Saving pet {}", pet);
    return petRepository.save(pet);
  }

  @GetMapping("owners/*/pets/{petId}")
  public PetDetails findPet(@PathVariable("petId") int petId) {
    return new PetDetails(findPetById(petId));
  }

  private Pet findPetById(int petId) {
    Optional<Pet> pet = petRepository.findById(petId);
    if (!pet.isPresent()) {
      throw new ResourceNotFoundException("Pet " + petId + " not found");
    }
    return pet.get();
  }

}
