package com.farmfresh1.Fruits;

import javafx.application.Application;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.scene.text.Font;
import javafx.scene.text.FontWeight;
import javafx.stage.Screen;
import javafx.stage.Stage;

import java.util.Map;
import java.util.concurrent.ExecutionException;

import com.farmfresh1.Fruit.DataService;
import com.google.cloud.firestore.DocumentSnapshot;

public class ProfileFetch extends Application {
    public static Scene scene;

    @Override
    public void start(Stage primaryStage) throws ExecutionException, InterruptedException {
        primaryStage.setWidth(1930);
        primaryStage.setHeight(1060);

        GridPane grid = new GridPane();
        grid.setVgap(20);
        grid.setHgap(20);
        grid.setAlignment(Pos.CENTER);
        grid.setPadding(new Insets(20, 20, 20, 20));
        grid.setStyle("-fx-background-color: rgba(240, 240, 240, 0.8); -fx-border-color: #cccccc; -fx-border-radius: 10; -fx-background-radius: 10;");

        // String productName = "fdfvfdv"; // Replace with the actual product name to fetch
        // DataService dataService = new DataService();
        // Map<String, Object> data = (Map<String, Object>) dataService.getData("SellerProductInfo", productName);

        // if (data != null) {
        //     addLabelAndValue(grid, "Product Name:", (String) data.get("Product Name"), 0);
        //     addLabelAndValue(grid, "Category:", (String) data.get("Category"), 1);
        //     addLabelAndValue(grid, "Description:", (String) data.get("Description"), 2);
        //     addLabelAndValue(grid, "Variety:", (String) data.get("Variety"), 3);
        //     addLabelAndValue(grid, "Quantity:", (String) data.get("Quantity"), 4);
        //     addLabelAndValue(grid, "Price:", (String) data.get("Price"), 5);
        //     addLabelAndValue(grid, "Packaging Details:", (String) data.get("Packaging Details"), 6);
        //     //addLabelAndValue(grid, "Harvest Date:", data.get("Harvest Date").toString(), 7);
        //     //addLabelAndValue(grid, "Expiry Date:", data.get("Expiry Date").toString(), 8);

            Label lb13 = new Label("Product photo:");
            lb13.setFont(Font.font("abc", FontWeight.BOLD, 20));
            grid.add(lb13, 0, 9);

            ImageView imageView = new ImageView();
            imageView.setFitWidth(400);
            imageView.setPreserveRatio(true);

            // Mock image URL
            // String imageUrl = DataService.uploadImage("path/to/image", "image");
            // Image image = new Image(imageUrl);
            // imageView.setImage(image);

            VBox vbox = new VBox(imageView);
            vbox.setSpacing(10);
            grid.add(vbox, 1, 9);
        }

        VBox vb1 = new VBox();
        vb1.setAlignment(Pos.CENTER);
        Label lbTitle1 = new Label("FARMFRESH");
        lbTitle1.setFont(Font.font("", FontWeight.EXTRA_BOLD, 50));
        HBox hb1 = new HBox(lbTitle1);
        hb1.setAlignment(Pos.TOP_CENTER);
        hb1.setStyle("-fx-background-color:rgb(144,238,144)");
        VBox vbScene1 = new VBox(30, hb1, grid, vb1);
        vbScene1.setAlignment(Pos.CENTER);
        vbScene1.setPadding(new Insets(20, 300, 20, 300));

        scene = new Scene(vbScene1);

        primaryStage.setScene(scene);
        Screen screen = Screen.getPrimary();
        javafx.geometry.Rectangle2D bounds = screen.getVisualBounds();

        primaryStage.setX(bounds.getMinX());
        primaryStage.setY(bounds.getMinY());
        primaryStage.setWidth(bounds.getWidth());
        primaryStage.setHeight(bounds.getHeight());
        primaryStage.show();
    }

    private void addLabelAndValue(GridPane grid, String label, String value, int row) {
        Label lb = new Label(label);
        lb.setFont(Font.font("abc", FontWeight.BOLD, 20));
        Label val = new Label(value);
        val.setFont(Font.font("abc", 20));
        grid.add(lb, 0, row);
        grid.add(val, 1, row);
    }

    public static void main(String[] args) {
        Application.launch(args);
    }
}

