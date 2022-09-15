import 'package:dio/dio.dart';
import 'package:elwatn/features/home_page/domain/use_cases/get_add_and_popular_items_use_case.dart';
import 'package:elwatn/features/show_more_posts/data/data_sources/show_more_data_source.dart';
import 'package:elwatn/features/show_more_posts/data/repositories/show_more_data_repositories.dart';
import 'package:elwatn/features/show_more_posts/domain/repositories/base_show_more_repositories.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/api/app_interceptors.dart';
import 'core/api/base_api_consumer.dart';
import 'core/api/dio_consumer.dart';
import 'core/network/network_info.dart';
import 'features/home_page/data/data_sources/home_data_source.dart';
import 'features/home_page/data/repositories/home_data_repositories.dart';
import 'features/home_page/domain/repositories/base_home_repositories.dart';
import 'features/home_page/domain/use_cases/get_categories_use_case.dart';
import 'features/home_page/domain/use_cases/get_slider_use_case.dart';
import 'features/home_page/presentation/cubit/home_page_cubit.dart';
import 'features/language/data/data_sources/language_locale_data_source.dart';
import 'features/language/data/repositories/language_repository.dart';
import 'features/language/domain/repositories/base_language_repository.dart';
import 'features/language/domain/use_cases/change_language_use_case.dart';
import 'features/language/domain/use_cases/get_saved_language_use_case.dart';
import 'features/language/presentation/cubit/locale_cubit.dart';
import 'features/login/data/data_sources/login_data_source.dart';
import 'features/login/data/repositories/login_repositories.dart';
import 'features/login/domain/repositories/base_login_repositories.dart';
import 'features/login/domain/use_cases/login_use_case.dart';
import 'features/login/presentation/cubit/login_cubit.dart';
import 'features/register/presentation/cubit/register_cubit.dart';
import 'features/show_more_posts/domain/use_cases/pagination_use_case.dart';
import 'features/show_more_posts/domain/use_cases/show_more_use_case.dart';
import 'features/show_more_posts/presentation/cubit/show_more_cubit.dart';
// import 'package:http/http.dart' as http;

final serviceLocator = GetIt.instance;

Future<void> setup() async {
  //! Features
  // Blocs

  serviceLocator.registerFactory(
    () => LocaleCubit(
      getSavedLanguageUseCase: serviceLocator(),
      changeLanguageUseCase: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => HomePageCubit(
        getSliderUseCase: serviceLocator(),
        getCategoriesUseCase: serviceLocator(),
        getNewAndPopularItemsUseCase: serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => ShowMoreCubit(
        getShowMoreUseCase: serviceLocator(),
        getPaginationUseCase: serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => LoginCubit(
      postLoginUseCase: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => RegisterCubit(
      // postLoginUseCase: serviceLocator(),
    ),
  );

  // Use Cases
  serviceLocator.registerLazySingleton(
      () => GetSavedLanguageUseCase(languageRepository: serviceLocator()));
  serviceLocator.registerLazySingleton(
      () => ChangeLanguageUseCase(languageRepository: serviceLocator()));
  serviceLocator.registerLazySingleton(
      () => GetSliderUseCase(baseHomeRepositories: serviceLocator()));
  serviceLocator.registerLazySingleton(
      () => GetCategoriesUseCase(baseHomeRepositories: serviceLocator()));
  serviceLocator.registerLazySingleton(() =>
      GetNewAndPopularItemsUseCase(baseHomeRepositories: serviceLocator()));
  serviceLocator.registerLazySingleton(
      () => GetShowMoreUseCase(baseShowMoreRepositories: serviceLocator()));
  serviceLocator.registerLazySingleton(
      () => GetPaginationUseCase(baseShowMoreRepositories: serviceLocator()));
  serviceLocator.registerLazySingleton(
      () => PostLoginUseCase(baseLoginRepositories: serviceLocator()));

  // Repositories
  serviceLocator.registerLazySingleton<BaseLanguageRepository>(
    () => LanguageRepository(
      languageLocaleDataSource: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<BaseHomeRepositories>(
    () => HomePageRepositories(
      homePageDataSource: serviceLocator(),
      networkInfo: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<BaseShowMoreRepositories>(
    () => ShowMoreRepositories(
      showDataDataSource: serviceLocator(),
      networkInfo: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<BaseLoginRepositories>(
    () => LoginRepositories(
      serviceLocator(),
      serviceLocator(),
    ),
  );

  // Data Sources
  serviceLocator.registerLazySingleton<BaseLanguageLocaleDataSource>(
      () => LanguageLocaleDataSource(sharedPreferences: serviceLocator()));
  serviceLocator.registerLazySingleton<BaseHomePageDataSource>(
      () => HomePageDataSource(apiConsumer: serviceLocator()));
  serviceLocator.registerLazySingleton<BaseShowDataDataSource>(
      () => ShowMoreDataSource(apiConsumer: serviceLocator()));
  serviceLocator.registerLazySingleton<BaseLoginDataSource>(
      () => LoginDataSource(apiConsumer: serviceLocator()));

  //! Core
  //Network
  serviceLocator.registerLazySingleton<BaseNetworkInfo>(
      () => NetworkInfo(connectionChecker: serviceLocator()));

  // Api Consumer
  serviceLocator.registerLazySingleton<BaseApiConsumer>(
      () => DioConsumer(client: serviceLocator()));

  //! External
  // Shared Preferences
  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => sharedPreferences);

  // http
  // serviceLocator.registerLazySingleton(() => http.Client());

  // Dio
  serviceLocator.registerLazySingleton(() => Dio());
  serviceLocator.registerLazySingleton(() => AppInterceptors());
  serviceLocator.registerLazySingleton(
    () => LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true,
    ),
  );

  // Internet Connection Checker
  serviceLocator.registerLazySingleton(() => InternetConnectionChecker());
}
