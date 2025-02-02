import 'package:base/base.dart';
import 'package:drift_database/drift_database.dart';
import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:flutter/material.dart';

class DbViewerListTitle extends StatelessWidget {
  const DbViewerListTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Inspect db'),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        final db = getIt<DriftMtpDatabase>();
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => DriftDbViewer(db)));
      },
    );
  }
}
