package com.webinar.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

import com.webinar.persistence.Pelicula;;

@Repository
public interface PeliculaRepository extends JpaRepository<Pelicula, Long> {

    public List<Pelicula> findAll();

    @Query("select p from Pelicula p where id > 0")
    public List<Pelicula> recuperaTodas();
}