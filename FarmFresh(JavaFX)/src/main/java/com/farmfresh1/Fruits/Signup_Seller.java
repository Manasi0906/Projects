package com.farmfresh1.Fruits;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ExecutionException;

import com.farmfresh1.Fruit.DataService;
import com.farmfresh1.model.Custormer;
import com.google.firebase.database.core.view.Event;
import com.image_blob.services.ImageUploader;

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
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextArea;
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

public class Signup_Seller {
    //video obj=new video();
    public static Scene scene1, scene2;
    
    public static void startSignup_Seller(Stage primaryStage)  {
        primaryStage.setWidth(1930);
        primaryStage.setHeight(1060);

        // Scene 1 setup
                GridPane grid1 = new GridPane();
                grid1.setVgap(20);
                grid1.setHgap(20);
                grid1.setAlignment(Pos.CENTER);
                grid1.setPadding(new Insets(20, 20, 20, 20));
                grid1.setStyle("-fx-background-color: rgba(240, 240, 240, 0.8); -fx-border-color: #cccccc; -fx-border-radius: 10; -fx-background-radius: 10;");

                Label lb1 = new Label("Business Name(If any):");
                TextField tx1 = new TextField();
                tx1.setMaxWidth(500);
                lb1.setFont(Font.font("abc", FontWeight.BOLD, 20));
                grid1.add(lb1, 0, 1);
                grid1.add(tx1, 1, 1);

                Label lb2=new Label();
                lb2.setText("Full Name:");
                TextField tx2=new TextField();
                tx2.setPrefWidth(400);
                lb2.setFont(Font.font("abc", FontWeight.BOLD, 20));
                grid1.add(lb2, 0, 2);
                grid1.add(tx2, 1, 2);

                Label lb3=new Label();
                lb3.setText("Contact Number:");
                TextField tx3=new TextField();
                tx3.setMaxWidth(500);
                lb3.setFont(Font.font("abc", FontWeight.BOLD, 20));
                grid1.add(lb3, 0, 3);
                grid1.add(tx3, 1, 3);


                Label lb4=new Label("Email Id:");
                TextField tx4=new TextField();
                tx4.setMaxWidth(500);
                lb4.setFont(Font.font("abc", FontWeight.BOLD, 20));
                grid1.add(lb4, 0, 4);
                grid1.add(tx4, 1, 4);

                Label lb5=new Label("Set your Password");
                PasswordField tx5=new PasswordField();
                tx5.setMaxSize(700, 50);
                lb5.setFont(Font.font("abc", FontWeight.BOLD, 20));
                grid1.add(lb5, 0, 5);
                grid1.add(tx5, 1, 5);
                Label lb6=new Label("(minimum 8 characters)");
                grid1.add(lb6, 1, 6);

                Label lb7=new Label("Types of Products:");
                lb7.setFont(Font.font("abc", FontWeight.BOLD, 20));
                ComboBox<String> cb1=new ComboBox<>();
                cb1.getItems().addAll("Vegetables","Fruits","Grains","Pulses","Milk","Eggs");
                cb1.setMaxWidth(500);
                grid1.add(lb7, 0, 7);
                grid1.add(cb1, 1, 7);

                Label lb8=new Label("State");
                lb8.setFont(Font.font("abc", FontWeight.BOLD, 20));
                ComboBox<String> cb2=new ComboBox<>();
                cb2.getItems().addAll("Andhra Pradesh", "Arunachal Pradesh", "Assam", "Bihar", "Chhattisgarh",
                "Goa", "Gujarat", "Haryana", "Himachal Pradesh", "Jharkhand",
                "Karnataka", "Kerala", "Madhya Pradesh", "Maharashtra", "Manipur",
                "Meghalaya", "Mizoram", "Nagaland", "Odisha", "Punjab",
                "Rajasthan", "Sikkim", "Tamil Nadu", "Telangana", "Tripura",
                "Uttar Pradesh", "Uttarakhand", "West Bengal");
                cb2.setMaxWidth(500);
                grid1.add(lb8, 0, 8);
                grid1.add(cb2, 1, 8);

                
            
                Label lb9 = new Label("City:");
                TextField tx9 = new TextField();
                tx9.setMaxWidth(500);
                lb9.setFont(Font.font("abc", FontWeight.BOLD, 20));
                grid1.add(lb9, 0, 9);

       
                ComboBox<String> cityComboBox = new ComboBox<>();
                cityComboBox.setMaxWidth(500);
                grid1.add(cityComboBox, 1, 9);

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

                cb2.setOnAction(e -> {
                    String selectedState = cb2.getValue();
                    if (selectedState != null && stateToCities.containsKey(selectedState)) {
                        cityComboBox.setItems(FXCollections.observableArrayList(stateToCities.get(selectedState)));
                    } else {
                        cityComboBox.setItems(FXCollections.observableArrayList());
                    }
                });
        

                Label lb10 = new Label("Address: ");
                TextArea tx10 = new TextArea();
                tx10.setMaxWidth(500);
                tx10.setPrefHeight(200);
                lb10.setFont(Font.font("abc", FontWeight.BOLD, 20));
                grid1.add(lb10, 0, 10);
                grid1.add(tx10, 1, 10);

                Label lb11 = new Label("Farm Description:");
                TextArea tx11 = new TextArea();
                tx11.setMaxWidth(500);
                tx11.setPrefHeight(200);
                lb11.setFont(Font.font("abc", FontWeight.BOLD, 20));
                grid1.add(lb11, 0, 11);
                grid1.add(tx11, 1, 11);


                ImageView iv1 = new ImageView("file:imagedemofarmfresh\\src\\main\\resources\\background for signup.jpg");
                iv1.setFitWidth(Screen.getPrimary().getVisualBounds().getWidth());
                iv1.setFitHeight(Screen.getPrimary().getVisualBounds().getHeight());
                iv1.setPreserveRatio(false);
                iv1.setEffect(new GaussianBlur(15));

                Button nextButton = new Button("Next");
                nextButton.setStyle("-fx-background-color: rgba(144, 238, 144, 0.8); -fx-border-color: #cccccc; -fx-border-radius: 10; -fx-background-radius: 10;");
                nextButton.setTextFill(Color.GREEN);
                nextButton.setAlignment(Pos.CENTER);
                nextButton.setMaxSize(200, 50);
                nextButton.setFont(Font.font("", FontWeight.EXTRA_BOLD, 20));
                nextButton.setOnAction(event -> primaryStage.setScene(scene2));

                VBox vb1 = new VBox(nextButton);
                vb1.setAlignment(Pos.BOTTOM_RIGHT);
                Label lbTitle1 = new Label("FARMFRESH");
                lbTitle1.setFont(Font.font("", FontWeight.EXTRA_BOLD, 50));
                HBox hb1 = new HBox(lbTitle1);
                hb1.setAlignment(Pos.TOP_CENTER);
                VBox vbScene1 = new VBox(30, hb1, grid1, vb1);
                vbScene1.setAlignment(Pos.CENTER);
                vbScene1.setPadding(new Insets(20,300,20,300));

                StackPane sp1 = new StackPane(iv1, vbScene1);
                scene1 = new Scene(sp1);
        // Scene 2 setup
        GridPane grid2 = new GridPane();
        grid2.setVgap(20);
        grid2.setHgap(20);
        grid2.setAlignment(Pos.CENTER);
        grid2.setPadding(new Insets(50, 20, 50, 20));
        grid2.setStyle("-fx-background-color: rgba(240, 240, 240, 0.8); -fx-border-color: #cccccc; -fx-border-radius: 10; -fx-background-radius: 10;");

        Label lb12 = new Label("Business Registration number:");
            TextField tx12 = new TextField();
            tx12.setMaxWidth(500);
            lb12.setFont(Font.font("abc", FontWeight.BOLD, 20));
            grid2.add(lb12, 0, 1);
            grid2.add(tx12, 1, 1);

            Label lb13 = new Label("Tax Identification number:");
            TextField tx13 = new TextField();
            tx13.setMaxWidth(500);
            lb13.setFont(Font.font("abc", FontWeight.BOLD, 20));
            grid2.add(lb13, 0, 2);
            grid2.add(tx13, 1, 2);

            Label lb14 = new Label("Bank Account Details:");
            lb14.setFont(Font.font("abc", FontWeight.BOLD, 20));
            grid2.add(lb14,0,3);
            Label lb15 = new Label("a)Bank Name:");
            TextField tx15 = new TextField();
            tx15.setMaxWidth(500);
            lb15.setFont(Font.font("abc", FontWeight.BOLD, 20));
            grid2.add(lb15, 1, 4);
            grid2.add(tx15, 2, 4);

            Label lb16 = new Label("b)Branch name:");
            TextField tx16 = new TextField();
            tx16.setMaxWidth(500);
            lb16.setFont(Font.font("abc", FontWeight.BOLD, 20));
            grid2.add(lb16, 1, 5);
            grid2.add(tx16, 2, 5);

            Label lb17 = new Label("c)IFSC code:");
            TextField tx17 = new TextField();
            tx17.setMaxWidth(500);
            lb17.setFont(Font.font("abc", FontWeight.BOLD, 20));
            grid2.add(lb17, 1, 6);
            grid2.add(tx17, 2, 6);

            Label lb18 = new Label("d)Account number:");
            TextField tx18 = new TextField();
            tx18.setPrefWidth(400);
            lb18.setFont(Font.font("abc", FontWeight.BOLD, 20));
            grid2.add(lb18, 1, 7);
            grid2.add(tx18, 2, 7);


            Label lb19 = new Label("Additional Information:");
            lb19.setFont(Font.font("abc", FontWeight.BOLD, 20));
            grid2.add(lb19,0,8);

            Label lb20 = new Label("a)Profile Photo:");
            // TextField tx20 = new TextField();
            // tx20.setMaxWidth(500);
             lb20.setFont(Font.font("abc", FontWeight.BOLD, 20));
             grid2.add(lb20, 1, 9);
            // grid2.add(tx20, 2, 9);
            // Create a FileChooser
        FileChooser fileChooser1 = new FileChooser();
        fileChooser1.getExtensionFilters().add(
            new FileChooser.ExtensionFilter("Image Files", ".png", ".jpg", ".jpeg", ".gif")
        );

        // Create an ImageView to display the selected image
        ImageView imageView2 = new ImageView();
        imageView2.setFitWidth(400);
        imageView2.setPreserveRatio(true);

        Button button2 = new Button("Choose Image");
        FileChooser fileChooserbutton2 = new FileChooser();
        fileChooserbutton2.getExtensionFilters()
                .addAll(new FileChooser.ExtensionFilter("Image Files", "*.png", "*.jpg", "*.jpeg", "*.gif"));
        button2.setOnAction(e -> {
            File selectedFile = fileChooserbutton2.showOpenDialog(primaryStage);
            if (selectedFile != null) {
                String imageUrl1=DataService.uploadImage(selectedFile.getPath(),selectedFile.getName());
               if(imageUrl1 !=null){
                System.out.println(imageUrl1);
                Image image1=new Image(imageUrl1);
                imageView2.setImage(image1);
               }
               else{
                System.out.println("No image Found");
               }
            }
        });
        // button2.setOnAction(e -> {
        //     // Open the file chooser dialog
        //     File file = fileChooserbutton2.showOpenDialog(primaryStage);
        //     if (file != null) {
        //         try {
        //             // Load the image and set it to the ImageView
        //             Image image = new Image(new FileInputStream(file));
        //             imageView2.setImage(image);
        //         } catch (FileNotFoundException ex) {
        //             ex.printStackTrace();
        //         }
        //     }
        // });


        // Create a VBox layout and add the button and ImageView
        VBox vbox1 = new VBox(button2, imageView2);
        vbox1.setSpacing(10);
        grid2.add(vbox1, 2, 9);


        // Label lb21 = new Label("a)Profile Photo:");
        //     // TextField tx20 = new TextField();
        //     // tx20.setMaxWidth(500);
        //      lb21.setFont(Font.font("abc", FontWeight.BOLD, 20));
        //      grid2.add(lb21, 1, 10);
        //     // grid2.add(tx20, 2, 9);
        //     // Create a FileChooser
        // FileChooser fileChooser2 = new FileChooser();
        // fileChooser2.getExtensionFilters().add(
        //     new FileChooser.ExtensionFilter("Image Files", ".png", ".jpg", ".jpeg", ".gif")
        // );

        // // Create an ImageView to display the selected image
        // ImageView imageView3 = new ImageView();
        // imageView3.setFitWidth(400);
        // imageView3.setPreserveRatio(true);

        // Button button3 = new Button("Choose Image");
        // FileChooser fileChooserbutton3 = new FileChooser();
        // fileChooserbutton3.getExtensionFilters()
        //         .addAll(new FileChooser.ExtensionFilter("Image Files", "*.png", "*.jpg", "*.jpeg", "*.gif"));
        // button3.setOnAction(e -> {
        //     File selectedFile1 = fileChooserbutton3.showOpenDialog(primaryStage);
        //     if (selectedFile1 != null) {
        //         String imageUrl2=DataService.uploadImage(selectedFile1.getPath(),selectedFile1.getName());
        //        if(imageUrl2 !=null){
        //         System.out.println(imageUrl2);
        //         Image image2=new Image(imageUrl2);
        //         imageView3.setImage(image2);
        //        }
        //     }
        // });

        // button3.setOnAction(e -> {
        //     // Open the file chooser dialog
        //     File file = fileChooserbutton3.showOpenDialog(primaryStage);
        //     if (file != null) {
        //         try {
        //             // Load the image and set it to the ImageView
        //             Image image1 = new Image(new FileInputStream(file));
        //             imageView3.setImage(image1);
        //         } catch (FileNotFoundException ex) {
        //             ex.printStackTrace();
        //         }
        //     }
        // });

        // Create a VBox layout and add the button and ImageView
        // VBox vbox2 = new VBox(button3, imageView3);
        // vbox2.setSpacing(10);
        // grid2.add(vbox2, 2, 10);
        

        ImageView iv2 = new ImageView("file:imagedemofarmfresh\\src\\main\\resources\\background for signup.jpg");
        iv2.setFitWidth(Screen.getPrimary().getVisualBounds().getWidth());
        iv2.setFitHeight(Screen.getPrimary().getVisualBounds().getHeight());
        iv2.setPreserveRatio(false);
        iv2.setEffect(new GaussianBlur(15));

        GridPane grid3 = new GridPane();
        grid3.setHgap(1000);
        grid3.setPadding(new Insets(20));

        Button backButton = new Button("Back");
        backButton.setStyle("-fx-background-color: rgba(144, 238, 144, 0.8); -fx-border-color: #cccccc; -fx-border-radius: 10; -fx-background-radius: 10;");
        backButton.setTextFill(Color.GREEN);
        backButton.setAlignment(Pos.CENTER);
        backButton.setPrefSize(200, 50);
        backButton.setFont(Font.font("", FontWeight.EXTRA_BOLD, 20));
        backButton.setOnAction(event -> primaryStage.setScene(scene1));
        grid3.add(backButton,0,0);

        Button signUpButton = new Button("Sign Up");
        signUpButton.setStyle("-fx-background-color: rgba(144, 238, 144, 0.8); -fx-border-color: #cccccc; -fx-border-radius: 10; -fx-background-radius: 10;");
        signUpButton.setTextFill(Color.GREEN);
        signUpButton.setAlignment(Pos.CENTER);
        signUpButton.setPrefSize(200, 50);
        signUpButton.setFont(Font.font("", FontWeight.EXTRA_BOLD, 20));
        grid3.add(signUpButton,1,0);

            signUpButton.setOnAction(new EventHandler<ActionEvent>()  {

                @Override
                public void handle(ActionEvent event) {
                    ProductProfile.usrEmail= tx4.getText();
                    System.out.println("/////////////////////////"+ProductProfile.usrEmail);
                    handleSignup(primaryStage, tx1.getText(), tx2.getText(), tx3.getText(),tx4.getText(), tx5.getText(), cb1.getValue(),cb2.getValue(), cityComboBox.getValue(),tx10.getText(),tx11.getText(),tx12.getText(),tx13.getText(),tx15.getText(),tx16.getText(),tx17.getText(),tx18.getText());
                }
    
                private void handleSignup(Stage primaryStage, String BusinessName, String FullName,String password,String Mobile_no,String Email_Id,String Products,String Address,String State,String City,String FarmDescription,String Bussiness_No,String Tax_No,String BankName,String BranchName,String IFSC_Code,String Account_No) {
                    DataService dataService;
            try{
                dataService= new DataService();
                Map<String,Object> data = new HashMap<>();
                data.put("BusinessName",BusinessName );
                data.put("Full Name", FullName);
                data.put("Password",password );
                data.put("Contact_no", Mobile_no);
                data.put("Email_Id", Email_Id);
                data.put("Product", Products);
                data.put("State",State );
                data.put("City", City);
                data.put("Address",Address );
                data.put("Farm Description", FarmDescription);
                data.put("Business No.", Bussiness_No);
                data.put("Tax no.", Tax_No);
                data.put("Bank Name", BankName);
                data.put("Branch Name", BranchName);
                data.put("IFSC code", IFSC_Code);
                data.put("Account no.", Account_No);
                data.put("url",DataService.nameimageUrl);
               
                // Custormer custormer = new Custormer();
                // custormer.setAddress(Address);
                dataService.addData("FarmersProfile ",password,data);
                String str1="User registered Successfully";

            if(data.put("Product", "Password") !=null){
                System.out.println(str1);
                //HomePage.startHomePage(primaryStage);
                TermsAndCondition.startTermsAndCondition(primaryStage);
                }else{
                    System.out.println("Fuknicha Sagla data bhar");
                }

        
             //   loginController.showLoginScene();
            }catch(Exception ex){
                System.out.println("Please Enter valid Data");
            }
            
            
        }
                   
        
                
        });

        
        Label lbTitle2 = new Label("FARMFRESH");
        lbTitle2.setFont(Font.font("", FontWeight.EXTRA_BOLD, 50));
        HBox hb2 = new HBox(lbTitle2);
        hb2.setAlignment(Pos.TOP_CENTER);
        VBox vbScene2 = new VBox(30, hb2, grid2,grid3);
        vbScene2.setAlignment(Pos.CENTER);
        vbScene2.setPadding(new Insets(20,300,20,300));

        StackPane sp2 = new StackPane(iv2, vbScene2);
        scene2 = new Scene(sp2);

        primaryStage.setScene(scene1);
        primaryStage.show();
    }
   
     public static void main(String[] args) {
        Application.launch(args);
    }
    
    


    
}