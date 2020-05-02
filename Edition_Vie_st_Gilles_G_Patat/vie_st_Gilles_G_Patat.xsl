<?xml version="1.0" encoding="UTF-8"?>
<!-- Espaces de noms propres à l'xsl, à la tei et à l'xpath ; exclusion des préfixes tei des résultats. -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs tei"
    version="2.0">

    <!-- Paramétrage de la sortie au format html. -->
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>

    <!-- Pour éviter les espaces non voulus. -->
    <xsl:strip-space elements="*"/>

    <!-- Configuation des sorties dans les règles XSL -->

    <!-- Récupération du nom et du chemin du fichier courant -->
    <xsl:template match="/">
        <xsl:variable name="fichier_courant">
            <xsl:value-of select="replace(base-uri(.), '.xml', '')"/>
        </xsl:variable>
        <!-- Création du nom et du chemin de fichier pour la page html relative à la transcription allographétique. -->
        <xsl:variable name="pathAllo">
            <xsl:value-of select="concat($fichier_courant, 'allograph', '.html')"/>
        </xsl:variable>
        <!-- Création du nom et du chemin de fichier pour la page html relative à la transcription normalisée. -->
        <xsl:variable name="pathNorm">
            <xsl:value-of select="concat($fichier_courant, 'norm', '.html')"/>
        </xsl:variable>
        <!-- Création du nom et du chemin de fichier pour la page html relative à l'index des lieux et des personnages. -->
        <xsl:variable name="pathIndex">
            <xsl:value-of select="concat($fichier_courant, 'index', '.html')"/>
        </xsl:variable>
        <!-- Création du nom et du chemin de fichier pour la page d'accueil en html. -->
        <xsl:variable name="pathAccueil">
            <xsl:value-of select="concat($fichier_courant, 'accueil', '.html')"/>
        </xsl:variable>

        <!-- Création d'un pied de page -->
        <xsl:variable name="footer">
            <footer class="page-footer font-small lighten-3 pt-4 text-white bg-dark">
                <div>
                    <div class="global-footer">
                        <div class="text-footer">
                            <p class="credit-footer" style="text-align:center;">Édition électronique
                                créée en 2020 dans le cadre du <a
                                    href="http://www.chartes.psl.eu/fr/cursus/master-technologies-numeriques-appliquees-histoire"
                                    target="_blank">Master &#171; Technologies numériques appliquées
                                    à l'histoire &#187;</a> de l'École nationale des Chartes.</p>
                            <p class="credit-footer" style="text-align:center;">© Gwenaëlle
                                Patat</p>
                        </div>
                        <div class="box-img-footer" style="text-align:center;">
                            <a href="http://www.chartes.psl.eu/" target="_blank">
                                <img
                                    src="http://www.chartes.psl.eu/sites/all/themes/enc_base/images/public/logo-ecole-nationale-des-chartes-header.png"
                                    class="img-fluid" alt="150" width="150"/>
                            </a>
                        </div>
                    </div>
                </div>
            </footer>
        </xsl:variable>

        <!-- Ossature du fichier en html pour la page d'accueil. -->
        <xsl:result-document href="{$pathAccueil}" method="html" indent="yes">
            <html>
                <!-- Définition des métadonnées du fichier html. -->
                <head>
                    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                    <link rel="stylesheet" type="text/css" href="bootstrap.css"/>
                    <title>
                        <xsl:value-of select="//titleStmt/title"/>
                    </title>
                </head>
                <body>
                    <!-- Récupération du titre de l'extrait ici encodé et liens vers les autres pages générées. -->
                    <h1 style="text-align:center;"><xsl:value-of select="//msItemStruct/title"/>,
                        f.171a-171c</h1>
                    <ul>
                        <li>
                            <a href="{$pathIndex}">Index des lieux et des personnages</a>
                        </li>
                        <li>
                            <a href="{$pathAllo}">Transcription allographétique</a>
                        </li>
                        <li>
                            <a href="{$pathNorm}">Transcription normalisée</a>
                        </li>
                    </ul>
                    <!-- Récupération des informations dans le <teiHeader>, soit les métadonnées relatives au texte ici encodé. -->
                    <div class="col-sm-8">
                        <h2 style="color:#800080;">Informations générales sur le manuscrit</h2>
                        <ul>
                            <li><span style="color:#788382;">Titre</span> : <xsl:value-of
                                    select="//titleStmt/title/text()"/></li>
                            <li><span style="color:#788382;">Auteur</span> : <xsl:value-of
                                    select="//msItemStruct/author/text()"/></li>
                            <li><span style="color:#788382;">Lieu de conservation</span> :
                                    <xsl:value-of select="//msIdentifier/repository/text()"/></li>
                            <li><span style="color:#788382;">Cote du manuscrit</span> :
                                    <xsl:value-of select="//msIdentifier/idno/text()"/></li>
                            <li><span style="color:#788382;">Langue</span> : <xsl:value-of
                                    select="//msItemStruct/textLang/text()"/></li>
                            <li><span style="color:#788382;">Date</span> : <xsl:value-of
                                    select="//creation/date/text()"/></li>
                            <li><span style="color:#788382;">Incipit</span> : <xsl:value-of
                                    select="//msItemStruct/incipit/text()"/></li>
                            <li><span style="color:#788382;">Explicit</span> : <xsl:value-of
                                    select="//msItemStruct/explicit/text()"/></li>
                        </ul>
                    </div>
                    <div class="col-sm-8">
                        <h2 style="color:#800080;">Description du manuscrit</h2>
                        <ul>
                            <li><span style="color:#788382;">Support</span> : <xsl:value-of
                                    select="//supportDesc/support/text()"/></li>
                            <li><span style="color:#788382;">Dimensions</span> : <xsl:value-of
                                    select="//supportDesc/extent/width/text()"
                                    /><xsl:text>mm x </xsl:text><xsl:value-of
                                    select="//supportDesc/extent/height/text()"
                                /><xsl:text>mm</xsl:text></li>
                            <li><span style="color:#788382;">Organisation du volume</span> :
                                    <xsl:value-of select="//supportDesc/foliation/text()"/></li>
                            <li><span style="color:#788382;">Mise en page</span> :
                                    <xsl:text>Deux colonnes de 40 lignes par folio. </xsl:text><xsl:value-of
                                    select="//layoutDesc/layout/p/text()"/></li>
                            <li><span style="color:#788382;">Écriture</span> : <xsl:value-of
                                    select="//scriptDesc/scriptNote/text()"/></li>
                            <li><span style="color:#788382;">Décoration</span> : <xsl:value-of
                                    select="//decoDesc/decoNote/text()"/></li>
                        </ul>
                    </div>
                    <span>
                        <!-- Liens vers les folios numérisés sur gallica ainsi que la notice du manuscrit produite par l'IRHT. -->
                        <ul>
                            <li>
                                <a href="{//body//pb[@n='171a']/@facs}">lien vers le folio
                                    n°171a</a>
                            </li>
                            <li>
                                <a href="{//body//pb[@n='171c']/@facs}">lien vers le folio
                                    n°171c</a>
                            </li>
                            <li>
                                <a href="{//listBibl//bibl/title[@type='online']/@facs}">lien vers
                                    la notice de l'IRHT</a>
                            </li>
                        </ul>
                    </span>
                    <div>
                        <xsl:copy-of select="$footer"/>
                    </div>
                </body>
            </html>
        </xsl:result-document>

        <!-- Ossature du fichier en html pour la page de la transcription normalisée. -->
        <xsl:result-document href="{$pathNorm}" method="html" indent="yes">
            <html>
                <!-- Définition des métadonnées du fichier html. -->
                <head>
                    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                    <link rel="stylesheet" type="text/css" href="bootstrap.css"/>
                    <title>
                        <xsl:value-of select="//titleStmt/title"/>
                    </title>
                </head>
                <body>
                    <!-- Récupération du titre de l'extrait ici encodé. -->
                    <h1 style="text-align:center;"><xsl:value-of select="//msItemStruct/title"/>,
                        f.171a-171c</h1>
                    <h2 style="color:#800080;">Transcription normalisée</h2>
                    <!-- Récupération du texte normalisé dont les @type ont pour valeur "reg". -->
                    <div>
                        <ul>
                            <xsl:apply-templates select="//text//div" mode="reg"/>
                        </ul>
                    </div>
                    <span>
                        <!-- Liens vers les folios numérisés sur gallica et vers la page d'accueil générée. -->
                        <ul>
                            <li>
                                <a href="{//body//pb[@n='171a']/@facs}">lien vers le folio
                                    n°171a</a>
                            </li>
                            <li>
                                <a href="{//body//pb[@n='171c']/@facs}">lien vers le folio
                                    n°171c</a>
                            </li>
                            <li>
                                <a href="{$pathAccueil}">Retour accueil</a>
                            </li>
                        </ul>
                    </span>
                </body>
                <div>
                    <xsl:copy-of select="$footer"/>
                </div>
            </html>
        </xsl:result-document>

        <!-- Ossature du fichier en html pour la page de la transcription allographétique. -->
        <xsl:result-document href="{$pathAllo}" method="html" indent="yes">
            <html>
                <!-- Définition des métadonnées du fichier html. -->
                <head>
                    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                    <link rel="stylesheet" type="text/css" href="bootstrap.css"/>
                    <title>
                        <xsl:value-of select="//titleStmt/title"/>
                    </title>
                </head>
                <body>
                    <!-- Récupération du titre de l'extrait ici encodé. -->
                    <h1 style="text-align:center;"><xsl:value-of select="//msItemStruct/title"/>,
                        f.171a-171c</h1>
                    <h2 style="color:#800080;">Transcription facsimilaire</h2>
                    <!-- Récupération du texte original dont les @type ont pour valeur "orig". -->
                    <div>
                        <ul>
                            <xsl:apply-templates select="//text//div" mode="orig"/>
                        </ul>
                        <!-- Répertoire des noms indéxés pour faire un renvoie vers la page d'index. -->
                        <ul>
                            <a href="{$pathIndex}" style="color:#788382;">
                                <xsl:call-template name="renvoie_index"/>
                            </a>
                        </ul>
                        <span>
                            <ul>
                                <!-- Liens vers les folios numérisés sur gallica et vers la page d'accueil générée. -->
                                <li>
                                    <a href="{//body//pb[@n='171a']/@facs}">lien vers le folio
                                        n°171a</a>
                                </li>
                                <li>
                                    <a href="{//body//pb[@n='171c']/@facs}">lien vers le folio
                                        n°171c</a>
                                </li>
                                <li>
                                    <a href="{$pathAccueil}">Retour accueil</a>
                                </li>
                            </ul>
                        </span>
                    </div>
                </body>
                <div>
                    <xsl:copy-of select="$footer"/>
                </div>
            </html>
        </xsl:result-document>

        <!-- Ossature du fichier en html pour la page d'index. -->
        <xsl:result-document href="{$pathIndex}" method="html" indent="yes">
            <html>
                <!-- Définition des métadonnées du fichier html. -->
                <head>
                    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                    <link rel="stylesheet" type="text/css" href="bootstrap.css"/>
                    <title>
                        <xsl:value-of select="//titleStmt/title"/>
                    </title>
                </head>
                <body>
                    <!-- Récupération du titre de l'extrait ici encodé. -->
                    <h1 style="text-align:center;"><xsl:value-of select="//msItemStruct/title"/>,
                        f.171a-171c</h1>
                    <h2 style="color:#800080;">Index des lieux et des personnages</h2>
                    <div>
                        <!-- Appel des règles définies pour lister les noms de lieux et de personnages dans la transcription du texte orignal. -->
                        <h3 style="color:#788382;">Lieux :</h3>
                        <ul>
                            <xsl:apply-templates select=".//listPlace"/>
                        </ul>
                        <h3 style="color:#788382;">Personnages :</h3>
                        <ul>
                            <xsl:apply-templates select=".//listPerson"/>
                        </ul>
                    </div>
                    <span>
                        <!-- Liens vers les folios numérisés sur gallica et lien vers la page d'accueil générée. -->
                        <ul>
                            <li>
                                <a href="{//body//pb[@n='171a']/@facs}">lien vers le folio
                                    n°171a</a>
                            </li>
                            <li>
                                <a href="{//body//pb[@n='171c']/@facs}">lien vers le folio
                                    n°171c</a>
                            </li>
                            <li>
                                <a href="{$pathAccueil}">Retour accueil</a>
                            </li>
                        </ul>
                    </span>
                </body>
                <div>
                    <xsl:copy-of select="$footer"/>
                </div>
            </html>
        </xsl:result-document>
    </xsl:template>

    <!-- Règles de récupération des éléments, attributs et valeurs selon les sorties souhaitées dans les fichiers html. -->

    <!-- Restitution des paragraphes -->
    <xsl:template match="p" mode="#all">
        <xsl:element name="p">
            <xsl:apply-templates mode="#current"/>
        </xsl:element>
    </xsl:template>

    <!-- Restitution des sauts de ligne et comptage des lignes. -->
    <xsl:template match="lb" mode="#all">
        <xsl:element name="br">
            <xsl:attribute name="n">
                <xsl:number count="lb" format="1" level="any"/>
            </xsl:attribute>
            <xsl:apply-templates mode="#current"/>
        </xsl:element>
    </xsl:template>

    <!-- Récupération de l'espace laissé vide pour une lettrine, et restitution de l'hypothèse formulée. -->
    <xsl:template match="supplied" mode="#all">
        <xsl:value-of select="./text()"/>
    </xsl:template>

    <!-- Récupération de la ponctuation originale pour la transcription allographétique. -->
    <xsl:template match="pc" mode="orig">
        <xsl:if test="@type = 'orig'">
            <xsl:value-of select="./text()"/>
        </xsl:if>
    </xsl:template>

    <!-- Récupération de la ponctuation régularisée pour la transcription normalisée. -->
    <xsl:template match="pc" mode="reg">
        <xsl:if test="@type = 'reg'">
            <xsl:value-of select="./text()"/>
        </xsl:if>
    </xsl:template>

    <!-- Récupération du texte original pour la transcription allographétique. -->
    <xsl:template match="choice" mode="orig">
        <xsl:value-of
            select="
                .//orig/text() |
                .//abbr/text() | .//hi/text()"
        />
    </xsl:template>

    <!-- Récupération du texte régularisé pour la transcription normalisée. -->
    <xsl:template match="choice" mode="reg">
        <xsl:value-of select="
                .//reg/text() |
                .//expan//text()"/>
    </xsl:template>

    <!-- Index des lieux -->
    <xsl:template match="place">
        <xsl:variable name="idPlace">
            <xsl:value-of select="@xml:id"/>
        </xsl:variable>
        <!-- Condition qui permet de récupérer dans l'index l'indication de lieu la plus précise possible si elle est indiquée. -->
        <li>
            <xsl:choose>
                <xsl:when test="./placeName/settlement">
                    <xsl:value-of select="concat(./placeName/settlement, ' : ')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="concat(./placeName, ' : ')"/>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:for-each select="ancestor::TEI//body//placeName[replace(@ref, '#', '') = $idPlace]">
                <xsl:value-of
                    select="
                        text() |
                        .//orig/text() |
                        .//expan/text()"/>
                <!-- L'index indique la ligne et le paragraphe où se trouve le mot recherché. -->
                <xsl:text> (l.</xsl:text>
                <xsl:value-of select="count(preceding-sibling::lb) + 1"/>
                <xsl:text>, § </xsl:text>
                <xsl:value-of select="count(parent::p/preceding-sibling::p) + 1"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">, </xsl:if>
                <xsl:if test="position() = last()">.</xsl:if>
            </xsl:for-each>
        </li>
    </xsl:template>

    <!-- Index des Personnes -->
    <xsl:template match="person">
        <xsl:variable name="idPerson">
            <xsl:value-of select="@xml:id"/>
        </xsl:variable>
        <!-- Condition qui permet de récupérer dans l'index le maximum d'indications sur les personnages repertoriés, principalement ici dans le cas de saint Gilles. . -->
        <li>
            <xsl:choose>
                <xsl:when
                    test="./persName/forename/following-sibling::roleName/following-sibling::addName">
                    <xsl:value-of
                        select="concat(./persName/roleName, ' ', ./persName/forename, ' ', ./persName/addName, ' : ')"
                    />
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="concat(./persName, ' : ')"/>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:for-each select="ancestor::TEI//body//persName[replace(@ref, '#', '') = $idPerson]">
                <xsl:value-of
                    select="
                        text() |
                        .//orig/text() |
                        .//expan/text()"/>
                <!-- L'index indique la ligne et le paragraphe où se trouve le mot recherché. -->
                <xsl:text> (l.</xsl:text>
                <xsl:value-of select="count(preceding-sibling::lb) + 1"/>
                <xsl:text>, § </xsl:text>
                <xsl:value-of select="count(parent::p/preceding-sibling::p) + 1"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">, </xsl:if>
                <xsl:if test="position() = last()">.</xsl:if>
            </xsl:for-each>
            <!-- Condition qui permet de mettre un lien, s'il existe, vers une page d'information relative au mot indexé. -->
            <xsl:if test="./persName[@ref]">
                <a href="{./persName/@ref}">
                    <xsl:text> Lien vers Wikipédia.</xsl:text>
                </a>
            </xsl:if>
        </li>
    </xsl:template>

    <!-- Récupération dans la transcription facsimilaire des lieux et des personnages qui sont indexés. -->
    <xsl:template name="renvoie_index">
        <xsl:for-each select="//body//p/placeName">
            <xsl:element name="li">
                <xsl:value-of
                    select="
                        text() |
                        .//orig/text() |
                        .//expan/text()"/>
                <xsl:if test="position() != last()">
                    <br/>
                </xsl:if>
                <xsl:if test="position() = last()"/>
            </xsl:element>
        </xsl:for-each>
        <xsl:for-each select="//body//p/persName">
            <xsl:element name="li">
                <xsl:value-of
                    select="
                        text() |
                        .//orig/text() |
                        .//expan/text()"/>
                <xsl:if test="position() != last()">
                    <br/>
                </xsl:if>
                <xsl:if test="position() = last()"/>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
