import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix_clone/core/theme/app_colors.dart';
import 'package:netflix_clone/features/movies/screens/movie_details_screen/movie_details_view.dart';
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
        borderSide: const BorderSide(color: AppColors.white));
    return Column(
      children: [
        _SearchField(
            searchController: searchController,
            focusNode: focusNode,
            outlineInputBorder: outlineInputBorder),
        const _SearchResults(),
        75.verticalSpace,
      ],
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField({
    required this.searchController,
    required this.focusNode,
    required this.outlineInputBorder,
  });

  final TextEditingController searchController;
  final FocusNode focusNode;
  final OutlineInputBorder outlineInputBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 60),
      // height: 140.h,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.black,
        // borderRadius:
        //     BorderRadius.vertical(bottom: const Radius.circular(20).r),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0).w,
          child: TextFormField(
            controller: searchController,
            autofocus: false,
            focusNode: focusNode,
            style: const TextStyle(color: AppColors.white),
            cursorColor: AppColors.white,
            decoration: InputDecoration(
                border: outlineInputBorder,
                enabledBorder: outlineInputBorder,
                errorBorder: outlineInputBorder,
                focusedBorder: outlineInputBorder,
                disabledBorder: outlineInputBorder,
                hintText: 'Search Here',
                hintStyle: const TextStyle(color: AppColors.white),
                suffixIcon: IconButton(
                    onPressed: () {
                      if (searchController.text.isNotEmpty) {
                        focusNode.unfocus();
                        getIt<SearchBloc>()
                            .add(SearchGetEvent(searchController.text));
                      }
                    },
                    icon: Icon(
                      Icons.search_rounded,
                      color: AppColors.white,
                      size: 35.h,
                    ))),
          ),
        ),
      ),
    );
  }
}

class _SearchResults extends StatelessWidget {
  const _SearchResults();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          if (state.status == SearchStatus.loading) {
            const Center(child: CircularProgressIndicator());
          }
          if (state.status == SearchStatus.success) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0).h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.query ?? 'Search Result',
                      style: TextStyle(
                          fontSize: 20.sp,
                          color: AppColors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    5.verticalSpace,
                    GridView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(0),
                      itemCount: state.movies!.length,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 0.7,
                          crossAxisCount: 2,
                          crossAxisSpacing: 6.w,
                          mainAxisSpacing: 6.h),
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
                                  borderRadius: BorderRadius.circular(12).r,
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
                  ],
                ),
              ),
            );
          }
          if (state.status == SearchStatus.failure) {
            return Center(
              child: Text(
                'Search Not Found',
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
