package com.farmfresh1.Fruits;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutionException;

import com.farmfresh1.Fruit.DataService;
import com.google.api.core.ApiFuture;
import com.google.cloud.firestore.CollectionReference;
import com.google.cloud.firestore.DocumentReference;
import com.google.cloud.firestore.DocumentSnapshot;
import com.google.cloud.firestore.Firestore;
import com.google.cloud.firestore.Query;
import com.google.cloud.firestore.QueryDocumentSnapshot;
import com.google.cloud.firestore.QuerySnapshot;

import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.ScrollPane;
import javafx.scene.effect.DropShadow;
import javafx.scene.image.Image;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.scene.paint.Color;
import javafx.scene.paint.ImagePattern;
import javafx.scene.shape.Circle;
import javafx.scene.text.Font;
import javafx.scene.text.Text;
import javafx.stage.Screen;
import javafx.stage.Stage;

public class Profilepage extends Application{

    public static Scene sc;
    Firestore dbb;
    // UploadPage objUploadPage=new UploadPage();
        public Profilepage getData(String c2w_pi_collection, String c2w_pi_document) throws ExecutionException, InterruptedException{

    try {

            DocumentReference c2w_pi_docRef =dbb.collection(c2w_pi_collection).document(c2w_pi_document); // Reference to the document

    ApiFuture<DocumentSnapshot> c2w_pi_future =c2w_pi_docRef.get(); // Asynchronously retrieve document snapshot
            return c2w_pi_future.get().toObject(Profilepage.class); // Convert document snapshot to Player object

    } catch (Exception e) {
        e.printStackTrace(); // Print stack trace for debugging

        throw e; // Re-throw exception or handle based onapplication's needs

    }

    }
    UploadPage obj=new UploadPage();
    DataService dataService;

    public  void start(Stage primaryStage) throws Exception {
        primaryStage.setTitle("Service4");
        primaryStage.setWidth(1950);
        primaryStage.setHeight(1040);

        Label label1=new Label("FARMFRESH");
        label1.setStyle("-fx-background-color:red");
        label1.setFont(new Font(50));
        label1.setStyle("-fx-font-weight:bold");
        HBox hb=new HBox(label1);
        hb.setAlignment(Pos.CENTER);

        Image image1=new Image("file:imagedemofarmfresh/src/main/resources/theUnknown.jpeg");
        Circle cir1=new Circle(250,200,80);
        cir1.setStroke(Color.SEAGREEN); 
        cir1.setFill(Color.SNOW); 
        cir1.setEffect(new DropShadow(+25d, 0d, +2d, Color.DARKSEAGREEN));
        cir1.setFill(new ImagePattern(image1));
        VBox vb=new VBox(cir1);
        vb.setAlignment(Pos.CENTER);

        Label L1=new Label("Name : Sumit Katkar");
        L1.setFont(new Font(20));

        Label L2=new Label("Mobile No : 8010367093");
        L2.setFont(new Font(20));

        Profilepage profilepage=getData("SellerProductInfo", "Product Name");
        Label L3=new Label();
        L3.setText("Product Name");
        L3.setFont(new Font(20));
        Text T1=new Text("1.Potatos");
        Text T2=new Text("2.Tomato");
        Text T3=new Text("3.Onion");
        Text T4=new Text("4.Brinjal");
        VBox vbText1=new VBox(10,T1,T2,T3,T4);
        vbText1.setLayoutX(200);
        VBox vbtie1=new VBox(10,L3,vbText1);

        Label L4=new Label("Product Variety:");
        L4.setFont(new Font(20));
        Text T5=new Text("1.Organic");
        Text T6=new Text("2.Inorganic");
        VBox vbText2=new VBox(10,T5,T6);
        vbText2.setLayoutX(200);
        VBox vbtie2=new VBox(10,L4,vbText2);

        Label L5=new Label("Product Quantity:");
        L5.setFont(new Font(20));

        Label L6=new Label("Product names:");
        L6.setFont(new Font(20));

        Label L7=new Label("Packing Details:");
        L7.setFont(new Font(20));

        Label L8=new Label("Farm Photos:");
        L8.setFont(new Font(20));

        Label L9=new Label("Product Photos:");
        L9.setFont(new Font(20));

        Button B1=new Button("Back");
        B1.setStyle("-fx-background-color:lightBlue");
        B1.setOnAction(new EventHandler<ActionEvent>() {

            @Override
            public void handle(ActionEvent event) {
                primaryStage.setScene(HomePage.sc);
            }
            
        });


        Button B2=new Button("ADD");
        B2.setStyle("-fx-background-color:lightBlue");
      //  B2.setOnAction(new EventHandler<ActionEvent>() {

    //         @Override
    //         public void handle(ActionEvent event) {
    //             handleSignup(primaryStage, tx1.getText(), tx2.getText(), tx3.getText(), tx5.getText(), cb1.getValue(), cityComboBox.getValue(),tx8.getText());
    //         }

    //         private void handleSignup(Stage primaryStage, String FullName, String Email_Id,String password,String Mobile_no,String string,String string2,String Address) {
    //             DataService dataService;
    //     try{
    //         dataService= new DataService();
    //         Map<String,Object> data = new HashMap<>();
    //         data.put("FullName",FullName );
    //         data.put("Email_Id", Email_Id);
    //         data.put("Password",password );
    //         data.put("Contact_no", Mobile_no);
    //         data.put("State",string );
    //         data.put("City", string2);
    //         data.put("Address",Address );
           

    //         dataService.addData("Customers: ",Email_Id,data);
    //         System.out.println("User registered successfully");
    //      //   loginController.showLoginScene();
    //     }catch(Exception ex){
    //         ex.printStackTrace();
    //     }
    // }
               
         
            
     //    });
             
    

        VBox vb1=new VBox(20,L1,L2,vbtie1,vbtie2,L5,L6,L7,L8,L9);
        HBox vb3=new HBox(60,B1,B2);
        vb3.setAlignment(Pos.CENTER);
        

        // Create a StackPane to hold the box and the label
        // StackPane stackPane = new StackPane();
        // stackPane.getChildren().addAll(box,vb1,vb3);
        //vb1.setAlignment(Pos.CENTER);
        VBox vb2=new VBox(20,vb,vb1,vb3);
        vb2.setStyle("-fx-background-radius: 10; -fx-border-radius: 10; -fx-border-color:black; -fx-border-width: 2; -fx-padding: 10;-fx-background-width:400");
        vb2.setMaxWidth(600);
       vb2.setMaxHeight(900);
       vb2.setAlignment(Pos.CENTER);
        
        VBox vbox=new VBox(30,hb,vb2);
        vbox.setAlignment(Pos.CENTER);
        ScrollPane scrollPane=new ScrollPane();
        scrollPane.setContent(vbox);
        
        scrollPane.setFitToWidth(true);
        scrollPane.setFitToHeight(true);
        sc=new Scene(scrollPane);
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
    public static void main(String[]args){
        Application.launch(args);

    }
    
}
