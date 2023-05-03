import 'package:go_router/go_router.dart';

import '../pages/pages.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      path: '/afiliacion',
      /* name: ButtonsScreen.name, */
      builder: (context, state) => Afiliacion(),
    ),
    GoRoute(
      path: '/home',
      /* name: CardsScreen.name, */
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: '/menu_options',
      builder: (context, state) => NavigationBottom(),
    ),
  ],
);
