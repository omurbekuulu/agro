import 'package:agro/core/network/dio_client.dart';
import 'package:agro/data/breeds/repositories/breeds.dart';
import 'package:agro/data/breeds/sources/breeds.dart';
import 'package:agro/domain/breeds/repositories/breeds.dart';
import 'package:agro/domain/breeds/use_cases/get_breeds.dart';
import 'package:agro/domain/breeds/use_cases/get_seasons.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());

  //Services
  sl.registerSingleton<BreedsService>(BreedsServiceImpl());

  //Repositories
  sl.registerSingleton<BreedsRepository>(BreedsRepositoryImpl());

  //UseCases
  sl.registerSingleton<GetBreedsUseCase>(GetBreedsUseCase());
  sl.registerSingleton<GetSeasonsUseCase>(GetSeasonsUseCase());
}
