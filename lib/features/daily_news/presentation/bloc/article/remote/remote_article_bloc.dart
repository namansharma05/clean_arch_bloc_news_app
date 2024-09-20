import 'dart:async';

import 'package:clean_arch_bloc_news_app/core/resources/data_state.dart';
import 'package:clean_arch_bloc_news_app/features/daily_news/domain/usecases/get_article_use_case.dart';
import 'package:clean_arch_bloc_news_app/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:clean_arch_bloc_news_app/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {
  final GetArticleUseCase _getArticleUseCase;
  RemoteArticleBloc(this._getArticleUseCase)
      : super(const RemoteArticleLoading()) {
    on<RemoteArticlesGetArticlesEvent>(remoteArticlesGetArticlesEvent);
  }

  Future<void> remoteArticlesGetArticlesEvent(
      RemoteArticlesGetArticlesEvent event,
      Emitter<RemoteArticleState> emit) async {
    final dataState = await _getArticleUseCase();
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteArticleLoaded(dataState.data!));
    }
    if (dataState is DataFailed) {
      emit(RemoteArticleError(dataState.exception!));
    }
  }
}
