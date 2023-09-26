import 'package:github_discover/src/data/adapters/skill_hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

HiveInterface hive = Hive..registerAdapter(SkillHiveAdapter());
