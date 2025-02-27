import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocket_flutter/state/cubits/auth/auth_cubit.dart';
import 'package:pocket_flutter/ui/widgets/error_image_widget.dart';
import 'package:pocket_flutter/ui/widgets/loading_spinner.dart';

class ProfilePicutre extends StatelessWidget {
  const ProfilePicutre({super.key, this.isEditable = false, this.radius = 50});

  final bool isEditable;
  final double radius;

  @override
  Widget build(BuildContext context) => BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
        final avatar = state.whenOrNull(
          authenticated: (user) => user.avatar,
        );
        if (avatar == null || avatar.isEmpty) {
          return CircleAvatar(
              radius: radius,
              child: Icon(
                Icons.person,
                size: radius,
              ));
        } else {
          return CircleAvatar(
            radius: radius,
            child: CachedNetworkImage(
                imageUrl: avatar,
                placeholder: (_, __) => const LoadingSpinner(),
                fit: BoxFit.cover,
                errorWidget: (_, __, ___) => const ErrorImageWidget()),
          );
        }
      });
}
