import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/downloads/downloads_bloc.dart';
import 'package:netflix_app/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:netflix_app/application/search/search_bloc.dart';
import 'package:netflix_app/core/constants/colors.dart';
import 'package:netflix_app/domain/core/di/injectable.dart';
import 'package:netflix_app/presentation/main_page/screen_main_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx) => getIt<DownloadsBloc>()),
        BlocProvider(create: (ctx) => getIt<SearchBloc>()),
        BlocProvider(create: (ctx) => getIt<FastLaughBloc>()),
      ],
      child: ResponsiveSizer(
        builder: (BuildContext context, Orientation orientation,
            ScreenType screenType) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Netflix',
            theme: ThemeData(
              // fontFamily: GoogleFonts.montserrat().fontFamily,
              appBarTheme: const AppBarTheme(backgroundColor: kTransparent),
              scaffoldBackgroundColor: backgroundColor,
              backgroundColor: kBlack,
              textTheme: const TextTheme(
                bodyText1: TextStyle(color: Colors.white),
                bodyText2: TextStyle(color: Colors.white),
              ),
            ),
            home: ScreenMainPage(),
          );
        },
      ),
    );
  }
}
