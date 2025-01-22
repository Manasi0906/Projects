package com.farmfresh1.Fruits;

import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.event.Event;
import javafx.event.EventHandler;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.scene.paint.ImagePattern;
import javafx.scene.shape.Circle;
import javafx.scene.text.Font;
import javafx.stage.Screen;
import javafx.stage.Stage;

public class MangoSubPage  {
    public static Scene sc;

    
    public static void startMangoSubPage(Stage primaryStage) {

        primaryStage.setTitle("Service6");
        primaryStage.setWidth(1950);
        primaryStage.setHeight(1040);
        
        
        Label label1=new Label("FARMFRESH");
        label1.setFont(new Font(50));
        label1.setStyle("-fx-font-weight:bold");
        Image image=new Image("file:imagedemofarmfresh/src/main/resources/farmfresh logo.jpg");
        Circle cir1=new Circle(250,200,60);
        cir1.setFill(new ImagePattern(image));
        HBox hblogo=new HBox(cir1,label1);
        hblogo.setAlignment(Pos.CENTER);

        Label label2=new Label("Search for variety here");
        label2.setFont(new Font(30));
        label2.setStyle("-fx-font-weight:bold");

        TextField textField1=new TextField();
        textField1.setMaxWidth(300);
        Button button =new Button("Search");
        button.setStyle("-fx-background-color:lightblue");

        HBox hbox1=new HBox(10,textField1,button);
        hbox1.setAlignment(Pos.CENTER);

        VBox vbox2=new VBox(10,hblogo,label2,hbox1);
        vbox2.setLayoutX(20);
        vbox2.setStyle("-fx-background-color:white");
        vbox2.setAlignment(Pos.CENTER);

        
        Image image1=new Image("file:imagedemofarmfresh/src/main/resources/mango.jpeg");
        ImageView I1=new ImageView(image1);
        I1.setFitHeight(180);
        I1.setFitWidth(250);
        Label L1=new Label("Mango");
        Label labelBeans1=new Label("Rs:25/kg");
        labelBeans1.setStyle("-fx-font-weight:bold");
        Label labelBeans2=new Label("Discount:2%");
        labelBeans2.setStyle("-fx-font-weight:bold");
        Label labelBeans3=new Label("Farmer:Sumit katkar");
        labelBeans3.setStyle("-fx-font-weight:bold");
        L1.setFont(new Font(25));
        L1.setStyle("-fx-font-weight: bold");
        VBox vb1=new VBox(10,I1,L1,labelBeans1,labelBeans2,labelBeans3);
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
        vb1.setOnMouseClicked(new EventHandler<Event>() {

            @Override
            public void handle(Event event) {
                OrderPage.startOrderPage(primaryStage);
            }
            
        });

        Image image2=new Image("file:imagedemofarmfresh/src/main/resources/mango.jpeg");
        ImageView I2=new ImageView(image2);
        I2.setFitHeight(180);
        I2.setFitWidth(250);
        Label L2=new Label("Mango");
        L2.setFont(new Font(25));
        Label labelBeans4=new Label("Rs:25/kg");
        labelBeans4.setStyle("-fx-font-weight:bold");
        Label labelBeans5=new Label("Discount:2%");
        labelBeans5.setStyle("-fx-font-weight:bold");
        L2.setStyle("-fx-font-weight: bold");
        Label labelBeans6=new Label("Farmer:Sumit katkar");
        labelBeans6.setStyle("-fx-font-weight:bold");
        VBox vb2=new VBox(10,I2,L2,labelBeans4,labelBeans5,labelBeans6);
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

        
        
        
        VBox mixedBox1=new VBox(30,vb1,vb2);

        Image image4=new Image("file:imagedemofarmfresh/src/main/resources/mango.jpeg");
        ImageView I4=new ImageView(image4);
        I4.setFitHeight(180);
        I4.setFitWidth(250);
        Label L4=new Label("Mango");
        Label labelBeans7=new Label("Rs:25/kg");
        labelBeans7.setStyle("-fx-font-weight:bold");
        Label labelBeans8=new Label("Discount:2%");
        labelBeans8.setStyle("-fx-font-weight:bold");
        L4.setFont(new Font(25));
        L4.setStyle("-fx-font-weight: bold");
        Label labelBeans9=new Label("Farmer:Sumit katkar");
        labelBeans9.setStyle("-fx-font-weight:bold");
        VBox vb4=new VBox(10,I4,L4,labelBeans7,labelBeans8,labelBeans9);
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

        Image image5=new Image("file:imagedemofarmfresh/src/main/resources/mango.jpeg");
        ImageView I5=new ImageView(image5);
        I5.setFitHeight(180);
        I5.setFitWidth(250);
        Label L5=new Label("Mango");
        L5.setFont(new Font(25));
        L5.setStyle("-fx-font-weight: bold");
        Label labelBeans10=new Label("Rs:25/kg");
        labelBeans10.setStyle("-fx-font-weight:bold");
        Label labelBeans11=new Label("Discount:2%");
        labelBeans11.setStyle("-fx-font-weight:bold");
        L2.setStyle("-fx-font-weight: bold");
        Label labelBeans12=new Label("Farmer:Sumit katkar");
        labelBeans12.setStyle("-fx-font-weight:bold");
        VBox vb5=new VBox(10,I5,L5,labelBeans10,labelBeans11,labelBeans12);
        vb5.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color:black; -fx-border-width: 2; -fx-padding: 10;");
        
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

        
        
        VBox mixedBox2=new VBox(30,vb4,vb5);

        Image image7=new Image("file:imagedemofarmfresh/src/main/resources/mango.jpeg");
        ImageView I7=new ImageView(image7);
        I7.setFitHeight(180);
        I7.setFitWidth(250);
        Label L7=new Label("Mango");
        Label labelBeans13=new Label("Discount:2%");
        labelBeans13.setStyle("-fx-font-weight:bold");
        Label labelBeans14=new Label("Rs:25/kg");
        labelBeans14.setStyle("-fx-font-weight:bold");
        L7.setFont(new Font(25));
        L7.setStyle("-fx-font-weight: bold");
        Label labelBeans15=new Label("Farmer:Sumit katkar");
        labelBeans15.setStyle("-fx-font-weight:bold");
        VBox vb7=new VBox(10,I7,L7,labelBeans14,labelBeans13,labelBeans15);
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

        Image image8=new Image("file:imagedemofarmfresh/src/main/resources/mango.jpeg");
        ImageView I8=new ImageView(image8);
        I8.setFitHeight(180);
        I8.setFitWidth(250);
        Label L8=new Label("Mango");
        L8.setFont(new Font(25));
        L8.setStyle("-fx-font-weight: bold");
        Label labelBeans16=new Label("Rs:25/kg");
        labelBeans16.setStyle("-fx-font-weight:bold");
        Label labelBeans17=new Label("Discount:2%");
        labelBeans17.setStyle("-fx-font-weight:bold");
        L2.setStyle("-fx-font-weight: bold");
        Label labelBeans18=new Label("Farmer:Sumit katkar");
        labelBeans18.setStyle("-fx-font-weight:bold");
        VBox vb8=new VBox(10,I8,L8,labelBeans16,labelBeans17,labelBeans18);
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

        
        VBox mixedBox3=new VBox(30,vb7,vb8);

        Image image10=new Image("file:imagedemofarmfresh/src/main/resources/mango.jpeg");
        ImageView I10=new ImageView(image10);
        I10.setFitHeight(180);
        I10.setFitWidth(250);
        Label L10=new Label("Mango");
        Label labelBeans19=new Label("Rs:25/kg");
        labelBeans19.setStyle("-fx-font-weight:bold");
        Label labelBeans20=new Label("Discount:2%");
        labelBeans20.setStyle("-fx-font-weight:bold");
        L10.setFont(new Font(25));
        L10.setStyle("-fx-font-weight: bold");
        Label labelBeans21=new Label("Farmer:Sumit katkar");
        labelBeans21.setStyle("-fx-font-weight:bold");
        VBox vb10=new VBox(10,I10,L10,labelBeans19,labelBeans20,labelBeans21);
        vb10.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color:black; -fx-border-width: 2; -fx-padding: 10;");
        
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

        Image image11=new Image("file:imagedemofarmfresh/src/main/resources/mango.jpeg");
        ImageView I11=new ImageView(image11);
        I11.setFitHeight(180);
        I11.setFitWidth(250);
        Label L11=new Label("Mango");
        L11.setFont(new Font(25));
        L11.setStyle("-fx-font-weight: bold");
        Label labelBeans22=new Label("Rs:25/kg");
        labelBeans22.setStyle("-fx-font-weight:bold");
        Label labelBeans23=new Label("Discount:2%");
        labelBeans23.setStyle("-fx-font-weight:bold");
        L2.setStyle("-fx-font-weight: bold");
        Label labelBeans24=new Label("Farmer:Sumit katkar");
        labelBeans24.setStyle("-fx-font-weight:bold");
        VBox vb11=new VBox(10,I11,L11,labelBeans22,labelBeans23,labelBeans24);
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

        
        
        
        VBox mixedBox4=new VBox(30,vb10,vb11);

        Image image13=new Image("file:imagedemofarmfresh/src/main/resources/mango.jpeg");
        ImageView I13=new ImageView(image13);
        I13.setFitHeight(180);
        I13.setFitWidth(250);
        Label L13=new Label("Mango");
        Label labelBeans25=new Label("Rs:25/kg");
        labelBeans25.setStyle("-fx-font-weight:bold");
        Label labelBeans26=new Label("Discount:2%");
        labelBeans26.setStyle("-fx-font-weight:bold");
        L13.setFont(new Font(25));
        L13.setStyle("-fx-font-weight: bold");
        Label labelBeans27=new Label("Farmer:Sumit katkar");
        labelBeans27.setStyle("-fx-font-weight:bold");
        VBox vb13=new VBox(10,I13,L13,labelBeans25,labelBeans26,labelBeans27);
        vb13.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color:black; -fx-border-width: 2; -fx-padding: 10;");
        
        vb13.setOnMouseEntered(new EventHandler<MouseEvent>() {

            @Override
            public void handle(MouseEvent t) {
                vb13.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color: black; -fx-border-width: 2; -fx-padding: 10; -fx-background-color:lightgrey");
            }
        });

        vb13.setOnMouseExited(new EventHandler<MouseEvent>() {

            @Override
            public void handle(MouseEvent t) {
                vb13.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color: black; -fx-border-width: 2; -fx-padding: 10; -fx-background-color:transparent");
            }
        });

        Image image14=new Image("file:imagedemofarmfresh/src/main/resources/mango.jpeg");
        ImageView I14=new ImageView(image14);
        I14.setFitHeight(180);
        I14.setFitWidth(250);
        Label L14=new Label("Mango");
        L14.setFont(new Font(25));
        L14.setStyle("-fx-font-weight: bold");
        Label labelBeans28=new Label("Rs:25/kg");
        labelBeans28.setStyle("-fx-font-weight:bold");
        Label labelBeans29=new Label("Discount:2%");
        labelBeans29.setStyle("-fx-font-weight:bold");
        L2.setStyle("-fx-font-weight: bold");
        Label labelBeans30=new Label("Farmer:Sumit katkar");
        labelBeans30.setStyle("-fx-font-weight:bold");
        VBox vb14=new VBox(10,I14,L14,labelBeans28,labelBeans29,labelBeans30);
        vb14.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color:black; -fx-border-width: 2; -fx-padding: 10;");
        
        vb14.setOnMouseEntered(new EventHandler<MouseEvent>() {

            @Override
            public void handle(MouseEvent t) {
                vb14.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color: black; -fx-border-width: 2; -fx-padding: 10; -fx-background-color:lightgrey");
            }
        });

        vb14.setOnMouseExited(new EventHandler<MouseEvent>() {

            @Override
            public void handle(MouseEvent t) {
                vb14.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color: black; -fx-border-width: 2; -fx-padding: 10; -fx-background-color:transparent");
            }
        });

        
        
        VBox mixedBox5=new VBox(30,vb13,vb14);

        HBox bHBox=new HBox(70,mixedBox1,mixedBox2,mixedBox3,mixedBox4,mixedBox5);
        bHBox.setAlignment(Pos.CENTER);

        Button B1=new Button("Back");
        B1.setOnAction(new EventHandler<ActionEvent>() {

            @Override
            public void handle(ActionEvent event) {
                primaryStage.setScene(Fruitspage.sc);
            }
            
        });

        VBox vbox11=new VBox(30,vbox2,bHBox,B1);
        vbox11.setStyle("-fx-background-color:white");
        vbox11.setAlignment(Pos.CENTER);

        Scene scene=new Scene(vbox11);
        primaryStage.setTitle("Text Inside Box");
        primaryStage.setScene(scene);
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



