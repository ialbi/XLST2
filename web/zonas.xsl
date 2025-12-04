<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8" indent="yes"/>
  <xsl:variable name="limite" select="1000"/>
  <xsl:template match="/jardinBotanico">
    <html lang="es">
      <head>
        <meta charset="utf-8"/>
        <title>Zonas del Jardín Botánico</title>
        <link href="../css/estilo.css" rel="stylesheet" type="text/css"/>
      </head>
      <body>
        <header>
          <img src="../img/logotipo.png" alt="Reservas"/>
          <a href="jardinbotanico_zonas.xml">Zonas</a>
          <a href="jardinbotanico_plantas.xml">Plantas</a>
          <a href="jardinbotanico_actividades.xml">Actividades</a>
        </header>
        <main>
          <h1>ZONAS</h1>
          <table>
            <tr><th>ZONA</th><th>Ubicación</th><th>Horario</th></tr>
            <xsl:apply-templates select="zonas/zona[number(translate(horarioapertura, ':', '')) &lt;= $limite]"/>
          </table>
        </main>
        <footer>
          <address>&#169; Desarrollado por info@birt.eus</address>
        </footer>
      </body>
    </html>
  </xsl:template>
  <xsl:template match="zona">
    <tr>
      <td><xsl:value-of select="nombre"/></td>
      <td>
        <xsl:choose>
          <xsl:when test="contains(ubicacion,'Exterior')">
            <span class="azul"><xsl:value-of select="ubicacion"/></span>
          </xsl:when>
          <xsl:otherwise><xsl:value-of select="ubicacion"/></xsl:otherwise>
        </xsl:choose>
      </td>
      <td><xsl:value-of select="concat(horarioapertura,' - ',horariocierre)"/></td>
    </tr>
  </xsl:template>
</xsl:stylesheet>
