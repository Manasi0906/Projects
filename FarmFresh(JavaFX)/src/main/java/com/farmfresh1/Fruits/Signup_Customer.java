// package com.farmfresh1.Fruits;
// import java.util.HashMap;

// import java.util.Map;

// import com.farmfresh1.Fruit.DataService;
// import com.farmfresh1.Fruits.EmptyDataException;
// import javafx.application.Application;
// import javafx.collections.FXCollections;
// import javafx.collections.ObservableList;
// import javafx.event.ActionEvent;
// import javafx.event.EventHandler;
// import javafx.geometry.Insets;
// import javafx.geometry.Pos;
// import javafx.scene.Scene;
// import javafx.scene.control.Button;
// import javafx.scene.control.ComboBox;
// import javafx.scene.control.Label;
// import javafx.scene.control.PasswordField;
// import javafx.scene.control.TextField;
// import javafx.scene.effect.GaussianBlur;
// import javafx.scene.image.ImageView;
// import javafx.scene.layout.GridPane;
// import javafx.scene.layout.HBox;
// import javafx.scene.layout.StackPane;
// import javafx.scene.layout.VBox;
// import javafx.scene.paint.Color;
// import javafx.scene.text.Font;
// import javafx.scene.text.FontWeight;
// import javafx.stage.Screen;
// import javafx.stage.Stage;

// // public class Signup_Customer {
// //    // video obj=new video();
// //     public static Scene sc;

// //     public static void startSignup_Customer (Stage primaryStage){

// public class Signup_Customer{
//    // private LoginController loginController;
//  //   public Signup_Customer(LoginController loginController){
//      //   this.loginController= loginController;
//      public static Label lbbb;
//      public VBox vbbb;
    
//     public static void startSignup_Customer(Stage primaryStage) throws EmptyDataException{

//             primaryStage.setWidth(1930);
//             primaryStage.setHeight(1060);
//             GridPane grid = new GridPane();
//             grid.setVgap(20);
//             grid.setHgap(20);
//             grid.setAlignment(Pos.CENTER);
//             grid.setPrefSize(300, 600);
//             grid.setPadding(new Insets(10,50,10,50));
//             //grid.setStyle("-fx-background-Color:rgba(240,240,240.0.8)");
            
//             Label lb1 = new Label();
//             lb1.setText("FullName:");
//             TextField tx1 = new TextField();
//             //tx1.setMaxWidth(400);
//             lb1.setFont(Font.font("abc", FontWeight.BOLD, 20));
//             tx1.setMaxWidth(600);
//             grid.add(lb1, 0, 1);
//             grid.add(tx1, 1, 1);

//             Label lb2 = new Label("Email Id:");
//             TextField tx2 = new TextField();
//             tx2.setMaxWidth(400);
//             lb2.setFont(Font.font("abc", FontWeight.BOLD, 20));
//             grid.add(lb2, 0, 2);
//             grid.add(tx2, 1, 2);

//             Label lb3 = new Label("Password:");
//             PasswordField tx3 = new PasswordField();
//             tx3.setMaxSize(400, 100);
//             lb3.setFont(Font.font("abc", FontWeight.BOLD, 20));
//             grid.add(lb3, 0, 3);
//             grid.add(tx3, 1, 3);
//             Label lb4 = new Label("(minimum 8 characters)");
//             grid.add(lb4, 1, 4);
        
//             Label lb5 = new Label("Contact no.:");
//             TextField tx5 = new TextField();
//             tx5.setMaxWidth(400);
//             lb5.setFont(Font.font("abc", FontWeight.BOLD, 20));
//             grid.add(lb5, 0, 5);
//             grid.add(tx5, 1, 5);

//             Label lb6 = new Label("State:");
//             lb6.setFont(Font.font("abc", FontWeight.BOLD, 20));
//             ComboBox<String> cb1 = new ComboBox<>();
//             cb1.getItems().addAll("Andhra Pradesh", "Arunachal Pradesh", "Assam", "Bihar", "Chhattisgarh",
//             "Goa", "Gujarat", "Haryana", "Himachal Pradesh", "Jharkhand",
//             "Karnataka", "Kerala", "Madhya Pradesh", "Maharashtra", "Manipur",
//             "Meghalaya", "Mizoram", "Nagaland", "Odisha", "Punjab",
//             "Rajasthan", "Sikkim", "Tamil Nadu", "Telangana", "Tripura",
//             "Uttar Pradesh", "Uttarakhand", "West Bengal");
//             cb1.setMaxWidth(600);
//             grid.add(lb6, 0, 6);
//             grid.add(cb1, 1, 6);

