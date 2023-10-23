import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../models/character.dart';
import '../../../models/handled_error.dart';
import '../../../services/api_service.dart';
import '../base_cubit.dart';

part 'home_page_state.dart';

@injectable
class HomePageCubit extends BaseCubit<HomePageState> {
  final ApiService apiService;

  HomePageCubit(this.apiService) : super(const HomePageState());

  @override
  void handleError(HandledError error) {
    emit(state.copyWith(
      status: HomePageStatus.error,
      error: error,
    ));
  }

  Future<void> getSimpsonsCharacters() async {
    await makeErrorHandledCall(() async {
      emit(state.copyWith(status: HomePageStatus.loading));

      emit(state.copyWith(
        characters: await apiService.getSimpsonsCharacters(),
        status: HomePageStatus.success,
      ));
    });
  }
}
