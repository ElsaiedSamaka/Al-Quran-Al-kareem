import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:alquranMobile/configs/Routes.dart';
import 'package:alquranMobile/screens/quran_list.dart';
import 'package:alquranMobile/constants/Navigation.dart';
import 'package:alquranMobile/constants/Dictionary.dart';
import 'package:alquranMobile/utils/FontsFamily.dart';
import 'package:alquranMobile/repositories/QuranListRepository.dart';
import 'package:alquranMobile/repositories/QuranDetailRepository.dart';
import 'package:alquranMobile/blocs/quranlist/cubit/quranlist_cubit.dart';
import 'package:alquranMobile/blocs/qurandetail/cubit/qurandetail_cubit.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    print('$error, $stackTrace');
    super.onError(cubit, error, stackTrace);
  }
}

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent
      )
    );

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    
    return MultiBlocProvider(
      providers: [
        BlocProvider<QuranlistCubit>(
          create:(context) => QuranlistCubit(
            repository: QuranListRepository()
          ),
        ),
        BlocProvider<QurandetailCubit>(
          create: (context) => QurandetailCubit(
            repository: QuranDetailRepository()
          ),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: Dictionary.appName,
        theme: ThemeData(
          primaryColorBrightness: Brightness.light,
          fontFamily: FontsFamily.roboto,
          pageTransitionsTheme: PageTransitionsTheme(
            builders: <TargetPlatform, PageTransitionsBuilder>{
              TargetPlatform.android: ZoomPageTransitionsBuilder(),
            },
          )
        ),
        home: QuranListPage(),
        onGenerateRoute: generateRoutes,
        navigatorKey: Navigation.navKey,
      ),
    );
  }
}
