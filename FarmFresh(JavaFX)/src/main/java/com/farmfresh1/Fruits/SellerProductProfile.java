package com.farmfresh1.Fruits;

import java.io.IOException;

import com.farmfresh1.Fruit.DataService;
import com.farmfresh1.model.Custormer;
import com.farmfresh1.model.Seller;
import com.image_blob.services.ImageUploader;

import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.ComboBox;
import javafx.scene.control.Label;
import javafx.scene.control.ScrollPane;
import javafx.scene.control.TextField;
import javafx.scene.effect.DropShadow;
import javafx.scene.image.Image;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.scene.paint.Color;
import javafx.scene.paint.ImagePattern;
import javafx.scene.shape.Circle;
import javafx.scene.text.Font;
import javafx.scene.text.FontWeight;
import javafx.stage.Stage;

public class SellerProductProfile {
      static DataService dataService = new DataService();
       static String str1;
       public static String productName;
       

       
     
   
    
    public static void startSellerProductProfile(Stage primaryStage) throws Exception {
        
        Label l1=new Label("FARM_FRESH");
        l1.setFont(new Font(50));
        l1.setAlignment(Pos.CENTER);
        l1.setTextFill(Color.BLACK);

        Image image=new Image("file:imagedemofarmfresh\\src\\main\\resources\\farmfresh logo.jpg");
        Circle cir1=new Circle(250,200,60);
        cir1.setFill(new ImagePattern(image));

        HBox hbox1=new HBox(cir1,l1);
        hbox1.setAlignment(Pos.CENTER);
       
    
       
       
        String str1=DataService.nameimageUrl;
        String localFilePath;
        String uploadFileName;
        VBox vb=new VBox();

       try {
           DataService dataService=new DataService();
                str1=DataService.nameimageUrl;
                //String imageUrl=DataService.uploadImage(localFilePath,uploadFileName);
            
            
            if (DataService.nameimageUrl != null) {
                Image image1 = new Image(DataService.nameimageUrl);
                Circle cir2 = new Circle(250, 200, 80);
                cir2.setStroke(Color.SEAGREEN);
                cir2.setFill(Color.SNOW);
                cir2.setEffect(new DropShadow(+25d, 0d, +2d, Color.DARKSEAGREEN));
                cir2.setFill(new ImagePattern(image1));
                vb.getChildren().add(cir2);
                vb.setAlignment(Pos.CENTER);

        
                
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        VBox vbox = new VBox();
        vbox.setSpacing(50);
        
    
 
    
        

        System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>"+productName);
        Seller seller= dataService.getSellerData("SellerProductInfo",productName); // Updated to remove the colon

        if (seller !=null) {
             GridPane grid1 = new GridPane();
            grid1.setVgap(30);
            grid1.setHgap(20);
            grid1.setAlignment(Pos.CENTER);
            grid1.setPadding(new Insets(50, 100, 50, 100));
            grid1.setStyle("-fx-background-color: rgba(240, 240, 240, 0.8); -fx-border-color: #cccccc; -fx-border-radius: 10; -fx-background-radius: 10;");

            Label lb1 = new Label("Product Name: ");
            Label lb11 = new Label(seller.getProductName());
            lb11.setMaxWidth(500);
            lb11.setFont(new Font(18));
            lb1.setFont(Font.font("abc", FontWeight.BOLD, 20));
            grid1.add(lb1, 0, 1);
            grid1.add(lb11, 1, 1);

            Label lb2=new Label();
            lb2.setText("Product Category:");
            Label lb12 = new Label(seller.getCategory());
            lb12.setMaxWidth(500);
            lb12.setFont(new Font(18));
            lb2.setFont(Font.font("abc", FontWeight.BOLD, 20));
            grid1.add(lb2, 0, 2);
            grid1.add(lb12, 1, 2);

            Label lb3=new Label();
            lb3.setText("Product Description:");
            Label lb13 = new Label(seller.getDescription());
            lb13.setMaxWidth(500);
            lb13.setFont(new Font(18));
            lb3.setFont(Font.font("abc", FontWeight.BOLD, 20));
            grid1.add(lb3, 0, 3);
            grid1.add(lb13, 1, 3);


            Label lb4=new Label("Variet of Product:");
            Label lb14 = new Label(seller.getVariety());
            lb14.setMaxWidth(500);
            lb14.setFont(new Font(18));
            lb4.setFont(Font.font("abc", FontWeight.BOLD, 20));
            grid1.add(lb4, 0, 4);
            grid1.add(lb14, 1, 4);

            Label lb5=new Label("Product Quantity:");
            Label lb15 = new Label(seller.getQuantity());
            lb15.setMaxWidth(500);
            lb15.setFont(new Font(18));
            lb5.setFont(Font.font("abc", FontWeight.BOLD, 20));
            grid1.add(lb5, 0, 5);
            grid1.add(lb15, 1, 5);

            Label lb6=new Label("Product Price:");
            Label lb16 = new Label(seller.getPrice());
            lb16.setMaxWidth(500);
            lb16.setFont(new Font(18));
            lb6.setFont(Font.font("abc", FontWeight.BOLD, 20));
            grid1.add(lb6, 0, 6);
            grid1.add(lb16, 1, 6);
            

            Label lb7=new Label("Packaging Details:");
            Label lb17 = new Label(seller.getPackagingDetails());
            lb17.setMaxWidth(500);
            lb17.setFont(new Font(18));
            lb7.setFont(Font.font("abc", FontWeight.BOLD, 20));
            grid1.add(lb7, 0, 7);
            grid1.add(lb17, 1, 7);

            Label lb8=new Label("Harvest Date:");
            Label lb18 = new Label(seller.getHarvestDate());
            lb18.setMaxWidth(500);
            lb18.setFont(new Font(18));
            lb8.setFont(Font.font("abc", FontWeight.BOLD, 20));
            grid1.add(lb8, 0, 8);
            grid1.add(lb18, 1, 8);


            Label lb9=new Label("Expiry Date:");
            Label lb19 = new Label(seller.getExpiryDate());
            lb19.setMaxWidth(500);
            lb19.setFont(new Font(18));
            lb9.setFont(Font.font("abc", FontWeight.BOLD, 20));
            grid1.add(lb9, 0, 9);
            grid1.add(lb19, 1, 9);

        

            //Label productNameLabel = new Label("Product Name: " + seller.getProductName());
            // Label categoryLabel = new Label("Product Category: " + seller.getCategory());
            // Label descriptionLabel = new Label("Product Description: " + seller.getDescription());
            // Label varietyLabel = new Label("Variety of Product : " + seller.getVariety());
            // Label quantityLabel = new Label("Product Quantity : " + seller.getQuantity());
            // Label priceLabel = new Label("Product Price : " + seller.getPrice());
            // Label packagingDetailsLabel = new Label("Packaging Details : " + seller.getPackagingDetails());
            // Label harvestDateLabel = new Label("Harvest Date : " + seller.getHarvestDate());
            // Label expiryDateLabel = new Label("Expiry Date :" + seller.getExpiryDate());
            

            Button button =new Button("Back");
            button.setPrefWidth(150);
            button.setFont(new Font(25));
            button.setStyle("-fx-background-color: rgba(144, 238, 144, 0.8); -fx-border-color: #cccccc; -fx-border-radius: 10; -fx-background-radius: 10;");
            button.setAlignment(Pos.CENTER);
            button.setOnAction(new EventHandler<ActionEvent>() {

                @Override
                public void handle(ActionEvent event) {
                    UploadPage.startUploadPage(primaryStage);
                }
                
            });
            

            Button button1 =new Button("Done");
            button1.setPrefWidth(150);
            button1.setFont(new Font(25));
            button1.setStyle("-fx-background-color: rgba(144, 238, 144, 0.8); -fx-border-color: #cccccc; -fx-border-radius: 10; -fx-background-radius: 10;");
            button1.setAlignment(Pos.CENTER);
            button1.setOnAction(new EventHandler<ActionEvent>() {

                @Override
                public void handle(ActionEvent event) {
                    HomePage.startHomePage(primaryStage);
                }
                
            });
           //vbox.getChildren().addAll(lb1,categoryLabel,descriptionLabel,varietyLabel,quantityLabel,priceLabel,packagingDetailsLabel,harvestDateLabel,expiryDateLabel,button);
           HBox vb2 = new HBox(400,button,button1);
           vb2.setAlignment(Pos.CENTER);
           


           vbox.getChildren().addAll(vb,grid1, vb2);
           vbox.setPadding(new Insets(20,350,20,350));
            vbox.setAlignment(Pos.CENTER);

           
        } else {
            Label noDocumentLabel = new Label("No such document!");
            vbox.getChildren().add(noDocumentLabel);
        }

        ScrollPane scroll = new ScrollPane(vbox);
        VBox vbScroll = new VBox(hbox1,scroll);
        vbScroll.setPadding(new Insets(10,200,10,200));;

        Scene scene = new Scene(vbScroll);
        primaryStage.setTitle("SellerProduct Profile");
        primaryStage.setScene(scene);
        primaryStage.show();
    }
    



    

    

}


