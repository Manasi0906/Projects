package com.farmfresh1.Fruits;

import javafx.application.Application;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.scene.paint.Color;
import javafx.scene.text.Font;
import javafx.scene.text.FontWeight;
import javafx.scene.text.Text;
import javafx.stage.Stage;

public class FormNavigationApp extends Application{
    private static Scene scene1;
private static Scene scene2;

@Override
    public void start(Stage primaryStage) {
        primaryStage.setTitle("FarmFresh");
        primaryStage.setWidth(1600);
        primaryStage.setHeight(1000);

        Label name = new Label("FarmFresh");
        name.setFont(new Font(40));

        VBox vb1 = new VBox(name);
        vb1.setAlignment(Pos.CENTER);
        vb1.setStyle("-fx-background-color:rgb(144,238,144)");

        GridPane grid = new GridPane();
        grid.setPadding(new Insets(0));
        grid.setVgap(10);
        grid.setHgap(10);
        grid.setAlignment(Pos.CENTER);
        grid.setStyle("-fx-background-color: rgba(240, 240, 240, 0.8); -fx-border-color: #cccccc; -fx-border-radius: 10; -fx-background-radius: 10;");

        Label title = new Label("Terms and Conditions");
        title.setFont(new Font(30));
        title.setAlignment(Pos.CENTER);

        Text title1 = new Text("Terms and Conditions for Farmers:");
        title1.setFont(new Font(20));
        grid.add(title1, 0, 0);

        Label l1 = new Label("Product Quality:");
        grid.add(l1, 0, 1);
        Text info1 = new Text("Ensure that all products listed are of high quality and meet the standards specified by the platform.\n" +
                "Provide accurate and detailed descriptions of the products, including any organic certifications or other relevant information.\n");
        grid.add(info1, 1, 1);

        Label l2 = new Label("Pricing and Payments:");
        Text info2 = new Text("Set fair and competitive prices for all products.\n" +
                "Agree to the platform’s payment terms and conditions, including any commission or fees charged by the platform.\n");
        grid.add(l2, 0, 2);
        grid.add(info2, 1, 2);

        Label l3 = new Label("Order Fulfillment:");
        Text info3 = new Text("Ensure timely and accurate fulfillment of all orders.\n" +
                "Communicate promptly with buyers or distributors regarding any delays or issues with the orders.\n");
        grid.add(l3, 0, 3);
        grid.add(info3, 1, 3);

        Label l4 = new Label("Compliance:");
        Text info4 = new Text("Comply with all local, state, and federal laws and regulations related to farming, product quality, and food safety.\n" +
                "Ensure that all products are properly packaged and labeled.\n");
        grid.add(l4, 0, 4);
        grid.add(info4, 1, 4);

        Label l5 = new Label("Termination:");
        Text info5 = new Text("The platform reserves the right to terminate the farmer’s account if they violate any terms and conditions,\n provide false information, or receive multiple complaints from buyers.\n");
        grid.add(l5, 0, 5);
        grid.add(info5, 1, 5);

        Text title2 = new Text("Terms and Conditions for Customers (Buyers)\n");
        title2.setFont(new Font(20));
        grid.add(title2, 0, 6);

        Label l6 = new Label("Account Information:");
        Text info6 = new Text("Provide accurate and complete information when creating an account and updating any personal details.\n" +
                "Maintain the confidentiality of account login details and notify the platform of any unauthorized use.\n");
        grid.add(l6, 0, 7);
        grid.add(info6, 1, 7);

        Label l7 = new Label("Order Placement and Payment:");
        Text info7 = new Text("Ensure timely payment for all orders placed through the platform.\n" +
                "Agree to the platform’s payment processing terms and any associated fees.\n");
        grid.add(l7, 0, 8);
        grid.add(info7, 1, 8);

        Label l8 = new Label("Product Receipt and Inspection:");
        Text info8 = new Text("Inspect all products upon receipt and report any issues or discrepancies within 24 hours.\n" +
                "Understand that slight variations in product appearance and quality can occur, especially with natural products.\n");
        grid.add(l8, 0, 9);
        grid.add(info8, 1, 9);

        Label l9 = new Label("Returns and Refunds:");
        Text info9 = new Text("Follow the platform’s return and refund policy, including any timeframes and conditions for eligible returns.\n");
        grid.add(l9, 0, 10);
        grid.add(info9, 1, 10);

        Label l10 = new Label("Compliance:");
        Text info10 = new Text("Use the platform in accordance with all applicable laws and regulations.\nRefrain from engaging in any fraudulent or harmful activities on the platform");
        grid.add(l10, 0, 11);
        grid.add(info10, 1, 11);

        Button nextButton = new Button("Next");
        nextButton.setStyle("-fx-background-color: rgba(144, 238, 144, 0.8); -fx-border-color: #cccccc; -fx-border-radius: 10; -fx-background-radius: 10;");
        nextButton.setTextFill(Color.GREEN);
        nextButton.setAlignment(Pos.CENTER);
        nextButton.setMaxSize(200, 50);
        nextButton.setFont(Font.font("", FontWeight.EXTRA_BOLD, 20));
        nextButton.setOnAction(event -> primaryStage.setScene(scene2));

        VBox vb4 = new VBox(nextButton);
        vb4.setAlignment(Pos.BOTTOM_RIGHT);

        Label lbTitle1 = new Label("FARMFRESH");
        lbTitle1.setFont(Font.font("", FontWeight.EXTRA_BOLD, 50));
        HBox hb1 = new HBox(lbTitle1);
        hb1.setAlignment(Pos.TOP_CENTER);

        VBox vbScene1 = new VBox(30, hb1, grid, vb4);
        vbScene1.setAlignment(Pos.CENTER);
        vbScene1.setPadding(new Insets(20, 30, 20, 30));

        scene1 = new Scene(vbScene1);

        GridPane grid1 = new GridPane();
        grid1.setPadding(new Insets(0));
        grid1.setVgap(10);
        grid1.setHgap(10);
        grid1.setAlignment(Pos.CENTER);
        grid1.setStyle("-fx-background-color: rgba(240, 240, 240, 0.8); -fx-border-color: #cccccc; -fx-border-radius: 10; -fx-background-radius: 10;");

        Text title3 = new Text("Terms and Conditions for Delivery Persons (Distributors)\n");
        title3.setFont(new Font(20));
        grid1.add(title3, 0, 0);

        Label l11 = new Label("Delivery Timeliness:");
        Text info11 = new Text("Ensure timely pickup and delivery of products as per the agreed schedule.\n" +
                "Communicate promptly with farmers and buyers in case of any delays or issues.\n");
        grid1.add(l11, 0, 1);
        grid1.add(info11, 1, 1);

        Label l12 = new Label("Handling and Safety:");
        Text info12 = new Text("Handle all products with care to prevent damage during transit.\n" +
                "Comply with all relevant safety and hygiene standards when handling and transporting products.\n");
        grid1.add(l12, 0, 2);
        grid1.add(info12, 1, 2);

        Label l13 = new Label("Payments:");
        Text info13 = new Text("Agree to the platform’s payment terms and conditions, including any fees or commissions.\n" +
                "Ensure accurate and timely payment processing for services rendered.\n");
        grid1.add(l13, 0, 3);
        grid1.add(info13, 1, 3);

        Label l14 = new Label("Compliance:");
        Text info14 = new Text("Adhere to all local, state, and federal regulations related to transportation and delivery services.\n" +
                "Maintain all necessary licenses and permits required for delivery operations.\n");
        grid1.add(l14, 0, 4);
        grid1.add(info14, 1, 4);

        Label l15 = new Label("Termination:");
        Text info15 = new Text("The platform reserves the right to terminate the distributor’s account if they violate any terms and conditions,\n provide false information, or receive multiple complaints from farmers or buyers.\n");
        grid1.add(l15, 0, 5);
        grid1.add(info15, 1, 5);

        Text title4 = new Text(" General Terms and Conditions\n");
        title4.setFont(new Font(20));
        grid1.add(title4, 0, 6);

        Label l16 = new Label("Privacy and Data Security:");
        Text info16 = new Text("All parties agree to the platform’s privacy policy, including the collection, use, and protection of personal data.\n");
        grid1.add(l16, 0, 7);
        grid1.add(info16, 1, 7);

        Label l17 = new Label("Dispute Resolution:");
        Text info17 = new Text("Any disputes arising from the use of the platform will be resolved through the platform’s dispute resolution process.\n");
        grid1.add(l17, 0, 8);
        grid1.add(info17, 1, 8);

        Label l18 = new Label("Limitation of Liability:");
        Text info18 = new Text("The platform is not liable for any direct, indirect, incidental, or consequential damages arising from the use of the platform.\n");
        grid1.add(l18, 0, 9);
        grid1.add(info18, 1, 9);

        Label l19 = new Label("Amendments:");
        Text info19 = new Text("The platform reserves the right to amend these terms and conditions at any time. Users will be notified of any significant changes.");
        grid1.add(l19, 0, 10);
        grid1.add(info19, 1, 10);

        Button backButton1 = new Button("Back");
        backButton1.setStyle("-fx-background-color: rgba(144, 238, 144, 0.8); -fx-border-color: #cccccc; -fx-border-radius: 10; -fx-background-radius: 10;");
        backButton1.setTextFill(Color.GREEN);
        backButton1.setAlignment(Pos.CENTER);
        backButton1.setMaxSize(200, 50);
        backButton1.setFont(Font.font("", FontWeight.EXTRA_BOLD, 20));
        backButton1.setOnAction(event -> primaryStage.setScene(scene1));

        VBox vb3 = new VBox(backButton1);
        vb3.setAlignment(Pos.BOTTOM_RIGHT);

        Label lbTitle3 = new Label("FARMFRESH");
        lbTitle3.setFont(Font.font("", FontWeight.EXTRA_BOLD, 50));
        HBox hb3 = new HBox(lbTitle3);
        hb3.setAlignment(Pos.TOP_CENTER);

        VBox vbScene3 = new VBox(30, hb3, grid1, vb3);
        vbScene3.setAlignment(Pos.CENTER);
        vbScene3.setPadding(new Insets(20, 300, 20, 300));

        scene2 = new Scene(vbScene3);

        primaryStage.setScene(scene1);
        primaryStage.show();
    }

    
    public static void main(String[] args){
        launch(args);
    }
}

