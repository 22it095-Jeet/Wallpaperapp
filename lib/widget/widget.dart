import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/models/photo_model.dart';

Widget wallpaper(List<PhotosModel> listPhotos,BuildContext context){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
    padding: EdgeInsets.all(4.0),
      crossAxisCount: 2, 
      childAspectRatio: 0.6,
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
    children: listPhotos.map((PhotosModel photosModel){
      return GridTile(child: Hero(tag: photosModel.src!.portrait!, child: Container(
        child: CachedNetworkImage(imageUrl: photosModel.src!.portrait!, fit: BoxFit.cover,),
      )));
    }).toList(),
     ),
  );
} 
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:wallpaper_app/models/photo_model.dart';

// Widget wallpaper(List<PhotosModel> listPhotos, BuildContext context) {
//   return Container(
//     padding: const EdgeInsets.symmetric(horizontal: 16),
//     child: listPhotos.isNotEmpty
//         ? GridView.builder(
//             padding: const EdgeInsets.all(4.0),
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               childAspectRatio: 0.6,
//               mainAxisSpacing: 6.0,
//               crossAxisSpacing: 6.0,
//             ),
//             itemCount: listPhotos.length,
//             itemBuilder: (context, index) {
//               return GestureDetector(
//                 onTap: () {
//                   // You can navigate to full-screen wallpaper view here
//                   debugPrint("Tapped on: ${listPhotos[index].src?.portrait}");
//                 },
//                 child: GridTile(
//                   child: Hero(
//                     tag: listPhotos[index].src?.portrait ?? 'defaultTag',
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(12),
//                       child: CachedNetworkImage(
//                         imageUrl: listPhotos[index].src?.portrait ?? '',
//                         fit: BoxFit.cover,
//                         placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
//                         errorWidget: (context, url, error) => const Icon(Icons.error, color: Colors.red),
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             },
//           )
//         : const Center(
//             child: Text(
//               "No wallpapers found!",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
//             ),
//           ),
//   );
// }
