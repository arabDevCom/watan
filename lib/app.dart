import 'package:elwatn/features/show_more_posts/presentation/cubit/show_more_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/locale/app_localizations_setup.dart';
import 'config/routes/app_routes.dart';
import 'config/themes/app_theme.dart';
import 'core/utils/app_strings.dart';
import 'features/home_page/presentation/cubit/home_page_cubit.dart';
import 'features/language/presentation/cubit/locale_cubit.dart';
import 'package:elwatn/injector.dart'
as injector;

import 'features/login/presentation/cubit/login_cubit.dart';
import 'features/register/presentation/cubit/register_cubit.dart';
class Elwatn extends StatelessWidget {
  const Elwatn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
          injector.serviceLocator<LocaleCubit>()..getSavedLanguage(),
        ),
        BlocProvider(
          create: (_) =>
          injector.serviceLocator<HomePageCubit>(),
        ),
        BlocProvider(
          create: (_) =>
          injector.serviceLocator<ShowMoreCubit>(),
        ),
        BlocProvider(
          create: (_) =>
          injector.serviceLocator<LoginCubit>(),
        ),
        BlocProvider(
          create: (_) =>
          injector.serviceLocator<RegisterCubit>(),
        ),
      ],
      child: BlocBuilder<LocaleCubit, LocaleState>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppStrings.appName,
            locale: state.locale,
            theme: appTheme(),
            onGenerateRoute: AppRoutes.onGenerateRoute,
            supportedLocales: AppLocalizationsSetup.supportedLocales,
            localeResolutionCallback:
            AppLocalizationsSetup.localeResolutionCallback,
            localizationsDelegates:
            AppLocalizationsSetup.localizationsDelegates,
          );
        },
      ),
    );
  }
}