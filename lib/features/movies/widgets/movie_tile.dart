import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix_clone/core/common/models/models.dart';
import 'package:netflix_clone/core/theme/app_colors.dart';
import 'package:netflix_clone/features/movies/screens/movie_details_screen/movie_details_view.dart';

class MovieTile extends StatelessWidget {
  const MovieTile({
    super.key,
    required this.movie,
  });

  final ShowModel movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MovieDetailsView.route(movie));
        },
        child: SizedBox(
          width: 145.w,
          child: Container(
            decoration: BoxDecoration(
                color: AppColors.grey200,
                borderRadius: BorderRadius.circular(12),
                image: movie.show!.image != null
                    ? DecorationImage(
                        image: CachedNetworkImageProvider(
                          movie.show!.image!.medium ??
                              'https://picsum.photos/250',
                        ),
                        fit: BoxFit.cover)
                    : const DecorationImage(
                        image: CachedNetworkImageProvider(
                            'https://picsum.photos/250'),
                        fit: BoxFit.cover)),
            child: const Column(mainAxisSize: MainAxisSize.min, children: []),
          ),
        ),
      ),
    );
  }
}
