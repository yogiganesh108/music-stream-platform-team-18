package com.beatflow.backend.service;

import com.beatflow.backend.model.Playlist;
import com.beatflow.backend.repository.PlaylistRepository;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class PlaylistService {

    private final PlaylistRepository playlistRepository;

    public PlaylistService(PlaylistRepository playlistRepository) {
        this.playlistRepository = playlistRepository;
    }

    public List<Playlist> findAllPlaylists() {
        return playlistRepository.findAll();
    }
}