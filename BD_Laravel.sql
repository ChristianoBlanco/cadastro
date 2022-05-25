-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           5.7.26 - MySQL Community Server (GPL)
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Copiando estrutura do banco de dados para laravel
CREATE DATABASE IF NOT EXISTS `laravel` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `laravel`;

-- Copiando estrutura para tabela laravel.alocacoes
CREATE TABLE IF NOT EXISTS `alocacoes` (
  `desenvolvedor_id` int(10) unsigned NOT NULL,
  `projeto_id` int(10) unsigned NOT NULL,
  `horas_semanais` int(11) NOT NULL,
  PRIMARY KEY (`projeto_id`,`desenvolvedor_id`),
  KEY `alocacoes_desenvolvedor_id_foreign` (`desenvolvedor_id`),
  KEY `alocacoes_projeto_id_foreign` (`projeto_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela laravel.alocacoes: 4 rows
DELETE FROM `alocacoes`;
/*!40000 ALTER TABLE `alocacoes` DISABLE KEYS */;
INSERT INTO `alocacoes` (`desenvolvedor_id`, `projeto_id`, `horas_semanais`) VALUES
	(1, 1, 11),
	(2, 1, 12),
	(2, 2, 13),
	(3, 2, 22);
/*!40000 ALTER TABLE `alocacoes` ENABLE KEYS */;

-- Copiando estrutura para tabela laravel.categorias
CREATE TABLE IF NOT EXISTS `categorias` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela laravel.categorias: 1 rows
DELETE FROM `categorias`;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` (`id`, `nome`, `created_at`, `updated_at`) VALUES
	(1, 'Informática', '2021-10-19 00:28:03', '2021-10-19 00:28:03');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;

-- Copiando estrutura para tabela laravel.desenvolvedores
CREATE TABLE IF NOT EXISTS `desenvolvedores` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cargo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela laravel.desenvolvedores: 3 rows
DELETE FROM `desenvolvedores`;
/*!40000 ALTER TABLE `desenvolvedores` DISABLE KEYS */;
INSERT INTO `desenvolvedores` (`id`, `nome`, `cargo`, `created_at`, `updated_at`) VALUES
	(1, 'Bernardo Silva', 'Analista Pleno', NULL, NULL),
	(2, 'Carlos Arnaldo', 'Analista Senior', NULL, NULL),
	(3, 'Paulo Simas', 'Programador Jr', NULL, NULL);
/*!40000 ALTER TABLE `desenvolvedores` ENABLE KEYS */;

-- Copiando estrutura para tabela laravel.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela laravel.migrations: 5 rows
DELETE FROM `migrations`;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2020_08_26_204425_create_categorias_table', 1),
	(2, '2020_08_26_204520_create_produtos_table', 1),
	(3, '2018_05_23_134552_create_desenvolvedors_table', 2),
	(4, '2018_05_23_134601_create_projetos_table', 2),
	(5, '2018_05_23_135325_alocacao', 2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Copiando estrutura para tabela laravel.produtos
CREATE TABLE IF NOT EXISTS `produtos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estoque` int(11) NOT NULL,
  `preco` double(8,2) NOT NULL,
  `categoria_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `produtos_categoria_id_foreign` (`categoria_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela laravel.produtos: 1 rows
DELETE FROM `produtos`;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` (`id`, `nome`, `estoque`, `preco`, `categoria_id`, `created_at`, `updated_at`) VALUES
	(1, 'PS5', 10, 4000.00, 1, '2021-10-19 00:28:21', '2021-10-19 00:28:21');
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;

-- Copiando estrutura para tabela laravel.projetos
CREATE TABLE IF NOT EXISTS `projetos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estimativa_horas` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela laravel.projetos: 4 rows
DELETE FROM `projetos`;
/*!40000 ALTER TABLE `projetos` DISABLE KEYS */;
INSERT INTO `projetos` (`id`, `nome`, `estimativa_horas`, `created_at`, `updated_at`) VALUES
	(1, 'Sistema de Alocao de Recursos', 200, NULL, NULL),
	(2, 'Sistema de Bibliotecas', 1000, NULL, NULL),
	(3, 'Sistema de Vendas', 2000, NULL, NULL),
	(4, 'Novo Sistema', 5000, NULL, NULL);
/*!40000 ALTER TABLE `projetos` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
