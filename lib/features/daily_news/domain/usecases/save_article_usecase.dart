import 'package:myfirstappflutter/features/daily_news/domain/usecases/usecase.dart';
import '../entities/article.dart';
import '../repository/article_repository.dart';

class SaveArticleUseCase implements UseCase<void, ArticleEntity> {
  final ArticleRepository _articleRepository;

  SaveArticleUseCase(this._articleRepository);

  @override
  Future<void> call({ArticleEntity? param}) {
    return _articleRepository.saveArticle(param!);
  }
}
