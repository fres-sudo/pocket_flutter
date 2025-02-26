import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pine/pine.dart';
import 'package:pocket_flutter/misc/constants.dart';
import 'package:pocket_flutter/models/user/user.dart';
import 'package:pocket_flutter/repositories/auth_repository.dart';
import 'package:pocket_flutter/repositories/mappers/user_mapper.dart';
import 'package:pocket_flutter/services/dtos/user/user_dto.dart';
import 'package:pocket_flutter/services/network/auth_service.dart';
import 'package:pocket_flutter/services/storage/local_storage.dart';
import 'package:pocket_flutter/state/cubits/auth/auth_cubit.dart';
import 'package:pocket_flutter/state/cubits/theme/theme_cubit.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:talker/talker.dart';

part 'blocs.dart';

part 'mappers.dart';

part 'providers.dart';

part 'repositories.dart';

class DependencyInjector extends StatelessWidget {
  final Widget child;

  const DependencyInjector({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) => DependencyInjectorHelper(
        blocs: _blocs,
        mappers: _mappers,
        providers: _providers,
        repositories: _repositories,
        child: child,
      );
}
