import 'package:get_it/get_it.dart';
import 'package:github_discover/src/presentation/blocs/profile/profile_bloc.dart';

final di = GetIt.instance;

Future<void> init() async {
  // Bloc
  di.registerLazySingleton<ProfileBloc>(() => ProfileBloc());
}
