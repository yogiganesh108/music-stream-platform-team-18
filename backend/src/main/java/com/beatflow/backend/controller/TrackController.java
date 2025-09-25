package com.beatflow.backend.controller;

import com.beatflow.backend.model.Track;
import com.beatflow.backend.service.TrackService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import java.io.IOException;
import java.util.List;

@RestController
@RequestMapping("/api/tracks")
@CrossOrigin(origins = "*")
public class TrackController {

    private final TrackService trackService;

    public TrackController(TrackService trackService) {
        this.trackService = trackService;
    }

    @GetMapping
    public List<Track> getAllTracks() {
        return trackService.findAllTracks();
    }

    // This is the endpoint for uploading songs
    @PostMapping("/upload")
    public ResponseEntity<Track> uploadTrack(@RequestParam("file") MultipartFile file,
                                             @RequestParam("title") String title,
                                             @RequestParam("artistId") Long artistId) {
        try {
            Track savedTrack = trackService.uploadTrack(file, title, artistId);
            return ResponseEntity.status(HttpStatus.CREATED).body(savedTrack);
        } catch (IOException e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        } catch (RuntimeException e) {
            // Catches the "Artist not found" error
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
        }
    }
}
