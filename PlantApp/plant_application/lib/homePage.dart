import 'package:flutter/material.dart';
import 'package:plant_application/login_page.dart';

void main() {
  return runApp(const Homepage());
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const SizedBox(width: 128),
                  Container(
                    child: Image.asset("assets/plant4.png"),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "Find your\nfavorite plants",
                    style: TextStyle(fontSize: 34, fontWeight: FontWeight.w600),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.green, width: 0.7),
                    ),
                    child: const Icon(
                      Icons.shopping_bag_outlined,
                      color: Color.fromARGB(255, 7, 107, 10),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
          
              SizedBox(
                height: 130, // Set fixed height for horizontal scrolling
                child: ListView.builder(
                  scrollDirection: Axis.horizontal, // Set horizontal direction
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 108,
                        width: 310,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(204, 231, 185, 1),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10),
                                Text(
                                  "30% OFF",
                                  style: TextStyle(
                                      fontSize: 30, fontWeight: FontWeight.w800),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  "02-23 April",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400, fontSize: 18),
                                ),
                              ],
                            ),
                            const SizedBox(width: 10),
                            Container(
                              height: 130,
                              width: 120,
                              child: Image.asset("assets/plant5.png",height: 98,width: 110,),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("  Indoor",style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
              const SizedBox(
                height: 6,
              ),
              SizedBox(
                height: 200, // Set fixed height for horizontal scrolling
                child: ListView.builder(
                  scrollDirection: Axis.horizontal, // Set horizontal direction
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 188,
                        width: 141,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 244, 247, 244),
                          borderRadius: BorderRadius.all(Radius.circular(15),),
                                              ),
                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Container(
                                height: 122.8,
                                width: 110.24,
                                child: Image.asset("assets/plant6.png"),
                              ),
                            ),
                            const Text(" Snake Plants",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400),),
                            SizedBox(height: 5,),
                             Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 const Row(
                                  children: [
                                   const Icon(Icons.currency_rupee,color: Color.fromARGB(255, 40, 121, 42),weight: 23,),
                                    Text("350",style: TextStyle(fontSize: 22,color: Color.fromARGB(255, 40, 121, 42),fontWeight: FontWeight.bold),),
                                    
                                  ],
                                                           ),
                                                           Container(
                                  height:26,
                                  width: 26,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: Colors.black, width: 0.7),
                                  ),
                                  child: const Icon(
                                    Icons.shopping_bag_outlined,size: 20,
                                    color: Colors.black,
                                  ),
                                )
                               ],
                             ),
                          ],
                        )
                      ),
                    );
                  },
                ),
              ),
              const Divider(),
                  const SizedBox(
                height: 10,
              ),
              const Text("  Outdoor",style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
              const SizedBox(
                height: 6,
              ),
              SizedBox(
                height: 200, // Set fixed height for horizontal scrolling
                child: ListView.builder(
                  scrollDirection: Axis.horizontal, // Set horizontal direction
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 188,
                        width: 141,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 244, 247, 244),
                          borderRadius: BorderRadius.all(Radius.circular(15),),
                                              ),
                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Container(
                                height: 122.8,
                                width: 110.24,
                                child: Image.asset("assets/plant6.png"),
                              ),
                            ),
                            const Text(" Snake Plants",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400),),
                            SizedBox(height: 5,),
                             Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 const Row(
                                  children: [
                                   const Icon(Icons.currency_rupee,color: Color.fromARGB(255, 40, 121, 42),weight: 23,),
                                    Text("350",style: TextStyle(fontSize: 22,color: Color.fromARGB(255, 40, 121, 42),fontWeight: FontWeight.bold),),
                                    
                                  ],
                                   ),
                                    Container(
                                  height:26,
                                  width: 26,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: Colors.black, width: 0.7),
                                  ),
                                  child: const Icon(
                                    Icons.shopping_bag_outlined,size: 20,
                                    color: Colors.black,
                                  ),
                                )
                               ],
                             ),
                          ],
                        )
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 50,),
              Center(
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)
                      =>const login()
                    ));
                    mobilenoController.clear();
                  },
                  child: Container(
                    decoration: BoxDecoration(color:const Color.fromRGBO(204, 231, 185, 1),borderRadius: BorderRadius.circular(10)),
                    child:const Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 12),
                      child: const Text("SignOut",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30,),
            ],
          ),
        ),
      ),
    );
  }
}
