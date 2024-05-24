import 'package:distributor_empower/routes/router.dart';
import 'package:auto_route/auto_route.dart';

class RouteGuard extends AutoRedirectGuard {
  // final UserProvider userProvider = UserProvider();

  RouteGuard() {
    // userProvider.addListener(() {
      reevaluate();
    // });
  }

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    // if (!userProvider.isLogged) {
    //   if (!resolver.route.meta.containsKey('isPublic')) {
    //     redirect(const MainEntryNotLoggedRouter(), resolver: resolver);
    //     return;
    //   }
    //   resolver.next();
    //   return;
    // }
    if (resolver.route.meta.containsKey('isPublic')) {
      redirect(const LoggedAppBodyRouter(), resolver: resolver);
      return;
    }
    resolver.next();
  }

  @override
  Future<bool> canNavigate(RouteMatch route) async {
    return true;
  }
}
