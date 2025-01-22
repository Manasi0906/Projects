package com.farmfresh1.Fruits;

import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Cursor;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Hyperlink;
import javafx.scene.control.Label;
import javafx.scene.control.ScrollPane;
import javafx.scene.control.TextField;
import javafx.scene.effect.DropShadow;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.HBox;
import javafx.scene.layout.StackPane;
import javafx.scene.layout.VBox;
import javafx.scene.paint.Color;
import javafx.scene.paint.ImagePattern;
import javafx.scene.shape.Circle;
import javafx.scene.text.Font;
import javafx.stage.Screen;
import javafx.stage.Stage;

public class LeaderBoard{

    public static Scene sc;

    
    public static void startLeaderBoard(Stage primaryStage) throws Exception {
        primaryStage.setTitle("Service3");
        primaryStage.setWidth(1950);
        primaryStage.setHeight(1040);

        Label title=new Label("FARMFRESH");
        title.setFont(new Font(50));
        title.setAlignment(Pos.CENTER);
        title.setTextFill(Color.BLACK);
        Image image=new Image("file:imagedemofarmfresh/src/main/resources/farmfresh logo.jpg");
        Circle cir=new Circle(250,200,60);
        cir.setFill(new ImagePattern(image));

        HBox hboxlogo=new HBox(cir,title);
        hboxlogo.setAlignment(Pos.CENTER);


        Label label2=new Label("Search for Farmer's here");
        label2.setFont(new Font(30));
        label2.setStyle("-fx-font-weight:bold");
        

        TextField textField1=new TextField();
        textField1.setMaxWidth(300);
        Button button =new Button("Search");
        button.setStyle("-fx-background-color:lightblue");
        Button button2=new Button("Go to Homepage");
        button2.setStyle("-fx-background-color:lightgreen");
        button2.setOnAction(new EventHandler<ActionEvent>() {

            @Override
            public void handle(ActionEvent event) {
                primaryStage.setScene(HomePage.sc);
            }
            
        });


        HBox hbox1=new HBox(10,textField1,button,button2);
        hbox1.setAlignment(Pos.CENTER);
        VBox vbset = new VBox(label2,hbox1);
        vbset.setAlignment(Pos.CENTER);

        
        Image image1=new Image("file:imagedemofarmfresh\\src\\main\\resources\\theUnknown.jpeg");
        Circle cir1 = new Circle(250,200,80); 
        cir1.setStroke(Color.SEAGREEN); 
        cir1.setFill(Color.SNOW); 
        cir1.setEffect(new DropShadow(+25d, 0d, +2d, Color.DARKSEAGREEN));
        cir1.setFill(new ImagePattern(image1));
        Label label1name=new Label("Name : Punam");
        label1name.setFont(new Font(20));
        Label label1mobileno=new Label("Mobile No.:9763362691");
        label1mobileno.setFont(new Font(20));
        Label rating = new Label("Ratings: 4.7");
        rating.setFont(new Font(20));
        Hyperlink hyperlink=new Hyperlink("Click here for more");
        hyperlink.setOnAction(new EventHandler<ActionEvent>() {

            @Override
            public void handle(ActionEvent event) {
                
            }
            
        });
        VBox vboximage1=new VBox(10,label1name,label1mobileno,rating,hyperlink);
        HBox hb=new HBox(30,cir1,vboximage1);
        hb.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color:black; -fx-border-width: 2; -fx-padding: 10;");

        Image image2=new Image("file:imagedemofarmfresh\\src\\main\\resources\\theUnknown.jpeg");
        Circle cir2 = new Circle(250,200,80); 
        cir2.setStroke(Color.SEAGREEN); 
        cir2.setFill(Color.SNOW); 
        cir2.setEffect(new DropShadow(+25d, 0d, +2d, Color.DARKSEAGREEN));
        cir2.setFill(new ImagePattern(image2));
        Label label2name=new Label("Name : Manasi");
        label2name.setFont(new Font(20));
        Label label2mobileno=new Label("Mobile No.:8010367093");
        label2mobileno.setFont(new Font(20));
        Label rating2 = new Label("Ratings: 4.4");
        rating2.setFont(new Font(20));
        Hyperlink hyperlink2=new Hyperlink("Click here for more");
        hyperlink2.setOnAction(new EventHandler<ActionEvent>() {

            @Override
            public void handle(ActionEvent event) {
                
            }
            
        });
        VBox vboximage2=new VBox(10,label2name,label2mobileno,rating2,hyperlink2);
        HBox hb2=new HBox(30,cir2,vboximage2);
        hb2.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color:black; -fx-border-width: 2; -fx-padding: 10;");


        Image image3=new Image("file:imagedemofarmfresh\\src\\main\\resources\\theUnknown.jpeg");
        Circle cir3 = new Circle(250,200,80); 
        cir3.setStroke(Color.SEAGREEN); 
        cir3.setFill(Color.SNOW); 
        cir3.setEffect(new DropShadow(+25d, 0d, +2d, Color.DARKSEAGREEN));
        cir3.setFill(new ImagePattern(image3));
        Label label3name=new Label("Name : Pruthviraj");
        label3name.setFont(new Font(20));
        Label label3mobileno=new Label("Mobile No.:8010367093");
        label3mobileno.setFont(new Font(20));
        Label rating3 = new Label("Ratings: 4.2");
        rating3.setFont(new Font(20));
        Hyperlink hyperlink3=new Hyperlink("Click here for more");
        hyperlink3.setOnAction(new EventHandler<ActionEvent>() {

            @Override
            public void handle(ActionEvent event) {
                
            }
            
        });
        VBox vboximage3=new VBox(10,label3name,label3mobileno,rating3,hyperlink3);
        HBox hb3=new HBox(30,cir3,vboximage3);
        hb3.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color:black; -fx-border-width: 2; -fx-padding: 10;");


        Image image4=new Image("file:imagedemofarmfresh\\src\\main\\resources\\theUnknown.jpeg");
        Circle cir4 = new Circle(250,200,80); 
        cir4.setStroke(Color.SEAGREEN); 
        cir4.setFill(Color.SNOW); 
        cir4.setEffect(new DropShadow(+25d, 0d, +2d, Color.DARKSEAGREEN));
        cir4.setFill(new ImagePattern(image4));
        Label label4name=new Label("Name : Sumit");
        label4name.setFont(new Font(20));
        Label label4mobileno=new Label("Mobile No.:8010367093");
        label4mobileno.setFont(new Font(20));
        Label rating4 = new Label("Ratings: 3.8");
        rating4.setFont(new Font(20));
        Hyperlink hyperlink4=new Hyperlink("Click here for more");
        hyperlink4.setOnAction(new EventHandler<ActionEvent>() {

            @Override
            public void handle(ActionEvent event) {
                
            }
            
        });
        VBox vboximage4=new VBox(10,label4name,label4mobileno,rating4,hyperlink4);
        HBox hb4=new HBox(30,cir4,vboximage4);
        hb4.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color:black; -fx-border-width: 2; -fx-padding: 10;");

        Image image5=new Image("file:imagedemofarmfresh\\src\\main\\resources\\theUnknown.jpeg");
        Circle cir5 = new Circle(250,200,80); 
        cir5.setStroke(Color.SEAGREEN); 
        cir5.setFill(Color.SNOW); 
        cir5.setEffect(new DropShadow(+25d, 0d, +2d, Color.DARKSEAGREEN));
        cir5.setFill(new ImagePattern(image5));
        Label label5name=new Label("Name : Punam");
        label5name.setFont(new Font(20));
        Label label5mobileno=new Label("Mobile No.:9763362691");
        label5mobileno.setFont(new Font(20));
        Label rating5 = new Label("Ratings: 3.7");
        rating5.setFont(new Font(20));
        Hyperlink hyperlink5=new Hyperlink("Click here for more");
        hyperlink5.setOnAction(new EventHandler<ActionEvent>() {

            @Override
            public void handle(ActionEvent event) {
                
            }
            
        });
        VBox vboximage5=new VBox(10,label5name,label5mobileno,rating5,hyperlink5);
        HBox hb5=new HBox(30,cir5,vboximage5);
        hb5.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color:black; -fx-border-width: 2; -fx-padding: 10;");

        Image image6=new Image("file:imagedemofarmfresh\\src\\main\\resources\\theUnknown.jpeg");
        Circle cir6 = new Circle(250,200,80); 
        cir6.setStroke(Color.SEAGREEN); 
        cir6.setFill(Color.SNOW); 
        cir6.setEffect(new DropShadow(+25d, 0d, +2d, Color.DARKSEAGREEN));
        cir6.setFill(new ImagePattern(image6));
        Label label6name=new Label("Name : Manasi");
        label6name.setFont(new Font(20));
        Label label6mobileno=new Label("Mobile No.:8010367093");
        label6mobileno.setFont(new Font(20));
        Label rating6 = new Label("Ratings: 4.4");
        rating6.setFont(new Font(20));
        Hyperlink hyperlink6=new Hyperlink("Click here for more");
        hyperlink6.setOnAction(new EventHandler<ActionEvent>() {

            @Override
            public void handle(ActionEvent event) {
                
            }
            
        });
        VBox vboximage6=new VBox(10,label6name,label6mobileno,rating6,hyperlink6);
        HBox hb6=new HBox(30,cir6,vboximage6);
        hb6.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color:black; -fx-border-width: 2; -fx-padding: 10;");


        Image image7=new Image("file:imagedemofarmfresh\\src\\main\\resources\\theUnknown.jpeg");
        Circle cir7 = new Circle(250,200,80); 
        cir7.setStroke(Color.SEAGREEN); 
        cir7.setFill(Color.SNOW); 
        cir7.setEffect(new DropShadow(+25d, 0d, +2d, Color.DARKSEAGREEN));
        cir7.setFill(new ImagePattern(image7));
        Label label7name=new Label("Name : Pruthviraj");
        label7name.setFont(new Font(20));
        Label label7mobileno=new Label("Mobile No.:8010367093");
        label7mobileno.setFont(new Font(20));
        Label rating7 = new Label("Ratings: 4.2");
        rating7.setFont(new Font(20));
        Hyperlink hyperlink7=new Hyperlink("Click here for more");
        hyperlink7.setOnAction(new EventHandler<ActionEvent>() {

            @Override
            public void handle(ActionEvent event) {
                
            }
            
        });
        VBox vboximage7=new VBox(10,label7name,label7mobileno,rating7,hyperlink7);
        HBox hb7=new HBox(30,cir7,vboximage7);
        hb7.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color:black; -fx-border-width: 2; -fx-padding: 10;");


        Image image8=new Image("file:imagedemofarmfresh\\src\\main\\resources\\theUnknown.jpeg");
        Circle cir8 = new Circle(250,200,80); 
        cir8.setStroke(Color.SEAGREEN); 
        cir8.setFill(Color.SNOW); 
        cir8.setEffect(new DropShadow(+25d, 0d, +2d, Color.DARKSEAGREEN));
        cir8.setFill(new ImagePattern(image8));
        Label label8name=new Label("Name : Sumit");
        label8name.setFont(new Font(20));
        Label label8mobileno=new Label("Mobile No.:8010367093");
        label8mobileno.setFont(new Font(20));
        Label rating8 = new Label("Ratings: 3.8");
        rating8.setFont(new Font(20));
        Hyperlink hyperlink8=new Hyperlink("Click here for more");
        hyperlink8.setOnAction(new EventHandler<ActionEvent>() {

            @Override
            public void handle(ActionEvent event) {
                
            }
            
        });
        VBox vboximage8=new VBox(10,label8name,label8mobileno,rating8,hyperlink8);
        HBox hb8=new HBox(30,cir8,vboximage8);
        hb8.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color:black; -fx-border-width: 2; -fx-padding: 10;");


       
        VBox vbox2=new VBox(10,hboxlogo,vbset);
        vbox2.setLayoutX(20);
        vbox2.setStyle("-fx-background-color:white");


        VBox vbox3=new VBox(20,hb,hb2,hb3,hb4,hb5,hb6,hb7,hb8);
        vbox3.setStyle("-fx-background-color:white");
        vbox3.setStyle("-fx-background-color:white");
        //vbox100.setLayoutX(100);
        vbox3.setPrefWidth(2000);
        vbox3.setAlignment(Pos. CENTER);
        vbox3.setPadding(new Insets(20,560,20,500));

        ScrollPane scroll = new ScrollPane(vbox3);
        VBox vbfinal= new VBox(vbox2,scroll);

        ImageView iv2 = new ImageView("file:imagedemofarmfresh\\src\\main\\resources\\backgroundFor All2.jpg");
                iv2.setFitWidth(Screen.getPrimary().getVisualBounds().getWidth());
                iv2.setFitHeight(Screen.getPrimary().getVisualBounds().getHeight());
                iv2.setPreserveRatio(false);
                StackPane sp2 = new StackPane(iv2, vbfinal);

        sc=new Scene(sp2);
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