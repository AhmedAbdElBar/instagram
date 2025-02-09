import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram/features/Explore_screen/data/exploreServise.dart';
import 'package:instagram/features/home/presentation/widgets/post_widget.dart';
import 'package:instagram/features/profile_page/presentation/view/profilePage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ExploreScreen extends StatefulWidget {
  static const String routeName = "explore_screen";

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final TextEditingController searchController = TextEditingController();
  final ExploreService exploreService = ExploreService();
  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(AppLocalizations.of(context)!.explore),

      ),
      body: Container(
        child: Column(
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: searchController,
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.searchForUsers,
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),

            // User List
            searchQuery.isEmpty
                ?  Center(child: Text(AppLocalizations.of(context)!.pleaseEnterAUsername))
                : Expanded(
                    child: StreamBuilder<QuerySnapshot>(
                      stream: exploreService.searchUsers(searchQuery),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        }
                        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                          return Center(child: Text(AppLocalizations.of(context)!.noUsersFound));
                        }

                        final users = snapshot.data!.docs;

                        return ListView.builder(
                          itemCount: users.length,
                          itemBuilder: (context, index) {
                            final user = users[index];
                            final username = user["username"] ?? "Unknown User";
                            final profileImage = user["profileImage"] ??
                                "assets/posts/post (16).png";
                            final bio = user["bio"] ?? "No bio available";

                            return ListTile(
                              leading: CircleAvatar(
                                backgroundImage: AssetImage(profileImage),
                              ),
                              title: Text(username),
                              subtitle: Text(bio),
                              onTap: () {
                                Navigator.pushNamed(
                                    context, Profilepage.routname,
                                    arguments: ProfileInfo(
                                        username: username,
                                        profileImage: profileImage));
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
