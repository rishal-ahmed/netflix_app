import 'package:flutter/material.dart';
import 'package:netflix_app/presentation/downloads/widgets/downloads_buttons_widget.dart';
import 'package:netflix_app/presentation/downloads/widgets/indroducing_downloads_widget.dart';
import 'package:netflix_app/presentation/downloads/widgets/smart_downloads_widget.dart';
import 'package:netflix_app/presentation/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({Key? key}) : super(key: key);

  final pageSections = [
    const SmartDownloads(),
    const IndroducingDownloads(),
    const DownloadsButtons(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        child: AppBarWidget(title: 'Downloads'),
        preferredSize: Size.fromHeight(40.0),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemBuilder: (ctx, index) => pageSections[index],
        separatorBuilder: (ctx, index) => const SizedBox(height: 20),
        itemCount: pageSections.length,
      ),
    );
  }
}
