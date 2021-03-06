USE [Test_Sherlock_LinQ]
GO
/****** Object:  StoredProcedure [Listas].[spRIESGOParaActualizacionPeriodicidad]    Script Date: 14/10/2016 11:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JohnRestrepo
-- Create date: 11-10-2016
-- Description:	Actualizacion de Parametrizacion Periodicidad
-- =============================================
CREATE PROCEDURE [Listas].[spRIESGOParaActualizacionPeriodicidad] 
	-- Parametros de Entrada
	@NombrePeriodicidad nvarchar(250),
	@IdPeriodicidad numeric(18)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE Parametrizacion.Periodicidad SET NombrePeriodicidad = @NombrePeriodicidad WHERE (IdPeriodicidad = @IdPeriodicidad)

END

GO
/****** Object:  StoredProcedure [Listas].[spRIESGOParaInsercionPeriodicidad]    Script Date: 14/10/2016 11:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JohnRestrepo
-- Create date: 10-10-2016
-- Description:	Insercion de Parametrizacion Periodicidad
-- =============================================
CREATE PROCEDURE [Listas].[spRIESGOParaInsercionPeriodicidad] 
	-- Parametros de Entrada
	@NombrePeriodicidad nvarchar(250)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO Parametrizacion.Periodicidad (NombrePeriodicidad) VALUES (@NombrePeriodicidad)

END

GO
/****** Object:  StoredProcedure [Listas].[spRIESGOSActualizarServicios]    Script Date: 14/10/2016 11:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JohnRestrepo
-- Create date: 10-10-2016
-- Description:	Actualizacion de datos de Servicios
-- =============================================
CREATE PROCEDURE [Listas].[spRIESGOSActualizarServicios]
	-- Parametros de entrada
	@Descripcion nvarchar(500),
	@IdServicio numeric(18)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [Eventos].[Servicio] SET [Descripcion] = @Descripcion WHERE [IdServicio] = @IdServicio
END

GO
/****** Object:  StoredProcedure [Listas].[spRIESGOSConsultarServicios]    Script Date: 14/10/2016 11:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JohnRestrepo
-- Create date: 09-10-2016
-- Description:	Consultar Servicios
-- =============================================
CREATE PROCEDURE [Listas].[spRIESGOSConsultarServicios] 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT [IdServicio], [Descripcion], [Usuario],  CONVERT(VARCHAR(10),[FechaRegistro],103) AS FechaRegistro 
	FROM [Eventos].[Servicio], [Listas].[Usuarios] 
	WHERE [Servicio].[IdUsuario] = [Usuarios].[IdUsuario]
END

GO
/****** Object:  StoredProcedure [Listas].[spRIESGOSInsercionServicios]    Script Date: 14/10/2016 11:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JohnRestrepo
-- Create date: 09-10-2016
-- Description:	Insercion de Servicios Eventos
-- =============================================
CREATE PROCEDURE [Listas].[spRIESGOSInsercionServicios] 
	-- Parametros de entrada
	@Descripcion nvarchar(500),
	@IdUsuario numeric(18),
	@FechaRegistro datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO [Eventos].[Servicio] ([Descripcion], [IdUsuario], [FechaRegistro]) VALUES (@Descripcion, @IdUsuario, @FechaRegistro)
END

GO
/****** Object:  StoredProcedure [Listas].[spSEGURIDADActualizarRoles]    Script Date: 14/10/2016 11:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JohnRestrepo
-- Create date: 07-10-2016
-- Description:	Actualizacion de Roles
-- =============================================
CREATE PROCEDURE [Listas].[spSEGURIDADActualizarRoles] 
	-- Parametros de Entrada
	@IdRol numeric(18),
	@NombreRol nvarchar(250)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE Listas.Roles SET NombreRol = @NombreRol WHERE (IdRol = @IdRol)

END

GO
/****** Object:  StoredProcedure [Listas].[spSEGURIDADActualizaUsuarios]    Script Date: 14/10/2016 11:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JohnRestrepo
-- Create date: 07-10-2016
-- Description:	Actualizacion de Usuarios
-- =============================================
CREATE PROCEDURE [Listas].[spSEGURIDADActualizaUsuarios] 
	-- Parametros de Entrada
	@IdRol numeric(18),
	@NumeroDocumento nvarchar(18),
	@Nombres nvarchar(150),
	@Apellidos nvarchar(150),
	@Usuario nvarchar(250),
	@Contrasena nvarchar(max),
	@Bloqueado bit,
	@IdJerarquia numeric(18),
	@IdMacroprocesoU numeric(18),
	@IdProcesoU numeric(18),
	@VerTodosProcesos numeric(18),
	@IdUsuario numeric(18)
AS
BEGIN
	
	SET NOCOUNT ON;

    UPDATE Listas.Usuarios SET IdRol = @IdRol , 
			NumeroDocumento = @NumeroDocumento, 
			Nombres = @Nombres, 
			Apellidos =@Apellidos,
			Usuario = @Usuario, 
			Bloqueado = @Bloqueado, 
			IdJerarquia = @IdJerarquia, 
			IdMacroprocesoU = @IdMacroprocesoU,  
			IdProcesoU = @IdProcesoU, 
			VerTodosProcesos = @VerTodosProcesos 
			WHERE (IdUsuario = @IdUsuario)
END

GO
/****** Object:  StoredProcedure [Listas].[spSEGURIDADcargarUsuarios]    Script Date: 14/10/2016 11:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Restrepo
-- Create date: 06-10-2016
-- Description:	Carga de tabla de Usuarios
-- =============================================
-- exec  [Listas].[spSEGURIDADcargarUsuarios] 'WHERE (NumeroDocumento LIKE %123456ff%)'
CREATE PROCEDURE [Listas].[spSEGURIDADcargarUsuarios]
	-- Parametros de Entrada
	@CONDICION NVARCHAR(MAX)
	
AS
BEGIN
	DECLARE @CADENA NVARCHAR(MAX)
	SET NOCOUNT ON;

		set @CADENA = 'SELECT a.IdUsuario, a.IdRol, b.NombreRol, 
		a.NumeroDocumento, a.Nombres, a.Apellidos, 
		a.Usuario, a.Bloqueado, a.Contrasena, 
		a.IdJerarquia, c.NombreHijo, 
		a.IdMacroProcesoU, a.IdProcesoU, a.VerTodosProcesos, 
		a.FechaUltActualPassword 
			FROM Listas.Usuarios as a
			INNER JOIN Listas.Roles as b ON a.IdRol = b.IdRol 
			INNER JOIN Parametrizacion.JerarquiaOrganizacional as c
				ON a.IdJerarquia = c.idHijo '
    IF(@CONDICION <> '')
	BEGIN
		set @CADENA = @CADENA + @CONDICION
	END
	ELSE
	BEGIN
		EXEC(@CADENA)
	END
	--SELECT @CADENA
	EXEC(@CADENA)
END

GO
/****** Object:  StoredProcedure [Listas].[spSEGURIDADRegistroUsuarios]    Script Date: 14/10/2016 11:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Restrepo
-- Create date: 06-10-2016
-- Description:	Registro de Usuarios Pwillis
-- =============================================
CREATE PROCEDURE [Listas].[spSEGURIDADRegistroUsuarios]
	-- Parametros de Entrada
	@IdRol numeric(18),
	@NumeroDocumento nvarchar(18),
	@Nombres nvarchar(150),
	@Apellidos nvarchar(150),
	@Usuario nvarchar(250),
	@Contrasena nvarchar(max),
	@Bloqueado bit,
	@IdJerarquia numeric(18),
	@IdMacroprocesoU numeric(18),
	@IdProcesoU numeric(18),
	@VerTodosProcesos numeric(18)
AS
BEGIN
	
	SET NOCOUNT ON;

    
		INSERT Listas.Usuarios (IdRol, NumeroDocumento, Nombres, Apellidos, Usuario, Contrasena, Bloqueado,
		    IdJerarquia, IdMacroprocesoU, IdProcesoU, VerTodosProcesos, FechaUltActualPassword, Login)
		VALUES (@IdRol,@NumeroDocumento,@Nombres,@Apellidos,@Usuario,@Contrasena,@Bloqueado,@IdJerarquia
		,@IdMacroprocesoU,@IdProcesoU,@VerTodosProcesos,GETDATE(), 0
		)
	
END

GO
/****** Object:  StoredProcedure [Listas].[spSEGURIDADRestContraseña]    Script Date: 14/10/2016 11:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JohnRestrepo
-- Create date: 07-10-2016
-- Description:	Rest de la contraseña
-- =============================================
CREATE PROCEDURE [Listas].[spSEGURIDADRestContraseña] 
	-- Parametros de Entrada
	@Contrasena nvarchar(max),
	@IdUsuario numeric(18)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE Listas.Usuarios SET Contrasena = @Contrasena, 
	FechaUltActualPassword = GETDATE() 
	WHERE (IdUsuario = @IdUsuario)

END

GO
/****** Object:  StoredProcedure [Parametrizacion].[spRIESGOSActualizarCalificacionRiesgo]    Script Date: 14/10/2016 11:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JohnRestrepo
-- Create date: 13-10-2016
-- Description:	Actualizar del Calificacion Riesgo
-- =============================================
CREATE PROCEDURE [Parametrizacion].[spRIESGOSActualizarCalificacionRiesgo] 
	-- Parametros de entrada
	@NombreClasificacionRiesgo nvarchar(200),
	@IdUsuario numeric(18),
	@FechaRegistro datetime,
	@IdClasificacionRiesgo numeric(18)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE Parametrizacion.ClasificacionRiesgo SET NombreClasificacionRiesgo = @NombreClasificacionRiesgo, 
	IdUsuario = @IdUsuario, 
	FechaRegistro = @FechaRegistro 
	WHERE (IdClasificacionRiesgo = @IdClasificacionRiesgo)
END

GO
/****** Object:  StoredProcedure [Parametrizacion].[spRIESGOSActualizarCalificacionRiesgoGeneral]    Script Date: 14/10/2016 11:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JohnRestrepo
-- Create date: 13-10-2016
-- Description:	Actualizar del Calificacion Riesgo
-- =============================================
CREATE PROCEDURE [Parametrizacion].[spRIESGOSActualizarCalificacionRiesgoGeneral] 
	-- Parametros de entrada
	@NombreClasificacionGeneralRiesgo nvarchar(200),
	@IdUsuario numeric(18),
	@FechaRegistro datetime,
	@IdClasificacionRiesgo numeric(18),
	@IdClasificacionGeneralRiesgo numeric(18)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE Parametrizacion.ClasificacionGeneralRiesgo SET IdClasificacionRiesgo = @IdClasificacionRiesgo,
	 NombreClasificacionGeneralRiesgo = @NombreClasificacionGeneralRiesgo, 
	 IdUsuario = @IdUsuario, FechaRegistro = @FechaRegistro 
	 WHERE (IdClasificacionGeneralRiesgo = @IdClasificacionGeneralRiesgo)
END

GO
/****** Object:  StoredProcedure [Parametrizacion].[spRIESGOSActualizarCalificacionRiesgoParticular]    Script Date: 14/10/2016 11:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JohnRestrepo
-- Create date: 13-10-2016
-- Description:	Actualizar del Calificacion Riesgo Particular
-- =============================================
CREATE PROCEDURE [Parametrizacion].[spRIESGOSActualizarCalificacionRiesgoParticular] 
	-- Parametros de entrada
	@NombreClasificacionParticularRiesgo nvarchar(200),
	@IdUsuario numeric(18),
	@FechaRegistro datetime,
	@IdClasificacionRiesgo numeric(18),
	@IdClasificacionParticularRiesgo numeric(18)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE Parametrizacion.ClasificacionParticularRiesgo SET IdClasificacionGeneralRiesgo = @IdClasificacionRiesgo,
	 NombreClasificacionParticularRiesgo = @NombreClasificacionParticularRiesgo, 
	 IdUsuario = @IdUsuario, 
	 FechaRegistro = @FechaRegistro 
	 WHERE (IdClasificacionParticularRiesgo = @IdClasificacionParticularRiesgo)
END

GO
/****** Object:  StoredProcedure [Parametrizacion].[spRIESGOSActualizarCausas]    Script Date: 14/10/2016 11:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JohnRestrepo
-- Create date: 12-10-2016
-- Description:	Actualizar registro de Causas
-- =============================================
CREATE PROCEDURE [Parametrizacion].[spRIESGOSActualizarCausas]
	-- Parametros de Entrada
	@NombreCausas nvarchar(200),
	@IdCausas numeric(18)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    
	UPDATE Parametrizacion.Causas SET NombreCausas = @NombreCausas
	WHERE (IdCausas = @IdCausas)

END

GO
/****** Object:  StoredProcedure [Parametrizacion].[spRIESGOSActualizarConsecuencias]    Script Date: 14/10/2016 11:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JohnRestrepo
-- Create date: 12-10-2016
-- Description:	Actualizar registro de Consecuencias
-- =============================================
CREATE PROCEDURE [Parametrizacion].[spRIESGOSActualizarConsecuencias]
	-- Parametros de Entrada
	@NombreConsecuencia nvarchar(200),
	@IdConsecuencia numeric(18)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    
	UPDATE Parametrizacion.Consecuencia SET NombreConsecuencia = @NombreConsecuencia
	WHERE (IdConsecuencia = @IdConsecuencia)

END

GO
/****** Object:  StoredProcedure [Parametrizacion].[spRIESGOSActualizarDesviciones]    Script Date: 14/10/2016 11:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JohnRestrepo
-- Create date: 11-10-2016
-- Description:	Actualizacion de Desviacion de CalificacionControl
-- =============================================
CREATE PROCEDURE [Parametrizacion].[spRIESGOSActualizarDesviciones] 
	-- Parametros de Entrada
	@DesviacionProbabilidad1 numeric(18),
	@DesviacionProbabilidad2 numeric(18),
	@DesviacionProbabilidad3 numeric(18),
	@DesviacionProbabilidad4 numeric(18),
	@DesviacionImpacto1 numeric(18),
	@DesviacionImpacto2 numeric(18),
	@DesviacionImpacto3 numeric(18),
	@DesviacionImpacto4 numeric(18)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE Parametrizacion.CalificacionControl SET DesviacionProbabilidad = @DesviacionProbabilidad1, DesviacionImpacto = @DesviacionImpacto1 WHERE (IdCalificacionControl = 1)
    UPDATE Parametrizacion.CalificacionControl SET DesviacionProbabilidad = @DesviacionProbabilidad2, DesviacionImpacto = @DesviacionImpacto2 WHERE (IdCalificacionControl = 2)
    UPDATE Parametrizacion.CalificacionControl SET DesviacionProbabilidad = @DesviacionProbabilidad3, DesviacionImpacto = @DesviacionImpacto3 WHERE (IdCalificacionControl = 3)
    UPDATE Parametrizacion.CalificacionControl SET DesviacionProbabilidad = @DesviacionProbabilidad4, DesviacionImpacto = @DesviacionImpacto4 WHERE (IdCalificacionControl = 4)
END

GO
/****** Object:  StoredProcedure [Parametrizacion].[spRIESGOSActualizarEstadoLegislacion]    Script Date: 14/10/2016 11:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JohnRestrepo
-- Create date: 11-10-2016
-- Description:	Actualizar registro de Estado Legislacion
-- =============================================
CREATE PROCEDURE [Parametrizacion].[spRIESGOSActualizarEstadoLegislacion]
	-- Parametros de Entrada
	@NombreEstadoLegislacion nvarchar(200),
	@IdEstadoLegislacion numeric(18)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE Parametrizacion.EstadoLegislacion 
	SET NombreEstadoLegislacion = @NombreEstadoLegislacion
	WHERE (IdEstadoLegislacion = @IdEstadoLegislacion)

END

GO
/****** Object:  StoredProcedure [Parametrizacion].[spRIESGOSActualizarEstadoPlanAccion]    Script Date: 14/10/2016 11:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JohnRestrepo
-- Create date: 12-10-2016
-- Description:	Actualizar registro de Estado de Plan Accion
-- =============================================
CREATE PROCEDURE [Parametrizacion].[spRIESGOSActualizarEstadoPlanAccion]
	-- Parametros de Entrada
	@NombreEstadoPlanAccion nvarchar(200),
	@IdEstadoPlanAccion numeric(18)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    
	UPDATE Parametrizacion.EstadoPlanAccion SET NombreEstadoPlanAccion = @NombreEstadoPlanAccion 
	WHERE (IdEstadoPlanAccion = @IdEstadoPlanAccion)

END

GO
/****** Object:  StoredProcedure [Parametrizacion].[spRIESGOSActualizarEstadoPlanEvaluacion]    Script Date: 14/10/2016 11:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JohnRestrepo
-- Create date: 12-10-2016
-- Description:	Actualizar registro de Estado de Plan Evaluacion
-- =============================================
CREATE PROCEDURE [Parametrizacion].[spRIESGOSActualizarEstadoPlanEvaluacion]
	-- Parametros de Entrada
	@NombreEstadoPlanEvaluacion nvarchar(200),
	@IdEstadoPlanEvaluacion numeric(18)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    
	UPDATE Parametrizacion.EstadoPlanEvaluacion SET NombreEstadoPlanEvaluacion = @NombreEstadoPlanEvaluacion
	WHERE 
	(IdEstadoPlanEvaluacion = @IdEstadoPlanEvaluacion)

END

GO
/****** Object:  StoredProcedure [Parametrizacion].[spRIESGOSActualizarFactorRiesgoLaft]    Script Date: 14/10/2016 11:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JohnRestrepo
-- Create date: 13-10-2016
-- Description:	Actualizar del Factor Riesgo Laft
-- =============================================
CREATE PROCEDURE [Parametrizacion].[spRIESGOSActualizarFactorRiesgoLaft] 
	-- Parametros de entrada
	@NombreFactorRiesgoLAFT nvarchar(200),
	@IdFactorRiesgoLAFT numeric(18)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE Parametrizacion.FactorRiesgoLAFT SET NombreFactorRiesgoLAFT = @NombreFactorRiesgoLAFT 
	WHERE (IdFactorRiesgoLAFT = @IdFactorRiesgoLAFT)
END

GO
/****** Object:  StoredProcedure [Parametrizacion].[spRIESGOSActualizarFactorRiesgoOperativo]    Script Date: 14/10/2016 11:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JohnRestrepo
-- Create date: 13-10-2016
-- Description:	Actualizar del Factor Riesgo Operativo
-- =============================================
CREATE PROCEDURE [Parametrizacion].[spRIESGOSActualizarFactorRiesgoOperativo] 
	-- Parametros de entrada
	@NombreFactorRiesgoOperativo nvarchar(200),
	@IdFactorRiesgoOperativo numeric(18)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE Parametrizacion.FactorRiesgoOperativo SET NombreFactorRiesgoOperativo = @NombreFactorRiesgoOperativo
	WHERE (IdFactorRiesgoOperativo = @IdFactorRiesgoOperativo)
END

GO
/****** Object:  StoredProcedure [Parametrizacion].[spRIESGOSActualizarImpacto]    Script Date: 14/10/2016 11:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JohnRestrepo
-- Create date: 13-10-2016
-- Description:	Actualizar del Impacto
-- =============================================
CREATE PROCEDURE [Parametrizacion].[spRIESGOSActualizarImpacto] 
	-- Parametros de entrada
	@NombreImpacto1 nvarchar(200),
	@NombreImpacto2 nvarchar(200),
	@NombreImpacto3 nvarchar(200),
	@NombreImpacto4 nvarchar(200),
	@NombreImpacto5 nvarchar(200)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE Parametrizacion.Impacto SET NombreImpacto = @NombreImpacto1 WHERE (IdImpacto = 1)
    UPDATE Parametrizacion.Impacto SET NombreImpacto = @NombreImpacto2 WHERE (IdImpacto = 2)
    UPDATE Parametrizacion.Impacto SET NombreImpacto = @NombreImpacto3 WHERE (IdImpacto = 3)
    UPDATE Parametrizacion.Impacto SET NombreImpacto = @NombreImpacto4 WHERE (IdImpacto = 4)
    UPDATE Parametrizacion.Impacto SET NombreImpacto = @NombreImpacto5 WHERE (IdImpacto = 5)
END

GO
/****** Object:  StoredProcedure [Parametrizacion].[spRIESGOSActualizarProbabilidad]    Script Date: 14/10/2016 11:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JohnRestrepo
-- Create date: 13-10-2016
-- Description:	Actualizar del Calificacion Riesgo Particular
-- =============================================
CREATE PROCEDURE [Parametrizacion].[spRIESGOSActualizarProbabilidad] 
	-- Parametros de entrada
	@NombreProbabilidad1 nvarchar(200),
	@NombreProbabilidad2 nvarchar(200),
	@NombreProbabilidad3 nvarchar(200),
	@NombreProbabilidad4 nvarchar(200),
	@NombreProbabilidad5 nvarchar(200)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE Parametrizacion.Probabilidad SET NombreProbabilidad = @NombreProbabilidad1 WHERE (IdProbabilidad = 1)
    UPDATE Parametrizacion.Probabilidad SET NombreProbabilidad = @NombreProbabilidad2 WHERE (IdProbabilidad = 2)
    UPDATE Parametrizacion.Probabilidad SET NombreProbabilidad = @NombreProbabilidad3 WHERE (IdProbabilidad = 3)
    UPDATE Parametrizacion.Probabilidad SET NombreProbabilidad = @NombreProbabilidad4 WHERE (IdProbabilidad = 4)
    UPDATE Parametrizacion.Probabilidad SET NombreProbabilidad = @NombreProbabilidad5 WHERE (IdProbabilidad = 5)
END

GO
/****** Object:  StoredProcedure [Parametrizacion].[spRIESGOSActualizarRiesgoAsociadoLaft]    Script Date: 14/10/2016 11:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JohnRestrepo
-- Create date: 13-10-2016
-- Description:	Actualizar del Riesgo Asociado Laft
-- =============================================
CREATE PROCEDURE [Parametrizacion].[spRIESGOSActualizarRiesgoAsociadoLaft] 
	-- Parametros de entrada
	@NombreRiesgoAsociadoLA nvarchar(200),
	@IdRiesgoAsociadoLA numeric(18)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE Parametrizacion.RiesgoAsociadoLA SET NombreRiesgoAsociadoLA = @NombreRiesgoAsociadoLA 
	WHERE (IdRiesgoAsociadoLA = @IdRiesgoAsociadoLA)
END

GO
/****** Object:  StoredProcedure [Parametrizacion].[spRIESGOSActualizarRiesgoAsociadoOperativo]    Script Date: 14/10/2016 11:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JohnRestrepo
-- Create date: 12-10-2016
-- Description:	Actualizar del Riesgo Asociado Operativo
-- =============================================
CREATE PROCEDURE [Parametrizacion].[spRIESGOSActualizarRiesgoAsociadoOperativo] 
	-- Parametros de entrada
	@NombreRiesgoAsociadoOperativo nvarchar(200),
	@IdTipoEventoOperativo numeric(18)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE Parametrizacion.RiesgoAsociadoOperativo SET NombreRiesgoAsociadoOperativo = @NombreRiesgoAsociadoOperativo 
	WHERE (IdRiesgoAsociadoOperativo = @IdTipoEventoOperativo)
END

GO
/****** Object:  StoredProcedure [Parametrizacion].[spRIESGOSActualizarTipoEventoOperativo]    Script Date: 14/10/2016 11:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JohnRestrepo
-- Create date: 12-10-2016
-- Description:	Actualizar del Tipo Evento Operativo
-- =============================================
CREATE PROCEDURE [Parametrizacion].[spRIESGOSActualizarTipoEventoOperativo] 
	-- Parametros de entrada
	@NombreTipoEventoOperativo nvarchar(200),
	@IdTipoEventoOperativo numeric(18)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE Parametrizacion.TipoEventoOperativo SET NombreTipoEventoOperativo = @NombreTipoEventoOperativo
	WHERE (IdTipoEventoOperativo = @IdTipoEventoOperativo)
END

GO
/****** Object:  StoredProcedure [Parametrizacion].[spRIESGOSActualizarTipoPrueba]    Script Date: 14/10/2016 11:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JohnRestrepo
-- Create date: 12-10-2016
-- Description:	Actualizar registro de Tipo Prueba de Plan Evaluacion
-- =============================================
CREATE PROCEDURE [Parametrizacion].[spRIESGOSActualizarTipoPrueba]
	-- Parametros de Entrada
	@NombreTipoPruebaPlanEvaluacion nvarchar(200),
	@IdTipoPruebaPlanEvaluacion numeric(18)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    
	UPDATE Parametrizacion.TipoPruebaPlanEvaluacion SET NombreTipoPruebaPlanEvaluacion = @NombreTipoPruebaPlanEvaluacion
	WHERE 
	(IdTipoPruebaPlanEvaluacion = @IdTipoPruebaPlanEvaluacion)

END

GO
/****** Object:  StoredProcedure [Parametrizacion].[spRIESGOSActualizarTipoRecursoPlanEvaluacion]    Script Date: 14/10/2016 11:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JohnRestrepo
-- Create date: 12-10-2016
-- Description:	Actualizar registro de Tipo Recurso de Plan Evaluacion
-- =============================================
CREATE PROCEDURE [Parametrizacion].[spRIESGOSActualizarTipoRecursoPlanEvaluacion]
	-- Parametros de Entrada
	@NombreTipoRecursoPlanAccion nvarchar(200),
	@IdTipoRecursoPlanAccion numeric(18)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    
	UPDATE Parametrizacion.TipoRecursoPlanAccion SET NombreTipoRecursoPlanAccion = @NombreTipoRecursoPlanAccion
	WHERE (IdTipoRecursoPlanAccion = @IdTipoRecursoPlanAccion)

END

GO
/****** Object:  StoredProcedure [Parametrizacion].[spRIESGOSActualizarTipoRiesgoOperativo]    Script Date: 14/10/2016 11:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JohnRestrepo
-- Create date: 13-10-2016
-- Description:	Actualizar del Tipo Riesgo Operativo
-- =============================================
CREATE PROCEDURE [Parametrizacion].[spRIESGOSActualizarTipoRiesgoOperativo] 
	-- Parametros de entrada
	@NombreFactorRiesgoOperativo nvarchar(200),
	@IdFactorRiesgoOperativo numeric(18),
	@IdTipoRiesgoOperativo numeric(18)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE Parametrizacion.TipoRiesgoOperativo SET IdFactorRiesgoOperativo = @IdFactorRiesgoOperativo,
	NombreTipoRiesgoOperativo = @NombreFactorRiesgoOperativo 
	WHERE (IdTipoRiesgoOperativo = @IdTipoRiesgoOperativo)
END

GO
/****** Object:  StoredProcedure [Parametrizacion].[spRIESGOSInsertaCalificacionRiesgo]    Script Date: 14/10/2016 11:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JohnRestrepo
-- Create date: 13-10-2016
-- Description:	Insercion del Calificacion Riesgo
-- =============================================
CREATE PROCEDURE [Parametrizacion].[spRIESGOSInsertaCalificacionRiesgo]
	-- Parametros de entrada
	@NombreClasificacionRiesgo nvarchar(200),
	@IdUsuario numeric(18),
	@FechaRegistro datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO Parametrizacion.ClasificacionRiesgo (NombreClasificacionRiesgo, IdUsuario, FechaRegistro) 
	VALUES (@NombreClasificacionRiesgo, @IdUsuario, @FechaRegistro)

END

GO
/****** Object:  StoredProcedure [Parametrizacion].[spRIESGOSInsertaCalificacionRiesgoGeneral]    Script Date: 14/10/2016 11:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JohnRestrepo
-- Create date: 13-10-2016
-- Description:	Insercion del Calificacion Riesgo General
-- =============================================
CREATE PROCEDURE [Parametrizacion].[spRIESGOSInsertaCalificacionRiesgoGeneral]
	-- Parametros de entrada
	@IdClasificacionRiesgo numeric(18),
	@NombreClasificacionGeneralRiesgo nvarchar(200),
	@IdUsuario numeric(18),
	@FechaRegistro datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO Parametrizacion.ClasificacionGeneralRiesgo (IdClasificacionRiesgo, NombreClasificacionGeneralRiesgo, 
	IdUsuario, FechaRegistro) 
	VALUES (@IdClasificacionRiesgo, @NombreClasificacionGeneralRiesgo, @IdUsuario, @FechaRegistro)

END

GO
/****** Object:  StoredProcedure [Parametrizacion].[spRIESGOSInsertaCalificacionRiesgoParticular]    Script Date: 14/10/2016 11:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JohnRestrepo
-- Create date: 13-10-2016
-- Description:	Insercion del Calificacion Riesgo Particular
-- =============================================
CREATE PROCEDURE [Parametrizacion].[spRIESGOSInsertaCalificacionRiesgoParticular]
	-- Parametros de entrada
	@IdClasificacionRiesgo numeric(18),
	@NombreClasificacionParticularRiesgo nvarchar(200),
	@IdUsuario numeric(18),
	@FechaRegistro datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO Parametrizacion.ClasificacionParticularRiesgo (IdClasificacionGeneralRiesgo, NombreClasificacionParticularRiesgo, 
	IdUsuario, FechaRegistro) 
	VALUES (@IdClasificacionRiesgo, @NombreClasificacionParticularRiesgo, @IdUsuario, @FechaRegistro)

END

GO
/****** Object:  StoredProcedure [Parametrizacion].[spRIESGOSInsertaCausas]    Script Date: 14/10/2016 11:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JohnRestrepo
-- Create date: 12-10-2016
-- Description:	Ingresar registro de las Causas
-- =============================================
CREATE PROCEDURE [Parametrizacion].[spRIESGOSInsertaCausas]
	-- Parametros de Entrada
	@NombreCausas nvarchar(200)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO Parametrizacion.Causas (NombreCausas) VALUES (@NombreCausas)

END

GO
/****** Object:  StoredProcedure [Parametrizacion].[spRIESGOSInsertaConsecuencias]    Script Date: 14/10/2016 11:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JohnRestrepo
-- Create date: 12-10-2016
-- Description:	Ingresar registro de las Consecuencias
-- =============================================
CREATE PROCEDURE [Parametrizacion].[spRIESGOSInsertaConsecuencias]
	-- Parametros de Entrada
	@NombreConsecuencia nvarchar(200)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO Parametrizacion.Consecuencia (NombreConsecuencia) 
	VALUES (@NombreConsecuencia)

END

GO
/****** Object:  StoredProcedure [Parametrizacion].[spRIESGOSInsertaEstadoLegislacion]    Script Date: 14/10/2016 11:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JohnRestrepo
-- Create date: 11-10-2016
-- Description:	Ingresar registro de Estado Legislacion
-- =============================================
CREATE PROCEDURE [Parametrizacion].[spRIESGOSInsertaEstadoLegislacion]
	-- Parametros de Entrada
	@NombreEstadoLegislacion nvarchar(200)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO Parametrizacion.EstadoLegislacion (NombreEstadoLegislacion) 
	VALUES (@NombreEstadoLegislacion)

END

GO
/****** Object:  StoredProcedure [Parametrizacion].[spRIESGOSInsertaEstadoPlanAccion]    Script Date: 14/10/2016 11:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JohnRestrepo
-- Create date: 12-10-2016
-- Description:	Ingresar registro de Estado del Plan Accion
-- =============================================
CREATE PROCEDURE [Parametrizacion].[spRIESGOSInsertaEstadoPlanAccion]
	-- Parametros de Entrada
	@NombreEstadoPlanAccion nvarchar(200)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO Parametrizacion.EstadoPlanAccion (NombreEstadoPlanAccion) 
	VALUES (@NombreEstadoPlanAccion)

END

GO
/****** Object:  StoredProcedure [Parametrizacion].[spRIESGOSInsertaEstadoPlanEvaluacion]    Script Date: 14/10/2016 11:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JohnRestrepo
-- Create date: 12-10-2016
-- Description:	Ingresar registro de Estado del Plan Evaluacion
-- =============================================
CREATE PROCEDURE [Parametrizacion].[spRIESGOSInsertaEstadoPlanEvaluacion]
	-- Parametros de Entrada
	@NombreEstadoPlanEvaluacion nvarchar(200)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO Parametrizacion.EstadoPlanEvaluacion (NombreEstadoPlanEvaluacion) 
	VALUES 
	(@NombreEstadoPlanEvaluacion)

END

GO
/****** Object:  StoredProcedure [Parametrizacion].[spRIESGOSInsertaFactorRiesgoLaft]    Script Date: 14/10/2016 11:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JohnRestrepo
-- Create date: 13-10-2016
-- Description:	Insercion del Factor Riesgo Laft
-- =============================================
CREATE PROCEDURE [Parametrizacion].[spRIESGOSInsertaFactorRiesgoLaft] 
	-- Parametros de entrada
	@NombreFactorRiesgoLAFT nvarchar(200)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO Parametrizacion.FactorRiesgoLAFT (NombreFactorRiesgoLAFT) 
	VALUES (@NombreFactorRiesgoLAFT)

END

GO
/****** Object:  StoredProcedure [Parametrizacion].[spRIESGOSInsertaFactorRiesgoOperativo]    Script Date: 14/10/2016 11:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JohnRestrepo
-- Create date: 13-10-2016
-- Description:	Insercion del Factor de Riesgo Operativo
-- =============================================
CREATE PROCEDURE [Parametrizacion].[spRIESGOSInsertaFactorRiesgoOperativo] 
	-- Parametros de entrada
	@NombreFactorRiesgoOperativo nvarchar(200)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO Parametrizacion.FactorRiesgoOperativo (NombreFactorRiesgoOperativo) 
	VALUES (@NombreFactorRiesgoOperativo)

END

GO
/****** Object:  StoredProcedure [Parametrizacion].[spRIESGOSInsertaRiesgoAsociadoLaft]    Script Date: 14/10/2016 11:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JohnRestrepo
-- Create date: 13-10-2016
-- Description:	Insercion del Riesgo Asociado Laft
-- =============================================
CREATE PROCEDURE [Parametrizacion].[spRIESGOSInsertaRiesgoAsociadoLaft] 
	-- Parametros de entrada
	@NombreRiesgoAsociadoLA nvarchar(200)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO Parametrizacion.RiesgoAsociadoLA (NombreRiesgoAsociadoLA) 
	VALUES (@NombreRiesgoAsociadoLA)

END

GO
/****** Object:  StoredProcedure [Parametrizacion].[spRIESGOSInsertaRiesgoAsociadoOperativo]    Script Date: 14/10/2016 11:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JohnRestrepo
-- Create date: 12-10-2016
-- Description:	Insercion del Riesgo Asociado Operativo
-- =============================================
CREATE PROCEDURE [Parametrizacion].[spRIESGOSInsertaRiesgoAsociadoOperativo] 
	-- Parametros de entrada
	@NombreRiesgoAsociadoOperativo nvarchar(200)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO Parametrizacion.RiesgoAsociadoOperativo (NombreRiesgoAsociadoOperativo) 
	VALUES (@NombreRiesgoAsociadoOperativo)

END

GO
/****** Object:  StoredProcedure [Parametrizacion].[spRIESGOSInsertaTipoEventoOperativo]    Script Date: 14/10/2016 11:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JohnRestrepo
-- Create date: 12-10-2016
-- Description:	Insercion del Tipo Evento Operativo
-- =============================================
CREATE PROCEDURE [Parametrizacion].[spRIESGOSInsertaTipoEventoOperativo] 
	-- Parametros de entrada
	@NombreTipoEventoOperativo nvarchar(200)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO Parametrizacion.TipoEventoOperativo (NombreTipoEventoOperativo) 
	VALUES (@NombreTipoEventoOperativo)

END

GO
/****** Object:  StoredProcedure [Parametrizacion].[spRIESGOSInsertaTipoPrueba]    Script Date: 14/10/2016 11:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JohnRestrepo
-- Create date: 12-10-2016
-- Description:	Ingresar registro de Tipo Prueba de Plan Evaluacion
-- =============================================
CREATE PROCEDURE [Parametrizacion].[spRIESGOSInsertaTipoPrueba]
	-- Parametros de Entrada
	@NombreTipoPruebaPlanEvaluacion nvarchar(200)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO Parametrizacion.TipoPruebaPlanEvaluacion (NombreTipoPruebaPlanEvaluacion) 
	VALUES 
	(@NombreTipoPruebaPlanEvaluacion)

END

GO
/****** Object:  StoredProcedure [Parametrizacion].[spRIESGOSInsertaTipoRecursoPlanAccion]    Script Date: 14/10/2016 11:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JohnRestrepo
-- Create date: 12-10-2016
-- Description:	Ingresar registro de Tipo Recurso del Plan Evaluacion
-- =============================================
CREATE PROCEDURE [Parametrizacion].[spRIESGOSInsertaTipoRecursoPlanAccion]
	-- Parametros de Entrada
	@NombreTipoRecursoPlanAccion nvarchar(200)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO Parametrizacion.TipoRecursoPlanAccion (NombreTipoRecursoPlanAccion) 
	VALUES (@NombreTipoRecursoPlanAccion)

END

GO
/****** Object:  StoredProcedure [Parametrizacion].[spRIESGOSInsertaTipoRiesgoOperativo]    Script Date: 14/10/2016 11:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JohnRestrepo
-- Create date: 13-10-2016
-- Description:	Insercion del Tipo Riesgo Operativo
-- =============================================
CREATE PROCEDURE [Parametrizacion].[spRIESGOSInsertaTipoRiesgoOperativo] 
	-- Parametros de entrada
	@NombreTipoRiesgoOperativo nvarchar(200),
	@IdFactorRiesgoOperativo numeric(18)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO Parametrizacion.TipoRiesgoOperativo (IdFactorRiesgoOperativo, NombreTipoRiesgoOperativo) 
	VALUES (@IdFactorRiesgoOperativo, @NombreTipoRiesgoOperativo)

END

GO
/****** Object:  StoredProcedure [Parametrizacion].[spRIESGOSPorcentajeCalicarControl]    Script Date: 14/10/2016 11:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JohnRestrepo
-- Create date: 11-10-2016
-- Description:	Actualizacion PorcentajeCalificarControl
-- =============================================
CREATE PROCEDURE [Parametrizacion].[spRIESGOSPorcentajeCalicarControl] 
	-- Parametrizacion de Entrada
	@ValorPorcentajeCalificarControl1 numeric(18),
	@ValorPorcentajeCalificarControl2 numeric(18),
	@ValorPorcentajeCalificarControl3 numeric(18),
	@ValorPorcentajeCalificarControl4 numeric(18),
	@ValorPorcentajeCalificarControl5 numeric(18)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE Parametrizacion.PorcentajeCalificarControl SET ValorPorcentajeCalificarControl = @ValorPorcentajeCalificarControl1 WHERE (IdPorcentajeCalificarControl = 1)
    UPDATE Parametrizacion.PorcentajeCalificarControl SET ValorPorcentajeCalificarControl = @ValorPorcentajeCalificarControl2 WHERE (IdPorcentajeCalificarControl = 2)
    UPDATE Parametrizacion.PorcentajeCalificarControl SET ValorPorcentajeCalificarControl = @ValorPorcentajeCalificarControl3 WHERE (IdPorcentajeCalificarControl = 3)
    UPDATE Parametrizacion.PorcentajeCalificarControl SET ValorPorcentajeCalificarControl = @ValorPorcentajeCalificarControl4 WHERE (IdPorcentajeCalificarControl = 4)
    UPDATE Parametrizacion.PorcentajeCalificarControl SET ValorPorcentajeCalificarControl = @ValorPorcentajeCalificarControl5 WHERE (IdPorcentajeCalificarControl = 5)
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JohnRestrepo
-- Create date: 11-10-2016
-- Description:	Actualizar registro de Tipo Legislacion
-- =============================================
CREATE PROCEDURE [Riesgos].[spRIESGOSActualizarTipoLegislacion]
	-- Parametros de Entrada
	@NombreTipoLegislacion nvarchar(200),
	@IdTipoLegislacion numeric(18)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE Riesgos.TipoLegislacion SET NombreTipoLegislacion = @NombreTipoLegislacion
	WHERE (IdTipoLegislacion = @IdTipoLegislacion)

END

GO
/****** Object:  StoredProcedure [Riesgos].[spRIESGOSInsercionTipoLegislacion]    Script Date: 18/10/2016 9:02:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JohnRestrepo
-- Create date: 11-10-2016
-- Description:	Registro de Tipo Legislacion
-- =============================================
CREATE PROCEDURE [Riesgos].[spRIESGOSInsercionTipoLegislacion]
	-- Parametros de Entrada
	@NombreTipoLegislacion nvarchar(200)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO Riesgos.TipoLegislacion (NombreTipoLegislacion) VALUES (@NombreTipoLegislacion)
END

GO
