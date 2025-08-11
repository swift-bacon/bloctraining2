import 'package:bloctraining2/config/theme/app_themes.dart';
import 'package:bloctraining2/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:bloctraining2/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:bloctraining2/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:bloctraining2/injections_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Application extends StatelessWidget {
    const Application({super.key});

    @override
    Widget build(BuildContext context) {
        return BlocProvider<RemoteArticlesBloc>(
            create: (context) => sl()..add(const GetArticles()),
          child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: theme(),
              home: DailyNews(),
          ),
        );
    }
}