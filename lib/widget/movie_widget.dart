import 'package:flutter/material.dart';
import 'package:movies_app/models/movie_model.dart';

class MovieWidget extends StatelessWidget {
  const MovieWidget({super.key, required this.movieModel});

  final MovieModel movieModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white, // Warna latar belakang
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            movieModel.title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF01147C),
            ),
          ),
          const SizedBox(height: 8), 
          Text(
            'Rating: ${movieModel.voteAverage}',
            style: TextStyle(
              fontSize: 16,
              color: Colors.teal[600],
            ),
          ),
          const SizedBox(height: 8), 
          Text(
            'Overview:',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.teal[700],
            ),
          ),
          const SizedBox(height: 4),
          Text(
            movieModel.overview,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
            maxLines: 3, 
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