//             Label lb7 = new Label("City:");
//             TextField tx7 = new TextField();
//             tx7.setMaxWidth(400);
//             lb7.setFont(Font.font("abc", FontWeight.BOLD, 20));
//             grid.add(lb7, 0, 7);

//             ComboBox<String> cityComboBox = new ComboBox<>();
//             cityComboBox.setMaxWidth(600);
//             grid.add(cityComboBox, 1, 7);

//             Map<String, String[]> stateToCities = new HashMap<>();
//             stateToCities.put("Andhra Pradesh", new String[]{"Visakhapatnam", "Vijayawada", "Guntur", "Nellore"});
//             stateToCities.put("Arunachal Pradesh", new String[]{"Itanagar", "Naharlagun"});
//             stateToCities.put("Assam", new String[]{"Guwahati", "Silchar", "Dibrugarh", "Jorhat"});
//             stateToCities.put("Bihar", new String[]{"Patna", "Gaya", "Bhagalpur", "Muzaffarpur"});
//             stateToCities.put("Chhattisgarh", new String[]{"Raipur", "Bhilai", "Bilaspur", "Korba"});
//             stateToCities.put("Goa", new String[]{"Panaji", "Margao", "Vasco da Gama", "Mapusa"});
//             stateToCities.put("Gujarat", new String[]{"Ahmedabad", "Surat", "Vadodara", "Rajkot"});
//             stateToCities.put("Haryana", new String[]{"Gurgaon", "Faridabad", "Panipat", "Ambala"});
//             stateToCities.put("Himachal Pradesh", new String[]{"Shimla", "Manali", "Dharamshala", "Solan"});
//             stateToCities.put("Jharkhand", new String[]{"Ranchi", "Jamshedpur", "Dhanbad", "Bokaro"});
//             stateToCities.put("Karnataka", new String[]{"Bengaluru", "Mysore", "Hubli", "Mangalore"});
//             stateToCities.put("Kerala", new String[]{"Thiruvananthapuram", "Kochi", "Kozhikode", "Thrissur"});
//             stateToCities.put("Madhya Pradesh", new String[]{"Bhopal", "Indore", "Gwalior", "Jabalpur"});
//             stateToCities.put("Maharashtra", new String[]{"Ahmadnagar","Mumbai", "Pune", "Nagpur", "satara","Thane", "Nashik"});
//             stateToCities.put("Manipur", new String[]{"Imphal", "Thoubal"});
//             stateToCities.put("Meghalaya", new String[]{"Shillong", "Tura"});
//             stateToCities.put("Mizoram", new String[]{"Aizawl", "Lunglei"});
//             stateToCities.put("Nagaland", new String[]{"Kohima", "Dimapur"});
//             stateToCities.put("Odisha", new String[]{"Bhubaneswar", "Cuttack", "Rourkela", "Sambalpur"});
//             stateToCities.put("Punjab", new String[]{"Chandigarh", "Ludhiana", "Amritsar", "Jalandhar"});
//             stateToCities.put("Rajasthan", new String[]{"Jaipur", "Jodhpur", "Udaipur", "Kota"});
//             stateToCities.put("Sikkim", new String[]{"Gangtok"});
//             stateToCities.put("Tamil Nadu", new String[]{"Chennai", "Coimbatore", "Madurai", "Tiruchirappalli"});
//             stateToCities.put("Telangana", new String[]{"Hyderabad", "Warangal", "Nizamabad", "Karimnagar"});
//             stateToCities.put("Tripura", new String[]{"Agartala"});
//             stateToCities.put("Uttar Pradesh", new String[]{"Lucknow", "Kanpur", "Ghaziabad", "Agra"});
//             stateToCities.put("Uttarakhand", new String[]{"Dehradun", "Haridwar", "Nainital", "Rishikesh"});
//             stateToCities.put("West Bengal", new String[]{"Kolkata", "Howrah", "Durgapur", "Siliguri"});

//             cb1.setOnAction(e -> {
//                 String selectedState = cb1.getValue();
//                 if (selectedState != null && stateToCities.containsKey(selectedState)) {
//                     cityComboBox.setItems(FXCollections.observableArrayList(stateToCities.get(selectedState)));
//                 } else {
//                     cityComboBox.setItems(FXCollections.observableArrayList());
//                 }
//             });

