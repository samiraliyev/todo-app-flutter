import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../providers/home_provider.dart';

class ShowTaskHeader extends StatelessWidget {
  const ShowTaskHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final language = AppLocalizations.of(context)!;
    return Consumer<HomeProvider>(
      builder: (context, provider, child) => Expanded(
        flex: 2,
        child: Container(
          color: Colors.transparent,
          child: Center(
              child: Text(
            "${provider.items.length} ${language.task}",
            style: Theme.of(context).textTheme.headlineMedium,
          )),
        ),
      ),
    );
  }
}
