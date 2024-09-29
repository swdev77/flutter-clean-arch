import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arch/config/themes/app_themes.dart';
import 'package:flutter_clean_arch/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:flutter_clean_arch/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:flutter_clean_arch/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:flutter_clean_arch/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticleBloc>(
      create: (context) => sl()..add(const GetArticles()),
      child: MaterialApp(
        title: 'Daily News',
        theme: theme(),
        home: const DailyNews(),
      ),
    );
  }
}
