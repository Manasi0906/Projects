package com.farmfresh1.Fruits;

import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Cursor;
import javafx.scene.Scene;
import javafx.scene.control.ComboBox;
import javafx.scene.control.Label;
import javafx.scene.image.Image;
import javafx.scene.layout.Background;
import javafx.scene.layout.BackgroundImage;
import javafx.scene.layout.BackgroundPosition;
import javafx.scene.layout.BackgroundRepeat;
import javafx.scene.layout.BackgroundSize;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.StackPane;
import javafx.scene.layout.VBox;
import javafx.scene.paint.Color;
import javafx.scene.paint.ImagePattern;
import javafx.scene.shape.Circle;
import javafx.scene.text.Font;
import javafx.scene.text.FontWeight;
import javafx.stage.Screen;
import javafx.stage.Stage;

public class Login extends Application{

    public static Scene sc;
    HomePage obj=new HomePage();
    Fruitspage obj1=new Fruitspage();
    VegetablesPage obj2=new VegetablesPage();
      
    @Override
    public void start(Stage primaryStage) throws Exception {
        primaryStage.setTitle("FarmFresh");
        primaryStage.setWidth(1600);
        primaryStage.setHeight(1000);

        GridPane grid = new GridPane();
        grid.setPadding(new Insets(30));
        grid.setVgap(20);
        grid.setHgap(20);
        grid.setAlignment(Pos.CENTER);
        grid.setPrefWidth(300);
        grid.setPrefHeight(600);
       
        Label lang=new Label("Languages :");
        lang.setFont(Font.font("abc", FontWeight.BOLD, 30));
        ComboBox<String> cb1=new ComboBox<>();
        cb1.getItems().addAll("Marathi","English","Kannada","Hindi","Odia","Bhojapuri","Assamese" ,"Bengali","Bodo","Dogri","Gujarati","Kashmiri","Konkani");
        cb1.setPrefWidth(300);
        cb1.setStyle("-fx-background-color: rgba(144, 238, 144, 0.8); -fx-border-color: #cccccc; -fx-border-radius: 10; -fx-background-radius: 10;");
        HBox vb1=new HBox(lang,cb1);
        vb1.setMaxWidth(1600);
        vb1.setMaxHeight(800);
        vb1.setAlignment(Pos.CENTER);
        grid.add(vb1, 0, 0);
        grid.add(cb1, 1, 0);

        Label signup = new Label("Sign Up :");
        signup.setFont(Font.font("abc", FontWeight.BOLD, 25));
        ComboBox<String> cb2 = new ComboBox<>();
        cb2.getItems().addAll("Sign Up as Customer", "Sign Up as Seller/Farmer", "Sign up as Delivery person");
        cb2.setMaxWidth(500);
        cb2.setStyle("-fx-background-color: rgba(144, 238, 144, 0.8); -fx-border-color: #cccccc; -fx-border-radius: 10; -fx-background-radius: 10;");
        grid.add(signup, 0, 1, 1, 1);
        grid.add(cb2, 1, 1, 1, 1);

        
        Label login = new Label("Login :");
        login.setFont(Font.font("abc", FontWeight.BOLD, 25));
        ComboBox<String> cb3 = new ComboBox<>();
        cb3.getItems().addAll("Login as Customer", "Login as Seller/Farmer","Login as Delivery person");
        cb3.setMaxWidth(500);
        cb3.setStyle("-fx-background-color: rgba(144, 238, 144, 0.8); -fx-border-color: #cccccc; -fx-border-radius: 10; -fx-background-radius: 10;");
        grid.add(login, 0, 2, 1, 1);
        grid.add(cb3, 1, 2, 1, 1);
        cb3.setOnAction(new EventHandler<ActionEvent>() {

            @Override
            public void handle(ActionEvent event) {
                String str1="Login as Customer";
                String str3="Login as Delivery person";
                String str2="Login as Seller/Farmer";
                if(cb3.getItems().add(str1)){
                    
                    try {
                        obj.start(primaryStage);
                    } catch (Exception e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                    }

                }

               
                if(cb3.getItems().add(str2)){
                    
                    try {
                        obj1.start(primaryStage);
                    } catch (Exception e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                    }

                }


                if(cb3.getItems().add(str3)){
                    try {
                        obj2.start(primaryStage);
                    } catch (Exception e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                    }

                }
            }

            
        });
       

        grid.setVgap(50);
        // HBox hb = new HBox();
        // hb.setAlignment(Pos.BOTTOM_CENTER);
        // hb.setPadding(new Insets(50));
        // grid.add(hb,1,1);

        VBox layout = new VBox(70);
        layout.getChildren().addAll( grid);
        layout.setAlignment(Pos.BOTTOM_CENTER);
        layout.setPadding(new Insets(50,300,10,300));

        

        

        javafx.geometry.Rectangle2D screenBound = Screen.getPrimary().getVisualBounds();
             grid.setStyle("-fx-background-color: rgba(240, 240, 240, 0.8); -fx-border-color: #cccccc; -fx-border-radius: 10; -fx-background-radius: 10;");

            Image iv = new Image("file:imagedemofarmfresh/src/main/resources/farmfresh logo.jpg");
            Circle cir1=new Circle(300,300,200);
            cir1.setFill(new ImagePattern(iv));
            cir1.setLayoutX(200);

            VBox vbox1=new VBox(cir1,layout);
            vbox1.setAlignment(Pos.CENTER);

            Image imagebackground=new Image("file:signup\\src\\main\\resources\\C.jpg");

            BackgroundSize backgroundSize = new BackgroundSize(2000, 1200, false, false, false, false);
            

             BackgroundImage bgImage = new BackgroundImage(imagebackground,BackgroundRepeat.NO_REPEAT,BackgroundRepeat.NO_REPEAT,BackgroundPosition.CENTER,backgroundSize);

            StackPane sp = new StackPane();
            sp.getChildren().add(vbox1);
            sp.setBackground(new Background(bgImage));


        sc=new Scene(sp);
        sc.setFill(Color.WHITE);
        sc.setCursor(Cursor.HAND);
        primaryStage.setScene(sc);
        primaryStage.setX(screenBound.getMinX());
        primaryStage.setY(screenBound.getMinY());

        primaryStage.show();
    }
    public static void main(String[] args) {
        Application.launch(args);
    }
    
}