//             Label lb8 = new Label("Address:");
//             TextField tx8 = new TextField();
//             tx8.setMaxWidth(400);
//             lb8.setFont(Font.font("abc", FontWeight.BOLD, 20));
//             grid.add(lb8, 0, 8);
//             grid.add(tx8, 1, 8);

//             javafx.geometry.Rectangle2D screenBound = Screen.getPrimary().getVisualBounds();
//            grid.setStyle("-fx-background-color: rgba(240, 240, 240, 0.8); -fx-border-color: #cccccc; -fx-border-radius: 10; -fx-background-radius:10;");

//             ImageView iv = new ImageView("https://pixnio.com/free-images/2021/07/24/2021-07-24-12-08-17.jpg");
//             iv.setFitWidth(screenBound.getWidth());
//             iv.setFitHeight(screenBound.getHeight());
//             iv.setPreserveRatio(false);
//             iv.setEffect(new GaussianBlur(15));
//             grid.add(iv, 0, 0);
//             Button bt=new Button("Signup");
//             bt.setStyle("-fx-background-color: rgba(144, 238, 144, 0.8); -fx-border-color: #cccccc; -fx-border-radius: 10; -fx-background-radius:10;");
//             bt.setTextFill(Color.GREEN);

//             bt.setMaxSize(200, 50);
//             bt.setFont(Font.font("", FontWeight.EXTRA_BOLD, 20));
           
//              GridPane grid4 = new GridPane();
       
//             grid4.setHgap(300);

//             bt.setOnAction(new EventHandler<ActionEvent>()  {

//             @Override
//             public void handle(ActionEvent event) {
//                 ProductProfile.usrEmail=tx2.getText();
//                 handleSignup(primaryStage, tx1.getText(), tx2.getText(), tx3.getText(), tx5.getText(), cb1.getValue(), cityComboBox.getValue(),tx8.getText());
//             }

//             private void handleSignup(Stage primaryStage, String FullName, String Email_Id,String password,String Mobile_no,String State,String City,String Address) {
//                 DataService dataService;
//         try{
//             dataService= new DataService();
//             Map<String,Object> data = new HashMap<>();
//             data.put("FullName",FullName );
//             data.put("Email_Id", Email_Id);
//             data.put("Password",password );
//             data.put("Contact_no", Mobile_no);
//             data.put("State",State);
//             data.put("City", City);
//             data.put("Address",Address );
// // 
//             //dataService.addData("Costomers: ","document",data);
//             dataService.addData("Customer ",Email_Id,data);
//                 String str1="User registered Successfully";

//                 if((FullName !=null) && (FullName!=null)&&(Email_Id!=null)&&(password!=null) && (Mobile_no!=null)&& (State!=null)&& (City !=null) && (Address!=null)){
               
//                     //System.out.println(str1);
//                     //HomePage.startHomePage(primaryStage);
//                     //TermsAndCondition.startTermsAndCondition(primaryStage);
//                    // throw new EmptyDataException("Please fill all the feilds");
//                    System.out.println(str1);
//                     ProductProfile.startProductProfile(primaryStage);
//                 }
//                 else{
//                     System.out.println("Data is not right");
//                     //TermsAndCondition.startTermsAndCondition(primaryStage);
//                      throw new EmptyDataException("Please fill all the feilds!!");
                    
//                 }
//             }
//             catch(EmptyDataException  ede){
            
//                // System.out.println(ede.getMessage());
//                 String edemessege=ede.getMessage();
//                  lbbb=new Label();
//                 lbbb.setText(edemessege);
//                 lbbb.setFont(new Font(30));
//                 lbbb.setTextFill(Color.DARKGREY);
//                 // vbbb=new VBox(lbbb);
//                 grid4.add(lbbb,1,1);
//                // vbbb.setPadding(new Insets(800, 500, 200, 500));             
//             }
//             catch(Exception e){
//                 System.out.println(e.getMessage());
//             }
//         }
    
