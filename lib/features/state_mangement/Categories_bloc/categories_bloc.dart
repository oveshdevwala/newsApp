import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/data_source/remote/apihelper.dart';
import 'package:news_app/data_source/remote/app_exeptions.dart';
// import 'package:news_app/data_source/remote/urls.dart';
import 'package:news_app/data_source/remote/newsmodel.dart';
import 'package:news_app/data_source/remote/urls.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  ApiHelper apiHelper;
  CategoriesBloc({required this.apiHelper}) : super(CategoriesInitial()) {
    on<CategoriesMainEvent>((event, emit) async {
      emit(CategoriesLoadingState());
      try {
        var responsedata = await apiHelper.getApi(
            url:
                '${Urls.everythingUrl}q=tech&apiKey=3b4ccd9b270f4a938935d32e3ea53c20');

        var data = NewsDataModel.fromJson(responsedata);
        emit(CategoriesLoadedState(newsDataModel: data));
      } catch (e) {
        emit(CategoriesErrorState(
            errorMsg: (e as AppExeptions).toErrorMessage()));
      }
    });
  }
}
