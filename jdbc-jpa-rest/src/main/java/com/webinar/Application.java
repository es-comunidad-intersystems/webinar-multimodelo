package com.webinar;

import java.time.LocalDate;
import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.webinar.persistence.Actor;
import com.webinar.persistence.Director;
import com.webinar.persistence.Pelicula;
import com.webinar.repository.PeliculaRepository;

@SpringBootApplication
public class Application implements CommandLineRunner {

    @Autowired
    PeliculaRepository peliculaRepository;

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }

    @Override
    public void run(String... args) throws Exception {

        try {
            if (peliculaRepository.findById(Long.valueOf(1)).isPresent()) {
                System.out.println("La base de datos ya existe");
            } else {
                Set<Actor> actores = new HashSet<>();
                System.out.println("actor 1");
                Actor actor1 = new Actor();
                actor1.setApellido1("Robins");
                actor1.setNombre("Tim");
                actor1.setFechaNacimiento(LocalDate.of(1958, 10, 16));
                actores.add(actor1);
                System.out.println("actor 2");
                Actor actor2 = new Actor();
                actor2.setApellido1("Freeman");
                actor2.setNombre("Morgan");
                actor2.setFechaNacimiento(LocalDate.of(1937, 6, 1));
                actores.add(actor2);
                System.out.println("actor 3");
                Actor actor3 = new Actor();
                actor3.setApellido1("Gunton");
                actor3.setNombre("Bob");
                actor3.setFechaNacimiento(LocalDate.of(1945, 11, 15));
                actores.add(actor3);
                System.out.println("director 1");
                Director director1 = new Director();
                director1.setApellido1("Darabont");
                director1.setNombre("Frank");
                director1.setFechaNacimiento(LocalDate.of(1959, 1, 28));
                System.out.println("pelicula 1");
                Pelicula pelicula1 = new Pelicula();
                pelicula1.setTitulo("Cadena perpetua");
                pelicula1.setFecha(LocalDate.of(1995, 2, 24));
                pelicula1.setActores(actores);
                pelicula1.setDirector(director1);

                peliculaRepository.save(pelicula1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}