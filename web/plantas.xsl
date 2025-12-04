<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" encoding="UTF-8" indent="yes"/>

  <!-- Raíz del XML: <jardinBotanico> -->
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

        <main id="jardinbotanico">
          <h1>PLANTAS</h1>

          <!-- Un <article> por cada planta del XML -->
          <xsl:apply-templates select="plantas/planta" />
        </main>

        <footer>
          <address>&#169; Desarrollado por info@birt.eus</address>
        </footer>
      </body>
    </html>
  </xsl:template>

  <!-- Cómo se pinta cada <planta> -->
  <xsl:template match="planta">
    <article class="articulo">
      <!-- Imagen principal de la planta -->
      <img class="imagen">
        <xsl:attribute name="src">
          <xsl:value-of select="concat('../img/', @foto)" />
        </xsl:attribute>
        <xsl:attribute name="alt">
          <xsl:value-of select="nombreComun" />
        </xsl:attribute>
      </img>

      <!-- Nombre común enlazado a Wikipedia por familia -->
      <h2>
        <a target="_blank">
          <xsl:attribute name="href">
            <!-- concat obligatorio: base + familia -->
            <xsl:value-of select="concat('https://es.wikipedia.org/wiki/', @familia)" />
          </xsl:attribute>
          <xsl:value-of select="nombreComun" />
        </a>
      </h2>

      <!-- Luminosidad, con icono Alta.png a la izquierda si es 'Alta' -->
      <h3>
        <xsl:if test="normalize-space(luminosidad) = 'Alta'">
          <img src="../img/Alta.png" class="alta-icono" />
        </xsl:if>
        <xsl:value-of select="luminosidad" />
      </h3>
    </article>
  </xsl:template>

</xsl:stylesheet>
