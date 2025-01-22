
package com.farmfresh1.Fruits;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.HashMap;
import java.util.Map;
import javafx.application.Application;
import javafx.collections.FXCollections;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.ComboBox;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.effect.GaussianBlur;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.StackPane;
import javafx.scene.layout.VBox;
import javafx.scene.paint.Color;
import javafx.scene.text.Font;
import javafx.scene.text.FontWeight;
import javafx.stage.FileChooser;
import javafx.stage.Screen;
import javafx.stage.Stage;

public class Signup_DeliveryPerson {
    video obj=new video();
    public static Object bt21;
    public static Scene scene1,scene2,scene3;

    public static void startSignup_DeliveryPerson(Stage primaryStage){
        //  primaryStage.setWidth(1930);
            //primaryStage.setHeight(1060);
            GridPane grid = new GridPane();
            grid.setVgap(20);
            grid.setHgap(20);
            grid.setAlignment(Pos.CENTER);
            grid.setPrefSize(300, 600);
            //grid.setStyle("-fx-background-Color:rgba(240,240,240.0.8)");
            
            Label lb1 = new Label();
            lb1.setText("Full Name:");
            TextField tx1 = new TextField();
            tx1.setMaxWidth(200);
            lb1.setFont(Font.font("abc", FontWeight.BOLD, 20));
            tx1.setMaxWidth(600);
            grid.add(lb1, 0, 1);
            grid.add(tx1, 1, 1);

            Label lb2 = new Label("Email Id:");
            TextField tx2 = new TextField();
            tx2.setMaxWidth(400);
            lb2.setFont(Font.font("abc", FontWeight.BOLD, 20));
            grid.add(lb2, 0, 2);
            grid.add(tx2, 1, 2);

            Label lb3 = new Label("Set your password:");
            TextField tx3 = new TextField();
            tx3.setMaxSize(400, 100);
            lb3.setFont(Font.font("abc", FontWeight.BOLD, 20));
            grid.add(lb3, 0, 3);
            grid.add(tx3, 1, 3);
            Label lb4 = new Label("(minimum 8 characters)");
            grid.add(lb4, 1, 4);
        
            Label lb5 = new Label("Contact no.:");
            TextField tx5 = new TextField();
            tx5.setMaxWidth(400);
            lb5.setFont(Font.font("abc", FontWeight.BOLD, 20));
            grid.add(lb5, 0, 5);
            grid.add(tx5, 1, 5);

            Label lb6 = new Label("State:");
            lb6.setFont(Font.font("abc", FontWeight.BOLD, 20));
            ComboBox<String> cb1 = new ComboBox<>();
            cb1.getItems().addAll("Andhra Pradesh", "Arunachal Pradesh", "Assam", "Bihar", "Chhattisgarh",
            "Goa", "Gujarat", "Haryana", "Himachal Pradesh", "Jharkhand",
            "Karnataka", "Kerala", "Madhya Pradesh", "Maharashtra", "Manipur",
            "Meghalaya", "Mizoram", "Nagaland", "Odisha", "Punjab",
            "Rajasthan", "Sikkim", "Tamil Nadu", "Telangana", "Tripura",
            "Uttar Pradesh", "Uttarakhand", "West Bengal");
            cb1.setMaxWidth(600);
            grid.add(lb6, 0, 6);
            grid.add(cb1, 1, 6);

            Label lb7 = new Label("City:");
            TextField tx7 = new TextField();
            tx7.setMaxWidth(400);
            lb7.setFont(Font.font("abc", FontWeight.BOLD, 20));
            grid.add(lb7, 0, 7);

            ComboBox<String> cityComboBox = new ComboBox<>();
            cityComboBox.setMaxWidth(600);
            grid.add(cityComboBox, 1, 7);

            Map<String, String[]> stateToCities = new HashMap<>();
            stateToCities.put("Andhra Pradesh", new String[]{"Visakhapatnam", "Vijayawada", "Guntur", "Nellore"});
            stateToCities.put("Arunachal Pradesh", new String[]{"Itanagar", "Naharlagun"});
            stateToCities.put("Assam", new String[]{"Guwahati", "Silchar", "Dibrugarh", "Jorhat"});
            stateToCities.put("Bihar", new String[]{"Patna", "Gaya", "Bhagalpur", "Muzaffarpur"});
            stateToCities.put("Chhattisgarh", new String[]{"Raipur", "Bhilai", "Bilaspur", "Korba"});
            stateToCities.put("Goa", new String[]{"Panaji", "Margao", "Vasco da Gama", "Mapusa"});
            stateToCities.put("Gujarat", new String[]{"Ahmedabad", "Surat", "Vadodara", "Rajkot"});
            stateToCities.put("Haryana", new String[]{"Gurgaon", "Faridabad", "Panipat", "Ambala"});
            stateToCities.put("Himachal Pradesh", new String[]{"Shimla", "Manali", "Dharamshala", "Solan"});
            stateToCities.put("Jharkhand", new String[]{"Ranchi", "Jamshedpur", "Dhanbad", "Bokaro"});
            stateToCities.put("Karnataka", new String[]{"Bengaluru", "Mysore", "Hubli", "Mangalore"});
            stateToCities.put("Kerala", new String[]{"Thiruvananthapuram", "Kochi", "Kozhikode", "Thrissur"});
            stateToCities.put("Madhya Pradesh", new String[]{"Bhopal", "Indore", "Gwalior", "Jabalpur"});
            stateToCities.put("Maharashtra", new String[]{"Mumbai", "Pune", "Nagpur", "Thane", "Nashik"});
            stateToCities.put("Manipur", new String[]{"Imphal", "Thoubal"});
            stateToCities.put("Meghalaya", new String[]{"Shillong", "Tura"});
            stateToCities.put("Mizoram", new String[]{"Aizawl", "Lunglei"});
            stateToCities.put("Nagaland", new String[]{"Kohima", "Dimapur"});
            stateToCities.put("Odisha", new String[]{"Bhubaneswar", "Cuttack", "Rourkela", "Sambalpur"});
            stateToCities.put("Punjab", new String[]{"Chandigarh", "Ludhiana", "Amritsar", "Jalandhar"});
            stateToCities.put("Rajasthan", new String[]{"Jaipur", "Jodhpur", "Udaipur", "Kota"});
            stateToCities.put("Sikkim", new String[]{"Gangtok"});
            stateToCities.put("Tamil Nadu", new String[]{"Chennai", "Coimbatore", "Madurai", "Tiruchirappalli"});
            stateToCities.put("Telangana", new String[]{"Hyderabad", "Warangal", "Nizamabad", "Karimnagar"});
            stateToCities.put("Tripura", new String[]{"Agartala"});
            stateToCities.put("Uttar Pradesh", new String[]{"Lucknow", "Kanpur", "Ghaziabad", "Agra"});
            stateToCities.put("Uttarakhand", new String[]{"Dehradun", "Haridwar", "Nainital", "Rishikesh"});
            stateToCities.put("West Bengal", new String[]{"Kolkata", "Howrah", "Durgapur", "Siliguri"});

            cb1.setOnAction(e -> {
                String selectedState = cb1.getValue();
                if (selectedState != null && stateToCities.containsKey(selectedState)) {
                    cityComboBox.setItems(FXCollections.observableArrayList(stateToCities.get(selectedState)));
                } else {
                    cityComboBox.setItems(FXCollections.observableArrayList());
                }
            });

            Label lb8 = new Label();
            lb8.setText("Driving license:");
            TextField tx8= new TextField();
            tx8.setMaxWidth(200);
            lb8.setFont(Font.font("abc", FontWeight.BOLD, 20));
            tx8.setMaxWidth(600);
            grid.add(lb8, 0, 8);
         //   grid.add(tx8, 1, 8);
          //  Label lb9=new Label("(applicable file size 50kb - 250kb)");

    // Create a FileChooser
        FileChooser fileChooser1 = new FileChooser();
        fileChooser1.getExtensionFilters().add(
            new FileChooser.ExtensionFilter("Image Files", ".png", ".jpg", ".jpeg", ".gif")
        );

        // Create an ImageView to display the selected image
        ImageView imageView1 = new ImageView();
        imageView1.setFitWidth(400); // Set the desired width
        imageView1.setPreserveRatio(true); // Preserve aspect ratio

        // Create a Button to open the FileChooser
        Button button = new Button("Choose Image");
        button.setOnAction(e -> {
            // Open the file chooser dialog
            File file = fileChooser1.showOpenDialog(primaryStage);
            if (file != null) {
                try {
                    // Load the image and set it to the ImageView
                    Image image1 = new Image(new FileInputStream(file));
                    imageView1.setImage(image1);
                } catch (FileNotFoundException ex) {
                    ex.printStackTrace();
                }
            }
        });

            grid.add(button, 1, 8);

            javafx.geometry.Rectangle2D screenBound = Screen.getPrimary().getVisualBounds();
            grid.setStyle("-fx-background-color: rgba(240, 240, 240, 0.8); -fx-border-color: #cccccc; -fx-border-radius: 10; -fx-background-radius:10");

            ImageView iv = new ImageView("file:imagedemofarmfresh\\src\\main\\resources\\background for signup.jpg");
            iv.setFitWidth(screenBound.getWidth());
            iv.setFitHeight(screenBound.getHeight());
            iv.setPreserveRatio(false);
            iv.setEffect(new GaussianBlur(15));
            grid.add(iv, 0, 0);
            Button bt=new Button("Next");
            bt.setStyle("-fx-background-color: rgba(144, 238, 144, 0.8); -fx-border-color: #cccccc; -fx-border-radius: 10; -fx-background-radius:10");
            bt.setTextFill(Color.GREEN);

            bt.setMaxSize(200, 50);
            bt.setFont(Font.font("", FontWeight.EXTRA_BOLD, 20));
           
            VBox vb1=new VBox(bt);
            vb1.setAlignment(Pos.BASELINE_RIGHT);
            Label lb=new Label("FARMFRESH");
            lb.setFont(Font.font("", FontWeight.EXTRA_BOLD, 50));
            HBox hb=new HBox(lb);
            hb.setAlignment(Pos.TOP_CENTER);
            VBox vb = new VBox(30, hb,grid,vb1);
            vb.setPrefSize(300, 600);
            vb.setAlignment(Pos.CENTER);
            vb.setPadding(new Insets(15,500,15,500));
            StackPane sp = new StackPane();
            sp.getChildren().addAll(iv, vb);
            bt.setOnAction(e -> primaryStage.setScene(scene2));
            scene1=new Scene(sp,1920,1050);
            
            


//scene2

            GridPane grid1 = new GridPane();
            grid1.setVgap(20);
            grid1.setHgap(20);
            grid1.setAlignment(Pos.CENTER);
            grid1.setPrefSize(300, 600);
            Label lb11 = new Label();
            lb11.setText("Vehicle Information:");
            lb11.setPadding(new Insets(20, 20, 0, 0));
            lb11.setFont(Font.font("abc", FontWeight.EXTRA_BOLD, 30));
            //lb1.setUnderline(true);
            grid1.add(lb11,0,0);
            
            Label lb12 = new Label();
            lb12.setText("Type of Vehicle:");
            TextField tx12 = new TextField();
            tx12.setMaxWidth(200);
            lb12.setFont(Font.font("abc", FontWeight.BOLD, 20));
            tx12.setMaxWidth(600);
            grid1.add(lb12, 0, 2);
            grid1.add(tx12, 1, 2);

            Label lb13 = new Label();
            lb13.setText("Registation no.:");
            TextField tx13 = new TextField();
            tx13.setPrefWidth(400);
            lb13.setFont(Font.font("abc", FontWeight.BOLD, 20));
            tx13.setMaxWidth(600);
            grid1.add(lb13, 0, 3);
            grid1.add(tx13, 1, 3);

            Label lb14= new Label();
            lb14.setText("Insurance:");
//TextField tx14 = new TextField();
  //          tx14.setMaxWidth(200);
            lb14.setFont(Font.font("abc", FontWeight.BOLD, 20));
      //      tx14.setMaxWidth(600);
            grid1.add(lb14, 0, 4);
        //    grid1.add(tx14, 1, 4);
            Label lb15=new Label("(applicable file size 50kb - 250kb)");
            grid1.add(lb15, 1, 5);

            FileChooser fileChooser2 = new FileChooser();
        fileChooser1.getExtensionFilters().add(
            new FileChooser.ExtensionFilter("Image Files", ".png", ".jpg", ".jpeg", ".gif")
        );

        // Create an ImageView to display the selected image
        ImageView imageView2 = new ImageView();
        imageView2.setFitWidth(400); // Set the desired width
        imageView2.setPreserveRatio(true); // Preserve aspect ratio

        // Create a Button to open the FileChooser
        Button button1 = new Button("Choose Image");
        button.setOnAction(e -> {
            // Open the file chooser dialog
            File file = fileChooser2.showOpenDialog(primaryStage);
            if (file != null) {
                try {
                    // Load the image and set it to the ImageView
                    Image image1 = new Image(new FileInputStream(file));
                    imageView1.setImage(image1);
                } catch (FileNotFoundException ex) {
                    ex.printStackTrace();
                }
            }
        });

            grid1.add(button1, 1, 4);
            
            javafx.geometry.Rectangle2D screenBound1 = Screen.getPrimary().getVisualBounds();
            grid1.setStyle("-fx-background-color: rgba(240, 240, 240, 0.8); -fx-border-color: #cccccc; -fx-border-radius: 10; -fx-background-radius: 10;");
            ImageView iv1 = new ImageView("file:imagedemofarmfresh\\src\\main\\resources\\background for signup.jpg");
             iv1.setFitWidth(screenBound1.getWidth());
             iv1.setFitHeight(screenBound1.getHeight());
             iv1.setPreserveRatio(false);
             iv1.setEffect(new GaussianBlur(15));
             grid1.add(iv1, 0, 0);
             Button bt1=new Button("Next");
            bt1.setStyle("-fx-background-color: rgba(144, 238, 144, 0.8); -fx-border-color: #cccccc; -fx-border-radius: 10; -fx-background-radius:10;");
            bt1.setTextFill(Color.GREEN);
            bt1.setMaxSize(200, 50);
            bt1.setFont(Font.font("", FontWeight.EXTRA_BOLD, 20));
            Button bt2=new Button("Back");
            bt2.setStyle("-fx-background-color: rgba(144, 238, 144, 0.8); -fx-border-color: #cccccc; -fx-border-radius: 10; -fx-background-radius:10;");
            bt2.setTextFill(Color.GREEN);
            bt2.setMaxSize(200, 50);
            bt2.setFont(Font.font("", FontWeight.EXTRA_BOLD, 20));
            

            VBox vb11=new VBox(bt1);
            vb11.setAlignment(Pos.BASELINE_RIGHT);
            VBox vb13=new VBox(bt2);
            vb13.setAlignment(Pos.BASELINE_LEFT);
            Label lb16=new Label("FARMFRESH");
            lb16.setFont(Font.font("", FontWeight.EXTRA_BOLD, 50));
            HBox hb1=new HBox(lb16);
            hb1.setAlignment(Pos.TOP_CENTER);
            HBox vb112=new HBox(1050,vb13,vb11);
            VBox vb12 = new VBox(30, hb1,grid1,vb112);
            
            //VBox vb12=new VBox(30,vb111,vb112);
            vb12.setPrefSize(400, 800);
            vb12.setAlignment(Pos.CENTER);
            vb12.setPadding(new Insets(15,350,15,350));
            StackPane sp1 = new StackPane();
            sp1.getChildren().addAll(iv1, vb12);
            
           
            bt1.setOnAction(e->  primaryStage.setScene(scene3));
            bt2.setOnAction(e->  primaryStage.setScene(scene1));
            scene2 =new Scene(sp1,1920,1050);


            //scene3

           GridPane grid2 = new GridPane();
            grid2.setVgap(30);
            grid2.setHgap(100);
            grid2.setAlignment(Pos.CENTER);
            grid2.setPrefSize(300, 600);
            Label lb21 = new Label();
            lb21.setText("Availability and preferences");
            lb21.setPadding(new Insets(20, 20, 0, 0));
            lb21.setFont(Font.font("abc", FontWeight.EXTRA_BOLD, 30));
            //lb1.setUnderline(true);
            grid2.add(lb21,0,0);
            
            Label lb22 = new Label();
            lb22.setText("Service Area:");
            TextField tx22 = new TextField();

            lb22.setFont(Font.font("abc", FontWeight.BOLD, 20));
            tx22.setMaxWidth(600);
            grid2.add(lb22, 0, 2);
            grid2.add(tx22, 1, 2);

            Label lb23 = new Label();
            lb23.setText("Working Hours:");
            TextField tx23 = new TextField();
            lb23.setFont(Font.font("abc", FontWeight.BOLD, 20));
            tx23.setMaxWidth(600);
            grid2.add(lb23, 0, 3);
            grid2.add(tx23, 1, 3);

            Label lb24= new Label();
            lb24.setText("Preffered Delivery Type:");
            TextField tx24 = new TextField();
            lb24.setFont(Font.font("abc", FontWeight.BOLD, 20));
            tx24.setMaxWidth(600);
            ComboBox<String> cb2=new ComboBox<>();
            cb2.getItems().addAll("On-Demand Delivery Service","self-pickup service","third-party pickup service","The last mile delivery service");
            grid2.add(lb24, 0, 4);
            grid2.add(cb2, 1, 4);
            
            javafx.geometry.Rectangle2D screenBound2 = Screen.getPrimary().getVisualBounds();
            grid2.setStyle("-fx-background-color: rgba(240, 240, 240, 0.8); -fx-border-color: #cccccc; -fx-border-radius: 10; -fx-background-radius:10;");
            ImageView iv2= new ImageView("file:imagedemofarmfresh\\src\\main\\resources\\background for signup.jpg");
            iv2.setFitWidth(screenBound2.getWidth());
            iv2.setFitHeight(screenBound2.getHeight());
            //iv2.setPreserveRatio(true);
            iv2.setPreserveRatio(false);
            iv2.setEffect(new GaussianBlur(15));
            grid2.add(iv2, 0, 0);
             Button bt21=new Button("SignUp");
            bt21.setStyle("-fx-background-color: rgba(144, 238, 144, 0.8); -fx-border-color: #cccccc; -fx-border-radius: 10; -fx-background-radius:10;");
            bt21.setTextFill(Color.GREEN);
            bt21.setMaxSize(200, 50);
            bt21.setFont(Font.font("", FontWeight.EXTRA_BOLD, 20));
            bt21.setOnAction(new EventHandler<ActionEvent>() {

                @Override
                public void handle(ActionEvent event) {
                    TermsAndCondition.startTermsAndCondition(primaryStage);
                }
                
            });

            Button bt3=new Button("Back");
            bt3.setStyle("-fx-background-color: rgba(144, 238, 144, 0.8); -fx-border-color: #cccccc; -fx-border-radius: 10; -fx-background-radius:10;");
            bt3.setTextFill(Color.GREEN);
            bt3.setMaxSize(200, 50);
            bt3.setFont(Font.font("", FontWeight.EXTRA_BOLD, 20));
            VBox vb33=new VBox(bt3);
            vb33.setAlignment(Pos.BASELINE_LEFT);


            VBox vb21=new VBox(bt21);
            vb21.setAlignment(Pos.BASELINE_RIGHT);
            Label lb25=new Label("FARMFRESH");
            lb25.setFont(Font.font("", FontWeight.EXTRA_BOLD, 50));
            HBox hb2=new HBox(lb25);
            hb2.setAlignment(Pos.TOP_CENTER);
            grid2.setPadding(new Insets(20, 200, 20, 200));;
            VBox vbbb = new VBox(30, hb2,grid2);
            HBox hbbb = new HBox(1000,vb33,vb21);
            VBox vb22=new VBox(50,vbbb,hbbb);
            vb22.setPrefSize(400, 1000);
            vb22.setAlignment(Pos.CENTER);
            vb22.setPadding(new Insets(10,350,50,350));
            StackPane sp2 = new StackPane();
            sp2.getChildren().addAll(iv2, vb22);

            
            bt3.setOnAction(e-> primaryStage.setScene(scene2));
            scene3=new Scene(sp2,1920,1050);
           
            primaryStage.setScene(scene1);
            primaryStage.show();

            
            
    }
    
}
