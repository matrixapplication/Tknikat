import 'package:flutter/material.dart';

import '../../../core/app_localizations.dart';
import '../../../core/constent.dart';
import '../gallery_category/gallery_category_cubit.dart';

showDeleteDialog(context,String title,int id,GalleryCategoryCubit cubit) async {
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
          ),
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${AppLocalizations.of(context).translate("deleteCategory2")}',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                '${AppLocalizations.of(context).translate("deleteCategoryMess")} ${title}',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                      shape:RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onPressed: () {
                        cubit.deleteCategoryGallery(id);
                      },
                      color: primaryColor,
                      textColor: Colors.white,
                      child:Padding(
                          padding: EdgeInsets.only(top: 7),
                          child: Text(
                              '${AppLocalizations.of(context).translate("Delete")}',)),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color:primaryColor)
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      color: Colors.white,
                      textColor:primaryColor ,
                      child:Padding(
                          padding: EdgeInsets.only(top: 7),
                          child: Text( '${AppLocalizations.of(context).translate("Cancel")}',)),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      );
    },
  );

}
