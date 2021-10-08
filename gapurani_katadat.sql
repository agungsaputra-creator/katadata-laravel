-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 08 Okt 2021 pada 10.24
-- Versi server: 10.3.31-MariaDB-log-cll-lve
-- Versi PHP: 7.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gapurani_katadat`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2021_10_03_123642_create_speakers_table', 2),
(6, '2021_10_03_132309_create_schedules_table', 3),
(7, '2021_10_03_141036_create_schedule_details_table', 4),
(8, '2021_10_03_143457_create_speaker_schedules_table', 5),
(9, '2021_10_03_234420_tambahspeakerid', 6);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `schedules`
--

CREATE TABLE `schedules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_day` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `schedules`
--

INSERT INTO `schedules` (`id`, `name_day`, `tanggal`, `created_at`, `updated_at`) VALUES
(5, 'Day 1', '2021-10-21', '2021-10-05 07:41:25', '2021-10-05 07:53:57'),
(6, 'Day 2', '2021-10-22', '2021-10-05 07:41:45', '2021-10-05 07:54:07'),
(7, 'Day 3', '2021-10-25', '2021-10-05 07:42:06', '2021-10-05 07:54:15');

-- --------------------------------------------------------

--
-- Struktur dari tabel `schedule_details`
--

CREATE TABLE `schedule_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `speaker_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `schedule_id` int(11) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_youtube` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_facebook` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `schedule_details`
--

INSERT INTO `schedule_details` (`id`, `speaker_id`, `schedule_id`, `start_time`, `end_time`, `title`, `link_youtube`, `link_facebook`, `type`, `created_at`, `updated_at`) VALUES
(6, '[\"5\",\"25\"]', 5, '08:30:00', '09:00:00', 'A Climate Superpower Indonesia', 'http://youtube.com/', 'https://www.facebook.com/', 'keynote_speech', '2021-10-05 07:43:00', '2021-10-06 18:42:24'),
(12, '[\"41\",\"42\"]', 6, '08:30:00', '09:30:00', 'The Road to Net - Zero', NULL, NULL, 'Speakers', '2021-10-05 19:38:21', '2021-10-05 19:38:21'),
(13, '[\"43\",\"364\"]', 6, '09:45:00', '11:00:00', 'The Rise of Indonesia Green Consumer', NULL, NULL, 'Speakers', '2021-10-05 19:39:40', '2021-10-06 04:57:19'),
(14, '[\"31\",\"45\",\"366\"]', 6, '13:30:00', '15:00:00', 'Indonesia as a Green Investment Destination', NULL, NULL, 'Speakers', '2021-10-05 19:42:01', '2021-10-06 05:00:20'),
(15, '[\"28\",\"29\",\"30\"]', 6, '15:30:00', '17:00:00', 'Road to Net Zero: Energy, Forest, and Ocean', NULL, NULL, 'Speakers', '2021-10-05 19:43:22', '2021-10-05 19:43:22'),
(16, '[\"46\",\"47\"]', 7, '08:30:00', '10:00:00', 'Peatland Conservation Through Sustainable Fisheries', NULL, NULL, 'Speakers', '2021-10-05 19:44:51', '2021-10-05 19:44:51'),
(17, '[\"32\",\"34\",\"49\",\"367\"]', 7, '13:00:00', '14:30:00', 'Sustainable Commodity Development in Papua', NULL, NULL, 'speaker', '2021-10-05 19:48:32', '2021-10-06 07:48:21'),
(18, '[\"39\",\"40\",\"51\",\"363\"]', 7, '15:00:00', '16:30:00', 'Sustainable Oil Palm Plantation for Independent Smallholders', NULL, NULL, 'Speakers', '2021-10-05 19:50:05', '2021-10-06 05:03:26'),
(23, '[\"358\",\"70\"]', 7, '19:00:00', '18:00:00', 'tes', NULL, NULL, 'speaker', '2021-10-06 20:03:53', '2021-10-06 20:11:35'),
(25, '[\"100\",\"105\",\"40\",\"45\"]', 5, '09:30:00', '10:30:00', 'A Climate Superpower Indonesia -  Collaborative to Tackle Climate Crisis', NULL, NULL, 'speaker', '2021-10-06 20:12:21', '2021-10-06 20:12:21');

-- --------------------------------------------------------

--
-- Struktur dari tabel `speakers`
--

CREATE TABLE `speakers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jabatan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `speakers`
--

