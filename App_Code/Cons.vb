Imports Microsoft.VisualBasic

Public Class Cons

    'Valores Reportes (cREP_Reportes)
    Public Const ModuloRea As Integer = 16
    Public Const SubModRecSin As Integer = 41
    Public Const RptFac As Integer = 3
    Public Const RptEsp As Integer = 4

    'Parametros (cPAR_Parametros)
    Public Const ParamRpt As Integer = 3
    Public Const ConsulFac As Integer = 5
    Public Const ConsulEsp As Integer = 6

    'Tipo Consulta
    Public Enum TipoMov
        Fac = 1
        Esp = 2
    End Enum

    'Acciones Filtros
    Public Enum Accion
        Consultar
        Guardar
    End Enum

    'Modulos Recordatorios
    Public Enum Recordatorio
        Siniestros = 61
    End Enum

End Class
