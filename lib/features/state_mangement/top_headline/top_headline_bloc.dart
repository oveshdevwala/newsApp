

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/data_source/remote/apihelper.dart';
import 'package:news_app/data_source/remote/app_exeptions.dart';
import 'package:news_app/data_source/remote/newsmodel.dart';
import 'package:news_app/data_source/remote/urls.dart';

part 'top_headline_event.dart';
part 'top_headline_state.dart';

class TopHeadlineBloc extends Bloc<TopHeadlineEvent, TopHeadlineState> {
  ApiHelper apiHelper;
  TopHeadlineBloc({required this.apiHelper}) : super(TopHeadlineInitial()) {
    on<TopHeadlineMainEvent>((event, emit) async {
      emit(TopHeadlineLoadingState());
      try {
        var responsedata = await apiHelper.getApi(
            url: '${Urls.topHeadLineUrl}q=Usa${Urls.apiKey}');

        var data = NewsDataModel.fromJson(responsedata);
        emit(TopHeadlineLoadedState(newsDataModel: data));
      } catch (e) {
        emit(TopHeadlineErrorState(
            errorMsg: (e as AppExeptions).toErrorMessage()));
      }
    });
  }
}
