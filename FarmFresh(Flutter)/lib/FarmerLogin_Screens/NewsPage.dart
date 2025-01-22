import 'package:flutter/material.dart';
import 'package:language_page/FarmerLogin_Screens/NewsindividualPage.dart';
import 'package:language_page/language_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const NewsPageDemo());
}

class NewsPageDemo extends StatelessWidget {
  const NewsPageDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NewsPage(),
    );
  }
}

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});
  @override
  State createState() => _NewsPage();
}

class _NewsPage extends State {
  List<Map> newsList = [
    {
      "image": "assets/news/news1.jpeg",
      "header":
          "Government Approves Rs. 10,700 Crore Equity Infusion for Food Corporation of India to Boost Agricultural Sector",
      "time": "8 hour ago"
    },
    {
      "image": "assets/news/news2.jpeg",
      "header":
          "Government Approves Rs. 10,700 Crore Equity Infusion for Food Corporation of India to Boost Agricultural Sector",
      "time": "10 hour ago"
    },
    {
      "image": "assets/news/news3.jpeg",
      "header":
          "Government Approves Rs. 10,700 Crore Equity Infusion for Food Corporation of India to Boost Agricultural Sector",
      "time": "12 hour ago"
    },
    {
      "image": "assets/news/news4.jpeg",
      "header":
          "Government Approves Rs. 10,700 Crore Equity Infusion for Food Corporation of India to Boost Agricultural Sector",
      "time": "13 hour ago"
    },
    {
      "image": "assets/news/news5.jpeg",
      "header":
          "Government Approves Rs. 10,700 Crore Equity Infusion for Food Corporation of India to Boost Agricultural Sector",
      "time": "15 hour ago"
    },
    {
      "image": "assets/news/news6.jpeg",
      "header":
          "Government Approves Rs. 10,700 Crore Equity Infusion for Food Corporation of India to Boost Agricultural Sector",
      "time": "15 hour ago"
    },
    {
      "image": "assets/news/news7.jpeg",
      "header":
          "Government Approves Rs. 10,700 Crore Equity Infusion for Food Corporation of India to Boost Agricultural Sector",
      "time": "15 hour ago"
    },
    {
      "image": "assets/news/news8.jpeg",
      "header":
          "Government Approves Rs. 10,700 Crore Equity Infusion for Food Corporation of India to Boost Agricultural Sector",
      "time": "15 hour ago"
    },
    {
      "image": "assets/news/news9.jpeg",
      "header":
          "Government Approves Rs. 10,700 Crore Equity Infusion for Food Corporation of India to Boost Agricultural Sector",
      "time": "15 hour ago"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.green,
                Color.fromARGB(255, 232, 236, 233),
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
        ),
        title: FutureBuilder<String>(
          future: context.read<LanguageProvider>().translateText("News"),
          builder: (context, snapshot) {
            return Text(
              snapshot.data ?? "Delivered On:",
              style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 26, 77, 28)),
            );
          },
        ),
        // title: const Text(
        //   "News",
        //   style: TextStyle(
        //     fontSize: 25,
        //     fontWeight: FontWeight.bold,
        //     color: Color.fromARGB(255, 26, 77, 28),
        //   ),
        // ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: newsList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.only(right: 10, left: 10, bottom: 20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const Newsindividualpage()));
                    },
                    child: Container(
                      height: 120,
                      decoration: BoxDecoration(
                        //color: Colors.amber,
                        border: Border.all(color: Colors.green),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            height: 100,
                            width: 100,
                            child: Image.asset(newsList[index]["image"]),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 80,
                                width: 200,
                                child: FutureBuilder<String>(
                                  future: context
                                      .read<LanguageProvider>()
                                      .translateText(
                                          "${newsList[index]["header"]}"),
                                  builder: (context, snapshot) {
                                    return Text(
                                        snapshot.data ??
                                            "${newsList[index]["header"]}",
                                        maxLines: 4,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          // color: Color.fromARGB(255, 26, 77, 28)),
                                        ));
                                  },
                                ),
                                // child: Text(
                                //   "${newsList[index]["header"]}",
                                //   maxLines: 4,
                                //   overflow: TextOverflow.ellipsis,
                                //   style: const TextStyle(
                                //     fontSize: 14,
                                //     fontWeight: FontWeight.bold,
                                //   ),
                                // ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 130,
                                  ),
                                  //Spacer(),
                                  Text(
                                    "${newsList[index]["time"]}",
                                    style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
