package com.farmfresh1.Fruits;

import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.layout.HBox;
import javafx.scene.layout.StackPane;
import javafx.scene.layout.VBox;
import javafx.scene.paint.Color;
import javafx.scene.text.Font;
import javafx.scene.text.FontWeight;
import javafx.scene.text.Text;
import javafx.stage.Stage;

public class Forget_Password  {
     static Scene scene1;
    //Login_Page obj2=new Login_Page();
     static Scene scene2;
     static Scene scene3;
   
    public static void startForget_Password(Stage primaryStage) throws Exception {
        primaryStage.setTitle("Forget Password");

        // Scene 1
        Label lb1 = new Label("Google");
        lb1.setTextFill(Color.WHEAT);
        lb1.setAlignment(Pos.CENTER);
        lb1.setFont(Font.font("Arial", FontWeight.EXTRA_BOLD, 40));

        Label lb2 = new Label("Account Recovery");
        lb2.setAlignment(Pos.CENTER);
        lb2.setFont(Font.font("Arial", FontWeight.BOLD, 40));
        lb2.setTextFill(Color.WHITE);

        Text txt = new Text("To help keep your account safe, Google wants to identify that's you");
        txt.setFont(new Font(20));
        txt.setFill(Color.WHITE);

        VBox vb1 = new VBox(txt);
        vb1.setAlignment(Pos.BASELINE_LEFT);

        Label lb3 = new Label("Get a Verification Code");
        lb3.setFont(Font.font("Arial", FontWeight.BOLD, 30));
        lb3.setTextFill(Color.WHITE);

        Text txt1 = new Text("To get a verification code, first confirm the phone number that you added to your account");
        txt1.setFont(new Font(20));
        txt1.setFill(Color.WHITE);

        VBox vb2 = new VBox(txt1);
        vb2.setAlignment(Pos.CENTER);

        Label lb4 = new Label("Phone Number");
        lb4.setTextFill(Color.BLUE);
        lb4.setFont(new Font(20));

        TextField txt2 = new TextField();
        txt2.setMaxSize(300, 40);
        txt2.setText("+91 ");

        VBox vb3 = new VBox(txt2);
        vb3.setAlignment(Pos.BASELINE_LEFT);
        vb3.setPrefWidth(200);

        Button bt = new Button("Send");
        bt.setFont(Font.font("Arial", FontWeight.BOLD, 20));
        bt.setPrefSize(100, 25);
        bt.setTextFill(Color.WHEAT);
        bt.setStyle("-fx-background-color: blue");

        VBox vb4 = new VBox(bt);
        vb4.setAlignment(Pos.BASELINE_RIGHT);

        VBox vb5 = new VBox(10, lb1, lb2, vb1);
        VBox vb6 = new VBox(40, lb3, vb2);
        VBox vb7 = new VBox(lb4, vb3);
        VBox vb8 = new VBox(50, vb5, vb6, vb7, vb4);
        vb8.setAlignment(Pos.CENTER);
        vb8.setPadding(new Insets(200, 50, 200, 50));

        HBox hb = new HBox(vb8);
        hb.setAlignment(Pos.CENTER);
        hb.setStyle("-fx-background-color: black");

        scene1 = new Scene(hb, 1980, 1060);

        bt.setOnAction(e -> primaryStage.setScene(scene2));

        // Scene 2
        Text txt105 = new Text("A text message with a 6-digit verification code was just sent to your mobile number.");
        txt105.setFill(Color.WHITE);
        txt105.setFont(new Font(20));

        Label lb107 = new Label("Enter a Verification Code");
        lb107.setTextFill(Color.WHITE);
        lb107.setFont(new Font(20));

        HBox hb102 = new HBox(10);
        hb102.setMaxSize(100, 100);

        // Create six HBoxes of size 30x30
        TextField[] hBoxes = new TextField[6];
        for (int i = 0; i < 6; i++) {
            TextField hB20 = new TextField();
            hB20.setPrefSize(40, 40);
            hB20.setStyle("-fx-background-color: white; -fx-border-color: black;");
            hBoxes[i] = hB20;
        }

        HBox codeBoxes = new HBox(10, hBoxes);
        codeBoxes.setAlignment(Pos.CENTER);

        Button bt103 = new Button("Submit");
        //bt103.setPadding(new Insets(500, 100, 500, 800));
        bt103.setFont(Font.font("Arial", FontWeight.BOLD, 20));
        bt103.setPrefSize(100, 25);
        bt103.setTextFill(Color.WHEAT);
        bt103.setStyle("-fx-background-color: blue");
        bt103.setAlignment(Pos.BASELINE_RIGHT);

        VBox vb1011 = new VBox(bt103);
        vb1011.setAlignment(Pos.BASELINE_RIGHT);
        vb1011.setPadding(new Insets(0, 400, 0, 0));
        VBox vb = new VBox(30, txt105, lb107, codeBoxes, vb1011);
        vb.setPadding(new Insets(200, 50, 200, 50));
        vb.setAlignment(Pos.CENTER);
        vb.setStyle("-fx-background-color: black");
        vb.setAlignment(Pos.CENTER);

        scene2 = new Scene(vb, 1980, 1060);
        bt103.setOnAction(e -> primaryStage.setScene(scene3));


        //scene3
        Text tx=new Text("You've successfully changed your password!");
        tx.setFont(new Font(50));
        tx.setFill(Color.WHITE);
        Text tx1=new Text("Please lock your machine,then use your new password to get back in.(We find that using your password right away helps you remember it later.)");
        tx1.setFont(new Font(20));
        tx1.setFill(Color.WHITE);
        Button btt=new Button("Finish");
        btt.setStyle("-fx-background-color:Blue");
        btt.setFont(Font.font("Arial", FontWeight.BOLD, 20));
        btt.setPrefSize(100, 25);
        btt.setTextFill(Color.WHEAT);
        VBox vtt=new VBox(btt);
        vtt.setAlignment(Pos.BASELINE_RIGHT);
        vtt.setPadding(new Insets(0, 300, 0, 0));

        btt.setOnAction(new EventHandler<ActionEvent>() {

            @Override
            public void handle(ActionEvent event) {
                Login_Page.startLogin_Page(primaryStage);
            }
            
        });

       
        VBox hbb=new VBox(50,tx,tx1,vtt);
        hbb.setAlignment(Pos.CENTER);
        VBox vbb=new VBox(hbb);

        vbb.setPadding(new Insets(50, 700, 50, 700));
        vbb.setStyle("-fx-background-color:black");
        StackPane spp = new StackPane();
        spp.getChildren().addAll(vbb,hbb);
        spp.setAlignment(Pos.CENTER);
        //spp.setPrefSize(500, 500);

        scene3 =new Scene(spp,1980,1020);
        scene3.setFill(Color.BLACK);

        primaryStage.setScene(scene1);
        primaryStage.show();
    }

    public Parent getView() {
        throw new UnsupportedOperationException("Unimplemented method 'getView'");
    }

    public Object getField2Value() {
        throw new UnsupportedOperationException("Unimplemented method 'getField2Value'");
    }

    public void setField2Value(Object field2Value) {
        throw new UnsupportedOperationException("Unimplemented method 'setField2Value'");
    }


}