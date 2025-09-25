package com.beatflow.backend.service;

import com.beatflow.backend.model.ArtistProfile;
import com.beatflow.backend.repository.ArtistProfileRepository;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class ArtistProfileService {

    private final ArtistProfileRepository artistProfileRepository;

    public ArtistProfileService(ArtistProfileRepository artistProfileRepository) {
        this.artistProfileRepository = artistProfileRepository;
    }

    public List<ArtistProfile> findAllArtists() {
        return artistProfileRepository.findAll();
    }
}