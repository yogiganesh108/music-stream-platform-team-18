package com.beatflow.backend.service;

import com.azure.storage.blob.BlobClient;
import com.azure.storage.blob.BlobServiceClient;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import java.io.IOException;
import java.util.UUID;

@Service
public class AzureBlobService {

    private final BlobServiceClient blobServiceClient;

    @Value("${azure.storage.container-name}")
    private String containerName;

    public AzureBlobService(BlobServiceClient blobServiceClient) {
        this.blobServiceClient = blobServiceClient;
    }

    public String uploadFile(MultipartFile file) throws IOException {
        // Generate a unique filename to prevent overwrites
        String fileName = UUID.randomUUID().toString() + "-" + file.getOriginalFilename();

        // Get a reference to the blob
        BlobClient blobClient = blobServiceClient.getBlobContainerClient(containerName).getBlobClient(fileName);

        // Upload the file data
        blobClient.upload(file.getInputStream(), file.getSize(), true);

        // Return the public URL of the uploaded file
        return blobClient.getBlobUrl();
    }
}