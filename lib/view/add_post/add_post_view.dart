import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/view/add_post/description_text_field.dart';
import 'package:instagram_clone/view/add_post/post_button.dart';
import 'package:instagram_clone/view/add_post/selected_image.dart';
import 'package:instagram_clone/view/add_post/upload_button.dart';
import 'package:instagram_clone/view/home/controller/home_cubit.dart';
import 'package:instagram_clone/widgets/custom_snack_bar.dart';

class AddPostView extends StatelessWidget {
  const AddPostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is UploadPostSuccess) {
          showSnackBar(
              msg: 'the post uploaded successfully',
              snackBarStates: SnackBarStates.success);
          HomeCubit.get(context).clearImage();
        }
      },
      builder: (context, state) {
        final cubit = HomeCubit.get(context);
        return cubit.file == null
            ? UploadButton(onPressed: cubit.selectImage)
            : Scaffold(
                appBar: AppBar(
                    centerTitle: false,
                    title: const Text('Post to'),
                    leading: IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: cubit.clearImage),
                    actions: <Widget>[PostButton(onPressed: cubit.uploadPost)]),
                body: Column(
                  children: <Widget>[
                    state is UploadPostLoading
                        ? const LinearProgressIndicator()
                        : const Padding(padding: EdgeInsets.only(top: 0.0)),
                    const Divider(),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          CircleAvatar(
                              backgroundImage: CachedNetworkImageProvider(
                                  cubit.userModel!.photoUrl.toString())),
                          DescriptionTextField(
                              controller: cubit.descriptionController),
                          SelectedImage(image: cubit.file!),
                        ]),
                    const Divider()
                  ],
                ),
              );
      },
    );
  }
}
