package com.farmfresh1.Fruits;

import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.CheckBox;
import javafx.scene.control.Label;
import javafx.scene.control.ScrollPane;
import javafx.scene.image.Image;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.scene.paint.Color;
import javafx.scene.paint.ImagePattern;
import javafx.scene.shape.Circle;
import javafx.scene.text.Font;
import javafx.scene.text.Text;
import javafx.stage.Screen;
import javafx.stage.Stage;

public class TermsAndCondition {

    public static void startTermsAndCondition(Stage primaryStage) {
        primaryStage.setTitle("FarmFresh");
        primaryStage.setWidth(1600);
        primaryStage.setHeight(1000);

        Label title=new Label("FARMFRESH");
        title.setFont(new Font(50));
        title.setAlignment(Pos.CENTER);
        title.setTextFill(Color.BLACK);
        Image image=new Image("file:imagedemofarmfresh/src/main/resources/farmfresh logo.jpg");
        Circle cir1=new Circle(250,200,60);
        cir1.setFill(new ImagePattern(image));

        HBox hbox1=new HBox(cir1,title);
        hbox1.setAlignment(Pos.CENTER);

        Label name1 = new Label("Terms and Conditions:");
        name1.setFont(new Font(30));
        name1.setStyle("-fx-font-weight: bold");

        GridPane grid1 = new GridPane();
        grid1.setPadding(new Insets(0,0,0,10));
        grid1.setVgap(10);
        grid1.setHgap(10);
        //grid1.setAlignment(Pos.CENTER);
        grid1.setStyle("-fx-background-color: rgba(240, 240, 240, 0.8); -fx-border-color: #cccccc; -fx-border-radius: 10; -fx-background-radius: 10;");

        Label title1 = new Label("Terms and Conditions for Farmers:");
        title1.setFont(new Font(20));
        title1.setStyle("-fx-font-weight: bold");

        Label l1 = new Label("Product Quality:");
        l1.setStyle("-fx-font-weight: bold");
        Text info1 = new Text("Ensure that all products listed are of high quality and meet the standards specified by the platform.\n" +
                "Provide accurate and detailed descriptions of the products, including any organic certifications or other relevant information.\n");
        grid1.add(l1, 0, 0);
        grid1.add(info1, 1, 0);

        Label l2 = new Label("Pricing and Payments:");
        l2.setStyle("-fx-font-weight: bold");
        Text info2 = new Text("Set fair and competitive prices for all products.\n" +
                "Agree to the platform’s payment terms and conditions, including any commission or fees charged by the platform.\n");
        grid1.add(l2, 0, 1);
        grid1.add(info2, 1, 1);

        Label l3 = new Label("Order Fulfillment:");
        l3.setStyle("-fx-font-weight: bold");
        Text info3 = new Text("Ensure timely and accurate fulfillment of all orders.\n" +
                "Communicate promptly with buyers or distributors regarding any delays or issues with the orders.\n");
        grid1.add(l3, 0, 2);
        grid1.add(info3, 1, 2);

        Label l4 = new Label("Compliance:");
        l4.setStyle("-fx-font-weight: bold");
        Text info4 = new Text("Comply with all local, state, and federal laws and regulations related to farming, product quality, and food safety.\n" +
                "Ensure that all products are properly packaged and labeled.\n");
        grid1.add(l4, 0, 3);
        grid1.add(info4, 1, 3);

        Label l5 = new Label("Termination:");
        l5.setStyle("-fx-font-weight: bold");
        Text info5 = new Text("The platform reserves the right to terminate the farmer’s account if they violate any terms and conditions,\n provide false information, or receive multiple complaints from buyers.\n");
        grid1.add(l5, 0, 4);
        grid1.add(info5, 1, 4);

        GridPane grid2 = new GridPane();
        grid2.setPadding(new Insets(0,0,0,10));
        grid2.setVgap(10);
        grid2.setHgap(10);
        //grid2.setAlignment(Pos.CENTER);
        grid2.setStyle("-fx-background-color: rgba(240, 240, 240, 0.8); -fx-border-color: #cccccc; -fx-border-radius: 10; -fx-background-radius: 10;");

        Label title2 = new Label("Terms and Conditions for Customers (Buyers):");
        title2.setFont(new Font(20));
        title2.setStyle("-fx-font-weight: bold");

        Label l6 = new Label("Account Information:");
        l6.setStyle("-fx-font-weight: bold");
        Text info6 = new Text("Provide accurate and complete information when creating an account and updating any personal details.\n" +
                "Maintain the confidentiality of account login details and notify the platform of any unauthorized use.\n");
        grid2.add(l6, 0, 0);
        grid2.add(info6, 1, 0);

        Label l7 = new Label("Order Placement and Payment:");
        l7.setStyle("-fx-font-weight: bold");
        Text info7 = new Text("Ensure timely payment for all orders placed through the platform.\n" +
                "Agree to the platform’s payment processing terms and any associated fees.\n");
        grid2.add(l7, 0, 1);
        grid2.add(info7, 1, 1);

        Label l8 = new Label("Product Receipt and Inspection:");
        l8.setStyle("-fx-font-weight: bold");
        Text info8 = new Text("Inspect all products upon receipt and report any issues or discrepancies within 24 hours.\n" +
                "Understand that slight variations in product appearance and quality can occur, especially with natural products.\n");
        grid2.add(l8, 0, 2);
        grid2.add(info8, 1, 2);

        Label l9 = new Label("Returns and Refunds:");
        l9.setStyle("-fx-font-weight: bold");
        Text info9 = new Text("Follow the platform’s return and refund policy, including any timeframes and conditions for eligible returns.\n");
        grid2.add(l9, 0, 3);
        grid2.add(info9, 1, 3);

        Label l10 = new Label("Compliance:");
        l10.setStyle("-fx-font-weight: bold");
        Text info10 = new Text("Use the platform in accordance with all applicable laws and regulations.\nRefrain from engaging in any fraudulent or harmful activities on the platform.");
        grid2.add(l10, 0, 4);
        grid2.add(info10, 1, 4);

        GridPane grid3 = new GridPane();
        grid3.setPadding(new Insets(0,0,0,10));
        grid3.setVgap(10);
        grid3.setHgap(10);
       // grid3.setAlignment(Pos.CENTER);
        grid3.setStyle("-fx-background-color: rgba(240, 240, 240, 0.8); -fx-border-color: #cccccc; -fx-border-radius: 10; -fx-background-radius: 10;");

        Label title3 = new Label("Terms and Conditions for Delivery Persons (Distributors):");
        title3.setFont(new Font(20));
        title3.setStyle("-fx-font-weight: bold");

        Label l11 = new Label("Delivery Timeliness:");
        l11.setStyle("-fx-font-weight: bold");
        Text info11 = new Text("Ensure timely pickup and delivery of products as per the agreed schedule.\n" +
                "Communicate promptly with farmers and buyers in case of any delays or issues.\n");
        grid3.add(l11, 0, 0);
        grid3.add(info11, 1, 0);

        Label l12 = new Label("Handling and Safety:");
        l12.setStyle("-fx-font-weight: bold");
        Text info12 = new Text("Handle all products with care to prevent damage during transit.\n" +
                "Comply with all relevant safety and hygiene standards when handling and transporting products.\n");
        grid3.add(l12, 0, 1);
        grid3.add(info12, 1, 1);

        Label l13 = new Label("Payments:");
        l13.setStyle("-fx-font-weight: bold");
        Text info13 = new Text("Agree to the platform’s payment terms and conditions, including any fees or commissions.\n" +
                "Ensure accurate and timely payment processing for services rendered.\n");
        grid3.add(l13, 0, 2);
        grid3.add(info13, 1, 2);

        Label l14 = new Label("Compliance:");
        l14.setStyle("-fx-font-weight: bold");
        Text info14 = new Text("Adhere to all local, state, and federal regulations related to transportation and delivery services.\n" +
                "Maintain all necessary licenses and permits required for delivery operations.\n");
        grid3.add(l14, 0, 3);
        grid3.add(info14, 1, 3);

        Label l15 = new Label("Termination:");
        l15.setStyle("-fx-font-weight: bold");
        Text info15 = new Text("The platform reserves the right to terminate the distributor’s account if they violate any terms and conditions,\n provide false information, or receive multiple complaints from farmers or buyers.\n");
        grid3.add(l15, 0, 4);
        grid3.add(info15, 1, 4);

        GridPane grid4 = new GridPane();
        grid4.setPadding(new Insets(0,0,0,10));
        grid4.setVgap(10);
        grid4.setHgap(10);
        //grid4.setAlignment(Pos.CENTER);
        grid4.setStyle("-fx-background-color: rgba(240, 240, 240, 0.8); -fx-border-color: #cccccc; -fx-border-radius: 10; -fx-background-radius: 10;");

        Label title4 = new Label("General Terms and Conditions:");
        title4.setFont(new Font(20));
        title4.setStyle("-fx-font-weight: bold");

        Label l16 = new Label("Privacy and Data Security:");
        l16.setStyle("-fx-font-weight: bold");
        Text info16 = new Text("All parties agree to the platform’s privacy policy, including the collection, use, and protection of personal data.\n");
        grid4.add(l16, 0, 0);
        grid4.add(info16, 1, 0);

        Label l17 = new Label("Dispute Resolution:");
        l17.setStyle("-fx-font-weight: bold");
        Text info17 = new Text("Any disputes arising from the use of the platform will be resolved through the platform’s dispute resolution process.\n");
        grid4.add(l17, 0, 1);
        grid4.add(info17, 1, 1);

        Label l18 = new Label("Limitation of Liability:");
        l18.setStyle("-fx-font-weight: bold");
        Text info18 = new Text("The platform is not liable for any direct, indirect, incidental, or consequential damages arising from the use of the platform.\n");
        grid4.add(l18, 0, 2);
        grid4.add(info18, 1, 2);

        Label l19 = new Label("Amendments:");
        l19.setStyle("-fx-font-weight: bold");
        Text info19 = new Text("The platform reserves the right to amend these terms and conditions at any time. Users will be notified of any significant changes.");
        grid4.add(l19, 0, 3);
        grid4.add(info19, 1, 3);

        VBox mainContent = new VBox(30,name1, title1, grid1, title2, grid2, title3, grid3, title4, grid4);
        mainContent.setPadding(new Insets(20,50,20,200));

        CheckBox acceptCheckBox = new CheckBox("I have read and agree to the Terms and Conditions.");
        acceptCheckBox.setStyle("-fx-font-weight: bold");
        VBox checkBoxContainer = new VBox(acceptCheckBox);
        checkBoxContainer.setAlignment(Pos.BOTTOM_LEFT);
        checkBoxContainer.setPadding(new Insets(20,50,20,200));

        VBox contentContainer = new VBox(30, mainContent, checkBoxContainer);
        ScrollPane scroll = new ScrollPane(contentContainer);

        Button sub = new Button("Submit");
        sub.setMaxWidth(100);
        sub.setFont(new Font(20));
        sub.setStyle("-fx-font-weight: bold");
        sub.setStyle("-fx-background-color: rgba(144, 238, 144, 0.8); -fx-border-color: #cccccc; -fx-border-radius: 10; -fx-background-radius: 10;");
        sub.setOnAction(new EventHandler<ActionEvent>() {

            @Override
            public void handle(ActionEvent event) {
                HomePage.startHomePage(primaryStage);
            }
            
        });

        VBox vbScene = new VBox(30, hbox1, scroll,sub);
        vbScene.setAlignment(Pos.CENTER);
        vbScene.setPadding(new Insets(20, 200, 20, 200));

        Scene scene = new Scene(vbScene);

        Screen screen = Screen.getPrimary();
        javafx.geometry.Rectangle2D bounds = screen.getVisualBounds();
        primaryStage.setX(bounds.getMinX());
        primaryStage.setY(bounds.getMinY());
        primaryStage.setWidth(bounds.getWidth());
        primaryStage.setHeight(bounds.getHeight());
        primaryStage.setScene(scene);
        primaryStage.show();
    }

    
}