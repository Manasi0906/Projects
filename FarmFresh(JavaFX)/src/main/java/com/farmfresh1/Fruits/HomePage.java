package com.farmfresh1.Fruits;

import javafx.application.Application;
import javafx.event.Event;
import javafx.event.EventHandler;
import javafx.geometry.Pos;
import javafx.scene.Cursor;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.ComboBox;
import javafx.scene.control.Label;
import javafx.scene.control.ScrollPane;
import javafx.scene.control.TextField;
import javafx.scene.effect.GaussianBlur;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.StackPane;
import javafx.scene.layout.VBox;
import javafx.scene.paint.Color;
import javafx.scene.paint.ImagePattern;
import javafx.scene.shape.Circle;
import javafx.scene.text.Font;
import javafx.stage.Screen;
import javafx.stage.Stage;

public class HomePage  {

    public static Scene sc;
    // VegetablesPage objvegetablesPage=new VegetablesPage();
    // Fruitspage objfruitspage=new Fruitspage();
    // GrainsPage objgrainspage=new GrainsPage();
    // LeaderBoard objleaderBoard=new LeaderBoard();
    // Accountpage objaccountpage=new Accountpage();
    // Profilepage objprofilepage=new Profilepage();
    // MilkSubPage objmilkPage=new MilkSubPage();
    // AboutUs objAboutUs=new AboutUs();
    
 
    public static void startHomePage(Stage primaryStage)  {
        primaryStage.setTitle("Service8");
        primaryStage.setWidth(1950);
        primaryStage.setHeight(1040);

        Label l1=new Label("FARMFRESH");
        l1.setFont(new Font(50));
        l1.setAlignment(Pos.CENTER);
        l1.setTextFill(Color.BLACK);

        Image image=new Image("file:imagedemofarmfresh/src/main/resources/farmfresh logo.jpg");
        Circle cir1=new Circle(250,200,60);
        cir1.setFill(new ImagePattern(image));

        HBox hbox1=new HBox(cir1,l1);
        hbox1.setAlignment(Pos.CENTER);

        TextField textfField=new TextField();
        textfField.setPrefWidth(300);
        Button button1=new Button("Search"); 
        button1.setStyle("-fx-background-color:lightblue");
        HBox hBox2=new HBox(10,textfField,button1);
        hBox2.setAlignment(Pos.CENTER);

        Label l2=new Label("Home");
        l2.setStyle("-fx-font-weight:bold");
        l2.setFont(new Font(20));
        l2.setOnMouseClicked(new EventHandler<Event>() {

            @Override
            public void handle(Event event) {
               try {
                primaryStage.setScene(sc);
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            }
            
        });

        Label l3=new Label("Upload");
        l3.setStyle("-fx-font-weight:bold");
        l3.setFont(new Font(20));
        l3.setOnMouseClicked(new EventHandler<Event>() {

            @Override
            public void handle(Event event) {
               try {
                UploadPage.startUploadPage(primaryStage);
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            }
            
        });

        Label l5=new Label("Account");
        l5.setStyle("-fx-font-weight:bold");
        l5.setFont(new Font(20));
        l5.setOnMouseClicked(new EventHandler<Event>() {

            @Override
            public void handle(Event event) {
                try {
                     Accountpage.startAccountPage(primaryStage);
                } catch (Exception e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            }
            
        });

        Label l7=new Label("Pre-Order");
        l7.setStyle("-fx-font-weight:bold");
        l7.setFont(new Font(20));
        l7.setOnMouseClicked(new EventHandler<Event>() {

            @Override
            public void handle(Event event) {
                try {
                    PreOrder.startPreOrder(primaryStage);
                } catch (Exception e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            }
            
        });

        Label l8=new Label("LeaderBoard");
        l8.setStyle("-fx-font-weight:bold");
        l8.setFont(new Font(20));
        l8.setOnMouseClicked(new EventHandler<Event>() {

            @Override
            public void handle(Event event) {
                try {
                    LeaderBoard.startLeaderBoard(primaryStage);
                } catch (Exception e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            }
            
        });

        Label l6=new Label("AboutUs");
        l6.setStyle("-fx-font-weight:bold");
        l6.setFont(new Font(20));
        l6.setOnMouseClicked(new EventHandler<Event>() {

            @Override
            public void handle(Event event) {
               AboutUs.startAboutUs(primaryStage);
            }
            
        });

        // Label l7 = new Label("More");
        // l7.setStyle("-fx-font-weight: bold");
        // l7.setFont(new Font(20));
        ComboBox cb = new ComboBox<>();
        cb.setPromptText("More");
        cb.setStyle("-fx-font-weight: bold; -fx-font-size:20px; -fx-background-color:rgb(144,238,144)");
        cb.setPrefWidth(150);
        cb.getItems().addAll("Special Offers","Best Sellers");

        GridPane gridPane=new GridPane();
        gridPane.add(l2, 0, 0, 1, 1);
        gridPane.add(l3, 2, 0, 1, 1);
        gridPane.add(l7, 4, 0, 1, 1);
        gridPane.add(l8, 6, 0, 1, 1);
        gridPane.add(l5, 8, 0, 1, 1);
        gridPane.add(l6, 10, 0, 1, 1);
        gridPane.add(cb, 12, 0, 1, 1);
        gridPane.setHgap(20);
        gridPane.setLayoutX(20);
        gridPane.setStyle("-fx-background-color:rgb(144,238,144)");

        // Label text =new Label("Sumit");
        // text.setTextFill(Color.WHITE);
         HBox hBox7=new HBox();
        //hBox7.setPrefHeight(30);
        hBox7.setStyle("-fx-background-color:white");

        VBox vb1=new VBox(20,hbox1,hBox2,gridPane,hBox7);
        vb1.setStyle("-fx-background-color:white");
        
        // Label labelvegetable=new Label("Vegetables :");
        // labelvegetable.setFont(new Font(50));
        Image image1=new Image("file:imagedemofarmfresh\\src\\main\\resources\\fruits-and-vegetables.jpg");
        ImageView imageView1=new ImageView(image1);
        imageView1.setFitHeight(300);
        imageView1.setFitWidth(700);
        StackPane stackPane1=new StackPane();
        stackPane1.getChildren().add(imageView1);
        stackPane1.setStyle("-fx-background-radius: 10; -fx-border-radius: 10;-fx-border-color: black; -fx-border-width: 2; -fx-padding: 10;");
        stackPane1.setAlignment(Pos.CENTER);
        stackPane1.setMaxWidth(StackPane.USE_PREF_SIZE);
        stackPane1.setMaxHeight(StackPane.USE_PREF_SIZE);
        Label L1=new Label("Vegetables");
        L1.setFont(new Font(30));
        L1.setStyle("-fx-font-weight:bold");
        VBox vBox1=new VBox(stackPane1,L1);
        vBox1.setAlignment(Pos.CENTER);
        vBox1.setOnMouseClicked(new EventHandler<Event>() {

            @Override
            public void handle(Event event) {
               try {
                VegetablesPage.startVegetablesPage(primaryStage);
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            }
            
        });

        // hBox3.setLayoutX(10);
        // GridPane gridPane2=new GridPane();
        // gridPane2.add(imageView1, 2, 0); 

        Image image2=new Image("file:imagedemofarmfresh\\src\\main\\resources\\fruit-og-d176ef00.jpg");
        ImageView imageView2=new ImageView(image2);
        imageView2.setFitHeight(300);
        imageView2.setFitWidth(700);
        StackPane stackPane2=new StackPane();
        stackPane2.getChildren().add(imageView2);
        stackPane2.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color: black; -fx-border-width: 2; -fx-padding: 10;");
        stackPane2.setAlignment(Pos.CENTER);
        stackPane2.setMaxWidth(StackPane.USE_PREF_SIZE);
        stackPane2.setMaxHeight(StackPane.USE_PREF_SIZE);
        Label L2=new Label("Fruits");
        L2.setFont(new Font(30));
        L2.setStyle("-fx-font-weight:bold");
        VBox vBox2=new VBox(stackPane2,L2);
        vBox2.setAlignment(Pos.CENTER);
        vBox2.setOnMouseClicked(new EventHandler<Event>() {

            @Override
            public void handle(Event event) {
               try {
                Fruitspage.startFruitPage(primaryStage);
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            }
            
        });

        
        Image image3=new Image("file:imagedemofarmfresh\\src\\main\\resources\\grain home.png");
        ImageView imageView3=new ImageView(image3);
        imageView3.setFitHeight(300);
        imageView3.setFitWidth(700);
        StackPane stackPane3=new StackPane();
        stackPane3.getChildren().add(imageView3);
        stackPane3.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color: black; -fx-border-width: 2; -fx-padding: 10;");
        stackPane3.setAlignment(Pos.CENTER);
        stackPane3.setMaxWidth(StackPane.USE_PREF_SIZE);
        stackPane3.setMaxHeight(StackPane.USE_PREF_SIZE);
        Label L3=new Label("Grains & Pulses");
        L3.setFont(new Font(30));
        L3.setStyle("-fx-font-weight:bold");
        VBox vBox3=new VBox(stackPane3,L3);
        vBox3.setAlignment(Pos.CENTER);
        vBox3.setOnMouseClicked(new EventHandler<Event>() {

            @Override
            public void handle(Event event) {
               try {
                GrainsPage.startGrainsPage(primaryStage);
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            }
            
        });
        
        Image image4=new Image("file:imagedemofarmfresh\\src\\main\\resources\\milk and eggs.jpg");
        ImageView imageView4=new ImageView(image4);
        imageView4.setFitHeight(300);
        imageView4.setFitWidth(700);
        StackPane stackPane4=new StackPane();
        stackPane4.getChildren().add(imageView4);
        stackPane4.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color: black; -fx-border-width: 2; -fx-padding: 10;");
        stackPane4.setAlignment(Pos.CENTER);
        stackPane4.setMaxWidth(StackPane.USE_PREF_SIZE);
        stackPane4.setMaxHeight(StackPane.USE_PREF_SIZE);
        Label L4=new Label("Milk & Eggs");
        L4.setFont(new Font(30));
        L4.setStyle("-fx-font-weight:bold");
        VBox vBox4=new VBox(stackPane4,L4);
        vBox4.setAlignment(Pos.CENTER);
        vBox4.setOnMouseClicked(new EventHandler<Event>() {

            @Override
            public void handle(Event event) {
               try {
                MilkSubPage.startMilkSubPage(primaryStage);
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            }
            
        });
        
        // ImageView iv2 = new ImageView("file:imagedemofarmfresh\\src\\main\\resources\\background for signup.jpg");
        // iv2.setFitWidth(Screen.getPrimary().getVisualBounds().getWidth());
        // iv2.setFitHeight(Screen.getPrimary().getVisualBounds().getHeight());
        // iv2.setPreserveRatio(false);
        // iv2.setEffect(new GaussianBlur(15));

        VBox vb=new VBox(100,vBox1,vBox2,vBox3,vBox4);
        vb.setAlignment(Pos.CENTER);
        vb.setStyle("-fx-background-color:white");


        ScrollPane scrollPane=new ScrollPane(vb);
        scrollPane.setFitToWidth(true);
        scrollPane.setFitToHeight(true);
        
        BorderPane root = new BorderPane();
        root.setTop(vb1);
        root.setCenter(scrollPane);

        //StackPane sp2 = new StackPane(iv2, root);



        sc=new Scene(root);
        sc.setFill(Color.WHITE);
        sc.setCursor(Cursor.HAND);
        primaryStage.setScene(sc);
         Screen screen = Screen.getPrimary();
        javafx.geometry.Rectangle2D bounds = screen.getVisualBounds();

        // Set stage to cover the screen
        primaryStage.setX(bounds.getMinX());
        primaryStage.setY(bounds.getMinY());
        primaryStage.setWidth(bounds.getWidth());
        primaryStage.setHeight(bounds.getHeight());
        primaryStage.show();
    }
 
    
}