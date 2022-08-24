import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/search/search_bloc.dart';
import 'package:netflix_app/core/constants/colors.dart';
import 'package:netflix_app/core/constants/sizes.dart';
import 'package:netflix_app/presentation/widgets/main_title/main_title.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({Key? key}) : super(key: key);
  static late Size _screenSize;
  @override
  Widget build(BuildContext context) {
    _screenSize = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight15,
        const MainTitle(title: 'Movies & TV'),
        kHeight15,
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state.isError) {
                return const Center(child: Text('Something went wrong!'));
              } else if (state.searchResultList.isEmpty) {
                return const Center(child: Text('No results found!'));
              }
              return GridView.builder(
                itemBuilder: (BuildContext context, int index) {
                  final String? moviePoster = state.searchResultList[index].posterImageUrl;
                  return MainCard(
                    imageUrl: moviePoster,
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: _screenSize.width * .025,
                  crossAxisSpacing: _screenSize.width * .025,
                  childAspectRatio: 1 / 1.5,
                ),
                itemCount: state.searchResultList.length,
              );
            },
          ),
        )
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({Key? key, required this.imageUrl}) : super(key: key);

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return imageUrl != null
        ? Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(imageUrl!)),
            ),
          )
        : const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.hide_image_outlined, color: kWhite),
          );
  }
}
