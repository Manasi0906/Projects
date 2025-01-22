package com.farmfresh1.Fruit;

import java.util.HashMap;
import java.util.Map;

public class DataService1 {
    private static Map<String, Map<String, Map<String, Object>>> database = new HashMap<>();

    public void addData(String collectionName, String documentName, Map<String, Object> data) {
        if (!database.containsKey(collectionName)) {
            database.put(collectionName, new HashMap<>());
        }
        database.get(collectionName).put(documentName, data);
    }

    public Map<String, Object> getData(String collectionName, String documentName) {
        if (database.containsKey(collectionName)) {
            return database.get(collectionName).get(documentName);
        }
        return null;
    }

    public static String uploadImage(String path, String name) {
        // Mock implementation for image upload
        // In real scenario, this method should upload the image to a server or cloud storage
        // and return the URL of the uploaded image
        return "file:" + path;
    }
}
