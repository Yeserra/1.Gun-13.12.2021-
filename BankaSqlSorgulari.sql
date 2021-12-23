--Programmability -> Stored Procedures -> SağTık -> Stored Procedure...


--===========================================================HESAP_ACMA=================================================================================

USE [Banka]
GO
/****** Object:  StoredProcedure [dbo].[HesapAcma]    Script Date: 23.12.2021 22:14:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[HesapAcma] ---------------------------------> Önce ALTER yerine CREATE yazıp bir kere Execute ederek HesapAcma oluşturulur.
	-- Add the parameters for the stored procedure here
	@Unvan Nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Insert into Musteri(Unvan,Bakiye)
	Values(@Unvan,0)
END


--===============================================================PARA_CEKME==============================================================================


USE [Banka]
GO
/****** Object:  StoredProcedure [dbo].[ParaCekme]    Script Date: 23.12.2021 22:27:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[ParaCekme] ---------------------------------------> Önce CREATE!
	-- Add the parameters for the stored procedure here
	@MusteriId int,
	@Tutar decimal(18,2)
	
AS
declare @Bakiye decimal(18,2)
set @Bakiye=(select Bakiye from Musteri where MusteriId=@MusteriId)
	SET NOCOUNT ON;

IF @Tutar>@Bakiye
	
BEGIN
Print 'Bakiye yetersiz'


END
else
begin 
-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.

    -- Insert statements for procedure here

	
	
	Update Musteri set Bakiye = Bakiye-@Tutar
	where @MusteriId=MusteriId

	insert into Hareket(Tarih,Tutar,MusteriId)
	Values (GETDATE(),@Tutar*-1,@MusteriId)

	end


--===========================================================PARA_YATIRMA===========================================================================




USE [Banka]
GO
/****** Object:  StoredProcedure [dbo].[ParaYatirma]    Script Date: 23.12.2021 22:51:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[ParaYatirma]
	-- Add the parameters for the stored procedure here
	@MusteriId int,
	@Tutar decimal(18,2)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update Musteri set Bakiye = Bakiye+@Tutar
	where @MusteriId=MusteriId

	insert into Hareket(Tarih,Tutar,MusteriId)
	Values (GETDATE(),@Tutar,@MusteriId)

END





