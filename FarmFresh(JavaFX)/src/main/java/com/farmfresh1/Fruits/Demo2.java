package com.farmfresh1.Fruits;

import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.event.Event;
import javafx.event.EventHandler;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.ComboBox;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.scene.text.Font;
import javafx.stage.Stage;

public class Demo2 extends Application {
    Profilepage objProfilepage1=new Profilepage();

    @Override
    public void start(Stage primaryStage) throws Exception {
        
        primaryStage.setTitle("Login as a");

        GridPane grid = new GridPane();
        grid.setPadding(new Insets(100));
        grid.setHgap(10);


        Label L1=new Label("Please select your role : ");
        L1.setFont(new Font(20));
        grid.add(L1, 0, 0);
        ComboBox<String> cb=new ComboBox<>();
        cb.getItems().addAll("I am a Customer","I am a Farmer","I am a Delivery Person ");
        cb.setOnAction(new EventHandler<ActionEvent>() {

            @Override
            public void handle(ActionEvent event) {
                String str1="I am a Customer";
                if(cb.getItems().add(str1)){
                    System.out.println("u got a mail");
                    try {
                        objProfilepage1.start(primaryStage);
                    } catch (Exception e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                    }

                }
            }
            
        });
       
        grid.add(cb, 1, 0);
        HBox hb=new HBox(grid);
        hb.setAlignment(Pos.CENTER);
        Scene sc=new Scene(hb,500,200);
        primaryStage.setScene(sc);
        primaryStage.show();

        

    }
    public static void main(String[] args) {
        launch(args);
    }
    
}
