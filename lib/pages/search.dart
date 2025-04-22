import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/models/photo_model.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper_app/widget/widget.dart';
import 'package:wallpaper_app/pages/wallpaper_view.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<PhotosModel> photos = [];
  TextEditingController searchController = TextEditingController();

  final String apiKey = "GkZGP70Xr7krTd573ESfp1BYh5zzbc4RE4wdSrjFyuA3K60p5YhhUXWr";

  Future<void> getSearchWallpaper(String searchQuery) async {
    if (searchQuery.isEmpty) return;

    final url = Uri.parse("https://api.pexels.com/v1/search?query=$searchQuery&per_page=30");

    try {
      final response = await http.get(url, headers: {"Authorization": apiKey});

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = jsonDecode(response.body);
        List<PhotosModel> fetchedPhotos = [];

        for (var element in jsonData["photos"]) {
          fetchedPhotos.add(PhotosModel.fromMap(element));
        }

        debugPrint("API Response: ${jsonData.toString()}"); // Debugging response

        if (mounted) {
          setState(() {
            photos.clear();  // Clear old results
            photos.addAll(fetchedPhotos);
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
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Container(
          margin: const EdgeInsets.only(top: 50.0),
          child: Column(
            children: [
              const Center(
                child: Text(
                  "Search Wallpapers",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: const Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: searchController,
                  textInputAction: TextInputAction.search,
                  onSubmitted: (query) => getSearchWallpaper(query),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search",
                    suffixIcon: GestureDetector(
                      onTap: () => getSearchWallpaper(searchController.text),
                      child: const Icon(
                        Icons.search_outlined,
                        color: Color.fromARGB(255, 84, 87, 93),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Expanded(
                child: photos.isEmpty
                    ? const Center(
                        child: Text(
                          "No wallpapers found",
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                      )
                    : GridView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}