INSERT INTO `speakers` (`id`, `name`, `jabatan`, `photo`, `created_at`, `updated_at`) VALUES
(5, 'DR. John Murton', 'UK Government’s COP26 Envoy', '1633408106_ex-speaker2.png', '2021-10-04 21:28:26', '2021-10-04 21:28:26'),
(10, 'General (Ret.) Luhut B. Pandjaitan', 'Coordinating Ministry for Political, Legal, and Security Affairs', '1633408344_lbp.jpg', '2021-10-04 21:32:24', '2021-10-04 21:32:24'),
(15, 'Dr. Ir. Siti Nurbaya Bakar', 'Indonesia Minister of Environment and Forestry', '1633408415_ex-speaker.png', '2021-10-04 21:33:35', '2021-10-05 19:08:48'),
(20, 'Bahlil Lahadalia', 'Minister of Investment', '1633408456_bahlil.jpg', '2021-10-04 21:34:16', '2021-10-04 21:34:16'),
(25, 'Alue Dohong, Ph.D', 'Deputy Minister of Environment and Forestry', '1633408505_ex-speaker1.png', '2021-10-04 21:35:05', '2021-10-04 21:35:05'),
(30, 'Darmawan Prasodjo', 'Vice President Director, PT PLN', '1633408626_dermanan-p.jpg', '2021-10-04 21:37:06', '2021-10-04 21:37:06'),
(35, 'Felia Salim', 'Board of Directors, & Green Fund and Sail Ventures', '1633408696_felia-salim.jpg', '2021-10-04 21:38:16', '2021-10-04 21:38:16'),
(40, 'Dharsono Hartono', 'President Director of PT Rimba Makmur Utama', '1633408742_ex-speaker5.png', '2021-10-04 21:39:02', '2021-10-04 21:39:02'),
(45, 'Fabby Tumiwa', 'Executive Director IESR', '1633408815_ex-speaker6.png', '2021-10-04 21:40:15', '2021-10-04 21:40:15'),
(50, 'Pandu Patria Sjahrir', 'Commissioner, Indonesian Stock Exchange (IDX)', '1633408842_pandu.jpg', '2021-10-04 21:40:42', '2021-10-04 21:40:42'),
(55, 'Bustar Maitar', 'CEO, EcoNusa', '1633408888_bustar.jpg', '2021-10-04 21:41:28', '2021-10-04 21:41:28'),
(60, 'Verena Puspawardani', 'Program Director, Coaction Indonesia', '1633408911_verena.jpg', '2021-10-04 21:41:51', '2021-10-04 21:41:51'),
(65, 'Nadia Hadad', 'Executive Director, Yayasan Madani Berkelanjutan', '1633658876_Nadia-Hadad1.jpg', '2021-10-04 21:42:45', '2021-10-07 19:07:56'),
(70, 'Tiza Mafira', 'Associate Director, Climate Policy Initiative', '1633520704_Tiza_Mafira2.jpg', '2021-10-04 21:43:07', '2021-10-06 04:45:04'),
(75, 'Naomi Marasian', 'Executive Director, Pt PPMA', '1633520818_Naomi_Marasian_2_-_Executive_Director,_Pt_PPMA.jpg', '2021-10-04 21:43:33', '2021-10-06 04:46:58'),
(80, 'Riki Frindos', 'Executive Director, Indonesian Biodiversity Foundation (KEHATI)', '1633528017_Riki_Frindos_-_Executive_Director,_the_Indonesian_Biodiversity_Foundation_(KEHATI).png', '2021-10-04 21:44:30', '2021-10-06 06:46:57'),
(85, 'Dr. Djoko Hendratto', 'President Director, The Environmental Fund Management Agency (BPDLH)', '1633532537_male.jpg', '2021-10-06 08:02:17', '2021-10-06 08:02:17'),
(90, 'Dicky Asmoro', 'Director Agrapana Bio Indonesia', '1633532566_male.jpg', '2021-10-06 08:02:46', '2021-10-06 08:02:46'),
(95, 'Alam Surya Putra', 'Deputy Director of Environmental Government Unit, The Asia Foundation', '1633520924_Alam_surya.jpeg', '2021-10-04 21:45:35', '2021-10-06 04:48:44'),
(100, 'Hari Prabowo', 'Director for Development, Economic, and Environmental Affairs, Ministry of Foreign Affair', '1633409167_Hari_Prabowo.jpg', '2021-10-04 21:46:07', '2021-10-04 21:46:07'),
(105, 'Ir. Laksmi Dhewanthi, M.A.', 'Director General of Climate Change Control, Ministry of Environment and Forestry', '1633409215_ex-speaker4.png', '2021-10-04 21:46:55', '2021-10-04 21:46:55'),
(110, 'Ir. Erna Rosdiana', 'Director of Social Forestry Area Preparation, Ministry of Environment and Forestry', '1633409247_erna.jpg', '2021-10-04 21:47:27', '2021-10-04 21:47:27'),
(115, 'Ir. Nurhaida', 'Vice Chairman of The Board of Commissioners of The Financial Services Authority', '1633409307_nurhaida.jpg', '2021-10-04 21:48:27', '2021-10-04 21:48:27'),
(120, 'DR. Ir. Ali Jamil', '(Ad Interim) Director General of Plantations, Ministry of Agriculture', '1633658900_Ali-Jamil---(Ad-Interim)-Director-General-of-Plantations,-Ministry-of-Agriculture-22.jpg', '2021-10-04 21:49:01', '2021-10-07 19:08:20'),
(125, 'Tiur Rumondang', '(Ad Interim) Deputy Director, RSPO Indonesia', '1633409368_tiur.jpg', '2021-10-04 21:49:28', '2021-10-04 21:49:28'),
(130, 'Nuni Sutyoko', 'Head of Corporate Sustainability, PT Bank HSBC Indonesia', '1633520618_Nuni_Sutyoko_edit.jpg', '2021-10-04 21:50:05', '2021-10-06 04:43:38'),
(135, 'Karyanto Wibowo', 'Director Sustainable Development, Danone Indonesia', '1633409469_karyanto.jpg', '2021-10-04 21:51:09', '2021-10-04 21:51:09'),
(140, 'Prawitya Soemadijo', 'Head of Sustainability, Nestle Indonesia', '1633409499_prawitya.png', '2021-10-04 21:51:39', '2021-10-04 21:51:39'),
(145, 'Gita Syahrani', 'Head of Secretariat, LTKL', '1633409528_gita.jpg', '2021-10-04 21:52:08', '2021-10-04 21:52:08'),
(150, 'Benedicta Atika', 'Impact Investment Lead, ANGIN', '1633612360_1633409566_benedicta1.jpg', '2021-10-04 21:52:46', '2021-10-07 06:12:40'),
(155, 'Lola Abas', 'Media Research and Campaign Lead for the peatland restoration project, WRI Indonesia', '1633409633_lola.jpg', '2021-10-04 21:53:53', '2021-10-04 21:53:53'),
(160, 'Drs. H. Alfedri', 'Regent of Siak', '1633610849_1633409663_alfedri.jpg', '2021-10-04 21:54:23', '2021-10-07 05:47:29'),
(165, 'Drs. H. Sutedjo', 'Regent of Kulon Progo', '1633409692_sutejo.jpg', '2021-10-04 21:54:52', '2021-10-06 04:26:42'),
(170, 'Mathius Awoitauw', 'Regent of Jayapura', '1633658922_Mathius-Awoitauw---jayapura1.jpg', '2021-10-04 21:55:14', '2021-10-07 19:08:42'),
(175, 'Yanuar Nugroho', 'Advisor, CIPG', '1633409781_yanuar.jpg', '2021-10-04 21:56:21', '2021-10-04 21:56:21'),
(180, 'Eddy Abdurrahman', 'Head, Palm Oil Plantation Fund Management (BPKS)', '1633409803_eddy.jpg', '2021-10-04 21:56:43', '2021-10-04 21:56:43'),
(185, 'Rama Manusama', 'Founding Partner of Landscape Incubation and Investment Facility for the Environment', '1633409828_rama.jpg', '2021-10-04 21:57:08', '2021-10-04 21:57:08'),
(190, 'Mus Rahmmat', 'Director, PT Alam Siak Lestari', '1633531224_male.jpg', '2021-10-06 07:40:24', '2021-10-06 07:40:24'),
(195, 'Dr. Ir. Dwisuryo Indroyono Soesilo', 'Chairman, Association of Indonesia Forest Concession Holder (APHI)', '1633521039_Indroyono_Soesilo_-_Chairman,_Association_of_Indonesia_Forest_Concession_Holder_(APHI).jpg', '2021-10-06 04:50:39', '2021-10-06 04:50:39'),
(200, 'Gladi Hardiyanto', 'Project Manager, Project Manager Community Based Forest Management KEMITRAAN', '1633519878_Foto_Gladi_Hardiyanto.jpg', '2021-10-06 04:31:18', '2021-10-06 04:31:18'),
(205, 'Rukaiyah Rafik', 'Principal, Sekolah Petani FORTASBI', '1633520066_Rukaiyah_Rafik_-_Principal,_Sekolah_Petani_FORSTABI.png', '2021-10-06 04:34:26', '2021-10-06 04:34:26'),
(210, 'Parjan', 'Head, Kelompok Tani Hutan Kemasyarakatan (HKm) Mandiri Kulonprogo', '1633612077_Parjan-HKm-Mandiri-Kulonprogo1.jpg', '2021-10-06 04:32:32', '2021-10-07 06:07:57'),
(215, 'Oscar Giay', 'Head, Kampung Imsar, Jayapura District', '1633531191_male.jpg', '2021-10-06 07:39:51', '2021-10-06 07:39:51'),
(220, 'Poppy Ismalina, Ph.D.', 'Associate Professor in Economics, UGM', '1633612063_Poppy-Ismalia,-Ph.D1.jpg', '2021-10-06 04:59:32', '2021-10-07 06:07:43'),
(225, 'Dr. Mulya Amri', 'Expert Panel, Katadata Insight Center (KIC)', '1633608195_Dr._Mulya_Amri__Expert_Panel_Katadata_Insight_Center__KIC.jpg', '2021-10-06 04:35:06', '2021-10-07 05:03:15'),
(353, 'Francois de Maricourt', 'President Director, PT Bank HSBC Indonesia', '1633518805_Francois_de_Maricourt_-_President_Director_HSBC_Indonesia.jpg', '2021-10-06 04:13:25', '2021-10-06 04:13:25'),
(355, 'Dr. M. Chatib Basri', 'Minister of Finance 2013 - 2014', '1633519057_Dr._M._Chatib_Basri.png', '2021-10-06 04:17:37', '2021-10-06 04:17:37'),
(356, 'Febrian Alphyanto Ruddyard', 'Director General of Multilateral Cooperation, Ministry of Foreign Affair', '1633519138_Febrian_Alphyanto_Ruddyard_-_Director_General_of_Multilateral_Cooperation,_Ministry_of_Foreign_Affair.jpg', '2021-10-06 04:18:58', '2021-10-06 04:18:58'),
(357, 'Fitrian Ardiansyah', 'Executive Chairman & CEO, Yayasan Inisiatif Dagang Hijau', '1633519450_Fitrian_Ardiansyah_-_Executive_Director,_Yayasan_Inisiatif_Dagang_Hijau.jpg', '2021-10-06 04:24:10', '2021-10-06 04:24:10'),
(358, 'Irvan Helmi', 'Co Founder of Anomali Coffee & Pipiltin Cocoa', '1633519526_Irvan_Helmi.jpg', '2021-10-06 04:25:26', '2021-10-06 04:25:26'),
(359, 'Drs. Edi Budoyo', 'Regent of Manokwari, Papua', '1633519693_Edi_Budoyo_-_Regent_of_Manokwari,_Papua.jpg', '2021-10-06 04:28:13', '2021-10-06 04:28:13'),
(362, 'Prof. Dr. Ir. Hariadi Kartodihardjo', 'Professor of Forest Policy, Bogor Agricultural University', '1633520014_Hariadi_Kartodihardjo.jpeg', '2021-10-06 04:33:34', '2021-10-06 04:33:34');

-- --------------------------------------------------------

--
-- Struktur dari tabel `speaker_schedules`
--

CREATE TABLE `speaker_schedules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `schedule_id` int(11) NOT NULL,
  `speaker_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'superadmin', 'superadmin@gmail.com', NULL, '$2y$10$M3N4aTQ4BliPubyGu7kN4etF92wij5KzH8iaewIJye3mfYfoCPBPa', 'PIQAQQy6yx2JK3r7GjuDM3mDnzbRDHg8eWQVDFMgPS3qhI0CO7gEe6J8ojTw', '2021-10-03 03:03:45', '2021-10-03 03:03:45');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `schedule_details`
--
ALTER TABLE `schedule_details`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `speakers`
--
ALTER TABLE `speakers`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `speaker_schedules`
--
ALTER TABLE `speaker_schedules`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `schedule_details`
--
ALTER TABLE `schedule_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT untuk tabel `speakers`
--
ALTER TABLE `speakers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=552;

--
-- AUTO_INCREMENT untuk tabel `speaker_schedules`
--
ALTER TABLE `speaker_schedules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
