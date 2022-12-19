package com.example.Project.controllers;

import com.example.Project.models.Document;
import com.example.Project.repo.DocumentRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.io.ByteArrayInputStream;

@RestController
@RequiredArgsConstructor
public class DocumentController {
    private final DocumentRepository documentRepository;
    private ResponseEntity<?> getDocumentById(@PathVariable Long id){
        Document document = documentRepository.findById(id).orElse(null);
        return ResponseEntity.ok()
                .header("fileName", document.getOriginalFileName())
                .contentType(MediaType.valueOf(document.getContentType()))
                .contentLength(document.getSize())
                .body(new InputStreamResource(new ByteArrayInputStream(document.getBytes())));
    }
}
