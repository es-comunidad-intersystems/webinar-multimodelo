package com.webinar.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.webinar.persistence.Actor;
import com.webinar.persistence.Pelicula;
import com.webinar.repository.ActorRepository;
import com.webinar.repository.PeliculaRepository;
import com.webinar.service.PeliculaService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service(value = "peliculaService")
public class PeliculaServiceImpl implements PeliculaService {

    @Autowired
    PeliculaRepository peliculaRepository;

    @Override
    public List<Pelicula> recuperaPeliculas() {
        List<Pelicula> peliculas = new ArrayList<Pelicula>();
        try {
            peliculas = peliculaRepository.findAll();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return peliculas;
    }
}