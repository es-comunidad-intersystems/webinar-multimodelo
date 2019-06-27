package com.webinar.persistence;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
public class Director extends Persona {

    @OneToMany(mappedBy = "director")
    @JsonBackReference
    private Set<Pelicula> peliculas = new HashSet<Pelicula>();

}