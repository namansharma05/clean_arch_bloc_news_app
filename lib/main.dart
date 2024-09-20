import 'package:clean_arch_bloc_news_app/config/theme/app_theme.dart';
import 'package:clean_arch_bloc_news_app/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:clean_arch_bloc_news_app/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:clean_arch_bloc_news_app/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:clean_arch_bloc_news_app/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              sl<RemoteArticleBloc>()..add(RemoteArticlesGetArticlesEvent()),
        ),
      ],
      child: MaterialApp(
        title: 'News App',
        debugShowCheckedModeBanner: false,
        theme: theme(),
        home: const DailyNews(),
      ),
    );
  }
}
