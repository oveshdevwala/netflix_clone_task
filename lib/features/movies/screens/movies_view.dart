import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:netflix_clone/features/movies/models/models.dart';
import 'package:netflix_clone/features/movies/movies_bloc/movies_bloc.dart';
import 'package:netflix_clone/features/movies/screens/movie_details_view.dart';

class MoviesView extends StatelessWidget {
  const MoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: BlocBuilder<MoviesBloc, MoviesState>(
        builder: (context, state) {
          if (state.status == MoviesStatus.failure) {
            return Center(child: Text(state.error ?? 'UNKNOW Error'));
          }
          if (state.status == MoviesStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.status == MoviesStatus.success) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  15.verticalSpace,
                  MainSlider(state: state),
                  MoviesSliderTile(
                      movies: state.popular!, title: 'Popular Movies'),
                  MoviesSliderTile(
                      movies: state.thriller!, title: 'Thriller Movies'),
                  MoviesSliderTile(
                      movies: state.comedy!, title: 'Comedy Movies'),
                  MoviesSliderTile(movies: state.drama!, title: 'Drama show'),
                  MoviesSliderTile(movies: state.game!, title: 'Game Show'),
                  MoviesSliderTile(
                      movies: state.scifi!, title: 'Sci-Fi Movies'),
                  70.verticalSpace,
                ],
              ),
            );
          }
          return const Center(child: Text('Movies Not Found'));
        },
      )),
    );
  }
}

class MainSlider extends StatelessWidget {
  const MainSlider({super.key, required this.state});
  final MoviesState state;
  @override
  Widget build(BuildContext context) {
    return Center(
      //Wrap the OverlappedCarousel widget with SizedBox to fix a height. No need to specify width.
      child: SizedBox(
          height: 200.h,
          child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              final movie = state.card![index].show;

              if (movie!.image != null) {
                return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                            image: CachedNetworkImageProvider(
                              movie.image!.medium ??
                                  'https://picsum.photos/250',
                            ),
                            fit: BoxFit.cover)));
              } else {
                return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: const DecorationImage(
                            image: CachedNetworkImageProvider(
                                'https://picsum.photos/250'),
                            fit: BoxFit.cover)));
              }
            },
            itemCount: state.card!.length,
            itemWidth: 280.0.w,
            layout: SwiperLayout.STACK,
          )),
    );
  }
}

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
                color: Colors.grey.shade200,
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
