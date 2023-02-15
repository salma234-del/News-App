import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

Widget buildArticleItem(article, context) => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage('${article['urlToImage']}'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Container(
              height: 120,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '${article['title']}',
                      style: Theme.of(context).textTheme.bodyText1,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    '${article['publishedAt']}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xffADC5CF),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

Widget divider() => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 1,
        color: const Color(0xffADC5CF),
      ),
    );

Widget articleBuilder(articles, context) => ConditionalBuilder(
      condition: articles.isNotEmpty,
      builder: (context) => ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) =>
            buildArticleItem(articles[index], context),
        separatorBuilder: (context, index) => divider(),
        itemCount: articles.length,
      ),
      fallback: (context) => const Center(child: CircularProgressIndicator()),
    );

Widget defaultTextField({
  required TextEditingController controller,
  required TextInputType type,
  required String? Function(String?) validate,
  Function? onSubmit,
  Function? onChange,
  bool password = false,
  required String label,
  required IconData preIcon,
  IconData? suffIcon,
  Function? suffPressed,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      validator: validate,
      onFieldSubmitted: (value) {
        onSubmit!(value);
      },
      onChanged: (value) {
        onChange!(value);
      },
      obscureText: password,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(preIcon),
        suffixIcon: IconButton(
          icon: Icon(suffIcon),
          onPressed: () {
            suffPressed!();
          },
        ),
        border: const OutlineInputBorder(),
      ),
    );

void navigateTo(context, widget) {
  Navigator.push(context, MaterialPageRoute(
    builder: (context) => widget,
    )
    );
}
