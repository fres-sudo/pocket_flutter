import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocket_flutter/state/cubits/auth/auth_cubit.dart';
import 'package:pocket_flutter/ui/widgets/loading_spinner.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key, this.isEditable = false, this.radius = 50});

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
          return CachedNetworkImage(
            imageUrl: avatar,
            imageBuilder: (context, imageProvider) => Container(
              width: radius * 2,
              height: radius * 2,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              ),
            ),
            placeholder: (context, url) => const LoadingSpinner(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          );
        }
      });
}
