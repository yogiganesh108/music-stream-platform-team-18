package com.beatflow.backend.controller;

import com.beatflow.backend.model.ArtistProfile;
import com.beatflow.backend.repository.ArtistProfileRepository;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api/artists")
@CrossOrigin(origins = "*")
public class ArtistProfileController {
    private final ArtistProfileRepository artistProfileRepository;
    public ArtistProfileController(ArtistProfileRepository artistProfileRepository) { this.artistProfileRepository = artistProfileRepository; }

    @GetMapping
    public List<ArtistProfile> getAllArtists() {
        return artistProfileRepository.findAll();
    }

    @GetMapping("/trending")
    public List<ArtistProfile> getTrendingArtists() {
        // For now, returns all artists. You can add trending logic later.
        return artistProfileRepository.findAll();
    }
}
