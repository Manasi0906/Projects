

package com.farmfresh1.Fruits;

import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Hyperlink;
import javafx.scene.control.Label;
import javafx.scene.control.ScrollPane;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.HBox;
import javafx.scene.layout.StackPane;
import javafx.scene.layout.VBox;
import javafx.scene.paint.ImagePattern;
import javafx.scene.shape.Circle;
import javafx.scene.text.Font;
import javafx.scene.text.Text;
import javafx.stage.Screen;
import javafx.stage.Stage;

public class AboutUs {
    public static Scene sc;

    
    public static void startAboutUs(Stage primaryStage) {
        primaryStage.setTitle("FarmFresh");
        primaryStage.setWidth(800);
        primaryStage.setHeight(600);

        Label title = new Label("FARMFRESH");
        title.setFont(new Font(50));
        Image image=new Image("file:imagedemofarmfresh/src/main/resources/farmfresh logo.jpg");
            Circle cir1=new Circle(250,200,60);
            cir1.setFill(new ImagePattern(image));

        HBox header = new HBox(cir1,title);
        header.setAlignment(Pos.CENTER);
        header.setPadding(new Insets(20));

        VBox content = new VBox(20);
        content.setPadding(new Insets(20));
        content.setAlignment(Pos.TOP_LEFT);

        Text aboutUsHeader = new Text("About Us");
        aboutUsHeader.setFont(new Font(30));
        aboutUsHeader.setStyle("-fx-font-weight: bold");

        Text aboutUsContent = new Text("At FarmFresh, we believe in empowering farmers and providing customers with fresh, high-quality products at fair prices. \n"
                + "Our platform allows farmers to sell their products directly to customers, ensuring they receive the best possible price for their hard work and dedication.\n "
                + "By cutting out the middleman, we aim to create a more sustainable and equitable food supply chain.");
        aboutUsContent.setFont(new Font(20));

        Text missionHeader = new Text("Our Mission:");
        missionHeader.setFont(new Font(25));
        missionHeader.setStyle("-fx-font-weight: bold");

        Text missionContent = new Text("Our mission is to support local farmers and promote sustainable agriculture. \nWe strive to create a marketplace where farmers can thrive by earning the best price for their products,\n and where customers can enjoy fresh, healthy food sourced directly from the farm.");
        missionContent.setFont(new Font(20));

        Text contactHeader = new Text("Contact Us:");
        contactHeader.setFont(new Font(25));
        contactHeader.setStyle("-fx-font-weight: bold");

        Text contactContent = new Text("We'd love to hear from you! Whether you have questions, feedback, feel free to get in touch with us.\n\n"
                + "Email: farmfresh@gmail.com\n"
                + "Phone: (123) 456-7890\n"
                + "Address: 123 FarmFresh, Pune\n\n"
                + "You can also connect with us on social media:\n");

        Hyperlink link1 = new Hyperlink("Instagram");
        Hyperlink link2 = new Hyperlink("Facebook");
        Hyperlink link3 = new Hyperlink("Twitter");
        link1.setFont(new Font(20));
        link1.setStyle("-fx-font-weight: bold");
        link2.setFont(new Font(20));
        link2.setStyle("-fx-font-weight: bold");
        link3.setFont(new Font(20));
        link3.setStyle("-fx-font-weight: bold");
        HBox link = new HBox(25,link1,link2,link3);


            contactContent.setFont(new Font(20));

        content.getChildren().addAll(aboutUsHeader, aboutUsContent, missionHeader, missionContent, contactHeader, contactContent,link);

        ScrollPane scrollPane = new ScrollPane(content);
        scrollPane.setFitToWidth(true);

        Button sub = new Button("Back");
        sub.setMaxWidth(100);
        sub.setFont(new Font(20));
        sub.setStyle("-fx-font-weight: bold");
        sub.setStyle("-fx-background-color: rgba(144, 238, 144, 0.8); -fx-border-color: #cccccc; -fx-border-radius: 10; -fx-background-radius: 10;");
        sub.setOnAction(new EventHandler<ActionEvent>() {

            @Override
            public void handle(ActionEvent event) {
              primaryStage.setScene(HomePage.sc);
            }
            
        });
        VBox vBoxbutton=new VBox(sub);
        vBoxbutton.setAlignment(Pos.CENTER);

        VBox root = new VBox(header, scrollPane);
        VBox root1=new VBox(20,root,vBoxbutton);
        root.setPadding(new Insets(10,200,10,200));

        ImageView iv2 = new ImageView("file:imagedemofarmfresh\\src\\main\\resources\\backgroundFor All2.jpg");
                iv2.setFitWidth(Screen.getPrimary().getVisualBounds().getWidth());
                iv2.setFitHeight(Screen.getPrimary().getVisualBounds().getHeight());
                iv2.setPreserveRatio(false);
                StackPane sp2 = new StackPane(iv2, root1);

        sc = new Scene(sp2);

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
