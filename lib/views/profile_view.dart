import 'package:flutter/material.dart';
import 'package:nike_ecom/views/my_orders_page.dart';
import '../controller/profile_controller.dart';

class ProfileView extends StatelessWidget {
  final controller = ProfileController();

  ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final user = controller.user;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 40),
                CircleAvatar(
                  radius: 48,
                  backgroundColor: Colors.grey[200],
                  backgroundImage: AssetImage(user.profileImage),
                ),
                const SizedBox(height: 12),
                Text(
                  user.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 8),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    side: const BorderSide(color: Colors.black),
                    padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 10),
                  ),
                  child: const Text("Edit Profile"),
                ),
                const SizedBox(height: 30),

                // Icon Grid
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _IconWithLabel(
                      icon: Icons.shopping_bag_outlined,
                      label: "Orders",
                      onpresss: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyOrdersPage()),
                        );
                      },
                    ),
                    const _VerticalLine(),
                    const _IconWithLabel(
                      icon: Icons.card_membership_outlined,
                      label: "Pass",
                    ),
                    const _VerticalLine(),
                    const _IconWithLabel(
                      icon: Icons.event_outlined,
                      label: "Events",
                    ),
                    const _VerticalLine(),
                    const _IconWithLabel(
                      icon: Icons.settings_outlined,
                      label: "Settings",
                    ),
                  ],
                ),

                const SizedBox(height: 30),
                const Divider(),

                // Inbox
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text("Inbox"),
                  subtitle: const Text("View messages", style: TextStyle(color: Colors.grey)),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.arrow_forward_ios, size: 16),
                      const SizedBox(width: 6),
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.red,
                        child: Text(
                          '${user.inboxCount}',
                          style: const TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),

                const Divider(),

                // Rewards
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text(
                    "Your Nike Member Rewards",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: const Text("2 available"),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                ),

                const Divider(),

                // Following
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Following (${user.followingCount})",
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text("Edit"),
                      )
                    ],
                  ),
                ),

                SizedBox(
                  height: 160,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: user.followingImages.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 10),
                    itemBuilder: (_, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          user.followingImages[index],
                          width: 150,
                          height: 400,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _IconWithLabel extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onpresss;

  const _IconWithLabel({
    required this.icon,
    required this.label,
    this.onpresss,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpresss,
      child: Column(
        children: [
          Icon(icon, size: 28),
          const SizedBox(height: 6),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}

class _VerticalLine extends StatelessWidget {
  const _VerticalLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 1,
      color: Colors.grey.shade400,
    );
  }
}
