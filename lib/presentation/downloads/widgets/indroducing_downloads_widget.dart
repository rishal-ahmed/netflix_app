import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/downloads/downloads_bloc.dart';
import 'package:netflix_app/core/constants/base_url.dart';
import 'package:netflix_app/presentation/downloads/widgets/download_image_widget.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/sizes.dart';

class IndroducingDownloads extends StatelessWidget {
  const IndroducingDownloads({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<DownloadsBloc>(context).add(const DownloadsEvent.getDownloadsImages());
    });

    final screenSize = MediaQuery.of(context).size;

    return Column(
      children: [
        const Text(
          'Indroducing Downloads for you',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: kWhite,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        kHeight10,
        const Text(
          "We'll download a personalised selection of\n movies and shows for you, So there's\n always something to watch on your\n device.",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
        kHeight10,
        BlocBuilder<DownloadsBloc, DownloadsState>(
          builder: (context, state) {
            return SizedBox(
              width: screenSize.width,
              height: screenSize.width,
              child: state.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : state.downloads.isEmpty
                      ? const Center(child: SizedBox())
                      : Stack(
                          alignment: Alignment.center,
                          children: [
                            CircleAvatar(
                              radius: screenSize.width * .27,
                              backgroundColor: Colors.grey.withOpacity(0.3),
                            ),
                            DownloadsImageWidget(
                              image: '$imageAppendUrl${state.downloads[0].posterPath}',
                              margin: const EdgeInsets.only(
                                right: 140,
                              ),
                              angle: -17,
                              size: Size(screenSize.width * 0.3, screenSize.width * 0.38),
                            ),
                            DownloadsImageWidget(
                              image: '$imageAppendUrl${state.downloads[1].posterPath}',
                              margin: const EdgeInsets.only(
                                left: 140,
                              ),
                              angle: 17,
                              size: Size(screenSize.width * 0.3, screenSize.width * 0.38),
                            ),
                            DownloadsImageWidget(
                              image: '$imageAppendUrl${state.downloads[2].posterPath}',
                              margin: const EdgeInsets.only(top: 20),
                              size: Size(screenSize.width * 0.3, screenSize.width * 0.42),
                            ),
                          ],
                        ),
            );
          },
        ),
      ],
    );
  }
}
