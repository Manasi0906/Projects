package com.farmfresh1.Fruits;

import java.util.concurrent.ExecutionException;

import com.farmfresh1.Fruit.DataService;

import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.event.Event;
import javafx.event.EventHandler;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.*;
import javafx.scene.text.Font;
import javafx.scene.text.Text;
import javafx.stage.Screen;
import javafx.stage.Stage;

public class Login_Page {
   
    public static String LOGIN_ID;
    public static String key;
    public static String PASSWORD;
    public static Scene scene;
    private static Stage primaryStage;
    private static Scene userScene;
    private DataService dataService = new DataService(); // Ensure DataService is initialized

    


    public void start(Stage primaryStage) {
        this.primaryStage = primaryStage; // Ensure primaryStage is initialized
        initScenes(primaryStage);
    }

    private void initScenes(Stage primaryStage){
        startLogin_Page(primaryStage);
    }

    public static void startLogin_Page(Stage primaryStage) {
        primaryStage.setTitle("Farm Fresh");

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
        passwordInput.setMaxWidth(500);

        // Login button
        Button loginButton1 = new Button("Login");
        GridPane.setConstraints(loginButton1, 1, 2);
        loginButton1.setMaxWidth(100);
        loginButton1.setStyle("-fx-background-color: rgba(144, 238, 144, 0.8); -fx-border-color: #cccccc; -fx-border-radius: 10; -fx-background-radius: 10;");

        loginButton1.setOnAction(new EventHandler<ActionEvent>() {
            @Override
            public void handle(ActionEvent event) {
                boolean isAuthenticated = handleLogin(loginIdInput.getText(), passwordInput.getText());
                if (isAuthenticated) {
                   HomePage.startHomePage(primaryStage);
                }
              //  loginIdInput.clear();
               // passwordInput.clear();
            }
        });

        // Forget password
        Hyperlink forgetPass = new Hyperlink("Forget Password");
        forgetPass.setFont(new Font(20));
        forgetPass.setOnMouseClicked(new EventHandler<Event>() {
            @Override
            public void handle(Event event) {
                try {
                    Forget_Password.startForget_Password(primaryStage);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        });
        GridPane.setConstraints(forgetPass, 2, 3);

        // Don't have an account label and Sign Up link
        Text noAccountText = new Text("Don't have an account?");
        noAccountText.setFont(new Font(20));
        GridPane.setConstraints(noAccountText, 1, 5);
        Hyperlink signUpLink = new Hyperlink("Sign Up");
        signUpLink.setFont(new Font(20));
        signUpLink.setOnAction(new EventHandler<ActionEvent>() {
            @Override
            public void handle(ActionEvent event) {
                try {
                    video.startVideo(primaryStage);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        });
        GridPane.setConstraints(signUpLink, 2, 5);

        grid.getChildren().addAll(loginIdLabel, loginIdInput, passwordLabel, passwordInput, loginButton1, forgetPass, noAccountText, signUpLink);

        VBox layout = new VBox(10);
        layout.getChildren().addAll(titleLabel, grid);
        layout.setAlignment(Pos.CENTER);
        layout.setPadding(new Insets(20, 600, 10, 600));

        // Get screen bounds excluding taskbar
        javafx.geometry.Rectangle2D screenBounds = Screen.getPrimary().getVisualBounds();

        // background image
        ImageView background = new ImageView(new Image("file:imagedemofarmfresh\\src\\main\\resources\\background for signup.jpg"));
        background.setFitWidth(screenBounds.getWidth());
        background.setFitHeight(screenBounds.getHeight());
        background.setPreserveRatio(false);

        StackPane root = new StackPane();
        root.getChildren().addAll(background, layout);

        scene = new Scene(root, screenBounds.getWidth(), screenBounds.getHeight());
        primaryStage.setScene(scene);
        primaryStage.setX(screenBounds.getMinX());
        primaryStage.setY(screenBounds.getMinY());
        primaryStage.show();
    }
    private static boolean handleLogin(String username, String password) {
        DataService dataService = new DataService();
        try {
            if (dataService.authenticateUser(username, password, password, password, null, null, password)) {
                key = username;
                
                System.out.println("You are in!");
                //HomePage.startHomePage(primaryStage);
                try {
                    HomePage.startHomePage(primaryStage);
                } catch (Exception e) {
                    // TODO Auto-generated catch block
                    System.out.println("Print hot nahi");
                }                
                // Ensure userScene is properly initialized before use
                // if (userScene == null) {
                //     userScene = new Scene(new VBox(), 800, 600); // Placeholder scene, replace with actual user dashboard scene
                // }
                // primaryStage.setScene(userScene);
                // primaryStage.setTitle("User Dashboard");
            } else {
                System.out.println("Invalid Credentials");
                key = null;
            }
        } catch (ExecutionException | InterruptedException ex) {
            ex.printStackTrace();
        }
        return false;
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
    
}
