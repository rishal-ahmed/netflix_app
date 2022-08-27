import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/search/search_bloc.dart';
import 'package:netflix_app/core/constants/sizes.dart';
import 'package:netflix_app/domain/core/debouncer/debouncer.dart';
import 'package:netflix_app/presentation/search/widgets/search_idle.dart';
import 'package:netflix_app/presentation/search/widgets/search_result.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<SearchBloc>(context).add(const Initialize());
    });

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CupertinoSearchTextField(
                prefixInsets: const EdgeInsets.symmetric(horizontal: 5),
                suffixInsets: const EdgeInsets.symmetric(horizontal: 5),
                backgroundColor: Colors.grey.withOpacity(0.5),
                prefixIcon: const Icon(CupertinoIcons.search, color: Colors.grey),
                suffixIcon: const Icon(CupertinoIcons.xmark_circle_fill, color: Colors.grey),
                style: const TextStyle(color: Colors.white),
                onChanged: (query) {
                  if (query.isEmpty || query.startsWith(' ')) {
                    Debouncer.timer?.cancel();
                    return BlocProvider.of<SearchBloc>(context).add(const Initialize());
                  }

                  final Debouncer debouncer = Debouncer();
                  debouncer.run(() {
                    BlocProvider.of<SearchBloc>(context).add(SearchMovie(movieQuery: query));
                  });
                },
              ),
              kHeight10,
              Expanded(
                child: BlocBuilder<SearchBloc, SearchState>(
                  builder: (context, state) {
                    if (!state.isSearching) {
                      return const SearchIdleWidget();
                    } else {
                      return const SearchResultWidget();
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
