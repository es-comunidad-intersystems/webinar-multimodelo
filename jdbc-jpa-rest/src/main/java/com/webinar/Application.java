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
import com.webinar.repository.ActorRepository;
import com.webinar.repository.DirectorRepository;
import com.webinar.repository.PeliculaRepository;

@SpringBootApplication
public class Application implements CommandLineRunner {

    @Autowired
    PeliculaRepository peliculaRepository;
    @Autowired
    ActorRepository actorRepository;
    @Autowired
    DirectorRepository directorRepository;

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }

    @Override
    public void run(String... args) throws Exception {

        try {
            if (peliculaRepository.findById(Long.valueOf(1)).isPresent()) {
                System.out.println("La base de datos ya existe");
            } else {
                Set<Actor> actoresCadenaPerpetua = new HashSet<>();
                Set<Actor> actoresPadrino = new HashSet<>();
                Set<Actor> actoresPadrino2 = new HashSet<>();

                Actor actor1 = new Actor();
                actor1.setApellido1("Robins");
                actor1.setNombre("Tim");
                actor1.setFechaNacimiento(LocalDate.of(1958, 10, 16));
                actorRepository.save(actor1);
                actoresCadenaPerpetua.add(actor1);

                Actor actor2 = new Actor();
                actor2.setApellido1("Freeman");
                actor2.setNombre("Morgan");
                actor2.setFechaNacimiento(LocalDate.of(1937, 6, 1));
                actorRepository.save(actor2);
                actoresCadenaPerpetua.add(actor2);

                Actor actor3 = new Actor();
                actor3.setApellido1("Gunton");
                actor3.setNombre("Bob");
                actor3.setFechaNacimiento(LocalDate.of(1945, 11, 15));
                actorRepository.save(actor3);
                actoresCadenaPerpetua.add(actor3);

                Actor actor4 = new Actor();
                actor4.setApellido1("Brando");
                actor4.setNombre("Marlon");
                actor4.setFechaNacimiento(LocalDate.of(1924, 4, 3));
                actorRepository.save(actor4);
                actoresPadrino.add(actor4);

                Actor actor5 = new Actor();
                actor5.setApellido1("Pacino");
                actor5.setNombre("Al");
                actor5.setFechaNacimiento(LocalDate.of(1940, 4, 25));
                actorRepository.save(actor5);
                actoresPadrino.add(actor5);
                actoresPadrino2.add(actor5);

                Actor actor6 = new Actor();
                actor6.setApellido1("Caan");
                actor6.setNombre("James");
                actor6.setFechaNacimiento(LocalDate.of(1940, 3, 26));
                actorRepository.save(actor6);
                actoresPadrino.add(actor6);

                Actor actor7 = new Actor();
                actor7.setApellido1("Duvall");
                actor7.setNombre("Robert");
                actor7.setFechaNacimiento(LocalDate.of(1931, 1, 5));
                actorRepository.save(actor7);
                actoresPadrino2.add(actor7);

                Actor actor8 = new Actor();
                actor8.setApellido1("Keaton");
                actor8.setNombre("Diane");
                actor8.setFechaNacimiento(LocalDate.of(1946, 1, 5));
                actorRepository.save(actor8);
                actoresPadrino2.add(actor8);

                Director director1 = new Director();
                director1.setApellido1("Darabont");
                director1.setNombre("Frank");
                director1.setFechaNacimiento(LocalDate.of(1959, 1, 28));
                directorRepository.save(director1);

                Director director2 = new Director();
                director2.setApellido1("Coppola");
                director2.setNombre("Francis Ford");
                director2.setFechaNacimiento(LocalDate.of(1939, 4, 7));
                directorRepository.save(director2);

                Pelicula pelicula1 = new Pelicula();
                pelicula1.setTitulo("Cadena perpetua");
                pelicula1.setFecha(LocalDate.of(1995, 2, 24));
                pelicula1.setActores(actoresCadenaPerpetua);
                pelicula1.setDirector(director1);
                peliculaRepository.save(pelicula1);

                Pelicula pelicula2 = new Pelicula();
                pelicula2.setTitulo("El Padrino");
                pelicula2.setFecha(LocalDate.of(1972, 3, 19));
                pelicula2.setActores(actoresPadrino);
                pelicula2.setDirector(director2);
                peliculaRepository.save(pelicula2);

                Pelicula pelicula3 = new Pelicula();
                pelicula3.setTitulo("El Padrino II");
                pelicula3.setFecha(LocalDate.of(1974, 12, 20));
                pelicula3.setActores(actoresPadrino2);
                pelicula3.setDirector(director2);
                peliculaRepository.save(pelicula3);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}