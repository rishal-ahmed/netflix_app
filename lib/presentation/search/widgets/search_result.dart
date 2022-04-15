import 'package:flutter/material.dart';
import 'package:netflix_app/core/constants/sizes.dart';
import 'package:netflix_app/presentation/widgets/main_title/main_title.dart';

const imageUrl =
    'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/wRnbWt44nKjsFPrqSmwYki5vZtF.jpg';

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
          child: GridView.count(
            mainAxisSpacing: _screenSize.width * .025,
            crossAxisSpacing: _screenSize.width * .025,
            crossAxisCount: 3,
            childAspectRatio: 1 / 1.5,
            shrinkWrap: true,
            children: List.generate(20, (index) => const MainCard()),
          ),
        )
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(imageUrl),
        ),
      ),
    );
  }
}
