-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 09, 2018 at 02:16 PM
-- Server version: 10.1.33-MariaDB
-- PHP Version: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cook`
--

-- --------------------------------------------------------

--
-- Table structure for table `t_categorie`
--

CREATE TABLE `t_categorie` (
  `idCategorie` int(10) UNSIGNED NOT NULL,
  `nomCategorie` varchar(50) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `t_categorie`
--

INSERT INTO `t_categorie` (`idCategorie`, `nomCategorie`) VALUES
(1, 'Viande'),
(2, 'Poisson'),
(3, 'Légumes'),
(4, 'Accompagnement'),
(5, 'Soupe'),
(6, 'Autre');

-- --------------------------------------------------------

--
-- Table structure for table `t_categorierecette`
--

CREATE TABLE `t_categorierecette` (
  `idCategorieRecette` int(10) UNSIGNED NOT NULL,
  `idCategorie` int(10) UNSIGNED NOT NULL,
  `idRecette` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_categorierecette`
--

INSERT INTO `t_categorierecette` (`idCategorieRecette`, `idCategorie`, `idRecette`) VALUES
(1, 1, 2),
(3, 1, 4),
(4, 6, 37),
(5, 6, 38),
(6, 6, 39),
(7, 6, 40),
(8, 6, 41),
(39, 3, 5),
(41, 3, 10);

-- --------------------------------------------------------

--
-- Table structure for table `t_etapes`
--

