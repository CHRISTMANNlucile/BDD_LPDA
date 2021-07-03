-- phpMyAdmin SQL Dump
-- version OVH
-- https://www.phpmyadmin.net/
--
-- Hôte : brasserlucile.mysql.db
-- Généré le : sam. 03 juil. 2021 à 16:29
-- Version du serveur :  5.6.50-log
-- Version de PHP : 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `brasserlucile`
--

-- --------------------------------------------------------

--
-- Structure de la table `l82_actionscheduler_actions`
--

CREATE TABLE `l82_actionscheduler_actions` (
  `action_id` bigint(20) UNSIGNED NOT NULL,
  `hook` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `scheduled_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scheduled_date_local` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `args` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `schedule` longtext COLLATE utf8mb4_unicode_520_ci,
  `group_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `attempts` int(11) NOT NULL DEFAULT '0',
  `last_attempt_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_attempt_local` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `claim_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `extended_args` varchar(8000) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_actionscheduler_claims`
--

CREATE TABLE `l82_actionscheduler_claims` (
  `claim_id` bigint(20) UNSIGNED NOT NULL,
  `date_created_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_actionscheduler_groups`
--

CREATE TABLE `l82_actionscheduler_groups` (
  `group_id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_actionscheduler_logs`
--

CREATE TABLE `l82_actionscheduler_logs` (
  `log_id` bigint(20) UNSIGNED NOT NULL,
  `action_id` bigint(20) UNSIGNED NOT NULL,
  `message` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `log_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `log_date_local` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_ce4wp_abandoned_checkout`
--

CREATE TABLE `l82_ce4wp_abandoned_checkout` (
  `checkout_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `user_email` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `checkout_contents` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `checkout_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `checkout_updated_ts` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `checkout_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `checkout_created_ts` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `checkout_recovered` datetime DEFAULT '0000-00-00 00:00:00',
  `checkout_recovered_ts` int(10) UNSIGNED DEFAULT '0',
  `checkout_consent` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `checkout_uuid` varchar(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_cli_cookie_scan`
--

CREATE TABLE `l82_cli_cookie_scan` (
  `id_cli_cookie_scan` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `total_url` int(11) NOT NULL DEFAULT '0',
  `total_cookies` int(11) NOT NULL DEFAULT '0',
  `current_action` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `current_offset` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_cli_cookie_scan_categories`
--

CREATE TABLE `l82_cli_cookie_scan_categories` (
  `id_cli_cookie_category` int(11) NOT NULL,
  `cli_cookie_category_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cli_cookie_category_description` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_cli_cookie_scan_cookies`
--

CREATE TABLE `l82_cli_cookie_scan_cookies` (
  `id_cli_cookie_scan_cookies` int(11) NOT NULL,
  `id_cli_cookie_scan` int(11) NOT NULL DEFAULT '0',
  `id_cli_cookie_scan_url` int(11) NOT NULL DEFAULT '0',
  `cookie_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiry` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_cli_cookie_scan_url`
--

CREATE TABLE `l82_cli_cookie_scan_url` (
  `id_cli_cookie_scan_url` int(11) NOT NULL,
  `id_cli_cookie_scan` int(11) NOT NULL DEFAULT '0',
  `url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `scanned` int(11) NOT NULL DEFAULT '0',
  `total_cookies` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_cli_scripts`
--

CREATE TABLE `l82_cli_scripts` (
  `id` int(11) NOT NULL,
  `cliscript_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `cliscript_category` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cliscript_type` int(11) DEFAULT '0',
  `cliscript_status` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cliscript_description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `cliscript_key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_cmplz_cookiebanners`
--

CREATE TABLE `l82_cmplz_cookiebanners` (
  `ID` int(11) NOT NULL,
  `banner_version` int(11) NOT NULL,
  `default` int(11) NOT NULL,
  `archived` int(11) NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `checkbox_style` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoke` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `header` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `dismiss` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `save_preferences` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `view_preferences` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `accept_all` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_functional` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_all` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_stats` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_prefs` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `accept` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `message_optin` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `readmore_optin` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `use_categories` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tagmanager_categories` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `use_categories_optinstats` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hide_revoke` int(11) NOT NULL,
  `disable_cookiebanner` int(11) NOT NULL,
  `banner_width` int(11) NOT NULL,
  `soft_cookiewall` int(11) NOT NULL,
  `dismiss_on_scroll` int(11) NOT NULL,
  `dismiss_on_timeout` int(11) NOT NULL,
  `dismiss_timeout` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `accept_informational` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `message_optout` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `readmore_optout` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `readmore_optout_dnsmpi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `readmore_privacy` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `readmore_impressum` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `use_custom_cookie_css` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_css` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `statistics` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `colorpalette_background` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `colorpalette_text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `colorpalette_toggles` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `colorpalette_border_radius` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `border_width` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `colorpalette_button_accept` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `colorpalette_button_deny` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `colorpalette_button_settings` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `buttons_border_radius` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `animation` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `use_box_shadow` int(11) NOT NULL,
  `hide_preview` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_cmplz_cookies`
--

CREATE TABLE `l82_cmplz_cookies` (
  `ID` int(11) NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sync` int(11) NOT NULL,
  `ignored` int(11) NOT NULL,
  `retention` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `serviceID` int(11) NOT NULL,
  `cookieFunction` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `collectedPersonalData` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `purpose` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isTranslationFrom` int(11) NOT NULL,
  `isPersonalData` int(11) NOT NULL,
  `deleted` int(11) NOT NULL,
  `isMembersOnly` int(11) NOT NULL,
  `showOnPolicy` int(11) NOT NULL,
  `lastUpdatedDate` int(11) NOT NULL,
  `lastAddDate` int(11) NOT NULL,
  `firstAddDate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_cmplz_services`
--

CREATE TABLE `l82_cmplz_services` (
  `ID` int(11) NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `serviceType` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thirdParty` int(11) NOT NULL,
  `sharesData` int(11) NOT NULL,
  `secondParty` int(11) NOT NULL,
  `privacyStatementURL` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isTranslationFrom` int(11) NOT NULL,
  `sync` int(11) NOT NULL,
  `lastUpdatedDate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_commentmeta`
--

CREATE TABLE `l82_commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_comments`
--

CREATE TABLE `l82_comments` (
  `comment_ID` bigint(20) UNSIGNED NOT NULL,
  `comment_post_ID` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'comment',
  `comment_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_duplicator_packages`
--

CREATE TABLE `l82_duplicator_packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(250) NOT NULL,
  `hash` varchar(50) NOT NULL,
  `status` int(11) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `owner` varchar(60) NOT NULL,
  `package` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `l82_links`
--

CREATE TABLE `l82_links` (
  `link_id` bigint(20) UNSIGNED NOT NULL,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_mailchimp_carts`
--

CREATE TABLE `l82_mailchimp_carts` (
  `id` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `cart` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_mailchimp_jobs`
--

CREATE TABLE `l82_mailchimp_jobs` (
  `id` bigint(20) NOT NULL,
  `obj_id` text COLLATE utf8mb4_unicode_520_ci,
  `job` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_mclean_refs`
--

CREATE TABLE `l82_mclean_refs` (
  `id` bigint(20) NOT NULL,
  `mediaId` bigint(20) DEFAULT NULL,
  `mediaUrl` tinytext COLLATE utf8mb4_unicode_ci,
  `originType` tinytext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_mclean_scan`
--

CREATE TABLE `l82_mclean_scan` (
  `id` bigint(20) NOT NULL,
  `time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `type` tinyint(1) NOT NULL,
  `postId` bigint(20) DEFAULT NULL,
  `path` tinytext COLLATE utf8mb4_unicode_ci,
  `size` int(9) DEFAULT NULL,
  `ignored` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `issue` tinytext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_mystickyelement_contact_lists`
--

CREATE TABLE `l82_mystickyelement_contact_lists` (
  `ID` int(11) NOT NULL,
  `contact_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_message` text COLLATE utf8mb4_unicode_ci,
  `contact_option` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_nextend2_image_storage`
--

CREATE TABLE `l82_nextend2_image_storage` (
  `id` int(11) NOT NULL,
  `hash` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `image` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_nextend2_section_storage`
--

CREATE TABLE `l82_nextend2_section_storage` (
  `id` int(11) NOT NULL,
  `application` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `section` varchar(128) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `referencekey` varchar(128) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `system` int(11) NOT NULL DEFAULT '0',
  `editable` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_nextend2_smartslider3_generators`
--

CREATE TABLE `l82_nextend2_smartslider3_generators` (
  `id` int(11) NOT NULL,
  `group` varchar(254) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `type` varchar(254) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `params` text COLLATE utf8mb4_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_nextend2_smartslider3_sliders`
--

CREATE TABLE `l82_nextend2_smartslider3_sliders` (
  `id` int(11) NOT NULL,
  `alias` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `type` varchar(30) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `params` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'published',
  `time` datetime NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_nextend2_smartslider3_sliders_xref`
--

CREATE TABLE `l82_nextend2_smartslider3_sliders_xref` (
  `group_id` int(11) NOT NULL,
  `slider_id` int(11) NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_nextend2_smartslider3_slides`
--

CREATE TABLE `l82_nextend2_smartslider3_slides` (
  `id` int(11) NOT NULL,
  `title` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `slider` int(11) NOT NULL,
  `publish_up` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `published` tinyint(1) NOT NULL,
  `first` int(11) NOT NULL,
  `slide` longtext COLLATE utf8mb4_unicode_520_ci,
  `description` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `params` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `ordering` int(11) NOT NULL,
  `generator_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_options`
--

CREATE TABLE `l82_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_postmeta`
--

CREATE TABLE `l82_postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_posts`
--

CREATE TABLE `l82_posts` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `post_author` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_pum_subscribers`
--

CREATE TABLE `l82_pum_subscribers` (
  `ID` bigint(20) NOT NULL,
  `email_hash` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `popup_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `consent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `consent_args` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_rank_math_404_logs`
--

CREATE TABLE `l82_rank_math_404_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uri` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `accessed` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `times_accessed` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `ip` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `referer` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_agent` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_rank_math_analytics_gsc`
--

CREATE TABLE `l82_rank_math_analytics_gsc` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created` timestamp NOT NULL,
  `query` varchar(1000) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `page` varchar(500) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `clicks` mediumint(6) NOT NULL,
  `impressions` mediumint(6) NOT NULL,
  `position` double NOT NULL,
  `ctr` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_rank_math_analytics_objects`
--

CREATE TABLE `l82_rank_math_analytics_objects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created` timestamp NOT NULL,
  `title` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `page` varchar(500) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `object_type` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `object_subtype` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `object_id` bigint(20) UNSIGNED NOT NULL,
  `primary_key` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `seo_score` tinyint(4) NOT NULL DEFAULT '0',
  `page_score` tinyint(4) NOT NULL DEFAULT '0',
  `is_indexable` tinyint(1) NOT NULL DEFAULT '1',
  `schemas_in_use` varchar(500) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `desktop_interactive` double DEFAULT '0',
  `desktop_pagescore` double DEFAULT '0',
  `mobile_interactive` double DEFAULT '0',
  `mobile_pagescore` double DEFAULT '0',
  `pagespeed_refreshed` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_rank_math_internal_links`
--

CREATE TABLE `l82_rank_math_internal_links` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `target_post_id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(8) COLLATE utf8mb4_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_rank_math_internal_meta`
--

CREATE TABLE `l82_rank_math_internal_meta` (
  `object_id` bigint(20) UNSIGNED NOT NULL,
  `internal_link_count` int(10) UNSIGNED DEFAULT '0',
  `external_link_count` int(10) UNSIGNED DEFAULT '0',
  `incoming_link_count` int(10) UNSIGNED DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_rank_math_redirections`
--

CREATE TABLE `l82_rank_math_redirections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sources` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `url_to` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `header_code` smallint(4) UNSIGNED NOT NULL,
  `hits` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `status` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'active',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_accessed` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_rank_math_redirections_cache`
--

CREATE TABLE `l82_rank_math_redirections_cache` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `from_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `redirection_id` bigint(20) UNSIGNED NOT NULL,
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `object_type` varchar(10) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'post',
  `is_redirected` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_rcb_asset_seo_redirect`
--

CREATE TABLE `l82_rcb_asset_seo_redirect` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `serve_hash` char(32) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_rcb_consent`
--

CREATE TABLE `l82_rcb_consent` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ipv4` int(10) UNSIGNED DEFAULT NULL,
  `ipv6` binary(16) DEFAULT NULL,
  `ipv4_hash` char(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `ipv6_hash` char(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `revision` char(32) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `revision_independent` char(32) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `previous_decision` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `decision_hash` char(32) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `decision` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `blocker` bigint(20) UNSIGNED DEFAULT NULL,
  `button_clicked` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `context` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `viewport_width` int(10) UNSIGNED NOT NULL,
  `viewport_height` int(10) UNSIGNED NOT NULL,
  `referer` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `url_imprint` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `url_privacy_policy` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `dnt` tinyint(1) UNSIGNED NOT NULL,
  `created` datetime NOT NULL,
  `forwarded` bigint(20) UNSIGNED DEFAULT NULL,
  `forwarded_blocker` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_rcb_presets`
--

CREATE TABLE `l82_rcb_presets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `identifier` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `context` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `version` int(11) NOT NULL,
  `description` tinytext COLLATE utf8mb4_unicode_520_ci,
  `logoFile` tinytext COLLATE utf8mb4_unicode_520_ci,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `tags` text COLLATE utf8mb4_unicode_520_ci,
  `attributes_name` varchar(200) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `disabled` tinyint(1) NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  `other_meta` text COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_rcb_revision`
--

CREATE TABLE `l82_rcb_revision` (
  `id` mediumint(9) UNSIGNED NOT NULL,
  `json_revision` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `hash` char(32) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_rcb_revision_independent`
--

CREATE TABLE `l82_rcb_revision_independent` (
  `id` mediumint(9) UNSIGNED NOT NULL,
  `json_revision` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `hash` char(32) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_rcb_stats`
--

CREATE TABLE `l82_rcb_stats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `context` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `day` date NOT NULL,
  `term_name` varchar(70) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL,
  `accepted` tinyint(1) NOT NULL,
  `count` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_termmeta`
--

CREATE TABLE `l82_termmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_terms`
--

CREATE TABLE `l82_terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `term_group` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_term_relationships`
--

CREATE TABLE `l82_term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_term_taxonomy`
--

CREATE TABLE `l82_term_taxonomy` (
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_usermeta`
--

CREATE TABLE `l82_usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_users`
--

CREATE TABLE `l82_users` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_wcpdf_invoice_number`
--

CREATE TABLE `l82_wcpdf_invoice_number` (
  `id` int(16) NOT NULL,
  `order_id` int(16) DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `calculated_number` int(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_wc_admin_notes`
--

CREATE TABLE `l82_wc_admin_notes` (
  `note_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `locale` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `title` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `content_data` longtext COLLATE utf8mb4_unicode_520_ci,
  `status` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `source` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_reminder` datetime DEFAULT NULL,
  `is_snoozable` tinyint(1) NOT NULL DEFAULT '0',
  `layout` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `image` varchar(200) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `icon` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'info'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_wc_admin_note_actions`
--

CREATE TABLE `l82_wc_admin_note_actions` (
  `action_id` bigint(20) UNSIGNED NOT NULL,
  `note_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `query` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `is_primary` tinyint(1) NOT NULL DEFAULT '0',
  `actioned_text` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `nonce_action` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `nonce_name` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_wc_category_lookup`
--

CREATE TABLE `l82_wc_category_lookup` (
  `category_tree_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_wc_customer_lookup`
--

CREATE TABLE `l82_wc_customer_lookup` (
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `username` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `first_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `date_last_active` timestamp NULL DEFAULT NULL,
  `date_registered` timestamp NULL DEFAULT NULL,
  `country` char(2) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `postcode` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `city` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `state` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_wc_download_log`
--

CREATE TABLE `l82_wc_download_log` (
  `download_log_id` bigint(20) UNSIGNED NOT NULL,
  `timestamp` datetime NOT NULL,
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_ip_address` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_wc_order_coupon_lookup`
--

CREATE TABLE `l82_wc_order_coupon_lookup` (
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `coupon_id` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `discount_amount` double NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_wc_order_product_lookup`
--

CREATE TABLE `l82_wc_order_product_lookup` (
  `order_item_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `variation_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `product_qty` int(11) NOT NULL,
  `product_net_revenue` double NOT NULL DEFAULT '0',
  `product_gross_revenue` double NOT NULL DEFAULT '0',
  `coupon_amount` double NOT NULL DEFAULT '0',
  `tax_amount` double NOT NULL DEFAULT '0',
  `shipping_amount` double NOT NULL DEFAULT '0',
  `shipping_tax_amount` double NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_wc_order_stats`
--

CREATE TABLE `l82_wc_order_stats` (
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_created_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `num_items_sold` int(11) NOT NULL DEFAULT '0',
  `total_sales` double NOT NULL DEFAULT '0',
  `tax_total` double NOT NULL DEFAULT '0',
  `shipping_total` double NOT NULL DEFAULT '0',
  `net_total` double NOT NULL DEFAULT '0',
  `returning_customer` tinyint(1) DEFAULT NULL,
  `status` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_wc_order_tax_lookup`
--

CREATE TABLE `l82_wc_order_tax_lookup` (
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `tax_rate_id` bigint(20) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `shipping_tax` double NOT NULL DEFAULT '0',
  `order_tax` double NOT NULL DEFAULT '0',
  `total_tax` double NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_wc_product_meta_lookup`
--

CREATE TABLE `l82_wc_product_meta_lookup` (
  `product_id` bigint(20) NOT NULL,
  `sku` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT '',
  `virtual` tinyint(1) DEFAULT '0',
  `downloadable` tinyint(1) DEFAULT '0',
  `min_price` decimal(19,4) DEFAULT NULL,
  `max_price` decimal(19,4) DEFAULT NULL,
  `onsale` tinyint(1) DEFAULT '0',
  `stock_quantity` double DEFAULT NULL,
  `stock_status` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT 'instock',
  `rating_count` bigint(20) DEFAULT '0',
  `average_rating` decimal(3,2) DEFAULT '0.00',
  `total_sales` bigint(20) DEFAULT '0',
  `tax_status` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT 'taxable',
  `tax_class` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_wc_reserved_stock`
--

CREATE TABLE `l82_wc_reserved_stock` (
  `order_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `stock_quantity` double NOT NULL DEFAULT '0',
  `timestamp` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `expires` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_wc_tax_rate_classes`
--

CREATE TABLE `l82_wc_tax_rate_classes` (
  `tax_rate_class_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_wc_webhooks`
--

CREATE TABLE `l82_wc_webhooks` (
  `webhook_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `delivery_url` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `secret` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `topic` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_created_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `api_version` smallint(4) NOT NULL,
  `failure_count` smallint(10) NOT NULL DEFAULT '0',
  `pending_delivery` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_woocommerce_api_keys`
--

CREATE TABLE `l82_woocommerce_api_keys` (
  `key_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(200) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `permissions` varchar(10) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `consumer_key` char(64) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `consumer_secret` char(43) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `nonces` longtext COLLATE utf8mb4_unicode_520_ci,
  `truncated_key` char(7) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `last_access` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_woocommerce_attribute_taxonomies`
--

CREATE TABLE `l82_woocommerce_attribute_taxonomies` (
  `attribute_id` bigint(20) UNSIGNED NOT NULL,
  `attribute_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `attribute_label` varchar(200) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `attribute_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `attribute_orderby` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `attribute_public` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_woocommerce_downloadable_product_permissions`
--

CREATE TABLE `l82_woocommerce_downloadable_product_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `download_id` varchar(36) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `order_key` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `user_email` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `downloads_remaining` varchar(9) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `access_granted` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access_expires` datetime DEFAULT NULL,
  `download_count` bigint(20) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_woocommerce_log`
--

CREATE TABLE `l82_woocommerce_log` (
  `log_id` bigint(20) UNSIGNED NOT NULL,
  `timestamp` datetime NOT NULL,
  `level` smallint(4) NOT NULL,
  `source` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `context` longtext COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_woocommerce_order_itemmeta`
--

CREATE TABLE `l82_woocommerce_order_itemmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `order_item_id` bigint(20) UNSIGNED NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_woocommerce_order_items`
--

CREATE TABLE `l82_woocommerce_order_items` (
  `order_item_id` bigint(20) UNSIGNED NOT NULL,
  `order_item_name` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `order_item_type` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `order_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_woocommerce_payment_tokenmeta`
--

CREATE TABLE `l82_woocommerce_payment_tokenmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `payment_token_id` bigint(20) UNSIGNED NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_woocommerce_payment_tokens`
--

CREATE TABLE `l82_woocommerce_payment_tokens` (
  `token_id` bigint(20) UNSIGNED NOT NULL,
  `gateway_id` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `token` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `type` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_woocommerce_sessions`
--

CREATE TABLE `l82_woocommerce_sessions` (
  `session_id` bigint(20) UNSIGNED NOT NULL,
  `session_key` char(32) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `session_value` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `session_expiry` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_woocommerce_shipping_zones`
--

CREATE TABLE `l82_woocommerce_shipping_zones` (
  `zone_id` bigint(20) UNSIGNED NOT NULL,
  `zone_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `zone_order` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_woocommerce_shipping_zone_locations`
--

CREATE TABLE `l82_woocommerce_shipping_zone_locations` (
  `location_id` bigint(20) UNSIGNED NOT NULL,
  `zone_id` bigint(20) UNSIGNED NOT NULL,
  `location_code` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `location_type` varchar(40) COLLATE utf8mb4_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_woocommerce_shipping_zone_methods`
--

CREATE TABLE `l82_woocommerce_shipping_zone_methods` (
  `zone_id` bigint(20) UNSIGNED NOT NULL,
  `instance_id` bigint(20) UNSIGNED NOT NULL,
  `method_id` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `method_order` bigint(20) UNSIGNED NOT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_woocommerce_tax_rates`
--

CREATE TABLE `l82_woocommerce_tax_rates` (
  `tax_rate_id` bigint(20) UNSIGNED NOT NULL,
  `tax_rate_country` varchar(2) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `tax_rate_state` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `tax_rate` varchar(8) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `tax_rate_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `tax_rate_priority` bigint(20) UNSIGNED NOT NULL,
  `tax_rate_compound` int(1) NOT NULL DEFAULT '0',
  `tax_rate_shipping` int(1) NOT NULL DEFAULT '1',
  `tax_rate_order` bigint(20) UNSIGNED NOT NULL,
  `tax_rate_class` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l82_woocommerce_tax_rate_locations`
--

CREATE TABLE `l82_woocommerce_tax_rate_locations` (
  `location_id` bigint(20) UNSIGNED NOT NULL,
  `location_code` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `tax_rate_id` bigint(20) UNSIGNED NOT NULL,
  `location_type` varchar(40) COLLATE utf8mb4_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `l82_actionscheduler_actions`
--
ALTER TABLE `l82_actionscheduler_actions`
  ADD PRIMARY KEY (`action_id`),
  ADD KEY `hook` (`hook`),
  ADD KEY `status` (`status`),
  ADD KEY `scheduled_date_gmt` (`scheduled_date_gmt`),
  ADD KEY `args` (`args`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `last_attempt_gmt` (`last_attempt_gmt`),
  ADD KEY `claim_id` (`claim_id`);

--
-- Index pour la table `l82_actionscheduler_claims`
--
ALTER TABLE `l82_actionscheduler_claims`
  ADD PRIMARY KEY (`claim_id`),
  ADD KEY `date_created_gmt` (`date_created_gmt`);

--
-- Index pour la table `l82_actionscheduler_groups`
--
ALTER TABLE `l82_actionscheduler_groups`
  ADD PRIMARY KEY (`group_id`),
  ADD KEY `slug` (`slug`(191));

--
-- Index pour la table `l82_actionscheduler_logs`
--
ALTER TABLE `l82_actionscheduler_logs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `action_id` (`action_id`),
  ADD KEY `log_date_gmt` (`log_date_gmt`);

--
-- Index pour la table `l82_ce4wp_abandoned_checkout`
--
ALTER TABLE `l82_ce4wp_abandoned_checkout`
  ADD PRIMARY KEY (`checkout_id`),
  ADD UNIQUE KEY `checkout_uuid` (`checkout_uuid`);

--
-- Index pour la table `l82_cli_cookie_scan`
--
ALTER TABLE `l82_cli_cookie_scan`
  ADD PRIMARY KEY (`id_cli_cookie_scan`);

--
-- Index pour la table `l82_cli_cookie_scan_categories`
--
ALTER TABLE `l82_cli_cookie_scan_categories`
  ADD PRIMARY KEY (`id_cli_cookie_category`),
  ADD UNIQUE KEY `cookie` (`cli_cookie_category_name`);

--
-- Index pour la table `l82_cli_cookie_scan_cookies`
--
ALTER TABLE `l82_cli_cookie_scan_cookies`
  ADD PRIMARY KEY (`id_cli_cookie_scan_cookies`),
  ADD UNIQUE KEY `id_cli_cookie_scan` (`id_cli_cookie_scan`,`cookie_id`(100)),
  ADD KEY `category_id` (`category_id`);

--
-- Index pour la table `l82_cli_cookie_scan_url`
--
ALTER TABLE `l82_cli_cookie_scan_url`
  ADD PRIMARY KEY (`id_cli_cookie_scan_url`);

--
-- Index pour la table `l82_cli_scripts`
--
ALTER TABLE `l82_cli_scripts`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `l82_cmplz_cookiebanners`
--
ALTER TABLE `l82_cmplz_cookiebanners`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `l82_cmplz_cookies`
--
ALTER TABLE `l82_cmplz_cookies`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `l82_cmplz_services`
--
ALTER TABLE `l82_cmplz_services`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `l82_commentmeta`
--
ALTER TABLE `l82_commentmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Index pour la table `l82_comments`
--
ALTER TABLE `l82_comments`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_post_ID` (`comment_post_ID`),
  ADD KEY `comment_approved` (`comment_approved`,`comment_date_gmt`),
  ADD KEY `comment_date_gmt` (`comment_date_gmt`),
  ADD KEY `comment_parent` (`comment_parent`),
  ADD KEY `comment_author_email` (`comment_author_email`),
  ADD KEY `comment_type` (`comment_type`),
  ADD KEY `woo_idx_comment_type` (`comment_type`);

--
-- Index pour la table `l82_duplicator_packages`
--
ALTER TABLE `l82_duplicator_packages`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `l82_links`
--
ALTER TABLE `l82_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_visible` (`link_visible`);

--
-- Index pour la table `l82_mailchimp_carts`
--
ALTER TABLE `l82_mailchimp_carts`
  ADD PRIMARY KEY (`email`);

--
-- Index pour la table `l82_mailchimp_jobs`
--
ALTER TABLE `l82_mailchimp_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `l82_mclean_refs`
--
ALTER TABLE `l82_mclean_refs`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `l82_mclean_scan`
--
ALTER TABLE `l82_mclean_scan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ignored` (`ignored`);

--
-- Index pour la table `l82_mystickyelement_contact_lists`
--
ALTER TABLE `l82_mystickyelement_contact_lists`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `l82_nextend2_image_storage`
--
ALTER TABLE `l82_nextend2_image_storage`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `hash` (`hash`);

--
-- Index pour la table `l82_nextend2_section_storage`
--
ALTER TABLE `l82_nextend2_section_storage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system` (`system`),
  ADD KEY `editable` (`editable`),
  ADD KEY `section` (`section`,`application`,`referencekey`),
  ADD KEY `application` (`application`,`section`(50),`referencekey`(50)),
  ADD KEY `application_2` (`application`,`section`(50));

--
-- Index pour la table `l82_nextend2_smartslider3_generators`
--
ALTER TABLE `l82_nextend2_smartslider3_generators`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `l82_nextend2_smartslider3_sliders`
--
ALTER TABLE `l82_nextend2_smartslider3_sliders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`),
  ADD KEY `time` (`time`);

--
-- Index pour la table `l82_nextend2_smartslider3_sliders_xref`
--
ALTER TABLE `l82_nextend2_smartslider3_sliders_xref`
  ADD PRIMARY KEY (`group_id`),
  ADD KEY `ordering` (`ordering`);

--
-- Index pour la table `l82_nextend2_smartslider3_slides`
--
ALTER TABLE `l82_nextend2_smartslider3_slides`
  ADD PRIMARY KEY (`id`),
  ADD KEY `published` (`published`),
  ADD KEY `publish_up` (`publish_up`),
  ADD KEY `publish_down` (`publish_down`),
  ADD KEY `generator_id` (`generator_id`),
  ADD KEY `ordering` (`ordering`),
  ADD KEY `slider` (`slider`),
  ADD KEY `slider_2` (`slider`),
  ADD KEY `thumbnail` (`thumbnail`(100));

--
-- Index pour la table `l82_options`
--
ALTER TABLE `l82_options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`),
  ADD KEY `autoload` (`autoload`);

--
-- Index pour la table `l82_postmeta`
--
ALTER TABLE `l82_postmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Index pour la table `l82_posts`
--
ALTER TABLE `l82_posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_name` (`post_name`(191)),
  ADD KEY `ID` (`ID`,`post_status`,`post_date`,`post_type`),
  ADD KEY `post_parent` (`post_parent`),
  ADD KEY `post_author` (`post_author`);

--
-- Index pour la table `l82_pum_subscribers`
--
ALTER TABLE `l82_pum_subscribers`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `email` (`email`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `popup_id` (`popup_id`),
  ADD KEY `email_hash` (`email_hash`);

--
-- Index pour la table `l82_rank_math_404_logs`
--
ALTER TABLE `l82_rank_math_404_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uri` (`uri`(191));

--
-- Index pour la table `l82_rank_math_analytics_gsc`
--
ALTER TABLE `l82_rank_math_analytics_gsc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `analytics_query` (`query`(190)),
  ADD KEY `analytics_page` (`page`(190)),
  ADD KEY `clicks` (`clicks`),
  ADD KEY `rank_position` (`position`);

--
-- Index pour la table `l82_rank_math_analytics_objects`
--
ALTER TABLE `l82_rank_math_analytics_objects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `analytics_object_page` (`page`(190));

--
-- Index pour la table `l82_rank_math_internal_links`
--
ALTER TABLE `l82_rank_math_internal_links`
  ADD PRIMARY KEY (`id`),
  ADD KEY `link_direction` (`post_id`,`type`);

--
-- Index pour la table `l82_rank_math_internal_meta`
--
ALTER TABLE `l82_rank_math_internal_meta`
  ADD PRIMARY KEY (`object_id`);

--
-- Index pour la table `l82_rank_math_redirections`
--
ALTER TABLE `l82_rank_math_redirections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`);

--
-- Index pour la table `l82_rank_math_redirections_cache`
--
ALTER TABLE `l82_rank_math_redirections_cache`
  ADD PRIMARY KEY (`id`),
  ADD KEY `redirection_id` (`redirection_id`);

--
-- Index pour la table `l82_rcb_asset_seo_redirect`
--
ALTER TABLE `l82_rcb_asset_seo_redirect`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `l82_rcb_consent`
--
ALTER TABLE `l82_rcb_consent`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `l82_rcb_presets`
--
ALTER TABLE `l82_rcb_presets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `type` (`type`,`identifier`(100),`context`);

--
-- Index pour la table `l82_rcb_revision`
--
ALTER TABLE `l82_rcb_revision`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `hash` (`hash`);

--
-- Index pour la table `l82_rcb_revision_independent`
--
ALTER TABLE `l82_rcb_revision_independent`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `hash` (`hash`);

--
-- Index pour la table `l82_rcb_stats`
--
ALTER TABLE `l82_rcb_stats`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `dayGroup` (`context`(100),`term_id`,`accepted`,`day`);

--
-- Index pour la table `l82_termmeta`
--
ALTER TABLE `l82_termmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `meta_key` (`meta_key`(191)),
  ADD KEY `term_id` (`term_id`);

--
-- Index pour la table `l82_terms`
--
ALTER TABLE `l82_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD KEY `slug` (`slug`(191)),
  ADD KEY `name` (`name`(191));

--
-- Index pour la table `l82_term_relationships`
--
ALTER TABLE `l82_term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- Index pour la table `l82_term_taxonomy`
--
ALTER TABLE `l82_term_taxonomy`
  ADD PRIMARY KEY (`term_taxonomy_id`),
  ADD UNIQUE KEY `term_id` (`term_id`),
  ADD KEY `taxonomy` (`taxonomy`);

--
-- Index pour la table `l82_usermeta`
--
ALTER TABLE `l82_usermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `meta_key` (`meta_key`(191)),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `l82_users`
--
ALTER TABLE `l82_users`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `user_login` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`),
  ADD KEY `user_email` (`user_email`);

--
-- Index pour la table `l82_wcpdf_invoice_number`
--
ALTER TABLE `l82_wcpdf_invoice_number`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `l82_wc_admin_notes`
--
ALTER TABLE `l82_wc_admin_notes`
  ADD PRIMARY KEY (`note_id`);

--
-- Index pour la table `l82_wc_admin_note_actions`
--
ALTER TABLE `l82_wc_admin_note_actions`
  ADD PRIMARY KEY (`action_id`),
  ADD KEY `note_id` (`note_id`);

--
-- Index pour la table `l82_wc_category_lookup`
--
ALTER TABLE `l82_wc_category_lookup`
  ADD PRIMARY KEY (`category_tree_id`,`category_id`);

--
-- Index pour la table `l82_wc_customer_lookup`
--
ALTER TABLE `l82_wc_customer_lookup`
  ADD PRIMARY KEY (`customer_id`);

--
-- Index pour la table `l82_wc_download_log`
--
ALTER TABLE `l82_wc_download_log`
  ADD PRIMARY KEY (`download_log_id`),
  ADD KEY `permission_id` (`permission_id`),
  ADD KEY `timestamp` (`timestamp`);

--
-- Index pour la table `l82_wc_order_coupon_lookup`
--
ALTER TABLE `l82_wc_order_coupon_lookup`
  ADD PRIMARY KEY (`order_id`,`coupon_id`),
  ADD KEY `date_created` (`date_created`);

--
-- Index pour la table `l82_wc_order_product_lookup`
--
ALTER TABLE `l82_wc_order_product_lookup`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `date_created` (`date_created`);

--
-- Index pour la table `l82_wc_order_stats`
--
ALTER TABLE `l82_wc_order_stats`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `date_created` (`date_created`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `status` (`status`(191));

--
-- Index pour la table `l82_wc_order_tax_lookup`
--
ALTER TABLE `l82_wc_order_tax_lookup`
  ADD PRIMARY KEY (`order_id`,`tax_rate_id`) USING BTREE,
  ADD KEY `tax_rate_id` (`tax_rate_id`),
  ADD KEY `date_created` (`date_created`);

--
-- Index pour la table `l82_wc_product_meta_lookup`
--
ALTER TABLE `l82_wc_product_meta_lookup`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `virtual` (`virtual`),
  ADD KEY `downloadable` (`downloadable`),
  ADD KEY `stock_status` (`stock_status`),
  ADD KEY `stock_quantity` (`stock_quantity`),
  ADD KEY `onsale` (`onsale`),
  ADD KEY `min_max_price` (`min_price`,`max_price`);

--
-- Index pour la table `l82_wc_reserved_stock`
--
ALTER TABLE `l82_wc_reserved_stock`
  ADD PRIMARY KEY (`order_id`,`product_id`);

--
-- Index pour la table `l82_wc_tax_rate_classes`
--
ALTER TABLE `l82_wc_tax_rate_classes`
  ADD PRIMARY KEY (`tax_rate_class_id`),
  ADD UNIQUE KEY `slug` (`slug`(100));

--
-- Index pour la table `l82_wc_webhooks`
--
ALTER TABLE `l82_wc_webhooks`
  ADD PRIMARY KEY (`webhook_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `l82_woocommerce_api_keys`
--
ALTER TABLE `l82_woocommerce_api_keys`
  ADD PRIMARY KEY (`key_id`),
  ADD KEY `consumer_key` (`consumer_key`) USING BTREE,
  ADD KEY `consumer_secret` (`consumer_secret`);

--
-- Index pour la table `l82_woocommerce_attribute_taxonomies`
--
ALTER TABLE `l82_woocommerce_attribute_taxonomies`
  ADD PRIMARY KEY (`attribute_id`),
  ADD KEY `attribute_name` (`attribute_name`(191));

--
-- Index pour la table `l82_woocommerce_downloadable_product_permissions`
--
ALTER TABLE `l82_woocommerce_downloadable_product_permissions`
  ADD PRIMARY KEY (`permission_id`),
  ADD KEY `download_order_key_product` (`order_key`(191),`downloads_remaining`,`product_id`,`order_id`),
  ADD KEY `download_order_product` (`order_id`,`download_id`,`product_id`),
  ADD KEY `user_order_remaining_expires` (`download_id`,`user_id`,`access_expires`,`order_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Index pour la table `l82_woocommerce_log`
--
ALTER TABLE `l82_woocommerce_log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `level` (`level`);

--
-- Index pour la table `l82_woocommerce_order_itemmeta`
--
ALTER TABLE `l82_woocommerce_order_itemmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `order_item_id` (`order_item_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Index pour la table `l82_woocommerce_order_items`
--
ALTER TABLE `l82_woocommerce_order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_item_id` (`order_item_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Index pour la table `l82_woocommerce_payment_tokenmeta`
--
ALTER TABLE `l82_woocommerce_payment_tokenmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `payment_token_id` (`payment_token_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Index pour la table `l82_woocommerce_payment_tokens`
--
ALTER TABLE `l82_woocommerce_payment_tokens`
  ADD PRIMARY KEY (`token_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `l82_woocommerce_sessions`
--
ALTER TABLE `l82_woocommerce_sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD UNIQUE KEY `session_key` (`session_key`);

--
-- Index pour la table `l82_woocommerce_shipping_zones`
--
ALTER TABLE `l82_woocommerce_shipping_zones`
  ADD PRIMARY KEY (`zone_id`);

--
-- Index pour la table `l82_woocommerce_shipping_zone_locations`
--
ALTER TABLE `l82_woocommerce_shipping_zone_locations`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `location_id` (`location_id`),
  ADD KEY `location_code` (`location_code`(191),`location_type`),
  ADD KEY `location_type_code` (`location_type`(10),`location_code`(20));

--
-- Index pour la table `l82_woocommerce_shipping_zone_methods`
--
ALTER TABLE `l82_woocommerce_shipping_zone_methods`
  ADD PRIMARY KEY (`instance_id`);

--
-- Index pour la table `l82_woocommerce_tax_rates`
--
ALTER TABLE `l82_woocommerce_tax_rates`
  ADD PRIMARY KEY (`tax_rate_id`),
  ADD KEY `tax_rate_country` (`tax_rate_country`),
  ADD KEY `tax_rate_state` (`tax_rate_state`(191)),
  ADD KEY `tax_rate_class` (`tax_rate_class`(191)),
  ADD KEY `tax_rate_priority` (`tax_rate_priority`);

--
-- Index pour la table `l82_woocommerce_tax_rate_locations`
--
ALTER TABLE `l82_woocommerce_tax_rate_locations`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `location_type` (`location_type`),
  ADD KEY `location_code` (`location_code`(191)),
  ADD KEY `tax_rate_id` (`tax_rate_id`),
  ADD KEY `location_type_code` (`location_type`(10),`location_code`(20));

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `l82_actionscheduler_actions`
--
ALTER TABLE `l82_actionscheduler_actions`
  MODIFY `action_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `l82_actionscheduler_claims`
--
ALTER TABLE `l82_actionscheduler_claims`
  MODIFY `claim_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `l82_actionscheduler_groups`
--
ALTER TABLE `l82_actionscheduler_groups`
  MODIFY `group_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `l82_actionscheduler_logs`
--
ALTER TABLE `l82_actionscheduler_logs`
  MODIFY `log_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `l82_ce4wp_abandoned_checkout`
--
ALTER TABLE `l82_ce4wp_abandoned_checkout`
  MODIFY `checkout_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `l82_cli_cookie_scan_cookies`
--
ALTER TABLE `l82_cli_cookie_scan_cookies`
  MODIFY `id_cli_cookie_scan_cookies` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `l82_cli_cookie_scan_url`
--
ALTER TABLE `l82_cli_cookie_scan_url`
  MODIFY `id_cli_cookie_scan_url` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `l82_cli_scripts`
--
ALTER TABLE `l82_cli_scripts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `l82_cmplz_cookiebanners`
--
ALTER TABLE `l82_cmplz_cookiebanners`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `l82_cmplz_cookies`
--
ALTER TABLE `l82_cmplz_cookies`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `l82_cmplz_services`
--
ALTER TABLE `l82_cmplz_services`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `l82_comments`
--
ALTER TABLE `l82_comments`
  MODIFY `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `l82_duplicator_packages`
--
ALTER TABLE `l82_duplicator_packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `l82_mailchimp_jobs`
--
ALTER TABLE `l82_mailchimp_jobs`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `l82_mclean_refs`
--
ALTER TABLE `l82_mclean_refs`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `l82_mclean_scan`
--
ALTER TABLE `l82_mclean_scan`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `l82_mystickyelement_contact_lists`
--
ALTER TABLE `l82_mystickyelement_contact_lists`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `l82_nextend2_section_storage`
--
ALTER TABLE `l82_nextend2_section_storage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `l82_nextend2_smartslider3_generators`
--
ALTER TABLE `l82_nextend2_smartslider3_generators`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `l82_nextend2_smartslider3_sliders_xref`
--
ALTER TABLE `l82_nextend2_smartslider3_sliders_xref`
  MODIFY `group_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `l82_nextend2_smartslider3_slides`
--
ALTER TABLE `l82_nextend2_smartslider3_slides`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `l82_options`
--
ALTER TABLE `l82_options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `l82_postmeta`
--
ALTER TABLE `l82_postmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `l82_posts`
--
ALTER TABLE `l82_posts`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `l82_pum_subscribers`
--
ALTER TABLE `l82_pum_subscribers`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `l82_rank_math_404_logs`
--
ALTER TABLE `l82_rank_math_404_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `l82_rank_math_analytics_gsc`
--
ALTER TABLE `l82_rank_math_analytics_gsc`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `l82_rank_math_analytics_objects`
--
ALTER TABLE `l82_rank_math_analytics_objects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `l82_rank_math_internal_links`
--
ALTER TABLE `l82_rank_math_internal_links`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `l82_rank_math_redirections`
--
ALTER TABLE `l82_rank_math_redirections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `l82_rank_math_redirections_cache`
--
ALTER TABLE `l82_rank_math_redirections_cache`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `l82_rcb_asset_seo_redirect`
--
ALTER TABLE `l82_rcb_asset_seo_redirect`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `l82_rcb_consent`
--
ALTER TABLE `l82_rcb_consent`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `l82_rcb_presets`
--
ALTER TABLE `l82_rcb_presets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `l82_rcb_revision`
--
ALTER TABLE `l82_rcb_revision`
  MODIFY `id` mediumint(9) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `l82_rcb_revision_independent`
--
ALTER TABLE `l82_rcb_revision_independent`
  MODIFY `id` mediumint(9) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `l82_rcb_stats`
--
ALTER TABLE `l82_rcb_stats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `l82_termmeta`
--
ALTER TABLE `l82_termmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `l82_terms`
--
ALTER TABLE `l82_terms`
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `l82_term_taxonomy`
--
ALTER TABLE `l82_term_taxonomy`
  MODIFY `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `l82_usermeta`
--
ALTER TABLE `l82_usermeta`
  MODIFY `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `l82_users`
--
ALTER TABLE `l82_users`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `l82_wcpdf_invoice_number`
--
ALTER TABLE `l82_wcpdf_invoice_number`
  MODIFY `id` int(16) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `l82_wc_admin_notes`
--
ALTER TABLE `l82_wc_admin_notes`
  MODIFY `note_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `l82_wc_customer_lookup`
--
ALTER TABLE `l82_wc_customer_lookup`
  MODIFY `customer_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `l82_wc_download_log`
--
ALTER TABLE `l82_wc_download_log`
  MODIFY `download_log_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `l82_wc_order_product_lookup`
--
ALTER TABLE `l82_wc_order_product_lookup`
  MODIFY `order_item_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `l82_wc_order_stats`
--
ALTER TABLE `l82_wc_order_stats`
  MODIFY `order_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `l82_wc_product_meta_lookup`
--
ALTER TABLE `l82_wc_product_meta_lookup`
  MODIFY `product_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `l82_wc_tax_rate_classes`
--
ALTER TABLE `l82_wc_tax_rate_classes`
  MODIFY `tax_rate_class_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `l82_wc_webhooks`
--
ALTER TABLE `l82_wc_webhooks`
  MODIFY `webhook_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `l82_woocommerce_api_keys`
--
ALTER TABLE `l82_woocommerce_api_keys`
  MODIFY `key_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `l82_woocommerce_attribute_taxonomies`
--
ALTER TABLE `l82_woocommerce_attribute_taxonomies`
  MODIFY `attribute_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `l82_woocommerce_downloadable_product_permissions`
--
ALTER TABLE `l82_woocommerce_downloadable_product_permissions`
  MODIFY `permission_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `l82_woocommerce_log`
--
ALTER TABLE `l82_woocommerce_log`
  MODIFY `log_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `l82_woocommerce_order_itemmeta`
--
ALTER TABLE `l82_woocommerce_order_itemmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `l82_woocommerce_order_items`
--
ALTER TABLE `l82_woocommerce_order_items`
  MODIFY `order_item_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `l82_woocommerce_payment_tokenmeta`
--
ALTER TABLE `l82_woocommerce_payment_tokenmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `l82_woocommerce_payment_tokens`
--
ALTER TABLE `l82_woocommerce_payment_tokens`
  MODIFY `token_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `l82_woocommerce_sessions`
--
ALTER TABLE `l82_woocommerce_sessions`
  MODIFY `session_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `l82_woocommerce_shipping_zones`
--
ALTER TABLE `l82_woocommerce_shipping_zones`
  MODIFY `zone_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `l82_woocommerce_shipping_zone_locations`
--
ALTER TABLE `l82_woocommerce_shipping_zone_locations`
  MODIFY `location_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `l82_woocommerce_shipping_zone_methods`
--
ALTER TABLE `l82_woocommerce_shipping_zone_methods`
  MODIFY `instance_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `l82_woocommerce_tax_rates`
--
ALTER TABLE `l82_woocommerce_tax_rates`
  MODIFY `tax_rate_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `l82_woocommerce_tax_rate_locations`
--
ALTER TABLE `l82_woocommerce_tax_rate_locations`
  MODIFY `location_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `l82_wc_download_log`
--
ALTER TABLE `l82_wc_download_log`
  ADD CONSTRAINT `fk_l82_wc_download_log_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `l82_woocommerce_downloadable_product_permissions` (`permission_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
