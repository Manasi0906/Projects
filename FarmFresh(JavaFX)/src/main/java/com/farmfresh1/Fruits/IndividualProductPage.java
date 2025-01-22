package com.farmfresh1.Fruits;

import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.event.Event;
import javafx.event.EventHandler;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.StackPane;
import javafx.scene.layout.VBox;
import javafx.scene.paint.Color;
import javafx.scene.text.Font;
import javafx.stage.Screen;
import javafx.stage.Stage;

public class IndividualProductPage {

    
    public static void startIndividualProductPage(Stage primaryStage) {
        primaryStage.setTitle("Product Page");

        // Product Title
        Label productTitle = new Label("Fresh Beans");
        productTitle.setStyle("-fx-font-size: 30px; -fx-font-weight: bold;");

        // Product Image
        ImageView productImage = new ImageView(new Image("file:imagedemofarmfresh\\src\\main\\resources\\Green-Beans valid.jpg"));
        productImage.setFitWidth(350);
        productImage.setFitHeight(350);
        productImage.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color:black; -fx-border-width: 2; -fx-padding: 10;");
        // VBox vbImage = new VBox(productTitle, productImage);
        // vbImage.setAlignment(Pos.);

        // Product Description
        Label productDescription = new Label("This is a detailed description of the product. It covers features, benefits, and specifications.\n Key selling points and unique aspects are highlighted here.");
        productDescription.setWrapText(true);
        productDescription.setFont(new Font(20));

        // Price
        Label price = new Label("Rs15 per kg");
        price.setStyle("-fx-font-size: 25px; -fx-text-fill: green;");

        // Add to Cart and Buy Now Buttons
        Button addToCartButton = new Button("Add to Cart");
        addToCartButton.setMaxWidth(150);
        addToCartButton.setFont(new Font(20));
        addToCartButton.setStyle("-fx-font-weight: bold");
        addToCartButton.setStyle("-fx-background-color: rgba(144, 238, 144, 0.8); -fx-border-color: #cccccc; -fx-border-radius: 10; -fx-background-radius: 10;");
        
        Button buyNowButton = new Button("Buy Now");
        buyNowButton.setMaxWidth(150);
        buyNowButton.setFont(new Font(20));
        buyNowButton.setStyle("-fx-font-weight: bold");
        buyNowButton.setStyle("-fx-background-color: rgba(144, 238, 144, 0.8); -fx-border-color: #cccccc; -fx-border-radius: 10; -fx-background-radius: 10;");
        buyNowButton.setOnMouseClicked(new EventHandler<Event>() {

            @Override
            public void handle(Event event) {
                OrderPage.startOrderPage(primaryStage);
            }
            
        });

        HBox hb = new HBox(300,addToCartButton,buyNowButton);
        hb.setAlignment(Pos.BOTTOM_CENTER);


        Label category = new Label("Category: Vegetables");
        category.setPrefWidth(200);
        category.setFont(new Font(20));


        // Availability Information
        Label availability = new Label("In Stock");
        availability.setStyle("-fx-text-fill: green;");
        availability.setFont(new Font(20));

        // Shipping and Return Information
        Label shippingInfo = new Label("Delivery in 3-5 business days.");
        shippingInfo.setFont(new Font(20));
        Label returnPolicy = new Label("5 day return policy on grains and pulses.");
        returnPolicy.setFont(new Font(20));

        // Call to Action
        Label callToAction = new Label("Hurry! Only a few left in stock.");
        callToAction.setFont(new Font(20));


        // Product Specifications
        Label specifications = new Label("Specifications: \n- Fresh \n Organic");
        specifications.setFont(new Font(20));

        // Related Products or Recommendations
        Label relatedProductsLabel = new Label("Related Products:");
        relatedProductsLabel.setFont(new Font(25));
        Image image1=new Image("file:imagedemofarmfresh\\src\\main\\resources\\Green-Beans valid.jpg");
            ImageView I1=new ImageView(image1);
            I1.setFitHeight(180);
            I1.setFitWidth(250);
            Label L1=new Label("Beans");
            L1.setFont(new Font(25));
            L1.setStyle("-fx-font-weight: bold");
            VBox vb1=new VBox(40,I1,L1);
            vb1.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color:black; -fx-border-width: 2; -fx-padding: 10;");
            


            Image image2=new Image("file:imagedemofarmfresh\\src\\main\\resources\\vange.jpeg");
            ImageView I2=new ImageView(image2);
            I2.setFitHeight(180);
            I2.setFitWidth(250);
            
            Label L2=new Label("Black Brinjal");
            L2.setFont(new Font(25));
            L2.setStyle("-fx-font-weight: bold");
            VBox vb2=new VBox(40,I2,L2);
            vb2.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color:black; -fx-border-width: 2; -fx-padding: 10;");
           
            Image image3=new Image("file:imagedemofarmfresh\\src\\main\\resources\\cabbage.jpeg");
            ImageView I3=new ImageView(image3);
            I3.setFitHeight(180);
            I3.setFitWidth(250);
            Label L3=new Label("Cabbage");
            L3.setFont(new Font(25));
            L3.setStyle("-fx-font-weight: bold");
            VBox vb3=new VBox(40,I3,L3);
            vb3.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color: black; -fx-border-width: 2; -fx-padding: 10;");
            

            Image image4=new Image("file:imagedemofarmfresh\\src\\main\\resources\\hara baingan.jpeg");
            ImageView I4=new ImageView(image4);
            I4.setFitHeight(180);
            I4.setFitWidth(250);
            Label L4=new Label("Green Brinjal");
            L4.setFont(new Font(25));
            L4.setStyle("-fx-font-weight: bold");
            VBox vb4=new VBox(40,I4,L4);
            vb4.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color:black; -fx-border-width: 2; -fx-padding: 10;");
            

            Image image5=new Image("file:imagedemofarmfresh\\src\\main\\resources\\green peas.jpeg");
            ImageView I5=new ImageView(image5);
            I5.setFitHeight(180);
            I5.setFitWidth(250);
            Label L5=new Label("Green Peas");
            L5.setFont(new Font(25));
            L5.setStyle("-fx-font-weight: bold");
            VBox vb5=new VBox(40,I5,L5);
            vb5.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color: black; -fx-border-width: 2; -fx-padding: 10;");
            
            HBox vbitems = new HBox(10,vb1,vb2,vb3,vb4,vb5);
            vbitems.setMaxWidth(900);
            //vbitems.setPadding(new Insets(0,250,0,250));
            ScrollPane scrollPane = new ScrollPane(vbitems);
            scrollPane.setPadding(new Insets(0));
            scrollPane.setMaxWidth(900);
    
            // Enabling horizontal scrolling and disabling vertical scrolling
            scrollPane.setHbarPolicy(ScrollPane.ScrollBarPolicy.ALWAYS);
            scrollPane.setVbarPolicy(ScrollPane.ScrollBarPolicy.NEVER);
    
        // Social Sharing Options
        Label socialShare = new Label("Share this product:");
        socialShare.setFont(new Font(25));
        HBox socialButtons = new HBox(10);
        Hyperlink fbShare = new Hyperlink("Facebook");
        fbShare.setFont(new Font(20));
        Hyperlink twitterShare = new Hyperlink("WhatsApp");
        twitterShare.setFont(new Font(20));
        socialButtons.getChildren().addAll(fbShare, twitterShare);

        // Sample seller data
        Label seller = new Label("John Doe\n+1-234-567-8901\njohndoe@example.com\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Sed at urna tortor.");
        seller.setFont(new Font(20));
        Hyperlink viewProfile = new Hyperlink("View Profile of Seller");
        viewProfile.setFont(new Font(22));
        

        // Customer Reviews and Ratings
        Label reviews = new Label("Customer Reviews:");
        reviews.setFont(new Font(25));
        TextField addReview = new TextField();
        addReview.setPromptText("Add Review");
        HBox reviewHBox = new HBox(30,reviews, addReview);
        ListView<String> reviewList = new ListView<>();
        reviewList.setPrefHeight(200);
        reviewList.getItems().addAll("Review 1", "Review 2", "Review 3");

        // Customer Photos and Videos
        Label customerPhotosLabel = new Label("Customer Photos:");
        customerPhotosLabel.setFont(new Font(25));
        ImageView productImage1 = new ImageView(new Image("file:imagedemofarmfresh\\src\\main\\resources\\placeholder.jpg"));
        ImageView productImage2 = new ImageView(new Image("file:imagedemofarmfresh\\src\\main\\resources\\placeholder.jpg"));
        ImageView productImage3 = new ImageView(new Image("file:imagedemofarmfresh\\src\\main\\resources\\placeholder.jpg"));
        ImageView productImage4 = new ImageView(new Image("file:imagedemofarmfresh\\src\\main\\resources\\placeholder.jpg"));
        productImage1.setFitWidth(150);
        productImage1.setFitHeight(150);
        productImage2.setFitWidth(150);
        productImage2.setFitHeight(150);
        productImage3.setFitWidth(150);
        productImage3.setFitHeight(150);
        productImage4.setFitWidth(150);
        productImage4.setFitHeight(150);
       
        HBox hb2 = new HBox(10,productImage1,productImage2,productImage3,productImage4);
        
        // Layout setup
        // GridPane gridPane = new GridPane();
        // gridPane.setPadding(new Insets(10));
        // gridPane.setHgap(10);
        // gridPane.setVgap(10);
        // gridPane.setAlignment(Pos.CENTER);
        // gridPane.setStyle("-fx-background-color:Transparent");

        // gridPane.add(productTitle, 1, 0);
        // gridPane.add(productImage, 1, 1);
        // gridPane.add(productDescription, 1, 3);
        // gridPane.add(price, 1, 2);
        // gridPane.add(hb, 1, 10);
        // gridPane.add(category, 1, 5);
        // gridPane.add(availability, 1, 6);
        // gridPane.add(shippingInfo, 1, 7);
        // gridPane.add(returnPolicy, 1, 8);
        // gridPane.add(specifications, 1, 9);
        // gridPane.add(seller, 1, 11);
        // gridPane.add(viewProfile, 1, 12);
        // gridPane.add(socialShare, 1, 13);
        // gridPane.add(socialButtons, 1, 14);
        // gridPane.add(customerPhotosLabel, 1, 15);
        // gridPane.add(hb2, 1, 16);
        // gridPane.add(callToAction, 1, 4);
        // gridPane.add(reviewHBox, 1, 17);
        // gridPane.add(reviewList, 1, 18);
        // gridPane.add(relatedProductsLabel, 1, 19);
       
        VBox image = new VBox(productTitle,productImage);
        image.setAlignment(Pos.CENTER);
        VBox vbprod = new VBox(productDescription,price,callToAction,category,availability,shippingInfo,returnPolicy,seller,viewProfile, socialShare,socialButtons,customerPhotosLabel);
        vbprod.setPadding(new Insets(10,250,10,250));
        //vbprod.setAlignment(Pos.CENTER);
        
        VBox vbrev = new VBox(hb2,reviewHBox,reviewList);
        vbrev.setPadding(new Insets(10,200,10,200));
        vbrev.setAlignment(Pos.CENTER);

        Button B1=new Button(">");
            B1.setAlignment(Pos.TOP_LEFT);
            B1.setPrefWidth(50);
            B1.setOnAction(new EventHandler<ActionEvent>() {
                    
                @Override
                public void handle(ActionEvent event) {
                    BeansSubPage.startBeansSubPage(primaryStage);
                }
                
            });

            VBox vbgrid = new VBox(image,vbprod,vbrev,scrollPane);
            vbgrid.setAlignment(Pos.CENTER);
            vbgrid.setStyle("-fx-background-color:Transparent");
            vbgrid.setPadding(new Insets(20,200,20,250));

        VBox finalbox = new VBox(B1,vbgrid);
        ScrollPane scroll = new ScrollPane(finalbox);
        scroll.setStyle(" -fx-background: null;");
      
     
        // vbscroll.setPadding(new Insets(0,400,20,0));
        // ImageView iv2 = new ImageView("file:imagedemofarmfresh\\src\\main\\resources\\backgroundFor All2.jpg");
        // iv2.setFitWidth(Screen.getPrimary().getVisualBounds().getWidth());
        // iv2.setFitHeight(Screen.getPrimary().getVisualBounds().getHeight());
        // iv2.setPreserveRatio(false);
        // StackPane sp2 = new StackPane(iv2, scroll);

        //scroll.setPrefWidth(500);
        //scroll.setPadding(new Insets(20,300,20,250));

        VBox add =new VBox(scroll,hb);

        ImageView iv7 = new ImageView("file:imagedemofarmfresh\\src\\main\\resources\\BackgroundForAll.jpg");
        iv7.setFitWidth(Screen.getPrimary().getVisualBounds().getWidth());
        iv7.setFitHeight(Screen.getPrimary().getVisualBounds().getHeight());
        iv7.setPreserveRatio(false);
        StackPane sp7 = new StackPane(iv7, add);
   

        Scene scene = new Scene(sp7,800,800);
        scene.setFill(Color.TRANSPARENT);
        primaryStage.setScene(scene);
        Screen screen = Screen.getPrimary();
        javafx.geometry.Rectangle2D bounds = screen.getVisualBounds();

        primaryStage.setX(bounds.getMinX());
        primaryStage.setY(bounds.getMinY());
        primaryStage.setWidth(bounds.getWidth());
        primaryStage.setHeight(bounds.getHeight());
        primaryStage.show();
    }

    public static void main(String[] args) {
        Application.launch(args);
    }
}