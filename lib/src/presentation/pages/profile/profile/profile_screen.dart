import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_discover/src/config/injection.dart';
import 'package:github_discover/src/constants/assets.dart';
import 'package:github_discover/src/domain/entities/skill.dart';
import 'package:github_discover/src/presentation/blocs/profile/profile_bloc.dart';
import 'package:github_discover/src/presentation/components/empty_state.dart';
import 'package:github_discover/src/presentation/components/loader.dart';
import 'package:github_discover/src/presentation/pages/profile/profile/profile_page.dart';
import 'package:github_discover/src/presentation/pages/profile/widgets/add_skill_dialog.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileBloc _bloc = getIt.get<ProfileBloc>();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    _bloc.add(ProfileInitalEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc,
      child: BlocBuilder<ProfileBloc, ProfileState>(
        bloc: _bloc,
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
            skills: state.skills ?? [],
            onAddItemPressed: () {
              showAddSkillDialog(
                context,
                titleController: titleController,
                descriptionController: descriptionController,
                onAddSkillPressed: () {
                  _bloc.add(SkillAddEvent(
                    title: titleController.text,
                    description: descriptionController.text,
                  ));
                  titleController.clear();
                  descriptionController.clear();
                  context.pop();
                },
              );
            },
            onDeleteItemPressed: (skill) {
              _bloc.add(SkillDeleteEvent(id: skill.id));
            },
            onUpdatedItemPressed: (skill) {
              _bloc.add(SkillUpdateEvent(skill: skill));
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
