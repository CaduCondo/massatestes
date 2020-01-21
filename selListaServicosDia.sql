USE ControleServicos;  
GO  

DROP PROCEDURE [dbo].[selListaServicosDia]
GO

CREATE PROCEDURE selListaServicosDia   
     
AS   

 Select CS.Id
	  ,CS.NomeServico
	  ,CS.IdSituacaoServico
	  ,CSS.Situacao
	  ,CHE.IdTipoExecucao
	  ,CTE.TipoExecucao
	  ,CHE.HorarioExecucao
	 -- ,(CAST(CONVERT(VARCHAR(5),CHE.HorarioExecucao,8) as time)) AS HORACAMPO
	 -- ,(SELECT CAST(CONVERT(VARCHAR(5),GETDATE(),8) as time))
	  from       [dbo].[CadastroServicos]			as CS 
	  INNER JOIN [dbo].[CadastroSituacao]			as CSS ON CS.IdSituacaoServico = CSS.Id
	  INNER JOIN [dbo].[CadastroHorarioExecucao]	as CHE ON CS.id				   = CHE.IdServico
	  INNER JOIN [dbo].CadastroTipoExecucao			as CTE ON CHE.IdTipoExecucao   = CTE.id
	  where CS.IdSituacaoServico = 1 AND --Situação Ativo
	  (CASE (SELECT (DATEPART(DW,getdate() )))
		 WHEN 1 THEN che.Domingo  
         WHEN 2 THEN che.Segunda  
         WHEN 3 THEN che.Terca  
         WHEN 4 THEN che.Quarta
		 WHEN 5 THEN che.Quinta
		 WHEN 6 THEN che.Sexta
         ELSE che.Sabado END = 1) 
		AND (CAST(CONVERT(VARCHAR(5),CHE.HorarioExecucao,8) as time)) = (SELECT CAST(CONVERT(VARCHAR(5),GETDATE(),8) as time))
	ORDER BY CHE.HorarioExecucao;
	  
GO 


EXEC selListaServicosDia

