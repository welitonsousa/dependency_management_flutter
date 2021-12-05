import 'package:dependency_management/controllers/controller_todo.dart';
import 'package:dependency_management/pages/page_home.dart';
import 'package:dependency_management/services/http_interface.dart';
import 'package:dependency_management/services/service_http.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton<HttpClient>((i) => MyHttpClient()),
        Bind.factory<ControllerTodo>((i) => ControllerTodo()),
      ];

  @override
  List<ChildRoute> get routes => [
        ChildRoute('/', child: (contextBaseOptions, args) => PageHome()),
      ];
}
