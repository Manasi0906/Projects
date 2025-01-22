package com.farmfresh1.Fruits;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.Map;

import com.farmfresh1.Fruit.DataService;
import com.farmfresh1.model.Custormer;
import com.google.firebase.database.core.view.Event;

import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.ComboBox;
import javafx.scene.control.DatePicker;
import javafx.scene.control.Label;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.scene.paint.Color;
import javafx.scene.text.Font;
import javafx.scene.text.FontWeight;
import javafx.stage.FileChooser;
import javafx.stage.Screen;
import javafx.stage.Stage;

public class UploadPage {
    public static Scene scene;
    private static Map<String, Object> dataobj;
    public static String product;

    
    public static void startUploadPage (Stage primaryStage) {
        primaryStage.setWidth(1930);
        primaryStage.setHeight(1060);

        GridPane grid1 = new GridPane();
        grid1.setVgap(20);
        grid1.setHgap(20);
        grid1.setAlignment(Pos.CENTER);
        grid1.setPadding(new Insets(20, 50, 20, 100));
        grid1.setStyle(
                "-fx-background-color: rgba(240, 240, 240, 0.8); -fx-border-color: #cccccc; -fx-border-radius: 10; -fx-background-radius: 10;");

        Label lb1 = new Label("Product Name:");
        TextField txt1 = new TextField();
        txt1.setMaxWidth(500);
        lb1.setFont(Font.font("abc", FontWeight.BOLD, 20));
        grid1.add(lb1, 0, 1);
        grid1.add(txt1, 1, 1);

        Label lb2 = new Label("Category:");
        lb2.setFont(Font.font("abc", FontWeight.BOLD, 20));
        ComboBox<String> cb1 = new ComboBox<>();
        cb1.getItems().addAll("Vegetables", "Fruits", "Grains", "Pulses", "Milk", "Eggs");
        cb1.setMaxWidth(500);
        grid1.add(lb2, 0, 2);
        grid1.add(cb1, 1, 2);

        Label lb3 = new Label("Description:");
        TextArea tx3 = new TextArea();
        tx3.setMaxWidth(500);
        tx3.setMaxHeight(200);
        lb3.setFont(Font.font("abc", FontWeight.BOLD, 20));
        grid1.add(lb3, 0, 3);
        grid1.add(tx3, 1, 3);

        Label lb4 = new Label("Variety:");
        TextField tx4 = new TextField();
        tx4.setMaxWidth(500);
        lb4.setFont(Font.font("abc", FontWeight.BOLD, 20));
        grid1.add(lb4, 0, 4);
        grid1.add(tx4, 1, 4);

        Label lb5 = new Label("Quantity:");
        TextField tx5 = new TextField();
        tx5.setMaxSize(700, 50);
        lb5.setFont(Font.font("abc", FontWeight.BOLD, 20));
        grid1.add(lb5, 0, 5);
        grid1.add(tx5, 1, 5);
        Label lb6 = new Label("(include units of measurement)");
        grid1.add(lb6, 1, 6);

        Label lb7 = new Label("Price:");
        TextField tx7 = new TextField();
        tx7.setMaxSize(700, 50);
        lb7.setFont(Font.font("abc", FontWeight.BOLD, 20));
        grid1.add(lb7, 0, 7);
        grid1.add(tx7, 1, 7);
        Label lb8 = new Label("(e.g.: per kg, per litre, etc)");
        grid1.add(lb8, 1, 8);

        Label lb10 = new Label("Packaging Details:");
        TextArea tx10 = new TextArea();
        tx10.setMaxWidth(500);
        tx10.setPrefHeight(200);
        lb10.setFont(Font.font("abc", FontWeight.BOLD, 20));
        grid1.add(lb10, 0, 9);
        grid1.add(tx10, 1, 9);

        Label lb11 = new Label("Harvest/Production Date:");
        DatePicker date = new DatePicker();
        date.setValue(LocalDate.now());
        date.setMaxWidth(500);
        lb11.setFont(Font.font("abc", FontWeight.BOLD, 20));
        grid1.add(lb11, 0, 10);
        grid1.add(date, 1, 10);

        Label lb12 = new Label("Expiry Date:");
        DatePicker date2 = new DatePicker();
        date2.setValue(LocalDate.now());
        date2.setMaxWidth(500);
        lb12.setFont(Font.font("abc", FontWeight.BOLD, 20));
        grid1.add(lb12, 0, 11);
        grid1.add(date2, 1, 11);

        Label lb13 = new Label("Product photo:");
        lb13.setFont(Font.font("abc", FontWeight.BOLD, 20));
        grid1.add(lb13, 0, 12);

        ImageView imageView2 = new ImageView();
        imageView2.setFitWidth(400);
        imageView2.setPreserveRatio(true);

        Button button2 = new Button("Choose Image");
        FileChooser fileChooserbutton2 = new FileChooser();
        fileChooserbutton2.getExtensionFilters()
                .addAll(new FileChooser.ExtensionFilter("Image Files", "*.png", "*.jpg", "*.jpeg", "*.gif"));
        button2.setOnAction(e -> {
            File selectedFile = fileChooserbutton2.showOpenDialog(primaryStage);
            if (selectedFile != null) {
                String imageUrl=DataService.uploadImage(selectedFile.getPath(),selectedFile.getName());
               if(imageUrl !=null){
                System.out.println(imageUrl);
                Image image=new Image(imageUrl);
                imageView2.setImage(image);
               }
            }
        });

        VBox vbox2 = new VBox(button2, imageView2);
        vbox2.setSpacing(10);
        grid1.add(vbox2, 1, 12);

        Button subButton = new Button("Submit");
        subButton.setStyle(
                "-fx-background-color: rgba(144, 238, 144, 0.8); -fx-border-color: #cccccc; -fx-border-radius: 10; -fx-background-radius: 10;");
        subButton.setTextFill(Color.GREEN);
        subButton.setAlignment(Pos.CENTER);
        subButton.setMaxSize(200, 50);
        subButton.setFont(Font.font("abc", FontWeight.EXTRA_BOLD, 20));
                subButton.setOnAction(new EventHandler<ActionEvent>() {

                    @Override
                    public void handle(ActionEvent event) {
                        
                        SellerProductProfile.productName=txt1.getText();
                        System.out.println(SellerProductProfile.productName);
                        handleSignup(primaryStage, txt1.getText(), cb1.getValue(), tx3.getText(),
                    tx4.getText(), tx5.getText(), tx7.getText(), tx10.getText(), date.getValue().toString(),
                    date2.getValue().toString());
                    }
                
                    private void handleSignup(Stage primaryStage, String productName, String category, String description,
                            String variety, String quantity, String price, String packagingDetails, String harvestDate,
                            String expiryDate) {
                        DataService dataService;
                        try {
                            System.out.println("Hii");
                            dataService = new DataService();
                            Map<String, Object> data = new HashMap<>();
                            data.put("Product Name", productName);
                            data.put("Category", category);
                            data.put("Description", description);
                            data.put("Variety", variety);
                            data.put("Quantity", quantity);
                            data.put("Price", price);
                            data.put("Packaging Details", packagingDetails);
                            data.put("Harvest Date", harvestDate);
                            data.put("Expiry Date", expiryDate);
                            System.out.println("You are in try block");
                            dataService.addData("SellerProductInfo", productName, data);
                            dataobj = data;
                
                             Custormer custormer = new Custormer();
                            System.out.println("User registered successfully");
                            SellerProductProfile.startSellerProductProfile(primaryStage);
                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }
                    }

                    
                });

        Button button1=new Button("Back");
        button1.setStyle(
            "-fx-background-color: rgba(144, 238, 144, 0.8); -fx-border-color: #cccccc; -fx-border-radius: 10; -fx-background-radius: 10;");
            button1.setTextFill(Color.GREEN);
            button1.setAlignment(Pos.CENTER);
            button1.setMaxSize(200, 50);
            button1.setFont(Font.font("abc", FontWeight.EXTRA_BOLD, 20));
            
        button1.setOnAction(new EventHandler<ActionEvent>() {

            @Override
            public void handle(ActionEvent event) {
               try {
                HomePage.startHomePage(primaryStage);
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            }
            
        });

        HBox vb1 = new HBox(200,subButton,button1);
        vb1.setAlignment(Pos.CENTER);
        Label lbTitle1 = new Label("FARMFRESH");
        lbTitle1.setFont(Font.font("", FontWeight.EXTRA_BOLD, 50));
        HBox hb1 = new HBox(lbTitle1);
        hb1.setAlignment(Pos.TOP_CENTER);
        hb1.setStyle("-fx-background-color: rgb(144, 238, 144)");
        VBox vbScene1 = new VBox(30, hb1, grid1, vb1);
        vbScene1.setAlignment(Pos.CENTER);
        vbScene1.setPadding(new Insets(20, 300, 20, 300));

        scene = new Scene(vbScene1);

        primaryStage.setScene(scene);
        Screen screen = Screen.getPrimary();
        javafx.geometry.Rectangle2D bounds = screen.getVisualBounds();

        primaryStage.setX(bounds.getMinX());
        primaryStage.setY(bounds.getMinY());
        primaryStage.setWidth(bounds.getWidth());
        primaryStage.setHeight(bounds.getHeight());
        primaryStage.show();
    }
    

    
    

    
   
    
}
