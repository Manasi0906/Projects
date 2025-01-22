package com.farmfresh1.Fruits;


import javafx.application.Application;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.layout.*;
import javafx.scene.text.Font;
import javafx.stage.Stage;

public class DeliveryPersonProfile extends Application {

    @Override
    public void start(Stage primaryStage) {
        primaryStage.setTitle("Delivery Person Profile");

        // Personal Information
        VBox personalInfoBox = new VBox(10);
        personalInfoBox.setPadding(new Insets(20));
        personalInfoBox.setAlignment(Pos.CENTER);

        Label personalInfoTitle = new Label("Personal Information");
        personalInfoTitle.setStyle("-fx-font-size: 20px; -fx-font-weight: bold;");
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

        VBox vehicleInfoBox = new VBox(10);
        vehicleInfoBox.setPadding(new Insets(20));
        vehicleInfoBox.setAlignment(Pos.CENTER);

        Label vehicleInfoTitle = new Label("Vehicle Information");
        vehicleInfoTitle.setStyle("-fx-font-size: 20px; -fx-font-weight: bold;");
        vehicleInfoBox.getChildren().add(vehicleInfoTitle);

        TextField vehicleTypeField = new TextField();
        vehicleTypeField.setPromptText("Vehicle Type");
        TextField vehicleRegNumberField = new TextField();
        vehicleRegNumberField.setPromptText("Vehicle Registration Number");
        TextField vehicleCapacityField = new TextField();
        vehicleCapacityField.setPromptText("Vehicle Capacity");
        TextField insuranceDetailsField = new TextField();
        insuranceDetailsField.setPromptText("Insurance Details");

        vehicleInfoBox.getChildren().addAll(vehicleTypeField, vehicleRegNumberField, vehicleCapacityField, insuranceDetailsField);

        
        VBox workScheduleBox = new VBox(10);
        workScheduleBox.setPadding(new Insets(20));
        workScheduleBox.setAlignment(Pos.CENTER);

        Label workScheduleTitle = new Label("Work Schedule");
        workScheduleTitle.setStyle("-fx-font-size: 20px; -fx-font-weight: bold;");
        workScheduleBox.getChildren().add(workScheduleTitle);

        CheckBox availabilityCheckBox = new CheckBox("Available for Delivery");
        TextField preferredAreasField = new TextField();
        preferredAreasField.setPromptText("Preferred Delivery Areas");
        TextField currentStatusField = new TextField();
        currentStatusField.setPromptText("Current Status");

        workScheduleBox.getChildren().addAll(availabilityCheckBox, preferredAreasField, currentStatusField);


        VBox deliveryHistoryBox = new VBox(10);
        deliveryHistoryBox.setPadding(new Insets(20));
        deliveryHistoryBox.setAlignment(Pos.CENTER);

        Label deliveryHistoryTitle = new Label("Delivery History");
        deliveryHistoryTitle.setStyle("-fx-font-size: 20px; -fx-font-weight: bold;");
        deliveryHistoryBox.getChildren().add(deliveryHistoryTitle);

        Label complete = new Label("Completed Deliveries:");
        complete.setFont(new Font(16));
        ListView<String> completedDeliveriesList = new ListView<>();

        Label pending = new Label("Pending Deliveries:");
        pending.setFont(new Font(16));
        ListView<String> pendingDeliveriesList = new ListView<>(); 

        deliveryHistoryBox.getChildren().addAll(complete,completedDeliveriesList,pending, pendingDeliveriesList);

    
        VBox paymentInfoBox = new VBox(10);
        paymentInfoBox.setPadding(new Insets(20));
        paymentInfoBox.setAlignment(Pos.CENTER);

        Label paymentInfoTitle = new Label("Payment Information");
        paymentInfoTitle.setStyle("-fx-font-size: 20px; -fx-font-weight: bold;");
        paymentInfoBox.getChildren().add(paymentInfoTitle);

        TextField bankAccountDetailsField = new TextField();
        bankAccountDetailsField.setPromptText("Bank Account Details");
        Label completepay = new Label("Payment History:");
        completepay.setFont(new Font(16));
        ListView<String> paymentHistoryList = new ListView<>(); 

        paymentInfoBox.getChildren().addAll(bankAccountDetailsField,completepay, paymentHistoryList);

        VBox accountSettingsBox = new VBox(10);
        accountSettingsBox.setPadding(new Insets(20));
        accountSettingsBox.setAlignment(Pos.CENTER);

        Label accountSettingsTitle = new Label("Account Settings");
        accountSettingsTitle.setStyle("-fx-font-size: 20px; -fx-font-weight: bold;");
        accountSettingsBox.getChildren().add(accountSettingsTitle);

        PasswordField currentPasswordField = new PasswordField();
        currentPasswordField.setPromptText("Current Password");
        PasswordField newPasswordField = new PasswordField();
        newPasswordField.setPromptText("New Password");
        Button set = new Button("Set Password");
        set.setFont(new Font(15));
        set.setPrefWidth(150);

        accountSettingsBox.getChildren().addAll(currentPasswordField, newPasswordField, set);

    
        VBox customerSupportBox = new VBox(10);
        customerSupportBox.setPadding(new Insets(20));
        customerSupportBox.setAlignment(Pos.CENTER);

    
        Button logoutButton = new Button("Logout");

    
        VBox mainLayout = new VBox(20);
        mainLayout.setPadding(new Insets(20,400,20,400));
        mainLayout.setAlignment(Pos.CENTER);
        mainLayout.getChildren().addAll(personalInfoBox,vehicleInfoBox,workScheduleBox,deliveryHistoryBox,paymentInfoBox,accountSettingsBox,customerSupportBox,logoutButton);

        // Adding ScrollPane
        ScrollPane scrollPane = new ScrollPane(mainLayout);
        scrollPane.setFitToWidth(true);

        Scene scene = new Scene(scrollPane);
        primaryStage.setScene(scene);
        primaryStage.show();
    }

    public static void main(String[] args) {
        launch(args);
    }
}