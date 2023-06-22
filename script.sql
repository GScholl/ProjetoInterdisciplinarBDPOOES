-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 22-Jun-2023 às 13:20
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `base_de_dados`
--
CREATE DATABASE IF NOT EXISTS `base_de_dados` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `base_de_dados`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `sincol_balanco`
--

CREATE TABLE `sincol_balanco` (
  `id_balanco` int(11) NOT NULL,
  `ano_balanco` varchar(10) DEFAULT NULL,
  `mes_balanco` varchar(2) DEFAULT NULL,
  `den_conta` varchar(256) DEFAULT NULL,
  `num_conta` varchar(128) DEFAULT NULL,
  `valor_balanco` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `sincol_balanco`
--
ALTER TABLE `sincol_balanco`
  ADD PRIMARY KEY (`id_balanco`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `sincol_balanco`
--
ALTER TABLE `sincol_balanco`
  MODIFY `id_balanco` int(11) NOT NULL AUTO_INCREMENT;
--
-- Banco de dados: `cacadorense`
--
CREATE DATABASE IF NOT EXISTS `cacadorense` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `cacadorense`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `acessos`
--

CREATE TABLE `acessos` (
  `id` int(11) NOT NULL,
  `nome` varchar(128) NOT NULL,
  `url` varchar(128) NOT NULL,
  `icone` varchar(128) DEFAULT NULL,
  `pai` int(11) DEFAULT NULL,
  `ordem` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `acessos`
--

INSERT INTO `acessos` (`id`, `nome`, `url`, `icone`, `pai`, `ordem`) VALUES
(1, 'Usuário', 'perfil/usuario', 'fa fa-user', NULL, 1),
(2, 'Acessos', 'gerencia/acessos', 'fa fa-table', NULL, NULL),
(3, 'Banner', 'gerencia/banner', 'fa fa-image', NULL, NULL),
(5, 'Elencos', 'clube/elencos', 'fa fa-futbol', NULL, 2),
(7, 'Jogos', 'jogos/proximos-jogos', 'fa fa-futbol', NULL, 5),
(8, 'Jogadores', 'clube/jogadores', 'fa fa-users', NULL, 5),
(9, 'Cat.. de Documentos', 'cadastro/transparencia', 'fa fa-file', NULL, 6),
(10, 'Documentos', 'cadastro/documentos', 'fa fa-file', NULL, 5),
(11, 'Perguntas Frequentes', 'contato/perguntas', 'fa fa-question', NULL, 8),
(12, 'Linha do Tempo', 'conteudo/quem-somos', 'fa fa-eye', NULL, 1),
(13, 'Patrocinadores', 'cadastro/patrocinadores', 'fa fa-money', NULL, 8),
(14, 'Títulos', 'clube/titulos', 'fa fa-trophy', NULL, 4),
(15, 'Noticias', 'conteudo/noticias', 'fa fa-newspaper', NULL, 8);

-- --------------------------------------------------------

--
-- Estrutura da tabela `banners`
--

CREATE TABLE `banners` (
  `id` int(11) NOT NULL,
  `nome` varchar(128) DEFAULT NULL,
  `foto` text DEFAULT NULL,
  `ordem` int(11) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `banners`
--

INSERT INTO `banners` (`id`, `nome`, `foto`, `ordem`, `url`) VALUES
(1, 'Quando torcida e time jogam juntos, tudo da certo!', 'Design-sem-nome-17.png', 1, 'https://gremio.net/home'),
(2, 'Jesus Cristo', 'Design-sem-nome-18.png', 2, 'https://gegnet.com.br/');

-- --------------------------------------------------------

--
-- Estrutura da tabela `calendarios`
--

CREATE TABLE `calendarios` (
  `id` int(11) NOT NULL,
  `titulo` varchar(256) DEFAULT NULL,
  `foto` text DEFAULT NULL,
  `descricao` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria_documento`
--

CREATE TABLE `categoria_documento` (
  `id` int(11) NOT NULL,
  `nome` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `categoria_documento`
--

INSERT INTO `categoria_documento` (`id`, `nome`) VALUES
(1, 'Balanço Patrimonial'),
(2, 'Orçamento'),
(3, 'Certidões negativas'),
(4, 'Regimento');

-- --------------------------------------------------------

--
-- Estrutura da tabela `documentos`
--

CREATE TABLE `documentos` (
  `id` int(11) NOT NULL,
  `titulo` text DEFAULT NULL,
  `documento` text DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `documentos`
--

INSERT INTO `documentos` (`id`, `titulo`, `documento`, `id_categoria`) VALUES
(1, 'Qualquer', 'UC-08c910dd-b0bb-4fba-91bf-be8db14d30e0.pdf', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `elencos`
--

CREATE TABLE `elencos` (
  `id` int(11) NOT NULL,
  `nome` varchar(128) DEFAULT NULL,
  `ordem` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `elencos`
--

INSERT INTO `elencos` (`id`, `nome`, `ordem`) VALUES
(1, 'Sub-17', 3),
(2, 'Sub-20', 2),
(3, 'Profissional', 1),
(4, 'Sub-15', 4),
(5, 'Sub-13', 5),
(6, 'Juvenil', 6),
(7, 'Junior', 7);

-- --------------------------------------------------------

--
-- Estrutura da tabela `jogadores`
--

CREATE TABLE `jogadores` (
  `id` int(11) NOT NULL,
  `nome` varchar(128) DEFAULT NULL,
  `foto` varchar(128) DEFAULT NULL,
  `id_elenco` int(11) NOT NULL,
  `id_posicao` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `jogadores`
--

INSERT INTO `jogadores` (`id`, `nome`, `foto`, `id_elenco`, `id_posicao`) VALUES
(1, 'Gabriel Lins', '20220619_142349.png', 2, 2),
(2, 'Joni', '20220618_135848-1.png', 2, 2),
(3, 'TESTE', 'Design-sem-nome-5.png', 2, 2),
(4, 'TESTE', 'Design-sem-nome-9.png', 3, 10),
(5, 'TESTE', '3337584-foto-avatar-padrao-placeholder-perfil-icone-vetor.jpg', 3, 2),
(6, 'TESTE', '3337584-foto-avatar-padrao-placeholder-perfil-icone-vetor-5a6ae.jpg', 3, 2),
(7, 'João', NULL, 2, 13);

-- --------------------------------------------------------

--
-- Estrutura da tabela `jogos`
--

CREATE TABLE `jogos` (
  `id` int(11) NOT NULL,
  `time_1` varchar(128) DEFAULT NULL,
  `time_2` varchar(128) DEFAULT NULL,
  `logo_time_1` text DEFAULT NULL,
  `logo_time_2` text DEFAULT NULL,
  `data` timestamp NOT NULL DEFAULT current_timestamp(),
  `local` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `jogos`
--

INSERT INTO `jogos` (`id`, `time_1`, `time_2`, `logo_time_1`, `logo_time_2`, `data`, `local`) VALUES
(1, 'Caçadorense', 'Caçadorense', 'CACADORENSE-C-A-C-.png', 'CACADORENSE-C-A-C--c6287.png', '2023-01-28 17:02:06', 'Caçador-SC'),
(2, 'Argentina', 'Estados Unidos', '2.png', '5.png', '2023-01-31 17:00:00', 'Caçador-SC');

-- --------------------------------------------------------

--
-- Estrutura da tabela `linhas_do_tempo`
--

CREATE TABLE `linhas_do_tempo` (
  `id` int(11) NOT NULL,
  `titulo` varchar(256) DEFAULT NULL,
  `ano` int(11) DEFAULT NULL,
  `texto` text DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `linhas_do_tempo`
--

INSERT INTO `linhas_do_tempo` (`id`, `titulo`, `ano`, `texto`, `foto`) VALUES
(0, 'Primeiro Campeonato', 2005, 'Já no primeiro campeonato disputado, o Estadual de Amadores 2005, o CAC chegou a semifinal, sendo eliminado após dois jogos memoráveis contra o Gigantinho, de Chapecó. O confronto foi considerado uma final antecipada, já que o Gigantinho chegaria ao titulo naquele ano.', NULL),
(1, 'Fundação', 2003, 'Fundado em 25 de junho de 2003, por iniciativa de grupo de amigos, amantes do futebol e preocupados com as questões sociais de nosso município, vendo que o esporte poderia contribuir em prol desta causa. Assim foi montada a primeira equipe da Associação, Com um elenco mesclando ex-profissionais e atletas amadores do município, o CAC, como é carinhosamente chamado pela torcida, iniciou sua atuação no futebol de campo, mantendo constante evolução até os dias de hoje.', '0623estadio_g-1.jpeg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `noticias`
--

CREATE TABLE `noticias` (
  `id` int(11) NOT NULL,
  `titulo` varchar(256) DEFAULT NULL,
  `foto` text DEFAULT NULL,
  `data` timestamp NOT NULL DEFAULT current_timestamp(),
  `conteudo` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `noticias`
--

INSERT INTO `noticias` (`id`, `titulo`, `foto`, `data`, `conteudo`) VALUES
(1, 'Teste', '0622cacadorense_g.jpeg', '2023-01-25 03:00:00', 'Teste teste'),
(2, 'Teste', '0623estadio_g-1.jpeg', '2023-04-11 16:51:17', 'teste');

-- --------------------------------------------------------

--
-- Estrutura da tabela `patrocinadores`
--

CREATE TABLE `patrocinadores` (
  `id` int(11) NOT NULL,
  `nome` varchar(128) DEFAULT NULL,
  `foto` varchar(512) DEFAULT NULL,
  `url` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `patrocinadores`
--

INSERT INTO `patrocinadores` (`id`, `nome`, `foto`, `url`) VALUES
(1, 'Gegnet', 'logo-gg.png', 'https://gegnet.com.br/'),
(2, 'Qualquer', 'logo-gg-ef8b5.png', 'https://gegnet.com.br/'),
(3, 'mais um', 'logo-gg-e788c.png', 'https://gegnet.com.br/'),
(4, '123123', 'logo-gg-51988.png', 'https://gegnet.com.br/'),
(5, '123123', 'logo-gg-24fe2.png', '12312312');

-- --------------------------------------------------------

--
-- Estrutura da tabela `perfis`
--

CREATE TABLE `perfis` (
  `id` int(11) NOT NULL,
  `id_permissao` int(11) NOT NULL,
  `nome` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `perfis`
--

INSERT INTO `perfis` (`id`, `id_permissao`, `nome`) VALUES
(1, 1, 'Admin');

-- --------------------------------------------------------

--
-- Estrutura da tabela `perguntas`
--

CREATE TABLE `perguntas` (
  `id` int(11) NOT NULL,
  `pergunta` varchar(128) DEFAULT NULL,
  `resposta` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `perguntas`
--

INSERT INTO `perguntas` (`id`, `pergunta`, `resposta`) VALUES
(1, 'Jesus Existe?', 'Só Deus sabe');

-- --------------------------------------------------------

--
-- Estrutura da tabela `permissoes`
--

CREATE TABLE `permissoes` (
  `id` int(11) DEFAULT NULL,
  `id_perfil` int(11) NOT NULL,
  `id_acesso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `permissoes`
--

INSERT INTO `permissoes` (`id`, `id_perfil`, `id_acesso`) VALUES
(NULL, 1, 1),
(NULL, 1, 2),
(NULL, 1, 3),
(NULL, 1, 5),
(NULL, 1, 8),
(NULL, 1, 7),
(NULL, 1, 9),
(NULL, 1, 10),
(NULL, 1, 11),
(NULL, 1, 12),
(NULL, 1, 13),
(NULL, 1, 14),
(NULL, 1, 15);

-- --------------------------------------------------------

--
-- Estrutura da tabela `posicoes`
--

CREATE TABLE `posicoes` (
  `id` int(11) NOT NULL,
  `nome` text DEFAULT NULL,
  `ordem` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `posicoes`
--

INSERT INTO `posicoes` (`id`, `nome`, `ordem`) VALUES
(1, 'MAT', 3),
(2, 'ATA', 2),
(3, 'ZAG', NULL),
(4, 'VOL', 5),
(5, 'MC', 4),
(6, 'LD', 9),
(7, 'LE', 9),
(8, 'GOL', NULL),
(9, 'ME', 7),
(10, 'MD', 6),
(11, 'PTD', NULL),
(12, 'PTE', 0),
(13, 'Técnico', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `titulos`
--

CREATE TABLE `titulos` (
  `id` int(11) NOT NULL,
  `titulo` varchar(128) DEFAULT NULL,
  `foto` text DEFAULT NULL,
  `ano` int(11) DEFAULT NULL,
  `id_elenco` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `titulos`
--

INSERT INTO `titulos` (`id`, `titulo`, `foto`, `ano`, `id_elenco`) VALUES
(1, 'Campeão Catarinense serie C ', 'TACA2K19.jpg', 2019, 3),
(2, 'Campeão Catarinense serie C ', '8fb438_38f25626fe684f6f9b6e90effd5caa52_mv2-b03f1.jpg', 2012, 3),
(3, 'Campeão Copa Contestado ', '8fb438_baec5a28b0804aa8bd4488d29b57aa65_mv2.jpg', 2008, 3),
(4, ' Campeão da Copa Bugre do Oeste Sub-15', NULL, 2007, 1),
(5, 'Campeão do Catarinense Fase Oeste Sub-15 ', NULL, 2007, 4),
(6, 'Campeão do Catarinense Fase Oeste Sub-13', NULL, 2008, 5),
(7, 'Campeão do Catarinense Div. Acesso Juvenil', NULL, 2009, 6),
(8, 'Campeão do Catarinense Fase Oeste Sub-13', NULL, 2010, 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(128) DEFAULT NULL,
  `senha` text DEFAULT NULL,
  `email` varchar(128) NOT NULL,
  `id_perfil` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `senha`, `email`, `id_perfil`) VALUES
(1, 'Guilherme Scholl', '3171c55343c3991c0387c2f688c3da36', 'guilhermescholl99@gmail.com', 1);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `acessos`
--
ALTER TABLE `acessos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `calendarios`
--
ALTER TABLE `calendarios`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `categoria_documento`
--
ALTER TABLE `categoria_documento`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `documentos`
--
ALTER TABLE `documentos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Índices para tabela `elencos`
--
ALTER TABLE `elencos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `jogadores`
--
ALTER TABLE `jogadores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jogadores_FK` (`id_elenco`);

--
-- Índices para tabela `jogos`
--
ALTER TABLE `jogos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `linhas_do_tempo`
--
ALTER TABLE `linhas_do_tempo`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `noticias`
--
ALTER TABLE `noticias`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `patrocinadores`
--
ALTER TABLE `patrocinadores`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `perfis`
--
ALTER TABLE `perfis`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `perguntas`
--
ALTER TABLE `perguntas`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `permissoes`
--
ALTER TABLE `permissoes`
  ADD KEY `id_perfil` (`id_perfil`),
  ADD KEY `id_acesso` (`id_acesso`);

--
-- Índices para tabela `posicoes`
--
ALTER TABLE `posicoes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `titulos`
--
ALTER TABLE `titulos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `titulos_FK` (`id_elenco`);

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `acessos`
--
ALTER TABLE `acessos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `categoria_documento`
--
ALTER TABLE `categoria_documento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `documentos`
--
ALTER TABLE `documentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `elencos`
--
ALTER TABLE `elencos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `jogadores`
--
ALTER TABLE `jogadores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `jogos`
--
ALTER TABLE `jogos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `noticias`
--
ALTER TABLE `noticias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `patrocinadores`
--
ALTER TABLE `patrocinadores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `perfis`
--
ALTER TABLE `perfis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `perguntas`
--
ALTER TABLE `perguntas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `posicoes`
--
ALTER TABLE `posicoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `titulos`
--
ALTER TABLE `titulos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `documentos`
--
ALTER TABLE `documentos`
  ADD CONSTRAINT `documentos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria_documento` (`id`);

--
-- Limitadores para a tabela `jogadores`
--
ALTER TABLE `jogadores`
  ADD CONSTRAINT `jogadores_FK` FOREIGN KEY (`id_elenco`) REFERENCES `elencos` (`id`);

--
-- Limitadores para a tabela `titulos`
--
ALTER TABLE `titulos`
  ADD CONSTRAINT `titulos_FK` FOREIGN KEY (`id_elenco`) REFERENCES `elencos` (`id`);
--
-- Banco de dados: `curso_ci4`
--
CREATE DATABASE IF NOT EXISTS `curso_ci4` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `curso_ci4`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(9) NOT NULL,
  `nome` varchar(128) NOT NULL,
  `data_de_nascimento` date NOT NULL,
  `CPF` varchar(11) NOT NULL,
  `telefone` varchar(11) NOT NULL,
  `endereco` varchar(128) NOT NULL,
  `limite_de_credito` double NOT NULL,
  `dia_de_pagamento` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nome`, `data_de_nascimento`, `CPF`, `telefone`, `endereco`, `limite_de_credito`, `dia_de_pagamento`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'tomas turbano pinto', '2001-06-19', '12345678912', '12345678909', 'rua da mentira', 12222, 10, '2022-06-14 18:44:12', '2022-06-14 18:44:12', '2022-06-14 18:44:12');

-- --------------------------------------------------------

--
-- Estrutura da tabela `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(1, '2022-06-14-110250', 'App\\Database\\Migrations\\Produtos', 'default', 'App', 1655205822, 1),
(2, '2022-06-14-135235', 'App\\Database\\Migrations\\Clientes', 'default', 'App', 1655215184, 2),
(3, '2022-06-14-135235', 'App\\Database\\Migrations\\Produtos', 'default', 'App', 1655216520, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `id_produto` int(9) NOT NULL,
  `nome` varchar(128) NOT NULL,
  `descricao` text NOT NULL,
  `valor_de_compra` double NOT NULL,
  `valor_de_venda` double NOT NULL,
  `quantidade` int(11) NOT NULL,
  `validade` date NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`id_produto`, `nome`, `descricao`, `valor_de_compra`, `valor_de_venda`, `quantidade`, `validade`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Notebook', 'Descricao do produto', 1299.9, 1599.9, 9, '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'Notebook', 'Descricao do produto', 1299.9, 1599.9, 9, '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'Produto Teste', 'Produto Novo', 199, 300, 10, '0000-00-00', '2022-06-14 08:40:39', '2022-06-14 08:40:39', '0000-00-00 00:00:00'),
(4, 'Produto2 Teste', 'Produto Novo', 199, 300, 10, '0000-00-00', '2022-06-14 08:40:40', '2022-06-14 08:45:28', '0000-00-00 00:00:00'),
(5, 'Produto Teste', 'Produto Novo', 199, 300, 10, '0000-00-00', '2022-06-14 08:40:41', '2022-06-14 08:40:41', '0000-00-00 00:00:00'),
(6, 'Produto Teste', 'Produto Novo', 199, 300, 10, '0000-00-00', '2022-06-14 08:41:14', '2022-06-14 08:41:14', '0000-00-00 00:00:00');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Índices para tabela `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id_produto`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id_produto` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Banco de dados: `examples_database`
--
CREATE DATABASE IF NOT EXISTS `examples_database` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `examples_database`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionarios`
--

CREATE TABLE `funcionarios` (
  `id_funcionario` int(9) NOT NULL,
  `nome_completo` varchar(128) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `funcao` varchar(28) NOT NULL,
  `tipo_de_contrato` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `funcionarios`
--

INSERT INTO `funcionarios` (`id_funcionario`, `nome_completo`, `cpf`, `funcao`, `tipo_de_contrato`) VALUES
(4, 'Cleiton Reichardt', '10100120202', 'Programador', 'CLT');

-- --------------------------------------------------------

--
-- Estrutura da tabela `logins`
--

CREATE TABLE `logins` (
  `id_login` int(9) NOT NULL,
  `usuario` varchar(128) NOT NULL,
  `senha` varchar(128) NOT NULL,
  `nome` varchar(128) NOT NULL,
  `sobrenome` varchar(128) NOT NULL,
  `email` varchar(28) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `logins`
--

INSERT INTO `logins` (`id_login`, `usuario`, `senha`, `nome`, `sobrenome`, `email`) VALUES
(1, 'admin', '3171c55343c3991c0387c2f688c3da36', 'Guilherme', 'Scholl', 'guilherme@drcriativo.com.br'),
(33, 'Guilherme', 'd41d8cd98f00b204e9800998ecf8427e', 'Guilherme', 'Scholl', 'guilherme@gmail.com.br');

-- --------------------------------------------------------

--
-- Estrutura da tabela `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(1, '2022-06-30-171214', 'App\\Database\\Migrations\\Login', 'default', 'App', 1656609464, 1),
(2, '2022-07-04-192010', 'App\\Database\\Migrations\\Permissoes', 'default', 'App', 1657225455, 2),
(3, '2022-07-06-193248', 'App\\Database\\Migrations\\Locais', 'default', 'App', 1657225455, 2),
(4, '2022-07-07-190914', 'App\\Database\\Migrations\\Funcionarios', 'default', 'App', 1657225455, 2),
(5, '2022-07-14-130435', 'App\\Database\\Migrations\\Servidor', 'default', 'App', 1657804488, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `servidor`
--

CREATE TABLE `servidor` (
  `id_servidor` int(9) NOT NULL,
  `servidor` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `porta` int(9) NOT NULL,
  `senha` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `servidor`
--

INSERT INTO `servidor` (`id_servidor`, `servidor`, `email`, `porta`, `senha`) VALUES
(1, 'smtp.drcriativo.com.br', 'naoresponda@drcriativo.com.br', 465, 'Xi98Gfg8#2021');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD PRIMARY KEY (`id_funcionario`);

--
-- Índices para tabela `logins`
--
ALTER TABLE `logins`
  ADD PRIMARY KEY (`id_login`) USING BTREE;

--
-- Índices para tabela `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `servidor`
--
ALTER TABLE `servidor`
  ADD PRIMARY KEY (`id_servidor`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  MODIFY `id_funcionario` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `logins`
--
ALTER TABLE `logins`
  MODIFY `id_login` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de tabela `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `servidor`
--
ALTER TABLE `servidor`
  MODIFY `id_servidor` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Banco de dados: `marlos`
--
CREATE DATABASE IF NOT EXISTS `marlos` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `marlos`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `acessos`
--

CREATE TABLE `acessos` (
  `id_acesso` int(9) NOT NULL,
  `nome_acesso` varchar(128) DEFAULT NULL,
  `url_acesso` varchar(128) DEFAULT NULL,
  `icone_acesso` varchar(28) DEFAULT NULL,
  `pai_acesso` int(9) DEFAULT NULL,
  `ordem_acesso` int(9) DEFAULT NULL,
  `status_acesso` tinyint(1) DEFAULT NULL,
  `adm_acesso` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `acessos`
--

INSERT INTO `acessos` (`id_acesso`, `nome_acesso`, `url_acesso`, `icone_acesso`, `pai_acesso`, `ordem_acesso`, `status_acesso`, `adm_acesso`) VALUES
(40, 'Perfil', 'perfil/usuario', 'fa fa-user', 45, 2, 1, 1),
(41, 'Usuários', 'usuario/logins', 'fa fa-users', 45, 1, 1, 1),
(42, 'Acessos', 'gerencia/acessos', 'fa fa-lock', 45, 4, 1, 1),
(43, 'Inicio', 'inicio/', 'fa fa-home', NULL, 1, 1, 1),
(45, 'Configurações', '#', 'fa fa-gear', NULL, 3, 1, 1),
(46, 'Criação de conteúdo', '#', 'fa fa-chart-line', NULL, 3, 1, 1),
(48, 'Notícias', 'conteudo/noticias', 'fa fa-newspaper', 46, 2, 1, 1),
(49, 'Banner', 'banner/', 'fa fa-image', 46, 1, 1, 1),
(50, 'Linha do Tempo', 'conteudo/quem-somos', 'fa fa-landmark', 46, 5, 1, 1),
(51, 'Serviços', 'conteudo/servicos', 'fa fa-box-open', 46, 5, 1, 1),
(52, 'Indicadores', 'conteudo/indicadores', 'fa fa-arrow-up-9-1', 46, 3, 1, 1),
(53, 'Galeria de Fotos', 'conteudo/galeria', 'fa fa-image', 46, 7, 1, 1),
(54, 'Contato', 'conteudo/rede-social', 'fa fa-phone', NULL, 3, 1, 1),
(55, 'Redes Sociais', 'conteudo/rede-social', 'fa fa-instagram', 54, 1, 1, 1),
(56, 'Servidor de E-mail', 'conteudo/email', 'fa fa-envelope', 54, 2, 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `banners_home`
--

CREATE TABLE `banners_home` (
  `id_banner` int(11) NOT NULL,
  `url_banner` varchar(128) DEFAULT NULL,
  `titulo_banner` varchar(56) DEFAULT NULL,
  `ordem_banner` int(11) DEFAULT NULL,
  `link_redirecionamento_banner` varchar(128) DEFAULT NULL,
  `texto_botao_banner` varchar(28) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `banners_home`
--

INSERT INTO `banners_home` (`id_banner`, `url_banner`, `titulo_banner`, `ordem_banner`, `link_redirecionamento_banner`, `texto_botao_banner`) VALUES
(1, '2-7b506.png', 'Passe no concurso que tanto deseja!', 1, 'https://drcriativo.com.br/', 'Saiba Mais!'),
(2, '1.png', 'Receba as nossas Mentorias de forma online', 1, 'https://drcriativo.com.br/', 'Saiba Mais!');

-- --------------------------------------------------------

--
-- Estrutura da tabela `galeria`
--

CREATE TABLE `galeria` (
  `id_foto` int(11) NOT NULL,
  `url_foto` varchar(256) DEFAULT NULL,
  `ativa_foto` tinyint(1) DEFAULT NULL,
  `ordem_foto` int(11) DEFAULT NULL,
  `titulo_foto` varchar(128) DEFAULT NULL,
  `tipo` int(9) DEFAULT NULL,
  `url_video` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `galeria`
--

INSERT INTO `galeria` (`id_foto`, `url_foto`, `ativa_foto`, `ordem_foto`, `titulo_foto`, `tipo`, `url_video`) VALUES
(1, '10175321272004-1d62d.jpg', 1, 1, 'Teste', 2, ''),
(2, 'design-7e5cb.jpg', 1, 2, 'Teste', 2, ''),
(3, '10175338553005-8d281.jpg', 1, 3, 'Teste', 2, ''),
(4, NULL, 1, 1, 'Teste', 1, 'https://www.youtube.com/watch?v=emihl1ntHLw');

-- --------------------------------------------------------

--
-- Estrutura da tabela `indicadores`
--

CREATE TABLE `indicadores` (
  `id_indicador` int(11) NOT NULL,
  `nome_indicador` varchar(28) DEFAULT NULL,
  `numero_indicador` varchar(12) DEFAULT NULL,
  `ordem_indicador` int(11) DEFAULT NULL,
  `icone_indicador` varchar(28) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `indicadores`
--

INSERT INTO `indicadores` (`id_indicador`, `nome_indicador`, `numero_indicador`, `ordem_indicador`, `icone_indicador`) VALUES
(1, 'Alunos', '2000', 1, 'fa fa-users'),
(3, 'Aprovações', '1567', 3, 'fa fa-check');

-- --------------------------------------------------------

--
-- Estrutura da tabela `linha_tempo_empresa`
--

CREATE TABLE `linha_tempo_empresa` (
  `id_linha_tempo` int(11) NOT NULL,
  `ano_linha_tempo` int(11) DEFAULT NULL,
  `titulo_linha_tempo` varchar(28) DEFAULT NULL,
  `descricao_linha_tempo` varchar(128) DEFAULT NULL,
  `url_linha_tempo` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `linha_tempo_empresa`
--

INSERT INTO `linha_tempo_empresa` (`id_linha_tempo`, `ano_linha_tempo`, `titulo_linha_tempo`, `descricao_linha_tempo`, `url_linha_tempo`) VALUES
(2, 1292, 'Expansão para outras regiões', 'A Dr. Criativo, nasceu em meados de 2018 no melhor estilo Home Office, fundada por David Weingartner, profissional com 20 anos d', '10175321272004.jpg'),
(3, 2018, 'Criação da Empresa', 'A Dr. Criativo, nasceu em meados de 2018 no melhor estilo Home Office, fundada por David Weingartner, profissional com 20 anos d', '4.png');

-- --------------------------------------------------------

--
-- Estrutura da tabela `midia_noticia`
--

CREATE TABLE `midia_noticia` (
  `id_midia_noticia` int(11) NOT NULL,
  `url_midia_noticia` varchar(128) DEFAULT NULL,
  `titulo_midia_noticia` varchar(56) DEFAULT NULL,
  `id_noticia` int(11) DEFAULT NULL,
  `capa_midia_noticia` tinyint(1) DEFAULT 0,
  `ordem_midia_noticia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `midia_noticia`
--

INSERT INTO `midia_noticia` (`id_midia_noticia`, `url_midia_noticia`, `titulo_midia_noticia`, `id_noticia`, `capa_midia_noticia`, `ordem_midia_noticia`) VALUES
(1, '10175321272004-16d7d.jpg', 'Qual a importância de ser mentorado para concursos', 1, 1, 2),
(2, 'design-e769d.jpg', 'teste da bola2', 1, 0, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `noticias`
--

CREATE TABLE `noticias` (
  `id_noticia` int(11) NOT NULL,
  `titulo_noticia` varchar(56) DEFAULT NULL,
  `conteudo_noticia` varchar(256) DEFAULT NULL,
  `tags_noticia` varchar(128) DEFAULT NULL,
  `data_noticia` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `noticias`
--

INSERT INTO `noticias` (`id_noticia`, `titulo_noticia`, `conteudo_noticia`, `tags_noticia`, `data_noticia`) VALUES
(1, 'teste', 'teste', 'teste', '2022-11-30 12:13:56');

-- --------------------------------------------------------

--
-- Estrutura da tabela `perfil`
--

CREATE TABLE `perfil` (
  `id_perfil` int(9) NOT NULL,
  `nome_perfil` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `perfil`
--

INSERT INTO `perfil` (`id_perfil`, `nome_perfil`) VALUES
(1, '0'),
(3, 'Usuario'),
(4, 'Admin');

-- --------------------------------------------------------

--
-- Estrutura da tabela `permissoes`
--

CREATE TABLE `permissoes` (
  `id_permissao` int(11) DEFAULT NULL,
  `id_perfil` int(11) DEFAULT NULL,
  `id_acesso` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `redes_sociais`
--

CREATE TABLE `redes_sociais` (
  `id_rede` int(11) NOT NULL,
  `nome_rede` varchar(56) DEFAULT NULL,
  `link_rede` varchar(512) DEFAULT NULL,
  `icon_rede` varchar(128) DEFAULT NULL,
  `rede_ativa` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `redes_sociais`
--

INSERT INTO `redes_sociais` (`id_rede`, `nome_rede`, `link_rede`, `icon_rede`, `rede_ativa`) VALUES
(1, 'Tik Tok', 'teste', 'fab fa-tiktok', 1),
(2, 'whatsapp', '4999543136', 'fa fa-whatsapp', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `servicos`
--

CREATE TABLE `servicos` (
  `id_servico` int(11) NOT NULL,
  `titulo_servico` varchar(128) DEFAULT NULL,
  `descricao_servico` varchar(1024) DEFAULT NULL,
  `icone_servico` varchar(28) DEFAULT NULL,
  `url_foto_servico` varchar(128) DEFAULT NULL,
  `ordem_servico` timestamp(6) NULL DEFAULT NULL,
  `descricao_completa_servico` varchar(2048) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `servicos`
--

INSERT INTO `servicos` (`id_servico`, `titulo_servico`, `descricao_servico`, `icone_servico`, `url_foto_servico`, `ordem_servico`, `descricao_completa_servico`) VALUES
(4, 'Turma Concurso Epagri', '<p>Turma&nbsp;Concurso&nbsp;Epagri</p><p>Ser&aacute;&nbsp;um&nbsp;acompanhamento</p><p>at&eacute;&nbsp;a&nbsp;data&nbsp;da&nbsp;prova.</p><p>O&nbsp;que&nbsp;voc&ecirc;&nbsp;ir&aacute;&nbsp;receber:</p><p>✅&nbsp;Planejamento&nbsp;de&nbsp;estudos<br />✅&nbsp;Controle&nbsp;de&nbsp;conte&uacute;do<br />✅&nbsp;Videoaulas<br />✅&nbsp;Aulas&nbsp;Ao&nbsp;vivo<br />✅&nbsp;Simulados<br />✅&nbsp;Caderno&nbsp;Quest&otilde;es<br />✅&nbsp;Planilha&nbsp;de&nbsp;desempenho<br />✅&nbsp;Apostilas<br />✅&nbsp;Quest&otilde;es&nbsp;comentadas</p><p>O&nbsp;investimento&nbsp;&eacute;&nbsp;de&nbsp;R$&nbsp;349,90</p><p>pode&nbsp;ser&nbsp;feito&nbsp;por&nbsp;pix&nbsp;ou</p><p>podendo&nbsp;parcelar&nbsp;em&nbsp;at&eacute;&nbsp;12x&nbsp;no&nbsp;cart&atilde;o.</p>', 'fa fa-check', '4.png', '2022-11-30 17:45:29.000000', '<p style=\"text-align:justify\">Turma&nbsp;Concurso&nbsp;Epagri&nbsp;Ser&aacute;&nbsp;um&nbsp;acompanhamento&nbsp;at&eacute;&nbsp;a&nbsp;data&nbsp;da&nbsp;prova.O&nbsp;que&nbsp;voc&ecirc;&nbsp;ir&aacute;&nbsp;receber:</p><p style=\"text-align:justify\">✅&nbsp;Planejamento&nbsp;de&nbsp;estudos<br />✅&nbsp;Controle&nbsp;de&nbsp;conte&uacute;do<br />✅&nbsp;Videoaulas<br />✅&nbsp;Aulas&nbsp;Ao&nbsp;vivo<br />✅&nbsp;Simulados<br />✅&nbsp;Caderno&nbsp;Quest&otilde;es<br />✅&nbsp;Planilha&nbsp;de&nbsp;desempenho<br />✅&nbsp;Apostilas<br />✅&nbsp;Quest&otilde;es&nbsp;comentadas</p><p style=\"text-align:justify\">O&nbsp;investimento&nbsp;&eacute;&nbsp;de&nbsp;R$&nbsp;349,90&nbsp;pode&nbsp;ser&nbsp;feito&nbsp;por&nbsp;pix&nbsp;ou&nbsp;podendo&nbsp;parcelar&nbsp;em&nbsp;at&eacute;&nbsp;12x&nbsp;no&nbsp;cart&atilde;o.</p>'),
(5, 'Turma Concurso Capinzal', '<p>Ser&aacute;&nbsp;um&nbsp;acompanhamento&nbsp;</p><p>at&eacute;&nbsp;a&nbsp;data&nbsp;da&nbsp;prova</p><p>O&nbsp;que&nbsp;voc&ecirc;&nbsp;ir&aacute;&nbsp;receber:</p><p>✅&nbsp;Planejamento&nbsp;de&nbsp;estudos<br />✅&nbsp;Controle&nbsp;de&nbsp;conte&uacute;do<br />✅&nbsp;Videoaulas<br />✅&nbsp;Aulas&nbsp;Ao&nbsp;vivo<br />✅&nbsp;Simulados<br />✅&nbsp;Caderno&nbsp;Quest&otilde;es<br />✅&nbsp;Planilha&nbsp;de&nbsp;desempenho<br />✅&nbsp;Apostilas<br />✅&nbsp;Quest&otilde;es&nbsp;comentadas</p><p>O&nbsp;investimento&nbsp;&eacute;&nbsp;de&nbsp;R$&nbsp;349,90</p><p>pode&nbsp;ser&nbsp;feito&nbsp;por&nbsp;pix&nbsp;ou</p><p>podendo&nbsp;parcelar&nbsp;em&nbsp;at&eacute;&nbsp;12x&nbsp;no&nbsp;cart&atilde;o.</p>', 'fa fa-check', '2.png', '2022-12-05 03:00:00.000000', '<p style=\"text-align:justify\">Turma&nbsp;Concurso&nbsp;Epagri&nbsp;Ser&aacute;&nbsp;um&nbsp;acompanhamento&nbsp;at&eacute;&nbsp;a&nbsp;data&nbsp;da&nbsp;prova.O&nbsp;que&nbsp;voc&ecirc;&nbsp;ir&aacute;&nbsp;receber:</p><p style=\"text-align:justify\">✅&nbsp;Planejamento&nbsp;de&nbsp;estudos<br />✅&nbsp;Controle&nbsp;de&nbsp;conte&uacute;do<br />✅&nbsp;Videoaulas<br />✅&nbsp;Aulas&nbsp;Ao&nbsp;vivo<br />✅&nbsp;Simulados<br />✅&nbsp;Caderno&nbsp;Quest&otilde;es<br />✅&nbsp;Planilha&nbsp;de&nbsp;desempenho<br />✅&nbsp;Apostilas<br />✅&nbsp;Quest&otilde;es&nbsp;comentadas</p><p style=\"text-align:justify\">O&nbsp;investimento&nbsp;&eacute;&nbsp;de&nbsp;R$&nbsp;349,90&nbsp;pode&nbsp;ser&nbsp;feito&nbsp;por&nbsp;pix&nbsp;ou&nbsp;podendo&nbsp;parcelar&nbsp;em&nbsp;at&eacute;&nbsp;12x&nbsp;no&nbsp;cart&atilde;o.</p>'),
(6, 'Turma Concurso Balneário Camboriú', '<p>Ser&aacute;&nbsp;um&nbsp;acompanhamento</p><p>&nbsp;at&eacute;&nbsp;a&nbsp;data&nbsp;da&nbsp;prova</p><p>O&nbsp;que&nbsp;voc&ecirc;&nbsp;ir&aacute;&nbsp;receber:</p><p>✅&nbsp;Planejamento&nbsp;de&nbsp;estudos<br />✅&nbsp;Controle&nbsp;de&nbsp;conte&uacute;do<br />✅&nbsp;Videoaulas<br />✅&nbsp;Aulas&nbsp;Ao&nbsp;vivo<br />✅&nbsp;Simulados<br />✅&nbsp;Caderno&nbsp;Quest&otilde;es<br />✅&nbsp;Planilha&nbsp;de&nbsp;desempenho<br />✅&nbsp;Apostilas<br />✅&nbsp;Quest&otilde;es&nbsp;comentadas</p><p>O&nbsp;investimento&nbsp;&eacute;&nbsp;de&nbsp;R$&nbsp;349,90</p><p>pode&nbsp;ser&nbsp;feito&nbsp;por&nbsp;pix&nbsp;ou</p><p>podendo&nbsp;parcelar&nbsp;em&nbsp;at&eacute;&nbsp;12x&nbsp;no&nbsp;cart&atilde;o</p>', 'fa fa-check', '1.png', '2022-09-28 03:00:00.000000', '<p style=\"text-align:justify\">Turma&nbsp;Concurso&nbsp;Epagri&nbsp;Ser&aacute;&nbsp;um&nbsp;acompanhamento&nbsp;at&eacute;&nbsp;a&nbsp;data&nbsp;da&nbsp;prova.O&nbsp;que&nbsp;voc&ecirc;&nbsp;ir&aacute;&nbsp;receber:</p><p style=\"text-align:justify\">✅&nbsp;Planejamento&nbsp;de&nbsp;estudos<br />✅&nbsp;Controle&nbsp;de&nbsp;conte&uacute;do<br />✅&nbsp;Videoaulas<br />✅&nbsp;Aulas&nbsp;Ao&nbsp;vivo<br />✅&nbsp;Simulados<br />✅&nbsp;Caderno&nbsp;Quest&otilde;es<br />✅&nbsp;Planilha&nbsp;de&nbsp;desempenho<br />✅&nbsp;Apostilas<br />✅&nbsp;Quest&otilde;es&nbsp;comentadas</p><p style=\"text-align:justify\">O&nbsp;investimento&nbsp;&eacute;&nbsp;de&nbsp;R$&nbsp;349,90&nbsp;pode&nbsp;ser&nbsp;feito&nbsp;por&nbsp;pix&nbsp;ou&nbsp;podendo&nbsp;parcelar&nbsp;em&nbsp;at&eacute;&nbsp;12x&nbsp;no&nbsp;cart&atilde;o.</p>'),
(7, 'Turma Concurso Videira', '<p>Ser&aacute;&nbsp;um&nbsp;acompanhamento&nbsp;</p><p>at&eacute;&nbsp;a&nbsp;data&nbsp;da&nbsp;prova</p><p>O&nbsp;que&nbsp;voc&ecirc;&nbsp;ir&aacute;&nbsp;receber:</p><p>✅&nbsp;Planejamento&nbsp;de&nbsp;estudos<br />✅&nbsp;Controle&nbsp;de&nbsp;conte&uacute;do<br />✅&nbsp;Videoaulas<br />✅&nbsp;Aulas&nbsp;Ao&nbsp;vivo<br />✅&nbsp;Simulados<br />✅&nbsp;Caderno&nbsp;Quest&otilde;es<br />✅&nbsp;Planilha&nbsp;de&nbsp;desempenho<br />✅&nbsp;Apostilas<br />✅&nbsp;Quest&otilde;es&nbsp;comentadas</p><p>O&nbsp;investimento&nbsp;&eacute;&nbsp;de&nbsp;R$&nbsp;349,90</p><p>pode&nbsp;ser&nbsp;feito&nbsp;por&nbsp;pix&nbsp;ou</p><p>podendo&nbsp;parcelar&nbsp;em&nbsp;at&eacute;&nbsp;12x&nbsp;no&nbsp;cart&atilde;o.</p>', 'fa fa-check', '3.png', '2022-12-23 03:00:00.000000', '<p style=\"text-align:justify\">Turma&nbsp;Concurso&nbsp;Epagri&nbsp;Ser&aacute;&nbsp;um&nbsp;acompanhamento&nbsp;at&eacute;&nbsp;a&nbsp;data&nbsp;da&nbsp;prova.O&nbsp;que&nbsp;voc&ecirc;&nbsp;ir&aacute;&nbsp;receber:</p><p style=\"text-align:justify\">✅&nbsp;Planejamento&nbsp;de&nbsp;estudos<br />✅&nbsp;Controle&nbsp;de&nbsp;conte&uacute;do<br />✅&nbsp;Videoaulas<br />✅&nbsp;Aulas&nbsp;Ao&nbsp;vivo<br />✅&nbsp;Simulados<br />✅&nbsp;Caderno&nbsp;Quest&otilde;es<br />✅&nbsp;Planilha&nbsp;de&nbsp;desempenho<br />✅&nbsp;Apostilas<br />✅&nbsp;Quest&otilde;es&nbsp;comentadas</p><p style=\"text-align:justify\">O&nbsp;investimento&nbsp;&eacute;&nbsp;de&nbsp;R$&nbsp;349,90&nbsp;pode&nbsp;ser&nbsp;feito&nbsp;por&nbsp;pix&nbsp;ou&nbsp;podendo&nbsp;parcelar&nbsp;em&nbsp;at&eacute;&nbsp;12x&nbsp;no&nbsp;cart&atilde;o.</p>');

-- --------------------------------------------------------

--
-- Estrutura da tabela `servidor_email`
--

CREATE TABLE `servidor_email` (
  `id_servidor` int(11) NOT NULL,
  `criptografia_servidor` varchar(28) DEFAULT NULL,
  `host_servidor` varchar(256) NOT NULL,
  `usuario_servidor` varchar(256) DEFAULT NULL,
  `senha_servidor` varchar(256) DEFAULT NULL,
  `porta_servidor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `servidor_email`
--

INSERT INTO `servidor_email` (`id_servidor`, `criptografia_servidor`, `host_servidor`, `usuario_servidor`, `senha_servidor`, `porta_servidor`) VALUES
(1, 'ssl', 'smtp.drcriativo.com.br', 'naoresponda@drcriativo.com.br', 'Xi98Gfg8#2022', 465);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(9) NOT NULL,
  `id_perfil` int(9) NOT NULL,
  `nome_usuario` varchar(128) NOT NULL,
  `mail_usuario` varchar(128) NOT NULL,
  `senha_usuario` varchar(128) NOT NULL,
  `status_usuario` tinyint(1) NOT NULL,
  `token_valida_senha` int(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `id_perfil`, `nome_usuario`, `mail_usuario`, `senha_usuario`, `status_usuario`, `token_valida_senha`) VALUES
(1, 3, 'Guilherme Scholl', 'guilherme@drcriativo.com.br', '3171c55343c3991c0387c2f688c3da36', 1, NULL),
(5, 4, 'Guilherme Scholl', 'guilhermescholl99@gmail.com', '3171c55343c3991c0387c2f688c3da36', 1, NULL);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `acessos`
--
ALTER TABLE `acessos`
  ADD PRIMARY KEY (`id_acesso`);

--
-- Índices para tabela `banners_home`
--
ALTER TABLE `banners_home`
  ADD PRIMARY KEY (`id_banner`);

--
-- Índices para tabela `galeria`
--
ALTER TABLE `galeria`
  ADD PRIMARY KEY (`id_foto`);

--
-- Índices para tabela `indicadores`
--
ALTER TABLE `indicadores`
  ADD PRIMARY KEY (`id_indicador`);

--
-- Índices para tabela `linha_tempo_empresa`
--
ALTER TABLE `linha_tempo_empresa`
  ADD PRIMARY KEY (`id_linha_tempo`);

--
-- Índices para tabela `midia_noticia`
--
ALTER TABLE `midia_noticia`
  ADD PRIMARY KEY (`id_midia_noticia`),
  ADD KEY `midia_noticia_ibfk_1` (`id_noticia`);

--
-- Índices para tabela `noticias`
--
ALTER TABLE `noticias`
  ADD PRIMARY KEY (`id_noticia`);

--
-- Índices para tabela `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`id_perfil`);

--
-- Índices para tabela `permissoes`
--
ALTER TABLE `permissoes`
  ADD KEY `perfil_foreign_key` (`id_perfil`),
  ADD KEY `acessos_foreign_key` (`id_acesso`);

--
-- Índices para tabela `redes_sociais`
--
ALTER TABLE `redes_sociais`
  ADD PRIMARY KEY (`id_rede`);

--
-- Índices para tabela `servicos`
--
ALTER TABLE `servicos`
  ADD PRIMARY KEY (`id_servico`);

--
-- Índices para tabela `servidor_email`
--
ALTER TABLE `servidor_email`
  ADD PRIMARY KEY (`id_servidor`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `id_perfil` (`id_perfil`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `acessos`
--
ALTER TABLE `acessos`
  MODIFY `id_acesso` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT de tabela `banners_home`
--
ALTER TABLE `banners_home`
  MODIFY `id_banner` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `galeria`
--
ALTER TABLE `galeria`
  MODIFY `id_foto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `indicadores`
--
ALTER TABLE `indicadores`
  MODIFY `id_indicador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `linha_tempo_empresa`
--
ALTER TABLE `linha_tempo_empresa`
  MODIFY `id_linha_tempo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `midia_noticia`
--
ALTER TABLE `midia_noticia`
  MODIFY `id_midia_noticia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `perfil`
--
ALTER TABLE `perfil`
  MODIFY `id_perfil` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `redes_sociais`
--
ALTER TABLE `redes_sociais`
  MODIFY `id_rede` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `servicos`
--
ALTER TABLE `servicos`
  MODIFY `id_servico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `servidor_email`
--
ALTER TABLE `servidor_email`
  MODIFY `id_servidor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `midia_noticia`
--
ALTER TABLE `midia_noticia`
  ADD CONSTRAINT `midia_noticia_ibfk_1` FOREIGN KEY (`id_noticia`) REFERENCES `noticias` (`id_noticia`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `permissoes`
--
ALTER TABLE `permissoes`
  ADD CONSTRAINT `acessos_foreign_key` FOREIGN KEY (`id_acesso`) REFERENCES `acessos` (`id_acesso`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `perfil_foreign_key` FOREIGN KEY (`id_perfil`) REFERENCES `perfil` (`id_perfil`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_perfil`) REFERENCES `perfil` (`id_perfil`);
--
-- Banco de dados: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin DEFAULT NULL,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Extraindo dados da tabela `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"relation_lines\":\"true\",\"snap_to_grid\":\"off\",\"angular_direct\":\"direct\"}');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- Extraindo dados da tabela `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'root', 'table', 'depoimentos', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"allrows\":\"1\",\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@TABLE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"estructura da tabela @TABLE@\",\"latex_structure_continued_caption\":\"estructura da tabela @TABLE@ (continuação)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Conteúdo da tabela @TABLE@\",\"latex_data_continued_caption\":\"Conteúdo da tabela @TABLE@ (continuação)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_simple_view_export\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_procedure_function\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Extraindo dados da tabela `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"projetojava\",\"table\":\"produtos_venda\"},{\"db\":\"projetojava\",\"table\":\"usuario\"},{\"db\":\"projetojava\",\"table\":\"cliente\"},{\"db\":\"projetojava\",\"table\":\"venda\"},{\"db\":\"projetojava\",\"table\":\"cupom\"},{\"db\":\"projetojava\",\"table\":\"produto\"},{\"db\":\"universidade\",\"table\":\"historico\"},{\"db\":\"sincol\",\"table\":\"banner\"},{\"db\":\"sincol\",\"table\":\"parceiro_categoria\"},{\"db\":\"universidade\",\"table\":\"alunos\"}]');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

--
-- Extraindo dados da tabela `pma__table_info`
--

INSERT INTO `pma__table_info` (`db_name`, `table_name`, `display_field`) VALUES
('marlos', 'midia_noticia', 'url_midia_noticia'),
('professormarlos', 'servicos', 'titulo_servico'),
('professormarlos', 'vendas', 'status');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Extraindo dados da tabela `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'marlos', 'noticias', '{\"sorted_col\":\"`noticias`.`data_notica` ASC\"}', '2022-11-29 19:36:37'),
('root', 'marlos', 'permissoes', '{\"sorted_col\":\"`permissoes`.`id_acesso` ASC\"}', '2022-11-29 20:07:59'),
('root', 'picoloto', 'servicos', '{\"sorted_col\":\"`servicos`.`ser_id` ASC\"}', '2022-09-13 18:23:16'),
('root', 'sincol', 'menu', '{\"sorted_col\":\"`menu`.`mnu_id` DESC\"}', '2022-08-05 19:40:13'),
('root', 'sincol', 'noticia', '{\"sorted_col\":\"`noticia`.`not_status` ASC\"}', '2022-08-05 19:55:42'),
('root', 'universidade', 'historico', '{\"sorted_col\":\"`historico`.`frequencia` DESC\"}', '2023-05-16 17:30:10');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin DEFAULT NULL,
  `data_sql` longtext COLLATE utf8_bin DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Extraindo dados da tabela `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2023-06-22 11:19:37', '{\"Console\\/Mode\":\"collapse\",\"lang\":\"pt\",\"NavigationWidth\":164}');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Índices para tabela `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Índices para tabela `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Índices para tabela `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Índices para tabela `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Índices para tabela `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Índices para tabela `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Índices para tabela `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Índices para tabela `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Índices para tabela `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Índices para tabela `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Índices para tabela `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Índices para tabela `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Índices para tabela `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Índices para tabela `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Índices para tabela `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Índices para tabela `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Índices para tabela `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Banco de dados: `picoloto`
--
CREATE DATABASE IF NOT EXISTS `picoloto` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `picoloto`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `banner`
--

CREATE TABLE `banner` (
  `ban_id` bigint(20) NOT NULL,
  `ban_img` varchar(256) DEFAULT NULL,
  `ban_imgsm` varchar(256) NOT NULL,
  `ban_titulo` varchar(180) NOT NULL,
  `ban_descricao` text NOT NULL,
  `ban_link` varchar(256) NOT NULL,
  `ban_exibir` tinyint(1) NOT NULL DEFAULT 0,
  `ban_status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `banner`
--

INSERT INTO `banner` (`ban_id`, `ban_img`, `ban_imgsm`, `ban_titulo`, `ban_descricao`, `ban_link`, `ban_exibir`, `ban_status`) VALUES
(9, '518a2-sem-nome-1820-582-px-.png', '', 'Maquinas robustas, aliadas a grandes resultados!|||Robust machines, combined with great results!|||Máquinas robustas, combinadas con grandes resultados!', 'Confira!|||\r\nsee more!|||\r\nvea!', 'produtos/produtos/102/secador', 1, 1),
(16, '766d5-sem-nome-1820-582-px-.png', '', 'Somos uma Empresa Credenciada!|||We are a Credentialed Company!|||¡Somos una Empresa Acreditada!', '', '', 1, 1),
(17, '71c63-sem-nome-1820-582-px-.png', '', 'Qualidade e Soluções inteligentes!|||Quality and Smart Solutions!|||¡Calidad y Soluciones Inteligentes!', '', '', 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `depoimentos`
--

CREATE TABLE `depoimentos` (
  `dep_id` int(11) NOT NULL,
  `dep_titulo` varchar(128) NOT NULL,
  `dep_url` varchar(128) NOT NULL,
  `dep_desc` text NOT NULL,
  `dep_status` tinyint(1) NOT NULL,
  `dep_datahora` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `depoimentos`
--

INSERT INTO `depoimentos` (`dep_id`, `dep_titulo`, `dep_url`, `dep_desc`, `dep_status`, `dep_datahora`) VALUES
(6, 'Auto Coletivo', '7ad1e-auto-coletivo-cacador.jpg', '<p>Amplo e moderno, o parque industrial da Sincol tem mais de 55.000 m&sup2; de &aacute;rea constru&iacute;da e disp&otilde;e da mais alta tecnologia do setor madeireiro. ||| Sincol has a large and modern industrial park, with more than 55,000 m&sup2; of built area. ||| Sincol cuenta con un amplio y moderno parque industrial, con m&aacute;s de 55.000 m&sup2; de &aacute;rea construida.&nbsp;</p>', 1, 0),
(7, 'Adami', '46a84-adami.jpg', '<p>Amplo e moderno, o parque industrial da Sincol tem mais de 55.000 m&sup2; de &aacute;rea constru&iacute;da e disp&otilde;e da mais alta tecnologia do setor madeireiro. ||| Sincol has a large and modern industrial park, with more than 55,000 m&sup2; of built area. ||| Sincol cuenta con un amplio y moderno parque industrial, con m&aacute;s de 55.000 m&sup2; de &aacute;rea construida.&nbsp;</p>', 1, 0),
(8, 'Brasilft', '8bff1-braslift.jpg', '<p>Amplo e moderno, o parque industrial da Sincol tem mais de 55.000 m&sup2; de &aacute;rea constru&iacute;da e disp&otilde;e da mais alta tecnologia do setor madeireiro. ||| Sincol has a large and modern industrial park, with more than 55,000 m&sup2; of built area. ||| Sincol cuenta con un amplio y moderno parque industrial, con m&aacute;s de 55.000 m&sup2; de &aacute;rea construida.&nbsp;</p>', 1, 0),
(10, 'Celplac', '7b1b1-celplac.jpg', '<p>asdasdasd</p>', 1, 0),
(11, 'Compensa', '5bf86-compensa.jpg', '', 1, 0),
(12, 'Corfio', '91d74-corfio.jpg', '', 1, 0),
(13, 'Frame', 'dc028-frameport.jpg', '', 1, 0),
(14, 'Arboris', 'd2cac-grupo-arboris.jpg', '', 1, 0),
(15, 'Masavel', '71025-grupo-masavel.jpg', '', 1, 0),
(16, 'Guararapes', '255fa-guararapes.jpg', '', 1, 0),
(17, 'Gwood', '105d9-gwood-brasil.jpg', '', 1, 0),
(18, 'Laminados AB', 'db80c-laminados-ab.jpg', '', 1, 0),
(19, 'Lavrasul', '1c0c7-lavrasul.jpg', '', 1, 0),
(20, 'Malda', '629d2-malda.jpg', '', 1, 0),
(21, 'MaxiPlast', '2afe6-maxiplast.jpg', '', 1, 0),
(22, 'Rotta', 'b511c-narciso-rotta.jpg', '', 1, 0),
(23, 'PalmaSola', '65e5c-palmasola.jpg', '', 1, 0),
(24, 'Placa', '70c89-placa.jpg', '', 1, 0),
(25, 'Rotta Moveis', '7f3f4-rotta-moveis.jpg', '', 1, 0),
(26, 'Sincol', '0dc9f-sincol.jpg', '', 1, 0),
(27, 'Temasa', '06b23-temasa.jpg', '', 1, 0),
(28, 'Tres Irmãos', '308c8-tres-irmaos.jpg', '', 1, 0),
(29, 'Viposa', 'bccf1-viposa.jpg', '', 1, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `estado`
--

CREATE TABLE `estado` (
  `est_id` int(11) NOT NULL,
  `est_nome` varchar(75) DEFAULT NULL,
  `est_uf` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `estado`
--

INSERT INTO `estado` (`est_id`, `est_nome`, `est_uf`) VALUES
(1, 'Acre', 'AC'),
(2, 'Alagoas', 'AL'),
(3, 'Amazonas', 'AM'),
(4, 'Amapá', 'AP'),
(5, 'Bahia', 'BA'),
(6, 'Ceará', 'CE'),
(7, 'Distrito Federal', 'DF'),
(8, 'Espírito Santo', 'ES'),
(9, 'Goiás', 'GO'),
(10, 'Maranhão', 'MA'),
(11, 'Minas Gerais', 'MG'),
(12, 'Mato Grosso do Sul', 'MS'),
(13, 'Mato Grosso', 'MT'),
(14, 'Pará', 'PA'),
(15, 'Paraíba', 'PB'),
(16, 'Pernambuco', 'PE'),
(17, 'Piauí', 'PI'),
(18, 'Paraná', 'PR'),
(19, 'Rio de Janeiro', 'RJ'),
(20, 'Rio Grande do Norte', 'RN'),
(21, 'Rondônia', 'RO'),
(22, 'Roraima', 'RR'),
(23, 'Rio Grande do Sul', 'RS'),
(24, 'Santa Catarina', 'SC'),
(25, 'Sergipe', 'SE'),
(26, 'São Paulo', 'SP'),
(27, 'Tocantins', 'TO');

-- --------------------------------------------------------

--
-- Estrutura da tabela `fotos_produto`
--

CREATE TABLE `fotos_produto` (
  `fot_id` int(11) NOT NULL,
  `prd_id` int(11) DEFAULT NULL,
  `fot_alt_texto` text DEFAULT NULL,
  `fot_titulo` varchar(256) DEFAULT NULL,
  `fot_legenda` varchar(256) DEFAULT NULL,
  `fot_descricao` text DEFAULT NULL,
  `fot_url` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `fotos_produto`
--

INSERT INTO `fotos_produto` (`fot_id`, `prd_id`, `fot_alt_texto`, `fot_titulo`, `fot_legenda`, `fot_descricao`, `fot_url`) VALUES
(130, 102, NULL, 'Secador de lâminas', 'Secador de lâminas', '....', '3ea09-secador-de-laminas.png'),
(131, 102, NULL, 'Secador de lâminas', 'Secador de lâminas', 'secador de laminas', '7d7b4-secador-de-laminas-2.png'),
(132, 103, NULL, 'torno', NULL, 'torno', 'e3182-torno-5td14-1-768x572.png'),
(133, 103, NULL, 'torno', NULL, 'torno', '4bbea-torno-5td14-2-768x452.png'),
(134, 103, NULL, 'torno', NULL, 'torno', 'a2235-torno-5td28-editado.png'),
(135, 104, NULL, 'torno', NULL, 'TORNO ROLETEIRO Série 5TR', '8375e-torno-releteiro-5tr-3.jpeg'),
(136, 104, NULL, 'torno', NULL, 'torno', 'dbc18-torno-roleteiro-1.png'),
(137, 104, NULL, 'torno', NULL, 'torno', '6856f-torno-roleteiro-2-768x576.png'),
(138, 105, NULL, 'arredondador', NULL, 'arredondador', '3785b-5at14-3-editado.png'),
(139, 105, NULL, 'arredondador', NULL, '2', 'd0e05-5at14-4-editado-300x188.png'),
(140, 105, NULL, '3', NULL, '3', 'c3f3b-5at28.png'),
(141, 105, NULL, '4', NULL, '4', '7a345-arredontador-de-toras-5at.jpeg'),
(142, 105, NULL, '5', NULL, '5', '5baa2-arredontador-de-toras-5at-2.jpeg'),
(143, 106, NULL, '1', NULL, '1', '85c71-ec14_clipped_rev_1.png'),
(144, 106, NULL, '2', NULL, '2', '1ef40-entrada-de-toras.png'),
(145, 106, NULL, '3', NULL, '3', '905cd-entrada-de-toras-ec28-ii-editado-1-.png'),
(146, 106, NULL, '4', NULL, '4', '0aaf2-entrada-de-toras-ec28-ii-editado.png'),
(147, 107, NULL, '1', NULL, '1', '9445d-esteira-de-transferencia-de-laminas-1024x768.png'),
(148, 107, NULL, '2', NULL, '2', '139e0-etl14-1_clipped_rev_1-768x412.png'),
(149, 108, NULL, 'unitizador', NULL, 'unitizador', 'dfa96-utinizador-de-toras.png'),
(150, 108, NULL, 'unitizador', NULL, 'unitizador', '426da-unitizador-de-toras-unt.jpeg'),
(151, 108, NULL, 'unitizador', NULL, 'unitizador', '6446b-unitizador-de-toras-unt28-3-1-editado.png'),
(152, 109, NULL, '1', NULL, '1', 'c5c82-transportador-de-correntes.png'),
(153, 110, NULL, '1', NULL, '1', '12ffb-mesa-hidraulica-0.jpeg'),
(154, 110, NULL, '2', NULL, '2', 'a0153-mesa-hidraulica-2.jpeg'),
(155, 110, NULL, '3', NULL, '3', 'b28a1-mesa-elevadora-hidraulica.png'),
(156, 111, NULL, '1', NULL, '1', 'e3d51-guilhotina-gr28-editado.png'),
(157, 111, NULL, '2', NULL, '2', '36b70-guilohitna-gr28-3-editado-768x452.png'),
(158, 111, NULL, '3', NULL, '3', 'aee82-guilhotina-rotativa-gr28-editado-1.png'),
(159, 112, NULL, '1', NULL, '1', 'a3817-sc28-4.png'),
(160, 112, NULL, '2', NULL, '2', '49f2e-sc28-3-768x727.png'),
(161, 113, NULL, '1', NULL, '1', '0c465-alimentador-2_clipped_rev_2.png'),
(162, 113, NULL, '2', NULL, '2', '9a7d5-alimentador-de-laminas-asl60_clipped_rev_2-768x552.png'),
(163, 114, NULL, '1', NULL, '1', '1616c-grt14-2_clipped_rev_1.png'),
(164, 114, NULL, '2', NULL, '2', '10b59-grt14-4_clipped_rev_1.png'),
(165, 114, NULL, '3', NULL, '3', '787ef-grt14-3_clipped_rev_1.png'),
(166, 115, NULL, '1', NULL, '1', '985b9-serra-destopadeira-para-pacotes-sp28_clipped_rev_3.png'),
(167, 116, NULL, '1', NULL, '1', 'd2884-eav14-1_clipped_rev_1.png'),
(168, 116, NULL, '2', NULL, '2', '75708-eav14-3_clipped_rev_1.png');

-- --------------------------------------------------------

--
-- Estrutura da tabela `menu`
--

CREATE TABLE `menu` (
  `mnu_id` bigint(20) NOT NULL,
  `mnu_titulo` varchar(60) DEFAULT NULL,
  `mnu_categoria` varchar(256) DEFAULT NULL,
  `mnu_link` varchar(255) DEFAULT NULL,
  `mnu_icone` varchar(50) NOT NULL,
  `mnu_ordem` int(11) NOT NULL,
  `mnu_pai` int(11) DEFAULT NULL,
  `mnu_status` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `menu`
--

INSERT INTO `menu` (`mnu_id`, `mnu_titulo`, `mnu_categoria`, `mnu_link`, `mnu_icone`, `mnu_ordem`, `mnu_pai`, `mnu_status`) VALUES
(2, 'Usuários', NULL, 'gerUsuario', 'fas fa-users', 2, NULL, 1),
(3, 'Menus', NULL, 'gerMenu', 'fas fa-bars', 1, NULL, 1),
(6, 'Banners', NULL, 'gerBanner', 'fas fa-image', 3, NULL, 1),
(10, 'Notícias', NULL, 'gerNoticia', 'far fa-newspaper', 4, NULL, 1),
(14, 'Ger. Produtos', NULL, '#', 'fas fa-shopping-cart', 11, NULL, 1),
(15, 'Produtos', 'Ger. Produtos', 'gerProduto', 'far fa-circle', 1, 14, 1),
(16, 'Categorias', 'Ger. Produtos', 'gerProduto/categoria', 'far fa-circle', 2, 14, 1),
(17, 'Fotos', 'Ger. Produtos', 'gerProduto/fotos', 'far fa-circle', 3, 14, 1),
(39, 'Parceiros', NULL, 'gerDepoimento', 'fa fa-user', 2, NULL, 1),
(40, 'Ger Serviços', NULL, 'gerServicos', 'fa fa-user', 4, NULL, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `menu_usuario`
--

CREATE TABLE `menu_usuario` (
  `mus_id` int(11) DEFAULT NULL,
  `mnu_id` bigint(20) DEFAULT NULL,
  `usr_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `menu_usuario`
--

INSERT INTO `menu_usuario` (`mus_id`, `mnu_id`, `usr_id`) VALUES
(7, 6, 1),
(8, 3, 1),
(9, 2, 1),
(4, 14, 1),
(5, 10, 1),
(6, 15, 1),
(3, 17, 1),
(2, 16, 1),
(1, 39, 1),
(0, 40, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `noticia`
--

CREATE TABLE `noticia` (
  `not_id` int(11) NOT NULL,
  `not_titulo` varchar(256) DEFAULT NULL,
  `not_descricao` text DEFAULT NULL,
  `not_tag` varchar(256) NOT NULL,
  `not_img` varchar(256) DEFAULT NULL,
  `not_slug` varchar(256) NOT NULL,
  `not_datahora` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `prd_id` int(11) NOT NULL,
  `cat_id` int(11) DEFAULT NULL,
  `prd_titulo` varchar(256) DEFAULT NULL,
  `prd_descricao` text DEFAULT NULL,
  `prd_tags` varchar(256) DEFAULT NULL,
  `prd_status` tinyint(1) NOT NULL DEFAULT 1,
  `prd_ordem` int(11) DEFAULT NULL,
  `prd_datahora` datetime NOT NULL DEFAULT current_timestamp(),
  `prd_slug` varchar(256) NOT NULL,
  `prd_submenu` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`prd_id`, `cat_id`, `prd_titulo`, `prd_descricao`, `prd_tags`, `prd_status`, `prd_ordem`, `prd_datahora`, `prd_slug`, `prd_submenu`) VALUES
(102, 40, 'SECADOR DE LÂMINAS Série SL ||| VENEER ROLLER DRYER type SL ||| SECADOR DE HOJAS SERIE SL', '<p>DADOS DO EQUIPAMENTO</p><ul><li>Alta capacidade de secagem, devido ao sistema inovador de transfer&ecirc;ncia de calor interno;</li><li>Alta robustez;</li><li>Ventiladores mais eficientes, aumentando consideravelmente o volume de ar interno;</li><li>Radiadores com maior troca t&eacute;rmica, e menor coeficiente de arrasto;</li><li>Direcionadores de ar internos reposicionados uniformizando sua distribui&ccedil;&atilde;o por entre as pistas;</li><li>Efici&ecirc;ncia energ&eacute;tica com c&acirc;maras totalmente seladas evitando vazamento de calor.</li></ul><p>DADOS T&Eacute;CNICOS</p><ul><li>Largura nominal = 4800 mm / 6000 mm&nbsp;</li><li>Largura de trabalho = 4500 mm / 5500 mm</li><li>Quantidade de pistas = 4&nbsp;</li><li>Quantidade de M&oacute;dulos = 6 at&eacute; 12</li><li>Velocidade de transporte = 1,5 &ndash; 6,0 m/min</li><li>Pot&ecirc;ncia total instalada = 220 &ndash; 380 kW</li><li>Produ&ccedil;&atilde;o hor&aacute;ria = 5 &ndash; 10 m&sup3;/hr</li><li>Peso Total = 120 TON</li></ul><p>MODELOS DE FABRICA&Ccedil;&Atilde;O</p><ul><li>4SL6,0 = 6000 mm</li><li>4SL4,8 = 4800 mm</li></ul><p>|||</p><p>MAIN FEATURES</p><ul><li>High drying capacity due to innovative internal heat transfer system;</li><li>High robustness;</li><li>More efficient fans, considerably increasing the internal air volume;</li><li>Radiators with greater thermal exchange, and lower coefficient of drag;</li><li>Repositioned internal air drivers uniforming their distribution between the decks;</li><li>Energy efficiency with fully sealed chambers preventing heat leakage</li></ul><p>TECHNICAL DATA</p><ul><li>Nominal wide = 4800 mm / 6000 mm</li><li>Working width= 4500 mm / 5500 mm</li><li>Number of decks = 4</li><li>Number of dry sections = According to the project and customer.</li><li>Transport speed = 1,5 &ndash; 6,0 m/min</li><li>Total installed power = 220 &ndash; 380 kW</li><li>Drying capacity = 5 &ndash; 10 m&sup3;/hr</li></ul><p>MANUFACTURING MODELS</p><ul><li>4SL6,0 = 6000 mm</li><li>4SL4,8 = 4800 mm</li></ul><p>|||</p><p>DATOS DEL EQUIPO</p><ul><li>Gran capacidad de secado gracias al innovador sistema de transferencia de calor interno;</li><li>Gran robustez;</li><li>Ventiladores m&aacute;s eficientes, aumentando considerablemente el volumen de aire interno;</li><li>Radiadores con mayor intercambio t&eacute;rmico y menor coeficiente de arrastre y p&eacute;rdidas;</li><li>Reubicaci&oacute;n de los sistemas direccionales de aire internos, uniformando su distribuci&oacute;n entre los carriles;</li><li>Energ&eacute;ticamente eficiente con c&aacute;maras completamente selladas que evitan las fugas de calor.</li></ul><p>DATOS T&Eacute;CNICOS</p><ul><li>Ancho interno &uacute;til = 4500 mm / 6000 mm</li><li>Potencia total instalada = 220 &ndash; 380 kW</li><li>N&uacute;mero de carriles = 4</li><li>Producci&oacute;n horaria = 5 &ndash; 10 m&sup3; / hr</li><li>N&uacute;mero de m&oacute;dulos = 6 a 12</li><li>Rendimiento medio por c&aacute;mara = 0,60 m&sup3; / h</li><li>Peso total = 120 TON</li><li>Velocidad de transporte = 1,5 &ndash; 6,0 m / min</li></ul><p>MODELOS DE FABRICACI&Oacute;N</p><ul><li>4SL6,0 = 6000 mm</li><li>4SL4,5 = 4500 mm</li></ul><p>&nbsp;</p>', 'secador', 1, NULL, '2022-09-09 08:26:27', 'secador', 0),
(103, 40, 'TORNO ROLETEIRO HIGH SPEED série 5TD||| HIGH SPEED SPINDLELESS LATHE type 5TD|||TORNO DE RODILLOS DE ALTA VELOCIDAD Serie 5TD', '<p>DADOS DO EQUIPAMENTO</p><ul><li>Alta produ&ccedil;&atilde;o aliada a m&aacute;xima qualidade de l&acirc;minas;</li><li>Alta robustez;</li><li>F&aacute;cil opera&ccedil;&atilde;o, totalmente autom&aacute;tico sua alimenta&ccedil;&atilde;o e bitolas;</li><li>Alta velocidade de lamina&ccedil;&atilde;o, com corre&ccedil;&atilde;o autom&aacute;tica de &acirc;ngulo de corte;</li><li>Sistema inovador de regulagem de bitolas e sistema de corte final de lamina&ccedil;&atilde;o;</li><li>Acionamento principal com caixa central e sistema card&atilde;;</li><li>Alto custo/benef&iacute;cio.</li></ul><p>DADOS T&Eacute;CNICOS</p><ul><li>Di&acirc;metro M&aacute;ximo = 500 mm&nbsp;</li><li>Di&acirc;metro Rolete Residual = 40 mm&nbsp;</li><li>Comprimentos = 1400mm / 1800mm / 2800mm / 3300mm</li><li>Velocidade linear de lamina&ccedil;&atilde;o = 0 &ndash; 200 m/min</li><li>Varia&ccedil;&atilde;o na bitola : 3 &agrave; 4% (+- 0,1 mm)</li><li>Pot&ecirc;ncia total instalada = 110 kW</li><li>Peso Total = 12.500 Kg</li></ul><p>MODELOS DE FABRICA&Ccedil;&Atilde;O</p><ul><li>5TD14 = 1400mm</li><li>5TD18 = 1800mm</li><li>5TD28 = 2800mm</li><li>5TD33 = 3300mm</li></ul><p>PRODU&Ccedil;&Atilde;O HOR&Aacute;RIA</p><ul><li>5TD14 :&nbsp;8 &ndash; 12 m&sup3;/hr &ndash; espessura = 2,7 mm</li><li>5TD28:&nbsp;17 &ndash; 22 m&sup3;/hr &ndash; espessura = 2,7 mm</li></ul><p>|||</p><p>&nbsp;</p><p>MAIN FEATURES</p><ul><li>High production combined with maximum veneer quality;</li><li>High robustness;</li><li>Easy operation, fully automatic with touch screens for perfect veneer;</li><li>High laminating speed, with automatic cutting angle correction;</li><li>Gauge adjustment by HMI and final lamination cutting system;</li><li>Main drive with central box and cardan shaft;</li><li>Powered by two fully synchronized servo motors via HMI.</li></ul><p>TECHNICAL DATA</p><ul><li>Maximum diameter = 500 mm&nbsp;</li><li>Final core diameter = 45 mm</li><li>Lengths = 1400mm / 1800mm / 2800mm / 3300mm</li><li>Linear lamination speed = up to 200 m/min</li><li>Gauge variation : 3 &ndash; 4%</li><li>Total installed power = 110 kW</li><li>Total weight = 12.500 Kg</li></ul><p>MANUFACTURING MODELS</p><ul><li>5TD14 = 1400mm&nbsp;</li><li>5TD18 = 1800mm</li><li>5TD28 = 2800mm</li><li>5TD33 = 3300mm</li></ul><p>HOURLY PRODUCTION</p><ul><li>5TD14:&nbsp;8 &ndash; 12 m&sup3;/hr &ndash; THICKNESS = 2,7 mm</li><li>5TD28:&nbsp;17 &ndash; 25 m&sup3;/hr THICKNESS = 2,7 mm</li></ul><p>|||</p><p>DATOS DEL EQUIPO</p><ul><li>Alta producci&oacute;n combinada con la m&aacute;xima calidad de la hoja;</li><li>Gran robustez;</li><li>F&aacute;cil operaci&oacute;n, totalmente autom&aacute;tico su alimentaci&oacute;n y medidores;</li><li>Alta velocidad de laminaci&oacute;n, con correcci&oacute;n autom&aacute;tica del &aacute;ngulo de corte;</li><li>Innovador sistema de ajuste de calibre y sistema de corte de laminaci&oacute;n final;</li><li>Accionamiento principal con caja central y sistema card&aacute;n;</li><li>Alto costo / beneficio.</li></ul><p>DATOS T&Eacute;CNICOS</p><ul><li>Di&aacute;metro m&aacute;ximo = 500 mm</li><li>Di&aacute;metro del rodillo residual = 40 mm</li><li>Longitudes = 1400 mm / 1800 mm / 2800 mm / 3300 mm</li><li>Velocidad de laminaci&oacute;n lineal = 0-200 m / min</li><li>Variaci&oacute;n de calibre: + &ndash; 0,1 mm</li><li>Potencia total instalada = 110 kW</li><li>Peso total = 12,500 Kg</li></ul><p>MODELOS DE FABRICACI&Oacute;N</p><ul><li>5TD14 = 1400mm&nbsp;</li><li>5TD18 = 1800mm</li><li>5TD28 = 2800mm</li><li>5TD33 = 3300mm</li></ul><p>PRODUCCI&Oacute;N POR HORA</p><ul><li>5TD14: 8 &ndash; 12 m&sup3; / h &ndash; espesor = 2,7 mm</li><li>5TD28: 17 &ndash; 22 m&sup3; / h &ndash; espesor = 2,7 mm</li></ul>', 'Torno', 1, NULL, '2022-09-12 11:39:22', 'torno', 0),
(104, 40, 'TORNO ROLETEIRO Série 5TR|||5TR Series ROLLER LATHE|||5TR Series ROLLER LATHE', '<p>DADOS DO EQUIPAMENTO</p><ul><li>Boa capacidade produtiva;</li><li>Boa qualidade na l&acirc;mina devido seu perfeito &acirc;ngulo de corte;</li><li>F&aacute;cil opera&ccedil;&atilde;o, totalmente autom&aacute;tica com comunica&ccedil;&atilde;o via I.H.M;</li><li>Acionamento com servos motores/ fusos esf&eacute;ricos retificados.</li><li>Baixa custo de manuten&ccedil;&atilde;o;</li></ul><p>DADOS T&Eacute;CNICOS</p><ul><li>Di&acirc;metro M&aacute;ximo = 500 mm</li><li>Di&acirc;metro Rolete Residual = 40 mm</li><li>Comprimentos = 1400mm / 1800mm / 2800mm / 3300mm</li><li>Velocidade Linear de Lamina&ccedil;&atilde;o = 100 m/min</li><li>Varia&ccedil;&atilde;o de bitolas =+- 0,15 mm</li><li>Pot&ecirc;ncia total instalada = 64 kW</li><li>Peso Total = 7200 Kg</li></ul><p>MODELOS DE FABRICA&Ccedil;&Atilde;O</p><ul><li>5TR14 = 1400mm</li><li>5TR18 = 1800mm</li><li>5TR28 = 2800mm&nbsp;</li><li>5TR33 = 3300mm</li></ul><p>PRODU&Ccedil;&Atilde;O HOR&Aacute;RIA</p><ul><li>10 &ndash; 13 m&sup3;/hr &ndash; espessura = 2,7 mm</li></ul><p>|||</p><p>5TR Series ROLLER LATHE</p><p>&nbsp;</p><p>MAIN FEATURES</p><ul><li>Good productive capacity;</li><li>Good blade quality due to its perfect cutting angle;</li><li>Easy operation, fully automatic with communication via I.H.M;</li><li>Drive with rectified spherical spindles/servo motors.</li><li>Low maintenance cost;</li></ul><p>TECHNICAL DATA</p><ul><li>Maximum Diameter = 500 mm</li><li>Residual Roller Diameter = 40 mm</li><li>Lengths = 1400mm / 1800mm / 2800mm / 3300mm</li><li>Linear Lamination Speed = 100 m/min</li><li>Gauge variation =+- 0.15 mm</li><li>Total installed power = 64 kW</li><li>Total Weight = 7200 Kg</li></ul><p>MANUFACTURING MODELS</p><ul><li>5TR14 = 1400mm</li><li>5TR18 = 1800mm</li><li>5TR28 = 2800mm&nbsp;</li><li>5TR33 = 3300mm</li></ul><p>HOURLY PRODUCTION</p><ul><li>10 &ndash; 13 m&sup3;/hr &ndash; thickness = 2.7 mm</li></ul><p>DATOS DEL EQUIPO</p><ul><li>Buena capacidad productiva;</li><li>Buena calidad de la hoja debido a su perfecto &aacute;ngulo de corte;</li><li>F&aacute;cil manejo, totalmente autom&aacute;tico con comunicaci&oacute;n v&iacute;a I.H.M;</li><li>Accionamiento con husillos esf&eacute;ricos rectificados / servomotores.</li><li>Bajo costo de mantenimiento;</li></ul><p>DATOS T&Eacute;CNICOS</p><ul><li>Di&aacute;metro m&aacute;ximo = 500 mm</li><li>Di&aacute;metro del rodillo residual = 40 mm</li><li>Longitudes = 1400 mm / 1800 mm / 2800 mm / 3300 mm</li><li>Velocidad de laminaci&oacute;n lineal = 100 m / min</li><li>Variaci&oacute;n de calibre = + &ndash; 0,15 mm</li><li>Potencia total instalada = 64 kW</li><li>Peso total = 7200 Kg</li></ul><p>MODELOS DE FABRICACI&Oacute;N</p><ul><li>5TR14 = 1400mm</li><li>5TR18 = 1800mm</li><li>5TR28 = 2800mm&nbsp;</li><li>5TR33 = 3300mm</li></ul><p>PRODUCCI&Oacute;N POR HORA</p><ul><li>10-13 m&sup3; / h &ndash; espesor = 2,7 mm</li></ul>', 'torno', 1, NULL, '2022-09-12 16:04:37', 'torno', 0),
(105, 40, 'ARREDONDADOR DE TORAS Série 5AT|||LOG ROUND-UP LATHE type 5AT|||REDONDO DE TRONCOS Serie 5AT', '<p>DADOS DO EQUIPAMENTO</p><ul><li>Alta capacidade produtiva (10 &ndash; 15 toras/min);</li><li>M&aacute;xima qualidade no arredondamento devido a sua robustez em conjunto com guias cromadas;</li><li>F&aacute;cil opera&ccedil;&atilde;o, aliado ao baixo consumo de energia;</li><li>Velocidade de alimenta&ccedil;&atilde;o de toras devido ao acionamento hidr&aacute;ulico de alta vaz&atilde;o;</li><li>Baixa custo de manuten&ccedil;&atilde;o;</li></ul><p>DADOS T&Eacute;CNICOS</p><ul><li>Di&acirc;metro M&aacute;ximo = 500 mm&nbsp;</li><li>Di&acirc;metro M&iacute;nimo = 100 mm</li><li>Comprimentos = 1400mm / 1800mm / 2800mm / 3300mm&nbsp;</li><li>Capacidade produtiva = at&eacute; 15 toras/min</li><li>Pot&ecirc;ncia total instalada = 35 kW</li><li>Pot&ecirc;ncia Unidade Hidr&aacute;ulica = 9 kW</li><li>Peso Total = 5000 Kg</li></ul><p>MODELOS DE FABRICA&Ccedil;&Atilde;O</p><ul><li>5AT14 = 1400mm</li><li>5AT18 = 1800mm</li><li>5AT28 = 2800mm</li><li>5AT33 = 3300mm</li></ul><p>|||</p><p>&nbsp;</p><p>MAIN FEATURES</p><ul><li>High productive capacity (10 &ndash; 15 logs/min);</li><li>Top rounding quality due to its great robustness;</li><li>Easy operation, combined with low energy consumption;</li><li>High log rounding speed due to high flow hydraulic cylinder</li><li>Low maintenance cost;</li></ul><p>TECHNICAL DATA</p><ul><li>Maximum diameter of logs = 600 mm&nbsp;</li><li>Maximum log diameter after debarking = 500 mm&nbsp;</li><li>Minimum diameter of logs = 100 mm&nbsp;</li><li>Log lengths = 1400mm / 1800mm / 2800mm / 3300mm</li><li>Productive capacity = up to 15 logs/min</li><li>Total installed power = 35 kW</li><li>Power Hydraulic Unit = 9 kW</li><li>Total weight = 5000 Kg</li></ul><p>MANUFACTURING MODELS</p><ul><li>5AT14 = 1400mm</li><li>5AT18 = 1800mm</li><li>5AT28 = 2800mm</li><li>5AT33 = 3300mm</li></ul><p>|||</p><p>&nbsp;</p><p>DATOS DEL EQUIPO</p><ul><li>Alta capacidad de producci&oacute;n (HASTA 12 troncos / min);</li><li>M&aacute;xima calidad de redondeo debido a su robustez en combinaci&oacute;n con gu&iacute;as cromadas;</li><li>Operaci&oacute;n f&aacute;cil, combinada con bajo consumo de energ&iacute;a;</li><li>Velocidad de alimentaci&oacute;n de troncos debido al accionamiento hidr&aacute;ulico de alto flujo;</li><li>Bajo costo de mantenimiento;</li></ul><p>DATOS T&Eacute;CNICOS</p><ul><li>Di&aacute;metro m&aacute;ximo = 500 mm</li><li>Di&aacute;metro m&iacute;nimo = 100 mm</li><li>Longitudes = 1400 mm / 1800 mm / 2800 mm / 3300 mm</li><li>Capacidad de producci&oacute;n = hasta 12 troncos / min</li><li>Potencia total instalada = 35 kW</li><li>Potencia de la unidad hidr&aacute;ulica = 9 kW</li><li>Peso total = 5000 kilogramos</li></ul><p>MODELOS DE FABRICACI&Oacute;N</p><ul><li>5AT14 = 1400mm</li><li>5AT18 = 1800mm</li><li>5AT28 = 2800mm</li><li>5AT33 = 3300mm</li></ul>', NULL, 1, NULL, '2022-09-12 16:10:34', 'arredondador-de-toras-serie-5at', 0),
(106, 40, 'ESTEIRA ENTRADA DE TORAS Série EC|||INFEED LOG CONVEYOR type EC|||TRANSPORTADOR DE ENTRADA DE REGISTRO Serie EC', '<p>ESTEIRA ENTRADA DE TORAS S&eacute;rie EC</p><p>&nbsp;</p><p>DADOS DO EQUIPAMENTO</p><ul><li>Boa capacidade de armazenamento (at&eacute; 20 toras);</li><li>Alta robustez;</li><li>F&aacute;cil opera&ccedil;&atilde;o,e totalmente autom&aacute;tica com sensores de presen&ccedil;a de toras;</li><li>Velocidade de alimenta&ccedil;&atilde;o de toras vari&aacute;vel (OPCIONAL);</li><li>Calhas laterais para alinhamento.</li></ul><p>DADOS T&Eacute;CNICOS</p><ul><li>Di&acirc;metro M&aacute;ximo = 500 mm</li><li>Di&acirc;metro M&iacute;nimo = 180 mm&nbsp;</li><li>Comprimentos = 1400mm / 1800mm / 2800mm / 3300mm</li><li>Velocidade de transporte = 10 m/min</li><li>Pot&ecirc;ncia total instalada = 9,0 kW</li><li>Peso Total = 6200 Kg</li></ul><p>MODELOS DE FABRICA&Ccedil;&Atilde;O</p><ul><li>EC14 = 1400mm</li><li>EC18 = 1800mm</li><li>EC28 = 2800mm</li><li>EC33 = 3300mm</li></ul><p>|||</p><p>MAIN FEATURES</p><ul><li>Good storage capacity (up to 12 logs);</li><li>High robustness;</li><li>Easy operation, and fully automatic with log presence sensors;</li><li>Variable log feed speed (OPTIONAL);</li><li>Side rails for alignment.</li></ul><p>TECHNICAL DATA</p><ul><li>Maximum diameter = 500 mm</li><li>Minimum diameter = 80 mm</li><li>Lengths = 1400mm / 1800mm / 2800mm / 3300mm</li><li>Conveyor speed = 10 m/min</li><li>Total installed power = 5,5 kW</li></ul><p>MANUFACTURING MODELS</p><ul><li>EC14 = 1400mm</li><li>EC18 = 1800mm</li><li>EC28 = 2800mm</li><li>EC33 = 3300mm</li></ul><p>|||</p><p>DATOS DEL EQUIPO</p><ul><li>Buena capacidad de almacenamiento (hasta 12 registros);<br />Gran robustez;</li><li>Funcionamiento sencillo y totalmente autom&aacute;tico con sensores de presencia de troncos;</li><li>Velocidad de alimentaci&oacute;n de troncos variable (OPCIONAL);</li><li>Rieles laterales para alineaci&oacute;n.</li></ul><p>DATOS T&Eacute;CNICOS</p><ul><li>Di&aacute;metro m&aacute;ximo = 500 mm</li><li>Di&aacute;metro m&iacute;nimo = 180 mm</li><li>Longitudes = 1400 mm / 1800 mm / 2800 mm / 3300 mm</li><li>Velocidad de transporte = 26 m / min</li><li>Potencia total instalada = 9,0 kW</li><li>Peso total = 6200 kilogramos</li></ul><p>MODELOS DE FABRICACI&Oacute;N</p><ul><li>EC14 = 1400mm</li><li>EC18 = 1800mm</li><li>EC28 = 2800mm</li><li>EC33 = 3300mm</li></ul>', NULL, 1, NULL, '2022-09-12 16:14:55', 'esteira-entrada-de-toras-serie-ec', 0),
(107, 40, 'ESTEIRA TRANSPORTADORA DE LÂMINAS Série ETL|||VENEER CONVEYOR DECK type ETL|||ALFOMBRILLA TRANSPORTADORA DE CUCHILLAS Serie ETL', '<p>DADOS DO EQUIPAMENTO</p><ul><li>Estrutura composta por tubos totalmente ajustada sua altura e largura;</li><li>Flape de escolha de pista pneum&aacute;tico;</li><li>Velocidade de transporte do tapete vari&aacute;vel;</li><li>Polias fundidas;</li><li>Acionamento das pistas por motoredutores;</li><li>Esteira de retorno de residuos; (OPCIONAL)</li></ul><p>DADOS T&Eacute;CNICOS</p><ul><li>Comprimentos = &Agrave; Definir</li><li>Quantidades de Pistas = 01 at&eacute; 03</li><li>Velocidade de transporte = 80 &ndash; 180 m/min</li><li>Pot&ecirc;ncia total instalada = 11 kW</li></ul><p>MODELOS DE FABRICA&Ccedil;&Atilde;O</p><ul><li>ETL14 = 1400mm</li><li>ETL18 = 1800mm</li><li>ETL28 = 2800mm</li><li>ETL33 = 3300mM</li></ul><p>|||</p><p>MAIN FEATURES</p><ul><li>Structure composed of welded and bolted square tubes;</li><li>Pneumatic deck choice flap;</li><li>Variable veneer transport speed via frequency inverter;</li><li>Individual belts, with support tube for the transport of veneers;</li><li>Drive of the decks by gearmotors;</li><li>Lower veneer return belt.</li></ul><p>TECHNICAL DATA</p><ul><li>Lenghts = according to the project and customer.</li><li>Number of tray decks = 1 &ndash; 2</li><li>Transport speed = 1 &ndash; 180 m/min</li><li>Total installed power = 11 kW</li></ul><p>MANUFACTURING MODELS</p><ul><li>ETL14 = 1400mm</li><li>ETL18 = 1800mm</li><li>ETL28 = 2800mm</li><li>ETL33 = 3300mm</li></ul><p>|||</p><p>&nbsp;</p><p>DATOS DEL EQUIPO</p><ul><li>Estructura compuesta por tubos totalmente ajustados a su altura y ancho;</li><li>Trampilla de elecci&oacute;n de v&iacute;a neum&aacute;tica;</li><li>Velocidad variable de la cinta transportadora;</li><li>Poleas fundidas;</li><li>Accionamiento de las v&iacute;as mediante motorreductores;</li><li>Transportador de retorno de residuos; (OPCIONAL)</li></ul><p>DATOS T&Eacute;CNICOS</p><ul><li>Longitudes = para definir</li><li>Cantidad de pistas = 01 a 03</li><li>Velocidad de transporte = 80 &ndash; 180 m / min</li><li>Potencia total instalada = 11 kW</li></ul><p>MODELOS DE FABRICACI&Oacute;N</p><ul><li>ETL14 = 1400mm</li><li>ETL18 = 1800mm</li><li>ETL28 = 2800mm</li><li>ETL33 = 3300mm</li></ul>', NULL, 1, NULL, '2022-09-12 16:17:58', 'esteira-transportadora-de-laminas-serie-etl', 0),
(108, 40, 'UNITIZADOR DE TORAS Série UNT|||LOG UNITIZATOR type UNT|||UNITIZADOR DE REGISTRO Serie UNT', '<p>&nbsp;</p><p><strong>DADOS DO EQUIPAMENTO</strong></p><ul><li>Boa capacidade de armazenamento (at&eacute; 7 toras);</li><li>Alta robustez;</li><li>F&aacute;cil opera&ccedil;&atilde;o,e totalmente autom&aacute;tica com sensores de presen&ccedil;a de toras;</li><li>Velocidade de alimenta&ccedil;&atilde;o de toras vari&aacute;vel (OPCIONAL);</li><li>Virador-Toras pneum&aacute;tico;</li><li>Centrador pneum&aacute;tico no virador; (OPCIONAL)</li><li>Calhas laterais para alinhamento.</li></ul><p><strong>DADOS T&Eacute;CNICOS</strong></p><ul><li>Di&acirc;metro M&aacute;ximo = 500 mm</li><li>Di&acirc;metro M&iacute;nimo = 180 mm&nbsp;</li><li>Comprimentos = 1400mm / 1800mm / 2800mm / 3300mm&nbsp;</li><li>Velocidade de transporte = 26 m/min</li><li>Pot&ecirc;ncia total instalada = 5,5 kW</li><li>Consumo de ar Total = 29 L</li><li>Peso Total = 3500 Kg</li></ul><p><strong>MODELOS DE FABRICA&Ccedil;&Atilde;O</strong></p><ul><li>UNT14 = 1400mm</li><li>UNT18 = 1800mm</li><li>UNT28 = 2800mm</li><li>UNT33 = 3300mm</li></ul><p>|||</p><p><strong>MAIN FEATURES</strong></p><ul><li>Good storage capacity (up to 7 logs);</li><li>High strength, built with square welded tubes;</li><li>Easy operation, and fully automatic with log presence sensors;</li><li>Variable log feed speed (OPTIONAL);</li><li>Pneumatic Log Turner;</li><li>Pneumatic center on turner; (OPTIONAL);</li><li>Side rails for alignment.</li></ul><p><strong>TECHNICAL DATA</strong></p><ul><li>Maximum Diameter = 500 mm&nbsp;</li><li>Minimum Diameter = 180 mm&nbsp;</li><li>Lengths = 1400mm / 1800mm / 2800mm / 3300mm</li><li>Transport speed = 26 m/min</li><li>Total installed power = 5,5 kW</li><li>Total air consumption = 29 L</li></ul><p><strong>MANUFACTURING MODELS</strong></p><ul><li>UNT14 = 1400mm</li><li>UNT18 = 1800mm</li><li>UNT28 = 2800mm</li><li>UNT33 = 3300mm</li></ul><p>|||</p><p><strong>DATOS DEL EQUIPO</strong></p><ul><li>Buena capacidad de almacenamiento (hasta 7 registros);</li><li>Gran robustez;</li><li>Funcionamiento sencillo y totalmente autom&aacute;tico con sensores de presencia de troncos;</li><li>Velocidad de alimentaci&oacute;n de troncos variable (OPCIONAL);</li><li>Volteador de troncos neum&aacute;tico;</li><li>Centro neum&aacute;tico en volteador; (OPCIONAL)</li><li>Rieles laterales para alineaci&oacute;n.</li></ul><p><strong>DATOS T&Eacute;CNICOS</strong></p><ul><li>Di&aacute;metro m&aacute;ximo = 500 mm</li><li>Di&aacute;metro m&iacute;nimo = 180 mm</li><li>Longitudes = 1400 mm / 1800 mm / 2800 mm / 3300 mm</li><li>Velocidad de transporte = 26 m / min</li><li>Potencia total instalada = 5,5 kW</li><li>Consumo total de aire = 29 L</li><li>Peso total = 3500 kilogramos</li></ul><p><strong>MODELOS DE FABRICACI&Oacute;N</strong></p><ul><li>UNT14 = 1400mm</li><li>UNT18 = 1800mm</li><li>UNT28 = 2800mm</li><li>UNT33 = 3300mm</li></ul>', NULL, 1, NULL, '2022-09-13 09:21:08', 'unitizador-de-toras-serie-unt', 0),
(109, 40, 'TRANSPORTADOR DE CORRENTES Série TCL|||TCL Series CHAIN CONVEYOR|||TRANSPORTADOR DE CADENA Serie TCL', '<p><strong>DADOS DO EQUIPAMENTO</strong></p><ul><li>Estrutura composta por tubos retangulares refor&ccedil;ados;</li><li>Roletes de apoio na entrada para pacotes de l&acirc;minas 4 p&eacute;s;</li><li>Velocidade de transporte do material vari&aacute;vel; (OPCIONAL)</li><li>Acionamento por motoredutor e correntes;</li><li>Guia lateral para pacotes;(OPCIONAL)</li></ul><p><strong>DADOS T&Eacute;CNICOS</strong></p><ul><li>Largura total = 2500 mm</li><li>Comprimentos = &Agrave; Definir</li><li>Quantidades de correntes = at&eacute; 04</li><li>Velocidade de transporte = fixa ou vari&aacute;vel</li><li>Pot&ecirc;ncia total instalada = 5,5 kW</li><li>Peso total = 2300 kg</li></ul><p><strong>MODELOS DE FABRICA&Ccedil;&Atilde;O</strong></p><ul><li>TCL6,0 = 12.000 mm</li><li>TCL4,5 = 9000 mm</li></ul><p>|||</p><p><strong>MAIN FEATURES</strong></p><ul><li>Structure composed of reinforced rectangular tubes;</li><li>Inlet support rollers for 4-foot blade packs;</li><li>Variable material transport speed; (OPTIONAL)</li><li>Driven by gearmotor and chains;</li><li>Side guide for packages;(OPTIONAL)</li></ul><p><strong>TECHNICAL DATA</strong></p><ul><li>Total width = 2500 mm</li><li>Lengths = To Define</li><li>Quantities of chains = up to 04</li><li>Transport speed = fixed or variable</li><li>Total installed power = 5.5 kW</li><li>Total weight = 2300 kg</li></ul><p><strong>MANUFACTURING MODELS</strong></p><ul><li>TCL6,0 = 12.000 mm</li><li>TCL4,5 = 9000 mm</li></ul><p>&nbsp;</p><p>|||</p><p>DATOS DEL EQUIPO</p><ul><li>Estructura compuesta por tubos rectangulares reforzados;</li><li>Rodillos de soporte de entrada para paquetes de cuchillas de 4 pies;</li><li>Velocidad de transporte de material variable; (OPCIONAL)</li><li>Accionado por motorreductor y cadenas;</li><li>Gu&iacute;a lateral para paquetes; (OPCIONAL)</li></ul><p>DATOS T&Eacute;CNICOS</p><ul><li>Ancho total = 2500 mm</li><li>Longitudes = para definir</li><li>Cantidades de cadenas = hasta 04</li><li>Velocidad de transporte = fija o variable</li><li>Potencia total instalada = 5,5 kW</li><li>Peso total = 2300 kg</li></ul><p>MODELOS DE FABRICACI&Oacute;N</p><ul><li>TCL6,0 = 12.000 mm</li><li>TCL4,5 = 9000 mm</li></ul>', NULL, 1, NULL, '2022-09-13 09:26:50', 'transportador-de-correntes-serie-tcl', 0),
(110, 40, 'MESA HIDRÁULICA Série MHP|||SCISSORS LIFT type MHP|||MESA HIDRÁULICA Serie MHP', '<p><strong>DADOS DO EQUIPAMENTO</strong></p><ul><li>Alta robustez;</li><li>F&aacute;cil opera&ccedil;&atilde;o,e totalmente autom&aacute;tica com sensores de altura e fim de curso; (OPCIONAL)</li><li>Cilindros hidr&aacute;ulicos de simples a&ccedil;&atilde;o;</li><li>Trava de seguran&ccedil;a mec&acirc;nica para manuten&ccedil;&atilde;o;</li><li>Unidade hidr&aacute;ulica compacta independente;</li><li>Acionamento por pedal ou controle manual; (OPCIONAL)</li><li>Prote&ccedil;&atilde;o sanfonada ou tela de fechamento por completo da mesa. (OPCIONAL)</li></ul><p><strong>DADOS T&Eacute;CNICOS</strong></p><ul><li>Altura M&aacute;xima = &Agrave; definir</li><li>Altura M&iacute;nima = &Agrave; definir</li><li>Comprimentos/ Larguras = &Agrave; definir</li><li>Unidade hidr&aacute;ulica = 10 litros</li><li>Pot&ecirc;ncia total instalada = 2,2 kW</li><li>Capacidade de carga = 0 at&eacute; 8000 kg</li></ul><p>|||</p><p><strong>MAIN FEATURES</strong></p><ul><li>High robustness;</li><li>Easy operation, and fully automatic with height and limit sensors; (OPTIONAL);</li><li>Single acting hydraulic cylinders;</li><li>Mechanical safety lock for maintenance;</li><li>Independent compact hydraulic unit;</li><li>Foot pedal or manual control; (OPTIONAL)</li><li>Folding protection or full table closing screen. (OPTIONAL)</li></ul><p><strong>TECHNICAL DATA</strong></p><ul><li>Maximum height = According to the project and customer;</li><li>Minimum height = According to the project and customer;</li><li>Lengths/Widths = According to the project and customer;</li><li>Hydraulic unit = 10 litros;</li><li>Total installed power = 2,2 kW;</li><li>Weight capacity = up to 8000 kg.</li></ul><p>|||</p><p><strong>DATOS DEL EQUIPO</strong></p><ul><li>Gran robustez;</li><li>Funcionamiento sencillo y totalmente autom&aacute;tico con sensores de altura y l&iacute;mite; (OPCIONAL)</li><li>Cilindros hidr&aacute;ulicos de simple efecto;</li><li>Cerradura de seguridad mec&aacute;nica para mantenimiento;</li><li>Unidad hidr&aacute;ulica compacta independiente;</li><li>Pedal o control manual; (OPCIONAL)</li><li>Protecci&oacute;n abatible o mampara de cierre de mesa completa. (OPCIONAL)</li></ul><p><strong>DATOS T&Eacute;CNICOS</strong></p><ul><li>Altura m&aacute;xima = Por definir</li><li>Altura m&iacute;nima = Por definir</li><li>Longitudes / Anchuras = Por definir</li><li>Unidad hidr&aacute;ulica = 10 litros</li><li>Potencia total instalada = 2,2 kW</li><li>Capacidad de carga = 0 a 8000 kg</li></ul>', NULL, 1, NULL, '2022-09-13 09:30:42', 'mesa-hidraulica-serie-mhp', 0),
(111, 40, 'GUILHOTINA ROTATIVA série GR|||ROTARY CLIPPER type GR|||CORTADOR ROTATIVO Serie GR', '<p><strong>DADOS DO EQUIPAMENTO</strong></p><ul><li>Estrutura composta por chapas de a&ccedil;o estruturadas;</li><li>Alta robustez;</li><li>Alta confiabilidade/durabilidade;</li><li>Rolo emborrachado em Poliuretano (PU);</li><li>Facilidade de manuten&ccedil;&atilde;o;</li><li>Cilindros pneum&aacute;ticos na entrada para regulagem de altura dos bra&ccedil;os pressores;</li><li>Acionamento do conjunto porta facas por servo motor.</li></ul><p><strong>DADOS T&Eacute;CNICOS</strong></p><ul><li>Pot&ecirc;ncia total instalada = 32 kW</li><li>Quantidade de pistas = 1&nbsp;</li><li>Quantidade de facas = 3</li><li>Velocidade de corte = 120 m/min</li><li>Velocidade de corte r&aacute;pido (repique) = 100m/min</li><li>Peso Total = 2350 kg</li></ul><p><strong>MODELOS DE FABRICA&Ccedil;&Atilde;O</strong></p><ul><li>GR14 = 1400 mm</li><li>GR18 = 1800 mm</li><li>GR28 = 2800 mm</li><li>GR33 = 3300 mm</li></ul><p>|||</p><p><strong>MAIN FEATURES</strong></p><ul><li>Robust structure by structured steel plates;</li><li>Automatic cutting operation;</li><li>Touch screen, and data management via HMI;</li><li>Polyurethane rubber coated roller;</li><li>Ease of maintenance;</li><li>Pneumatic cylinders at the entrance to adjust the height of the pressure arms;</li><li>Drive the cutting set via servo motor</li></ul><p><strong>TECHNICAL DATA</strong></p><p>Total installed power = 17 kW&nbsp;</p><ul><li>Quantity of decks = 1</li><li>Number of knives = 3&nbsp;</li><li>Cutting speed = 80 m/min</li><li>Functioning Fast Cutting = 100m/min</li><li>Cuts defect:<ul><li>Speed at 80m/min: Cuts at 240mm</li><li>Speed at 90m/min: Cuts at 270mm</li><li>Speed at 100m/min: Cuts at 300mm</li></ul></li></ul><p>&nbsp;</p><p><strong>MANUFACTURING MODELS</strong></p><ul><li>GR14 = 1400 mm</li><li>GR18 = 1800 mm</li><li>GR28 = 2800 mm</li><li>GR33 = 3300 mm</li></ul><p>|||</p><p><strong>DATOS DEL EQUIPO</strong></p><ul><li>Estructura compuesta por chapas de acero estructuradas;</li><li>Gran robustez;</li><li>Rodillo de corte recubierto de PU (poliuretano) de alta densidad que optimiza los cortes de calibre fino y prolonga la vida &uacute;til del rodillo;</li><li>Rodillo de corte con ajuste de altura;</li><li>Accione el conjunto del portacuchillas a trav&eacute;s del servomotor con control de posicionamiento preciso;</li><li>Operaci&oacute;n y control de corte a trav&eacute;s del panel de pantalla t&aacute;ctil I.H.M;</li><li>Calidad con alta tecnolog&iacute;a.</li></ul><p><strong>DATOS T&Eacute;CNICOS</strong></p><ul><li>N&uacute;mero de carriles = 1</li><li>Potencia total instalada = 32 kW</li><li>N&uacute;mero de cuchillos = 3</li><li>Velocidad de corte = hasta 180 m / min</li><li>Velocidad de corte r&aacute;pida (pico) = 100 m / min</li></ul><p><strong>MODELOS DE FABRICACI&Oacute;N</strong></p><ul><li>GR14 = 1400 mm</li><li>GR18 = 1800 mm</li><li>GR28 = 2800 mm</li><li>GR33= 3300 mm</li></ul>', NULL, 1, NULL, '2022-09-13 09:37:49', 'guilhotina-rotativa-serie-gr', 0),
(112, 40, 'SERRA CIRCULAR AUTOMÁTICA série SC|||AUTOMATIC CIRCULAR SAW type SC|||SIERRA CIRCULAR AUTOMATICA tipo SC', '<p><strong>DADOS DO EQUIPAMENTO</strong></p><ul><li>Estrutura composta por chapas de a&ccedil;o estruturadas;</li><li>Alta robustez;</li><li>Alta confiabilidade/durabilidade;</li><li>Rolo emborrachado em Poliuretano (PU);</li><li>Facilidade de manuten&ccedil;&atilde;o;</li><li>Cilindros pneum&aacute;ticos na entrada para regulagem de altura dos bra&ccedil;os pressores;</li><li>Acionamento do conjunto porta facas por servo motor.</li></ul><p><strong>DADOS T&Eacute;CNICOS</strong></p><ul><li>Pot&ecirc;ncia total instalada = 32 kW</li><li>Quantidade de pistas = 1&nbsp;</li><li>Quantidade de facas = 3</li><li>Velocidade de corte = 120 m/min</li><li>Velocidade de corte r&aacute;pido (repique) = 100m/min</li><li>Peso Total = 2350 kg</li></ul><p><strong>MODELOS DE FABRICA&Ccedil;&Atilde;O</strong></p><ul><li>GR14 = 1400 mm</li><li>GR18 = 1800 mm</li><li>GR28 = 2800 mm</li><li>GR33 = 3300 mm</li></ul><p>|||</p><p><strong>MAIN FEATURES</strong></p><ul><li>Traction system by geared motor and chain transport;</li><li>High robustness;</li><li>Easy operation with log alignment system at the entrance by rollers driven by gearmotor;</li><li>Variable log feed rate by frequency inverter;</li><li>Circular saws with hard metal cutting inserts (W&iacute;dea);</li><li>Saw drive command and chain advance through a pre-fixed electrical panel on the side of the machine;</li></ul><p><strong>TECHNICAL DATA</strong></p><ul><li>Maximum length of the log = According to the project and customer&nbsp;</li><li>Minimum length of the log = According to the project and customer&nbsp;</li><li>Maximum diameter of the log = 500 mm&nbsp;</li><li>Belt speed = 26 m/min</li><li>Conveyor Power = 12,5 CV</li><li>Saw Power = 3 x 40 CV</li><li>Cutting speed = Variable</li></ul><p><strong>MANUFACTURING MODELS</strong></p><ul><li>SC14 = 1400 mm</li><li>SC24 = 2400 mm</li><li>SC28 = 2800 mm</li></ul><p>|||</p><p><strong>PRINCIPALES CARACTER&Iacute;STICAS</strong></p><ul><li>Sistema de tracci&oacute;n por motorreductor y transporte por cadena; Alta robustez;</li><li>F&aacute;cil manejo con sistema de alineaci&oacute;n de troncos en la entrada por rodillos accionados por motorreductor; Velocidad de alimentaci&oacute;n de troncos variable por convertidor de frecuencia; Sierras circulares con insertos de corte de metal duro (W&iacute;dea);</li><li>Mando de accionamiento de la sierra y avance de la cadena a trav&eacute;s de un cuadro el&eacute;ctrico prefijado en el lateral de la m&aacute;quina;</li></ul><p><strong>DATOS T&Eacute;CNICOS</strong></p><p>Longitud m&aacute;xima de la bit&aacute;cora = Seg&uacute;n proyecto y cliente Longitud m&iacute;nima de la bit&aacute;cora = Seg&uacute;n proyecto y cliente Di&aacute;metro m&aacute;ximo del tronco = 500 mm Velocidad de la cinta = 26 m/min Potencia Transportadora = 12,5 CV Potencia Sierra = 3 x 40 CV Velocidad de corte = Variable MODELOS DE FABRICACI&Oacute;N SC14 = 1400mm SC24 = 2400mm SC28 = 2800mm</p>', NULL, 1, NULL, '2022-09-13 09:41:31', 'serra-circular-automatica-serie-sc', 0),
(113, 40, 'ALIMENTADOR DE LÂMINAS série ASL||| ASL series BLADE FEEDER|||ALIMENTADOR DE CUCHILLA serie ASL', '<p><strong>DADOS DO EQUIPAMENTO</strong></p><ul><li>Estrutura composta por chapas de a&ccedil;o estruturadas;</li><li>Alta robustez;</li><li>Alta confiabilidade/durabilidade;</li><li>Rolo emborrachado em Poliuretano (PU);</li><li>Facilidade de manuten&ccedil;&atilde;o;</li><li>Cilindros pneum&aacute;ticos na entrada para regulagem de altura dos bra&ccedil;os pressores;</li><li>Acionamento do conjunto porta facas por servo motor.</li></ul><p><strong>DADOS T&Eacute;CNICOS</strong></p><ul><li>Pot&ecirc;ncia total instalada = 32 kW</li><li>Quantidade de pistas = 1&nbsp;</li><li>Quantidade de facas = 3</li><li>Velocidade de corte = 120 m/min</li><li>Velocidade de corte r&aacute;pido (repique) = 100m/min</li><li>Peso Total = 2350 kg</li></ul><p><strong>MODELOS DE FABRICA&Ccedil;&Atilde;O</strong></p><ul><li>GR14 = 1400 mm</li><li>GR18 = 1800 mm</li><li>GR28 = 2800 mm</li><li>GR33 = 3300 mm</li></ul><p>|||</p><p>MAIN FEATURES</p><ul><li>Good feeding capacity;</li><li>High robustness;</li><li>Easy operation, and fully automatic lane choices;</li><li>Variable veneer feed speed;</li><li>Track selector by hydraulic cylinder;</li><li>Feeder roller drive by gearmotor with frequency inverter and synchronized belt control;</li></ul><p>TECHNICAL DATA</p><ul><li>Maximum length of veneers = 3200 mm&nbsp;</li><li>Minimum length of veneers = 1000 mm&nbsp;</li><li>Useful lengths = 4500mm / 6000mm</li><li>Feed speed = 150 m/min</li><li>Feed rolls rotation = 136 RPM</li><li>Total installed power = 7,5 kW</li><li>Total Weight = 3800 Kg</li></ul><p>MANUFACTURING MODELS</p><ul><li>ASL4.5 = 4500mm</li><li>ASL6.0 = 6000mm</li></ul><p>|||</p><p><strong>DATOS DEL EQUIPO</strong></p><ul><li>Estructura compuesta por chapas de acero estructuradas;</li><li>Gran robustez;</li><li>Rodillo de corte recubierto de PU (poliuretano) de alta densidad que optimiza los cortes de calibre fino y prolonga la vida &uacute;til del rodillo;</li><li>Rodillo de corte con ajuste de altura;</li><li>Accione el conjunto del portacuchillas a trav&eacute;s del servomotor con control de posicionamiento preciso;</li><li>Operaci&oacute;n y control de corte a trav&eacute;s del panel de pantalla t&aacute;ctil I.H.M;</li><li>Calidad con alta tecnolog&iacute;a.</li></ul><p><strong>DATOS T&Eacute;CNICOS</strong></p><ul><li>N&uacute;mero de carriles = 1</li><li>Potencia total instalada = 32 kW</li><li>N&uacute;mero de cuchillos = 3</li><li>Velocidad de corte = hasta 180 m / min</li><li>Velocidad de corte r&aacute;pida (pico) = 100 m / min</li></ul><p><strong>MODELOS DE FABRICACI&Oacute;N</strong></p><ul><li>GR14 = 1400 mm</li><li>GR18 = 1800 mm</li><li>GR28 = 2800 mm</li><li>GR33= 3300 mm</li></ul>', NULL, 1, NULL, '2022-09-13 09:47:24', 'alimentador-de-laminas-serie-asl', 0),
(114, 40, 'GUILHOTINA ROTATIVA FACA TENSIONADA série GRTZ|||ROTARY CLIPPER with TENSIONING KNIFE type GRT', '<p><strong>DADOS DO EQUIPAMENTO</strong></p><ul><li>Alta velocidade de corte na faca (140m/min);</li><li>Alta robustez;</li><li>F&aacute;cil opera&ccedil;&atilde;o com painel e plataforma elevados;</li><li>Regulagem de altura de rolos mecanicamente;</li><li>Duplo acionamento de servos em ambos os lados da faca;</li><li>Sistema de scanner para leituras e aproveitamento (Opcional);</li></ul><p><strong>DADOS T&Eacute;CNICOS</strong></p><ul><li>Espessura de L&acirc;minas = 1 &ndash; 4 mm&nbsp;</li><li>Comprimento M&iacute;nimo de Retalho = 140 mm&nbsp;</li><li>Velocidade de Corte = 140m/min</li><li>Velocidade da Esteira Sa&iacute;da = 180 m/min</li><li>Pot&ecirc;ncia dos Rolos = 2 x 5 CV</li><li>Pot&ecirc;ncia dos Servos = 2 x 36NM</li></ul><p><strong>MODELOS DE FABRICA&Ccedil;&Atilde;O</strong></p><ul><li>GRT14 = 1400 mm</li><li>GRT18 = 1800 mm</li><li>GRT24 = 2400 mm</li><li>GRT28 = 2800 mm</li><li>GRT33 = 3300 mm</li></ul><p>|||</p><p>MAIN FEATURES</p><ul><li>High cutting speed (140m/min);</li><li>High robusteness;</li><li>Easy operation with raised panel and plataform;</li><li>Roller height adjustment mechanically;</li><li>Doblo servo drive on both sides of the knife;</li><li>Scanner system for readings and usage (Optional);</li></ul><p><strong>TECHNICAL DATA</strong></p><ul><li>Thickness of Veneers&nbsp;= 1 &ndash; 4 mm</li><li>Minimum Length of Retail = 80 mm (140m/min)&nbsp;</li><li>Cutting Speed = 140m/min</li><li>Outlet Conveyor Speed = 180 m/min</li><li>Cutting Cylinder Power&nbsp;= 4 CV (2,9 kw)</li><li>Power of Servo Motors = 2 x 48NM</li></ul><p><strong>MANUFACTURING MODELS</strong></p><ul><li>GR14 = 1400 mm</li><li>GR18 = 1800 mm</li><li>GR28 = 2800 mm</li><li>GR33 = 3300 mm</li></ul><p>|||</p><p>&nbsp;</p><p><strong>DATOS DEL EQUIPO</strong></p><ul><li>Alta velocidade de corte na faca (140m/min);</li><li>Alta robustez;</li><li>F&aacute;cil opera&ccedil;&atilde;o com painel e plataforma elevados;</li><li>Regulagem de altura de rolos mecanicamente;</li><li>Duplo acionamento de servos em ambos os lados da faca;</li><li>Sistema de scanner para leituras e aproveitamento (Opcional);</li></ul><p><strong>DATOS T&Eacute;CNICOS</strong></p><ul><li>Espessura de L&acirc;minas = 1 &ndash; 4 mm&nbsp;</li><li>Comprimento M&iacute;nimo de Retalho = 140 mm&nbsp;</li><li>Velocidade de Corte = 140m/min</li><li>Velocidade da Esteira Sa&iacute;da = 180 m/min</li><li>Pot&ecirc;ncia dos Rolos = 2 x 5 CV</li><li>Pot&ecirc;ncia dos Servos = 2 x 36NM</li></ul><p><strong>MODELOS DE FABRICACI&Oacute;N</strong></p><ul><li>GRT14 = 1400 mm</li><li>GRT18 = 1800 mm</li><li>GRT24 = 2400 mm</li><li>GRT28 = 2800 mm</li><li>GRT33 = 3300 mm</li></ul>', NULL, 1, NULL, '2022-09-13 10:06:02', 'guilhotina-rotativa-faca-tensionada-serie-grtz', 0),
(115, 40, 'DESTOPADEIRA PARA PACOTES LÂMINAS série DP|||VENEER PACKAGE SAW type DP|||CUCHILLAS SERIE DP BUTTLER PARA PAQUETES', '<p><strong>DADOS DO EQUIPAMENTO</strong></p><ul><li>Sistema de tra&ccedil;&atilde;o por moto-redutor e transporte por correntes;</li><li>Alta robustez;</li><li>F&aacute;cil opera&ccedil;&atilde;o com sistema de medi&ccedil;&atilde;o laser para alinhamento do pacote;</li><li>Velocidade de avan&ccedil;o do pacote fixo;</li><li>Fixa&ccedil;&atilde;o do pacote por cilindros pneum&aacute;ticos;</li><li>Comando de acionamento da serra e avan&ccedil;o da corrente por meio de painel el&eacute;trico pr&eacute; fixados na lateral da m&aacute;quina;</li></ul><p><strong>DADOS T&Eacute;CNICOS</strong></p><ul><li>Comprimento m&aacute;ximo do pacote = 3000 mm&nbsp;</li><li>Comprimento m&iacute;nimo do pacote = 700 mm&nbsp;</li><li>Largura m&aacute;xima do pacote = 1400 mm&nbsp;</li><li>Velocidade da esteira = 12 m/min</li><li>Cilindros pneum&aacute;ticos = 02 de &Oslash;100 x 500 mm</li><li>Pot&ecirc;ncia total instalada = 9,8 kW</li><li>Peso Total = 1800 Kg</li><li>Velocidade de corte = 4,5 m/min</li></ul><p><strong>MODELOS DE FABRICA&Ccedil;&Atilde;O</strong></p><ul><li>DP28 = 2800 mm</li></ul><p>|||</p><p><strong>MAIN FEATURES</strong></p><ul><li>Traction system by geared motor and transport by chains;</li><li>High robustness;</li><li>Easy operation with laser measuring system for package alignment;</li><li>Fixed packet displacement speed;</li><li>Fixing the package by pneumatic cylinders;</li><li>Saw drive command and chain advance through a pre-fixed electrical panel on the side of the machine;</li></ul><p><strong>TECHNICAL DATA</strong></p><ul><li>Maximum package length = 3000 mm&nbsp;</li><li>Minimum length of the package = 700 mm&nbsp;</li><li>Maximum package width = 1400 mm&nbsp;</li><li>Belt advance speed = 12 m/min</li><li>Pneumatic cylinders = 02 de &Oslash;100 x 500 mm</li><li>Total installed power = 9,8 kW</li><li>Total weight = 1800 Kg</li><li>Cutting speed = 4,5 m/min</li></ul><p><strong>MANUFACTURING MODELS</strong></p><ul><li>DP28 = 2800 mm</li></ul><p>|||</p><p><strong>DATOS DEL EQUIPO</strong></p><ul><li>Sistema de tra&ccedil;&atilde;o por moto-redutor e transporte por correntes;</li><li>Alta robustez;</li><li>F&aacute;cil opera&ccedil;&atilde;o com sistema de medi&ccedil;&atilde;o laser para alinhamento do pacote;</li><li>Velocidade de avan&ccedil;o do pacote fixo;</li><li>Fixa&ccedil;&atilde;o do pacote por cilindros pneum&aacute;ticos;</li><li>Comando de acionamento da serra e avan&ccedil;o da corrente por meio de painel el&eacute;trico pr&eacute; fixados na lateral da m&aacute;quina;</li></ul><p><strong>DATOS T&Eacute;CNICOS</strong></p><ul><li>Comprimento m&aacute;ximo do pacote = 3000 mm&nbsp;</li><li>Comprimento m&iacute;nimo do pacote = 700 mm&nbsp;</li><li>Largura m&aacute;xima do pacote = 1400 mm&nbsp;</li><li>Velocidade da esteira = 12 m/min</li><li>Cilindros pneum&aacute;ticos = 02 de &Oslash;100 x 500 mm</li><li>Pot&ecirc;ncia total instalada = 9,8 kW</li><li>Peso Total = 1800 Kg</li><li>Velocidade de corte = 4,5 m/min</li></ul><p><strong>MODELOS DE FABRICACI&Oacute;N</strong></p><ul><li>DP28 = 2800 mm</li></ul><p>&nbsp;</p>', NULL, 1, NULL, '2022-09-13 10:12:17', 'destopadeira-para-pacotes-laminas-serie-dp', 0),
(116, 40, 'EMPILHADOR A VÁCUO série EAV|||VENEER STACKER type EAV|||APILADOR AL VACÍO serie EAV', '<p><strong>DADOS DO EQUIPAMENTO</strong></p><ul><li>Alta velocidade de empacotamento de l&acirc;minas (140m/min);</li><li>Estrutura refor&ccedil;ada com tubo quadrados;</li><li>Ventiladores centr&iacute;fugos de alta efici&ecirc;ncia;</li><li>Centradores laterais pneum&aacute;ticos ajustav&eacute;is altura e largura;</li><li>Correias de transportes sincronizadas tipo &ldquo;T&rdquo; devidamente guiadas evitando o descolamento da folhas;</li><li>Vigas de v&aacute;cuo com perfil otimizado, uniformizando assim seu v&aacute;cuo por toda a viga.</li></ul><p><strong>DADOS T&Eacute;CNICOS</strong></p><ul><li>Espessura de L&acirc;minas = 1 &ndash; 4 mm&nbsp;</li><li>Velocidade de empacotamento = 140m/min&nbsp;</li><li>Velocidade da esteira entrada = 140 m/min</li><li>Pot&ecirc;ncia dos ventiladores = 2 x 20 CV</li><li>Pot&ecirc;ncia de acionamento correias = 5 CV</li></ul><p><strong>MODELOS DE FABRICA&Ccedil;&Atilde;O</strong></p><ul><li>EAV14 = 1400 mm&nbsp;</li><li>EAV18 = 1800 mm&nbsp;</li><li>EAV24 = 2400 mm</li><li>EAV28 = 2800 mm</li><li>EAV33 = 3300 mm</li></ul><p>&nbsp;</p><p>|||</p><p><strong>MAIN FEATURES</strong></p><ul><li>High veneer packaging speed (140m/min);</li><li>Robust frame with square tubes;</li><li>Centrifugal fans with high efficiency and low energy consumption;</li><li>Pneumatic side aligners, adjustable height and width;</li><li>Synchronized transport belts type &ldquo;T&rdquo; properly guided avoiding the detachment of the veneers;</li><li>Vacuum beams with optimized profile, thus standardizing the entire beam.</li></ul><p><strong>TECHNICAL DATA</strong></p><ul><li>Thickness of veneers = 1 &ndash; 4 mm&nbsp;</li><li>Packaging speed = 140m/min&nbsp;</li><li>Inlet conveyor speed = 140 m/min</li><li>Fan power = 2 x 20 CV</li><li>Belt drive power = 5 CV</li></ul><p><strong>MANUFACTURING MODELS</strong></p><ul><li>EAV14 = 1400 mm&nbsp;</li><li>EAV18 = 1800 mm&nbsp;</li><li>EAV24 = 2400 mm</li><li>EAV28 = 2800 mm</li><li>EAV33 = 3300 mm</li></ul><p>|||</p><p><strong>DATOS DEL EQUIPO</strong></p><ul><li>Alta velocidade de empacotamento de l&acirc;minas (140m/min);</li><li>Estrutura refor&ccedil;ada com tubo quadrados;</li><li>Ventiladores centr&iacute;fugos de alta efici&ecirc;ncia;</li><li>Centradores laterais pneum&aacute;ticos ajustav&eacute;is altura e largura;</li><li>Correias de transportes sincronizadas tipo &laquo;T&raquo; devidamente guiadas evitando o descolamento da folhas;</li><li>Vigas de v&aacute;cuo com perfil otimizado, uniformizando assim seu v&aacute;cuo por toda a viga.</li></ul><p><strong>DATOS T&Eacute;CNICOS</strong></p><ul><li>Espessura de L&acirc;minas = 1 &ndash; 4 mm&nbsp;</li><li>Velocidade de empacotamento = 140m/min&nbsp;</li><li>Velocidade da esteira entrada = 140 m/min</li><li>Pot&ecirc;ncia dos ventiladores = 2 x 20 CV</li><li>Pot&ecirc;ncia de acionamento correias = 5 CV</li></ul><p><strong>MODELOS DE FABRICACI&Oacute;N</strong></p><ul><li>EAV14 = 1400 mm&nbsp;</li><li>EAV18 = 1800 mm&nbsp;</li><li>EAV24 = 2400 mm</li><li>EAV28 = 2800 mm</li><li>EAV33 = 3300 mm</li></ul>', NULL, 1, NULL, '2022-09-13 10:15:16', 'empilhador-a-vacuo-serie-eav', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos_relacionados`
--

CREATE TABLE `produtos_relacionados` (
  `prr_id` int(11) DEFAULT NULL,
  `prd_relaciona` int(11) DEFAULT NULL,
  `prd_relacionado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto_categoria`
--

CREATE TABLE `produto_categoria` (
  `cat_id` int(11) NOT NULL,
  `cat_pai` int(11) DEFAULT NULL,
  `cat_titulo` varchar(256) DEFAULT NULL,
  `cat_descricao` text DEFAULT NULL,
  `cat_img` varchar(256) DEFAULT NULL,
  `cat_ordem` int(11) NOT NULL,
  `cat_slug` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `produto_categoria`
--

INSERT INTO `produto_categoria` (`cat_id`, `cat_pai`, `cat_titulo`, `cat_descricao`, `cat_img`, `cat_ordem`, `cat_slug`) VALUES
(40, NULL, 'Nossa linha de Produtos |||  Our Product Line |||  Nuestra línea de productos', NULL, NULL, 1, 'produtos');

-- --------------------------------------------------------

--
-- Estrutura da tabela `servicos`
--

CREATE TABLE `servicos` (
  `ser_id` int(11) NOT NULL,
  `ser_titulo` varchar(128) NOT NULL,
  `ser_url` varchar(128) NOT NULL,
  `ser_desc` text NOT NULL,
  `ser_status` tinyint(1) NOT NULL,
  `ser_datahora` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `servicos`
--

INSERT INTO `servicos` (`ser_id`, `ser_titulo`, `ser_url`, `ser_desc`, `ser_status`, `ser_datahora`) VALUES
(1, 'CALDEIRARIA/ SOLDA|||BOILER / WELDING|||CALDERA / SOLDADURA', 'd2798-solda-mig-mag-300x225.png', '<p>Montagem e execu&ccedil;&atilde;o de projetos mec&acirc;nicos;</p><ul><li>Solda MIG /TIG;</li><li>&nbsp;Solda com eletrodo revestido, a&ccedil;o carbono, a&ccedil;o inox, fundidos;</li><li>Caldeiraria de precis&atilde;o;</li></ul><p>|||</p><p>Assembly and execution of mechanical projects;</p><ul><li>MIG/TIG welding;</li><li>Welding with coated electrode, carbon steel, stainless steel, castings;</li><li>Precision boilermaking;</li></ul><p>|||</p><p>Montaje y ejecuci&oacute;n de proyectos mec&aacute;nicos;</p><ul><li>Soldadura MIG / TIG;</li><li>Soldadura con electrodo revestido, acero al carbono, acero inoxidable, piezas fundidas;</li><li>Calderer&iacute;a de precisi&oacute;n;</li></ul>', 1, 0),
(2, 'CORTE/ DOBRA|||CUT/FOLD|||CORTE / PLEGADO', '3358b-conformacao-cortes-300x225.png', '<p>Servi&ccedil;os de cortes e dobras;</p><ul><li>Cortes de chapas;</li><li>Fabrica&ccedil;&atilde;o de perfis dobrados;</li><li>Pe&ccedil;as seriadas estampadas;</li><li>Calandra de chapas e tubos;</li></ul><p>|||</p><p>Cutting and folding services;</p><ul><li>Sheet cuts;</li><li>Manufacture of bent</li><li>Profiles;</li><li>Serial stamped parts;</li><li>Plate and tube calender;</li></ul><p>|||</p><p>Servicios de corte y plegado;</p><ul><li>Cortes de hojas;</li><li>Fabricaci&oacute;n de perfiles curvados;</li><li>Piezas estampadas en serie;</li><li>Calendario de placa y tubo;</li></ul>', 1, 0),
(3, 'TRATAMENTO TÉRMICO|||HEAT TREATMENT|||TRATAMIENTO TÉRMICO', '2830b-tratamento-termico-300x225.png', '<p>Servi&ccedil;os de tratamento t&eacute;rmico como:</p><ul><li>T&ecirc;mpera;</li><li>Cementa&ccedil;&atilde;o;</li><li>Revenimento;</li><li>Normaliza&ccedil;&atilde;o;</li></ul><p>|||</p><p>Heat treatment services such as:</p><ul><li>Quenching;</li><li>Cementation;</li><li>Tempering;</li><li>Normalization;</li></ul><p>|||</p><p>Servicios de tratamiento t&eacute;rmico como:</p><ul><li>Temple;</li><li>Cementaci&oacute;n;</li><li>Templado;</li><li>Normalizaci&oacute;n;</li></ul><p>&nbsp;</p>', 1, 0),
(4, 'USINAGEM|||MACHINING|||MECANIZADO', '0e3d2-usinagem-300x225.png', '<p>Servi&ccedil;os de usinagem de alta qualidade;</p><ul><li>Torneamento;</li><li>Fresamento</li><li>Fura&ccedil;&atilde;o;</li><li>Plainamento;</li><li>Mandrilhadora;</li></ul><p>|||</p><p>High quality machining services;</p><ul><li>Turning;</li><li>Milling</li><li>Hurricane;</li><li>Planning;</li><li>Boring machine;</li></ul><p>|||</p><p>Servicios de mecanizado de alta calidad;</p><ul><li>Torneado;</li><li>Molienda</li><li>Hurac&aacute;n;</li><li>Planificaci&oacute;n;</li><li>Maquina aburrida;</li></ul>', 1, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `usr_id` bigint(20) NOT NULL,
  `usr_email` varchar(255) DEFAULT NULL,
  `usr_senha` varchar(255) DEFAULT NULL,
  `usr_nome` varchar(100) DEFAULT NULL,
  `usr_nivel` enum('admin','normal') NOT NULL,
  `usr_token` varchar(256) NOT NULL,
  `usr_status` tinyint(1) DEFAULT 1,
  `usr_dt_ins` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`usr_id`, `usr_email`, `usr_senha`, `usr_nome`, `usr_nivel`, `usr_token`, `usr_status`, `usr_dt_ins`) VALUES
(1, 'david@drcriativo.com.br', '8ddc9281274eaebd1dd358819703a265', 'David Weingartner', 'admin', '', 1, '2021-01-18 08:28:27');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`ban_id`);

--
-- Índices para tabela `depoimentos`
--
ALTER TABLE `depoimentos`
  ADD PRIMARY KEY (`dep_id`);

--
-- Índices para tabela `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`est_id`);

--
-- Índices para tabela `fotos_produto`
--
ALTER TABLE `fotos_produto`
  ADD PRIMARY KEY (`fot_id`),
  ADD KEY `prd_id` (`prd_id`);

--
-- Índices para tabela `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`mnu_id`);

--
-- Índices para tabela `menu_usuario`
--
ALTER TABLE `menu_usuario`
  ADD KEY `menu_id` (`mnu_id`),
  ADD KEY `usr_id` (`usr_id`);

--
-- Índices para tabela `noticia`
--
ALTER TABLE `noticia`
  ADD PRIMARY KEY (`not_id`);

--
-- Índices para tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`prd_id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Índices para tabela `produtos_relacionados`
--
ALTER TABLE `produtos_relacionados`
  ADD KEY `prd_relaciona` (`prd_relaciona`),
  ADD KEY `prd_relacionado` (`prd_relacionado`);

--
-- Índices para tabela `produto_categoria`
--
ALTER TABLE `produto_categoria`
  ADD PRIMARY KEY (`cat_id`);

--
-- Índices para tabela `servicos`
--
ALTER TABLE `servicos`
  ADD PRIMARY KEY (`ser_id`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`usr_id`),
  ADD UNIQUE KEY `usr_idPrimária` (`usr_id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `banner`
--
ALTER TABLE `banner`
  MODIFY `ban_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de tabela `depoimentos`
--
ALTER TABLE `depoimentos`
  MODIFY `dep_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de tabela `estado`
--
ALTER TABLE `estado`
  MODIFY `est_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de tabela `fotos_produto`
--
ALTER TABLE `fotos_produto`
  MODIFY `fot_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=169;

--
-- AUTO_INCREMENT de tabela `menu`
--
ALTER TABLE `menu`
  MODIFY `mnu_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de tabela `noticia`
--
ALTER TABLE `noticia`
  MODIFY `not_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `prd_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT de tabela `produto_categoria`
--
ALTER TABLE `produto_categoria`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de tabela `servicos`
--
ALTER TABLE `servicos`
  MODIFY `ser_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `usr_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `fotos_produto`
--
ALTER TABLE `fotos_produto`
  ADD CONSTRAINT `fotos_produto_ibfk_1` FOREIGN KEY (`prd_id`) REFERENCES `produto` (`prd_id`);

--
-- Limitadores para a tabela `menu_usuario`
--
ALTER TABLE `menu_usuario`
  ADD CONSTRAINT `menu_usuario_ibfk_1` FOREIGN KEY (`mnu_id`) REFERENCES `menu` (`mnu_id`),
  ADD CONSTRAINT `menu_usuario_ibfk_2` FOREIGN KEY (`usr_id`) REFERENCES `usuario` (`usr_id`);

--
-- Limitadores para a tabela `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `produto_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `produto_categoria` (`cat_id`);

--
-- Limitadores para a tabela `produtos_relacionados`
--
ALTER TABLE `produtos_relacionados`
  ADD CONSTRAINT `produtos_relacionados_ibfk_1` FOREIGN KEY (`prd_relaciona`) REFERENCES `produto` (`prd_id`),
  ADD CONSTRAINT `produtos_relacionados_ibfk_2` FOREIGN KEY (`prd_relacionado`) REFERENCES `produto` (`prd_id`);
--
-- Banco de dados: `professormarlos`
--
CREATE DATABASE IF NOT EXISTS `professormarlos` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `professormarlos`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `acessos`
--

CREATE TABLE `acessos` (
  `id_acesso` int(9) NOT NULL,
  `nome_acesso` varchar(128) DEFAULT NULL,
  `url_acesso` varchar(128) DEFAULT NULL,
  `icone_acesso` varchar(28) DEFAULT NULL,
  `pai_acesso` int(9) DEFAULT NULL,
  `ordem_acesso` int(9) DEFAULT NULL,
  `status_acesso` tinyint(1) DEFAULT NULL,
  `adm_acesso` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `acessos`
--

INSERT INTO `acessos` (`id_acesso`, `nome_acesso`, `url_acesso`, `icone_acesso`, `pai_acesso`, `ordem_acesso`, `status_acesso`, `adm_acesso`) VALUES
(40, 'Perfil', 'perfil/usuario', 'fa fa-user', 45, 2, 1, 1),
(41, 'Usuários', 'usuario/logins', 'fa fa-users', 45, 1, 1, 1),
(42, 'Acessos', 'gerencia/acessos', 'fa fa-lock', 45, 4, 1, 1),
(43, 'Inicio', 'inicio/', 'fa fa-home', NULL, 1, 1, 1),
(45, 'Configurações', '#', 'fa fa-gear', NULL, 3, 1, 1),
(46, 'Criação de conteúdo', '#', 'fa fa-chart-line', NULL, 3, 1, 1),
(48, 'Blog', 'conteudo/noticias', 'fa fa-newspaper', 46, 2, 1, 1),
(49, 'Banner', 'banner/', 'fa fa-image', 46, 1, 1, 1),
(50, 'Linha do Tempo', 'conteudo/quem-somos', 'fa fa-landmark', 46, 5, 1, 1),
(51, 'Serviços', 'conteudo/servicos', 'fa fa-box-open', 63, 5, 1, 1),
(52, 'Indicadores', 'conteudo/indicadores', 'fa fa-arrow-up-9-1', 46, 3, 1, 1),
(53, 'Galeria ', 'conteudo/galeria', 'fa fa-image', 46, 7, 1, 1),
(54, 'Contato', 'conteudo/rede-social', 'fa fa-phone', NULL, 3, 1, 1),
(55, 'Redes Sociais', 'conteudo/rede-social', 'fa fa-instagram', 54, 1, 1, 1),
(56, 'Servidor de E-mail', 'conteudo/email', 'fa fa-envelope', 54, 2, 1, 1),
(57, 'Depoimentos', 'conteudo/depoimentos', 'fa fa-comments', 46, 7, 1, 1),
(58, 'Configuração de SEO', 'conteudo/seo', 'fa fa-users', 46, 9, 1, 1),
(59, 'Como Funciona', 'conteudo/como-funciona', 'fa fa-list', 46, 9, 1, 1),
(60, 'Categorias', 'conteudo/categorias', 'fa fa-users', 63, 7, 1, 1),
(61, 'Midias de cursos', 'conteudo/midia-curso', 'fa fa-image', 46, 1, 1, 1),
(62, 'Cupons', 'conteudo/cupons', 'fa fa-ticket', 63, 9, 1, 1),
(63, 'Plataforma de Alunos', '#', 'fa fa-book', NULL, 2, 1, 1),
(64, 'Clientes', 'conteudo/alunos', 'fa fa-users', 63, 9, 1, 1),
(65, 'Aulas', 'conteudo/curso', 'fa fa-book', 63, 3, 1, 1),
(66, 'Vendas', 'conteudo/vendas', 'fa fa-money', 63, 4, 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `banners_home`
--

CREATE TABLE `banners_home` (
  `id_banner` int(11) NOT NULL,
  `url_banner` varchar(128) DEFAULT NULL,
  `titulo_banner` varchar(56) DEFAULT NULL,
  `ordem_banner` int(11) DEFAULT NULL,
  `link_redirecionamento_banner` varchar(128) DEFAULT NULL,
  `texto_botao_banner` varchar(28) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `banners_home`
--

INSERT INTO `banners_home` (`id_banner`, `url_banner`, `titulo_banner`, `ordem_banner`, `link_redirecionamento_banner`, `texto_botao_banner`) VALUES
(1, '2-7b506.png', 'Passe no concurso que tanto deseja!', 4, 'https://professormarlos.com.br/servicos', 'Saiba Mais!'),
(2, '1.png', 'Receba as nossas Mentorias de forma online', 5, 'https://professormarlos.com.br/contato', 'Saiba Mais!'),
(4, 'banner-sc-1920680px.png', 'Concursos em Santa Catarina', 2, 'https://professormarlos.com.br/noticia/1', 'Saiba Mais!'),
(5, 'banner-pmsc.png', NULL, 3, 'https://professormarlos.com.br/noticia/3', 'Saiba Mais!'),
(6, 'BANNER-PC-PM-2-93d76.png', 'Curso Presencial PMSC e PCSC', 1, 'https://professormarlos.com.br/39', 'QUERO APRENDER');

-- --------------------------------------------------------

--
-- Estrutura da tabela `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `titulo` varchar(128) DEFAULT NULL,
  `descricao` varchar(256) DEFAULT NULL,
  `imagem` text DEFAULT NULL,
  `ordem` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `categorias`
--

INSERT INTO `categorias` (`id`, `titulo`, `descricao`, `imagem`, `ordem`) VALUES
(1, 'Mentorias', 'teste', 'istockphoto-648236294-612x612.jpg', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nome` varchar(28) DEFAULT NULL,
  `sobrenome` varchar(128) DEFAULT NULL,
  `cpf` varchar(11) DEFAULT NULL,
  `email` varchar(56) DEFAULT NULL,
  `celular` varchar(12) DEFAULT NULL,
  `cep` varchar(12) DEFAULT NULL,
  `endereco` varchar(128) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `bairro` varchar(64) DEFAULT NULL,
  `uf` varchar(128) DEFAULT NULL,
  `cidade` varchar(64) DEFAULT NULL,
  `senha` varchar(512) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `data_cadastro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`id`, `nome`, `sobrenome`, `cpf`, `email`, `celular`, `cep`, `endereco`, `numero`, `bairro`, `uf`, `cidade`, `senha`, `status`, `data_cadastro`) VALUES
(11, 'Guilherme', 'Scholl', '10163024952', 'guilhermescholl99@gmail.com', '49988641497', '89504-569', 'Rodovia Daniel Lessing', 92, 'Reunidas', 'SC', 'Caçador', '3171c55343c3991c0387c2f688c3da36', 1, '2023-03-01 12:46:58'),
(12, 'Débora Emili ', 'Pasquali', '10864080980', 'guilherme.cs2001@aluno.ifsc.edu.br', '49988641497', '89504569', 'ap', 1301, 'Reunidas', 'Santa Catarina', 'Caçador', '3171c55343c3991c0387c2f688c3da36', 1, '2023-03-08 17:05:56');

-- --------------------------------------------------------

--
-- Estrutura da tabela `como_funciona`
--

CREATE TABLE `como_funciona` (
  `id_topico` int(11) NOT NULL,
  `titulo_topico` varchar(256) DEFAULT NULL,
  `numero_topico` int(11) DEFAULT NULL,
  `descricao_topico` text DEFAULT NULL,
  `ativo_topico` tinyint(1) DEFAULT NULL,
  `url_topico` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `como_funciona`
--

INSERT INTO `como_funciona` (`id_topico`, `titulo_topico`, `numero_topico`, `descricao_topico`, `ativo_topico`, `url_topico`) VALUES
(1, ' Entendendo o Aluno', 1, '<p>O primeiro passo no trabalho de um mentor &eacute; conhecer a fundo o seu aluno, definindo seu perfil de estudante, entendendo sua situa&ccedil;&atilde;o de vida atual, suas circunst&acirc;ncia, sua voca&ccedil;&atilde;o, seu chamado e seu perfil emocional. Suas experi&ecirc;ncias em provas anteriores e suas necessidades de curto, m&eacute;dio e longo prazo.</p>\r\n\r\n<p>Atrav&eacute;s de um formul&aacute;rio de an&aacute;lise comportamental e do seu perfil de estudante e a utiliza&ccedil;&atilde;o de algumas ferramentas no in&iacute;cio do programa, entenderei seus objetivos de aprova&ccedil;&atilde;o e seu estado atual. Mapearemos seus h&aacute;bitos, rotinas, n&iacute;vel de conhecimento, cren&ccedil;as e valores.</p>\r\n', 1, '1.jpg'),
(2, 'Definição do Planejamento', 2, '<p>A partir destas informa&ccedil;&otilde;es e da an&aacute;lise comportamental, ser&aacute; realizado nosso primeiro encontro, momento em que te apresentarei as defini&ccedil;&otilde;es iniciais do programa, seus fundamentos e prop&oacute;sitos.</p>\r\n\r\n<p>Nesse primeiro encontro faremos a an&aacute;lise pormenorizada do seu processo de prepara&ccedil;&atilde;o e estabeleceremos a primeira meta de estudos, com grade de hor&aacute;rios, indica&ccedil;&atilde;o de fontes de estudo (livros, legisla&ccedil;&atilde;o, informativos, quest&otilde;es objetivas, revis&otilde;es), ferramentas de controle de tempo, m&eacute;todo de revis&atilde;o e de aquisi&ccedil;&atilde;o eficaz dos conhecimentos previstos no edital, al&eacute;m de um simulado de quest&otilde;es objetivas para avalia&ccedil;&atilde;o do seu desempenho em provas anteriores.</p>\r\n\r\n<p>Lembre-se: o plano de a&ccedil;&atilde;o &eacute; baseado em uma precisa metodologia e focado nos seus objetivos.</p>\r\n', 1, '2.jpg'),
(3, 'Implementação', 3, '<p>Voc&ecirc; saber&aacute; exatamente como e por onde estudar. Al&eacute;m disso, durante os encontros voc&ecirc; ter&aacute; acesso a um m&eacute;todo que abordar&aacute; os 6 passos necess&aacute;rios para aprova&ccedil;&atilde;o em concursos: Mindset, Produtividade, Planejamento, Aprendizagem acelerada, t&eacute;cnicas de estudo e intelig&ecirc;ncia emocional.</p>\r\n', NULL, '3.jpg'),
(4, 'Acompanhamento', 4, '<p>Eu vou pessoalmente monitorar e adaptar o seu planejamento, pegando na sua m&atilde;o para que n&atilde;o desperdice nem um minuto sequer do seu dia. Esse trabalho &eacute; t&atilde;o ou mais importante que as etapas iniciais de an&aacute;lise, elabora&ccedil;&atilde;o da estrat&eacute;gia e implementa&ccedil;&atilde;o.</p>\r\n\r\n<p>Ou seja, faremos um grande e profundo exame do retrato de seu trajeto: passado, presente e futuro desejado. Descobrindo exatamente quem &eacute; voc&ecirc;, terei condi&ccedil;&otilde;es de auxili&aacute;-lo a desobstruir o caminho da aprova&ccedil;&atilde;o, eliminando todos os obst&aacute;culos que eventualmente possam estar presentes, impedindo o avan&ccedil;o consistente.</p>\r\n\r\n<p>Assim, fica claro que, com clareza, disciplina e determina&ccedil;&atilde;o, o alto desempenho nos estudos e a aprova&ccedil;&atilde;o nos concursos podem ser alcan&ccedil;ados de maneira certa e r&aacute;pida.</p>\r\n\r\n<p>&zwnj;</p>\r\n', NULL, '4.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cupons`
--

CREATE TABLE `cupons` (
  `id` int(11) NOT NULL,
  `data_cadastro` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_validade` timestamp NOT NULL DEFAULT current_timestamp(),
  `qtde` int(11) DEFAULT NULL,
  `codigo_cupom` varchar(32) DEFAULT NULL,
  `valor_cupom` float DEFAULT NULL,
  `tipo` char(1) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cupons`
--

INSERT INTO `cupons` (`id`, `data_cadastro`, `data_validade`, `qtde`, `codigo_cupom`, `valor_cupom`, `tipo`, `status`) VALUES
(1, '2023-03-03 18:28:48', '2023-03-10 02:00:00', 0, 'PRIMEIRACOMPRA', 28, 'R', 1),
(2, '2023-03-03 19:30:46', '2023-03-08 03:00:00', 6, 'PORCENTAGEM10', 10, 'P', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `depoimentos`
--

CREATE TABLE `depoimentos` (
  `id_depoimento` int(11) NOT NULL,
  `url_depoimento` varchar(256) DEFAULT NULL,
  `nome_depoimento` varchar(128) DEFAULT NULL,
  `texto_depoimento` varchar(512) DEFAULT NULL,
  `data_depoimento` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `depoimentos`
--

INSERT INTO `depoimentos` (`id_depoimento`, `url_depoimento`, `nome_depoimento`, `texto_depoimento`, `data_depoimento`) VALUES
(1, '1-ba1a9.jpeg', 'Nilene Souza', '<p>Ol&aacute;</p>', '2022-12-05 11:17:36'),
(2, '2-48bff.jpeg', 'Guilherme Silveira', '<p>teste2</p>', '2022-12-05 11:17:23'),
(3, '6.jpeg', 'Mayara', NULL, '2022-12-05 11:16:30'),
(4, '7.jpeg', 'Marcela Roratto', NULL, '2022-12-05 11:16:52'),
(5, '8.jpeg', 'Eduardo do Santos', NULL, '2022-12-05 11:17:10'),
(6, '10.jpeg', 'Brenda Eliz', NULL, '2022-12-05 11:17:57'),
(7, '11.jpeg', 'Cauê José', NULL, '2022-12-05 11:18:23'),
(8, 'paulo-rod.jpg', 'Paulo Rodrigueiro Carvalho Junior', NULL, '2022-12-09 20:03:25'),
(9, 'eduardo-do-santos.jpg', 'Eduardo dos Santos', NULL, '2022-12-22 14:38:07');

-- --------------------------------------------------------

--
-- Estrutura da tabela `galeria`
--

CREATE TABLE `galeria` (
  `id_foto` int(11) NOT NULL,
  `url_foto` varchar(256) DEFAULT NULL,
  `ativa_foto` tinyint(1) DEFAULT NULL,
  `ordem_foto` int(11) DEFAULT NULL,
  `titulo_foto` varchar(128) DEFAULT NULL,
  `tipo` int(9) DEFAULT NULL,
  `url_video` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `galeria`
--

INSERT INTO `galeria` (`id_foto`, `url_foto`, `ativa_foto`, `ordem_foto`, `titulo_foto`, `tipo`, `url_video`) VALUES
(5, '1.jpeg', 1, 1, '1', 2, NULL),
(6, '2.jpeg', 1, 2, '1', 2, NULL),
(7, 'Imagem-do-WhatsApp-de-2022-12-05-as-17-13-51.jpg', 1, 3, '1', 2, NULL),
(8, '7-bfeb5.jpeg', 1, 4, '1', 2, NULL),
(9, 'depoimento.mp4', 1, 4, 'Teste', 1, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `indicadores`
--

CREATE TABLE `indicadores` (
  `id_indicador` int(11) NOT NULL,
  `nome_indicador` varchar(28) DEFAULT NULL,
  `numero_indicador` varchar(12) DEFAULT NULL,
  `ordem_indicador` int(11) DEFAULT NULL,
  `icone_indicador` varchar(28) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `indicadores`
--

INSERT INTO `indicadores` (`id_indicador`, `nome_indicador`, `numero_indicador`, `ordem_indicador`, `icone_indicador`) VALUES
(1, 'Alunos', '500', 1, 'fa fa-users'),
(3, 'Aprovações', '450', 3, 'fa fa-check');

-- --------------------------------------------------------

--
-- Estrutura da tabela `linha_tempo_empresa`
--

CREATE TABLE `linha_tempo_empresa` (
  `id_linha_tempo` int(11) NOT NULL,
  `ano_linha_tempo` int(11) DEFAULT NULL,
  `titulo_linha_tempo` varchar(28) DEFAULT NULL,
  `descricao_linha_tempo` varchar(128) DEFAULT NULL,
  `url_linha_tempo` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `midias`
--

CREATE TABLE `midias` (
  `id` int(11) NOT NULL,
  `id_servico` int(11) NOT NULL,
  `titulo` varchar(128) DEFAULT NULL,
  `descricao` varchar(512) DEFAULT NULL,
  `tipo` char(1) DEFAULT NULL,
  `url` text DEFAULT NULL,
  `ordem` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `arquivo` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `midias`
--

INSERT INTO `midias` (`id`, `id_servico`, `titulo`, `descricao`, `tipo`, `url`, `ordem`, `status`, `arquivo`) VALUES
(1, 25, 'Alguma Coisa', 'Bom dia', NULL, 'https://drive.google.com/file/d/1EGHnmmdgMaAkjPmNXpQmvMZNDqeu3wDk/view', 1, 1, 'POO---Aula-2.pdf'),
(2, 47, 'Fundamentos de Matemática', 'Neste Modulo você irá aprender fundamentos de Matemática  e seus', NULL, 'https://drive.google.com/file/d/1PYaEKP30b12HZtJG3NLSkEH-7BsBOwmC/view?usp=sharing', 1, 1, 'POO---Aula-2-44672.pdf'),
(3, 47, 'Jogadores do CAC, perderam de novo', 'Administrador', NULL, 'https://drive.google.com/file/d/1EGHnmmdgMaAkjPmNXpQmvMZNDqeu3wDk/view', 2, 1, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `midia_noticia`
--

CREATE TABLE `midia_noticia` (
  `id_midia_noticia` int(11) NOT NULL,
  `url_midia_noticia` varchar(128) DEFAULT NULL,
  `titulo_midia_noticia` varchar(56) DEFAULT NULL,
  `id_noticia` int(11) DEFAULT NULL,
  `capa_midia_noticia` tinyint(1) DEFAULT 0,
  `ordem_midia_noticia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `midia_noticia`
--

INSERT INTO `midia_noticia` (`id_midia_noticia`, `url_midia_noticia`, `titulo_midia_noticia`, `id_noticia`, `capa_midia_noticia`, `ordem_midia_noticia`) VALUES
(3, 'Copia-de-Instagram-post-frase-motivacional-preto-3.png', '1', 1, 1, 1),
(4, 'MAT_135830Museu_do_Contestado.jpg', 'Seletivo Caçador', 2, 1, NULL),
(5, 'Copia-de-CONCURSO-PMSC-AUTORIZADO-3.png', NULL, 3, 1, NULL),
(6, 'pcsc-blog-600250px.png', 'PCSC', 4, 1, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `noticias`
--

CREATE TABLE `noticias` (
  `id_noticia` int(11) NOT NULL,
  `titulo_noticia` varchar(128) DEFAULT NULL,
  `conteudo_noticia` text DEFAULT NULL,
  `tags_noticia` varchar(128) DEFAULT NULL,
  `data_noticia` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `noticias`
--

INSERT INTO `noticias` (`id_noticia`, `titulo_noticia`, `conteudo_noticia`, `tags_noticia`, `data_noticia`) VALUES
(1, 'Concursos públicos em Santa Catarina + de 1200 vagas.', '<br />O&nbsp;ano&nbsp;de&nbsp;2022&nbsp;foi&nbsp;marcado&nbsp;pela&nbsp;retomada&nbsp;das&nbsp;provas&nbsp;dos&nbsp;concursos.&nbsp;E&nbsp;no&nbsp;estado&nbsp;de&nbsp;Santa&nbsp;Catarina&nbsp;2022&nbsp;se&nbsp;encerra&nbsp;e&nbsp;2023&nbsp;come&ccedil;a&nbsp;com&nbsp;muitas&nbsp;oportunidades,&nbsp;s&atilde;o&nbsp;mais&nbsp;de&nbsp;1200&nbsp;vagas&nbsp;em&nbsp;pelo&nbsp;menos&nbsp;55&nbsp;concursos&nbsp;p&uacute;blicos,&nbsp;processos&nbsp;seletivos&nbsp;e&nbsp;chamadas&nbsp;p&uacute;blicas,&nbsp;&nbsp;as&nbsp;vagas&nbsp;dispon&iacute;veis&nbsp;s&atilde;o&nbsp;para&nbsp;cargos&nbsp;de&nbsp;todos&nbsp;os&nbsp;n&iacute;veis&nbsp;de&nbsp;escolaridade.<br />Al&eacute;m&nbsp;das&nbsp;vagas&nbsp;abertas,&nbsp;h&aacute;&nbsp;concursos&nbsp;para&nbsp;forma&ccedil;&atilde;o&nbsp;de&nbsp;cadastro&nbsp;de&nbsp;reserva&nbsp;&ndash;&nbsp;ou&nbsp;seja,&nbsp;os&nbsp;candidatos&nbsp;aprovados&nbsp;s&atilde;o&nbsp;chamados&nbsp;conforme&nbsp;a&nbsp;abertura&nbsp;de&nbsp;vagas&nbsp;durante&nbsp;a&nbsp;validade&nbsp;do&nbsp;concurso&nbsp;que&nbsp;em&nbsp;sua&nbsp;maioria&nbsp;&eacute;&nbsp;de&nbsp;2&nbsp;anos.<br />Confira&nbsp;abaixo&nbsp;alguns&nbsp;editais&nbsp;publicados:<br /><a href=\"https://concursossc.com.br/2022/12/04/concurso-publico-epagri-sc-edital-com100-vagas-e-salarios-de-ate-r-144-mil/?amp=1\"><strong>EPAGRI&nbsp;&ndash;&nbsp;Emp.&nbsp;de&nbsp;Pesquisa&nbsp;Agropecu&aacute;ria&nbsp;e&nbsp;Extens&atilde;o&nbsp;Rural</strong></a><br />&middot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Inscri&ccedil;&otilde;es&nbsp;at&eacute;&nbsp;21/12/2022<br />&middot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;100&nbsp;vagas&nbsp;at&eacute;&nbsp;R$&nbsp;14.456,71<br />&middot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;V&aacute;rios&nbsp;Cargos<br />&middot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;M&eacute;dio&nbsp;/&nbsp;T&eacute;cnico&nbsp;/&nbsp;Superior<br />&middot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=\"https://concursossc.com.br/wp-content/uploads/2022/11/edital-epagri.pdf\">Veja&nbsp;o&nbsp;edital</a><br /><a href=\"https://concursossc.com.br/2022/12/04/concurso-publico-cidasc-edital-publicado-54-vagas-e-inicial-ate-r-73-mil/?amp=1\"><strong>CIDASC&nbsp;&ndash;&nbsp;Companhia&nbsp;Integrada&nbsp;de&nbsp;Desenvolvimento&nbsp;Agr&iacute;cola</strong></a><br />&middot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Inscri&ccedil;&otilde;es&nbsp;at&eacute;&nbsp;10/01&nbsp;a&nbsp;08/02/2023<br />&middot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;54&nbsp;vagas&nbsp;at&eacute;&nbsp;R$&nbsp;7324,58<br />&middot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;V&aacute;rios&nbsp;Cargos<br />&middot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;M&eacute;dio&nbsp;/&nbsp;T&eacute;cnico&nbsp;/&nbsp;Superior<br />&middot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=\"https://2022cidasc.fepese.org.br/?go=download&amp;arquivo=2022_001_CP_CIDASC.pdf&amp;inline=1\">Veja&nbsp;o&nbsp;edital</a><br /><a href=\"https://concursossc.com.br/2022/12/10/corpo-de-bombeiros-militar-de-sc-realiza-concurso-publico-com-250-vagas/?amp=1\"><strong>CBM&nbsp;&ndash;&nbsp;Corpo&nbsp;de&nbsp;Bombeiros&nbsp;Militar</strong></a><br />&middot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Inscri&ccedil;&otilde;es&nbsp;at&eacute;&nbsp;05/01/2023<br />&middot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;250&nbsp;vagas&nbsp;at&eacute;&nbsp;R$&nbsp;6500,00<br />&middot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Soldado&nbsp;Bombeiro&nbsp;Militar<br />&middot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Superior<br />&middot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=\"https://d676e6gwpn3ec.cloudfront.net/concursos/1135/1_7448609.pdf\">Veja&nbsp;o&nbsp;edital</a><br /><a href=\"https://concursossc.com.br/2022/12/11/prefeitura-de-cacador-sc-anuncia-edital-de-processo-seletivo-com-salarios-de-ate-20-mil/?amp=1\"><strong>Prefeitura&nbsp;de&nbsp;Ca&ccedil;ador</strong></a><br />&middot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Inscri&ccedil;&otilde;es&nbsp;at&eacute;&nbsp;22/12/2022<br />&middot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Vagas&nbsp;at&eacute;&nbsp;R$&nbsp;20.860,19<br />&middot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;V&aacute;rios&nbsp;Cargos<br />&middot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Alfabetizado&nbsp;/&nbsp;Fundamental&nbsp;/&nbsp;M&eacute;dio&nbsp;/&nbsp;T&eacute;cnico&nbsp;/&nbsp;Superior<br />&middot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=\"https://cdn.legalleconcursos.com.br/edital/102/2184/1c64d17cbacf7f19b87ac7540594c016.pdf\">Veja&nbsp;o&nbsp;edital</a><br />&nbsp;<br /><a href=\"https://concursossc.com.br/2022/12/03/concurso-bombeiros-sc-para-cfo-edital-publicado-ate-r18-mil/?amp=1\"><strong>CBM&nbsp;&ndash;&nbsp;Corpo&nbsp;de&nbsp;Bombeiros&nbsp;Militar&nbsp;de&nbsp;Santa&nbsp;Catarina</strong></a><br />&middot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Inscri&ccedil;&otilde;es&nbsp;at&eacute;&nbsp;02/01/2023<br />&middot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;15&nbsp;vagas&nbsp;at&eacute;&nbsp;R$&nbsp;18.589,00<br />&middot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Curso&nbsp;de&nbsp;Forma&ccedil;&atilde;o&nbsp;de&nbsp;Oficiais<br />&middot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Superior<br />&middot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=\"https://concursossc.com.br/wp-content/uploads/2022/11/Edital_Bombeiros_SC_-_CFO_2023.pdf\">Veja&nbsp;o&nbsp;edital</a><br /><a href=\"https://concursossc.com.br/2022/12/04/prefeitura-de-balneario-camboriu-sc-realiza-concurso-publico-com-salarios-de-ate-r-13-mil/?amp=1\"><strong>Prefeitura&nbsp;de&nbsp;Balne&aacute;rio&nbsp;Cambori&uacute;</strong></a><br />&middot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Inscri&ccedil;&otilde;es&nbsp;at&eacute;&nbsp;19/12/2022<br />&middot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Diversas&nbsp;Vagas&nbsp;at&eacute;&nbsp;R$&nbsp;9801,88<br />&middot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;V&aacute;rios&nbsp;Cargos<br />&middot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Fundamental&nbsp;/&nbsp;M&eacute;dio&nbsp;/&nbsp;T&eacute;cnico&nbsp;/&nbsp;Superior<br />&middot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a target=\"_blank\" href=\"https://2022bcadm.fepese.org.br/?go=edital&amp;mn=1151b3eab3b069d5112ccae1943307c4&amp;edital=1\">Veja&nbsp;o&nbsp;edital</a><br /><a href=\"https://concursossc.com.br/2022/11/22/prefeitura-de-lages-sc-anuncia-edital-com-67-vagas-e-salarios-de-ate-176-mil/?amp=1\"><strong>Prefeitura&nbsp;de&nbsp;Lages</strong></a><br />&middot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Inscri&ccedil;&otilde;es&nbsp;at&eacute;&nbsp;22/12/2022<br />&middot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;67&nbsp;vagas&nbsp;at&eacute;&nbsp;R$&nbsp;17.685,16<br />&middot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;V&aacute;rios&nbsp;Cargos<br />&middot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Alfabetizado&nbsp;/&nbsp;Fundamental&nbsp;Incompleto&nbsp;/&nbsp;M&eacute;dio&nbsp;/&nbsp;T&eacute;cnico&nbsp;/&nbsp;Superior<br />&middot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=\"https://concursossc.com.br/wp-content/uploads/2022/12/edital_de_abertura_n_002_2022.pdf\">Veja&nbsp;o&nbsp;edital</a><br /><a target=\"_blank\" href=\"https://concursossc.com.br/2022/11/29/prefeitura-de-videira-sc-realiza-concurso-publico/?amp=1\"><strong>Prefeitura&nbsp;de&nbsp;Videira</strong></a><br />&middot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Inscri&ccedil;&otilde;es&nbsp;at&eacute;&nbsp;14/12/2022<br />&middot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Vagas&nbsp;at&eacute;&nbsp;R$&nbsp;4742,52<br />&middot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;V&aacute;rios&nbsp;Cargos<br />&middot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Superior<br />&middot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a target=\"_blank\" href=\"https://videiramagisterio.fepese.org.br/\">Veja&nbsp;o&nbsp;edital</a>', 'concurso,santa,catarina,servidor,carreira,vagas', '2022-12-05 11:33:51'),
(2, 'Processo Seletivo Prefeitura de Caçador-SC', '<p>No estado de Santa Catarina, a <strong>Prefeitura de Ca&ccedil;ador </strong>anuncia Processo Seletivo para profissionais de n&iacute;veis alfabetizado, fundamental, m&eacute;dio/t&eacute;cnico e superior.</p>\r\n\r\n<p>Prazo de inscri&ccedil;&otilde;es para os certames vai do dia <strong>07 a 22 de Dezembro de 2022</strong></p>\r\n\r\n<p>A prova ser&aacute; aplicada na data prov&aacute;vel de <strong>12 de fevereiro de 2023</strong>, em locais que ser&atilde;o divulgados no site da Banca. Conforme os editais, as oportunidades s&atilde;o para os seguintes cargos:</p>\r\n\r\n<p></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>N&iacute;vel Superior:</strong> Analista de Sistemas, Assistente Social, Auditor de Controle Interno, Advogado do CREAS, Bibliotec&aacute;rio, Bi&oacute;logo, Bioqu&iacute;mico, Contador, Enfermeiro, Engenheiro Agr&ocirc;nomo, Engenheiro Ambiental, Engenheiro Civil, Engenheiro Florestal, Engenheiro Sanitarista, Farmac&ecirc;utico, Fiscal Ambiental, Fiscal Sanitarista, Fisioterapeuta, Fonoaudi&oacute;logo, Instrutor de Artes Pl&aacute;sticas/ Artesanato, Jornalista, M&eacute;dico, M&eacute;dico, M&eacute;dico, M&eacute;dico do Trabalho, M&eacute;dico Infectologista, M&eacute;dico Psiquiatra, M&eacute;dico Psiquiatra, M&eacute;dico Veterin&aacute;rio, M&eacute;dico Plantonista, Nutricionista, Odont&oacute;logo, Orientador de Pesquisa, Pedagogo, Procurador Municipal , Professor de Artes C&ecirc;nicas, Professor de Dan&ccedil;a, Professor de Educa&ccedil;&atilde;o F&iacute;sica, Professor de Educa&ccedil;&atilde;o F&iacute;sica, Psic&oacute;logo, Tecn&oacute;logo em Alimentos, Terapeuta Ocupacional, Enfermeiro -, Odont&oacute;logo , M&eacute;dico, Psic&oacute;logo, Assistente Social, Fisioterapeuta, Professor De Educa&ccedil;&atilde;o F&iacute;sica, Nutricionista.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>N&iacute;vel m&eacute;dio t&eacute;cnico:</strong> Assistente Administrativo , Auxiliar em Sa&uacute;de Bucal , Auxiliar de Biblioteca, Auxiliar de Enfermagem , Auxiliar de Farm&aacute;cia, Consultor em Depend&ecirc;ncia Qu&iacute;mica, Educador Social, Fiscal de Obras e Posturas, Fiscal do Procon, Instrutor da Banda Musical Municipal Aurora, Instrutor de Canto, Instrutor de Dan&ccedil;a, Instrutor de Viol&atilde;o, Monitor, Monitor Instrumental, Professor Monitor, Telefonista, Tesoureiro, Top&oacute;grafo, T&eacute;cnico em Agrimensura, T&eacute;cnico em Administra&ccedil;&atilde;o, T&eacute;cnico em Contabilidade, T&eacute;cnico em Desenho, T&eacute;cnico em Enfermagem, T&eacute;cnico em Sa&uacute;de Bucal, T&eacute;cnico em Processamento de Dados, T&eacute;cnico em Programa&ccedil;&atilde;o de Computador , T&eacute;cnico em Seguran&ccedil;a do Trabalho, T&eacute;cnico Legislativo, T&eacute;cnico Tribut&aacute;rio, T&eacute;cnico em Vigil&acirc;ncia em Sa&uacute;de, Operador de Esta&ccedil;&atilde;o Aeron&aacute;utica, Eletricista, Operador de Pavimenta&ccedil;&atilde;o, Agente de Defesa Civil, Auxiliar em Sa&uacute;de Bucal, Auxiliar de Enfermagem , Agente Comunit&aacute;rio de Sa&uacute;de</p>\r\n	</li>\r\n</ul>\r\n\r\n<p></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>&nbsp;<strong>N&iacute;vel fundamental:</strong> Agente de Combate &agrave;s Endemias, Marceneiro, Monitor , Motorista, Pedreiro, Agente de Servi&ccedil;os e Obras Especiais, Guarda Patrimonial Municipal&nbsp;</p>\r\n	</li>\r\n</ul>\r\n\r\n<p></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>N&iacute;vel alfabetizado</strong><strong>:</strong> Operador de M&aacute;quinas, Auxiliar de Servi&ccedil;os Gerais , Auxiliar de Servi&ccedil;os Agr&iacute;colas e Florestais, Auxiliar de Servi&ccedil;os e Obras Especiais, Auxiliar de Servi&ccedil;os e Obras Publicas.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p></p>\r\n\r\n<p>Para concorrer a uma das chances &eacute; necess&aacute;rio que o candidato comprove o n&iacute;vel de escolaridade exigido para a fun&ccedil;&atilde;o em que deseja atuar, tenha idade m&iacute;nima de 18 anos, dentre outros requisitos que constam nos editais.</p>\r\n\r\n<p>Ao ser admitido, o profissional dever&aacute; cumprir jornadas de 20 a 44 horas semanais e contar&aacute; com remunera&ccedil;&atilde;o mensal de R$ 1.395,57 a R$ 20.860,19.</p>\r\n\r\n<p>Inscri&ccedil;&atilde;o e sele&ccedil;&atilde;o As inscri&ccedil;&otilde;es puderam ser realizadas de 7 de dezembro de 2022 a 22 de dezembro de 2022, pelo site da www.legalleconcursos.com.br, com taxas de R$ 30,00 a R$ 70,00.</p>\r\n\r\n<p><a href=\"https://legalleconcursos.com.br/editais/ver/1bc1f254c6ba0ef076f10af235afd47b\">Fazer Inscri&ccedil;&atilde;o</a></p>\r\n\r\n<p>Os candidatos ser&atilde;o classificados por meio de prova objetiva, tendo como conte&uacute;do program&aacute;tico quest&otilde;es de l&iacute;ngua portuguesa, matem&aacute;tica, legisla&ccedil;&atilde;o, conhecimentos espec&iacute;ficos.</p>\r\n\r\n<p>As datas previstas para a realiza&ccedil;&atilde;o das provas s&atilde;o: Edital n&ordm; 001/2022 &ndash; 12 de fevereiro de 2023</p>\r\n', 'Prefeitura,Caçador,Processo,seletivo,Caçador,Curso,Preparatório,Professor,Marlos', '2022-12-07 19:24:06'),
(3, 'Concurso Policia Militar de Santa Catarina', '<div style=\"text-align: justify;\">O&nbsp;Edital&nbsp;pode&nbsp;ser&nbsp;publicado&nbsp;a&nbsp;qualquer&nbsp;momento.&nbsp;Um&nbsp;dos&nbsp;concursos&nbsp;mais&nbsp;aguardados&nbsp;esta&nbsp;na&nbsp;fase&nbsp;de&nbsp;confec&ccedil;&atilde;o&nbsp;do&nbsp;edital.<br />Em&nbsp;setembro&nbsp;de&nbsp;2022&nbsp;a&nbsp;Policia&nbsp;Militar&nbsp;de&nbsp;Santa&nbsp;Catarina&nbsp;publicou&nbsp;a&nbsp;dispensa&nbsp;de&nbsp;licita&ccedil;&atilde;o&nbsp;para&nbsp;contrata&ccedil;&atilde;o&nbsp;da&nbsp;Banca&nbsp;CEBRASPE&nbsp;para&nbsp;organiza&ccedil;&atilde;o&nbsp;do&nbsp;certame.&nbsp;No&nbsp;dia&nbsp;05&nbsp;de&nbsp;novembro&nbsp;de&nbsp;2022&nbsp;o&nbsp;extrato&nbsp;do&nbsp;contrato&nbsp;onde&nbsp;formaliza&nbsp;a&nbsp;contra&ccedil;&atilde;o&nbsp;da&nbsp;banca&nbsp;foi&nbsp;publicado&nbsp;no&nbsp;di&aacute;rio&nbsp;oficial.<br />Segundo&nbsp;informa&ccedil;&otilde;es&nbsp;o&nbsp;edital&nbsp;esta&nbsp;nas&nbsp;fases&nbsp;finais&nbsp;e&nbsp;deve&nbsp;ser&nbsp;publicado&nbsp;em&nbsp;breve.<br />O&nbsp;Governo&nbsp;de&nbsp;Santa&nbsp;Catarina&nbsp;autorizou&nbsp;a&nbsp;realiza&ccedil;&atilde;o&nbsp;do&nbsp;concurso&nbsp;para&nbsp;preenchimento&nbsp;de&nbsp;500&nbsp;vagas&nbsp;para&nbsp;Soldado&nbsp;e&nbsp;50&nbsp;vagas&nbsp;para&nbsp;Oficial.<br />Ap&oacute;s&nbsp;a&nbsp;aprova&ccedil;&atilde;o&nbsp;no&nbsp;Curso&nbsp;de&nbsp;Forma&ccedil;&atilde;o&nbsp;de&nbsp;Soldados,&nbsp;os&nbsp;candidatos&nbsp;ter&atilde;o&nbsp;vencimentos&nbsp;iniciais&nbsp;de&nbsp;<strong>R$&nbsp;4.845,82</strong>,&nbsp;somando&nbsp;R$&nbsp;3.842,20&nbsp;de&nbsp;vencimentos&nbsp;b&aacute;sicos;&nbsp;at&eacute;&nbsp;R$&nbsp;739,62&nbsp;de&nbsp;Indeniza&ccedil;&atilde;o&nbsp;por&nbsp;Regime&nbsp;Especial&nbsp;de&nbsp;Servi&ccedil;o&nbsp;Ativo&nbsp;(IRESA);&nbsp;e&nbsp;R$&nbsp;12,00&nbsp;por&nbsp;dia&nbsp;&uacute;til&nbsp;do&nbsp;m&ecirc;s,&nbsp;a&nbsp;t&iacute;tulo&nbsp;de&nbsp;aux&iacute;lio&nbsp;alimenta&ccedil;&atilde;o.<br />Os&nbsp;requisitos&nbsp;para&nbsp;o&nbsp;cargo&nbsp;de&nbsp;Soldado&nbsp;PM&nbsp;SC&nbsp;s&atilde;o:<br />-&nbsp;Possuir&nbsp;n&iacute;vel&nbsp;superior&nbsp;em&nbsp;qualquer&nbsp;&aacute;rea&nbsp;de&nbsp;forma&ccedil;&atilde;o<br />-&nbsp;Altura&nbsp;m&iacute;nima&nbsp;de&nbsp;1,65m&nbsp;para&nbsp;homens<br />-&nbsp;Altura&nbsp;m&iacute;nima&nbsp;de&nbsp;1,60m&nbsp;para&nbsp;mulheres<br />-&nbsp;Possuir&nbsp;CNH&nbsp;em&nbsp;qualquer&nbsp;categoria<br />-&nbsp;N&atilde;o&nbsp;ter&nbsp;completado&nbsp;a&nbsp;idade&nbsp;m&aacute;xima&nbsp;de&nbsp;30&nbsp;anos&nbsp;at&eacute;&nbsp;o&nbsp;&uacute;ltimo&nbsp;dia&nbsp;de&nbsp;inscri&ccedil;&atilde;o&nbsp;no&nbsp;concurso&nbsp;p&uacute;blico<br />Os&nbsp;requisitos&nbsp;para&nbsp;o&nbsp;cargo&nbsp;de&nbsp;Oficial&nbsp;PM&nbsp;SC&nbsp;s&atilde;o:<br />-&nbsp;Bacharel&nbsp;em&nbsp;Direito;<br />-&nbsp;Altura&nbsp;m&iacute;nima&nbsp;de&nbsp;1,65m&nbsp;para&nbsp;homens;<br />-&nbsp;Altura&nbsp;m&iacute;nima&nbsp;de&nbsp;1,60m&nbsp;para&nbsp;mulheres;<br />-&nbsp;Possuir&nbsp;CNH&nbsp;em&nbsp;qualquer&nbsp;categoria;<br />-&nbsp;N&atilde;o&nbsp;ter&nbsp;completado&nbsp;a&nbsp;idade&nbsp;m&aacute;xima&nbsp;de&nbsp;30&nbsp;anos&nbsp;at&eacute;&nbsp;o&nbsp;&uacute;ltimo&nbsp;dia&nbsp;de&nbsp;inscri&ccedil;&atilde;o&nbsp;no&nbsp;concurso&nbsp;p&uacute;blico.<br />&Uacute;ltimo&nbsp;concurso&nbsp;foram&nbsp;<strong>25.450&nbsp;inscritos</strong>&nbsp;e&nbsp;ofertou&nbsp;800&nbsp;vagas&nbsp;para&nbsp;candidatos&nbsp;do&nbsp;sexo&nbsp;masculino&nbsp;e&nbsp;200&nbsp;vagas&nbsp;para&nbsp;candidatas&nbsp;do&nbsp;sexo&nbsp;feminino.<br />&nbsp;<br />O&nbsp;<strong>concurso&nbsp;PM&nbsp;SC</strong>&nbsp;Soldado&nbsp;foi&nbsp;composto&nbsp;de&nbsp;prova&nbsp;objetiva&nbsp;e&nbsp;reda&ccedil;&atilde;o&nbsp;que&nbsp;foi&nbsp;realizada&nbsp;na&nbsp;data&nbsp;do&nbsp;dia&nbsp;11&nbsp;de&nbsp;agosto&nbsp;de&nbsp;2019.&nbsp;Al&eacute;m&nbsp;de&nbsp;Avalia&ccedil;&atilde;o&nbsp;Psicol&oacute;gica,&nbsp;Teste&nbsp;de&nbsp;Avalia&ccedil;&atilde;o&nbsp;F&iacute;sica&nbsp;(TAF),&nbsp;Avalia&ccedil;&atilde;o&nbsp;de&nbsp;Sa&uacute;de&nbsp;(m&eacute;dico/odontol&oacute;gica),&nbsp;Exame&nbsp;Toxicol&oacute;gico&nbsp;e&nbsp;Investiga&ccedil;&atilde;o&nbsp;social&nbsp;realizadas&nbsp;conforme&nbsp;o&nbsp;cronograma.<br />A&nbsp;expectativa&nbsp;&eacute;&nbsp;que&nbsp;o&nbsp;edital&nbsp;seja&nbsp;publicado&nbsp;ainda&nbsp;no&nbsp;m&ecirc;s&nbsp;de&nbsp;dezembro&nbsp;e&nbsp;as&nbsp;provas&nbsp;objetivas&nbsp;para&nbsp;os&nbsp;meses&nbsp;de&nbsp;fevereiro&nbsp;ou&nbsp;mar&ccedil;o&nbsp;de&nbsp;2023.</div>&nbsp;', 'concurso,policia,militar,santa,catarina', '2022-12-12 17:51:53'),
(4, 'Concurso Policia Civil de Santa Catarina', '<div style=\"text-align: justify;\">Concurso&nbsp;P&uacute;blico&nbsp;Pol&iacute;cia&nbsp;Civil&nbsp;Santa&nbsp;Catarina<br /><br />Na&nbsp;&uacute;ltima&nbsp;segunda-feira,&nbsp;dia&nbsp;19,&nbsp;durante&nbsp;cerimonia&nbsp;do&nbsp;Curso&nbsp;de&nbsp;Forma&ccedil;&atilde;o&nbsp;o&nbsp;delegado-geral&nbsp;da&nbsp;Pol&iacute;cia&nbsp;Civil&nbsp;de&nbsp;Santa&nbsp;Catarina,&nbsp;Marcos&nbsp;Fl&aacute;vio&nbsp;Ghizoni&nbsp;J&uacute;nior&nbsp;anunciou&nbsp;um&nbsp;novo&nbsp;concurso&nbsp;PC&nbsp;SC,&nbsp;com&nbsp;2&nbsp;mil&nbsp;vagas,&nbsp;sendo&nbsp;1000&nbsp;para&nbsp;agente&nbsp;e&nbsp;1000&nbsp;escriv&atilde;o.<br /><br />A&nbsp;remunera&ccedil;&atilde;o&nbsp;inicial&nbsp;para&nbsp;os&nbsp;cargos&nbsp;&eacute;&nbsp;de&nbsp;R$&nbsp;5.290,95,&nbsp;podendo&nbsp;chegar&nbsp;a&nbsp;R$&nbsp;14.529,10&nbsp;ao&nbsp;final&nbsp;das&nbsp;carreiras,&nbsp;em&nbsp;ambos&nbsp;os&nbsp;cargos&nbsp;&eacute;&nbsp;preciso&nbsp;ter&nbsp;o&nbsp;n&iacute;vel&nbsp;superior.<br /><br />O&nbsp;&uacute;ltimo&nbsp;concurso&nbsp;PC&nbsp;SC&nbsp;que&nbsp;aconteceu&nbsp;no&nbsp;ano&nbsp;de&nbsp;2017,&nbsp;com&nbsp;oportunidades&nbsp;para&nbsp;escriv&atilde;o&nbsp;e&nbsp;agente,&nbsp;ofereceu&nbsp;394&nbsp;vagas,&nbsp;sendo&nbsp;200&nbsp;para&nbsp;agente&nbsp;e&nbsp;194&nbsp;para&nbsp;escriv&atilde;o.&nbsp;Na&nbsp;&eacute;poca,&nbsp;foi&nbsp;exigido&nbsp;o&nbsp;n&iacute;vel&nbsp;superior&nbsp;completo&nbsp;dos&nbsp;candidatos.<br /><br />A&nbsp;sele&ccedil;&atilde;o&nbsp;recebeu&nbsp;57.058&nbsp;candidatos&nbsp;para&nbsp;as&nbsp;vagas&nbsp;de&nbsp;ampla&nbsp;concorr&ecirc;ncia.&nbsp;Com&nbsp;29.249&nbsp;inscri&ccedil;&otilde;es&nbsp;s&oacute;&nbsp;para&nbsp;o&nbsp;cargo&nbsp;de&nbsp;agente.<br /><br />Todos&nbsp;os&nbsp;candidatos&nbsp;foram&nbsp;avaliados&nbsp;por&nbsp;meio&nbsp;de&nbsp;provas&nbsp;Objetivas,&nbsp;Teste&nbsp;de&nbsp;Aptid&atilde;o&nbsp;F&iacute;sica&nbsp;(TAF)&nbsp;e&nbsp;Avalia&ccedil;&atilde;o&nbsp;Psicol&oacute;gica.&nbsp;Os&nbsp;aprovados&nbsp;ainda&nbsp;realizaram&nbsp;um&nbsp;curso&nbsp;de&nbsp;forma&ccedil;&atilde;o.<br /><br />A&nbsp;primeira&nbsp;etapa,&nbsp;composta&nbsp;pelas&nbsp;avalia&ccedil;&otilde;es&nbsp;objetivas,&nbsp;ocorreu&nbsp;nas&nbsp;seguintes&nbsp;cidades:&nbsp;Florian&oacute;polis,&nbsp;Joinville,&nbsp;Chapec&oacute;,&nbsp;Crici&uacute;ma,&nbsp;Tubar&atilde;o,&nbsp;Lages,&nbsp;Itaja&iacute;&nbsp;e&nbsp;Joa&ccedil;aba.<br /><br />A&nbsp;banca&nbsp;organizadora&nbsp;do&nbsp;&uacute;ltimo&nbsp;certame&nbsp;foi&nbsp;a&nbsp;FEPESE,&nbsp;a&nbsp;prova&nbsp;objetiva&nbsp;contava&nbsp;com&nbsp;110&nbsp;quest&otilde;es&nbsp;de&nbsp;m&uacute;ltipla&nbsp;escolha.<br /><br />A&nbsp;expectativa&nbsp;&eacute;&nbsp;que&nbsp;o&nbsp;edital&nbsp;seja&nbsp;publicado&nbsp;no&nbsp;primeiro&nbsp;semestre&nbsp;de&nbsp;2023.</div>', 'civil,polícia,concurso,santa,catarina,carreira,delegado,vagas,edital', '2022-12-20 14:47:07');

-- --------------------------------------------------------

--
-- Estrutura da tabela `perfil`
--

CREATE TABLE `perfil` (
  `id_perfil` int(9) NOT NULL,
  `nome_perfil` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `perfil`
--

INSERT INTO `perfil` (`id_perfil`, `nome_perfil`) VALUES
(3, 'Usuario'),
(4, 'Admin');

-- --------------------------------------------------------

--
-- Estrutura da tabela `permissoes`
--

CREATE TABLE `permissoes` (
  `id_permissao` int(11) DEFAULT NULL,
  `id_perfil` int(11) DEFAULT NULL,
  `id_acesso` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `permissoes`
--

INSERT INTO `permissoes` (`id_permissao`, `id_perfil`, `id_acesso`) VALUES
(NULL, 3, 46),
(NULL, 3, 48),
(NULL, 3, 49),
(NULL, 3, 50),
(NULL, 3, 51),
(NULL, 3, 52),
(NULL, 4, 40),
(NULL, 4, 41),
(NULL, 4, 42),
(NULL, 4, 43),
(NULL, 4, 45),
(NULL, 4, 46),
(NULL, 4, 48),
(NULL, 4, 49),
(NULL, 4, 50),
(NULL, 4, 51),
(NULL, 4, 52),
(NULL, 4, 53),
(NULL, 4, 54),
(NULL, 4, 55),
(NULL, 4, 56),
(NULL, 3, 54),
(NULL, 3, 53),
(NULL, 3, 55),
(NULL, 3, 56),
(NULL, 4, 57),
(NULL, 4, 58),
(NULL, 4, 59),
(NULL, 3, 59),
(NULL, 3, 58),
(NULL, 3, 57),
(NULL, 4, 60),
(NULL, 3, 60),
(NULL, 4, 61),
(NULL, 4, 62),
(NULL, 4, 63),
(NULL, 3, 63),
(NULL, 4, 64),
(NULL, 3, 64),
(NULL, 4, 65),
(NULL, 4, 66),
(NULL, 3, 66);

-- --------------------------------------------------------

--
-- Estrutura da tabela `redes_sociais`
--

CREATE TABLE `redes_sociais` (
  `id_rede` int(11) NOT NULL,
  `nome_rede` varchar(56) DEFAULT NULL,
  `link_rede` varchar(512) DEFAULT NULL,
  `icon_rede` varchar(128) DEFAULT NULL,
  `rede_ativa` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `redes_sociais`
--

INSERT INTO `redes_sociais` (`id_rede`, `nome_rede`, `link_rede`, `icon_rede`, `rede_ativa`) VALUES
(1, 'instagram', 'https://instagram.com/prof.marlos?igshid=YzdkMWQ2MWU=', 'fa fa-instagram', 1),
(2, 'whatsapp', '4999543136', 'fa fa-whatsapp', 1),
(3, 'facebook', 'https://www.facebook.com/prof.marlosHC?mibextid=ZbWKwL', 'fa fa-facebook', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `seo`
--

CREATE TABLE `seo` (
  `id_seo` int(11) NOT NULL,
  `titulo_seo` varchar(128) DEFAULT NULL,
  `descricao_seo` varchar(512) DEFAULT NULL,
  `id_google_analytcs` varchar(798) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `seo`
--

INSERT INTO `seo` (`id_seo`, `titulo_seo`, `descricao_seo`, `id_google_analytcs`) VALUES
(1, 'Professor Marlos Campos', 'Tornando o sonho da Aprovação uma realidade.', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `servicos`
--

CREATE TABLE `servicos` (
  `id_servico` int(11) NOT NULL,
  `titulo_servico` varchar(128) DEFAULT NULL,
  `descricao_servico` varchar(1024) DEFAULT NULL,
  `icone_servico` varchar(28) DEFAULT NULL,
  `url_foto_servico` varchar(128) DEFAULT NULL,
  `ordem_servico` timestamp(6) NULL DEFAULT NULL,
  `descricao_completa_servico` varchar(2048) DEFAULT NULL,
  `ativo_home` tinyint(1) NOT NULL,
  `id_categoria` int(9) DEFAULT NULL,
  `data_cadastro` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_inicio` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_fim` timestamp NULL DEFAULT NULL,
  `data_inscricao` timestamp NULL DEFAULT NULL,
  `valor` float NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `servicos`
--

INSERT INTO `servicos` (`id_servico`, `titulo_servico`, `descricao_servico`, `icone_servico`, `url_foto_servico`, `ordem_servico`, `descricao_completa_servico`, `ativo_home`, `id_categoria`, `data_cadastro`, `data_inicio`, `data_fim`, `data_inscricao`, `valor`, `status`) VALUES
(25, 'Turma Concurso Garopaba', '<div style=\"text-align:justify\">Turma&nbsp;Concurso&nbsp;Garopaba&nbsp;Ser&aacute;&nbsp;um&nbsp;acompanhamento&nbsp;at&eacute;&nbsp;a&nbsp;data&nbsp;da&nbsp;prova.&nbsp;O&nbsp;que&nbsp;voc&ecirc;&nbsp;ir&aacute;&nbsp;receber:<br />✅&nbsp;PLANEJAMENTO&nbsp;DE&nbsp;ESTUDOS<br />✅&nbsp;CONTROLE&nbsp;DE&nbsp;CONTE&Uacute;DO<br />✅&nbsp;AULAS&nbsp;AO&nbsp;VIVO<br />✅&nbsp;SIMULADOS&nbsp;PADR&Atilde;O<br />✅&nbsp;CADERNO&nbsp;DE&nbsp;QUEST&Otilde;ES&nbsp;<br />✅&nbsp;PLANILHA&nbsp;DE&nbsp;DESEMPENHO<br />✅&nbsp;APOSTILAS<br />✅&nbsp;VIDEOCONFER&Ecirc;NCIA&nbsp;INDIVIDUAL<br />✅&nbsp;ACOMPANHAMENTO&nbsp;INDIVIDUAL<br />O&nbsp;investimento&nbsp;&eacute;&nbsp;de&nbsp;R$&nbsp;349,90<br />pode&nbsp;ser&nbsp;feito&nbsp;por&nbsp;pix&nbsp;ou<br />podendo&nbsp;parcelar&nbsp;em&nbsp;at&eacute;&nbsp;12x&nbsp;no&nbsp;cart&atilde;o.</div>', NULL, 'garopaba.jpg', '2023-03-01 03:00:00.000000', '<div style=\"text-align:justify\">Turma&nbsp;Concurso&nbsp;Garopaba&nbsp;Ser&aacute;&nbsp;um&nbsp;acompanhamento&nbsp;at&eacute;&nbsp;a&nbsp;data&nbsp;da&nbsp;prova.&nbsp;O&nbsp;que&nbsp;voc&ecirc;&nbsp;ir&aacute;&nbsp;receber:<br />✅&nbsp;PLANEJAMENTO&nbsp;DE&nbsp;ESTUDOS<br />✅&nbsp;CONTROLE&nbsp;DE&nbsp;CONTE&Uacute;DO<br />✅&nbsp;AULAS&nbsp;AO&nbsp;VIVO<br />✅&nbsp;SIMULADOS&nbsp;PADR&Atilde;O<br />✅&nbsp;CADERNO&nbsp;DE&nbsp;QUEST&Otilde;ES&nbsp;<br />✅&nbsp;PLANILHA&nbsp;DE&nbsp;DESEMPENHO<br />✅&nbsp;APOSTILAS<br />✅&nbsp;VIDEOCONFER&Ecirc;NCIA&nbsp;INDIVIDUAL<br />✅&nbsp;ACOMPANHAMENTO&nbsp;INDIVIDUAL<br />O&nbsp;investimento&nbsp;&eacute;&nbsp;de&nbsp;R$&nbsp;349,90<br />pode&nbsp;ser&nbsp;feito&nbsp;por&nbsp;pix&nbsp;ou<br />podendo&nbsp;parcelar&nbsp;em&nbsp;at&eacute;&nbsp;12x&nbsp;no&nbsp;cart&atilde;o.</div>', 0, 1, '2023-02-22 14:31:08', '2023-02-22 14:32:05', NULL, NULL, 349.9, 0),
(26, 'Turma Concurso Agente de Transito - Balneário Camboriú', 'Turma&nbsp;Concurso&nbsp;Agente&nbsp;de&nbsp;Tr&acirc;nsito&nbsp;-&nbsp;Balne&aacute;rio&nbsp;Cambori&uacute;&nbsp;Ser&aacute;&nbsp;um&nbsp;acompanhamento&nbsp;at&eacute;&nbsp;a&nbsp;data&nbsp;da&nbsp;prova.<br /><br />O&nbsp;que&nbsp;voc&ecirc;&nbsp;ir&aacute;&nbsp;receber:<br /><br />✅&nbsp;PLANEJAMENTO&nbsp;DE&nbsp;ESTUDOS<br />✅&nbsp;CONTROLE&nbsp;DE&nbsp;CONTE&Uacute;DO<br />✅&nbsp;AULAS&nbsp;AO&nbsp;VIVO<br />✅&nbsp;SIMULADOS&nbsp;PADR&Atilde;O&nbsp;<br />✅&nbsp;CADERNO&nbsp;DE&nbsp;QUEST&Otilde;ES&nbsp;<br />✅&nbsp;PLANILHA&nbsp;DE&nbsp;DESEMPENHO<br />✅&nbsp;APOSTILAS<br />✅&nbsp;VIDEOCONFER&Ecirc;NCIA&nbsp;INDIVIDUAL<br />✅&nbsp;ACOMPANHAMENTO&nbsp;INDIVIDUAL<br /><br />O&nbsp;investimento&nbsp;&eacute;&nbsp;de&nbsp;R$&nbsp;349,90<br />pode&nbsp;ser&nbsp;feito&nbsp;por&nbsp;pix&nbsp;ou<br />podendo&nbsp;parcelar&nbsp;em&nbsp;at&eacute;&nbsp;12x&nbsp;no&nbsp;cart&atilde;o.', NULL, 'agente-bc-1.jpg', '2023-03-17 03:00:00.000000', 'Turma&nbsp;Concurso&nbsp;Agente&nbsp;de&nbsp;Tr&acirc;nsito&nbsp;-&nbsp;Balne&aacute;rio&nbsp;Cambori&uacute;&nbsp;Ser&aacute;&nbsp;um&nbsp;acompanhamento&nbsp;at&eacute;&nbsp;a&nbsp;data&nbsp;da&nbsp;prova.<br /><br />O&nbsp;que&nbsp;voc&ecirc;&nbsp;ir&aacute;&nbsp;receber:<br /><br />✅&nbsp;PLANEJAMENTO&nbsp;DE&nbsp;ESTUDOS<br />✅&nbsp;CONTROLE&nbsp;DE&nbsp;CONTE&Uacute;DO<br />✅&nbsp;AULAS&nbsp;AO&nbsp;VIVO<br />✅&nbsp;SIMULADOS&nbsp;PADR&Atilde;O&nbsp;<br />✅&nbsp;CADERNO&nbsp;DE&nbsp;QUEST&Otilde;ES&nbsp;<br />✅&nbsp;PLANILHA&nbsp;DE&nbsp;DESEMPENHO<br />✅&nbsp;APOSTILAS<br />✅&nbsp;VIDEOCONFER&Ecirc;NCIA&nbsp;INDIVIDUAL<br />✅&nbsp;ACOMPANHAMENTO&nbsp;INDIVIDUAL<br /><br />O&nbsp;investimento&nbsp;&eacute;&nbsp;de&nbsp;R$&nbsp;349,90<br />pode&nbsp;ser&nbsp;feito&nbsp;por&nbsp;pix&nbsp;ou<br />podendo&nbsp;parcelar&nbsp;em&nbsp;at&eacute;&nbsp;12x&nbsp;no&nbsp;cart&atilde;o.', 1, 1, '2023-02-22 14:31:08', '2023-02-22 14:32:05', NULL, NULL, 349.9, 0),
(31, 'Turma Concurso Alto da Bela Vista', 'Ser&aacute;&nbsp;um&nbsp;acompanhamento&nbsp;at&eacute;&nbsp;a&nbsp;data&nbsp;da&nbsp;prova<br />O&nbsp;que&nbsp;voc&ecirc;&nbsp;ir&aacute;&nbsp;receber:<br />✅&nbsp;Planejamento&nbsp;de&nbsp;estudos<br />✅&nbsp;Controle&nbsp;de&nbsp;conte&uacute;do<br />✅&nbsp;Videoaulas<br />✅&nbsp;Aulas&nbsp;Ao&nbsp;vivo<br />✅&nbsp;Simulados<br />✅&nbsp;Caderno&nbsp;Quest&otilde;es<br />✅&nbsp;Planilha&nbsp;de&nbsp;desempenho<br />✅&nbsp;Apostilas<br />✅&nbsp;Quest&otilde;es&nbsp;comentadas<br />O&nbsp;investimento&nbsp;&eacute;&nbsp;de&nbsp;R$&nbsp;349,90&nbsp;pode&nbsp;ser&nbsp;feito&nbsp;por&nbsp;pix&nbsp;ou&nbsp;podendo&nbsp;parcelar&nbsp;em&nbsp;at&eacute;&nbsp;12x&nbsp;no&nbsp;cart&atilde;o.', NULL, 'alto-bela-vista.jpg', '2023-03-18 03:00:00.000000', 'Ser&aacute;&nbsp;um&nbsp;acompanhamento&nbsp;at&eacute;&nbsp;a&nbsp;data&nbsp;da&nbsp;prova<br />O&nbsp;que&nbsp;voc&ecirc;&nbsp;ir&aacute;&nbsp;receber:<br />✅&nbsp;Planejamento&nbsp;de&nbsp;estudos<br />✅&nbsp;Controle&nbsp;de&nbsp;conte&uacute;do<br />✅&nbsp;Videoaulas<br />✅&nbsp;Aulas&nbsp;Ao&nbsp;vivo<br />✅&nbsp;Simulados<br />✅&nbsp;Caderno&nbsp;Quest&otilde;es<br />✅&nbsp;Planilha&nbsp;de&nbsp;desempenho<br />✅&nbsp;Apostilas<br />✅&nbsp;Quest&otilde;es&nbsp;comentadas<br />O&nbsp;investimento&nbsp;&eacute;&nbsp;de&nbsp;R$&nbsp;349,90&nbsp;pode&nbsp;ser&nbsp;feito&nbsp;por&nbsp;pix&nbsp;ou&nbsp;podendo&nbsp;parcelar&nbsp;em&nbsp;at&eacute;&nbsp;12x&nbsp;no&nbsp;cart&atilde;o.', 0, 1, '2023-02-22 14:31:08', '2023-02-22 14:32:05', NULL, NULL, 349.9, 0),
(32, 'Turma Concurso CIDASC', 'Turma&nbsp;Concurso&nbsp;CIDASC&nbsp;Ser&aacute;&nbsp;um&nbsp;acompanhamento&nbsp;at&eacute;&nbsp;a&nbsp;data&nbsp;da&nbsp;prova.&nbsp;O&nbsp;que&nbsp;voc&ecirc;&nbsp;ir&aacute;&nbsp;receber:<br />&nbsp;<br />✅&nbsp;PLANEJAMENTO&nbsp;DE&nbsp;ESTUDOS<br />✅&nbsp;CONTROLE&nbsp;DE&nbsp;CONTE&Uacute;DO<br />✅&nbsp;AULAS&nbsp;AO&nbsp;VIVO<br />✅&nbsp;SIMULADOS&nbsp;PADR&Atilde;O&nbsp;<br />✅&nbsp;CADERNO&nbsp;DE&nbsp;QUEST&Otilde;ES&nbsp;<br />✅&nbsp;PLANILHA&nbsp;DE&nbsp;DESEMPENHO<br />✅&nbsp;APOSTILAS<br />✅&nbsp;VIDEOCONFER&Ecirc;NCIA&nbsp;INDIVIDUAL<br />✅&nbsp;ACOMPANHAMENTO&nbsp;INDIVIDUA<br />&nbsp;<br />O&nbsp;investimento&nbsp;&eacute;&nbsp;de&nbsp;R$&nbsp;349,90<br />pode&nbsp;ser&nbsp;feito&nbsp;por&nbsp;pix&nbsp;ou<br />podendo&nbsp;parcelar&nbsp;em&nbsp;at&eacute;&nbsp;12x&nbsp;no&nbsp;cart&atilde;o.', NULL, 'cidasc.jpg', '2023-01-31 03:00:00.000000', 'Turma&nbsp;Concurso&nbsp;CIDASC&nbsp;Ser&aacute;&nbsp;um&nbsp;acompanhamento&nbsp;at&eacute;&nbsp;a&nbsp;data&nbsp;da&nbsp;prova.&nbsp;O&nbsp;que&nbsp;voc&ecirc;&nbsp;ir&aacute;&nbsp;receber:<br />&nbsp;<br />✅&nbsp;PLANEJAMENTO&nbsp;DE&nbsp;ESTUDOS<br />✅&nbsp;CONTROLE&nbsp;DE&nbsp;CONTE&Uacute;DO<br />✅&nbsp;AULAS&nbsp;AO&nbsp;VIVO<br />✅&nbsp;SIMULADOS&nbsp;PADR&Atilde;O&nbsp;<br />✅&nbsp;CADERNO&nbsp;DE&nbsp;QUEST&Otilde;ES&nbsp;<br />✅&nbsp;PLANILHA&nbsp;DE&nbsp;DESEMPENHO<br />✅&nbsp;APOSTILAS<br />✅&nbsp;VIDEOCONFER&Ecirc;NCIA&nbsp;INDIVIDUAL<br />✅&nbsp;ACOMPANHAMENTO&nbsp;INDIVIDUA<br />&nbsp;<br />O&nbsp;investimento&nbsp;&eacute;&nbsp;de&nbsp;R$&nbsp;349,90<br />pode&nbsp;ser&nbsp;feito&nbsp;por&nbsp;pix&nbsp;ou<br />podendo&nbsp;parcelar&nbsp;em&nbsp;at&eacute;&nbsp;12x&nbsp;no&nbsp;cart&atilde;o.', 0, 1, '2023-02-22 14:31:08', '2023-02-22 14:32:05', NULL, NULL, 349.9, 0),
(35, 'Turma Concurso UFSC', 'Ser&aacute;&nbsp;um&nbsp;acompanhamento&nbsp;at&eacute;&nbsp;a&nbsp;data&nbsp;da&nbsp;prova<br />O&nbsp;que&nbsp;voc&ecirc;&nbsp;ir&aacute;&nbsp;receber:<br /><br />✅&nbsp;PLANEJAMENTO&nbsp;DE&nbsp;ESTUDO&nbsp;SEMANAL<br />✅&nbsp;CONTROLE&nbsp;DE&nbsp;CONTE&Uacute;DO<br />✅&nbsp;RAIO&nbsp;X&nbsp;DA&nbsp;BANCA<br />✅&nbsp;SIMULADOS&nbsp;PADR&Atilde;O&nbsp;<br />✅&nbsp;CADERNO&nbsp;DE&nbsp;QUEST&Otilde;ES&nbsp;<br />✅&nbsp;PLANILHA&nbsp;DE&nbsp;DESEMPENHO<br />✅&nbsp;PLATAFORMA&nbsp;DE&nbsp;ESTUDOS<br />✅&nbsp;VIDEOCONFER&Ecirc;NCIA&nbsp;INDIVIDUAL<br />✅&nbsp;ACOMPANHAMENTO&nbsp;INDIVIDUAL<br /><br />O&nbsp;investimento&nbsp;&eacute;&nbsp;de&nbsp;R$&nbsp;349,90&nbsp;pode&nbsp;ser&nbsp;feito&nbsp;por&nbsp;pix&nbsp;ou&nbsp;podendo&nbsp;parcelar&nbsp;em&nbsp;at&eacute;&nbsp;12x&nbsp;no&nbsp;cart&atilde;o.', NULL, 'ufsc.jpg', '2023-03-31 03:00:00.000000', '<div style=\"text-align: justify;\">Ser&aacute;&nbsp;um&nbsp;acompanhamento&nbsp;at&eacute;&nbsp;a&nbsp;data&nbsp;da&nbsp;prova<br />O&nbsp;que&nbsp;voc&ecirc;&nbsp;ir&aacute;&nbsp;receber:<br /><br />✅&nbsp;PLANEJAMENTO&nbsp;DE&nbsp;ESTUDO&nbsp;SEMANAL<br />✅&nbsp;CONTROLE&nbsp;DE&nbsp;CONTE&Uacute;DO<br />✅&nbsp;RAIO&nbsp;X&nbsp;DA&nbsp;BANCA<br />✅&nbsp;SIMULADOS&nbsp;PADR&Atilde;O&nbsp;<br />✅&nbsp;CADERNO&nbsp;DE&nbsp;QUEST&Otilde;ES&nbsp;<br />✅&nbsp;PLANILHA&nbsp;DE&nbsp;DESEMPENHO<br />✅&nbsp;PLATAFORMA&nbsp;DE&nbsp;ESTUDOS<br />✅&nbsp;VIDEOCONFER&Ecirc;NCIA&nbsp;INDIVIDUAL<br />✅&nbsp;ACOMPANHAMENTO&nbsp;INDIVIDUAL<br /><br />O&nbsp;investimento&nbsp;&eacute;&nbsp;de&nbsp;R$&nbsp;349,90&nbsp;pode&nbsp;ser&nbsp;feito&nbsp;por&nbsp;pix&nbsp;ou&nbsp;podendo&nbsp;parcelar&nbsp;em&nbsp;at&eacute;&nbsp;12x&nbsp;no&nbsp;cart&atilde;o.</div>', 1, 1, '2023-02-22 14:31:08', '2023-02-22 14:32:05', NULL, NULL, 349.9, 0),
(36, 'Turma Concurso ALESC', '<div style=\"text-align: justify;\">Ser&aacute;&nbsp;um&nbsp;acompanhamento&nbsp;at&eacute;&nbsp;a&nbsp;data&nbsp;da&nbsp;prova<br />O&nbsp;que&nbsp;voc&ecirc;&nbsp;ir&aacute;&nbsp;receber:<br /><br />✅&nbsp;PLANEJAMENTO&nbsp;DE&nbsp;ESTUDO&nbsp;SEMANAL<br />✅&nbsp;CONTROLE&nbsp;DE&nbsp;CONTE&Uacute;DO<br />✅&nbsp;RAIO&nbsp;X&nbsp;DA&nbsp;BANCA<br />✅&nbsp;SIMULADOS&nbsp;PADR&Atilde;O&nbsp;<br />✅&nbsp;CADERNO&nbsp;DE&nbsp;QUEST&Otilde;ES&nbsp;<br />✅&nbsp;PLANILHA&nbsp;DE&nbsp;DESEMPENHO<br />✅&nbsp;PLATAFORMA&nbsp;DE&nbsp;ESTUDOS<br />✅&nbsp;VIDEOCONFER&Ecirc;NCIA&nbsp;INDIVIDUAL<br />✅&nbsp;ACOMPANHAMENTO&nbsp;INDIVIDUAL<br /><br />O&nbsp;investimento&nbsp;&eacute;&nbsp;de&nbsp;R$&nbsp;389,90&nbsp;pode&nbsp;ser&nbsp;feito&nbsp;por&nbsp;pix&nbsp;ou&nbsp;podendo&nbsp;parcelar&nbsp;em&nbsp;at&eacute;&nbsp;12x&nbsp;no&nbsp;cart&atilde;o.</div>', NULL, 'alesc.jpg', '2023-05-21 03:00:00.000000', '<div style=\"text-align: justify;\">Ser&aacute;&nbsp;um&nbsp;acompanhamento&nbsp;at&eacute;&nbsp;a&nbsp;data&nbsp;da&nbsp;prova<br />O&nbsp;que&nbsp;voc&ecirc;&nbsp;ir&aacute;&nbsp;receber:<br /><br />✅&nbsp;PLANEJAMENTO&nbsp;DE&nbsp;ESTUDO&nbsp;SEMANAL<br />✅&nbsp;CONTROLE&nbsp;DE&nbsp;CONTE&Uacute;DO<br />✅&nbsp;RAIO&nbsp;X&nbsp;DA&nbsp;BANCA<br />✅&nbsp;SIMULADOS&nbsp;PADR&Atilde;O&nbsp;<br />✅&nbsp;CADERNO&nbsp;DE&nbsp;QUEST&Otilde;ES&nbsp;<br />✅&nbsp;PLANILHA&nbsp;DE&nbsp;DESEMPENHO<br />✅&nbsp;PLATAFORMA&nbsp;DE&nbsp;ESTUDOS<br />✅&nbsp;VIDEOCONFER&Ecirc;NCIA&nbsp;INDIVIDUAL<br />✅&nbsp;ACOMPANHAMENTO&nbsp;INDIVIDUAL<br /><br />O&nbsp;investimento&nbsp;&eacute;&nbsp;de&nbsp;R$&nbsp;389,90&nbsp;pode&nbsp;ser&nbsp;feito&nbsp;por&nbsp;pix&nbsp;ou&nbsp;podendo&nbsp;parcelar&nbsp;em&nbsp;at&eacute;&nbsp;12x&nbsp;no&nbsp;cart&atilde;o.</div>', 1, 1, '2023-02-22 14:31:08', '2023-02-22 14:32:05', NULL, NULL, 389.9, 0),
(39, 'Turma Presencial Concurso PMSC e PCSC ', '<div style=\"text-align:justify\">Curso&nbsp;Presencial&nbsp;PMSC&nbsp;e&nbsp;PCSC<br /><br />In&iacute;cio&nbsp;das&nbsp;aulas:&nbsp;06.02.2023<br />T&eacute;rmino:&nbsp;28.04.2023<br /><br />Hor&aacute;rio:&nbsp;18:30&nbsp;&agrave;s&nbsp;21:30<br /><br />Simulados&nbsp;Espec&iacute;ficos&nbsp;<br /><br />Prepara&ccedil;&atilde;o&nbsp;para&nbsp;o&nbsp;TAF<br /><br />Apoio&nbsp;de&nbsp;Plataforma&nbsp;<br /><br />Grupo&nbsp;exclusivo&nbsp;com&nbsp;Professores&nbsp;<br /><br /><br />Investimento:&nbsp;R$&nbsp;980,00&nbsp;em&nbsp;at&eacute;&nbsp;10x&nbsp;sem&nbsp;juros&nbsp;ou&nbsp;em&nbsp;2x&nbsp;no&nbsp;boleto.</div>', NULL, 'pc-pm.jpg', '2023-02-06 03:00:00.000000', '&nbsp;Curso&nbsp;Presencial&nbsp;PMSC&nbsp;e&nbsp;PCSC<br /><br />In&iacute;cio&nbsp;das&nbsp;aulas:&nbsp;06.02.2023<br />T&eacute;rmino:&nbsp;28.04.2023<br /><br />Hor&aacute;rio:&nbsp;18:30&nbsp;&agrave;s&nbsp;21:30<br /><br />Simulados&nbsp;Espec&iacute;ficos&nbsp;<div style=\"text-align:justify\">Prepara&ccedil;&atilde;o&nbsp;para&nbsp;o&nbsp;TAF<br /><br />Apoio&nbsp;de&nbsp;Plataforma&nbsp;<br /><br />Grupo&nbsp;exclusivo&nbsp;com&nbsp;Professores&nbsp;<br /><br /><br />Investimento:&nbsp;R$&nbsp;980,00&nbsp;em&nbsp;at&eacute;&nbsp;10x&nbsp;sem&nbsp;juros&nbsp;ou&nbsp;em&nbsp;2x&nbsp;no&nbsp;boleto.</div>', 1, 1, '2023-02-22 14:31:08', '2023-02-22 14:32:05', NULL, NULL, 980, 0),
(40, 'Turma Concurso Três Passo - RS', '<div style=\"text-align: justify;\">Ser&aacute;&nbsp;um&nbsp;acompanhamento&nbsp;at&eacute;&nbsp;a&nbsp;data&nbsp;da&nbsp;prova<br />O&nbsp;que&nbsp;voc&ecirc;&nbsp;ir&aacute;&nbsp;receber:<br /><br />✅&nbsp;PLANEJAMENTO&nbsp;DE&nbsp;ESTUDO&nbsp;SEMANAL<br />✅&nbsp;CONTROLE&nbsp;DE&nbsp;CONTE&Uacute;DO<br />✅&nbsp;RAIO&nbsp;X&nbsp;DA&nbsp;BANCA<br />✅&nbsp;SIMULADOS&nbsp;PADR&Atilde;O&nbsp;<br />✅&nbsp;CADERNO&nbsp;DE&nbsp;QUEST&Otilde;ES&nbsp;<br />✅&nbsp;PLANILHA&nbsp;DE&nbsp;DESEMPENHO<br />✅&nbsp;PLATAFORMA&nbsp;DE&nbsp;ESTUDOS<br />✅&nbsp;VIDEOCONFER&Ecirc;NCIA&nbsp;INDIVIDUAL<br />✅&nbsp;ACOMPANHAMENTO&nbsp;INDIVIDUAL<br /><br />O&nbsp;investimento&nbsp;&eacute;&nbsp;de&nbsp;R$&nbsp;349,90&nbsp;pode&nbsp;ser&nbsp;feito&nbsp;por&nbsp;pix&nbsp;ou&nbsp;podendo&nbsp;parcelar&nbsp;em&nbsp;at&eacute;&nbsp;12x&nbsp;no&nbsp;cart&atilde;o.</div>', NULL, 'tres-passos.jpg', '2023-03-24 03:00:00.000000', '<div style=\"text-align: justify;\">Ser&aacute;&nbsp;um&nbsp;acompanhamento&nbsp;at&eacute;&nbsp;a&nbsp;data&nbsp;da&nbsp;prova<br />O&nbsp;que&nbsp;voc&ecirc;&nbsp;ir&aacute;&nbsp;receber:<br /><br />✅&nbsp;PLANEJAMENTO&nbsp;DE&nbsp;ESTUDO&nbsp;SEMANAL<br />✅&nbsp;CONTROLE&nbsp;DE&nbsp;CONTE&Uacute;DO<br />✅&nbsp;RAIO&nbsp;X&nbsp;DA&nbsp;BANCA<br />✅&nbsp;SIMULADOS&nbsp;PADR&Atilde;O&nbsp;<br />✅&nbsp;CADERNO&nbsp;DE&nbsp;QUEST&Otilde;ES&nbsp;<br />✅&nbsp;PLANILHA&nbsp;DE&nbsp;DESEMPENHO<br />✅&nbsp;PLATAFORMA&nbsp;DE&nbsp;ESTUDOS<br />✅&nbsp;VIDEOCONFER&Ecirc;NCIA&nbsp;INDIVIDUAL<br />✅&nbsp;ACOMPANHAMENTO&nbsp;INDIVIDUAL<br /><br />O&nbsp;investimento&nbsp;&eacute;&nbsp;de&nbsp;R$&nbsp;349,90&nbsp;pode&nbsp;ser&nbsp;feito&nbsp;por&nbsp;pix&nbsp;ou&nbsp;podendo&nbsp;parcelar&nbsp;em&nbsp;at&eacute;&nbsp;12x&nbsp;no&nbsp;cart&atilde;o.</div>', 1, 1, '2023-02-22 14:31:08', '2023-02-22 14:32:05', NULL, NULL, 349.9, 0),
(41, 'Turma Concurso Nova Santa Rita - RS', '<div style=\"text-align: justify;\">Ser&aacute;&nbsp;um&nbsp;acompanhamento&nbsp;at&eacute;&nbsp;a&nbsp;data&nbsp;da&nbsp;prova<br />O&nbsp;que&nbsp;voc&ecirc;&nbsp;ir&aacute;&nbsp;receber:<br /><br />✅&nbsp;PLANEJAMENTO&nbsp;DE&nbsp;ESTUDO&nbsp;SEMANAL<br />✅&nbsp;CONTROLE&nbsp;DE&nbsp;CONTE&Uacute;DO<br />✅&nbsp;RAIO&nbsp;X&nbsp;DA&nbsp;BANCA<br />✅&nbsp;SIMULADOS&nbsp;PADR&Atilde;O&nbsp;<br />✅&nbsp;CADERNO&nbsp;DE&nbsp;QUEST&Otilde;ES&nbsp;<br />✅&nbsp;PLANILHA&nbsp;DE&nbsp;DESEMPENHO<br />✅&nbsp;PLATAFORMA&nbsp;DE&nbsp;ESTUDOS<br />✅&nbsp;VIDEOCONFER&Ecirc;NCIA&nbsp;INDIVIDUAL<br />✅&nbsp;ACOMPANHAMENTO&nbsp;INDIVIDUAL<br /><br />O&nbsp;investimento&nbsp;&eacute;&nbsp;de&nbsp;R$&nbsp;349,90&nbsp;pode&nbsp;ser&nbsp;feito&nbsp;por&nbsp;pix&nbsp;ou&nbsp;podendo&nbsp;parcelar&nbsp;em&nbsp;at&eacute;&nbsp;12x&nbsp;no&nbsp;cart&atilde;o.</div>', NULL, 'nova-sant-rita.jpg', '2023-03-31 03:00:00.000000', '<div style=\"text-align: justify;\">Ser&aacute;&nbsp;um&nbsp;acompanhamento&nbsp;at&eacute;&nbsp;a&nbsp;data&nbsp;da&nbsp;prova<br />O&nbsp;que&nbsp;voc&ecirc;&nbsp;ir&aacute;&nbsp;receber:<br /><br />✅&nbsp;PLANEJAMENTO&nbsp;DE&nbsp;ESTUDO&nbsp;SEMANAL<br />✅&nbsp;CONTROLE&nbsp;DE&nbsp;CONTE&Uacute;DO<br />✅&nbsp;RAIO&nbsp;X&nbsp;DA&nbsp;BANCA<br />✅&nbsp;SIMULADOS&nbsp;PADR&Atilde;O&nbsp;<br />✅&nbsp;CADERNO&nbsp;DE&nbsp;QUEST&Otilde;ES&nbsp;<br />✅&nbsp;PLANILHA&nbsp;DE&nbsp;DESEMPENHO<br />✅&nbsp;PLATAFORMA&nbsp;DE&nbsp;ESTUDOS<br />✅&nbsp;VIDEOCONFER&Ecirc;NCIA&nbsp;INDIVIDUAL<br />✅&nbsp;ACOMPANHAMENTO&nbsp;INDIVIDUAL<br /><br />O&nbsp;investimento&nbsp;&eacute;&nbsp;de&nbsp;R$&nbsp;349,90&nbsp;pode&nbsp;ser&nbsp;feito&nbsp;por&nbsp;pix&nbsp;ou&nbsp;podendo&nbsp;parcelar&nbsp;em&nbsp;at&eacute;&nbsp;12x&nbsp;no&nbsp;cart&atilde;o.</div>', 1, 1, '2023-02-22 14:31:08', '2023-02-22 14:32:05', NULL, NULL, 349.9, 0),
(43, 'Turma Concurso Criciúma', '<div style=\"text-align: justify;\"><br />Ser&aacute;&nbsp;um&nbsp;acompanhamento&nbsp;at&eacute;&nbsp;a&nbsp;data&nbsp;da&nbsp;prova<br />O&nbsp;que&nbsp;voc&ecirc;&nbsp;ir&aacute;&nbsp;receber:<br /><br />✅&nbsp;PLANEJAMENTO&nbsp;DE&nbsp;ESTUDO&nbsp;SEMANAL<br />✅&nbsp;CONTROLE&nbsp;DE&nbsp;CONTE&Uacute;DO<br />✅&nbsp;RAIO&nbsp;X&nbsp;DA&nbsp;BANCA<br />✅&nbsp;SIMULADOS&nbsp;PADR&Atilde;O&nbsp;<br />✅&nbsp;CADERNO&nbsp;DE&nbsp;QUEST&Otilde;ES&nbsp;<br />✅&nbsp;PLANILHA&nbsp;DE&nbsp;DESEMPENHO<br />✅&nbsp;PLATAFORMA&nbsp;DE&nbsp;ESTUDOS<br />✅&nbsp;VIDEOCONFER&Ecirc;NCIA&nbsp;INDIVIDUAL<br />✅&nbsp;ACOMPANHAMENTO&nbsp;INDIVIDUAL<br /><br />O&nbsp;investimento&nbsp;&eacute;&nbsp;de&nbsp;R$&nbsp;349,90&nbsp;pode&nbsp;ser&nbsp;feito&nbsp;por&nbsp;pix&nbsp;ou&nbsp;podendo&nbsp;parcelar&nbsp;em&nbsp;at&eacute;&nbsp;12x&nbsp;no&nbsp;cart&atilde;o.</div>', NULL, 'criciuma.jpg', '2023-03-12 03:00:00.000000', '<div style=\"text-align: justify;\"><br />Ser&aacute;&nbsp;um&nbsp;acompanhamento&nbsp;at&eacute;&nbsp;a&nbsp;data&nbsp;da&nbsp;prova<br />O&nbsp;que&nbsp;voc&ecirc;&nbsp;ir&aacute;&nbsp;receber:<br /><br />✅&nbsp;PLANEJAMENTO&nbsp;DE&nbsp;ESTUDO&nbsp;SEMANAL<br />✅&nbsp;CONTROLE&nbsp;DE&nbsp;CONTE&Uacute;DO<br />✅&nbsp;RAIO&nbsp;X&nbsp;DA&nbsp;BANCA<br />✅&nbsp;SIMULADOS&nbsp;PADR&Atilde;O&nbsp;<br />✅&nbsp;CADERNO&nbsp;DE&nbsp;QUEST&Otilde;ES&nbsp;<br />✅&nbsp;PLANILHA&nbsp;DE&nbsp;DESEMPENHO<br />✅&nbsp;PLATAFORMA&nbsp;DE&nbsp;ESTUDOS<br />✅&nbsp;VIDEOCONFER&Ecirc;NCIA&nbsp;INDIVIDUAL<br />✅&nbsp;ACOMPANHAMENTO&nbsp;INDIVIDUAL<br /><br />O&nbsp;investimento&nbsp;&eacute;&nbsp;de&nbsp;R$&nbsp;349,90&nbsp;pode&nbsp;ser&nbsp;feito&nbsp;por&nbsp;pix&nbsp;ou&nbsp;podendo&nbsp;parcelar&nbsp;em&nbsp;at&eacute;&nbsp;12x&nbsp;no&nbsp;cart&atilde;o.</div>', 1, 1, '2023-02-22 14:31:08', '2023-02-22 14:32:05', NULL, NULL, 349.9, 0),
(44, 'Turma Concurso Fazenda Rio Grande', '<div style=\"text-align: justify;\">Ser&aacute;&nbsp;um&nbsp;acompanhamento&nbsp;at&eacute;&nbsp;a&nbsp;data&nbsp;da&nbsp;prova<br />O&nbsp;que&nbsp;voc&ecirc;&nbsp;ir&aacute;&nbsp;receber:<br /><br />✅&nbsp;PLANEJAMENTO&nbsp;DE&nbsp;ESTUDO&nbsp;SEMANAL<br />✅&nbsp;CONTROLE&nbsp;DE&nbsp;CONTE&Uacute;DO<br />✅&nbsp;RAIO&nbsp;X&nbsp;DA&nbsp;BANCA<br />✅&nbsp;SIMULADOS&nbsp;PADR&Atilde;O&nbsp;<br />✅&nbsp;CADERNO&nbsp;DE&nbsp;QUEST&Otilde;ES&nbsp;<br />✅&nbsp;PLANILHA&nbsp;DE&nbsp;DESEMPENHO<br />✅&nbsp;PLATAFORMA&nbsp;DE&nbsp;ESTUDOS<br />✅&nbsp;VIDEOCONFER&Ecirc;NCIA&nbsp;INDIVIDUAL<br />✅&nbsp;ACOMPANHAMENTO&nbsp;INDIVIDUAL<br /><br />O&nbsp;investimento&nbsp;&eacute;&nbsp;de&nbsp;R$&nbsp;349,90&nbsp;pode&nbsp;ser&nbsp;feito&nbsp;por&nbsp;pix&nbsp;ou&nbsp;podendo&nbsp;parcelar&nbsp;em&nbsp;at&eacute;&nbsp;12x&nbsp;no&nbsp;cart&atilde;o.</div>', NULL, 'fazenda-rio-gr.jpg', '2023-04-02 03:00:00.000000', '<div style=\"text-align: justify;\">Ser&aacute;&nbsp;um&nbsp;acompanhamento&nbsp;at&eacute;&nbsp;a&nbsp;data&nbsp;da&nbsp;prova<br />O&nbsp;que&nbsp;voc&ecirc;&nbsp;ir&aacute;&nbsp;receber:<br /><br />✅&nbsp;PLANEJAMENTO&nbsp;DE&nbsp;ESTUDO&nbsp;SEMANAL<br />✅&nbsp;CONTROLE&nbsp;DE&nbsp;CONTE&Uacute;DO<br />✅&nbsp;RAIO&nbsp;X&nbsp;DA&nbsp;BANCA<br />✅&nbsp;SIMULADOS&nbsp;PADR&Atilde;O&nbsp;<br />✅&nbsp;CADERNO&nbsp;DE&nbsp;QUEST&Otilde;ES&nbsp;<br />✅&nbsp;PLANILHA&nbsp;DE&nbsp;DESEMPENHO<br />✅&nbsp;PLATAFORMA&nbsp;DE&nbsp;ESTUDOS<br />✅&nbsp;VIDEOCONFER&Ecirc;NCIA&nbsp;INDIVIDUAL<br />✅&nbsp;ACOMPANHAMENTO&nbsp;INDIVIDUAL<br /><br />O&nbsp;investimento&nbsp;&eacute;&nbsp;de&nbsp;R$&nbsp;349,90&nbsp;pode&nbsp;ser&nbsp;feito&nbsp;por&nbsp;pix&nbsp;ou&nbsp;podendo&nbsp;parcelar&nbsp;em&nbsp;at&eacute;&nbsp;12x&nbsp;no&nbsp;cart&atilde;o.</div>', 1, 1, '2023-02-22 14:31:08', '2023-02-22 14:32:05', NULL, NULL, 349.9, 0),
(45, 'Turma Concurso UFFS', '<div style=\"text-align: justify;\">Ser&aacute;&nbsp;um&nbsp;acompanhamento&nbsp;at&eacute;&nbsp;a&nbsp;data&nbsp;da&nbsp;prova<br />O&nbsp;que&nbsp;voc&ecirc;&nbsp;ir&aacute;&nbsp;receber:<br /><br />✅&nbsp;PLANEJAMENTO&nbsp;DE&nbsp;ESTUDO&nbsp;SEMANAL<br />✅&nbsp;CONTROLE&nbsp;DE&nbsp;CONTE&Uacute;DO<br />✅&nbsp;RAIO&nbsp;X&nbsp;DA&nbsp;BANCA<br />✅&nbsp;SIMULADOS&nbsp;PADR&Atilde;O&nbsp;<br />✅&nbsp;CADERNO&nbsp;DE&nbsp;QUEST&Otilde;ES&nbsp;<br />✅&nbsp;PLANILHA&nbsp;DE&nbsp;DESEMPENHO<br />✅&nbsp;PLATAFORMA&nbsp;DE&nbsp;ESTUDOS<br />✅&nbsp;VIDEOCONFER&Ecirc;NCIA&nbsp;INDIVIDUAL<br />✅&nbsp;ACOMPANHAMENTO&nbsp;INDIVIDUAL<br />✅AULAS&nbsp;AO&nbsp;VIVO<br /><br />O&nbsp;investimento&nbsp;&eacute;&nbsp;de&nbsp;R$&nbsp;349,90&nbsp;pode&nbsp;ser&nbsp;feito&nbsp;por&nbsp;pix&nbsp;ou&nbsp;podendo&nbsp;parcelar&nbsp;em&nbsp;at&eacute;&nbsp;12x&nbsp;no&nbsp;cart&atilde;o.</div>', NULL, 'uffs.jpg', '2023-04-02 03:00:00.000000', '<div style=\"text-align: justify;\">Ser&aacute;&nbsp;um&nbsp;acompanhamento&nbsp;at&eacute;&nbsp;a&nbsp;data&nbsp;da&nbsp;prova<br />O&nbsp;que&nbsp;voc&ecirc;&nbsp;ir&aacute;&nbsp;receber:<br /><br />✅&nbsp;PLANEJAMENTO&nbsp;DE&nbsp;ESTUDO&nbsp;SEMANAL<br />✅&nbsp;CONTROLE&nbsp;DE&nbsp;CONTE&Uacute;DO<br />✅&nbsp;RAIO&nbsp;X&nbsp;DA&nbsp;BANCA<br />✅&nbsp;SIMULADOS&nbsp;PADR&Atilde;O&nbsp;<br />✅&nbsp;CADERNO&nbsp;DE&nbsp;QUEST&Otilde;ES&nbsp;<br />✅&nbsp;PLANILHA&nbsp;DE&nbsp;DESEMPENHO<br />✅&nbsp;PLATAFORMA&nbsp;DE&nbsp;ESTUDOS<br />✅&nbsp;VIDEOCONFER&Ecirc;NCIA&nbsp;INDIVIDUAL<br />✅&nbsp;ACOMPANHAMENTO&nbsp;INDIVIDUAL<br />✅AULAS&nbsp;AO&nbsp;VIVO<br /><br />O&nbsp;investimento&nbsp;&eacute;&nbsp;de&nbsp;R$&nbsp;349,90&nbsp;pode&nbsp;ser&nbsp;feito&nbsp;por&nbsp;pix&nbsp;ou&nbsp;podendo&nbsp;parcelar&nbsp;em&nbsp;at&eacute;&nbsp;12x&nbsp;no&nbsp;cart&atilde;o.</div>', 1, 1, '2023-02-22 14:31:08', '2023-02-22 14:32:05', NULL, NULL, 349.9, 0),
(46, 'Aulão Revisão de Véspera Concurso CIDASC', '<div style=\"text-align:justify\">Inscri&ccedil;&otilde;es&nbsp;abertas&nbsp;para&nbsp;o&nbsp;aul&atilde;o&nbsp;de&nbsp;Revis&atilde;o&nbsp;de&nbsp;V&eacute;spera&nbsp;para&nbsp;o&nbsp;Concurso&nbsp;CIDASC<br /><br />Conte&uacute;dos:&nbsp;<br />Conhecimentos&nbsp;Gerais&nbsp;das&nbsp;9h&nbsp;&agrave;s&nbsp;12h<br />-&nbsp;Portugu&ecirc;s&nbsp;<br />-&nbsp;Raciocinio&nbsp;L&oacute;gico<br />Conhecientos&nbsp;Especificos&nbsp;das&nbsp;14h&nbsp;&agrave;s&nbsp;17h<br />-&nbsp;Cargos&nbsp;Assistente&nbsp;Administrativo<br /><br />Dia&nbsp;04&nbsp;de&nbsp;mar&ccedil;o&nbsp;<br />Transmiss&atilde;o&nbsp;AO&nbsp;VIVO<br /><br />Lote&nbsp;&uacute;nico:&nbsp;R$29,90</div>', NULL, 'aulao-cidasc-85402.jpg', '2023-03-04 03:00:00.000000', '<div style=\"text-align:justify\">Inscri&ccedil;&otilde;es&nbsp;abertas&nbsp;para&nbsp;o&nbsp;aul&atilde;o&nbsp;de&nbsp;Revis&atilde;o&nbsp;de&nbsp;V&eacute;spera&nbsp;para&nbsp;o&nbsp;Concurso&nbsp;CIDASC<br /><br />Conte&uacute;dos:&nbsp;<br />Conhecimentos&nbsp;Gerais&nbsp;das&nbsp;9h&nbsp;&agrave;s&nbsp;12h<br />-&nbsp;Portugu&ecirc;s&nbsp;<br />-&nbsp;Raciocinio&nbsp;L&oacute;gico<br />Conhecientos&nbsp;Especificos&nbsp;das&nbsp;14h&nbsp;&agrave;s&nbsp;17h<br />-&nbsp;Cargo&nbsp;Assistente&nbsp;Administrativo<br /><br />Dia&nbsp;04&nbsp;de&nbsp;mar&ccedil;o&nbsp;<br />Transmiss&atilde;o&nbsp;AO&nbsp;VIVO<br /><br />Lote&nbsp;&uacute;nico:&nbsp;R$29,90</div>', 1, 1, '2023-02-22 14:31:08', '2023-02-22 14:32:05', NULL, NULL, 349.9, 0),
(47, 'Curso On-line Soldado PMSC Pré+Pós-edital', '✅&nbsp;PLANEJAMENTO&nbsp;DE&nbsp;ESTUDO&nbsp;SEMANAL<br />✅&nbsp;CONTROLE&nbsp;DE&nbsp;CONTE&Uacute;DO<br />✅&nbsp;RAIO&nbsp;X&nbsp;DA&nbsp;BANCA<br />✅&nbsp;15&nbsp;SIMULADOS&nbsp;PADR&Atilde;O&nbsp;CESPE<br />✅&nbsp;CADERNO&nbsp;DE&nbsp;QUEST&Otilde;ES&nbsp;CESPE<br />✅&nbsp;APOSTILAS&nbsp;EM&nbsp;PDF<br />✅&nbsp;PLANILHA&nbsp;DE&nbsp;DESEMPENHO<br />✅&nbsp;AULAS&nbsp;FOCADAS&nbsp;NA&nbsp;BANCA&nbsp;CESPE<br />✅&nbsp;VIDEOCONFER&Ecirc;NCIA&nbsp;INDIVIDUAL<br />✅&nbsp;OFICINA&nbsp;DA&nbsp;REDA&Ccedil;&Atilde;O<br /><br />Investimento:&nbsp;R$&nbsp;429,00&nbsp;&agrave;&nbsp;vista&nbsp;ou&nbsp;parcelado&nbsp;em&nbsp;at&eacute;&nbsp;10x&nbsp;de&nbsp;R$&nbsp;42,90&nbsp;no&nbsp;cart&atilde;o&nbsp;sem&nbsp;juros&nbsp;', NULL, 'WhatsApp-Image-2023-02-12-at-23-29-01.jpeg', '2023-02-15 03:00:00.000000', '✅&nbsp;PLANEJAMENTO&nbsp;DE&nbsp;ESTUDO&nbsp;SEMANAL<br />✅&nbsp;CONTROLE&nbsp;DE&nbsp;CONTE&Uacute;DO<br />✅&nbsp;RAIO&nbsp;X&nbsp;DA&nbsp;BANCA<br />✅&nbsp;15&nbsp;SIMULADOS&nbsp;PADR&Atilde;O&nbsp;CESPE<br />✅&nbsp;CADERNO&nbsp;DE&nbsp;QUEST&Otilde;ES&nbsp;CESPE<br />✅&nbsp;APOSTILAS&nbsp;EM&nbsp;PDF<br />✅&nbsp;PLANILHA&nbsp;DE&nbsp;DESEMPENHO<br />✅&nbsp;AULAS&nbsp;FOCADAS&nbsp;NA&nbsp;BANCA&nbsp;CESPE<br />✅&nbsp;VIDEOCONFER&Ecirc;NCIA&nbsp;INDIVIDUAL<br />✅&nbsp;OFICINA&nbsp;DA&nbsp;REDA&Ccedil;&Atilde;O<br /><br />Investimento:&nbsp;R$&nbsp;429,00&nbsp;&agrave;&nbsp;vista&nbsp;ou&nbsp;parcelado&nbsp;em&nbsp;at&eacute;&nbsp;10x&nbsp;de&nbsp;R$&nbsp;42,90&nbsp;no&nbsp;cart&atilde;o&nbsp;sem&nbsp;juros&nbsp;', 1, 1, '2023-02-22 14:31:08', '2023-02-22 14:32:05', NULL, NULL, 349.9, 0),
(48, 'Turma Concurso Pescaria Brava-SC', '<div style=\"text-align: justify;\">Ser&aacute;&nbsp;um&nbsp;acompanhamento&nbsp;at&eacute;&nbsp;a&nbsp;data&nbsp;da&nbsp;prova<br />O&nbsp;que&nbsp;voc&ecirc;&nbsp;ir&aacute;&nbsp;receber:<br /><br />✅&nbsp;PLANEJAMENTO&nbsp;DE&nbsp;ESTUDO&nbsp;SEMANAL<br />✅&nbsp;CONTROLE&nbsp;DE&nbsp;CONTE&Uacute;DO<br />✅&nbsp;RAIO&nbsp;X&nbsp;DA&nbsp;BANCA<br />✅&nbsp;SIMULADOS&nbsp;PADR&Atilde;O&nbsp;<br />✅&nbsp;CADERNO&nbsp;DE&nbsp;QUEST&Otilde;ES&nbsp;<br />✅&nbsp;PLANILHA&nbsp;DE&nbsp;DESEMPENHO<br />✅&nbsp;PLATAFORMA&nbsp;DE&nbsp;ESTUDOS<br />✅&nbsp;VIDEOCONFER&Ecirc;NCIA&nbsp;INDIVIDUAL<br />✅&nbsp;ACOMPANHAMENTO&nbsp;INDIVIDUAL<br /><br />O&nbsp;investimento&nbsp;&eacute;&nbsp;de&nbsp;R$&nbsp;349,90&nbsp;pode&nbsp;ser&nbsp;feito&nbsp;por&nbsp;pix&nbsp;ou&nbsp;podendo&nbsp;parcelar&nbsp;em&nbsp;at&eacute;&nbsp;12x&nbsp;no&nbsp;cart&atilde;o.</div>', NULL, 'pescaria-brava.jpg', '2023-03-19 03:00:00.000000', '<div style=\"text-align: justify;\">Ser&aacute;&nbsp;um&nbsp;acompanhamento&nbsp;at&eacute;&nbsp;a&nbsp;data&nbsp;da&nbsp;prova<br />O&nbsp;que&nbsp;voc&ecirc;&nbsp;ir&aacute;&nbsp;receber:<br /><br />✅&nbsp;PLANEJAMENTO&nbsp;DE&nbsp;ESTUDO&nbsp;SEMANAL<br />✅&nbsp;CONTROLE&nbsp;DE&nbsp;CONTE&Uacute;DO<br />✅&nbsp;RAIO&nbsp;X&nbsp;DA&nbsp;BANCA<br />✅&nbsp;SIMULADOS&nbsp;PADR&Atilde;O&nbsp;<br />✅&nbsp;CADERNO&nbsp;DE&nbsp;QUEST&Otilde;ES&nbsp;<br />✅&nbsp;PLANILHA&nbsp;DE&nbsp;DESEMPENHO<br />✅&nbsp;PLATAFORMA&nbsp;DE&nbsp;ESTUDOS<br />✅&nbsp;VIDEOCONFER&Ecirc;NCIA&nbsp;INDIVIDUAL<br />✅&nbsp;ACOMPANHAMENTO&nbsp;INDIVIDUAL<br /><br />O&nbsp;investimento&nbsp;&eacute;&nbsp;de&nbsp;R$&nbsp;349,90&nbsp;pode&nbsp;ser&nbsp;feito&nbsp;por&nbsp;pix&nbsp;ou&nbsp;podendo&nbsp;parcelar&nbsp;em&nbsp;at&eacute;&nbsp;12x&nbsp;no&nbsp;cart&atilde;o.</div>', 1, 1, '2023-02-22 14:31:08', '2023-02-22 14:32:05', NULL, NULL, 349.9, 0),
(49, 'Turma Concurso Indaial-SC', '<div style=\"text-align: justify;\">Ser&aacute;&nbsp;um&nbsp;acompanhamento&nbsp;at&eacute;&nbsp;a&nbsp;data&nbsp;da&nbsp;prova<br />O&nbsp;que&nbsp;voc&ecirc;&nbsp;ir&aacute;&nbsp;receber:<br /><br />✅&nbsp;PLANEJAMENTO&nbsp;DE&nbsp;ESTUDO&nbsp;SEMANAL<br />✅&nbsp;CONTROLE&nbsp;DE&nbsp;CONTE&Uacute;DO<br />✅&nbsp;RAIO&nbsp;X&nbsp;DA&nbsp;BANCA<br />✅&nbsp;SIMULADOS&nbsp;PADR&Atilde;O&nbsp;<br />✅&nbsp;CADERNO&nbsp;DE&nbsp;QUEST&Otilde;ES&nbsp;<br />✅&nbsp;PLANILHA&nbsp;DE&nbsp;DESEMPENHO<br />✅&nbsp;PLATAFORMA&nbsp;DE&nbsp;ESTUDOS<br />✅&nbsp;VIDEOCONFER&Ecirc;NCIA&nbsp;INDIVIDUAL<br />✅&nbsp;ACOMPANHAMENTO&nbsp;INDIVIDUAL<br /><br />O&nbsp;investimento&nbsp;&eacute;&nbsp;de&nbsp;R$&nbsp;349,90&nbsp;pode&nbsp;ser&nbsp;feito&nbsp;por&nbsp;pix&nbsp;ou&nbsp;podendo&nbsp;parcelar&nbsp;em&nbsp;at&eacute;&nbsp;12x&nbsp;no&nbsp;cart&atilde;o.</div>', NULL, 'indaial.jpg', '2023-05-21 03:00:00.000000', '<div style=\"text-align: justify;\">Ser&aacute;&nbsp;um&nbsp;acompanhamento&nbsp;at&eacute;&nbsp;a&nbsp;data&nbsp;da&nbsp;prova<br />O&nbsp;que&nbsp;voc&ecirc;&nbsp;ir&aacute;&nbsp;receber:<br /><br />✅&nbsp;PLANEJAMENTO&nbsp;DE&nbsp;ESTUDO&nbsp;SEMANAL<br />✅&nbsp;CONTROLE&nbsp;DE&nbsp;CONTE&Uacute;DO<br />✅&nbsp;RAIO&nbsp;X&nbsp;DA&nbsp;BANCA<br />✅&nbsp;SIMULADOS&nbsp;PADR&Atilde;O&nbsp;<br />✅&nbsp;CADERNO&nbsp;DE&nbsp;QUEST&Otilde;ES&nbsp;<br />✅&nbsp;PLANILHA&nbsp;DE&nbsp;DESEMPENHO<br />✅&nbsp;PLATAFORMA&nbsp;DE&nbsp;ESTUDOS<br />✅&nbsp;VIDEOCONFER&Ecirc;NCIA&nbsp;INDIVIDUAL<br />✅&nbsp;ACOMPANHAMENTO&nbsp;INDIVIDUAL<br /><br />O&nbsp;investimento&nbsp;&eacute;&nbsp;de&nbsp;R$&nbsp;349,90&nbsp;pode&nbsp;ser&nbsp;feito&nbsp;por&nbsp;pix&nbsp;ou&nbsp;podendo&nbsp;parcelar&nbsp;em&nbsp;at&eacute;&nbsp;12x&nbsp;no&nbsp;cart&atilde;o.</div>', 1, 1, '2023-02-22 14:31:08', '2023-02-22 14:32:05', NULL, NULL, 349.9, 0),
(50, 'Turma Processo Seletivo de Campos Novos', '<div style=\"text-align: justify;\">Ser&aacute;&nbsp;um&nbsp;acompanhamento&nbsp;at&eacute;&nbsp;a&nbsp;data&nbsp;da&nbsp;prova<br />O&nbsp;que&nbsp;voc&ecirc;&nbsp;ir&aacute;&nbsp;receber:<br /><br />✅&nbsp;PLANEJAMENTO&nbsp;DE&nbsp;ESTUDO&nbsp;SEMANAL<br />✅&nbsp;CONTROLE&nbsp;DE&nbsp;CONTE&Uacute;DO<br />✅&nbsp;RAIO&nbsp;X&nbsp;DA&nbsp;BANCA<br />✅&nbsp;SIMULADOS&nbsp;PADR&Atilde;O&nbsp;<br />✅&nbsp;CADERNO&nbsp;DE&nbsp;QUEST&Otilde;ES&nbsp;<br />✅&nbsp;PLANILHA&nbsp;DE&nbsp;DESEMPENHO<br />✅&nbsp;PLATAFORMA&nbsp;DE&nbsp;ESTUDOS<br />✅&nbsp;VIDEOCONFER&Ecirc;NCIA&nbsp;INDIVIDUAL<br />✅&nbsp;ACOMPANHAMENTO&nbsp;INDIVIDUAL<br /><br />O&nbsp;investimento&nbsp;&eacute;&nbsp;de&nbsp;R$&nbsp;349,90&nbsp;pode&nbsp;ser&nbsp;feito&nbsp;por&nbsp;pix&nbsp;ou&nbsp;podendo&nbsp;parcelar&nbsp;em&nbsp;at&eacute;&nbsp;12x&nbsp;no&nbsp;cart&atilde;o.</div>', NULL, 'campos-novos.jpg', '2023-03-19 03:00:00.000000', '<div style=\"text-align: justify;\">Ser&aacute;&nbsp;um&nbsp;acompanhamento&nbsp;at&eacute;&nbsp;a&nbsp;data&nbsp;da&nbsp;prova<br />O&nbsp;que&nbsp;voc&ecirc;&nbsp;ir&aacute;&nbsp;receber:<br /><br />✅&nbsp;PLANEJAMENTO&nbsp;DE&nbsp;ESTUDO&nbsp;SEMANAL<br />✅&nbsp;CONTROLE&nbsp;DE&nbsp;CONTE&Uacute;DO<br />✅&nbsp;RAIO&nbsp;X&nbsp;DA&nbsp;BANCA<br />✅&nbsp;SIMULADOS&nbsp;PADR&Atilde;O&nbsp;<br />✅&nbsp;CADERNO&nbsp;DE&nbsp;QUEST&Otilde;ES&nbsp;<br />✅&nbsp;PLANILHA&nbsp;DE&nbsp;DESEMPENHO<br />✅&nbsp;PLATAFORMA&nbsp;DE&nbsp;ESTUDOS<br />✅&nbsp;VIDEOCONFER&Ecirc;NCIA&nbsp;INDIVIDUAL<br />✅&nbsp;ACOMPANHAMENTO&nbsp;INDIVIDUAL<br /><br />O&nbsp;investimento&nbsp;&eacute;&nbsp;de&nbsp;R$&nbsp;349,90&nbsp;pode&nbsp;ser&nbsp;feito&nbsp;por&nbsp;pix&nbsp;ou&nbsp;podendo&nbsp;parcelar&nbsp;em&nbsp;at&eacute;&nbsp;12x&nbsp;no&nbsp;cart&atilde;o.</div>', 1, 1, '2023-02-22 14:31:08', '2023-02-22 14:32:05', NULL, NULL, 349.9, 0),
(51, 'Turma Concurso Barra Velha-SC', '<div style=\"text-align: justify;\">Ser&aacute;&nbsp;um&nbsp;acompanhamento&nbsp;at&eacute;&nbsp;a&nbsp;data&nbsp;da&nbsp;prova<br />O&nbsp;que&nbsp;voc&ecirc;&nbsp;ir&aacute;&nbsp;receber:<br /><br />✅&nbsp;PLANEJAMENTO&nbsp;DE&nbsp;ESTUDO&nbsp;SEMANAL<br />✅&nbsp;CONTROLE&nbsp;DE&nbsp;CONTE&Uacute;DO<br />✅&nbsp;RAIO&nbsp;X&nbsp;DA&nbsp;BANCA<br />✅&nbsp;SIMULADOS&nbsp;PADR&Atilde;O&nbsp;<br />✅&nbsp;CADERNO&nbsp;DE&nbsp;QUEST&Otilde;ES&nbsp;<br />✅&nbsp;PLANILHA&nbsp;DE&nbsp;DESEMPENHO<br />✅&nbsp;PLATAFORMA&nbsp;DE&nbsp;ESTUDOS<br />✅&nbsp;VIDEOCONFER&Ecirc;NCIA&nbsp;INDIVIDUAL<br />✅&nbsp;ACOMPANHAMENTO&nbsp;INDIVIDUAL<br /><br />O&nbsp;investimento&nbsp;&eacute;&nbsp;de&nbsp;R$&nbsp;349,90&nbsp;pode&nbsp;ser&nbsp;feito&nbsp;por&nbsp;pix&nbsp;ou&nbsp;podendo&nbsp;parcelar&nbsp;em&nbsp;at&eacute;&nbsp;12x&nbsp;no&nbsp;cart&atilde;o.</div>', NULL, NULL, '2023-04-02 03:00:00.000000', '<div style=\"text-align: justify;\">Ser&aacute;&nbsp;um&nbsp;acompanhamento&nbsp;at&eacute;&nbsp;a&nbsp;data&nbsp;da&nbsp;prova<br />O&nbsp;que&nbsp;voc&ecirc;&nbsp;ir&aacute;&nbsp;receber:<br /><br />✅&nbsp;PLANEJAMENTO&nbsp;DE&nbsp;ESTUDO&nbsp;SEMANAL<br />✅&nbsp;CONTROLE&nbsp;DE&nbsp;CONTE&Uacute;DO<br />✅&nbsp;RAIO&nbsp;X&nbsp;DA&nbsp;BANCA<br />✅&nbsp;SIMULADOS&nbsp;PADR&Atilde;O&nbsp;<br />✅&nbsp;CADERNO&nbsp;DE&nbsp;QUEST&Otilde;ES&nbsp;<br />✅&nbsp;PLANILHA&nbsp;DE&nbsp;DESEMPENHO<br />✅&nbsp;PLATAFORMA&nbsp;DE&nbsp;ESTUDOS<br />✅&nbsp;VIDEOCONFER&Ecirc;NCIA&nbsp;INDIVIDUAL<br />✅&nbsp;ACOMPANHAMENTO&nbsp;INDIVIDUAL<br /><br />O&nbsp;investimento&nbsp;&eacute;&nbsp;de&nbsp;R$&nbsp;349,90&nbsp;pode&nbsp;ser&nbsp;feito&nbsp;por&nbsp;pix&nbsp;ou&nbsp;podendo&nbsp;parcelar&nbsp;em&nbsp;at&eacute;&nbsp;12x&nbsp;no&nbsp;cart&atilde;o.</div>', 1, 1, '2023-02-22 14:31:08', '2023-02-22 14:32:05', NULL, NULL, 349.9, 0),
(52, 'Turma Concurso IFC', '<div style=\"text-align:justify\">Ser&aacute;&nbsp;um&nbsp;acompanhamento&nbsp;at&eacute;&nbsp;a&nbsp;data&nbsp;da&nbsp;prova<br />O&nbsp;que&nbsp;voc&ecirc;&nbsp;ir&aacute;&nbsp;receber:<br /><br />✅&nbsp;PLANEJAMENTO&nbsp;DE&nbsp;ESTUDO&nbsp;SEMANAL<br />✅&nbsp;CONTROLE&nbsp;DE&nbsp;CONTE&Uacute;DO<br />✅&nbsp;RAIO&nbsp;X&nbsp;DA&nbsp;BANCA<br />✅&nbsp;SIMULADOS&nbsp;PADR&Atilde;O&nbsp;<br />✅&nbsp;CADERNO&nbsp;DE&nbsp;QUEST&Otilde;ES&nbsp;<br />✅&nbsp;PLANILHA&nbsp;DE&nbsp;DESEMPENHO<br />✅&nbsp;PLATAFORMA&nbsp;DE&nbsp;ESTUDOS<br />✅&nbsp;VIDEOCONFER&Ecirc;NCIA&nbsp;INDIVIDUAL<br />✅&nbsp;ACOMPANHAMENTO&nbsp;INDIVIDUAL<br /><br />O&nbsp;investimento&nbsp;&eacute;&nbsp;de&nbsp;R$&nbsp;349,90&nbsp;pode&nbsp;ser&nbsp;feito&nbsp;por&nbsp;pix&nbsp;ou&nbsp;podendo&nbsp;parcelar&nbsp;em&nbsp;at&eacute;&nbsp;12x&nbsp;no&nbsp;cart&atilde;o.</div>', NULL, 'ifc.jpg', '2023-04-23 03:00:00.000000', 'Ser&aacute;&nbsp;um&nbsp;acompanhamento&nbsp;at&eacute;&nbsp;a&nbsp;data&nbsp;da&nbsp;prova<br />O&nbsp;que&nbsp;voc&ecirc;&nbsp;ir&aacute;&nbsp;receber:<br /><br />✅&nbsp;PLANEJAMENTO&nbsp;DE&nbsp;ESTUDO&nbsp;SEMANAL<br />✅&nbsp;CONTROLE&nbsp;DE&nbsp;CONTE&Uacute;DO<br />✅&nbsp;RAIO&nbsp;X&nbsp;DA&nbsp;BANCA<br />✅&nbsp;SIMULADOS&nbsp;PADR&Atilde;O&nbsp;<br />✅&nbsp;CADERNO&nbsp;DE&nbsp;QUEST&Otilde;ES&nbsp;<br />✅&nbsp;PLANILHA&nbsp;DE&nbsp;DESEMPENHO<br />✅&nbsp;PLATAFORMA&nbsp;DE&nbsp;ESTUDOS<br />✅&nbsp;VIDEOCONFER&Ecirc;NCIA&nbsp;INDIVIDUAL<br />✅&nbsp;ACOMPANHAMENTO&nbsp;INDIVIDUAL<br /><br />O&nbsp;investimento&nbsp;&eacute;&nbsp;de&nbsp;R$&nbsp;349,90&nbsp;pode&nbsp;ser&nbsp;feito&nbsp;por&nbsp;pix&nbsp;ou&nbsp;podendo&nbsp;parcelar&nbsp;em&nbsp;at&eacute;&nbsp;12x&nbsp;no&nbsp;cart&atilde;o.', 1, 1, '2023-02-22 14:31:08', '2023-02-22 14:32:05', NULL, NULL, 349.9, 0),
(53, 'Turma Concurso Schroeder - SC', '<div style=\"text-align:justify\">Ser&aacute;&nbsp;um&nbsp;acompanhamento&nbsp;at&eacute;&nbsp;a&nbsp;data&nbsp;da&nbsp;prova<br />O&nbsp;que&nbsp;voc&ecirc;&nbsp;ir&aacute;&nbsp;receber:<br /><br />✅&nbsp;PLANEJAMENTO&nbsp;DE&nbsp;ESTUDO&nbsp;SEMANAL<br />✅&nbsp;CONTROLE&nbsp;DE&nbsp;CONTE&Uacute;DO<br />✅&nbsp;RAIO&nbsp;X&nbsp;DA&nbsp;BANCA<br />✅&nbsp;SIMULADOS&nbsp;PADR&Atilde;O&nbsp;<br />✅&nbsp;CADERNO&nbsp;DE&nbsp;QUEST&Otilde;ES&nbsp;<br />✅&nbsp;PLANILHA&nbsp;DE&nbsp;DESEMPENHO<br />✅&nbsp;PLATAFORMA&nbsp;DE&nbsp;ESTUDOS<br />✅&nbsp;VIDEOCONFER&Ecirc;NCIA&nbsp;INDIVIDUAL<br />✅&nbsp;ACOMPANHAMENTO&nbsp;INDIVIDUAL<br /><br />O&nbsp;investimento&nbsp;&eacute;&nbsp;de&nbsp;R$&nbsp;349,90&nbsp;pode&nbsp;ser&nbsp;feito&nbsp;por&nbsp;pix&nbsp;ou&nbsp;podendo&nbsp;parcelar&nbsp;em&nbsp;at&eacute;&nbsp;12x&nbsp;no&nbsp;cart&atilde;o.</div>', NULL, 'schroeder.jpg', '2023-04-02 03:00:00.000000', 'Ser&aacute;&nbsp;um&nbsp;acompanhamento&nbsp;at&eacute;&nbsp;a&nbsp;data&nbsp;da&nbsp;prova<br />O&nbsp;que&nbsp;voc&ecirc;&nbsp;ir&aacute;&nbsp;receber:<br /><br />✅&nbsp;PLANEJAMENTO&nbsp;DE&nbsp;ESTUDO&nbsp;SEMANAL<br />✅&nbsp;CONTROLE&nbsp;DE&nbsp;CONTE&Uacute;DO<br />✅&nbsp;RAIO&nbsp;X&nbsp;DA&nbsp;BANCA<br />✅&nbsp;SIMULADOS&nbsp;PADR&Atilde;O&nbsp;<br />✅&nbsp;CADERNO&nbsp;DE&nbsp;QUEST&Otilde;ES&nbsp;<br />✅&nbsp;PLANILHA&nbsp;DE&nbsp;DESEMPENHO<br />✅&nbsp;PLATAFORMA&nbsp;DE&nbsp;ESTUDOS<br />✅&nbsp;VIDEOCONFER&Ecirc;NCIA&nbsp;INDIVIDUAL<br />✅&nbsp;ACOMPANHAMENTO&nbsp;INDIVIDUAL<br /><br />O&nbsp;investimento&nbsp;&eacute;&nbsp;de&nbsp;R$&nbsp;349,90&nbsp;pode&nbsp;ser&nbsp;feito&nbsp;por&nbsp;pix&nbsp;ou&nbsp;podendo&nbsp;parcelar&nbsp;em&nbsp;at&eacute;&nbsp;12x&nbsp;no&nbsp;cart&atilde;o.', 1, 1, '2023-02-22 14:31:08', '2023-02-22 14:32:05', NULL, NULL, 349.9, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `servidor_email`
--

CREATE TABLE `servidor_email` (
  `id_servidor` int(11) NOT NULL,
  `criptografia_servidor` varchar(28) DEFAULT NULL,
  `host_servidor` varchar(256) NOT NULL,
  `usuario_servidor` varchar(256) DEFAULT NULL,
  `senha_servidor` varchar(256) DEFAULT NULL,
  `porta_servidor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `servidor_email`
--

INSERT INTO `servidor_email` (`id_servidor`, `criptografia_servidor`, `host_servidor`, `usuario_servidor`, `senha_servidor`, `porta_servidor`) VALUES
(1, 'ssl', 'smtp.professormarlos.com.br', 'contato@professormarlos.com.br', 'Pr0f3ss0r#2023', 465);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(9) NOT NULL,
  `id_perfil` int(9) NOT NULL,
  `nome_usuario` varchar(128) NOT NULL,
  `mail_usuario` varchar(128) NOT NULL,
  `senha_usuario` varchar(128) NOT NULL,
  `status_usuario` tinyint(1) NOT NULL,
  `token_valida_senha` int(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `id_perfil`, `nome_usuario`, `mail_usuario`, `senha_usuario`, `status_usuario`, `token_valida_senha`) VALUES
(5, 4, 'Guilherme Scholl', 'guilhermescholl99@gmail.com', '3171c55343c3991c0387c2f688c3da36', 1, NULL),
(10, 4, 'Dr Criativo', 'contato@drcriativo.com.br', '6eec0ed7ebfbe94555e0ead588d88436', 1, NULL),
(11, 3, 'Marlos Campos', 'contato@professormarlos.com.br', '693ff89119d5a69521a88104d4abbb48', 1, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendas`
--

CREATE TABLE `vendas` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_servico` int(11) NOT NULL,
  `id_cupom` int(11) DEFAULT NULL,
  `valor` float DEFAULT NULL,
  `valor_desconto` float DEFAULT NULL,
  `valor_liquido` float DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  `data_compra` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_mercado_pago` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `vendas`
--

INSERT INTO `vendas` (`id`, `id_cliente`, `id_servico`, `id_cupom`, `valor`, `valor_desconto`, `valor_liquido`, `status`, `data_compra`, `id_mercado_pago`) VALUES
(89, 11, 39, 1, 980, 28, 952, 'C', '2023-03-07 17:16:40', NULL),
(90, 11, 39, 1, 980, 28, 952, 'P', '2023-03-07 17:31:46', '1313072937'),
(91, 11, 45, 1, 349.9, 28, 321.9, 'P', '2023-03-07 17:53:46', '1313075141'),
(92, 11, 46, NULL, 349.9, 0, 349.9, 'C', '2023-03-07 18:00:53', NULL),
(93, 11, 46, NULL, 349.9, 0, 349.9, 'P', '2023-03-07 18:04:14', '1313073779'),
(94, 11, 43, NULL, 349.9, 0, 349.9, 'P', '2023-03-07 18:07:46', '1313075511'),
(95, 11, 50, NULL, 349.9, 0, 349.9, 'P', '2023-03-07 18:10:16', '1311966958'),
(96, 11, 47, NULL, 349.9, 0, 349.9, 'P', '2023-03-07 19:35:04', '1313078193'),
(97, 11, 26, NULL, 349.9, 0, 349.9, 'A', '2023-03-07 19:38:05', NULL),
(98, 11, 44, NULL, 349.9, 0, 349.9, 'A', '2023-03-08 11:40:55', '1313094523'),
(99, 11, 41, 1, 349.9, 28, 321.9, 'C', '2023-03-08 12:06:47', '1313102417'),
(100, 11, 35, 1, 349.9, 28, 321.9, 'P', '2023-03-08 14:37:59', '1311984594'),
(101, 11, 53, 1, 349.9, 28, 321.9, 'A', '2023-03-09 11:20:04', NULL),
(102, 11, 52, 1, 349.9, 28, 321.9, 'A', '2023-03-09 13:10:07', NULL),
(103, 11, 41, 1, 349.9, 28, 321.9, 'C', '2023-03-09 17:30:12', NULL),
(104, 11, 41, 1, 349.9, 28, 321.9, 'P', '2023-03-09 17:31:59', '1312004132');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `acessos`
--
ALTER TABLE `acessos`
  ADD PRIMARY KEY (`id_acesso`);

--
-- Índices para tabela `banners_home`
--
ALTER TABLE `banners_home`
  ADD PRIMARY KEY (`id_banner`);

--
-- Índices para tabela `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `clientes_un` (`cpf`,`email`);

--
-- Índices para tabela `como_funciona`
--
ALTER TABLE `como_funciona`
  ADD PRIMARY KEY (`id_topico`);

--
-- Índices para tabela `cupons`
--
ALTER TABLE `cupons`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `depoimentos`
--
ALTER TABLE `depoimentos`
  ADD PRIMARY KEY (`id_depoimento`);

--
-- Índices para tabela `galeria`
--
ALTER TABLE `galeria`
  ADD PRIMARY KEY (`id_foto`);

--
-- Índices para tabela `indicadores`
--
ALTER TABLE `indicadores`
  ADD PRIMARY KEY (`id_indicador`);

--
-- Índices para tabela `linha_tempo_empresa`
--
ALTER TABLE `linha_tempo_empresa`
  ADD PRIMARY KEY (`id_linha_tempo`);

--
-- Índices para tabela `midias`
--
ALTER TABLE `midias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_servico` (`id_servico`);

--
-- Índices para tabela `midia_noticia`
--
ALTER TABLE `midia_noticia`
  ADD PRIMARY KEY (`id_midia_noticia`),
  ADD KEY `noticias_foreign_key` (`id_noticia`);

--
-- Índices para tabela `noticias`
--
ALTER TABLE `noticias`
  ADD PRIMARY KEY (`id_noticia`);

--
-- Índices para tabela `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`id_perfil`);

--
-- Índices para tabela `permissoes`
--
ALTER TABLE `permissoes`
  ADD KEY `perfil_foreign_key` (`id_perfil`),
  ADD KEY `acessos_foreign_key` (`id_acesso`);

--
-- Índices para tabela `redes_sociais`
--
ALTER TABLE `redes_sociais`
  ADD PRIMARY KEY (`id_rede`);

--
-- Índices para tabela `seo`
--
ALTER TABLE `seo`
  ADD PRIMARY KEY (`id_seo`);

--
-- Índices para tabela `servicos`
--
ALTER TABLE `servicos`
  ADD PRIMARY KEY (`id_servico`),
  ADD KEY `categorias_fk` (`id_categoria`);

--
-- Índices para tabela `servidor_email`
--
ALTER TABLE `servidor_email`
  ADD PRIMARY KEY (`id_servidor`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `id_perfil` (`id_perfil`);

--
-- Índices para tabela `vendas`
--
ALTER TABLE `vendas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_servico` (`id_servico`),
  ADD KEY `vendas_ibfk_1` (`id_cliente`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `acessos`
--
ALTER TABLE `acessos`
  MODIFY `id_acesso` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT de tabela `banners_home`
--
ALTER TABLE `banners_home`
  MODIFY `id_banner` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `como_funciona`
--
ALTER TABLE `como_funciona`
  MODIFY `id_topico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `cupons`
--
ALTER TABLE `cupons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `depoimentos`
--
ALTER TABLE `depoimentos`
  MODIFY `id_depoimento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `galeria`
--
ALTER TABLE `galeria`
  MODIFY `id_foto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `indicadores`
--
ALTER TABLE `indicadores`
  MODIFY `id_indicador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `linha_tempo_empresa`
--
ALTER TABLE `linha_tempo_empresa`
  MODIFY `id_linha_tempo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `midias`
--
ALTER TABLE `midias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `midia_noticia`
--
ALTER TABLE `midia_noticia`
  MODIFY `id_midia_noticia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `noticias`
--
ALTER TABLE `noticias`
  MODIFY `id_noticia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `perfil`
--
ALTER TABLE `perfil`
  MODIFY `id_perfil` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `redes_sociais`
--
ALTER TABLE `redes_sociais`
  MODIFY `id_rede` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `seo`
--
ALTER TABLE `seo`
  MODIFY `id_seo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `servicos`
--
ALTER TABLE `servicos`
  MODIFY `id_servico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT de tabela `servidor_email`
--
ALTER TABLE `servidor_email`
  MODIFY `id_servidor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `vendas`
--
ALTER TABLE `vendas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `midias`
--
ALTER TABLE `midias`
  ADD CONSTRAINT `midias_ibfk_1` FOREIGN KEY (`id_servico`) REFERENCES `servicos` (`id_servico`);

--
-- Limitadores para a tabela `midia_noticia`
--
ALTER TABLE `midia_noticia`
  ADD CONSTRAINT `noticias_foreign_key` FOREIGN KEY (`id_noticia`) REFERENCES `noticias` (`id_noticia`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `permissoes`
--
ALTER TABLE `permissoes`
  ADD CONSTRAINT `acessos_foreign_key` FOREIGN KEY (`id_acesso`) REFERENCES `acessos` (`id_acesso`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `perfil_foreign_key` FOREIGN KEY (`id_perfil`) REFERENCES `perfil` (`id_perfil`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `servicos`
--
ALTER TABLE `servicos`
  ADD CONSTRAINT `categorias_fk` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_perfil`) REFERENCES `perfil` (`id_perfil`);

--
-- Limitadores para a tabela `vendas`
--
ALTER TABLE `vendas`
  ADD CONSTRAINT `vendas_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vendas_ibfk_2` FOREIGN KEY (`id_servico`) REFERENCES `servicos` (`id_servico`);
--
-- Banco de dados: `projeto-modulo-2`
--
CREATE DATABASE IF NOT EXISTS `projeto-modulo-2` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `projeto-modulo-2`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(9) NOT NULL,
  `nome` varchar(128) NOT NULL,
  `data_de_nascimento` date NOT NULL,
  `telefone` varchar(32) NOT NULL,
  `endereco` varchar(128) NOT NULL,
  `limite_de_credito` double NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nome`, `data_de_nascimento`, `telefone`, `endereco`, `limite_de_credito`, `created_at`, `updated_at`, `deleted_at`) VALUES
(14, 'Guilherme Scholl', '2001-04-07', '49988641497', 'Rua do comercio', 30000, '2022-06-17 07:49:32', '2022-06-17 07:49:32', '0000-00-00 00:00:00'),
(15, 'Paulo brificado', '2001-05-05', '49988641497', 'Rua do comercio', 1, '2022-06-28 14:57:26', '2022-06-28 14:57:26', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `contaspagar`
--

CREATE TABLE `contaspagar` (
  `id_contapagar` int(9) NOT NULL,
  `nome_empresa` varchar(9) NOT NULL,
  `cnpj` varchar(32) NOT NULL,
  `valor_conta` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `contasreceber`
--

CREATE TABLE `contasreceber` (
  `id_contareceber` int(9) NOT NULL,
  `cnpj_cpf` varchar(32) NOT NULL,
  `valor` double NOT NULL,
  `nome` varchar(28) NOT NULL,
  `tipo_servico` varchar(32) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecedores`
--

CREATE TABLE `fornecedores` (
  `id_fornecedor` int(9) NOT NULL,
  `nome` varchar(128) NOT NULL,
  `cnpj` varchar(14) NOT NULL,
  `genero_fornecedor` varchar(28) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `fornecedores`
--

INSERT INTO `fornecedores` (`id_fornecedor`, `nome`, `cnpj`, `genero_fornecedor`) VALUES
(3, 'Cu de fossa', '123132132132', 'lele da cuca'),
(4, 'Guilherme Scholl', '12345654987', 'lele da cuca');

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionarios`
--

CREATE TABLE `funcionarios` (
  `id_funcionario` int(9) NOT NULL,
  `nome` varchar(128) NOT NULL,
  `rg` varchar(32) NOT NULL,
  `cpf` varchar(32) NOT NULL,
  `data_de_nascimento` date NOT NULL,
  `telefone` varchar(32) NOT NULL,
  `endereco` varchar(128) NOT NULL,
  `data_de_contratacao` date NOT NULL,
  `cargo` varchar(128) NOT NULL,
  `salario` double NOT NULL,
  `dia_de_pagamento` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `funcionarios`
--

INSERT INTO `funcionarios` (`id_funcionario`, `nome`, `rg`, `cpf`, `data_de_nascimento`, `telefone`, `endereco`, `data_de_contratacao`, `cargo`, `salario`, `dia_de_pagamento`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, 'Paulo brificado', '1243123', '10163024952', '2001-04-07', '49988641497', 'Rua do comercio', '0000-00-00', 'cu', 0, 12, '2022-06-17 07:50:19', '2022-06-17 07:50:19', '0000-00-00 00:00:00'),
(4, 'Paulo brificado', '1243123', '10163024952', '2001-04-07', '49988641497', 'Rua do comercio', '2001-04-07', 'cu', 0, 12, '2022-06-17 08:53:29', '2022-06-17 08:53:29', '0000-00-00 00:00:00'),
(5, 'Paula Tejando', '1243123', '10163024952', '2001-04-07', '49988641497', 'Rua do comercio', '2001-04-07', 'cu', 0, 12, '2022-06-17 09:02:39', '2022-06-17 09:02:39', '0000-00-00 00:00:00'),
(6, 'Paula Tejando1', '1243123', '10163024952', '2001-04-07', '49988641497', 'Rua do comercio', '2001-04-07', 'cu', 0, 12, '2022-06-17 09:03:29', '2022-06-17 09:07:39', '0000-00-00 00:00:00'),
(7, 'Paula Tejando1', '1243123', '10163024952', '2001-04-07', '49988641497', 'Rua do comercio', '2001-04-07', 'cu', 0, 12, '2022-06-17 09:07:43', '2022-06-17 09:07:43', '0000-00-00 00:00:00'),
(8, 'Paula Tejando3', '1243123', '10163024952', '2001-04-07', '49988641497', 'Rua do comercio', '2001-04-07', 'cu', 12, 12, '2022-06-17 09:07:52', '2022-06-17 09:20:25', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `logins`
--

CREATE TABLE `logins` (
  `id_login` int(9) NOT NULL,
  `usuario` varchar(128) NOT NULL,
  `senha` varchar(128) NOT NULL,
  `primeiro_nome` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `logins`
--

INSERT INTO `logins` (`id_login`, `usuario`, `senha`, `primeiro_nome`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Guilherme');

-- --------------------------------------------------------

--
-- Estrutura da tabela `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(1, '2022-06-14-181926', 'App\\Database\\Migrations\\Clientes', 'default', 'App', 1655231167, 1),
(2, '2022-06-17-105029', 'App\\Database\\Migrations\\Funcionarios', 'default', 'App', 1655463461, 2),
(3, '2022-06-17-165920', 'App\\Database\\Migrations\\Produtos', 'default', 'App', 1655486125, 3),
(4, '2022-06-17-183213', 'App\\Database\\Migrations\\Fornecedores', 'default', 'App', 1655493919, 4),
(5, '2022-06-17-183408', 'App\\Database\\Migrations\\ContasPagar', 'default', 'App', 1655722432, 5),
(6, '2022-06-17-183427', 'App\\Database\\Migrations\\ContasReceber', 'default', 'App', 1655722758, 6),
(7, '2022-06-17-183502', 'App\\Database\\Migrations\\Vendedores', 'default', 'App', 1655722758, 6),
(8, '2022-06-17-183539', 'App\\Database\\Migrations\\Transportadoras', 'default', 'App', 1655722758, 6),
(9, '2022-06-17-183558', 'App\\Database\\Migrations\\Servicos', 'default', 'App', 1655722758, 6),
(10, '2022-06-23-164022', 'App\\Database\\Migrations\\Logins', 'default', 'App', 1656003309, 7),
(11, '2022-06-23-181013', 'App\\Database\\Migrations\\Logins', 'default', 'App', 1656007858, 8);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `id_produto` int(9) NOT NULL,
  `nome` varchar(128) NOT NULL,
  `descricao` varchar(128) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `quantidade_minima` int(11) NOT NULL,
  `valor_de_compra` double NOT NULL,
  `valor_de_venda` double NOT NULL,
  `margem_de_lucro` int(11) NOT NULL,
  `Validade` date NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`id_produto`, `nome`, `descricao`, `quantidade`, `quantidade_minima`, `valor_de_compra`, `valor_de_venda`, `margem_de_lucro`, `Validade`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, 'notibuke2', 'não sei dizer o que mudou mas nada está igual', 1500, 10, 10, 10000000, 100000, '2001-03-29', '2022-06-17 13:00:24', '2022-06-17 13:07:07', '0000-00-00 00:00:00'),
(4, 'aiponei', 'sem bateria', 24, 24, 10, 10000000, 100000, '2022-06-29', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `servicos`
--

CREATE TABLE `servicos` (
  `id_servico` int(9) NOT NULL,
  `tipo` varchar(28) NOT NULL,
  `descricao` varchar(128) NOT NULL,
  `cliente_contratante` varchar(19) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `servicos`
--

INSERT INTO `servicos` (`id_servico`, `tipo`, `descricao`, `cliente_contratante`) VALUES
(1, '2432', 'não sei dizer o que mudou mas nada está igual', 'c'),
(2, '', '', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `transportadoras`
--

CREATE TABLE `transportadoras` (
  `id_transportadora` int(9) NOT NULL,
  `nome_transportadora` varchar(28) NOT NULL,
  `cnpj` varchar(32) NOT NULL,
  `servicos_mes` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `transportadoras`
--

INSERT INTO `transportadoras` (`id_transportadora`, `nome_transportadora`, `cnpj`, `servicos_mes`, `created_at`, `updated_at`, `deleted_at`) VALUES
(4, 'paula noku', '12345654987', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'Tekomo Nakama', '12345654987', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendedores`
--

CREATE TABLE `vendedores` (
  `id_vendedor` int(9) NOT NULL,
  `nome` varchar(28) NOT NULL,
  `cpf` varchar(32) NOT NULL,
  `data_admissao` date NOT NULL,
  `media_vendas_mes` double NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `vendedores`
--

INSERT INTO `vendedores` (`id_vendedor`, `nome`, `cpf`, `data_admissao`, `media_vendas_mes`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 'Jesus que vende', '10163024952', '0000-00-00', 123123, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'Paulo brificado', '10163024952', '2022-06-23', 123123, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Índices para tabela `contaspagar`
--
ALTER TABLE `contaspagar`
  ADD PRIMARY KEY (`id_contapagar`);

--
-- Índices para tabela `contasreceber`
--
ALTER TABLE `contasreceber`
  ADD PRIMARY KEY (`id_contareceber`);

--
-- Índices para tabela `fornecedores`
--
ALTER TABLE `fornecedores`
  ADD PRIMARY KEY (`id_fornecedor`);

--
-- Índices para tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD PRIMARY KEY (`id_funcionario`);

--
-- Índices para tabela `logins`
--
ALTER TABLE `logins`
  ADD PRIMARY KEY (`id_login`);

--
-- Índices para tabela `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id_produto`);

--
-- Índices para tabela `servicos`
--
ALTER TABLE `servicos`
  ADD PRIMARY KEY (`id_servico`);

--
-- Índices para tabela `transportadoras`
--
ALTER TABLE `transportadoras`
  ADD KEY `id_transportadora` (`id_transportadora`);

--
-- Índices para tabela `vendedores`
--
ALTER TABLE `vendedores`
  ADD PRIMARY KEY (`id_vendedor`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `contaspagar`
--
ALTER TABLE `contaspagar`
  MODIFY `id_contapagar` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `contasreceber`
--
ALTER TABLE `contasreceber`
  MODIFY `id_contareceber` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `fornecedores`
--
ALTER TABLE `fornecedores`
  MODIFY `id_fornecedor` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  MODIFY `id_funcionario` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `logins`
--
ALTER TABLE `logins`
  MODIFY `id_login` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id_produto` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `servicos`
--
ALTER TABLE `servicos`
  MODIFY `id_servico` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `transportadoras`
--
ALTER TABLE `transportadoras`
  MODIFY `id_transportadora` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `vendedores`
--
ALTER TABLE `vendedores`
  MODIFY `id_vendedor` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Banco de dados: `projetojava`
--
CREATE DATABASE IF NOT EXISTS `projetojava` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `projetojava`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `nome` varchar(64) NOT NULL,
  `sobrenome` varchar(128) NOT NULL,
  `email` varchar(256) NOT NULL,
  `telefone` varchar(14) DEFAULT NULL,
  `cep` varchar(9) DEFAULT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `data_insert` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`id`, `nome`, `sobrenome`, `email`, `telefone`, `cep`, `cpf`, `data_insert`) VALUES
(3, 'teste', 'teste', 'guilhermescholl99@gmail.com', '49988641497', '89500000', '10163024952', '2023-05-29 18:02:58'),
(4, 'Guilherme', 'Scholl', 'guilhermescholl99@gmail.com', '49988641497', '123123', '10163024952', '2023-06-05 11:11:21');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cupom`
--

CREATE TABLE `cupom` (
  `id` int(11) NOT NULL,
  `codigo_cupom` varchar(16) DEFAULT NULL,
  `valor_desconto` double DEFAULT NULL,
  `tipo_desconto` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cupom`
--

INSERT INTO `cupom` (`id`, `codigo_cupom`, `valor_desconto`, `tipo_desconto`) VALUES
(6, 'teste', 123, 'd'),
(7, 'cupaoteste', 60, 'p');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `id` int(11) NOT NULL,
  `nome_produto` varchar(256) DEFAULT NULL,
  `valor` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`id`, `nome_produto`, `valor`) VALUES
(7, 'Bola de Futebol', 180),
(8, 'Chuteira Nike', 479.9);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos_venda`
--

CREATE TABLE `produtos_venda` (
  `id` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `id_venda` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `produtos_venda`
--

INSERT INTO `produtos_venda` (`id`, `id_produto`, `id_venda`) VALUES
(135, 7, 121),
(136, 7, 121),
(137, 7, 121),
(138, 7, 121),
(139, 7, 121),
(140, 7, 121),
(141, 8, 122),
(142, 7, 122),
(143, 8, 122),
(144, 8, 122),
(145, 7, 123),
(146, 8, 123),
(147, 7, 123),
(148, 8, 123);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nome` varchar(64) NOT NULL,
  `sobrenome` varchar(128) NOT NULL,
  `email` varchar(256) NOT NULL,
  `senha` text DEFAULT NULL,
  `cpf` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id`, `nome`, `sobrenome`, `email`, `senha`, `cpf`) VALUES
(1, 'teste', 'teste', 'teste', '$2a$10$urU2/1dg8jHWUx2IvzaSaehPF9M2gqK7nzVgcgtikB9QYOzr8I0U2', '123.123.123-12'),
(2, 'Guilherme', 'Cauduro Scholl ', 'guilhermescholl99@gmail.com', '$2a$10$uNIObFo90S3KqqGa5Q3WleTzYnV1sWBMTAOefLfriNhNq.rofMjgm', '101.630.249-52'),
(3, 'Donovan', 'Gomes', 'donovangomes@ymail.com', '$2a$10$i26/zfT0L3i1jRfoxDvZjuMVfksGFRwvTrANZ8nlbRxyWB6BV.JeS', '010.601.689-01');

-- --------------------------------------------------------

--
-- Estrutura da tabela `venda`
--

CREATE TABLE `venda` (
  `id` int(11) NOT NULL,
  `id_pedido` varchar(128) NOT NULL,
  `valor_bruto` double DEFAULT NULL,
  `valor_com_desconto` double DEFAULT NULL,
  `id_cupom` int(11) DEFAULT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `forma_pagamento` char(1) DEFAULT NULL,
  `data_compra` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `venda`
--

INSERT INTO `venda` (`id`, `id_pedido`, `valor_bruto`, `valor_com_desconto`, `id_cupom`, `id_usuario`, `id_cliente`, `forma_pagamento`, `data_compra`) VALUES
(121, '48ae1b57-0493-11ee-a0e5-0ae0afb40cc7', 1080, 957, 6, 2, 4, 'D', '2023-06-06 17:55:15'),
(122, '9453dc0b-0493-11ee-a0e5-0ae0afb40cc7', 1619.6999999999998, 1496.6999999999998, 6, 2, 4, 'C', '2023-06-06 17:57:22'),
(123, '5936d162-0498-11ee-a0e5-0ae0afb40cc7', 1319.8, 1196.8, 6, 2, 4, 'C', '2023-06-06 18:31:31');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `cupom`
--
ALTER TABLE `cupom`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `produtos_venda`
--
ALTER TABLE `produtos_venda`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produtos_fk_122` (`id_produto`),
  ADD KEY `vendas_fk_123` (`id_venda`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `venda`
--
ALTER TABLE `venda`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cupom` (`id_cupom`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `cupom`
--
ALTER TABLE `cupom`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `produtos_venda`
--
ALTER TABLE `produtos_venda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `venda`
--
ALTER TABLE `venda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `produtos_venda`
--
ALTER TABLE `produtos_venda`
  ADD CONSTRAINT `produtos_fk_122` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vendas_fk_123` FOREIGN KEY (`id_venda`) REFERENCES `venda` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `venda`
--
ALTER TABLE `venda`
  ADD CONSTRAINT `venda_ibfk_1` FOREIGN KEY (`id_cupom`) REFERENCES `cupom` (`id`),
  ADD CONSTRAINT `venda_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `venda_ibfk_3` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`);
--
-- Banco de dados: `sincol`
--
CREATE DATABASE IF NOT EXISTS `sincol` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `sincol`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `arquivos_quemsomos`
--

CREATE TABLE `arquivos_quemsomos` (
  `arq_id` int(11) NOT NULL,
  `qsm_id` int(11) DEFAULT NULL,
  `arq_alt_texto` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `arq_titulo` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `arq_descricao` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `arq_tipo` enum('Arquivo','Imagem','Vídeo') COLLATE utf8mb4_unicode_ci NOT NULL,
  `arq_url` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `arq_resumo` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `arq_imagem` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `arq_ordem` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `arquivos_quemsomos`
--

INSERT INTO `arquivos_quemsomos` (`arq_id`, `qsm_id`, `arq_alt_texto`, `arq_titulo`, `arq_descricao`, `arq_tipo`, `arq_url`, `arq_resumo`, `arq_imagem`, `arq_ordem`) VALUES
(1, 2, 'industria01', 'industria01', 'industria01', 'Imagem', 'abc70-industria-1.jpg', NULL, NULL, 0),
(2, 2, 'industria02', 'industria02', 'industria02', 'Imagem', '621eb-industria2.jpg', NULL, NULL, 0),
(3, 2, 'industria03', 'industria03', 'industria03', 'Imagem', 'bda06-industria3.jpg', NULL, 'bfc68-industria3.jpg', 0),
(4, 2, 'industria04', 'industria04', 'industria04', 'Imagem', '18f4d-industria4.jpg', NULL, NULL, 0),
(5, 2, 'industria05', 'industria05', 'industria05', 'Imagem', 'a336f-industria5.jpg', NULL, NULL, 0),
(7, 3, 'floresta01', 'floresta01', 'floresta01', 'Imagem', 'e32ea-reflo3.jpg', NULL, NULL, 0),
(8, 3, 'floresta02', 'floresta02', 'floresta02', 'Imagem', '0e7f2-reflo2.jpg', NULL, NULL, 0),
(9, 3, 'floresta03', 'floresta03', 'floresta03', 'Imagem', 'a0e52-reflo1.jpg', NULL, NULL, 0),
(10, 3, 'floresta04', 'floresta04', 'floresta04', 'Imagem', 'cb360-reflo4.jpg', NULL, 'f1bca-reflo4.jpg', 0),
(13, 3, 'Certificação Florestal', 'Certificação Florestal', 'Certificação Florestal', 'Arquivo', '79cb7-certificacao.pdf', NULL, NULL, 0),
(14, 3, 'Conscientização \"Caça\"', 'Conscientização \"Caça\"', 'Conscientização \"Caça\"', 'Arquivo', '5b0d5-concientizacao-caca.pdf', NULL, NULL, 0),
(15, 3, 'Conscientização Reciclagem', 'Conscientização Reciclagem', 'Conscientização Reciclagem', 'Arquivo', 'e906a-concientizacao-reciclagem.pdf', NULL, NULL, 0),
(17, 5, 'Monitoramento', 'Monitoramento', 'Monitoramento', 'Arquivo', '03b3e-tabelas-monitoramento.pdf', NULL, NULL, 0),
(18, 8, 'sede_01', 'sede_01', 'sede_01', 'Imagem', '728d3-sede_01.jpg', NULL, NULL, 0),
(19, 8, 'sede_02', 'sede_02', 'sede_02', 'Imagem', 'dfdf7-sede_02.jpg', NULL, NULL, 0),
(20, 8, 'sede_03', 'sede_03', 'sede_03', 'Imagem', '4ffbd-sede_03.jpg', NULL, NULL, 0),
(21, 8, 'sede_04', 'sede_04', 'sede_04', 'Imagem', '55d2e-sede_04.jpg', NULL, NULL, 0),
(22, 8, 'sede_05', 'sede_05', 'sede_05', 'Imagem', 'a3f05-sede_05.jpg', NULL, NULL, 0),
(23, 8, 'sede_06', 'sede_06', 'sede_06', 'Imagem', '90241-sede_06.jpg', NULL, NULL, 0),
(24, 8, 'sersi_01', 'sersi_01', 'sersi_01', 'Imagem', '7eec3-sersi_01.jpg', NULL, NULL, 0),
(25, 8, 'sersi_02', 'sersi_02', 'sersi_02', 'Imagem', '7e2a5-sersi_02.jpg', NULL, NULL, 0),
(26, 8, 'sersi_03', 'sersi_03', 'sersi_03', 'Imagem', 'c28c2-sersi_03.jpg', NULL, NULL, 0),
(27, 8, 'sersi_04', 'sersi_04', 'sersi_04', 'Imagem', 'ae671-sersi_04.jpg', NULL, NULL, 0),
(28, 8, 'sersi_05', 'sersi_05', 'sersi_05', 'Imagem', 'e75d7-sersi_05.jpg', NULL, NULL, 0),
(29, 8, 'sersi_06', 'sersi_06', 'sersi_06', 'Imagem', '06eee-sersi_06.jpg', NULL, NULL, 0),
(30, 8, 'sersi_07', 'sersi_07', 'sersi_07', 'Imagem', '7318a-sersi_07.jpg', NULL, NULL, 0),
(31, 8, 'sersi_08', 'sersi_08', 'sersi_08', 'Imagem', 'c2c92-sersi_08.jpg', NULL, NULL, 0),
(32, 9, 'selo_social', 'selo_social', 'selo_social', 'Imagem', '6dd77-selo_social.jpg', NULL, NULL, 0),
(33, 10, 'saude_01', 'saude_01', 'saude_01', 'Imagem', '1f3ed-saude_01.jpg', NULL, NULL, 0),
(35, 10, 'saude_03', 'saude_03', 'saude_03', 'Imagem', 'c6a20-saude_03.jpg', NULL, NULL, 0),
(38, 10, 'saude_06', 'saude_06', 'saude_06', 'Imagem', '53c8a-saude_06.jpg', NULL, NULL, 0),
(45, 12, 'treinamento_01', 'treinamento_01', 'treinamento_01', 'Imagem', 'd4079-treinamento_01.jpg', NULL, NULL, 0),
(46, 12, 'treinamento_02', 'treinamento_02', 'treinamento_02', 'Imagem', '46f4f-treinamento_02.jpg', NULL, NULL, 0),
(47, 12, 'treinamento_03', 'treinamento_03', 'treinamento_03', 'Imagem', '555e8-treinamento_03.jpg', NULL, NULL, 0),
(48, 12, 'treinamento_04', 'treinamento_04', 'treinamento_04', 'Imagem', '76e15-treinamento_04.jpg', NULL, NULL, 0),
(49, 12, 'treinamento_05', 'treinamento_05', 'treinamento_05', 'Imagem', '3f43b-treinamento_05.jpg', NULL, NULL, 0),
(50, 12, 'treinamento_06', 'treinamento_06', 'treinamento_06', 'Imagem', '1e8d2-treinamento_06.jpg', NULL, NULL, 0),
(51, 16, 'prf', 'PRF-30 + IA - ABNT NBR 15281:2005 PARTE 01 ||| PRF-30 + IA - ABNT NBR 15281: 2005 ||| PRF-30 + IA - ABNT NBR 15281: 2005', '<p>Conjunto certificado atendendo aos requisitos do PE - 418&nbsp;e da Norma ABNT NBR 15281:2005</p><p>|||</p><p>We were certified for meeting the requirements of PE-418 and ABNT NBR 15281:2005 Standard</p><p>|||</p><p>Equipo certificado por cumplir con los requisitos de la norma PE-418 y ABNT NBR 15281: 2005</p>', 'Arquivo', 'a2106-certificado-352.012_22-kit-pem-prf-ie-30.pdf', NULL, '9f49a-logo-abnt.jpg', 1),
(52, 16, 'pem-ru', 'PEM RU - ABNT NBR 15930-2:2018 - 155/201 ||| PEM RU - ABNT NBR 15930-2:2018 - 155/201 ||| PEM RU - ABNT NBR 15930-2: 2018 - 155/201', '<p>Conjunto certificado atendendo aos requisitos do PE-418 e da Norma ABNT NBR 15930-2018</p><p>|||</p><p>We were certified for meeting the requirements of PE-418 and ABNT NBR 15930-2018 Standard</p><p>|||</p><p>Equipo certificado por cumplir con los requisitos de la norma PE-418 y ABNT NBR 15930-2018</p>', 'Arquivo', 'c0140-certificado-352.007_22-pem-ru.pdf', NULL, '96e70-logo-abnt.jpg', 2),
(55, 16, 'acustica-31', 'Laudo IPT - ACÚSTICA 31dB ||| IPT Report - ACOUSTICS 31dB ||| Informe IPT - ACÚSTICA 31dB', '<p>Laudo teste Ac&uacute;stico 31dB</p><p>|||</p><p>Acoustic test report 31dB</p><p>|||</p><p>Informe de prueba ac&uacute;stica 31dB</p>', 'Arquivo', '795ad-certificado_acustica_31.pdf', '(Necessário Porta de 45mm)', '61e98-5201_th_materia.jpg', 7),
(56, 16, 'acustica-28', 'Laudo IPT - ACÚSTICA 28dB ||| IPT Report - ACOUSTICS 28dB ||| Informe IPT - ACÚSTICA 28dB', '<p>Laudo teste Ac&uacute;stico 28dB</p><p>|||</p><p>Acoustic test report 28dB</p><p>|||</p><p>Informe de prueba ac&uacute;stica 28dB</p>', 'Arquivo', '44e6d-certificado_acustica_28.pdf', '(Porta de 35mm)', '5cd2c-5201_th_materia.jpg', 8),
(57, 16, 'cadeia-custodia-fsc', 'Certificação de Cadeia de Custódia FSC<sup>®</sup> ||| FSC<sup>®</sup> Chain of Custody Certification ||| Certificación FSC<sup>®</sup> de Cadena de Custodia', '<p>Procure por nossos produtos certificados FSC<sup>&reg;</sup>.</p><p>|||</p><p>Look for our FSC<sup>&reg;</sup> certified products.</p><p>|||</p><p>Busque nuestros productos certificados FSC<sup>&reg;</sup>.</p>', 'Arquivo', '29c8b-certificado_cadeia_custodia.pdf', NULL, '126bf-fsc_c018475_promotional_with_text_portrait_greenonwhite_r_u8afuz.svg', 9),
(58, 16, 'reflorestadora-fsc', 'Certificação de Manejo Florestal FSC<sup>®</sup> ||| FSC<sup>®</sup> Forest Management Certification ||| Certificación FSC<sup>®</sup> de Manejo Forestal', '<p>Procure por nossos produtos certificados FSC<sup>&reg;</sup>.</p><p>|||</p><p>Look for our FSC<sup>&reg;</sup> certified products.</p><p>|||</p><p>Busque nuestros productos certificados FSC<sup>&reg;</sup>.</p>', 'Arquivo', 'e196c-certificado_fsc_reflorestadora.pdf', NULL, 'd478f-fscfizspk.svg', 10),
(59, 17, 'premio_01', 'premio_01', 'premio_01', 'Imagem', 'b9a38-premio_01.jpg', NULL, NULL, 0),
(60, 17, 'premio_02', 'premio_02', 'premio_02', 'Imagem', '7b551-premio_02.jpg', NULL, NULL, 0),
(61, 17, 'premio_03', 'premio_03', 'premio_03', 'Imagem', 'd94d3-premio_03.jpg', NULL, NULL, 0),
(62, 17, 'premio_04', 'premio_04', 'premio_04', 'Imagem', '44cc9-premio_04.jpg', NULL, NULL, 0),
(63, 17, 'premio_05', 'premio_05', 'premio_05', 'Imagem', 'e1fbf-premio_05.jpg', NULL, NULL, 0),
(64, 17, 'premio_06', 'premio_06', 'premio_06', 'Imagem', '08770-premio_06.jpg', NULL, NULL, 0),
(65, 17, 'premio_07', 'premio_07', 'premio_07', 'Imagem', '35c16-premio_07.jpg', NULL, NULL, 0),
(66, 17, 'premio_08', 'premio_08', 'premio_08', 'Imagem', '64556-premio_08.jpg', NULL, NULL, 0),
(67, 17, 'premio_09', 'premio_09', 'premio_09', 'Imagem', '74963-premio_09.jpg', NULL, NULL, 0),
(68, 17, 'premio_10', 'premio_10', 'premio_10', 'Imagem', '01da0-premio_10.jpg', NULL, NULL, 0),
(69, 17, 'premio_11', 'premio_11', 'premio_11', 'Imagem', '066a8-premio_11.jpg', NULL, NULL, 0),
(70, 17, 'premio_12', 'premio_12', 'premio_12', 'Imagem', '5854f-premio_12.jpg', NULL, NULL, 0),
(71, 17, 'premio_13', 'premio_13', 'premio_13', 'Imagem', '62d9b-premio_13.jpg', NULL, NULL, 0),
(72, 17, 'premio_14', 'premio_14', 'premio_14', 'Imagem', '4f4f9-premio_14.jpg', NULL, NULL, 0),
(73, 17, 'premio_15', 'premio_15', 'premio_15', 'Imagem', '399ef-premio_15.jpg', NULL, NULL, 0),
(74, 17, 'premio_16', 'premio_16', 'premio_16', 'Imagem', '5dd8e-premio_16.jpg', NULL, NULL, 0),
(75, 17, 'premio_17', 'premio_17', 'premio_17', 'Imagem', '7db1c-premio_17.jpg', NULL, NULL, 0),
(76, 17, 'premio_18', 'premio_18', 'premio_18', 'Imagem', '5037b-premio_18.jpg', NULL, NULL, 0),
(77, 17, 'premio_19', 'premio_19', 'premio_19', 'Imagem', '7798e-premio_19.jpg', NULL, NULL, 0),
(78, 17, 'premio_20', 'premio_20', 'premio_20', 'Imagem', '17216-premio_20.jpg', NULL, NULL, 0),
(79, 17, 'premio_21', 'premio_21', 'premio_21', 'Imagem', '13cc2-premio_21.jpg', NULL, NULL, 0),
(80, 17, 'premio_22', 'premio_22', 'premio_22', 'Imagem', '62591-premio_22.jpg', NULL, NULL, 0),
(81, 17, 'premio_23', 'premio_23', 'premio_23', 'Imagem', '4e167-premio_23.jpg', NULL, NULL, 0),
(82, 1, 'video-institucional-sincol', 'Vídeo Institucional Sincol', 'Vídeo Institucional Sincol', 'Vídeo', 'd8be3-video-institucional-sincol.mp4', NULL, NULL, 0),
(84, 4, NULL, 'Resumo Público', '<p>Resumo P&uacute;blico</p>', 'Arquivo', '7bb9f-resumopublico_sincol2022.pdf', NULL, NULL, 0),
(85, 19, NULL, 'Resumo Público', '<p>Resumo P&uacute;blico</p>', 'Arquivo', '2b5ec-resumopublico_sincol2022.pdf', NULL, NULL, 0),
(86, 16, NULL, 'PIM RU - ABNT NBR 15930-2:2018 - 153 ||| PIM RU - ABNT NBR 15930-2:2018 - 153 ||| PIM RU - ABNT NBR 15930-2:2018 - 153', '<p>Conjunto certificado atendendo aos requisitos do PE-418 e da Norma ABNT NBR 15930-2018</p><p>|||</p><p>Conjunto certificado atendendo aos requisitos do PE-418 e da Norma ABNT NBR 15930-2018</p><p>|||</p><p>Conjunto certificado atendendo aos requisitos do PE-418 e da Norma ABNT NBR 15930-2018</p>', 'Arquivo', 'a8aef-certificado-352.004_21-kit-pim-153.....pdf', NULL, '997bc-1f1ff-logo-abnt.jpg', 6),
(87, 16, NULL, 'PEM RU - ABNT NBR 15930-2:2018 - 156 ||| PEM RU - ABNT NBR 15930-2:2018 - 156 ||| PEM RU - ABNT NBR 15930-2:2018 - 156', '<p>PEM RU - ABNT NBR 15930-2:2018...</p>', 'Arquivo', 'c3681-certificado-352.007_21-kit-pem.pdf', NULL, '96dcf-3afea-logo-abnt.jpg', 3),
(202, 3, 'floresta04', 'floresta04', '<p>floresta04</p>', 'Imagem', '8bfe0-02reflosite.jpg', NULL, NULL, 0),
(203, 3, 'floresta05', 'floresta05', '<p>floresta05</p>', 'Imagem', '59b1f-01reflosite.jpg', NULL, NULL, 0),
(204, 3, 'floresta06', 'floresta06', '<p>floresta06</p>', 'Imagem', '84c88-03reflosite.jpg', NULL, NULL, 0),
(205, 16, 'prf', 'PRF-30 + IA - ABNT NBR 15281:2005 PARTE 02 ||| PRF-30 + IA - ABNT NBR 15281: 2005 ||| PRF-30 + IA - ABNT NBR 15281: 2005', '<p>Conjunto certificado atendendo aos requisitos do PE - 418 e da Norma ABNT NBR 15281:2005</p><p>|||</p><p>We were certified for meeting the requirements of PE-418 and ABNT NBR 15281:2005 Standard</p><p>|||</p><p>Equipo certificado por cumplir con los requisitos de la norma PE-418 y ABNT NBR 15281: 2005</p>', 'Arquivo', '0039e-certificado-352.013_22-prf-ie-30-ia.pdf', NULL, '9f49a-logo-abnt.jpg', 1),
(206, 16, NULL, ' Laudo Acústica PEM RU - 156', '<p>Laudo teste ac&uacute;stica</p>', 'Arquivo', '66f47-156-acustica.png', NULL, '38e10-itt.jpg', 8);

-- --------------------------------------------------------

--
-- Estrutura da tabela `banner`
--

CREATE TABLE `banner` (
  `ban_id` bigint(20) NOT NULL,
  `ban_img` varchar(256) DEFAULT NULL,
  `ban_imgsm` varchar(256) NOT NULL,
  `ban_titulo` varchar(120) NOT NULL,
  `ban_descricao` text NOT NULL,
  `ban_link` varchar(256) NOT NULL,
  `ban_exibir` tinyint(1) NOT NULL DEFAULT 0,
  `ban_status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `banner`
--

INSERT INTO `banner` (`ban_id`, `ban_img`, `ban_imgsm`, `ban_titulo`, `ban_descricao`, `ban_link`, `ban_exibir`, `ban_status`) VALUES
(5, '00061-banner-2.jpg', '96c4b-banner-2_02.jpg', '', '', '', 0, 1),
(6, 'c5ab4-banner-1.jpg', '31954-banner-3_02.jpg', '', '', '', 0, 1),
(8, '16c53-banner-impressione.jpg', '66cec-banner-impressione1_02.jpg', 'Acesse e confira!!', '', '/produtos/portas/105/colecao-impressione', 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `carrossel`
--

CREATE TABLE `carrossel` (
  `car_id` int(11) NOT NULL,
  `cat_id` int(11) DEFAULT NULL,
  `car_titulo` varchar(256) DEFAULT NULL,
  `car_descricao` text DEFAULT NULL,
  `car_link` varchar(256) DEFAULT NULL,
  `car_img` varchar(256) DEFAULT NULL,
  `car_exibir` tinyint(1) DEFAULT 0,
  `car_status` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `carrossel`
--

INSERT INTO `carrossel` (`car_id`, `cat_id`, `car_titulo`, `car_descricao`, `car_link`, `car_img`, `car_exibir`, `car_status`) VALUES
(1, 1, 'ABNT', '<p>&lt;p&gt;Selo ABNT&lt;/p&gt;</p>', NULL, '193e4-logo-abnt.jpg', 0, 1),
(2, 1, 'Abimci', '<p>Logo Abimci</p>', NULL, '926ee-abimci.png', 0, 1),
(3, 1, 'FSC', '<p>Logo&nbsp;FSC</p>', NULL, 'ab481-logo-fsc.png', 0, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `carrossel_categoria`
--

CREATE TABLE `carrossel_categoria` (
  `cat_id` int(11) NOT NULL,
  `cat_pai` int(11) DEFAULT NULL,
  `cat_titulo` varchar(256) DEFAULT NULL,
  `cat_descricao` text DEFAULT NULL,
  `cat_img` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `carrossel_categoria`
--

INSERT INTO `carrossel_categoria` (`cat_id`, `cat_pai`, `cat_titulo`, `cat_descricao`, `cat_img`) VALUES
(1, NULL, 'Certificações', '<p>Certifica&ccedil;&otilde;es</p>', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cidade`
--

CREATE TABLE `cidade` (
  `cid_id` int(11) NOT NULL,
  `cid_nome` varchar(120) DEFAULT NULL,
  `est_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cidade`
--

INSERT INTO `cidade` (`cid_id`, `cid_nome`, `est_id`) VALUES
(1, 'Afonso Cláudio', 8),
(2, 'Água Doce do Norte', 8),
(3, 'Águia Branca', 8),
(4, 'Alegre', 8),
(5, 'Alfredo Chaves', 8),
(6, 'Alto Rio Novo', 8),
(7, 'Anchieta', 8),
(8, 'Apiacá', 8),
(9, 'Aracruz', 8),
(10, 'Atilio Vivacqua', 8),
(11, 'Baixo Guandu', 8),
(12, 'Barra de São Francisco', 8),
(13, 'Boa Esperança', 8),
(14, 'Bom Jesus do Norte', 8),
(15, 'Brejetuba', 8),
(16, 'Cachoeiro de Itapemirim', 8),
(17, 'Cariacica', 8),
(18, 'Castelo', 8),
(19, 'Colatina', 8),
(20, 'Conceição da Barra', 8),
(21, 'Conceição do Castelo', 8),
(22, 'Divino de São Lourenço', 8),
(23, 'Domingos Martins', 8),
(24, 'Dores do Rio Preto', 8),
(25, 'Ecoporanga', 8),
(26, 'Fundão', 8),
(27, 'Governador Lindenberg', 8),
(28, 'Guaçuí', 8),
(29, 'Guarapari', 8),
(30, 'Ibatiba', 8),
(31, 'Ibiraçu', 8),
(32, 'Ibitirama', 8),
(33, 'Iconha', 8),
(34, 'Irupi', 8),
(35, 'Itaguaçu', 8),
(36, 'Itapemirim', 8),
(37, 'Itarana', 8),
(38, 'Iúna', 8),
(39, 'Jaguaré', 8),
(40, 'Jerônimo Monteiro', 8),
(41, 'João Neiva', 8),
(42, 'Laranja da Terra', 8),
(43, 'Linhares', 8),
(44, 'Mantenópolis', 8),
(45, 'Marataízes', 8),
(46, 'Marechal Floriano', 8),
(47, 'Marilândia', 8),
(48, 'Mimoso do Sul', 8),
(49, 'Montanha', 8),
(50, 'Mucurici', 8),
(51, 'Muniz Freire', 8),
(52, 'Muqui', 8),
(53, 'Nova Venécia', 8),
(54, 'Pancas', 8),
(55, 'Pedro Canário', 8),
(56, 'Pinheiros', 8),
(57, 'Piúma', 8),
(58, 'Ponto Belo', 8),
(59, 'Presidente Kennedy', 8),
(60, 'Rio Bananal', 8),
(61, 'Rio Novo do Sul', 8),
(62, 'Santa Leopoldina', 8),
(63, 'Santa Maria de Jetibá', 8),
(64, 'Santa Teresa', 8),
(65, 'São Domingos do Norte', 8),
(66, 'São Gabriel da Palha', 8),
(67, 'São José do Calçado', 8),
(68, 'São Mateus', 8),
(69, 'São Roque do Canaã', 8),
(70, 'Serra', 8),
(71, 'Sooretama', 8),
(72, 'Vargem Alta', 8),
(73, 'Venda Nova do Imigrante', 8),
(74, 'Viana', 8),
(75, 'Vila Pavão', 8),
(76, 'Vila Valério', 8),
(77, 'Vila Velha', 8),
(78, 'Vitória', 8),
(79, 'Acrelândia', 1),
(80, 'Assis Brasil', 1),
(81, 'Brasiléia', 1),
(82, 'Bujari', 1),
(83, 'Capixaba', 1),
(84, 'Cruzeiro do Sul', 1),
(85, 'Epitaciolândia', 1),
(86, 'Feijó', 1),
(87, 'Jordão', 1),
(88, 'Mâncio Lima', 1),
(89, 'Manoel Urbano', 1),
(90, 'Marechal Thaumaturgo', 1),
(91, 'Plácido de Castro', 1),
(92, 'Porto Acre', 1),
(93, 'Porto Walter', 1),
(94, 'Rio Branco', 1),
(95, 'Rodrigues Alves', 1),
(96, 'Santa Rosa do Purus', 1),
(97, 'Sena Madureira', 1),
(98, 'Senador Guiomard', 1),
(99, 'Tarauacá', 1),
(100, 'Xapuri', 1),
(101, 'Água Branca', 2),
(102, 'Anadia', 2),
(103, 'Arapiraca', 2),
(104, 'Atalaia', 2),
(105, 'Barra de Santo Antônio', 2),
(106, 'Barra de São Miguel', 2),
(107, 'Batalha', 2),
(108, 'Belém', 2),
(109, 'Belo Monte', 2),
(110, 'Boca da Mata', 2),
(111, 'Branquinha', 2),
(112, 'Cacimbinhas', 2),
(113, 'Cajueiro', 2),
(114, 'Campestre', 2),
(115, 'Campo Alegre', 2),
(116, 'Campo Grande', 2),
(117, 'Canapi', 2),
(118, 'Capela', 2),
(119, 'Carneiros', 2),
(120, 'Chã Preta', 2),
(121, 'Coité do Nóia', 2),
(122, 'Colônia Leopoldina', 2),
(123, 'Coqueiro Seco', 2),
(124, 'Coruripe', 2),
(125, 'Craíbas', 2),
(126, 'Delmiro Gouveia', 2),
(127, 'Dois Riachos', 2),
(128, 'Estrela de Alagoas', 2),
(129, 'Feira Grande', 2),
(130, 'Feliz Deserto', 2),
(131, 'Flexeiras', 2),
(132, 'Girau do Ponciano', 2),
(133, 'Ibateguara', 2),
(134, 'Igaci', 2),
(135, 'Igreja Nova', 2),
(136, 'Inhapi', 2),
(137, 'Jacaré dos Homens', 2),
(138, 'Jacuípe', 2),
(139, 'Japaratinga', 2),
(140, 'Jaramataia', 2),
(141, 'Jequiá da Praia', 2),
(142, 'Joaquim Gomes', 2),
(143, 'Jundiá', 2),
(144, 'Junqueiro', 2),
(145, 'Lagoa da Canoa', 2),
(146, 'Limoeiro de Anadia', 2),
(147, 'Maceió', 2),
(148, 'Major Isidoro', 2),
(149, 'Mar Vermelho', 2),
(150, 'Maragogi', 2),
(151, 'Maravilha', 2),
(152, 'Marechal Deodoro', 2),
(153, 'Maribondo', 2),
(154, 'Mata Grande', 2),
(155, 'Matriz de Camaragibe', 2),
(156, 'Messias', 2),
(157, 'Minador do Negrão', 2),
(158, 'Monteirópolis', 2),
(159, 'Murici', 2),
(160, 'Novo Lino', 2),
(161, 'Olho d`Água das Flores', 2),
(162, 'Olho d`Água do Casado', 2),
(163, 'Olho d`Água Grande', 2),
(164, 'Olivença', 2),
(165, 'Ouro Branco', 2),
(166, 'Palestina', 2),
(167, 'Palmeira dos Índios', 2),
(168, 'Pão de Açúcar', 2),
(169, 'Pariconha', 2),
(170, 'Paripueira', 2),
(171, 'Passo de Camaragibe', 2),
(172, 'Paulo Jacinto', 2),
(173, 'Penedo', 2),
(174, 'Piaçabuçu', 2),
(175, 'Pilar', 2),
(176, 'Pindoba', 2),
(177, 'Piranhas', 2),
(178, 'Poço das Trincheiras', 2),
(179, 'Porto Calvo', 2),
(180, 'Porto de Pedras', 2),
(181, 'Porto Real do Colégio', 2),
(182, 'Quebrangulo', 2),
(183, 'Rio Largo', 2),
(184, 'Roteiro', 2),
(185, 'Santa Luzia do Norte', 2),
(186, 'Santana do Ipanema', 2),
(187, 'Santana do Mundaú', 2),
(188, 'São Brás', 2),
(189, 'São José da Laje', 2),
(190, 'São José da Tapera', 2),
(191, 'São Luís do Quitunde', 2),
(192, 'São Miguel dos Campos', 2),
(193, 'São Miguel dos Milagres', 2),
(194, 'São Sebastião', 2),
(195, 'Satuba', 2),
(196, 'Senador Rui Palmeira', 2),
(197, 'Tanque d`Arca', 2),
(198, 'Taquarana', 2),
(199, 'Teotônio Vilela', 2),
(200, 'Traipu', 2),
(201, 'União dos Palmares', 2),
(202, 'Viçosa', 2),
(203, 'Amapá', 4),
(204, 'Calçoene', 4),
(205, 'Cutias', 4),
(206, 'Ferreira Gomes', 4),
(207, 'Itaubal', 4),
(208, 'Laranjal do Jari', 4),
(209, 'Macapá', 4),
(210, 'Mazagão', 4),
(211, 'Oiapoque', 4),
(212, 'Pedra Branca do Amaparí', 4),
(213, 'Porto Grande', 4),
(214, 'Pracuúba', 4),
(215, 'Santana', 4),
(216, 'Serra do Navio', 4),
(217, 'Tartarugalzinho', 4),
(218, 'Vitória do Jari', 4),
(219, 'Alvarães', 3),
(220, 'Amaturá', 3),
(221, 'Anamã', 3),
(222, 'Anori', 3),
(223, 'Apuí', 3),
(224, 'Atalaia do Norte', 3),
(225, 'Autazes', 3),
(226, 'Barcelos', 3),
(227, 'Barreirinha', 3),
(228, 'Benjamin Constant', 3),
(229, 'Beruri', 3),
(230, 'Boa Vista do Ramos', 3),
(231, 'Boca do Acre', 3),
(232, 'Borba', 3),
(233, 'Caapiranga', 3),
(234, 'Canutama', 3),
(235, 'Carauari', 3),
(236, 'Careiro', 3),
(237, 'Careiro da Várzea', 3),
(238, 'Coari', 3),
(239, 'Codajás', 3),
(240, 'Eirunepé', 3),
(241, 'Envira', 3),
(242, 'Fonte Boa', 3),
(243, 'Guajará', 3),
(244, 'Humaitá', 3),
(245, 'Ipixuna', 3),
(246, 'Iranduba', 3),
(247, 'Itacoatiara', 3),
(248, 'Itamarati', 3),
(249, 'Itapiranga', 3),
(250, 'Japurá', 3),
(251, 'Juruá', 3),
(252, 'Jutaí', 3),
(253, 'Lábrea', 3),
(254, 'Manacapuru', 3),
(255, 'Manaquiri', 3),
(256, 'Manaus', 3),
(257, 'Manicoré', 3),
(258, 'Maraã', 3),
(259, 'Maués', 3),
(260, 'Nhamundá', 3),
(261, 'Nova Olinda do Norte', 3),
(262, 'Novo Airão', 3),
(263, 'Novo Aripuanã', 3),
(264, 'Parintins', 3),
(265, 'Pauini', 3),
(266, 'Presidente Figueiredo', 3),
(267, 'Rio Preto da Eva', 3),
(268, 'Santa Isabel do Rio Negro', 3),
(269, 'Santo Antônio do Içá', 3),
(270, 'São Gabriel da Cachoeira', 3),
(271, 'São Paulo de Olivença', 3),
(272, 'São Sebastião do Uatumã', 3),
(273, 'Silves', 3),
(274, 'Tabatinga', 3),
(275, 'Tapauá', 3),
(276, 'Tefé', 3),
(277, 'Tonantins', 3),
(278, 'Uarini', 3),
(279, 'Urucará', 3),
(280, 'Urucurituba', 3),
(281, 'Abaíra', 5),
(282, 'Abaré', 5),
(283, 'Acajutiba', 5),
(284, 'Adustina', 5),
(285, 'Água Fria', 5),
(286, 'Aiquara', 5),
(287, 'Alagoinhas', 5),
(288, 'Alcobaça', 5),
(289, 'Almadina', 5),
(290, 'Amargosa', 5),
(291, 'Amélia Rodrigues', 5),
(292, 'América Dourada', 5),
(293, 'Anagé', 5),
(294, 'Andaraí', 5),
(295, 'Andorinha', 5),
(296, 'Angical', 5),
(297, 'Anguera', 5),
(298, 'Antas', 5),
(299, 'Antônio Cardoso', 5),
(300, 'Antônio Gonçalves', 5),
(301, 'Aporá', 5),
(302, 'Apuarema', 5),
(303, 'Araças', 5),
(304, 'Aracatu', 5),
(305, 'Araci', 5),
(306, 'Aramari', 5),
(307, 'Arataca', 5),
(308, 'Aratuípe', 5),
(309, 'Aurelino Leal', 5),
(310, 'Baianópolis', 5),
(311, 'Baixa Grande', 5),
(312, 'Banzaê', 5),
(313, 'Barra', 5),
(314, 'Barra da Estiva', 5),
(315, 'Barra do Choça', 5),
(316, 'Barra do Mendes', 5),
(317, 'Barra do Rocha', 5),
(318, 'Barreiras', 5),
(319, 'Barro Alto', 5),
(320, 'Barro Preto (antigo Gov. Lomanto Jr.)', 5),
(321, 'Barrocas', 5),
(322, 'Belmonte', 5),
(323, 'Belo Campo', 5),
(324, 'Biritinga', 5),
(325, 'Boa Nova', 5),
(326, 'Boa Vista do Tupim', 5),
(327, 'Bom Jesus da Lapa', 5),
(328, 'Bom Jesus da Serra', 5),
(329, 'Boninal', 5),
(330, 'Bonito', 5),
(331, 'Boquira', 5),
(332, 'Botuporã', 5),
(333, 'Brejões', 5),
(334, 'Brejolândia', 5),
(335, 'Brotas de Macaúbas', 5),
(336, 'Brumado', 5),
(337, 'Buerarema', 5),
(338, 'Buritirama', 5),
(339, 'Caatiba', 5),
(340, 'Cabaceiras do Paraguaçu', 5),
(341, 'Cachoeira', 5),
(342, 'Caculé', 5),
(343, 'Caém', 5),
(344, 'Caetanos', 5),
(345, 'Caetité', 5),
(346, 'Cafarnaum', 5),
(347, 'Cairu', 5),
(348, 'Caldeirão Grande', 5),
(349, 'Camacan', 5),
(350, 'Camaçari', 5),
(351, 'Camamu', 5),
(352, 'Campo Alegre de Lourdes', 5),
(353, 'Campo Formoso', 5),
(354, 'Canápolis', 5),
(355, 'Canarana', 5),
(356, 'Canavieiras', 5),
(357, 'Candeal', 5),
(358, 'Candeias', 5),
(359, 'Candiba', 5),
(360, 'Cândido Sales', 5),
(361, 'Cansanção', 5),
(362, 'Canudos', 5),
(363, 'Capela do Alto Alegre', 5),
(364, 'Capim Grosso', 5),
(365, 'Caraíbas', 5),
(366, 'Caravelas', 5),
(367, 'Cardeal da Silva', 5),
(368, 'Carinhanha', 5),
(369, 'Casa Nova', 5),
(370, 'Castro Alves', 5),
(371, 'Catolândia', 5),
(372, 'Catu', 5),
(373, 'Caturama', 5),
(374, 'Central', 5),
(375, 'Chorrochó', 5),
(376, 'Cícero Dantas', 5),
(377, 'Cipó', 5),
(378, 'Coaraci', 5),
(379, 'Cocos', 5),
(380, 'Conceição da Feira', 5),
(381, 'Conceição do Almeida', 5),
(382, 'Conceição do Coité', 5),
(383, 'Conceição do Jacuípe', 5),
(384, 'Conde', 5),
(385, 'Condeúba', 5),
(386, 'Contendas do Sincorá', 5),
(387, 'Coração de Maria', 5),
(388, 'Cordeiros', 5),
(389, 'Coribe', 5),
(390, 'Coronel João Sá', 5),
(391, 'Correntina', 5),
(392, 'Cotegipe', 5),
(393, 'Cravolândia', 5),
(394, 'Crisópolis', 5),
(395, 'Cristópolis', 5),
(396, 'Cruz das Almas', 5),
(397, 'Curaçá', 5),
(398, 'Dário Meira', 5),
(399, 'Dias d`Ávila', 5),
(400, 'Dom Basílio', 5),
(401, 'Dom Macedo Costa', 5),
(402, 'Elísio Medrado', 5),
(403, 'Encruzilhada', 5),
(404, 'Entre Rios', 5),
(405, 'Érico Cardoso', 5),
(406, 'Esplanada', 5),
(407, 'Euclides da Cunha', 5),
(408, 'Eunápolis', 5),
(409, 'Fátima', 5),
(410, 'Feira da Mata', 5),
(411, 'Feira de Santana', 5),
(412, 'Filadélfia', 5),
(413, 'Firmino Alves', 5),
(414, 'Floresta Azul', 5),
(415, 'Formosa do Rio Preto', 5),
(416, 'Gandu', 5),
(417, 'Gavião', 5),
(418, 'Gentio do Ouro', 5),
(419, 'Glória', 5),
(420, 'Gongogi', 5),
(421, 'Governador Mangabeira', 5),
(422, 'Guajeru', 5),
(423, 'Guanambi', 5),
(424, 'Guaratinga', 5),
(425, 'Heliópolis', 5),
(426, 'Iaçu', 5),
(427, 'Ibiassucê', 5),
(428, 'Ibicaraí', 5),
(429, 'Ibicoara', 5),
(430, 'Ibicuí', 5),
(431, 'Ibipeba', 5),
(432, 'Ibipitanga', 5),
(433, 'Ibiquera', 5),
(434, 'Ibirapitanga', 5),
(435, 'Ibirapuã', 5),
(436, 'Ibirataia', 5),
(437, 'Ibitiara', 5),
(438, 'Ibititá', 5),
(439, 'Ibotirama', 5),
(440, 'Ichu', 5),
(441, 'Igaporã', 5),
(442, 'Igrapiúna', 5),
(443, 'Iguaí', 5),
(444, 'Ilhéus', 5),
(445, 'Inhambupe', 5),
(446, 'Ipecaetá', 5),
(447, 'Ipiaú', 5),
(448, 'Ipirá', 5),
(449, 'Ipupiara', 5),
(450, 'Irajuba', 5),
(451, 'Iramaia', 5),
(452, 'Iraquara', 5),
(453, 'Irará', 5),
(454, 'Irecê', 5),
(455, 'Itabela', 5),
(456, 'Itaberaba', 5),
(457, 'Itabuna', 5),
(458, 'Itacaré', 5),
(459, 'Itaeté', 5),
(460, 'Itagi', 5),
(461, 'Itagibá', 5),
(462, 'Itagimirim', 5),
(463, 'Itaguaçu da Bahia', 5),
(464, 'Itaju do Colônia', 5),
(465, 'Itajuípe', 5),
(466, 'Itamaraju', 5),
(467, 'Itamari', 5),
(468, 'Itambé', 5),
(469, 'Itanagra', 5),
(470, 'Itanhém', 5),
(471, 'Itaparica', 5),
(472, 'Itapé', 5),
(473, 'Itapebi', 5),
(474, 'Itapetinga', 5),
(475, 'Itapicuru', 5),
(476, 'Itapitanga', 5),
(477, 'Itaquara', 5),
(478, 'Itarantim', 5),
(479, 'Itatim', 5),
(480, 'Itiruçu', 5),
(481, 'Itiúba', 5),
(482, 'Itororó', 5),
(483, 'Ituaçu', 5),
(484, 'Ituberá', 5),
(485, 'Iuiú', 5),
(486, 'Jaborandi', 5),
(487, 'Jacaraci', 5),
(488, 'Jacobina', 5),
(489, 'Jaguaquara', 5),
(490, 'Jaguarari', 5),
(491, 'Jaguaripe', 5),
(492, 'Jandaíra', 5),
(493, 'Jequié', 5),
(494, 'Jeremoabo', 5),
(495, 'Jiquiriçá', 5),
(496, 'Jitaúna', 5),
(497, 'João Dourado', 5),
(498, 'Juazeiro', 5),
(499, 'Jucuruçu', 5),
(500, 'Jussara', 5),
(501, 'Jussari', 5),
(502, 'Jussiape', 5),
(503, 'Lafaiete Coutinho', 5),
(504, 'Lagoa Real', 5),
(505, 'Laje', 5),
(506, 'Lajedão', 5),
(507, 'Lajedinho', 5),
(508, 'Lajedo do Tabocal', 5),
(509, 'Lamarão', 5),
(510, 'Lapão', 5),
(511, 'Lauro de Freitas', 5),
(512, 'Lençóis', 5),
(513, 'Licínio de Almeida', 5),
(514, 'Livramento de Nossa Senhora', 5),
(515, 'Luís Eduardo Magalhães', 5),
(516, 'Macajuba', 5),
(517, 'Macarani', 5),
(518, 'Macaúbas', 5),
(519, 'Macururé', 5),
(520, 'Madre de Deus', 5),
(521, 'Maetinga', 5),
(522, 'Maiquinique', 5),
(523, 'Mairi', 5),
(524, 'Malhada', 5),
(525, 'Malhada de Pedras', 5),
(526, 'Manoel Vitorino', 5),
(527, 'Mansidão', 5),
(528, 'Maracás', 5),
(529, 'Maragogipe', 5),
(530, 'Maraú', 5),
(531, 'Marcionílio Souza', 5),
(532, 'Mascote', 5),
(533, 'Mata de São João', 5),
(534, 'Matina', 5),
(535, 'Medeiros Neto', 5),
(536, 'Miguel Calmon', 5),
(537, 'Milagres', 5),
(538, 'Mirangaba', 5),
(539, 'Mirante', 5),
(540, 'Monte Santo', 5),
(541, 'Morpará', 5),
(542, 'Morro do Chapéu', 5),
(543, 'Mortugaba', 5),
(544, 'Mucugê', 5),
(545, 'Mucuri', 5),
(546, 'Mulungu do Morro', 5),
(547, 'Mundo Novo', 5),
(548, 'Muniz Ferreira', 5),
(549, 'Muquém de São Francisco', 5),
(550, 'Muritiba', 5),
(551, 'Mutuípe', 5),
(552, 'Nazaré', 5),
(553, 'Nilo Peçanha', 5),
(554, 'Nordestina', 5),
(555, 'Nova Canaã', 5),
(556, 'Nova Fátima', 5),
(557, 'Nova Ibiá', 5),
(558, 'Nova Itarana', 5),
(559, 'Nova Redenção', 5),
(560, 'Nova Soure', 5),
(561, 'Nova Viçosa', 5),
(562, 'Novo Horizonte', 5),
(563, 'Novo Triunfo', 5),
(564, 'Olindina', 5),
(565, 'Oliveira dos Brejinhos', 5),
(566, 'Ouriçangas', 5),
(567, 'Ourolândia', 5),
(568, 'Palmas de Monte Alto', 5),
(569, 'Palmeiras', 5),
(570, 'Paramirim', 5),
(571, 'Paratinga', 5),
(572, 'Paripiranga', 5),
(573, 'Pau Brasil', 5),
(574, 'Paulo Afonso', 5),
(575, 'Pé de Serra', 5),
(576, 'Pedrão', 5),
(577, 'Pedro Alexandre', 5),
(578, 'Piatã', 5),
(579, 'Pilão Arcado', 5),
(580, 'Pindaí', 5),
(581, 'Pindobaçu', 5),
(582, 'Pintadas', 5),
(583, 'Piraí do Norte', 5),
(584, 'Piripá', 5),
(585, 'Piritiba', 5),
(586, 'Planaltino', 5),
(587, 'Planalto', 5),
(588, 'Poções', 5),
(589, 'Pojuca', 5),
(590, 'Ponto Novo', 5),
(591, 'Porto Seguro', 5),
(592, 'Potiraguá', 5),
(593, 'Prado', 5),
(594, 'Presidente Dutra', 5),
(595, 'Presidente Jânio Quadros', 5),
(596, 'Presidente Tancredo Neves', 5),
(597, 'Queimadas', 5),
(598, 'Quijingue', 5),
(599, 'Quixabeira', 5),
(600, 'Rafael Jambeiro', 5),
(601, 'Remanso', 5),
(602, 'Retirolândia', 5),
(603, 'Riachão das Neves', 5),
(604, 'Riachão do Jacuípe', 5),
(605, 'Riacho de Santana', 5),
(606, 'Ribeira do Amparo', 5),
(607, 'Ribeira do Pombal', 5),
(608, 'Ribeirão do Largo', 5),
(609, 'Rio de Contas', 5),
(610, 'Rio do Antônio', 5),
(611, 'Rio do Pires', 5),
(612, 'Rio Real', 5),
(613, 'Rodelas', 5),
(614, 'Ruy Barbosa', 5),
(615, 'Salinas da Margarida', 5),
(616, 'Salvador', 5),
(617, 'Santa Bárbara', 5),
(618, 'Santa Brígida', 5),
(619, 'Santa Cruz Cabrália', 5),
(620, 'Santa Cruz da Vitória', 5),
(621, 'Santa Inês', 5),
(622, 'Santa Luzia', 5),
(623, 'Santa Maria da Vitória', 5),
(624, 'Santa Rita de Cássia', 5),
(625, 'Santa Teresinha', 5),
(626, 'Santaluz', 5),
(627, 'Santana', 5),
(628, 'Santanópolis', 5),
(629, 'Santo Amaro', 5),
(630, 'Santo Antônio de Jesus', 5),
(631, 'Santo Estêvão', 5),
(632, 'São Desidério', 5),
(633, 'São Domingos', 5),
(634, 'São Felipe', 5),
(635, 'São Félix', 5),
(636, 'São Félix do Coribe', 5),
(637, 'São Francisco do Conde', 5),
(638, 'São Gabriel', 5),
(639, 'São Gonçalo dos Campos', 5),
(640, 'São José da Vitória', 5),
(641, 'São José do Jacuípe', 5),
(642, 'São Miguel das Matas', 5),
(643, 'São Sebastião do Passé', 5),
(644, 'Sapeaçu', 5),
(645, 'Sátiro Dias', 5),
(646, 'Saubara', 5),
(647, 'Saúde', 5),
(648, 'Seabra', 5),
(649, 'Sebastião Laranjeiras', 5),
(650, 'Senhor do Bonfim', 5),
(651, 'Sento Sé', 5),
(652, 'Serra do Ramalho', 5),
(653, 'Serra Dourada', 5),
(654, 'Serra Preta', 5),
(655, 'Serrinha', 5),
(656, 'Serrolândia', 5),
(657, 'Simões Filho', 5),
(658, 'Sítio do Mato', 5),
(659, 'Sítio do Quinto', 5),
(660, 'Sobradinho', 5),
(661, 'Souto Soares', 5),
(662, 'Tabocas do Brejo Velho', 5),
(663, 'Tanhaçu', 5),
(664, 'Tanque Novo', 5),
(665, 'Tanquinho', 5),
(666, 'Taperoá', 5),
(667, 'Tapiramutá', 5),
(668, 'Teixeira de Freitas', 5),
(669, 'Teodoro Sampaio', 5),
(670, 'Teofilândia', 5),
(671, 'Teolândia', 5),
(672, 'Terra Nova', 5),
(673, 'Tremedal', 5),
(674, 'Tucano', 5),
(675, 'Uauá', 5),
(676, 'Ubaíra', 5),
(677, 'Ubaitaba', 5),
(678, 'Ubatã', 5),
(679, 'Uibaí', 5),
(680, 'Umburanas', 5),
(681, 'Una', 5),
(682, 'Urandi', 5),
(683, 'Uruçuca', 5),
(684, 'Utinga', 5),
(685, 'Valença', 5),
(686, 'Valente', 5),
(687, 'Várzea da Roça', 5),
(688, 'Várzea do Poço', 5),
(689, 'Várzea Nova', 5),
(690, 'Varzedo', 5),
(691, 'Vera Cruz', 5),
(692, 'Vereda', 5),
(693, 'Vitória da Conquista', 5),
(694, 'Wagner', 5),
(695, 'Wanderley', 5),
(696, 'Wenceslau Guimarães', 5),
(697, 'Xique-Xique', 5),
(698, 'Abaiara', 6),
(699, 'Acarape', 6),
(700, 'Acaraú', 6),
(701, 'Acopiara', 6),
(702, 'Aiuaba', 6),
(703, 'Alcântaras', 6),
(704, 'Altaneira', 6),
(705, 'Alto Santo', 6),
(706, 'Amontada', 6),
(707, 'Antonina do Norte', 6),
(708, 'Apuiarés', 6),
(709, 'Aquiraz', 6),
(710, 'Aracati', 6),
(711, 'Aracoiaba', 6),
(712, 'Ararendá', 6),
(713, 'Araripe', 6),
(714, 'Aratuba', 6),
(715, 'Arneiroz', 6),
(716, 'Assaré', 6),
(717, 'Aurora', 6),
(718, 'Baixio', 6),
(719, 'Banabuiú', 6),
(720, 'Barbalha', 6),
(721, 'Barreira', 6),
(722, 'Barro', 6),
(723, 'Barroquinha', 6),
(724, 'Baturité', 6),
(725, 'Beberibe', 6),
(726, 'Bela Cruz', 6),
(727, 'Boa Viagem', 6),
(728, 'Brejo Santo', 6),
(729, 'Camocim', 6),
(730, 'Campos Sales', 6),
(731, 'Canindé', 6),
(732, 'Capistrano', 6),
(733, 'Caridade', 6),
(734, 'Cariré', 6),
(735, 'Caririaçu', 6),
(736, 'Cariús', 6),
(737, 'Carnaubal', 6),
(738, 'Cascavel', 6),
(739, 'Catarina', 6),
(740, 'Catunda', 6),
(741, 'Caucaia', 6),
(742, 'Cedro', 6),
(743, 'Chaval', 6),
(744, 'Choró', 6),
(745, 'Chorozinho', 6),
(746, 'Coreaú', 6),
(747, 'Crateús', 6),
(748, 'Crato', 6),
(749, 'Croatá', 6),
(750, 'Cruz', 6),
(751, 'Deputado Irapuan Pinheiro', 6),
(752, 'Ererê', 6),
(753, 'Eusébio', 6),
(754, 'Farias Brito', 6),
(755, 'Forquilha', 6),
(756, 'Fortaleza', 6),
(757, 'Fortim', 6),
(758, 'Frecheirinha', 6),
(759, 'General Sampaio', 6),
(760, 'Graça', 6),
(761, 'Granja', 6),
(762, 'Granjeiro', 6),
(763, 'Groaíras', 6),
(764, 'Guaiúba', 6),
(765, 'Guaraciaba do Norte', 6),
(766, 'Guaramiranga', 6),
(767, 'Hidrolândia', 6),
(768, 'Horizonte', 6),
(769, 'Ibaretama', 6),
(770, 'Ibiapina', 6),
(771, 'Ibicuitinga', 6),
(772, 'Icapuí', 6),
(773, 'Icó', 6),
(774, 'Iguatu', 6),
(775, 'Independência', 6),
(776, 'Ipaporanga', 6),
(777, 'Ipaumirim', 6),
(778, 'Ipu', 6),
(779, 'Ipueiras', 6),
(780, 'Iracema', 6),
(781, 'Irauçuba', 6),
(782, 'Itaiçaba', 6),
(783, 'Itaitinga', 6),
(784, 'Itapagé', 6),
(785, 'Itapipoca', 6),
(786, 'Itapiúna', 6),
(787, 'Itarema', 6),
(788, 'Itatira', 6),
(789, 'Jaguaretama', 6),
(790, 'Jaguaribara', 6),
(791, 'Jaguaribe', 6),
(792, 'Jaguaruana', 6),
(793, 'Jardim', 6),
(794, 'Jati', 6),
(795, 'Jijoca de Jericoacoara', 6),
(796, 'Juazeiro do Norte', 6),
(797, 'Jucás', 6),
(798, 'Lavras da Mangabeira', 6),
(799, 'Limoeiro do Norte', 6),
(800, 'Madalena', 6),
(801, 'Maracanaú', 6),
(802, 'Maranguape', 6),
(803, 'Marco', 6),
(804, 'Martinópole', 6),
(805, 'Massapê', 6),
(806, 'Mauriti', 6),
(807, 'Meruoca', 6),
(808, 'Milagres', 6),
(809, 'Milhã', 6),
(810, 'Miraíma', 6),
(811, 'Missão Velha', 6),
(812, 'Mombaça', 6),
(813, 'Monsenhor Tabosa', 6),
(814, 'Morada Nova', 6),
(815, 'Moraújo', 6),
(816, 'Morrinhos', 6),
(817, 'Mucambo', 6),
(818, 'Mulungu', 6),
(819, 'Nova Olinda', 6),
(820, 'Nova Russas', 6),
(821, 'Novo Oriente', 6),
(822, 'Ocara', 6),
(823, 'Orós', 6),
(824, 'Pacajus', 6),
(825, 'Pacatuba', 6),
(826, 'Pacoti', 6),
(827, 'Pacujá', 6),
(828, 'Palhano', 6),
(829, 'Palmácia', 6),
(830, 'Paracuru', 6),
(831, 'Paraipaba', 6),
(832, 'Parambu', 6),
(833, 'Paramoti', 6),
(834, 'Pedra Branca', 6),
(835, 'Penaforte', 6),
(836, 'Pentecoste', 6),
(837, 'Pereiro', 6),
(838, 'Pindoretama', 6),
(839, 'Piquet Carneiro', 6),
(840, 'Pires Ferreira', 6),
(841, 'Poranga', 6),
(842, 'Porteiras', 6),
(843, 'Potengi', 6),
(844, 'Potiretama', 6),
(845, 'Quiterianópolis', 6),
(846, 'Quixadá', 6),
(847, 'Quixelô', 6),
(848, 'Quixeramobim', 6),
(849, 'Quixeré', 6),
(850, 'Redenção', 6),
(851, 'Reriutaba', 6),
(852, 'Russas', 6),
(853, 'Saboeiro', 6),
(854, 'Salitre', 6),
(855, 'Santa Quitéria', 6),
(856, 'Santana do Acaraú', 6),
(857, 'Santana do Cariri', 6),
(858, 'São Benedito', 6),
(859, 'São Gonçalo do Amarante', 6),
(860, 'São João do Jaguaribe', 6),
(861, 'São Luís do Curu', 6),
(862, 'Senador Pompeu', 6),
(863, 'Senador Sá', 6),
(864, 'Sobral', 6),
(865, 'Solonópole', 6),
(866, 'Tabuleiro do Norte', 6),
(867, 'Tamboril', 6),
(868, 'Tarrafas', 6),
(869, 'Tauá', 6),
(870, 'Tejuçuoca', 6),
(871, 'Tianguá', 6),
(872, 'Trairi', 6),
(873, 'Tururu', 6),
(874, 'Ubajara', 6),
(875, 'Umari', 6),
(876, 'Umirim', 6),
(877, 'Uruburetama', 6),
(878, 'Uruoca', 6),
(879, 'Varjota', 6),
(880, 'Várzea Alegre', 6),
(881, 'Viçosa do Ceará', 6),
(882, 'Brasília', 7),
(883, 'Abadia de Goiás', 9),
(884, 'Abadiânia', 9),
(885, 'Acreúna', 9),
(886, 'Adelândia', 9),
(887, 'Água Fria de Goiás', 9),
(888, 'Água Limpa', 9),
(889, 'Águas Lindas de Goiás', 9),
(890, 'Alexânia', 9),
(891, 'Aloândia', 9),
(892, 'Alto Horizonte', 9),
(893, 'Alto Paraíso de Goiás', 9),
(894, 'Alvorada do Norte', 9),
(895, 'Amaralina', 9),
(896, 'Americano do Brasil', 9),
(897, 'Amorinópolis', 9),
(898, 'Anápolis', 9),
(899, 'Anhanguera', 9),
(900, 'Anicuns', 9),
(901, 'Aparecida de Goiânia', 9),
(902, 'Aparecida do Rio Doce', 9),
(903, 'Aporé', 9),
(904, 'Araçu', 9),
(905, 'Aragarças', 9),
(906, 'Aragoiânia', 9),
(907, 'Araguapaz', 9),
(908, 'Arenópolis', 9),
(909, 'Aruanã', 9),
(910, 'Aurilândia', 9),
(911, 'Avelinópolis', 9),
(912, 'Baliza', 9),
(913, 'Barro Alto', 9),
(914, 'Bela Vista de Goiás', 9),
(915, 'Bom Jardim de Goiás', 9),
(916, 'Bom Jesus de Goiás', 9),
(917, 'Bonfinópolis', 9),
(918, 'Bonópolis', 9),
(919, 'Brazabrantes', 9),
(920, 'Britânia', 9),
(921, 'Buriti Alegre', 9),
(922, 'Buriti de Goiás', 9),
(923, 'Buritinópolis', 9),
(924, 'Cabeceiras', 9),
(925, 'Cachoeira Alta', 9),
(926, 'Cachoeira de Goiás', 9),
(927, 'Cachoeira Dourada', 9),
(928, 'Caçu', 9),
(929, 'Caiapônia', 9),
(930, 'Caldas Novas', 9),
(931, 'Caldazinha', 9),
(932, 'Campestre de Goiás', 9),
(933, 'Campinaçu', 9),
(934, 'Campinorte', 9),
(935, 'Campo Alegre de Goiás', 9),
(936, 'Campo Limpo de Goiás', 9),
(937, 'Campos Belos', 9),
(938, 'Campos Verdes', 9),
(939, 'Carmo do Rio Verde', 9),
(940, 'Castelândia', 9),
(941, 'Catalão', 9),
(942, 'Caturaí', 9),
(943, 'Cavalcante', 9),
(944, 'Ceres', 9),
(945, 'Cezarina', 9),
(946, 'Chapadão do Céu', 9),
(947, 'Cidade Ocidental', 9),
(948, 'Cocalzinho de Goiás', 9),
(949, 'Colinas do Sul', 9),
(950, 'Córrego do Ouro', 9),
(951, 'Corumbá de Goiás', 9),
(952, 'Corumbaíba', 9),
(953, 'Cristalina', 9),
(954, 'Cristianópolis', 9),
(955, 'Crixás', 9),
(956, 'Cromínia', 9),
(957, 'Cumari', 9),
(958, 'Damianópolis', 9),
(959, 'Damolândia', 9),
(960, 'Davinópolis', 9),
(961, 'Diorama', 9),
(962, 'Divinópolis de Goiás', 9),
(963, 'Doverlândia', 9),
(964, 'Edealina', 9),
(965, 'Edéia', 9),
(966, 'Estrela do Norte', 9),
(967, 'Faina', 9),
(968, 'Fazenda Nova', 9),
(969, 'Firminópolis', 9),
(970, 'Flores de Goiás', 9),
(971, 'Formosa', 9),
(972, 'Formoso', 9),
(973, 'Gameleira de Goiás', 9),
(974, 'Goianápolis', 9),
(975, 'Goiandira', 9),
(976, 'Goianésia', 9),
(977, 'Goiânia', 9),
(978, 'Goianira', 9),
(979, 'Goiás', 9),
(980, 'Goiatuba', 9),
(981, 'Gouvelândia', 9),
(982, 'Guapó', 9),
(983, 'Guaraíta', 9),
(984, 'Guarani de Goiás', 9),
(985, 'Guarinos', 9),
(986, 'Heitoraí', 9),
(987, 'Hidrolândia', 9),
(988, 'Hidrolina', 9),
(989, 'Iaciara', 9),
(990, 'Inaciolândia', 9),
(991, 'Indiara', 9),
(992, 'Inhumas', 9),
(993, 'Ipameri', 9),
(994, 'Ipiranga de Goiás', 9),
(995, 'Iporá', 9),
(996, 'Israelândia', 9),
(997, 'Itaberaí', 9),
(998, 'Itaguari', 9),
(999, 'Itaguaru', 9),
(1000, 'Itajá', 9),
(1001, 'Itapaci', 9),
(1002, 'Itapirapuã', 9),
(1003, 'Itapuranga', 9),
(1004, 'Itarumã', 9),
(1005, 'Itauçu', 9),
(1006, 'Itumbiara', 9),
(1007, 'Ivolândia', 9),
(1008, 'Jandaia', 9),
(1009, 'Jaraguá', 9),
(1010, 'Jataí', 9),
(1011, 'Jaupaci', 9),
(1012, 'Jesúpolis', 9),
(1013, 'Joviânia', 9),
(1014, 'Jussara', 9),
(1015, 'Lagoa Santa', 9),
(1016, 'Leopoldo de Bulhões', 9),
(1017, 'Luziânia', 9),
(1018, 'Mairipotaba', 9),
(1019, 'Mambaí', 9),
(1020, 'Mara Rosa', 9),
(1021, 'Marzagão', 9),
(1022, 'Matrinchã', 9),
(1023, 'Maurilândia', 9),
(1024, 'Mimoso de Goiás', 9),
(1025, 'Minaçu', 9),
(1026, 'Mineiros', 9),
(1027, 'Moiporá', 9),
(1028, 'Monte Alegre de Goiás', 9),
(1029, 'Montes Claros de Goiás', 9),
(1030, 'Montividiu', 9),
(1031, 'Montividiu do Norte', 9),
(1032, 'Morrinhos', 9),
(1033, 'Morro Agudo de Goiás', 9),
(1034, 'Mossâmedes', 9),
(1035, 'Mozarlândia', 9),
(1036, 'Mundo Novo', 9),
(1037, 'Mutunópolis', 9),
(1038, 'Nazário', 9),
(1039, 'Nerópolis', 9),
(1040, 'Niquelândia', 9),
(1041, 'Nova América', 9),
(1042, 'Nova Aurora', 9),
(1043, 'Nova Crixás', 9),
(1044, 'Nova Glória', 9),
(1045, 'Nova Iguaçu de Goiás', 9),
(1046, 'Nova Roma', 9),
(1047, 'Nova Veneza', 9),
(1048, 'Novo Brasil', 9),
(1049, 'Novo Gama', 9),
(1050, 'Novo Planalto', 9),
(1051, 'Orizona', 9),
(1052, 'Ouro Verde de Goiás', 9),
(1053, 'Ouvidor', 9),
(1054, 'Padre Bernardo', 9),
(1055, 'Palestina de Goiás', 9),
(1056, 'Palmeiras de Goiás', 9),
(1057, 'Palmelo', 9),
(1058, 'Palminópolis', 9),
(1059, 'Panamá', 9),
(1060, 'Paranaiguara', 9),
(1061, 'Paraúna', 9),
(1062, 'Perolândia', 9),
(1063, 'Petrolina de Goiás', 9),
(1064, 'Pilar de Goiás', 9),
(1065, 'Piracanjuba', 9),
(1066, 'Piranhas', 9),
(1067, 'Pirenópolis', 9),
(1068, 'Pires do Rio', 9),
(1069, 'Planaltina', 9),
(1070, 'Pontalina', 9),
(1071, 'Porangatu', 9),
(1072, 'Porteirão', 9),
(1073, 'Portelândia', 9),
(1074, 'Posse', 9),
(1075, 'Professor Jamil', 9),
(1076, 'Quirinópolis', 9),
(1077, 'Rialma', 9),
(1078, 'Rianápolis', 9),
(1079, 'Rio Quente', 9),
(1080, 'Rio Verde', 9),
(1081, 'Rubiataba', 9),
(1082, 'Sanclerlândia', 9),
(1083, 'Santa Bárbara de Goiás', 9),
(1084, 'Santa Cruz de Goiás', 9),
(1085, 'Santa Fé de Goiás', 9),
(1086, 'Santa Helena de Goiás', 9),
(1087, 'Santa Isabel', 9),
(1088, 'Santa Rita do Araguaia', 9),
(1089, 'Santa Rita do Novo Destino', 9),
(1090, 'Santa Rosa de Goiás', 9),
(1091, 'Santa Tereza de Goiás', 9),
(1092, 'Santa Terezinha de Goiás', 9),
(1093, 'Santo Antônio da Barra', 9),
(1094, 'Santo Antônio de Goiás', 9),
(1095, 'Santo Antônio do Descoberto', 9),
(1096, 'São Domingos', 9),
(1097, 'São Francisco de Goiás', 9),
(1098, 'São João d`Aliança', 9),
(1099, 'São João da Paraúna', 9),
(1100, 'São Luís de Montes Belos', 9),
(1101, 'São Luíz do Norte', 9),
(1102, 'São Miguel do Araguaia', 9),
(1103, 'São Miguel do Passa Quatro', 9),
(1104, 'São Patrício', 9),
(1105, 'São Simão', 9),
(1106, 'Senador Canedo', 9),
(1107, 'Serranópolis', 9),
(1108, 'Silvânia', 9),
(1109, 'Simolândia', 9),
(1110, 'Sítio d`Abadia', 9),
(1111, 'Taquaral de Goiás', 9),
(1112, 'Teresina de Goiás', 9),
(1113, 'Terezópolis de Goiás', 9),
(1114, 'Três Ranchos', 9),
(1115, 'Trindade', 9),
(1116, 'Trombas', 9),
(1117, 'Turvânia', 9),
(1118, 'Turvelândia', 9),
(1119, 'Uirapuru', 9),
(1120, 'Uruaçu', 9),
(1121, 'Uruana', 9),
(1122, 'Urutaí', 9),
(1123, 'Valparaíso de Goiás', 9),
(1124, 'Varjão', 9),
(1125, 'Vianópolis', 9),
(1126, 'Vicentinópolis', 9),
(1127, 'Vila Boa', 9),
(1128, 'Vila Propício', 9),
(1129, 'Açailândia', 10),
(1130, 'Afonso Cunha', 10),
(1131, 'Água Doce do Maranhão', 10),
(1132, 'Alcântara', 10),
(1133, 'Aldeias Altas', 10),
(1134, 'Altamira do Maranhão', 10),
(1135, 'Alto Alegre do Maranhão', 10),
(1136, 'Alto Alegre do Pindaré', 10),
(1137, 'Alto Parnaíba', 10),
(1138, 'Amapá do Maranhão', 10),
(1139, 'Amarante do Maranhão', 10),
(1140, 'Anajatuba', 10),
(1141, 'Anapurus', 10),
(1142, 'Apicum-Açu', 10),
(1143, 'Araguanã', 10),
(1144, 'Araioses', 10),
(1145, 'Arame', 10),
(1146, 'Arari', 10),
(1147, 'Axixá', 10),
(1148, 'Bacabal', 10),
(1149, 'Bacabeira', 10),
(1150, 'Bacuri', 10),
(1151, 'Bacurituba', 10),
(1152, 'Balsas', 10),
(1153, 'Barão de Grajaú', 10),
(1154, 'Barra do Corda', 10),
(1155, 'Barreirinhas', 10),
(1156, 'Bela Vista do Maranhão', 10),
(1157, 'Belágua', 10),
(1158, 'Benedito Leite', 10),
(1159, 'Bequimão', 10),
(1160, 'Bernardo do Mearim', 10),
(1161, 'Boa Vista do Gurupi', 10),
(1162, 'Bom Jardim', 10),
(1163, 'Bom Jesus das Selvas', 10),
(1164, 'Bom Lugar', 10),
(1165, 'Brejo', 10),
(1166, 'Brejo de Areia', 10),
(1167, 'Buriti', 10),
(1168, 'Buriti Bravo', 10),
(1169, 'Buriticupu', 10),
(1170, 'Buritirana', 10),
(1171, 'Cachoeira Grande', 10),
(1172, 'Cajapió', 10),
(1173, 'Cajari', 10),
(1174, 'Campestre do Maranhão', 10),
(1175, 'Cândido Mendes', 10),
(1176, 'Cantanhede', 10),
(1177, 'Capinzal do Norte', 10),
(1178, 'Carolina', 10),
(1179, 'Carutapera', 10),
(1180, 'Caxias', 10),
(1181, 'Cedral', 10),
(1182, 'Central do Maranhão', 10),
(1183, 'Centro do Guilherme', 10),
(1184, 'Centro Novo do Maranhão', 10),
(1185, 'Chapadinha', 10),
(1186, 'Cidelândia', 10),
(1187, 'Codó', 10),
(1188, 'Coelho Neto', 10),
(1189, 'Colinas', 10),
(1190, 'Conceição do Lago-Açu', 10),
(1191, 'Coroatá', 10),
(1192, 'Cururupu', 10),
(1193, 'Davinópolis', 10),
(1194, 'Dom Pedro', 10),
(1195, 'Duque Bacelar', 10),
(1196, 'Esperantinópolis', 10),
(1197, 'Estreito', 10),
(1198, 'Feira Nova do Maranhão', 10),
(1199, 'Fernando Falcão', 10),
(1200, 'Formosa da Serra Negra', 10),
(1201, 'Fortaleza dos Nogueiras', 10),
(1202, 'Fortuna', 10),
(1203, 'Godofredo Viana', 10),
(1204, 'Gonçalves Dias', 10),
(1205, 'Governador Archer', 10),
(1206, 'Governador Edison Lobão', 10),
(1207, 'Governador Eugênio Barros', 10),
(1208, 'Governador Luiz Rocha', 10),
(1209, 'Governador Newton Bello', 10),
(1210, 'Governador Nunes Freire', 10),
(1211, 'Graça Aranha', 10),
(1212, 'Grajaú', 10),
(1213, 'Guimarães', 10),
(1214, 'Humberto de Campos', 10),
(1215, 'Icatu', 10),
(1216, 'Igarapé do Meio', 10),
(1217, 'Igarapé Grande', 10),
(1218, 'Imperatriz', 10),
(1219, 'Itaipava do Grajaú', 10),
(1220, 'Itapecuru Mirim', 10),
(1221, 'Itinga do Maranhão', 10),
(1222, 'Jatobá', 10),
(1223, 'Jenipapo dos Vieiras', 10),
(1224, 'João Lisboa', 10),
(1225, 'Joselândia', 10),
(1226, 'Junco do Maranhão', 10),
(1227, 'Lago da Pedra', 10),
(1228, 'Lago do Junco', 10),
(1229, 'Lago dos Rodrigues', 10),
(1230, 'Lago Verde', 10),
(1231, 'Lagoa do Mato', 10),
(1232, 'Lagoa Grande do Maranhão', 10),
(1233, 'Lajeado Novo', 10),
(1234, 'Lima Campos', 10),
(1235, 'Loreto', 10),
(1236, 'Luís Domingues', 10),
(1237, 'Magalhães de Almeida', 10),
(1238, 'Maracaçumé', 10),
(1239, 'Marajá do Sena', 10),
(1240, 'Maranhãozinho', 10),
(1241, 'Mata Roma', 10),
(1242, 'Matinha', 10),
(1243, 'Matões', 10),
(1244, 'Matões do Norte', 10),
(1245, 'Milagres do Maranhão', 10),
(1246, 'Mirador', 10),
(1247, 'Miranda do Norte', 10),
(1248, 'Mirinzal', 10),
(1249, 'Monção', 10),
(1250, 'Montes Altos', 10),
(1251, 'Morros', 10),
(1252, 'Nina Rodrigues', 10),
(1253, 'Nova Colinas', 10),
(1254, 'Nova Iorque', 10),
(1255, 'Nova Olinda do Maranhão', 10),
(1256, 'Olho d`Água das Cunhãs', 10),
(1257, 'Olinda Nova do Maranhão', 10),
(1258, 'Paço do Lumiar', 10),
(1259, 'Palmeirândia', 10),
(1260, 'Paraibano', 10),
(1261, 'Parnarama', 10),
(1262, 'Passagem Franca', 10),
(1263, 'Pastos Bons', 10),
(1264, 'Paulino Neves', 10),
(1265, 'Paulo Ramos', 10),
(1266, 'Pedreiras', 10),
(1267, 'Pedro do Rosário', 10),
(1268, 'Penalva', 10),
(1269, 'Peri Mirim', 10),
(1270, 'Peritoró', 10),
(1271, 'Pindaré-Mirim', 10),
(1272, 'Pinheiro', 10),
(1273, 'Pio XII', 10),
(1274, 'Pirapemas', 10),
(1275, 'Poção de Pedras', 10),
(1276, 'Porto Franco', 10),
(1277, 'Porto Rico do Maranhão', 10),
(1278, 'Presidente Dutra', 10),
(1279, 'Presidente Juscelino', 10),
(1280, 'Presidente Médici', 10),
(1281, 'Presidente Sarney', 10),
(1282, 'Presidente Vargas', 10),
(1283, 'Primeira Cruz', 10),
(1284, 'Raposa', 10),
(1285, 'Riachão', 10),
(1286, 'Ribamar Fiquene', 10),
(1287, 'Rosário', 10),
(1288, 'Sambaíba', 10),
(1289, 'Santa Filomena do Maranhão', 10),
(1290, 'Santa Helena', 10),
(1291, 'Santa Inês', 10),
(1292, 'Santa Luzia', 10),
(1293, 'Santa Luzia do Paruá', 10),
(1294, 'Santa Quitéria do Maranhão', 10),
(1295, 'Santa Rita', 10),
(1296, 'Santana do Maranhão', 10),
(1297, 'Santo Amaro do Maranhão', 10),
(1298, 'Santo Antônio dos Lopes', 10),
(1299, 'São Benedito do Rio Preto', 10),
(1300, 'São Bento', 10),
(1301, 'São Bernardo', 10),
(1302, 'São Domingos do Azeitão', 10),
(1303, 'São Domingos do Maranhão', 10),
(1304, 'São Félix de Balsas', 10),
(1305, 'São Francisco do Brejão', 10),
(1306, 'São Francisco do Maranhão', 10),
(1307, 'São João Batista', 10),
(1308, 'São João do Carú', 10),
(1309, 'São João do Paraíso', 10),
(1310, 'São João do Soter', 10),
(1311, 'São João dos Patos', 10),
(1312, 'São José de Ribamar', 10),
(1313, 'São José dos Basílios', 10),
(1314, 'São Luís', 10),
(1315, 'São Luís Gonzaga do Maranhão', 10),
(1316, 'São Mateus do Maranhão', 10),
(1317, 'São Pedro da Água Branca', 10),
(1318, 'São Pedro dos Crentes', 10),
(1319, 'São Raimundo das Mangabeiras', 10),
(1320, 'São Raimundo do Doca Bezerra', 10),
(1321, 'São Roberto', 10),
(1322, 'São Vicente Ferrer', 10),
(1323, 'Satubinha', 10),
(1324, 'Senador Alexandre Costa', 10),
(1325, 'Senador La Rocque', 10),
(1326, 'Serrano do Maranhão', 10),
(1327, 'Sítio Novo', 10),
(1328, 'Sucupira do Norte', 10),
(1329, 'Sucupira do Riachão', 10),
(1330, 'Tasso Fragoso', 10),
(1331, 'Timbiras', 10),
(1332, 'Timon', 10),
(1333, 'Trizidela do Vale', 10),
(1334, 'Tufilândia', 10),
(1335, 'Tuntum', 10),
(1336, 'Turiaçu', 10),
(1337, 'Turilândia', 10),
(1338, 'Tutóia', 10),
(1339, 'Urbano Santos', 10),
(1340, 'Vargem Grande', 10),
(1341, 'Viana', 10),
(1342, 'Vila Nova dos Martírios', 10),
(1343, 'Vitória do Mearim', 10),
(1344, 'Vitorino Freire', 10),
(1345, 'Zé Doca', 10),
(1346, 'Acorizal', 13),
(1347, 'Água Boa', 13),
(1348, 'Alta Floresta', 13),
(1349, 'Alto Araguaia', 13),
(1350, 'Alto Boa Vista', 13),
(1351, 'Alto Garças', 13),
(1352, 'Alto Paraguai', 13),
(1353, 'Alto Taquari', 13),
(1354, 'Apiacás', 13),
(1355, 'Araguaiana', 13),
(1356, 'Araguainha', 13),
(1357, 'Araputanga', 13),
(1358, 'Arenápolis', 13),
(1359, 'Aripuanã', 13),
(1360, 'Barão de Melgaço', 13),
(1361, 'Barra do Bugres', 13),
(1362, 'Barra do Garças', 13),
(1363, 'Bom Jesus do Araguaia', 13),
(1364, 'Brasnorte', 13),
(1365, 'Cáceres', 13),
(1366, 'Campinápolis', 13),
(1367, 'Campo Novo do Parecis', 13),
(1368, 'Campo Verde', 13),
(1369, 'Campos de Júlio', 13),
(1370, 'Canabrava do Norte', 13),
(1371, 'Canarana', 13),
(1372, 'Carlinda', 13),
(1373, 'Castanheira', 13),
(1374, 'Chapada dos Guimarães', 13),
(1375, 'Cláudia', 13),
(1376, 'Cocalinho', 13),
(1377, 'Colíder', 13),
(1378, 'Colniza', 13),
(1379, 'Comodoro', 13),
(1380, 'Confresa', 13),
(1381, 'Conquista d`Oeste', 13),
(1382, 'Cotriguaçu', 13),
(1383, 'Cuiabá', 13),
(1384, 'Curvelândia', 13),
(1385, 'Curvelândia', 13),
(1386, 'Denise', 13),
(1387, 'Diamantino', 13),
(1388, 'Dom Aquino', 13),
(1389, 'Feliz Natal', 13),
(1390, 'Figueirópolis d`Oeste', 13),
(1391, 'Gaúcha do Norte', 13),
(1392, 'General Carneiro', 13),
(1393, 'Glória d`Oeste', 13),
(1394, 'Guarantã do Norte', 13),
(1395, 'Guiratinga', 13),
(1396, 'Indiavaí', 13),
(1397, 'Ipiranga do Norte', 13),
(1398, 'Itanhangá', 13),
(1399, 'Itaúba', 13),
(1400, 'Itiquira', 13),
(1401, 'Jaciara', 13),
(1402, 'Jangada', 13),
(1403, 'Jauru', 13),
(1404, 'Juara', 13),
(1405, 'Juína', 13),
(1406, 'Juruena', 13),
(1407, 'Juscimeira', 13),
(1408, 'Lambari d`Oeste', 13),
(1409, 'Lucas do Rio Verde', 13),
(1410, 'Luciára', 13),
(1411, 'Marcelândia', 13),
(1412, 'Matupá', 13),
(1413, 'Mirassol d`Oeste', 13),
(1414, 'Nobres', 13),
(1415, 'Nortelândia', 13),
(1416, 'Nossa Senhora do Livramento', 13),
(1417, 'Nova Bandeirantes', 13),
(1418, 'Nova Brasilândia', 13),
(1419, 'Nova Canaã do Norte', 13),
(1420, 'Nova Guarita', 13),
(1421, 'Nova Lacerda', 13),
(1422, 'Nova Marilândia', 13),
(1423, 'Nova Maringá', 13),
(1424, 'Nova Monte verde', 13),
(1425, 'Nova Mutum', 13),
(1426, 'Nova Olímpia', 13),
(1427, 'Nova Santa Helena', 13),
(1428, 'Nova Ubiratã', 13),
(1429, 'Nova Xavantina', 13),
(1430, 'Novo Horizonte do Norte', 13),
(1431, 'Novo Mundo', 13),
(1432, 'Novo Santo Antônio', 13),
(1433, 'Novo São Joaquim', 13),
(1434, 'Paranaíta', 13),
(1435, 'Paranatinga', 13),
(1436, 'Pedra Preta', 13),
(1437, 'Peixoto de Azevedo', 13),
(1438, 'Planalto da Serra', 13),
(1439, 'Poconé', 13),
(1440, 'Pontal do Araguaia', 13),
(1441, 'Ponte Branca', 13),
(1442, 'Pontes e Lacerda', 13),
(1443, 'Porto Alegre do Norte', 13),
(1444, 'Porto dos Gaúchos', 13),
(1445, 'Porto Esperidião', 13),
(1446, 'Porto Estrela', 13),
(1447, 'Poxoréo', 13),
(1448, 'Primavera do Leste', 13),
(1449, 'Querência', 13),
(1450, 'Reserva do Cabaçal', 13),
(1451, 'Ribeirão Cascalheira', 13),
(1452, 'Ribeirãozinho', 13),
(1453, 'Rio Branco', 13),
(1454, 'Rondolândia', 13),
(1455, 'Rondonópolis', 13),
(1456, 'Rosário Oeste', 13),
(1457, 'Salto do Céu', 13),
(1458, 'Santa Carmem', 13),
(1459, 'Santa Cruz do Xingu', 13),
(1460, 'Santa Rita do Trivelato', 13),
(1461, 'Santa Terezinha', 13),
(1462, 'Santo Afonso', 13),
(1463, 'Santo Antônio do Leste', 13),
(1464, 'Santo Antônio do Leverger', 13),
(1465, 'São Félix do Araguaia', 13),
(1466, 'São José do Povo', 13),
(1467, 'São José do Rio Claro', 13),
(1468, 'São José do Xingu', 13),
(1469, 'São José dos Quatro Marcos', 13),
(1470, 'São Pedro da Cipa', 13),
(1471, 'Sapezal', 13),
(1472, 'Serra Nova Dourada', 13),
(1473, 'Sinop', 13),
(1474, 'Sorriso', 13),
(1475, 'Tabaporã', 13),
(1476, 'Tangará da Serra', 13),
(1477, 'Tapurah', 13),
(1478, 'Terra Nova do Norte', 13),
(1479, 'Tesouro', 13),
(1480, 'Torixoréu', 13),
(1481, 'União do Sul', 13),
(1482, 'Vale de São Domingos', 13),
(1483, 'Várzea Grande', 13),
(1484, 'Vera', 13),
(1485, 'Vila Bela da Santíssima Trindade', 13),
(1486, 'Vila Rica', 13),
(1487, 'Água Clara', 12),
(1488, 'Alcinópolis', 12),
(1489, 'Amambaí', 12),
(1490, 'Anastácio', 12),
(1491, 'Anaurilândia', 12),
(1492, 'Angélica', 12),
(1493, 'Antônio João', 12),
(1494, 'Aparecida do Taboado', 12),
(1495, 'Aquidauana', 12),
(1496, 'Aral Moreira', 12),
(1497, 'Bandeirantes', 12),
(1498, 'Bataguassu', 12),
(1499, 'Bataiporã', 12),
(1500, 'Bela Vista', 12),
(1501, 'Bodoquena', 12),
(1502, 'Bonito', 12),
(1503, 'Brasilândia', 12),
(1504, 'Caarapó', 12),
(1505, 'Camapuã', 12),
(1506, 'Campo Grande', 12),
(1507, 'Caracol', 12),
(1508, 'Cassilândia', 12),
(1509, 'Chapadão do Sul', 12),
(1510, 'Corguinho', 12),
(1511, 'Coronel Sapucaia', 12),
(1512, 'Corumbá', 12),
(1513, 'Costa Rica', 12),
(1514, 'Coxim', 12),
(1515, 'Deodápolis', 12),
(1516, 'Dois Irmãos do Buriti', 12),
(1517, 'Douradina', 12),
(1518, 'Dourados', 12),
(1519, 'Eldorado', 12),
(1520, 'Fátima do Sul', 12),
(1521, 'Figueirão', 12),
(1522, 'Glória de Dourados', 12),
(1523, 'Guia Lopes da Laguna', 12),
(1524, 'Iguatemi', 12),
(1525, 'Inocência', 12),
(1526, 'Itaporã', 12),
(1527, 'Itaquiraí', 12),
(1528, 'Ivinhema', 12),
(1529, 'Japorã', 12),
(1530, 'Jaraguari', 12),
(1531, 'Jardim', 12),
(1532, 'Jateí', 12),
(1533, 'Juti', 12),
(1534, 'Ladário', 12),
(1535, 'Laguna Carapã', 12),
(1536, 'Maracaju', 12),
(1537, 'Miranda', 12),
(1538, 'Mundo Novo', 12),
(1539, 'Naviraí', 12),
(1540, 'Nioaque', 12),
(1541, 'Nova Alvorada do Sul', 12),
(1542, 'Nova Andradina', 12),
(1543, 'Novo Horizonte do Sul', 12),
(1544, 'Paranaíba', 12),
(1545, 'Paranhos', 12),
(1546, 'Pedro Gomes', 12),
(1547, 'Ponta Porã', 12),
(1548, 'Porto Murtinho', 12),
(1549, 'Ribas do Rio Pardo', 12),
(1550, 'Rio Brilhante', 12),
(1551, 'Rio Negro', 12),
(1552, 'Rio Verde de Mato Grosso', 12),
(1553, 'Rochedo', 12),
(1554, 'Santa Rita do Pardo', 12),
(1555, 'São Gabriel do Oeste', 12),
(1556, 'Selvíria', 12),
(1557, 'Sete Quedas', 12),
(1558, 'Sidrolândia', 12),
(1559, 'Sonora', 12),
(1560, 'Tacuru', 12),
(1561, 'Taquarussu', 12),
(1562, 'Terenos', 12),
(1563, 'Três Lagoas', 12),
(1564, 'Vicentina', 12),
(1565, 'Abadia dos Dourados', 11),
(1566, 'Abaeté', 11),
(1567, 'Abre Campo', 11),
(1568, 'Acaiaca', 11),
(1569, 'Açucena', 11),
(1570, 'Água Boa', 11),
(1571, 'Água Comprida', 11),
(1572, 'Aguanil', 11),
(1573, 'Águas Formosas', 11),
(1574, 'Águas Vermelhas', 11),
(1575, 'Aimorés', 11),
(1576, 'Aiuruoca', 11),
(1577, 'Alagoa', 11),
(1578, 'Albertina', 11),
(1579, 'Além Paraíba', 11),
(1580, 'Alfenas', 11),
(1581, 'Alfredo Vasconcelos', 11),
(1582, 'Almenara', 11),
(1583, 'Alpercata', 11),
(1584, 'Alpinópolis', 11),
(1585, 'Alterosa', 11),
(1586, 'Alto Caparaó', 11),
(1587, 'Alto Jequitibá', 11),
(1588, 'Alto Rio Doce', 11),
(1589, 'Alvarenga', 11),
(1590, 'Alvinópolis', 11),
(1591, 'Alvorada de Minas', 11),
(1592, 'Amparo do Serra', 11),
(1593, 'Andradas', 11),
(1594, 'Andrelândia', 11),
(1595, 'Angelândia', 11),
(1596, 'Antônio Carlos', 11),
(1597, 'Antônio Dias', 11),
(1598, 'Antônio Prado de Minas', 11),
(1599, 'Araçaí', 11),
(1600, 'Aracitaba', 11),
(1601, 'Araçuaí', 11),
(1602, 'Araguari', 11),
(1603, 'Arantina', 11),
(1604, 'Araponga', 11),
(1605, 'Araporã', 11),
(1606, 'Arapuá', 11),
(1607, 'Araújos', 11),
(1608, 'Araxá', 11),
(1609, 'Arceburgo', 11),
(1610, 'Arcos', 11),
(1611, 'Areado', 11),
(1612, 'Argirita', 11),
(1613, 'Aricanduva', 11),
(1614, 'Arinos', 11),
(1615, 'Astolfo Dutra', 11),
(1616, 'Ataléia', 11),
(1617, 'Augusto de Lima', 11),
(1618, 'Baependi', 11),
(1619, 'Baldim', 11),
(1620, 'Bambuí', 11),
(1621, 'Bandeira', 11),
(1622, 'Bandeira do Sul', 11),
(1623, 'Barão de Cocais', 11),
(1624, 'Barão de Monte Alto', 11),
(1625, 'Barbacena', 11),
(1626, 'Barra Longa', 11),
(1627, 'Barroso', 11),
(1628, 'Bela Vista de Minas', 11),
(1629, 'Belmiro Braga', 11),
(1630, 'Belo Horizonte', 11),
(1631, 'Belo Oriente', 11),
(1632, 'Belo Vale', 11),
(1633, 'Berilo', 11),
(1634, 'Berizal', 11),
(1635, 'Bertópolis', 11),
(1636, 'Betim', 11),
(1637, 'Bias Fortes', 11),
(1638, 'Bicas', 11),
(1639, 'Biquinhas', 11),
(1640, 'Boa Esperança', 11),
(1641, 'Bocaina de Minas', 11),
(1642, 'Bocaiúva', 11),
(1643, 'Bom Despacho', 11),
(1644, 'Bom Jardim de Minas', 11),
(1645, 'Bom Jesus da Penha', 11),
(1646, 'Bom Jesus do Amparo', 11),
(1647, 'Bom Jesus do Galho', 11),
(1648, 'Bom Repouso', 11),
(1649, 'Bom Sucesso', 11),
(1650, 'Bonfim', 11),
(1651, 'Bonfinópolis de Minas', 11),
(1652, 'Bonito de Minas', 11),
(1653, 'Borda da Mata', 11),
(1654, 'Botelhos', 11),
(1655, 'Botumirim', 11),
(1656, 'Brás Pires', 11),
(1657, 'Brasilândia de Minas', 11),
(1658, 'Brasília de Minas', 11),
(1659, 'Brasópolis', 11),
(1660, 'Braúnas', 11),
(1661, 'Brumadinho', 11),
(1662, 'Bueno Brandão', 11),
(1663, 'Buenópolis', 11),
(1664, 'Bugre', 11),
(1665, 'Buritis', 11),
(1666, 'Buritizeiro', 11),
(1667, 'Cabeceira Grande', 11),
(1668, 'Cabo Verde', 11),
(1669, 'Cachoeira da Prata', 11),
(1670, 'Cachoeira de Minas', 11),
(1671, 'Cachoeira de Pajeú', 11),
(1672, 'Cachoeira Dourada', 11),
(1673, 'Caetanópolis', 11),
(1674, 'Caeté', 11),
(1675, 'Caiana', 11),
(1676, 'Cajuri', 11),
(1677, 'Caldas', 11),
(1678, 'Camacho', 11),
(1679, 'Camanducaia', 11),
(1680, 'Cambuí', 11),
(1681, 'Cambuquira', 11),
(1682, 'Campanário', 11),
(1683, 'Campanha', 11),
(1684, 'Campestre', 11),
(1685, 'Campina Verde', 11),
(1686, 'Campo Azul', 11),
(1687, 'Campo Belo', 11),
(1688, 'Campo do Meio', 11),
(1689, 'Campo Florido', 11),
(1690, 'Campos Altos', 11),
(1691, 'Campos Gerais', 11),
(1692, 'Cana Verde', 11),
(1693, 'Canaã', 11),
(1694, 'Canápolis', 11),
(1695, 'Candeias', 11),
(1696, 'Cantagalo', 11),
(1697, 'Caparaó', 11),
(1698, 'Capela Nova', 11),
(1699, 'Capelinha', 11),
(1700, 'Capetinga', 11),
(1701, 'Capim Branco', 11),
(1702, 'Capinópolis', 11),
(1703, 'Capitão Andrade', 11),
(1704, 'Capitão Enéas', 11),
(1705, 'Capitólio', 11),
(1706, 'Caputira', 11),
(1707, 'Caraí', 11),
(1708, 'Caranaíba', 11),
(1709, 'Carandaí', 11),
(1710, 'Carangola', 11),
(1711, 'Caratinga', 11),
(1712, 'Carbonita', 11),
(1713, 'Careaçu', 11),
(1714, 'Carlos Chagas', 11),
(1715, 'Carmésia', 11),
(1716, 'Carmo da Cachoeira', 11),
(1717, 'Carmo da Mata', 11),
(1718, 'Carmo de Minas', 11),
(1719, 'Carmo do Cajuru', 11),
(1720, 'Carmo do Paranaíba', 11),
(1721, 'Carmo do Rio Claro', 11),
(1722, 'Carmópolis de Minas', 11),
(1723, 'Carneirinho', 11),
(1724, 'Carrancas', 11),
(1725, 'Carvalhópolis', 11),
(1726, 'Carvalhos', 11),
(1727, 'Casa Grande', 11),
(1728, 'Cascalho Rico', 11),
(1729, 'Cássia', 11),
(1730, 'Cataguases', 11),
(1731, 'Catas Altas', 11),
(1732, 'Catas Altas da Noruega', 11),
(1733, 'Catuji', 11),
(1734, 'Catuti', 11),
(1735, 'Caxambu', 11),
(1736, 'Cedro do Abaeté', 11),
(1737, 'Central de Minas', 11),
(1738, 'Centralina', 11),
(1739, 'Chácara', 11),
(1740, 'Chalé', 11),
(1741, 'Chapada do Norte', 11),
(1742, 'Chapada Gaúcha', 11),
(1743, 'Chiador', 11),
(1744, 'Cipotânea', 11),
(1745, 'Claraval', 11),
(1746, 'Claro dos Poções', 11),
(1747, 'Cláudio', 11),
(1748, 'Coimbra', 11),
(1749, 'Coluna', 11),
(1750, 'Comendador Gomes', 11),
(1751, 'Comercinho', 11),
(1752, 'Conceição da Aparecida', 11),
(1753, 'Conceição da Barra de Minas', 11),
(1754, 'Conceição das Alagoas', 11),
(1755, 'Conceição das Pedras', 11),
(1756, 'Conceição de Ipanema', 11),
(1757, 'Conceição do Mato Dentro', 11),
(1758, 'Conceição do Pará', 11),
(1759, 'Conceição do Rio Verde', 11),
(1760, 'Conceição dos Ouros', 11),
(1761, 'Cônego Marinho', 11),
(1762, 'Confins', 11),
(1763, 'Congonhal', 11),
(1764, 'Congonhas', 11),
(1765, 'Congonhas do Norte', 11),
(1766, 'Conquista', 11),
(1767, 'Conselheiro Lafaiete', 11),
(1768, 'Conselheiro Pena', 11),
(1769, 'Consolação', 11),
(1770, 'Contagem', 11),
(1771, 'Coqueiral', 11),
(1772, 'Coração de Jesus', 11),
(1773, 'Cordisburgo', 11),
(1774, 'Cordislândia', 11),
(1775, 'Corinto', 11),
(1776, 'Coroaci', 11),
(1777, 'Coromandel', 11),
(1778, 'Coronel Fabriciano', 11),
(1779, 'Coronel Murta', 11),
(1780, 'Coronel Pacheco', 11),
(1781, 'Coronel Xavier Chaves', 11),
(1782, 'Córrego Danta', 11),
(1783, 'Córrego do Bom Jesus', 11),
(1784, 'Córrego Fundo', 11),
(1785, 'Córrego Novo', 11),
(1786, 'Couto de Magalhães de Minas', 11),
(1787, 'Crisólita', 11),
(1788, 'Cristais', 11),
(1789, 'Cristália', 11),
(1790, 'Cristiano Otoni', 11),
(1791, 'Cristina', 11),
(1792, 'Crucilândia', 11),
(1793, 'Cruzeiro da Fortaleza', 11),
(1794, 'Cruzília', 11),
(1795, 'Cuparaque', 11),
(1796, 'Curral de Dentro', 11),
(1797, 'Curvelo', 11),
(1798, 'Datas', 11),
(1799, 'Delfim Moreira', 11),
(1800, 'Delfinópolis', 11),
(1801, 'Delta', 11),
(1802, 'Descoberto', 11),
(1803, 'Desterro de Entre Rios', 11),
(1804, 'Desterro do Melo', 11),
(1805, 'Diamantina', 11),
(1806, 'Diogo de Vasconcelos', 11),
(1807, 'Dionísio', 11),
(1808, 'Divinésia', 11),
(1809, 'Divino', 11),
(1810, 'Divino das Laranjeiras', 11),
(1811, 'Divinolândia de Minas', 11),
(1812, 'Divinópolis', 11),
(1813, 'Divisa Alegre', 11),
(1814, 'Divisa Nova', 11),
(1815, 'Divisópolis', 11),
(1816, 'Dom Bosco', 11),
(1817, 'Dom Cavati', 11),
(1818, 'Dom Joaquim', 11),
(1819, 'Dom Silvério', 11),
(1820, 'Dom Viçoso', 11),
(1821, 'Dona Eusébia', 11),
(1822, 'Dores de Campos', 11),
(1823, 'Dores de Guanhães', 11),
(1824, 'Dores do Indaiá', 11),
(1825, 'Dores do Turvo', 11),
(1826, 'Doresópolis', 11),
(1827, 'Douradoquara', 11),
(1828, 'Durandé', 11),
(1829, 'Elói Mendes', 11),
(1830, 'Engenheiro Caldas', 11),
(1831, 'Engenheiro Navarro', 11),
(1832, 'Entre Folhas', 11),
(1833, 'Entre Rios de Minas', 11),
(1834, 'Ervália', 11),
(1835, 'Esmeraldas', 11),
(1836, 'Espera Feliz', 11),
(1837, 'Espinosa', 11),
(1838, 'Espírito Santo do Dourado', 11),
(1839, 'Estiva', 11),
(1840, 'Estrela Dalva', 11),
(1841, 'Estrela do Indaiá', 11),
(1842, 'Estrela do Sul', 11),
(1843, 'Eugenópolis', 11),
(1844, 'Ewbank da Câmara', 11),
(1845, 'Extrema', 11),
(1846, 'Fama', 11),
(1847, 'Faria Lemos', 11),
(1848, 'Felício dos Santos', 11),
(1849, 'Felisburgo', 11),
(1850, 'Felixlândia', 11),
(1851, 'Fernandes Tourinho', 11),
(1852, 'Ferros', 11),
(1853, 'Fervedouro', 11),
(1854, 'Florestal', 11),
(1855, 'Formiga', 11),
(1856, 'Formoso', 11),
(1857, 'Fortaleza de Minas', 11),
(1858, 'Fortuna de Minas', 11),
(1859, 'Francisco Badaró', 11),
(1860, 'Francisco Dumont', 11),
(1861, 'Francisco Sá', 11),
(1862, 'Franciscópolis', 11),
(1863, 'Frei Gaspar', 11),
(1864, 'Frei Inocêncio', 11),
(1865, 'Frei Lagonegro', 11),
(1866, 'Fronteira', 11),
(1867, 'Fronteira dos Vales', 11),
(1868, 'Fruta de Leite', 11),
(1869, 'Frutal', 11),
(1870, 'Funilândia', 11),
(1871, 'Galiléia', 11),
(1872, 'Gameleiras', 11),
(1873, 'Glaucilândia', 11),
(1874, 'Goiabeira', 11),
(1875, 'Goianá', 11),
(1876, 'Gonçalves', 11),
(1877, 'Gonzaga', 11),
(1878, 'Gouveia', 11),
(1879, 'Governador Valadares', 11),
(1880, 'Grão Mogol', 11),
(1881, 'Grupiara', 11),
(1882, 'Guanhães', 11),
(1883, 'Guapé', 11),
(1884, 'Guaraciaba', 11),
(1885, 'Guaraciama', 11),
(1886, 'Guaranésia', 11),
(1887, 'Guarani', 11),
(1888, 'Guarará', 11),
(1889, 'Guarda-Mor', 11),
(1890, 'Guaxupé', 11),
(1891, 'Guidoval', 11),
(1892, 'Guimarânia', 11),
(1893, 'Guiricema', 11),
(1894, 'Gurinhatã', 11),
(1895, 'Heliodora', 11),
(1896, 'Iapu', 11),
(1897, 'Ibertioga', 11),
(1898, 'Ibiá', 11),
(1899, 'Ibiaí', 11),
(1900, 'Ibiracatu', 11),
(1901, 'Ibiraci', 11),
(1902, 'Ibirité', 11),
(1903, 'Ibitiúra de Minas', 11),
(1904, 'Ibituruna', 11),
(1905, 'Icaraí de Minas', 11),
(1906, 'Igarapé', 11),
(1907, 'Igaratinga', 11),
(1908, 'Iguatama', 11),
(1909, 'Ijaci', 11),
(1910, 'Ilicínea', 11),
(1911, 'Imbé de Minas', 11),
(1912, 'Inconfidentes', 11),
(1913, 'Indaiabira', 11),
(1914, 'Indianópolis', 11),
(1915, 'Ingaí', 11),
(1916, 'Inhapim', 11),
(1917, 'Inhaúma', 11),
(1918, 'Inimutaba', 11),
(1919, 'Ipaba', 11),
(1920, 'Ipanema', 11),
(1921, 'Ipatinga', 11),
(1922, 'Ipiaçu', 11),
(1923, 'Ipuiúna', 11),
(1924, 'Iraí de Minas', 11),
(1925, 'Itabira', 11),
(1926, 'Itabirinha de Mantena', 11),
(1927, 'Itabirito', 11),
(1928, 'Itacambira', 11),
(1929, 'Itacarambi', 11),
(1930, 'Itaguara', 11),
(1931, 'Itaipé', 11),
(1932, 'Itajubá', 11),
(1933, 'Itamarandiba', 11),
(1934, 'Itamarati de Minas', 11),
(1935, 'Itambacuri', 11),
(1936, 'Itambé do Mato Dentro', 11),
(1937, 'Itamogi', 11),
(1938, 'Itamonte', 11),
(1939, 'Itanhandu', 11),
(1940, 'Itanhomi', 11),
(1941, 'Itaobim', 11),
(1942, 'Itapagipe', 11),
(1943, 'Itapecerica', 11),
(1944, 'Itapeva', 11),
(1945, 'Itatiaiuçu', 11),
(1946, 'Itaú de Minas', 11),
(1947, 'Itaúna', 11),
(1948, 'Itaverava', 11),
(1949, 'Itinga', 11),
(1950, 'Itueta', 11),
(1951, 'Ituiutaba', 11),
(1952, 'Itumirim', 11),
(1953, 'Iturama', 11),
(1954, 'Itutinga', 11),
(1955, 'Jaboticatubas', 11),
(1956, 'Jacinto', 11),
(1957, 'Jacuí', 11),
(1958, 'Jacutinga', 11),
(1959, 'Jaguaraçu', 11),
(1960, 'Jaíba', 11),
(1961, 'Jampruca', 11),
(1962, 'Janaúba', 11),
(1963, 'Januária', 11),
(1964, 'Japaraíba', 11),
(1965, 'Japonvar', 11),
(1966, 'Jeceaba', 11),
(1967, 'Jenipapo de Minas', 11),
(1968, 'Jequeri', 11),
(1969, 'Jequitaí', 11),
(1970, 'Jequitibá', 11),
(1971, 'Jequitinhonha', 11),
(1972, 'Jesuânia', 11),
(1973, 'Joaíma', 11),
(1974, 'Joanésia', 11),
(1975, 'João Monlevade', 11),
(1976, 'João Pinheiro', 11),
(1977, 'Joaquim Felício', 11),
(1978, 'Jordânia', 11),
(1979, 'José Gonçalves de Minas', 11),
(1980, 'José Raydan', 11),
(1981, 'Josenópolis', 11),
(1982, 'Juatuba', 11),
(1983, 'Juiz de Fora', 11),
(1984, 'Juramento', 11),
(1985, 'Juruaia', 11),
(1986, 'Juvenília', 11),
(1987, 'Ladainha', 11),
(1988, 'Lagamar', 11),
(1989, 'Lagoa da Prata', 11),
(1990, 'Lagoa dos Patos', 11),
(1991, 'Lagoa Dourada', 11),
(1992, 'Lagoa Formosa', 11),
(1993, 'Lagoa Grande', 11),
(1994, 'Lagoa Santa', 11),
(1995, 'Lajinha', 11),
(1996, 'Lambari', 11),
(1997, 'Lamim', 11),
(1998, 'Laranjal', 11),
(1999, 'Lassance', 11),
(2000, 'Lavras', 11),
(2001, 'Leandro Ferreira', 11),
(2002, 'Leme do Prado', 11),
(2003, 'Leopoldina', 11),
(2004, 'Liberdade', 11),
(2005, 'Lima Duarte', 11),
(2006, 'Limeira do Oeste', 11),
(2007, 'Lontra', 11),
(2008, 'Luisburgo', 11),
(2009, 'Luislândia', 11),
(2010, 'Luminárias', 11),
(2011, 'Luz', 11),
(2012, 'Machacalis', 11),
(2013, 'Machado', 11),
(2014, 'Madre de Deus de Minas', 11),
(2015, 'Malacacheta', 11),
(2016, 'Mamonas', 11),
(2017, 'Manga', 11),
(2018, 'Manhuaçu', 11),
(2019, 'Manhumirim', 11),
(2020, 'Mantena', 11),
(2021, 'Mar de Espanha', 11),
(2022, 'Maravilhas', 11),
(2023, 'Maria da Fé', 11),
(2024, 'Mariana', 11),
(2025, 'Marilac', 11),
(2026, 'Mário Campos', 11),
(2027, 'Maripá de Minas', 11),
(2028, 'Marliéria', 11),
(2029, 'Marmelópolis', 11),
(2030, 'Martinho Campos', 11),
(2031, 'Martins Soares', 11),
(2032, 'Mata Verde', 11),
(2033, 'Materlândia', 11),
(2034, 'Mateus Leme', 11),
(2035, 'Mathias Lobato', 11),
(2036, 'Matias Barbosa', 11),
(2037, 'Matias Cardoso', 11),
(2038, 'Matipó', 11),
(2039, 'Mato Verde', 11),
(2040, 'Matozinhos', 11),
(2041, 'Matutina', 11),
(2042, 'Medeiros', 11),
(2043, 'Medina', 11),
(2044, 'Mendes Pimentel', 11),
(2045, 'Mercês', 11),
(2046, 'Mesquita', 11),
(2047, 'Minas Novas', 11),
(2048, 'Minduri', 11),
(2049, 'Mirabela', 11),
(2050, 'Miradouro', 11),
(2051, 'Miraí', 11),
(2052, 'Miravânia', 11),
(2053, 'Moeda', 11),
(2054, 'Moema', 11),
(2055, 'Monjolos', 11),
(2056, 'Monsenhor Paulo', 11),
(2057, 'Montalvânia', 11),
(2058, 'Monte Alegre de Minas', 11),
(2059, 'Monte Azul', 11),
(2060, 'Monte Belo', 11),
(2061, 'Monte Carmelo', 11),
(2062, 'Monte Formoso', 11),
(2063, 'Monte Santo de Minas', 11),
(2064, 'Monte Sião', 11),
(2065, 'Montes Claros', 11),
(2066, 'Montezuma', 11),
(2067, 'Morada Nova de Minas', 11);
INSERT INTO `cidade` (`cid_id`, `cid_nome`, `est_id`) VALUES
(2068, 'Morro da Garça', 11),
(2069, 'Morro do Pilar', 11),
(2070, 'Munhoz', 11),
(2071, 'Muriaé', 11),
(2072, 'Mutum', 11),
(2073, 'Muzambinho', 11),
(2074, 'Nacip Raydan', 11),
(2075, 'Nanuque', 11),
(2076, 'Naque', 11),
(2077, 'Natalândia', 11),
(2078, 'Natércia', 11),
(2079, 'Nazareno', 11),
(2080, 'Nepomuceno', 11),
(2081, 'Ninheira', 11),
(2082, 'Nova Belém', 11),
(2083, 'Nova Era', 11),
(2084, 'Nova Lima', 11),
(2085, 'Nova Módica', 11),
(2086, 'Nova Ponte', 11),
(2087, 'Nova Porteirinha', 11),
(2088, 'Nova Resende', 11),
(2089, 'Nova Serrana', 11),
(2090, 'Nova União', 11),
(2091, 'Novo Cruzeiro', 11),
(2092, 'Novo Oriente de Minas', 11),
(2093, 'Novorizonte', 11),
(2094, 'Olaria', 11),
(2095, 'Olhos-d`Água', 11),
(2096, 'Olímpio Noronha', 11),
(2097, 'Oliveira', 11),
(2098, 'Oliveira Fortes', 11),
(2099, 'Onça de Pitangui', 11),
(2100, 'Oratórios', 11),
(2101, 'Orizânia', 11),
(2102, 'Ouro Branco', 11),
(2103, 'Ouro Fino', 11),
(2104, 'Ouro Preto', 11),
(2105, 'Ouro Verde de Minas', 11),
(2106, 'Padre Carvalho', 11),
(2107, 'Padre Paraíso', 11),
(2108, 'Pai Pedro', 11),
(2109, 'Paineiras', 11),
(2110, 'Pains', 11),
(2111, 'Paiva', 11),
(2112, 'Palma', 11),
(2113, 'Palmópolis', 11),
(2114, 'Papagaios', 11),
(2115, 'Pará de Minas', 11),
(2116, 'Paracatu', 11),
(2117, 'Paraguaçu', 11),
(2118, 'Paraisópolis', 11),
(2119, 'Paraopeba', 11),
(2120, 'Passa Quatro', 11),
(2121, 'Passa Tempo', 11),
(2122, 'Passabém', 11),
(2123, 'Passa-Vinte', 11),
(2124, 'Passos', 11),
(2125, 'Patis', 11),
(2126, 'Patos de Minas', 11),
(2127, 'Patrocínio', 11),
(2128, 'Patrocínio do Muriaé', 11),
(2129, 'Paula Cândido', 11),
(2130, 'Paulistas', 11),
(2131, 'Pavão', 11),
(2132, 'Peçanha', 11),
(2133, 'Pedra Azul', 11),
(2134, 'Pedra Bonita', 11),
(2135, 'Pedra do Anta', 11),
(2136, 'Pedra do Indaiá', 11),
(2137, 'Pedra Dourada', 11),
(2138, 'Pedralva', 11),
(2139, 'Pedras de Maria da Cruz', 11),
(2140, 'Pedrinópolis', 11),
(2141, 'Pedro Leopoldo', 11),
(2142, 'Pedro Teixeira', 11),
(2143, 'Pequeri', 11),
(2144, 'Pequi', 11),
(2145, 'Perdigão', 11),
(2146, 'Perdizes', 11),
(2147, 'Perdões', 11),
(2148, 'Periquito', 11),
(2149, 'Pescador', 11),
(2150, 'Piau', 11),
(2151, 'Piedade de Caratinga', 11),
(2152, 'Piedade de Ponte Nova', 11),
(2153, 'Piedade do Rio Grande', 11),
(2154, 'Piedade dos Gerais', 11),
(2155, 'Pimenta', 11),
(2156, 'Pingo-d`Água', 11),
(2157, 'Pintópolis', 11),
(2158, 'Piracema', 11),
(2159, 'Pirajuba', 11),
(2160, 'Piranga', 11),
(2161, 'Piranguçu', 11),
(2162, 'Piranguinho', 11),
(2163, 'Pirapetinga', 11),
(2164, 'Pirapora', 11),
(2165, 'Piraúba', 11),
(2166, 'Pitangui', 11),
(2167, 'Piumhi', 11),
(2168, 'Planura', 11),
(2169, 'Poço Fundo', 11),
(2170, 'Poços de Caldas', 11),
(2171, 'Pocrane', 11),
(2172, 'Pompéu', 11),
(2173, 'Ponte Nova', 11),
(2174, 'Ponto Chique', 11),
(2175, 'Ponto dos Volantes', 11),
(2176, 'Porteirinha', 11),
(2177, 'Porto Firme', 11),
(2178, 'Poté', 11),
(2179, 'Pouso Alegre', 11),
(2180, 'Pouso Alto', 11),
(2181, 'Prados', 11),
(2182, 'Prata', 11),
(2183, 'Pratápolis', 11),
(2184, 'Pratinha', 11),
(2185, 'Presidente Bernardes', 11),
(2186, 'Presidente Juscelino', 11),
(2187, 'Presidente Kubitschek', 11),
(2188, 'Presidente Olegário', 11),
(2189, 'Prudente de Morais', 11),
(2190, 'Quartel Geral', 11),
(2191, 'Queluzito', 11),
(2192, 'Raposos', 11),
(2193, 'Raul Soares', 11),
(2194, 'Recreio', 11),
(2195, 'Reduto', 11),
(2196, 'Resende Costa', 11),
(2197, 'Resplendor', 11),
(2198, 'Ressaquinha', 11),
(2199, 'Riachinho', 11),
(2200, 'Riacho dos Machados', 11),
(2201, 'Ribeirão das Neves', 11),
(2202, 'Ribeirão Vermelho', 11),
(2203, 'Rio Acima', 11),
(2204, 'Rio Casca', 11),
(2205, 'Rio do Prado', 11),
(2206, 'Rio Doce', 11),
(2207, 'Rio Espera', 11),
(2208, 'Rio Manso', 11),
(2209, 'Rio Novo', 11),
(2210, 'Rio Paranaíba', 11),
(2211, 'Rio Pardo de Minas', 11),
(2212, 'Rio Piracicaba', 11),
(2213, 'Rio Pomba', 11),
(2214, 'Rio Preto', 11),
(2215, 'Rio Vermelho', 11),
(2216, 'Ritápolis', 11),
(2217, 'Rochedo de Minas', 11),
(2218, 'Rodeiro', 11),
(2219, 'Romaria', 11),
(2220, 'Rosário da Limeira', 11),
(2221, 'Rubelita', 11),
(2222, 'Rubim', 11),
(2223, 'Sabará', 11),
(2224, 'Sabinópolis', 11),
(2225, 'Sacramento', 11),
(2226, 'Salinas', 11),
(2227, 'Salto da Divisa', 11),
(2228, 'Santa Bárbara', 11),
(2229, 'Santa Bárbara do Leste', 11),
(2230, 'Santa Bárbara do Monte Verde', 11),
(2231, 'Santa Bárbara do Tugúrio', 11),
(2232, 'Santa Cruz de Minas', 11),
(2233, 'Santa Cruz de Salinas', 11),
(2234, 'Santa Cruz do Escalvado', 11),
(2235, 'Santa Efigênia de Minas', 11),
(2236, 'Santa Fé de Minas', 11),
(2237, 'Santa Helena de Minas', 11),
(2238, 'Santa Juliana', 11),
(2239, 'Santa Luzia', 11),
(2240, 'Santa Margarida', 11),
(2241, 'Santa Maria de Itabira', 11),
(2242, 'Santa Maria do Salto', 11),
(2243, 'Santa Maria do Suaçuí', 11),
(2244, 'Santa Rita de Caldas', 11),
(2245, 'Santa Rita de Ibitipoca', 11),
(2246, 'Santa Rita de Jacutinga', 11),
(2247, 'Santa Rita de Minas', 11),
(2248, 'Santa Rita do Itueto', 11),
(2249, 'Santa Rita do Sapucaí', 11),
(2250, 'Santa Rosa da Serra', 11),
(2251, 'Santa Vitória', 11),
(2252, 'Santana da Vargem', 11),
(2253, 'Santana de Cataguases', 11),
(2254, 'Santana de Pirapama', 11),
(2255, 'Santana do Deserto', 11),
(2256, 'Santana do Garambéu', 11),
(2257, 'Santana do Jacaré', 11),
(2258, 'Santana do Manhuaçu', 11),
(2259, 'Santana do Paraíso', 11),
(2260, 'Santana do Riacho', 11),
(2261, 'Santana dos Montes', 11),
(2262, 'Santo Antônio do Amparo', 11),
(2263, 'Santo Antônio do Aventureiro', 11),
(2264, 'Santo Antônio do Grama', 11),
(2265, 'Santo Antônio do Itambé', 11),
(2266, 'Santo Antônio do Jacinto', 11),
(2267, 'Santo Antônio do Monte', 11),
(2268, 'Santo Antônio do Retiro', 11),
(2269, 'Santo Antônio do Rio Abaixo', 11),
(2270, 'Santo Hipólito', 11),
(2271, 'Santos Dumont', 11),
(2272, 'São Bento Abade', 11),
(2273, 'São Brás do Suaçuí', 11),
(2274, 'São Domingos das Dores', 11),
(2275, 'São Domingos do Prata', 11),
(2276, 'São Félix de Minas', 11),
(2277, 'São Francisco', 11),
(2278, 'São Francisco de Paula', 11),
(2279, 'São Francisco de Sales', 11),
(2280, 'São Francisco do Glória', 11),
(2281, 'São Geraldo', 11),
(2282, 'São Geraldo da Piedade', 11),
(2283, 'São Geraldo do Baixio', 11),
(2284, 'São Gonçalo do Abaeté', 11),
(2285, 'São Gonçalo do Pará', 11),
(2286, 'São Gonçalo do Rio Abaixo', 11),
(2287, 'São Gonçalo do Rio Preto', 11),
(2288, 'São Gonçalo do Sapucaí', 11),
(2289, 'São Gotardo', 11),
(2290, 'São João Batista do Glória', 11),
(2291, 'São João da Lagoa', 11),
(2292, 'São João da Mata', 11),
(2293, 'São João da Ponte', 11),
(2294, 'São João das Missões', 11),
(2295, 'São João del Rei', 11),
(2296, 'São João do Manhuaçu', 11),
(2297, 'São João do Manteninha', 11),
(2298, 'São João do Oriente', 11),
(2299, 'São João do Pacuí', 11),
(2300, 'São João do Paraíso', 11),
(2301, 'São João Evangelista', 11),
(2302, 'São João Nepomuceno', 11),
(2303, 'São Joaquim de Bicas', 11),
(2304, 'São José da Barra', 11),
(2305, 'São José da Lapa', 11),
(2306, 'São José da Safira', 11),
(2307, 'São José da Varginha', 11),
(2308, 'São José do Alegre', 11),
(2309, 'São José do Divino', 11),
(2310, 'São José do Goiabal', 11),
(2311, 'São José do Jacuri', 11),
(2312, 'São José do Mantimento', 11),
(2313, 'São Lourenço', 11),
(2314, 'São Miguel do Anta', 11),
(2315, 'São Pedro da União', 11),
(2316, 'São Pedro do Suaçuí', 11),
(2317, 'São Pedro dos Ferros', 11),
(2318, 'São Romão', 11),
(2319, 'São Roque de Minas', 11),
(2320, 'São Sebastião da Bela Vista', 11),
(2321, 'São Sebastião da Vargem Alegre', 11),
(2322, 'São Sebastião do Anta', 11),
(2323, 'São Sebastião do Maranhão', 11),
(2324, 'São Sebastião do Oeste', 11),
(2325, 'São Sebastião do Paraíso', 11),
(2326, 'São Sebastião do Rio Preto', 11),
(2327, 'São Sebastião do Rio Verde', 11),
(2328, 'São Thomé das Letras', 11),
(2329, 'São Tiago', 11),
(2330, 'São Tomás de Aquino', 11),
(2331, 'São Vicente de Minas', 11),
(2332, 'Sapucaí-Mirim', 11),
(2333, 'Sardoá', 11),
(2334, 'Sarzedo', 11),
(2335, 'Sem-Peixe', 11),
(2336, 'Senador Amaral', 11),
(2337, 'Senador Cortes', 11),
(2338, 'Senador Firmino', 11),
(2339, 'Senador José Bento', 11),
(2340, 'Senador Modestino Gonçalves', 11),
(2341, 'Senhora de Oliveira', 11),
(2342, 'Senhora do Porto', 11),
(2343, 'Senhora dos Remédios', 11),
(2344, 'Sericita', 11),
(2345, 'Seritinga', 11),
(2346, 'Serra Azul de Minas', 11),
(2347, 'Serra da Saudade', 11),
(2348, 'Serra do Salitre', 11),
(2349, 'Serra dos Aimorés', 11),
(2350, 'Serrania', 11),
(2351, 'Serranópolis de Minas', 11),
(2352, 'Serranos', 11),
(2353, 'Serro', 11),
(2354, 'Sete Lagoas', 11),
(2355, 'Setubinha', 11),
(2356, 'Silveirânia', 11),
(2357, 'Silvianópolis', 11),
(2358, 'Simão Pereira', 11),
(2359, 'Simonésia', 11),
(2360, 'Sobrália', 11),
(2361, 'Soledade de Minas', 11),
(2362, 'Tabuleiro', 11),
(2363, 'Taiobeiras', 11),
(2364, 'Taparuba', 11),
(2365, 'Tapira', 11),
(2366, 'Tapiraí', 11),
(2367, 'Taquaraçu de Minas', 11),
(2368, 'Tarumirim', 11),
(2369, 'Teixeiras', 11),
(2370, 'Teófilo Otoni', 11),
(2371, 'Timóteo', 11),
(2372, 'Tiradentes', 11),
(2373, 'Tiros', 11),
(2374, 'Tocantins', 11),
(2375, 'Tocos do Moji', 11),
(2376, 'Toledo', 11),
(2377, 'Tombos', 11),
(2378, 'Três Corações', 11),
(2379, 'Três Marias', 11),
(2380, 'Três Pontas', 11),
(2381, 'Tumiritinga', 11),
(2382, 'Tupaciguara', 11),
(2383, 'Turmalina', 11),
(2384, 'Turvolândia', 11),
(2385, 'Ubá', 11),
(2386, 'Ubaí', 11),
(2387, 'Ubaporanga', 11),
(2388, 'Uberaba', 11),
(2389, 'Uberlândia', 11),
(2390, 'Umburatiba', 11),
(2391, 'Unaí', 11),
(2392, 'União de Minas', 11),
(2393, 'Uruana de Minas', 11),
(2394, 'Urucânia', 11),
(2395, 'Urucuia', 11),
(2396, 'Vargem Alegre', 11),
(2397, 'Vargem Bonita', 11),
(2398, 'Vargem Grande do Rio Pardo', 11),
(2399, 'Varginha', 11),
(2400, 'Varjão de Minas', 11),
(2401, 'Várzea da Palma', 11),
(2402, 'Varzelândia', 11),
(2403, 'Vazante', 11),
(2404, 'Verdelândia', 11),
(2405, 'Veredinha', 11),
(2406, 'Veríssimo', 11),
(2407, 'Vermelho Novo', 11),
(2408, 'Vespasiano', 11),
(2409, 'Viçosa', 11),
(2410, 'Vieiras', 11),
(2411, 'Virgem da Lapa', 11),
(2412, 'Virgínia', 11),
(2413, 'Virginópolis', 11),
(2414, 'Virgolândia', 11),
(2415, 'Visconde do Rio Branco', 11),
(2416, 'Volta Grande', 11),
(2417, 'Wenceslau Braz', 11),
(2418, 'Abaetetuba', 14),
(2419, 'Abel Figueiredo', 14),
(2420, 'Acará', 14),
(2421, 'Afuá', 14),
(2422, 'Água Azul do Norte', 14),
(2423, 'Alenquer', 14),
(2424, 'Almeirim', 14),
(2425, 'Altamira', 14),
(2426, 'Anajás', 14),
(2427, 'Ananindeua', 14),
(2428, 'Anapu', 14),
(2429, 'Augusto Corrêa', 14),
(2430, 'Aurora do Pará', 14),
(2431, 'Aveiro', 14),
(2432, 'Bagre', 14),
(2433, 'Baião', 14),
(2434, 'Bannach', 14),
(2435, 'Barcarena', 14),
(2436, 'Belém', 14),
(2437, 'Belterra', 14),
(2438, 'Benevides', 14),
(2439, 'Bom Jesus do Tocantins', 14),
(2440, 'Bonito', 14),
(2441, 'Bragança', 14),
(2442, 'Brasil Novo', 14),
(2443, 'Brejo Grande do Araguaia', 14),
(2444, 'Breu Branco', 14),
(2445, 'Breves', 14),
(2446, 'Bujaru', 14),
(2447, 'Cachoeira do Arari', 14),
(2448, 'Cachoeira do Piriá', 14),
(2449, 'Cametá', 14),
(2450, 'Canaã dos Carajás', 14),
(2451, 'Capanema', 14),
(2452, 'Capitão Poço', 14),
(2453, 'Castanhal', 14),
(2454, 'Chaves', 14),
(2455, 'Colares', 14),
(2456, 'Conceição do Araguaia', 14),
(2457, 'Concórdia do Pará', 14),
(2458, 'Cumaru do Norte', 14),
(2459, 'Curionópolis', 14),
(2460, 'Curralinho', 14),
(2461, 'Curuá', 14),
(2462, 'Curuçá', 14),
(2463, 'Dom Eliseu', 14),
(2464, 'Eldorado dos Carajás', 14),
(2465, 'Faro', 14),
(2466, 'Floresta do Araguaia', 14),
(2467, 'Garrafão do Norte', 14),
(2468, 'Goianésia do Pará', 14),
(2469, 'Gurupá', 14),
(2470, 'Igarapé-Açu', 14),
(2471, 'Igarapé-Miri', 14),
(2472, 'Inhangapi', 14),
(2473, 'Ipixuna do Pará', 14),
(2474, 'Irituia', 14),
(2475, 'Itaituba', 14),
(2476, 'Itupiranga', 14),
(2477, 'Jacareacanga', 14),
(2478, 'Jacundá', 14),
(2479, 'Juruti', 14),
(2480, 'Limoeiro do Ajuru', 14),
(2481, 'Mãe do Rio', 14),
(2482, 'Magalhães Barata', 14),
(2483, 'Marabá', 14),
(2484, 'Maracanã', 14),
(2485, 'Marapanim', 14),
(2486, 'Marituba', 14),
(2487, 'Medicilândia', 14),
(2488, 'Melgaço', 14),
(2489, 'Mocajuba', 14),
(2490, 'Moju', 14),
(2491, 'Monte Alegre', 14),
(2492, 'Muaná', 14),
(2493, 'Nova Esperança do Piriá', 14),
(2494, 'Nova Ipixuna', 14),
(2495, 'Nova Timboteua', 14),
(2496, 'Novo Progresso', 14),
(2497, 'Novo Repartimento', 14),
(2498, 'Óbidos', 14),
(2499, 'Oeiras do Pará', 14),
(2500, 'Oriximiná', 14),
(2501, 'Ourém', 14),
(2502, 'Ourilândia do Norte', 14),
(2503, 'Pacajá', 14),
(2504, 'Palestina do Pará', 14),
(2505, 'Paragominas', 14),
(2506, 'Parauapebas', 14),
(2507, 'Pau d`Arco', 14),
(2508, 'Peixe-Boi', 14),
(2509, 'Piçarra', 14),
(2510, 'Placas', 14),
(2511, 'Ponta de Pedras', 14),
(2512, 'Portel', 14),
(2513, 'Porto de Moz', 14),
(2514, 'Prainha', 14),
(2515, 'Primavera', 14),
(2516, 'Quatipuru', 14),
(2517, 'Redenção', 14),
(2518, 'Rio Maria', 14),
(2519, 'Rondon do Pará', 14),
(2520, 'Rurópolis', 14),
(2521, 'Salinópolis', 14),
(2522, 'Salvaterra', 14),
(2523, 'Santa Bárbara do Pará', 14),
(2524, 'Santa Cruz do Arari', 14),
(2525, 'Santa Isabel do Pará', 14),
(2526, 'Santa Luzia do Pará', 14),
(2527, 'Santa Maria das Barreiras', 14),
(2528, 'Santa Maria do Pará', 14),
(2529, 'Santana do Araguaia', 14),
(2530, 'Santarém', 14),
(2531, 'Santarém Novo', 14),
(2532, 'Santo Antônio do Tauá', 14),
(2533, 'São Caetano de Odivelas', 14),
(2534, 'São Domingos do Araguaia', 14),
(2535, 'São Domingos do Capim', 14),
(2536, 'São Félix do Xingu', 14),
(2537, 'São Francisco do Pará', 14),
(2538, 'São Geraldo do Araguaia', 14),
(2539, 'São João da Ponta', 14),
(2540, 'São João de Pirabas', 14),
(2541, 'São João do Araguaia', 14),
(2542, 'São Miguel do Guamá', 14),
(2543, 'São Sebastião da Boa Vista', 14),
(2544, 'Sapucaia', 14),
(2545, 'Senador José Porfírio', 14),
(2546, 'Soure', 14),
(2547, 'Tailândia', 14),
(2548, 'Terra Alta', 14),
(2549, 'Terra Santa', 14),
(2550, 'Tomé-Açu', 14),
(2551, 'Tracuateua', 14),
(2552, 'Trairão', 14),
(2553, 'Tucumã', 14),
(2554, 'Tucuruí', 14),
(2555, 'Ulianópolis', 14),
(2556, 'Uruará', 14),
(2557, 'Vigia', 14),
(2558, 'Viseu', 14),
(2559, 'Vitória do Xingu', 14),
(2560, 'Xinguara', 14),
(2561, 'Água Branca', 15),
(2562, 'Aguiar', 15),
(2563, 'Alagoa Grande', 15),
(2564, 'Alagoa Nova', 15),
(2565, 'Alagoinha', 15),
(2566, 'Alcantil', 15),
(2567, 'Algodão de Jandaíra', 15),
(2568, 'Alhandra', 15),
(2569, 'Amparo', 15),
(2570, 'Aparecida', 15),
(2571, 'Araçagi', 15),
(2572, 'Arara', 15),
(2573, 'Araruna', 15),
(2574, 'Areia', 15),
(2575, 'Areia de Baraúnas', 15),
(2576, 'Areial', 15),
(2577, 'Aroeiras', 15),
(2578, 'Assunção', 15),
(2579, 'Baía da Traição', 15),
(2580, 'Bananeiras', 15),
(2581, 'Baraúna', 15),
(2582, 'Barra de Santa Rosa', 15),
(2583, 'Barra de Santana', 15),
(2584, 'Barra de São Miguel', 15),
(2585, 'Bayeux', 15),
(2586, 'Belém', 15),
(2587, 'Belém do Brejo do Cruz', 15),
(2588, 'Bernardino Batista', 15),
(2589, 'Boa Ventura', 15),
(2590, 'Boa Vista', 15),
(2591, 'Bom Jesus', 15),
(2592, 'Bom Sucesso', 15),
(2593, 'Bonito de Santa Fé', 15),
(2594, 'Boqueirão', 15),
(2595, 'Borborema', 15),
(2596, 'Brejo do Cruz', 15),
(2597, 'Brejo dos Santos', 15),
(2598, 'Caaporã', 15),
(2599, 'Cabaceiras', 15),
(2600, 'Cabedelo', 15),
(2601, 'Cachoeira dos Índios', 15),
(2602, 'Cacimba de Areia', 15),
(2603, 'Cacimba de Dentro', 15),
(2604, 'Cacimbas', 15),
(2605, 'Caiçara', 15),
(2606, 'Cajazeiras', 15),
(2607, 'Cajazeirinhas', 15),
(2608, 'Caldas Brandão', 15),
(2609, 'Camalaú', 15),
(2610, 'Campina Grande', 15),
(2611, 'Campo de Santana', 15),
(2612, 'Capim', 15),
(2613, 'Caraúbas', 15),
(2614, 'Carrapateira', 15),
(2615, 'Casserengue', 15),
(2616, 'Catingueira', 15),
(2617, 'Catolé do Rocha', 15),
(2618, 'Caturité', 15),
(2619, 'Conceição', 15),
(2620, 'Condado', 15),
(2621, 'Conde', 15),
(2622, 'Congo', 15),
(2623, 'Coremas', 15),
(2624, 'Coxixola', 15),
(2625, 'Cruz do Espírito Santo', 15),
(2626, 'Cubati', 15),
(2627, 'Cuité', 15),
(2628, 'Cuité de Mamanguape', 15),
(2629, 'Cuitegi', 15),
(2630, 'Curral de Cima', 15),
(2631, 'Curral Velho', 15),
(2632, 'Damião', 15),
(2633, 'Desterro', 15),
(2634, 'Diamante', 15),
(2635, 'Dona Inês', 15),
(2636, 'Duas Estradas', 15),
(2637, 'Emas', 15),
(2638, 'Esperança', 15),
(2639, 'Fagundes', 15),
(2640, 'Frei Martinho', 15),
(2641, 'Gado Bravo', 15),
(2642, 'Guarabira', 15),
(2643, 'Gurinhém', 15),
(2644, 'Gurjão', 15),
(2645, 'Ibiara', 15),
(2646, 'Igaracy', 15),
(2647, 'Imaculada', 15),
(2648, 'Ingá', 15),
(2649, 'Itabaiana', 15),
(2650, 'Itaporanga', 15),
(2651, 'Itapororoca', 15),
(2652, 'Itatuba', 15),
(2653, 'Jacaraú', 15),
(2654, 'Jericó', 15),
(2655, 'João Pessoa', 15),
(2656, 'Juarez Távora', 15),
(2657, 'Juazeirinho', 15),
(2658, 'Junco do Seridó', 15),
(2659, 'Juripiranga', 15),
(2660, 'Juru', 15),
(2661, 'Lagoa', 15),
(2662, 'Lagoa de Dentro', 15),
(2663, 'Lagoa Seca', 15),
(2664, 'Lastro', 15),
(2665, 'Livramento', 15),
(2666, 'Logradouro', 15),
(2667, 'Lucena', 15),
(2668, 'Mãe d`Água', 15),
(2669, 'Malta', 15),
(2670, 'Mamanguape', 15),
(2671, 'Manaíra', 15),
(2672, 'Marcação', 15),
(2673, 'Mari', 15),
(2674, 'Marizópolis', 15),
(2675, 'Massaranduba', 15),
(2676, 'Mataraca', 15),
(2677, 'Matinhas', 15),
(2678, 'Mato Grosso', 15),
(2679, 'Maturéia', 15),
(2680, 'Mogeiro', 15),
(2681, 'Montadas', 15),
(2682, 'Monte Horebe', 15),
(2683, 'Monteiro', 15),
(2684, 'Mulungu', 15),
(2685, 'Natuba', 15),
(2686, 'Nazarezinho', 15),
(2687, 'Nova Floresta', 15),
(2688, 'Nova Olinda', 15),
(2689, 'Nova Palmeira', 15),
(2690, 'Olho d`Água', 15),
(2691, 'Olivedos', 15),
(2692, 'Ouro Velho', 15),
(2693, 'Parari', 15),
(2694, 'Passagem', 15),
(2695, 'Patos', 15),
(2696, 'Paulista', 15),
(2697, 'Pedra Branca', 15),
(2698, 'Pedra Lavrada', 15),
(2699, 'Pedras de Fogo', 15),
(2700, 'Pedro Régis', 15),
(2701, 'Piancó', 15),
(2702, 'Picuí', 15),
(2703, 'Pilar', 15),
(2704, 'Pilões', 15),
(2705, 'Pilõezinhos', 15),
(2706, 'Pirpirituba', 15),
(2707, 'Pitimbu', 15),
(2708, 'Pocinhos', 15),
(2709, 'Poço Dantas', 15),
(2710, 'Poço de José de Moura', 15),
(2711, 'Pombal', 15),
(2712, 'Prata', 15),
(2713, 'Princesa Isabel', 15),
(2714, 'Puxinanã', 15),
(2715, 'Queimadas', 15),
(2716, 'Quixabá', 15),
(2717, 'Remígio', 15),
(2718, 'Riachão', 15),
(2719, 'Riachão do Bacamarte', 15),
(2720, 'Riachão do Poço', 15),
(2721, 'Riacho de Santo Antônio', 15),
(2722, 'Riacho dos Cavalos', 15),
(2723, 'Rio Tinto', 15),
(2724, 'Salgadinho', 15),
(2725, 'Salgado de São Félix', 15),
(2726, 'Santa Cecília', 15),
(2727, 'Santa Cruz', 15),
(2728, 'Santa Helena', 15),
(2729, 'Santa Inês', 15),
(2730, 'Santa Luzia', 15),
(2731, 'Santa Rita', 15),
(2732, 'Santa Teresinha', 15),
(2733, 'Santana de Mangueira', 15),
(2734, 'Santana dos Garrotes', 15),
(2735, 'Santarém', 15),
(2736, 'Santo André', 15),
(2737, 'São Bentinho', 15),
(2738, 'São Bento', 15),
(2739, 'São Domingos de Pombal', 15),
(2740, 'São Domingos do Cariri', 15),
(2741, 'São Francisco', 15),
(2742, 'São João do Cariri', 15),
(2743, 'São João do Rio do Peixe', 15),
(2744, 'São João do Tigre', 15),
(2745, 'São José da Lagoa Tapada', 15),
(2746, 'São José de Caiana', 15),
(2747, 'São José de Espinharas', 15),
(2748, 'São José de Piranhas', 15),
(2749, 'São José de Princesa', 15),
(2750, 'São José do Bonfim', 15),
(2751, 'São José do Brejo do Cruz', 15),
(2752, 'São José do Sabugi', 15),
(2753, 'São José dos Cordeiros', 15),
(2754, 'São José dos Ramos', 15),
(2755, 'São Mamede', 15),
(2756, 'São Miguel de Taipu', 15),
(2757, 'São Sebastião de Lagoa de Roça', 15),
(2758, 'São Sebastião do Umbuzeiro', 15),
(2759, 'Sapé', 15),
(2760, 'Seridó', 15),
(2761, 'Serra Branca', 15),
(2762, 'Serra da Raiz', 15),
(2763, 'Serra Grande', 15),
(2764, 'Serra Redonda', 15),
(2765, 'Serraria', 15),
(2766, 'Sertãozinho', 15),
(2767, 'Sobrado', 15),
(2768, 'Solânea', 15),
(2769, 'Soledade', 15),
(2770, 'Sossêgo', 15),
(2771, 'Sousa', 15),
(2772, 'Sumé', 15),
(2773, 'Taperoá', 15),
(2774, 'Tavares', 15),
(2775, 'Teixeira', 15),
(2776, 'Tenório', 15),
(2777, 'Triunfo', 15),
(2778, 'Uiraúna', 15),
(2779, 'Umbuzeiro', 15),
(2780, 'Várzea', 15),
(2781, 'Vieirópolis', 15),
(2782, 'Vista Serrana', 15),
(2783, 'Zabelê', 15),
(2784, 'Abatiá', 18),
(2785, 'Adrianópolis', 18),
(2786, 'Agudos do Sul', 18),
(2787, 'Almirante Tamandaré', 18),
(2788, 'Altamira do Paraná', 18),
(2789, 'Alto Paraíso', 18),
(2790, 'Alto Paraná', 18),
(2791, 'Alto Piquiri', 18),
(2792, 'Altônia', 18),
(2793, 'Alvorada do Sul', 18),
(2794, 'Amaporã', 18),
(2795, 'Ampére', 18),
(2796, 'Anahy', 18),
(2797, 'Andirá', 18),
(2798, 'Ângulo', 18),
(2799, 'Antonina', 18),
(2800, 'Antônio Olinto', 18),
(2801, 'Apucarana', 18),
(2802, 'Arapongas', 18),
(2803, 'Arapoti', 18),
(2804, 'Arapuã', 18),
(2805, 'Araruna', 18),
(2806, 'Araucária', 18),
(2807, 'Ariranha do Ivaí', 18),
(2808, 'Assaí', 18),
(2809, 'Assis Chateaubriand', 18),
(2810, 'Astorga', 18),
(2811, 'Atalaia', 18),
(2812, 'Balsa Nova', 18),
(2813, 'Bandeirantes', 18),
(2814, 'Barbosa Ferraz', 18),
(2815, 'Barra do Jacaré', 18),
(2816, 'Barracão', 18),
(2817, 'Bela Vista da Caroba', 18),
(2818, 'Bela Vista do Paraíso', 18),
(2819, 'Bituruna', 18),
(2820, 'Boa Esperança', 18),
(2821, 'Boa Esperança do Iguaçu', 18),
(2822, 'Boa Ventura de São Roque', 18),
(2823, 'Boa Vista da Aparecida', 18),
(2824, 'Bocaiúva do Sul', 18),
(2825, 'Bom Jesus do Sul', 18),
(2826, 'Bom Sucesso', 18),
(2827, 'Bom Sucesso do Sul', 18),
(2828, 'Borrazópolis', 18),
(2829, 'Braganey', 18),
(2830, 'Brasilândia do Sul', 18),
(2831, 'Cafeara', 18),
(2832, 'Cafelândia', 18),
(2833, 'Cafezal do Sul', 18),
(2834, 'Califórnia', 18),
(2835, 'Cambará', 18),
(2836, 'Cambé', 18),
(2837, 'Cambira', 18),
(2838, 'Campina da Lagoa', 18),
(2839, 'Campina do Simão', 18),
(2840, 'Campina Grande do Sul', 18),
(2841, 'Campo Bonito', 18),
(2842, 'Campo do Tenente', 18),
(2843, 'Campo Largo', 18),
(2844, 'Campo Magro', 18),
(2845, 'Campo Mourão', 18),
(2846, 'Cândido de Abreu', 18),
(2847, 'Candói', 18),
(2848, 'Cantagalo', 18),
(2849, 'Capanema', 18),
(2850, 'Capitão Leônidas Marques', 18),
(2851, 'Carambeí', 18),
(2852, 'Carlópolis', 18),
(2853, 'Cascavel', 18),
(2854, 'Castro', 18),
(2855, 'Catanduvas', 18),
(2856, 'Centenário do Sul', 18),
(2857, 'Cerro Azul', 18),
(2858, 'Céu Azul', 18),
(2859, 'Chopinzinho', 18),
(2860, 'Cianorte', 18),
(2861, 'Cidade Gaúcha', 18),
(2862, 'Clevelândia', 18),
(2863, 'Colombo', 18),
(2864, 'Colorado', 18),
(2865, 'Congonhinhas', 18),
(2866, 'Conselheiro Mairinck', 18),
(2867, 'Contenda', 18),
(2868, 'Corbélia', 18),
(2869, 'Cornélio Procópio', 18),
(2870, 'Coronel Domingos Soares', 18),
(2871, 'Coronel Vivida', 18),
(2872, 'Corumbataí do Sul', 18),
(2873, 'Cruz Machado', 18),
(2874, 'Cruzeiro do Iguaçu', 18),
(2875, 'Cruzeiro do Oeste', 18),
(2876, 'Cruzeiro do Sul', 18),
(2877, 'Cruzmaltina', 18),
(2878, 'Curitiba', 18),
(2879, 'Curiúva', 18),
(2880, 'Diamante d`Oeste', 18),
(2881, 'Diamante do Norte', 18),
(2882, 'Diamante do Sul', 18),
(2883, 'Dois Vizinhos', 18),
(2884, 'Douradina', 18),
(2885, 'Doutor Camargo', 18),
(2886, 'Doutor Ulysses', 18),
(2887, 'Enéas Marques', 18),
(2888, 'Engenheiro Beltrão', 18),
(2889, 'Entre Rios do Oeste', 18),
(2890, 'Esperança Nova', 18),
(2891, 'Espigão Alto do Iguaçu', 18),
(2892, 'Farol', 18),
(2893, 'Faxinal', 18),
(2894, 'Fazenda Rio Grande', 18),
(2895, 'Fênix', 18),
(2896, 'Fernandes Pinheiro', 18),
(2897, 'Figueira', 18),
(2898, 'Flor da Serra do Sul', 18),
(2899, 'Floraí', 18),
(2900, 'Floresta', 18),
(2901, 'Florestópolis', 18),
(2902, 'Flórida', 18),
(2903, 'Formosa do Oeste', 18),
(2904, 'Foz do Iguaçu', 18),
(2905, 'Foz do Jordão', 18),
(2906, 'Francisco Alves', 18),
(2907, 'Francisco Beltrão', 18),
(2908, 'General Carneiro', 18),
(2909, 'Godoy Moreira', 18),
(2910, 'Goioerê', 18),
(2911, 'Goioxim', 18),
(2912, 'Grandes Rios', 18),
(2913, 'Guaíra', 18),
(2914, 'Guairaçá', 18),
(2915, 'Guamiranga', 18),
(2916, 'Guapirama', 18),
(2917, 'Guaporema', 18),
(2918, 'Guaraci', 18),
(2919, 'Guaraniaçu', 18),
(2920, 'Guarapuava', 18),
(2921, 'Guaraqueçaba', 18),
(2922, 'Guaratuba', 18),
(2923, 'Honório Serpa', 18),
(2924, 'Ibaiti', 18),
(2925, 'Ibema', 18),
(2926, 'Ibiporã', 18),
(2927, 'Icaraíma', 18),
(2928, 'Iguaraçu', 18),
(2929, 'Iguatu', 18),
(2930, 'Imbaú', 18),
(2931, 'Imbituva', 18),
(2932, 'Inácio Martins', 18),
(2933, 'Inajá', 18),
(2934, 'Indianópolis', 18),
(2935, 'Ipiranga', 18),
(2936, 'Iporã', 18),
(2937, 'Iracema do Oeste', 18),
(2938, 'Irati', 18),
(2939, 'Iretama', 18),
(2940, 'Itaguajé', 18),
(2941, 'Itaipulândia', 18),
(2942, 'Itambaracá', 18),
(2943, 'Itambé', 18),
(2944, 'Itapejara d`Oeste', 18),
(2945, 'Itaperuçu', 18),
(2946, 'Itaúna do Sul', 18),
(2947, 'Ivaí', 18),
(2948, 'Ivaiporã', 18),
(2949, 'Ivaté', 18),
(2950, 'Ivatuba', 18),
(2951, 'Jaboti', 18),
(2952, 'Jacarezinho', 18),
(2953, 'Jaguapitã', 18),
(2954, 'Jaguariaíva', 18),
(2955, 'Jandaia do Sul', 18),
(2956, 'Janiópolis', 18),
(2957, 'Japira', 18),
(2958, 'Japurá', 18),
(2959, 'Jardim Alegre', 18),
(2960, 'Jardim Olinda', 18),
(2961, 'Jataizinho', 18),
(2962, 'Jesuítas', 18),
(2963, 'Joaquim Távora', 18),
(2964, 'Jundiaí do Sul', 18),
(2965, 'Juranda', 18),
(2966, 'Jussara', 18),
(2967, 'Kaloré', 18),
(2968, 'Lapa', 18),
(2969, 'Laranjal', 18),
(2970, 'Laranjeiras do Sul', 18),
(2971, 'Leópolis', 18),
(2972, 'Lidianópolis', 18),
(2973, 'Lindoeste', 18),
(2974, 'Loanda', 18),
(2975, 'Lobato', 18),
(2976, 'Londrina', 18),
(2977, 'Luiziana', 18),
(2978, 'Lunardelli', 18),
(2979, 'Lupionópolis', 18),
(2980, 'Mallet', 18),
(2981, 'Mamborê', 18),
(2982, 'Mandaguaçu', 18),
(2983, 'Mandaguari', 18),
(2984, 'Mandirituba', 18),
(2985, 'Manfrinópolis', 18),
(2986, 'Mangueirinha', 18),
(2987, 'Manoel Ribas', 18),
(2988, 'Marechal Cândido Rondon', 18),
(2989, 'Maria Helena', 18),
(2990, 'Marialva', 18),
(2991, 'Marilândia do Sul', 18),
(2992, 'Marilena', 18),
(2993, 'Mariluz', 18),
(2994, 'Maringá', 18),
(2995, 'Mariópolis', 18),
(2996, 'Maripá', 18),
(2997, 'Marmeleiro', 18),
(2998, 'Marquinho', 18),
(2999, 'Marumbi', 18),
(3000, 'Matelândia', 18),
(3001, 'Matinhos', 18),
(3002, 'Mato Rico', 18),
(3003, 'Mauá da Serra', 18),
(3004, 'Medianeira', 18),
(3005, 'Mercedes', 18),
(3006, 'Mirador', 18),
(3007, 'Miraselva', 18),
(3008, 'Missal', 18),
(3009, 'Moreira Sales', 18),
(3010, 'Morretes', 18),
(3011, 'Munhoz de Melo', 18),
(3012, 'Nossa Senhora das Graças', 18),
(3013, 'Nova Aliança do Ivaí', 18),
(3014, 'Nova América da Colina', 18),
(3015, 'Nova Aurora', 18),
(3016, 'Nova Cantu', 18),
(3017, 'Nova Esperança', 18),
(3018, 'Nova Esperança do Sudoeste', 18),
(3019, 'Nova Fátima', 18),
(3020, 'Nova Laranjeiras', 18),
(3021, 'Nova Londrina', 18),
(3022, 'Nova Olímpia', 18),
(3023, 'Nova Prata do Iguaçu', 18),
(3024, 'Nova Santa Bárbara', 18),
(3025, 'Nova Santa Rosa', 18),
(3026, 'Nova Tebas', 18),
(3027, 'Novo Itacolomi', 18),
(3028, 'Ortigueira', 18),
(3029, 'Ourizona', 18),
(3030, 'Ouro Verde do Oeste', 18),
(3031, 'Paiçandu', 18),
(3032, 'Palmas', 18),
(3033, 'Palmeira', 18),
(3034, 'Palmital', 18),
(3035, 'Palotina', 18),
(3036, 'Paraíso do Norte', 18),
(3037, 'Paranacity', 18),
(3038, 'Paranaguá', 18),
(3039, 'Paranapoema', 18),
(3040, 'Paranavaí', 18),
(3041, 'Pato Bragado', 18),
(3042, 'Pato Branco', 18),
(3043, 'Paula Freitas', 18),
(3044, 'Paulo Frontin', 18),
(3045, 'Peabiru', 18),
(3046, 'Perobal', 18),
(3047, 'Pérola', 18),
(3048, 'Pérola d`Oeste', 18),
(3049, 'Piên', 18),
(3050, 'Pinhais', 18),
(3051, 'Pinhal de São Bento', 18),
(3052, 'Pinhalão', 18),
(3053, 'Pinhão', 18),
(3054, 'Piraí do Sul', 18),
(3055, 'Piraquara', 18),
(3056, 'Pitanga', 18),
(3057, 'Pitangueiras', 18),
(3058, 'Planaltina do Paraná', 18),
(3059, 'Planalto', 18),
(3060, 'Ponta Grossa', 18),
(3061, 'Pontal do Paraná', 18),
(3062, 'Porecatu', 18),
(3063, 'Porto Amazonas', 18),
(3064, 'Porto Barreiro', 18),
(3065, 'Porto Rico', 18),
(3066, 'Porto Vitória', 18),
(3067, 'Prado Ferreira', 18),
(3068, 'Pranchita', 18),
(3069, 'Presidente Castelo Branco', 18),
(3070, 'Primeiro de Maio', 18),
(3071, 'Prudentópolis', 18),
(3072, 'Quarto Centenário', 18),
(3073, 'Quatiguá', 18),
(3074, 'Quatro Barras', 18),
(3075, 'Quatro Pontes', 18),
(3076, 'Quedas do Iguaçu', 18),
(3077, 'Querência do Norte', 18),
(3078, 'Quinta do Sol', 18),
(3079, 'Quitandinha', 18),
(3080, 'Ramilândia', 18),
(3081, 'Rancho Alegre', 18),
(3082, 'Rancho Alegre d`Oeste', 18),
(3083, 'Realeza', 18),
(3084, 'Rebouças', 18),
(3085, 'Renascença', 18),
(3086, 'Reserva', 18),
(3087, 'Reserva do Iguaçu', 18),
(3088, 'Ribeirão Claro', 18),
(3089, 'Ribeirão do Pinhal', 18),
(3090, 'Rio Azul', 18),
(3091, 'Rio Bom', 18),
(3092, 'Rio Bonito do Iguaçu', 18),
(3093, 'Rio Branco do Ivaí', 18),
(3094, 'Rio Branco do Sul', 18),
(3095, 'Rio Negro', 18),
(3096, 'Rolândia', 18),
(3097, 'Roncador', 18),
(3098, 'Rondon', 18),
(3099, 'Rosário do Ivaí', 18),
(3100, 'Sabáudia', 18),
(3101, 'Salgado Filho', 18),
(3102, 'Salto do Itararé', 18),
(3103, 'Salto do Lontra', 18),
(3104, 'Santa Amélia', 18),
(3105, 'Santa Cecília do Pavão', 18),
(3106, 'Santa Cruz de Monte Castelo', 18),
(3107, 'Santa Fé', 18),
(3108, 'Santa Helena', 18),
(3109, 'Santa Inês', 18),
(3110, 'Santa Isabel do Ivaí', 18),
(3111, 'Santa Izabel do Oeste', 18),
(3112, 'Santa Lúcia', 18),
(3113, 'Santa Maria do Oeste', 18),
(3114, 'Santa Mariana', 18),
(3115, 'Santa Mônica', 18),
(3116, 'Santa Tereza do Oeste', 18),
(3117, 'Santa Terezinha de Itaipu', 18),
(3118, 'Santana do Itararé', 18),
(3119, 'Santo Antônio da Platina', 18),
(3120, 'Santo Antônio do Caiuá', 18),
(3121, 'Santo Antônio do Paraíso', 18),
(3122, 'Santo Antônio do Sudoeste', 18),
(3123, 'Santo Inácio', 18),
(3124, 'São Carlos do Ivaí', 18),
(3125, 'São Jerônimo da Serra', 18),
(3126, 'São João', 18),
(3127, 'São João do Caiuá', 18),
(3128, 'São João do Ivaí', 18),
(3129, 'São João do Triunfo', 18),
(3130, 'São Jorge d`Oeste', 18),
(3131, 'São Jorge do Ivaí', 18),
(3132, 'São Jorge do Patrocínio', 18),
(3133, 'São José da Boa Vista', 18),
(3134, 'São José das Palmeiras', 18),
(3135, 'São José dos Pinhais', 18),
(3136, 'São Manoel do Paraná', 18),
(3137, 'São Mateus do Sul', 18),
(3138, 'São Miguel do Iguaçu', 18),
(3139, 'São Pedro do Iguaçu', 18),
(3140, 'São Pedro do Ivaí', 18),
(3141, 'São Pedro do Paraná', 18),
(3142, 'São Sebastião da Amoreira', 18),
(3143, 'São Tomé', 18),
(3144, 'Sapopema', 18),
(3145, 'Sarandi', 18),
(3146, 'Saudade do Iguaçu', 18),
(3147, 'Sengés', 18),
(3148, 'Serranópolis do Iguaçu', 18),
(3149, 'Sertaneja', 18),
(3150, 'Sertanópolis', 18),
(3151, 'Siqueira Campos', 18),
(3152, 'Sulina', 18),
(3153, 'Tamarana', 18),
(3154, 'Tamboara', 18),
(3155, 'Tapejara', 18),
(3156, 'Tapira', 18),
(3157, 'Teixeira Soares', 18),
(3158, 'Telêmaco Borba', 18),
(3159, 'Terra Boa', 18),
(3160, 'Terra Rica', 18),
(3161, 'Terra Roxa', 18),
(3162, 'Tibagi', 18),
(3163, 'Tijucas do Sul', 18),
(3164, 'Toledo', 18),
(3165, 'Tomazina', 18),
(3166, 'Três Barras do Paraná', 18),
(3167, 'Tunas do Paraná', 18),
(3168, 'Tuneiras do Oeste', 18),
(3169, 'Tupãssi', 18),
(3170, 'Turvo', 18),
(3171, 'Ubiratã', 18),
(3172, 'Umuarama', 18),
(3173, 'União da Vitória', 18),
(3174, 'Uniflor', 18),
(3175, 'Uraí', 18),
(3176, 'Ventania', 18),
(3177, 'Vera Cruz do Oeste', 18),
(3178, 'Verê', 18),
(3179, 'Virmond', 18),
(3180, 'Vitorino', 18),
(3181, 'Wenceslau Braz', 18),
(3182, 'Xambrê', 18),
(3183, 'Abreu e Lima', 16),
(3184, 'Afogados da Ingazeira', 16),
(3185, 'Afrânio', 16),
(3186, 'Agrestina', 16),
(3187, 'Água Preta', 16),
(3188, 'Águas Belas', 16),
(3189, 'Alagoinha', 16),
(3190, 'Aliança', 16),
(3191, 'Altinho', 16),
(3192, 'Amaraji', 16),
(3193, 'Angelim', 16),
(3194, 'Araçoiaba', 16),
(3195, 'Araripina', 16),
(3196, 'Arcoverde', 16),
(3197, 'Barra de Guabiraba', 16),
(3198, 'Barreiros', 16),
(3199, 'Belém de Maria', 16),
(3200, 'Belém de São Francisco', 16),
(3201, 'Belo Jardim', 16),
(3202, 'Betânia', 16),
(3203, 'Bezerros', 16),
(3204, 'Bodocó', 16),
(3205, 'Bom Conselho', 16),
(3206, 'Bom Jardim', 16),
(3207, 'Bonito', 16),
(3208, 'Brejão', 16),
(3209, 'Brejinho', 16),
(3210, 'Brejo da Madre de Deus', 16),
(3211, 'Buenos Aires', 16),
(3212, 'Buíque', 16),
(3213, 'Cabo de Santo Agostinho', 16),
(3214, 'Cabrobó', 16),
(3215, 'Cachoeirinha', 16),
(3216, 'Caetés', 16),
(3217, 'Calçado', 16),
(3218, 'Calumbi', 16),
(3219, 'Camaragibe', 16),
(3220, 'Camocim de São Félix', 16),
(3221, 'Camutanga', 16),
(3222, 'Canhotinho', 16),
(3223, 'Capoeiras', 16),
(3224, 'Carnaíba', 16),
(3225, 'Carnaubeira da Penha', 16),
(3226, 'Carpina', 16),
(3227, 'Caruaru', 16),
(3228, 'Casinhas', 16),
(3229, 'Catende', 16),
(3230, 'Cedro', 16),
(3231, 'Chã de Alegria', 16),
(3232, 'Chã Grande', 16),
(3233, 'Condado', 16),
(3234, 'Correntes', 16),
(3235, 'Cortês', 16),
(3236, 'Cumaru', 16),
(3237, 'Cupira', 16),
(3238, 'Custódia', 16),
(3239, 'Dormentes', 16),
(3240, 'Escada', 16),
(3241, 'Exu', 16),
(3242, 'Feira Nova', 16),
(3243, 'Fernando de Noronha', 16),
(3244, 'Ferreiros', 16),
(3245, 'Flores', 16),
(3246, 'Floresta', 16),
(3247, 'Frei Miguelinho', 16),
(3248, 'Gameleira', 16),
(3249, 'Garanhuns', 16),
(3250, 'Glória do Goitá', 16),
(3251, 'Goiana', 16),
(3252, 'Granito', 16),
(3253, 'Gravatá', 16),
(3254, 'Iati', 16),
(3255, 'Ibimirim', 16),
(3256, 'Ibirajuba', 16),
(3257, 'Igarassu', 16),
(3258, 'Iguaraci', 16),
(3259, 'Ilha de Itamaracá', 16),
(3260, 'Inajá', 16),
(3261, 'Ingazeira', 16),
(3262, 'Ipojuca', 16),
(3263, 'Ipubi', 16),
(3264, 'Itacuruba', 16),
(3265, 'Itaíba', 16),
(3266, 'Itambé', 16),
(3267, 'Itapetim', 16),
(3268, 'Itapissuma', 16),
(3269, 'Itaquitinga', 16),
(3270, 'Jaboatão dos Guararapes', 16),
(3271, 'Jaqueira', 16),
(3272, 'Jataúba', 16),
(3273, 'Jatobá', 16),
(3274, 'João Alfredo', 16),
(3275, 'Joaquim Nabuco', 16),
(3276, 'Jucati', 16),
(3277, 'Jupi', 16),
(3278, 'Jurema', 16),
(3279, 'Lagoa do Carro', 16),
(3280, 'Lagoa do Itaenga', 16),
(3281, 'Lagoa do Ouro', 16),
(3282, 'Lagoa dos Gatos', 16),
(3283, 'Lagoa Grande', 16),
(3284, 'Lajedo', 16),
(3285, 'Limoeiro', 16),
(3286, 'Macaparana', 16),
(3287, 'Machados', 16),
(3288, 'Manari', 16),
(3289, 'Maraial', 16),
(3290, 'Mirandiba', 16),
(3291, 'Moreilândia', 16),
(3292, 'Moreno', 16),
(3293, 'Nazaré da Mata', 16),
(3294, 'Olinda', 16),
(3295, 'Orobó', 16),
(3296, 'Orocó', 16),
(3297, 'Ouricuri', 16),
(3298, 'Palmares', 16),
(3299, 'Palmeirina', 16),
(3300, 'Panelas', 16),
(3301, 'Paranatama', 16),
(3302, 'Parnamirim', 16),
(3303, 'Passira', 16),
(3304, 'Paudalho', 16),
(3305, 'Paulista', 16),
(3306, 'Pedra', 16),
(3307, 'Pesqueira', 16),
(3308, 'Petrolândia', 16),
(3309, 'Petrolina', 16),
(3310, 'Poção', 16),
(3311, 'Pombos', 16),
(3312, 'Primavera', 16),
(3313, 'Quipapá', 16),
(3314, 'Quixaba', 16),
(3315, 'Recife', 16),
(3316, 'Riacho das Almas', 16),
(3317, 'Ribeirão', 16),
(3318, 'Rio Formoso', 16),
(3319, 'Sairé', 16),
(3320, 'Salgadinho', 16),
(3321, 'Salgueiro', 16),
(3322, 'Saloá', 16),
(3323, 'Sanharó', 16),
(3324, 'Santa Cruz', 16),
(3325, 'Santa Cruz da Baixa Verde', 16),
(3326, 'Santa Cruz do Capibaribe', 16),
(3327, 'Santa Filomena', 16),
(3328, 'Santa Maria da Boa Vista', 16),
(3329, 'Santa Maria do Cambucá', 16),
(3330, 'Santa Terezinha', 16),
(3331, 'São Benedito do Sul', 16),
(3332, 'São Bento do Una', 16),
(3333, 'São Caitano', 16),
(3334, 'São João', 16),
(3335, 'São Joaquim do Monte', 16),
(3336, 'São José da Coroa Grande', 16),
(3337, 'São José do Belmonte', 16),
(3338, 'São José do Egito', 16),
(3339, 'São Lourenço da Mata', 16),
(3340, 'São Vicente Ferrer', 16),
(3341, 'Serra Talhada', 16),
(3342, 'Serrita', 16),
(3343, 'Sertânia', 16),
(3344, 'Sirinhaém', 16),
(3345, 'Solidão', 16),
(3346, 'Surubim', 16),
(3347, 'Tabira', 16),
(3348, 'Tacaimbó', 16),
(3349, 'Tacaratu', 16),
(3350, 'Tamandaré', 16),
(3351, 'Taquaritinga do Norte', 16),
(3352, 'Terezinha', 16),
(3353, 'Terra Nova', 16),
(3354, 'Timbaúba', 16),
(3355, 'Toritama', 16),
(3356, 'Tracunhaém', 16),
(3357, 'Trindade', 16),
(3358, 'Triunfo', 16),
(3359, 'Tupanatinga', 16),
(3360, 'Tuparetama', 16),
(3361, 'Venturosa', 16),
(3362, 'Verdejante', 16),
(3363, 'Vertente do Lério', 16),
(3364, 'Vertentes', 16),
(3365, 'Vicência', 16),
(3366, 'Vitória de Santo Antão', 16),
(3367, 'Xexéu', 16),
(3368, 'Acauã', 17),
(3369, 'Agricolândia', 17),
(3370, 'Água Branca', 17),
(3371, 'Alagoinha do Piauí', 17),
(3372, 'Alegrete do Piauí', 17),
(3373, 'Alto Longá', 17),
(3374, 'Altos', 17),
(3375, 'Alvorada do Gurguéia', 17),
(3376, 'Amarante', 17),
(3377, 'Angical do Piauí', 17),
(3378, 'Anísio de Abreu', 17),
(3379, 'Antônio Almeida', 17),
(3380, 'Aroazes', 17),
(3381, 'Aroeiras do Itaim', 17),
(3382, 'Arraial', 17),
(3383, 'Assunção do Piauí', 17),
(3384, 'Avelino Lopes', 17),
(3385, 'Baixa Grande do Ribeiro', 17),
(3386, 'Barra d`Alcântara', 17),
(3387, 'Barras', 17),
(3388, 'Barreiras do Piauí', 17),
(3389, 'Barro Duro', 17),
(3390, 'Batalha', 17),
(3391, 'Bela Vista do Piauí', 17),
(3392, 'Belém do Piauí', 17),
(3393, 'Beneditinos', 17),
(3394, 'Bertolínia', 17),
(3395, 'Betânia do Piauí', 17),
(3396, 'Boa Hora', 17),
(3397, 'Bocaina', 17),
(3398, 'Bom Jesus', 17),
(3399, 'Bom Princípio do Piauí', 17),
(3400, 'Bonfim do Piauí', 17),
(3401, 'Boqueirão do Piauí', 17),
(3402, 'Brasileira', 17),
(3403, 'Brejo do Piauí', 17),
(3404, 'Buriti dos Lopes', 17),
(3405, 'Buriti dos Montes', 17),
(3406, 'Cabeceiras do Piauí', 17),
(3407, 'Cajazeiras do Piauí', 17),
(3408, 'Cajueiro da Praia', 17),
(3409, 'Caldeirão Grande do Piauí', 17),
(3410, 'Campinas do Piauí', 17),
(3411, 'Campo Alegre do Fidalgo', 17),
(3412, 'Campo Grande do Piauí', 17),
(3413, 'Campo Largo do Piauí', 17),
(3414, 'Campo Maior', 17),
(3415, 'Canavieira', 17),
(3416, 'Canto do Buriti', 17),
(3417, 'Capitão de Campos', 17),
(3418, 'Capitão Gervásio Oliveira', 17),
(3419, 'Caracol', 17),
(3420, 'Caraúbas do Piauí', 17),
(3421, 'Caridade do Piauí', 17),
(3422, 'Castelo do Piauí', 17),
(3423, 'Caxingó', 17),
(3424, 'Cocal', 17),
(3425, 'Cocal de Telha', 17),
(3426, 'Cocal dos Alves', 17),
(3427, 'Coivaras', 17),
(3428, 'Colônia do Gurguéia', 17),
(3429, 'Colônia do Piauí', 17),
(3430, 'Conceição do Canindé', 17),
(3431, 'Coronel José Dias', 17),
(3432, 'Corrente', 17),
(3433, 'Cristalândia do Piauí', 17),
(3434, 'Cristino Castro', 17),
(3435, 'Curimatá', 17),
(3436, 'Currais', 17),
(3437, 'Curral Novo do Piauí', 17),
(3438, 'Curralinhos', 17),
(3439, 'Demerval Lobão', 17),
(3440, 'Dirceu Arcoverde', 17),
(3441, 'Dom Expedito Lopes', 17),
(3442, 'Dom Inocêncio', 17),
(3443, 'Domingos Mourão', 17),
(3444, 'Elesbão Veloso', 17),
(3445, 'Eliseu Martins', 17),
(3446, 'Esperantina', 17),
(3447, 'Fartura do Piauí', 17),
(3448, 'Flores do Piauí', 17),
(3449, 'Floresta do Piauí', 17),
(3450, 'Floriano', 17),
(3451, 'Francinópolis', 17),
(3452, 'Francisco Ayres', 17),
(3453, 'Francisco Macedo', 17),
(3454, 'Francisco Santos', 17),
(3455, 'Fronteiras', 17),
(3456, 'Geminiano', 17),
(3457, 'Gilbués', 17),
(3458, 'Guadalupe', 17),
(3459, 'Guaribas', 17),
(3460, 'Hugo Napoleão', 17),
(3461, 'Ilha Grande', 17),
(3462, 'Inhuma', 17),
(3463, 'Ipiranga do Piauí', 17),
(3464, 'Isaías Coelho', 17),
(3465, 'Itainópolis', 17),
(3466, 'Itaueira', 17),
(3467, 'Jacobina do Piauí', 17),
(3468, 'Jaicós', 17),
(3469, 'Jardim do Mulato', 17),
(3470, 'Jatobá do Piauí', 17),
(3471, 'Jerumenha', 17),
(3472, 'João Costa', 17),
(3473, 'Joaquim Pires', 17),
(3474, 'Joca Marques', 17),
(3475, 'José de Freitas', 17),
(3476, 'Juazeiro do Piauí', 17),
(3477, 'Júlio Borges', 17),
(3478, 'Jurema', 17),
(3479, 'Lagoa Alegre', 17),
(3480, 'Lagoa de São Francisco', 17),
(3481, 'Lagoa do Barro do Piauí', 17),
(3482, 'Lagoa do Piauí', 17),
(3483, 'Lagoa do Sítio', 17),
(3484, 'Lagoinha do Piauí', 17),
(3485, 'Landri Sales', 17),
(3486, 'Luís Correia', 17),
(3487, 'Luzilândia', 17),
(3488, 'Madeiro', 17),
(3489, 'Manoel Emídio', 17),
(3490, 'Marcolândia', 17),
(3491, 'Marcos Parente', 17),
(3492, 'Massapê do Piauí', 17),
(3493, 'Matias Olímpio', 17),
(3494, 'Miguel Alves', 17),
(3495, 'Miguel Leão', 17),
(3496, 'Milton Brandão', 17),
(3497, 'Monsenhor Gil', 17),
(3498, 'Monsenhor Hipólito', 17),
(3499, 'Monte Alegre do Piauí', 17),
(3500, 'Morro Cabeça no Tempo', 17),
(3501, 'Morro do Chapéu do Piauí', 17),
(3502, 'Murici dos Portelas', 17),
(3503, 'Nazaré do Piauí', 17),
(3504, 'Nossa Senhora de Nazaré', 17),
(3505, 'Nossa Senhora dos Remédios', 17),
(3506, 'Nova Santa Rita', 17),
(3507, 'Novo Oriente do Piauí', 17),
(3508, 'Novo Santo Antônio', 17),
(3509, 'Oeiras', 17),
(3510, 'Olho d`Água do Piauí', 17),
(3511, 'Padre Marcos', 17),
(3512, 'Paes Landim', 17),
(3513, 'Pajeú do Piauí', 17),
(3514, 'Palmeira do Piauí', 17),
(3515, 'Palmeirais', 17),
(3516, 'Paquetá', 17),
(3517, 'Parnaguá', 17),
(3518, 'Parnaíba', 17),
(3519, 'Passagem Franca do Piauí', 17),
(3520, 'Patos do Piauí', 17),
(3521, 'Pau d`Arco do Piauí', 17),
(3522, 'Paulistana', 17),
(3523, 'Pavussu', 17),
(3524, 'Pedro II', 17),
(3525, 'Pedro Laurentino', 17),
(3526, 'Picos', 17),
(3527, 'Pimenteiras', 17),
(3528, 'Pio IX', 17),
(3529, 'Piracuruca', 17),
(3530, 'Piripiri', 17),
(3531, 'Porto', 17),
(3532, 'Porto Alegre do Piauí', 17),
(3533, 'Prata do Piauí', 17),
(3534, 'Queimada Nova', 17),
(3535, 'Redenção do Gurguéia', 17),
(3536, 'Regeneração', 17),
(3537, 'Riacho Frio', 17),
(3538, 'Ribeira do Piauí', 17),
(3539, 'Ribeiro Gonçalves', 17),
(3540, 'Rio Grande do Piauí', 17),
(3541, 'Santa Cruz do Piauí', 17),
(3542, 'Santa Cruz dos Milagres', 17),
(3543, 'Santa Filomena', 17),
(3544, 'Santa Luz', 17),
(3545, 'Santa Rosa do Piauí', 17),
(3546, 'Santana do Piauí', 17),
(3547, 'Santo Antônio de Lisboa', 17),
(3548, 'Santo Antônio dos Milagres', 17),
(3549, 'Santo Inácio do Piauí', 17),
(3550, 'São Braz do Piauí', 17),
(3551, 'São Félix do Piauí', 17),
(3552, 'São Francisco de Assis do Piauí', 17),
(3553, 'São Francisco do Piauí', 17),
(3554, 'São Gonçalo do Gurguéia', 17),
(3555, 'São Gonçalo do Piauí', 17),
(3556, 'São João da Canabrava', 17),
(3557, 'São João da Fronteira', 17),
(3558, 'São João da Serra', 17),
(3559, 'São João da Varjota', 17),
(3560, 'São João do Arraial', 17),
(3561, 'São João do Piauí', 17),
(3562, 'São José do Divino', 17),
(3563, 'São José do Peixe', 17),
(3564, 'São José do Piauí', 17),
(3565, 'São Julião', 17),
(3566, 'São Lourenço do Piauí', 17),
(3567, 'São Luis do Piauí', 17),
(3568, 'São Miguel da Baixa Grande', 17),
(3569, 'São Miguel do Fidalgo', 17),
(3570, 'São Miguel do Tapuio', 17),
(3571, 'São Pedro do Piauí', 17),
(3572, 'São Raimundo Nonato', 17),
(3573, 'Sebastião Barros', 17),
(3574, 'Sebastião Leal', 17),
(3575, 'Sigefredo Pacheco', 17),
(3576, 'Simões', 17),
(3577, 'Simplício Mendes', 17),
(3578, 'Socorro do Piauí', 17),
(3579, 'Sussuapara', 17),
(3580, 'Tamboril do Piauí', 17),
(3581, 'Tanque do Piauí', 17),
(3582, 'Teresina', 17),
(3583, 'União', 17),
(3584, 'Uruçuí', 17),
(3585, 'Valença do Piauí', 17),
(3586, 'Várzea Branca', 17),
(3587, 'Várzea Grande', 17),
(3588, 'Vera Mendes', 17),
(3589, 'Vila Nova do Piauí', 17),
(3590, 'Wall Ferraz', 17),
(3591, 'Angra dos Reis', 19),
(3592, 'Aperibé', 19),
(3593, 'Araruama', 19),
(3594, 'Areal', 19),
(3595, 'Armação dos Búzios', 19),
(3596, 'Arraial do Cabo', 19),
(3597, 'Barra do Piraí', 19),
(3598, 'Barra Mansa', 19),
(3599, 'Belford Roxo', 19),
(3600, 'Bom Jardim', 19),
(3601, 'Bom Jesus do Itabapoana', 19),
(3602, 'Cabo Frio', 19),
(3603, 'Cachoeiras de Macacu', 19),
(3604, 'Cambuci', 19),
(3605, 'Campos dos Goytacazes', 19),
(3606, 'Cantagalo', 19),
(3607, 'Carapebus', 19),
(3608, 'Cardoso Moreira', 19),
(3609, 'Carmo', 19),
(3610, 'Casimiro de Abreu', 19),
(3611, 'Comendador Levy Gasparian', 19),
(3612, 'Conceição de Macabu', 19),
(3613, 'Cordeiro', 19),
(3614, 'Duas Barras', 19),
(3615, 'Duque de Caxias', 19),
(3616, 'Engenheiro Paulo de Frontin', 19),
(3617, 'Guapimirim', 19),
(3618, 'Iguaba Grande', 19),
(3619, 'Itaboraí', 19),
(3620, 'Itaguaí', 19),
(3621, 'Italva', 19),
(3622, 'Itaocara', 19),
(3623, 'Itaperuna', 19),
(3624, 'Itatiaia', 19),
(3625, 'Japeri', 19),
(3626, 'Laje do Muriaé', 19),
(3627, 'Macaé', 19),
(3628, 'Macuco', 19),
(3629, 'Magé', 19),
(3630, 'Mangaratiba', 19),
(3631, 'Maricá', 19),
(3632, 'Mendes', 19),
(3633, 'Mesquita', 19),
(3634, 'Miguel Pereira', 19),
(3635, 'Miracema', 19),
(3636, 'Natividade', 19),
(3637, 'Nilópolis', 19),
(3638, 'Niterói', 19),
(3639, 'Nova Friburgo', 19),
(3640, 'Nova Iguaçu', 19),
(3641, 'Paracambi', 19),
(3642, 'Paraíba do Sul', 19),
(3643, 'Parati', 19),
(3644, 'Paty do Alferes', 19),
(3645, 'Petrópolis', 19),
(3646, 'Pinheiral', 19),
(3647, 'Piraí', 19),
(3648, 'Porciúncula', 19),
(3649, 'Porto Real', 19),
(3650, 'Quatis', 19),
(3651, 'Queimados', 19),
(3652, 'Quissamã', 19),
(3653, 'Resende', 19),
(3654, 'Rio Bonito', 19),
(3655, 'Rio Claro', 19),
(3656, 'Rio das Flores', 19),
(3657, 'Rio das Ostras', 19),
(3658, 'Rio de Janeiro', 19),
(3659, 'Santa Maria Madalena', 19),
(3660, 'Santo Antônio de Pádua', 19),
(3661, 'São Fidélis', 19),
(3662, 'São Francisco de Itabapoana', 19),
(3663, 'São Gonçalo', 19),
(3664, 'São João da Barra', 19),
(3665, 'São João de Meriti', 19),
(3666, 'São José de Ubá', 19),
(3667, 'São José do Vale do Rio Pret', 19),
(3668, 'São Pedro da Aldeia', 19),
(3669, 'São Sebastião do Alto', 19),
(3670, 'Sapucaia', 19),
(3671, 'Saquarema', 19),
(3672, 'Seropédica', 19),
(3673, 'Silva Jardim', 19),
(3674, 'Sumidouro', 19),
(3675, 'Tanguá', 19),
(3676, 'Teresópolis', 19),
(3677, 'Trajano de Morais', 19),
(3678, 'Três Rios', 19),
(3679, 'Valença', 19),
(3680, 'Varre-Sai', 19),
(3681, 'Vassouras', 19),
(3682, 'Volta Redonda', 19),
(3683, 'Acari', 20),
(3684, 'Açu', 20),
(3685, 'Afonso Bezerra', 20),
(3686, 'Água Nova', 20),
(3687, 'Alexandria', 20),
(3688, 'Almino Afonso', 20),
(3689, 'Alto do Rodrigues', 20),
(3690, 'Angicos', 20),
(3691, 'Antônio Martins', 20),
(3692, 'Apodi', 20),
(3693, 'Areia Branca', 20),
(3694, 'Arês', 20),
(3695, 'Augusto Severo', 20),
(3696, 'Baía Formosa', 20),
(3697, 'Baraúna', 20),
(3698, 'Barcelona', 20),
(3699, 'Bento Fernandes', 20),
(3700, 'Bodó', 20),
(3701, 'Bom Jesus', 20),
(3702, 'Brejinho', 20),
(3703, 'Caiçara do Norte', 20),
(3704, 'Caiçara do Rio do Vento', 20),
(3705, 'Caicó', 20),
(3706, 'Campo Redondo', 20),
(3707, 'Canguaretama', 20),
(3708, 'Caraúbas', 20),
(3709, 'Carnaúba dos Dantas', 20),
(3710, 'Carnaubais', 20),
(3711, 'Ceará-Mirim', 20),
(3712, 'Cerro Corá', 20),
(3713, 'Coronel Ezequiel', 20),
(3714, 'Coronel João Pessoa', 20),
(3715, 'Cruzeta', 20),
(3716, 'Currais Novos', 20),
(3717, 'Doutor Severiano', 20),
(3718, 'Encanto', 20),
(3719, 'Equador', 20),
(3720, 'Espírito Santo', 20),
(3721, 'Extremoz', 20),
(3722, 'Felipe Guerra', 20),
(3723, 'Fernando Pedroza', 20),
(3724, 'Florânia', 20),
(3725, 'Francisco Dantas', 20),
(3726, 'Frutuoso Gomes', 20),
(3727, 'Galinhos', 20),
(3728, 'Goianinha', 20),
(3729, 'Governador Dix-Sept Rosado', 20),
(3730, 'Grossos', 20),
(3731, 'Guamaré', 20),
(3732, 'Ielmo Marinho', 20),
(3733, 'Ipanguaçu', 20),
(3734, 'Ipueira', 20),
(3735, 'Itajá', 20),
(3736, 'Itaú', 20),
(3737, 'Jaçanã', 20),
(3738, 'Jandaíra', 20),
(3739, 'Janduís', 20),
(3740, 'Januário Cicco', 20),
(3741, 'Japi', 20),
(3742, 'Jardim de Angicos', 20),
(3743, 'Jardim de Piranhas', 20),
(3744, 'Jardim do Seridó', 20),
(3745, 'João Câmara', 20),
(3746, 'João Dias', 20),
(3747, 'José da Penha', 20),
(3748, 'Jucurutu', 20),
(3749, 'Jundiá', 20),
(3750, 'Lagoa d`Anta', 20),
(3751, 'Lagoa de Pedras', 20),
(3752, 'Lagoa de Velhos', 20),
(3753, 'Lagoa Nova', 20),
(3754, 'Lagoa Salgada', 20),
(3755, 'Lajes', 20),
(3756, 'Lajes Pintadas', 20),
(3757, 'Lucrécia', 20),
(3758, 'Luís Gomes', 20),
(3759, 'Macaíba', 20),
(3760, 'Macau', 20),
(3761, 'Major Sales', 20),
(3762, 'Marcelino Vieira', 20),
(3763, 'Martins', 20),
(3764, 'Maxaranguape', 20),
(3765, 'Messias Targino', 20),
(3766, 'Montanhas', 20),
(3767, 'Monte Alegre', 20),
(3768, 'Monte das Gameleiras', 20),
(3769, 'Mossoró', 20),
(3770, 'Natal', 20),
(3771, 'Nísia Floresta', 20),
(3772, 'Nova Cruz', 20),
(3773, 'Olho-d`Água do Borges', 20),
(3774, 'Ouro Branco', 20),
(3775, 'Paraná', 20),
(3776, 'Paraú', 20),
(3777, 'Parazinho', 20),
(3778, 'Parelhas', 20),
(3779, 'Parnamirim', 20),
(3780, 'Passa e Fica', 20),
(3781, 'Passagem', 20),
(3782, 'Patu', 20),
(3783, 'Pau dos Ferros', 20),
(3784, 'Pedra Grande', 20),
(3785, 'Pedra Preta', 20),
(3786, 'Pedro Avelino', 20),
(3787, 'Pedro Velho', 20),
(3788, 'Pendências', 20),
(3789, 'Pilões', 20),
(3790, 'Poço Branco', 20),
(3791, 'Portalegre', 20),
(3792, 'Porto do Mangue', 20),
(3793, 'Presidente Juscelino', 20),
(3794, 'Pureza', 20),
(3795, 'Rafael Fernandes', 20),
(3796, 'Rafael Godeiro', 20),
(3797, 'Riacho da Cruz', 20),
(3798, 'Riacho de Santana', 20),
(3799, 'Riachuelo', 20),
(3800, 'Rio do Fogo', 20),
(3801, 'Rodolfo Fernandes', 20),
(3802, 'Ruy Barbosa', 20),
(3803, 'Santa Cruz', 20),
(3804, 'Santa Maria', 20),
(3805, 'Santana do Matos', 20),
(3806, 'Santana do Seridó', 20),
(3807, 'Santo Antônio', 20),
(3808, 'São Bento do Norte', 20),
(3809, 'São Bento do Trairí', 20),
(3810, 'São Fernando', 20),
(3811, 'São Francisco do Oeste', 20),
(3812, 'São Gonçalo do Amarante', 20),
(3813, 'São João do Sabugi', 20),
(3814, 'São José de Mipibu', 20),
(3815, 'São José do Campestre', 20),
(3816, 'São José do Seridó', 20),
(3817, 'São Miguel', 20),
(3818, 'São Miguel do Gostoso', 20),
(3819, 'São Paulo do Potengi', 20),
(3820, 'São Pedro', 20),
(3821, 'São Rafael', 20),
(3822, 'São Tomé', 20),
(3823, 'São Vicente', 20),
(3824, 'Senador Elói de Souza', 20),
(3825, 'Senador Georgino Avelino', 20),
(3826, 'Serra de São Bento', 20),
(3827, 'Serra do Mel', 20),
(3828, 'Serra Negra do Norte', 20),
(3829, 'Serrinha', 20),
(3830, 'Serrinha dos Pintos', 20),
(3831, 'Severiano Melo', 20),
(3832, 'Sítio Novo', 20),
(3833, 'Taboleiro Grande', 20),
(3834, 'Taipu', 20),
(3835, 'Tangará', 20),
(3836, 'Tenente Ananias', 20),
(3837, 'Tenente Laurentino Cruz', 20),
(3838, 'Tibau', 20),
(3839, 'Tibau do Sul', 20),
(3840, 'Timbaúba dos Batistas', 20),
(3841, 'Touros', 20),
(3842, 'Triunfo Potiguar', 20),
(3843, 'Umarizal', 20),
(3844, 'Upanema', 20),
(3845, 'Várzea', 20),
(3846, 'Venha-Ver', 20),
(3847, 'Vera Cruz', 20),
(3848, 'Viçosa', 20),
(3849, 'Vila Flor', 20),
(3850, 'Aceguá', 23),
(3851, 'Água Santa', 23),
(3852, 'Agudo', 23),
(3853, 'Ajuricaba', 23),
(3854, 'Alecrim', 23),
(3855, 'Alegrete', 23),
(3856, 'Alegria', 23),
(3857, 'Almirante Tamandaré do Sul', 23),
(3858, 'Alpestre', 23),
(3859, 'Alto Alegre', 23),
(3860, 'Alto Feliz', 23),
(3861, 'Alvorada', 23),
(3862, 'Amaral Ferrador', 23),
(3863, 'Ametista do Sul', 23),
(3864, 'André da Rocha', 23),
(3865, 'Anta Gorda', 23),
(3866, 'Antônio Prado', 23),
(3867, 'Arambaré', 23),
(3868, 'Araricá', 23),
(3869, 'Aratiba', 23),
(3870, 'Arroio do Meio', 23),
(3871, 'Arroio do Padre', 23),
(3872, 'Arroio do Sal', 23),
(3873, 'Arroio do Tigre', 23),
(3874, 'Arroio dos Ratos', 23),
(3875, 'Arroio Grande', 23),
(3876, 'Arvorezinha', 23),
(3877, 'Augusto Pestana', 23),
(3878, 'Áurea', 23),
(3879, 'Bagé', 23),
(3880, 'Balneário Pinhal', 23),
(3881, 'Barão', 23),
(3882, 'Barão de Cotegipe', 23),
(3883, 'Barão do Triunfo', 23),
(3884, 'Barra do Guarita', 23),
(3885, 'Barra do Quaraí', 23),
(3886, 'Barra do Ribeiro', 23),
(3887, 'Barra do Rio Azul', 23),
(3888, 'Barra Funda', 23),
(3889, 'Barracão', 23),
(3890, 'Barros Cassal', 23),
(3891, 'Benjamin Constant do Sul', 23),
(3892, 'Bento Gonçalves', 23),
(3893, 'Boa Vista das Missões', 23),
(3894, 'Boa Vista do Buricá', 23),
(3895, 'Boa Vista do Cadeado', 23),
(3896, 'Boa Vista do Incra', 23),
(3897, 'Boa Vista do Sul', 23),
(3898, 'Bom Jesus', 23),
(3899, 'Bom Princípio', 23),
(3900, 'Bom Progresso', 23),
(3901, 'Bom Retiro do Sul', 23),
(3902, 'Boqueirão do Leão', 23),
(3903, 'Bossoroca', 23),
(3904, 'Bozano', 23),
(3905, 'Braga', 23),
(3906, 'Brochier', 23),
(3907, 'Butiá', 23),
(3908, 'Caçapava do Sul', 23),
(3909, 'Cacequi', 23),
(3910, 'Cachoeira do Sul', 23),
(3911, 'Cachoeirinha', 23),
(3912, 'Cacique Doble', 23),
(3913, 'Caibaté', 23),
(3914, 'Caiçara', 23),
(3915, 'Camaquã', 23),
(3916, 'Camargo', 23),
(3917, 'Cambará do Sul', 23),
(3918, 'Campestre da Serra', 23),
(3919, 'Campina das Missões', 23),
(3920, 'Campinas do Sul', 23),
(3921, 'Campo Bom', 23),
(3922, 'Campo Novo', 23),
(3923, 'Campos Borges', 23),
(3924, 'Candelária', 23),
(3925, 'Cândido Godói', 23),
(3926, 'Candiota', 23),
(3927, 'Canela', 23),
(3928, 'Canguçu', 23),
(3929, 'Canoas', 23),
(3930, 'Canudos do Vale', 23),
(3931, 'Capão Bonito do Sul', 23),
(3932, 'Capão da Canoa', 23),
(3933, 'Capão do Cipó', 23),
(3934, 'Capão do Leão', 23),
(3935, 'Capela de Santana', 23),
(3936, 'Capitão', 23),
(3937, 'Capivari do Sul', 23),
(3938, 'Caraá', 23),
(3939, 'Carazinho', 23),
(3940, 'Carlos Barbosa', 23),
(3941, 'Carlos Gomes', 23),
(3942, 'Casca', 23),
(3943, 'Caseiros', 23),
(3944, 'Catuípe', 23),
(3945, 'Caxias do Sul', 23),
(3946, 'Centenário', 23),
(3947, 'Cerrito', 23),
(3948, 'Cerro Branco', 23),
(3949, 'Cerro Grande', 23),
(3950, 'Cerro Grande do Sul', 23),
(3951, 'Cerro Largo', 23),
(3952, 'Chapada', 23),
(3953, 'Charqueadas', 23),
(3954, 'Charrua', 23),
(3955, 'Chiapeta', 23),
(3956, 'Chuí', 23),
(3957, 'Chuvisca', 23),
(3958, 'Cidreira', 23),
(3959, 'Ciríaco', 23),
(3960, 'Colinas', 23),
(3961, 'Colorado', 23),
(3962, 'Condor', 23),
(3963, 'Constantina', 23),
(3964, 'Coqueiro Baixo', 23),
(3965, 'Coqueiros do Sul', 23),
(3966, 'Coronel Barros', 23),
(3967, 'Coronel Bicaco', 23),
(3968, 'Coronel Pilar', 23),
(3969, 'Cotiporã', 23),
(3970, 'Coxilha', 23),
(3971, 'Crissiumal', 23),
(3972, 'Cristal', 23),
(3973, 'Cristal do Sul', 23),
(3974, 'Cruz Alta', 23),
(3975, 'Cruzaltense', 23),
(3976, 'Cruzeiro do Sul', 23);
INSERT INTO `cidade` (`cid_id`, `cid_nome`, `est_id`) VALUES
(3977, 'David Canabarro', 23),
(3978, 'Derrubadas', 23),
(3979, 'Dezesseis de Novembro', 23),
(3980, 'Dilermando de Aguiar', 23),
(3981, 'Dois Irmãos', 23),
(3982, 'Dois Irmãos das Missões', 23),
(3983, 'Dois Lajeados', 23),
(3984, 'Dom Feliciano', 23),
(3985, 'Dom Pedrito', 23),
(3986, 'Dom Pedro de Alcântara', 23),
(3987, 'Dona Francisca', 23),
(3988, 'Doutor Maurício Cardoso', 23),
(3989, 'Doutor Ricardo', 23),
(3990, 'Eldorado do Sul', 23),
(3991, 'Encantado', 23),
(3992, 'Encruzilhada do Sul', 23),
(3993, 'Engenho Velho', 23),
(3994, 'Entre Rios do Sul', 23),
(3995, 'Entre-Ijuís', 23),
(3996, 'Erebango', 23),
(3997, 'Erechim', 23),
(3998, 'Ernestina', 23),
(3999, 'Erval Grande', 23),
(4000, 'Erval Seco', 23),
(4001, 'Esmeralda', 23),
(4002, 'Esperança do Sul', 23),
(4003, 'Espumoso', 23),
(4004, 'Estação', 23),
(4005, 'Estância Velha', 23),
(4006, 'Esteio', 23),
(4007, 'Estrela', 23),
(4008, 'Estrela Velha', 23),
(4009, 'Eugênio de Castro', 23),
(4010, 'Fagundes Varela', 23),
(4011, 'Farroupilha', 23),
(4012, 'Faxinal do Soturno', 23),
(4013, 'Faxinalzinho', 23),
(4014, 'Fazenda Vilanova', 23),
(4015, 'Feliz', 23),
(4016, 'Flores da Cunha', 23),
(4017, 'Floriano Peixoto', 23),
(4018, 'Fontoura Xavier', 23),
(4019, 'Formigueiro', 23),
(4020, 'Forquetinha', 23),
(4021, 'Fortaleza dos Valos', 23),
(4022, 'Frederico Westphalen', 23),
(4023, 'Garibaldi', 23),
(4024, 'Garruchos', 23),
(4025, 'Gaurama', 23),
(4026, 'General Câmara', 23),
(4027, 'Gentil', 23),
(4028, 'Getúlio Vargas', 23),
(4029, 'Giruá', 23),
(4030, 'Glorinha', 23),
(4031, 'Gramado', 23),
(4032, 'Gramado dos Loureiros', 23),
(4033, 'Gramado Xavier', 23),
(4034, 'Gravataí', 23),
(4035, 'Guabiju', 23),
(4036, 'Guaíba', 23),
(4037, 'Guaporé', 23),
(4038, 'Guarani das Missões', 23),
(4039, 'Harmonia', 23),
(4040, 'Herval', 23),
(4041, 'Herveiras', 23),
(4042, 'Horizontina', 23),
(4043, 'Hulha Negra', 23),
(4044, 'Humaitá', 23),
(4045, 'Ibarama', 23),
(4046, 'Ibiaçá', 23),
(4047, 'Ibiraiaras', 23),
(4048, 'Ibirapuitã', 23),
(4049, 'Ibirubá', 23),
(4050, 'Igrejinha', 23),
(4051, 'Ijuí', 23),
(4052, 'Ilópolis', 23),
(4053, 'Imbé', 23),
(4054, 'Imigrante', 23),
(4055, 'Independência', 23),
(4056, 'Inhacorá', 23),
(4057, 'Ipê', 23),
(4058, 'Ipiranga do Sul', 23),
(4059, 'Iraí', 23),
(4060, 'Itaara', 23),
(4061, 'Itacurubi', 23),
(4062, 'Itapuca', 23),
(4063, 'Itaqui', 23),
(4064, 'Itati', 23),
(4065, 'Itatiba do Sul', 23),
(4066, 'Ivorá', 23),
(4067, 'Ivoti', 23),
(4068, 'Jaboticaba', 23),
(4069, 'Jacuizinho', 23),
(4070, 'Jacutinga', 23),
(4071, 'Jaguarão', 23),
(4072, 'Jaguari', 23),
(4073, 'Jaquirana', 23),
(4074, 'Jari', 23),
(4075, 'Jóia', 23),
(4076, 'Júlio de Castilhos', 23),
(4077, 'Lagoa Bonita do Sul', 23),
(4078, 'Lagoa dos Três Cantos', 23),
(4079, 'Lagoa Vermelha', 23),
(4080, 'Lagoão', 23),
(4081, 'Lajeado', 23),
(4082, 'Lajeado do Bugre', 23),
(4083, 'Lavras do Sul', 23),
(4084, 'Liberato Salzano', 23),
(4085, 'Lindolfo Collor', 23),
(4086, 'Linha Nova', 23),
(4087, 'Maçambara', 23),
(4088, 'Machadinho', 23),
(4089, 'Mampituba', 23),
(4090, 'Manoel Viana', 23),
(4091, 'Maquiné', 23),
(4092, 'Maratá', 23),
(4093, 'Marau', 23),
(4094, 'Marcelino Ramos', 23),
(4095, 'Mariana Pimentel', 23),
(4096, 'Mariano Moro', 23),
(4097, 'Marques de Souza', 23),
(4098, 'Mata', 23),
(4099, 'Mato Castelhano', 23),
(4100, 'Mato Leitão', 23),
(4101, 'Mato Queimado', 23),
(4102, 'Maximiliano de Almeida', 23),
(4103, 'Minas do Leão', 23),
(4104, 'Miraguaí', 23),
(4105, 'Montauri', 23),
(4106, 'Monte Alegre dos Campos', 23),
(4107, 'Monte Belo do Sul', 23),
(4108, 'Montenegro', 23),
(4109, 'Mormaço', 23),
(4110, 'Morrinhos do Sul', 23),
(4111, 'Morro Redondo', 23),
(4112, 'Morro Reuter', 23),
(4113, 'Mostardas', 23),
(4114, 'Muçum', 23),
(4115, 'Muitos Capões', 23),
(4116, 'Muliterno', 23),
(4117, 'Não-Me-Toque', 23),
(4118, 'Nicolau Vergueiro', 23),
(4119, 'Nonoai', 23),
(4120, 'Nova Alvorada', 23),
(4121, 'Nova Araçá', 23),
(4122, 'Nova Bassano', 23),
(4123, 'Nova Boa Vista', 23),
(4124, 'Nova Bréscia', 23),
(4125, 'Nova Candelária', 23),
(4126, 'Nova Esperança do Sul', 23),
(4127, 'Nova Hartz', 23),
(4128, 'Nova Pádua', 23),
(4129, 'Nova Palma', 23),
(4130, 'Nova Petrópolis', 23),
(4131, 'Nova Prata', 23),
(4132, 'Nova Ramada', 23),
(4133, 'Nova Roma do Sul', 23),
(4134, 'Nova Santa Rita', 23),
(4135, 'Novo Barreiro', 23),
(4136, 'Novo Cabrais', 23),
(4137, 'Novo Hamburgo', 23),
(4138, 'Novo Machado', 23),
(4139, 'Novo Tiradentes', 23),
(4140, 'Novo Xingu', 23),
(4141, 'Osório', 23),
(4142, 'Paim Filho', 23),
(4143, 'Palmares do Sul', 23),
(4144, 'Palmeira das Missões', 23),
(4145, 'Palmitinho', 23),
(4146, 'Panambi', 23),
(4147, 'Pantano Grande', 23),
(4148, 'Paraí', 23),
(4149, 'Paraíso do Sul', 23),
(4150, 'Pareci Novo', 23),
(4151, 'Parobé', 23),
(4152, 'Passa Sete', 23),
(4153, 'Passo do Sobrado', 23),
(4154, 'Passo Fundo', 23),
(4155, 'Paulo Bento', 23),
(4156, 'Paverama', 23),
(4157, 'Pedras Altas', 23),
(4158, 'Pedro Osório', 23),
(4159, 'Pejuçara', 23),
(4160, 'Pelotas', 23),
(4161, 'Picada Café', 23),
(4162, 'Pinhal', 23),
(4163, 'Pinhal da Serra', 23),
(4164, 'Pinhal Grande', 23),
(4165, 'Pinheirinho do Vale', 23),
(4166, 'Pinheiro Machado', 23),
(4167, 'Pirapó', 23),
(4168, 'Piratini', 23),
(4169, 'Planalto', 23),
(4170, 'Poço das Antas', 23),
(4171, 'Pontão', 23),
(4172, 'Ponte Preta', 23),
(4173, 'Portão', 23),
(4174, 'Porto Alegre', 23),
(4175, 'Porto Lucena', 23),
(4176, 'Porto Mauá', 23),
(4177, 'Porto Vera Cruz', 23),
(4178, 'Porto Xavier', 23),
(4179, 'Pouso Novo', 23),
(4180, 'Presidente Lucena', 23),
(4181, 'Progresso', 23),
(4182, 'Protásio Alves', 23),
(4183, 'Putinga', 23),
(4184, 'Quaraí', 23),
(4185, 'Quatro Irmãos', 23),
(4186, 'Quevedos', 23),
(4187, 'Quinze de Novembro', 23),
(4188, 'Redentora', 23),
(4189, 'Relvado', 23),
(4190, 'Restinga Seca', 23),
(4191, 'Rio dos Índios', 23),
(4192, 'Rio Grande', 23),
(4193, 'Rio Pardo', 23),
(4194, 'Riozinho', 23),
(4195, 'Roca Sales', 23),
(4196, 'Rodeio Bonito', 23),
(4197, 'Rolador', 23),
(4198, 'Rolante', 23),
(4199, 'Ronda Alta', 23),
(4200, 'Rondinha', 23),
(4201, 'Roque Gonzales', 23),
(4202, 'Rosário do Sul', 23),
(4203, 'Sagrada Família', 23),
(4204, 'Saldanha Marinho', 23),
(4205, 'Salto do Jacuí', 23),
(4206, 'Salvador das Missões', 23),
(4207, 'Salvador do Sul', 23),
(4208, 'Sananduva', 23),
(4209, 'Santa Bárbara do Sul', 23),
(4210, 'Santa Cecília do Sul', 23),
(4211, 'Santa Clara do Sul', 23),
(4212, 'Santa Cruz do Sul', 23),
(4213, 'Santa Margarida do Sul', 23),
(4214, 'Santa Maria', 23),
(4215, 'Santa Maria do Herval', 23),
(4216, 'Santa Rosa', 23),
(4217, 'Santa Tereza', 23),
(4218, 'Santa Vitória do Palmar', 23),
(4219, 'Santana da Boa Vista', 23),
(4220, 'Santana do Livramento', 23),
(4221, 'Santiago', 23),
(4222, 'Santo Ângelo', 23),
(4223, 'Santo Antônio da Patrulha', 23),
(4224, 'Santo Antônio das Missões', 23),
(4225, 'Santo Antônio do Palma', 23),
(4226, 'Santo Antônio do Planalto', 23),
(4227, 'Santo Augusto', 23),
(4228, 'Santo Cristo', 23),
(4229, 'Santo Expedito do Sul', 23),
(4230, 'São Borja', 23),
(4231, 'São Domingos do Sul', 23),
(4232, 'São Francisco de Assis', 23),
(4233, 'São Francisco de Paula', 23),
(4234, 'São Gabriel', 23),
(4235, 'São Jerônimo', 23),
(4236, 'São João da Urtiga', 23),
(4237, 'São João do Polêsine', 23),
(4238, 'São Jorge', 23),
(4239, 'São José das Missões', 23),
(4240, 'São José do Herval', 23),
(4241, 'São José do Hortêncio', 23),
(4242, 'São José do Inhacorá', 23),
(4243, 'São José do Norte', 23),
(4244, 'São José do Ouro', 23),
(4245, 'São José do Sul', 23),
(4246, 'São José dos Ausentes', 23),
(4247, 'São Leopoldo', 23),
(4248, 'São Lourenço do Sul', 23),
(4249, 'São Luiz Gonzaga', 23),
(4250, 'São Marcos', 23),
(4251, 'São Martinho', 23),
(4252, 'São Martinho da Serra', 23),
(4253, 'São Miguel das Missões', 23),
(4254, 'São Nicolau', 23),
(4255, 'São Paulo das Missões', 23),
(4256, 'São Pedro da Serra', 23),
(4257, 'São Pedro das Missões', 23),
(4258, 'São Pedro do Butiá', 23),
(4259, 'São Pedro do Sul', 23),
(4260, 'São Sebastião do Caí', 23),
(4261, 'São Sepé', 23),
(4262, 'São Valentim', 23),
(4263, 'São Valentim do Sul', 23),
(4264, 'São Valério do Sul', 23),
(4265, 'São Vendelino', 23),
(4266, 'São Vicente do Sul', 23),
(4267, 'Sapiranga', 23),
(4268, 'Sapucaia do Sul', 23),
(4269, 'Sarandi', 23),
(4270, 'Seberi', 23),
(4271, 'Sede Nova', 23),
(4272, 'Segredo', 23),
(4273, 'Selbach', 23),
(4274, 'Senador Salgado Filho', 23),
(4275, 'Sentinela do Sul', 23),
(4276, 'Serafina Corrêa', 23),
(4277, 'Sério', 23),
(4278, 'Sertão', 23),
(4279, 'Sertão Santana', 23),
(4280, 'Sete de Setembro', 23),
(4281, 'Severiano de Almeida', 23),
(4282, 'Silveira Martins', 23),
(4283, 'Sinimbu', 23),
(4284, 'Sobradinho', 23),
(4285, 'Soledade', 23),
(4286, 'Tabaí', 23),
(4287, 'Tapejara', 23),
(4288, 'Tapera', 23),
(4289, 'Tapes', 23),
(4290, 'Taquara', 23),
(4291, 'Taquari', 23),
(4292, 'Taquaruçu do Sul', 23),
(4293, 'Tavares', 23),
(4294, 'Tenente Portela', 23),
(4295, 'Terra de Areia', 23),
(4296, 'Teutônia', 23),
(4297, 'Tio Hugo', 23),
(4298, 'Tiradentes do Sul', 23),
(4299, 'Toropi', 23),
(4300, 'Torres', 23),
(4301, 'Tramandaí', 23),
(4302, 'Travesseiro', 23),
(4303, 'Três Arroios', 23),
(4304, 'Três Cachoeiras', 23),
(4305, 'Três Coroas', 23),
(4306, 'Três de Maio', 23),
(4307, 'Três Forquilhas', 23),
(4308, 'Três Palmeiras', 23),
(4309, 'Três Passos', 23),
(4310, 'Trindade do Sul', 23),
(4311, 'Triunfo', 23),
(4312, 'Tucunduva', 23),
(4313, 'Tunas', 23),
(4314, 'Tupanci do Sul', 23),
(4315, 'Tupanciretã', 23),
(4316, 'Tupandi', 23),
(4317, 'Tuparendi', 23),
(4318, 'Turuçu', 23),
(4319, 'Ubiretama', 23),
(4320, 'União da Serra', 23),
(4321, 'Unistalda', 23),
(4322, 'Uruguaiana', 23),
(4323, 'Vacaria', 23),
(4324, 'Vale do Sol', 23),
(4325, 'Vale Real', 23),
(4326, 'Vale Verde', 23),
(4327, 'Vanini', 23),
(4328, 'Venâncio Aires', 23),
(4329, 'Vera Cruz', 23),
(4330, 'Veranópolis', 23),
(4331, 'Vespasiano Correa', 23),
(4332, 'Viadutos', 23),
(4333, 'Viamão', 23),
(4334, 'Vicente Dutra', 23),
(4335, 'Victor Graeff', 23),
(4336, 'Vila Flores', 23),
(4337, 'Vila Lângaro', 23),
(4338, 'Vila Maria', 23),
(4339, 'Vila Nova do Sul', 23),
(4340, 'Vista Alegre', 23),
(4341, 'Vista Alegre do Prata', 23),
(4342, 'Vista Gaúcha', 23),
(4343, 'Vitória das Missões', 23),
(4344, 'Westfália', 23),
(4345, 'Xangri-lá', 23),
(4346, 'Alta Floresta d`Oeste', 21),
(4347, 'Alto Alegre dos Parecis', 21),
(4348, 'Alto Paraíso', 21),
(4349, 'Alvorada d`Oeste', 21),
(4350, 'Ariquemes', 21),
(4351, 'Buritis', 21),
(4352, 'Cabixi', 21),
(4353, 'Cacaulândia', 21),
(4354, 'Cacoal', 21),
(4355, 'Campo Novo de Rondônia', 21),
(4356, 'Candeias do Jamari', 21),
(4357, 'Castanheiras', 21),
(4358, 'Cerejeiras', 21),
(4359, 'Chupinguaia', 21),
(4360, 'Colorado do Oeste', 21),
(4361, 'Corumbiara', 21),
(4362, 'Costa Marques', 21),
(4363, 'Cujubim', 21),
(4364, 'Espigão d`Oeste', 21),
(4365, 'Governador Jorge Teixeira', 21),
(4366, 'Guajará-Mirim', 21),
(4367, 'Itapuã do Oeste', 21),
(4368, 'Jaru', 21),
(4369, 'Ji-Paraná', 21),
(4370, 'Machadinho d`Oeste', 21),
(4371, 'Ministro Andreazza', 21),
(4372, 'Mirante da Serra', 21),
(4373, 'Monte Negro', 21),
(4374, 'Nova Brasilândia d`Oeste', 21),
(4375, 'Nova Mamoré', 21),
(4376, 'Nova União', 21),
(4377, 'Novo Horizonte do Oeste', 21),
(4378, 'Ouro Preto do Oeste', 21),
(4379, 'Parecis', 21),
(4380, 'Pimenta Bueno', 21),
(4381, 'Pimenteiras do Oeste', 21),
(4382, 'Porto Velho', 21),
(4383, 'Presidente Médici', 21),
(4384, 'Primavera de Rondônia', 21),
(4385, 'Rio Crespo', 21),
(4386, 'Rolim de Moura', 21),
(4387, 'Santa Luzia d`Oeste', 21),
(4388, 'São Felipe d`Oeste', 21),
(4389, 'São Francisco do Guaporé', 21),
(4390, 'São Miguel do Guaporé', 21),
(4391, 'Seringueiras', 21),
(4392, 'Teixeirópolis', 21),
(4393, 'Theobroma', 21),
(4394, 'Urupá', 21),
(4395, 'Vale do Anari', 21),
(4396, 'Vale do Paraíso', 21),
(4397, 'Vilhena', 21),
(4398, 'Alto Alegre', 22),
(4399, 'Amajari', 22),
(4400, 'Boa Vista', 22),
(4401, 'Bonfim', 22),
(4402, 'Cantá', 22),
(4403, 'Caracaraí', 22),
(4404, 'Caroebe', 22),
(4405, 'Iracema', 22),
(4406, 'Mucajaí', 22),
(4407, 'Normandia', 22),
(4408, 'Pacaraima', 22),
(4409, 'Rorainópolis', 22),
(4410, 'São João da Baliza', 22),
(4411, 'São Luiz', 22),
(4412, 'Uiramutã', 22),
(4413, 'Abdon Batista', 24),
(4414, 'Abelardo Luz', 24),
(4415, 'Agrolândia', 24),
(4416, 'Agronômica', 24),
(4417, 'Água Doce', 24),
(4418, 'Águas de Chapecó', 24),
(4419, 'Águas Frias', 24),
(4420, 'Águas Mornas', 24),
(4421, 'Alfredo Wagner', 24),
(4422, 'Alto Bela Vista', 24),
(4423, 'Anchieta', 24),
(4424, 'Angelina', 24),
(4425, 'Anita Garibaldi', 24),
(4426, 'Anitápolis', 24),
(4427, 'Antônio Carlos', 24),
(4428, 'Apiúna', 24),
(4429, 'Arabutã', 24),
(4430, 'Araquari', 24),
(4431, 'Araranguá', 24),
(4432, 'Armazém', 24),
(4433, 'Arroio Trinta', 24),
(4434, 'Arvoredo', 24),
(4435, 'Ascurra', 24),
(4436, 'Atalanta', 24),
(4437, 'Aurora', 24),
(4438, 'Balneário Arroio do Silva', 24),
(4439, 'Balneário Barra do Sul', 24),
(4440, 'Balneário Camboriú', 24),
(4441, 'Balneário Gaivota', 24),
(4442, 'Bandeirante', 24),
(4443, 'Barra Bonita', 24),
(4444, 'Barra Velha', 24),
(4445, 'Bela Vista do Toldo', 24),
(4446, 'Belmonte', 24),
(4447, 'Benedito Novo', 24),
(4448, 'Biguaçu', 24),
(4449, 'Blumenau', 24),
(4450, 'Bocaina do Sul', 24),
(4451, 'Bom Jardim da Serra', 24),
(4452, 'Bom Jesus', 24),
(4453, 'Bom Jesus do Oeste', 24),
(4454, 'Bom Retiro', 24),
(4455, 'Bombinhas', 24),
(4456, 'Botuverá', 24),
(4457, 'Braço do Norte', 24),
(4458, 'Braço do Trombudo', 24),
(4459, 'Brunópolis', 24),
(4460, 'Brusque', 24),
(4461, 'Caçador', 24),
(4462, 'Caibi', 24),
(4463, 'Calmon', 24),
(4464, 'Camboriú', 24),
(4465, 'Campo Alegre', 24),
(4466, 'Campo Belo do Sul', 24),
(4467, 'Campo Erê', 24),
(4468, 'Campos Novos', 24),
(4469, 'Canelinha', 24),
(4470, 'Canoinhas', 24),
(4471, 'Capão Alto', 24),
(4472, 'Capinzal', 24),
(4473, 'Capivari de Baixo', 24),
(4474, 'Catanduvas', 24),
(4475, 'Caxambu do Sul', 24),
(4476, 'Celso Ramos', 24),
(4477, 'Cerro Negro', 24),
(4478, 'Chapadão do Lageado', 24),
(4479, 'Chapecó', 24),
(4480, 'Cocal do Sul', 24),
(4481, 'Concórdia', 24),
(4482, 'Cordilheira Alta', 24),
(4483, 'Coronel Freitas', 24),
(4484, 'Coronel Martins', 24),
(4485, 'Correia Pinto', 24),
(4486, 'Corupá', 24),
(4487, 'Criciúma', 24),
(4488, 'Cunha Porã', 24),
(4489, 'Cunhataí', 24),
(4490, 'Curitibanos', 24),
(4491, 'Descanso', 24),
(4492, 'Dionísio Cerqueira', 24),
(4493, 'Dona Emma', 24),
(4494, 'Doutor Pedrinho', 24),
(4495, 'Entre Rios', 24),
(4496, 'Ermo', 24),
(4497, 'Erval Velho', 24),
(4498, 'Faxinal dos Guedes', 24),
(4499, 'Flor do Sertão', 24),
(4500, 'Florianópolis', 24),
(4501, 'Formosa do Sul', 24),
(4502, 'Forquilhinha', 24),
(4503, 'Fraiburgo', 24),
(4504, 'Frei Rogério', 24),
(4505, 'Galvão', 24),
(4506, 'Garopaba', 24),
(4507, 'Garuva', 24),
(4508, 'Gaspar', 24),
(4509, 'Governador Celso Ramos', 24),
(4510, 'Grão Pará', 24),
(4511, 'Gravatal', 24),
(4512, 'Guabiruba', 24),
(4513, 'Guaraciaba', 24),
(4514, 'Guaramirim', 24),
(4515, 'Guarujá do Sul', 24),
(4516, 'Guatambú', 24),
(4517, 'Herval d`Oeste', 24),
(4518, 'Ibiam', 24),
(4519, 'Ibicaré', 24),
(4520, 'Ibirama', 24),
(4521, 'Içara', 24),
(4522, 'Ilhota', 24),
(4523, 'Imaruí', 24),
(4524, 'Imbituba', 24),
(4525, 'Imbuia', 24),
(4526, 'Indaial', 24),
(4527, 'Iomerê', 24),
(4528, 'Ipira', 24),
(4529, 'Iporã do Oeste', 24),
(4530, 'Ipuaçu', 24),
(4531, 'Ipumirim', 24),
(4532, 'Iraceminha', 24),
(4533, 'Irani', 24),
(4534, 'Irati', 24),
(4535, 'Irineópolis', 24),
(4536, 'Itá', 24),
(4537, 'Itaiópolis', 24),
(4538, 'Itajaí', 24),
(4539, 'Itapema', 24),
(4540, 'Itapiranga', 24),
(4541, 'Itapoá', 24),
(4542, 'Ituporanga', 24),
(4543, 'Jaborá', 24),
(4544, 'Jacinto Machado', 24),
(4545, 'Jaguaruna', 24),
(4546, 'Jaraguá do Sul', 24),
(4547, 'Jardinópolis', 24),
(4548, 'Joaçaba', 24),
(4549, 'Joinville', 24),
(4550, 'José Boiteux', 24),
(4551, 'Jupiá', 24),
(4552, 'Lacerdópolis', 24),
(4553, 'Lages', 24),
(4554, 'Laguna', 24),
(4555, 'Lajeado Grande', 24),
(4556, 'Laurentino', 24),
(4557, 'Lauro Muller', 24),
(4558, 'Lebon Régis', 24),
(4559, 'Leoberto Leal', 24),
(4560, 'Lindóia do Sul', 24),
(4561, 'Lontras', 24),
(4562, 'Luiz Alves', 24),
(4563, 'Luzerna', 24),
(4564, 'Macieira', 24),
(4565, 'Mafra', 24),
(4566, 'Major Gercino', 24),
(4567, 'Major Vieira', 24),
(4568, 'Maracajá', 24),
(4569, 'Maravilha', 24),
(4570, 'Marema', 24),
(4571, 'Massaranduba', 24),
(4572, 'Matos Costa', 24),
(4573, 'Meleiro', 24),
(4574, 'Mirim Doce', 24),
(4575, 'Modelo', 24),
(4576, 'Mondaí', 24),
(4577, 'Monte Carlo', 24),
(4578, 'Monte Castelo', 24),
(4579, 'Morro da Fumaça', 24),
(4580, 'Morro Grande', 24),
(4581, 'Navegantes', 24),
(4582, 'Nova Erechim', 24),
(4583, 'Nova Itaberaba', 24),
(4584, 'Nova Trento', 24),
(4585, 'Nova Veneza', 24),
(4586, 'Novo Horizonte', 24),
(4587, 'Orleans', 24),
(4588, 'Otacílio Costa', 24),
(4589, 'Ouro', 24),
(4590, 'Ouro Verde', 24),
(4591, 'Paial', 24),
(4592, 'Painel', 24),
(4593, 'Palhoça', 24),
(4594, 'Palma Sola', 24),
(4595, 'Palmeira', 24),
(4596, 'Palmitos', 24),
(4597, 'Papanduva', 24),
(4598, 'Paraíso', 24),
(4599, 'Passo de Torres', 24),
(4600, 'Passos Maia', 24),
(4601, 'Paulo Lopes', 24),
(4602, 'Pedras Grandes', 24),
(4603, 'Penha', 24),
(4604, 'Peritiba', 24),
(4605, 'Petrolândia', 24),
(4606, 'Piçarras', 24),
(4607, 'Pinhalzinho', 24),
(4608, 'Pinheiro Preto', 24),
(4609, 'Piratuba', 24),
(4610, 'Planalto Alegre', 24),
(4611, 'Pomerode', 24),
(4612, 'Ponte Alta', 24),
(4613, 'Ponte Alta do Norte', 24),
(4614, 'Ponte Serrada', 24),
(4615, 'Porto Belo', 24),
(4616, 'Porto União', 24),
(4617, 'Pouso Redondo', 24),
(4618, 'Praia Grande', 24),
(4619, 'Presidente Castelo Branco', 24),
(4620, 'Presidente Getúlio', 24),
(4621, 'Presidente Nereu', 24),
(4622, 'Princesa', 24),
(4623, 'Quilombo', 24),
(4624, 'Rancho Queimado', 24),
(4625, 'Rio das Antas', 24),
(4626, 'Rio do Campo', 24),
(4627, 'Rio do Oeste', 24),
(4628, 'Rio do Sul', 24),
(4629, 'Rio dos Cedros', 24),
(4630, 'Rio Fortuna', 24),
(4631, 'Rio Negrinho', 24),
(4632, 'Rio Rufino', 24),
(4633, 'Riqueza', 24),
(4634, 'Rodeio', 24),
(4635, 'Romelândia', 24),
(4636, 'Salete', 24),
(4637, 'Saltinho', 24),
(4638, 'Salto Veloso', 24),
(4639, 'Sangão', 24),
(4640, 'Santa Cecília', 24),
(4641, 'Santa Helena', 24),
(4642, 'Santa Rosa de Lima', 24),
(4643, 'Santa Rosa do Sul', 24),
(4644, 'Santa Terezinha', 24),
(4645, 'Santa Terezinha do Progresso', 24),
(4646, 'Santiago do Sul', 24),
(4647, 'Santo Amaro da Imperatriz', 24),
(4648, 'São Bento do Sul', 24),
(4649, 'São Bernardino', 24),
(4650, 'São Bonifácio', 24),
(4651, 'São Carlos', 24),
(4652, 'São Cristovão do Sul', 24),
(4653, 'São Domingos', 24),
(4654, 'São Francisco do Sul', 24),
(4655, 'São João Batista', 24),
(4656, 'São João do Itaperiú', 24),
(4657, 'São João do Oeste', 24),
(4658, 'São João do Sul', 24),
(4659, 'São Joaquim', 24),
(4660, 'São José', 24),
(4661, 'São José do Cedro', 24),
(4662, 'São José do Cerrito', 24),
(4663, 'São Lourenço do Oeste', 24),
(4664, 'São Ludgero', 24),
(4665, 'São Martinho', 24),
(4666, 'São Miguel da Boa Vista', 24),
(4667, 'São Miguel do Oeste', 24),
(4668, 'São Pedro de Alcântara', 24),
(4669, 'Saudades', 24),
(4670, 'Schroeder', 24),
(4671, 'Seara', 24),
(4672, 'Serra Alta', 24),
(4673, 'Siderópolis', 24),
(4674, 'Sombrio', 24),
(4675, 'Sul Brasil', 24),
(4676, 'Taió', 24),
(4677, 'Tangará', 24),
(4678, 'Tigrinhos', 24),
(4679, 'Tijucas', 24),
(4680, 'Timbé do Sul', 24),
(4681, 'Timbó', 24),
(4682, 'Timbó Grande', 24),
(4683, 'Três Barras', 24),
(4684, 'Treviso', 24),
(4685, 'Treze de Maio', 24),
(4686, 'Treze Tílias', 24),
(4687, 'Trombudo Central', 24),
(4688, 'Tubarão', 24),
(4689, 'Tunápolis', 24),
(4690, 'Turvo', 24),
(4691, 'União do Oeste', 24),
(4692, 'Urubici', 24),
(4693, 'Urupema', 24),
(4694, 'Urussanga', 24),
(4695, 'Vargeão', 24),
(4696, 'Vargem', 24),
(4697, 'Vargem Bonita', 24),
(4698, 'Vidal Ramos', 24),
(4699, 'Videira', 24),
(4700, 'Vitor Meireles', 24),
(4701, 'Witmarsum', 24),
(4702, 'Xanxerê', 24),
(4703, 'Xavantina', 24),
(4704, 'Xaxim', 24),
(4705, 'Zortéa', 24),
(4706, 'Adamantina', 26),
(4707, 'Adolfo', 26),
(4708, 'Aguaí', 26),
(4709, 'Águas da Prata', 26),
(4710, 'Águas de Lindóia', 26),
(4711, 'Águas de Santa Bárbara', 26),
(4712, 'Águas de São Pedro', 26),
(4713, 'Agudos', 26),
(4714, 'Alambari', 26),
(4715, 'Alfredo Marcondes', 26),
(4716, 'Altair', 26),
(4717, 'Altinópolis', 26),
(4718, 'Alto Alegre', 26),
(4719, 'Alumínio', 26),
(4720, 'Álvares Florence', 26),
(4721, 'Álvares Machado', 26),
(4722, 'Álvaro de Carvalho', 26),
(4723, 'Alvinlândia', 26),
(4724, 'Americana', 26),
(4725, 'Américo Brasiliense', 26),
(4726, 'Américo de Campos', 26),
(4727, 'Amparo', 26),
(4728, 'Analândia', 26),
(4729, 'Andradina', 26),
(4730, 'Angatuba', 26),
(4731, 'Anhembi', 26),
(4732, 'Anhumas', 26),
(4733, 'Aparecida', 26),
(4734, 'Aparecida d`Oeste', 26),
(4735, 'Apiaí', 26),
(4736, 'Araçariguama', 26),
(4737, 'Araçatuba', 26),
(4738, 'Araçoiaba da Serra', 26),
(4739, 'Aramina', 26),
(4740, 'Arandu', 26),
(4741, 'Arapeí', 26),
(4742, 'Araraquara', 26),
(4743, 'Araras', 26),
(4744, 'Arco-Íris', 26),
(4745, 'Arealva', 26),
(4746, 'Areias', 26),
(4747, 'Areiópolis', 26),
(4748, 'Ariranha', 26),
(4749, 'Artur Nogueira', 26),
(4750, 'Arujá', 26),
(4751, 'Aspásia', 26),
(4752, 'Assis', 26),
(4753, 'Atibaia', 26),
(4754, 'Auriflama', 26),
(4755, 'Avaí', 26),
(4756, 'Avanhandava', 26),
(4757, 'Avaré', 26),
(4758, 'Bady Bassitt', 26),
(4759, 'Balbinos', 26),
(4760, 'Bálsamo', 26),
(4761, 'Bananal', 26),
(4762, 'Barão de Antonina', 26),
(4763, 'Barbosa', 26),
(4764, 'Bariri', 26),
(4765, 'Barra Bonita', 26),
(4766, 'Barra do Chapéu', 26),
(4767, 'Barra do Turvo', 26),
(4768, 'Barretos', 26),
(4769, 'Barrinha', 26),
(4770, 'Barueri', 26),
(4771, 'Bastos', 26),
(4772, 'Batatais', 26),
(4773, 'Bauru', 26),
(4774, 'Bebedouro', 26),
(4775, 'Bento de Abreu', 26),
(4776, 'Bernardino de Campos', 26),
(4777, 'Bertioga', 26),
(4778, 'Bilac', 26),
(4779, 'Birigui', 26),
(4780, 'Biritiba-Mirim', 26),
(4781, 'Boa Esperança do Sul', 26),
(4782, 'Bocaina', 26),
(4783, 'Bofete', 26),
(4784, 'Boituva', 26),
(4785, 'Bom Jesus dos Perdões', 26),
(4786, 'Bom Sucesso de Itararé', 26),
(4787, 'Borá', 26),
(4788, 'Boracéia', 26),
(4789, 'Borborema', 26),
(4790, 'Borebi', 26),
(4791, 'Botucatu', 26),
(4792, 'Bragança Paulista', 26),
(4793, 'Braúna', 26),
(4794, 'Brejo Alegre', 26),
(4795, 'Brodowski', 26),
(4796, 'Brotas', 26),
(4797, 'Buri', 26),
(4798, 'Buritama', 26),
(4799, 'Buritizal', 26),
(4800, 'Cabrália Paulista', 26),
(4801, 'Cabreúva', 26),
(4802, 'Caçapava', 26),
(4803, 'Cachoeira Paulista', 26),
(4804, 'Caconde', 26),
(4805, 'Cafelândia', 26),
(4806, 'Caiabu', 26),
(4807, 'Caieiras', 26),
(4808, 'Caiuá', 26),
(4809, 'Cajamar', 26),
(4810, 'Cajati', 26),
(4811, 'Cajobi', 26),
(4812, 'Cajuru', 26),
(4813, 'Campina do Monte Alegre', 26),
(4814, 'Campinas', 26),
(4815, 'Campo Limpo Paulista', 26),
(4816, 'Campos do Jordão', 26),
(4817, 'Campos Novos Paulista', 26),
(4818, 'Cananéia', 26),
(4819, 'Canas', 26),
(4820, 'Cândido Mota', 26),
(4821, 'Cândido Rodrigues', 26),
(4822, 'Canitar', 26),
(4823, 'Capão Bonito', 26),
(4824, 'Capela do Alto', 26),
(4825, 'Capivari', 26),
(4826, 'Caraguatatuba', 26),
(4827, 'Carapicuíba', 26),
(4828, 'Cardoso', 26),
(4829, 'Casa Branca', 26),
(4830, 'Cássia dos Coqueiros', 26),
(4831, 'Castilho', 26),
(4832, 'Catanduva', 26),
(4833, 'Catiguá', 26),
(4834, 'Cedral', 26),
(4835, 'Cerqueira César', 26),
(4836, 'Cerquilho', 26),
(4837, 'Cesário Lange', 26),
(4838, 'Charqueada', 26),
(4839, 'Chavantes', 26),
(4840, 'Clementina', 26),
(4841, 'Colina', 26),
(4842, 'Colômbia', 26),
(4843, 'Conchal', 26),
(4844, 'Conchas', 26),
(4845, 'Cordeirópolis', 26),
(4846, 'Coroados', 26),
(4847, 'Coronel Macedo', 26),
(4848, 'Corumbataí', 26),
(4849, 'Cosmópolis', 26),
(4850, 'Cosmorama', 26),
(4851, 'Cotia', 26),
(4852, 'Cravinhos', 26),
(4853, 'Cristais Paulista', 26),
(4854, 'Cruzália', 26),
(4855, 'Cruzeiro', 26),
(4856, 'Cubatão', 26),
(4857, 'Cunha', 26),
(4858, 'Descalvado', 26),
(4859, 'Diadema', 26),
(4860, 'Dirce Reis', 26),
(4861, 'Divinolândia', 26),
(4862, 'Dobrada', 26),
(4863, 'Dois Córregos', 26),
(4864, 'Dolcinópolis', 26),
(4865, 'Dourado', 26),
(4866, 'Dracena', 26),
(4867, 'Duartina', 26),
(4868, 'Dumont', 26),
(4869, 'Echaporã', 26),
(4870, 'Eldorado', 26),
(4871, 'Elias Fausto', 26),
(4872, 'Elisiário', 26),
(4873, 'Embaúba', 26),
(4874, 'Embu', 26),
(4875, 'Embu-Guaçu', 26),
(4876, 'Emilianópolis', 26),
(4877, 'Engenheiro Coelho', 26),
(4878, 'Espírito Santo do Pinhal', 26),
(4879, 'Espírito Santo do Turvo', 26),
(4880, 'Estiva Gerbi', 26),
(4881, 'Estrela d`Oeste', 26),
(4882, 'Estrela do Norte', 26),
(4883, 'Euclides da Cunha Paulista', 26),
(4884, 'Fartura', 26),
(4885, 'Fernando Prestes', 26),
(4886, 'Fernandópolis', 26),
(4887, 'Fernão', 26),
(4888, 'Ferraz de Vasconcelos', 26),
(4889, 'Flora Rica', 26),
(4890, 'Floreal', 26),
(4891, 'Flórida Paulista', 26),
(4892, 'Florínia', 26),
(4893, 'Franca', 26),
(4894, 'Francisco Morato', 26),
(4895, 'Franco da Rocha', 26),
(4896, 'Gabriel Monteiro', 26),
(4897, 'Gália', 26),
(4898, 'Garça', 26),
(4899, 'Gastão Vidigal', 26),
(4900, 'Gavião Peixoto', 26),
(4901, 'General Salgado', 26),
(4902, 'Getulina', 26),
(4903, 'Glicério', 26),
(4904, 'Guaiçara', 26),
(4905, 'Guaimbê', 26),
(4906, 'Guaíra', 26),
(4907, 'Guapiaçu', 26),
(4908, 'Guapiara', 26),
(4909, 'Guará', 26),
(4910, 'Guaraçaí', 26),
(4911, 'Guaraci', 26),
(4912, 'Guarani d`Oeste', 26),
(4913, 'Guarantã', 26),
(4914, 'Guararapes', 26),
(4915, 'Guararema', 26),
(4916, 'Guaratinguetá', 26),
(4917, 'Guareí', 26),
(4918, 'Guariba', 26),
(4919, 'Guarujá', 26),
(4920, 'Guarulhos', 26),
(4921, 'Guatapará', 26),
(4922, 'Guzolândia', 26),
(4923, 'Herculândia', 26),
(4924, 'Holambra', 26),
(4925, 'Hortolândia', 26),
(4926, 'Iacanga', 26),
(4927, 'Iacri', 26),
(4928, 'Iaras', 26),
(4929, 'Ibaté', 26),
(4930, 'Ibirá', 26),
(4931, 'Ibirarema', 26),
(4932, 'Ibitinga', 26),
(4933, 'Ibiúna', 26),
(4934, 'Icém', 26),
(4935, 'Iepê', 26),
(4936, 'Igaraçu do Tietê', 26),
(4937, 'Igarapava', 26),
(4938, 'Igaratá', 26),
(4939, 'Iguape', 26),
(4940, 'Ilha Comprida', 26),
(4941, 'Ilha Solteira', 26),
(4942, 'Ilhabela', 26),
(4943, 'Indaiatuba', 26),
(4944, 'Indiana', 26),
(4945, 'Indiaporã', 26),
(4946, 'Inúbia Paulista', 26),
(4947, 'Ipaussu', 26),
(4948, 'Iperó', 26),
(4949, 'Ipeúna', 26),
(4950, 'Ipiguá', 26),
(4951, 'Iporanga', 26),
(4952, 'Ipuã', 26),
(4953, 'Iracemápolis', 26),
(4954, 'Irapuã', 26),
(4955, 'Irapuru', 26),
(4956, 'Itaberá', 26),
(4957, 'Itaí', 26),
(4958, 'Itajobi', 26),
(4959, 'Itaju', 26),
(4960, 'Itanhaém', 26),
(4961, 'Itaóca', 26),
(4962, 'Itapecerica da Serra', 26),
(4963, 'Itapetininga', 26),
(4964, 'Itapeva', 26),
(4965, 'Itapevi', 26),
(4966, 'Itapira', 26),
(4967, 'Itapirapuã Paulista', 26),
(4968, 'Itápolis', 26),
(4969, 'Itaporanga', 26),
(4970, 'Itapuí', 26),
(4971, 'Itapura', 26),
(4972, 'Itaquaquecetuba', 26),
(4973, 'Itararé', 26),
(4974, 'Itariri', 26),
(4975, 'Itatiba', 26),
(4976, 'Itatinga', 26),
(4977, 'Itirapina', 26),
(4978, 'Itirapuã', 26),
(4979, 'Itobi', 26),
(4980, 'Itu', 26),
(4981, 'Itupeva', 26),
(4982, 'Ituverava', 26),
(4983, 'Jaborandi', 26),
(4984, 'Jaboticabal', 26),
(4985, 'Jacareí', 26),
(4986, 'Jaci', 26),
(4987, 'Jacupiranga', 26),
(4988, 'Jaguariúna', 26),
(4989, 'Jales', 26),
(4990, 'Jambeiro', 26),
(4991, 'Jandira', 26),
(4992, 'Jardinópolis', 26),
(4993, 'Jarinu', 26),
(4994, 'Jaú', 26),
(4995, 'Jeriquara', 26),
(4996, 'Joanópolis', 26),
(4997, 'João Ramalho', 26),
(4998, 'José Bonifácio', 26),
(4999, 'Júlio Mesquita', 26),
(5000, 'Jumirim', 26),
(5001, 'Jundiaí', 26),
(5002, 'Junqueirópolis', 26),
(5003, 'Juquiá', 26),
(5004, 'Juquitiba', 26),
(5005, 'Lagoinha', 26),
(5006, 'Laranjal Paulista', 26),
(5007, 'Lavínia', 26),
(5008, 'Lavrinhas', 26),
(5009, 'Leme', 26),
(5010, 'Lençóis Paulista', 26),
(5011, 'Limeira', 26),
(5012, 'Lindóia', 26),
(5013, 'Lins', 26),
(5014, 'Lorena', 26),
(5015, 'Lourdes', 26),
(5016, 'Louveira', 26),
(5017, 'Lucélia', 26),
(5018, 'Lucianópolis', 26),
(5019, 'Luís Antônio', 26),
(5020, 'Luiziânia', 26),
(5021, 'Lupércio', 26),
(5022, 'Lutécia', 26),
(5023, 'Macatuba', 26),
(5024, 'Macaubal', 26),
(5025, 'Macedônia', 26),
(5026, 'Magda', 26),
(5027, 'Mairinque', 26),
(5028, 'Mairiporã', 26),
(5029, 'Manduri', 26),
(5030, 'Marabá Paulista', 26),
(5031, 'Maracaí', 26),
(5032, 'Marapoama', 26),
(5033, 'Mariápolis', 26),
(5034, 'Marília', 26),
(5035, 'Marinópolis', 26),
(5036, 'Martinópolis', 26),
(5037, 'Matão', 26),
(5038, 'Mauá', 26),
(5039, 'Mendonça', 26),
(5040, 'Meridiano', 26),
(5041, 'Mesópolis', 26),
(5042, 'Miguelópolis', 26),
(5043, 'Mineiros do Tietê', 26),
(5044, 'Mira Estrela', 26),
(5045, 'Miracatu', 26),
(5046, 'Mirandópolis', 26),
(5047, 'Mirante do Paranapanema', 26),
(5048, 'Mirassol', 26),
(5049, 'Mirassolândia', 26),
(5050, 'Mococa', 26),
(5051, 'Mogi das Cruzes', 26),
(5052, 'Mogi Guaçu', 26),
(5053, 'Moji Mirim', 26),
(5054, 'Mombuca', 26),
(5055, 'Monções', 26),
(5056, 'Mongaguá', 26),
(5057, 'Monte Alegre do Sul', 26),
(5058, 'Monte Alto', 26),
(5059, 'Monte Aprazível', 26),
(5060, 'Monte Azul Paulista', 26),
(5061, 'Monte Castelo', 26),
(5062, 'Monte Mor', 26),
(5063, 'Monteiro Lobato', 26),
(5064, 'Morro Agudo', 26),
(5065, 'Morungaba', 26),
(5066, 'Motuca', 26),
(5067, 'Murutinga do Sul', 26),
(5068, 'Nantes', 26),
(5069, 'Narandiba', 26),
(5070, 'Natividade da Serra', 26),
(5071, 'Nazaré Paulista', 26),
(5072, 'Neves Paulista', 26),
(5073, 'Nhandeara', 26),
(5074, 'Nipoã', 26),
(5075, 'Nova Aliança', 26),
(5076, 'Nova Campina', 26),
(5077, 'Nova Canaã Paulista', 26),
(5078, 'Nova Castilho', 26),
(5079, 'Nova Europa', 26),
(5080, 'Nova Granada', 26),
(5081, 'Nova Guataporanga', 26),
(5082, 'Nova Independência', 26),
(5083, 'Nova Luzitânia', 26),
(5084, 'Nova Odessa', 26),
(5085, 'Novais', 26),
(5086, 'Novo Horizonte', 26),
(5087, 'Nuporanga', 26),
(5088, 'Ocauçu', 26),
(5089, 'Óleo', 26),
(5090, 'Olímpia', 26),
(5091, 'Onda Verde', 26),
(5092, 'Oriente', 26),
(5093, 'Orindiúva', 26),
(5094, 'Orlândia', 26),
(5095, 'Osasco', 26),
(5096, 'Oscar Bressane', 26),
(5097, 'Osvaldo Cruz', 26),
(5098, 'Ourinhos', 26),
(5099, 'Ouro Verde', 26),
(5100, 'Ouroeste', 26),
(5101, 'Pacaembu', 26),
(5102, 'Palestina', 26),
(5103, 'Palmares Paulista', 26),
(5104, 'Palmeira d`Oeste', 26),
(5105, 'Palmital', 26),
(5106, 'Panorama', 26),
(5107, 'Paraguaçu Paulista', 26),
(5108, 'Paraibuna', 26),
(5109, 'Paraíso', 26),
(5110, 'Paranapanema', 26),
(5111, 'Paranapuã', 26),
(5112, 'Parapuã', 26),
(5113, 'Pardinho', 26),
(5114, 'Pariquera-Açu', 26),
(5115, 'Parisi', 26),
(5116, 'Patrocínio Paulista', 26),
(5117, 'Paulicéia', 26),
(5118, 'Paulínia', 26),
(5119, 'Paulistânia', 26),
(5120, 'Paulo de Faria', 26),
(5121, 'Pederneiras', 26),
(5122, 'Pedra Bela', 26),
(5123, 'Pedranópolis', 26),
(5124, 'Pedregulho', 26),
(5125, 'Pedreira', 26),
(5126, 'Pedrinhas Paulista', 26),
(5127, 'Pedro de Toledo', 26),
(5128, 'Penápolis', 26),
(5129, 'Pereira Barreto', 26),
(5130, 'Pereiras', 26),
(5131, 'Peruíbe', 26),
(5132, 'Piacatu', 26),
(5133, 'Piedade', 26),
(5134, 'Pilar do Sul', 26),
(5135, 'Pindamonhangaba', 26),
(5136, 'Pindorama', 26),
(5137, 'Pinhalzinho', 26),
(5138, 'Piquerobi', 26),
(5139, 'Piquete', 26),
(5140, 'Piracaia', 26),
(5141, 'Piracicaba', 26),
(5142, 'Piraju', 26),
(5143, 'Pirajuí', 26),
(5144, 'Pirangi', 26),
(5145, 'Pirapora do Bom Jesus', 26),
(5146, 'Pirapozinho', 26),
(5147, 'Pirassununga', 26),
(5148, 'Piratininga', 26),
(5149, 'Pitangueiras', 26),
(5150, 'Planalto', 26),
(5151, 'Platina', 26),
(5152, 'Poá', 26),
(5153, 'Poloni', 26),
(5154, 'Pompéia', 26),
(5155, 'Pongaí', 26),
(5156, 'Pontal', 26),
(5157, 'Pontalinda', 26),
(5158, 'Pontes Gestal', 26),
(5159, 'Populina', 26),
(5160, 'Porangaba', 26),
(5161, 'Porto Feliz', 26),
(5162, 'Porto Ferreira', 26),
(5163, 'Potim', 26),
(5164, 'Potirendaba', 26),
(5165, 'Pracinha', 26),
(5166, 'Pradópolis', 26),
(5167, 'Praia Grande', 26),
(5168, 'Pratânia', 26),
(5169, 'Presidente Alves', 26),
(5170, 'Presidente Bernardes', 26),
(5171, 'Presidente Epitácio', 26),
(5172, 'Presidente Prudente', 26),
(5173, 'Presidente Venceslau', 26),
(5174, 'Promissão', 26),
(5175, 'Quadra', 26),
(5176, 'Quatá', 26),
(5177, 'Queiroz', 26),
(5178, 'Queluz', 26),
(5179, 'Quintana', 26),
(5180, 'Rafard', 26),
(5181, 'Rancharia', 26),
(5182, 'Redenção da Serra', 26),
(5183, 'Regente Feijó', 26),
(5184, 'Reginópolis', 26),
(5185, 'Registro', 26),
(5186, 'Restinga', 26),
(5187, 'Ribeira', 26),
(5188, 'Ribeirão Bonito', 26),
(5189, 'Ribeirão Branco', 26),
(5190, 'Ribeirão Corrente', 26),
(5191, 'Ribeirão do Sul', 26),
(5192, 'Ribeirão dos Índios', 26),
(5193, 'Ribeirão Grande', 26),
(5194, 'Ribeirão Pires', 26),
(5195, 'Ribeirão Preto', 26),
(5196, 'Rifaina', 26),
(5197, 'Rincão', 26),
(5198, 'Rinópolis', 26),
(5199, 'Rio Claro', 26),
(5200, 'Rio das Pedras', 26),
(5201, 'Rio Grande da Serra', 26),
(5202, 'Riolândia', 26),
(5203, 'Riversul', 26),
(5204, 'Rosana', 26),
(5205, 'Roseira', 26),
(5206, 'Rubiácea', 26),
(5207, 'Rubinéia', 26),
(5208, 'Sabino', 26),
(5209, 'Sagres', 26),
(5210, 'Sales', 26),
(5211, 'Sales Oliveira', 26),
(5212, 'Salesópolis', 26),
(5213, 'Salmourão', 26),
(5214, 'Saltinho', 26),
(5215, 'Salto', 26),
(5216, 'Salto de Pirapora', 26),
(5217, 'Salto Grande', 26),
(5218, 'Sandovalina', 26),
(5219, 'Santa Adélia', 26),
(5220, 'Santa Albertina', 26),
(5221, 'Santa Bárbara d`Oeste', 26),
(5222, 'Santa Branca', 26),
(5223, 'Santa Clara d`Oeste', 26),
(5224, 'Santa Cruz da Conceição', 26),
(5225, 'Santa Cruz da Esperança', 26),
(5226, 'Santa Cruz das Palmeiras', 26),
(5227, 'Santa Cruz do Rio Pardo', 26),
(5228, 'Santa Ernestina', 26),
(5229, 'Santa Fé do Sul', 26),
(5230, 'Santa Gertrudes', 26),
(5231, 'Santa Isabel', 26),
(5232, 'Santa Lúcia', 26),
(5233, 'Santa Maria da Serra', 26),
(5234, 'Santa Mercedes', 26),
(5235, 'Santa Rita d`Oeste', 26),
(5236, 'Santa Rita do Passa Quatro', 26),
(5237, 'Santa Rosa de Viterbo', 26),
(5238, 'Santa Salete', 26),
(5239, 'Santana da Ponte Pensa', 26),
(5240, 'Santana de Parnaíba', 26),
(5241, 'Santo Anastácio', 26),
(5242, 'Santo André', 26),
(5243, 'Santo Antônio da Alegria', 26),
(5244, 'Santo Antônio de Posse', 26),
(5245, 'Santo Antônio do Aracanguá', 26),
(5246, 'Santo Antônio do Jardim', 26),
(5247, 'Santo Antônio do Pinhal', 26),
(5248, 'Santo Expedito', 26),
(5249, 'Santópolis do Aguapeí', 26),
(5250, 'Santos', 26),
(5251, 'São Bento do Sapucaí', 26),
(5252, 'São Bernardo do Campo', 26),
(5253, 'São Caetano do Sul', 26),
(5254, 'São Carlos', 26),
(5255, 'São Francisco', 26),
(5256, 'São João da Boa Vista', 26),
(5257, 'São João das Duas Pontes', 26),
(5258, 'São João de Iracema', 26),
(5259, 'São João do Pau d`Alho', 26),
(5260, 'São Joaquim da Barra', 26),
(5261, 'São José da Bela Vista', 26),
(5262, 'São José do Barreiro', 26),
(5263, 'São José do Rio Pardo', 26),
(5264, 'São José do Rio Preto', 26),
(5265, 'São José dos Campos', 26),
(5266, 'São Lourenço da Serra', 26),
(5267, 'São Luís do Paraitinga', 26),
(5268, 'São Manuel', 26),
(5269, 'São Miguel Arcanjo', 26),
(5270, 'São Paulo', 26),
(5271, 'São Pedro', 26),
(5272, 'São Pedro do Turvo', 26),
(5273, 'São Roque', 26),
(5274, 'São Sebastião', 26),
(5275, 'São Sebastião da Grama', 26),
(5276, 'São Simão', 26),
(5277, 'São Vicente', 26),
(5278, 'Sarapuí', 26),
(5279, 'Sarutaiá', 26),
(5280, 'Sebastianópolis do Sul', 26),
(5281, 'Serra Azul', 26),
(5282, 'Serra Negra', 26),
(5283, 'Serrana', 26),
(5284, 'Sertãozinho', 26),
(5285, 'Sete Barras', 26),
(5286, 'Severínia', 26),
(5287, 'Silveiras', 26),
(5288, 'Socorro', 26),
(5289, 'Sorocaba', 26),
(5290, 'Sud Mennucci', 26),
(5291, 'Sumaré', 26),
(5292, 'Suzanápolis', 26),
(5293, 'Suzano', 26),
(5294, 'Tabapuã', 26),
(5295, 'Tabatinga', 26),
(5296, 'Taboão da Serra', 26),
(5297, 'Taciba', 26),
(5298, 'Taguaí', 26),
(5299, 'Taiaçu', 26),
(5300, 'Taiúva', 26),
(5301, 'Tambaú', 26),
(5302, 'Tanabi', 26),
(5303, 'Tapiraí', 26),
(5304, 'Tapiratiba', 26),
(5305, 'Taquaral', 26),
(5306, 'Taquaritinga', 26),
(5307, 'Taquarituba', 26),
(5308, 'Taquarivaí', 26),
(5309, 'Tarabai', 26),
(5310, 'Tarumã', 26),
(5311, 'Tatuí', 26),
(5312, 'Taubaté', 26),
(5313, 'Tejupá', 26),
(5314, 'Teodoro Sampaio', 26),
(5315, 'Terra Roxa', 26),
(5316, 'Tietê', 26),
(5317, 'Timburi', 26),
(5318, 'Torre de Pedra', 26),
(5319, 'Torrinha', 26),
(5320, 'Trabiju', 26),
(5321, 'Tremembé', 26),
(5322, 'Três Fronteiras', 26),
(5323, 'Tuiuti', 26),
(5324, 'Tupã', 26),
(5325, 'Tupi Paulista', 26),
(5326, 'Turiúba', 26),
(5327, 'Turmalina', 26),
(5328, 'Ubarana', 26),
(5329, 'Ubatuba', 26),
(5330, 'Ubirajara', 26),
(5331, 'Uchoa', 26),
(5332, 'União Paulista', 26),
(5333, 'Urânia', 26),
(5334, 'Uru', 26),
(5335, 'Urupês', 26),
(5336, 'Valentim Gentil', 26),
(5337, 'Valinhos', 26),
(5338, 'Valparaíso', 26),
(5339, 'Vargem', 26),
(5340, 'Vargem Grande do Sul', 26),
(5341, 'Vargem Grande Paulista', 26),
(5342, 'Várzea Paulista', 26),
(5343, 'Vera Cruz', 26),
(5344, 'Vinhedo', 26),
(5345, 'Viradouro', 26),
(5346, 'Vista Alegre do Alto', 26),
(5347, 'Vitória Brasil', 26),
(5348, 'Votorantim', 26),
(5349, 'Votuporanga', 26),
(5350, 'Zacarias', 26),
(5351, 'Amparo de São Francisco', 25),
(5352, 'Aquidabã', 25),
(5353, 'Aracaju', 25),
(5354, 'Arauá', 25),
(5355, 'Areia Branca', 25),
(5356, 'Barra dos Coqueiros', 25),
(5357, 'Boquim', 25),
(5358, 'Brejo Grande', 25),
(5359, 'Campo do Brito', 25),
(5360, 'Canhoba', 25),
(5361, 'Canindé de São Francisco', 25),
(5362, 'Capela', 25),
(5363, 'Carira', 25),
(5364, 'Carmópolis', 25),
(5365, 'Cedro de São João', 25),
(5366, 'Cristinápolis', 25),
(5367, 'Cumbe', 25),
(5368, 'Divina Pastora', 25),
(5369, 'Estância', 25),
(5370, 'Feira Nova', 25),
(5371, 'Frei Paulo', 25),
(5372, 'Gararu', 25),
(5373, 'General Maynard', 25),
(5374, 'Gracho Cardoso', 25),
(5375, 'Ilha das Flores', 25),
(5376, 'Indiaroba', 25),
(5377, 'Itabaiana', 25),
(5378, 'Itabaianinha', 25),
(5379, 'Itabi', 25),
(5380, 'Itaporanga d`Ajuda', 25),
(5381, 'Japaratuba', 25),
(5382, 'Japoatã', 25),
(5383, 'Lagarto', 25),
(5384, 'Laranjeiras', 25),
(5385, 'Macambira', 25),
(5386, 'Malhada dos Bois', 25),
(5387, 'Malhador', 25),
(5388, 'Maruim', 25),
(5389, 'Moita Bonita', 25),
(5390, 'Monte Alegre de Sergipe', 25),
(5391, 'Muribeca', 25),
(5392, 'Neópolis', 25),
(5393, 'Nossa Senhora Aparecida', 25),
(5394, 'Nossa Senhora da Glória', 25),
(5395, 'Nossa Senhora das Dores', 25),
(5396, 'Nossa Senhora de Lourdes', 25),
(5397, 'Nossa Senhora do Socorro', 25),
(5398, 'Pacatuba', 25),
(5399, 'Pedra Mole', 25),
(5400, 'Pedrinhas', 25),
(5401, 'Pinhão', 25),
(5402, 'Pirambu', 25),
(5403, 'Poço Redondo', 25),
(5404, 'Poço Verde', 25),
(5405, 'Porto da Folha', 25),
(5406, 'Propriá', 25),
(5407, 'Riachão do Dantas', 25),
(5408, 'Riachuelo', 25),
(5409, 'Ribeirópolis', 25),
(5410, 'Rosário do Catete', 25),
(5411, 'Salgado', 25),
(5412, 'Santa Luzia do Itanhy', 25),
(5413, 'Santa Rosa de Lima', 25),
(5414, 'Santana do São Francisco', 25),
(5415, 'Santo Amaro das Brotas', 25),
(5416, 'São Cristóvão', 25),
(5417, 'São Domingos', 25),
(5418, 'São Francisco', 25),
(5419, 'São Miguel do Aleixo', 25),
(5420, 'Simão Dias', 25),
(5421, 'Siriri', 25),
(5422, 'Telha', 25),
(5423, 'Tobias Barreto', 25),
(5424, 'Tomar do Geru', 25),
(5425, 'Umbaúba', 25),
(5426, 'Abreulândia', 27),
(5427, 'Aguiarnópolis', 27),
(5428, 'Aliança do Tocantins', 27),
(5429, 'Almas', 27),
(5430, 'Alvorada', 27),
(5431, 'Ananás', 27),
(5432, 'Angico', 27),
(5433, 'Aparecida do Rio Negro', 27),
(5434, 'Aragominas', 27),
(5435, 'Araguacema', 27),
(5436, 'Araguaçu', 27),
(5437, 'Araguaína', 27),
(5438, 'Araguanã', 27),
(5439, 'Araguatins', 27),
(5440, 'Arapoema', 27),
(5441, 'Arraias', 27),
(5442, 'Augustinópolis', 27),
(5443, 'Aurora do Tocantins', 27),
(5444, 'Axixá do Tocantins', 27),
(5445, 'Babaçulândia', 27),
(5446, 'Bandeirantes do Tocantins', 27),
(5447, 'Barra do Ouro', 27),
(5448, 'Barrolândia', 27),
(5449, 'Bernardo Sayão', 27),
(5450, 'Bom Jesus do Tocantins', 27),
(5451, 'Brasilândia do Tocantins', 27),
(5452, 'Brejinho de Nazaré', 27),
(5453, 'Buriti do Tocantins', 27),
(5454, 'Cachoeirinha', 27),
(5455, 'Campos Lindos', 27),
(5456, 'Cariri do Tocantins', 27),
(5457, 'Carmolândia', 27),
(5458, 'Carrasco Bonito', 27),
(5459, 'Caseara', 27),
(5460, 'Centenário', 27),
(5461, 'Chapada da Natividade', 27),
(5462, 'Chapada de Areia', 27),
(5463, 'Colinas do Tocantins', 27),
(5464, 'Colméia', 27),
(5465, 'Combinado', 27),
(5466, 'Conceição do Tocantins', 27),
(5467, 'Couto de Magalhães', 27),
(5468, 'Cristalândia', 27),
(5469, 'Crixás do Tocantins', 27),
(5470, 'Darcinópolis', 27),
(5471, 'Dianópolis', 27),
(5472, 'Divinópolis do Tocantins', 27),
(5473, 'Dois Irmãos do Tocantins', 27),
(5474, 'Dueré', 27),
(5475, 'Esperantina', 27),
(5476, 'Fátima', 27),
(5477, 'Figueirópolis', 27),
(5478, 'Filadélfia', 27),
(5479, 'Formoso do Araguaia', 27),
(5480, 'Fortaleza do Tabocão', 27),
(5481, 'Goianorte', 27),
(5482, 'Goiatins', 27),
(5483, 'Guaraí', 27),
(5484, 'Gurupi', 27),
(5485, 'Ipueiras', 27),
(5486, 'Itacajá', 27),
(5487, 'Itaguatins', 27),
(5488, 'Itapiratins', 27),
(5489, 'Itaporã do Tocantins', 27),
(5490, 'Jaú do Tocantins', 27),
(5491, 'Juarina', 27),
(5492, 'Lagoa da Confusão', 27),
(5493, 'Lagoa do Tocantins', 27),
(5494, 'Lajeado', 27),
(5495, 'Lavandeira', 27),
(5496, 'Lizarda', 27),
(5497, 'Luzinópolis', 27),
(5498, 'Marianópolis do Tocantins', 27),
(5499, 'Mateiros', 27),
(5500, 'Maurilândia do Tocantins', 27),
(5501, 'Miracema do Tocantins', 27),
(5502, 'Miranorte', 27),
(5503, 'Monte do Carmo', 27),
(5504, 'Monte Santo do Tocantins', 27),
(5505, 'Muricilândia', 27),
(5506, 'Natividade', 27),
(5507, 'Nazaré', 27),
(5508, 'Nova Olinda', 27),
(5509, 'Nova Rosalândia', 27),
(5510, 'Novo Acordo', 27),
(5511, 'Novo Alegre', 27),
(5512, 'Novo Jardim', 27),
(5513, 'Oliveira de Fátima', 27),
(5514, 'Palmas', 27),
(5515, 'Palmeirante', 27),
(5516, 'Palmeiras do Tocantins', 27),
(5517, 'Palmeirópolis', 27),
(5518, 'Paraíso do Tocantins', 27),
(5519, 'Paranã', 27),
(5520, 'Pau d`Arco', 27),
(5521, 'Pedro Afonso', 27),
(5522, 'Peixe', 27),
(5523, 'Pequizeiro', 27),
(5524, 'Pindorama do Tocantins', 27),
(5525, 'Piraquê', 27),
(5526, 'Pium', 27),
(5527, 'Ponte Alta do Bom Jesus', 27),
(5528, 'Ponte Alta do Tocantins', 27),
(5529, 'Porto Alegre do Tocantins', 27),
(5530, 'Porto Nacional', 27),
(5531, 'Praia Norte', 27),
(5532, 'Presidente Kennedy', 27),
(5533, 'Pugmil', 27),
(5534, 'Recursolândia', 27),
(5535, 'Riachinho', 27),
(5536, 'Rio da Conceição', 27),
(5537, 'Rio dos Bois', 27),
(5538, 'Rio Sono', 27),
(5539, 'Sampaio', 27),
(5540, 'Sandolândia', 27),
(5541, 'Santa Fé do Araguaia', 27),
(5542, 'Santa Maria do Tocantins', 27),
(5543, 'Santa Rita do Tocantins', 27),
(5544, 'Santa Rosa do Tocantins', 27),
(5545, 'Santa Tereza do Tocantins', 27),
(5546, 'Santa Terezinha do Tocantins', 27),
(5547, 'São Bento do Tocantins', 27),
(5548, 'São Félix do Tocantins', 27),
(5549, 'São Miguel do Tocantins', 27),
(5550, 'São Salvador do Tocantins', 27),
(5551, 'São Sebastião do Tocantins', 27),
(5552, 'São Valério da Natividade', 27),
(5553, 'Silvanópolis', 27),
(5554, 'Sítio Novo do Tocantins', 27),
(5555, 'Sucupira', 27),
(5556, 'Taguatinga', 27),
(5557, 'Taipas do Tocantins', 27),
(5558, 'Talismã', 27),
(5559, 'Tocantínia', 27),
(5560, 'Tocantinópolis', 27),
(5561, 'Tupirama', 27),
(5562, 'Tupiratins', 27),
(5563, 'Wanderlândia', 27),
(5564, 'Xambioá', 27);

-- --------------------------------------------------------

--
-- Estrutura da tabela `contato`
--

CREATE TABLE `contato` (
  `con_id` int(11) NOT NULL,
  `con_nome` varchar(128) DEFAULT NULL,
  `con_descricao` text DEFAULT NULL,
  `con_email` varchar(128) DEFAULT NULL,
  `con_status` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `contato`
--

INSERT INTO `contato` (`con_id`, `con_nome`, `con_descricao`, `con_email`, `con_status`) VALUES
(1, 'Matriz', '.', 'sincol@sincol.com.br', 1),
(2, 'Filial Paraná', 'Av. Marciano Brros, 51. CEP: 86.400-000 | Jacarezinho – PR\nFone: (43) 3511-2300', 'sincol@sincol.com.br', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `depoimentos`
--

CREATE TABLE `depoimentos` (
  `dep_id` int(11) NOT NULL,
  `dep_titulo` varchar(128) NOT NULL,
  `dep_url` varchar(128) NOT NULL,
  `dep_desc` text NOT NULL,
  `dep_status` tinyint(1) NOT NULL,
  `dep_datahora` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `depoimentos`
--

INSERT INTO `depoimentos` (`dep_id`, `dep_titulo`, `dep_url`, `dep_desc`, `dep_status`, `dep_datahora`) VALUES
(6, 'Pessoa', 'd689a-depoimento.png', '<p>Amplo e moderno, o parque industrial da Sincol tem mais de 55.000 m&sup2; de &aacute;rea constru&iacute;da e disp&otilde;e da mais alta tecnologia do setor madeireiro. ||| Sincol has a large and modern industrial park, with more than 55,000 m&sup2; of built area. ||| Sincol cuenta con un amplio y moderno parque industrial, con m&aacute;s de 55.000 m&sup2; de &aacute;rea construida.&nbsp;</p>', 1, 0),
(7, 'Pessoa', '875b4-depoimento2.png', '<p>Amplo e moderno, o parque industrial da Sincol tem mais de 55.000 m&sup2; de &aacute;rea constru&iacute;da e disp&otilde;e da mais alta tecnologia do setor madeireiro. ||| Sincol has a large and modern industrial park, with more than 55,000 m&sup2; of built area. ||| Sincol cuenta con un amplio y moderno parque industrial, con m&aacute;s de 55.000 m&sup2; de &aacute;rea construida.&nbsp;</p>', 1, 0),
(8, 'Pessoa', '472a6-depoimento.png', '<p>Amplo e moderno, o parque industrial da Sincol tem mais de 55.000 m&sup2; de &aacute;rea constru&iacute;da e disp&otilde;e da mais alta tecnologia do setor madeireiro. ||| Sincol has a large and modern industrial park, with more than 55,000 m&sup2; of built area. ||| Sincol cuenta con un amplio y moderno parque industrial, con m&aacute;s de 55.000 m&sup2; de &aacute;rea construida.&nbsp;</p>', 1, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `documento`
--

CREATE TABLE `documento` (
  `doc_id` int(11) NOT NULL,
  `cat_id` int(11) DEFAULT NULL,
  `doc_alt_texto` text DEFAULT NULL,
  `doc_titulo` varchar(256) DEFAULT NULL,
  `doc_legenda` text DEFAULT NULL,
  `doc_descricao` text DEFAULT NULL,
  `doc_url` varchar(512) DEFAULT NULL,
  `doc_status` tinyint(1) NOT NULL DEFAULT 1,
  `doc_datahora` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `documento`
--

INSERT INTO `documento` (`doc_id`, `cat_id`, `doc_alt_texto`, `doc_titulo`, `doc_legenda`, `doc_descricao`, `doc_url`, `doc_status`, `doc_datahora`) VALUES
(1, 2, 'asdasdasdasdasdas', 'Planos.xls', NULL, '<p>asdsadasdasdasd</p>', '18397-user_default.jpg', 1, '2021-01-26 11:06:30');

-- --------------------------------------------------------

--
-- Estrutura da tabela `doc_categoria`
--

CREATE TABLE `doc_categoria` (
  `cat_id` int(11) NOT NULL,
  `cat_pai` int(11) DEFAULT NULL,
  `cat_titulo` varchar(256) DEFAULT NULL,
  `cat_descricao` text DEFAULT NULL,
  `cat_img` varchar(256) DEFAULT NULL,
  `cat_datahora` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `doc_categoria`
--

INSERT INTO `doc_categoria` (`cat_id`, `cat_pai`, `cat_titulo`, `cat_descricao`, `cat_img`, `cat_datahora`) VALUES
(1, NULL, 'Pai', '<p>dsa</p>', 'a0e02-user_default.jpg', '2021-01-26 11:06:55'),
(2, 1, 'filho', '<p>adsasdsdaasdasddasdsasadsadsadas</p>', NULL, '2021-01-26 11:06:55');

-- --------------------------------------------------------

--
-- Estrutura da tabela `estado`
--

CREATE TABLE `estado` (
  `est_id` int(11) NOT NULL,
  `est_nome` varchar(75) DEFAULT NULL,
  `est_uf` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `estado`
--

INSERT INTO `estado` (`est_id`, `est_nome`, `est_uf`) VALUES
(1, 'Acre', 'AC'),
(2, 'Alagoas', 'AL'),
(3, 'Amazonas', 'AM'),
(4, 'Amapá', 'AP'),
(5, 'Bahia', 'BA'),
(6, 'Ceará', 'CE'),
(7, 'Distrito Federal', 'DF'),
(8, 'Espírito Santo', 'ES'),
(9, 'Goiás', 'GO'),
(10, 'Maranhão', 'MA'),
(11, 'Minas Gerais', 'MG'),
(12, 'Mato Grosso do Sul', 'MS'),
(13, 'Mato Grosso', 'MT'),
(14, 'Pará', 'PA'),
(15, 'Paraíba', 'PB'),
(16, 'Pernambuco', 'PE'),
(17, 'Piauí', 'PI'),
(18, 'Paraná', 'PR'),
(19, 'Rio de Janeiro', 'RJ'),
(20, 'Rio Grande do Norte', 'RN'),
(21, 'Rondônia', 'RO'),
(22, 'Roraima', 'RR'),
(23, 'Rio Grande do Sul', 'RS'),
(24, 'Santa Catarina', 'SC'),
(25, 'Sergipe', 'SE'),
(26, 'São Paulo', 'SP'),
(27, 'Tocantins', 'TO');

-- --------------------------------------------------------

--
-- Estrutura da tabela `fotos_portifolio`
--

CREATE TABLE `fotos_portifolio` (
  `fot_id` int(11) NOT NULL,
  `prt_id` int(11) DEFAULT NULL,
  `fot_alt_texto` varchar(256) DEFAULT NULL,
  `fot_titulo` varchar(256) DEFAULT NULL,
  `fot_descricao` text DEFAULT NULL,
  `fot_url` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `fotos_portifolio`
--

INSERT INTO `fotos_portifolio` (`fot_id`, `prt_id`, `fot_alt_texto`, `fot_titulo`, `fot_descricao`, `fot_url`) VALUES
(1, 1, NULL, 'sadssdadsasdsad', '5', '985a7-banner1.jpg'),
(2, 2, NULL, 'sadssdadsasdsad', 'SDASSDAS', 'aa791-banner1.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `fotos_produto`
--

CREATE TABLE `fotos_produto` (
  `fot_id` int(11) NOT NULL,
  `prd_id` int(11) DEFAULT NULL,
  `fot_alt_texto` text DEFAULT NULL,
  `fot_titulo` varchar(256) DEFAULT NULL,
  `fot_legenda` varchar(256) DEFAULT NULL,
  `fot_descricao` text DEFAULT NULL,
  `fot_url` varchar(256) DEFAULT NULL,
  `fot_tipo` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `fotos_produto`
--

INSERT INTO `fotos_produto` (`fot_id`, `prd_id`, `fot_alt_texto`, `fot_titulo`, `fot_legenda`, `fot_descricao`, `fot_url`, `fot_tipo`) VALUES
(41, 20, 'Abrir à Direita', 'Abrir à Direita', 'Abrir à Direita', 'Abrir à Direita', '25595-giro-abrir-a-direita.jpg', 0),
(42, 20, 'Abrir a esquerda', 'Abrir a esquerda', 'Abrir a esquerda', 'Abrir a esquerda', 'dbcf9-giro-abrir-a-esquerda.jpg', 0),
(43, 20, 'Abrir fora à direita', 'Abrir fora à direita', 'Abrir fora à direita', 'Abrir fora à direita', 'cb91a-giro-abrir-fora-a-direita.jpg', 0),
(44, 20, 'Abrir fora à esquerda', 'Abrir fora à esquerda', 'Abrir fora à esquerda', 'Abrir fora à esquerda', '7a49e-giro-abrir-fora-a-esquerda.jpg', 0),
(45, 21, 'Pivotante à Direita', 'Pivotante à Direita', NULL, 'Pivotante à Direita', '8dffb-pivotante-a-direita.jpg', 0),
(46, 21, NULL, 'Pivotante à Esquerda', NULL, 'Pivotante à Esquerda', 'ad98c-pivotante-a-esquerda.jpg', 0),
(47, 22, 'Correr à Direita', 'Correr à Direita', 'Correr à Direita', 'Correr à Direita', '3b857-correr-sobreposta-a-direita.jpg', 0),
(48, 22, 'Correr à Esquerda', 'Correr à Esquerda', 'Correr à Esquerda', 'Correr à Esquerda', 'b85a1-correr-sobreposta-a-esquerda.jpg', 0),
(49, 22, 'Correr Embutida à Direita', 'Correr Embutida à Direita', 'Correr Embutida à Direita', 'Correr Embutida à Direita', '75ccc-correr-embutida-a-direita.jpg', 0),
(50, 22, 'Correr Embutida à Esquerda', 'Correr Embutida à Esquerda', 'Correr Embutida à Esquerda', 'Correr Embutida à Esquerda', '22204-correr-embutida-a-esquerda.jpg', 0),
(51, 24, 'Vai-e-Vem - Folha Simples', 'Vai-e-Vem - Folha Simples', 'Vai-e-Vem - Folha Simples', 'Vai-e-Vem - Folha Simples', 'c904e-vai-e-vem-folha-simples.jpg', 0),
(52, 24, 'Vai-e-Vem - Folha Dupla', 'Vai-e-Vem - Folha Dupla', 'Vai-e-Vem - Folha Dupla', 'Vai-e-Vem - Folha Dupla', '33d7c-vai-e-vem-folha-dupla.jpg', 0),
(53, 25, 'Sanfonado 2 Folhas', 'Sanfonado 2 Folhas', 'Sanfonado 2 Folhas', 'Sanfonado 2 Folhas', 'e3ce7-sanfonado-2-folhas.jpg', 0),
(54, 25, 'Sanfonado 4 Folhas', 'Sanfonado 4 Folhas', 'Sanfonado 4 Folhas', 'Sanfonado 4 Folhas', '0eb93-sanfonado-4-folhas.jpg', 0),
(55, 26, 'Camarão', 'Camarão', 'Camarão', 'Camarão', '4fc3b-pivotante-camarao.jpg', 0),
(56, 23, 'Shaft 2 Fls', 'Shaft 2 Fls', 'Shaft 2 Fls', 'Shaft 2 Fls', 'e17fb-shaft-2-fls.jpg', 0),
(57, 23, 'Shaft Camarão', 'Shaft Camarão', 'Shaft Camarão', 'Shaft Camarão', '0a14c-shaft-camarao.jpg', 0),
(58, 23, 'Shaft Correr', 'Shaft Correr', 'Shaft Correr', 'Shaft Correr', '71933-shaft-correr.jpg', 0),
(59, 23, 'Shaft - Abrir fora à direita', 'Shaft - Abrir fora à direita', 'Shaft - Abrir fora à direita', 'Shaft - Abrir fora à direita', 'c1222-shaft-fora-direita.jpg', 0),
(60, 23, 'Shaft - Abrir fora à esquerda', 'Shaft - Abrir fora à esquerda', 'Shaft - Abrir fora à esquerda', 'Shaft - Abrir fora à esquerda', '469c0-shaft-fora-esquerda.jpg', 0),
(61, 23, 'Shaft 3 Fls', 'Shaft 3 Fls', 'Shaft 3 Fls', 'Shaft 3 Fls', '4c9ff-shaft-3-fls.jpg', 0),
(62, 23, 'Shaft 4 Fls', 'Shaft 4 Fls', 'Shaft 4 Fls', 'Shaft 4 Fls', '183c8-shaft-4-fls.jpg', 0),
(66, 52, NULL, 'Capa', NULL, 'Capa', '72e60-glass.jpg', 1),
(67, 52, NULL, '162 | Curupixá Veneer', NULL, '162 | Curupixá Veneer', 'd3abb-162curupixaveneer.jpg', 0),
(68, 53, NULL, 'Capa', NULL, 'Capa', '81f07-louvre.jpg', 1),
(69, 53, NULL, '181 | Curupixá Veneer', NULL, '181 | Curupixá Veneer', 'a9838-181curupixaveneer.jpg', 0),
(70, 51, NULL, 'Curupixá Nativo', NULL, 'Curupixá Nativo', 'a77f2-curupixa-nativo.jpg', 0),
(71, 51, NULL, 'Curupixá Venner - Sala TV', NULL, 'Curupixá Venner - Sala TV', '17a9f-salatvcurupixaveneer.jpg', 0),
(72, 51, NULL, 'Cappcuccino Noce', NULL, 'Cappcuccino Noce', '39c1f-salatvcappuccinonoce.jpg', 0),
(75, 48, NULL, '201 | Curupixá Veneer', NULL, '201 | Curupixá Veneer', 'd5f99-creative-1.jpg', 0),
(76, 48, NULL, '204 | Freijó Anegre', NULL, '204 | Freijó Anegre', '3b4b5-creative-2.jpg', 0),
(77, 48, NULL, '208 | Cappuccino Noce', NULL, '208 | Cappuccino Noce', '85011-creative-3.jpg', 0),
(78, 48, NULL, '206 | Freijó Anegre', NULL, '206 | Freijó Anegre', '17727-creative-4.jpg', 0),
(79, 48, NULL, '230 | Cappuccino Noce', NULL, '230 | Cappuccino Noce', '0c098-creative-5.jpg', 0),
(81, 50, NULL, 'Capa', NULL, 'Capa', '3ad20-prf-30.jpg', 1),
(82, 54, NULL, 'Capa Colors', NULL, 'Colors', 'f1f00-colors.jpg', 1),
(84, 55, NULL, 'Capa', NULL, 'Capa', '9e728-blanc.jpg', 1),
(86, 56, NULL, 'Capa', NULL, 'Capa', 'a2712-shaft-s.jpg', 1),
(87, 56, NULL, 'Gianduia', NULL, 'Gianduia', 'be8d4-shaft-1.jpg', 0),
(88, 56, NULL, 'Branco', NULL, 'Branco', '55d08-shaft-3.jpg', 0),
(90, 55, NULL, 'Blanc U.V.', NULL, 'Branco U.V.', '00435-blanc-2.jpg', 0),
(91, 58, NULL, 'Batente 604', NULL, 'Batente 604', '849a7-batente-604.jpg', 0),
(92, 59, NULL, 'Batente 605', NULL, 'Batente 605', '27826-batente-605.jpg', 0),
(93, 60, NULL, 'Batente 615R', NULL, 'Batente 615R', 'b1069-batente-615r.jpg', 0),
(94, 61, NULL, 'Batente 617R', NULL, 'Batente 617R', 'f038d-batente-617r.jpg', 0),
(95, 62, NULL, 'Batente 619', NULL, 'Batente 619', '8c709-batente-619.jpg', 0),
(96, 63, NULL, 'Batente 624', NULL, 'Batente 624', 'd23a1-batente-624.jpg', 0),
(97, 64, NULL, 'Batente 625', NULL, 'Batente 625', '5ee3b-batente-625.jpg', 0),
(98, 65, NULL, 'Batente 628', NULL, 'Batente 628', '5d2fb-batente-628.jpg', 0),
(100, 67, NULL, 'Guarnição 751', NULL, 'Guarnição 751', '7299c-guarnicao-751.jpg', 0),
(102, 69, NULL, 'Guarnição 754', NULL, 'Guarnição 754', '3a1c9-guarnicao-754.jpg', 0),
(104, 68, NULL, 'Guarnição 761', NULL, 'Guarnição 61', '9856d-guarnicao-761.jpg', 0),
(106, 70, NULL, 'Guarnição 764', NULL, 'Guarnição 764', '281a2-guarnicao-764.jpg', 0),
(108, 71, NULL, 'Rodapé 790', NULL, 'Rodapé 790', '8345c-rodape-790.jpg', 0),
(109, 72, NULL, 'Rodapé 791', NULL, 'Rodapé 791', '13bdf-rodape-791.jpg', 0),
(110, 73, NULL, 'Rodapé 793', NULL, 'Rodapé 793', '2f35e-rodape-793.jpg', 0),
(111, 74, NULL, 'Rodapé 794', NULL, 'Rodapé 794', '7cb2b-rodape-794.jpg', 0),
(112, 75, NULL, 'Bandeirola 109', NULL, 'Bandeirola 109', '2896b-bandeirola-109.jpg', 0),
(113, 76, NULL, 'Bandeirola 110', NULL, 'Bandeirola 110', 'a663f-bandeirola-110.jpg', 0),
(114, 77, NULL, 'Bandeirola 112', NULL, 'Bandeirola 112', '1b026-bandeirola-112.jpg', 0),
(115, 79, NULL, 'Detalhe Guarnições 754/764', NULL, 'Detalhe Guarnições 754/764', '981a2-detalhe-754_764.jpg', 0),
(116, 78, NULL, 'Detalhe Guarnições 751/761', NULL, 'Detalhe Guarnições 751/761', '8d1a4-detalhe-751_761.jpg', 0),
(120, 82, NULL, 'Capa', NULL, 'Capa', 'bac58-pivotante.jpg', 1),
(121, 82, NULL, 'Acabamento Branco P.U.', NULL, 'Acabamento Branco P.U.', 'c50e0-pivotante-branca-lisa.jpg', 0),
(122, 81, NULL, 'Capa', NULL, 'Capa', '65a35-correr.jpg', 1),
(123, 84, NULL, 'Sistema H', NULL, 'Sistema H', '7f35b-guarnicao-sistema-h.jpg', 0),
(124, 83, NULL, 'Sistema Meia Esquadria', NULL, 'Sistema Meia Esquadria', '64c7f-guarnicao-meia-esquadria.jpg', 0),
(125, 81, NULL, 'Correr', NULL, 'Correr', '52d6c-correr-retrato-22.jpg', 0),
(126, 85, NULL, 'Dimensões Kit de Giro', NULL, 'Dimensões Kit de Giro', '90770-dimensoes-sinkit-cor.jpg', 0),
(127, 87, NULL, 'Dimensões Kit Pivotante', NULL, 'Dimensões Kit Pivotante', '5223e-dimensoes-pivotante-cor.jpg', 0),
(143, 90, NULL, 'Base 127', NULL, 'Base 127', '835c4-base-127.jpg', 0),
(144, 91, NULL, 'Base 153', NULL, 'Base 153', '8678a-base-153.jpg', 0),
(146, 93, NULL, 'Base 156', NULL, 'Base 156', '21aa4-base-156.jpg', 0),
(148, 95, NULL, 'Base 174', NULL, 'Base 174', 'f02ef-base-174.jpg', 0),
(150, 97, NULL, 'Base 194', NULL, 'Base 194', '94f2a-base-194.jpg', 0),
(153, 100, NULL, 'Dimensões Correr Sobreposta', NULL, 'Dimensões Correr Sobreposta', '56311-dimensoes-correr-sobreposta-cor.jpg', 0),
(154, 100, NULL, 'Dimensões Correr Embutida', NULL, 'Dimensões Correr Embutida', '1d011-dimensoes-correr-embutida-cor.jpg', 0),
(156, 50, NULL, 'Freijó Anegre', NULL, 'Freijó Anegre', '7433f-prf-30-1.jpg', 0),
(159, 49, NULL, 'Capa', NULL, 'Capa', '51f79-silentia.jpg', 1),
(162, 51, NULL, 'Freijó Anegre', NULL, 'Freijó Anegre', '665da-salatvfreijoanegre.jpg', 0),
(163, 51, NULL, 'Freijó Anegre', NULL, 'Freijó Anegre', 'ee62f-quartofreijoanegre.jpg', 0),
(164, 51, NULL, 'Capa', NULL, 'Capa', '2d947-prima.jpg', 1),
(165, 51, NULL, 'Cappuccino Noce', NULL, 'Cappuccino Noce', '9731f-quartocappuccinonoce.jpg', 0),
(166, 51, NULL, 'Curupixá Veneer', NULL, 'Curupixá Veneer', 'd0122-quartocurupixaveneer.jpg', 0),
(167, 52, NULL, '162 | Cappuccino Noce', NULL, '162 | Cappuccino Noce', '9ccec-162cappuccinonoce.jpg', 0),
(168, 52, NULL, '162 | Freijó Anegre', NULL, '162 | Freijó Anegre', '7a16f-162freijoanegre.jpg', 0),
(169, 52, NULL, '163 | Cappuccino Noce', NULL, '163 | Cappuccino Noce', '709a7-163cappuccinonoce.jpg', 0),
(170, 52, NULL, '163 | Curupixá Veneer', NULL, '163 | Curupixá Veneer', '3aa55-163curupixaveneer.jpg', 0),
(171, 52, NULL, '163 | Freijó Anegre', NULL, '163 | Freijó Anegre', '75403-163freijoanegre.jpg', 0),
(172, 53, NULL, '181 | Cappuccino Noce', NULL, '181 | Cappuccino Noce', '5e794-181cappuccinonoce.jpg', 0),
(173, 53, NULL, '181 | Freijó Anegre', NULL, '181 | Freijó Anegre', '7cac8-181freijoanegre.jpg', 0),
(174, 53, NULL, '184 | Freijó Anegre', NULL, '184 | Freijó Anegre', 'a5d2f-184freijoanegre.jpg', 0),
(175, 53, NULL, '184 | Cappuccino Noce', NULL, '184 | Cappuccino Noce', 'a64d2-184cappuccinonoce.jpg', 0),
(176, 53, NULL, '184 | Curupixá Veneer', NULL, '184 | Curupixá Veneer', '677d2-184curupixaveneer.jpg', 0),
(177, 48, NULL, 'Capa Creative', NULL, 'Capa Creative', 'a564d-creative.jpg', 1),
(179, 55, NULL, 'Branco P.U.', NULL, 'Branco P.U.', '1a475-blanc-1.jpg', 0),
(181, 82, NULL, 'Pivotante Freijó', NULL, 'Pivotante Freijó', '0e958-pivotante-freijo.jpg', 0),
(182, 49, NULL, 'Silentia', NULL, 'Silentia', '41f93-silentia-1.jpg', 0),
(184, 56, NULL, 'Grafite', NULL, 'Grafite', '50074-shaft-2.jpg', 0),
(185, 81, NULL, 'Correr', NULL, 'Correr', 'b9fd7-correr-retrato-3.jpg', 0),
(187, 20, NULL, 'Capa Giro', NULL, 'Capa Giro', '7e80c-giro-abrir-a-direita.jpg', 1),
(188, 21, NULL, 'Capa Pivotante', NULL, 'Capa Pivotante', '3c2a1-pivotante-a-direita.jpg', 1),
(189, 22, NULL, 'Capa Correr', NULL, 'Capa Correr', '5b5c2-correr-sobreposta-a-direita.jpg', 1),
(190, 23, NULL, 'Capa Shaft', NULL, 'Capa Shaft', '19de1-shaft-2-fls.jpg', 1),
(191, 24, NULL, 'Capa Vai-e-Vem', NULL, 'Capa Vai-e-Vem', '7d3fa-vai-e-vem-folha-dupla.jpg', 1),
(192, 25, NULL, 'Capa Sanfonada', NULL, 'Capa Sanfonada', '3206b-sanfonado-2-folhas.jpg', 1),
(193, 26, NULL, 'Capa Camarão', NULL, 'Capa Camarão', '5fca7-pivotante-camarao.jpg', 1),
(194, 58, NULL, 'Capa Batente 604', NULL, 'Capa Batente 604', 'bc4e3-batente-604.jpg', 1),
(195, 59, NULL, 'Capa Batente 605', NULL, 'Capa Batente 605', 'a4a67-batente-605.jpg', 1),
(196, 60, NULL, 'Capa Batente 615R', NULL, 'Capa Batente 615R', '68197-batente-615r.jpg', 1),
(197, 61, NULL, 'Capa Batente 617R', NULL, 'Capa Batente 617R', '234ab-batente-617r.jpg', 1),
(198, 62, NULL, 'Capa Batente 619', NULL, 'Capa Batente 619', '9e81a-batente-619.jpg', 1),
(199, 63, NULL, 'Capa Batente 624', NULL, 'Capa Batente 624', '5cce4-batente-624.jpg', 1),
(200, 64, NULL, 'Capa Batente 625', NULL, 'Capa Batente 625', 'bf8e2-batente-625.jpg', 1),
(201, 65, NULL, 'Capa Batente 628', NULL, 'Capa Batente 628', '2baae-batente-628.jpg', 1),
(204, 90, NULL, 'Capa Base 127', NULL, 'Capa Base 127', 'c37c2-base-127.jpg', 1),
(205, 91, NULL, 'Capa Base 153', NULL, 'Capa Base 153', 'c4fd4-base-153.jpg', 1),
(207, 93, NULL, 'Capa Base 156', NULL, 'Capa Base 156', 'de87c-base-156.jpg', 1),
(209, 95, NULL, 'Capa Base 174', NULL, 'Capa Base 174', '036aa-base-174.jpg', 1),
(211, 97, NULL, 'Capa Base 194', NULL, 'Capa Base 194', 'da50c-base-194.jpg', 1),
(212, 67, NULL, 'Capa Guarnição 751', NULL, 'Capa Guarnição 751', '5afa5-guarnicao-751.jpg', 1),
(213, 68, NULL, 'Capa Guarnição 761', NULL, 'Capa Guarnição 761', 'b6fef-guarnicao-761.jpg', 1),
(214, 69, NULL, 'Capa Guarnição 754', NULL, 'Capa Guarnição 754', '34912-guarnicao-754.jpg', 1),
(215, 70, NULL, 'Capa Guarnição 764', NULL, 'Capa Guarnição 764', '96b81-guarnicao-764.jpg', 1),
(216, 78, NULL, 'Capa Detalhes Guarnição 751/761', NULL, 'Capa Detalhes Guarnição 751/761', '79f38-detalhe-751_761.jpg', 1),
(217, 79, NULL, 'Capa Detalhes Guarnição 754/764', NULL, 'Capa Detalhes Guarnição 754/764', 'a649e-detalhe-754_764.jpg', 1),
(218, 83, NULL, 'Capa Sistema Meia Esquadria', NULL, 'Capa Sistema Meia Esquadria', '070c4-guarnicao-meia-esquadria.jpg', 1),
(219, 84, NULL, 'Capa Sistema H', NULL, 'Capa Sistema H', '6287c-guarnicao-sistema-h.jpg', 1),
(220, 75, NULL, 'Capa Bandeirola 109', NULL, 'Capa Bandeirola 109', 'b14fd-bandeirola-109.jpg', 1),
(221, 76, NULL, 'Capa Bandeirola 110', NULL, 'Capa Bandeirola 110', '2263b-bandeirola-110.jpg', 1),
(222, 77, NULL, 'Capa Bandeirola 112', NULL, 'Capa Bandeirola 112', '0a8c4-bandeirola-112.jpg', 1),
(223, 71, NULL, 'Capa Rodapé 790', NULL, 'Capa Rodapé 790', '602ae-rodape-790.jpg', 1),
(224, 72, NULL, 'Capa Rodapé 791', NULL, 'Capa Rodapé 791', '480a5-rodape-791.jpg', 1),
(225, 73, NULL, 'Capa Rodapé 793', NULL, 'Capa Rodapé 793', '9d747-rodape-793.jpg', 1),
(226, 74, NULL, 'Capa Rodapé 794', NULL, 'Capa Rodapé 794', '117e4-rodape-794.jpg', 1),
(227, 85, NULL, 'Capa Dimensões Giro', NULL, 'Capa Dimensões Giro', '450e5-capa-dimensoes-giro.jpg', 1),
(228, 87, NULL, 'Capa Dimensões Pivotante', NULL, 'Capa Dimensões Pivotante', '571a7-capa-dimensoes-pivotante.jpg', 1),
(229, 98, NULL, 'Capa Dimensões PRF-30', NULL, 'Capa Dimensões PRF-30', 'b7cab-capa-dimensoes-prf-30.jpg', 1),
(230, 100, NULL, 'Capa Dimensões Correr', NULL, 'Capa Dimensões Correr', '399d3-capa-dimensoes-correr.jpg', 1),
(234, 54, NULL, 'Chalé do Campo', NULL, 'Chalé do Campo', '8fc65-chale-do-campo.jpg', 0),
(235, 54, NULL, 'Cinza Grafite', NULL, 'Cinza Grafite', 'de72b-cinza-grafite.jpg', 0),
(236, 54, NULL, 'Cinza Níquel', NULL, 'Cinza Níquel', '6e041-cinza-niquel.jpg', 0),
(237, 54, NULL, 'Cinza Tubarão', NULL, 'Cinza Tubarão', '20751-cinza-tubarao.jpg', 0),
(238, 54, NULL, 'Galho Seco', NULL, 'Galho Seco', 'eab01-galho-seco.jpg', 0),
(240, 82, NULL, 'Pivotante Cinza Níquel', NULL, 'Pivotante Cinza Níquel', '75ea5-pivotante-cinza-niquel.jpg', 0),
(241, 50, NULL, 'Freijó Anegre - Fechadura', NULL, 'Freijó Anegre - Fechadura', '76475-detalhe-fechadura.jpg', 0),
(243, 50, NULL, 'Freijó Anegre - Fita Intumescente', NULL, 'Freijó Anegre - Fita Intumescente', '90fb4-detalhe-fita-intumescente.jpg', 0),
(245, 50, NULL, 'Freijó Anegre - Plaquetas de ID', NULL, 'Freijó Anegre - Plaquetas de ID', '82ab4-detalhe-plaquetas-de-identificacao.jpg', 0),
(246, 50, NULL, 'Freijó Anegre - Veda Porta', NULL, 'Freijó Anegre - Veda Porta', 'c93a1-detalhe-veda-porta.jpg', 0),
(247, 50, NULL, 'Grafite', NULL, 'Grafite', '5e5f9-prf-30-2.jpg', 0),
(248, 81, NULL, 'Detalhe Fechadura', NULL, 'Detalhe Fechadura', '54b06-detalhe-fechadura.jpg', 0),
(249, 81, NULL, 'Detalhe Limitador', NULL, 'Detalhe Limitador', '533f8-detalhe-limitador.jpg', 0),
(250, 81, NULL, 'Detalhe Topo', NULL, 'Detalhe Topo', '0a7af-detalhe-topo.jpg', 0),
(251, 81, NULL, 'Detalhe Fechadura Int', NULL, 'Detalhe Fechadura Int', 'b8633-detalhe-fechadura-int.jpg', 0),
(252, 101, NULL, 'Batente 635', NULL, 'Batente 635', '79b9b-batente-635.jpg', 0),
(253, 102, NULL, 'Batente 637', NULL, 'Batente 637', '831e3-batente-637.jpg', 0),
(254, 102, NULL, 'Capa Batente 637', NULL, 'Capa Batente 637', '69623-batente-637.jpg', 1),
(255, 101, NULL, 'Capa Batente 635', NULL, 'Capa Batente 635', 'ad63d-batente-635.jpg', 1),
(257, 103, NULL, 'Manual de Instalação Sinkit', NULL, 'Manual de Instação Sinkit', '5cdc2-manual-de-instalacao-do-sinkit.pdf', 0),
(259, 103, NULL, 'Catálogo Sincol', NULL, 'Catálogo Sincol', '47224-catalogo-sincol.pdf', 0),
(260, 103, NULL, 'Manual de Instalação PRF-30', NULL, 'Manual de Instalação PRF-30', 'd7033-manual-prf-30-2021-a4.pdf', 0),
(261, 103, NULL, 'Código de Práticas de Engenharia para Habitação', NULL, 'Código de Práticas de Engenharia para Habitação', '8061d-codigo-de-praticas-de-engenharia-para-habitacao.pdf', 0),
(263, 105, NULL, 'Itaúba U.V.', NULL, 'Itaúba 1', 'b9ab4-itauba-uv-1.jpg', 0),
(264, 105, NULL, 'Mogno U.V.', NULL, 'Mogno 1', '3880c-mogno-uv-1.jpg', 0),
(265, 105, NULL, 'Tabaco U.V.', NULL, 'Tabaco 1', '17e58-tabaco-uv-1.jpg', 0),
(266, 105, NULL, 'Capa Impressione', NULL, 'Capa', '4b06e-impressione.jpg', 1),
(267, 105, NULL, 'Itaúba U.V.', NULL, 'Itaúba 2', 'a9a17-itauba-uv-2.jpg', 0),
(268, 105, NULL, 'Mogno U.V.', NULL, 'Mogno 2', 'baa86-mogno-uv-2.jpg', 0),
(269, 105, NULL, 'Tabaco U.V.', NULL, 'Tabaco 2', 'ed12f-tabaco-uv-2.jpg', 0),
(270, 105, NULL, 'Itaúba U.V.', NULL, 'Itaúba 3', '97f5f-itauba-uv-3.jpg', 0),
(271, 105, NULL, 'Mogno U.V.', NULL, 'Mogno 3', '3e3fa-mogno-uv-3.jpg', 0),
(272, 105, NULL, 'Tabaco U.V.', NULL, 'Tabaco 3', '90a6d-tabaco-uv-3.jpg', 0),
(273, 106, NULL, 'Base 150', NULL, 'Base 150', '57b0c-base-150.jpg', 1),
(274, 106, NULL, 'Base 150', NULL, 'Base 150', '987d0-base-150.jpg', 0),
(275, 107, NULL, 'Base 159', NULL, 'Base 159', '74e0e-base-159.jpg', 0),
(276, 107, NULL, 'Capa Base 159', NULL, 'Capa Base 159', '6ba8f-base-159.jpg', 1),
(277, 108, NULL, 'Base 192', NULL, 'Base 192', '4bad2-base-192.jpg', 0),
(278, 108, NULL, 'Capa Base 192', NULL, 'Capa Base 192', 'c6e74-base-192.jpg', 1),
(279, 109, NULL, 'Coleções e Modelos', NULL, 'Coleções e Modelos', '3e590-bases-colecoes-e-modelos.jpg', 0),
(280, 109, NULL, 'Capa Coleções e Modelos', NULL, 'Coleções e Modelos', 'ba264-bases-colecoes-e-modelos.jpg', 1),
(281, 103, NULL, 'Capa Downloads', NULL, 'Capa Downloads', '83d5f-capa-downloads.jpg', 1),
(282, 98, NULL, 'Dimensões PRF-30', NULL, 'Dimensões PRF-30', '77832-dimensoes-prf-30-cor.jpg', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `laminas_produto`
--

CREATE TABLE `laminas_produto` (
  `lam_id` int(11) NOT NULL,
  `prd_id` int(11) DEFAULT NULL,
  `lam_titulo` varchar(256) DEFAULT NULL,
  `lam_legenda` varchar(256) DEFAULT NULL,
  `lam_descricao` text DEFAULT NULL,
  `lam_url` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `laminas_produto`
--

INSERT INTO `laminas_produto` (`lam_id`, `prd_id`, `lam_titulo`, `lam_legenda`, `lam_descricao`, `lam_url`) VALUES
(6, 54, 'Cinza Níquel', NULL, NULL, 'ea1e1-cinza-niquel.jpg'),
(7, 54, 'Gianduia', NULL, NULL, '56f70-gianduia.jpg'),
(8, 54, 'Tubarão', NULL, NULL, '317e5-cinza-tubarao.jpg'),
(9, 54, 'CInza Grafite', NULL, NULL, 'e3185-cinza-grafite.jpg'),
(10, 54, 'Chalé do Campo', NULL, NULL, 'e6bbd-chale-do-campo.jpg'),
(11, 54, 'Galho Seco', NULL, NULL, '8f26b-galho-seco.jpg'),
(12, 54, 'Preto TX', NULL, NULL, '43b4c-preto-tx.jpg'),
(13, 54, 'Branco P.U.', NULL, NULL, '15d9f-branco-p.u..jpg'),
(14, 54, 'Branco U.V.', NULL, NULL, '620df-branco-u.v..jpg'),
(15, 51, 'Freijó Anegre', NULL, NULL, '4bbd5-freijo-anegre.jpg'),
(16, 51, 'Curupixá Veneer', NULL, NULL, '5509f-curupixa-veneer.jpg'),
(17, 51, 'Cappuccino Noce', NULL, NULL, '83643-cappuccino-noce.jpg'),
(19, 52, 'Cappuccino Noce', NULL, NULL, 'e7bcf-cappuccino-noce.jpg'),
(20, 52, 'Curupixá Veneer', NULL, NULL, '550b5-curupixa-veneer.jpg'),
(21, 52, 'Freijó Anegre', NULL, NULL, '767c5-freijo-anegre.jpg'),
(22, 53, 'Freijó Anegre', NULL, NULL, 'e356f-freijo-anegre.jpg'),
(23, 53, 'Curupixá Veneer', NULL, NULL, '327c7-curupixa-veneer.jpg'),
(24, 53, 'Cappuccino Noce', NULL, NULL, '1377c-cappuccino-noce.jpg'),
(25, 105, 'Itaúba U.V.', NULL, NULL, '3e49b-itauba-u.v..jpg'),
(26, 105, 'Mogno U.V.', NULL, NULL, '5c5ea-mogno-u.v..jpg'),
(27, 105, 'Tabaco U.V.', NULL, NULL, 'c40ab-tabaco-u.v..jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `linha_tempo`
--

CREATE TABLE `linha_tempo` (
  `lnh_id` int(11) NOT NULL,
  `lnh_titulo` varchar(256) NOT NULL,
  `lnh_descricao` text NOT NULL,
  `lnh_imagem` varchar(256) DEFAULT NULL,
  `lnh_ordem` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `menu`
--

CREATE TABLE `menu` (
  `mnu_id` bigint(20) NOT NULL,
  `mnu_titulo` varchar(60) CHARACTER SET latin1 DEFAULT NULL,
  `mnu_categoria` varchar(256) CHARACTER SET latin1 DEFAULT NULL,
  `mnu_link` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `mnu_icone` varchar(50) CHARACTER SET latin1 NOT NULL,
  `mnu_ordem` int(11) NOT NULL,
  `mnu_pai` int(11) DEFAULT NULL,
  `mnu_status` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `menu`
--

INSERT INTO `menu` (`mnu_id`, `mnu_titulo`, `mnu_categoria`, `mnu_link`, `mnu_icone`, `mnu_ordem`, `mnu_pai`, `mnu_status`) VALUES
(2, 'Usuários', NULL, 'gerUsuario', 'fas fa-users', 2, NULL, 1),
(3, 'Menus', NULL, 'gerMenu', 'fas fa-bars', 1, NULL, 1),
(6, 'Banners', NULL, 'gerBanner', 'fas fa-image', 3, NULL, 1),
(10, 'Obras', NULL, 'gerNoticia', 'far fa-newspaper', 4, NULL, 1),
(11, 'Ger. Documentos', NULL, '#', 'fas fa-folder-open', 9, NULL, 1),
(12, 'Documentos', 'Ger. Documentos', 'gerDocumento', 'far fa-circle', 2, 11, 1),
(13, 'Categorias', 'Ger. Documentos', 'gerDocumento/categoria', 'far fa-circle', 1, 11, 1),
(14, 'Ger. Produtos', NULL, '#', 'fas fa-shopping-cart', 11, NULL, 1),
(15, 'Produtos', 'Ger. Produtos', 'gerProduto', 'far fa-circle', 1, 14, 1),
(16, 'Categorias', 'Ger. Produtos', 'gerProduto/categoria', 'far fa-circle', 2, 14, 1),
(17, 'Fotos', 'Ger. Produtos', 'gerProduto/fotos', 'far fa-circle', 3, 14, 1),
(18, 'Contatos', NULL, 'gerContato', 'fas fa-user', 5, NULL, 1),
(19, 'Ger. Portifólio', NULL, '#', 'fas fa-th', 10, NULL, 1),
(20, 'Portifólio', 'Ger. Portifólio', 'gerPortifolio', 'far fa-circle', 1, 19, 1),
(21, 'Categorias', 'Ger. Portifólio', 'gerPortifolio/categoria', 'far fa-circle', 2, 19, 1),
(22, 'Fotos', 'Ger. Portifólio', 'gerPortifolio/fotos', 'far fa-circle', 3, 19, 1),
(27, 'Ger. Representantes', NULL, 'gerRepresentante', 'fas fa-user-tie', 7, NULL, 1),
(31, 'Ger. Carrossel', NULL, '#', 'fas fa-grip-horizontal', 8, NULL, 1),
(32, 'Carrossel', 'Ger. Carrossel', 'gerCarrossel', 'far fa-circle', 1, 31, 1),
(33, 'Categorias', 'Ger. Carrossel', 'gerCarrossel/categoria', 'far fa-circle', 2, 31, 1),
(34, 'Ger. Quem somos', NULL, '#', 'far fa-newspaper', 12, NULL, 1),
(35, 'Conteúdos', 'Ger. Quem Somos\n', 'gerQuemsomos', 'far fa-circle', 1, 34, 1),
(36, 'Categorias', 'Ger. Quem Somos\n', 'gerQuemsomos/categoria', 'far fa-circle', 2, 34, 1),
(37, 'Arquivos', 'Ger. Quem Somos\n', 'gerQuemsomos/arquivos', 'far fa-circle', 3, 34, 1),
(38, 'Contatos', 'Ger. Representantes', 'gerRepresentante/contatos', 'far fa-circle', 2, 27, 1),
(39, 'Representantes', 'Ger. Representantes', 'gerRepresentante', 'far fa-circle', 1, 27, 1),
(40, 'Vagas', NULL, 'gerVagas', 'fas fa-user', 12, NULL, 1),
(41, 'Tipos', 'Ger. Produtos', 'gerProduto/tipoProduto', 'far fa-circle', 5, 14, 1),
(42, 'Linha do Tempo', 'Ger. Quem Somos\n', 'linhaTempo', 'fas fa-history', 4, 34, 1),
(43, 'Depoimentos', 'Ger. Depoimentos', 'gerDepoimento', 'fa fa-user', 3, NULL, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `menu_usuario`
--

CREATE TABLE `menu_usuario` (
  `mus_id` int(11) DEFAULT NULL,
  `mnu_id` bigint(20) DEFAULT NULL,
  `usr_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `menu_usuario`
--

INSERT INTO `menu_usuario` (`mus_id`, `mnu_id`, `usr_id`) VALUES
(29, 2, 1),
(28, 3, 1),
(27, 6, 1),
(26, 10, 1),
(25, 11, 1),
(23, 13, 1),
(24, 12, 1),
(19, 16, 1),
(20, 17, 1),
(21, 14, 1),
(22, 15, 1),
(18, 18, 1),
(14, 21, 1),
(15, 22, 1),
(16, 19, 1),
(17, 20, 1),
(13, 27, 1),
(10, 32, 1),
(11, 33, 1),
(12, 31, 1),
(6, 37, 1),
(7, 36, 1),
(8, 34, 1),
(9, 35, 1),
(6, 37, 20),
(7, 6, 20),
(8, 32, 20),
(9, 36, 20),
(10, 33, 20),
(11, 21, 20),
(12, 16, 20),
(13, 13, 20),
(14, 18, 20),
(15, 35, 20),
(16, 12, 20),
(17, 17, 20),
(18, 22, 20),
(19, 31, 20),
(20, 11, 20),
(21, 19, 20),
(22, 14, 20),
(23, 34, 20),
(24, 3, 20),
(25, 10, 20),
(26, 20, 20),
(27, 15, 20),
(28, 27, 20),
(6, 37, 21),
(7, 6, 21),
(8, 32, 21),
(9, 36, 21),
(10, 33, 21),
(11, 21, 21),
(12, 16, 21),
(13, 13, 21),
(14, 18, 21),
(15, 35, 21),
(16, 12, 21),
(17, 17, 21),
(18, 22, 21),
(19, 31, 21),
(20, 11, 21),
(21, 19, 21),
(22, 14, 21),
(23, 34, 21),
(24, 3, 21),
(25, 10, 21),
(26, 20, 21),
(27, 15, 21),
(28, 27, 21),
(4, 38, 1),
(5, 39, 1),
(4, 38, 20),
(5, 39, 20),
(4, 38, 21),
(5, 39, 21),
(3, 2, 21),
(3, 40, 1),
(2, 41, 1),
(3, 41, 20),
(1, 42, 1),
(2, 42, 20),
(2, 42, 21),
(0, 40, 21),
(1, 41, 21),
(0, 2, 20),
(1, 40, 20),
(0, 43, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `noticia`
--

CREATE TABLE `noticia` (
  `not_id` int(11) NOT NULL,
  `usr_id` bigint(20) NOT NULL,
  `not_titulo` varchar(256) DEFAULT NULL,
  `not_descricao` text DEFAULT NULL,
  `not_tag` varchar(256) NOT NULL,
  `not_slug` varchar(256) NOT NULL,
  `not_datahora` timestamp NOT NULL DEFAULT current_timestamp(),
  `not_cliques` int(11) NOT NULL DEFAULT 0,
  `not_status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `noticia`
--

INSERT INTO `noticia` (`not_id`, `usr_id`, `not_titulo`, `not_descricao`, `not_tag`, `not_slug`, `not_datahora`, `not_cliques`, `not_status`) VALUES
(1, 1, 'Entenda como funciona a porta corta-fogo PRF-30', '<p>Os investimentos em tecnologia na constru&ccedil;&atilde;o civil t&ecirc;m como principais objetivos garantir materiais de qualidade, seguran&ccedil;a e conforto nas edifica&ccedil;&otilde;es comerciais e residenciais. Nesse sentido, a porta corta-fogo PRF-30 &eacute; uma das op&ccedil;&otilde;es que deve constar em um projeto de constru&ccedil;&atilde;o ou reforma, em raz&atilde;o da prote&ccedil;&atilde;o para casos de inc&ecirc;ndios.<br />Por isso, elaboramos um artigo para esclarecer os benef&iacute;cios desse modelo de porta, al&eacute;m de detalhar como s&atilde;o avaliados os par&acirc;metros de seguran&ccedil;a e indica&ccedil;&otilde;es de uso. Continue a leitura e fique bem-informado.</p><p>O que &eacute; uma porta corta-fogo?</p><p>Inicialmente &eacute; preciso esclarecer que uma porta corta-fogo &eacute; desenvolvida para prote&ccedil;&atilde;o contra inc&ecirc;ndios em edifica&ccedil;&otilde;es residenciais e comerciais, como por exemplo, apartamentos e quartos de hot&eacute;is. Toda a estrutura &eacute; refor&ccedil;ada (porta e acess&oacute;rios) para impedir que as chamas e gases t&oacute;xicos se propaguem para outros ambientes do im&oacute;vel.<br />A norma que regula a qualidade do produto &eacute; a&nbsp;<a target=\"_blank\" href=\"https://www.normas.com.br/visualizar/abnt-nbr-nm/24737/abnt-nbr15281-porta-resistente-ao-fogo-para-entrada-de-unidades-autonomas-e-compartimentos-especificos-de-edificacoes\">NBR 15281</a>, respons&aacute;vel por especificar os requisitos para constru&ccedil;&atilde;o, instala&ccedil;&atilde;o, funcionamento, desempenho, manuten&ccedil;&atilde;o e ensaio das portas resistentes ao fogo. A classifica&ccedil;&atilde;o de resist&ecirc;ncia &agrave;s chamas &eacute; que diferencia os tipos de porta, por isso a corta-fogo PRF-30 indica que o material impede os riscos por at&eacute; 30 minutos.<br />Vale destacar que a metodologia utilizada para confirmar a resist&ecirc;ncia da porta em PRF-30, PRF-60 e PRF-90 abrange todos os componentes, como por exemplo: ferragens, bandeira, pain&eacute;is e revestimentos. Outra observa&ccedil;&atilde;o importante &eacute; que a folha de porta contenha a identifica&ccedil;&atilde;o do fabricante, a classe, n&uacute;mero de ordem, m&ecirc;s e ano de fabrica&ccedil;&atilde;o, em local vis&iacute;vel.</p><p>&nbsp;</p><p>Benef&iacute;cios da porta corta-fogo PRF-30</p><p>As portas PRF-30 foram constru&iacute;das para instala&ccedil;&otilde;es em pr&eacute;dios com grande circula&ccedil;&atilde;o de pessoas, como: hospitais, hot&eacute;is, centros comerciais, entre outros. Sua funcionalidade est&aacute; em oferecer prote&ccedil;&atilde;o estrat&eacute;gica em situa&ccedil;&otilde;es envolvendo princ&iacute;pios de inc&ecirc;ndio.<br />Quando pensamos nos benef&iacute;cios de uma porta com essa caracter&iacute;stica devemos lembrar que s&atilde;o projetadas para oferecerem resist&ecirc;ncia ou veda&ccedil;&atilde;o ao fogo e gases t&oacute;xicos, al&eacute;m do isolamento ac&uacute;stico. Por isso, apresentam a particularidade de serem instaladas em locais que possam oferecer uma sa&iacute;da para as pessoas que estiverem no local, no momento do incidente.</p><p>&nbsp;</p><p>Como escolher o melhor modelo de PRF-30?</p><p>A principal d&uacute;vida do cliente &eacute; definir qual porta corta-fogo &eacute; a ideal para as necessidades do projeto em andamento, pois, no mercado existem v&aacute;rias op&ccedil;&otilde;es e pre&ccedil;os. No primeiro momento, um pre&ccedil;o promocional pode ser atrativo, mas, &eacute; preciso conhecer as especifica&ccedil;&otilde;es do produto que se pretende adquirir, a fim de n&atilde;o se decepcionar com o resultado.<br />Com essa perspectiva, vamos detalhar o modelo de porta resistente ao fogo PRF-30 da Sincol que re&uacute;ne um hist&oacute;rico de sucesso na fabrica&ccedil;&atilde;o do equipamento h&aacute; 30 anos.<br />O kit Resistente ao Fogo foi elaborado em conformidade com as normas NBR 15281 (porta corta-fogo) e NBR 15930 (porta de madeira para edifica&ccedil;&otilde;es). Desse modo, o produto &eacute; indicado para resid&ecirc;ncias, apartamentos e edifica&ccedil;&otilde;es comerciais como hot&eacute;is.<br />A resist&ecirc;ncia e capacidade de isolamento, estanqueidade e integridade do material s&atilde;o verificados nas ferragens e acess&oacute;rios especiais, al&eacute;m do veda porta que proporciona a atenua&ccedil;&atilde;o ac&uacute;stica (classe C3) em at&eacute; 31 decib&eacute;is. As folhas s&atilde;o 100% compactas (estrutura exclusiva), resistentes ao fogo por at&eacute; 30 minutos e contam com fitas intumescentes nos batentes para impedir a passagem de gases t&oacute;xicos.</p><p>&nbsp;</p><p>Cuidados com o produto</p><p>A melhor maneira de preservar um produto &eacute; seguir as recomenda&ccedil;&otilde;es do fabricante, por isso cuidados b&aacute;sicos na limpeza aumentar&atilde;o a vida &uacute;til da porta resistente ao fogo da Sincol, evitando altera&ccedil;&otilde;es na estrutura original.<br />Nesse sentido, a primeira aten&ccedil;&atilde;o deve acontecer na limpeza, realizada com flanela ou pano &uacute;midos, levemente umedecidos com &aacute;gua. Evite usar produtos qu&iacute;micos como querosene, acetona, solventes ou lustra m&oacute;veis, j&aacute; que podem danificar a porta e invalidar a garantia.<br />Em situa&ccedil;&otilde;es de riscos ou afundamentos na camada superficial, a recomenda&ccedil;&atilde;o da<a target=\"_blank\" href=\"https://sincol.com.br/produtos/portas/50/prf30\">&nbsp;Sincol</a>&nbsp;&eacute; aplicar produtos como bast&atilde;o corretivo e caneta para retoques no acabamento. J&aacute; em situa&ccedil;&otilde;es de desgaste natural, as portas podem receber enverniza&ccedil;&atilde;o.<br />Como voc&ecirc; pode acompanhar, as portas corta-fogo PRF-30 s&atilde;o um produto de primeira necessidade em edifica&ccedil;&otilde;es comerciais e residenciais. Por isso, reconhecer as funcionalidades e benef&iacute;cios do material auxiliam na tomada de decis&atilde;o.<br />Acesse o&nbsp;<a target=\"_blank\" href=\"https://sincol.com.br/\">site da Sincol</a>&nbsp;e conhe&ccedil;a os modelos mais adequados para sua obra.|||</p><p>Investments in technology in civil construction have as main objectives to ensure quality materials, safety and comfort in commercial and residential buildings. In this sense, the PRF-30 fire door is one of the options that should be included in a construction or renovation project, due to its protection in case of fire.<br />Therefore, we have prepared an article to clarify the benefits of this door model, as well as detailing how the safety parameters and indications for use are evaluated. Read on and become well-informed.</p><p>What is a fire door?</p><p>First of all, it is necessary to clarify that a fire door is designed to protect against fire in residential and commercial buildings, such as apartments and hotel rooms. The entire structure is reinforced (door and accessories) to prevent the flames and toxic gases from spreading to other parts of the building.<br />The standard that regulates the quality of the product is the NBR 15281, responsible for specifying the requirements for construction, installation, operation, performance, maintenance, and testing of fire-resistant doors. The classification of flame resistance is what differentiates the types of doors, so the PRF-30 fire-resistant indicates that the material prevents risks for up to 30 minutes.<br />It is worth pointing out that the methodology used to confirm the door&#39;s resistance in PRF-30, PRF-60, and PRF-90 covers all components, such as: hardware, flag, panels, and coatings. Another important remark is that the door leaf must have the identification of the manufacturer, the class, order number, month and year of manufacture, in a visible place.</p><p>Benefits of the PRF-30 fire-door</p><p>PRF-30 doors were built for installations in buildings with large movement of people, such as: hospitals, hotels, shopping centers, among others. Its functionality lies in offering strategic protection in situations involving fire outbreaks.<br />When thinking about the benefits of a door with this characteristic we must remember that they are designed to offer resistance or sealing to fire and toxic gases, in addition to acoustic insulation. For this reason, they have the particularity of being installed in places that can offer an exit for people who are in the place at the time of the incident.</p><p>How to choose the best PRF-30 model?</p><p>The customer&#39;s main doubt is to define which fire door is ideal for the needs of the project in progress, because in the market there are several options and prices. In the first moment, a promotional price can be attractive, but it is necessary to know the specifications of the product you intend to purchase, in order not to be disappointed with the result.<br />With this in mind, we will detail Sincol&#39;s PRF-30 fire-resistant door model, which has a successful track record in manufacturing the equipment for 30 years.<br />The Fire Resistant kit was elaborated in compliance with the NBR 15281 (fire-resistant door) and NBR 15930 (wooden door for buildings) standards. Thus, the product is indicated for residences, apartments, and commercial buildings such as hotels.<br />The resistance and capacity of insulation, watertightness, and integrity of the material are verified in the special hardware and accessories, in addition to the door seal that provides acoustic attenuation (class C3) of up to 31 decibels. The sheets are 100% compact (exclusive structure), fire-resistant for up to 30 minutes, and have intumescent tapes on the frames to prevent the passage of toxic gases.</p><p>Caring for the product</p><p>The best way to preserve a product is to follow the manufacturer&#39;s recommendations, so basic care in cleaning will increase the useful life of Sincol&#39;s fire-resistant door, avoiding changes in the original structure.<br />In this sense, the first attention should be on the cleaning, which is done with a damp flannel or cloth, slightly dampened with water. Avoid using chemical products such as kerosene, acetone, solvents or furniture polish, as they can damage the door and void the warranty.<br />In situations of scratches or sinking in the surface layer, Sincol&#39;s recommendation is to apply products such as correction sticks and pens to touch up the finish. In situations of natural wear and tear, the doors can be varnished.<br />As you can see, PRF-30 fire doors are a product of prime necessity in commercial and residential buildings. Therefore, recognizing the functionalities and benefits of the material helps in the decision making process.<br />Visit Sincol&#39;s website and get to know the most suitable models for your project.</p><p>|||</p><p>Las inversiones en tecnolog&iacute;a en la construcci&oacute;n civil tienen como principales objetivos garantizar la calidad de los materiales, la seguridad y el confort en los edificios comerciales y residenciales. En este sentido, la puerta cortafuegos PRF-30 es una de las opciones que debe incluirse en un proyecto de construcci&oacute;n o reforma, debido a la protecci&oacute;n en caso de incendio.<br />Por este motivo, hemos preparado un art&iacute;culo para aclarar las ventajas de este modelo de puerta, adem&aacute;s de detallar c&oacute;mo se eval&uacute;an los par&aacute;metros de seguridad y las indicaciones de uso. Siga leyendo y ent&eacute;rese bien.</p><p>&iquest;Qu&eacute; es una puerta cortafuegos?</p><p>En primer lugar, es necesario aclarar que una puerta cortafuegos se desarrolla para la protecci&oacute;n contra incendios en edificios residenciales y comerciales, como pisos y habitaciones de hotel. Toda la estructura est&aacute; reforzada (puerta y accesorios) para evitar que las llamas y los gases t&oacute;xicos se propaguen a otras partes del edificio.<br />La norma que regula la calidad del producto es la NBR 15281, responsable por especificar los requisitos de construcci&oacute;n, instalaci&oacute;n, operaci&oacute;n, desempe&ntilde;o, mantenimiento y pruebas de las puertas resistentes al fuego. La clasificaci&oacute;n de la resistencia a las llamas es lo que diferencia a los tipos de puertas, por lo que la resistencia al fuego PRF-30 indica que el material previene los riesgos hasta 30 minutos.<br />Cabe destacar que la metodolog&iacute;a utilizada para confirmar la resistencia de la puerta en PRF-30, PRF-60 y PRF-90 abarca todos los componentes, como: herrajes, bandera, paneles y revestimientos. Otra observaci&oacute;n importante es que la hoja de la puerta debe contener la identificaci&oacute;n del fabricante, la clase, el n&uacute;mero de pedido, el mes y el a&ntilde;o de fabricaci&oacute;n, en un lugar visible.</p><p>Ventajas de las puertas cortafuegos PRF-30</p><p>Las puertas PRF-30 est&aacute;n dise&ntilde;adas para instalaciones en edificios con gran movimiento de personas, como: hospitales, hoteles, centros comerciales, entre otros. Su funcionalidad es ofrecer una protecci&oacute;n estrat&eacute;gica en situaciones de brotes de incendio.<br />Cuando pensamos en los beneficios de una puerta con esta caracter&iacute;stica debemos recordar que est&aacute;n dise&ntilde;adas para ofrecer resistencia o estanqueidad al fuego y a los gases t&oacute;xicos, as&iacute; como aislamiento ac&uacute;stico. Por ello, tienen la particularidad de instalarse en lugares que puedan ofrecer una salida a las personas que se encuentren en el lugar en el momento del siniestro.</p><p>&iquest;C&oacute;mo elegir el mejor modelo de PRF-30?</p><p>La principal duda del cliente es definir qu&eacute; puerta cortafuegos es la ideal para las necesidades del proyecto en curso, porque en el mercado hay varias opciones y precios. En un primer momento, un precio promocional puede resultar atractivo, pero es necesario conocer las especificaciones del producto que se pretende adquirir, para no decepcionarse con el resultado.<br />En este sentido, detallaremos el modelo de puerta ign&iacute;fuga PRF-30 de Sincol, que cuenta con una exitosa trayectoria en la fabricaci&oacute;n de estos equipos desde hace 30 a&ntilde;os.<br />El kit resistente al fuego fue elaborado en conformidad con las normas NBR 15281 (puerta resistente al fuego) y NBR 15930 (puerta de madera para edificios). Por lo tanto, el producto es adecuado para casas, pisos y edificios comerciales como hoteles.<br />La resistencia y la capacidad de aislamiento, la estanqueidad y la integridad del material se verifican en los herrajes y accesorios especiales, adem&aacute;s de la junta de la puerta que proporciona una atenuaci&oacute;n ac&uacute;stica (clase C3) de hasta 31 decibelios. Las planchas son 100% compactas (estructura exclusiva), resistentes al fuego hasta 30 minutos y cuentan con bandas intumescentes en las jambas de las puertas para evitar el paso de gases t&oacute;xicos.</p><p>Cuidado del producto</p><p>La mejor manera de conservar un producto es seguir las recomendaciones del fabricante, por lo que un cuidado b&aacute;sico en la limpieza aumentar&aacute; la vida &uacute;til de la puerta ign&iacute;fuga Sincol, evitando cambios en la estructura original.<br />En este sentido, la primera atenci&oacute;n debe darse en la limpieza, realizada con una franela o pa&ntilde;o h&uacute;medo, ligeramente humedecido con agua. Evite utilizar productos qu&iacute;micos como parafina, acetona, disolventes o cera para muebles, ya que pueden da&ntilde;ar la puerta y anular la garant&iacute;a.<br />En situaciones de ara&ntilde;azos o hundimientos en la capa superficial, la recomendaci&oacute;n de Sincol es aplicar productos como barras correctoras y rotuladores para retocar el acabado. En situaciones de desgaste natural, las puertas pueden ser barnizadas.<br />Como puede ver, las puertas cortafuegos PRF-30 son un producto de primera necesidad en edificios comerciales y residenciales. Por lo tanto, reconocer las funcionalidades y beneficios del material ayuda en el proceso de toma de decisiones.<br />Acceda a la web de Sincol y conozca los modelos m&aacute;s adecuados para su trabajo.</p><p>&nbsp;</p>', 'teste;teste;', 'teste', '2022-07-28 18:13:01', 3, 1),
(2, 1, 'Saiba por que o Kit porta pronta é ideal para sua obra|||Learn why the door-ready kit is ideal for your construction site|||Descubra por qué el kit de puerta es ideal para su obra', '<p>4 minutos para ler</p><p>A busca por solu&ccedil;&otilde;es pr&aacute;ticas e de alta qualidade movimenta o setor de constru&ccedil;&atilde;o, no sentido de oferecer servi&ccedil;os e produtos que agilizem a conclus&atilde;o de projetos comerciais e residenciais. Um dos componentes que se destacou nesse processo foi o kit de porta pronta, por reunirem: porta, batente, dobradi&ccedil;as, fechadura e demais acess&oacute;rios.</p><p>Com essa perspectiva elaboramos um artigo para detalhar os aspectos que conquistaram construtoras e profissionais do mercado (engenheiros, arquitetos e gestores de obras), em raz&atilde;o da economia de tempo e or&ccedil;amento, al&eacute;m da variedade de op&ccedil;&otilde;es dispon&iacute;veis no mercado. Ent&atilde;o se voc&ecirc; ainda n&atilde;o decidiu qual a op&ccedil;&atilde;o ideal para seu projeto, continue a leitura para ficar bem-informado sobre o assunto.</p><p>|||</p><p>4 minutes to read The search for practical and high quality solutions moves the construction sector, in the sense of offering services and products that speed up the completion of commercial and residential projects. One of the components that stood out in this process was the ready-made door kit, as it includes: door, jamb, hinges, lock and other accessories. With this perspective, we prepared an article to detail the aspects that conquered construction companies and professionals in the market (engineers, architects and construction managers), due to the savings in time and budget, in addition to the variety of options available in the market. So if you still haven&#39;t decided which option is ideal for your project, keep reading to stay well informed on the subject.</p><p>|||</p><p>4 minutos para leer La b&uacute;squeda de soluciones pr&aacute;cticas y de alta calidad mueve al sector de la construcci&oacute;n, en el sentido de ofrecer servicios y productos que agilicen la finalizaci&oacute;n de proyectos comerciales y residenciales. Uno de los componentes que se destac&oacute; en este proceso fue el kit de puerta prefabricado, ya que incluye: puerta, jamba, bisagras, cerradura y otros accesorios. Con esta perspectiva, preparamos un art&iacute;culo para detallar los aspectos que conquistaron a las constructoras y profesionales del mercado (ingenieros, arquitectos y jefes de obra), debido al ahorro en tiempo y presupuesto, adem&aacute;s de la variedad de opciones disponibles en el mercado. . As&iacute; que si a&uacute;n no has decidido qu&eacute; opci&oacute;n es la ideal para tu proyecto, sigue leyendo para mantenerte bien informado sobre el tema.</p>', 'teste;teste;', 'teste', '2022-07-29 11:25:12', 0, 1),
(3, 1, 'Entenda a diferença entre Pintura U.V. e P.U.|||Understand the difference between U.V. and P.U. Painting||| Comprender la diferencia entre la pintura U.V. y P.U.', '<p>Entenda a diferen&ccedil;a entre Pintura U.V. e P.U.</p><p>Por&nbsp;<a href=\"https://blog.sincol.com.br/author/sincol/\">Equipe Sincol</a>&nbsp;em&nbsp;novembro 12, 2021</p><p>4 minutos para ler</p><p>A praticidade na compra de produtos para instala&ccedil;&atilde;o ou uso imediato conquistou a prefer&ecirc;ncia dos consumidores brasileiros. Por isso, as op&ccedil;&otilde;es de materiais de constru&ccedil;&atilde;o (portas e janelas) ou m&oacute;veis de madeira com pintura definitiva se multiplicam nos portf&oacute;lios das empresas.&nbsp;</p><p>Com esse entendimento, uma d&uacute;vida recorrente &eacute; qual o acabamento apresenta maior durabilidade ou oferece maior prote&ccedil;&atilde;o contra intemp&eacute;ries clim&aacute;ticas. Nesse artigo, apresentaremos dois materiais que se destacam na &aacute;rea de acabamento em pintura, por oferecerem solu&ccedil;&otilde;es que v&atilde;o da prote&ccedil;&atilde;o contra os raios solares at&eacute; a secagem feita com raios ultravioletas.&nbsp;</p><p>&nbsp;</p><p><strong>Conte&uacute;do</strong>&nbsp;&nbsp;<a href=\"https://blog.sincol.com.br/pintura-u-v-e-pintura-p-u/#\">ocultar</a>&nbsp;</p><p><a href=\"https://blog.sincol.com.br/pintura-u-v-e-pintura-p-u/#O_que_e_tinta_UV_e_PU\">1&nbsp;O que &eacute; tinta U.V. e P.U.?</a></p><p><a href=\"https://blog.sincol.com.br/pintura-u-v-e-pintura-p-u/#Qual_a_melhor_opcao_para_madeiras\">2&nbsp;Qual a melhor op&ccedil;&atilde;o para madeiras?</a></p><p><strong>O que &eacute; tinta U.V. e P.U.?</strong></p><p>Inicialmente &eacute; preciso esclarecer que a&nbsp;<a href=\"https://emobile.com.br/site/\">tinta U.V</a>. &eacute; um produto utilizado para acabamento de pinturas convencionais ou aplicadas em m&oacute;veis e portas de madeira, por exemplo. Ap&oacute;s a aplica&ccedil;&atilde;o, a pe&ccedil;a &eacute; exposta aos efeitos de l&acirc;mpadas ultravioletas que realizam um processo fotoqu&iacute;mico, conferindo efeitos como solidifica&ccedil;&atilde;o e polimeriza&ccedil;&atilde;o.&nbsp;</p><p>O material &eacute; livre de solventes, tornando-o uma op&ccedil;&atilde;o altamente sustent&aacute;vel j&aacute; que a a&ccedil;&atilde;o qu&iacute;mica da luz endurece a tinta, evitando libera&ccedil;&atilde;o de res&iacute;duos para a atmosfera. Outro diferencial &eacute; garantir a intensifica&ccedil;&atilde;o das cores nas bases de diferentes tipos de suporte.&nbsp;</p><p>Em contrapartida, a&nbsp;<a href=\"https://www.perfortex.com.br/produtos/tinta-poliuretano\">tinta P.U</a>. &eacute; composta por laca poliuretano e re&uacute;ne caracter&iacute;sticas como resist&ecirc;ncia a intemp&eacute;ries clim&aacute;ticas e alta ader&ecirc;ncia em diferentes tipos de materiais (madeiras, metais e pl&aacute;sticos mais encorpados).&nbsp;</p><p>Por essa condi&ccedil;&atilde;o, tamb&eacute;m &eacute; indicada para colora&ccedil;&atilde;o de &aacute;reas externas de im&oacute;veis residenciais e comerciais, devido a a&ccedil;&atilde;o monol&iacute;tica (camada &uacute;nica) e de f&aacute;cil higieniza&ccedil;&atilde;o. Quando se avalia o resultado em madeiras, a pintura apresenta o efeito laqueado (brilho intenso) e proporciona prote&ccedil;&atilde;o contra impactos, riscos e contatos abrasivos.&nbsp;</p><p>&nbsp;</p><p><strong>Qual a melhor op&ccedil;&atilde;o para madeiras?</strong></p><p>Depois dos esclarecimentos sobre cada tipo de produto &eacute; v&aacute;lido ressaltar que ambos apresentam altos &iacute;ndices de qualidade quando aplicados em pe&ccedil;as de madeira. Por isso, a quest&atilde;o que deve ser observada &eacute; se o material que receber&aacute; a pintura n&atilde;o apresenta incompatibilidade.&nbsp;</p><p>Um exemplo pode ser direcionado para a&nbsp;<a href=\"http://wsprint.ind.br/blog/noticias/impressao-uv-quais-as-vantagens-de-utilizar-em-suas-pecas/\">pintura U.V</a>. que n&atilde;o pode ser utilizada em tecidos j&aacute; que a trama do material (espa&ccedil;os) absorver&aacute; a tinta, atrapalhando o processo de secagem e consequentemente, o efeito qu&iacute;mico. Contudo, as op&ccedil;&otilde;es de aplica&ccedil;&atilde;o s&atilde;o amplas e incluem: lonas, espuma, MDF, vidro, adesivos, entre outros insumos.&nbsp;</p><p>No caso de madeiras, o uso do produto proporciona acabamentos com efeitos mais intensos (destacando a cor original), durabilidade da pe&ccedil;a, al&eacute;m do destaque em rela&ccedil;&atilde;o a n&atilde;o utiliza&ccedil;&atilde;o de solventes.&nbsp;</p><p>Uma sugest&atilde;o indicada por&nbsp;<a href=\"https://emobile.com.br/site/varejo/acabamento-dos-moveis-bp-uv/\">profissionais</a>&nbsp;para avaliar a qualidade da pintura U.V. &eacute; questionar a gramatura da aplica&ccedil;&atilde;o de cobertura. Essa informa&ccedil;&atilde;o t&eacute;cnica define produtos com melhor qualidade, lembrando que a medida ideal &eacute; de pelo menos, 80 miligramas por metro quadrado.&nbsp;</p><p>Do mesmo modo, a pintura P.U. possibilita efeitos variados que v&atilde;o do fosco ao brilho intenso. O resultado &eacute; possibilitado pelos componentes que combinam pigmentos org&acirc;nicos e resinas qu&iacute;micas como poli&eacute;steres, respons&aacute;veis por excelentes resultados em pe&ccedil;as de madeira.&nbsp;</p><p>Al&eacute;m disso, s&atilde;o identificadas condi&ccedil;&otilde;es como secagem r&aacute;pida, bom espalhamento da tinta e uma resist&ecirc;ncia extra no material que recebe o produto. Contudo,&nbsp;<a href=\"https://www.aprimoredecor.com.br/tinta-para-madeira/\">especialistas</a>&nbsp;alertam que essa tinta necessita de solventes qu&iacute;micos, cabines de pintura e utiliza&ccedil;&atilde;o de equipamentos de prote&ccedil;&atilde;o individual (EPIs), a fim de proteger a sa&uacute;de dos respons&aacute;veis pelo trabalho.&nbsp;</p><p><strong>Com essas informa&ccedil;&otilde;es, esperamos que voc&ecirc; tenha esclarecido as d&uacute;vidas sobre as pinturas U.V. e P.U. A linha de portas da Sincol apresenta diversos modelos com as duas op&ccedil;&otilde;es de acabamento. Ficou interessado em conhecer nosso portf&oacute;lio? Clique no&nbsp;</strong><a href=\"https://sincol.com.br/produtos/portas\"><strong>site</strong></a><strong>&nbsp;e confira.&nbsp;</strong></p><p><strong>|||</strong></p><p>&nbsp;</p><p><strong>Understand the difference between U.V. Painting and P.U.</strong></p><p><strong>By Sincol Team on November 12, 2021</strong></p><p><strong>4 minutes to read</strong></p><p><strong>The practicality in buying products for immediate installation or use has conquered the preference of Brazilian consumers. For this reason, the options of construction materials (doors and windows) or wood furniture with permanent painting are multiplying in the companies&#39; portfolios.&nbsp;</strong></p><p><strong>With this understanding, a recurring question is which finish has greater durability or offers greater protection against bad weather. In this article, we will present two materials that stand out in the paint finishing area, for offering solutions that range from protection against the sun&#39;s rays to drying made with ultraviolet rays.&nbsp;</strong></p><p><strong>Hide content&nbsp;</strong></p><p><strong>1 What is U.V. and P.U. paint?</strong></p><p><strong>2 Which is best for wood?</strong></p><p><strong>What is U.V. and P.U. paint?</strong></p><p><strong>Initially it is necessary to clarify that the U.V. paint is a product used for finishing conventional paintings or applied to wood furniture and doors, for example. After application, the piece is exposed to the effects of ultraviolet lamps that carry out a photochemical process, giving effects such as solidification and polymerization.&nbsp;</strong></p><p><strong>The material is solvent-free, making it a highly sustainable option, since the chemical action of the light hardens the paint, avoiding the release of residues into the atmosphere. Another differential is to ensure the intensification of colors on the bases of different types of support.&nbsp;</strong></p><p><strong>On the other hand, the P.U. paint is composed of polyurethane lacquer and combines characteristics such as resistance to bad weather and high adherence to different types of materials (wood, metals, and thicker plastics).&nbsp;</strong></p><p><strong>For this reason, it is also indicated for coloring the external areas of residential and commercial properties, due to its monolithic action (single layer) and easy cleaning. When the result on wood is evaluated, the painting presents a lacquered effect (intense shine) and provides protection against impacts, scratches, and abrasive contacts.&nbsp;</strong></p><p><strong>What is the best option for wood?</strong></p><p><strong>After the explanations about each type of product, it is worth pointing out that both present high levels of quality when applied to wood pieces. Therefore, the question that must be observed is whether the material that will receive the painting does not present incompatibility.&nbsp;</strong></p><p><strong>An example of this can be the U.V. painting that cannot be used on fabrics since the weft of the material (spaces) will absorb the paint, hindering the drying process and, consequently, the chemical effect. However, the application options are wide and include: canvas, foam, MDF, glass, adhesives, among other materials.&nbsp;</strong></p><p><strong>In the case of wood, the use of the product provides finishes with more intense effects (highlighting the original color), durability of the piece, in addition to the highlight in relation to the non-use of solvents.&nbsp;</strong></p><p><strong>A suggestion indicated by professionals to evaluate the quality of U.V. painting is to question the grammage of the coating application. This technical information defines products with better quality, remembering that the ideal measure is at least 80 milligrams per square meter.&nbsp;</strong></p><p><strong>In the same way, the P.U. painting makes possible varied effects that go from matte to intense shine. The result is made possible by components that combine organic pigments and chemical resins such as polyesters, responsible for excellent results in wood pieces.&nbsp;</strong></p><p><strong>In addition, conditions such as quick drying, good paint spreading, and an extra resistance in the material that receives the product are identified. However, experts warn that this paint requires chemical solvents, paint booths, and the use of personal protective equipment (PPE), in order to protect the health of those responsible for the work.&nbsp;</strong></p><p><strong>With this information, we hope you have cleared up your doubts about the U.V. and P.U. Painting. Sincol&#39;s line of doors presents several models with both finishing options. Are you interested in getting to know our portfolio? Click on the site and check it out.&nbsp;</strong></p><p><strong>|||</strong></p><p>&nbsp;</p><p><strong>Comprender la diferencia entre la pintura U.V. y la P.U.</strong></p><p><strong>By Sincol Team on noviembre 12, 2021</strong></p><p><strong>4 minutos para leer</strong></p><p><strong>La practicidad de comprar productos para su instalaci&oacute;n o uso inmediato ha ganado la preferencia de los consumidores brasile&ntilde;os. Por ello, las opciones de materiales de construcci&oacute;n (puertas y ventanas) o de muebles de madera con pintura permanente se multiplican en las carteras de las empresas.&nbsp;</strong></p><p><strong>Entendiendo esto, una pregunta recurrente es qu&eacute; acabado es m&aacute;s duradero u ofrece mayor protecci&oacute;n contra las inclemencias del tiempo. En este art&iacute;culo, presentaremos dos materiales que se destacan en el &aacute;rea de acabado de pinturas, por ofrecer soluciones que van desde la protecci&oacute;n contra los rayos del sol hasta el secado hecho con rayos ultravioleta.&nbsp;</strong></p><p><strong>Ocultar contenido&nbsp;</strong></p><p><strong>1 &iquest;Qu&eacute; es la pintura U.V. y P.U.?</strong></p><p><strong>2 &iquest;Cu&aacute;l es la mejor opci&oacute;n para la madera?</strong></p><p><strong>&iquest;Qu&eacute; es la pintura U.V. y P.U.?</strong></p><p><strong>Inicialmente es necesario aclarar que la pintura U.V. es un producto utilizado para el acabado de pinturas convencionales o aplicado en muebles y puertas de madera, por ejemplo. Tras la aplicaci&oacute;n, la pieza se expone a los efectos de l&aacute;mparas ultravioletas que realizan un proceso fotoqu&iacute;mico, dando efectos como la solidificaci&oacute;n y la polimerizaci&oacute;n.&nbsp;</strong></p><p><strong>El material no contiene disolventes, lo que lo convierte en una opci&oacute;n altamente sostenible, ya que la acci&oacute;n qu&iacute;mica de la luz endurece la pintura, evitando la emisi&oacute;n de residuos a la atm&oacute;sfera. Otro diferencial es que asegura la intensificaci&oacute;n de los colores sobre bases de diferentes tipos de soporte.&nbsp;</strong></p><p><strong>Por otro lado, la pintura P.U. est&aacute; compuesta por laca de poliuretano y re&uacute;ne caracter&iacute;sticas como la resistencia a la intemperie y la alta adherencia a diferentes tipos de materiales (madera, metales y pl&aacute;sticos m&aacute;s gruesos).&nbsp;</strong></p><p><strong>Debido a esta condici&oacute;n, tambi&eacute;n est&aacute; indicado para colorear las zonas exteriores de inmuebles residenciales y comerciales, por su acci&oacute;n monol&iacute;tica (monocapa) y su f&aacute;cil limpieza. Cuando se eval&uacute;a el resultado sobre la madera, la pintura tiene un efecto lacado (brillo intenso) y proporciona protecci&oacute;n contra los impactos, los ara&ntilde;azos y los contactos abrasivos.&nbsp;</strong></p><p><strong>&iquest;Cu&aacute;l es la mejor opci&oacute;n para la madera?</strong></p><p><strong>Tras las explicaciones sobre cada tipo de producto, cabe destacar que ambos tienen altos niveles de calidad cuando se aplican a piezas de madera. Por lo tanto, la cuesti&oacute;n que hay que observar es si el material que va a recibir el trabajo de pintura no presenta ninguna incompatibilidad.&nbsp;</strong></p><p><strong>Un ejemplo de ello puede ser la pintura U.V., que no puede utilizarse en los tejidos porque la trama del material (espacios) absorber&aacute; la pintura, dificultando el proceso de secado y, en consecuencia, el efecto qu&iacute;mico. Sin embargo, las opciones de aplicaci&oacute;n son amplias e incluyen: lona, espuma, MDF, vidrio, adhesivos, entre otros materiales.&nbsp;</strong></p><p><strong>En el caso de la madera, el uso del producto proporciona acabados con efectos m&aacute;s intensos (resaltando el color original), durabilidad de la pieza, adem&aacute;s de no utilizar disolventes.&nbsp;</strong></p><p><strong>Una sugerencia indicada por los profesionales para evaluar la calidad de la pintura U.V. es cuestionar el gramaje de la aplicaci&oacute;n del revestimiento. Esta informaci&oacute;n t&eacute;cnica define los productos de mayor calidad, recordando que la medida ideal es de al menos 80 miligramos por metro cuadrado.&nbsp;</strong></p><p><strong>Del mismo modo, la pintura U.P. posibilita efectos variados que van del mate al brillo intenso. El resultado es posible gracias a los componentes que combinan pigmentos org&aacute;nicos y resinas qu&iacute;micas como los poli&eacute;steres, responsables de los excelentes resultados en las piezas de madera.&nbsp;</strong></p><p><strong>Adem&aacute;s, se identifican condiciones como el secado r&aacute;pido, el buen esparcimiento de la pintura y una resistencia extra en el material que recibe el producto. Sin embargo, los expertos advierten que esta pintura requiere disolventes qu&iacute;micos, cabinas de pintura y el uso de equipos de protecci&oacute;n individual (EPI), con el fin de proteger la salud de los responsables del trabajo.&nbsp;</strong></p><p><strong>Con esta informaci&oacute;n, esperamos que haya aclarado sus dudas sobre la pintura U.V. y P.U. La l&iacute;nea de puertas de Sincol tiene varios modelos con ambas opciones de acabado. &iquest;Est&aacute; interesado en conocer nuestra cartera? Haga clic en el sitio web y compru&eacute;belo.&nbsp;</strong></p>', 'teste;teste;', 'teste', '2022-07-29 12:27:56', 0, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `noticia_midia`
--

CREATE TABLE `noticia_midia` (
  `nmi_id` int(11) NOT NULL,
  `not_id` int(11) DEFAULT NULL,
  `nmi_tipo` enum('Vídeo Youtube','Áudio','Imagem') DEFAULT NULL,
  `nmi_url` varchar(256) DEFAULT NULL,
  `nmi_arquivo` varchar(256) DEFAULT NULL,
  `nmi_arquivo_old` varchar(256) DEFAULT NULL,
  `nmi_ordem` int(11) NOT NULL DEFAULT 0,
  `nmi_capa` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `noticia_midia`
--

INSERT INTO `noticia_midia` (`nmi_id`, `not_id`, `nmi_tipo`, `nmi_url`, `nmi_arquivo`, `nmi_arquivo_old`, `nmi_ordem`, `nmi_capa`) VALUES
(18, 2, NULL, NULL, 'midia/2022/07/09fd4-design-sem-nome.jpg', 'midia/2022/07/09fd4-design-sem-nome.jpg', 1, 0),
(21, 1, NULL, NULL, 'midia/2022/07/c6dfd-design-sem-nome.jpg', 'midia/2022/07/c6dfd-design-sem-nome.jpg', 1, 1),
(22, 2, NULL, NULL, 'midia/2022/07/ccc22-kit-porta-pronta-1080x508.png', 'midia/2022/07/ccc22-kit-porta-pronta-1080x508.png', 2, 1),
(23, 3, NULL, NULL, 'midia/2022/07/3fb44-entenda-a-diferenca-entre-pintura-u-v-e-p-u-1080x508.png', 'midia/2022/07/3fb44-entenda-a-diferenca-entre-pintura-u-v-e-p-u-1080x508.png', 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `parceiro`
--

CREATE TABLE `parceiro` (
  `prc_id` int(11) NOT NULL,
  `cat_id` int(11) DEFAULT NULL,
  `prc_titulo` varchar(256) DEFAULT NULL,
  `prc_descricao` text DEFAULT NULL,
  `prc_img` varchar(256) DEFAULT NULL,
  `prc_status` tinyint(1) DEFAULT 1,
  `prc_datahora` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `parceiro`
--

INSERT INTO `parceiro` (`prc_id`, `cat_id`, `prc_titulo`, `prc_descricao`, `prc_img`, `prc_status`, `prc_datahora`) VALUES
(1, 1, 'ABNT', '<p>Selo ABNT</p>', 'f14f6-logo-abnt.jpg', 1, '2021-01-27 11:07:34'),
(2, 1, 'FSC', '<p>Lofo FSC</p><div id=\"gtx-trans\" style=\"position: absolute; left: -290px; top: 38px;\"><div class=\"gtx-trans-icon\">&nbsp;</div></div>', 'b7d49-logo-fsc.jpg', 1, '2021-01-27 11:08:31'),
(3, 1, 'Programa setorial da qualidade', '<p>Programa setorial da qualidade</p>', 'a6078-logo-psq.jpg', 1, '2021-01-27 11:08:53'),
(4, 1, 'Iso', '<p>Logo ISO</p>', 'c8f2d-selo-iso-novo.jpg', 1, '2021-01-27 11:09:15'),
(5, 2, 'historia1', '<p>historia1</p>', '831f6-historia01_g.jpg', 1, '2021-01-28 15:07:19'),
(6, 2, 'historia2', '<p>historia2</p>', '0295a-historia02_g.jpg', 1, '2021-01-28 15:07:36'),
(7, 2, 'historia3', '<p>historia3</p>', '24ce1-historia03_g.jpg', 1, '2021-01-28 15:07:51'),
(8, 2, 'historia4', '<p>historia4</p>', '01224-historia04_g.jpg', 1, '2021-01-28 15:08:07'),
(9, 2, 'historia5', '<p>historia4</p>', '80c9b-historia05_g.jpg', 1, '2021-01-28 15:08:20');

-- --------------------------------------------------------

--
-- Estrutura da tabela `parceiro_categoria`
--

CREATE TABLE `parceiro_categoria` (
  `cat_id` int(11) NOT NULL,
  `cat_pai` int(11) DEFAULT NULL,
  `cat_titulo` varchar(256) DEFAULT NULL,
  `cat_descricao` text DEFAULT NULL,
  `cat_img` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `parceiro_categoria`
--

INSERT INTO `parceiro_categoria` (`cat_id`, `cat_pai`, `cat_titulo`, `cat_descricao`, `cat_img`) VALUES
(1, NULL, 'Certificações', '<p>asdasdassdaasdsa</p>', NULL),
(2, NULL, 'Quem Somos', '<p>Quem Somos</p>', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `portifolio`
--

CREATE TABLE `portifolio` (
  `prt_id` int(11) NOT NULL,
  `cat_id` int(11) DEFAULT NULL,
  `prt_titulo` varchar(256) DEFAULT NULL,
  `prt_descricao` text DEFAULT NULL,
  `prt_slug` varchar(256) NOT NULL,
  `prt_status` tinyint(1) DEFAULT 1,
  `prt_datahora` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `portifolio`
--

INSERT INTO `portifolio` (`prt_id`, `cat_id`, `prt_titulo`, `prt_descricao`, `prt_slug`, `prt_status`, `prt_datahora`) VALUES
(1, 3, 'Lorem ||| Teste', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p><p>|||</p><p>Lorem english ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', 'lorem', 1, '2021-01-26 17:26:05'),
(2, 3, 'Lorem', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', 'lorem', 1, '2021-01-26 17:28:20');

-- --------------------------------------------------------

--
-- Estrutura da tabela `portifolio_categoria`
--

CREATE TABLE `portifolio_categoria` (
  `cat_id` int(11) NOT NULL,
  `cat_pai` int(11) DEFAULT NULL,
  `cat_titulo` varchar(256) DEFAULT NULL,
  `cat_descricao` text DEFAULT NULL,
  `cat_img` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `portifolio_categoria`
--

INSERT INTO `portifolio_categoria` (`cat_id`, `cat_pai`, `cat_titulo`, `cat_descricao`, `cat_img`) VALUES
(1, NULL, 'Sem categoria', '<p>Sem categoria</p>', NULL),
(3, NULL, 'Empreendimentos ||| Enterprises', '<p>Essa aba ainda est&aacute; em manuten&ccedil;&atilde;o, em breve teremos mais novidades</p><p>|||</p><p>Lorem english ipsum dolor, sit amet consectetur adipisicing elit. Magni voluptatibus perferendis nam praesentium hic veritatis, in adipisci itaque, sed voluptate cupiditate, laudantium molestiae ea consectetur dicta nobis necessitatibus ipsam? Vitae.</p>', '1db2b-img_9535.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `prd_id` int(11) NOT NULL,
  `tpr_id` int(11) NOT NULL DEFAULT 1,
  `cat_id` int(11) DEFAULT NULL,
  `prd_titulo` varchar(256) DEFAULT NULL,
  `prd_descricao` text DEFAULT NULL,
  `prd_tags` varchar(256) DEFAULT NULL,
  `prd_status` tinyint(1) NOT NULL DEFAULT 1,
  `prd_ordem` int(11) DEFAULT NULL,
  `prd_datahora` datetime NOT NULL DEFAULT current_timestamp(),
  `prd_slug` varchar(256) NOT NULL,
  `prd_submenu` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`prd_id`, `tpr_id`, `cat_id`, `prd_titulo`, `prd_descricao`, `prd_tags`, `prd_status`, `prd_ordem`, `prd_datahora`, `prd_slug`, `prd_submenu`) VALUES
(20, 2, 10, 'Giro ||| Spin', '<p>.</p>', 'Sistemas', 1, NULL, '2021-02-16 16:42:05', 'giro', 0),
(21, 2, 10, 'Pivotante ||| Pivoting Door', '<p>.</p>', 'Sistemas', 1, NULL, '2021-02-16 16:44:30', 'pivotante', 0),
(22, 2, 10, 'Correr ||| Sliding Door', '<p>.</p>', 'Sistemas', 1, NULL, '2021-02-16 16:45:21', 'correr', 0),
(23, 2, 10, 'Shaft ||| Shaft', '<p>.</p>', 'Sistemas', 1, NULL, '2021-02-16 16:46:12', 'shaft', 0),
(24, 2, 10, 'Vai-e-vem ||| Swinging Door', '<p>.</p>', 'Sistemas', 1, NULL, '2021-02-16 16:47:18', 'vai-e-vem', 0),
(25, 2, 10, 'Sanfonada ||| Folding Door', '<p>.</p>', 'Sistemas', 1, NULL, '2021-02-16 16:48:14', 'sanfonada', 0),
(26, 2, 10, 'Camarão ||| Lorem', '<p>.</p>', 'Sistemas', 1, NULL, '2021-02-16 16:49:02', 'camarao', 0),
(48, 4, 5, 'Coleção Creative ||| Creative Collection ||| Coleção Creative', '<p>A cole&ccedil;&atilde;o Creative Sincol foi desenvolvida dentro de um alto rigor t&eacute;cnico, tendo como principal destaque seus frisos,&nbsp;nos modelos da Sincol&nbsp;ou&nbsp;personalizados&nbsp;de acordo com o projeto de cada cliente, tornando as portas &uacute;nicas e exclusivas.</p><ul><li><strong>Portas:</strong>&nbsp;Com frisos em baixo relevo,&nbsp;sistema de Acabamento U.V. e P.U. (laqueado);</li><li><strong>Batente e Guarni&ccedil;&otilde;es:</strong>&nbsp;Revestidos;</li><li><strong>Certifica&ccedil;&atilde;o:</strong>&nbsp;Classifica&ccedil;&atilde;o de desempenho PEM-RU e&nbsp;PIM-RU.</li></ul><p>|||</p><p>Sincol Creative collection was developed with a high technical standard. It outcomes for its friezes, that can be done according to Sincol models or they can be customized according to the project of each client, making the doors unique and exclusive.</p><ul><li><strong>Doors:</strong> With bas-relief friezes U.V and PU finishing system (lacquered);</li><li><strong>Jambs and Casings:</strong> Coated;</li><li><strong>Certification:</strong> PEM-RU and PIM-RU performance rating.</li></ul><p>|||</p><p>La colecci&oacute;n Creativa de Sincol fue desarrollada con un alto rigor t&eacute;cnico, destacando principalmente sus frisos, en modelos de Sincol, o personalizados seg&uacute;n el proyecto de cada cliente, haciendo que las puertas sean &uacute;nicas y exclusivas.</p><p><strong>Puertas:</strong> Con frisos empotrados, Sistema de acabado U.V&nbsp; e PU (lacado);<br /><strong>Jambas y tapajuntas:</strong> revestidos;<br /><strong>Certificaci&oacute;n:</strong> Calificaci&oacute;n de desempe&ntilde;o PEM-RU y PIM-RU.</p>', 'creative', 1, 3, '2021-03-09 08:05:21', 'colecaocreative', 1),
(49, 2, 5, 'Silentia ||| Silentia ||| Silencio', '<p>O conjunto&nbsp;Silentia &eacute; uma solu&ccedil;&atilde;o que proporciona&nbsp;isolamento ac&uacute;stico. Tendo o prop&oacute;sito de fornecer uma barreira &agrave; passagem do som de um ambiente para o outro, &eacute; ideal para atenuar acusticamente espa&ccedil;os espec&iacute;ficos.&nbsp;Acompanhe nossos testes&nbsp;na aba&nbsp;Certifica&ccedil;&otilde;es&nbsp;e fique por dentro de todas as certifica&ccedil;&otilde;es que a Sincol possui, lembrando que todos&nbsp;esses testes s&atilde;o realizados em laborat&oacute;rios credenciados.</p><ul><li>Portas com estrutura interna especial para atender os requisitos de redu&ccedil;&atilde;o ac&uacute;stica</li><li>Redu&ccedil;&atilde;o Ac&uacute;stica de 28 a 31 dB</li><li>Com sistema de veda&ccedil;&atilde;o inferior (Veda Porta)</li><li>Veda&ccedil;&atilde;o ac&uacute;stica em todo o per&iacute;metro</li></ul><p>|||</p><p>The Silentia set is a solution that provides sound insulation. With the purpose of providing a barrier to the passage of sound from one room to another, it is ideal for acoustically attenuating specific spaces. Check our tests on the Certifications tab and see all the certifications that Sincol has, remembering that all these tests are carried out in accredited laboratories.</p><ul><li>Doors with special internal structure to meet sound reduction requirements</li><li>Acoustic Reduction from 28 to 31 dB</li><li>Lower sealing system (Door Seal)</li><li>Acoustic sealing throughout the perimeter</li></ul><p>|||</p><p>El conjunto Silentia es una soluci&oacute;n que proporciona aislamiento ac&uacute;stico. Con el prop&oacute;sito de proporcionar una barrera al paso del sonido de una habitaci&oacute;n a otra, es ideal para atenuar ac&uacute;sticamente espacios espec&iacute;ficos. Sigue nuestras pruebas en la pesta&ntilde;a Certificaciones y mantente al tanto de todas las certificaciones que tiene Sincol, recordando que todas estas pruebas se realizan en laboratorios acreditados.</p><ul><li>Puertas con estructura interna especial para cumplir con los requisitos de reducci&oacute;n de ruido.</li><li>Reducci&oacute;n ac&uacute;stica de 28 a 31 dB</li><li>Con sistema de sellado inferior (Door Seal)</li><li>Sellado ac&uacute;stico en todo el per&iacute;metro.</li></ul>', 'silentia', 1, 7, '2021-03-09 08:08:51', 'silentia', 1),
(50, 1, 5, 'PRF-30 ||| PRF-30 ||| PRF-30', '<p>Com mais de 30 anos de marcado, o&nbsp;Kit Resistente ao fogo Sincol foi criado e desenvolvido ap&oacute;s longos estudos e exig&ecirc;ncias&nbsp;t&eacute;cnicas. Seguindo as conformidades da Norma NBR 15281 (Porta corta-fogo para entrada de unidades aut&ocirc;nomas e de compartimentos espec&iacute;ficos de edifica&ccedil;&otilde;es), esse kit proporciona seguran&ccedil;a, conforto ac&uacute;stico e beleza. A Sincol est&aacute; em constante evolu&ccedil;&atilde;o, acompanhando as tend&ecirc;ncias t&eacute;cnicas e de design do mercado.</p><ul><li>Portas 100% compactas com estrutura exclusiva</li><li>Resistente aos 30 minutos de fogo</li><li>Redu&ccedil;&atilde;o Ac&uacute;stica de 31 db</li><li>Dobradi&ccedil;as de alta resist&ecirc;ncia, no modo convencional ou com molas</li><li>Batentes com fitas intumescentes, que impedem a passagem&nbsp;de gases t&oacute;xicos.</li></ul><p>|||</p><p>With over 30 years of experience, the Sincol Fire Resistant Set was created and developed after long studies and technical requirements. In compliance with Standard NBR 15281 (Fire door for entry of autonomous units and specific compartments of buildings), this set provides safety, acoustic comfort and beauty. Sincol is constantly improving, following the technical and design trends in the market.</p><ul><li>100% compact doors with exclusive structure</li><li>Resistant to 30 minutes on fire</li><li>Acoustic Reduction of 31 db</li><li>High-resistance hinges, conventional or spring-loaded</li><li>Stops with intumescent tapes, which prevent the passage of toxic gases.</li></ul><p>|||</p><p>Con m&aacute;s de 30 a&ntilde;os de experiencia, el Kit Resistente al Fuego Sincol fue creado y desarrollado luego de largos estudios y requerimientos t&eacute;cnicos. En cumplimiento de la Norma NBR 15281 (Puerta cortafuegos para entrada de unidades aut&oacute;nomas y compartimentos espec&iacute;ficos de edificios), este kit aporta seguridad, confort ac&uacute;stico y belleza. Sincol est&aacute; en constante evoluci&oacute;n, siguiendo las tendencias t&eacute;cnicas y de dise&ntilde;o del mercado.</p><ul><li>Puertas 100% compactas con estructura exclusiva</li><li>Resistente a 30 minutos de fuego</li><li>Reducci&oacute;n ac&uacute;stica de 31 db</li><li>Bisagras de alta resistencia, en modo convencional o con muelles</li><li>Paradas con cintas intumescentes, que evitan el paso de gases t&oacute;xicos.</li></ul>', 'prf30', 1, 8, '2021-03-09 08:11:51', 'prf30', 1),
(51, 3, 2, 'Wood Line ||| Wood Line ||| Wood Line', '<ul><li><strong>Portas:&nbsp;</strong>Com l&acirc;minas compostas,&nbsp;sistema de Acabamento U.V.</li><li><strong>Batente e Guarni&ccedil;&otilde;es:&nbsp;</strong>Revestidos;</li><li><strong>Certifica&ccedil;&atilde;o:&nbsp;</strong>Classifica&ccedil;&atilde;o de desempenho PEM-RU e&nbsp;PIM-RU.</li></ul><p>|||</p><ul><li><strong>Doors:</strong> With composite veneers, UV Finishing system.</li><li><strong>Jambs and Casings:</strong> Coated;</li><li><strong>Certification:</strong> PEM-RU and PIM-RU performance rating</li></ul><p>|||</p><ul><li><strong>Puertas: </strong>Con chapas de composite, sistema de acabado UV.</li><li><strong>Jambas y tapajuntas:</strong> revestidas;</li><li><strong>Certificaci&oacute;n:</strong> Calificaci&oacute;n de desempe&ntilde;o PEM-RU y PIM-RU.</li></ul>', 'prima;woodline', 1, NULL, '2021-03-09 08:16:07', 'woodline', 0),
(52, 3, 2, 'Glass ||| Glass ||| Glass', '<ul><li><strong>Portas:&nbsp;</strong>Com l&acirc;minas compostas,&nbsp;sistema de Acabamento U.V.</li><li><strong>Batente e Guarni&ccedil;&otilde;es:&nbsp;</strong>Revestidos;</li><li><strong>Certifica&ccedil;&atilde;o:&nbsp;</strong>Classifica&ccedil;&atilde;o de desempenho PEM-RU e&nbsp;PIM-RU.</li></ul><p>|||</p><ul><li><strong>Doors:</strong> With composite veneers, UV Finishing system.</li><li><strong>Jambs and Casings:</strong> Coated;</li><li><strong>Certification:</strong> PEM-RU and PIM-RU performance rating</li></ul><p>|||</p><ul><li><strong>Puertas: </strong>Con chapas de composite, sistema de acabado UV.</li><li><strong>Jambas y tapajuntas:</strong> revestidas;</li><li><strong>Certificaci&oacute;n:</strong> Calificaci&oacute;n de desempe&ntilde;o PEM-RU y PIM-RU.</li></ul>', 'prima;glass', 1, NULL, '2021-03-09 08:16:47', 'glass', 0),
(53, 3, 2, 'Louvre ||| Louvre ||| Louvre', '<ul><li><strong>Portas:&nbsp;</strong>Com l&acirc;minas compostas,&nbsp;sistema de Acabamento U.V.</li><li><strong>Batente e Guarni&ccedil;&otilde;es:&nbsp;</strong>Revestidos;</li><li><strong>Certifica&ccedil;&atilde;o:&nbsp;</strong>Classifica&ccedil;&atilde;o de desempenho PEM-RU e&nbsp;PIM-RU.</li></ul><p>|||</p><ul><li><strong>Doors:</strong> With composite veneers, UV Finishing system.</li><li><strong>Jambs and Casings:</strong> Coated;</li><li><strong>Certification:</strong> PEM-RU and PIM-RU performance rating</li></ul><p>|||</p><ul><li><strong>Puertas: </strong>Con chapas de composite, sistema de acabado UV.</li><li><strong>Jambas y tapajuntas:</strong> revestidas;</li><li><strong>Certificaci&oacute;n:</strong> Calificaci&oacute;n de desempe&ntilde;o PEM-RU y PIM-RU.</li></ul>', 'prima;louvre', 1, NULL, '2021-03-09 08:17:20', 'louvre', 0),
(54, 4, 1, 'Colors ||| Colors ||| Colors', '<p>Possibilidades de design em&nbsp;cores que proporcionam beleza e estilo ao seu projeto. Tons que traduzem identidade crom&aacute;tica para o seu empreendimento.</p><ul><li>Conjuntos&nbsp;com estrutura engenheirada e sistema de acabamento P.U. laqueado;</li><li><strong>Certifica&ccedil;&atilde;o:</strong>&nbsp;Classifica&ccedil;&atilde;o de desempenho PEM-RU e&nbsp;PIM-RU.</li></ul><p>|||</p><p>Design possibilities in colors that add beauty and style to your project. Shades that translate chromatic identity to your business.</p><ul><li>Sets with engineered structure and P.U. lacquered finishing system;</li><li><strong>Certification:</strong> PEM-RU and PIM-RU performance rating.</li></ul><p>|||</p><p>Posibilidades de design en colores que aportan belleza y estilo a tu proyecto. Tonos que traducen la identidad crom&aacute;tica a tu negocio.</p><ul><li>Conjuntos con estructura de ingenier&iacute;a y sistema de acabado PU lacado;</li><li><strong>Certificaci&oacute;n:</strong> Calificaci&oacute;n de desempe&ntilde;o PEM-RU y PIM-RU.</li></ul>', 'sincolors;colors', 1, NULL, '2021-03-09 08:18:19', 'sincolors', 0),
(55, 3, 1, 'Blanc ||| Blanc ||| Blanc', '<p>Dispon&iacute;vel em dois&nbsp;acabamentos, sistema P.U. laqueada ou sistema de acabamento&nbsp;U.V., proporcionando beleza e durabilidade para o seu projeto.</p><ul><li><strong>Portas:</strong>&nbsp;Com sistema de acabamento P.U. laqueado e U.V.</li><li><strong>Batentes e Guarni&ccedil;&otilde;es:</strong>&nbsp;Op&ccedil;&atilde;o 100% laqueado ou revestidos.</li><li><strong>Certifica&ccedil;&atilde;o:</strong>&nbsp;Classifica&ccedil;&atilde;o de desempenho PEM-RU e&nbsp;PIM-RU.</li></ul><p>|||</p><p>Available in two kinds of finishes: PU. lacquered or UV finishing system. This collection will provide beauty and durability to your project.</p><ul><li><strong>Doors:</strong> P.U. lacquered and UV finishing systems.</li><li><strong>Jambs and Casings:</strong> 100% lacquered or coated.</li><li><strong>Certification:</strong> PEM-RU and PIM-RU performance rating.</li></ul><p>|||</p><p>Disponible en dos tipos de acabados: Sistema de acabado lacado PU o UV. Esta colecci&oacute;n aportar&aacute; belleza y durabilidad a tu proyecto.</p><ul><li><strong>Puertas:</strong> Sistemas de PU acabado lacado y UV.</li><li><strong>Jambas y Tapajuntas:</strong> 100% lacados o revestidos.</li><li><strong>Certificaci&oacute;n:</strong> Calificaci&oacute;n de desempe&ntilde;o PEM-RU y PIM-RU.</li></ul>', 'sincolors;blanc', 1, NULL, '2021-03-09 08:18:43', 'blanc', 0),
(56, 1, 5, 'Shafts ||| Shafts ||| Shafts', '<p>A Sincol, sempre pensando em seus clientes, desenvolveu uma linha exclusiva de shafts. Essa linha &eacute; destinada ao fechamento e controle dos arm&aacute;rios de inspe&ccedil;&atilde;o presentes nas instala&ccedil;&otilde;es, sendo eles el&eacute;tricos, hidrossanit&aacute;rios, de inc&ecirc;ndio, de telefonia, entre outros. Cumprem com os requisitos das normas e regulamentos construtivos.&nbsp;Os shafts est&atilde;o dispon&iacute;veis nos seguintes sistemas de abertura: abrir, correr e sanfonado. Essa linha disp&otilde;e das op&ccedil;&otilde;es de portas lisas, com visor e abertura para ventila&ccedil;&atilde;o.</p><p>|||</p><p>Sincol has developed an exclusive line of shafts. Its intended for the closing and control of inspection cabinets present in electrical, hydro-sanitary, fire or telephone installations, among others. They comply with the requirements of construction standards and regulations. Shafts are available in the following opening systems: open, slide and folding. This line has the options of plain doors, with window and openings for ventilation.</p><p>|||</p><p>Sincol, pensando siempre en sus clientes, ha desarrollado una l&iacute;nea exclusiva de shafts. Esta l&iacute;nea est&aacute; destinada al cierre y control de los gabinetes de inspecci&oacute;n presentes en las instalaciones el&eacute;ctricas, hidrosanitarias, contra incendios, telef&oacute;nicas, entre otras. Cumplen con los requisitos de las normas y reglamentos de construcci&oacute;n. Los shafts est&aacute;n disponibles en los siguientes sistemas de apertura: abierto, deslizante y puerta de bisagras. Esta l&iacute;nea tiene las opciones de puertas lisas, con ventana y apertura para ventilaci&oacute;n.</p>', 'shafts', 1, 8, '2021-03-09 08:45:05', 'shafts', 1),
(58, 1, 6, 'Batente 604', '<p>teste 604</p>', 'Batente 604', 1, NULL, '2021-04-16 09:17:15', 'batente-604', 0),
(59, 1, 6, 'Batente 605', '<p>Batente 605</p>', 'batente605', 1, NULL, '2021-04-16 09:33:00', 'batente-605', 0),
(60, 1, 6, 'Batente 615R', '<p>Batente 615R</p>', 'batente615r', 1, NULL, '2021-04-16 09:35:42', 'batente-615r', 0),
(61, 1, 6, 'Batente 617R', '<p>Batente 617R</p>', 'batente617r', 1, NULL, '2021-04-16 09:37:46', 'batente-617r', 0),
(62, 1, 6, 'Batente 619', '<p>Batente 619</p>', 'batente619', 1, NULL, '2021-04-16 09:42:29', 'batente-619', 0),
(63, 1, 6, 'Batente 624', '<p>Batente 624</p>', 'batente624', 1, NULL, '2021-04-16 09:43:18', 'batente-624', 0),
(64, 1, 6, 'Batente 625', '<p>Batente 625</p>', 'batente625', 1, NULL, '2021-04-16 09:44:01', 'batente-625', 0),
(65, 1, 6, 'Batente 628', '<p>Batente 628</p>', 'batente628', 1, NULL, '2021-04-16 09:44:47', 'batente-628', 0),
(67, 1, 7, 'Guarnição 751', '<p>Guarni&ccedil;&atilde;o 751</p>', 'guarnição751', 1, NULL, '2021-04-16 15:43:02', 'guarnicao-751', 0),
(68, 1, 7, 'Guarnição 761', '<p>Guarni&ccedil;&atilde;o 761</p>', 'guarnição761', 1, NULL, '2021-04-16 15:45:24', 'guarnicao-761', 0),
(69, 1, 7, 'Guarnição 754', '<p>Guarni&ccedil;&atilde;o 754</p>', 'guarnição754', 1, NULL, '2021-04-16 15:50:28', 'guarnicao-754', 0),
(70, 1, 7, 'Guarnição 764', '<p>Guarni&ccedil;&atilde;o 764</p>', 'guarnição764', 1, NULL, '2021-04-16 15:50:49', 'guarnicao-764', 0),
(71, 1, 8, 'Rodapé 790', '<p>Rodap&eacute; 790</p>', 'rodapé790', 1, NULL, '2021-04-16 16:38:58', 'rodape-790', 0),
(72, 1, 8, 'Rodapé 791', '<p>Rodap&eacute; 791</p>', 'rodapé791', 1, NULL, '2021-04-16 16:39:29', 'rodape-791', 0),
(73, 1, 8, 'Rodapé 793', '<p>Rodap&eacute; 793</p>', 'rodapé793', 1, NULL, '2021-04-16 16:40:23', 'rodape-793', 0),
(74, 1, 8, 'Rodapé 794', '<p>Rodap&eacute; 794</p>', 'rodapé794', 1, NULL, '2021-04-16 16:40:44', 'rodape-794', 0),
(75, 1, 17, 'Bandeirola 109', '<p>Bandeirola 109</p>', 'bandeirola109', 1, NULL, '2021-04-16 16:45:04', 'bandeirola-109', 0),
(76, 1, 17, 'Bandeirola 110', '<p>Bandeirola 110</p>', 'bandeirola110', 1, NULL, '2021-04-16 16:45:21', 'bandeirola-110', 0),
(77, 1, 17, 'Bandeirola 112', '<p>Bandeirola 112</p>', 'bandeirola112', 1, NULL, '2021-04-16 16:45:37', 'bandeirola-112', 0),
(78, 1, 7, 'Detalhe Guarnições 751/761', '<p>Detalhe Guarni&ccedil;&otilde;es 751/761</p>', 'Detalhe Guarnições 751/761', 1, NULL, '2021-04-16 16:56:40', 'detalhe-guarnicoes-751761', 0),
(79, 1, 7, 'Detalhe Guarnições 754/764', '<p>Detalhe Guarni&ccedil;&otilde;es 754/764</p>', 'Detalhe Guarnições 751/761', 1, NULL, '2021-04-16 16:58:14', 'detalhe-guarnicoes-754764', 0),
(81, 3, 5, 'Correr ||| Sincol\'s Sliding Door  ||| Correr', '<p>O conjunto de Porta de Correr da Sincol veio para otimizar espa&ccedil;os limitados, oferecendo praticidade. &Eacute; um modelo que, al&eacute;m das suas qualidades est&eacute;ticas, tem grande efici&ecirc;ncia e sil&ecirc;ncio aos ambientes. Tudo isso aliado a um sistema bem projetado, com ferragens de primeira linha, o que faz da Porta de Correr Sincol a solu&ccedil;&atilde;o ideal para quem quer beleza e economia de espa&ccedil;os.</p><p>|||</p><p>Sincol&#39;s Sliding Door set came to optimize limited spaces, offering practicality. It is a model that, in addition to its aesthetic qualities, has great efficiency and silence to the environments. All of this combined with a well-designed system, with first-rate hardware, which makes Sincol&#39;s Sliding Door the ideal solution for those who want beauty and space saving.</p><p>|||</p><p>El juego de puertas corredizas de Sincol vino para optimizar espacios limitados, ofreciendo practicidad. Es un modelo que, adem&aacute;s de sus cualidades est&eacute;ticas, tiene una gran eficiencia y silencio a los ambientes. Todo esto, combinado con un sistema bien dise&ntilde;ado, con hardware de primer nivel, que hace de Porta de Correr Sincol la soluci&oacute;n ideal para quienes buscan belleza y ahorro de espacio.</p>', 'correr; corrersobreposto; correrembutido', 1, 5, '2021-04-19 08:40:47', 'correr-1', 1),
(82, 4, 5, 'Pivotante ||| Pivot ||| Pivote', '<p>O conjunto Pivotante &eacute; elegante, funcional e proporciona uma grande abertura com m&aacute;xima estabilidade. O sistema de eixos substitui com grande vantagem as dobradi&ccedil;as convencionais e deixa o conjunto muito mais leve e bonito.</p><p>|||</p><p>The Pivoting set is elegant, functional and provides a wide opening with maximum stability. The axle system replaces with great advantage the conventional hinges and makes the set much lighter and more beautiful.</p><p>|||</p><p>El conjunto Pivotante es elegante, funcional y proporciona una amplia apertura con la m&aacute;xima estabilidad. El sistema de ejes sustituye con gran ventaja a las bisagras convencionales y hace que el conjunto sea mucho m&aacute;s ligero y bonito.</p>', 'pivotante', 1, 6, '2021-04-19 09:52:52', 'pivotante', 1),
(83, 1, 7, 'Sistema Meia Esquadria', '<p>Sistema Meia Esquadria</p>', 'meia esquadria', 1, NULL, '2021-04-19 11:35:34', 'sistema-meia-esquadria', 0),
(84, 1, 7, 'Sistema H', '<p>Sistema H</p>', 'sistemah', 1, NULL, '2021-04-19 11:36:06', 'sistema-h', 0),
(85, 3, 22, NULL, '<p>Dimens&otilde;es Giro</p>', 'dimensões giro', 1, 1, '2021-04-19 15:07:20', 'dimensoes', 0),
(87, 3, 22, NULL, '<p>Dimens&otilde;es Pivotante</p>', 'dimensões pivotante', 1, 2, '2021-04-23 17:04:03', 'dimensoes-pivotante', 0),
(90, 4, 23, 'Base 127', '<p>Base 127</p>', 'Base 127', 1, 1, '2021-04-26 11:47:42', 'base-127', 0),
(91, 4, 23, 'Base 153', '<p>Base 153</p>', 'Base 153', 1, 3, '2021-04-26 11:48:46', 'base-153', 0),
(93, 4, 23, 'Base 156', '<p>Base 156</p>', 'Base 156', 1, 4, '2021-04-26 11:49:56', 'base-156', 0),
(95, 4, 23, 'Base 174', '<p>Base 174</p>', 'Base 174', 1, 6, '2021-04-26 11:51:09', 'base-174', 0),
(97, 4, 23, 'Base 194', '<p>Base 194</p>', 'Base 194', 1, 8, '2021-04-26 11:51:45', 'base-194', 0),
(98, 3, 22, NULL, '<p>Dimens&otilde;es PRF-30</p>', 'Dimensões PRF-30', 1, 3, '2021-04-26 15:45:58', 'dimensoes-prf-30', 0),
(100, 3, 22, NULL, '<p>Dimens&otilde;es Correr</p>', 'dimensões correr', 1, 4, '2021-04-30 17:08:39', 'dimensoes-correr', 0),
(101, 1, 6, 'Batente 635', '<p>Batente 635</p>', 'Batente 635', 1, NULL, '2021-07-27 17:59:27', 'batente-635', 0),
(102, 1, 6, 'Batente 637', '<p>Batente 637</p>', 'Batente 637', 1, NULL, '2021-07-27 18:00:05', 'batente-637', 0),
(103, 5, 21, 'Downloads', '<p>Dowloads de Manuais e Arquivos Sincol</p>', 'downloads', 1, 3, '2021-08-25 09:18:44', 'downloads', 1),
(105, 3, 5, 'Coleção Impressione ||| Coleção Impressione ||| Coleção Impressione', '<p>A Cole&ccedil;&atilde;o Impressione surgiu com o objetivo de continuar surpreendendo os clientes Sincol, atrav&eacute;s de produtos inovadores e de qualidade em conformidade as normas de desempenho.</p><p>Com uma Pintura UV de alta tecnologia , resulta em um acabamento bem detalhado e minimalista, lembrando a nobreza e o &nbsp;toque natural da madeira, manufaturada com mat&eacute;ria-prima proveniente de florestas certificadas, esse conjunto &eacute; ideal para deixar seu empreendimento com a beleza e a modernidade que ele merece.</p><p>Impressione, a cole&ccedil;&atilde;o que vai impressionar voc&ecirc;!</p><p>&nbsp;</p><ul><li>Pode ser adquirida com selo FSC<sup>&reg;</sup>;</li><li><strong>Porta:</strong> Sistema de Acabamento U.V;</li><li><strong>Batente e Guarni&ccedil;&atilde;o:</strong> Revestidos;</li><li><strong>Certifica&ccedil;&atilde;o:</strong> Classifica&ccedil;&atilde;o de desempenho PIM-RU.</li></ul><p>|||</p><p>A Cole&ccedil;&atilde;o Impressione surgiu com o objetivo de continuar surpreendendo os clientes Sincol, atrav&eacute;s de produtos inovadores e de qualidade em conformidade as normas de desempenho.</p><p>Com uma Pintura UV de alta tecnologia , resulta em um acabamento bem detalhado e minimalista, lembrando a nobreza e o &nbsp;toque natural da madeira, manufaturada com mat&eacute;ria-prima proveniente de florestas certificadas, esse conjunto &eacute; ideal para deixar seu empreendimento com a beleza e a modernidade que ele merece.</p><p>Impressione, a cole&ccedil;&atilde;o que vai impressionar voc&ecirc;!</p><p>&nbsp;</p><ul><li>Pode ser adquirida com selo FSC<sup>&reg;</sup>;</li><li><strong>Porta:</strong> Sistema de Acabamento U.V;</li><li><strong>Batente e Guarni&ccedil;&atilde;o:</strong> Revestidos;</li><li><strong>Certifica&ccedil;&atilde;o:</strong> Classifica&ccedil;&atilde;o de desempenho PIM-RU.</li></ul><p>|||</p><p>A Cole&ccedil;&atilde;o Impressione surgiu com o objetivo de continuar surpreendendo os clientes Sincol, atrav&eacute;s de produtos inovadores e de qualidade em conformidade as normas de desempenho.</p><p>Com uma Pintura UV de alta tecnologia , resulta em um acabamento bem detalhado e minimalista, lembrando a nobreza e o &nbsp;toque natural da madeira, manufaturada com mat&eacute;ria-prima proveniente de florestas certificadas, esse conjunto &eacute; ideal para deixar seu empreendimento com a beleza e a modernidade que ele merece.</p><p>Impressione, a cole&ccedil;&atilde;o que vai impressionar voc&ecirc;!</p><p>&nbsp;</p><ul><li>Pode ser adquirida com selo FSC<sup>&reg;</sup>;</li><li><strong>Porta:</strong> Sistema de Acabamento U.V;</li><li><strong>Batente e Guarni&ccedil;&atilde;o:</strong> Revestidos;</li><li><strong>Certifica&ccedil;&atilde;o:</strong> Classifica&ccedil;&atilde;o de desempenho PIM-RU.</li></ul>', 'colecaoimpressione', 1, 1, '2021-11-05 13:36:34', 'colecao-impressione', 1),
(106, 4, 23, 'Base 150', '<p>Base 150</p>', 'Base 150', 1, 2, '2022-05-11 10:02:53', 'base-150', 0),
(107, 4, 23, 'Base 159', '<p>Base 159</p>', 'Base 159', 1, 5, '2022-05-11 14:21:30', 'base-159', 0),
(108, 4, 23, 'Base 192', '<p>Base 192</p>', 'Base 192', 1, 7, '2022-05-11 14:28:30', 'base-192', 0),
(109, 4, 23, 'Coleções e Modelos', '<p>Cole&ccedil;&otilde;es e Modelos</p>', 'Bases e suas Coleções', 1, 9, '2022-05-11 14:34:20', 'bases-e-suas-colecoes', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos_relacionados`
--

CREATE TABLE `produtos_relacionados` (
  `prr_id` int(11) DEFAULT NULL,
  `prd_relaciona` int(11) DEFAULT NULL,
  `prd_relacionado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `produtos_relacionados`
--

INSERT INTO `produtos_relacionados` (`prr_id`, `prd_relaciona`, `prd_relacionado`) VALUES
(1, 49, 20),
(3, 51, 20),
(4, 51, 21),
(5, 51, 22),
(6, 51, 24),
(7, 51, 25),
(8, 51, 26),
(2, 52, 20),
(3, 52, 22),
(4, 52, 24),
(3, 53, 20),
(4, 53, 22),
(5, 53, 25),
(3, 54, 20),
(4, 54, 21),
(5, 54, 22),
(3, 55, 20),
(4, 55, 21),
(5, 55, 22),
(0, 58, 20),
(1, 58, 25),
(2, 58, 26),
(0, 59, 20),
(1, 59, 22),
(2, 59, 25),
(3, 59, 26),
(0, 60, 24),
(0, 61, 20),
(0, 62, 20),
(0, 63, 23),
(0, 64, 20),
(0, 65, 21),
(0, 56, 23),
(0, 87, 21),
(0, 85, 20),
(1, 81, 22),
(1, 82, 21),
(1, 51, 85),
(2, 51, 87),
(1, 52, 85),
(2, 53, 85),
(1, 55, 85),
(2, 55, 87),
(1, 54, 85),
(2, 54, 87),
(1, 48, 20),
(2, 48, 21),
(3, 48, 22),
(4, 48, 24),
(5, 48, 85),
(6, 48, 87),
(0, 82, 87),
(0, 98, 20),
(1, 50, 20),
(0, 50, 98),
(0, 49, 85),
(0, 100, 22),
(0, 81, 100),
(0, 51, 100),
(0, 52, 100),
(1, 53, 100),
(0, 48, 100),
(0, 54, 100),
(0, 55, 100),
(0, 101, 22),
(0, 102, 22),
(0, 53, 90);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto_categoria`
--

CREATE TABLE `produto_categoria` (
  `cat_id` int(11) NOT NULL,
  `cat_pai` int(11) DEFAULT NULL,
  `cat_titulo` varchar(256) DEFAULT NULL,
  `cat_descricao` text DEFAULT NULL,
  `cat_img` varchar(256) DEFAULT NULL,
  `cat_ordem` int(11) NOT NULL,
  `cat_slug` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `produto_categoria`
--

INSERT INTO `produto_categoria` (`cat_id`, `cat_pai`, `cat_titulo`, `cat_descricao`, `cat_img`, `cat_ordem`, `cat_slug`) VALUES
(1, 5, 'Coleção Sincolors ||| Sincolors Collection ||| Colección Sincolors', '<p>Desenvolvida&nbsp;para acompanhar as tend&ecirc;ncias em cores do mercado. Atende a todos os&nbsp;estilos de projetos, como resid&ecirc;ncias, espa&ccedil;os p&uacute;blicos ou escrit&oacute;rios, fazendo da exclusividade&nbsp;uma ferramenta de comunica&ccedil;&atilde;o distinta e eficaz.</p><p>|||</p><p>Developed to keep up with color trends in the market. It fits all styles of projects, such as homes, public spaces or offices, turning exclusivity into a distinct and effective communication tool.</p><p>|||</p><p>Desarrollado para mantenerse al d&iacute;a con las tendencias de color del mercado. Se adapta a todos los estilos de proyectos, como hogares, espacios p&uacute;blicos u oficinas, convirtiendo la exclusividad en una herramienta de comunicaci&oacute;n distinta y eficaz.</p>', 'b4b83-sincolors.jpg', 4, 'colecaosincolors'),
(2, 5, 'Coleção Prima ||| Prime Collection ||| Colección Prima', '<p>A Cole&ccedil;&atilde;o Prima &eacute; uma cole&ccedil;&atilde;o desenvolvida com praticidade, estilo e qualidade, trazendo diferentes solu&ccedil;&otilde;es em portas lisas, com aplica&ccedil;&atilde;o de vidros e de venezianas, atendendo &agrave;s especificidades de cada c&ocirc;modo e, assim, proporcionando solu&ccedil;&otilde;es para quem exige qualidade. Um dos diferenciais dessa cole&ccedil;&atilde;o &eacute; seu acabamento natural com l&acirc;minas extra&iacute;das de madeiras nobres. Cada l&acirc;mina, com sua autenticidade de textura e tonalidade, transmite aconchego para os ambientes.</p><p>|||</p><p>The Prime Collection was developed to provide style and quality, bringing different solutions in plain doors, with the application of glass and shutters, fulfilling the specifics needs of each room and, thus, providing solutions for those who demand quality. One of the differentials of this collection is its natural finish with veneers extracted from noble woods. Each blade, with its authenticity of texture and tone, conveys warmth to the environments.</p><p>|||</p><p>La Colecci&oacute;n Prima fue desarrollada para garantir practicidad, estilo y calidad, aportando diferentes soluciones en puertas lisas, con la aplicaci&oacute;n de vidrios y contraventanas, atendiendo a las especificidades de cada estancia y, as&iacute;, brindando soluciones para quienes exigen calidad. Uno de los diferenciales de esta colecci&oacute;n es su acabado natural con chapas extra&iacute;das de maderas nobles. Cada pala, con su autenticidad de textura y tono, transmite calidez a los ambientes.</p>', '2b212-prima.jpg', 2, 'colecaoprima'),
(5, NULL, 'Portas ||| Doors ||| Puertas', '<p>Os produtos da Sincol s&atilde;o reconhecidos e testados pelo mercado h&aacute; mais de 7 d&eacute;cadas. A engenharia das linhas Sincol assegura o uso nas mais diversas regi&otilde;es do pa&iacute;s garantindo vida &uacute;til, desempenho e satisfa&ccedil;&atilde;o dos nossos clientes.</p><p>|||</p><p>Sincol products have been recognized and tested by the market for over 7 decades. The engineering of Sincol products lines ensures their use in the most diverse regions, guaranteeing the products useful life, performance and satisfaction.</p><p>|||</p><p>El desarrollo de los productos Sincol ha sido reconocido y probado por el mercado durante m&aacute;s de 7 d&eacute;cadas. La ingenier&iacute;a de las l&iacute;neas Sincol asegura su uso en las m&aacute;s diversas regiones del pa&iacute;s, garantizando la vida &uacute;til, desempe&ntilde;o y satisfacci&oacute;n de nuestros clientes.</p>', 'efad7-cena-02_porta-pivotante_cinza-niquel-1024x1024.jpg', 1, 'portas'),
(6, 16, 'Batentes ||| Door Jambs ||| Jambas de Puerta', '<p>O batente &eacute; pe&ccedil;a fundamental para o sistema de abertura escolhido por cada cliente. O batente &eacute; composto por laterais e cabeceira, assim formando o conjunto que recebe as dobradi&ccedil;as, a veda&ccedil;&atilde;o ac&uacute;stica&nbsp;e a contra testa.</p><p>|||</p><p>The jamb is a fundamental part of the opening system chosen by each customer. It is composed of two jambs and head, thus forming the set that receives the door, the acoustic seal and the casing.</p><p>|||</p><p>La jamba es parte fundamental del sistema de apertura elegido por cada cliente. Est&aacute; compuesto por dos jambas y cabecero, formando as&iacute; el conjunto que recibe la puerta, el sello ac&uacute;stico y las tapajuntas.</p>', '333c0-batente.jpg', 1, 'batentes'),
(7, 16, 'Guarnições ||| Casings ||| Tapajuntas', '<p>As guarni&ccedil;&otilde;es s&atilde;o as pe&ccedil;as utilizadas para cobrir a extremidade entre o batente e a parede. Funcionam como uma moldura e agregam muito estilo as portas.</p><p>|||</p><p>Casings are the pieces used to cover the end between the jamb and the wall. They work as a frame and add a lot of style to the doors.</p><p>|||</p><p>Las tapajuntas son las piezas que se utilizan para cubrir el extremo entre la jamba y la pared. Funcionan como marco y a&ntilde;aden mucho estilo a las puertas.</p>', '4cd8d-guarnicoes.jpg', 3, 'guarnicoes'),
(8, 16, 'Rodapés ||| Baseboard ||| Zócalos', '<p>O&nbsp;Rodap&eacute;&nbsp;Sincol &eacute; a solu&ccedil;&atilde;o perfeita para harmonizar os diversos tipos de pisos e paredes, combina&ccedil;&atilde;o perfeita&nbsp;com a guarni&ccedil;&atilde;o&nbsp;do seu Kit Sincol.</p><p>|||</p><p>Sincol&rsquo;s Baseboard is the perfect solution to harmonize the different types of floors and walls, a perfect combination with your Sincol set.</p><p>|||</p><p>El Z&oacute;calo Sincol es la soluci&oacute;n perfecta para armonizar los diferentes tipos de pisos y paredes, una combinaci&oacute;n perfecta con la moldura de tu Kit Sincol.</p>', '3d0cf-rodape.jpg', 4, 'rodapes'),
(10, NULL, 'Sistemas de Abertura ||| Opening Systems ||| Sistemas de apertura', '<p>A Sincol oferece diversos sistemas e aberturas para o seu empreendimento. Encontre a melhor op&ccedil;&atilde;o para a sua obra.</p><p>|||</p><p>Sincol offers several systems of openings. Find the best option for you.</p><p>|||</p><p>Sincol ofrece varios sistemas de aberturas. Encuentra la mejor opci&oacute;n para ti.</p>', NULL, 3, 'sistemas'),
(16, NULL, 'Componentes ||| Parts ||| Componentes', '<p>A Sincol desenvolveu seus componentes pensando em cada detalhe, trazendo neles a funcionalidade junto com o minimalismo, proporcionando solu&ccedil;&otilde;es para quem exige qualidade.</p><p>|||</p><p>Sincol developed its components thinking about every detail, bringing functionality together with minimalism, providing solutions for those who demand quality.</p><p>|||</p><p>Sincol desarroll&oacute; sus componentes pensando en cada detalle, uniendo funcionalidad con minimalismo, brindando soluciones para quienes exigen calidad.</p>', NULL, 2, 'componentes'),
(17, 16, 'Bandeirolas ||| Over Panels ||| Montante', '<p>As bandeirolas, juntamente com as guarni&ccedil;&otilde;es, formam a moldura desenvolvida para o kit de porta. Com seu&nbsp;design diferenciado, traz personalidade aos ambientes.</p><p>|||</p><p>The over panels, together with the casings, complete the frame developed for the door set. With its differentiated design, it brings personality to the environments.</p><p>|||</p><p>Los montantes, por encima de los marcos, completan el conjunto de las puertas. Con su dise&ntilde;o diferenciado, aporta personalidad a los ambientes.</p>', '62936-bandeirola.jpg', 2, 'bandeirolas'),
(21, NULL, 'Informações Técnicas ||| Technical Information ||| Informaciones Técnicas', '<p>Informa&ccedil;&otilde;es T&eacute;cnicas</p><p>|||</p><p>Technical Information</p><p>|||</p><p>Informaciones T&eacute;cnicas</p>', NULL, 4, 'informacoes-tecnicas'),
(22, 21, 'Dimensões ||| Dimensions ||| Dimensiones', '<p>Dimens&otilde;es dos Conjuntos</p><p>|||</p><p>Dimensions of Sets</p><p>|||</p><p>Dimensiones de los conjuntos</p>', 'a758d-capa-dimensoes.jpg', 2, 'dimensoes'),
(23, 21, 'Bases ||| Bases ||| Bases', '<p>Bases</p><p>|||</p><p>Bases</p><p>|||</p><p>Bases</p>', '317dc-bases-capa.jpg', 1, 'base');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto_tipo`
--

CREATE TABLE `produto_tipo` (
  `tpr_id` int(11) NOT NULL,
  `tpr_titulo` varchar(256) DEFAULT NULL,
  `tpr_img` varchar(256) DEFAULT NULL,
  `tpr_ordem` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `produto_tipo`
--

INSERT INTO `produto_tipo` (`tpr_id`, `tpr_titulo`, `tpr_img`, `tpr_ordem`) VALUES
(1, 'Padrão ||| Pattern ||| Patrón', NULL, 1),
(2, 'Aberturas ||| Openings ||| Aberturas', NULL, 2),
(3, 'Dimensões ||| Dimensions ||| Dimensiones', NULL, 4),
(4, 'Estrutura ||| Structure ||| Estructura', NULL, 3),
(5, 'Downloads', NULL, 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `quemsomos`
--

CREATE TABLE `quemsomos` (
  `qsm_id` int(11) NOT NULL,
  `cat_id` int(11) DEFAULT NULL,
  `qsm_titulo` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qsm_descricao` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qsm_slug` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qsm_status` tinyint(1) DEFAULT 1,
  `qsm_datahora` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `quemsomos`
--

INSERT INTO `quemsomos` (`qsm_id`, `cat_id`, `qsm_titulo`, `qsm_descricao`, `qsm_slug`, `qsm_status`, `qsm_datahora`) VALUES
(1, 1, 'Nossa História ||| Timeline', '<p>A empresa foi fundada em 1943, com o objetivo de beneficiar madeira, fabricar m&oacute;veis e construir casas. A partir de 1952, a produ&ccedil;&atilde;o de m&oacute;veis foi diminu&iacute;da, dando maior &ecirc;nfase &agrave; produ&ccedil;&atilde;o de camas. Para melhor aproveitamento de madeiras, at&eacute; ent&atilde;o n&atilde;o utilizadas no processo, come&ccedil;ou a fabrica&ccedil;&atilde;o de novos produtos: venezianas e portas lisas.</p><p>Em 1971, a at&eacute; ent&atilde;o Sociedade de Ind&uacute;strias de Constru&ccedil;&otilde;es Ltda. sofreu altera&ccedil;&otilde;es contratuais, passando a se chamar Sincol S/A Ind&uacute;stria e Com&eacute;rcio.</p><p>Em 1982, a empresa criou a Reflorestadora Sincol Ltda., com o objetivo de implantar e manejar florestas plantadas para suprir a demanda industrial.</p><p>Atualmente, nas atividades florestais, possui fazendas distribu&iacute;das pelos estados de Santa Catarina e Paran&aacute;.</p><p>As atividades atuais da unidade fabril da Sincol s&atilde;o o projeto, a produ&ccedil;&atilde;o e a comercializa&ccedil;&atilde;o de portas, batentes, guarni&ccedil;&otilde;es, molduras, produtos montados, acabados e acess&oacute;rios de madeira em geral. A empresa tamb&eacute;m desenvolveu a Linha Gourmet com gamelas, petisqueiras, adegas e t&aacute;buas de corte.</p><p>|||</p><p>The company was founded in 1943, aiming to process wood, manufacture furniture and build houses. From 1952 onwards, the production of furniture was reduced, giving greater emphasis to the production of beds. In order to make better use of wood not used during the process, the production of new products began: shutters and plain doors.</p><p>In 1971, the company that was named Sociedade de Ind&uacute;strias de Constru&ccedil;&otilde;es Ltda. changed, being renamed Sincol S/A Ind&uacute;stria e Com&eacute;rcio.</p><p>In 1982, the company created the reforestation project, Reflorestadora Sincol Ltda., with the objective of implementing and managing planted forests to meet industrial demand.</p><p>Currently, in forestry activities, Sincol has farms spread across the states of Santa Catarina and Paran&aacute;, in Brazil.</p><p>The current activities of Sincol Manufacturing unit are the design, production and sales of doors, jambs, casings, frames, assembled products, finished products and wood accessories in general.</p><p>The company also developed the Gourmet Line with wooden trays, serving trays for snacks, wooden wine racks and cutting boards.</p><p>|||</p><p>La empresa fue fundada en 1943, con el objetivo de procesar madera, fabricar muebles y construir viviendas. A partir de 1952, se redujo la producci&oacute;n de muebles, dando mayor &eacute;nfasis a la producci&oacute;n de camas. Con el fin de aprovechar mejor la madera, que hasta entonces no se hab&iacute;a utilizado en el proceso, se inici&oacute; la producci&oacute;n de nuevos productos: contraventanas y puertas lisas.</p><p>En 1971, la empresa que hasta entonces se llamaba Sociedade de Ind&uacute;strias de Constru&ccedil;&otilde;es Ltda. sufri&oacute; cambios contractuales, pasando a denominarse Sincol S / A Ind&uacute;stria e Com&eacute;rcio.</p><p>En 1982, la empresa crea la repoblaci&oacute;n forestal de nombre Reflorestadora Sincol Ltda., con el objetivo de implementar y manejar bosques plantados para satisfacer la demanda industrial.</p><p>Actualmente, en actividades forestales, cuenta con fincas repartidas por los estados de Santa Catarina y Paran&aacute;, en Brasil.</p><p>Las actividades actuales de la unidad de fabricaci&oacute;n de Sincol son el dise&ntilde;o, producci&oacute;n y venta de puertas, jambas, molduras, marcos, productos ensamblados, productos terminados y accesorios de madera en general. La empresa tambi&eacute;n desarroll&oacute; la L&iacute;nea Gourmet con tablas para servir y picar, tablas para servir bocadillos y botelleros.</p>', NULL, 1, '2021-02-01 17:17:28'),
(2, 2, 'Indústria ||| The Industry', '<p>Amplo e moderno, o parque industrial da Sincol tem mais de 55.000 m&sup2; de &aacute;rea constru&iacute;da e disp&otilde;e da mais alta tecnologia do setor madeireiro. Entre m&aacute;quinas importadas e solu&ccedil;&otilde;es desenvolvidas com engenharia pr&oacute;pria, conta com mais de 1.300 colaboradores que se dedicam diariamente a um processo altamente tecnol&oacute;gico, mas que n&atilde;o dispensa o toque artesanal. A opera&ccedil;&atilde;o est&aacute; estruturada com base em programas de qualidade, seguran&ccedil;a e corre&ccedil;&atilde;o ambiental, com avalia&ccedil;&atilde;o e evolu&ccedil;&atilde;o cont&iacute;nuas. Do plantio das &aacute;rvores &agrave; expedi&ccedil;&atilde;o dos produtos, a Sincol demonstra excel&ecirc;ncia em cada etapa produtiva.</p><p>Sincol em n&uacute;meros:<br />- 1 Matriz<br />- 1 Filial em Jacarezinho-PR<br />- 1 Reflorestadora<br />- 1943 ano que iniciou<br />- 1.300 colaboradores<br />- 55.000 m&sup2; de parque fabril<br />- Aprox. 185.000 m&sup2; de parque Industrial</p><p>|||</p><p>Sincol has a large and modern industrial park, with more than 55,000 m&sup2; of built area. The highest technology in the wood sector is developed in our industrial park, as we count on imported machines as well as on the solutions developed by our own engineering staff. Sincol has more than 1,300 employees dedicated to a very technological process, but keeping and artisanal touch. The operation is based on quality, safety and environmental correction programs, with continuous evaluation and evolution. From planting trees to shipping products, Sincol demonstrates excellence in every production stage.</p><p>&nbsp;</p><p>Sincol in numbers:<br />- 1 Headquarters is Ca&ccedil;ador/SC &ndash; Brazil.<br />- 1 branch in Jacarezinho/PR - Brazil .<br />- 1 Reforestation area.<br />- 1943 - foundation year.<br />- 1,300 employees.<br />- 55,000 m&sup2; of factory area.<br />- Approx. 185,000 m&sup2; of Industrial Park.</p><p>|||</p><p>Sincol cuenta con un amplio y moderno parque industrial, con m&aacute;s de 55.000 m&sup2; de &aacute;rea construida. En nuestro parque industrial se desarrolla la m&aacute;s alta tecnolog&iacute;a en el sector de la madera, contamos con m&aacute;quinas importadas, as&iacute; como con las soluciones desarrolladas por nuestro propio personal de ingenier&iacute;a. Sincol cuenta con m&aacute;s de 1.300 empleados dedicados a un proceso muy tecnol&oacute;gico, pero manteniendo el toque artesanal. La operaci&oacute;n se basa en programas de correcci&oacute;n de calidad, seguridad y medio ambiente, con evaluaci&oacute;n y evoluci&oacute;n continua. Desde la plantaci&oacute;n de &aacute;rboles hasta el env&iacute;o de productos, Sincol demuestra excelencia en cada etapa de producci&oacute;n.</p><p>Sincol en cifras:<br />- 1 sede en Ca&ccedil;ador / SC - Brasil.<br />- 1 sucursal en Jacarezinho / PR - Brasil.<br />- 1 &aacute;rea de reforestaci&oacute;n.<br />- 1943 - a&ntilde;o de fundaci&oacute;n.<br />- 1.300 empleados.<br />- 55.000 m&sup2; de &aacute;rea de fabricaci&oacute;n.<br />- Aprox. 185.000 m&sup2; de parque Industrial.</p>', NULL, 1, '2021-02-01 17:24:48'),
(3, 3, 'Reflorestadora Sincol ||| Sincol Reforestation ||| Reforestación de Sincol', '<p>A Sincol utiliza madeiras provenientes de florestas conduzidas e certificadas. Em meio aos seus milhares de hectares de reflorestamento, extensas &aacute;reas de mata nativa recebem prote&ccedil;&atilde;o permanente, as quais, em conjunto com os cursos d&rsquo;&aacute;gua preservados, garantem a manuten&ccedil;&atilde;o da biodiversidade original. Esse &eacute; um esfor&ccedil;o permanente da Sincol para assegurar recursos naturais &agrave;s futuras gera&ccedil;&otilde;es.</p><p>- 125 colaboradores</p><p>- 118 fazendas entre Paran&aacute; e Santa Catarina</p><p>- 29.140ha (&Aacute;rea Manejo sob responsabilidade do Grupo Sincol)</p><p>- 10.930ha (Efetivo Plantio)</p><p>- 18.210ha (&aacute;reas nativas e outras &aacute;reas)</p><p>- Aproximadamente 1.600.000 mudas plantadas por ano</p><p>|||</p><p>Sincol uses wood from managed and certified forests. Amidst its thousands of hectares of reforestation, extensive areas of native forest receive permanent protection, which, together with the preserved watercourses, ensure the maintenance of the original biodiversity. This is an ongoing effort by Sincol to ensure natural resources for future generations.</p><p>- 125 employees</p><p>- 118 farms in the states of Paran&aacute; and Santa Catarina, in Brazil.</p><p>- 29.140ha (Management Area under the responsibility of Grupo Sincol)</p><p>- 10.930ha (Effective Planting)</p><p>- 18.210ha (native areas and other areas)</p><p>- Approximately 1.600.000 seeds planted per year</p><p>|||</p><p>Sincol utiliza madera de bosques gestionados y certificados. En medio de sus miles de hect&aacute;reas de reforestaci&oacute;n, extensas &aacute;reas de bosque nativo reciben protecci&oacute;n permanente, que, junto con los cursos de agua preservados, aseguran el mantenimiento de la biodiversidad original. Este es un esfuerzo continuo de Sincol para asegurar los recursos naturales para las generaciones futuras.</p><p>- 125 empleados</p><p>- 118 fincas entre Paran&aacute; y Santa Catarina &ndash; Brasil.</p><p>- 29.140ha (&Aacute;rea de Manejo a cargo de Grupo Sincol)</p><p>- 10.930ha (Siembra Efectiva)</p><p>- 18.210ha (&aacute;reas nativas y otras &aacute;reas)</p><p>- Aproximadamente 1.600.000 pl&aacute;ntulas plantadas por a&ntilde;o</p>', NULL, 1, '2021-02-01 17:39:22'),
(4, 6, 'Compromisso com o FSC<sup>®</sup> ||| Commitment to FSC<sup>®</sup> ||| Compromiso con FSC<sup>®</sup>', '<p><strong>A Reflorestadora Sincol Ltda. e a Sincol S/A Ind&uacute;stria e Com&eacute;rcio </strong>registram aqui seu compromisso com o segmento dos P&amp;C do FSC<sup>&reg;</sup>, n&atilde;o apenas visando o recebimento e a manuten&ccedil;&atilde;o da Certifica&ccedil;&atilde;o Florestal, mas tamb&eacute;m a melhoria cont&iacute;nua de seu setor florestal, com foco na conserva&ccedil;&atilde;o ambiental e na justi&ccedil;a social.<br /><br />A empresa compromete-se a:<br />- Obedecer aos Princ&iacute;pios e Crit&eacute;rios do FSC<sup>&reg;</sup> - Forest Stewardship Council<sup>&reg;</sup>, nacional e internacionalmente aceitos.<br />- Respeitar a soberania nacional, bem como as leis, acordos e tratados internacionais outorgados pelo pa&iacute;s.<br />- Manter todos os documentos de posse e uso da terra, bem como os de recursos florestais, de acordo com a legisla&ccedil;&atilde;o nacional.<br />- Objetivar sempre a melhoria de vida de seus trabalhadores e da comunidade local.<br />- Salvaguardar seus remanescentes de florestas nativas presentes nas &aacute;reas objeto da certifica&ccedil;&atilde;o, objetivando a conserva&ccedil;&atilde;o dos recursos naturais, bem como a preserva&ccedil;&atilde;o da fauna e da flora nativa.<br />- N&atilde;o converter florestas naturais em planta&ccedil;&otilde;es florestais de esp&eacute;cies ex&oacute;ticas.<br />- Manter &aacute;reas de interesse ecol&oacute;gico e paisag&iacute;sticos (cachoeiras, grutas, c&acirc;nions) presentes em suas &aacute;reas para as futuras gera&ccedil;&otilde;es.<br />- Manejar suas planta&ccedil;&otilde;es florestais de maneira ambiental, social e economicamente respons&aacute;vel.<br />- Promover o uso eficiente, econ&ocirc;mico e otimizado de suas florestas.<br />- Recuperar, de acordo com planejamento pr&eacute;vio, &aacute;reas degradadas e &aacute;reas de Preserva&ccedil;&atilde;o Permanente.<br />- Incentivar o uso m&uacute;ltiplo de suas &aacute;reas, respeitando sempre a responsabilidade ambiental e a biodiversidade.</p><p>|||</p><p><strong>Reflorestadora Sincol Ltda. and Sincol S/A Ind&uacute;stria e Com&eacute;rcio</strong> register here their commitment to the FSC<sup>&reg;</sup> P&amp;C segment, not only aiming at receiving and maintaining Forest Certification, but also at the continuous improvement of its forest sector, with a focus on environmental conservation and in social justice.</p><p>The company engages to:<br />- Comply with the Principles and Criteria of the FSC<sup>&reg;</sup> - Forest Stewardship Council<sup>&reg;</sup>, nationally and internationally accepted.<br />- Respect national sovereignty, as well as international laws, agreements and treaties granted by the country.<br />- Keep all land tenure and use documents, as well as forest resources, in accordance with national legislation.<br />- Always aim to improve the lives of our workers and the local community.<br />- Safeguard the remnants of native forests present in the areas subject to certification, aiming at the conservation of natural resources, as well as the preservation of native fauna and flora.<br />- Do not convert natural forests into forest plantations of exotic species.<br />- Maintain areas of ecological and natural interest (waterfalls, caves, canyons) present in their areas for future generations.<br />- Manage our forest plantations in an environmentally, socially and economically responsible manner.<br />- Promote the efficient, economical and optimized use of its forests.<br />- Recover, according to previous planning, degraded areas and Permanent Preservation areas.<br />- Encourage the multiple use of these areas, always respecting environmental responsibility and biodiversity.</p><p>|||</p><p><strong>Reflorestadora Sincol Ltda. y Sincol S / A Ind&uacute;stria e Com&eacute;rcio</strong> registran aqu&iacute; su compromiso con el segmento de P&amp;C FSC<sup>&reg;</sup>, no solo con el objetivo de recibir y mantener la Certificaci&oacute;n Forestal, sino tambi&eacute;n de la mejora continua de su sector forestal, con un enfoque en la conservaci&oacute;n del medio ambiente y en la justicia social.</p><p>La empresa se compromete a:<br />- Cumplir con los Principios y Criterios del FSC<sup>&reg;</sup> - Forest Stewardship Council<sup>&reg;</sup>, aceptados a nivel nacional e internacional.<br />- Respetar la soberan&iacute;a nacional, as&iacute; como las leyes, acuerdos y tratados internacionales otorgados por el pa&iacute;s.<br />- Conservar todos los documentos de tenencia y uso de la tierra, as&iacute; como los recursos forestales, de acuerdo con la legislaci&oacute;n nacional.<br />- Apuntar siempre a mejorar la vida de sus trabajadores y la comunidad local.<br />- Salvaguardar los remanentes de bosques nativos presentes en las &aacute;reas sujetas a certificaci&oacute;n, con el objetivo de la conservaci&oacute;n de los recursos naturales, as&iacute; como la preservaci&oacute;n de la fauna y flora nativas.<br />- No convertir bosques naturales en plantaciones forestales de especies ex&oacute;ticas.<br />- Mantener &aacute;reas de inter&eacute;s ecol&oacute;gico y paisaj&iacute;stico (cascadas, cuevas, ca&ntilde;ones) presentes en sus &aacute;reas para las generaciones futuras.<br />- Manejar sus plantaciones forestales de manera ambiental, social y econ&oacute;micamente responsable.<br />- Promover el uso eficiente, econ&oacute;mico y optimizado de sus bosques.<br />- Recuperar, seg&uacute;n planificaci&oacute;n previa, &aacute;reas degradadas y &aacute;reas de Conservaci&oacute;n Permanente.<br />- Fomentar el uso m&uacute;ltiple de sus &aacute;reas, respetando siempre la responsabilidad ambiental y la biodiversidad.</p>', NULL, 1, '2021-02-02 08:18:46'),
(5, 7, 'Monitoramento ||| Monitoring ||| Vigilancia', '<p>A maioria das atividades e opera&ccedil;&otilde;es da Sincol s&atilde;o monitoradas e controladas, visando n&atilde;o s&oacute; a registrar as atividades desenvolvidas, como tamb&eacute;m a detectar defici&ecirc;ncias e aspectos a serem melhorados.</p><p>Esse monitoramento busca controlar o desempenho ambiental, florestal e social da EMF, principalmente quanto &agrave; manuten&ccedil;&atilde;o dos compromissos relacionados ao FSC<sup>&reg;</sup>.</p><p>O resultado do monitoramento deve ser sempre analisado e utilizado em prol da melhoria cont&iacute;nua da empresa, al&eacute;m de ser incorporado &agrave; Revis&atilde;o Anual do Plano de Manejo.</p><p>O monitoramento social &eacute; feito atrav&eacute;s do Departamento de Recursos Humanos e do Setor de Seguran&ccedil;a do Trabalho. Existe um programa criado especificamente com tal finalidade: o Programa de Desenvolvimento Social que prop&otilde;e, al&eacute;m da cria&ccedil;&atilde;o de um canal de di&aacute;logo formal, o monitoramento da quest&atilde;o social relacionada &agrave;s vilas florestais da empresa e das comunidades do entorno para implementa&ccedil;&atilde;o cont&iacute;nua de melhorias, de acordo com os resultados desse programa.</p><p>Como fruto da pol&iacute;tica conservacionista da empresa e dos compromissos com o FSC<sup>&reg;</sup>, a Sincol requereu de especialistas a avalia&ccedil;&atilde;o da situa&ccedil;&atilde;o ambiental dos fragmentos nativos das fazendas. Os resultados da avalia&ccedil;&atilde;o da fauna e flora nativas das fazendas florestais est&atilde;o descritos no Programa de Gest&atilde;o Ambiental - Subprograma de Conserva&ccedil;&atilde;o de Ecossistemas.</p><p>Os mapas demonstram visualmente o aproveitamento das UMFs e a conectividade entre os fragmentos. A empresa continuamente avalia a situa&ccedil;&atilde;o de suas &aacute;reas nativas no futuro, para poder monitorar comparativamente as melhorias ambientais decorrentes das pr&aacute;ticas adotadas para recupera&ccedil;&atilde;o e preserva&ccedil;&atilde;o de ecossistemas.</p><p>A tabela a seguir resume o sistema de monitoramento de atividades da empresa.</p><p>|||</p><p>Most of Sincol&#39;s activities and operations are monitored and controlled, aiming not only to record the activities carried out, but also to detect deficiencies and aspects to be improved.</p><p>This monitoring seeks to control the environmental, forestry and social performance of the EMF, especially regarding the maintenance of commitments related to the FSC<sup>&reg;</sup>.</p><p>The result of monitoring must always be analyzed and used for the continuous improvement of the company, in addition to being incorporated into the Annual Review of the Management Plan.</p><p>Social monitoring is carried out through the Human Resources Department and the Occupational Safety Sector. There is a program created specifically for this purpose: the Social Development Program which proposes, in addition to the creation of a formal dialogue channel, the monitoring of the social issue related to the company&#39;s forest villages and surrounding communities for the continuous implementation of improvements, according to the results of that program.</p><p>As a result of the company&#39;s conservation policy and commitments to the FSC<sup>&reg;</sup>, Sincol required specialists to assess the environmental situation of the native fragments of the farms. The results of the assessment of the native fauna and flora of the forest farms are described in the Environmental Management Program - Ecosystem Conservation Subprogram.</p><p>The maps visually demonstrate the leverage of UMFs and the connection between fragments. The company continuously assesses the situation of its native areas in the future, in order to be able to comparatively monitor the environmental improvements resulting from the practices adopted for the recovery and preservation of ecosystems.</p><p>The following table summarizes the company&#39;s activity monitoring system.</p><p>|||</p><p>La mayor&iacute;a de las actividades y operaciones de Sincol son monitoreadas y controladas, con el objetivo no solo de registrar las actividades realizadas, sino tambi&eacute;n de detectar deficiencias y aspectos a mejorar.</p><p>Este monitoreo busca controlar el desempe&ntilde;o ambiental, forestal y social de la EMF, especialmente en lo que respecta al mantenimiento de los compromisos relacionados con el FSC<sup>&reg;</sup>.</p><p>El resultado del seguimiento siempre debe ser analizado y utilizado para la mejora continua de la empresa, adem&aacute;s de ser incorporado en la Revisi&oacute;n Anual del Plan de Gesti&oacute;n.</p><p>El seguimiento social se realiza a trav&eacute;s de la Direcci&oacute;n de Recursos Humanos y el Sector de Seguridad Laboral. Existe un programa creado espec&iacute;ficamente para este prop&oacute;sito: el Programa de Desarrollo Social que propone, adem&aacute;s de la creaci&oacute;n de un canal de di&aacute;logo formal, el seguimiento de la problem&aacute;tica social relacionada con los poblados forestales de la empresa y comunidades aleda&ntilde;as para la implementaci&oacute;n continua de mejoras, de acuerdo con los resultados de ese programa.</p><p>Como resultado de la pol&iacute;tica de conservaci&oacute;n de la empresa y los compromisos con el FSC<sup>&reg;</sup>, Sincol requiri&oacute; especialistas para evaluar la situaci&oacute;n ambiental de los fragmentos nativos de las fincas. Los resultados de la evaluaci&oacute;n de la fauna y flora nativa de las fincas forestales se describen en el Programa de Manejo Ambiental - Subprograma de Conservaci&oacute;n de Ecosistemas.</p><p>Los mapas demuestran visualmente el apalancamiento de UMF y la conectividad entre fragmentos. La empresa eval&uacute;a continuamente la situaci&oacute;n de sus &aacute;reas nativas en el futuro, con el fin de poder monitorear comparativamente las mejoras ambientales resultantes de las pr&aacute;cticas adoptadas para la recuperaci&oacute;n y preservaci&oacute;n de los ecosistemas.</p><p>La siguiente tabla resume el sistema de seguimiento de la actividad de la empresa.</p>', NULL, 1, '2021-02-02 08:23:58'),
(6, 8, 'Política de Suprimento com Madeira de Fonte Controlada ||| Controlled Source Wood Supply Policy ||| Política de Suministro de Madera de Fuente Controlada', '<p>A empresa Sincol consome grande parte de toda madeira explorada de suas pr&oacute;prias florestas certificadas e n&atilde;o certificadas.<br /><br />Por&eacute;m, uma pequena propor&ccedil;&atilde;o de madeira proveniente de fornecedores externos tamb&eacute;m &eacute; consumida.<br />Essas madeiras adquiridas pela Sincol n&atilde;o s&atilde;o origin&aacute;rias de fontes controversas, ou seja, n&atilde;o origin&aacute;rias de &aacute;reas onde:<br /><br />a) ocorreu explora&ccedil;&atilde;o ilegal;<br />b) a explora&ccedil;&atilde;o implicou na viola&ccedil;&atilde;o de direitos civis e tradicionais;<br />c) a madeira &eacute; obtida de florestas cujo alto valor de conserva&ccedil;&atilde;o est&aacute; amea&ccedil;ado pelas atividades de manejo;<br />d) a madeira &eacute; oriunda de florestas cujas terras est&atilde;o sendo convertidas em planta&ccedil;&otilde;es ou destinadas a outros usos que n&atilde;o o florestal;<br />e) a madeira de florestas onde s&atilde;o plantadas &aacute;rvores geneticamente modificadas.</p><p>&nbsp;</p><p>A Sincol atrav&eacute;s de sua pol&iacute;tica assume o compromisso no sentido de implementar seus melhores esfor&ccedil;os para utilizar apenas os materiais provenientes de fontes aceit&aacute;veis pelo FSC<sup>&reg;</sup>.</p><p>|||</p><p>The Sincol company consumes a large part of all wood harvested from its own certified and non-certified forests.</p><p>However, a small proportion of wood from external suppliers is also consumed.<br />These woods acquired by Sincol do not originate from controversial sources, that is, they do not originate from areas where:</p><p>&nbsp;</p><p>a) illegal exploitation occurred;<br />b) the exploitation implied the violation of civil and traditional rights;<br />c) wood is obtained from forests whose high conservation value is threatened by management activities;<br />d) the wood comes from forests whose lands are being converted into plantations or destined for uses other than forestry;<br />e) wood from forests where genetically modified trees are planted.</p><p>&nbsp;</p><p>Sincol, through its policy, is committed to implementing its best efforts to use only materials from sources acceptable to FSC<sup>&reg;</sup>.</p><p>|||</p><p>La empresa Sincol consume gran parte de toda la madera extra&iacute;da de sus propios bosques certificados y no certificados.</p><p>Sin embargo, tambi&eacute;n se consume una peque&ntilde;a proporci&oacute;n de madera de proveedores externos.<br />Estas maderas adquiridas por Sincol no proceden de fuentes controvertidas, es decir, no proceden de zonas donde:</p><p>a) ocurri&oacute; explotaci&oacute;n ilegal;<br />b) la explotaci&oacute;n implic&oacute; la violaci&oacute;n de derechos civiles y tradicionales;<br />c) la madera se obtiene de bosques cuyo alto valor de conservaci&oacute;n est&aacute; amenazado por las actividades de manejo;<br />d) la madera proviene de bosques cuyas tierras se est&aacute;n convirtiendo en plantaciones o destinadas a usos distintos al forestal;<br />e) madera de bosques donde se plantan &aacute;rboles modificados gen&eacute;ticamente.</p><p>&nbsp;</p><p>Sincol, a trav&eacute;s de su pol&iacute;tica, se compromete a implementar sus mejores esfuerzos para utilizar solo materiales de fuentes aceptables para FSC<sup>&reg;</sup>.</p>', NULL, 1, '2021-02-02 08:28:55'),
(7, 4, 'Recursos Humanos ||| Human Resources ||| Recursos Humanos', '<p>Os recursos humanos representam um grande patrim&ocirc;nio para a Sincol. S&atilde;o mais de 1.300 fam&iacute;lias ligadas diretamente ao cotidiano da empresa. Al&eacute;m de todas as modalidades assistenciais legalmente previstas, a Sincol oferece uma s&eacute;rie de benef&iacute;cios sociais; entre eles, uma bela sede para integra&ccedil;&atilde;o e confraterniza&ccedil;&atilde;o dos colaboradores e familiares. Tudo isso faz parte da pol&iacute;tica praticada pela empresa.</p><p>|||</p><p>Human resources represent a great asset for Sincol. There are more than 1,300 families directly connected to the company&#39;s daily life. In addition to all the legal assistance modalities provided, Sincol offers a series of social benefits; among them, a beautiful place for the integration and fraternization of employees and their families. All of this is part of the policy practiced by the company.</p><p>|||</p><p>Los recursos humanos representan un gran activo para Sincol. Hay m&aacute;s de 1.300 familias directamente conectadas con la vida diaria de la empresa. Adem&aacute;s de todas las modalidades de asistencia legal que brinda, Sincol ofrece una serie de beneficios sociales; entre ellos, un hermoso espacio para la integraci&oacute;n y confraternizaci&oacute;n de los colaboradores y sus familias. Todo esto es parte de la pol&iacute;tica que practica la empresa.</p>', NULL, 1, '2021-02-02 08:29:41'),
(8, 9, 'S.E.R.S.I -Sociedade Esportiva e Recreativa Sincol', '<p>Como reflexo de toda a dedica&ccedil;&atilde;o da Sincol aos seus colaboradores e &agrave; comunidade em geral, em 12 de dezembro de 1981, foi fundada na cidade de Ca&ccedil;ador, a Sociedade Esportiva e Recreativa Sincol &ndash; SERSI.<br />&nbsp;</p><p>Trata-se de uma agremia&ccedil;&atilde;o cultural, esportiva, recreativa e social, de car&aacute;ter beneficente, que possui entre suas finalidades:</p><p>- Promover e estimular a pr&aacute;tica de todos os esportes amadores;<br />- Fomentar o congra&ccedil;amento de todos os seus associados e de seus familiares;<br />- Organizar e patrocinar reuni&otilde;es, excurs&otilde;es e divers&otilde;es esportivas, culturais, sociais e c&iacute;vicas;<br />- Proporcionar, dentro de suas possibilidades, benef&iacute;cios e vantagens aos associados.<br />&nbsp;</p><p>Ao apoiar e dar suporte a todo e qualquer tipo de esporte, a SERSI ganhou notoriedade dentre muitos eventos esportivos. Diversos foram os pr&ecirc;mios e medalhas conquistados pelos seus colaboradores. Em cada modalidade h&aacute; algum exemplo de supera&ccedil;&atilde;o e de garra, al&eacute;m de in&uacute;meros talentos revelados, como no domin&oacute; feminino, que angariou o 1&ordm; lugar no Campeonato Sul Brasileiro do SESI; e as equipes de v&ocirc;lei e de futsal, tanto femininas como masculinas, que sempre conquistam &oacute;timas coloca&ccedil;&otilde;es em torneios. Mas o maior destaque na &aacute;rea esportiva &eacute; que a empresa det&eacute;m o trof&eacute;u rotativo do Torneio do Trabalhador do SESI por ter vencido por 5 vezes alternadas.</p><p>Al&eacute;m de sua relev&acirc;ncia no setor esportivo, a SERSI comemora muitas outras conquistas, entre elas a constru&ccedil;&atilde;o da Sede Social, com campo de futebol, quiosques e quadras de areia, que est&atilde;o &agrave; disposi&ccedil;&atilde;o de todos os colaboradores.</p><p>|||</p><p>As a reflection of all Sincol&#39;s dedication to its employees and the community in general, on December 12, 1981, the Sociedade Esportiva e Recreativa Sincol &ndash; SERSI was founded in the city of Ca&ccedil;ador &ndash; Brazil.<br />&nbsp;</p><p>It is a cultural, sporting, recreational and social association, of a charitable nature, which has among its purposes:</p><p>- Promote and encourage the practice of all amateur sports;<br />- Foster the interaction of all its members and their families;<br />- Organize and sponsor sports, cultural, social and civic meetings, excursions and entertainment;<br />- Provide, within its possibilities, benefits and advantages to members.<br />&nbsp;</p><p>SERSI has gained notoriety among many sporting events due to its constant support to all kids of sports. Several awards and medals were won by our employees. In each modality there is some example of resilience and determination, in addition to countless talents revealed, such as in the female dominoes, which won 1st place in the SESI South Brazilian Championship; and the volleyball and futsal teams, both women&#39;s and men&#39;s, who always achieve great places in tournaments. But the biggest highlight in the sports area is that the company holds the rotating trophy in the SESI Worker&#39;s Tournament for having won 5 alternate times.</p><p>In addition to its relevance in the sports sector, SERSI celebrates many other achievements, including the construction of the Social Area, with a soccer field, kiosks and sand courts, which are available to all employees.</p><p>|||</p><p>Como reflejo de toda la dedicaci&oacute;n de Sincol a sus empleados y la comunidad en general, el 12 de diciembre de 1981 se fund&oacute; la Sociedad de Recreaci&oacute;n y Deportes Sincol - SERSI en la ciudad de Ca&ccedil;ador &ndash; Brasil.</p><p>&nbsp;</p><p>Es una asociaci&oacute;n cultural, deportiva, recreativa y social, de car&aacute;cter ben&eacute;fico, que tiene entre sus finalidades:</p><p>- Promover y fomentar la pr&aacute;ctica de todos los deportes;<br />- Fomentar la interacci&oacute;n de todos sus miembros y sus familias;<br />- Organizar y patrocinar encuentros, excursiones y entretenimientos deportivos, culturales, sociales y c&iacute;vicos;<br />- Brindar, dentro de sus posibilidades, beneficios y ventajas a los socios.<br />&nbsp;</p><p>Al apoyar y apoyar cualquier tipo de deporte, SERSI ha ganado notoriedad entre muchos eventos deportivos. Hubo varios premios y medallas ganadas por sus empleados. En cada modalidad hay alg&uacute;n ejemplo de resiliencia y determinaci&oacute;n, adem&aacute;s de innumerables talentos revelados, como en el domin&oacute; femenino, que obtuvo el 1er lugar en el Campeonato SESI Sur Brasile&ntilde;o; y los equipos de voleibol y f&uacute;tbol sala, tanto femeninos como masculinos, que siempre logran grandes puestos en los torneos. Pero lo m&aacute;s destacado en el &aacute;rea deportiva es que la empresa ostenta el trofeo rotatorio en el Torneo de Trabajadores SESI por haber ganado 5 veces alternas.</p><p>Adem&aacute;s de su relevancia en el sector deportivo, SERSI celebra muchos otros logros, entre ellos la construcci&oacute;n de la Sede Social, con cancha de f&uacute;tbol, kioscos y canchas de arena, que est&aacute;n a disposici&oacute;n de todos los empleados.</p>', NULL, 1, '2021-02-02 08:31:02'),
(9, 10, 'Selo Social ||| Social Certification ||| Sello social', '<p><strong>Social</strong></p><p>Projetos e a&ccedil;&otilde;es desenvolvidas na Sincol visam a melhorar a qualidade de vida dos colaboradores.</p><p><strong>Selo Social</strong></p><p>A Sincol se orgulha pelo reconhecimento de suas a&ccedil;&otilde;es sociais. A conquista do selo social incentiva a manter firme o compromisso de uma gest&atilde;o socialmente respons&aacute;vel e atenta ao colaborador, levando-se em considera&ccedil;&atilde;o o desafio de manter e aprimorar suas rela&ccedil;&otilde;es e condi&ccedil;&otilde;es do ambiente de trabalho.</p><p>|||</p><p><strong>Social</strong></p><p>Projects and actions developed at Sincol aim to improve the quality of life of employees.</p><p><strong>Social Certification</strong></p><p>Sincol is proud of the recognition of our social actions. Winning the social certification encourages the company to maintain its commitment to socially responsible management that is attentive to employees, taking into account the challenge of maintaining and improving their relationships and working environment conditions.</p><p>|||</p><p><strong>Social</strong></p><p>Los proyectos y acciones desarrollados en Sincol tienen como objetivo mejorar la calidad de vida de los empleados.</p><p><strong>Sello social</strong></p><p>Sincol se enorgullece del reconocimiento a sus acciones sociales. La obtenci&oacute;n del sello social anima a la empresa a mantener su compromiso con una gesti&oacute;n socialmente responsable y atenta a los empleados, teniendo en cuenta el reto de mantener y mejorar sus relaciones y condiciones de entorno laboral.</p>', NULL, 1, '2021-02-02 08:47:19'),
(10, 11, 'Saúde ||| Well-being and Health ||| Salud y bienestar', '<p>Com a preocupa&ccedil;&atilde;o constante de melhorar sempre a qualidade e principalmente o estilo de vida dos seus colaboradores, a Sincol oferece atendimento m&eacute;dico, fonoaudiol&oacute;gico, odontol&oacute;gico e nutricional.</p><p>|||</p><p>With the constant concern to always improve the quality and especially the lifestyle of our employees, Sincol offers medical care, speech therapy, dental care and nutritional care.</p><p>|||</p><p>Con la preocupaci&oacute;n constante de mejorar siempre la calidad y especialmente el estilo de vida de sus empleados, Sincol ofrece atenci&oacute;n m&eacute;dica, logop&eacute;dica, odontol&oacute;gica y nutricional.</p>', NULL, 1, '2021-02-02 08:48:26'),
(12, 13, 'Treinamento e Capacitação ||| Training and Qualification ||| Entrenamiento y Cualificación', '<p>A empresa procura facilitar o desenvolvimento profissional de seus colaboradores, por meio de treinamentos no local de trabalho, cursos, palestras, semin&aacute;rios, workshops, visita&ccedil;&atilde;o em feiras, entre outros.</p><p>|||</p><p>The company seeks to improve the professional development of its employees, through in-company trainings, courses, lectures, seminars, workshops, visits to fairs, among others.</p><p>|||</p><p>La empresa busca facilitar el desarrollo profesional de sus empleados, a trav&eacute;s de capacitaciones <em>in-company</em>, cursos, charlas, seminarios, talleres, visitas a ferias, entre otros.</p>', NULL, 1, '2021-02-02 08:57:02'),
(13, 5, 'Qualidade ||| Quality ||| Calidad', '<p>Do manejo da floresta &agrave; instala&ccedil;&atilde;o na obra, cada passo do processo &eacute; monitorado para que os padr&otilde;es e excel&ecirc;ncia da Sincol estejam sempre em primeiro plano. O investimento permanente na melhoria dos processos e nas pol&iacute;ticas da qualidade faz com que a cada ano a marca Sincol esteja mais destacada nos setores da arquitetura e da constru&ccedil;&atilde;o civil.</p><p>|||</p><p>From forest management to installation on site, each step of the process is monitored so that the Sincol standards and excellence are always highlighted. The permanent investment in improving processes and quality policies makes the Sincol brand stand out each year in the architecture and civil construction sectors.</p><p>|||</p><p>Desde el manejo forestal hasta la instalaci&oacute;n en el sitio, cada paso del proceso es monitoreado para que los est&aacute;ndares y la excelencia de Sincol est&eacute;n siempre a la vanguardia. La permanente mejora de procesos y pol&iacute;ticas de calidad hace que la marca Sincol se destaque cada a&ntilde;o en los sectores de la arquitectura y la construcci&oacute;n civil.</p>', NULL, 1, '2021-02-02 09:02:03'),
(14, 14, 'Política da Qualidade ||| Quality Policy ||| Política de Calidad', '<p>A Sincol tem o compromisso de fornecer produtos e servi&ccedil;os, visando ao aumento da satisfa&ccedil;&atilde;o dos clientes, com solu&ccedil;&otilde;es inovadoras em aberturas e pain&eacute;is de madeira, atendendo aos requisitos normativos e regulamentares aplic&aacute;veis, mantendo um relacionamento de confian&ccedil;a com clientes, fornecedores e colaboradores, garantindo assim a melhoria cont&iacute;nua do sistema de gest&atilde;o da qualidade, de quest&otilde;es sociais, ambientais e econ&ocirc;micas.</p><p>&nbsp;</p><p><strong>Objetivos da qualidade</strong></p><p>- Realizar e manter uma gest&atilde;o econ&ocirc;mica competitiva e sustent&aacute;vel;<br />- Melhorar o relacionamento e a confian&ccedil;a com os clientes e fornecedores;<br />- Aprimorar continuamente os processos, produtos e servi&ccedil;os;<br />- Assegurar as condi&ccedil;&otilde;es sociais, o desenvolvimento e as compet&ecirc;ncias t&eacute;cnicas e operacionais dos colaboradores, atendendo aos requisitos normativos e regulamentares aplic&aacute;veis;<br />- Garantir a melhoria cont&iacute;nua do sistema de gest&atilde;o de qualidade e das condi&ccedil;&otilde;es ambientais.</p><p>|||</p><p>Sincol is committed to providing products and services, aiming to increase customer satisfaction, with innovative solutions in openings and wood panels, fullfilling the applicable regulatory requirements, maintaining a relationship of trust with customers, suppliers and employees, thus ensuring the continuous improvement of the quality management system, of social, environmental and economic issues.</p><p>&nbsp;</p><p><strong>Quality Objectives</strong></p><p>- Carry out and maintain competitive and sustainable economic management;<br />- Improve the relationship and trust with customers and suppliers;<br />- Continuously improve processes, products and services;<br />- Ensure the social conditions, development and technical and operational skills of employees, fulfilling the applicable normative and regulatory requirements;<br />- Ensure continuous improvement of the quality management system and environmental conditions.</p><p>|||</p><p>Sincol tiene el compromiso de brindar productos y servicios, con el objetivo de incrementar la satisfacci&oacute;n del cliente, con soluciones innovadoras en aberturas y paneles de madera, cumpliendo con los requisitos reglamentarios aplicables, manteniendo una relaci&oacute;n de confianza con los clientes, proveedores y empleados, asegurando as&iacute; la mejora continua del sistema de gesti&oacute;n de la calidad, de las cuestiones sociales, ambientales y econ&oacute;micas.</p><p>&nbsp;</p><p><strong>Objetivos de calidad</strong></p><p>- Realizar y mantener una gesti&oacute;n econ&oacute;mica competitiva y sostenible;<br />- Mejorar la relaci&oacute;n y la confianza con clientes y proveedores;<br />- Mejorar continuamente los procesos, productos y servicios;<br />- Asegurar las condiciones sociales, el desarrollo y las habilidades t&eacute;cnicas y operativas de los empleados, cumpliendo con los requisitos normativos y regulatorios aplicables;<br />- Asegurar la mejora continua del sistema de gesti&oacute;n de la calidad y las condiciones ambientales.</p>', NULL, 1, '2021-02-02 09:02:24'),
(15, 15, 'Missão, Visão e Valores ||| Mission, Vision and Values ||| Misión, Visión y Valores', '<p><strong>Miss&atilde;o</strong></p><p>Satisfazer as necessidades dos nossos clientes, com solu&ccedil;&otilde;es inovadoras de forma ambiental, social e economicamente sustent&aacute;vel.</p><p><strong>Vis&atilde;o</strong></p><p>Ser o melhor provedor em aberturas e pain&eacute;is de madeira, bem como a mais rent&aacute;vel e a melhor empresa do setor para se trabalhar.</p><p><strong>Valores</strong></p><p>Conduzimos nossos neg&oacute;cios cumprindo as leis, com profissionalismo, honestidade, seriedade, respeitando as pessoas e as institui&ccedil;&otilde;es.</p><p>|||</p><p><strong>Mission</strong></p><p>Satisfy our customers&#39; needs with innovative solutions in an environmentally, socially and economically sustainable way.</p><p><strong>Vision</strong></p><p>Be the best provider of openings and wood panels, as well as the most profitable and best company in the sector to work for.</p><p><strong>Values</strong></p><p>We conduct our business in compliance with the law, with professionalism, honesty, seriousness, respecting people and institutions.</p><p>|||</p><p><strong>Misi&oacute;n</strong></p><p>Satisfacer las necesidades de nuestros clientes con soluciones innovadoras de forma medioambiental, social y econ&oacute;micamente sostenible.</p><p><strong>Visi&oacute;n</strong></p><p>Ser el mejor proveedor de aberturas y paneles de madera, as&iacute; como la empresa m&aacute;s rentable y la mejor del sector para trabajar.</p><p><strong>Valores</strong></p><p>Conducimos nuestro negocio de conformidad con la ley, con profesionalismo, honestidad, seriedad, respetando a las personas e instituciones.</p>', NULL, 1, '2021-02-02 09:10:04'),
(16, 16, 'Certificações ||| Certifications ||| Certificaciones', '<p>Conhe&ccedil;a nossas certifica&ccedil;&otilde;es:</p><p>|||</p><p>Here we present you our certifications.</p><p>|||</p><p>Descubra nuestras certificaciones.</p>', NULL, 1, '2021-02-02 09:10:22'),
(17, 17, 'Prêmios ||| Awards ||| Premios', '<p>Uma evolu&ccedil;&atilde;o natural conduziu a Sincol ao patamar de melhor e maior fabricante de portas do Brasil. Sua preocupa&ccedil;&atilde;o constante na melhoria dos processos e pol&iacute;ticas de qualidades &eacute; reconhecida publicamente por meio de premia&ccedil;&otilde;es e reconhecimentos nacionais e internacionais.</p><p>Os pr&ecirc;mios s&atilde;o consequ&ecirc;ncias de suas a&ccedil;&otilde;es para o mercado.</p><p>|||</p><p>A natural evolution led Sincol to the level of the best and greatest door manufacturer in Brazil. Its constant concern for improving processes and quality policies is publicly recognized through national and international awards and recognition.</p><p>Prizes are consequences of your actions in the market.</p><p>|||</p><p>Una evoluci&oacute;n natural llev&oacute; a Sincol al nivel del mejor y m&aacute;s grande fabricante de puertas de Brasil. Su constante preocupaci&oacute;n por mejorar los procesos y las pol&iacute;ticas de calidad es reconocida p&uacute;blicamente a trav&eacute;s de premios y reconocimientos nacionales e internacionales.</p><p>Los premios son consecuencia de sus acciones en el mercado.</p>', NULL, 1, '2021-02-02 09:20:36'),
(19, 20, 'Compromisso com o FSC<sup>®</sup> ||| Commitment to FSC<sup>®</sup> ||| Compromiso con FSC<sup>®</sup>', '<p><strong>A Reflorestadora Sincol Ltda. e a Sincol S/A Ind&uacute;stria e Com&eacute;rcio </strong>registram aqui seu compromisso com o segmento dos P&amp;C do FSC<sup>&reg;</sup>, n&atilde;o apenas visando o recebimento e a manuten&ccedil;&atilde;o da Certifica&ccedil;&atilde;o Florestal, mas tamb&eacute;m a melhoria cont&iacute;nua de seu setor florestal, com foco na conserva&ccedil;&atilde;o ambiental e na justi&ccedil;a social.<br /><br />A empresa compromete-se a:<br />- Obedecer aos Princ&iacute;pios e Crit&eacute;rios do FSC<sup>&reg;</sup> - Forest Stewardship Council<sup>&reg;</sup>, nacional e internacionalmente aceitos.<br />- Respeitar a soberania nacional, bem como as leis, acordos e tratados internacionais outorgados pelo pa&iacute;s.<br />- Manter todos os documentos de posse e uso da terra, bem como os de recursos florestais, de acordo com a legisla&ccedil;&atilde;o nacional.<br />- Objetivar sempre a melhoria de vida de seus trabalhadores e da comunidade local.<br />- Salvaguardar seus remanescentes de florestas nativas presentes nas &aacute;reas objeto da certifica&ccedil;&atilde;o, objetivando a conserva&ccedil;&atilde;o dos recursos naturais, bem como a preserva&ccedil;&atilde;o da fauna e da flora nativa.<br />- N&atilde;o converter florestas naturais em planta&ccedil;&otilde;es florestais de esp&eacute;cies ex&oacute;ticas.<br />- Manter &aacute;reas de interesse ecol&oacute;gico e paisag&iacute;sticos (cachoeiras, grutas, c&acirc;nions) presentes em suas &aacute;reas para as futuras gera&ccedil;&otilde;es.<br />- Manejar suas planta&ccedil;&otilde;es florestais de maneira ambiental, social e economicamente respons&aacute;vel.<br />- Promover o uso eficiente, econ&ocirc;mico e otimizado de suas florestas.<br />- Recuperar, de acordo com planejamento pr&eacute;vio, &aacute;reas degradadas e &aacute;reas de Preserva&ccedil;&atilde;o Permanente.<br />- Incentivar o uso m&uacute;ltiplo de suas &aacute;reas, respeitando sempre a responsabilidade ambiental e a biodiversidade.</p><p>|||</p><p><strong>Reflorestadora Sincol Ltda. and Sincol S/A Ind&uacute;stria e Com&eacute;rcio</strong> register here their commitment to the FSC<sup>&reg;</sup> P&amp;C segment, not only aiming at receiving and maintaining Forest Certification, but also at the continuous improvement of its forest sector, with a focus on environmental conservation and in social justice.</p><p>The company engages to:<br />- Comply with the Principles and Criteria of the FSC<sup>&reg;</sup> - Forest Stewardship Council<sup>&reg;</sup>, nationally and internationally accepted.<br />- Respect national sovereignty, as well as international laws, agreements and treaties granted by the country.<br />- Keep all land tenure and use documents, as well as forest resources, in accordance with national legislation.<br />- Always aim to improve the lives of our workers and the local community.<br />- Safeguard the remnants of native forests present in the areas subject to certification, aiming at the conservation of natural resources, as well as the preservation of native fauna and flora.<br />- Do not convert natural forests into forest plantations of exotic species.<br />- Maintain areas of ecological and natural interest (waterfalls, caves, canyons) present in their areas for future generations.<br />- Manage our forest plantations in an environmentally, socially and economically responsible manner.<br />- Promote the efficient, economical and optimized use of its forests.<br />- Recover, according to previous planning, degraded areas and Permanent Preservation areas.<br />- Encourage the multiple use of these areas, always respecting environmental responsibility and biodiversity.</p><p>|||</p><p><strong>Reflorestadora Sincol Ltda. y Sincol S / A Ind&uacute;stria e Com&eacute;rcio</strong> registran aqu&iacute; su compromiso con el segmento de P&amp;C FSC<sup>&reg;</sup>, no solo con el objetivo de recibir y mantener la Certificaci&oacute;n Forestal, sino tambi&eacute;n de la mejora continua de su sector forestal, con un enfoque en la conservaci&oacute;n del medio ambiente y en la justicia social.</p><p>La empresa se compromete a:<br />- Cumplir con los Principios y Criterios del FSC<sup>&reg;</sup> - Forest Stewardship Council<sup>&reg;</sup>, aceptados a nivel nacional e internacional.<br />- Respetar la soberan&iacute;a nacional, as&iacute; como las leyes, acuerdos y tratados internacionales otorgados por el pa&iacute;s.<br />- Conservar todos los documentos de tenencia y uso de la tierra, as&iacute; como los recursos forestales, de acuerdo con la legislaci&oacute;n nacional.<br />- Apuntar siempre a mejorar la vida de sus trabajadores y la comunidad local.<br />- Salvaguardar los remanentes de bosques nativos presentes en las &aacute;reas sujetas a certificaci&oacute;n, con el objetivo de la conservaci&oacute;n de los recursos naturales, as&iacute; como la preservaci&oacute;n de la fauna y flora nativas.<br />- No convertir bosques naturales en plantaciones forestales de especies ex&oacute;ticas.<br />- Mantener &aacute;reas de inter&eacute;s ecol&oacute;gico y paisaj&iacute;stico (cascadas, cuevas, ca&ntilde;ones) presentes en sus &aacute;reas para las generaciones futuras.<br />- Manejar sus plantaciones forestales de manera ambiental, social y econ&oacute;micamente responsable.<br />- Promover el uso eficiente, econ&oacute;mico y optimizado de sus bosques.<br />- Recuperar, seg&uacute;n planificaci&oacute;n previa, &aacute;reas degradadas y &aacute;reas de Conservaci&oacute;n Permanente.<br />- Fomentar el uso m&uacute;ltiple de sus &aacute;reas, respetando siempre la responsabilidad ambiental y la biodiversidad.</p>', NULL, 1, '2021-08-20 09:13:26');

-- --------------------------------------------------------

--
-- Estrutura da tabela `quemsomos_categoria`
--

CREATE TABLE `quemsomos_categoria` (
  `cat_id` int(11) NOT NULL,
  `cat_pai` int(11) DEFAULT NULL,
  `cat_titulo` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cat_ordem` int(11) NOT NULL,
  `cat_slug` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `quemsomos_categoria`
--

INSERT INTO `quemsomos_categoria` (`cat_id`, `cat_pai`, `cat_titulo`, `cat_ordem`, `cat_slug`) VALUES
(1, NULL, 'Nossa História ||| Our History ||| Nosotros', 1, 'nossa-historia'),
(2, NULL, 'A Indústria ||| The Industry ||| La Industria', 2, 'a-industria'),
(3, NULL, 'Reflo ||| Our Forests |||  Reforestación Sincol', 6, 'nossas-florestas'),
(4, NULL, 'Gestão Social ||| Human Resources |||  Gestión Social', 5, 'recursos-humanos'),
(5, NULL, 'Qualidade ||| Quality ||| Calidad', 4, 'qualidade'),
(6, 3, 'Compromisso com o FSC', 1, 'compromisso-com-o-fsc'),
(7, 3, 'Monitoramento', 2, 'monitoramento'),
(8, 3, 'Política', 3, 'politica'),
(9, 4, 'S.E.R.S.I', 1, 'sersi'),
(10, 4, 'Selo Social', 2, 'selo-social'),
(11, 4, 'Saúde', 3, 'saude'),
(13, 4, 'Treinamento e Capacitação', 5, 'treinamento-e-capacitacao'),
(14, 5, 'Política da qualidade', 1, 'politica-da-qualidade'),
(15, NULL, 'Missão, Visão e Valores ||| Mission, Vision and Values ||| Misión, Visión y Valores', 3, 'missao-visao-valores'),
(16, NULL, 'Certificações', 3, 'certificacoes'),
(17, 5, 'Prêmios', 4, 'premios'),
(18, 5, 'Segurança', 5, 'seguranca'),
(20, NULL, 'Resumo Público |||  Public Summary ||| Resumen Público', 7, 'resumo-publico');

-- --------------------------------------------------------

--
-- Estrutura da tabela `representante`
--

CREATE TABLE `representante` (
  `rep_id` int(11) NOT NULL,
  `rpr_id` int(11) DEFAULT NULL,
  `rep_nome` varchar(256) CHARACTER SET latin1 DEFAULT NULL,
  `rep_fone` varchar(30) CHARACTER SET latin1 DEFAULT NULL,
  `rep_foneaux` varchar(30) CHARACTER SET latin1 DEFAULT NULL,
  `rep_whatsapp` varchar(256) DEFAULT NULL,
  `rep_email` varchar(128) CHARACTER SET latin1 DEFAULT NULL,
  `rep_status` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `representante`
--

INSERT INTO `representante` (`rep_id`, `rpr_id`, `rep_nome`, `rep_fone`, `rep_foneaux`, `rep_whatsapp`, `rep_email`, `rep_status`) VALUES
(2, 2, 'Jadna Saturno', '(48) 9 9684-8232', '(48) 9 9106-4444', '(48) 9684-8232', 'guiarepresenta@gmail.com', 1),
(3, 3, 'Lopes', '(48) 3257-6661', '(48) 98408-6956', '(48) 8408-6956', 'adm@lopess.com.br', 1),
(4, 4, 'Giancarlo F. Rodrigues', '(47) 9 8906-0920', NULL, '(47) 9271-0433', 'rodrigues.construindo@gmail.com', 1),
(5, 5, 'Marcelo Tarachuk', '(49) 9 9114-2641', NULL, '(49) 9114-2641', 'marcelo.tarachuk@hotmail.com', 1),
(7, 6, 'Ana Lúcia', '(68) 3223-8473', '(68) 9 8122-3399', '(68) 8122-3399', 'riorep@uol.com.br', 1),
(8, 7, 'Agley', '(92) 9 8138-0617', NULL, '(92) 8138-0617', 'bastos.rep@hotmail.com', 1),
(9, 8, 'Alexandre', '(71) 9 9182-0393', NULL, '(71) 9182-0393', 'coberturarep@gmail.com', 1),
(10, 9, 'Marinho', '(47) 99188-9988', NULL, '(47) 9188-9988', 'vendas@mmcrep.com.br', 1),
(11, 10, 'JoséIsmar', '(85) 3267-5957', '(85) 9 9126-6000', '(85) 9126-6000', 'ismaroliveira@outlook.com', 1),
(12, 11, 'Rodrigo', '(62) 3232-0600', '(62) 98158-1881', '(62) 8158-1881', 'rodrigo@centrosulportasejanelas.com.br', 1),
(13, 12, 'Carlos', '(51) 9 8126-2224', NULL, '(51) 8126-2224', 'pinholeipelt@gmail.com', 1),
(14, 13, 'Simone Picolli', '(54) 3211-9933', '(54) 9 9927-8076', '(54) 9927-8076', 'atrium.caxias@cipnet.com.br', 1),
(15, 14, 'Marcelo Tarachuk', '(49) 9 9114-2641', NULL, '(49) 9114-2641', 'marcelo.tarachuk@hotmail.com', 1),
(16, 15, 'Pasqualini', '(54) 2102-1114', '(54) 9 9936-6748', '(54) 9936-6748', 'pasqualini@brazilianpine.com', 1),
(18, 17, 'Alexandre', '(43) 3511-2306', '(43) 9 9671-9801', '(43) 9671-9801', 'alexandre.ferreira@sincol.com.br', 1),
(19, 18, 'Claiton', '(41) 3223-8444', '(41) 9 9979-0513', '(41) 9979-0513', 'mv.repres@hotmail.com', 1),
(20, 19, 'Jean', '(46) 9 9975-0578', NULL, '(46) 9975-0578', 'jean@aguero.com.br', 1),
(21, 20, 'Daniel', '(43) 3328-3545', '(43) 9 9917-9214', '(43) 9917-9214', 'shop@sercomtel.com.br', 1),
(22, 21, 'Cláudia', '(43) 3337-5353', '(43) 9 9132-5131', '(43) 9132-5131', 'ca7representacoes@gmail.com', 1),
(24, 23, 'Antonio Balvedi (Toninho)', '(11) 2308-6096', '(11) 9 9393-8675', '(11) 9393-8675', 'toninho.sincol@yahoo.com.br', 1),
(26, 25, 'Marco Gimenez', '(11) 5011-3888', '(11) 9470-6410', '(11) 99470-6410', 'marcosincol@yahoo.com.br', 1),
(28, 1, 'Fernando', '(49) 9 8813-3609', NULL, '(49) 8813-3609', 'comercial@frepresentacoes.com', 1),
(29, 12, 'Susi', '(51) 9 8137-0810', NULL, '(51) 8137-0810', 'pinholeipelt@gmail.com', 1),
(32, 18, 'Bruno', '(41) 3029-3944', '(41) 9 9998-7826', '(41) 9998-7826', 'mv.repres@hotmail.com', 1),
(33, 32, 'Paulo Oliveira', '(11) 2338-8782', '(11) 9 9470-3734', '(11) 9470-3734', 'paulo.sincolsp@yahoo.com', 1),
(35, 34, 'Eduardo Sartori', '(19) 3268-2000', '(19) 9 9773-2992', '(19) 99773-2992', 'eduardosincol@terra.com.br', 1),
(36, 35, 'Tuna', '(13) 3235-7311', '(13) 9 9788-1618', '(13) 9788-1618', 'tuna@tuna.com.br', 1),
(37, 36, 'Valmir Gimenes', '(11) 5594-1087', '(11) 9 9470-4264', '(11) 9470-4264', 'valmirgimenes@terra.com.br', 1),
(38, 37, 'Paulo Enz', '(16) 3976-4027', '(16) 99102-9000', '(16) 9 9102-9000', 'paulo.sincol@terra.com.br', 1),
(39, 38, 'Paulo Paiva', '(43) 3525-0481', '(43) 9 8419-8100', '(43) 8419-8100', 'pspaiva.sincol@hotmail.com', 1),
(41, 41, 'Thiago', '(17) 9 9168-8345', '(17) 9 9698-9533', '(17) 9168-8345', 'benedeti.representacoes@gmail.com', 1),
(42, 42, 'Edson Zampieri', '(11) 9 9453-9437', NULL, '(11) 9453-9437', 'edsonflora01@gmail.com', 1),
(43, 40, 'Beto', '(27) 3243-6333', '(27) 9 9981-7023', '(27) 9981-7023', 'jgbuzatto@terra.com.br', 1),
(44, 43, 'Felipe', '(12) 9 9645-8962', NULL, '(12) 9 9645-8962', 'felipeazevedobitt@gmail.com', 1),
(45, 44, 'Planalto Representações Ltda', '(98) 3011-6592', '(98) 98125-9912', '(98) 8125-9912', 'prl@elointernet.com.br', 1),
(46, 45, 'Stank Representações Ltda.', '(67) 3326-2171', '(67) 9 9981-1006', '(67) 9981-1006', 'stanke@stanke.com.br', 1),
(47, 46, 'Roni', '(65) 3684-9466', '(65) 99973-5556', '(65) 9973-5556', 'gadler.representa@hotmail.com', 1),
(48, 47, 'Murillo', '(34) 3315-4588', '(34) 9 9118-9467', '(34) 9118-9467', 'ms.repservicos@gmail.com', 1),
(49, 48, 'Léo', '(35) 9 9963-0311', NULL, '(35) 9963-0311', 'leo@decasarepresentacoes.com.br', 1),
(50, 48, 'Pedro', '(35) 99867-0313', NULL, '(35) 9867-0313', 'marketing@decasarepresentacoes.com.br', 1),
(51, 49, 'Junior', '(31) 3466-0831', '(31) 99296-3181', '(31) 9296-3181', 'junior.recoma@gmail.com', 1),
(52, 11, 'Gustavo', '(62) 3232-0600', '(62) 98131-3311', '(62) 8131-3311', 'gustavo@centrosulportasejanelas.com.br', 1),
(53, 11, 'José Cesar', '(62) 3232-0600', '(62) 98115-3472', '(62) 8115-3472', 'josecesar@centrosulportasejanelas.com.br', 1),
(56, 50, 'Francisco', '(43) 9 8402-4003', NULL, '(43) 8402-4003', 'francisco.ponte@fcponte.com.br', 1),
(58, 51, 'Allan', '(83) 3224-2351', '(83) 99948-7722', '(83) 9948-7722', 'jatlasjp@hotmail.com', 1),
(59, 51, 'Walter', '(83) 3224-2351', '(83) 9 9971-8613', '(83) 9971-8613', 'waltercarvalho0967@gmail.com', 1),
(60, 52, 'José Heleno', '(81) 3267-7732', '(81) 99234-2223', '(81) 9234-2223', 'jose.heleno@jhsservicos.com.br', 1),
(64, 55, 'Carlos Eduardo', '(84) 9402-9403', NULL, '(84) 9402-9403', 'atriumrep@bol.com.br', 1),
(65, 56, 'Rogério', '(69) 3221-2193', '(69) 99961-3075', '(69) 9961-3075', 'rogeriopactual@uol.com.br', 1),
(69, 58, 'Clari', '(63) 3215-2260', '(63) 99978-3374', '(63) 9978-3374', 'hanauer-to@hotmail.com', 1),
(70, 59, 'Fernando Barnabé', '(11) 98501-0094', NULL, '(11) 8501-0094', 'fernando.barnabe@uol.com.br', 1),
(71, 11, 'Regina', '(62) 3232-0600', '(62) 98126-9906', '(62) 8126-9906', 'regina@centrosulportasejanelas.com.br', 1),
(72, 60, 'Herick Moura', '(21) 9 7006-0117', NULL, '(21) 7006-0117', 'vendas@rbrosco.com.br', 1),
(73, 60, 'Roberto Brosco', '(21) 9 9374-4484', NULL, '(21) 9374-4484', 'vendas@rbrosco.com.br', 1),
(74, 61, 'Chico', '(21) 3387-9999', '(21) 97021-6225', '(21) 7021-6225', 'francisconeto@fsilvareis.com.br', 1),
(75, 61, 'Neto', '(21) 3387-9980', '(21) 99982-0177', '(21) 9982-0177', 'francisconeto@fsilvareis.com.br', 1),
(76, 19, 'Leonardo', '(41) 9 9984-0071', NULL, '(41) 9984-0071', 'leonardo@aguero.com.br', 1),
(77, 52, 'Gustavo', '(81) 3267-7732', '(81) 9 9117-7580', '(81) 9117-7580', 'gustavo.oliveira@jhsservicos.com.br', 1),
(78, 62, 'Junior Arenã', '(82) 99186-0122', NULL, '(82) 9186-0122', 'arenajra2@hotmail.com', 1),
(81, 64, 'Rodrigo', '(62) 3232-0600', NULL, '(62) 8158-1881', 'rodrigo@centrosulportasejanelas.com.br', 1),
(82, 64, 'Gustavo', '(62) 3232-0600', NULL, '(62) 8131-3311', 'gustavo@centrosulportasejanelas.com.br', 1),
(83, 64, 'José Cesar', '(62) 3232-0600', NULL, '(62) 8115-3472', 'josecesar@centrosulportasejanelas.com.br', 1),
(84, 64, 'Regina', '(62) 3232-0600', NULL, '(62) 8126-9906', 'regina@centrosulportasejanelas.com.br', 1),
(85, 65, 'Atendimento - Telefonista', '(49) 3561-5000', NULL, NULL, 'sincol@sincol.com.br', 1),
(86, 65, 'Vanessa - Atendimento Loja/Matriz Caçador', '(49) 3561-5039', '(49) 9 9841-0026', '(49) 9841-0026', 'vanessa@sincol.com.br', 1),
(87, 65, 'Jucelina - Atendimento Loja/Matriz Caçador', '(49) 3561-5021', '(11) 9101-5352', '11 99101-5352', 'jucelina@sincol.com.br', 1),
(88, 66, 'Marcelo Tarachuk', '(49) 9 9114-2641', NULL, '(49) 9114-2641', 'marcelo.tarachuk@hotmail.com', 1),
(89, 17, 'Fábio', '(43) 3511-2307', '(43) 9 9153-7899', '(43) 9 9153-7899', 'fabio.lucindo@sincol.com.br', 1),
(92, 67, 'Wellington', '(85) 98877-8666', NULL, '(85) 98877-8666', 'aguiarrepresentacoes@gmail.com', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `representante_regiao`
--

CREATE TABLE `representante_regiao` (
  `rpr_id` int(11) NOT NULL,
  `rpr_titulo` varchar(256) CHARACTER SET latin1 DEFAULT NULL,
  `rpr_regiao` varchar(256) CHARACTER SET latin1 DEFAULT NULL,
  `est_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `representante_regiao`
--

INSERT INTO `representante_regiao` (`rpr_id`, `rpr_titulo`, `rpr_regiao`, `est_id`) VALUES
(1, 'FRE Representações Ltda.', 'Chapecó e Região', 24),
(2, 'Jadna Saturno Representações', 'Criciúma, Tubarão, Torres e Região', 24),
(3, 'Lopes Empreendimentos Imobiliários Ltda.', 'Grande Florianópolis e Região', 24),
(4, 'Joinlog Representações LTDA', 'Joinville, Jaraguá do Sul e região', 24),
(5, 'Tarachuk Representações', 'Joaçaba e região', 24),
(6, 'Rio Representações Ltda', 'Rio Branco e região', 1),
(7, 'Bastos Representações de Materiais de Construção - EIRELLI - ME', 'Manaus e região', 3),
(8, 'Cobertura Representações', 'Salvador, Feira de Santana e Região', 5),
(9, 'M.M.C. Representação Comercial LTDA', 'Construtoras - Balneário Camboriú, Camboriú, Itapema, Meia Praia, Bombinhas, Brusque, Itajaí, Navegantes', 24),
(10, 'Frota Chaves Representações Ltda.', 'Fortaleza e Região', 6),
(11, 'Centro Sul Representações LTDA', 'Brasília', 7),
(12, 'Pinho Representações Ltda.', 'Grande Porto Alegre', 23),
(13, 'Atrium Com. e Repres. Ltda.', 'Caxias do Sul e Região', 23),
(14, 'Tarachuk Representações', 'Passo Fundo e Região, Santa Matia, Bento Gonçalves, Porto Alegre e demais cidades do interior do Rio Grande do Sul', 23),
(15, 'Pinus do Brasil Representações - Venda de painéis e revestimentos de madeira para parede', 'Bento Gonçalves', 23),
(17, 'Filial Jacarezinho - Show Room', 'Jacarezinho e Região - Filial Sincol', 18),
(18, 'MV Representações Ltda.', 'Curitiba e Ponta Grossa', 18),
(19, 'Aguero Representações Ltda.', 'Franciso Beltrão, Cascavel e Região', 18),
(20, 'Daniel\'s Representações - Atendimento às Construtoras', 'Londrina', 18),
(21, 'CA7 Representações - Atendimento às Construtoras', 'Maringá e Região', 18),
(23, 'A. P. Balvedi Repres. Ltda.', 'São Paulo e Grande São Paulo', 26),
(25, 'Mad Gimenez Assessoria Comercial Ltda. ME', 'São Paulo e Grande São Paulo', 26),
(32, 'Olido Assessoria Comercial Ltda. ME', 'São Paulo e Grande São Paulo - Atendimento às Construtoras', 26),
(34, 'Sartori Artefatos de Madeiras', 'Itú, Sorocaba, Campinas e Região', 26),
(35, 'Tuna Comércio e Representações', 'Santos e Litoral Norte e Sul', 26),
(36, 'Valmir Gimenes Assessoria Comercial', 'São Paulo e Grande São Paulo - Atendimento às Construtoras', 26),
(37, 'Enz Representações Ltda.', 'Ribeirão Preto, Limeira, Piracicaba e região', 26),
(38, 'PS Paiva Representações', 'Marília, Bauru e Presidente Prudente', 26),
(39, 'Ferraz Desenvolvimento de Negócios - FDN', 'São Paulo e Grande São Paulo - Atendimento às Construtoras', 26),
(40, 'JG Buzatto Representações', 'Vitória, Serra e Região', 8),
(41, 'Benedeti e Martoni Ltda.', 'São José do Rio Preto e região', 26),
(42, 'Edson Zampieri Representações', 'São Paulo', 26),
(43, 'Felipe Azevedo Bittencourt', 'Cachoeira Paulista', 26),
(44, 'Planalto Representações Ltda', 'São Luís', 10),
(45, 'Stank Representações Ltda.', 'Campo Grande', 12),
(46, 'Gadler Representações Ltda', 'Cuiabá', 13),
(47, 'M.S. Representações e Serviços Ltda', 'Uberaba, Uberlândia e região', 11),
(48, 'Decasa Representações', 'Sul de Minas e Zona da Mata', 11),
(49, 'Recoma Representações', 'Belo Horizonte, Norte de Minas e Vale do Aço', 11),
(50, 'FC Ponte Representações Comerciais Ltda', 'Belém', 14),
(51, 'J A Representações Ltda -180', 'João Pessoa, Campina Grande e Região', 15),
(52, 'JHS Serviços e Representações Ltda', 'Recife', 16),
(53, 'Show Room Filial Jacarezinho', 'Teresina', 17),
(55, 'Atrium Representações', 'Natal e Região', 20),
(56, 'Pactual Representações Ltda', 'Rogério', 21),
(58, 'Hanauer e Hanauer Ltda', 'Palmas', 27),
(59, 'Barnabé & Cavalcanti Representações', 'São Paulo e região metropolitana', 26),
(60, 'CR Plus Representações e Serviços Ltda.', 'Atendimento às Construtoras - Rio de Janeiro', 19),
(61, 'F. Silva Reis Representações Ltda.', 'Atendimento às Revendas - Rio de Janeiro', 19),
(62, 'Jr. Oliveira Representações LTDA.', 'Macéio e Região', 2),
(64, 'Centro Sul Representações Ltda.', 'Goiânia', 9),
(65, 'Caçador - Matriz da Sincol', 'Caçador - Matriz da Sincol', 24),
(66, 'Tarachuk Representações', 'Grande Porto Alegre', 23),
(67, 'Costa Comércio Ltda – 203', 'Teresina', 17);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `usr_id` bigint(20) NOT NULL,
  `usr_email` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `usr_senha` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `usr_nome` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `usr_nivel` enum('admin','normal') CHARACTER SET latin1 NOT NULL,
  `usr_token` varchar(256) CHARACTER SET latin1 NOT NULL,
  `usr_status` tinyint(1) DEFAULT 1,
  `usr_dt_ins` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`usr_id`, `usr_email`, `usr_senha`, `usr_nome`, `usr_nivel`, `usr_token`, `usr_status`, `usr_dt_ins`) VALUES
(1, 'david@drcriativo.com.br', '6eec0ed7ebfbe94555e0ead588d88436', 'David Weingartner', 'admin', '', 1, '2021-01-18 08:28:27'),
(20, 'lucas@sincol.com.br', '63981416c424626441083905d2fcde81', 'Lucas Machado', 'admin', '3373a3d46762ea5fb8062e410b4e850d', 1, '2021-03-04 11:18:59'),
(21, 'pamela@sincol.com.br', '9870c525bb178d9e001dd0b3a8afef80', 'Pamela de Camargo', 'normal', 'c43c35efbd911ae01c5b11621a48cb45', 1, '2021-03-04 11:19:52');

-- --------------------------------------------------------

--
-- Estrutura da tabela `vagas`
--

CREATE TABLE `vagas` (
  `vag_id` int(11) NOT NULL,
  `vag_titulo` varchar(256) CHARACTER SET latin1 DEFAULT NULL,
  `vag_descricao` text CHARACTER SET latin1 DEFAULT NULL,
  `vag_status` tinyint(1) DEFAULT 1,
  `vag_img` varchar(255) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `vagas`
--

INSERT INTO `vagas` (`vag_id`, `vag_titulo`, `vag_descricao`, `vag_status`, `vag_img`) VALUES
(1, 'AUXILIAR DE SERVIÇOS GERAIS I', NULL, 0, NULL),
(2, 'AUXILIAR DE SERVIÇOS GERAIS II', NULL, 0, NULL);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `arquivos_quemsomos`
--
ALTER TABLE `arquivos_quemsomos`
  ADD PRIMARY KEY (`arq_id`),
  ADD KEY `qsm_id` (`qsm_id`);

--
-- Índices para tabela `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`ban_id`);

--
-- Índices para tabela `carrossel`
--
ALTER TABLE `carrossel`
  ADD PRIMARY KEY (`car_id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Índices para tabela `carrossel_categoria`
--
ALTER TABLE `carrossel_categoria`
  ADD PRIMARY KEY (`cat_id`);

--
-- Índices para tabela `cidade`
--
ALTER TABLE `cidade`
  ADD PRIMARY KEY (`cid_id`),
  ADD KEY `FK_ESTADO` (`est_id`);

--
-- Índices para tabela `contato`
--
ALTER TABLE `contato`
  ADD PRIMARY KEY (`con_id`);

--
-- Índices para tabela `depoimentos`
--
ALTER TABLE `depoimentos`
  ADD PRIMARY KEY (`dep_id`);

--
-- Índices para tabela `documento`
--
ALTER TABLE `documento`
  ADD PRIMARY KEY (`doc_id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Índices para tabela `doc_categoria`
--
ALTER TABLE `doc_categoria`
  ADD PRIMARY KEY (`cat_id`);

--
-- Índices para tabela `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`est_id`);

--
-- Índices para tabela `fotos_portifolio`
--
ALTER TABLE `fotos_portifolio`
  ADD PRIMARY KEY (`fot_id`),
  ADD KEY `prt_id` (`prt_id`);

--
-- Índices para tabela `fotos_produto`
--
ALTER TABLE `fotos_produto`
  ADD PRIMARY KEY (`fot_id`),
  ADD KEY `prd_id` (`prd_id`);

--
-- Índices para tabela `laminas_produto`
--
ALTER TABLE `laminas_produto`
  ADD PRIMARY KEY (`lam_id`),
  ADD KEY `prd_id` (`prd_id`);

--
-- Índices para tabela `linha_tempo`
--
ALTER TABLE `linha_tempo`
  ADD PRIMARY KEY (`lnh_id`);

--
-- Índices para tabela `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`mnu_id`);

--
-- Índices para tabela `menu_usuario`
--
ALTER TABLE `menu_usuario`
  ADD KEY `menu_id` (`mnu_id`),
  ADD KEY `usr_id` (`usr_id`);

--
-- Índices para tabela `noticia`
--
ALTER TABLE `noticia`
  ADD PRIMARY KEY (`not_id`),
  ADD KEY `not_datahora` (`not_datahora`),
  ADD KEY `fk_noticia_usuario` (`usr_id`);

--
-- Índices para tabela `noticia_midia`
--
ALTER TABLE `noticia_midia`
  ADD PRIMARY KEY (`nmi_id`),
  ADD KEY `not_id` (`not_id`);

--
-- Índices para tabela `parceiro`
--
ALTER TABLE `parceiro`
  ADD PRIMARY KEY (`prc_id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Índices para tabela `parceiro_categoria`
--
ALTER TABLE `parceiro_categoria`
  ADD PRIMARY KEY (`cat_id`);

--
-- Índices para tabela `portifolio`
--
ALTER TABLE `portifolio`
  ADD PRIMARY KEY (`prt_id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Índices para tabela `portifolio_categoria`
--
ALTER TABLE `portifolio_categoria`
  ADD PRIMARY KEY (`cat_id`);

--
-- Índices para tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`prd_id`),
  ADD KEY `cat_id` (`cat_id`),
  ADD KEY `FK_PRODUTO_TIPO` (`tpr_id`);

--
-- Índices para tabela `produtos_relacionados`
--
ALTER TABLE `produtos_relacionados`
  ADD KEY `prd_relaciona` (`prd_relaciona`),
  ADD KEY `prd_relacionado` (`prd_relacionado`);

--
-- Índices para tabela `produto_categoria`
--
ALTER TABLE `produto_categoria`
  ADD PRIMARY KEY (`cat_id`);

--
-- Índices para tabela `produto_tipo`
--
ALTER TABLE `produto_tipo`
  ADD PRIMARY KEY (`tpr_id`);

--
-- Índices para tabela `quemsomos`
--
ALTER TABLE `quemsomos`
  ADD PRIMARY KEY (`qsm_id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Índices para tabela `quemsomos_categoria`
--
ALTER TABLE `quemsomos_categoria`
  ADD PRIMARY KEY (`cat_id`);

--
-- Índices para tabela `representante`
--
ALTER TABLE `representante`
  ADD PRIMARY KEY (`rep_id`),
  ADD KEY `rpr_id` (`rpr_id`);

--
-- Índices para tabela `representante_regiao`
--
ALTER TABLE `representante_regiao`
  ADD PRIMARY KEY (`rpr_id`),
  ADD KEY `est_id` (`est_id`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`usr_id`),
  ADD UNIQUE KEY `usr_idPrimária` (`usr_id`);

--
-- Índices para tabela `vagas`
--
ALTER TABLE `vagas`
  ADD PRIMARY KEY (`vag_id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `arquivos_quemsomos`
--
ALTER TABLE `arquivos_quemsomos`
  MODIFY `arq_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=207;

--
-- AUTO_INCREMENT de tabela `banner`
--
ALTER TABLE `banner`
  MODIFY `ban_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `carrossel`
--
ALTER TABLE `carrossel`
  MODIFY `car_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `carrossel_categoria`
--
ALTER TABLE `carrossel_categoria`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `cidade`
--
ALTER TABLE `cidade`
  MODIFY `cid_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5566;

--
-- AUTO_INCREMENT de tabela `contato`
--
ALTER TABLE `contato`
  MODIFY `con_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `depoimentos`
--
ALTER TABLE `depoimentos`
  MODIFY `dep_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `documento`
--
ALTER TABLE `documento`
  MODIFY `doc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `doc_categoria`
--
ALTER TABLE `doc_categoria`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `estado`
--
ALTER TABLE `estado`
  MODIFY `est_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de tabela `fotos_portifolio`
--
ALTER TABLE `fotos_portifolio`
  MODIFY `fot_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `fotos_produto`
--
ALTER TABLE `fotos_produto`
  MODIFY `fot_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=283;

--
-- AUTO_INCREMENT de tabela `laminas_produto`
--
ALTER TABLE `laminas_produto`
  MODIFY `lam_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de tabela `linha_tempo`
--
ALTER TABLE `linha_tempo`
  MODIFY `lnh_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `menu`
--
ALTER TABLE `menu`
  MODIFY `mnu_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de tabela `noticia`
--
ALTER TABLE `noticia`
  MODIFY `not_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `noticia_midia`
--
ALTER TABLE `noticia_midia`
  MODIFY `nmi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de tabela `parceiro`
--
ALTER TABLE `parceiro`
  MODIFY `prc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `parceiro_categoria`
--
ALTER TABLE `parceiro_categoria`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `portifolio`
--
ALTER TABLE `portifolio`
  MODIFY `prt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `portifolio_categoria`
--
ALTER TABLE `portifolio_categoria`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `prd_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT de tabela `produto_categoria`
--
ALTER TABLE `produto_categoria`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de tabela `produto_tipo`
--
ALTER TABLE `produto_tipo`
  MODIFY `tpr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `quemsomos`
--
ALTER TABLE `quemsomos`
  MODIFY `qsm_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de tabela `quemsomos_categoria`
--
ALTER TABLE `quemsomos_categoria`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `representante`
--
ALTER TABLE `representante`
  MODIFY `rep_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT de tabela `representante_regiao`
--
ALTER TABLE `representante_regiao`
  MODIFY `rpr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `usr_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de tabela `vagas`
--
ALTER TABLE `vagas`
  MODIFY `vag_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `arquivos_quemsomos`
--
ALTER TABLE `arquivos_quemsomos`
  ADD CONSTRAINT `arquivos_quemsomos_ibfk_1` FOREIGN KEY (`qsm_id`) REFERENCES `quemsomos` (`qsm_id`);

--
-- Limitadores para a tabela `carrossel`
--
ALTER TABLE `carrossel`
  ADD CONSTRAINT `carrossel_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `carrossel_categoria` (`cat_id`);

--
-- Limitadores para a tabela `cidade`
--
ALTER TABLE `cidade`
  ADD CONSTRAINT `FK_ESTADO` FOREIGN KEY (`est_id`) REFERENCES `estado` (`est_id`);

--
-- Limitadores para a tabela `documento`
--
ALTER TABLE `documento`
  ADD CONSTRAINT `documento_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `doc_categoria` (`cat_id`);

--
-- Limitadores para a tabela `fotos_portifolio`
--
ALTER TABLE `fotos_portifolio`
  ADD CONSTRAINT `fotos_portifolio_ibfk_1` FOREIGN KEY (`prt_id`) REFERENCES `portifolio` (`prt_id`);

--
-- Limitadores para a tabela `fotos_produto`
--
ALTER TABLE `fotos_produto`
  ADD CONSTRAINT `fotos_produto_ibfk_1` FOREIGN KEY (`prd_id`) REFERENCES `produto` (`prd_id`);

--
-- Limitadores para a tabela `laminas_produto`
--
ALTER TABLE `laminas_produto`
  ADD CONSTRAINT `laminas_produto_ibfk_1` FOREIGN KEY (`prd_id`) REFERENCES `produto` (`prd_id`);

--
-- Limitadores para a tabela `menu_usuario`
--
ALTER TABLE `menu_usuario`
  ADD CONSTRAINT `menu_usuario_ibfk_1` FOREIGN KEY (`mnu_id`) REFERENCES `menu` (`mnu_id`),
  ADD CONSTRAINT `menu_usuario_ibfk_2` FOREIGN KEY (`usr_id`) REFERENCES `usuario` (`usr_id`);

--
-- Limitadores para a tabela `noticia`
--
ALTER TABLE `noticia`
  ADD CONSTRAINT `fk_noticia_usuario` FOREIGN KEY (`usr_id`) REFERENCES `usuario` (`usr_id`);

--
-- Limitadores para a tabela `noticia_midia`
--
ALTER TABLE `noticia_midia`
  ADD CONSTRAINT `noticia_midia_ibfk_1` FOREIGN KEY (`not_id`) REFERENCES `noticia` (`not_id`);

--
-- Limitadores para a tabela `parceiro`
--
ALTER TABLE `parceiro`
  ADD CONSTRAINT `parceiro_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `parceiro_categoria` (`cat_id`);

--
-- Limitadores para a tabela `portifolio`
--
ALTER TABLE `portifolio`
  ADD CONSTRAINT `portifolio_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `portifolio_categoria` (`cat_id`);

--
-- Limitadores para a tabela `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `FK_PRODUTO_TIPO` FOREIGN KEY (`tpr_id`) REFERENCES `produto_tipo` (`tpr_id`),
  ADD CONSTRAINT `produto_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `produto_categoria` (`cat_id`);

--
-- Limitadores para a tabela `produtos_relacionados`
--
ALTER TABLE `produtos_relacionados`
  ADD CONSTRAINT `produtos_relacionados_ibfk_1` FOREIGN KEY (`prd_relaciona`) REFERENCES `produto` (`prd_id`),
  ADD CONSTRAINT `produtos_relacionados_ibfk_2` FOREIGN KEY (`prd_relacionado`) REFERENCES `produto` (`prd_id`);

--
-- Limitadores para a tabela `quemsomos`
--
ALTER TABLE `quemsomos`
  ADD CONSTRAINT `quemsomos_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `quemsomos_categoria` (`cat_id`);

--
-- Limitadores para a tabela `representante`
--
ALTER TABLE `representante`
  ADD CONSTRAINT `representante_ibfk_2` FOREIGN KEY (`rpr_id`) REFERENCES `representante_regiao` (`rpr_id`);

--
-- Limitadores para a tabela `representante_regiao`
--
ALTER TABLE `representante_regiao`
  ADD CONSTRAINT `representante_regiao_ibfk_1` FOREIGN KEY (`est_id`) REFERENCES `estado` (`est_id`);
--
-- Banco de dados: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Banco de dados: `teste-gc`
--
CREATE DATABASE IF NOT EXISTS `teste-gc` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `teste-gc`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `employees`
--

CREATE TABLE `employees` (
  `employeeNumber` int(11) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `extension` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `officeCode` varchar(10) NOT NULL,
  `file_url` varchar(250) CHARACTER SET utf8 NOT NULL,
  `jobTitle` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `employees`
--

INSERT INTO `employees` (`employeeNumber`, `lastName`, `firstName`, `extension`, `email`, `officeCode`, `file_url`, `jobTitle`) VALUES
(1002, 'Murphy', 'Diane', 'x5800', 'dmurphy@classicmodelcars.com', '1', '', 'President'),
(1056, 'Patterson', 'Mary', 'x4611', 'mpatterso@classicmodelcars.com', '1', '', 'VP Sales'),
(1076, 'Firrelli', 'Jeff', 'x9273', 'jfirrelli@classicmodelcars.com', '1', '', 'VP Marketing'),
(1088, 'Patterson', 'William', 'x4871', 'wpatterson@classicmodelcars.com', '6', '', 'Sales Manager (APAC)'),
(1102, 'Bondur', 'Gerard', 'x5408', 'gbondur@classicmodelcars.com', '4', 'pdftest.pdf', 'Sale Manager (EMEA)'),
(1143, 'Bow', 'Anthony', 'x5428', 'abow@classicmodelcars.com', '1', '', 'Sales Manager (NA)'),
(1165, 'Jennings', 'Leslie', 'x3291', 'ljennings@classicmodelcars.com', '1', '', 'Sales Rep'),
(1166, 'Thompson', 'Leslie', 'x4065', 'lthompson@classicmodelcars.com', '1', '', 'Sales Rep'),
(1188, 'Firrelli', 'Julie', 'x2173', 'jfirrelli@classicmodelcars.com', '2', 'test-2.pdf', 'Sales Rep'),
(1216, 'Patterson', 'Steve', 'x4334', 'spatterson@classicmodelcars.com', '2', '', 'Sales Rep'),
(1286, 'Tseng', 'Foon Yue', 'x2248', 'ftseng@classicmodelcars.com', '3', '', 'Sales Rep'),
(1323, 'Vanauf', 'George', 'x4102', 'gvanauf@classicmodelcars.com', '3', '', 'Sales Rep'),
(1337, 'Bondur', 'Loui', 'x6493', 'lbondur@classicmodelcars.com', '4', '', 'Sales Rep'),
(1370, 'Hernandez', 'Gerard', 'x2028', 'ghernande@classicmodelcars.com', '4', '', 'Sales Rep'),
(1401, 'Castillo', 'Pamela', 'x2759', 'pcastillo@classicmodelcars.com', '4', '', 'Sales Rep'),
(1501, 'Bott', 'Larry', 'x2311', 'lbott@classicmodelcars.com', '7', '', 'Sales Rep'),
(1504, 'Jones', 'Barry', 'x102', 'bjones@classicmodelcars.com', '7', '', 'Sales Rep'),
(1611, 'Fixter', 'Andy', 'x101', 'afixter@classicmodelcars.com', '6', '', 'Sales Rep'),
(1612, 'Marsh', 'Peter', 'x102', 'pmarsh@classicmodelcars.com', '6', '', 'Sales Rep'),
(1619, 'King', 'Tom', 'x103', 'tking@classicmodelcars.com', '6', '', 'Sales Rep'),
(1621, 'Nishi', 'Mami', 'x101', 'mnishi@classicmodelcars.com', '5', '', 'Sales Rep'),
(1625, 'Kato', 'Yoshimi', 'x102', 'ykato@classicmodelcars.com', '5', '', 'Sales Rep'),
(1702, 'Gerard', 'Martin', 'x2312', 'mgerard@classicmodelcars.com', '4', '', 'Sales Rep');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employeeNumber`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `employees`
--
ALTER TABLE `employees`
  MODIFY `employeeNumber` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1703;
--
-- Banco de dados: `testegrocery`
--
CREATE DATABASE IF NOT EXISTS `testegrocery` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `testegrocery`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `employees`
--

CREATE TABLE `employees` (
  `employeeNumber` int(11) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `extension` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `officeCode` varchar(10) NOT NULL,
  `file_url` varchar(250) CHARACTER SET utf8 NOT NULL,
  `jobTitle` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `employees`
--

INSERT INTO `employees` (`employeeNumber`, `lastName`, `firstName`, `extension`, `email`, `officeCode`, `file_url`, `jobTitle`) VALUES
(1002, 'Murphy', 'Diane', 'x5800', 'dmurphy@classicmodelcars.com', '1', '', 'President'),
(1056, 'Patterson', 'Mary', 'x4611', 'mpatterso@classicmodelcars.com', '1', '', 'VP Sales'),
(1076, 'Firrelli', 'Jeff', 'x9273', 'jfirrelli@classicmodelcars.com', '1', '', 'VP Marketing'),
(1088, 'Patterson', 'William', 'x4871', 'wpatterson@classicmodelcars.com', '6', '', 'Sales Manager (APAC)'),
(1102, 'Bondur', 'Gerard', 'x5408', 'gbondur@classicmodelcars.com', '4', 'pdftest.pdf', 'Sale Manager (EMEA)'),
(1143, 'Bow', 'Anthony', 'x5428', 'abow@classicmodelcars.com', '1', '', 'Sales Manager (NA)'),
(1165, 'Jennings', 'Leslie', 'x3291', 'ljennings@classicmodelcars.com', '1', '', 'Sales Rep'),
(1166, 'Thompson', 'Leslie', 'x4065', 'lthompson@classicmodelcars.com', '1', '', 'Sales Rep'),
(1188, 'Firrelli', 'Julie', 'x2173', 'jfirrelli@classicmodelcars.com', '2', 'test-2.pdf', 'Sales Rep'),
(1216, 'Patterson', 'Steve', 'x4334', 'spatterson@classicmodelcars.com', '2', '', 'Sales Rep'),
(1286, 'Tseng', 'Foon Yue', 'x2248', 'ftseng@classicmodelcars.com', '3', '', 'Sales Rep'),
(1323, 'Vanauf', 'George', 'x4102', 'gvanauf@classicmodelcars.com', '3', '', 'Sales Rep'),
(1337, 'Bondur', 'Loui', 'x6493', 'lbondur@classicmodelcars.com', '4', '', 'Sales Rep'),
(1370, 'Hernandez', 'Gerard', 'x2028', 'ghernande@classicmodelcars.com', '4', '', 'Sales Rep'),
(1401, 'Castillo', 'Pamela', 'x2759', 'pcastillo@classicmodelcars.com', '4', '', 'Sales Rep'),
(1501, 'Bott', 'Larry', 'x2311', 'lbott@classicmodelcars.com', '7', '', 'Sales Rep'),
(1504, 'Jones', 'Barry', 'x102', 'bjones@classicmodelcars.com', '7', '', 'Sales Rep'),
(1611, 'Fixter', 'Andy', 'x101', 'afixter@classicmodelcars.com', '6', '', 'Sales Rep'),
(1612, 'Marsh', 'Peter', 'x102', 'pmarsh@classicmodelcars.com', '6', '', 'Sales Rep'),
(1619, 'King', 'Tom', 'x103', 'tking@classicmodelcars.com', '6', '', 'Sales Rep'),
(1621, 'Nishi', 'Mami', 'x101', 'mnishi@classicmodelcars.com', '5', '', 'Sales Rep'),
(1625, 'Kato', 'Yoshimi', 'x102', 'ykato@classicmodelcars.com', '5', '', 'Sales Rep'),
(1702, 'Gerard', 'Martin', 'x2312', 'mgerard@classicmodelcars.com', '4', '', 'Sales Rep');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employeeNumber`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `employees`
--
ALTER TABLE `employees`
  MODIFY `employeeNumber` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1703;
--
-- Banco de dados: `universidade`
--
CREATE DATABASE IF NOT EXISTS `universidade` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `universidade`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `alunos`
--

CREATE TABLE `alunos` (
  `mat` int(11) NOT NULL,
  `nome` varchar(150) DEFAULT NULL,
  `endereco` varchar(256) DEFAULT NULL,
  `cidade` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `alunos`
--

INSERT INTO `alunos` (`mat`, `nome`, `endereco`, `cidade`) VALUES
(2015010101, 'JOSE DE ALENCAR', 'RUA DAS ALMAS', 'NATAL'),
(2015010102, 'JOÃO JOSÉ', 'JOSÉ, AVENIDA RUY CARNEIRO', 'JOÃO PESSOA'),
(2015010103, 'MARIA JOAQUINA', 'RUA CARROSSEL', 'RECIFE'),
(2015010104, 'MARIA DAS DORES', 'RUA DAS LADEIRAS', 'FORTALEZA'),
(2015010105, 'JOSUÉ CLAUDINO DOS SANTOS', 'CENTRO', 'NATAL'),
(2015010106, 'JOSUÉLISSON CLAUDINO DOS SANTOS', 'CENTRO', 'NATAL');

-- --------------------------------------------------------

--
-- Estrutura da tabela `disciplinas`
--

CREATE TABLE `disciplinas` (
  `cod_disc` varchar(4) NOT NULL,
  `nome_disc` varchar(128) DEFAULT NULL,
  `carga_hor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `disciplinas`
--

INSERT INTO `disciplinas` (`cod_disc`, `nome_disc`, `carga_hor`) VALUES
('BD', 'BANCO DE DADOS', 100),
('ENG', 'ENGENHARIA DE SOFTWARE', 80),
('POO', 'PROGRAMAÇÃO COM ACESSO AO BANCO DE DADOS', 100),
('WEB', 'AUTORIA WEB', 50);

-- --------------------------------------------------------

--
-- Estrutura da tabela `historico`
--

CREATE TABLE `historico` (
  `cod_historico` int(11) NOT NULL,
  `cod_disc` varchar(4) NOT NULL,
  `cod_turma` int(11) NOT NULL,
  `cod_prof` int(11) NOT NULL,
  `mat` int(11) NOT NULL,
  `ano` int(11) DEFAULT NULL,
  `frequencia` int(11) DEFAULT NULL,
  `nota` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `historico`
--

INSERT INTO `historico` (`cod_historico`, `cod_disc`, `cod_turma`, `cod_prof`, `mat`, `ano`, `frequencia`, `nota`) VALUES
(255, 'BD', 7, 212131, 2015010101, 2015, 9, 1),
(256, 'ENG', 7, 212131, 2015010101, 2015, 1, 1),
(257, 'POO', 7, 212131, 2015010101, 2015, 3, 3),
(258, 'WEB', 7, 212131, 2015010101, 2015, 5, 8),
(259, 'BD', 8, 212131, 2015010101, 2015, 1, 3),
(260, 'ENG', 8, 212131, 2015010101, 2015, 2, 2),
(261, 'POO', 8, 212131, 2015010101, 2015, 6, 2),
(262, 'WEB', 8, 212131, 2015010101, 2015, 2, 5),
(263, 'BD', 9, 192011, 2015010101, 2015, 7, 9),
(264, 'ENG', 9, 192011, 2015010101, 2015, 4, 3),
(265, 'POO', 9, 192011, 2015010101, 2015, 6, 8),
(266, 'WEB', 9, 192011, 2015010101, 2015, 3, 2),
(267, 'BD', 10, 192011, 2015010101, 2015, 0, 4),
(268, 'ENG', 10, 192011, 2015010101, 2015, 1, 6),
(269, 'POO', 10, 192011, 2015010101, 2015, 2, 5),
(270, 'WEB', 10, 192011, 2015010101, 2015, 8, 2),
(271, 'BD', 11, 122135, 2015010101, 2015, 0, 4),
(272, 'ENG', 11, 122135, 2015010101, 2015, 1, 1),
(273, 'POO', 11, 122135, 2015010101, 2015, 5, 10),
(274, 'WEB', 11, 122135, 2015010101, 2015, 4, 0),
(275, 'BD', 7, 212131, 2015010102, 2015, 2, 8),
(276, 'ENG', 7, 212131, 2015010102, 2015, 2, 10),
(277, 'POO', 7, 212131, 2015010102, 2015, 9, 4),
(278, 'WEB', 7, 212131, 2015010102, 2015, 5, 4),
(279, 'BD', 8, 212131, 2015010102, 2015, 3, 5),
(280, 'ENG', 8, 212131, 2015010102, 2015, 5, 1),
(281, 'POO', 8, 212131, 2015010102, 2015, 1, 3),
(282, 'WEB', 8, 212131, 2015010102, 2015, 10, 10),
(283, 'BD', 9, 192011, 2015010102, 2015, 0, 4),
(284, 'ENG', 9, 192011, 2015010102, 2015, 7, 4),
(285, 'POO', 9, 192011, 2015010102, 2015, 9, 0),
(286, 'WEB', 9, 192011, 2015010102, 2015, 9, 9),
(287, 'BD', 10, 192011, 2015010102, 2015, 9, 8),
(288, 'ENG', 10, 192011, 2015010102, 2015, 4, 5),
(289, 'POO', 10, 192011, 2015010102, 2015, 3, 1),
(290, 'WEB', 10, 192011, 2015010102, 2015, 6, 5),
(291, 'BD', 11, 122135, 2015010102, 2015, 8, 4),
(292, 'ENG', 11, 122135, 2015010102, 2015, 7, 3),
(293, 'POO', 11, 122135, 2015010102, 2015, 3, 6),
(294, 'WEB', 11, 122135, 2015010102, 2015, 3, 5),
(295, 'BD', 7, 212131, 2015010103, 2015, 8, 2),
(296, 'ENG', 7, 212131, 2015010103, 2015, 10, 10),
(297, 'POO', 7, 212131, 2015010103, 2015, 0, 1),
(298, 'WEB', 7, 212131, 2015010103, 2015, 8, 3),
(299, 'BD', 8, 212131, 2015010103, 2015, 5, 3),
(300, 'ENG', 8, 212131, 2015010103, 2015, 2, 0),
(301, 'POO', 8, 212131, 2015010103, 2015, 6, 9),
(302, 'WEB', 8, 212131, 2015010103, 2015, 4, 7),
(303, 'BD', 9, 192011, 2015010103, 2015, 1, 5),
(304, 'ENG', 9, 192011, 2015010103, 2015, 3, 9),
(305, 'POO', 9, 192011, 2015010103, 2015, 4, 3),
(306, 'WEB', 9, 192011, 2015010103, 2015, 5, 7),
(307, 'BD', 10, 192011, 2015010103, 2015, 9, 3),
(308, 'ENG', 10, 192011, 2015010103, 2015, 9, 3),
(309, 'POO', 10, 192011, 2015010103, 2015, 10, 0),
(310, 'WEB', 10, 192011, 2015010103, 2015, 4, 9),
(311, 'BD', 11, 122135, 2015010103, 2015, 9, 10),
(312, 'ENG', 11, 122135, 2015010103, 2015, 10, 1),
(313, 'POO', 11, 122135, 2015010103, 2015, 7, 0),
(314, 'WEB', 11, 122135, 2015010103, 2015, 1, 4),
(315, 'BD', 7, 212131, 2015010104, 2015, 10, 3),
(316, 'ENG', 7, 212131, 2015010104, 2015, 7, 6),
(317, 'POO', 7, 212131, 2015010104, 2015, 10, 8),
(318, 'WEB', 7, 212131, 2015010104, 2015, 0, 10),
(319, 'BD', 8, 212131, 2015010104, 2015, 5, 7),
(320, 'ENG', 8, 212131, 2015010104, 2015, 0, 1),
(321, 'POO', 8, 212131, 2015010104, 2015, 4, 8),
(322, 'WEB', 8, 212131, 2015010104, 2015, 4, 9),
(323, 'BD', 9, 192011, 2015010104, 2015, 1, 1),
(324, 'ENG', 9, 192011, 2015010104, 2015, 4, 4),
(325, 'POO', 9, 192011, 2015010104, 2015, 8, 8),
(326, 'WEB', 9, 192011, 2015010104, 2015, 6, 5),
(327, 'BD', 10, 192011, 2015010104, 2015, 7, 9),
(328, 'ENG', 10, 192011, 2015010104, 2015, 3, 2),
(329, 'POO', 10, 192011, 2015010104, 2015, 9, 7),
(330, 'WEB', 10, 192011, 2015010104, 2015, 10, 6),
(331, 'BD', 11, 122135, 2015010104, 2015, 3, 8),
(332, 'ENG', 11, 122135, 2015010104, 2015, 7, 4),
(333, 'POO', 11, 122135, 2015010104, 2015, 8, 7),
(334, 'WEB', 11, 122135, 2015010104, 2015, 2, 10),
(335, 'BD', 7, 212131, 2015010105, 2015, 1, 7),
(336, 'ENG', 7, 212131, 2015010105, 2015, 2, 10),
(337, 'POO', 7, 212131, 2015010105, 2015, 1, 9),
(338, 'WEB', 7, 212131, 2015010105, 2015, 9, 8),
(339, 'BD', 8, 212131, 2015010105, 2015, 0, 2),
(340, 'ENG', 8, 212131, 2015010105, 2015, 7, 0),
(341, 'POO', 8, 212131, 2015010105, 2015, 1, 3),
(342, 'WEB', 8, 212131, 2015010105, 2015, 2, 3),
(343, 'BD', 9, 192011, 2015010105, 2015, 7, 5),
(344, 'ENG', 9, 192011, 2015010105, 2015, 5, 2),
(345, 'POO', 9, 192011, 2015010105, 2015, 3, 10),
(346, 'WEB', 9, 192011, 2015010105, 2015, 7, 7),
(347, 'BD', 10, 192011, 2015010105, 2015, 3, 6),
(348, 'ENG', 10, 192011, 2015010105, 2015, 8, 3),
(349, 'POO', 10, 192011, 2015010105, 2015, 4, 8),
(350, 'WEB', 10, 192011, 2015010105, 2015, 10, 2),
(351, 'BD', 11, 122135, 2015010105, 2015, 2, 7),
(352, 'ENG', 11, 122135, 2015010105, 2015, 8, 6),
(353, 'POO', 11, 122135, 2015010105, 2015, 7, 8),
(354, 'WEB', 11, 122135, 2015010105, 2015, 6, 9),
(355, 'BD', 7, 212131, 2015010106, 2015, 3, 9),
(356, 'ENG', 7, 212131, 2015010106, 2015, 7, 9),
(357, 'POO', 7, 212131, 2015010106, 2015, 2, 7),
(358, 'WEB', 7, 212131, 2015010106, 2015, 7, 2),
(359, 'BD', 8, 212131, 2015010106, 2015, 1, 2),
(360, 'ENG', 8, 212131, 2015010106, 2015, 4, 4),
(361, 'POO', 8, 212131, 2015010106, 2015, 10, 6),
(362, 'WEB', 8, 212131, 2015010106, 2015, 9, 7),
(363, 'BD', 9, 192011, 2015010106, 2015, 8, 7),
(364, 'ENG', 9, 192011, 2015010106, 2015, 3, 7),
(365, 'POO', 9, 192011, 2015010106, 2015, 1, 7),
(366, 'WEB', 9, 192011, 2015010106, 2015, 0, 3),
(367, 'BD', 10, 192011, 2015010106, 2015, 4, 2),
(368, 'ENG', 10, 192011, 2015010106, 2015, 6, 5),
(369, 'POO', 10, 192011, 2015010106, 2015, 7, 10),
(370, 'WEB', 10, 192011, 2015010106, 2015, 5, 8),
(371, 'BD', 11, 122135, 2015010106, 2015, 4, 6),
(372, 'ENG', 11, 122135, 2015010106, 2015, 10, 9),
(373, 'POO', 11, 122135, 2015010106, 2015, 5, 9),
(374, 'WEB', 11, 122135, 2015010106, 2015, 7, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `professores`
--

CREATE TABLE `professores` (
  `cod_prof` int(11) NOT NULL,
  `nome` varchar(150) DEFAULT NULL,
  `endereco` varchar(256) DEFAULT NULL,
  `cidade` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `professores`
--

INSERT INTO `professores` (`cod_prof`, `nome`, `endereco`, `cidade`) VALUES
(122135, 'ADORILSON BEZERRA,', 'AVENIDA SALGADO FILHO', 'NATAL'),
(192011, 'DIEGO OLIVEIRA,', 'AVENIDA ROBERTO FREIRE', 'NATAL'),
(212131, 'NICKERSON FERREIRA', 'RUA MANAÍRA,', 'JOÃO PESSOA');

-- --------------------------------------------------------

--
-- Estrutura da tabela `turma`
--

CREATE TABLE `turma` (
  `cod_turma` int(11) NOT NULL,
  `cod_disc` varchar(4) NOT NULL,
  `cod_prof` int(11) NOT NULL,
  `ano` int(11) NOT NULL,
  `horario` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `turma`
--

INSERT INTO `turma` (`cod_turma`, `cod_disc`, `cod_prof`, `ano`, `horario`) VALUES
(7, 'BD', 212131, 2015, '11H-12H'),
(8, 'BD', 212131, 2015, '13H-14H'),
(9, 'POO', 192011, 2015, '08H-09H'),
(10, 'WEB', 192011, 2015, '07H-08H'),
(11, 'ENG', 122135, 2015, '10H-11H');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `alunos`
--
ALTER TABLE `alunos`
  ADD PRIMARY KEY (`mat`);

--
-- Índices para tabela `disciplinas`
--
ALTER TABLE `disciplinas`
  ADD PRIMARY KEY (`cod_disc`);

--
-- Índices para tabela `historico`
--
ALTER TABLE `historico`
  ADD PRIMARY KEY (`cod_historico`),
  ADD KEY `mat` (`mat`),
  ADD KEY `cod_disc` (`cod_disc`),
  ADD KEY `cod_turma` (`cod_turma`),
  ADD KEY `cod_prof` (`cod_prof`);

--
-- Índices para tabela `professores`
--
ALTER TABLE `professores`
  ADD PRIMARY KEY (`cod_prof`);

--
-- Índices para tabela `turma`
--
ALTER TABLE `turma`
  ADD PRIMARY KEY (`cod_turma`),
  ADD KEY `cod_disc` (`cod_disc`),
  ADD KEY `cod_prof` (`cod_prof`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `alunos`
--
ALTER TABLE `alunos`
  MODIFY `mat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2015010107;

--
-- AUTO_INCREMENT de tabela `historico`
--
ALTER TABLE `historico`
  MODIFY `cod_historico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=375;

--
-- AUTO_INCREMENT de tabela `professores`
--
ALTER TABLE `professores`
  MODIFY `cod_prof` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=212132;

--
-- AUTO_INCREMENT de tabela `turma`
--
ALTER TABLE `turma`
  MODIFY `cod_turma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `historico`
--
ALTER TABLE `historico`
  ADD CONSTRAINT `historico_ibfk_1` FOREIGN KEY (`mat`) REFERENCES `alunos` (`mat`),
  ADD CONSTRAINT `historico_ibfk_2` FOREIGN KEY (`cod_disc`) REFERENCES `turma` (`cod_disc`),
  ADD CONSTRAINT `historico_ibfk_3` FOREIGN KEY (`cod_turma`) REFERENCES `turma` (`cod_turma`),
  ADD CONSTRAINT `historico_ibfk_4` FOREIGN KEY (`cod_prof`) REFERENCES `turma` (`cod_prof`);

--
-- Limitadores para a tabela `turma`
--
ALTER TABLE `turma`
  ADD CONSTRAINT `turma_ibfk_1` FOREIGN KEY (`cod_disc`) REFERENCES `disciplinas` (`cod_disc`),
  ADD CONSTRAINT `turma_ibfk_2` FOREIGN KEY (`cod_prof`) REFERENCES `professores` (`cod_prof`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
