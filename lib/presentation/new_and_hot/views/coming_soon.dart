import 'package:flutter/material.dart';
import 'package:netflix_app/presentation/new_and_hot/widgets/coming_soon_widget.dart';

class ComingSoon extends StatelessWidget {
  const ComingSoon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return const ComingSoonWidget();
      },
    );
  }
}
