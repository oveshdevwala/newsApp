import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/constrains/app/apihelper.dart';
import 'package:news_app/constrains/app/app_exeptions.dart';
import 'package:news_app/constrains/common/model/newsmodel.dart';
import 'package:news_app/constrains/const/urls.dart';

part 'top_headline_event.dart';
part 'top_headline_state.dart';

class TopHeadlineBloc extends Bloc<TopHeadlineEvent, TopHeadlineState> {
  ApiHelper apiHelper;
  TopHeadlineBloc({required this.apiHelper}) : super(TopHeadlineInitial()) {
    on<TopHeadlineMainEvent>((event, emit) async {
      List<ArticleModel> articles = [];
      emit(TopHeadlineLoadingState());
      try {
        var responsedata = await apiHelper.getApi(
            url: '${Urls.topHeadLineUrl}q=Usa${Urls.apiKey}');

        var data = NewsDataModel.fromJson(responsedata);
        for (var each in data.articles) {
          if (each.urlToImage != null) {
              articles.add(each);
            
          }
        }
        var newData = data.copyWith(articles: articles);

        emit(TopHeadlineLoadedState(newsDataModel: newData));
      } on AppExeptions catch (e) {
        emit(TopHeadlineErrorState(errorMsg: (e).toErrorMessage()));
      }catch(e){
        emit(TopHeadlineErrorState(errorMsg:e.toString()));

      }
    });
  }
}
