package com.beatflow.backend.controller;

import com.beatflow.backend.dto.SearchResultsDTO;
import com.beatflow.backend.repository.*;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/search")
@CrossOrigin(origins = "*")
public class SearchController {

    private final TrackRepository trackRepo;
    private final ArtistProfileRepository artistRepo;
    private final AlbumRepository albumRepo;
    private final PlaylistRepository playlistRepo;

    public SearchController(TrackRepository trackRepo, ArtistProfileRepository artistRepo, AlbumRepository albumRepo, PlaylistRepository playlistRepo) {
        this.trackRepo = trackRepo;
        this.artistRepo = artistRepo;
        this.albumRepo = albumRepo;
        this.playlistRepo = playlistRepo;
    }

    @GetMapping
    public SearchResultsDTO searchAll(@RequestParam("q") String query) {
        return new SearchResultsDTO(
            trackRepo.findByTitleContainingIgnoreCase(query),
            artistRepo.findByStageNameContainingIgnoreCase(query),
            albumRepo.findByTitleContainingIgnoreCase(query),
            playlistRepo.findByNameContainingIgnoreCase(query)
        );
    }
}
