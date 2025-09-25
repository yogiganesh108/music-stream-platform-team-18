package com.beatflow.backend.service;

import com.beatflow.backend.model.ArtistProfile;
import com.beatflow.backend.model.Track;
import com.beatflow.backend.repository.ArtistProfileRepository;
import com.beatflow.backend.repository.TrackRepository;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import java.io.IOException;
import java.util.List;

@Service
public class TrackService {

    private final TrackRepository trackRepository;
    private final AzureBlobService azureBlobService;
    private final ArtistProfileRepository artistProfileRepository;

    public TrackService(TrackRepository trackRepository, AzureBlobService azureBlobService, ArtistProfileRepository artistProfileRepository) {
        this.trackRepository = trackRepository;
        this.azureBlobService = azureBlobService;
        this.artistProfileRepository = artistProfileRepository;
    }

    public Track uploadTrack(MultipartFile file, String title, Long artistId) throws IOException {
        // 1. Upload the file to Azure and get its public URL
        String fileUrl = azureBlobService.uploadFile(file);

        // 2. Find the artist who is uploading the track
        ArtistProfile artist = artistProfileRepository.findById(artistId)
                .orElseThrow(() -> new RuntimeException("Artist not found with id: " + artistId));

        // 3. Create a new Track entity with the metadata and the Azure URL
        Track track = new Track();
        track.setTitle(title);
        track.setFileUrl(fileUrl);
        track.setArtist(artist);
        // You could also link it to an album here if needed
        
        // 4. Save the track metadata to your MySQL database
        return trackRepository.save(track);
    }

    public List<Track> findAllTracks() {
        return trackRepository.findAll();
    }
}