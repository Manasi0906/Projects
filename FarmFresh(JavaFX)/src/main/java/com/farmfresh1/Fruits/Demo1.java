package com.farmfresh1.Fruits;

import javafx.application.Application;
import javafx.scene.Cursor;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.scene.paint.Color;
import javafx.stage.Stage;
  

class Demo1{

    @Override
    public void start(Stage primaryStage) throws Exception {
       
        Label l1=new Label("GOOD MORNING");
        sc = new Scene(l1);
        sc.setFill(Color.WHITE);
        sc.setCursor(Cursor.HAND);
        primaryStage.setScene(sc);

        primaryStage.show();
    }

    public static void main(String[] args) {
        Application.launch(args);
    }

    
}
