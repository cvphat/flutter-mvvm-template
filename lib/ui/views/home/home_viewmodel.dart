import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:stacked/stacked.dart';

import 'home_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: I18nText('title'),
          ),
          body: Center(
            child: Text(
              model.count,
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: model.increase,
          ),
        );
      },
    );
  }
}
