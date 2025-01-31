import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class YogaScreen extends StatelessWidget {
  const YogaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // List of yoga links with titles
    final List<Map<String, String>> yogaLinks = [
      {
        "title": "Yoga for Cancer Patients",
        "url": "https://youtu.be/s99Lbq6Ep48?si=UUWoC4BMJILlwxb5",
      },
      {
        "title": "Reduce Fatigue",
        "url": "https://youtu.be/NGv2dTZw12g?si=BIuZNLOUgXrcs05y",
      },
      {
        "title": "Exercises for Cancer Patients",
        "url": "https://youtu.be/cc435ONdnFY?si=qW6ei1otZFWMsGs3",
      },
      {
        "title": "Chair Exercises",
        "url": "https://youtu.be/aiRn3z7SbEc?si=HSzRZzF4pEXpZ1z0",
      },
      {
        "title": "Bed Exercises",
        "url": "https://youtu.be/yQBl8btiabk?si=-mEJ13Od6-_phn-G",
      },
      {
        "title": "Yoga for Stress and Anxiety",
        "url": "https://youtu.be/hJbRpHZr_d0?si=KjVUtxZxplrOvJ2t",
      },
    ];

    // Function to launch a URL
    void _launchURL(String url) async {
      Uri urlParsed = Uri.parse(url);
      if (await canLaunchUrl(urlParsed)) {
        await launchUrl(urlParsed);
      } else {
        throw 'Could not launch $url';
      }
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Yoga Links",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 33, 243, 240),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: Colors.white,
            height: 4.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: yogaLinks.length,
          itemBuilder: (context, index) {
            final link = yogaLinks[index];
            return Card(
              color: const Color.fromARGB(255, 33, 243, 240), // Custom card color
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                title: Text(
                  link["title"]!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black, // Text color for better contrast
                  ),
                ),
                trailing: const Icon(Icons.open_in_new, color: Colors.black),
                onTap: () => _launchURL(link["url"]!),
              ),
            );
          },
        ),
      ),
    );
  }
}
