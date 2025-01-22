package com.farmfresh1.Fruits;

import java.io.File;
import javafx.animation.KeyFrame;
import javafx.animation.Timeline;
import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.event.Event;
import javafx.event.EventHandler;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Cursor;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.ComboBox;
import javafx.scene.control.Hyperlink;
import javafx.scene.control.Label;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;
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
import javafx.scene.text.Text;
import javafx.stage.Screen;
import javafx.stage.Stage;
import javafx.util.Duration;

public class Login_Controller{
    private Stage primaryStage;
    private Scene scene1;
    private Scene scene2;
    private String LOGIN_ID;
    private String PASSWORD;
    Signup_Seller obj1=new Signup_Seller();
    Login_Page objLogin_Page=new Login_Page();


    public Login_Controller(Stage primarystage) {
        this.primaryStage = primarystage;
        initscene1();
        initscene2();
        primarystage.setScene(scene1);
        primarystage.show();
    }

    private void initscene1() {
        String path = "imagedemofarmfresh\\src\\main\\resources\\video_pruthviraj.mp4";

        // Instantiating Media class
        Media media = new Media(new File(path).toURI().toString());

        // Media media=new Media(path);

        // Instantiating MediaPlayer class
        MediaPlayer mediaPlayer = new MediaPlayer(media);

        // Instantiating MediaView class
        MediaView mediaView = new MediaView(mediaPlayer);
        mediaView.setFitHeight(1050);
        mediaView.setFitWidth(1900);
        mediaView.setPreserveRatio(false);

        // by setting this property to true, the Video will be played
        mediaPlayer.setAutoPlay(true);

        // setting group and scene
        BorderPane root = new BorderPane();
        root.setCenter(mediaView);

        StackPane spp = new StackPane(root);
        // root.getChildren().add(mediaView);
        mediaPlayer.play();
        scene1 = new Scene(spp, 1900, 1050);

    }

