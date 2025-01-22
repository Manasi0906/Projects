package com.farmfresh1.Fruits;


import com.farmfresh1.model.Seller;

import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.event.Event;
import javafx.event.EventHandler;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.effect.GaussianBlur;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.*;
import javafx.scene.paint.Color;
import javafx.scene.paint.ImagePattern;
import javafx.scene.shape.Circle;
import javafx.scene.text.Font;
import javafx.stage.Screen;
import javafx.stage.Stage;

public class OrderPage  {

    // Declare scenes as class variables
    private static Scene scene1;
    private static Scene scene2;
    private static Scene scene3;
    private static Scene scene4;
    private static Scene scene5;
    private static Scene scene6;
    private static Scene scene7;

    private Stage primaryStage;

  
    public static void startOrderPage(Stage primaryStage) {
        primaryStage.setWidth(1930);
        primaryStage.setHeight(1060);
        primaryStage.setTitle("Order Process");

        Label titlelogo1=new Label("FARMFRESH");
        titlelogo1.setFont(new Font(50));
        titlelogo1.setAlignment(Pos.CENTER);
        titlelogo1.setTextFill(Color.BLACK);
        Image image1=new Image("file:imagedemofarmfresh/src/main/resources/farmfresh logo.jpg");
        Circle cir1=new Circle(250,200,60);
        cir1.setFill(new ImagePattern(image1));

        HBox hbox1=new HBox(cir1,titlelogo1);
        hbox1.setAlignment(Pos.CENTER);


    
        Label titlelogo2=new Label("FARMFRESH");
        titlelogo2.setFont(new Font(50));
        titlelogo2.setAlignment(Pos.CENTER);
        titlelogo2.setTextFill(Color.BLACK);
        Image image2=new Image("file:imagedemofarmfresh/src/main/resources/farmfresh logo.jpg");
        Circle cir2=new Circle(250,200,60);
        cir2.setFill(new ImagePattern(image2));

        HBox hbox2=new HBox(cir2,titlelogo2);
        hbox2.setAlignment(Pos.CENTER);


        GridPane grid2 = new GridPane();
        grid2.setPadding(new Insets(100, 50, 100, 50));
        grid2.setVgap(40);
        grid2.setHgap(20);
        grid2.setAlignment(Pos.CENTER);
        grid2.setStyle("-fx-background-color: white; -fx-border-color: #cccccc; -fx-border-radius: 10; -fx-background-radius: 10;");
        

        // VBox layout = new VBox(20);
        // layout.setPadding(new Insets(20));
        // layout.setAlignment(Pos.CENTER);
        // Price Details Content
        Label title2 = new Label(" Price Details");
        title2.setStyle("-fx-font-weight: bold");
        title2.setFont(new Font(30));
        grid2.add(title2,0,0);

        Label Label3 = new Label("Quantity:");
        Label3.setStyle("-fx-font-weight: bold");
        Label3.setFont(new Font(20));
        Spinner<Integer> quantitySpinner = new Spinner<>(1, 100, 1);
        grid2.add(Label3, 0, 1);
        grid2.add(quantitySpinner, 1, 1);
        

       Seller seller=new Seller();
        // Unit Price
        Label unitPriceLabel = new Label("Unit Price:");
        unitPriceLabel.setStyle("-fx-font-weight: bold");
        unitPriceLabel.setFont(new Font(20));
        TextField unitPriceField = new TextField(seller.getPrice());
        //HBox unitPriceBox = new HBox(10, unitPriceLabel, unitPriceField);
        grid2.add(unitPriceLabel, 0, 2);
        grid2.add(unitPriceField, 1, 2);

        // Subtotal
        Label subtotalLabel = new Label("Subtotal:");
        subtotalLabel.setStyle("-fx-font-weight: bold");
        subtotalLabel.setFont(new Font(20));
        TextField subtotalField = new TextField();
        subtotalField.setEditable(false); // Calculated based on unit price and quantity
        //HBox subtotalBox = new HBox(10, subtotalLabel, subtotalField);
        grid2.add(subtotalLabel, 0, 3);
        grid2.add(subtotalField, 1, 3);


        // Shipping Charges
        Label shippingLabel = new Label("Shipping Charges:");
        shippingLabel.setStyle("-fx-font-weight: bold");
        shippingLabel.setFont(new Font(20));
        TextField shippingField = new TextField();
        shippingField.setEditable(false);
        //HBox shippingBox = new HBox(10, shippingLabel, shippingField);
        grid2.add(shippingLabel, 0, 4);
        grid2.add(shippingField, 1, 4);

        // Total Price
        Label totalLabel = new Label("Total Price:");
        totalLabel.setStyle("-fx-font-weight: bold");
        totalLabel.setFont(new Font(20));
        TextField totalField = new TextField();
        totalField.setEditable(false); 
        //HBox totalBox = new HBox(10, totalLabel, totalField);
        grid2.add(totalLabel, 0, 5);
        grid2.add(totalField, 1, 5);

        // Back and Next Buttons
        Button backButton1 = new Button("Back");
        backButton1.setOnMouseClicked(new EventHandler<Event>(){

                @Override
                public void handle(Event event) {
                     IndividualProductPage.startIndividualProductPage(primaryStage);
                }
            }); 
        backButton1.setAlignment(Pos.CENTER);
        backButton1.setStyle("-fx-font-weight: bold");
        backButton1.setStyle("-fx-background-color: rgba(144, 238, 144, 0.8); -fx-border-color: #cccccc; -fx-border-radius: 10; -fx-background-radius: 10;");
        backButton1.setPrefWidth(100);
        backButton1.setFont(new Font(20));

        Button nextButton2 = new Button("Next");
        nextButton2.setOnAction(e -> primaryStage.setScene(scene4));
        nextButton2.setAlignment(Pos.CENTER);
        nextButton2.setStyle("-fx-font-weight: bold");
        nextButton2.setStyle("-fx-background-color: rgba(144, 238, 144, 0.8); -fx-border-color: #cccccc; -fx-border-radius: 10; -fx-background-radius: 10;");
        nextButton2.setPrefWidth(100); 
        nextButton2.setFont(new Font(20));

        HBox vb = new HBox(1300,backButton1,nextButton2);
        // backButton1.setAlignment(Pos.CENTER_LEFT);
        // nextButton2.setAlignment(Pos.CENTER_RIGHT);

        VBox vbScene2 = new VBox(30,hbox2, grid2,vb);
        vbScene2.setAlignment(Pos.CENTER);
        vbScene2.setPadding(new Insets(20,200,20,200));

        ImageView iv7 = new ImageView("file:imagedemofarmfresh\\src\\main\\resources\\BackgroundForAll.jpg");
        iv7.setFitWidth(Screen.getPrimary().getVisualBounds().getWidth());
        iv7.setFitHeight(Screen.getPrimary().getVisualBounds().getHeight());
        iv7.setPreserveRatio(false);
        StackPane sp7 = new StackPane(iv7, vbScene2);
        scene2 = new Scene(sp7);


        Label titlelogo3=new Label("FARMFRESH");
        titlelogo3.setFont(new Font(50));
        titlelogo3.setAlignment(Pos.CENTER);
        titlelogo3.setTextFill(Color.BLACK);
        Image image3=new Image("file:imagedemofarmfresh/src/main/resources/farmfresh logo.jpg");
        Circle cir3=new Circle(250,200,60);
        cir3.setFill(new ImagePattern(image3));

        HBox hbox3=new HBox(cir3,titlelogo3);
        hbox3.setAlignment(Pos.CENTER);


        GridPane grid3 = new GridPane();
        grid3.setPadding(new Insets(100, 50, 100, 50));
        grid3.setVgap(40);
        grid3.setHgap(20);
        grid3.setAlignment(Pos.CENTER);
        grid3.setStyle("-fx-background-color: white; -fx-border-color: #cccccc; -fx-border-radius: 10; -fx-background-radius: 10;");
        
        
        Label titlelogo4=new Label("FARMFRESH");
        titlelogo4.setFont(new Font(50));
        titlelogo4.setAlignment(Pos.CENTER);
        titlelogo4.setTextFill(Color.BLACK);
        Image image4=new Image("file:imagedemofarmfresh/src/main/resources/farmfresh logo.jpg");
        Circle cir4=new Circle(250,200,60);
        cir4.setFill(new ImagePattern(image4));
        HBox hbox4=new HBox(cir4,titlelogo4);
        hbox4.setAlignment(Pos.CENTER);


        GridPane grid4 = new GridPane();
        grid4.setPadding(new Insets(100, 50, 100, 50));
        grid4.setVgap(40);
        grid4.setHgap(20);
        grid4.setAlignment(Pos.CENTER);
        grid4.setStyle("-fx-background-color: white; -fx-border-color: #cccccc; -fx-border-radius: 10; -fx-background-radius: 10;");


        Label title4 = new Label(" Payment Options");
        title4.setStyle("-fx-font-weight: bold");
        title4.setFont(new Font(30));
        grid4.add(title4, 0, 0);

        ToggleGroup paymentToggleGroup = new ToggleGroup();

        RadioButton creditCardOption = new RadioButton("Credit Card");
        creditCardOption.setFont(new Font(20));
        creditCardOption.setToggleGroup(paymentToggleGroup);

        RadioButton debitCardOption = new RadioButton("Debit Card");
        debitCardOption.setFont(new Font(20));
        debitCardOption.setToggleGroup(paymentToggleGroup);

        RadioButton paypalOption = new RadioButton("UPI");
        paypalOption.setFont(new Font(20));
        paypalOption.setToggleGroup(paymentToggleGroup);

        RadioButton codOption = new RadioButton("Cash on Delivery");
        codOption.setFont(new Font(20));
        codOption.setToggleGroup(paymentToggleGroup);

        VBox paymentOptionsVBox = new VBox(20, creditCardOption, debitCardOption, paypalOption, codOption);
        grid4.add(paymentOptionsVBox, 0, 1);

        Label addressInfoTitle = new Label("Address Information");
        addressInfoTitle.setStyle("-fx-font-weight: bold");
        addressInfoTitle.setStyle("-fx-font-size: 30px;");
        grid4.add(addressInfoTitle,0,2);

        TextArea shippingAddressArea = new TextArea();
        shippingAddressArea.setPromptText("Shipping Address");
        shippingAddressArea.setStyle("-fx-font-weight: bold");
        shippingAddressArea.setPrefRowCount(3);
        TextArea billingAddressArea = new TextArea();
        billingAddressArea.setPromptText("Billing Address");
        billingAddressArea.setStyle("-fx-font-weight: bold");
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

        grid4.add(shippingAddressArea, 0, 3);
        grid4.add(sameAsShippingCheckBox, 1, 3);
        grid4.add(billingAddressArea, 0, 4);

       

        Button submitButton = new Button("Place Order");
        submitButton.setStyle("-fx-font-weight: bold");
        submitButton.setStyle("-fx-background-color: rgba(144, 238, 144, 0.8); -fx-border-color: #cccccc; -fx-border-radius: 10; -fx-background-radius: 10;");
        submitButton.setAlignment(Pos.CENTER);
        submitButton.setFont(new Font(20));
        submitButton.setPrefWidth(200);

        submitButton.setOnAction(e -> {
            System.out.println("Order placed successfully!!");
            primaryStage.setScene(scene6);});

        
        Button backButton4 = new Button("Back");
        backButton4.setOnAction(e -> primaryStage.setScene(scene4));
        backButton4.setAlignment(Pos.CENTER);
        backButton4.setFont(new Font(20));
        backButton4.setStyle("-fx-font-weight: bold");
        backButton4.setStyle("-fx-background-color: rgba(144, 238, 144, 0.8); -fx-border-color: #cccccc; -fx-border-radius: 10; -fx-background-radius: 10;");
        backButton4.setPrefWidth(100);

        HBox vb6 = new HBox(1300,backButton4,submitButton);


        VBox vbScene4 = new VBox(30,hbox4,grid4,vb6);
        vbScene4.setAlignment(Pos.CENTER);
        vbScene4.setPadding(new Insets(20,200,20,200));

        ImageView iv4 = new ImageView("file:imagedemofarmfresh\\src\\main\\resources\\BackgroundForAll.jpg");
        iv4.setFitWidth(Screen.getPrimary().getVisualBounds().getWidth());
        iv4.setFitHeight(Screen.getPrimary().getVisualBounds().getHeight());
        iv4.setPreserveRatio(false);
        StackPane sp4 = new StackPane(iv4, vbScene4);
        scene4 = new Scene(sp4);


        
        
        Label titlelogo6=new Label("FARMFRESH");
        titlelogo6.setFont(new Font(50));
        titlelogo6.setAlignment(Pos.CENTER);
        titlelogo6.setTextFill(Color.BLACK);
        Image image6=new Image("file:imagedemofarmfresh/src/main/resources/farmfresh logo.jpg");
        Circle cir6=new Circle(250,200,60);
        cir6.setFill(new ImagePattern(image6));
        HBox hbox6=new HBox(cir6,titlelogo6);
        hbox6.setAlignment(Pos.CENTER);
        hbox6.setPadding(new Insets(0,0,200,0));


            Label confirmationLabel = new Label("Thank you for your order!");
            confirmationLabel.setStyle("-fx-font-weight: bold");
            confirmationLabel.setFont(new Font(30));
            Label confirmationDetails = new Label("Your order has been placed successfully.");
            confirmationDetails.setFont(new Font(20));
            confirmationDetails.setStyle("-fx-font-weight: bold");
    
            Button rateButton = new Button("Rate Us");
            rateButton.setFont(new Font(20));
            rateButton.setStyle("-fx-font-weight: bold");
            rateButton.setStyle("-fx-background-color: rgba(144, 238, 144, 0.8); -fx-border-color: #cccccc; -fx-border-radius: 10; -fx-background-radius: 10;");
            rateButton.setPrefWidth(150);
            rateButton.setOnAction(e -> primaryStage.setScene(scene7));
    
            VBox vbScene6 = new VBox(30, hbox6, confirmationLabel, confirmationDetails, rateButton);
            vbScene6.setAlignment(Pos.CENTER);
            vbScene6.setPadding(new Insets(20, 200, 20, 200));
    
            ImageView iv6 = new ImageView("file:imagedemofarmfresh\\src\\main\\resources\\BackgroundForAll.jpg");
                iv6.setFitWidth(Screen.getPrimary().getVisualBounds().getWidth());
                iv6.setFitHeight(Screen.getPrimary().getVisualBounds().getHeight());
                iv6.setPreserveRatio(false);
                StackPane sp6 = new StackPane(iv6, vbScene6);
                scene6 = new Scene(sp6);
            
        
    
        
                GridPane grid7 = new GridPane();
                grid7.setPadding(new Insets(100, 50, 100, 50));
                grid7.setVgap(40);
                grid7.setHgap(20);
                grid7.setAlignment(Pos.CENTER);
                grid7.setStyle("-fx-background-color:white; -fx-border-color: #cccccc; -fx-border-radius: 10; -fx-background-radius: 10;");
                
                Label titlelogo7=new Label("FARMFRESH");
                titlelogo7.setFont(new Font(50));
                titlelogo7.setAlignment(Pos.TOP_CENTER);
                titlelogo7.setTextFill(Color.BLACK);
                Image image7=new Image("file:imagedemofarmfresh/src/main/resources/farmfresh logo.jpg");
                Circle cir7=new Circle(250,200,60);
                cir7.setFill(new ImagePattern(image7));
                HBox hbox7=new HBox(cir7,titlelogo7);
                hbox7.setPadding(new Insets(0,0,200,0));
                hbox7.setAlignment(Pos.TOP_CENTER);
                    
                Label ratingLabel = new Label("Please rate your experience:");
                ratingLabel.setStyle("-fx-font-weight: bold");
                ratingLabel.setFont(new Font(20));

                Slider ratingSlider = new Slider(0, 5, 0);
                ratingSlider.setShowTickMarks(true);
                ratingSlider.setShowTickLabels(true);
                ratingSlider.setMajorTickUnit(1);
                ratingSlider.setBlockIncrement(1);

                VBox ratingVBox = new VBox(20, ratingLabel, ratingSlider);
                grid7.add(ratingVBox, 0, 1);

                Button finishButton = new Button("Finish");
                finishButton.setMaxWidth(100);
                finishButton.setFont(new Font(20));
                finishButton.setStyle("-fx-font-weight: bold");
                finishButton.setStyle("-fx-background-color: rgba(144, 238, 144, 0.8); -fx-border-color: #cccccc; -fx-border-radius: 10; -fx-background-radius: 10;");
                finishButton.setOnAction(e -> {
                     HomePage.startHomePage(primaryStage);
                });
                finishButton.setAlignment(Pos.CENTER);
                finishButton.setPrefWidth(100);

                HBox vbRating = new HBox(1300, finishButton);
            
                VBox vbScene7 = new VBox(30, hbox7, ratingVBox, vbRating);
                vbScene7.setAlignment(Pos.CENTER);
                vbScene7.setPadding(new Insets(20, 500, 20, 500));

                ImageView iv2 = new ImageView("file:imagedemofarmfresh\\src\\main\\resources\\BackgroundForAll.jpg");
                iv2.setFitWidth(Screen.getPrimary().getVisualBounds().getWidth());
                iv2.setFitHeight(Screen.getPrimary().getVisualBounds().getHeight());
                iv2.setPreserveRatio(false);
                StackPane sp2 = new StackPane(iv2, vbScene7);
                scene7 = new Scene(sp2);

                quantitySpinner.valueProperty().addListener((obs, oldValue, newValue) -> updateSubtotal(quantitySpinner, unitPriceField, subtotalField,  shippingField, totalField));
                unitPriceField.textProperty().addListener((obs, oldValue, newValue) -> updateSubtotal(quantitySpinner, unitPriceField, subtotalField, shippingField, totalField));

                
    primaryStage.setScene(scene2);
    primaryStage.show();
    }

    private static void updateSubtotal(Spinner<Integer> quantitySpinner, TextField unitPriceField, TextField subtotalField, TextField shippingField, TextField totalField) {
        try {
            int quantity = quantitySpinner.getValue();
            double unitPrice = Double.parseDouble(unitPriceField.getText());
            double subtotal = quantity * unitPrice;
            subtotalField.setText(String.format("%.2f", subtotal));

    
            // Calculate shipping charges (e.g., a flat rate of $5)
            double shippingCharges = 50.00;
            shippingField.setText(String.format("%.2f", shippingCharges));

            // Calculate total price
            double totalPrice = subtotal +  shippingCharges;
            totalField.setText(String.format("%.2f", totalPrice));

            // Print the subtotal and total price to the console
            System.out.println("Subtotal: " + subtotal);
            System.out.println("Total Price: " + totalPrice);
        } catch (NumberFormatException e) {
            subtotalField.setText("Invalid input");
        }
    }
    
}