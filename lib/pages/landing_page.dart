import 'package:flutter/material.dart';
import 'package:movies_app/services/movie_services.dart';
import 'package:movies_app/widget/movie_widget.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF01147C),
        title: const Center(
          child: Text(
            'Movie App',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: const Text(
              'Top Movies',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF01147C)),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: FutureBuilder(
              future: MovieServices.getMovielist(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator(color: Colors.teal));
                } else if (snapshot.hasData) {
                  return Column(
                    children: [
                      ...snapshot.data!.map((movieProduct) {
                        return MovieWidget(movieModel: movieProduct);
                      }),
                    ],
                  );
                } else {
                  return const Center(child: Text('No movies found', style: TextStyle(fontSize: 16)));
                }
              },
            ),
          )
        ],
      ),
    );
  }
}