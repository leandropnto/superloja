import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:superloja/presentation/core/constants.dart';

class ImageSourceSheet extends StatelessWidget {
  final Function(File file) onImageSelected;

  final ImagePicker imagePicker = ImagePicker();

  Future<void> _handleImage(BuildContext context, ImageSource source) async {
    final file = await imagePicker.getImage(source: source);
    if (file != null) {
      final cropedFile = await ImageCropper.cropImage(
          sourcePath: file.path,
          aspectRatio: const CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
          androidUiSettings: const AndroidUiSettings(
            backgroundColor: kPrimaryLightColor,
            toolbarTitle: 'Editar Imagem',
            toolbarColor: kPrimaryColor,
            toolbarWidgetColor: Colors.white,
          ),
        iosUiSettings: const IOSUiSettings(
          doneButtonTitle: 'Salvar',
          cancelButtonTitle: 'Cancelar',
          title: 'Editar Imagem',
        ),
      );
      if (cropedFile != null) await onImageSelected(cropedFile);
    }

    Navigator.of(context).pop();
  }

  ImageSourceSheet({Key key, this.onImageSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? BottomSheet(
            onClosing: () {},
            builder: (_) => Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                FlatButton(
                  onPressed: () async {
                    await _handleImage(context, ImageSource.camera);
                  },
                  child: const Text('Câmera'),
                ),
                FlatButton(
                  onPressed: () async {
                    await _handleImage(context, ImageSource.gallery);
                  },
                  child: const Text('Galeria'),
                ),
              ],
            ),
          )
        : CupertinoActionSheet(
            title: const Text("Selecionar foto para o produto"),
            message: const Text("Escolha o local da foto"),
            cancelButton: CupertinoActionSheetAction(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancelar'),
            ),
            actions: <Widget>[
              CupertinoActionSheetAction(
                isDefaultAction: true,
                onPressed: () async {
                  await _handleImage(context, ImageSource.camera);
                },
                child: const Text('Câmera'),
              ),
              CupertinoActionSheetAction(
                onPressed: () async {
                  await _handleImage(context, ImageSource.gallery);
                },
                child: const Text('Galeria'),
              ),
            ],
          );
  }
}
