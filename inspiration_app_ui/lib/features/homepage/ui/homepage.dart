import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(244, 243, 243, 1),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          color: Colors.black87,
          onPressed: (){},
          icon: const Icon(
            Icons.menu)
        ), 
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30))
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text("Find Your", style: TextStyle(
                    color: Colors.black87,
                    fontSize: 25,
                    ),
                  ),
                  const SizedBox(
                    height: 5
                  ),
                  const Text("Inspiration", style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.bold
                    )
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(244, 244, 243, 1),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.search, 
                          color: Colors.black87),
                        hintText: "Search you're looking for",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 15)
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    "Promo Today", 
                    style: TextStyle(
                      fontSize: 15, 
                      fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 15
                  ),
                  Container(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        promoCard("assets/images/one.jpg"),
                        promoCard("assets/images/two.jpg"),
                        promoCard("assets/images/three.jpg"),
                        promoCard("assets/images/four.jpg")
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20
                  ),
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/three.jpg"))
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          stops: const [0.3, 0.9],
                          colors: [
                            Colors.black.withOpacity(.8),
                            Colors.black.withOpacity(.2)
                          ] )
                      ),
                      child: const Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            "Best Design", 
                            style: TextStyle(
                              color: Colors.white, 
                              fontSize: 20),),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        )),
    );
  }

  Widget promoCard(images){
    return AspectRatio(
      aspectRatio: 2.62 / 3,
      child: Container(
        margin: const EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(images),
            fit: BoxFit.cover
          )
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              stops: const [0.1, 0.9],
              colors: [
                Colors.black.withOpacity(.8),
                Colors.black.withOpacity(.1)
              ] )
          ),
        ),
      ),
    );
  }
}