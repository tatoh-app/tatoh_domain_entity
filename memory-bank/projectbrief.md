# Project Brief: tatoh_domain_entity

**Última Atualização:** 2025-04-02

## Visão Geral

Este pacote (`tatoh_domain_entity`) contém as entidades e a lógica de domínio principais para o projeto Tatoh Mobile. Ele define as estruturas de dados centrais (entidades) que representam os conceitos do negócio e serve como a camada mais interna na Clean Architecture do aplicativo.

## Objetivos Principais

*   Definir entidades de domínio estáveis e bem tipadas.
*   Separar a lógica de negócio principal das camadas de dados e apresentação.
*   Fornecer uma base consistente para as outras camadas do aplicativo interagirem.

## Escopo

*   Definição de todas as entidades de domínio (User, Profile, Link, QRCode, Contact, etc.).
*   Validações de domínio (se aplicável, embora muitas validações possam residir em casos de uso).
*   Interfaces de repositório (se aplicável, definindo os contratos para a camada de dados).

## Fora do Escopo

*   Implementações de acesso a dados (isso pertence à camada de dados).
*   Lógica de UI ou apresentação.
*   Infraestrutura (configuração de rede, banco de dados, etc.).
*   Modelos de dados específicos da camada de dados (DTOs/Models).

*(Este é um rascunho inicial. Por favor, revise e atualize conforme necessário.)*
