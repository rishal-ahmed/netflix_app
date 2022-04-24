import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/search/search_bloc.dart';
import 'package:netflix_app/core/constants/sizes.dart';
import 'package:netflix_app/presentation/search/widgets/top_search_items.dart';
import 'package:netflix_app/presentation/widgets/main_title/main_title.dart';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight5,
        const MainTitle(title: 'Top Searches'),
        kHeight15,
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state.isError) {
                return const Center(child: Text('Error Occured!'));
              } else if (state.idleList.isEmpty) {
                return const Center(child: SizedBox());
              }
              return ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (ctx, index) {
                    final movie = state.idleList[index];
                    return TopSearchItemTile(
                      title: movie.title ?? 'No Title',
                      imageUrl: movie.posterPath ?? '',
                    );
                  },
                  separatorBuilder: (ctx, index) => kHeight20,
                  itemCount: state.idleList.length);
            },
          ),
        )
      ],
    );
  }
}
