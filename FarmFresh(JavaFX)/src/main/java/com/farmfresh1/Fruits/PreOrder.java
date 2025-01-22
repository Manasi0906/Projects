package com.farmfresh1.Fruits;

import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.geometry.Insets;
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
import javafx.scene.text.Font;
import javafx.stage.Screen;
import javafx.stage.Stage;

public class  PreOrder{
    //public static Scene sc;

    public static void startPreOrder(Stage primaryStage) throws Exception {
        primaryStage.setTitle("FreshFarm");
            primaryStage.setWidth(1950);
            primaryStage.setHeight(1040);

            Label label=new Label("FARMFRESH");
            label.setFont(new Font(50));
            Image image=new Image("file:imagedemofarmfresh\\src\\main\\resources\\farmfresh logo.jpg");
            Circle cir1=new Circle(250,200,60);
            cir1.setFill(new ImagePattern(image));

            HBox header=new HBox(cir1,label);
            header.setAlignment(Pos.CENTER);;
            header.setLayoutY(30);
            header.setStyle("-fx-background-color:teal");

            Button B1=new Button(">");
            B1.setAlignment(Pos.TOP_LEFT);
            B1.setOnAction(new EventHandler<ActionEvent>() {
                    
                @Override
                public void handle(ActionEvent event) {
                    primaryStage.setScene(HomePage.sc);
                }
                
            });

       Image image6=new Image("file:imagedemofarmfresh\\src\\main\\resources\\green karela.jpeg");
            ImageView I6=new ImageView(image6);
            I6.setFitHeight(180);
            I6.setFitWidth(250);
            Label L6=new Label("Karela");
            L6.setFont(new Font(25));
            L6.setStyle("-fx-font-weight: bold");
            Label price1 = new Label("Rs.40");
            price1.setFont(new Font(20));
            price1.setStyle("-fx-font-weight: bold");
            Label seller1 = new Label("by Seller1");
            seller1.setFont(new Font(20));
            seller1.setStyle("-fx-font-weight: bold");
            Label avail1 = new Label("Will be available in 1 days");
            avail1.setFont(new Font(20));
            avail1.setStyle("-fx-font-weight: bold; -fx-text-fill: green;");
            VBox vb6=new VBox(10,I6,L6,price1,seller1,avail1);
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

            Image image1=new Image("file:imagedemofarmfresh\\src\\main\\resources\\gauva.jpeg");
            ImageView I1=new ImageView(image1);
            I1.setPreserveRatio(true);
            Label L1=new Label("Gauva");
            L1.setFont(new Font(25));
            L1.setStyle("-fx-font-weight: bold");
            Label price = new Label("Rs.40");
            price.setFont(new Font(20));
            price.setStyle("-fx-font-weight: bold");
            Label seller = new Label("by Seller1");
            seller.setFont(new Font(20));
            seller.setStyle("-fx-font-weight: bold");
            Label avail = new Label("Will be available in 1 days");
            avail.setFont(new Font(20));
            avail.setStyle("-fx-font-weight: bold; -fx-text-fill: green;");
            VBox vb1=new VBox(10,I1,L1,price,seller,avail);
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

            Image image7=new Image("file:imagedemofarmfresh\\src\\main\\resources\\bendi.jpeg");
            ImageView I7=new ImageView(image7);
            I7.setFitHeight(180);
            I7.setFitWidth(250);
            Label L7=new Label("LadyFinger");
            L7.setFont(new Font(25));
            L7.setStyle("-fx-font-weight: bold");
            Label price7 = new Label("Rs.40");
            price7.setFont(new Font(20));
            price7.setStyle("-fx-font-weight: bold");
            Label seller7 = new Label("by Seller1");
            seller7.setFont(new Font(20));
            seller7.setStyle("-fx-font-weight: bold");
            Label avail7 = new Label("Will be available in 2 days");
            avail7.setFont(new Font(20));
            avail7.setStyle("-fx-font-weight: bold; -fx-text-fill: green;");
            VBox vb7=new VBox(10,I7,L7,price7,seller7,avail7);
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

            Image image2=new Image("file:imagedemofarmfresh\\src\\main\\resources\\Grapes kalli.jpeg");
            ImageView I2=new ImageView(image2);
            I2.setPreserveRatio(true);
            Label L2=new Label("Black Grapes");
            L2.setFont(new Font(25));
            L2.setStyle("-fx-font-weight: bold");
            Label price2 = new Label("Rs.40");
            price2.setFont(new Font(20));
            price2.setStyle("-fx-font-weight: bold");
            Label seller2 = new Label("by Seller1");
            seller2.setFont(new Font(20));
            seller2.setStyle("-fx-font-weight: bold");
            Label avail2 = new Label("Will be available in 2 days");
            avail2.setFont(new Font(20));
            avail2.setStyle("-fx-font-weight: bold; -fx-text-fill: green;");
            VBox vb2=new VBox(10,I2,L2,price2,seller2,avail2);
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


            Image image8=new Image("file:imagedemofarmfresh\\src\\main\\resources\\onion.jpg");
            ImageView I8=new ImageView(image8);
            I8.setFitHeight(180);
            I8.setFitWidth(250);
            Label L8=new Label("Onion");
            L8.setFont(new Font(25));
            L8.setStyle("-fx-font-weight: bold");
            Label price8 = new Label("Rs.40");
            price8.setFont(new Font(20));
            price8.setStyle("-fx-font-weight: bold");
            Label seller8 = new Label("by Seller1");
            seller8.setFont(new Font(20));
            seller8.setStyle("-fx-font-weight: bold");
            Label avail8 = new Label("Will be available in 2 days");
            avail8.setFont(new Font(20));
            avail8.setStyle("-fx-font-weight: bold; -fx-text-fill: green;");
            VBox vb8=new VBox(10,I8,L8,price8,seller8,avail8);
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

            Image image3=new Image("file:imagedemofarmfresh\\src\\main\\resources\\KIvi.jpeg");
            ImageView I3=new ImageView(image3);
            I3.setPreserveRatio(true);
            Label L3=new Label("Kiwi");
            L3.setFont(new Font(25));
            L3.setStyle("-fx-font-weight: bold");
            Label price3 = new Label("Rs.40");
            price3.setFont(new Font(20));
            price3.setStyle("-fx-font-weight: bold");
            Label seller3 = new Label("by Seller1");
            seller3.setFont(new Font(20));
            seller3.setStyle("-fx-font-weight: bold");
            Label avail3 = new Label("Will be available in 3 days");
            avail3.setFont(new Font(20));
            avail3.setStyle("-fx-font-weight: bold; -fx-text-fill: green;");
            VBox vb3=new VBox(10,I3,L3,price3,seller3,avail3);
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


            Image image9=new Image("file:imagedemofarmfresh\\src\\main\\resources\\pumpkin.jpg");
            ImageView I9=new ImageView(image9);
            I9.setFitHeight(180);
            I9.setFitWidth(250);
            Label L9=new Label("Pumkin");
            L9.setFont(new Font(25));
            L9.setStyle("-fx-font-weight: bold");
            Label price9 = new Label("Rs.40");
            price9.setFont(new Font(20));
            price9.setStyle("-fx-font-weight: bold");
            Label seller9 = new Label("by Seller1");
            seller9.setFont(new Font(20));
            seller9.setStyle("-fx-font-weight: bold");
            Label avail9 = new Label("Will be available in 3 days");
            avail9.setFont(new Font(20));
            avail9.setStyle("-fx-font-weight: bold; -fx-text-fill: green;");
            VBox vb9=new VBox(10,I9,L9,price9,seller9,avail9);
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


            Image image10=new Image("file:imagedemofarmfresh\\src\\main\\resources\\potato.jpg");
            ImageView I10=new ImageView(image10);
            I10.setFitHeight(180);
            I10.setFitWidth(250);
            Label L10=new Label("Potato");
            L10.setFont(new Font(25));
            L10.setStyle("-fx-font-weight: bold");
            Label price10 = new Label("Rs.40");
            price10.setFont(new Font(20));
            price10.setStyle("-fx-font-weight: bold");
            Label seller10 = new Label("by Seller1");
            seller10.setFont(new Font(20));
            seller10.setStyle("-fx-font-weight: bold");
            Label avail10 = new Label("Will be available in 3 days");
            avail10.setFont(new Font(20));
            avail10.setStyle("-fx-font-weight: bold; -fx-text-fill: green;");
            VBox vb10=new VBox(10,I10,L10,price10,seller10,avail10);
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
            

            Image image5=new Image("file:imagedemofarmfresh\\src\\main\\resources\\orange.jpeg");
            ImageView I5=new ImageView(image5);
            I5.setPreserveRatio(true);
            Label L5=new Label("Orange");
            L5.setFont(new Font(25));
            L5.setStyle("-fx-font-weight: bold");
            Label price5 = new Label("Rs.40");
            price5.setFont(new Font(20));
            price5.setStyle("-fx-font-weight: bold");
            Label seller5 = new Label("by Seller1");
            seller5.setFont(new Font(20));
            seller5.setStyle("-fx-font-weight: bold");
            Label avail5 = new Label("Will be available in 3 days");
            avail5.setFont(new Font(20));
            avail5.setStyle("-fx-font-weight: bold; -fx-text-fill: green;");
            VBox vb5=new VBox(10,I5,L5,price5,seller5,avail5);
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

            Image image11=new Image("file:imagedemofarmfresh\\src\\main\\resources\\pear.jpeg");
            ImageView I11=new ImageView(image11);
            I6.setPreserveRatio(true);
            Label L11=new Label("Pear");
            L11.setFont(new Font(25));
            L11.setStyle("-fx-font-weight: bold");
            Label price16 = new Label("Rs.40");
            price16.setFont(new Font(20));
            price16.setStyle("-fx-font-weight: bold");
            Label seller16 = new Label("by Seller1");
            seller16.setFont(new Font(20));
            seller16.setStyle("-fx-font-weight: bold");
            Label avail16 = new Label("Will be available in 4 days");
            avail16.setFont(new Font(20));
            avail16.setStyle("-fx-font-weight: bold; -fx-text-fill: green;");
            VBox vb11=new VBox(10,I11,L11,price16,seller16,avail16);
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

            Image image17=new Image("file:imagedemofarmfresh\\src\\main\\resources\\valid apple.jpeg");
            ImageView I17=new ImageView(image17);
            I17.setPreserveRatio(true);
            Label L17=new Label("Apple");
            L17.setFont(new Font(25));
            L17.setStyle("-fx-font-weight: bold");
            Label price17 = new Label("Rs.40");
            price17.setFont(new Font(20));
            price17.setStyle("-fx-font-weight: bold");
            Label seller17 = new Label("by Seller1");
            seller17.setFont(new Font(20));
            seller17.setStyle("-fx-font-weight: bold");
            Label avail17 = new Label("Will be available in 4 days");
            avail17.setFont(new Font(20));
            avail17.setStyle("-fx-font-weight: bold; -fx-text-fill: green;");
            VBox vb17=new VBox(10,I17,L17,price17,seller17,avail17);
            vb17.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color:black; -fx-border-width: 2; -fx-padding: 10;");
            vb17.setOnMouseEntered(new EventHandler<MouseEvent>() {

                @Override
                public void handle(MouseEvent t) {
                    vb17.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color: black; -fx-border-width: 2; -fx-padding: 10; -fx-background-color:lightgrey");
                }
            });

            vb17.setOnMouseExited(new EventHandler<MouseEvent>() {

                @Override
                public void handle(MouseEvent t) {
                    vb17.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color: black; -fx-border-width: 2; -fx-padding: 10; -fx-background-color:transparent");
                }
            });

            Image image18=new Image("file:imagedemofarmfresh\\src\\main\\resources\\Strawberry.jpeg");
            ImageView I18=new ImageView(image18);
            I18.setPreserveRatio(true);
            Label L18=new Label("Strawberry");
            L18.setFont(new Font(25));
            L18.setStyle("-fx-font-weight: bold");
            Label price18 = new Label("Rs.40");
            price18.setFont(new Font(20));
            price18.setStyle("-fx-font-weight: bold");
            Label seller18 = new Label("by Seller1");
            seller18.setFont(new Font(20));
            seller18.setStyle("-fx-font-weight: bold");
            Label avail18 = new Label("Will be available in 4 days");
            avail18.setFont(new Font(20));
            avail18.setStyle("-fx-font-weight: bold; -fx-text-fill: green;");
            VBox vb18=new VBox(10,I18,L18,price18,seller18,avail18);
            vb18.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color:black; -fx-border-width: 2; -fx-padding: 10;");
            vb18.setOnMouseEntered(new EventHandler<MouseEvent>() {

                @Override
                public void handle(MouseEvent t) {
                    vb18.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color: black; -fx-border-width: 2; -fx-padding: 10; -fx-background-color:lightgrey");
                }
            });

            vb18.setOnMouseExited(new EventHandler<MouseEvent>() {

                @Override
                public void handle(MouseEvent t) {
                    vb18.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color: black; -fx-border-width: 2; -fx-padding: 10; -fx-background-color:transparent");
                }
            });

            Image image19=new Image("file:imagedemofarmfresh\\src\\main\\resources\\valid grapes.jpeg");
            ImageView I19=new ImageView(image19);
            I19.setPreserveRatio(true);
            Label L19=new Label("Grapes");
            L19.setFont(new Font(25));
            L19.setStyle("-fx-font-weight: bold");
            Label price19 = new Label("Rs.40");
            price19.setFont(new Font(20));
            price19.setStyle("-fx-font-weight: bold");
            Label seller19 = new Label("by Seller1");
            seller19.setFont(new Font(20));
            seller19.setStyle("-fx-font-weight: bold");
            Label avail19 = new Label("Will be available in 4 days");
            avail19.setFont(new Font(20));
            avail19.setStyle("-fx-font-weight: bold; -fx-text-fill: green;");
            VBox vb19=new VBox(10,I19,L19,price19,seller19,avail19);
            vb19.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color: black; -fx-border-width: 2; -fx-padding: 10;");
            vb19.setOnMouseEntered(new EventHandler<MouseEvent>() {

                @Override
                public void handle(MouseEvent t) {
                    vb19.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color: black; -fx-border-width: 2; -fx-padding: 10; -fx-background-color:lightgrey");
                }
            });

            vb19.setOnMouseExited(new EventHandler<MouseEvent>() {

                @Override
                public void handle(MouseEvent t) {
                    vb19.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color: black; -fx-border-width: 2; -fx-padding: 10; -fx-background-color:transparent");
                }
            });


            Image image20=new Image("file:imagedemofarmfresh\\src\\main\\resources\\watermelon.jpeg");
            ImageView I20=new ImageView(image20);
            I20.setPreserveRatio(true);
            Label L20=new Label("Watermelon");
            L20.setFont(new Font(25));
            L20.setStyle("-fx-font-weight: bold");
            Label price20 = new Label("Rs.40");
            price20.setFont(new Font(20));
            price20.setStyle("-fx-font-weight: bold");
            Label seller20 = new Label("by Seller1");
            seller20.setFont(new Font(20));
            seller20.setStyle("-fx-font-weight: bold");
            Label avail20 = new Label("Will be available in 5 days");
            avail20.setFont(new Font(20));
            avail20.setStyle("-fx-font-weight: bold; -fx-text-fill: green;");
            VBox vb20=new VBox(10,I20,L20,price20,seller20,avail20);
            vb20.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color: black; -fx-border-width: 2; -fx-padding: 10;");
            vb20.setOnMouseEntered(new EventHandler<MouseEvent>() {

                @Override
                public void handle(MouseEvent t) {
                    vb20.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color: black; -fx-border-width: 2; -fx-padding: 10; -fx-background-color:lightgrey");
                }
            });

            vb20.setOnMouseExited(new EventHandler<MouseEvent>() {

                @Override
                public void handle(MouseEvent t) {
                    vb20.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color: black; -fx-border-width: 2; -fx-padding: 10; -fx-background-color:transparent");
                }
            });

            Image image21=new Image("file:imagedemofarmfresh\\src\\main\\resources\\banana.jpeg");
            ImageView I21=new ImageView(image21);
            I21.setPreserveRatio(true);
            Label L21=new Label("Banana");
            L21.setFont(new Font(25));
            L21.setStyle("-fx-font-weight: bold");
            Label price21 = new Label("Rs.40");
            price21.setFont(new Font(20));
            price21.setStyle("-fx-font-weight: bold");
            Label seller21 = new Label("by Seller1");
            seller21.setFont(new Font(20));
            seller21.setStyle("-fx-font-weight: bold");
            Label avail21 = new Label("Will be available in 5 days");
            avail21.setFont(new Font(20));
            avail21.setStyle("-fx-font-weight: bold; -fx-text-fill: green;");
            VBox vb21=new VBox(10,I21,L21,price21,seller21,avail21);
            vb21.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color:black; -fx-border-width: 2; -fx-padding: 10;");
            vb21.setOnMouseEntered(new EventHandler<MouseEvent>() {

                @Override
                public void handle(MouseEvent t) {
                    vb21.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color: black; -fx-border-width: 2; -fx-padding: 10; -fx-background-color:lightgrey");
                }
            });

            vb21.setOnMouseExited(new EventHandler<MouseEvent>() {

                @Override
                public void handle(MouseEvent t) {
                    vb21.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color: black; -fx-border-width: 2; -fx-padding: 10; -fx-background-color:transparent");
                }
            });

            Image image22=new Image("file:imagedemofarmfresh\\src\\main\\resources\\green karela.jpeg");
            ImageView I22=new ImageView(image22);
            I22.setPreserveRatio(true);
            Label L22=new Label("Chiku");
            L22.setFont(new Font(25));
            L22.setStyle("-fx-font-weight: bold");
            Label price22 = new Label("Rs.40");
            price22.setFont(new Font(20));
            price22.setStyle("-fx-font-weight: bold");
            Label seller22 = new Label("by Seller2");
            seller22.setFont(new Font(20));
            seller22.setStyle("-fx-font-weight: bold");
            Label avail22 = new Label("Will be available in 5 days");
            avail22.setFont(new Font(20));
            avail22.setStyle("-fx-font-weight: bold; -fx-text-fill: green;");
            VBox vb22=new VBox(10,I22,L22,price22,seller22,avail22);
            vb22.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color: black; -fx-border-width: 2; -fx-padding: 10;");
            vb22.setOnMouseEntered(new EventHandler<MouseEvent>() {

                @Override
                public void handle(MouseEvent t) {
                    vb22.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color: black; -fx-border-width: 2; -fx-padding: 10; -fx-background-color:lightgrey");
                }
            });

            vb22.setOnMouseExited(new EventHandler<MouseEvent>() {

                @Override
                public void handle(MouseEvent t) {
                    vb22.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color: black; -fx-border-width: 2; -fx-padding: 10; -fx-background-color:transparent");
                }
            });


            VBox vba = new VBox(100,vb1, vb8,vb10,vb19);
            VBox vbb = new VBox(100,vb6,vb5,vb11,vb20);
            VBox vbc = new VBox(100,vb2,vb9,vb17,vb21);
            VBox vbd = new VBox(100,vb7,vb3,vb18,vb22);
        
            HBox hb=new HBox( 200,vba,vbb,vbc,vbd);
            hb.setLayoutX(60);
            hb.setLayoutY(40);
            hb.setStyle("-fx-background-color:white");
            hb.setAlignment(Pos.CENTER);

            VBox Entire=new VBox(40,header,B1,hb);
            //Entire.setAlignment(Pos.CENTER);
            Entire.setStyle("-fx-background-color:white");
            

            ScrollPane scrollPane=new ScrollPane(Entire);
            scrollPane.setStyle("-fx-background-color:white");
            scrollPane.setFitToWidth(true);
            scrollPane.setFitToHeight(true);
        
            Scene sc=new Scene(scrollPane);
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