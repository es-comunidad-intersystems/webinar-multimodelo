package com.webinar.persistence;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
public class Actor extends Persona {

    @ManyToMany(mappedBy = "actores")
    @JsonBackReference
    private Set<Pelicula> peliculas = new HashSet<Pelicula>();

    public Actor() {
    }

}