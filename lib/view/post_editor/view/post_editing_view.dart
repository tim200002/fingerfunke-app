import 'package:fingerfunke_app/common_widgets/helper_widgets.dart';
import 'package:fingerfunke_app/models/post/post.dart';
import 'package:fingerfunke_app/utils/dev_tools.dart';
import 'package:fingerfunke_app/utils/util_widgets/text_input_dialog.dart';
import 'package:fingerfunke_app/view/post_editor/cubit/editing_post_model.dart';
import 'package:fingerfunke_app/view/post_editor/cubit/post_editor_cubit.dart';
import 'package:fingerfunke_app/view/video_recorder/view/video_recorder_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/src/provider.dart';

const titleMaxCharacters = 160;

class PostEditingView extends StatelessWidget {
  final EditingPost post;
  const PostEditingView({Key? key, required this.post}) : super(key: key);

  Widget _eventGroupButton(BuildContext context,
      {required void Function() onPressed,
      required IconData icon,
      required String text,
      required bool selected}) {
    final Color color = selected ? Colors.black : Colors.grey;
    return InkWell(
        onTap: onPressed,
        child: Column(children: [
          Icon(
            icon,
            color: color,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(text,
                style: TextStyle(
                    color: color,
                    fontWeight:
                        selected ? FontWeight.bold : FontWeight.normal)),
          )
        ]));
  }

  Widget _metaInfoButton(BuildContext context,
      {required void Function() onPressed,
      required IconData icon,
      required String text}) {
    return InkWell(
        onTap: onPressed,
        child: Row(children: [
          Icon(icon),
          Expanded(
            child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade50),
                  child: Text(text,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                )),
          )
        ]));
  }

  Widget _mediaSection(BuildContext context) {
    return InkWell(
        onTap: () => Navigator.push(context, VideoRecorderPage.route()),
        child: HelperWidgets.materialHero(
          tag: VideoRecorderPage.videoHeroTag,
          child: Container(
            width: 125,
            height: 210,
            decoration: BoxDecoration(
              color: Colors.teal.shade100,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Text("TODO:\nPostVideo"),
            ),
          ),
        ));
  }

  Widget _eventInfo(BuildContext context) {
    return Column(
      children: [
        _metaInfoButton(context,
            text: post.eveTime.dateString,
            icon: Icons.calendar_today_rounded,
            onPressed: () => showDatePicker(
                        context: context,
                        initialDate: post.eveTime,
                        firstDate: DateTime(2021),
                        lastDate: DateTime.now().add(const Duration(
                            days:
                                365))) //what will be the up to supported date in picker
                    .then((pickedDate) {
                  if (pickedDate != null) {
                    context.read<PostEditorCubit>().changePostInfo(post
                        .copyWith(eveTime: post.eveTime.copyDate(pickedDate)));
                  }
                })),
        const SizedBox(
          height: 20,
        ),
        _metaInfoButton(context,
            text: post.eveTime.timeString,
            icon: Icons.schedule,
            onPressed: () => showTimePicker(
                        context: context, initialTime: post.eveTime.timeOfDay)
                    .then((value) {
                  if (value != null) {
                    context.read<PostEditorCubit>().changePostInfo(
                        post.copyWith(eveTime: post.eveTime.copyTime(value)));
                  }
                }))
      ],
    );
  }

  Widget _groupInfo(BuildContext context) {
    return Column(
      children: [
        _metaInfoButton(context,
            text: post.recTime ?? "Zeitpunkt",
            icon: Icons.calendar_today_rounded,
            onPressed: () => TextInputDialog.show(
                title: "Wann trifft sich die Gruppe?",
                hint: "z.B. Mittwochs 18:00",
                value: post.recTime ?? "",
                barrierDismissible: true,
                context: context,
                onSubmitted: (value) => context
                    .read<PostEditorCubit>()
                    .changePostInfo(post.copyWith(recTime: value)))),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget _eventGroupInfo(
    BuildContext context,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 35),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _eventGroupButton(context,
                  text: "Event",
                  icon: Icons.mood_rounded,
                  selected: post.isEvent,
                  onPressed: () => context
                      .read<PostEditorCubit>()
                      .changePostInfo(post.copyWith(type: post_type.event))),
              _eventGroupButton(context,
                  text: "Gruppe",
                  icon: Icons.people_rounded,
                  selected: post.isRecurrent,
                  onPressed: () => context
                      .read<PostEditorCubit>()
                      .changePostInfo(
                          post.copyWith(type: post_type.recurrent))),
            ],
          ),
        ),
        post.isEvent ? _eventInfo(context) : _groupInfo(context)
      ],
    );
  }

  Widget _titleField(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.headline3,
      minLines: 1,
      maxLines: 3,
      maxLength: titleMaxCharacters,
      controller: post.descriptionController,
      onEditingComplete: () => print("text edited"),
      onChanged: (val) => context
          .read<PostEditorCubit>()
          .changePostInfo(post.copyWith(title: val)),
      decoration: InputDecoration(
          counterText: "",
          border: InputBorder.none,
          hintText: "Titel des Posts",
          hintStyle: Theme.of(context)
              .textTheme
              .headline3
              ?.copyWith(color: Colors.grey)),
    );
  }

  Widget _descriptionField(BuildContext context) {
    return TextField(
        maxLines: null,
        controller: post.descriptionController,
        decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "Beschreibe deinen Post",
            hintStyle: TextStyle(color: Colors.grey)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(post.isEvent ? "neues Event" : "neue Gruppe"),
          leading: IconButton(
              icon: const Icon(Icons.close_rounded),
              onPressed: () => Navigator.of(context).pop())),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _mediaSection(context),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: _eventGroupInfo(context),
                    ),
                  ))
                ],
              ),
            ),
            const SizedBox(height: 30),
            _titleField(context),
            //const SizedBox(height: 10),
            _descriptionField(context)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.send_rounded),
        onPressed: () => context.read<PostEditorCubit>().submit(post),
      ),
    );
  }
}
