package com.farmfresh1.Fruit;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Map;
import java.util.concurrent.ExecutionException;

import com.google.cloud.storage.Acl;
import com.google.cloud.storage.BlobId;
import com.google.cloud.storage.BlobInfo;
import com.google.cloud.storage.Storage;
import com.google.cloud.storage.StorageOptions;


import java.io.FileInputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.HashMap;

import com.farmfresh1.Fruits.ProductProfile;
import com.farmfresh1.model.Custormer;
import com.farmfresh1.model.Seller;
import com.farmfresh1.model.SellerProfile;
import com.google.api.core.ApiFuture;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.cloud.firestore.DocumentReference;
import com.google.cloud.firestore.DocumentSnapshot;
import com.google.cloud.firestore.Firestore;
import com.google.cloud.firestore.FirestoreOptions;
import com.google.cloud.firestore.WriteResult;
import com.google.firebase.cloud.FirestoreClient;

import javafx.application.Application;
import javafx.collections.ObservableList;

import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;

public class DataService {
    private static Firestore db;
    static{
        try{
            intializeFirebase();
        }catch(IOException e){
            e.printStackTrace();
        }
    }
    public static  void intializeFirebase() throws IOException{
        FileInputStream serviceAccount=new FileInputStream("imagedemofarmfresh\\src\\main\\resources\\farmfreshpro-d9129-firebase-adminsdk-vvti0-f2567d6870.json");
        @SuppressWarnings("deprecation")
        FirebaseOptions options=new FirebaseOptions.Builder()
        .setCredentials(GoogleCredentials.fromStream(serviceAccount))
        .build();
        FirebaseApp.initializeApp(options);
        db=FirestoreClient.getFirestore();

    }

    public void addData(String collection, String document,Map<String,Object>data ) throws ExecutionException, InterruptedException {
        System.out.println("Aat alas");
        DocumentReference docRef = db.collection(collection).document(document);
        ApiFuture<WriteResult> result = docRef.set(data);
        result.get();
    }

        


    public Custormer getData(String collection, String document) throws ExecutionException, InterruptedException {
        try {
            System.out.println("Fetching document from collection: " + collection + ", document ID: " + document);
            DocumentReference docRef = db.collection(collection).document(document);
            ApiFuture<DocumentSnapshot> future = docRef.get();
            DocumentSnapshot documentSnapshot = future.get();
    
            System.out.println("DocumentSnapshot received: " + documentSnapshot);
    
            if (documentSnapshot.exists()) {
                String Email_id  = documentSnapshot.getString("Email_Id");
                System.out.println(":::::::::::::::::"+Email_id);
                System.out.println("Document exists, extracting data...");
                Custormer customer = new Custormer();
                customer.setAddress(documentSnapshot.getString("Address"));
                System.out.println(documentSnapshot.getString("Address"));
                customer.setCity(documentSnapshot.getString("City"));
                customer.setContact_no(documentSnapshot.getString("Contact_no"));
                // customer.setEmail_id((String)documentSnapshot.getString("Email_id"));
                customer.setEmail_id(Email_id);

                customer.setFullname(documentSnapshot.getString("FullName"));
                customer.setPassword(documentSnapshot.getString("Password"));
                customer.setState(documentSnapshot.getString("State"));
                System.out.println("Customer data extracted successfully.");
                return customer;
            } else {
                System.out.println("Document does not exist!");
                return null;
            }
        } catch (Exception e) {
            System.out.println("An error occurred while fetching the document:");
            e.printStackTrace();
            throw e;
        }
    }

    public Seller getSellerData(String collection, String document) throws ExecutionException, InterruptedException {
        try {
            System.out.println("Fetching document from collection: " + collection + ", document ID: " + document);
            DocumentReference docRef = db.collection(collection).document(document);
            ApiFuture<DocumentSnapshot> future = docRef.get();
            DocumentSnapshot documentSnapshot = future.get();
    
            System.out.println("DocumentSnapshot received: " + documentSnapshot);
    
            if (documentSnapshot.exists()) {
                System.out.println("Document exists, extracting data...");
                Seller seller =new Seller();
                seller.setProductName(documentSnapshot.getString("Product Name"));
                seller.setCategory(documentSnapshot.getString("Category"));
                seller.setDescription(documentSnapshot.getString("Description"));
                seller.setVariety(documentSnapshot.getString("Variety"));
                seller.setQuantity(documentSnapshot.getString("Quantity"));
                seller.setPrice(documentSnapshot.getString("Price"));
                seller.setPackagingDetails(documentSnapshot.getString("Packaging Details"));
                seller.setHarvestDate(documentSnapshot.getString("Harvest Date"));
                seller.setExpiryDate(documentSnapshot.getString("Expiry Date"));
                System.out.println("Customer data extracted successfully.");
                return seller;
            } else {
                System.out.println("Document does not exist!");
                return null;
            }
        } catch (Exception e) {
            System.out.println("An error occurred while fetching the document:");
            e.printStackTrace();
            throw e;
        }
    }
    
