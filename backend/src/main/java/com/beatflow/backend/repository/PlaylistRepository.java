package com.beatflow.backend.repository;
import java.util.List; 
import com.beatflow.backend.model.Playlist;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PlaylistRepository extends JpaRepository<Playlist, Long> {
	List<Playlist> findByNameContainingIgnoreCase(String name);
}