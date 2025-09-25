package com.beatflow.backend.dto;

import com.beatflow.backend.model.Album;
import com.beatflow.backend.model.ArtistProfile;
import com.beatflow.backend.model.Playlist;
import com.beatflow.backend.model.Track;
import java.util.List;

public record SearchResultsDTO(
    List<Track> tracks,
    List<ArtistProfile> artists,
    List<Album> albums,
    List<Playlist> playlists
) {}