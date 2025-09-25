package com.beatflow.backend.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;
import java.util.List;

@Entity
@Table(name = "albums")
public class Album {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String title;

    @ManyToOne
    @JoinColumn(name = "artist_id", nullable = false)
    @JsonIgnoreProperties({"albums", "tracks"})
    private ArtistProfile artist;

    // ✅ ADD THIS FIELD to store the image URL
    private String coverUrl; 

    @OneToMany(mappedBy = "album", cascade = CascadeType.ALL)
    private List<Track> tracks;
    
    // --- Getters and Setters ---

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public ArtistProfile getArtist() { return artist; }
    public void setArtist(ArtistProfile artist) { this.artist = artist; }

    public List<Track> getTracks() { return tracks; }
    public void setTracks(List<Track> tracks) { this.tracks = tracks; }
    
    // ✅ ADD GETTER AND SETTER for the new field
    public String getCoverUrl() { return coverUrl; }
    public void setCoverUrl(String coverUrl) { this.coverUrl = coverUrl; }
}