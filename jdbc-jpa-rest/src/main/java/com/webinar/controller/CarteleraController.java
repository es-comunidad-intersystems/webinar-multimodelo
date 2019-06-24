package com.webinar.controller;

import java.util.List;

import com.webinar.persistence.Actor;
import com.webinar.persistence.Pelicula;
import com.webinar.service.ActorService;
import com.webinar.service.PeliculaService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@EnableAutoConfiguration
public class CarteleraController {

    @Autowired
    private PeliculaService peliculaService;
    @Autowired
    private ActorService actorService;

    @GetMapping("/peliculas")
    public List<Pelicula> muestraPeliculas() {

        return peliculaService.recuperaPeliculas();
    }

    @GetMapping("/actores")
    public List<Actor> muestraActores() {

        return actorService.recuperaActores();
    }

}
