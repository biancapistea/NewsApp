import 'package:myfirstappflutter/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myfirstappflutter/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';

import '../../../../../../core/resources/data_state.dart';
import '../../../../domain/usecases/get_article_usecase.dart';


class RemoteArticlesBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {
  final GetArticleUseCase _getArticleUseCase;

  RemoteArticlesBloc(this._getArticleUseCase) : super(const RemoteArticlesLoading()) {
    on<GetArticles>(onGetArticles);
  }

  void onGetArticles(GetArticles event, Emitter<RemoteArticleState> emit) async {
    final dataState = await _getArticleUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      print(dataState.data);
      emit(RemoteArticlesDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      print("Errorrrrrrrrrrr");
      print(dataState.error!.message);
      emit(RemoteArticlesError(dataState.error!));
    }
  }
}
