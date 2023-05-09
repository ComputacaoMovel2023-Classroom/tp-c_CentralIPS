import 'package:flutter_bloc/flutter_bloc.dart';

// Define o Cubit para gerenciar o estado do índice do menu do rodapé
class FooterMenuCubit extends Cubit<int> {
  FooterMenuCubit() : super(2);

  void selectItem(int index) {
    emit(index);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print('$error, $stackTrace');
    super.onError(error, stackTrace);
  }
}
