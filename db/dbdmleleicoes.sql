-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: 31-Jul-2020 às 14:20
-- Versão do servidor: 5.7.31-0ubuntu0.18.04.1
-- PHP Version: 7.2.24-0ubuntu0.18.04.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `telescope_dml_eleicoes`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `survey`
--

CREATE TABLE `survey` (
  `id` varchar(250) NOT NULL,
  `datahora_inicio` varchar(250) DEFAULT NULL,
  `datahora_fim` varchar(250) DEFAULT NULL,
  `pesquisador` varchar(250) DEFAULT NULL,
  `regiao_pesquisa` varchar(250) DEFAULT NULL,
  `regiao_moradia` varchar(250) DEFAULT NULL,
  `sexo` varchar(250) DEFAULT NULL,
  `idade` varchar(250) DEFAULT NULL,
  `escolaridade` varchar(250) DEFAULT NULL,
  `renda_familiar` varchar(250) DEFAULT NULL,
  `religiao` varchar(250) DEFAULT NULL,
  `noticias_whatsapp` varchar(250) DEFAULT NULL,
  `noticias_jornal_impresso` varchar(250) DEFAULT NULL,
  `noticias_facebook` varchar(250) DEFAULT NULL,
  `noticias_radio_capela` varchar(250) DEFAULT NULL,
  `noticias_outros` varchar(250) DEFAULT NULL,
  `noticias_nenhum` varchar(250) DEFAULT NULL,
  `noticias_nao_sabe` varchar(250) DEFAULT NULL,
  `pretende_votar` varchar(250) DEFAULT NULL,
  `nao_votaria_prefeito` varchar(250) DEFAULT NULL,
  `candidatos_cartao1_votaria_prefeito` varchar(250) DEFAULT NULL,
  `candidatos_cartao1_votaria_vice` varchar(250) DEFAULT NULL,
  `candidatos_cartao1_segunda_opcao` varchar(250) DEFAULT NULL,
  `candidatos_cartao1_nao_votaria_dario` varchar(250) DEFAULT NULL,
  `candidatos_cartao1_nao_votaria_neia` varchar(250) DEFAULT NULL,
  `candidatos_cartao1_nao_votaria_marta` varchar(250) DEFAULT NULL,
  `candidatos_cartao1_nao_votaria_edu` varchar(250) DEFAULT NULL,
  `candidatos_cartao1_nao_votaria_edson` varchar(250) DEFAULT NULL,
  `candidatos_cartao1_nao_votaria_nil` varchar(250) DEFAULT NULL,
  `candidatos_cartao1_nao_votaria_coronel` varchar(250) DEFAULT NULL,
  `candidatos_cartao1_nao_votaria_nenhum` varchar(250) DEFAULT NULL,
  `candidatos_cartao1_nao_votaria_nao_sabe` varchar(250) DEFAULT NULL,
  `candidatos_cartao2_votaria_prefeito` varchar(250) DEFAULT NULL,
  `satisfeito_opcoes_atuais` varchar(250) DEFAULT NULL,
  `novo_candidato_votaria` varchar(250) DEFAULT NULL,
  `novo_candidato_venceria` varchar(250) DEFAULT NULL,
  `profissoes_prefeito_medico` varchar(250) DEFAULT NULL,
  `profissoes_prefeito_empresario` varchar(250) DEFAULT NULL,
  `profissoes_prefeito_advogado` varchar(250) DEFAULT NULL,
  `profissoes_prefeito_engenheiro` varchar(250) DEFAULT NULL,
  `profissoes_prefeito_politico` varchar(250) DEFAULT NULL,
  `profissoes_prefeito_servidor` varchar(250) DEFAULT NULL,
  `profissoes_prefeito_operario` varchar(250) DEFAULT NULL,
  `profissoes_prefeito_outros` varchar(250) DEFAULT NULL,
  `profissoes_prefeito_nenhum` varchar(250) DEFAULT NULL,
  `profissoes_prefeito_nao_sabe` varchar(250) DEFAULT NULL,
  `candidatos_cartao3_conhece_hugo` varchar(250) DEFAULT NULL,
  `candidatos_cartao3_conhece_marcio` varchar(250) DEFAULT NULL,
  `candidatos_cartao3_conhece_joao_bellenus` varchar(250) DEFAULT NULL,
  `candidatos_cartao3_conhece_joao_dellabruna` varchar(250) DEFAULT NULL,
  `candidatos_cartao3_conhece_raul` varchar(250) DEFAULT NULL,
  `candidatos_cartao3_conhece_geraldo` varchar(250) DEFAULT NULL,
  `candidatos_cartao3_conhece_coronel` varchar(250) DEFAULT NULL,
  `candidatos_cartao3_conhece_nenhum` varchar(250) DEFAULT NULL,
  `candidatos_cartao3_conhece_nao_sabe` varchar(250) DEFAULT NULL,
  `candidatos_cartao3_votaria_prefeito_hugo` varchar(250) DEFAULT NULL,
  `candidatos_cartao3_votaria_prefeito_marcio` varchar(250) DEFAULT NULL,
  `candidatos_cartao3_votaria_prefeito_joao_bellenus` varchar(250) DEFAULT NULL,
  `candidatos_cartao3_votaria_prefeito_joao_dellabruna` varchar(250) DEFAULT NULL,
  `candidatos_cartao3_votaria_prefeito_raul` varchar(250) DEFAULT NULL,
  `candidatos_cartao3_votaria_prefeito_geraldo` varchar(250) DEFAULT NULL,
  `candidatos_cartao3_votaria_prefeito_coronel` varchar(250) DEFAULT NULL,
  `candidatos_cartao3_votaria_prefeito_nenhum` varchar(250) DEFAULT NULL,
  `candidatos_cartao3_votaria_prefeito_nao_sabe` varchar(250) DEFAULT NULL,
  `candidatos_cartao3_votaria_prefeito_branco_nulo` varchar(250) DEFAULT NULL,
  `candidatos_cartao3_nao_votaria_prefeito_hugo` varchar(250) DEFAULT NULL,
  `candidatos_cartao3_nao_votaria_prefeito_marcio` varchar(250) DEFAULT NULL,
  `candidatos_cartao3_nao_votaria_prefeito_joao_bellenus` varchar(250) DEFAULT NULL,
  `candidatos_cartao3_nao_votaria_prefeito_joao_dellabruna` varchar(250) DEFAULT NULL,
  `candidatos_cartao3_nao_votaria_prefeito_raul` varchar(250) DEFAULT NULL,
  `candidatos_cartao3_nao_votaria_prefeito_geraldo` varchar(250) DEFAULT NULL,
  `candidatos_cartao3_nao_votaria_prefeito_coronel` varchar(250) DEFAULT NULL,
  `candidatos_cartao3_nao_votaria_prefeito_nenhum` varchar(250) DEFAULT NULL,
  `candidatos_cartao3_nao_votaria_prefeito_nao_sabe` varchar(250) DEFAULT NULL,
  `candidatos_cartao3_nao_votaria_prefeito_branco_nulo` varchar(250) DEFAULT NULL,
  `votaria_indicado_prefeito_atual` varchar(250) DEFAULT NULL,
  `votaria_indicado_milton` varchar(250) DEFAULT NULL,
  `tem_candidato_vereador` varchar(250) DEFAULT NULL,
  `regStatus` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `survey`
--
ALTER TABLE `survey`
  ADD PRIMARY KEY (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
