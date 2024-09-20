import 'package:clean_arch_bloc_news_app/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:clean_arch_bloc_news_app/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:clean_arch_bloc_news_app/features/daily_news/presentation/widgets/article_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: const Text(
        'Daily News',
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  _buildBody() {
    return BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
      builder: (context, state) {
        if (state is RemoteArticleLoading) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        } else if (state is RemoteArticleLoaded) {
          return ListView.builder(
            itemCount: state.articles!.length,
            itemBuilder: (context, index) {
              return ArticleWidget(
                article: state.articles![index],
              );
            },
          );
        } else if (state is RemoteArticleError) {
          return Center(
            child: IconButton(
              onPressed: () {},
              icon: const Icon(CupertinoIcons.refresh),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
