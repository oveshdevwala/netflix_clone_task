// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
            expandedHeight: 300,
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
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.show!.name ?? 'Untitled',
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  _MovieDetailsSection(movie: movie),
                  const SizedBox(height: 20),
                  _MovieSummarySection(movie: movie),
                  const SizedBox(height: 20),
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
        const SizedBox(height: 10),

        Wrap(
          spacing: 10,
          runSpacing: 5,
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
        const SizedBox(height: 10),
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
                            borderRadius: BorderRadius.circular(12))),
                    onPressed: openLink,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Play Show',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
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
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
        child: Text(
          title ?? '',
          style: const TextStyle(color: Colors.white),
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
        const SizedBox(height: 10),
        const Text(
          'Summary',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        if (movie.show!.summary != null)
          Text(
            movie.show!.summary!
                .replaceAll('<p>', '')
                .replaceAll('</p>', '')
                .replaceAll('<b>', '')
                .replaceAll('</b>', ''),
            style: const TextStyle(color: Colors.white70),
          ),
      ],
    );
  }
}
