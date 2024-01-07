import '../../post/screen/post_screen.dart';
import '../../settings/screen/setting_screen.dart';
import '../../video/screen/video_screen.dart';
import '../screen/home_screen.dart';

List<Map<String, dynamic>> navRailScreenList = <Map<String, dynamic>>[
  {
    "title": "Home",
    "screen": const HomeScreen(),
  },
  {
    "title": "LEEP",
    "screen": const VideoScreen(),
  },
  {
    "title": "Blogs",
    "screen": const PostScreen(),
  },
  {
    "title": "Settings",
    "screen": const SettingScreen(),
  }
];
