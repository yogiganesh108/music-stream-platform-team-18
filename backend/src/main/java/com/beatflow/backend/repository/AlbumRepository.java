package com.beatflow.backend.repository;
import java.util.List; 
import com.beatflow.backend.model.Album;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AlbumRepository extends JpaRepository<Album, Long> {
    // You can add custom query methods here in the future if needed.
	List<Album> findByTitleContainingIgnoreCase(String title);
}