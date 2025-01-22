package com.farmfresh1.Fruits;
import java.io.File;
import javafx.animation.KeyFrame;
import javafx.animation.Timeline;
import javafx.application.Application;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Cursor;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.ComboBox;
import javafx.scene.control.Label;
import javafx.scene.effect.GaussianBlur;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.StackPane;
import javafx.scene.layout.VBox;
import javafx.scene.media.Media;  
import javafx.scene.media.MediaPlayer;  
import javafx.scene.media.MediaView;
import javafx.scene.paint.Color;
import javafx.scene.paint.ImagePattern;
import javafx.scene.shape.Circle;
import javafx.scene.text.Font;
import javafx.scene.text.FontWeight;
import javafx.stage.Screen;
import javafx.stage.Stage;
import javafx.util.Duration;  
public class video
{  
    // private Stage primaryStage;

    // public void setPrimaryStageScene(Scene sp){
    //     primaryStage.setScene(sp);
    // }

 //  Login_Page obj3=new Login_Page();
  // customer obj4=new customer();
  //delivery_person obj5=new delivery_person();
  //seller obj6=new seller();
    public static void startVideo(Stage primaryStage) throws Exception {  
          Scene scene1,scene2;
       String path = "c:/Users/jadha/Desktop/images/video_pruthviraj.mp4";  
          
        //Instantiating Media class  
        Media media = new Media(new File(path).toURI().toString());

        // Media media=new Media(path); 
          
        //Instantiating MediaPlayer class   
        MediaPlayer mediaPlayer = new MediaPlayer(media);  
          
        //Instantiating MediaView class   
        MediaView mediaView = new MediaView(mediaPlayer);
        mediaView.setFitHeight(1050);
        mediaView.setFitWidth(1900); 
        mediaView.setPreserveRatio(false); 
          
        //by setting this property to true, the Video will be played   
        mediaPlayer.setAutoPlay(true);  
          
        //setting group and scene   
        BorderPane root = new BorderPane(); 
        root.setCenter(mediaView);

        StackPane spp=new StackPane(root);
     //   root.getChildren().add(mediaView);  
         scene1= new Scene(spp,1900,1050);  
        

//login


        GridPane grid1 = new GridPane();
        grid1.setPadding(new Insets(30));
        grid1.setVgap(20);
        grid1.setHgap(20);
        grid1.setAlignment(Pos.CENTER);
        grid1.setPrefWidth(300);
        grid1.setPrefHeight(600);
       
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
        grid1.add(vb1, 0, 0);
        grid1.add(cb1, 1, 0,2,1);

        Label signup = new Label("Sign Up :");
        signup.setFont(Font.font("abc", FontWeight.BOLD, 25));
        ComboBox<String> cb2 = new ComboBox<>();
        cb2.getItems().addAll("Sign Up as Customer", "Sign Up as Seller/Farmer", "Sign up as Delivery person");
        cb2.setMaxWidth(500);
        cb2.setStyle("-fx-background-color: rgba(144, 238, 144, 0.8); -fx-border-color: #cccccc; -fx-border-radius: 10; -fx-background-radius: 10;");
        grid1.add(signup, 0, 1, 1, 1);
        grid1.add(cb2, 1, 1,2,1);
        
        Label login = new Label("Login :");
        login.setFont(Font.font("abc", FontWeight.BOLD, 25));
        ComboBox<String> cb3 = new ComboBox<>();
        cb3.getItems().addAll("Login as Customer", "Login as Seller/Farmer","Login as Delivery person");
        cb3.setMaxWidth(500);
        cb3.setStyle("-fx-background-color: rgba(144, 238, 144, 0.8); -fx-border-color: #cccccc; -fx-border-radius: 10; -fx-background-radius: 10;");
        grid1.add(login, 0, 2, 1, 1);
        grid1.add(cb3, 1, 2, 2, 1);
       
        grid1.setVgap(50);
       
        Button bt2=new Button("LOGIN");
        bt2.setStyle("-fx-background-color: rgba(144, 238, 144, 0.8); -fx-border-color: #cccccc; -fx-border-radius: 10; -fx-background-radius:10;");
        bt2.setTextFill(Color.GREEN);
        bt2.setMaxSize(200, 50);
        bt2.setFont(Font.font("", FontWeight.EXTRA_BOLD, 20));    

        VBox vb11=new VBox(bt2);
        vb11.setAlignment(Pos.BASELINE_RIGHT);
    
       // grid1.add(vb11,0,4,4,1);   
        Button bt1=new Button("SIGNUP");
        bt1.setStyle("-fx-background-color: rgba(144, 238, 144, 0.8); -fx-border-color: #cccccc; -fx-border-radius: 10; -fx-background-radius:10;");
        bt1.setTextFill(Color.GREEN);
        bt1.setMaxSize(200, 50);
        bt1.setFont(Font.font("", FontWeight.EXTRA_BOLD, 20));
        VBox vb12=new VBox(bt1);
        vb12.setAlignment(Pos.BASELINE_LEFT);
        HBox hb1=new HBox(100,vb12,vb11);
        grid1.add(hb1,1,4,4,1);

        VBox layout = new VBox(70);
        layout.getChildren().addAll( grid1);
        layout.setAlignment(Pos.BOTTOM_CENTER);
        layout.setPadding(new Insets(50,300,10,300));


        javafx.geometry.Rectangle2D screenBound = Screen.getPrimary().getVisualBounds();
             grid1.setStyle("-fx-background-color: rgba(240, 240, 240, 0.8); -fx-border-color: #cccccc; -fx-border-radius: 10; -fx-background-radius: 10;");
            
            Image iv = new Image("file:signup\\src\\main\\resources\\logo.jpg");
            Circle cir1=new Circle(300,300,200);
            cir1.setFill(new ImagePattern(iv));
            cir1.setLayoutX(200);

            Image imagebackground=new Image("file:signup\\src\\main\\resources\\delivery_person.png");
           // Image imagebackground=new Image("file:signup\\src\\main\\resources\\delivery_person.png");
            ImageView iv1=new ImageView(imagebackground);
           iv1.setEffect(new GaussianBlur(15));
           
            VBox vbox1=new VBox(cir1,layout);
            vbox1.setAlignment(Pos.CENTER);
          
           
            StackPane sp2 = new StackPane();
            sp2.getChildren().addAll(iv1, vbox1);
           // sp.setBackground(new Background(bgImage));

            Screen screen = Screen.getPrimary();
            javafx.geometry.Rectangle2D bounds = screen.getVisualBounds();
    
            // Set stage to cover the screen
            primaryStage.setX(bounds.getMinX());
            primaryStage.setY(bounds.getMinY());
            primaryStage.setWidth(bounds.getWidth());
            primaryStage.setHeight(bounds.getHeight());
        Scene sc=new Scene(sp2);
        sc.setFill(Color.WHITE);
        sc.setCursor(Cursor.HAND);
        primaryStage.setScene(sc);
        primaryStage.setX(screenBound.getMinX());
        primaryStage.setY(screenBound.getMinY());
        StackPane sppp=new StackPane(sp2);
        
         scene2=new Scene(sppp,1950,1050);

        Timeline timeline = new Timeline(new KeyFrame(
                        Duration.seconds(4),
                        event -> primaryStage.setScene(scene2)
                ));
                timeline.setCycleCount(1);
                timeline.play();
        
        /*        cb3.setOnAction(new EventHandler<ActionEvent>() {

                 @Override
                public void handle(ActionEvent event) {
                    String str1="Login as Customer";
                if(cb2.getItems().add(str1)){
                  
                        bt2.setOnAction(new EventHandler<ActionEvent>() {

                            @Override
                            public void handle(ActionEvent event) {
                                obj3.start(primaryStage); 
                            }
                            
                        });
                        try {
                            //obj3.start(primaryStage);
                        } catch (Exception e) {
                            
                            e.printStackTrace();
                        }

                    }
                }
                
            });

            cb2.setOnAction(new EventHandler<ActionEvent>() {

                @Override
               public void handle(ActionEvent event) {
                   String str2="Sign Up as Customer";
               if(cb2.getItems().add(str2)){
                 
                       bt1.setOnAction(new EventHandler<ActionEvent>() {

                           @Override
                           public void handle(ActionEvent event) {
                               obj5.start(primaryStage); 
                           }
                           
                       });
                       try {
                           //obj3.start(primaryStage);
                       } catch (Exception e) {
                          
                           e.printStackTrace();
                       }

                   }
               }
               
           });

           cb2.setOnAction(new EventHandler<ActionEvent>() {

            @Override
           public void handle(ActionEvent event) {
               String str3="Sign Up as Seller/Farmer";
           if(cb2.getItems().add(str3)){
             
                   bt1.setOnAction(new EventHandler<ActionEvent>() {

                       @Override
                       public void handle(ActionEvent event) {
                           obj6.start(primaryStage); 
                       }
                       
                   });
                   try {
                       //obj3.start(primaryStage);
                   } catch (Exception e) {
                     
                       e.printStackTrace();
                   }

               }
           }
           
       });

       cb2.setOnAction(new EventHandler<ActionEvent>() {

        @Override
       public void handle(ActionEvent event) {
           String str4="Sign Up as Delivery Person";
       if(cb2.getItems().add(str4)){
         
               bt1.setOnAction(new EventHandler<ActionEvent>() {

                   @Override
                   public void handle(ActionEvent event) {
                       obj4.start(primaryStage); 
                   }
                   
               });
               try {
                   //obj3.start(primaryStage);
               } catch (Exception e) {
                   
                   e.printStackTrace();
               }

           }
       }
       
   });

     
    primaryStage.setScene(scene1); 
    bt1.setOnAction(event -> {
        String selectedOption = cb2.getValue();
        if (selectedOption != null) {
            switch (selectedOption) {
                case "Sign Up as Customer":{
                    // System.out.println(customer);
                    System.out.println("c2w - pro");
                    primaryStage.setScene(customer.sc);
                    primaryStage.show();  
                    System.out.println("hello");
                    break;
                }
                case "Sign Up as Seller/Farmer":
                    primaryStage.setScene(seller.scene1);
                    break;
                case "Sign up as Delivery Person":
                    primaryStage.setScene(delivery_person.scene1);
                    break;
            }
        }
    });       
*/
        primaryStage.setScene(scene1);
        primaryStage.setTitle("Playing video");  
        primaryStage.show();  
        mediaPlayer.play();
    }  
public static void main(String[] args) {
    Application.launch(args);
}
} 


