import 'package:agro/core/network/dio_client.dart';
import 'package:agro/data/add_new_breed/repositories/breed.dart';
import 'package:agro/data/add_new_breed/sources/breed.dart';
import 'package:agro/domain/add_new_breed/repositories/breed.dart';
import 'package:agro/domain/add_new_breed/use_cases/get_breeds.dart';
import 'package:agro/domain/add_new_breed/use_cases/get_seasons.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());

  //Services
  sl.registerSingleton<AddNewBreedService>(AddNewBreedServiceImpl());

  //Repositories
  sl.registerSingleton<AddNewBreedRepository>(AddNewBreedBreedRepositoryImpl());

  //UseCases
  sl.registerSingleton<GetBreedsUseCase>(GetBreedsUseCase());
  sl.registerSingleton<GetSeasonsUseCase>(GetSeasonsUseCase());
}
