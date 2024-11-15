import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix_clone/features/movies/movies_bloc/movies_bloc.dart';
import 'package:netflix_clone/features/movies/widgets/movies_slider_tile.dart';

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
          return Center(
              child: Text(
            'Movies Not Found',
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
          ));
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
