import 'package:flutter/material.dart';

class PortfolioData {
  static const String name = "SEIF TARIQ";
  static const String title = "ENTERPRISE FLUTTER DEVELOPER";
  static const String subtitle =
      "Architecting Rigid, Zero-Leak Mobile Systems via Pure Clean Frameworks";
  static const String profileImagePath = "assets/images/seif.png";

  static const String fullAboutMe =
      "I am a professional Flutter Developer specialized in elite enterprise mobile application systems execution. My engineering philosophy revolves around unyielding implementation of Clean Architecture boundaries, rigid SOLID design principles, and writing production-grade, zero-leak reactive Dart systems. I architect robust mobile ecosystems engineered for massive concurrency, multi-role multi-tenant architectures, and secure financial gateway communication pipelines. I possess deep mastery in orchestrating complex backend integrations, ranging from high-performance RESTful APIs to real-time, scalable Firebase ecosystems (including Firestore, Auth, and Cloud Functions). Through deep expertise in advanced state automation like BLoC/Cubit and custom native integrations, I bridge the gap between heavy enterprise backend capabilities and ultra-fluid, reactive client interfaces.";

  static const List<Map<String, dynamic>> structuredSkills = [
    {
      "name": "Strict Clean Architecture",
      "desc":
          "Total isolation of Data, Domain, and Presentation layers for pure testability.",
      "icon": Icons.layers_rounded,
      "color": Color(0xFF58A6FF),
    },
    {
      "name": "BLoC & Cubit Flow",
      "desc":
          "Predictable state mutation topologies with completely decoupled business logic.",
      "icon": Icons.loop_rounded,
      "color": Color(0xFF6366F1),
    },
    {
      "name": "SOLID Design Principles",
      "desc":
          "Writing clean, decoupled, heavily componentized, and robust object-oriented code.",
      "icon": Icons.gavel_rounded,
      "color": Color(0xFF10B981),
    },
    {
      "name": "REST APIs & Interceptors",
      "desc":
          "Advanced network orchestration via Dio with active authorization token-refresh loops.",
      "icon": Icons.cloud_queue_rounded,
      "color": Color(0xFFFF9E2C),
    },
    {
      "name": "Firestore Live Streams",
      "desc":
          "Constructing dynamic real-time client listeners synchronized flawlessly with local entities.",
      "icon": Icons.sync_alt_rounded,
      "color": Color(0xFFEF4444),
    },
    {
      "name": "Hive Binary Caching",
      "desc":
          "Ultra-fast local disk memory pipelines utilizing highly compressed binary custom adapters.",
      "icon": Icons.storage_rounded,
      "color": Color(0xFFEC4899),
    },
    {
      "name": "Cursor-Based Pagination",
      "desc":
          "Heavy-duty infinite data streaming management without impacting system memory heaps.",
      "icon": Icons.format_list_numbered_rounded,
      "color": Color(0xFF14B8A6),
    },
    {
      "name": "Multi-Flavor Build Pipelines",
      "desc":
          "Natively partitioning single-codebase builds for User, Owner, Staff, and Delivery modes.",
      "icon": Icons.alt_route_rounded,
      "color": Color(0xFFA855F7),
    },
    {
      "name": "Stripe & PayPal SDKs",
      "desc":
          "Enforcing secure client-side token registration combined with backend ephemeral handshakes.",
      "icon": Icons.credit_card_rounded,
      "color": Color(0xFF0EA5E9),
    },
  ];

  static const List<Map<String, dynamic>> architecturalParadigms = [
    {
      "title": "Data Layer Caching System",
      "detail":
          "Repository pattern implementation handling local Hive box fallback caching instantly upon remote Firestore stream failure to guarantee 100% offline persistence.",
      "icon": Icons.dns_rounded,
    },
    {
      "title": "Domain Use-Case System",
      "detail":
          "Executing completely isolated, single-responsibility Use Cases containing pure business logic with zero Flutter/UI framework dependencies.",
      "icon": Icons.psychology_rounded,
    },
    {
      "title": "Thread-Safe Injection System",
      "detail":
          "Rigid implementation of service locators (GetIt) enforcing thread-safe runtime dependency lifecycles and lazy-loading Singletons.",
      "icon": Icons.hub_rounded,
    },
    {
      "title": "Reactive Token Refresh System",
      "detail":
          "Custom Dio Interceptors executing synchronized OAuth2 token refresh queues safely preventing concurrency request crashes.",
      "icon": Icons.security_rounded,
    },
  ];

