package com.farmfresh1.Fruits;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutionException;

import com.farmfresh1.Fruit.DataService;
import com.farmfresh1.model.Custormer;
import com.google.cloud.firestore.DocumentSnapshot;
import com.google.firestore.v1.Document;

import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.ScrollPane;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.StackPane;
import javafx.scene.layout.VBox;
import javafx.scene.paint.Color;
import javafx.scene.paint.ImagePattern;
import javafx.scene.shape.Circle;
import javafx.scene.text.Font;
import javafx.scene.text.FontWeight;
import javafx.stage.Screen;
import javafx.stage.Stage;

public class ProductProfile {
    static DataService dataService = new DataService();
    public static String usrEmail;

   
    public static void startProductProfile(Stage primaryStage) throws Exception {
        VBox vbox = new VBox();
        vbox.setSpacing(10);
        Label l1=new Label("FARM_FRESH");
        l1.setFont(new Font(50));
        l1.setAlignment(Pos.CENTER);
        l1.setTextFill(Color.BLACK);

        Image image=new Image("file:imagedemofarmfresh\\src\\main\\resources\\farmfresh logo.jpg");
        Circle cir1=new Circle(250,200,60);
        cir1.setFill(new ImagePattern(image));

        HBox hbox1=new HBox(cir1,l1);
        hbox1.setAlignment(Pos.CENTER);
       
        System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>"+usrEmail);
        Custormer customer = dataService.getData("Customer",usrEmail); // Updated to remove the colon

        if (customer !=null) {
            System.out.println("Hello");
              GridPane grid1 = new GridPane();
            grid1.setVgap(30);
            grid1.setHgap(20);
            grid1.setAlignment(Pos.CENTER);
            grid1.setPadding(new Insets(50, 100, 50, 100));
            grid1.setStyle("-fx-background-color: rgba(240, 240, 240, 0.8); -fx-border-color: #cccccc; -fx-border-radius: 10; -fx-background-radius: 10;");
            

            Label lb1 = new Label("Address:");
            Label lb11 = new Label(customer.getAddress());
            lb11.setMaxWidth(500);
            lb11.setFont(new Font(18));
            lb1.setFont(Font.font("abc", FontWeight.BOLD, 20));
            grid1.add(lb1, 0, 7);
            grid1.add(lb11, 1, 7);

            Label lb2=new Label();
            lb2.setText("City: ");
            Label lb12 = new Label(customer.getCity());
            lb12.setMaxWidth(500);
            lb12.setFont(new Font(18));
            lb2.setFont(Font.font("abc", FontWeight.BOLD, 20));
            grid1.add(lb2, 0, 5);
            grid1.add(lb12, 1, 5);

            Label lb3=new Label();
            lb3.setText("Contact No: "  );
            Label lb13 = new Label(customer.getContact_no());
            lb13.setMaxWidth(500);
            lb13.setFont(new Font(18));
            lb3.setFont(Font.font("abc", FontWeight.BOLD, 20));
            grid1.add(lb3, 0, 3);
            grid1.add(lb13, 1, 3);


            Label lb4=new Label("Email ID: " );
            Label lb14 = new Label(customer.getEmail_id());
            lb14.setMaxWidth(500);
            lb14.setFont(new Font(18));
            lb4.setFont(Font.font("abc", FontWeight.BOLD, 20));
            grid1.add(lb4, 0, 2);
            grid1.add(lb14, 1, 2);

            Label lb5=new Label("Full Name: " );
            Label lb15 = new Label(customer.getFullname());
            System.out.println(customer.getFullname());
            lb15.setMaxWidth(500);
            lb15.setFont(new Font(18));
            lb5.setFont(Font.font("abc", FontWeight.BOLD, 20));
            grid1.add(lb5, 0, 1);
            grid1.add(lb15, 1, 1);

            Label lb6=new Label("Password: "  );
            Label lb16 = new Label(customer.getPassword());
            lb16.setMaxWidth(500);
            lb16.setFont(new Font(18));
            lb6.setFont(Font.font("abc", FontWeight.BOLD, 20));
            grid1.add(lb6, 0, 4);
            grid1.add(lb16, 1, 4);
            

            Label lb7=new Label("State: " );
            Label lb17 = new Label(customer.getState());
            lb17.setMaxWidth(500);
            lb17.setFont(new Font(18));
            lb7.setFont(Font.font("abc", FontWeight.BOLD, 20));
            grid1.add(lb7, 0, 6);
            grid1.add(lb17, 1, 6);


        Button button =new Button("Back");
            button.setPrefWidth(200);
            button.setFont(new Font(25));
            button.setStyle("-fx-background-color: rgba(144, 238, 144, 0.8); -fx-border-color: #cccccc; -fx-border-radius: 10; -fx-background-radius: 10;");
            button.setAlignment(Pos.CENTER);
            button.setOnAction(new EventHandler<ActionEvent>() {

                @Override
                public void handle(ActionEvent event) {
                    try {
                        Accountpage.startAccountPage(primaryStage);
                    } catch (Exception e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                    }
                }
                
            });
            Button homeButton=new Button("Done");
            homeButton.setPrefWidth(200);
            homeButton.setFont(new Font(25));
            homeButton.setStyle("-fx-background-color: rgba(144, 238, 144, 0.8); -fx-border-color: #cccccc; -fx-border-radius: 10; -fx-background-radius: 10;");
            homeButton.setAlignment(Pos.CENTER);
            homeButton.setOnAction(new EventHandler<ActionEvent>() {

                @Override
                public void handle(ActionEvent event) {
                    TermsAndCondition.startTermsAndCondition(primaryStage);
                }
                
            });


            Button button1 =new Button("Logout");
            button1.setPrefWidth(200);
            button1.setFont(new Font(25));
            button1.setStyle("-fx-background-color: rgba(144, 238, 144, 0.8); -fx-border-color: #cccccc; -fx-border-radius: 10; -fx-background-radius: 10;");
            button1.setAlignment(Pos.CENTER);
            button1.setOnAction(new EventHandler<ActionEvent>() {

                @Override
                public void handle(ActionEvent event) {
                    Login_Page.startLogin_Page(primaryStage);
                }
                
            });

           //vbox.getChildren().addAll(lb1,categoryLabel,descriptionLabel,varietyLabel,quantityLabel,priceLabel,packagingDetailsLabel,harvestDateLabel,expiryDateLabel,button);
           HBox vb2 = new HBox(150,button,homeButton,button1);
           vb2.setAlignment(Pos.CENTER);

            vbox.getChildren().addAll(grid1, vb2);
           vbox.setPadding(new Insets(20,200,20,200));
            vbox.setAlignment(Pos.CENTER);
        } else {
            Label noDocumentLabel = new Label("No such document!");
            vbox.getChildren().add(noDocumentLabel);
        }

           
        VBox vbScroll = new VBox(50,hbox1,vbox);
        vbScroll.setPadding(new Insets(10,400,10,400));;

        ImageView iv2 = new ImageView("file:imagedemofarmfresh\\src\\main\\resources\\BackgroundForAll.jpg");
                iv2.setFitWidth(Screen.getPrimary().getVisualBounds().getWidth());
                iv2.setFitHeight(Screen.getPrimary().getVisualBounds().getHeight());
                iv2.setPreserveRatio(false);
                StackPane sp2 = new StackPane(iv2, vbScroll);

        Scene scene = new Scene(sp2);
        primaryStage.setTitle("ProductProfile: ");
        primaryStage.setScene(scene);
        Screen screen = Screen.getPrimary();
        javafx.geometry.Rectangle2D bounds = screen.getVisualBounds();
        primaryStage.setX(bounds.getMinX());
        primaryStage.setY(bounds.getMinY());
        primaryStage.setWidth(bounds.getWidth());
        primaryStage.setHeight(bounds.getHeight());
        primaryStage.show();
    }
   
}

