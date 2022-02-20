import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:youbooks_app/shared/helper/helper_functions.dart';

class InfoHome extends StatelessWidget {
  const InfoHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String helpText =
        "I am very sorry that you can't find your youtuber or book. Youbooks is still under construction. I would be very happy if you send me the name so I can add it as soon as I can. I try to fill the database with more and more content. Unfortunately it's not so easy to find the booklists of many youtubers and it takes me a lot of time to do it accurately.";
    String whyText =
        "I read dozens of non-fiction books that could be considered part of the self-improvement bookshelf. While I was happy to read any new good book, I hated the feeling of reading a bad book just because I didn't know of any new good books at the moment. To get decent recommendations, I tried many channels. I asked people I admired, I used algorithms based on my reading habits (like Amazon), and I read reviews. Unfortunately, all of these methods were insufficient in themselves. While Amazon just isn't good at recommending good books to me, reading and comparing reviews and constantly looking for people I admire wasn't sustainable or reliable. Then I found a solution for myself that ended the problem.\n\nYoutube gave me the opportunity to find people I admire and their book recommendations on a constant basis. So I created a small database of books by youtubers I look up to, and compared which books most of them recommend. This has given me a steady supply of new book recommendations over the past few years. During this time the database grew to a size, where the recommendations became better and better, but where manuel comparison was not possible anymore. As people eventually started asking me for book recommendations, I started automating this process to save myself time.\n\nSince the algorithm I developed has proven to be useful and reliable for many other people as well as for myself, I'm now sharing this algorithm with you.";
    TextStyle style = const TextStyle(fontWeight: FontWeight.w300);
    return SingleChildScrollView(
      child: Container(
        color: Colors.grey[100],
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "How to use Youbooks:",
                style: style.copyWith(fontSize: 23),
              ),
              const SizedBox(height: 8),
              Text(
                "Search for a youtuber you like and see the recommended books.\n\nSearch for multiple youtuber's and find out on which books they agree. \n\nIn adittion, the algorithm will recommend other youtuber based on your search.",
                style: style,
              ),
              const Divider(
                color: Colors.red,
              ),
              Text(
                "Search for a book you liked and find the youtuber's who also recommend that book.\n\nSearch for multiple books and the recommended youtubers will fit better to your taste.\n\nMoreover, based on the choosen books and on the youtuber's that agree on your taste, the algorithm will show you your next book recommendations.",
                style: style,
              ),
              const SizedBox(height: 8),
              const Center(
                child: Image(
                  image: AssetImage("assets/cover.png"),
                  height: 200,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Why Youbooks:",
                style: style.copyWith(fontSize: 23),
              ),
              const SizedBox(height: 8),
              Text(
                whyText,
                style: style,
              ),
              const SizedBox(height: 6),
              const Divider(
                color: Colors.red,
              ),
              const SizedBox(height: 6),
              Text(
                "Can't find your youtuber or book?",
                style: style.copyWith(fontSize: 23),
              ),
              const SizedBox(height: 8),
              Text(
                helpText,
                style: style,
              ),
              const SizedBox(height: 16),
              Container(
                alignment: Alignment.bottomRight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () =>
                            launchURL("https://twitter.com/CasparBaumeist1"),
                        icon: const FaIcon(FontAwesomeIcons.twitter)),
                    const SizedBox(width: 5),
                    IconButton(
                        onPressed: () =>
                            launchURL("https://medium.com/@casparbm"),
                        icon: const FaIcon(FontAwesomeIcons.medium))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
