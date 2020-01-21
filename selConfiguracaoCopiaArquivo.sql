USE ControleServicos;  
GO  

DROP PROCEDURE [dbo].[selConfiguracaoCopiaArquivo]
GO

CREATE PROCEDURE selConfiguracaoCopiaArquivo @intIdServico as int
     
AS   

 Select CS.Id as IdServico
	   ,CCA.id as IdArquivo
	   ,CS.NomeServico
	   ,CCA.NomeArquivoOrigem
	   ,CCA.EnderecoArquivoOrigem
	   ,CCA.NomeArquivoDestino
	   ,CCA.EnderecoArquivoDestino
	   ,CST.Situacao
	   ,CCA.NomeTabela
	   ,CCA.NomeProcedure
 from			  [dbo].[CadastroServicos]			as CS 
	   INNER JOIN [dbo].[ConfiguracaoCopiaArquivo]	as CCA ON CS.id				    = CCA.IdServico
	   INNER JOIN [dbo].[CadastroSituacao]			as CST ON CCA.Situacao			= CST.id
	   where CS.Id = @intIdServico
			
Order By CCA.IdServico, CCA.id;
	  
GO 


EXEC selConfiguracaoCopiaArquivo 1

