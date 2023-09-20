import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_discover/src/config/injection.dart';
import 'package:github_discover/src/config/routes.dart';
import 'package:github_discover/src/constants/assets.dart';
import 'package:github_discover/src/domain/entities/skill.dart';
import 'package:github_discover/src/presentation/blocs/profile/profile_bloc.dart';
import 'package:github_discover/src/presentation/components/empty_state.dart';
import 'package:github_discover/src/presentation/components/loader.dart';
import 'package:github_discover/src/presentation/pages/profile/profile/profile_page.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileBloc _bloc = getIt.get<ProfileBloc>();

  @override
  void initState() {
    super.initState();
    _bloc.add(ProfileInitalEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc,
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoadingState) {
            return const CustomLoader();
          }

          if (state is ProfileErrorState) {
            return CustomEmptyState(
              iconPath: Asset.stopIcon,
              description: state.message ?? '',
            );
          }

          return ProfilePage(
            profile: state.profile,
            skills: state.skills,
            onClickAddItem: () => context.pushNamed(AppRoute.addSkill.name),
            onClickDeleteItem: (skill) {
              context
                  .read<ProfileBloc>()
                  .add(SkillDeletedEvent(id: skill.id ?? 0));
            },
            onToggleCompleteItem: (skill) {
              context
                  .read<ProfileBloc>()
                  .add(SkillCompletedEvent(skill: skill));
            },
            onReorder: (oldIndex, newIndex) {
              setState(() {
                if (oldIndex < newIndex) {
                  newIndex -= 1;
                }
                final Skill item = state.skills!.removeAt(oldIndex);
                state.skills!.insert(newIndex, item);
              });
            },
          );
        },
      ),
    );
  }
}
