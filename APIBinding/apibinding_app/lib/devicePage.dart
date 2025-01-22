import 'package:apibinding_app/individualDevice.dart';
import 'package:flutter/material.dart';


int globalIndex=0;
 List<dynamic> deviceList=[];

// ignore: must_be_immutable
class DevicePage extends StatelessWidget {
 
  DevicePage({super.key});

  List<String> imagesList=[
    "assets/Google pixel 6 pro.jpeg.jpg",
    "assets/Apple iphone 12 mini.jpeg.jpg",
    "assets/Apple iphone 12 pro max.jpeg.jpg",
    "assets/Apple iphone 11.jpeg.jpg",
    "assets/samsung galaxy z fold2.jpeg.jpg",
    "assets/Apple airpods.jpeg.jpg",
    "assets/Apple mackbook pro 16.jpeg.jpg",
    "assets/Apple watch series 8.jpeg.jpg",
    "assets/beats studio3 wireless.jpeg.jpg",
    "assets/apple ipad mini 5th gen 10.jpeg.jpg",
    "assets/Apple iphone 12 mini.jpeg.jpg",
    "assets/apple ipad air.jpeg.jpg",
    "assets/apple ipad air 13.jpeg.jpg",
  ];


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(
          title: const Text("Devices",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w500
            ),
          ),
          centerTitle: true,
          backgroundColor:Colors.pink,
        ),
        body: GridView.builder(
          itemCount: deviceList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2) ,
            itemBuilder: (context, index){
             return Padding(
               padding: const EdgeInsets.all(7.5),
               child: Container(
                  height: 170,
                  width: 90,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.pink,width: 2),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    // boxShadow: const [
                    //   BoxShadow(
                    //     color: Colors.purple,
                    //     blurRadius: 2,
                    //     blurStyle: BlurStyle.outer
                    //   )
                    // ]
                  ),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          deviceIndividual.clear();
                          imageIndividual.clear();
                          globalIndex=index;
                          deviceIndividual.add(deviceList[index]);
                          imageIndividual.add(imagesList[index]);
                          
                          Navigator.of(context).push(MaterialPageRoute(builder: (context){
                            return const DeviceDetails();
                          }));
                        },
                        child: Container(
                          height: 110,
                          width: 120,
                          child: Image.asset(imagesList[index],fit: BoxFit.cover,),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text("Device name:\n ${deviceList[index]['name']}")
                    ],
                  ) ,
                ),
             );

            },
          ),
    );
  }
}