// }
// );
        
        
            
    
//                 VBox vb1=new VBox(bt);
//                 vb1.setAlignment(Pos.CENTER);
//                 Label lb=new Label("FARMFRESH");
//                 lb.setFont(Font.font("", FontWeight.EXTRA_BOLD, 50));
//                 HBox hb=new HBox(lb);
//                 hb.setAlignment(Pos.TOP_CENTER);
//                 VBox vb = new VBox(30, hb,grid,vb1,grid4);
//                 vb.setPrefSize(300, 600);
//                 vb.setAlignment(Pos.CENTER);
//                 vb.setPadding(new Insets(30,500,30,500));
//                 StackPane sp = new StackPane();
//                 sp.getChildren().addAll(iv, vb);

//                 Scene sc = new Scene(sp);
//                 primaryStage.setScene(sc);
//                 primaryStage.show();

        
//     // private void handleSignup(Stage primaryStage, String FullName, String password){
//     //     DataService dataService;
//     //     try{
//     //         dataService= new DataService();
//     //         Map<String,Object> data = new HashMap<>();
//     //         data.put("password", password);
//     //         data.put("username", FullName);
//     //         dataService.addData("users",username,data);
//     //         System.out.println("User registered successfully");
//     //      //   loginController.showLoginScene();
//     //     }catch(Exception ex){
//     //         ex.printStackTrace();
//     //     }
//     // }
//      }
//     }


package com.farmfresh1.Fruits;


import java.util.HashMap;
import java.util.Map;

import com.farmfresh1.Fruit.DataService;
import com.farmfresh1.model.Custormer;
import com.farmfresh1.Fruits.EmptyDataException;
import javafx.application.Application;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.ComboBox;
import javafx.scene.control.Label;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;
import javafx.scene.effect.GaussianBlur;
import javafx.scene.image.ImageView;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.StackPane;
import javafx.scene.layout.VBox;
import javafx.scene.paint.Color;
import javafx.scene.text.Font;
import javafx.scene.text.FontWeight;
import javafx.stage.Screen;
import javafx.stage.Stage;

// public class Signup_Customer {
//    // video obj=new video();
//     public static Scene sc;

//     public static void startSignup_Customer (Stage primaryStage){

public class Signup_Customer{
   // private LoginController loginController;
 //   public Signup_Customer(LoginController loginController){
     //   this.loginController= loginController;
     public static Label lbbb;
     public VBox vbbb;
    
