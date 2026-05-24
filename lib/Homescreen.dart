import 'package:flutter/material.dart';
import 'package:lyrics_finder_app/utils/style.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final TextEditingController artist = TextEditingController();
  final TextEditingController songtitle = TextEditingController();

  String lyrics = '';
  bool isloading = false;

  void getData() async {
    var url =
        Uri.parse('https://api.lyrics.ovh/v1/${artist.text}/${songtitle.text}'); 
    Response rs = await get(url);
    Map urs = jsonDecode(rs.body);

    setState(() {
      isloading = false;
      lyrics = urs['lyrics'];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lyrics Finder'),
        leading: (const Icon(Icons.music_note)),  //add an icon
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/OIP.jpeg"),  //add an image to the background
              fit: BoxFit.cover,
              alignment: Alignment.topCenter),
        ),
        child: SafeArea(
          child: Padding(
            padding: Mainapppading.main,
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Get Your Lyrics Now",
                      style: GoogleFonts.abhayaLibre(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    Container(
                      width: double.infinity,
                      height: 208.0,
                      decoration: BoxDecoration(
                        borderRadius: Containerborderradius.main,
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color.fromARGB(150, 255, 0, 0),
                            Color.fromARGB(150, 0, 26, 255)
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 40.0,
                              child: TextField(       //Input artist name field
                                textAlign: TextAlign.center,
                                controller: artist,
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderRadius: Inputborderradius.main),
                                  hintText: 'Enter artist name',
                                ),
                              ),
                            ),
                            const SizedBox(height: 20.0),      //spacebetween
                            SizedBox(
                              height: 40.0,
                              child: TextField(        //Input song title field
                                textAlign: TextAlign.center,
                                controller: songtitle,
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderRadius: Inputborderradius.main),
                                  hintText: 'Enter song title',
                                ),
                              ),
                            ),
                            const SizedBox(height: 20.0),       //spacebetween
                            MaterialButton(     // add button to get geta
                              color: Colors.blue,
                              onPressed: () {
                                isloading = true;
                                getData();
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: Inputborderradius.main),
                              textColor: Colors.white,
                              child: const Text('Search'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Lyrics',
                          style: GoogleFonts.rozhaOne(
                              fontSize: 28.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        const SizedBox(height: 30.0), //spacebetween                                        
                        lyrics.isEmpty ? const Text("No lyrics found", style: TextStyle(color: Colors.white)):
                        // display the lyrics you searched
                        Text(lyrics, style: GoogleFonts.cherrySwash(color: Colors.white, fontSize: 18.0)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
