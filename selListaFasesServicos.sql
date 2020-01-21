USE ControleServicos;  
GO  

DROP PROCEDURE [dbo].[selListaFasesServicos]
GO

CREATE PROCEDURE selListaFasesServicos  (@intIdServico as int = null) 
     
AS   
DECLARE @intSituacao int; 
set @intSituacao = 1; -- 1 - Situação Ativo - 2 - Situação Inativo

 Select	 CS.id
		,CS.NomeServico
		,CFS.Id
		,CFS.NomeFase
		,CFS.IdSituacaoFase
		,CST.Situacao
		,CASF.Sequencia
from  [dbo].[CadastroServicos]							as CS
	  INNER JOIN [dbo].[CadastroAssociacaoServicoFase]	as CASF ON CASF.IdFase		  = CS.id
	  INNER JOIN [dbo].[CadastroFaseServicos]			as CFS  ON CASF.IdFase        = CFS.id
	  INNER JOIN [dbo].[CadastroSituacao]				as CST  ON CFS.IdSituacaoFase = CST.Id
	  where CS.IdSituacaoServico = @intSituacao AND 
			CS.id				 = @intIdServico
Order By CS.id, CASF.IdFase, CASF.Sequencia;
	  
GO 

--EXEC selListaFasesServicos 1

