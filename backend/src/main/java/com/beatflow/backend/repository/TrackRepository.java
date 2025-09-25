package com.beatflow.backend.repository;

import com.beatflow.backend.model.Track;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface TrackRepository extends JpaRepository<Track, Long> {
    // ✅ ADD THIS METHOD to search for tracks by title
    List<Track> findByTitleContainingIgnoreCase(String title);
}