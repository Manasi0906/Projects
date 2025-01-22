package com.farmfresh1.Fruits;

import javafx.application.Application;
import javafx.stage.Stage;

public class demo extends Application {

    @Override
    public void start(Stage primaryStage) throws Exception {
       Login_Controller loginController = new Login_Controller(primaryStage);
       //primaryStage.setScene(loginController.getscene1());
       primaryStage.setTitle("Login");
       primaryStage.show();
    }
    
}