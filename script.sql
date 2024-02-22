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

