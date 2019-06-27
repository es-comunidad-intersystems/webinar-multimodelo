package com.webinar.persistence;

import java.time.LocalDate;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name = "pelicula")
public class Pelicula {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private long id;

    @Column(name = "titulo")
    private String titulo;

    @Column(name = "fecha")
    private LocalDate fecha;

    @JoinTable(name = "actor_pelicula", joinColumns = @JoinColumn(name = "pelicula", referencedColumnName = "id"), inverseJoinColumns = @JoinColumn(name = "persona", nullable = false, referencedColumnName = "id"))
    @ManyToMany(cascade = CascadeType.DETACH, fetch = FetchType.EAGER)
    @JsonManagedReference
    private Set<Actor> actores = new HashSet<Actor>();

    @ManyToOne(cascade = CascadeType.DETACH, fetch = FetchType.EAGER)
    @JoinColumn(name = "director")
    @JsonManagedReference
    private Director director;

    public Pelicula() {
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public LocalDate getFecha() {
        return fecha;
    }

    public void setFecha(LocalDate fecha) {
        this.fecha = fecha;
    }

    public Set<Actor> getActores() {
        return actores;
    }

    public void setActores(Set<Actor> actores) {
        this.actores = actores;
    }

    public Director getDirector() {
        return director;
    }

    public void setDirector(Director director) {
        this.director = director;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }
}