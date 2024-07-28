import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        // Background image container
        Container(
          height: screenHeight * 0.5, // Set height to 40% of screen height
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Overlay widgets
        SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: screenHeight * 0.05), // Adjust to move the content below the image
              Container(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'Find Your',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    const Text(
                      'Inspiration',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Container(
                      padding: EdgeInsets.all(screenHeight * 0.01),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(244, 243, 243, 1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.black87,
                          ),
                          hintText: "Search you're looking for",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.05),
                    const Text(
                      'Promo Today',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    SizedBox(
                      height: screenHeight * 0.25, // Adjust height based on promo card size
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          promoCard('assets/images/one.jpg'),
                          promoCard('assets/images/two.jpg'),
                          promoCard('assets/images/three.jpg'),
                          promoCard('assets/images/four.jpg'),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    buildPromoContainer(screenHeight, 'assets/images/three.jpg', 'Best Design'),
                    SizedBox(height: screenHeight * 0.015),
                    SizedBox(
                      height: screenHeight * 0.25, // Adjust height based on promo card size
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          promoCard('assets/images/one.jpg'),
                          promoCard('assets/images/two.jpg'),
                          promoCard('assets/images/three.jpg'),
                          promoCard('assets/images/four.jpg'),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    buildPromoContainer(screenHeight, 'assets/images/three.jpg', 'Best Design'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget promoCard(String image) {
    return AspectRatio(
      aspectRatio: 2.62 / 3,
      child: Container(
        margin: const EdgeInsets.only(right: 15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(image),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              stops: const [0.1, 0.9],
              colors: [
                Colors.black.withOpacity(.8),
                Colors.black.withOpacity(.1),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPromoContainer(double screenHeight, String imagePath, String text) {
    return Container(
      height: screenHeight * 0.25, // Adjust height based on your design
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(imagePath),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            stops: const [0.3, 0.9],
            colors: [
              Colors.black.withOpacity(.8),
              Colors.black.withOpacity(.2),
            ],
          ),
        ),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: EdgeInsets.all(screenHeight * 0.02),
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
