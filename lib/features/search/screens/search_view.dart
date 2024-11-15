import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/features/movies/screens/movie_details_view.dart';
import 'package:netflix_clone/features/search/search_bloc/search_bloc.dart';
import 'package:netflix_clone/injectable.dart';

class SearchView extends StatelessWidget {
  SearchView({super.key});

  final TextEditingController searchController = TextEditingController();

  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    var outlineInputBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.white));
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(20))),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: searchController,
                  autofocus: false,
                  focusNode: focusNode,
                  style: const TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      border: outlineInputBorder,
                      enabledBorder: outlineInputBorder,
                      errorBorder: outlineInputBorder,
                      focusedBorder: outlineInputBorder,
                      disabledBorder: outlineInputBorder,
                      hintText: 'Search Here',
                      hintStyle: const TextStyle(color: Colors.white),
                      suffixIcon: IconButton(
                          onPressed: () {
                            if (searchController.text.isNotEmpty) {
                              focusNode.unfocus();
                              getIt<SearchBloc>()
                                  .add(SearchGetEvent(searchController.text));
                            }
                          },
                          icon: const Icon(
                            Icons.search_rounded,
                            color: Colors.white,
                            size: 35,
                          ))),
                ),
              ),
            ),
          ),
          BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.status == SearchStatus.loading) {
                const Center(child: CircularProgressIndicator());
              }
              if (state.status == SearchStatus.success) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: state.movies!.length,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 0.7,
                            crossAxisCount: 2,
                            crossAxisSpacing: 6,
                            mainAxisSpacing: 6),
                    itemBuilder: (context, index) {
                      final movie = state.movies![index];
                      if (movie.show!.image != null) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context, MovieDetailsView.route(movie));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: movie.show!.image != null
                                    ? DecorationImage(
                                        image: CachedNetworkImageProvider(
                                            movie.show!.image!.medium ??
                                                'https://picsum.photos/250?'),
                                        fit: BoxFit.cover)
                                    : null),
                          ),
                        );
                      }
                      return null;
                    },
                  ),
                );
              }
              return const SizedBox();
            },
          ),
          const SizedBox(height: 75)
        ],
      ),
    );
  }
}