    public static void startSignup_Customer(Stage primaryStage) throws EmptyDataException,Exception{

            primaryStage.setWidth(1930);
            primaryStage.setHeight(1060);
            GridPane grid = new GridPane();
            grid.setVgap(20);
            grid.setHgap(20);
            grid.setAlignment(Pos.CENTER);
            grid.setPrefSize(300, 600);
            grid.setPadding(new Insets(10,50,10,50));
            //grid.setStyle("-fx-background-Color:rgba(240,240,240.0.8)");
            
            Label lb1 = new Label();
            lb1.setText("FullName:");
            TextField tx1 = new TextField();
            //tx1.setMaxWidth(400);
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

            Label lb3 = new Label("Password:");
            PasswordField tx3 = new PasswordField();
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
            stateToCities.put("Maharashtra", new String[]{"Ahmadnagar","Mumbai", "Pune", "Nagpur", "satara","Thane", "Nashik"});
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

            Label lb8 = new Label("Address:");
            TextField tx8 = new TextField();
            tx8.setMaxWidth(400);
            lb8.setFont(Font.font("abc", FontWeight.BOLD, 20));
            grid.add(lb8, 0, 8);
            grid.add(tx8, 1, 8);

            javafx.geometry.Rectangle2D screenBound = Screen.getPrimary().getVisualBounds();
           grid.setStyle("-fx-background-color: rgba(240, 240, 240, 0.8); -fx-border-color: #cccccc; -fx-border-radius: 10; -fx-background-radius:10;");

            ImageView iv = new ImageView("https://pixnio.com/free-images/2021/07/24/2021-07-24-12-08-17.jpg");
            iv.setFitWidth(screenBound.getWidth());
            iv.setFitHeight(screenBound.getHeight());
            iv.setPreserveRatio(false);
            iv.setEffect(new GaussianBlur(15));
            grid.add(iv, 0, 0);
            Button bt=new Button("Signup");
            bt.setStyle("-fx-background-color: rgba(144, 238, 144, 0.8); -fx-border-color: #cccccc; -fx-border-radius: 10; -fx-background-radius:10;");
            bt.setTextFill(Color.GREEN);

            bt.setMaxSize(200, 50);
            bt.setFont(Font.font("", FontWeight.EXTRA_BOLD, 20));
           
            VBox vb1=new VBox(bt);
            vb1.setAlignment(Pos.CENTER);
            Label lb=new Label("FARMFRESH");
            lb.setFont(Font.font("", FontWeight.EXTRA_BOLD, 50));
            HBox hb=new HBox(lb);
            hb.setAlignment(Pos.TOP_CENTER);
            VBox vb = new VBox(30, hb,grid,vb1);
            vb.setPrefSize(300, 600);
            vb.setAlignment(Pos.CENTER);
            vb.setPadding(new Insets(30,500,30,500));
            StackPane sp = new StackPane();
            sp.getChildren().addAll(iv, vb);
            
            Scene sc = new Scene(sp);
             primaryStage.setScene(sc);
             primaryStage.show();



            bt.setOnAction(new EventHandler<ActionEvent>()  {

            @Override
            public void handle(ActionEvent event) {
                try {
                    ProductProfile.usrEmail= tx2.getText();
                    System.out.println("/////////////////////////"+ProductProfile.usrEmail);
                    handleSignup(primaryStage, tx1.getText(), tx2.getText(), tx3.getText(), tx5.getText(), cb1.getValue(), cityComboBox.getValue(),tx8.getText());
                    
                } catch (Exception e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            }

            private void handleSignup(Stage primaryStage, String FullName, String Email_Id,String password,String Mobile_no,String string,String string2,String Address) throws Exception {
                DataService dataService;
        try{
            dataService= new DataService();
            Map<String,Object> data = new HashMap<>();
            data.put("FullName",FullName );
            System.out.println(data.put("FullName", FullName));
            data.put("Email_Id", Email_Id);
            data.put("Password",password );
            data.put("Contact_no", Mobile_no);
            data.put("State",string );
            data.put("City", string2);
            data.put("Address",Address );
           
            // Custormer custormer = new Custormer();
            // custormer.setAddress(Address);
            // custormer.setFullname(FullName);
            // custormer.setEmail_id(Email_Id);
            // custormer.setPassword(password);
            // custormer.setCity(string2);
            // custormer.setState(string);
            // custormer.setContact_no(Mobile_no);

            dataService.addData("Customer",Email_Id,data);
            String str1="User registered successfully";
         //   loginController.showLoginScene();

         if((FullName !=null) && (FullName!=null)&&(Email_Id!=null)&&(password!=null) && (Mobile_no!=null)&& (string!=null)&& (string2 !=null) && (Address!=null)){
               
                                //System.out.println(str1);
                                //HomePage.startHomePage(primaryStage);
                                //TermsAndCondition.startTermsAndCondition(primaryStage);
                               // throw new EmptyDataException("Please fill all the feilds");
                               System.out.println(str1);
                                ProductProfile.startProductProfile(primaryStage);
                            }
                            else{
                                System.out.println("Data is not right");
                                //TermsAndCondition.startTermsAndCondition(primaryStage);
                                 throw new EmptyDataException("Please fill all the feilds!!");
                                
                            }
                        }
                        catch(EmptyDataException  ede){
                        
                           // System.out.println(ede.getMessage());
                            String edemessege=ede.getMessage();
                            lbbb=new Label();
                            lbbb.setText(edemessege);
                            lbbb.setFont(new Font(30));
                            lbbb.setTextFill(Color.BLACK);
                            // vbbb=new VBox(lbbb);
                            grid.add(lbbb,0,10);
                           // vbbb.setPadding(new Insets(800, 500, 200, 500));             
                        }
                        catch(Exception e){
                            System.out.println(e.getMessage());
                        }
                    }
                
                    
                });

        }
        //ProductProfile.startProductProfile(primaryStage);
    
               
         
            
   

             
    // private void handleSignup(Stage primaryStage, String FullName, String password){
    //     DataService dataService;
    //     try{
    //         dataService= new DataService();
    //         Map<String,Object> data = new HashMap<>();
    //         data.put("password", password);
    //         data.put("username", FullName);
    //         dataService.addData("users",username,data);
    //         System.out.println("User registered successfully");
    //      //   loginController.showLoginScene();
    //     }catch(Exception ex){
    //         ex.printStackTrace();
    //     }
    // }
     
     public static void main(String[] args) {
        Application.launch(args);
     }
     
}