CREATE TABLE `t_etapes` (
  `idEtapes` tinyint(3) UNSIGNED NOT NULL,
  `idRecette` int(10) UNSIGNED NOT NULL,
  `descriptEtapes` mediumtext COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `t_etapes`
--

INSERT INTO `t_etapes` (`idEtapes`, `idRecette`, `descriptEtapes`) VALUES
(1, 2, 'Étaler la pâte feuilletée sur une plaque préalablement beurrée.'),
(2, 2, 'Disposer sur une moitié de la pâte les deux tranches de jambon blanc. Etaler sur le jambon deux cuillère à soupe de crème fraîche, puis le gruyère râpé et la ciboulette.\r\n'),
(3, 2, 'Refermer la pâte feuilletée en rabattant la seconde moitié sur la première. Badigeonner la pâte du jaune d\'oeuf.\r\n'),
(4, 2, 'Faire cuire au four Th 180°C pendant 15/20 mn. Servir chaud avec une salade verte.'),
(5, 4, 'Mettre le porc dans un bol avec la sauce de soja, l\'huile de sésame et l\'eau et les mélanger. '),
(6, 4, 'Cuire les feuilles de chou à l\'eau pour 2-3 mn et les hacher et les égoutter à la main. Hacher le nira et l\'ail. '),
(7, 4, 'Mettre les légumes dans un autre bol avec la farine de pomme de terre et les mélanger.'),
(8, 4, 'Mélanger 1 et 2. '),
(9, 4, 'Mettre une cuillère de garniture sur chaque feuille de ravioli chinois et mettre un petit peu d\'eau au bord des feuilles et les envelopper. '),
(10, 4, 'Mettre de la farine de pomme de terre sur l\'assiette avant d\'y mettre les raviolis, sinon ils vont coller à l\'assiette. '),
(11, 4, 'Mettre un peu d\'huile dans la poêle et y cuire les raviolis jusqu\'à ce qu\'ils deviennent marron clair. Mettre de l\'eau jusqu\'à la demi hauteur des raviolis et mettre le couvercle. Le lever quand l\'eau est presque disparue, et cuire les raviolis jusqu\'à ce que les feuilles des raviolis deviennent croustillantes. '),
(12, 4, 'Note de l\'auteur:\r\nAttention : Préparer plus de légumes (des feuilles de chou, nira) que ce que vous pensez. Les légumes rapetissent quand cuits et les raviolis ne sont pas bons avec moins de légumes. Cuisez les raviolis jusqu\'à ce que l\'eau disparaisse complètement. Les raviolis mouillés ne sont pas bons. '),
(13, 5, 'Faire revenir dans une poêle les lardons. Préchauffer le four à 180°C (thermostat 6). '),
(14, 5, 'Ajouter les champignons et l\'oignon (pour ma part, j\'utilise les oignons surgelés, bien plus pratiques et déjà découpés). '),
(15, 5, 'Pendant ce temps, étaler la pâte dans un plat adapté (25 centimètres de diamètre, c\'est bien). '),
(16, 5, 'Piquer le fond avec une fourchette.'),
(17, 5, 'Éparpiller le fromage râpé sur la pâte.'),
(18, 5, 'Battre les 3 œufs dans un saladier. '),
(19, 5, 'Puis rajouter la crème et poivrer.'),
(20, 5, 'Verser le contenu de la poêle (attention au gras) et du saladier sur la pâte.'),
(21, 5, 'Mettre au four 30 min à chaleur tournante.'),
(22, 5, 'Laisser reposer un peu avant de déguster.'),
(23, 5, 'Note de l\'auteur:\r\nS\'accompagne d\'une petite salade verte. '),
(24, 6, 'Laver, éplucher tous les légumes, et les couper en morceaux assez gros.'),
(25, 6, 'Piquer l\'oignon entier avec les clous de girofle.'),
(26, 6, 'Faire bouillir 3 litres d\'eau, ajouter tous les légumes, puis le bouquet garni, l\'ail, sel, poivre puis la viande.'),
(27, 6, 'Faire cuire le tout pendant environ 2 h 30-3 h, écumer de temps en temps. '),
(28, 6, '1 h avant la fin, ajouter les os à moelle, et mettre du gros sel aux extremités pour conserver la moelle. '),
(29, 6, 'Egoutter les légumes et la viande, et servir bien chaud avec de la moutarde. '),
(30, 6, 'Note de l\'auteur:\r\nLe bouillon obtenu est particulièrement savoureux, vous pouvez vous en servir pour faire une soupe à l\'oignon, une soupe de vermicelles, ou tout simplement pour faire cuire des macaronis, c\'est formidable. (Ne pas oublier de le passer) Certains ajoutent des pommes de terre, je vous conseille de les faire cuire à part, sinon elles troublent le bouillon. '),
(31, 7, 'Découper les filets de poulet en petites lamelles (environ 3cm x 1cm). Les mettre dans une sauteuse dans laquelle le beurre a doucement fondu. Pendant qu\'il \'bronze\', couper en tous petits dés le poivron (bien enlever les parties blanches).'),
(32, 7, 'Rajouter le poivron au poulet et les laisser faire connaissance jusqu\'à ce que le poulet rosisse! A ce moment là, rajouter la crème liquide, le sel et le poivre, remuer pour bien tout mélanger et laisser cuire TRES doucement environ 20 minutes.'),
(33, 7, 'Juste avant de servir, rajouter, pour lier la sauce, 2 ou 3 cuillères à soupe de crème fraîche épaisse.'),
(34, 7, 'On peut le servir simplement avec du riz sauvage... et attendre les compliments (version light avec crème allégée à 15 % et toujours aussi bon!).'),
(35, 9, 'Faire revenir l\'agneau dans une sauteuse dans 2 cuillères d\'huile d’olive, ajouter des épices couscous et un peu de sel. '),
(36, 9, 'Quand les morceaux sont dorés, ajouter l’ail écrasé et le concentré de tomates. '),
(37, 9, 'Retirer la viande et la réserver, faire dorer la farine dans le jus et ajouter le bouillon chaud en le fouettant.'),
(38, 9, 'Mettre la viande dans cette sauce, qui ne doit pas être trop liquide, en ajoutant le bouquet garni. Faire cuire à feu doux, au four ou dans une cocotte. '),
(39, 9, 'Au bout de 3/4 d’heure, couper les carottes et les navets en deux, les faire sauter avec les oignons dans 1 cuillère d’huile d’olive, avec des épices à couscous et du sel. '),
(40, 9, 'Quand ils sont dorés, les rajouter à la viande et prendre une louche de sauce de cuisson pour déglacer la sauteuse, remettre ce jus dans le plat de cuisson. '),
(41, 9, 'La sauce ne doit pas être trop liquide et doit juste couvrir les légumes et la viande. Cuire à feu doux pendant 1/2 heure. '),
(42, 9, 'Rajouter les pommes de terre coupées en deux si nécessaire, et vérifier l’assaisonnement. '),
(43, 9, 'Au bout de 3/4 d’heure, dégraisser la sauce et servir avec un hachis de persil frais. '),
(44, 9, 'Note de l\'auteur:\r\nCe plat est délicieux au printemps, avec de petits légumes nouveaux. Il se fait cuire soit au four dans une cocotte en terre, soit sur le feu dans une cocotte en fonte. '),
(45, 10, 'Préparer une grande casserole d\'eau bouillante avec 1 cuillère à soupe de sel, du poivre mouliné et 2 sachets d\'épices safranés pour paëlla qui vous servira de bouillon. '),
(46, 10, 'Dans la Paëllera (grand poêle large et épaisse spéciale pour faire la paëlla), verser l\'huile d\'olive froide et mettre les calamars, laisser les revenir puis ajouter les viandes et le chorizo coupé en rondelles en enlevant la peau quand l\'huile est bien chaude. '),
(47, 10, 'Dès que les viandes sont dorées, y mettre les oignons et l\'ail pressés ainsi que les lanières de poivron. '),
(48, 10, 'Quand le tout a pris de la couleur, ajouter les moules et les langoustines (ou gambas). '),
(49, 10, 'Laisser les moules s\'ouvrir et les gambas rougir. '),
(50, 10, 'Ajouter alors les tomates en morceaux et mélanger quand tout est bien revenu. '),
(51, 10, 'Ajouter le riz en pluie en le répartissant régulièrement dans le plat puis recouvrir avec le bouillon très chaud.'),
(52, 10, 'Laisser cuire le riz 25 à 30 min environ et ne plus mélanger. '),
(53, 10, 'Goûter et s\'il manque du liquide, ajouter du bouillon pour que le riz l\'absorbe bien et continue sa cuisson. '),
(54, 10, 'Ajouter éventuellement des petits pois ou des haricots verts ou des artichauts, blanchis pour chacun d\'eux. '),
(55, 10, 'Décorer le plat en arrangeant les gambas ou langoustines plantées dans le riz ainsi que les moules. Couper quelques citrons et les mettre autour du plat.\r\nVoilà c\'est prêt, Buen provecho ! '),
(56, 11, 'Couper la viande en morceaux égaux. La faire revenir dans une cocotte en fonte, dans laquelle vous avez fait chauffer la matière grasse.'),
(57, 11, 'Une fois les morceaux revenus de tous les côtés, les retirer et faire revenir les oignons émincés et les lardons. '),
(58, 11, 'Préparer le bouillon de boeuf avec 1/2 litre d\'eau.'),
(59, 11, 'Ajouter la viande dans la cocotte, y verser le bouillon, le concentré de tomates, les carottes épluchées et coupées en tronçons, l\'ail et les herbes.'),
(60, 11, 'Assaisonner avec le sel etle poivre, mélanger et laisser mijoter 1h30 à feu doux. '),
(61, 11, 'Note de l\'auteur:\r\nOn peut y ajouter du vin blanc après l\'avoir fait bouillir et flamber (pour enlever l\'acidité). '),
(62, 12, 'Laver et ciseler la batavia, la menthe et la coriandre. Mettre à tremper le vermicelle de riz dans de l\'eau chaude pendant 30 min, le temps qu\'il gonfle. '),
(63, 12, 'L\'égoutter, puis le plonger dans une casserole d\'eau bouillante en remuant avec les baguettes pour qu\'il ne colle pas. Dès que l\'eau bout à nouveau, le retirer et l\'égoutter. '),
(64, 12, 'Dans un saladier, disposer dans l\'ordre la batavia, le soja frais, la menthe, la coriandre, le vermicelle et les carottes râpées préalablement marinées pendant 4 h dans le vinaigre.'),
(65, 12, 'Faire sauter sur un feu très fort, l\'ail écrasé et la viande coupée en fines lamelles. Saler, poivrer, verser sur le vermicelle. C\'est prêt. Servir avec le nuoc-mâm pur ou allongé à l\'eau et au jus de citron - sucre. '),
(66, 12, 'Note de l\'auteur:\r\nC\'est très bon, peu calorique, j\'en fais très souvent. '),
(67, 13, 'Faire préchauffer le four à 210°C (thermostat 7).\r\nDéposer les cuisses de poulet dans un plat allant au four. '),
(68, 13, 'Eplucher l\'oignon, le couper en quatre. Le mettre dans le plat avec les cuisses. Ajouter, la gousse d\'ail, le thym, les feuilles de laurier, le bouillon de cube coupé en quatre, les baies de genièvre, et le clou de girofle. '),
(69, 13, 'Ajouter l\'eau. Arroser les cuisses d\'huile d\'olive. '),
(70, 13, 'Enfourner à 210°C pendant 35 minutes. Arroser les cuisses de temps en temps pendant la cuisson. '),
(71, 13, 'Note de l\'auteur:\r\nS\'accommode très bien avec une purée de potiron et du riz ou alors de haricots verts et de pommes de terre vapeur persillées. '),
(72, 14, 'Tartiner chaque tortilla avec 1 cuillère à café de basilic. '),
(73, 14, 'Répartir les ingrédients coupés en dés (le jambon en petits morceaux).'),
(74, 14, 'Rouler chaque tortilla sur elle-même. '),
(75, 14, 'Servir avec une salade verte'),
(76, 15, 'Préchauffer le four à 180°C (thermostat 6). '),
(77, 15, 'Laver les champignons, retirer les pieds et les couper en lamelles. Cuire à sec dans une poêle. Réserver au chaud. '),
(78, 15, 'Eplucher et couper l\'oignon en anneaux et cuire à sec dans la poêle qui a servi à cuire les champignons. Réserver au chaud.'),
(79, 15, 'Laver les tomates, les couper en 2 et saupoudrer les faces intérieures de thym, sel et poivre, puis les faire griller à sec dans une poêle, sur leurs 2 faces. '),
(80, 15, 'Mélanger la viande hachée avec le persil, saler et poivrer, partager en 2 et former 2 steaks. '),
(81, 15, 'Cuire rapidement les steaks hachés dans une poêle à sec. Réserver au chaud. '),
(82, 15, 'Monter les tomates burgers en superposant un dessous de tomate, un steak, des champignons, des oignons, une tranche de mozzarella, des cornichons, la tranche de bacon, et refermer avec le dessus de tomate. '),
(83, 15, 'Enfourner 10 min'),
(84, 16, 'Peler les aubergines et les couper en tranches pas trop épaisses. '),
(85, 16, 'Les fariner et les faire frire dans une poêle à l\'huile olive. Bien les égoutter dans du papier absorbant. '),
(86, 16, 'Faire revenir les lardons les égoutter eux aussi. '),
(87, 16, 'Remettre les lardons dans la poêle sans matière grasse et ajouter la crème fraîche.'),
(88, 16, 'A ébulition, baisser le feu et laisser épaissir. Ajouter les aubergines et servir avec du parmesan. '),
(89, 17, 'Plonger les pics en bois dans l\'eau froide. '),
(90, 17, 'Couper la viande en dés et la saupoudrer de paprika, de sel et de poivre. '),
(91, 17, 'Ajouter le thym, le laurier et le romarin hachés. '),
(92, 17, 'Arroser d\'huile et laisser mariner durant 2 heures.'),
(93, 17, 'Disposer les dés de viande sur les pics à brochette et faire cuire 20 minutes au barbecue en les arrosant fréquemment de marinade. '),
(94, 18, 'Quelques heures avant la grillade, mettre le thon dans un plat creux, puis l\'arroser d\'huile d\'olive et du jus de citron. '),
(95, 18, 'Presser l\'ail, saupoudrer avec le cumin (une bonne cuillère à café) . Râper le gingembre frais, saler et poivrer.'),
(96, 18, 'Rajouter un peu de coriandre fraîche ou une dose de safran. Arroser souvent. '),
(97, 18, 'Faire cuire au barbecue. '),
(98, 18, 'Note de l\'auteur:\r\nNe pas laisser cuire très longtemps. '),
(99, 19, 'Eplucher les pommes de terre, ou laisser la peau si elle est fine. '),
(100, 19, 'Les couper dans le sens de la longueur et les placer sur une plaque au four, face bombée contre la plaque. Saler et laisser cuire à four chaud jusqu\'à ce que le dessus soit bien doré. '),
(101, 19, 'Servir chaud accompagnées de salade verte et de toutes sortes de fromages (du kiri pour les enfants en allant jusqu\'au maroilles...). '),
(102, 19, 'C\'est délicieux, économique et sans graisse. Délicieux avec de la cancoillotte ! '),
(103, 19, 'Note de l\'auteur:\r\nNDchef : très très bon. Lorsqu\'elles sont cuites, vous pouvez les remplir de fromage (mozarella, cheddar ou autre) et les remettre au four. '),
(104, 20, 'Eplucher la courge, la vider puis, à l\'aide d\'une mandoline, la réduire en \"spaghetti\".'),
(105, 20, 'Hacher l\'ail et le faire fondre dans l\'huile. Ajouter les spaghetti de courge et laisser cuire à feu moyen jusqu\'à ce que la courge soit tendre. Saler, poivrer. '),
(106, 20, 'Au moment de servir, agrémenter d\'un filet d\'huile d\'olive, de parmesan, de sel et de poivre. Parsemer de persil. '),
(107, 21, 'Laver les aubergines, les essuyer et les détailler en dés. '),
(108, 21, 'Faire chauffer 2 cuillères à soupe d\'huile d\'olive dans une sauteuse, et ajouter les dés d\'aubergine. '),
(109, 21, 'Laisser mijoter 15 min, puis ajouter le chèvre frais et quelques feuilles de basilic. '),
(110, 21, 'Saler, poivrer et bien mélanger; laisser cuire encore 15 min.'),
(111, 21, 'Décorer de feuilles de basilic, et servir bien chaud. '),
(112, 21, 'Note de l\'auteur: Cette poêlée peut être servie en accompagnement de viande ou en farce pour des tartes, lasagnes, bricks ou omelettes. '),
(113, 22, 'Mélanger le fromage blanc (ou le yaourt), les oeufs, la farine, sel et poivre dans un saladier. '),
(114, 22, 'Laisser reposer 20 mn cette pâte souple (comme un liquide épais). '),
(115, 22, 'Faites bouillir de l\'eau salée. Prendre 2 cuillères à soupe et faire tomber des portions de pâte dans l\'eau bouillante. Procéder en plusieurs fois. '),
(116, 22, 'Dès que les Knepfles sont cuits, ils remontent à la surface (Attention qu\'ils ne restent pas collés au fond de la casserole). '),
(117, 22, 'Faire chauffer le beurre dans une poêle. Sortir au fur et à mesure les Knepfles cuits avec une écumoire et les transférer dans la poêle. Bien faire revenir 10 mn. '),
(118, 22, 'Note de l\'auteur:\r\nCes knepfles accompagnent aussi bien poissons que viandes en sauce. C\'est (presque)aussi rapide que de se faire des pâtes, mais c\'est encore meilleur. '),
(119, 23, 'Préchauffez le four à 180°C (Th 6 ).'),
(120, 23, 'Beurrez un plat à four et frottez-le avec une gousse d\'ail fendue. Lavez et essuyez les courgettes. Détaillez-les en fines rondelles après avoir éliminé les extrémités. Passez les gousses d\'ail restant au presse-ail et réservez. '),
(121, 23, 'Pelez et lavez les pommes de terre. Découpez-les en fines tranches. Disposez une couche de pommes de terre au fond du plat, salez, poivrez et parsemez d\'ail. Recouvrez d\'une couche de courgettes, salez et poivrez à nouveau. Renouvelez ces opérations jusqu\'à épuisement des ingrédients. Terminez par une couche de pommes de terre. '),
(122, 23, 'Dans un bol, battez la crème fraîche et le lait avec du sel, du poivre et la muscade. Versez sur les légumes. Inclinez le plat dans tous les sens pour que le liquide se répartisse uniformément. Couvrez de fromage râpé. '),
(123, 23, 'Faites cuire au four environ 1 heure. Le temps de cuisson est indicatif et dépend de la variété des pommes de terre. Au bout de 45 mn, piquez la lame d\'un couteau au centre du gratin pour vérifier leur cuisson ; elles doivent être tendres. En fin de cuisson, couvrez le plat d\'une feuille de papier d\'aluminium si le fromage est suffisamment coloré. '),
(124, 24, 'Mélanger la semoule avec la pulpe de tomate. Rajouter le reste des ingrédients. '),
(125, 24, 'Placer au réfrigérateur 1h minimum.'),
(126, 24, 'Note de l\'auteur:\r\nLa recette de base est très simple et ne nécessite pas de cuisson. On peut aisément agrémenter selon ses goûts (raisins secs,tomates fraiches, restes de poulet...) '),
(127, 25, 'Mouiller le couscous dans un grand saladier avec 1/2 l d\'eau + 1 cuillère à café de sel + 1 cuillère à soupe d\'huile. '),
(128, 25, 'Mélanger avec une fourchette, puis remuer régulièrement cette préparation pour détacher les grains. '),
(129, 25, 'Nettoyer les légumes. Couper les carottes et navets en dés, les fonds d\'artichauts en 8. '),
(130, 25, 'Mettre les légumes dans le haut du couscoussier, saler, couvrir et faire cuire à la vapeur 20 min. '),
(131, 25, 'Au bout de ces 20 min, rajouter la graine et arroser d\'un filet d\'huile d\'olive. Ne pas couvrir. Compter environ 10 min quand la vapeur passe au travers de la graine. '),
(132, 25, 'Reverser dans le saladier et mélanger l\'ensemble en incorporant de nouveau un peu d\'huile d\'olive. '),
(133, 25, 'Note de l\'auteur:\r\nSe sert seul pour un repas du soir ou en accompagnement d\'une épaule d\'agneau par exemple. Conseillé: mettre à disposition des convives un flacon de cumin moulu. '),
(134, 26, 'Mélanger dans une terrine les épinards émincés crus, l\'oignon finement haché et le sel; laisser reposer 1/2 h. '),
(135, 26, 'Mélanger ensuite le jus de citron, l\'huile d\'olive, le sumac, les pignons et ajouter le mélange aux épinards. Mélanger longuement pour imprégner les épinards de façon homogène. '),
(136, 26, 'Étaler la pâte finement et découper des ronds avec un bol. '),
(137, 26, 'Placer au centre, 1 cuillère à soupe d\'épinards et refermer avec 3 doigts en serrant bien, de façon à former des triangles. '),
(138, 26, 'Dans un four préchauffé à 180°C (thermostat 6), placer les chaussons sur une plaque huilée, et laisser dorer environ 20 min. '),
(139, 26, 'Servir chaud au froid, avec une salade. '),
(140, 26, 'Note de l\'auteur:\r\nPour former les triangles, pincer un bord jusqu\'au centre, puis rassembler le reste en deux pointes. '),
(155, 27, 'Couper le haut de la tomate et réserver le chapeau. '),
(156, 27, 'Dans un bol, évider les tomates et y ajouter l\'huile d\'olive, le basilic, le sel et le poivre.'),
(157, 27, 'Couper la mozzarella en dès et garnir les tomates. Soyez généreux en hauteur. '),
(158, 27, 'Une fois bien garnies, verser le contenu du bol sur chaque tomate ainsi que le fond du plat, s\'il vous reste de la mozzarella, vous pouvez en ajouter dans le plat. '),
(159, 27, 'Mettre le chapeau de la tomate sur chacune d\'entre elle. '),
(160, 27, 'Cuire au four pendant 30 min à 180°C (thermostat 6). '),
(161, 28, 'Préchauffer le four à 180°C (thermostat 6). '),
(162, 28, 'Dans un saladier, mélanger à l\'aide d\'un fouet les œufs et la farine. '),
(163, 28, 'Ajouter le lait et la crème puis mélanger à nouveau. '),
(164, 28, 'Saler et poivrer. '),
(165, 28, 'Ciseler la ciboulette et l\'ajouter à la pâte (en garder un peu de côté pour la fin de la recette). '),
(166, 28, 'Ensuite, découper le chèvre en rondelles. '),
(167, 28, 'Beurrer le plat, y déposer les rondelles de chèvre puis ajouter la ciboulette restante. '),
(168, 28, 'Mettre au four 45 minutes. '),
(169, 29, 'Faire cuire la courge dans une cocotte (suivre le temps de cuisson indiqué dans le manuel de votre cocotte).\r\nAprès la cuisson, faire égoutter la courge afin qu\'elle ait rendue toute son eau. '),
(170, 29, 'Mélanger les œufs, la crème, la moitié du gruyère, le sel, le poivre et une pointe de noix de muscade râpée. Mélanger cette préparation à la courge. Mixer le tout. '),
(171, 29, 'Verser dans un plat à gratin et parsemer du reste du gruyère. Faire cuire 30 min dans le four à 200°C.'),
(172, 30, 'Couper les aubergines, sur la longueur, en tranches épaisses. Les faire dégorger, avec du sel, pendant une heure. '),
(173, 30, 'Couper les courgettes, en tranches, pas trop fines. Couper les poivrons en lamelles. Les faire revenir dans une poêle, avec de l\'huile d\'olive, jusqu\'à ce qu\'ils perdent leur croustillant. '),
(174, 30, 'Pendant ce temps, couper les oignons en rondelles, les faire revenir dans une poêle avec de l\'huile d\'olive et l\'ail, écrasé. '),
(175, 30, 'Rajouter les tomates en dés, ainsi que le jus et laisser mijoter pendant une demi-heure, en rajoutant les assaisonnements désirés. '),
(176, 30, 'Lorsque les aubergines sont prêtes, les passer à l\'eau et les éponger. '),
(177, 30, 'Beurrer un grand plat allant au four. Mettre une rangée d\'aubergines, une rangée de courgettes, une rangée de poivrons, une rangée de tomates, avec le jus. Recouvrir de yaourt et de feta. '),
(178, 30, 'Recommencer: aubergines, courgettes, poivrons,tomates, yaourt et feta. Terminer avec une couche d\'aubergines. Recouvrir de mozzarella. '),
(179, 30, 'Préchauffer le four à 150°C. Laisser cuire pendant une petite heure, ou jusqu\'à ce que le jus commence à bouillir dans le plat! Surveiller la cuisson à partir de 45 mn. '),
(180, 30, 'Servir bien chaud. '),
(181, 31, 'Eplucher puis découper en tranches très fines les pommes de terre, les oignons et les courgettes'),
(182, 31, 'Dans un plat à gratin huilé, verser dans le plat le mélange pommes de terre et oignons, saler, poivrer, aromatiser et verser un peu d\'huile d\'olive !!'),
(183, 31, 'Par-dessus, disposer joliment les courgettes (on peut alterner avec des tomates), à nouveau bien aromatiser, et couvrir de gruyère rapé, et d\'huile d\'olive. '),
(184, 31, 'Cuire à four moyen (180°C) pendant une bonne demi-heure. '),
(185, 31, 'Note de l\'auteur:\r\nEn milieu de cuisson, on peut couvrir d\'un papier aluminium pour ne pas que le dessus noircisse. '),
(186, 32, 'Coupez les tomates pelées en quartiers, '),
(187, 32, 'les aubergines et les courgettes en rondelles. '),
(188, 32, 'Emincez les poivrons en lamelles '),
(189, 32, 'et l\'oignon en rouelles. '),
(190, 32, 'Chauffez 2 cuillères à soupe d\'huile dans une poêle '),
(191, 32, 'et faites-y fondre les oignons et les poivrons. '),
(192, 32, 'Lorsqu\'ils sont tendres, ajoutez les tomates, l\'ail haché, le thym et le laurier.'),
(193, 32, 'Salez, poivrez et laissez mijoter doucement à couvert durant 45 minutes.'),
(194, 32, 'Pendant ce temps, préparez les aubergines et les courgettes. Faites les cuire séparemment ou non dans l\'huile d\'olive pendant 15 minutes.'),
(195, 32, 'Vérifiez la cuisson des légumes pour qu\'ils ne soient plus fermes. Ajoutez les alors au mélange de tomates et prolongez la cuisson sur tout petit feu pendant 10 min. '),
(196, 32, 'Salez et poivrez si besoin. '),
(197, 32, 'Note de l\'auteur:\r\nTrès bon chaud mais peut aussi se servir froid'),
(198, 33, 'Egouttez les tomates séchées et les poivrons puis séchez-les rapidement dans du papier absorbant. '),
(199, 33, 'Emincez les oignons, coupez les tomates cerises en deux, la mozzarella en fines tranches, hachez l’ail. '),
(200, 33, 'Mettez dans un saladier les poivrons et les tomates séchées, les tomates cerise, les oignons et l’ail, salez et poivrez, ajoutez une pincée de piment d’Espelette puis mélangez le tout. '),
(201, 33, 'Etalez bien la pâte à pain, badigeonnez avec le concentré de tomate, déposez les tranches de mozzarella puis parsemez par dessus les légumes du saladier, puis quelques feuilles de basilic, d’origan et de thym.'),
(202, 33, 'Enfournez une douzaine de minutes à 220°C (thermostat 7). '),
(203, 33, 'Terminez en parsemant quelques feuilles de basilic, d’origan et de thym. '),
(204, 34, 'Couper les aubergines en tranches assez fines. '),
(205, 34, 'Les faire dégorger 30 min (les saupoudrer de sel). '),
(206, 34, 'Dans une poêle, faire chauffer de l\'huile d\'olive et y dorer les tranches d\'aubergines de chaque côté. '),
(207, 34, 'Baisser le feu et laisser les aubergines s\'attendrir. '),
(208, 34, 'Dans un plat allant au four, étaler la sauce bolognaise sur le fond, saupoudrer de parmesan et étaler une couche d\'aubergine. '),
(209, 34, 'Recommencer l\'opération autant de fois que nécessaire, terminer par la sauce bolognaise. '),
(210, 34, 'Recouvrir de parmesan et parsemer de beurre. '),
(211, 34, 'Mettre à four chaud pendant environ 30 min.'),
(212, 34, 'Note de l\'auteur:\r\nSi on aime le fromage, on peut ajouter des tranches de mozzarella ou de filante. Ce plat peut se manger en entrée avec du pain ou comme plat principal avec des pâtes comme les penne ou les rigatonni. '),
(213, 35, 'Couper les aubergines en fines tranches dans le sens de la longueur et faites les dégorger avec le gros sel durant 20 minutes. '),
(214, 35, 'Pendant ce temps, dans une casserole faites dorer l\'ail avec 2 cuillères à soupe d\'huile d\'olive et ajoutez le vin, les tomates concassées ainsi que le concentré. Remuez et ajoutez l\'eau. Salez, poivrez. Couvrez et laissez mijoter pendant 45 minutes à feux doux. '),
(215, 35, 'Coupez la mozzarella en dés. '),
(216, 35, 'Quand les aubergines ont bien dégorgé, faites-les dorer à la poêle avec un peu d\'huile d\'olive. '),
(217, 35, 'Dès que la sauce tomate est prête, disposez dans un plat à gratin les tranches d\'aubergines en alternance avec la mozzarella et la sauce tomate. Finissez avec une couche d\'aubergines, la sauce tomate et du parmesan fraîchement râpé. '),
(218, 35, 'Mettez au four à 210°C (thermostat 7) durant 20 minutes et voilà! '),
(219, 36, 'Faites bouillir une grande casserole d\'eau salée.'),
(220, 36, 'Mettez-y les petits pois, laissez cuire 5 minutes puis ajoutez les tagliatelles. Laissez cuire 10 min. '),
(221, 36, 'Emincez l\'oignon, pressez l\'ail. Faites-les dorer avec un peu d\'huile dans une poêle. '),
(222, 36, 'Ajoutez le mascarpone et laissez fondre à feu doux. '),
(223, 36, 'Egouttez les pâtes et les petits pois, récupérez 2-3 cuillères à soupe d\'eau de cuisson pour délayer la sauce. '),
(224, 36, 'Mélangez les tagliatelles et petits pois à la sauce, parsemez de copeaux de parmesan et servez. '),
(225, 36, 'Note de l\'auteur:\r\nAgrémentez avec des lardons ou des lamelles de jambon cru pour enrichir la recette. '),
(238, 37, 'Séparer les jaunes des blancs. '),
(239, 37, 'Mélanger les jaunes avec le lait, puis la farine, le sucre, la levure et une pincée de sel. '),
(240, 37, 'Monter les blancs à neige ferme. '),
(241, 37, 'Incorporer les blancs au mélange lait, œuf, farine. '),
(242, 37, 'Cuire dans une poêle beurrée chaude, par petits tas de 5-7 cm de diamètre. Retourner quand des bulles apparaissent. '),
(243, 38, 'Porter à ébullition le lait mélangé au sucre. '),
(244, 38, 'Verser dans la casserole les flocons d\'avoines, laisser cuire à feu doux 15 minutes en remuant de temps en temps.'),
(245, 38, 'L\'avoine doit absorber le lait. '),
(246, 38, 'Se consomme chaud au petit déjeuner, typique chez les américains et les anglais. '),
(247, 39, 'Détailler la truffe en petits morceaux. '),
(248, 39, 'Dans une petite casserole, faire fondre le beurre sans le colorer, puis y mettre la truffe à cuire. '),
(249, 39, 'Dans un saladier, casser les œufs, puis les mêler à l’aide d’une fourchette en mélangeant vivement. '),
(250, 39, 'Y ajouter les morceaux de truffes, puis saler et poivrer. '),
(251, 39, 'Verser la préparation dans une casserole, puis la placer dans un bain marie et laisser cuire sur feu très doux sans cesser de remuer (à l’aide d’une cuillère en bois). '),
(252, 39, 'Lorsque les œufs sont bien crémeux, incorporer la crème fraîche froide pour arrêter la cuisson des œufs. '),
(253, 39, 'Bien mélanger une dernière fois et servir aussitôt. '),
(254, 40, 'Fouetter les oeufs avec le sucre et le lait. '),
(255, 40, 'Y tremper les tranches de pain. ');

-- --------------------------------------------------------

--
-- Table structure for table `t_ingredient`
--

CREATE TABLE `t_ingredient` (
  `idIngredient` int(11) UNSIGNED NOT NULL,
  `nomIngredient` varchar(50) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `t_ingredient`
--

INSERT INTO `t_ingredient` (`idIngredient`, `nomIngredient`) VALUES
(1, 'pâte feuilletée'),
(2, 'jambon blanc'),
(3, 'gruyère'),
(4, 'crème fraîche'),
(5, 'ciboulette'),
(6, 'jaune d\'oeuf'),
(7, 'soja'),
(8, 'huile de sésame'),
(9, 'eau'),
(10, 'chou'),
(11, 'farine de pomme de terre'),
(12, 'ail'),
(13, 'feuille de ravioli'),
(14, 'porc haché'),
(15, 'lardons'),
(16, 'champignons de paris'),
(17, 'oignon'),
(18, 'oeuf'),
(19, 'crème liquide'),
(20, 'fromage râpé'),
(21, 'poivre'),
(22, 'viande de boeuf'),
(23, 'os à moelle'),
(24, 'carotte'),
(25, 'poireau'),
(26, 'navet'),
(27, 'céleri'),
(28, 'clou de girofle'),
(29, 'thym'),
(30, 'laurier'),
(31, 'persil'),
(32, 'sel'),
(33, 'pomme de terre'),
(34, 'farine'),
(35, 'huile d\'olive'),
(36, 'épinards'),
(37, 'citron'),
(38, 'pignons de pin'),
(39, 'farine'),
(40, 'huile d\'olive'),
(41, 'épinards'),
(42, 'citron'),
(43, 'pignons de pin'),
(44, 'tomate'),
(45, 'mozzarella'),
(46, 'basilic'),
(47, 'filet de poulet'),
(48, 'poivron rouge'),
(49, 'beurre'),
(50, 'encornet'),
(51, 'crevette'),
(52, 'haricot vert'),
(53, 'radis noir'),
(54, 'huile de friture'),
(55, 'sauce tempura'),
(56, 'lait'),
(57, 'fromage de chèvre'),
(58, 'courge'),
(59, 'muscade'),
(60, 'agneau'),
(61, 'concentré de tomates'),
(62, 'bouillon de légumes'),
(63, 'bouillon de viandes'),
(64, 'gros sel'),
(65, 'épices à couscous'),
(66, 'riz long grain'),
(67, 'poulet'),
(68, 'côte de porc'),
(69, 'moules'),
(70, 'calamar'),
(71, 'langoustine'),
(72, 'poivron vert'),
(73, 'chorizo'),
(74, 'petit pois'),
(75, 'artichaut'),
(76, 'épices à paella'),
(77, 'lard'),
(78, 'sauge'),
(79, 'parmesan'),
(80, 'menthe'),
(81, 'coriandre'),
(82, 'batavia'),
(83, 'steak de boeuf'),
(84, 'vermicelles de riz'),
(85, 'nuoc mam'),
(86, 'vinaigre'),
(87, 'cuisse de poulet'),
(88, 'bouillon de volaille'),
(89, 'genièvre'),
(90, 'aubergine'),
(91, 'tortilla'),
(92, 'avocat'),
(93, 'jambon cru'),
(94, 'jus de citron '),
(95, 'pesto'),
(96, 'fromage blanc'),
(97, 'courgette'),
(98, 'yaourt grec'),
(99, 'feta'),
(100, 'fines herbes'),
(101, 'comté râpé'),
(102, 'oignon rouge'),
(103, 'bacon'),
(104, 'cornichon'),
(105, 'tomates séchées'),
(106, 'poivron grillé à l\'huile'),
(107, 'pâte à pain'),
(108, 'oignon nouveau'),
(109, 'origan'),
(110, 'piment d\'Espelette'),
(111, 'sauce bolognaise'),
(112, 'semoule'),
(113, 'pulpe de tomate'),
(114, 'veau'),
(115, 'romarin'),
(116, 'paprika'),
(117, 'thon'),
(118, 'cumin'),
(119, 'gingembre'),
(120, 'vin rouge'),
(121, 'couscous'),
(122, 'fève'),
(123, 'tagliatelle'),
(124, 'mascarpone'),
(125, 'bouquet garni'),
(126, 'champignons parfumés (séchés)'),
(127, 'boeuf bourguignon'),
(128, 'viande hachée'),
(129, 'thon rouge'),
(130, 'butternut'),
(131, 'sumac'),
(132, 'tomate en boîte'),
(133, 'sucre'),
(134, 'levure'),
(135, 'flocons d\'avoine'),
(136, 'truffe'),
(137, 'sucre de canne'),
(138, 'pain'),
(139, 'canelle');

-- --------------------------------------------------------

--
-- Table structure for table `t_ingredientrecette`
--

CREATE TABLE `t_ingredientrecette` (
  `idIngredientRecette` int(10) UNSIGNED NOT NULL,
  `idIngredient` int(11) UNSIGNED NOT NULL,
  `idRecette` int(10) UNSIGNED NOT NULL,
  `ingredientQuantite` smallint(4) UNSIGNED NOT NULL,
  `ingredientMesure` varchar(10) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `t_ingredientrecette`
--

INSERT INTO `t_ingredientrecette` (`idIngredientRecette`, `idIngredient`, `idRecette`, `ingredientQuantite`, `ingredientMesure`) VALUES
(1, 1, 2, 1, 'rouleau(s)'),
(2, 2, 2, 2, 'tranche(s)'),
(3, 3, 2, 100, 'g'),
(4, 4, 2, 2, 'c à soupe'),
(5, 5, 2, 1, 'botte(s)'),
(6, 6, 2, 1, ''),
(7, 7, 4, 4, 'c à soupe'),
(8, 8, 4, 4, 'c à soupe'),
(9, 9, 4, 4, 'c à soupe'),
(10, 10, 4, 10, 'feuille(s)'),
(11, 5, 4, 1, 'botte(s)'),
(12, 11, 4, 4, 'c à soupe'),
(13, 12, 4, 0, ''),
(14, 13, 4, 50, 'feuille(s)'),
(15, 14, 4, 500, 'g'),
(16, 1, 5, 1, 'rouleau(s)'),
(17, 15, 5, 200, 'g'),
(18, 16, 5, 120, 'g (égoutté'),
(19, 17, 5, 1, ''),
(20, 18, 5, 3, 'entier(s)'),
(21, 19, 5, 20, 'cl'),
(22, 20, 5, 100, 'g'),
(23, 21, 5, 0, ''),
(24, 22, 6, 1, 'kg'),
(25, 23, 6, 1, 'par per.'),
(26, 24, 6, 5, 'pièce(s)'),
(27, 25, 6, 2, 'pièce(s)'),
(28, 26, 6, 4, 'pièce(s)'),
(29, 27, 6, 2, 'branche(s)'),
(30, 17, 6, 1, 'pièce(s)'),
(31, 12, 6, 1, 'gousse(s)'),
(32, 125, 6, 1, ''),
(33, 21, 6, 0, ''),
(34, 47, 7, 6, 'pièce(s)'),
(35, 48, 7, 1, 'pièce(s)'),
(36, 19, 7, 20, 'cl'),
(37, 4, 7, 2, 'c à soupe'),
(38, 49, 7, 0, ''),
(39, 21, 7, 0, ''),
(40, 32, 7, 0, ''),
(41, 50, 8, 4, 'pièce(s)'),
(42, 51, 8, 8, 'pièce(s)'),
(43, 17, 8, 1, ''),
(44, 52, 8, 1, 'poignée(s)'),
(45, 24, 8, 1, 'pièce(s)'),
(46, 126, 8, 2, 'pièce(s)'),
(47, 34, 8, 150, 'g'),
(48, 18, 8, 1, ''),
(49, 9, 8, 0, ''),
(50, 55, 8, 10, 'cl'),
(51, 53, 8, 1, 'pièce(s)'),
(52, 54, 8, 10, 'cl'),
(53, 60, 9, 1, 'kg'),
(54, 24, 9, 8, 'pièce(s)'),
(55, 26, 9, 8, 'pièce(s)'),
(56, 17, 9, 12, ''),
(57, 33, 9, 10, 'pièce(s)'),
(58, 12, 9, 8, 'gousse(s)'),
(59, 61, 9, 75, 'g'),
(60, 62, 9, 500, 'ml'),
(61, 64, 9, 3, 'c à café'),
(62, 125, 9, 1, ''),
(63, 34, 9, 1, 'c à soupe'),
(64, 35, 9, 3, 'c à soupe'),
(65, 31, 9, 1, 'bouquet'),
(66, 65, 9, 0, ''),
(67, 66, 10, 1, 'kg'),
(68, 67, 10, 1, 'kg'),
(69, 68, 10, 500, 'gr'),
(70, 69, 10, 1, 'kg'),
(71, 70, 10, 1, 'kg'),
(72, 71, 10, 12, 'pièce(s)'),
(73, 35, 10, 35, 'cl'),
(74, 17, 10, 2, 'pièce(s)'),
(75, 12, 10, 4, 'gousses(s)'),
(76, 44, 10, 6, 'pièce(s)'),
(77, 48, 10, 1, 'pièce(s)'),
(78, 72, 10, 1, 'pièce(s)'),
(79, 73, 10, 1, 'entier'),
(80, 74, 10, 0, ''),
(81, 76, 10, 0, ''),
(82, 21, 10, 0, ''),
(83, 32, 10, 0, ''),
(84, 127, 11, 1, 'kg'),
(85, 17, 11, 2, 'pièce(s)'),
(86, 77, 11, 1, 'tranche(s)'),
(87, 61, 11, 1, 'pte boite'),
(88, 125, 11, 1, ''),
(89, 63, 11, 1, 'cube'),
(90, 12, 11, 2, 'gousse(s)'),
(91, 24, 11, 6, 'pièce(s)'),
(92, 32, 11, 0, ''),
(93, 21, 11, 0, ''),
(94, 80, 12, 1, 'bouquet(s)'),
(95, 81, 12, 1, 'bouquet(s)'),
(96, 82, 12, 1, 'bouquet(s)'),
(97, 7, 12, 2, 'poignée(s)'),
(98, 83, 12, 1, 'pièce(s)'),
(99, 84, 12, 200, 'g'),
(100, 24, 12, 3, 'pièce(s)'),
(101, 17, 12, 1, 'pièce(s)'),
(102, 12, 12, 1, 'gousse(s)'),
(103, 85, 12, 2, 'c à soupe'),
(104, 86, 12, 1, 'c à café'),
(105, 37, 12, 1, 'pièce(s)'),
(106, 32, 12, 0, ''),
(107, 87, 13, 4, 'pièce(s)'),
(108, 9, 13, 50, 'cl'),
(109, 17, 13, 1, 'pièce(s)'),
(110, 12, 13, 1, 'gousse(s)'),
(111, 125, 13, 1, 'pièce(s)'),
(112, 88, 13, 1, 'cube'),
(113, 89, 13, 3, 'pièce(s)'),
(114, 28, 13, 1, 'pièce(s)'),
(115, 35, 13, 1, 'c à soupe'),
(116, 91, 14, 4, 'pièce(s)'),
(117, 92, 14, 1, 'pièce(s)'),
(118, 44, 14, 1, 'pièce(s)'),
(119, 45, 14, 1, 'pièce(s)'),
(120, 93, 14, 4, 'tranche(s)'),
(121, 94, 14, 1, 'c à soupe'),
(122, 95, 14, 4, 'c à café'),
(123, 44, 15, 2, 'pièce(s)'),
(124, 102, 15, 40, 'g'),
(125, 128, 15, 160, 'g'),
(126, 16, 15, 100, 'g'),
(127, 103, 15, 2, 'tranche(s)'),
(128, 45, 15, 40, 'gr'),
(129, 104, 15, 4, 'pièce(s)'),
(130, 29, 15, 1, 'pincée(s)'),
(131, 31, 15, 1, 'c à soupe'),
(132, 21, 15, 0, ''),
(133, 32, 15, 0, ''),
(134, 90, 16, 2, 'pièce(s)'),
(135, 15, 16, 200, 'g'),
(136, 4, 16, 20, 'cl'),
(137, 79, 16, 0, ''),
(138, 32, 16, 0, ''),
(139, 21, 16, 0, ''),
(140, 114, 17, 900, 'g'),
(141, 35, 17, 40, 'cl'),
(142, 29, 17, 3, 'brin(s)'),
(143, 30, 17, 2, 'feuille(s)'),
(144, 115, 17, 2, 'brin(s)'),
(145, 116, 17, 1, 'c à café'),
(146, 32, 17, 0, ''),
(147, 21, 17, 0, ''),
(148, 129, 18, 4, 'tranche(s)'),
(149, 35, 18, 0, ''),
(150, 37, 18, 0, ''),
(151, 118, 18, 0, ''),
(152, 119, 18, 0, ''),
(153, 12, 18, 0, ''),
(154, 81, 18, 0, ''),
(155, 21, 18, 0, ''),
(156, 32, 18, 0, ''),
(157, 33, 19, 500, 'g'),
(158, 130, 20, 1, 'pièce(s)'),
(159, 35, 20, 3, 'c à soupe'),
(160, 79, 20, 50, 'g'),
(161, 31, 20, 0, ''),
(162, 12, 20, 0, ''),
(163, 32, 20, 0, ''),
(164, 21, 20, 0, ''),
(165, 90, 21, 2, 'pièce(s)'),
(166, 57, 21, 150, 'g'),
(167, 46, 21, 0, ''),
(168, 35, 21, 0, ''),
(169, 96, 22, 350, 'g'),
(170, 18, 22, 3, 'pièce(s)'),
(171, 34, 22, 250, 'g'),
(172, 49, 22, 20, 'g'),
(173, 32, 22, 0, ''),
(174, 21, 22, 0, ''),
(175, 97, 23, 600, 'g'),
(176, 33, 23, 400, 'g'),
(177, 101, 23, 200, 'g'),
(178, 49, 23, 20, 'g'),
(179, 4, 23, 40, 'cl'),
(180, 56, 23, 15, 'cl'),
(181, 59, 23, 1, 'pincée(s)'),
(182, 32, 23, 0, ''),
(183, 21, 23, 0, ''),
(184, 112, 24, 200, 'g'),
(185, 113, 24, 1, 'boîte'),
(186, 17, 24, 1, 'pièce(s)'),
(187, 37, 24, 1, 'pièce(s)'),
(188, 80, 24, 0, ''),
(189, 121, 25, 500, 'g'),
(190, 24, 25, 2, 'pièce(s)'),
(191, 26, 25, 2, 'pièce(s)'),
(192, 75, 25, 2, 'pièce(s)'),
(193, 74, 25, 1, 'poignée(s)'),
(194, 52, 25, 1, 'poignée(s)'),
(195, 122, 25, 1, 'poignée(s)'),
(196, 35, 25, 0, ''),
(197, 34, 26, 200, 'g'),
(198, 35, 26, 7, 'c à soupe'),
(199, 32, 26, 0, ''),
(200, 9, 26, 0, ''),
(201, 36, 26, 500, 'g'),
(202, 17, 26, 1, 'pièce(s)'),
(203, 37, 26, 1, 'pièce(s)'),
(204, 35, 26, 0, ''),
(205, 38, 26, 1, 'c à soupe'),
(206, 131, 26, 1, 'c à café'),
(207, 44, 27, 8, 'pièce(s)'),
(208, 45, 27, 800, 'g'),
(209, 35, 27, 4, 'c à soupe'),
(210, 46, 27, 0, ''),
(211, 21, 27, 0, ''),
(212, 32, 27, 0, ''),
(213, 18, 28, 4, 'entier(s)'),
(214, 34, 28, 150, 'g'),
(215, 19, 28, 25, 'cl'),
(216, 56, 28, 25, 'cl'),
(217, 57, 28, 1, 'bûche(s)'),
(218, 5, 28, 1, 'branche(s)'),
(219, 49, 28, 1, 'noisette(s'),
(220, 58, 29, 600, 'g'),
(221, 18, 29, 2, 'entier(s)'),
(222, 4, 29, 2, 'c à soupe'),
(223, 3, 29, 100, 'g'),
(224, 21, 29, 0, ''),
(225, 21, 29, 0, ''),
(226, 59, 29, 0, ''),
(227, 90, 30, 2, 'pièce(s)'),
(228, 97, 30, 3, 'pièce(s)'),
(229, 48, 30, 3, 'pièce(s)'),
(230, 17, 30, 4, 'pièce(s)'),
(231, 98, 30, 500, 'g'),
(232, 99, 30, 800, 'g'),
(234, 132, 30, 2, 'gr bte(s)'),
(235, 12, 30, 3, 'gousse(s)'),
(236, 45, 30, 0, 'tranche(s)'),
(237, 35, 30, 0, ''),
(238, 49, 30, 0, ''),
(239, 32, 30, 0, ''),
(240, 21, 30, 0, ''),
(241, 90, 32, 350, 'g'),
(242, 97, 32, 350, 'g'),
(243, 48, 32, 175, 'g'),
(244, 72, 32, 175, 'g'),
(245, 17, 32, 350, 'g'),
(246, 44, 32, 500, 'g'),
(247, 12, 32, 3, 'gousse(s)'),
(248, 29, 32, 1, 'brin(s)'),
(249, 30, 32, 1, 'feuille(s)'),
(250, 32, 32, 0, ''),
(251, 21, 32, 0, ''),
(252, 105, 33, 165, 'g'),
(253, 106, 33, 199, 'g'),
(254, 107, 33, 400, 'g'),
(255, 61, 33, 2, 'c à soupe'),
(256, 45, 33, 1, 'boule(s)'),
(257, 108, 33, 2, 'pièce(s)'),
(258, 12, 33, 2, 'gousse(s)'),
(259, 46, 33, 0, ''),
(260, 109, 33, 0, ''),
(261, 29, 33, 0, ''),
(262, 110, 33, 0, ''),
(263, 32, 33, 0, ''),
(264, 21, 33, 0, ''),
(265, 90, 34, 1, 'pièce(s)'),
(266, 111, 34, 20, 'cl'),
(267, 79, 34, 75, 'g'),
(268, 90, 35, 1, 'kg'),
(269, 132, 35, 800, 'g'),
(270, 61, 35, 2, 'c à soupe'),
(271, 45, 35, 250, 'g'),
(272, 12, 35, 2, 'gousse(s)'),
(273, 79, 35, 0, ''),
(274, 35, 35, 0, ''),
(275, 120, 35, 10, 'cl'),
(276, 9, 35, 10, 'cl'),
(277, 32, 35, 0, ''),
(278, 21, 35, 0, ''),
(279, 64, 35, 0, ''),
(280, 123, 36, 300, 'g'),
(281, 124, 36, 125, 'g'),
(282, 74, 36, 300, 'g'),
(283, 17, 36, 1, 'pièce(s)'),
(284, 12, 36, 1, 'gousse(s)'),
(285, 79, 36, 40, 'g'),
(286, 35, 36, 0, ''),
(287, 21, 36, 0, ''),
(288, 32, 36, 0, ''),
(289, 18, 37, 2, 'entier(s)'),
(290, 56, 37, 150, 'ml'),
(291, 34, 37, 150, 'g'),
(292, 133, 37, 2, 'c à soupe'),
(293, 134, 37, 1, 'paquet(s)'),
(294, 32, 37, 0, ''),
(295, 135, 37, 5, 'c à soupe'),
(296, 56, 37, 25, 'cl'),
(297, 133, 37, 2, 'c à soupe'),
(298, 18, 39, 8, 'entier(s)'),
(299, 136, 39, 1, 'en boîte'),
(300, 49, 39, 100, 'g'),
(301, 4, 39, 4, 'c à soupe'),
(302, 21, 39, 0, ''),
(303, 32, 39, 0, ''),
(304, 18, 40, 3, 'entier(s)'),
(305, 56, 40, 25, 'cl'),
(306, 137, 40, 75, 'g'),
(307, 138, 40, 6, 'tranche(s)'),
(308, 134, 41, 25, 'g'),
(309, 49, 41, 150, 'g'),
(310, 56, 41, 25, 'cl'),
(311, 32, 41, 2, 'g'),
(312, 34, 41, 175, 'cl'),
(313, 133, 41, 180, 'g'),
(314, 139, 41, 3, 'c à café'),
(315, 18, 41, 1, 'entier(s)');

-- --------------------------------------------------------

--
-- Table structure for table `t_recette`
--

CREATE TABLE `t_recette` (
  `idRecette` int(10) UNSIGNED NOT NULL,
  `nom` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `difficulte` tinyint(4) NOT NULL,
  `cout` tinyint(4) NOT NULL,
  `duree` tinyint(3) UNSIGNED NOT NULL,
  `tempsDePrep` tinyint(3) UNSIGNED NOT NULL,
  `tempsDeCuisson` tinyint(3) UNSIGNED NOT NULL,
  `tempsDeRepos` tinyint(3) UNSIGNED NOT NULL,
  `cooking` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `t_recette`
--

INSERT INTO `t_recette` (`idRecette`, `nom`, `image`, `difficulte`, `cout`, `duree`, `tempsDePrep`, `tempsDeCuisson`, `tempsDeRepos`, `cooking`) VALUES
(2, 'Feuilleté rapide jambon fromage', '2.jpg', 1, 1, 25, 5, 20, 0, 1),
(4, 'Gyoza (Ravioli Chinois à la Japonaise)', '4.jpg', 2, 3, 50, 40, 10, 0, 1),
(5, 'Quiche très facile', '5.jpg', 1, 1, 40, 0, 0, 0, 1),
(6, 'Pot-au-feu', '6.jpg', 2, 2, 150, 30, 120, 0, 1),
(7, 'Filets de poulet à la crème de poivrons', '7.jpg', 1, 1, 45, 15, 30, 0, 1),
(8, 'Beignets tempura au calamar', '8.jpg', 1, 2, 35, 30, 5, 0, 1),
(9, 'Navarin d\'agneau', '9.jpg', 2, 2, 140, 20, 120, 0, 1),
(10, 'Véritable paëlla espagnole', '10.jpg', 2, 2, 90, 0, 0, 0, 1),
(11, 'Boeuf braisé aux carottes', '11.jpg', 1, 1, 80, 20, 60, 0, 1),
(12, 'Bo Bun', '12.jpg', 1, 2, 40, 20, 20, 0, 1),
(13, 'Cuisses de poulet au four', '13.jgp', 1, 1, 45, 10, 35, 0, 1),
(14, 'Wrap à l\'italienne', '14.jpg', 1, 1, 5, 5, 0, 0, 0),
(15, 'Tomate Burger', '15.jpg', 1, 1, 25, 15, 10, 0, 0),
(16, 'Aubergines à la carbonara', '16.jpg', 1, 1, 25, 10, 15, 0, 1),
(17, 'Brochettes de veau mariné', '17.jpg', 1, 2, 35, 15, 20, 0, 1),
(18, 'Thon grillé marinade méditerranéenne', '18.jpg', 1, 1, 15, 10, 5, 0, 1),
(19, 'Pomme de terre au four', '19.jpg', 1, 1, 55, 10, 45, 0, 1),
(20, 'Zoodle de butternut', '20.jpg', 2, 1, 45, 30, 15, 0, 1),
(21, 'Poêlée d\'aubergines au chèvre', '21.jpg', 1, 1, 35, 5, 30, 0, 1),
(22, 'Pâtes alsaciennes', '22.jpg', 2, 1, 30, 15, 15, 0, 1),
(23, 'Dauphinois de courgettes', '23.jpg', 2, 2, 80, 20, 60, 0, 1),
(24, 'Taboulé express', '24.jpg', 2, 1, 10, 10, 0, 0, 0),
(25, 'Couscous de printemps', '25.jpg', 1, 2, 55, 20, 35, 0, 0),
(26, 'Chaussons aux épinards', '26.jpg', 1, 1, 140, 60, 20, 60, 1),
(27, 'Tomates mozzarella au four', '27.jpg', 1, 1, 45, 15, 30, 0, 1),
(28, 'Clafoutis salé au chèvre', '28.jpg', 1, 1, 45, 15, 30, 0, 1),
(29, 'Gratin de courge facile', '29.jpg', 1, 1, 60, 30, 30, 0, 1),
(30, 'Moussaka végétarienne', '30.jpg', 1, 1, 120, 60, 60, 0, 1),
(31, 'Tian de pommes de terre et courgettes', '31.jpg', 1, 1, 65, 20, 45, 0, 1),
(32, 'Ratatouille', '32.jpg', 1, 2, 80, 25, 55, 0, 1),
(33, 'Pizza végétarienne aux légumes grillés et aux herbes', '33.jpg', 1, 1, 27, 15, 12, 0, 1),
(34, 'Aubergine à la parmesane', '34.jpg', 1, 1, 75, 45, 30, 0, 1),
(35, 'Aubergines à la Parmigiana', '35.jpg', 1, 1, 90, 30, 60, 0, 1),
(36, 'Tagliatelles au mascarpone et petits pois', '36.jpg', 1, 2, 35, 20, 15, 0, 1),
(37, 'Pancakes rapides', '37.jpg', 1, 1, 20, 10, 10, 0, 1),
(38, 'Home made oatmeal', '38.jpg', 1, 1, 19, 2, 17, 0, 1),
(39, 'Oeufs brouillés', '39.jpg', 1, 2, 20, 5, 15, 0, 1),
(40, 'Pain perdu', '40.jpg', 2, 2, 30, 15, 15, 0, 1),
(41, 'Kanelbulle (viennoiserie suédoise à la cannelle)', '41.jpg', 1, 2, 70, 60, 10, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `t_repas`
--

CREATE TABLE `t_repas` (
  `idRepas` int(10) UNSIGNED NOT NULL,
  `nomRepas` varchar(50) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `t_repas`
--

INSERT INTO `t_repas` (`idRepas`, `nomRepas`) VALUES
(1, 'Petit-déjeuner'),
(2, 'Déjeuner'),
(3, 'Dîner');

-- --------------------------------------------------------

--
-- Table structure for table `t_repasrecette`
--

CREATE TABLE `t_repasrecette` (
  `idRepasRecette` int(10) UNSIGNED NOT NULL,
  `idRepas` int(10) UNSIGNED NOT NULL,
  `idRecette` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_repasrecette`
--

INSERT INTO `t_repasrecette` (`idRepasRecette`, `idRepas`, `idRecette`) VALUES
(1, 2, 2),
(2, 1, 37),
(3, 2, 16),
(4, 1, 38),
(5, 1, 39),
(6, 2, 10),
(7, 3, 11),
(8, 2, 4),
(9, 2, 5),
(10, 3, 6),
(11, 2, 8),
(12, 3, 9),
(13, 2, 7);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `t_categorie`
--
ALTER TABLE `t_categorie`
  ADD PRIMARY KEY (`idCategorie`);

--
-- Indexes for table `t_categorierecette`
--
ALTER TABLE `t_categorierecette`
  ADD PRIMARY KEY (`idCategorieRecette`),
  ADD KEY `idCategorie` (`idCategorie`),
  ADD KEY `idRecette` (`idRecette`);

--
-- Indexes for table `t_etapes`
--
ALTER TABLE `t_etapes`
  ADD PRIMARY KEY (`idEtapes`) USING BTREE,
  ADD KEY `idRecette` (`idRecette`) USING BTREE;

--
-- Indexes for table `t_ingredient`
--
ALTER TABLE `t_ingredient`
  ADD PRIMARY KEY (`idIngredient`);

--
-- Indexes for table `t_ingredientrecette`
--
ALTER TABLE `t_ingredientrecette`
  ADD PRIMARY KEY (`idIngredientRecette`),
  ADD KEY `idRecette` (`idRecette`) USING BTREE,
  ADD KEY `idIngredient` (`idIngredient`) USING BTREE;

--
-- Indexes for table `t_recette`
--
ALTER TABLE `t_recette`
  ADD PRIMARY KEY (`idRecette`);

--
-- Indexes for table `t_repas`
--
ALTER TABLE `t_repas`
  ADD PRIMARY KEY (`idRepas`);

--
-- Indexes for table `t_repasrecette`
--
ALTER TABLE `t_repasrecette`
  ADD PRIMARY KEY (`idRepasRecette`),
  ADD KEY `idRepas` (`idRepas`),
  ADD KEY `idRecette` (`idRecette`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `t_categorie`
--
ALTER TABLE `t_categorie`
  MODIFY `idCategorie` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `t_categorierecette`
--
ALTER TABLE `t_categorierecette`
  MODIFY `idCategorieRecette` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `t_etapes`
--
ALTER TABLE `t_etapes`
  MODIFY `idEtapes` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=256;

--
-- AUTO_INCREMENT for table `t_ingredient`
--
ALTER TABLE `t_ingredient`
  MODIFY `idIngredient` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;

--
-- AUTO_INCREMENT for table `t_ingredientrecette`
--
ALTER TABLE `t_ingredientrecette`
  MODIFY `idIngredientRecette` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=316;

--
-- AUTO_INCREMENT for table `t_recette`
--
ALTER TABLE `t_recette`
  MODIFY `idRecette` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `t_repas`
--
ALTER TABLE `t_repas`
  MODIFY `idRepas` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `t_repasrecette`
--
ALTER TABLE `t_repasrecette`
  MODIFY `idRepasRecette` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `t_categorierecette`
--
ALTER TABLE `t_categorierecette`
  ADD CONSTRAINT `t_categorierecette_ibfk_1` FOREIGN KEY (`idCategorie`) REFERENCES `t_categorie` (`idCategorie`),
  ADD CONSTRAINT `t_categorierecette_ibfk_2` FOREIGN KEY (`idRecette`) REFERENCES `t_recette` (`idRecette`);

--
-- Constraints for table `t_etapes`
--
ALTER TABLE `t_etapes`
  ADD CONSTRAINT `t_etapes_ibfk_1` FOREIGN KEY (`idRecette`) REFERENCES `t_recette` (`idRecette`);

--
-- Constraints for table `t_ingredientrecette`
--
ALTER TABLE `t_ingredientrecette`
  ADD CONSTRAINT `t_ingredientrecette_ibfk_1` FOREIGN KEY (`idRecette`) REFERENCES `t_recette` (`idRecette`),
  ADD CONSTRAINT `t_ingredientrecette_ibfk_2` FOREIGN KEY (`idIngredient`) REFERENCES `t_ingredient` (`idIngredient`);

--
-- Constraints for table `t_repasrecette`
--
ALTER TABLE `t_repasrecette`
  ADD CONSTRAINT `t_repasrecette_ibfk_1` FOREIGN KEY (`idRepas`) REFERENCES `t_repas` (`idRepas`),
  ADD CONSTRAINT `t_repasrecette_ibfk_2` FOREIGN KEY (`idRecette`) REFERENCES `t_recette` (`idRecette`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
