package com.beatflow.backend.controller;

import com.beatflow.backend.model.Playlist;
import com.beatflow.backend.repository.PlaylistRepository;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api/playlists")
@CrossOrigin(origins = "*")
public class PlaylistController {
    private final PlaylistRepository playlistRepository;
    public PlaylistController(PlaylistRepository playlistRepository) { this.playlistRepository = playlistRepository; }

    @GetMapping
    public List<Playlist> getAllPlaylists() {
        return playlistRepository.findAll();
    }

    @GetMapping("/featured")
    public List<Playlist> getFeaturedPlaylists() {
        // For now, returns all playlists. You can add featured logic later.
        return playlistRepository.findAll();
    }
}
