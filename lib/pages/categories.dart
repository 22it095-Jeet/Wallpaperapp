// import 'package:flutter/material.dart';

// class Categories extends StatefulWidget {
//   const Categories({super.key});

//   @override
//   State<Categories> createState() => _CategoriesState();
// }

// class _CategoriesState extends State<Categories> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           margin: EdgeInsets.only(top: 50.0),
//           child: Column(
//             children: [
//               Center(
//                 child: Text(
//                   "Categories",
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 28.0,
//                     fontWeight: FontWeight.bold,
//                     fontFamily: 'Poppins',),
//                 ),
//               ),
//               SizedBox(height: 20.0,),
//               Container(
//                 margin: EdgeInsets.only(left: 20.0,right: 20.0),
//                 width: MediaQuery.of(context).size.width,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20)
//                 ),
//                 child: Stack(children: [
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(20),
//                     child: Image.asset("images/wildlife.jpg",width: MediaQuery.of(context).size.width,height: 180, fit: BoxFit.cover,)),
//                   Container(
//                     width: MediaQuery.of(context).size.width,
//                     height: 180,
//                     decoration: BoxDecoration(
//                       color: Colors.black26,
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: Center(child: Text("WildLife",style: TextStyle(color: Colors.white, fontFamily: 'Poppins', fontSize: 28.0, fontWeight: FontWeight.bold),)),
//                   )
//                 ],),
//               ),
//               SizedBox(height: 20.0,),
//               // Container(
//               //   margin: EdgeInsets.only(left: 20.0,right: 20.0),
//               //   width: MediaQuery.of(context).size.width,
//               //   decoration: BoxDecoration(
//               //       borderRadius: BorderRadius.circular(20)
//               //   ),
//               //   child: Stack(children: [
//               //     ClipRRect(
//               //       borderRadius: BorderRadius.circular(20),
//               //       child: Image.asset("images/wildlife.jpeg",width: MediaQuery.of(context).size.width,height: 180, fit: BoxFit.cover,)),
//               //     Container(
//               //       width: MediaQuery.of(context).size.width,
//               //       height: 180,
//               //       decoration: BoxDecoration(
//               //         color: Colors.black26,
//               //         borderRadius: BorderRadius.circular(20),
//               //       ),
//               //       child: Center(child: Text("foods",style: TextStyle(color: Colors.white, fontFamily: 'Poppins', fontSize: 28.0, fontWeight: FontWeight.bold),)),
//               //     )
//               //   ],),
//               // ),
//                Container(
//                 margin: EdgeInsets.only(left: 20.0,right: 20.0),
//                 width: MediaQuery.of(context).size.width,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20)
//                 ),
//                 child: Stack(children: [
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(20),
//                     child: Image.asset("images/nature.jpeg",width: MediaQuery.of(context).size.width,height: 180, fit: BoxFit.cover,)),
//                   Container(
//                     width: MediaQuery.of(context).size.width,
//                     height: 180,
//                     decoration: BoxDecoration(
//                       color: Colors.black26,
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: Center(child: Text("nature",style: TextStyle(color: Colors.white, fontFamily: 'Poppins', fontSize: 28.0, fontWeight: FontWeight.bold),)),
//                   )
//                 ],),
//               ),
//               SizedBox(height: 20.0,),
//               Container(
//                 margin: EdgeInsets.only(left: 20.0,right: 20.0),
//                 width: MediaQuery.of(context).size.width,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20)
//                 ),
//                 child: Stack(children: [
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(20),
//                     child: Image.asset("images/car.jpg",width: MediaQuery.of(context).size.width,height: 180, fit: BoxFit.cover,)),
//                   Container(
//                     width: MediaQuery.of(context).size.width,
//                     height: 180,
//                     decoration: BoxDecoration(
//                       color: Colors.black26,
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: Center(child: Text("car",style: TextStyle(color: Colors.white, fontFamily: 'Poppins', fontSize: 28.0, fontWeight: FontWeight.bold),)),
//                   )
//                 ],),
//               ),
//               SizedBox(height: 20.0,),
//                Container(
//                 margin: EdgeInsets.only(left: 20.0,right: 20.0),
//                 width: MediaQuery.of(context).size.width,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20)
//                 ),
//                 child: Stack(children: [
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(20),
//                     child: Image.asset("images/city.jpeg",width: MediaQuery.of(context).size.width,height: 180, fit: BoxFit.cover,)),
//                   Container(
//                     width: MediaQuery.of(context).size.width,
//                     height: 180,
//                     decoration: BoxDecoration(
//                       color: Colors.black26,
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: Center(child: Text("city",style: TextStyle(color: Colors.white, fontFamily: 'Poppins', fontSize: 28.0, fontWeight: FontWeight.bold),)),
//                   )
//                 ],),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:wallpaper_app/pages/category_screen.dart';
import 'package:wallpaper_app/pages/category_screen.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  void navigateToCategory(String category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategoryScreen(category: category),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 50.0),
          child: Column(
            children: [
              const Center(
                child: Text(
                  "Categories",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              categoryTile("Wildlife", "images/wildlife.jpg"),
              categoryTile("Nature", "images/nature.jpeg"),
              categoryTile("Car", "images/car.jpg"),
              categoryTile("City", "images/city.jpeg"),
            ],
          ),
        ),
      ),
    );
  }

  Widget categoryTile(String categoryName, String imagePath) {
    return GestureDetector(
      onTap: () => navigateToCategory(categoryName),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                imagePath,
                width: MediaQuery.of(context).size.width,
                height: 180,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 180,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  categoryName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}