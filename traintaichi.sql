-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 24, 2021 at 11:49 AM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `traintaichi`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add lesson', 7, 'add_lesson'),
(26, 'Can change lesson', 7, 'change_lesson'),
(27, 'Can delete lesson', 7, 'delete_lesson'),
(28, 'Can view lesson', 7, 'view_lesson'),
(29, 'Can add score student', 8, 'add_scorestudent'),
(30, 'Can change score student', 8, 'change_scorestudent'),
(31, 'Can delete score student', 8, 'delete_scorestudent'),
(32, 'Can view score student', 8, 'view_scorestudent'),
(33, 'Can add student', 9, 'add_student'),
(34, 'Can change student', 9, 'change_student'),
(35, 'Can delete student', 9, 'delete_student'),
(36, 'Can view student', 9, 'view_student');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(2, 'pbkdf2_sha256$260000$CjiTfE9HC2FIT8iTD5dk02$m0uAL8kMilLqFOveONxU+Tzv0heajP6bXBmbLX4HWXk=', '2021-05-24 08:36:20.026319', 1, 'peetto', 'Nawin', 'Munnoi', 'peetto.41@gmail.com', 1, 1, '2021-05-17 10:23:26.765455'),
(3, 'pbkdf2_sha256$260000$1ChUoNvfvYeV4g3pdQsGov$uc7MqDEVBIapEsbU9qTYyYeP5c6RwMBTbSNSKdwMvaU=', '2021-05-24 08:41:11.796052', 0, 'gitti', 'กิตติ', 'ดีนิสสัย', 'na-winlove@hotmail.com', 1, 1, '2021-05-24 08:40:59.202298');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'taichi', 'lesson'),
(8, 'taichi', 'scorestudent'),
(9, 'taichi', 'student');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-05-17 10:20:28.337922'),
(2, 'auth', '0001_initial', '2021-05-17 10:20:34.253725'),
(3, 'admin', '0001_initial', '2021-05-17 10:20:35.829007'),
(4, 'admin', '0002_logentry_remove_auto_add', '2021-05-17 10:20:35.859350'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2021-05-17 10:20:35.893464'),
(6, 'contenttypes', '0002_remove_content_type_name', '2021-05-17 10:20:37.121633'),
(7, 'auth', '0002_alter_permission_name_max_length', '2021-05-17 10:20:37.878402'),
(8, 'auth', '0003_alter_user_email_max_length', '2021-05-17 10:20:38.871247'),
(9, 'auth', '0004_alter_user_username_opts', '2021-05-17 10:20:38.900170'),
(10, 'auth', '0005_alter_user_last_login_null', '2021-05-17 10:20:39.343777'),
(11, 'auth', '0006_require_contenttypes_0002', '2021-05-17 10:20:39.373256'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2021-05-17 10:20:39.412353'),
(13, 'auth', '0008_alter_user_username_max_length', '2021-05-17 10:20:40.028736'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2021-05-17 10:20:40.611846'),
(15, 'auth', '0010_alter_group_name_max_length', '2021-05-17 10:20:41.305694'),
(16, 'auth', '0011_update_proxy_permissions', '2021-05-17 10:20:41.355002'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2021-05-17 10:20:41.955748'),
(18, 'sessions', '0001_initial', '2021-05-17 10:20:42.356653'),
(19, 'taichi', '0001_initial', '2021-05-17 10:20:42.949641');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('132nxyddnn56w84rymm98rge5wiajh05', 'e30:1ll40N:J6lkUmt6TdC8CZi73gx3HpJnwqVpHrsePVDezvSJn1c', '2021-06-07 06:23:59.725396'),
('gc9k5p1fhr69dalkl2dpvh524zbawxwn', '.eJxVjjsOgzAQRO_iOrLW-IOdMj1nsNbedSCJQMJQRbl7jESRtPNmnuYtIu7bGPfKa5xIXEUnLr9Zwvzk-QD0wPm-yLzM2zoleVTkSascFuLX7ez-CUasY1tjUhAcmh4gk9OmV4Amaa-ZySgKNgcELqB80BmMLYA9NcSdxeI9N-lEsbYjDpRR9vMFO5E70Q:1lko67:ZzE1LE39NZdWWXesIcyPBZHsyPmAuNFR3IK5J2YZrfo', '2021-06-06 13:24:51.184292'),
('jkh60macc9cb3prviefomxlg7ox4e5lk', 'e30:1ll7B3:MOSB81bcrlqRtEoMwSy8ULUf210OfQKGWEHTRyoNmnM', '2021-06-07 09:47:13.275297');

-- --------------------------------------------------------

--
-- Table structure for table `taichi_lesson`
--

CREATE TABLE `taichi_lesson` (
  `pose_id` int(11) NOT NULL,
  `lesson_name` varchar(200) NOT NULL,
  `lesson_detail` longtext NOT NULL,
  `lesson_image` varchar(100) DEFAULT NULL,
  `videofile` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `taichi_lesson`
--

INSERT INTO `taichi_lesson` (`pose_id`, `lesson_name`, `lesson_detail`, `lesson_image`, `videofile`) VALUES
(1, 'เริ่มท่าปรับลมปราณ', 'ท่าเตรียม ยืนอย่างธรรมชาติ แยกเท้าออกให้เท่ากับหัวไหล่หรือมากกว่าเล็กน้อย ท่อนบนร่างกายยืดตรง ตามองไปข้างหน้า สองแขนปล่อยตามธรรมชาติ\r\n\r\nการเคลื่อนไหว \r\n๑ แขนทั้งสองยกขึ้นช้าๆ ฝ่ามือหันลงล่างแล้วยกให้สูงขึ้นมากกว่าไหล่เล็กน้อย พร้อมหายใจเข้า (ชิ)\r\n๒. ร่างกายท่อนบนยังคงตั้งตรง ย่อเข่าทั้งสองลง คลายสองผ่ามือหย่อนลงช้าๆ จนฝ่ามือแตะโคนขา พร้อมหายใจออก (ฮู) หายใจออกทางปาก\r\nทำจำนวน ๖ ครั้ง (หายใจเข้า-ออก นับเป็นหนึ่งครั้ง)\r\n\r\nประโยชน์ของท่าที่ ๑ ช่วยปรับสมดุลในร่างกาย ทำให้กระแสโลหิตหมุนเวียนทั่วร่างกาย ประสานกับการหายใจเข้าออกยาวๆช่วยให้จิตใจสงบ ขณะทำอย่าพูดคุยแต่ให้มุ่งไปกับท่าทางที่กำลังรำ\r\n', 'images/1330736527_TIKdDGb.jpg', 'videos/1-2_ONyr4lA.mp4'),
(2, 'ยืดอก', '๑. ยกแขนที่แตะอยู่ขึ้นไประดับอก\r\n๒. พลิกแขนทั้งสองให้ฝ่ามือทั้งสองหันเข้าหากัน\r\n', 'images/1330857448_TYcqDfg.jpg', 'videos/1-2_5GbjC23.mp4'),
(3, 'เฉิดฉายสายรุ้ง(รูป ๖,๗)', '๑. ค่อยๆยกแขนขึ้นระดับหน้าอก ขณะเดียวกันหัวเข่าก็ค่อยๆยืดตรงด้วย แขนทั้งสองยกขึ้นไปเรื่อยๆขณะที่ยังยกไม่พ้นศีรษะ กางแขนทั้งสองพร้อมทั้งหายใจเข้า(ชิ) แขนซ้ายยืดไปทางซ้ายให้เสมอระดับไหล่ ฝ่ามือหันขึ้นบน ส่วนแขนขวาให้อยู่ในลักษณะครึ่งวงกลม ฝ่ามือตรงกับกลางกระหม่อม\r\n๒. จุดศูนย์กลางย้ายมายังเท้าขวา ห้วเข่าย่อนิดๆฝ่าเท้านาบกับพื้นทั้งหมด เท้าซ้ายยืดตรง\r\n๓. เลื่อนจุดศูนย์กลางมาที่เท้าซ้าย ฝ่าเท้านาบกับพื้น เท้าขวายืดตรงแขนขวาจากบนศีรษะลดลงทางด้านซ้ายให้อยู่ระดับเสมอหัวไหล่ แขนซ้ายยกขึ้นผ่อนลงเหนือกระหม่อม ให้อยู่ในลักษณะครึ่งวงกลม พร้อมทั้งหายใจออก(ฮู)\r\nสิ่งควรจำ ระหว่างเคลื่อนไหวแขนทั้งสอง อิริยาบทและการหายใจให้ประสานกัน ให้ร่างกายผ่อนคลายนุ่มนวลสบาย\r\nประโยชน์ของท่านี้ เพิ่มความแข็งแรงในส่วนหลัง ส่วนเอว ลดอาการปวดหลัง ปวดเอวได้\r\n', 'images/1330738056.jpg', 'videos/3_BPBpGtB.mp4'),
(4, 'ตะวันเบิกฟ้า (รูป ๘,๙)', 'ติดต่อจากท่าที่ ๓ หายใจเข้า(ชิ)ทางซ้าย ต่อจากนั้น\r\n๑. ย้ายจุดศูนย์กลางมาไว้ที่ระหว่างสองขา ย่อหัวเข่าทั้งสองลง ฝ่ามือทั้งสองหันไปข้างหน้า และเคลื่อนไหวไปทางข้างหน้า\r\n๒. แยกเท้าย่อเข่าลง ฝ่ามือทั้งสองยื่นลงจนถึงหน้าหัวเข่า ฝ่ามือทั้งสองไขว้กัน ฝ่ามือซ้ายอยู่ข้างบน ฝ่ามือขวาอยู่ข้างล่าง\r\n๓. ฝ่ามือที่ไขว้กันยกขึ้นพร้อมกับหัวเข่าที่ยืดขึ้น ส่วนฝ่ามือที่ไขว้กันนั้นยกขึ้นไปเหนือศีรษะ ฝ่ามือหงายขึ้นด้านบน พร้อมหายใจเข้า(ชิ)\r\n๔. ฝ่ามือซึ่งไขว้อยู่เหนือศีรษะแยกจากกันและกางแขนออก ฝ่ามือคว่ำลงจนเสมอระดับไหล่\r\n๕. ฝ่ามือทั้งสองยื่นลงด้านล่าง เคลื่อนไหวพร้อมกับการย่อตัวลง และค่อยๆหายใจออก(ฮู)\r\nสิ่งควรจำ ขณะสองไหล่เคลื่อนไหว ให้เอาข้อต่อของสองไหล่เป็นจุดศูนย์กลางของวงกลม วาดแชนจากด้านในออกนอกวงให้เป็นวงกลมสองวง ขณะแขนทั้งสองยกขึ้นเหนือศีรษะ ยืดหน้าเพื่อช่วยในการหายใจเข้าให้หัวข้อเข่ายืดตรง ขณะหายใจออกให้งอหัวเข่า ทำติดต่อกัน ๖ ครั้ง\r\nประโชน์ของท่านี้ ให้ประโยชน์กับส่วนแขน ไหล่และอวัยวะส่วนท้องทำให้ขับถ่ายสะดวกและเพิ่มความแข็งแกร่งของขาทั้งสอง', 'images/1330738056_R6WNLNp.jpg', 'videos/4.mp4'),
(5, 'ยืนหยัดดัดแขน', 'ต่อเนื่องกับท่าที่ ๔ ขณะที่ฝ่ามือทั้งสองไขว้กันที่เหนือศีรษะให้แยกออกจากกัน แล้วลดลงอยู่ที่ระดับอก แล้วแยกเท้าย่อเข่าลง\r\n๑. ฝ่ามือขวาหงายขึ้น วาดผ่านข้างเอวขวา และชูขึ้นในลักษณะครึ่งวงกลม เอวบิดไปทางขวา ดวงตาเพงที่ฝ่ามือขวา พร้อมกับหายใจเข้า(ชิ)\r\n๒. แล้วยกแขนขวางอข้อศอก ฝ่ามือหันออกนอก\r\n๓. แขนขวายื่นไปข้างหน้าผ่านข้างใบหู พร้อมทั้งหายใจออก (ฮู)\r\n๔. โดยติดต่อกัน หดแขนซ้ายเข้าหน้าอก พอดีเฉียดกับริมฝ่ามือขวา\r\n๕. แขนซ้ายชูขึ้นด้านหลังลักษณะครึ่งวงกลม แล้วแขนขวาเคลื่อนไหวซ้ำอิริยาบท(๑) ให้แขนซ้า-ขวา สลับการเคลื่อนไหว\r\nสิ่งควรจำ แขนทั้งสองเฉียดกันในเขตหน้าอก ขณะหดแขนให้หายใจเข้า ขณะยื่นออกให้หายใจออก ทำ ๖ ครั้ง\r\nประโยชน์ของท่านี้ช่วยการทำงานของระบบประสาทและความสมดุลของร่างกาย ทำให้โลหิตไหลเวียนดี\r\n', 'images/1330738494.jpg', 'videos/5_hhuwPxu.mp4'),
(6, 'พายเรือกลางน้ำ (รูป ๑๒)', '๑. ขณะที่ยุติท่าที่ ๕ ให้เอาฝ่ามือทั้งสองซึ่งเฉียดกันตรงหน้าอกคว่ำลง\r\n๒. ให้ฝ่ามือทั้งสองลดลงช้าๆตรงข้างหัวเข่า ย่อเข่าให้อยู่ในลักษณะท่าปักหลักด้านลาง\r\n๓. ฝ่ามือทั้งสองหันออกด้านนอก\r\n๔. สองขาค่อยๆยืดขึ้น สองแขนวาดไปข้างหลังชูขึ้นเป็นครึ่งวงกลม ขณะเดียวกันยืดอก เงยหน้า และหายใจเข้า(ชิ)\r\n๕. ครั้นแขนทั้งสองยกขึ้นเหนือศีรษะ และก็เคลื่อนไหวลงข้างล่างพร้อมทั้งย่อเข่าลง และหายใจออก(ฮู)\r\nสิ่งควรจำ แขนพึงยืดให้ตรง ขณะย่อตัวลงให้หายใจออก ขณะลุกขึ้นยืนให้หายใจเข้า ทำ ๖ ครั้ง\r\nประโยชน์ของท่านี้ฝึกกำลังขา กำลังแขนและการทำงานของหัวใจ ประสาทสมองทำงานดีขึ้น อารมณ์สดชื่นแจ่มใส\r\n', 'images/1330738938.jpg', 'videos/6.mp4'),
(7, 'เมฆขลาล่อแก้ว (รูป ๑๓,๑๔)', '๑. ขณะที่แขนทั้งสองปล่อยลงล่างใกล้หัวเข่า ย่อหัวเข่าลงเล็กน้อย แต่ยังอยู่ในท่าปักหลักระดับสูง\r\n๒. แขนซ้ายอยู่เฉยๆ แขนขวาชูขึ้นไปทางด้านซ้ายโดยหงายฝ่ามือกระทั่งถึงระดับหัวไหล่ อิริยาบทของท่าชูลูกบอล จุดศูนย์กลางอยู่ที่เท้าซ้ายปลายเท้าขวายันกลับพื้น ขณะอยู่ในท่าชูลูกบอลให้หายใจเข้า(ชิ)\r\n๓. แขนขวากลับมาอยู่ที่ด้านล่างข้างขวา พร้อมทั้งหายใจออก(ฮู)\r\n๔. จุดศูนย์กลางย้ายมาที่เท้าขวา แขนซ้ายยกขึ้นจากด้านล่างข้งซ้ายยกขึ้นถึงด้านบนข้างขวา หายใจเข้าซ้ำ(ชิ) อิริยาบทชูลูกบอล\r\n๕. แขนซ้ายกลับมาอยู่ที่ด้านล่างข้างซ้าย พร้อมทั้งหายใจออก(ฮู)\r\nสิ่งควรจำ ขณะอยู่ในท่าชูลูกบอล ดวงตาให้เพ่งมองจุดชูลูกบอลพน้อมกันนั้น ปลายเท้ายันกับพื้น การชูลูกบอลปลายเท้ายันพื้นกับหายใจเข้า พึงให้กลมกลืนกัน ทำ ๖ ครั้ง\r\nประโยชน์ของทท่าที่ ๗ เป็นกายบริหารปลายเท้า ทำให้เท้าทั้งสองแข็งแรง ลดอาการปวดเมื่อยที่เข่า พร้อมฝึกปราสาทตาไปด้วย', 'images/1330857283.jpg', 'videos/7.mp4'),
(8, 'สาวน้อยชมจันทร์(รูป ๑๕)', '๑. มือทั้งสองวางบนหัวเข่าและย่อตัวลง(อยู่ในลักษณะปักหลักระดับต่ำ)\r\n๒. บิดเอว ฝ่ามือทั้งสองเคลื่อนมาทางซ้าย จุดศูนย์กลางย้ายมาที่ขาขวา ดวงตาทั้งสองมองมาทางด้านซ้าย ฝ่าเท้าทาบกับพื้น\r\n๓. การเคลื่อนไหวของร่างกายหันไปด้านซ้ายต่อไป ศีรษะหันไปด้านหลังทางซ้ายเสมือนชมจันทร์(พร้อมทั้งหายใจเข้า(ชิ)\r\n๔.วางมือทั้งสองลงอย่างนิ่มนวล วาดผ่านหน้าหัวเข่า บิดเอวย่อตัวลง หายใจออก(ฮู) ทำอิริยาบทซ้ำ มือวาดไปทางด้านขวา\r\nสิ่งควรจำ การวาดแขน บิดเอว หันหน้าแต่ละอิริยาบทให้กลมกลืนต่อเนื่องขณะที่ชมจันทร์ มือ เอว และศีรษะพึงหันไปเต็มที่ ส้นเท้าอย่ายกขึ้น ตอนย่อกายให้อยู่ในระดับปักหลักระดับต่ำ ทำติดต่อ ๖ ครั้ง\r\nประโยชน์ของท่าที่ ๘ เพิ่มความแข็งแรงของไต ลดอาการปวดเมื่อยส่วนหลังและเอว\r\n', 'images/1330857378.jpg', 'videos/8.mp4');

-- --------------------------------------------------------

--
-- Table structure for table `taichi_scorestudent`
--

CREATE TABLE `taichi_scorestudent` (
  `score_id` int(11) NOT NULL,
  `pose_id` varchar(200) DEFAULT NULL,
  `status_pose` varchar(200) NOT NULL,
  `score_taichi` int(11) DEFAULT NULL,
  `score_date` datetime(6) NOT NULL,
  `id_sd` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `taichi_scorestudent`
--

INSERT INTO `taichi_scorestudent` (`score_id`, `pose_id`, `status_pose`, `score_taichi`, `score_date`, `id_sd`) VALUES
(93, '11', 'Done', NULL, '2021-05-24 09:30:33.688043', 601415),
(94, '12', 'Done', NULL, '2021-05-24 09:31:53.683384', 601415),
(95, '13', 'Done', NULL, '2021-05-24 09:32:49.881504', 601415),
(96, '14', 'Done', NULL, '2021-05-24 09:34:04.944750', 601415),
(97, '15', 'Done', NULL, '2021-05-24 09:34:47.851695', 601415),
(98, '16', 'Done', NULL, '2021-05-24 09:35:37.240135', 601415),
(99, '17', 'Done', NULL, '2021-05-24 09:36:22.988637', 601415),
(100, '18', 'Done', NULL, '2021-05-24 09:37:06.711722', 601415),
(101, '19', 'Done', NULL, '2021-05-24 09:37:46.994021', 601415),
(103, '20', 'Done', NULL, '2021-05-24 09:38:52.165516', 601415),
(104, '21', 'Done', NULL, '2021-05-24 09:39:48.470970', 601415),
(105, '22', 'Done', NULL, '2021-05-24 09:40:35.608936', 601415),
(106, '23-24', 'Done', NULL, '2021-05-24 09:41:14.850508', 601415);

-- --------------------------------------------------------

--
-- Table structure for table `taichi_student`
--

CREATE TABLE `taichi_student` (
  `id_sd` int(11) NOT NULL,
  `student_name` varchar(200) NOT NULL,
  `student_lastname` varchar(200) NOT NULL,
  `year_student` int(11) NOT NULL,
  `branch_student` varchar(200) NOT NULL,
  `faculty_student` varchar(200) NOT NULL,
  `email_student` varchar(500) NOT NULL,
  `pass_student` varchar(500) NOT NULL,
  `group_student` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `taichi_student`
--

INSERT INTO `taichi_student` (`id_sd`, `student_name`, `student_lastname`, `year_student`, `branch_student`, `faculty_student`, `email_student`, `pass_student`, `group_student`) VALUES
(600000, 'Kaigai', 'Advisory', 2562, 'cs', 'cs', 'kaigaiadvisory.JJ2020@gmail.com', '$2b$12$NJDwLy3PLDarlpA6OaRLzuSq9ScEkvBdV4RQVexxLWzGb53WFSlZi', 3),
(600148, 'กัญนา', 'เสมสรี', 2560, 'วิทยาการคอมพิวเตอร์', 'วิทยาศาสตร์', 'kkk.41@hcu.com', '$2b$12$DmCMJ46AQk.TQClTYiw6Cuv6e8GS35uAHptQdgUTXQJRRFEoMFxpe', 1),
(601111, 'nakazawa', 'kyo', 2562, 'cs', 'cs', 'nakazakyo.41@gmail.com', '$2b$12$kdXIwA1yvVBwrCTl2NxeJ..6m59Z3WjiHamgB7ENMByImEoVp1Jiq', 2),
(601145, 'นาวิน', 'มั่นน้อย', 2562, 'cs', 'cs', 'pp@gmail.com', '$2b$12$r1rMz.MNqCJaJw4DChRkYOJi87OUKKj9DV5Z9Zw30x9DPgJmUb00G', 2),
(601155, 'สหสวรรต', 'รังรงทอง', 2562, 'cs', 'cs', 'paperpeet.2541@hotmail.com', '$2b$12$b2lRpt.u8D.33strBVUhpONOJySz5/VMUsjTJw.LPuo4azVi3usra', 3),
(601415, 'นาวิน', 'มั่นน้อย', 2560, 'cs', 'cs', 'peetto.41@gmail.com', '$2b$12$zraIy8LNGfYA7KmXjATHBeqPf34FC2frI2VD5fNKS3L.nt0nQVGy6', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `taichi_lesson`
--
ALTER TABLE `taichi_lesson`
  ADD PRIMARY KEY (`pose_id`);

--
-- Indexes for table `taichi_scorestudent`
--
ALTER TABLE `taichi_scorestudent`
  ADD PRIMARY KEY (`score_id`);

--
-- Indexes for table `taichi_student`
--
ALTER TABLE `taichi_student`
  ADD PRIMARY KEY (`id_sd`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `taichi_scorestudent`
--
ALTER TABLE `taichi_scorestudent`
  MODIFY `score_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
