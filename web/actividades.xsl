<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" encoding="UTF-8" indent="yes"/>

  <!-- Mes a mostrar: '11' = noviembre -->
  <xsl:variable name="mes" select="'11'"/>

  <!-- Raíz del XML -->
  <xsl:template match="/jardinBotanico">
    <html lang="es">
      <head>
        <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
        <meta charset="utf-8"/>
        <meta name="description" content="Página principal" />
        <title>titulo de la web</title>
      </head>

      <body>
        <header>
          <img src="../img/logotipo.png" alt="Reservas" />
           <a href="jardinbotanico_zonas.xml">Zonas</a>
          <a href="jardinbotanico_plantas.xml">Plantas</a>
          <a href="jardinbotanico_actividades.xml">Actividades</a>
        </header>

        <main>
          <h1>
            Actividades del mes <xsl:value-of select="$mes"/>
          </h1>

          <!-- Solo actividades del mes almacenado en $mes, ordenadas por fechaHora -->
          <xsl:apply-templates
            select="actividades/actividad[substring(fechaHora,6,2) = $mes]">
            <xsl:sort select="fechaHora"/>
          </xsl:apply-templates>
        </main>

        <footer>
          <address>&#169; Desarrollado por info@birt.eus</address>
        </footer>
      </body>
    </html>
  </xsl:template>

  <!-- Cómo mostrar cada actividad -->
  <xsl:template match="actividad">
    <!-- nº responsables -->
    <xsl:variable name="numResp"
                  select="count(responsables/responsable)"/>

    <article class="actividades">
      <!-- h4: Titulo - N Responsable(s) -->
      <h4>
        <xsl:value-of select="titulo"/>
        <xsl:text> - </xsl:text>
        <xsl:value-of select="$numResp"/>
        <xsl:text> </xsl:text>
        <xsl:choose>
          <xsl:when test="$numResp = 1">Responsable</xsl:when>
          <xsl:otherwise>Responsables</xsl:otherwise>
        </xsl:choose>
      </h4>

      <!-- Fecha: yyyy-mm-dd (de fechaHora tipo 2025-11-10T11:00:00) -->
      <h2>
        Fecha:
        <xsl:text> </xsl:text>
        <xsl:value-of select="substring(fechaHora,1,10)"/>
      </h2>

      <!-- Hora: hh:mm (de fechaHora) -->
      <h2>
        Hora:
        <xsl:text> </xsl:text>
        <xsl:value-of select="substring(fechaHora,12,5)"/>
      </h2>

      <!-- Lugar: @sala  -->
      <h2>
        Lugar:
        <xsl:text> </xsl:text>
        <xsl:value-of select="@sala"/>
      </h2>

      <!-- Lista de responsables: nombre - email -->
      <ul>
        <xsl:apply-templates select="responsables/responsable"/>
      </ul>
    </article>
  </xsl:template>

  <!-- Cómo mostrar cada responsable -->
  <xsl:template match="responsable">
    <li>
      <xsl:value-of select="nomresponsable"/>
      <xsl:text> - </xsl:text>
      <xsl:value-of select="email"/>
    </li>
  </xsl:template>

</xsl:stylesheet>
