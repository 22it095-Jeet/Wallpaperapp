import 'dart:typed_data';
import 'dart:html' as html;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wallpaper_app/models/photo_model.dart';

class WallpaperView extends StatelessWidget {
  final PhotosModel wallpaper;

  const WallpaperView({
    super.key,
    required this.wallpaper,
  });

  Future<void> _save(BuildContext context) async {
    try {
      var response = await Dio().get(
        wallpaper.src!.portrait!,
        options: Options(responseType: ResponseType.bytes),
      );
      
      // Create a unique filename using timestamp
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final filename = 'wallpaper_$timestamp.jpg';
      
      // Create a blob from the image data
      final blob = html.Blob([response.data]);
      final url = html.Url.createObjectUrlFromBlob(blob);
      
      // Create an anchor element and trigger download
      final anchor = html.AnchorElement(href: url)
        ..setAttribute('download', filename)
        ..click();
      
      // Clean up the URL object
      html.Url.revokeObjectUrl(url);
      
      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Wallpaper saved as $filename'),
          duration: const Duration(seconds: 2),
        ),
      );
      
      Navigator.pop(context);
    } catch (e) {
      print('Error saving wallpaper: $e');
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to save wallpaper'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Full screen image with hero animation
          Hero(
            tag: wallpaper.src!.portrait!,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.network(
                wallpaper.src!.portrait!,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Bottom Buttons
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Set Wallpaper Button
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextButton(
                    onPressed: () => _save(context),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Column(
                      children: const [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.wallpaper,
                              color: Colors.white,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Set Wallpaper',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Click to download wallpaper',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // Cancel Button
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 