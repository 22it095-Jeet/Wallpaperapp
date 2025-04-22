import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper_app/models/photo_model.dart';
import 'package:wallpaper_app/pages/wallpaper_view.dart';

class CategoryScreen extends StatefulWidget {
  final String category;
  const CategoryScreen({super.key, required this.category});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<PhotosModel> photos = [];
  final String apiKey = "GkZGP70Xr7krTd573ESfp1BYh5zzbc4RE4wdSrjFyuA3K60p5YhhUXWr";

  @override
  void initState() {
    super.initState();
    getCategoryWallpapers(widget.category);
  }

  Future<void> getCategoryWallpapers(String category) async {
    final url = Uri.parse("https://api.pexels.com/v1/search?query=$category&per_page=30");

    try {
      final response = await http.get(url, headers: {"Authorization": apiKey});

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = jsonDecode(response.body);
        List<PhotosModel> fetchedPhotos = [];

        for (var element in jsonData["photos"]) {
          fetchedPhotos.add(PhotosModel.fromMap(element));
        }

        if (mounted) {
          setState(() {
            photos = fetchedPhotos;
          });
        }
      } else {
        debugPrint("Error fetching data: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Exception: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: photos.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 6.0,
                mainAxisSpacing: 6.0,
                childAspectRatio: 0.6,
              ),
              itemCount: photos.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WallpaperView(
                          wallpaper: photos[index],
                        ),
                      ),
                    );
                  },
                  child: Hero(
                    tag: photos[index].src!.portrait!,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(
                          photos[index].src!.portrait!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