  static const List<Map<String, dynamic>> deploymentPipelines = [
    {
      "title": "Automated Flutter Flavors",
      "detail":
          "Targeting different bundle IDs, app icons, Firebase projects, and API base URLs dynamically from a single terminal script.",
      "icon": Icons.settings_system_daydream_rounded,
    },
    {
      "title": "Multi-Role UI Injection System",
      "detail":
          "Dynamic core presentation layout switching based on authenticated user role states (User, Owner, Staff, Delivery).",
      "icon": Icons.supervised_user_circle_rounded,
    },
  ];

  static const List<Map<String, dynamic>> projects = [
    {
      "name": "snap_shot",
      "subtitle": "Enterprise Multi-Flavor System",
      "desc":
          "A production-grade mobile ecosystem built with a hyper-strict separation of concerns and multi-tenant environment configurations.",
      "metrics": {"Speed": "99%", "Sync": "Realtime", "Architecture": "Clean"},
      "github": "https://github.com/seiftarek10/snap_shot_e-commerce",
      "demo":
          "https://drive.google.com/drive/folders/1QAIacheLYH6CC-hBk6E9JoECYSiUEjpA?usp=sharing",
      "features": [
        {
          "text":
              "Engineered native Quad-Flavor configurations to seamlessly isolate User, Owner environments.",
          "icon": Icons.alt_route_rounded,
        },
        {
          "text":
              "Integrated secure server-backed Stripe payment gateways handling active Ephemeral keys.",
          "icon": Icons.credit_card_rounded,
        },
        {
          "text":
              "Engineered optimized local data persistence synced with Cursor-Based Firestore Pagination.",
          "icon": Icons.storage_rounded,
        },
      ],
      "tags": [
        "Product Flavors",
        "Stripe API",
        "Cursor Pagination",
        "Hive Sync",
      ],
      "images": {
        "User": [
          "assets/images/snap_shot/snapshot1.png",
          "assets/images/snap_shot/snapshot2.png",
          "assets/images/snap_shot/snapshot3.png",
          "assets/images/snap_shot/snapshot4.png",
          "assets/images/snap_shot/snapshot5.png",
          "assets/images/snap_shot/snapshot6.png",
          "assets/images/snap_shot/snapshot7.png",
          "assets/images/snap_shot/snapshot8.png",
          "assets/images/snap_shot/snapshot9.png",
        ],
        "Owner": [
          "assets/images/snap_shot/snap_owner1.png",
          "assets/images/snap_shot/snap_owner2.png",
          "assets/images/snap_shot/snap_owner3.png",
          "assets/images/snap_shot/snap_owner4.png",
        ],
      },
    },
    {
      "name": "DermaByte",
      "subtitle": "AI-Powered Telehealth Platform",
      "desc":
          "An advanced smart medical system bridging patients, expert doctors, and external testing labs in real-time.",
      "metrics": {
        "AI Latency": "<200ms",
        "Uptime": "99.9%",
        "State": "Reactive",
      },
      "github": "https://github.com/seiftarek10/DermaByte",
      "demo": "https://www.youtube.com/watch?v=h4vKXcJtQYc",
      "features": [
        {
          "text":
              "Built a specialized AI Skin Scan pipeline using Dio Multipart FormData with reactive media compression.",
          "icon": Icons.psychology_rounded,
        },
        {
          "text":
              "Managed complex lifecycle states of live medical inquiries utilizing highly responsive Cubits.",
          "icon": Icons.analytics_rounded,
        },
        {
          "text":
              "Integrated seamless, low-latency virtual consultations directly inside the app using Zoom SDK.",
          "icon": Icons.video_call_rounded,
        },
      ],
      "tags": ["AI Pipeline", "REST APIs", "Zoom SDK", "Cubit Flow"],
      "images": {
        "Patient": [
          "assets/images/derma_byte/patient/patient1.png",
          "assets/images/derma_byte/patient/patient2.png",
          "assets/images/derma_byte/patient/patient3.png",
          "assets/images/derma_byte/patient/patient4.png",
          "assets/images/derma_byte/patient/patient5.png",
          "assets/images/derma_byte/patient/patient6.png",
          "assets/images/derma_byte/patient/patient7.png",
          "assets/images/derma_byte/patient/patient8.png",
          "assets/images/derma_byte/patient/patient9.png",
          "assets/images/derma_byte/patient/patient10.png",
          "assets/images/derma_byte/patient/patient11.png",
          "assets/images/derma_byte/patient/patient12.png",
          "assets/images/derma_byte/patient/patient13.png",
          "assets/images/derma_byte/patient/patient14.png",
          "assets/images/derma_byte/patient/patient15.png",
        ],
        "Doctor": [
          "assets/images/derma_byte/doctor/doctor1.png",
          "assets/images/derma_byte/doctor/doctor2.png",
          "assets/images/derma_byte/doctor/doctor3.png",
          "assets/images/derma_byte/doctor/doctor4.png",
          "assets/images/derma_byte/doctor/doctor5.png",
          "assets/images/derma_byte/doctor/doctor6.png",
          "assets/images/derma_byte/doctor/doctor7.png",
          "assets/images/derma_byte/doctor/doctor8.png",
          "assets/images/derma_byte/doctor/doctor9.png",
          "assets/images/derma_byte/doctor/doctor10.png",
          "assets/images/derma_byte/doctor/doctor11.png",
          "assets/images/derma_byte/doctor/doctor12.png",
        ],
        "Lab": [
          "assets/images/derma_byte/lab/lab1.png",
          "assets/images/derma_byte/lab/lab2.png",
          "assets/images/derma_byte/lab/lab3.png",
          "assets/images/derma_byte/lab/lab4.png",
          "assets/images/derma_byte/lab/lab5.png",
          "assets/images/derma_byte/lab/lab6.png",
          "assets/images/derma_byte/lab/lab7.png",
        ],
      },
    },
    {
      "name": "Coffee Oasis",
      "subtitle": "Realtime Reactive Commerce Engine",
      "desc":
          "A hyper-fast local commerce engine powering instant cart updates and synchronized live order flows.",
      "metrics": {"Cart Lag": "0ms", "DB Read": "Binary", "UX": "Adaptive"},
      "github": "https://github.com/seiftarek10/CoffeeOasis",
      "demo":
          "https://drive.google.com/drive/folders/1_Mx0Dl6ByG6vOxEgssz7Or9SZFmssE6m?usp=drive_link",
      "features": [
        {
          "text":
              "Designed a lightning-fast Dynamic Local Cart operating entirely in-memory using highly-indexed Hive Boxes.",
          "icon": Icons.shopping_cart_rounded,
        },
        {
          "text":
              "Synchronized menu catalogs and kitchen preparation states instantly via Firestore Document Streams.",
          "icon": Icons.cloud_done_rounded,
        },
        {
          "text":
              "Crafted an adaptive layout adapting perfectly to cross-platform Delivery and In-Store Pickup schemes.",
          "icon": Icons.phonelink_rounded,
        },
      ],
      "tags": [
        "Firestore Streams",
        "Hive Caching",
        "Reactive UI",
        "Web/Mobile",
      ],
      "images": {
        "User": [
          "assets/images/coffee_oassis/user/coffee_user1.png",
          "assets/images/coffee_oassis/user/coffee_user2.png",
          "assets/images/coffee_oassis/user/coffee_user3.png",
          "assets/images/coffee_oassis/user/coffee_user4.png",
          "assets/images/coffee_oassis/user/coffee_user5.png",
          "assets/images/coffee_oassis/user/coffee_user6.png",
          "assets/images/coffee_oassis/user/coffee_user7.png",
        ],
        "Staff": [
          "assets/images/coffee_oassis/staff/coffee_staff1.png",
          "assets/images/coffee_oassis/staff/coffee_staff2.png",
          "assets/images/coffee_oassis/staff/coffee_staff3.png",
          "assets/images/coffee_oassis/staff/coffee_staff4.png",
        ],
        "Owner": [
          "assets/images/coffee_oassis/owner/coffee_owner1.png",
          "assets/images/coffee_oassis/owner/coffee_owner2.png",
          "assets/images/coffee_oassis/owner/coffee_owner3.png",
          "assets/images/coffee_oassis/owner/coffee_owner4.png",
          "assets/images/coffee_oassis/owner/coffee_owner5.png",
        ],
      },
    },
  ];

  static const List<Map<String, String>> contactLinks = [
    {
      "label": "Email",
      "value": "seift470@gmail.com",
      "url": "mailto:seift470@gmail.com",
    },
    {"label": "Phone", "value": "01515299902", "url": "tel:01515299902"},
    {
      "label": "Whatsapp",
      "value": "01027870171",
      "url": "https://wa.me/201027870171",
    },
    {
      "label": "LinkedIn",
      "value": "linkedin.com/in/seiftariq",
      "url": "https://www.linkedin.com/in/seif-tariq/",
    },
    {
      "label": "GitHub",
      "value": "github.com/seiftariq",
      "url": "https://github.com/seiftarek10",
    },
    {"label": "Location", "value": "Giza, Egypt", "url": ""},
  ];
}
