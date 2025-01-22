package com.farmfresh1.Fruits;

import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.HBox;
import javafx.scene.layout.StackPane;
import javafx.scene.layout.VBox;
import javafx.scene.paint.ImagePattern;
import javafx.scene.shape.Circle;
import javafx.scene.text.Font;
import javafx.stage.Screen;
import javafx.stage.Stage;

public class MilkSubPage{
    public static Scene sc;
    //HomePage objHomePage=new HomePage();


    public static void startMilkSubPage(Stage primaryStage) throws Exception {
        primaryStage.setTitle("Milk&Eggs");
        primaryStage.setWidth(1950);
        primaryStage.setHeight(1040);
        

        Label L1=new Label("FARMFRESH");
        L1.setFont(new Font(50));
        L1.setStyle("-fx-font-weight:bold");
        Image image=new Image("file:imagedemofarmfresh/src/main/resources/farmfresh logo.jpg");
        Circle cir1=new Circle(250,200,60);
        cir1.setFill(new ImagePattern(image));

        HBox hb=new HBox(cir1,L1);
        hb.setStyle("-fx-background-color:teal");
        hb.setAlignment(Pos.CENTER);

        Button B1=new Button(">");
        B1.setOnAction(new EventHandler<ActionEvent>() {

            @Override
            public void handle(ActionEvent event) {
                primaryStage.setScene(HomePage.sc);
            }
            
        });
        

        Image image1=new Image("file:imagedemofarmfresh/src/main/resources/buffalo milk valid.jpg");
        ImageView imageView1=new ImageView(image1);
        imageView1.setFitHeight(300);
        imageView1.setFitWidth(600);
        StackPane stackPane1=new StackPane();
        stackPane1.getChildren().add(imageView1);
        stackPane1.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color: black; -fx-border-width: 2; -fx-padding: 10;");
        stackPane1.setAlignment(Pos.CENTER);
        stackPane1.setMaxWidth(StackPane.USE_PREF_SIZE);
        stackPane1.setMaxHeight(StackPane.USE_PREF_SIZE);
        Label label1=new Label("Buffalo Milk");
        label1.setFont(new Font(30));
        label1.setStyle("-fx-font-weight:bold");
        VBox buffaloVbox=new VBox(10,stackPane1,label1);
        buffaloVbox.setAlignment(Pos.CENTER);

        Image image2=new Image("file:imagedemofarmfresh\\src\\main\\resources\\cow milk.jpeg");
        ImageView imageView2=new ImageView(image2);
        imageView2.setFitHeight(300);
        imageView2.setFitWidth(600);
        StackPane stackPane2=new StackPane();
        stackPane2.getChildren().add(imageView2);
        stackPane2.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color: black; -fx-border-width: 2; -fx-padding: 10;");
        stackPane2.setAlignment(Pos.CENTER);
        stackPane2.setMaxWidth(StackPane.USE_PREF_SIZE);
        stackPane2.setMaxHeight(StackPane.USE_PREF_SIZE);
        Label label2=new Label("Cow Milk");
        label2.setFont(new Font(30));
        label2.setStyle("-fx-font-weight:bold");
        VBox cowVbox=new VBox(10,stackPane2,label2);
        cowVbox.setAlignment(Pos.CENTER);

        VBox vb1=new VBox(50,buffaloVbox,cowVbox);

        Image image3=new Image("file:imagedemofarmfresh\\src\\main\\resources\\Desi eggs.jpeg");
        ImageView imageView3=new ImageView(image3);
        imageView3.setFitHeight(300);
        imageView3.setFitWidth(600);
        StackPane stackPane3=new StackPane();
        stackPane3.getChildren().add(imageView3);
        stackPane3.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color: black; -fx-border-width: 2; -fx-padding: 10;");
        stackPane3.setAlignment(Pos.CENTER);
        stackPane3.setMaxWidth(StackPane.USE_PREF_SIZE);
        stackPane3.setMaxHeight(StackPane.USE_PREF_SIZE);
        Label label3=new Label("Desi Eggs");
        label3.setFont(new Font(30));
        label3.setStyle("-fx-font-weight:bold");
        VBox desiVbox=new VBox(10,stackPane3,label3);
        desiVbox.setAlignment(Pos.CENTER);

        Image image4=new Image("file:imagedemofarmfresh\\src\\main\\resources\\Hybrid eggs.jpg");
        ImageView imageView4=new ImageView(image4);
        imageView4.setFitHeight(300);
        imageView4.setFitWidth(600);
        StackPane stackPane4=new StackPane();
        stackPane4.getChildren().add(imageView4);
        stackPane4.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color: black; -fx-border-width: 2; -fx-padding: 10;");
        stackPane4.setAlignment(Pos.CENTER);
        stackPane4.setMaxWidth(StackPane.USE_PREF_SIZE);
        stackPane4.setMaxHeight(StackPane.USE_PREF_SIZE);
        Label label4=new Label("Hybrid Eggs");
        label4.setFont(new Font(30));
        label4.setStyle("-fx-font-weight:bold");
        VBox hybridVbox=new VBox(10,stackPane4,label4);
        hybridVbox.setAlignment(Pos.CENTER);

        VBox vb2=new VBox(50,desiVbox,hybridVbox);

        HBox hb2=new HBox(100,vb1,vb2);
        hb2.setAlignment(Pos.CENTER);

        VBox finalVBox=new VBox(60,hb,B1,hb2);

        sc=new Scene(finalVBox);
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
