import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:language_page/language_provider.dart";
import "package:provider/provider.dart";

class Newsindividualpage extends StatefulWidget {
  const Newsindividualpage({super.key});

  @override
  State<Newsindividualpage> createState() => _NewsindividualpageState();
}

class _NewsindividualpageState extends State<Newsindividualpage> {
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
        title:  FutureBuilder<String>(
              future: context.read<LanguageProvider>().translateText("News Details"),
              builder: (context, snapshot) {
                return Text(snapshot.data ??"News Details",   style:const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 26, 77, 28),
          ),);
              },
            ),
        // title: const Text(
        //   "News Details",
        //   style: TextStyle(
        //     fontSize: 25,
        //     fontWeight: FontWeight.bold,
        //     color: Color.fromARGB(255, 26, 77, 28),
        //   ),
        // ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 10,
              ),
               FutureBuilder<String>(
              future: context.read<LanguageProvider>().translateText( "First Advance Estimates for 2024-25 Kharif Crops Released; Record 1,647.05 LMT Foodgrain Production Projected"),
              builder: (context, snapshot) {
                return Text(snapshot.data ?? "First Advance Estimates for 2024-25 Kharif Crops Released; Record 1,647.05 LMT Foodgrain Production Projected",   style:const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            // color: Color.fromARGB(255, 26, 77, 28),
          ),);
              },
            ),
              // const Text(
              //     "First Advance Estimates for 2024-25 Kharif Crops Released; Record 1,647.05 LMT Foodgrain Production Projected",
              //     style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 20,
              ),
              Center(child: Image.asset("assets/news/news1.jpeg")),
              const SizedBox(
                height: 20,
              ),
               FutureBuilder<String>(
              future: context.read<LanguageProvider>().translateText(  "Agriculture Ministry projects a record 1,647.05 LMT in Kharif foodgrain production for 2024-25, driven by strong yields in rice, maize, and oilseeds. This estimate, enhanced by Digital Crop Survey data, reflects significant gains over last year,              "),
              builder: (context, snapshot) {
                return Text(snapshot.data ?? "Agriculture Ministry projects a record 1,647.05 LMT in Kharif foodgrain production for 2024-25, driven by strong yields in rice, maize, and oilseeds. This estimate, enhanced by Digital Crop Survey data, reflects significant gains over last year,              ",   style:const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            // color: Color.fromARGB(255, 26, 77, 28),
          ),);
              },
            ),
              // const Text(
              //     "Agriculture Ministry projects a record 1,647.05 LMT in Kharif foodgrain production for 2024-25, driven by strong yields in rice, maize, and oilseeds. This estimate, enhanced by Digital Crop Survey data, reflects significant gains over last year,              ",
              //     style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
              const SizedBox(
                height: 10,
              ),
              FutureBuilder<String>(
              future: context.read<LanguageProvider>().translateText( "The Ministry of Agriculture and Farmers’ Welfare has released the First Advance Estimates for major Kharif crop production in 2024-25, projecting a notable increase in foodgrain and oilseed production over the previous year. These estimates, prepared from data provided by various states and corroborated through advanced digital methods, show significant gains in rice, maize, and oilseed output."),
              builder: (context, snapshot) {
                return Text(snapshot.data ?? "The Ministry of Agriculture and Farmers’ Welfare has released the First Advance Estimates for major Kharif crop production in 2024-25, projecting a notable increase in foodgrain and oilseed production over the previous year. These estimates, prepared from data provided by various states and corroborated through advanced digital methods, show significant gains in rice, maize, and oilseed output.",   style:const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            // color: Color.fromARGB(255, 26, 77, 28),
          ),);
              },
            ),
              // const Text(
              //     "The Ministry of Agriculture and Farmers’ Welfare has released the First Advance Estimates for major Kharif crop production in 2024-25, projecting a notable increase in foodgrain and oilseed production over the previous year. These estimates, prepared from data provided by various states and corroborated through advanced digital methods, show significant gains in rice, maize, and oilseed output.",
              //     style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
              const SizedBox(
                height: 10,
              ),
              FutureBuilder<String>(
              future: context.read<LanguageProvider>().translateText( "For the first time, crop area estimates have been informed by data from the Digital Crop Survey (DCS), conducted under the Digital Agriculture Mission in collaboration with state governments. This digital method, piloted in Uttar Pradesh, Madhya Pradesh, Gujarat, and Odisha, aims to replace traditional manual surveys for greater accuracy. DCS implementation in these states has contributed to a substantial rise in rice cultivation, especially in Uttar Pradesh."),
              builder: (context, snapshot) {
                return Text(snapshot.data ??  "For the first time, crop area estimates have been informed by data from the Digital Crop Survey (DCS), conducted under the Digital Agriculture Mission in collaboration with state governments. This digital method, piloted in Uttar Pradesh, Madhya Pradesh, Gujarat, and Odisha, aims to replace traditional manual surveys for greater accuracy. DCS implementation in these states has contributed to a substantial rise in rice cultivation, especially in Uttar Pradesh.",   style:const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            // color: Color.fromARGB(255, 26, 77, 28),
          ),);
              },
            ),
              // const Text(
              //     "For the first time, crop area estimates have been informed by data from the Digital Crop Survey (DCS), conducted under the Digital Agriculture Mission in collaboration with state governments. This digital method, piloted in Uttar Pradesh, Madhya Pradesh, Gujarat, and Odisha, aims to replace traditional manual surveys for greater accuracy. DCS implementation in these states has contributed to a substantial rise in rice cultivation, especially in Uttar Pradesh.",
              //     style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
