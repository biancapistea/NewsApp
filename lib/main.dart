import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myfirstappflutter/config/theme/app_theme.dart';
import 'package:myfirstappflutter/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:myfirstappflutter/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:myfirstappflutter/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:myfirstappflutter/injection_container.dart';

import 'config/routes/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticlesBloc>(
      create: (BuildContext context) => sl()..add(const GetArticles()),
        child:  MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRoutes.onGenerateRoutes,
          theme: theme(),
          home: const DailyNews(),
        ),
      );
  }
}
