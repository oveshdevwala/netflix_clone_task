// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:netflix_clone/features/movies/models/models.dart';
import 'package:url_launcher/link.dart';

class MovieDetailsView extends StatelessWidget {
  static Route<void> route(ShowModel movie) =>
      MaterialPageRoute(builder: (context) => MovieDetailsView(movie: movie));

  const MovieDetailsView({
    super.key,
    required this.movie,
  });

  final ShowModel movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300.h,
            pinned: true,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.arrow_back_ios_new_rounded))),
            flexibleSpace: FlexibleSpaceBar(
              background: CachedNetworkImage(
                imageUrl:
                    movie.show!.image?.original ?? 'https://picsum.photos/250',
                fit: BoxFit.fitWidth,
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  color: Colors.red,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0).h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.show!.name ?? 'Untitled',
                    style: TextStyle(color: Colors.white, fontSize: 14.sp),
                  ),
                  _MovieDetailsSection(movie: movie),
                  20.verticalSpace,
                  _MovieSummarySection(movie: movie),
                  20.verticalSpace,
                  _ExtraDetails(movie)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ExtraDetails extends StatelessWidget {
  const _ExtraDetails(this.movie);
  final ShowModel movie;

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [],
    );
  }
}

// Custom widget to display movie details
class _MovieDetailsSection extends StatelessWidget {
  const _MovieDetailsSection({
    required this.movie,
  });

  final ShowModel movie;

  @override
  Widget build(BuildContext context) {
    final movieurl = Uri.parse(movie.show!.url!);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        10.verticalSpace,

        Wrap(
          spacing: 10.w,
          runSpacing: 5.h,
          children: [
            OutlineBox(title: movie.show!.type),
            OutlineBox(title: movie.show!.premiered?.split('-')[0] ?? ''),
            if (movie.show!.runtime != null)
              OutlineBox(title: '${movie.show!.runtime ?? 'N/A'} min'),
            if (movie.show!.runtime != null)
              OutlineBox(title: movie.show!.status ?? 'Unknown Status'),
            OutlineBox(title: movie.show!.language),
          ],
        ),
        10.verticalSpace,
        // Play Button
        if (movie.show!.url != null)
          Link(
              target: LinkTarget.defaultTarget,
              uri: movieurl,
              builder: (context, openLink) {
                return SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12).r)),
                    onPressed: openLink,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0).r,
                      child: Text(
                        'Play Show',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                        ),
                      ),
                    ),
                  ),
                );
              }),
      ],
    );
  }
}

class OutlineBox extends StatelessWidget {
  const OutlineBox({super.key, this.title});
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blueGrey.withAlpha(100),
          borderRadius: BorderRadius.circular(8),
          // border: Border.all(color: Colors.blueGrey),
          border: Border.all(width: 0)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3).r,
        child: Text(
          title ?? '',
          style: TextStyle(color: Colors.white, fontSize: 14.sp),
        ),
      ),
    );
  }
}

// Custom widget for movie summary
class _MovieSummarySection extends StatelessWidget {
  const _MovieSummarySection({
    required this.movie,
  });

  final ShowModel movie;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (movie.show!.network != null)
          if (movie.show!.network!.country != null)
            OutlineBox(
              title:
                  '${movie.show!.network!.name} - ${movie.show!.network!.country!.name}',
            ),
        10.verticalSpace,
        if (movie.show!.summary != null)
          Text(
            'Summary',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        if (movie.show!.summary != null) 8.verticalSpace,
        if (movie.show!.summary != null)
          Text(
            movie.show!.summary!
                .replaceAll('<p>', '')
                .replaceAll('</p>', '')
                .replaceAll('<b>', '')
                .replaceAll('</b>', ''),
            textAlign: TextAlign.justify,
            style: TextStyle(color: Colors.white70, fontSize: 14.sp),
          ),
      ],
    );
  }
}
