package com.farmfresh1.Fruits;

import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Group;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
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
import javafx.scene.text.Text;
import javafx.stage.Screen;
import javafx.stage.Stage;

public class Accountpage  {


    public static void startAccountPage(Stage primaryStage) throws Exception {
       primaryStage.setTitle("Service7");
       primaryStage.setWidth(1950);
       primaryStage.setHeight(1040);

       Label titlelogo7=new Label("FARMFRESH");
                titlelogo7.setFont(new Font(50));
                titlelogo7.setAlignment(Pos.CENTER);
                titlelogo7.setTextFill(Color.BLACK);
                Image image7=new Image("file:imagedemofarmfresh/src/main/resources/farmfresh logo.jpg");
                Circle cir7=new Circle(250,200,60);
                cir7.setFill(new ImagePattern(image7));
                HBox hbox7=new HBox(cir7,titlelogo7);
                hbox7.setPadding(new Insets(10,0,20,0));
                hbox7.setAlignment(Pos.CENTER);

       Label L1=new Label("Hello Sumit");
       Button button1=new Button("Your Order");
       button1.setPrefWidth(200);
       button1.setStyle("-fx-background-color:rgb(144,238,144)");
       
       Button button2=new Button("Buy Again");
       button2.setPrefWidth(200);
       button2.setStyle("-fx-background-color:rgb(144,238,144)");

       Button button3=new Button("Your Account");
       button3.setPrefWidth(200);
       button3.setStyle("-fx-background-color:rgb(144,238,144)");
       button3.setOnAction(new EventHandler<ActionEvent>() {

        @Override
        public void handle(ActionEvent event) {
            try {
                 ProductProfile.startProductProfile(primaryStage);
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        
       });


       Button button4=new Button("Your Lists");
       button4.setPrefWidth(200);
       button4.setStyle("-fx-background-color:rgb(144,238,144)");
       Button button5=new Button("Return to Homepage");
       button5.setStyle("-fx-background-color:rgb(144,238,144)");
       button5.setPrefWidth(200);
       button5.setPrefHeight(50);
       button5.setOnAction(new EventHandler<ActionEvent>() {

        @Override
        public void handle(ActionEvent event) {
            primaryStage.setScene(HomePage.sc);
        }
        
       });

       Label l1=new Label("Your Orders");
       l1.setStyle("-fx-font-weight:bold");
       l1.setFont(new Font(30));
       Text T1=new Text("Hi! you have no recent orders");


       GridPane gridPane=new GridPane();
       gridPane.add(button1, 0,2, 1, 1);
       gridPane.add(button2, 3,2 ,1,1 );
       gridPane.add(button3, 0,5 ,1, 1 );
       gridPane.add(button4, 3,5 ,1, 1 );
       gridPane.add(button5, 1,7 ,1, 1 );
       gridPane.add(l1,0 ,9,1, 1);
       gridPane.add(T1,0 ,10,1, 1);
       gridPane.add(L1,0 ,0,1, 1);
       gridPane.setAlignment(Pos.CENTER);
       gridPane.setHgap(20);
       gridPane.setVgap(20);
    //    gridPane.setStyle("-fx-background-color:Transparent");
       //gridPane.setLayoutX(100);
       VBox vb=new VBox(gridPane);
       vb.setAlignment(Pos.CENTER);
        vb.setStyle("-fx-background-color:Transparent");

       
       StackPane stackPane=new StackPane();
       stackPane.getChildren().add(gridPane);
       stackPane.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color:black; -fx-border-width: 2;-fx-padding:100; ");
       stackPane.setMaxWidth(StackPane.USE_PREF_SIZE);
       stackPane.setMaxHeight(StackPane.USE_PREF_SIZE);
       
       
        VBox vb1=new VBox(hbox7,stackPane);
        vb1.setAlignment(Pos.CENTER);
        
        ImageView iv2 = new ImageView("file:imagedemofarmfresh\\src\\main\\resources\\BackgroundForAll.jpg");
                iv2.setFitWidth(Screen.getPrimary().getVisualBounds().getWidth());
                iv2.setFitHeight(Screen.getPrimary().getVisualBounds().getHeight());
                iv2.setPreserveRatio(false);
                StackPane sp2 = new StackPane(iv2, vb1);
            

       Scene sc=new Scene(sp2);
       sc.setFill(Color.rgb(144, 238, 144));
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