SET TERM ^;
CREATE OR ALTER PROCEDURE TMP_DELETE_NON_SUP_RECORDS (SIGLA VARCHAR(255))
AS
DECLARE VARIABLE TABLENAME VARCHAR(255);
BEGIN
    FOR
        SELECT rdb$relation_name
        FROM rdb$relations
        WHERE
           rdb$view_blr IS NULL 
           AND (rdb$system_flag IS NULL OR rdb$system_flag = 0)
           AND UDF_TRIM(rdb$relation_name) LIKE :SIGLA
        INTO :TABLENAME
    DO
    BEGIN
     IN AUTONOMOUS TRANSACTION DO
     BEGIN
         EXECUTE STATEMENT ('DELETE FROM ' || :TABLENAME || '');
     END
    END
END^
SET TERM ;^

--/* Desativa trigger de deleção */
UPDATE rdb$triggers
SET rdb$trigger_inactive = 1
WHERE
    rdb$TRIGGER_TYPE IN (5, 6, 25, 26, 27, 28, 113, 114)
    AND rdb$trigger_source IS NOT NULL
    AND (COALESCE(rdb$system_flag,0) = 0)
    AND rdb$trigger_source NOT STARTING WITH 'CHECK';

EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'AAC_AUDITORIA';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'LEG_CAD_PROP_DOC';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'CONT_LANCAMENTO_ITEM';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'GRH_MOVIMENTOS';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'AAC_FORMULA';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'PRO_CADASTRO';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'CONT_CONTA_CONTABIL';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'AAC_DICIONARIO_MESES';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'LEIS_CADASTRO';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'CONT_LANCAMENTO';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'GRH_DADOS_MES';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'AAC_FORMULA_HISTORICO';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'FIN_LIVRORAZAO';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'FIN_EXECUCAO_LANCAMENTO_ITENS';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'CONT_CONTA_ANALITICA';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'CEO_BANCO_MOV';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'CEO_LINK_CONTA_CONTABIL';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'PRO_MOVIMENTACAO';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'LOA_CONTAS_OLD';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'GRH_SALARIOS';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'ALX_LANCAMENTO_ITENS';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'AAC_SESSOES';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'SIS_AUDITORIA';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'AAC_DOCUMENTO_DIGITALIZADO';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'CEO_OP_PAGTO';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'CEO_LIQUIDACOES_MOV';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'CEO_CONTA_FUNCIONAL_MOV';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'GPO_APURACAO_PONTO_DIA';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'PRO_VOLUME';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'CEO_OP_MOV';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'GRH_RENDIMENTOS';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'CEO_EXTRATOS';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'ALX_CONTROLE';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'ALX_LANCAMENTO';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'GPO_ACESSOS_REGISTRADOS';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'CONT_EVENTO_CONTA_CONTABIL';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'FIN_EXECUCAO_LANCAMENTO';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'GRH_AFASTAMENTOS_M';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'CEO_LIQUIDACOES';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'GRH_MOVIMENTOS_M';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'FIN_CHEQUE';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'CEO_DOC_DESPESAS';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'CEO_OP';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'CEO_DESPESAS_MOV';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'ALX_SALDO';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'FIN_EXECUCAO_EMPENHOS';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'GRH_CADASTRO_FUNCIONARIOS_M';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'CDM_COTA';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'LEG_DOCUMENTOS_ANEXO';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'LEG_VOTOS';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'CEO_BANCO_ORIGEM';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'CEO_DISPONIBILIDADE_MOV';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'FIN_EXECUCAO_ORDEM_PAGAMENTO';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'LOA_CONTAS_RECEITA_OLD';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'FIN_EXECUCAO_BANCOS';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'LOA_CONTAS_2';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'LEIS_HISTORICO';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'FIN_EXTRATOS';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'CDM_COTA_MES';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'GPAW_CADASTRO';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'CONT_ABERTURA_CONTA';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'SIS_SESSAO';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'CEO_DESPESA_ORIGEM';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'FIN_CONTAS_RECEITA';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'PEC_PLANO_CONTA_REC_LEG';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'GRH_AUDESP_FOLHA_ORDINARIA_VERB';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'AAC_FORMULAS_DE_CALCULO';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'CONT_LINK_EVENTO';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'LEG_TRAMITACAO';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'GPAW_CADASTRO_M';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'CEO_EMPENHOS';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'FIN_ARQUIVO_XML';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'FIN_EXECUCAO_LIQUIDACAO';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'GRH_MOVIMENTACAO_ANUAL';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'CEO_RECEITAS';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'CEO_RECEITAS_MOV';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'GPAW_MOVIMENTACAO_ITENS';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'CEO_DATAS';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'CONT_LINK_CONTROLE';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'CEO_RETENCAO';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'CEO_LRF_RREO_CONTA';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'AAC_SUPLEMENTAR';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'GRH_CADASTRO_FUNCIONARIOS';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'AAC_ERROS_FORMULAS';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'ESOCIAL_TABELAS';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'GRH_HISTORICO_FUNCIONAL';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'FIN_EXECUCAO_COTAS';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'PEC_CAIXA';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'IBGE_TODOS_MUNICIPIOS';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'FRO_VIAGENS';
EXECUTE PROCEDURE TMP_DELETE_NON_SUP_RECORDS 'IPTU_%';

--/* Ativa trigger de deleção */
UPDATE rdb$triggers
SET rdb$trigger_inactive = 0
WHERE
    rdb$TRIGGER_TYPE IN (5, 6, 25, 26, 27, 28, 113, 114)
    AND rdb$trigger_source IS NOT NULL
    AND (COALESCE(rdb$system_flag,0) = 0)
    AND rdb$trigger_source NOT STARTING WITH 'CHECK';

DROP PROCEDURE TMP_DELETE_NON_SUP_RECORDS;
