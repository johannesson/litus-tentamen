using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Security;

/// <summary>
/// Globala variabler för webbplatsen
/// </summary>
public static class Global
{
    /// <summary>
    /// ConnectionString till databasen
    /// </summary>
    public static string db = WebConfigurationManager.ConnectionStrings["tentamendb"].ConnectionString;

}