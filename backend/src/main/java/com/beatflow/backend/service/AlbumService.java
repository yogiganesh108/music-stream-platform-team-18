package com.beatflow.backend.service;

import com.beatflow.backend.model.Album;
import com.beatflow.backend.repository.AlbumRepository;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class AlbumService {

    private final AlbumRepository albumRepository;

    public AlbumService(AlbumRepository albumRepository) {
        this.albumRepository = albumRepository;
    }

    public List<Album> findAllAlbums() {
        return albumRepository.findAll();
    }
}