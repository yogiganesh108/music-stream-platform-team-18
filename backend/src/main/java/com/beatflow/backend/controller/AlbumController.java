package com.beatflow.backend.controller;

import com.beatflow.backend.model.Album;
import com.beatflow.backend.repository.AlbumRepository;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api/albums")
@CrossOrigin(origins = "*")
public class AlbumController {
    private final AlbumRepository albumRepository;
    public AlbumController(AlbumRepository albumRepository) { this.albumRepository = albumRepository; }

    @GetMapping
    public List<Album> getAllAlbums() {
        return albumRepository.findAll();
    }
}
