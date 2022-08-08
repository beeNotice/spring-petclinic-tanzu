package org.springframework.samples.petclinic.tanzu.customers;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.TestPropertySource;

@ActiveProfiles(profiles = "{test}")
@TestPropertySource(properties = "management.metrics.export.wavefront.enabled=false")
@SpringBootTest
public class SpringPetclinicCustomersApplicationTests {

  @Test
  void contextLoads() {
  }

}