    public SellerProfile getSellerProData(String collection, String document) throws ExecutionException, InterruptedException {
        try {
            System.out.println("Fetching document from collection: " + collection + ", document ID: " + document);
            DocumentReference docRef = db.collection(collection).document(document);
            ApiFuture<DocumentSnapshot> future = docRef.get();
            DocumentSnapshot documentSnapshot = future.get();
    
            System.out.println("DocumentSnapshot received: " + documentSnapshot);
    
            if (documentSnapshot.exists()) {
                SellerProfile sellerPro =new SellerProfile();
                System.out.println("Document exists, extracting data...");
                sellerPro.setBusinessName(documentSnapshot.getString("Bussiness Name"));
                sellerPro.setFullName(documentSnapshot.getString("FullName"));
                sellerPro.setMobile_no(documentSnapshot.getString("Mobile_no"));
                sellerPro.setEmail_Id(documentSnapshot.getString("Email_Id"));
                sellerPro.setProducts(documentSnapshot.getString("Products"));
                sellerPro.setState(documentSnapshot.getString("State"));
                sellerPro.setCity(documentSnapshot.getString("City"));
                sellerPro.setAddress(documentSnapshot.getString("Address"));
                sellerPro.setFarmDescription(documentSnapshot.getString("FarmDescription"));
                System.out.println("Seller data extracted successfully.");
                return sellerPro;
            } else {
                System.out.println("Document does not exist!");
                return null;
            }
        } catch (Exception e) {
            System.out.println("An error occurred while fetching the document:");
            e.printStackTrace();
            throw e;
        }
    }
    

        

        
    
        public boolean authenticateUser(String FullName, String Email_Id,String password,String Mobile_no,ObservableList<String> observableList,ObservableList<String> observableList2,String Address)throws ExecutionException,InterruptedException{
            DocumentSnapshot document=db.collection("Customer").document("vaishu@gmail.com").get().get();
            if(document.exists()){
                String storedPassword=document.getString("Password");
                return password.equals(storedPassword);

            }
            return false;
        }

        private static Map<String, Map<String, Map<String, Object>>> database = new HashMap<>();





        public static String nameimageUrl;





        // public static String imageUrl;

        
    
    
    
        // public static String uploadImageFile(String path, String name) {
        //     // Mock implementation for image upload
        //     // In real scenario, this method should upload the image to a server or cloud storage
        //     // and return the URL of the uploaded image
        //     return "file:" + path;
        // }

   






        private static final String BUCKET_NAME = "farmfreshpro-d9129.appspot.com"; // Ensure this is correct


        public static String uploadImage(String localFilePath,
        String uploadFileName) {
            try {
                FileInputStream serviceAccount = new FileInputStream("imagedemofarmfresh\\src\\main\\resources\\farmfreshpro-d9129-firebase-adminsdk-vvti0-f2567d6870.json");

                Storage storage = StorageOptions.newBuilder().setCredentials(GoogleCredentials.fromStream(serviceAccount))
                .build()
                .getService();
                Path path = Paths.get(localFilePath);
                byte[] bytes = Files.readAllBytes(path);

                BlobId blobId = BlobId.of(BUCKET_NAME,uploadFileName);
                BlobInfo blobInfo = BlobInfo.newBuilder(blobId).setContentType("image/jpeg").setAcl(Arrays.asList(Acl.of(Acl.User.ofAllUsers(),Acl.Role.READER))) // Make file publicly accessible
                .build();
                storage.create(blobInfo, bytes);
                System.out.println("https://storage.googleapis.com/" +BUCKET_NAME + "/" + uploadFileName);
                String imageUrl= "https://storage.googleapis.com/" +BUCKET_NAME + "/" + uploadFileName;
                System.out.println(imageUrl);
                nameimageUrl=imageUrl;
                return imageUrl;
                } catch (IOException e) {
                e.printStackTrace();
                return null;
            }
        }
    //     public static String getImageUrl(String documentPath) throws InterruptedException, ExecutionException {
       
    //     ApiFuture<DocumentSnapshot> future = db.document(documentPath).get();
    //     DocumentSnapshot document = future.get();

    //     if (document.exists()) {
    //         return document.getString("imageUrl"); // Assuming the field in Firestore is named "imageUrl"
    //     } else {
    //         System.out.println("No such document!");
    //         return null;
    //     }
    // }
    }

        
 
    