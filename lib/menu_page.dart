// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'colors.dart';
import 'model/event.dart';

class MenuPage extends StatelessWidget {
  final Category currentCategory;
  final ValueChanged<Category> onCategoryTap;
  final List<Category> _categories = Category.values;

  const MenuPage({
    Key key,
    @required this.currentCategory,
    @required this.onCategoryTap,
  })  : assert(currentCategory != null),
        assert(onCategoryTap != null);

  Widget _buildCategory(Category category, BuildContext context) {
    final categoryString =
        category.toString().replaceAll('Category.', '').replaceAll('_', ' ').toUpperCase();
    final ThemeData theme = Theme.of(context);
    return GestureDetector(
      onTap: () => onCategoryTap(category),
      child: category == currentCategory
        ? Column(
          children: <Widget>[
            SizedBox(height: 16.0),
            Text(
              categoryString,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0,
                  color: kCSBWhite
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 14.0),
            Container(
              width: 70.0,
              height: 2.0,
              color: kCSBGreen,
            ),
          ],
        )
      : Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Text(
          categoryString,
          style: theme.textTheme.body2.copyWith(
              color: kCSBWhite
            ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
        padding: EdgeInsets.only(top: 40.0),
        color: kCSBDarkBlue,
        child: Column(
          children: [Column(
            mainAxisSize: MainAxisSize.min,
            children: _categories
              .map((Category c) => _buildCategory(c, context))
              .toList()),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text(
                      "Made with ❤ by ",
                    style: TextStyle(
                        color: kCSBWhite
                    ),
                  ),
                    Text(
                      "Wael",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: kCSBWhite
                      ),
                    ),
                  ]
              ),
            ),
          ]
        ),
    );
  }
}
