import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sadovod/data/app_components.dart';
import 'works_page_model.dart';
import 'works_page_widget.dart';

abstract class IWorksPageWidgetModel extends IWidgetModel {

  ThemeData get theme;

  ValueNotifier<bool> get isLoggedIn;

}

WorksPageWidgetModel defaultWorksPageWidgetModelFactory(BuildContext context) {
  return WorksPageWidgetModel(WorksPageModel(context.read(), AppComponents().tokenRepository));
}

class WorksPageWidgetModel extends WidgetModel<WorksPageWidget, WorksPageModel>
    implements IWorksPageWidgetModel {
  WorksPageWidgetModel(WorksPageModel model) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();
  }

  @override
  ValueNotifier<bool> get isLoggedIn {
    return model.isLoggedIn();
  }


  @override
  ThemeData get theme => Theme.of(context);

}
