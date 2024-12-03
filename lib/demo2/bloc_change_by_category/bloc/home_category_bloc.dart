import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_category_event.dart';
part 'home_category_state.dart';

class HomeCategoryBloc extends Bloc<HomeCategoryEvent, HomeCategoryState> {
  HomeCategoryBloc() : super(HomeCategoryInitial()) {
    on<HomeCategoryEvent>((event, emit) {
    });
  }
}
