package com.beatflow.backend.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;

@Entity
@Table(name = "tracks")
public class Track {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String title;

    @Column(nullable = false)
    private String fileUrl; // URL from Azure Blob Storage

    @ManyToOne
    @JoinColumn(name = "album_id")
    @JsonIgnoreProperties({"tracks", "artist"})
    private Album album;

    @ManyToOne
    @JoinColumn(name = "artist_id", nullable = false)
    @JsonIgnoreProperties({"tracks", "albums"})
    private ArtistProfile artist;
    
    // Getters and Setters
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public String getFileUrl() {
        return fileUrl;
    }
    public void setFileUrl(String fileUrl) {
        this.fileUrl = fileUrl;
    }
    public Album getAlbum() {
        return album;
    }
    public void setAlbum(Album album) {
        this.album = album;
    }
    public ArtistProfile getArtist() {
        return artist;
    }
    public void setArtist(ArtistProfile artist) {
        this.artist = artist;
    }
}