import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List Wallpaperimage=["images/wallpaper1.jpeg","images/wallpaper2.jpeg","images/wallpaper3.jpeg"]; 
  int activeIndex=0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(60),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Image.asset(
                          "images/profile.jpeg", 
                          height: 50,
                          width: 50, 
                          fit: BoxFit.cover,
                        )
                      ),
                    ),
                    Text(
                      "Wallify",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins'
                      ),
                    ),
                    const SizedBox(width: 50), // Balance the title
                  ],
                ),
                const SizedBox(height: 20.0),
                CarouselSlider.builder(
                  itemCount: Wallpaperimage.length, 
                  itemBuilder: (context, index, realIndex) {
                    final res = Wallpaperimage[index];
                    return buildImage(res, index);
                  }, 
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height * 0.6,
                    autoPlay: true,
                    viewportFraction: 1,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    onPageChanged: (index, reason) {
                      setState(() {
                        activeIndex = index;
                      });
                    }
                  )
                ),
                const SizedBox(height: 20.0),
                buildIndicator(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
    activeIndex: activeIndex, 
    count: 3, 
    effect: const SlideEffect(
      dotWidth: 15, 
      dotHeight: 15, 
      activeDotColor: Colors.blue
    ),
  );

  Widget buildImage(String urlImage, int index) => Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          blurRadius: 8,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Image.asset(
        urlImage, 
        fit: BoxFit.cover,
      )
    ),
  );
}