    private void initscene2() {
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
            
            Image iv = new Image("file:imagedemofarmfresh/src/main/resources/farmfresh logo.jpg");
            Circle cir1=new Circle(300,300,200);
            cir1.setFill(new ImagePattern(iv));
            cir1.setLayoutX(200);

            Image imagebackground=new Image("file:imagedemofarmfresh\\src\\main\\resources\\delivery_person.png");
           // Image imagebackground=new Image("file:signup\\src\\main\\resources\\delivery_person.png");
            ImageView iv1=new ImageView(imagebackground);
           iv1.setEffect(new GaussianBlur(15));
           
            VBox vbox1=new VBox(cir1,layout);
            vbox1.setAlignment(Pos.CENTER);
          
           
            StackPane sp2 = new StackPane();
            sp2.getChildren().addAll(iv1, vbox1);
           // sp.setBackground(new Background(bgImage));

           bt1.setOnAction(event -> {
            String selectedOption = cb2.getValue();
            if (selectedOption != null) {
                switch (selectedOption) {
                    case "Sign Up as Customer":
                       // primaryStage.setScene(Signup_Customer.sc);
                        try {
                            Signup_Customer.startSignup_Customer(primaryStage);
                        } catch (Exception e) {
                            // TODO Auto-generated catch block
                            e.printStackTrace();
                        }
                        System.out.println("hello");
                        break;
                    case "Sign Up as Seller/Farmer":
                        Signup_Seller.startSignup_Seller(primaryStage);
                        System.out.println("hello!");
                        break;
                    case "Sign up as Delivery person":
                        Signup_DeliveryPerson.startSignup_DeliveryPerson(primaryStage);
                        System.out.println("hello!!");
                        break;
                }
            }
        });

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

      //  primaryStage.setScene(scene1);
        primaryStage.setTitle("Playing video");  
        //primaryStage.show();  
      

        bt2.setOnAction(new EventHandler<ActionEvent>() {

            @Override
            public void handle(ActionEvent event) {
                showscene();

            }

            private void showscene() {
                
            // login form
            GridPane grid = new GridPane();
            grid.setPadding(new Insets(150, 50, 10, 50));
            grid.setVgap(40);
            grid.setHgap(20);
            grid.setAlignment(Pos.CENTER);
            grid.setStyle("-fx-background-color: rgba(240, 240, 240, 0.8); -fx-border-color: #cccccc; -fx-border-radius: 10; -fx-background-radius: 10;");
            

            // Title
            Label titleLabel = new Label("FARMFRESH");
            titleLabel.setStyle("-fx-font-size: 52px; -fx-font-weight: bold;");

            // Login ID label and text field
            Label loginIdLabel = new Label("Login ID:");
            GridPane.setConstraints(loginIdLabel, 0, 0);
            loginIdLabel.setStyle("-fx-font-size: 20px;  -fx-font-weight: bold");
            TextField loginIdInput = new TextField();
            GridPane.setConstraints(loginIdInput, 1, 0);
            loginIdInput.setMaxWidth(500);

            // Password label and password field
            Label passwordLabel = new Label("Password:");
            GridPane.setConstraints(passwordLabel, 0, 1);
            passwordLabel.setStyle("-fx-font-size: 20px;  -fx-font-weight: bold");
            PasswordField passwordInput = new PasswordField();
            GridPane.setConstraints(passwordInput, 1, 1);
            passwordLabel.setMaxWidth(500);

            // Login button
            Button loginButton= new Button("Login");
            GridPane.setConstraints(loginButton, 1, 2);
            loginButton.setMaxWidth(100);
            loginButton.setStyle("-fx-background-color: rgba(144, 238, 144, 0.8); -fx-border-color: #cccccc; -fx-border-radius: 10; -fx-background-radius: 10;");

            // loginButton.setOnAction(e -> {
            //     String enteredLoginId = loginIdInput.getText();
            //     String enteredPassword = passwordInput.getText();

            //     if (LOGIN_ID.equals(enteredLoginId) && PASSWORD.equals(enteredPassword)) {
            //     //    homepage();
            //     } else {
            //         Alert alert = new Alert(Alert.AlertType.ERROR);
            //         alert.setTitle("Login Failed");
            //         alert.setContentText("Invalid login ID or password.");
            //         alert.showAndWait();
            //     }
            // });

            loginButton.setOnAction(event -> {
                String selectedOption = cb3.getValue();
                if (selectedOption != null) {
                    switch (selectedOption) {
                        case "Login as Customer":
                           // primaryStage.setScene(Signup_Customer.sc);
                            objLogin_Page.start(primaryStage);
                         //   System.out.println("hello");
                            break;
                        case "Login as Seller/Farmer":
                            objLogin_Page.start(primaryStage);
                            System.out.println("hello!");
                            break;
                        case "Login as Delivery person":
                            objLogin_Page.start(primaryStage);
                            System.out.println("hello!!");
                            break;
                    }
                }
            });


            //foget password
            Hyperlink forgetPass = new Hyperlink("Forget Password");
            forgetPass.setFont(new Font(20));
            GridPane.setConstraints(forgetPass, 2, 3);
            //forgetPass.setOnAction(new EventHandler<ActionEvent>() {

            //     @Override
            //     public void handle(ActionEvent event) {
            //             try {
            //                 obj1.start(primaryStage);
            //             } catch (Exception e) {
                            
            //                 e.printStackTrace();
            //             }
            //     }
                
            // });
            forgetPass.setOnAction(new EventHandler<ActionEvent>() {

                @Override
                public void handle(ActionEvent event) {
                   try {
                    Forget_Password.startForget_Password(primaryStage);
                } catch (Exception e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
                }
                
            });

            

            // Don't have an account label and Sign Up link
            Text noAccountText = new Text("Don't have an account?");
            noAccountText.setFont(new Font(20));
            GridPane.setConstraints(noAccountText, 1, 5);
            Hyperlink signUpLink = new Hyperlink("Sign Up");
            signUpLink.setFont(new Font(20));
            
            GridPane.setConstraints(signUpLink, 2, 5);

            /*signUpLink.setOnAction(new EventHandler<ActionEvent>() {

                @Override
        public vo   id handle(ActionEvent event) {
                primaryStage.setScene(video.scene1);

                }
                
            });*/


            grid.getChildren().addAll(loginIdLabel, loginIdInput, passwordLabel, passwordInput, loginButton,forgetPass,noAccountText,signUpLink);


            VBox layout = new VBox(10);
            layout.getChildren().addAll(titleLabel, grid);
            layout.setAlignment(Pos.CENTER);
            layout.setPadding(new Insets(20,600,10,600));

            // Get screen bounds excluding taskbar
            javafx.geometry.Rectangle2D screenBounds = Screen.getPrimary().getVisualBounds();

            // background image
            ImageView background = new ImageView(new Image("file:imagedemofarmfresh\\src\\main\\resources\\background for signup.jpg"));
            background.setFitWidth(screenBounds.getWidth());
            background.setFitHeight(screenBounds.getHeight());
            background.setPreserveRatio(false);

            StackPane root = new StackPane();
            root.getChildren().addAll(background, layout);

            Scene scene = new Scene(root, screenBounds.getWidth(), screenBounds.getHeight());
            primaryStage.setScene(scene);
            primaryStage.setX(screenBounds.getMinX());
            primaryStage.setY(screenBounds.getMinY());
            primaryStage.show();
            }

            public Parent getView() {
                
                throw new UnsupportedOperationException("Unimplemented method 'getView'");
            }

            public Object getField1Value() {
                
                throw new UnsupportedOperationException("Unimplemented method 'getField1Value'");
            }

            public void setField1Value(Object field1Value) {
                
                throw new UnsupportedOperationException("Unimplemented method 'setField1Value'");
            }
        });
        

}   
            


    
}

/*
 * 
 * private void initscenes() {
 * Scene scene1,scene2;
 * String path = "c:/Users/jadha/Desktop/images/video_pruthviraj.mp4";
 * 
 * //Instantiating Media class
 * Media media = new Media(new File(path).toURI().toString());
 * 
 * // Media media=new Media(path);
 * 
 * //Instantiating MediaPlayer class
 * MediaPlayer mediaPlayer = new MediaPlayer(media);
 * 
 * //Instantiating MediaView class
 * MediaView mediaView = new MediaView(mediaPlayer);
 * mediaView.setFitHeight(1050);
 * mediaView.setFitWidth(1900);
 * mediaView.setPreserveRatio(false);
 * 
 * //by setting this property to true, the Video will be played
 * mediaPlayer.setAutoPlay(true);
 * 
 * //setting group and scene
 * BorderPane root = new BorderPane();
 * root.setCenter(mediaView);
 * 
 * StackPane spp=new StackPane(root);
 * // root.getChildren().add(mediaView);
 * scene1= new Scene(spp,1900,1050);
 * 
 * 
 * //login
 * 
 * 
 * GridPane grid1 = new GridPane();
 * grid1.setPadding(new Insets(30));
 * grid1.setVgap(20);
 * grid1.setHgap(20);
 * grid1.setAlignment(Pos.CENTER);
 * grid1.setPrefWidth(300);
 * grid1.setPrefHeight(600);
 * 
 * Label lang=new Label("Languages :");
 * lang.setFont(Font.font("abc", FontWeight.BOLD, 30));
 * ComboBox<String> cb1=new ComboBox<>();
 * cb1.getItems().addAll("Marathi","English","Kannada","Hindi","Odia",
 * "Bhojapuri","Assamese"
 * ,"Bengali","Bodo","Dogri","Gujarati","Kashmiri","Konkani");
 * cb1.setPrefWidth(300);
 * cb1.
 * setStyle("-fx-background-color: rgba(144, 238, 144, 0.8); -fx-border-color: #cccccc; -fx-border-radius: 10; -fx-background-radius: 10;"
 * );
 * HBox vb1=new HBox(lang,cb1);
 * vb1.setMaxWidth(1600);
 * vb1.setMaxHeight(800);
 * vb1.setAlignment(Pos.CENTER);
 * grid1.add(vb1, 0, 0);
 * grid1.add(cb1, 1, 0,2,1);
 * 
 * Label signup = new Label("Sign Up :");
 * signup.setFont(Font.font("abc", FontWeight.BOLD, 25));
 * ComboBox<String> cb2 = new ComboBox<>();
 * cb2.getItems().addAll("Sign Up as Customer", "Sign Up as Seller/Farmer",
 * "Sign up as Delivery person");
 * cb2.setMaxWidth(500);
 * cb2.
 * setStyle("-fx-background-color: rgba(144, 238, 144, 0.8); -fx-border-color: #cccccc; -fx-border-radius: 10; -fx-background-radius: 10;"
 * );
 * grid1.add(signup, 0, 1, 1, 1);
 * grid1.add(cb2, 1, 1,2,1);
 * 
 * Label login = new Label("Login :");
 * login.setFont(Font.font("abc", FontWeight.BOLD, 25));
 * ComboBox<String> cb3 = new ComboBox<>();
 * cb3.getItems().addAll("Login as Customer",
 * "Login as Seller/Farmer","Login as Delivery person");
 * cb3.setMaxWidth(500);
 * cb3.
 * setStyle("-fx-background-color: rgba(144, 238, 144, 0.8); -fx-border-color: #cccccc; -fx-border-radius: 10; -fx-background-radius: 10;"
 * );
 * grid1.add(login, 0, 2, 1, 1);
 * grid1.add(cb3, 1, 2, 2, 1);
 * 
 * grid1.setVgap(50);
 * 
 * Button bt2=new Button("LOGIN");
 * bt2.
 * setStyle("-fx-background-color: rgba(144, 238, 144, 0.8); -fx-border-color: #cccccc; -fx-border-radius: 10; -fx-background-radius:10;"
 * );
 * bt2.setTextFill(Color.GREEN);
 * bt2.setMaxSize(200, 50);
 * bt2.setFont(Font.font("", FontWeight.EXTRA_BOLD, 20));
 * 
 * VBox vb11=new VBox(bt2);
 * vb11.setAlignment(Pos.BASELINE_RIGHT);
 * 
 * // grid1.add(vb11,0,4,4,1);
 * Button bt1=new Button("SIGNUP");
 * bt1.
 * setStyle("-fx-background-color: rgba(144, 238, 144, 0.8); -fx-border-color: #cccccc; -fx-border-radius: 10; -fx-background-radius:10;"
 * );
 * bt1.setTextFill(Color.GREEN);
 * bt1.setMaxSize(200, 50);
 * bt1.setFont(Font.font("", FontWeight.EXTRA_BOLD, 20));
 * VBox vb12=new VBox(bt1);
 * vb12.setAlignment(Pos.BASELINE_LEFT);
 * HBox hb1=new HBox(100,vb12,vb11);
 * grid1.add(hb1,1,4,4,1);
 * 
 * VBox layout = new VBox(70);
 * layout.getChildren().addAll( grid1);
 * layout.setAlignment(Pos.BOTTOM_CENTER);
 * layout.setPadding(new Insets(50,300,10,300));
 * 
 * 
 * javafx.geometry.Rectangle2D screenBound =
 * Screen.getPrimary().getVisualBounds();
 * grid1.
 * setStyle("-fx-background-color: rgba(240, 240, 240, 0.8); -fx-border-color: #cccccc; -fx-border-radius: 10; -fx-background-radius: 10;"
 * );
 * 
 * Image iv = new Image("file:signup\\src\\main\\resources\\logo.jpg");
 * Circle cir1=new Circle(300,300,200);
 * cir1.setFill(new ImagePattern(iv));
 * cir1.setLayoutX(200);
 * 
 * Image imagebackground=new
 * Image("file:signup\\src\\main\\resources\\delivery_person.png");
 * // Image imagebackground=new
 * Image("file:signup\\src\\main\\resources\\delivery_person.png");
 * ImageView iv1=new ImageView(imagebackground);
 * iv1.setEffect(new GaussianBlur(15));
 * 
 * VBox vbox1=new VBox(cir1,layout);
 * vbox1.setAlignment(Pos.CENTER);
 * 
 * 
 * StackPane sp2 = new StackPane();
 * sp2.getChildren().addAll(iv1, vbox1);
 * // sp.setBackground(new Background(bgImage));
 * 
 * Screen screen = Screen.getPrimary();
 * javafx.geometry.Rectangle2D bounds = screen.getVisualBounds();
 * 
 * // Set stage to cover the screen
 * primaryStage.setX(bounds.getMinX());
 * primaryStage.setY(bounds.getMinY());
 * primaryStage.setWidth(bounds.getWidth());
 * primaryStage.setHeight(bounds.getHeight());
 * Scene sc=new Scene(sp2);
 * sc.setFill(Color.WHITE);
 * sc.setCursor(Cursor.HAND);
 * primaryStage.setScene(sc);
 * primaryStage.setX(screenBound.getMinX());
 * primaryStage.setY(screenBound.getMinY());
 * StackPane sppp=new StackPane(sp2);
 * 
 * scene2=new Scene(sppp,1950,1050);
 * 
 * Timeline timeline = new Timeline(new KeyFrame(
 * Duration.seconds(4),
 * event -> primaryStage.setScene(scene2)
 * ));
 * timeline.setCycleCount(1);
 * timeline.play();
 * 
 * // primaryStage.setScene(scene1);
 * primaryStage.setTitle("Playing video");
 * //primaryStage.show();
 * mediaPlayer.play();
 * 
 * bt2.setOnAction(new EventHandler<ActionEvent>() {
 * 
 * @Override
 * public void handle(ActionEvent event) {
 * showscene();
 * 
 * }
 * 
 * private void showscene() {
 * 
 * }
 * 
 * });
 * 
 * 
 * }
 * 
 * 
 * public static void main(String[] args) {
 * Application.launch(args);
 * }
 * }
 * 
 * 
 * 
 * 
 */