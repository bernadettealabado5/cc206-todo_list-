import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'tl'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? tlText = '',
  }) =>
      [enText, tlText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // aHomepage
  {
    'rnayjnul': {
      'en': 'Get Stuff Done',
      'tl': '',
    },
    'hznue0vm': {
      'en': 'Register',
      'tl': '',
    },
    'd2b3sdiz': {
      'en': 'Login',
      'tl': '',
    },
    'i7wmnr05': {
      'en': '\nTerms and Conditions',
      'tl': '',
    },
    'l4hx83uz': {
      'en': 'Home',
      'tl': '',
    },
  },
  // cLogin
  {
    'yct0ec9w': {
      'en': 'Email Address',
      'tl': '',
    },
    'od0aapcq': {
      'en': 'Enter your email here...',
      'tl': '',
    },
    'q4dyebk3': {
      'en': 'Password',
      'tl': '',
    },
    'q74supk4': {
      'en': 'Enter your password here...',
      'tl': '',
    },
    '9ydegu6r': {
      'en': 'Login',
      'tl': '',
    },
    '02zxmbcm': {
      'en': 'Register',
      'tl': '',
    },
    'r7uakjty': {
      'en': 'Forgot Password?',
      'tl': '',
    },
    'eh3e1cxq': {
      'en': 'Please fill in a valid email address...',
      'tl': '',
    },
    'jvfcpryv': {
      'en': 'That password doesn\'t match.',
      'tl': '',
    },
    'sdasb3x9': {
      'en': 'Home',
      'tl': '',
    },
  },
  // bRegister
  {
    '1nql7rcg': {
      'en': 'Full Name',
      'tl': '',
    },
    '14oshbju': {
      'en': 'Enter your name here...',
      'tl': '',
    },
    'vu393gp5': {
      'en': 'Email Address',
      'tl': '',
    },
    '3miu7ncy': {
      'en': 'Enter your email here...',
      'tl': '',
    },
    'bl2x8zqz': {
      'en': 'Password',
      'tl': '',
    },
    'kjr0stqw': {
      'en': 'Enter your password here...',
      'tl': '',
    },
    'ew99cygg': {
      'en': 'Confirm Password',
      'tl': '',
    },
    'f22n7m13': {
      'en': 'Confirm password here...',
      'tl': '',
    },
    'y0issgel': {
      'en': 'Create Account',
      'tl': '',
    },
    'c706ycf5': {
      'en': 'Already have an account? Sign in.',
      'tl': '',
    },
    'r7evk02t': {
      'en': 'Home',
      'tl': '',
    },
  },
  // eTasksList
  {
    '12uoo8td': {
      'en': 'Pending',
      'tl': '',
    },
    'kpajbr6j': {
      'en': 'Overdue',
      'tl': '',
    },
    'hk5njjt4': {
      'en': 'Completed',
      'tl': '',
    },
    'vcj1o69e': {
      'en': 'Task Overview',
      'tl': '',
    },
    'sqbxce71': {
      'en': 'Home',
      'tl': '',
    },
  },
  // gProfile
  {
    '8oy2oafk': {
      'en': 'Edit Profile',
      'tl': '',
    },
    'ax51ebll': {
      'en': 'Update Account Information',
      'tl': '',
    },
    'i7s6n4o8': {
      'en': 'Display Name',
      'tl': '',
    },
    '1sacg7oo': {
      'en': 'Please enter your full name...',
      'tl': '',
    },
    '3qczq05m': {
      'en': 'Email Address',
      'tl': '',
    },
    'askxr98w': {
      'en': 'Your email...',
      'tl': '',
    },
    'g1iatr5k': {
      'en': 'Save Changes',
      'tl': '',
    },
    '4kvfjun5': {
      'en': 'Please fill in a valid email address...',
      'tl': '',
    },
    '9bgs7ivm': {
      'en': 'Please fill in a valid email address...',
      'tl': '',
    },
    'umqr45y3': {
      'en': 'Profile',
      'tl': '',
    },
  },
  // TaskDetails
  {
    'fnzdqt05': {
      'en': 'Due',
      'tl': '',
    },
    'kabc6lkz': {
      'en': 'Mark As Complete',
      'tl': '',
    },
    'zfhe9rdp': {
      'en': 'Home',
      'tl': '',
    },
  },
  // fMyProfile
  {
    'n23cdo96': {
      'en': 'Account Information',
      'tl': '',
    },
    '0kcuv5rn': {
      'en': 'Edit Profile',
      'tl': '',
    },
    'qcaj4dfy': {
      'en': 'Change Password',
      'tl': '',
    },
    'o2midy3o': {
      'en': 'Switch to Dark Mode',
      'tl': '',
    },
    '37k0wlit': {
      'en': 'Switch to Light Mode',
      'tl': '',
    },
    '0b3hpto0': {
      'en': 'About Us',
      'tl': '',
    },
    'xjf3xy4y': {
      'en': 'FAQs',
      'tl': '',
    },
    'u6dw10g6': {
      'en': 'Our Value',
      'tl': '',
    },
    'pxgxmsjm': {
      'en': 'Log Out',
      'tl': '',
    },
    'ei4lzlhw': {
      'en': 'App Version v0.0',
      'tl': '',
    },
    'g2jorull': {
      'en': 'Welcome,',
      'tl': '',
    },
    '2kp2l5qr': {
      'en': 'Profile',
      'tl': '',
    },
  },
  // hChangePassword
  {
    's6zao158': {
      'en':
          'Enter your email and we will send a reset password link to your email for you to update it.',
      'tl': '',
    },
    '1col7cr3': {
      'en': 'Email address here...',
      'tl': '',
    },
    '7fweiyso': {
      'en': 'We will send a link to your email...',
      'tl': '',
    },
    '0diq95sb': {
      'en': 'Send Link',
      'tl': '',
    },
    '1v3141eb': {
      'en': 'Please fill in a new password..',
      'tl': '',
    },
    '257xizpj': {
      'en': 'Change Password',
      'tl': '',
    },
    '02si8sjv': {
      'en': 'Home',
      'tl': '',
    },
  },
  // iSuccessCreateAccount
  {
    'tr3q190j': {
      'en': 'Success!',
      'tl': '',
    },
    'h76qd582': {
      'en': 'Your action was successful.',
      'tl': '',
    },
    'nwj9g894': {
      'en': 'OK',
      'tl': '',
    },
  },
  // jPendingTask
  {
    '5kfcgo2w': {
      'en': 'Pending Task',
      'tl': '',
    },
    '71v5r9b3': {
      'en': 'Add Task',
      'tl': '',
    },
  },
  // kCompletedTask
  {
    'tgyia0cv': {
      'en': 'Completed Task',
      'tl': '',
    },
    'vvfthrty': {
      'en': 'Add Task',
      'tl': '',
    },
  },
  // lMissedTask
  {
    '47hrozbz': {
      'en': 'Overdue Task',
      'tl': '',
    },
    '2wigq9l3': {
      'en': 'Add Task',
      'tl': '',
    },
  },
  // aboutUs
  {
    '33cflino': {
      'en':
          'Welcome to Get Stuff Done – your partner in productivity and the key to unlocking a more organized, efficient, and fulfilling life. Here\'s a glimpse into our story:\n\nAt Get Stuff Done, we believe that everyone deserves a tool that simplifies the chaos of modern living, making it easier to achieve your goals and savor life\'s moments. Our journey began with a simple realization – the need for a mobile to-do list application that goes beyond the mundane, elevating the way we manage our daily tasks.\n\nOur mobile to-do list app is not just a checklist; it\'s an intelligent companion that learns and grows with you. We\'ve combined cutting-edge technology with user-centric design to deliver an experience that is both intuitive and powerful. From smart task prioritization to effortless collaboration features,Get Stuff Done is designed to be more than just an app – it\'s an ally in your journey towards success.\n\nOur Mission:\nWe are on a mission to transform the way individuals approach productivity. We understand the challenges of balancing work, personal life, and everything in between. That\'s why we\'ve created an app that not only keeps your tasks in check but also adapts to your unique rhythm, ensuring you make the most out of every moment.\n',
      'tl': '',
    },
    '2g65i5k3': {
      'en': 'About Us',
      'tl': '',
    },
  },
  // FAQs
  {
    'jqrftg39': {
      'en': 'Q1: What is Get Stuff Done?',
      'tl': '',
    },
    'eshpvn3p': {
      'en':
          'A: Get Stuff Done is a user-friendly To-Do List App designed to help individuals organize, prioritize, and track their tasks effortlessly.',
      'tl': '',
    },
    'oem8hnpg': {
      'en': 'Q: How do I reset my password?',
      'tl': '',
    },
    'ny8kqb10': {
      'en':
          'A: To reset your password, go to the login page and click on the \'Forgot Password?\' link. Follow the instructions provided to reset your password.',
      'tl': '',
    },
    'dgxlkp0m': {
      'en': 'Q: How do I contact customer support?',
      'tl': '',
    },
    'rtrvckgk': {
      'en':
          'A: You can contact our customer support team by emailing support@website.com or by calling our toll-free number at 1-800-123-4567.',
      'tl': '',
    },
    '928whj0x': {
      'en': 'Q2: How do I sign up and is my information secure?',
      'tl': '',
    },
    'um4taaxa': {
      'en':
          'A: Signing up is easy! Use our secure sign-in features to create an account. Rest assured, we prioritize your privacy and ensure your information is guarded against unauthorized access.',
      'tl': '',
    },
    '1iuqgk4b': {
      'en': 'Q: How do I reset my password?',
      'tl': '',
    },
    'yegvuzf0': {
      'en':
          'A: To reset your password, go to the login page and click on the \'Forgot Password?\' link. Follow the instructions provided to reset your password.',
      'tl': '',
    },
    'gr029phd': {
      'en': 'Q: How do I contact customer support?',
      'tl': '',
    },
    'dwv66dww': {
      'en':
          'A: You can contact our customer support team by emailing support@website.com or by calling our toll-free number at 1-800-123-4567.',
      'tl': '',
    },
    'nyzlv34i': {
      'en': 'Q3: Can I collaborate with others on tasks using Get Stuff Done?',
      'tl': '',
    },
    '9eq5h5k7': {
      'en':
          'A: Currently, Get Stuff Done is designed for individual task management, and collaborative features are not available. We understand the importance of collaboration and are actively exploring possibilities to enhance our app in the future. Stay tuned for updates on new features that may include collaborative task management!',
      'tl': '',
    },
    '5w3v9hi0': {
      'en': 'Q: How do I reset my password?',
      'tl': '',
    },
    '2stkv046': {
      'en':
          'A: To reset your password, go to the login page and click on the \'Forgot Password?\' link. Follow the instructions provided to reset your password.',
      'tl': '',
    },
    'hsv3tqvk': {
      'en': 'Q: How do I contact customer support?',
      'tl': '',
    },
    'abzqmxhn': {
      'en':
          'A: You can contact our customer support team by emailing support@website.com or by calling our toll-free number at 1-800-123-4567.',
      'tl': '',
    },
    '0bm63vuk': {
      'en':
          'Q4: Does Get Stuff Done support batch editing for tasks, allowing me to make changes to multiple tasks simultaneously?',
      'tl': '',
    },
    '11ulixfd': {
      'en':
          'A: Currently, Get Stuff Done does not have a batch editing feature. Each task is managed individually. However, our team values user feedback and is exploring ways to improve task management efficiency, including the possibility of introducing batch editing features in future updates. Stay tuned for any announcements on enhancements to task editing capabilities!',
      'tl': '',
    },
    '76t9imdx': {
      'en': 'Q: How do I reset my password?',
      'tl': '',
    },
    'z17wi294': {
      'en':
          'A: To reset your password, go to the login page and click on the \'Forgot Password?\' link. Follow the instructions provided to reset your password.',
      'tl': '',
    },
    'm8vxrbar': {
      'en': 'Q: How do I contact customer support?',
      'tl': '',
    },
    'at7i2d5u': {
      'en':
          'A: You can contact our customer support team by emailing support@website.com or by calling our toll-free number at 1-800-123-4567.',
      'tl': '',
    },
    'bvup3n7p': {
      'en':
          'Q5: Can I customize the appearance or theme of Get Stuff Done to suit my preferences?',
      'tl': '',
    },
    'k8qgzve2': {
      'en':
          'A: Currently, the app has a default appearance. However, we understand the importance of personalization. Our team is exploring options for users to customize the app\'s appearance.',
      'tl': '',
    },
    'v9zmwyfq': {
      'en': 'Q: How do I reset my password?',
      'tl': '',
    },
    'ytnw3d0j': {
      'en':
          'A: To reset your password, go to the login page and click on the \'Forgot Password?\' link. Follow the instructions provided to reset your password.',
      'tl': '',
    },
    '1t6nd8s1': {
      'en': 'Q: How do I contact customer support?',
      'tl': '',
    },
    'e9vu0y1h': {
      'en':
          'A: You can contact our customer support team by emailing support@website.com or by calling our toll-free number at 1-800-123-4567.',
      'tl': '',
    },
    'vebiymi4': {
      'en': 'Frequently Asked Questions',
      'tl': '',
    },
  },
  // ourValues
  {
    '13y0gtn0': {
      'en': 'Our Values',
      'tl': '',
    },
    'h2dorxl7': {
      'en':
          'At our company, we believe in the following core values that guide our work and interactions with our customers and partners.',
      'tl': '',
    },
    'bswznuml': {
      'en': '1. Integrity',
      'tl': '',
    },
    '1hdomee3': {
      'en':
          'We uphold the highest standards of honesty and ethics in all our actions.',
      'tl': '',
    },
    'jim80qkw': {
      'en': '2. Excellence',
      'tl': '',
    },
    'sqr5emng': {
      'en':
          'We strive for excellence in everything we do, always seeking to improve and deliver the best results.',
      'tl': '',
    },
    'hbrukkg0': {
      'en': '3. Collaboration',
      'tl': '',
    },
    'f0z8wj2t': {
      'en':
          'We believe in the power of teamwork and collaboration, working together to achieve common goals.',
      'tl': '',
    },
    'yqu1o0t5': {
      'en': '4. Innovation',
      'tl': '',
    },
    'tdmpnu5n': {
      'en':
          'We embrace innovation and continuously seek new and creative solutions to meet the evolving needs of our customers.',
      'tl': '',
    },
    'voy3imvq': {
      'en': '5. Customer Focus',
      'tl': '',
    },
    'pic0liu6': {
      'en':
          'We prioritize our customers\' needs and strive to provide exceptional service and value.',
      'tl': '',
    },
    '6nskmewh': {
      'en': '6. Diversity and Inclusion',
      'tl': '',
    },
    '505gjy3i': {
      'en':
          'We celebrate diversity and foster an inclusive environment where everyone feels valued and respected.',
      'tl': '',
    },
    'vgt5v0zy': {
      'en': 'Our Values',
      'tl': '',
    },
  },
  // termsAndConditions
  {
    '7egx1m66': {
      'en':
          'Please read the following terms and conditions carefully before using our services.',
      'tl': '',
    },
    'jx8keqgd': {
      'en': '1. Acceptance of Terms',
      'tl': '',
    },
    'qkuae9ar': {
      'en':
          'By accessing or using our services, you agree to be bound by these terms and conditions. If you do not agree to these terms and conditions, please do not use our services.',
      'tl': '',
    },
    'kw5kgnlz': {
      'en': '2. Intellectual Property',
      'tl': '',
    },
    'brmb0beo': {
      'en':
          'All intellectual property rights in our services and the content on our platform are owned by us or our licensors. You may not use, reproduce, or distribute any of our intellectual property without our prior written consent.',
      'tl': '',
    },
    'ywasu191': {
      'en': '3. User Conduct',
      'tl': '',
    },
    'tc6zqnnz': {
      'en':
          'You agree to use our services in a lawful and responsible manner. You are solely responsible for any content you submit or post on our platform. You must not engage in any activity that may disrupt or interfere with the functioning of our services.',
      'tl': '',
    },
    'okboopvx': {
      'en': '4. Limitation of Liability',
      'tl': '',
    },
    '51zatdxo': {
      'en':
          'We are not liable for any direct, indirect, incidental, or consequential damages arising out of or in connection with your use of our services. We do not warrant the accuracy, reliability, or completeness of any information on our platform.',
      'tl': '',
    },
    'cm13wl0g': {
      'en': '5. Governing Law',
      'tl': '',
    },
    'aolxn2ej': {
      'en':
          'These terms and conditions shall be governed by and construed in accordance with the laws of your jurisdiction. ',
      'tl': '',
    },
    '08u9eo64': {
      'en': 'Terms and Conditions',
      'tl': '',
    },
  },
  // emptyList_tasks
  {
    'c1jwirb4': {
      'en': 'You don\'t have any tasks',
      'tl': '',
    },
    'hyev6h6g': {
      'en': 'Create tasks by tapping the button below.',
      'tl': '',
    },
    'ljvtfzwa': {
      'en': 'Create Task',
      'tl': '',
    },
  },
  // CreateTask_new
  {
    'czaxn8fb': {
      'en': 'Add Task',
      'tl': '',
    },
    'bbj8lcj8': {
      'en': 'Fill out the details below to add a new task.',
      'tl': '',
    },
    '0qwrbdnn': {
      'en': 'Task Name',
      'tl': '',
    },
    'c560ggwi': {
      'en': 'Enter your task here....',
      'tl': '',
    },
    'baxqz3u1': {
      'en': 'Details',
      'tl': '',
    },
    '50r4ucnv': {
      'en': 'Enter a description here...',
      'tl': '',
    },
    'qcf0juod': {
      'en': 'Due Date',
      'tl': '',
    },
    'ojafmzdc': {
      'en': 'Enter due date here...',
      'tl': '',
    },
    '8vsxscrb': {
      'en': 'Cancel',
      'tl': '',
    },
    'rp9mndm1': {
      'en': 'Create Task',
      'tl': '',
    },
  },
  // CreateTask_Edit
  {
    'grr4ul8n': {
      'en': 'Edit Task',
      'tl': '',
    },
    'sxry7ysb': {
      'en': 'Fill out the details below to edit a new task.',
      'tl': '',
    },
    '8zbeupns': {
      'en': 'Task Name',
      'tl': '',
    },
    '73ko1lpg': {
      'en': 'Enter your task here....',
      'tl': '',
    },
    'ubyzenf0': {
      'en': 'Details',
      'tl': '',
    },
    'f7dtxsti': {
      'en': 'Enter a description here...',
      'tl': '',
    },
    'dajv95f0': {
      'en': 'Due Date',
      'tl': '',
    },
    '8r15vzda': {
      'en': 'Cancel',
      'tl': '',
    },
    'zo40fgk0': {
      'en': 'Update Task',
      'tl': '',
    },
  },
  // welcomeMessage
  {
    'w4b722kv': {
      'en': 'Hello, ',
      'tl': '',
    },
  },
  // TASKVIEW
  {
    '5nkkowio': {
      'en': 'TASK OVERIEW',
      'tl': '',
    },
    'z028pf85': {
      'en': 'Fill out the details below to edit a new task.',
      'tl': '',
    },
    '4kgb7bff': {
      'en': 'Task Name',
      'tl': '',
    },
    'y7fkjplt': {
      'en': 'Enter your task here....',
      'tl': '',
    },
    'm5zub9jq': {
      'en': 'Details',
      'tl': '',
    },
    'nhbj8hwy': {
      'en': 'Enter a description here...',
      'tl': '',
    },
    'jsqtnqi4': {
      'en': 'Due Date',
      'tl': '',
    },
    'oqkbhyu3': {
      'en': 'Done',
      'tl': '',
    },
  },
  // Miscellaneous
  {
    'kmchwdrg': {
      'en':
          '\"Get Stuff Done: A To-Do List Application\" would like to access your camera.',
      'tl': '',
    },
    'ux21ncm3': {
      'en':
          '\"Get Stuff Done: A To-Do List Application\" would like to access your calendar.',
      'tl': '',
    },
    'i2mmcp73': {
      'en':
          '\"Get Stuff Done: A To-Do List Application\" would like to send you notification.',
      'tl': '',
    },
    'o9e2eu03': {
      'en':
          '\"Get Stuff Done: A To-Do List Application\" would like to access your photos.',
      'tl': '',
    },
    'd33bopqv': {
      'en':
          '\"Get Stuff Done: A To-Do List Application\" would like to access your microphone.',
      'tl': '',
    },
    'fkfdgnln': {
      'en':
          '\"Get Stuff Done: A To-Do List Application\" would like to access your location.',
      'tl': '',
    },
    '2ptay7k6': {
      'en':
          '\"Get Stuff Done: A To-Do List Application\" would like to access your contacts.',
      'tl': '',
    },
    '6l6o1wab': {
      'en':
          'Do you want to allow \"Get Stuff Done: A To-Do List Application\" to use FaceID.',
      'tl': '',
    },
    'yb37r60m': {
      'en':
          '\"Get Stuff Done: A To-Do List Application\" would like to use  bluetooth.',
      'tl': '',
    },
    'qzzhvocu': {
      'en': '',
      'tl': '',
    },
    'rmpusirt': {
      'en': '',
      'tl': '',
    },
    'xprudi5i': {
      'en': '',
      'tl': '',
    },
    '3skg021a': {
      'en': '',
      'tl': '',
    },
    'fiivh6x5': {
      'en': '',
      'tl': '',
    },
    '9wueqo5w': {
      'en': '',
      'tl': '',
    },
    '1l27q8ae': {
      'en': '',
      'tl': '',
    },
    '4wc8mw42': {
      'en': '',
      'tl': '',
    },
    'jekdhfxm': {
      'en': '',
      'tl': '',
    },
    '8kbpaqfl': {
      'en': '',
      'tl': '',
    },
    'wg8gxpi6': {
      'en': '',
      'tl': '',
    },
    '6gysskyd': {
      'en': '',
      'tl': '',
    },
    'rgktlk1k': {
      'en': '',
      'tl': '',
    },
    '1kfsm9u2': {
      'en': '',
      'tl': '',
    },
    'fhsjgu2o': {
      'en': '',
      'tl': '',
    },
    'dh2x9wgh': {
      'en': '',
      'tl': '',
    },
    '8rc7ik5c': {
      'en': '',
      'tl': '',
    },
    'c6ekof0k': {
      'en': '',
      'tl': '',
    },
    'zesgcgis': {
      'en': '',
      'tl': '',
    },
    '438zfgbg': {
      'en': '',
      'tl': '',
    },
    'c2xu3qp4': {
      'en': '',
      'tl': '',
    },
    'f5rz93sx': {
      'en': '',
      'tl': '',
    },
    'fuvvjl6r': {
      'en': '',
      'tl': '',
    },
  },
].reduce((a, b) => a..addAll(b));
