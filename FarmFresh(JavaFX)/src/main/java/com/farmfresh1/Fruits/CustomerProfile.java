package com.farmfresh1.Fruits;

import javafx.application.Application;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.layout.*;
import javafx.scene.text.Font;
import javafx.stage.Screen;
import javafx.stage.Stage;

public class CustomerProfile{

    public static void startCustomerProfile(Stage primaryStage) {
        primaryStage.setTitle("Customer Profile");

    
        VBox personalInfoBox = new VBox(10);
        personalInfoBox.setPadding(new Insets(20));
        personalInfoBox.setAlignment(Pos.CENTER);

        Label personalInfoTitle = new Label("Personal Information");
        personalInfoTitle.setStyle("-fx-font-size: 30px; -fx-font-weight: bold;");
        personalInfoBox.getChildren().add(personalInfoTitle);

        TextField nameField = new TextField();
        nameField.setPromptText("Full Name");
        TextField emailField = new TextField();
        emailField.setPromptText("Email");
        TextField phoneField = new TextField();
        phoneField.setPromptText("Phone Number");
        DatePicker dobPicker = new DatePicker();
        dobPicker.setPromptText("Date of Birth");

        personalInfoBox.getChildren().addAll(nameField, emailField, phoneField, dobPicker);

        // Address Information
        VBox addressInfoBox = new VBox(10);
        addressInfoBox.setPadding(new Insets(20));
        addressInfoBox.setAlignment(Pos.CENTER);

        Label addressInfoTitle = new Label("Address Information");
        addressInfoTitle.setStyle("-fx-font-size: 30px; -fx-font-weight: bold;");
        addressInfoBox.getChildren().add(addressInfoTitle);

        TextArea shippingAddressArea = new TextArea();
        shippingAddressArea.setPromptText("Shipping Address");
        shippingAddressArea.setPrefRowCount(3);
        TextArea billingAddressArea = new TextArea();
        billingAddressArea.setPromptText("Billing Address");
        billingAddressArea.setPrefRowCount(3);

        CheckBox sameAsShippingCheckBox = new CheckBox("Same as Shipping Address");
        sameAsShippingCheckBox.setOnAction(e -> {
            if (sameAsShippingCheckBox.isSelected()) {
                billingAddressArea.setText(shippingAddressArea.getText());
                billingAddressArea.setDisable(true);
            } else {
                billingAddressArea.setDisable(false);
            }
        });

        addressInfoBox.getChildren().addAll(shippingAddressArea, sameAsShippingCheckBox, billingAddressArea);

        // Order History
        VBox orderHistoryBox = new VBox(10);
        orderHistoryBox.setPadding(new Insets(20));
        orderHistoryBox.setAlignment(Pos.CENTER);

        Label orderHistoryTitle = new Label("Order History");
        orderHistoryTitle.setStyle("-fx-font-size: 30px; -fx-font-weight: bold;");
        orderHistoryBox.getChildren().add(orderHistoryTitle);

        TableView<String> orderTable = new TableView<>(); // Placeholder for order history table
        orderHistoryBox.getChildren().add(orderTable);


        // Account Settings
        VBox accountSettingsBox = new VBox(10);
        accountSettingsBox.setPadding(new Insets(20));
        accountSettingsBox.setAlignment(Pos.CENTER);

        Label accountSettingsTitle = new Label("Account Settings");
        accountSettingsTitle.setStyle("-fx-font-size: 30px; -fx-font-weight: bold;");
        accountSettingsBox.getChildren().add(accountSettingsTitle);

        PasswordField currentPasswordField = new PasswordField();
        currentPasswordField.setPromptText("Current Password");
        PasswordField newPasswordField = new PasswordField();
        newPasswordField.setPromptText("New Password");
        Button set = new Button("Set Password");
        set.setFont(new Font(15));
        set.setPrefWidth(150);

        accountSettingsBox.getChildren().addAll(currentPasswordField, newPasswordField, set);

        // Logout
        Button logoutButton = new Button("Logout");
        logoutButton.setPrefWidth(100);
        logoutButton.setFont(new Font(18));

        // Main Layout
        VBox mainLayout = new VBox(20);
        mainLayout.setPadding(new Insets(50,400,50,400));
        mainLayout.setAlignment(Pos.CENTER);
        mainLayout.getChildren().addAll(personalInfoBox, addressInfoBox, orderHistoryBox, accountSettingsBox, logoutButton);

        // Adding ScrollPane
        ScrollPane scrollPane = new ScrollPane(mainLayout);
        scrollPane.setFitToWidth(true);

        Scene scene = new Scene(scrollPane);
        primaryStage.setScene(scene);
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
