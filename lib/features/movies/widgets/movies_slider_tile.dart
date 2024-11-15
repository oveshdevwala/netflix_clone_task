import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix_clone/core/common/models/models.dart';
import 'package:netflix_clone/features/movies/widgets/movie_tile.dart';

class MoviesSliderTile extends StatelessWidget {
  const MoviesSliderTile({
    super.key,
    required this.title,
    required this.movies,
  });
  final String title;
  final List<ShowModel> movies;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
          ),
          SizedBox(
            height: 190.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: (context, index) {
                return MovieTile(movie: movies[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
