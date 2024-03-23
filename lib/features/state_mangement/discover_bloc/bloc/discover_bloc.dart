import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/data_source/remote/apihelper.dart';
import 'package:news_app/data_source/remote/app_exeptions.dart';
import 'package:news_app/data_source/remote/newsmodel.dart';

part 'discover_event.dart';
part 'discover_state.dart';

class DiscoverBloc extends Bloc<DiscoverEvent, DiscoverState> {
  ApiHelper apiHelper;
  DiscoverBloc({required this.apiHelper}) : super(DiscoverInitial()) {
    on<DicoverMainEvent>((event, emit) async {
      emit(DicoverLoadingState());
      try {
        var response = await apiHelper.getApi(url: event.categoryApi);
        var data = NewsDataModel.fromJson(response);
        emit(DicoverLoadedState(newsDataModel: data));
      } catch (e) {
        emit(DicoverErrorState(errorMsg: (e as AppExeptions).toErrorMessage()));
      }
    });
  }
}
