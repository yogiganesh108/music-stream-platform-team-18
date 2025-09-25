package com.beatflow.backend.model;

import jakarta.persistence.*;

@Entity
@Table(name = "follows", uniqueConstraints = { @UniqueConstraint(columnNames = {"follower_id", "following_id"}) })
public class Follow {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "follower_id", nullable = false)
    private User follower;

    @ManyToOne
    @JoinColumn(name = "following_id", nullable = false)
    private User following;
    
    // Getters and Setters
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public User getFollower() {
        return follower;
    }
    public void setFollower(User follower) {
        this.follower = follower;
    }
    public User getFollowing() {
        return following;
    }
    public void setFollowing(User following) {
        this.following = following;
    }
}