
import 'package:flutter/material.dart';

List<dynamic> deviceIndividual=[];
List<String> imageIndividual=[];

class DeviceDetails extends StatelessWidget {
  const DeviceDetails({super.key});

  @override
  Widget build(BuildContext context) {
     
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 212, 224),
      appBar: AppBar(
        title: const Text("Device Details",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w500
            ),
          ),
          centerTitle: true,
          backgroundColor:Colors.pink,
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              width: 330,
              decoration: BoxDecoration(
                
                      border: Border.all(color: Colors.pink),
                      color:Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.purple,
                          blurRadius: 2,
                          blurStyle: BlurStyle.outer
                        )
                      ]
                    ),
            child: Image.asset(imageIndividual[0]),
            ),
            const SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const Text("Device name: ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                Expanded(child: Text(deviceIndividual[0]['name'],style: const TextStyle(fontSize: 24,color: Colors.pink,fontWeight: FontWeight.w500)))
              ],
            ),
            // const SizedBox(height: 40,),
            // Text("Device details: ${deviceIndividual[0]}"),
            const SizedBox(height: 25,),
            const Text("Details: ",style: const TextStyle(fontSize: 20)),

            deviceIndividual[0]['data']==null ?
              const Text("No device data") :
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    (deviceIndividual[0]['data']['color']==null?
                    const SizedBox()
                    :
                    Text("Device Color: ${deviceIndividual[0]['data']['color']}",style: const TextStyle(fontSize: 15,))),

                    (deviceIndividual[0]['data']['capacity']==null ?
                    const SizedBox()
                    :Text("Device Capacity: ${deviceIndividual[0]['data']['capacity']}")),

                     (deviceIndividual[0]['data']['Capacity']==null ?
                    const SizedBox()
                    :Text("Device Capacity: ${deviceIndividual[0]['data']['Capacity']}")),

                    (deviceIndividual[0]['data']['price']==null ?
                    const SizedBox()
                    :
                    Text("Device Price: ${deviceIndividual[0]['data']['price']}")),

                    (deviceIndividual[0]['data']['generation']==null ?
                  const SizedBox()
                    :
                    Text("Device Generation: ${deviceIndividual[0]['data']['generation']}")),

                     (deviceIndividual[0]['data']['Generation']==null ?
                  const SizedBox()
                    :
                    Text("Device Generation: ${deviceIndividual[0]['data']['Generation']}")),

                    (deviceIndividual[0]['data']['Screen size']==null ?
                  const SizedBox()
                    :
                    Text("Device Generation: ${deviceIndividual[0]['data']['Generation']}")),

                  ]
              ),
          ],
        ),
      ),
    );
  }
}