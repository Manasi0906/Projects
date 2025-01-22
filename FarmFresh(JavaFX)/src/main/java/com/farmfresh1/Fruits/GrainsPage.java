package com.farmfresh1.Fruits;

import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.event.Event;
import javafx.event.EventHandler;
import javafx.event.EventType;
import javafx.geometry.Pos;
import javafx.scene.Cursor;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.ScrollPane;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.scene.paint.Color;
import javafx.scene.paint.ImagePattern;
import javafx.scene.shape.Circle;
import javafx.scene.shape.Rectangle;
import javafx.scene.text.Font;
import javafx.stage.Screen;
import javafx.stage.Stage;

public class GrainsPage {
    public static Scene sc;
    //RiceSubPage objricesubpage=new RiceSubPage();
    

  
    public static void startGrainsPage(Stage primaryStage) throws Exception {
            primaryStage.setTitle("FreshFarm");
            primaryStage.setWidth(1950);
            primaryStage.setHeight(1040);

            Label label=new Label("FARMFRESH");
            label.setFont(new Font(50));
            Image image=new Image("file:imagedemofarmfresh/src/main/resources/farmfresh logo.jpg");
            Circle cir1=new Circle(250,200,60);
            cir1.setFill(new ImagePattern(image));

            Button B1=new Button("<");
            B1.setOnAction(new EventHandler<ActionEvent>() {
                    
                @Override
                public void handle(ActionEvent event) {
                   primaryStage.setScene(HomePage.sc);
                }
                
            });
            HBox hb=new HBox(cir1,label);
            hb.setAlignment(Pos.CENTER);;
            hb.setLayoutY(30);
            hb.setStyle("-fx-background-color:teal");

            Image image1=new Image("file:imagedemofarmfresh\\src\\main\\resources\\Bajra.jpeg");
            ImageView I1=new ImageView(image1);
            I1.setFitHeight(180);
            I1.setFitWidth(250);
            Label L1=new Label("Bajra");
            L1.setFont(new Font(25));
            L1.setStyle("-fx-font-weight: bold");
            VBox vb1=new VBox(40,I1,L1);
            vb1.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color:black; -fx-border-width: 2; -fx-padding: 10;");
            
            vb1.setOnMouseEntered(new EventHandler<MouseEvent>() {

                @Override
                public void handle(MouseEvent t) {
                    vb1.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color: black; -fx-border-width: 2; -fx-padding: 10; -fx-background-color:lightgrey");
                }
            });

            vb1.setOnMouseExited(new EventHandler<MouseEvent>() {

                @Override
                public void handle(MouseEvent t) {
                    vb1.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color: black; -fx-border-width: 2; -fx-padding: 10; -fx-background-color:transparent");
                }
            });     


            Image image2=new Image("file:imagedemofarmfresh\\src\\main\\resources\\brown rice.jpg");
            ImageView I2=new ImageView(image2);
            I2.setFitHeight(180);
            I2.setFitWidth(250);
            
            Label L2=new Label("Brown Rice");
            L2.setFont(new Font(25));
            L2.setStyle("-fx-font-weight: bold");
            VBox vb2=new VBox(40,I2,L2);
            vb2.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color:black; -fx-border-width: 2; -fx-padding: 10;");
            vb2.setOnMouseEntered(new EventHandler<MouseEvent>() {

                @Override
                public void handle(MouseEvent t) {
                    vb2.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color: black; -fx-border-width: 2; -fx-padding: 10; -fx-background-color:lightgrey");
                }
            });

            vb2.setOnMouseExited(new EventHandler<MouseEvent>() {

                @Override
                public void handle(MouseEvent t) {
                    vb2.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color: black; -fx-border-width: 2; -fx-padding: 10; -fx-background-color:transparent");
                }
            });

            Image image3=new Image("file:imagedemofarmfresh\\src\\main\\resources\\jowar.jpeg");
            ImageView I3=new ImageView(image3);
            I3.setFitHeight(180);
            I3.setFitWidth(250);
            Label L3=new Label("Jowar");
            L3.setFont(new Font(25));
            L3.setStyle("-fx-font-weight: bold");
            VBox vb3=new VBox(40,I3,L3);
            vb3.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color: black; -fx-border-width: 2; -fx-padding: 10;");
            vb3.setOnMouseEntered(new EventHandler<MouseEvent>() {

                @Override
                public void handle(MouseEvent t) {
                    vb3.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color: black; -fx-border-width: 2; -fx-padding: 10; -fx-background-color:lightgrey");
                }
            });

            vb3.setOnMouseExited(new EventHandler<MouseEvent>() {

                @Override
                public void handle(MouseEvent t) {
                    vb3.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color: black; -fx-border-width: 2; -fx-padding: 10; -fx-background-color:transparent");
                }
            });

            VBox vb21=new VBox(70,vb1,vb2,vb3);
            

            Image image4=new Image("file:imagedemofarmfresh\\src\\main\\resources\\rice.jpeg");
            ImageView I4=new ImageView(image4);
            I4.setFitHeight(180);
            I4.setFitWidth(250);
            Label L4=new Label("Rice");
            L4.setFont(new Font(25));
            L4.setStyle("-fx-font-weight: bold");
            VBox vb4=new VBox(40,I4,L4);
            vb4.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color:black; -fx-border-width: 2; -fx-padding: 10;");
            vb4.setOnMouseEntered(new EventHandler<MouseEvent>() {

                @Override
                public void handle(MouseEvent t) {
                    vb4.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color: black; -fx-border-width: 2; -fx-padding: 10; -fx-background-color:lightgrey");
                }
            });

            vb4.setOnMouseExited(new EventHandler<MouseEvent>() {

                @Override
                public void handle(MouseEvent t) {
                    vb4.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color: black; -fx-border-width: 2; -fx-padding: 10; -fx-background-color:transparent");
                }
            });
            vb4.setOnMouseClicked(new EventHandler<Event>() {

                @Override
                public void handle(Event event) {
                  RiceSubPage.startRiceSubPage(primaryStage);
                }
                
            });

            Image image5=new Image("file:imagedemofarmfresh\\src\\main\\resources\\jowar.jpeg");
            ImageView I5=new ImageView(image5);
            I5.setFitHeight(180);
            I5.setFitWidth(250);
            Label L5=new Label("Jowar");
            L5.setFont(new Font(25));
            L5.setStyle("-fx-font-weight: bold");
            VBox vb5=new VBox(40,I5,L5);
            vb5.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color: black; -fx-border-width: 2; -fx-padding: 10;");
            vb5.setOnMouseEntered(new EventHandler<MouseEvent>() {

                @Override
                public void handle(MouseEvent t) {
                    vb5.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color: black; -fx-border-width: 2; -fx-padding: 10; -fx-background-color:lightgrey");
                }
            });

            vb5.setOnMouseExited(new EventHandler<MouseEvent>() {

                @Override
                public void handle(MouseEvent t) {
                    vb5.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color: black; -fx-border-width: 2; -fx-padding: 10; -fx-background-color:transparent");
                }
            });

            Image image6=new Image("file:imagedemofarmfresh\\src\\main\\resources\\Maize.jpeg");
            ImageView I6=new ImageView(image6);
            I6.setFitHeight(180);
            I6.setFitWidth(250);
            Label L6=new Label("Maize");
            L6.setFont(new Font(25));
            L6.setStyle("-fx-font-weight: bold");
            VBox vb6=new VBox(40,I6,L6);
            vb6.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color:black; -fx-border-width: 2; -fx-padding: 10;");
            vb6.setOnMouseEntered(new EventHandler<MouseEvent>() {

                @Override
                public void handle(MouseEvent t) {
                    vb6.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color: black; -fx-border-width: 2; -fx-padding: 10; -fx-background-color:lightgrey");
                }
            });

            vb6.setOnMouseExited(new EventHandler<MouseEvent>() {

                @Override
                public void handle(MouseEvent t) {
                    vb6.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color: black; -fx-border-width: 2; -fx-padding: 10; -fx-background-color:transparent");
                }
            });

            VBox vb22=new VBox(70,vb4,vb5,vb6);

            Image image7=new Image("file:imagedemofarmfresh\\src\\main\\resources\\oats.jpeg");
            ImageView I7=new ImageView(image7);
            I7.setFitHeight(180);
            I7.setFitWidth(250);
            Label L7=new Label("Oats");
            L7.setFont(new Font(25));
            L7.setStyle("-fx-font-weight: bold");
            VBox vb7=new VBox(40,I7,L7);
            vb7.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color:black; -fx-border-width: 2; -fx-padding: 10;");
            vb7.setOnMouseEntered(new EventHandler<MouseEvent>() {

                @Override
                public void handle(MouseEvent t) {
                    vb7.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color: black; -fx-border-width: 2; -fx-padding: 10; -fx-background-color:lightgrey");
                }
            });

            vb7.setOnMouseExited(new EventHandler<MouseEvent>() {

                @Override
                public void handle(MouseEvent t) {
                    vb7.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color: black; -fx-border-width: 2; -fx-padding: 10; -fx-background-color:transparent");
                }
            });

            Image image8=new Image("file:imagedemofarmfresh\\src\\main\\resources\\wheat.jpeg");
            ImageView I8=new ImageView(image8);
            I8.setFitHeight(180);
            I8.setFitWidth(250);
            Label L8=new Label("Wheat");
            L8.setFont(new Font(25));
            L8.setStyle("-fx-font-weight: bold");
            VBox vb8=new VBox(40,I8,L8);
            vb8.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color:black; -fx-border-width: 2; -fx-padding: 10;");
            vb8.setOnMouseEntered(new EventHandler<MouseEvent>() {

                @Override
                public void handle(MouseEvent t) {
                    vb8.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color: black; -fx-border-width: 2; -fx-padding: 10; -fx-background-color:lightgrey");
                }
            });

            vb8.setOnMouseExited(new EventHandler<MouseEvent>() {

                @Override
                public void handle(MouseEvent t) {
                    vb8.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color: black; -fx-border-width: 2; -fx-padding: 10; -fx-background-color:transparent");
                }
            });

            Image image9=new Image("file:imagedemofarmfresh\\src\\main\\resources\\Moong.jpg");
            ImageView I9=new ImageView(image9);
            I9.setFitHeight(180);
            I9.setFitWidth(250);
            Label L9=new Label("Moong");
            L9.setFont(new Font(25));
            L9.setStyle("-fx-font-weight: bold");
            VBox vb9=new VBox(40,I9,L9);
            vb9.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color: black; -fx-border-width: 2; -fx-padding: 10;");
            vb9.setOnMouseEntered(new EventHandler<MouseEvent>() {

                @Override
                public void handle(MouseEvent t) {
                    vb9.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color: black; -fx-border-width: 2; -fx-padding: 10; -fx-background-color:lightgrey");
                }
            });

            vb9.setOnMouseExited(new EventHandler<MouseEvent>() {

                @Override
                public void handle(MouseEvent t) {
                    vb9.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color: black; -fx-border-width: 2; -fx-padding: 10; -fx-background-color:transparent");
                }
            });

            VBox vb23=new VBox(70,vb7,vb8,vb9);

            Image image10=new Image("file:imagedemofarmfresh\\src\\main\\resources\\chana.jpg");
            ImageView I10=new ImageView(image10);
            I10.setFitHeight(180);
            I10.setFitWidth(250);
            Label L10=new Label("Chana");
            L10.setFont(new Font(25));
            L10.setStyle("-fx-font-weight: bold");
            VBox vb10=new VBox(40,I10,L10);
            vb10.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color: black; -fx-border-width: 2; -fx-padding: 10;");
            vb10.setOnMouseEntered(new EventHandler<MouseEvent>() {

                @Override
                public void handle(MouseEvent t) {
                    vb10.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color: black; -fx-border-width: 2; -fx-padding: 10; -fx-background-color:lightgrey");
                }
            });

            vb10.setOnMouseExited(new EventHandler<MouseEvent>() {

                @Override
                public void handle(MouseEvent t) {
                    vb10.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color: black; -fx-border-width: 2; -fx-padding: 10; -fx-background-color:transparent");
                }
            });

            Image image11=new Image("file:imagedemofarmfresh\\src\\main\\resources\\Soyabean.jpg");
            ImageView I11=new ImageView(image11);
            I11.setFitHeight(180);
            I11.setFitWidth(250);
            Label L11=new Label("Soyabean");
            L11.setFont(new Font(25));
            L11.setStyle("-fx-font-weight: bold");
            VBox vb11=new VBox(40,I11,L11);
            vb11.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color:black; -fx-border-width: 2; -fx-padding: 10;");
            vb11.setOnMouseEntered(new EventHandler<MouseEvent>() {

                @Override
                public void handle(MouseEvent t) {
                    vb11.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color: black; -fx-border-width: 2; -fx-padding: 10; -fx-background-color:lightgrey");
                }
            });

            vb11.setOnMouseExited(new EventHandler<MouseEvent>() {

                @Override
                public void handle(MouseEvent t) {
                    vb11.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color: black; -fx-border-width: 2; -fx-padding: 10; -fx-background-color:transparent");
                }
            });

            Image image12=new Image("file:imagedemofarmfresh\\src\\main\\resources\\Red-Kidney-beans-1-500x500.jpg");
            ImageView I12=new ImageView(image12);
            I12.setFitHeight(180);
            I12.setFitWidth(250);
            Label L12=new Label("Red-Kidney-Beans");
            L12.setFont(new Font(25));
            L12.setStyle("-fx-font-weight: bold");
            VBox vb12=new VBox(40,I12,L12);
            vb12.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color: black; -fx-border-width: 2; -fx-padding: 10;");
            vb12.setOnMouseEntered(new EventHandler<MouseEvent>() {

                @Override
                public void handle(MouseEvent t) {
                    vb12.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color: black; -fx-border-width: 2; -fx-padding: 10; -fx-background-color:lightgrey");
                }
            });

            vb12.setOnMouseExited(new EventHandler<MouseEvent>() {

                @Override
                public void handle(MouseEvent t) {
                    vb12.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color: black; -fx-border-width: 2; -fx-padding: 10; -fx-background-color:transparent");
                }
            });

            VBox vb24=new VBox(70,vb10,vb11,vb12);



            HBox hb1=new HBox( 200,vb21,vb22,vb23,vb24);
            hb1.setAlignment(Pos.CENTER);
            hb1.setStyle("-fx-background-color:white");

            VBox BB1=new VBox(40,hb,B1,hb1);
            BB1.setStyle("-fx-background-color:white");

            ScrollPane scrollPane=new ScrollPane(BB1);
            scrollPane.setFitToHeight(true);
            scrollPane.setFitToWidth(true);
        
            sc=new Scene(scrollPane);
            primaryStage.setScene(sc);
            sc.setFill(Color.WHITE);
            sc.setCursor(Cursor.HAND);
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


