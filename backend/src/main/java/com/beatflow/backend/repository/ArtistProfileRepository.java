package com.beatflow.backend.repository;
import java.util.List; 
import com.beatflow.backend.model.ArtistProfile;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ArtistProfileRepository extends JpaRepository<ArtistProfile, Long> {
    // JpaRepository provides all standard methods like findAll(), findById(), save(), etc.
	List<ArtistProfile> findByStageNameContainingIgnoreCase(String stageName);
}