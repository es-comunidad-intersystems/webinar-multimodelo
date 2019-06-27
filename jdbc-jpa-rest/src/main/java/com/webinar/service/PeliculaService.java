package com.webinar.service;

import java.util.List;

import com.webinar.persistence.Pelicula;

public interface PeliculaService {

    List<Pelicula> recuperaPeliculas();
}