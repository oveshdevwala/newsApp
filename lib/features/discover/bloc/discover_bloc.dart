import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/constrains/app/apihelper.dart';
import 'package:news_app/constrains/app/app_exeptions.dart';
import 'package:news_app/constrains/common/model/newsmodel.dart';

part 'discover_event.dart';
part 'discover_state.dart';

class DiscoverBloc extends Bloc<DiscoverEvent, DiscoverState> {
  ApiHelper apiHelper;
  DiscoverBloc({required this.apiHelper}) : super(DiscoverInitial()) {
    on<DicoverMainEvent>((event, emit) async {
      List<ArticleModel> articles = [];
      emit(DicoverLoadingState());
      try {
        var response = await apiHelper.getApi(url: event.categoryApi);
        var data = NewsDataModel.fromJson(response);
        for (var each in data.articles) {
          if (each.urlToImage != null) {
            articles.add(each);
          }
        }
        var newData = data.copyWith(articles: articles);
        emit(DicoverLoadedState(newsDataModel: newData));
      } on AppExeptions catch (e) {
        emit(DicoverErrorState(errorMsg: (e).toErrorMessage()));
      }catch(e){
        emit(DicoverErrorState(errorMsg: e.toString()));

      }
    });
  }
}
