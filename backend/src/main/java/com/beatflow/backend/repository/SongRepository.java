package com.beatflow.backend.repository;

import com.beatflow.backend.model.Song;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SongRepository extends JpaRepository<Song, Long> {
    // Spring Data JPA will automatically provide methods like findAll(), findById(), save(), etc.
    // You can add custom query methods here if needed in the future.
}