import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../utils/app_styles.dart';
import '../../../auth/provider/auth_provider.dart';

class PlayerSelection extends ConsumerStatefulWidget {
  const PlayerSelection({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PlayerSelectionState();
}

class _PlayerSelectionState extends ConsumerState<PlayerSelection> {
  @override
  Widget build(BuildContext context) {
    var style = CustomTextStyles();
    var usersStream = ref.watch(usersStreamProvider);
    var size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        color: Colors.white,
      ),
      height: size.height * .8,
      child: Column(
        children: [
          Row(
            children: [
              //close button
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close),
              ),
              const SizedBox(width: 10),
              const Text(
                'Select a player to play with',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          Expanded(
            child: usersStream.when(
              data: (users) {
                return ListView.separated(
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    var user = users[index];
                    return ListTile(
                      onTap: () {
                        //navigate to game page
                      },
                      contentPadding: EdgeInsets.zero,
                      leading: CircleAvatar(
                        radius: 20,
                        backgroundImage: user.profileImage.isNotEmpty
                            ? NetworkImage(user.profileImage)
                            : null,
                        child: user.profileImage.isEmpty
                            ? Text(
                                user.userName.isNotEmpty
                                    ? user.userName[0].toUpperCase()
                                    : '',
                                style: GoogleFonts.poppins(fontSize: 25),
                              )
                            : null,
                      ),
                      title: Row(
                        children: [
                          Expanded(
                            child: Text(
                              user.userName,
                              style: style.bodyStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          //user online status
                          Container(
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: user.isOnline ? Colors.green : Colors.grey,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            user.isOnline ? 'Online' : 'Offline',
                            style: style.bodyStyle(
                                color:
                                    user.isOnline ? Colors.green : Colors.grey,
                                fontSize: 12),
                          )
                        ],
                      ),
                      subtitle: Text(
                        user.email,
                        style: style.bodyStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    );
                  },
                );
              },
              loading: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
              error: (error, stackTrace) {
                return Center(
                  child: Text('Error: $error'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
