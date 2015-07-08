<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="tei" version="2.0">

    <xsl:output method="xml" indent="yes" omit-xml-declaration="no" encoding="UTF-8"/>

    <xsl:template match="/">
        <!-- pour déclaration DOCTYPE html 5 : -->
        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
        <html>
            <head>
                <title>
                    <xsl:value-of
                        select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title[@n='1']"/>
                </title>
                <meta charset="utf-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <!--feuilles de style-->  
                <link rel="stylesheet" href="../../STYLE/foundation/css/foundation.css" />
                <link rel="stylesheet" type="text/css" href="../../STYLE/personnalisation/style.css"/>    
                <script src="../../STYLE/foundation/js/vendor/modernizr.js">//</script>
                <script src="../../JS/js/jquery.js">//</script>
            </head>
            <body>
                <header class="row">                         
                    <img src="../../STYLE/images/header.jpg" alt="header"/>                                                                                            
                    <nav class="top-bar" data-topbar="yes" role="navigation">                    
                        <ul class="title-area">                        
                            <li class="name"><h1><a href="http://www.bdic.fr/">BDIC</a></h1></li>                            
                            <!-- Menu pour petits écrans -->                                                            
                            <li class="toggle-topbar menu-icon"><a href="#"><span>Menu</span></a></li>                                 
                        </ul>                        
                        <section class="top-bar-section">                        
                            <!-- Partie gauche du menu -->                            
                            <ul class="left">                            
                                <li><a href="../index.html">Accueil</a></li>                                    
                                <li class="has-dropdown">                                
                                    <a href="#">Correspondance d'Armand Horel</a>                                    
                                    <ul class="dropdown">                                    
                                        <li><a href="../projet/chronologie.html">Accès chronologique</a></li>                                        
                                        <li><a href="../projet/geographie.html">Accès géographique</a></li>                                        
                                    </ul>                                    
                                </li>                                
                            </ul>                            
                            <!-- Partie droite -->                            
                            <ul class="right">                            
                                <li class="has-dropdown">                                
                                    <a href="../projet/glossaire.html">Index et Glossaire</a>                                    
                                    <ul class="dropdown">                                    
                                        <li><a href="../projet/glossaire.html#personnes">Personnes</a></li>                                        
                                        <li><a href="../projet/glossaire.html#lieux">Lieux</a></li>                                        
                                        <li><a href="../projet/glossaire.html#glossaire">Glossaire</a></li>                                        
                                    </ul>                                    
                                </li>                                
                                <li><a href="#">A propos de l'édition</a></li>                                    
                            </ul>                              
                        </section>                        
                    </nav>                    
                </header>
                <div class="row corps">
                    <h1><xsl:apply-templates select="//tei:correspDesc"/></h1>
                    <hr/>
                </div>
                <div class="row corps">                    
                    <!-- Colonne de Gauche / "Context" -->
                    <div class="medium-2 large-2 columns" style="text-align:left;">                    
                        <h3 style="font-size:11pt;">Correspondance envoyée à partir de <xsl:apply-templates select="//tei:correspAction[@type='sent']/tei:placeName"/></h3>                        
                        <ul style="list-style:none; padding-left:0;">                        
                            <xsl:apply-templates select="//tei:ref[@type='context']" mode="lien"/>                            
                        </ul>                                                    
                    </div>                    
                    <!-- Colonne milieu -->
                        <!-- Liens next-previous -->
                    <div class="medium-7 large-7 columns">                                                            
                        <xsl:choose><!-- Permet de maintenir la superposition des blocs même  lorsque que la carte est la première ou la dernière -->                                   
                            <xsl:when test="//tei:ref[@type='previous'] and //tei:ref[@type='next']">                            
                                <div class="row">
                                    <div class="large-3 columns"><!-- alignement des blocs -->                                                                    
                                        <xsl:apply-templates select="//tei:ref[@type='previous']" mode="lien"/>                                                                    
                                    </div>                                                                
                                    <div class="large-3 columns next"><!-- alignement des blocs -->                                                                    
                                        <xsl:apply-templates select="//tei:ref[@type='next']" mode="lien"/>                                                                    
                                    </div>  
                                </div>                              
                            </xsl:when>                            
                            <xsl:otherwise>                            
                                <xsl:if test="//tei:ref[@type='previous']">                                
                                    <div class="col-lg-12"><!-- alignement des blocs -->                                    
                                        <xsl:apply-templates select="//tei:ref[@type='previous']" mode="lien"/>                                        
                                    </div>                                    
                                </xsl:if>                                                                            
                                <xsl:if test="//tei:ref[@type='next']">  <!-- alignement des blocs -->                   <!-- todo -->                                                       
                                    <div class="col-lg-3 col-lg-offset-9" style="text-align:right;">                                    
                                        <xsl:apply-templates select="//tei:ref[@type='next']" mode="lien"/>                                        
                                    </div>                                    
                                </xsl:if>                                
                            </xsl:otherwise>                           
                        </xsl:choose>
                            <!-- Corps de la lettre -->
                                <!-- adresse -->                                                                                                                                                                                                               
                        <xsl:choose>                                       
                            <xsl:when test="//tei:div[@type='enveloppe']">                                        
                                <div class="row">                                        
                                    <div class="large-10 large-centered columns adresse">                                        
                                        <xsl:apply-templates select="//tei:div[@type='enveloppe']"/>                                        
                                    </div>                                            
                                </div>                                       
                            </xsl:when>                                        
                            <xsl:when test="//tei:address[@place='postcard' and @type='addressee']">                            
                                <div class="row">                                
                                    <div class="large-10 large-centered columns adresse">
                                        <i>(destinataire) :</i>                                                                                                           
                                        <br/>                                                                                    
                                        <xsl:apply-templates select="(//tei:address[@type='addressee' and @place='postcard'])[1]" mode="affichage"/>
                                    </div>                                        
                                </div>                                
                            </xsl:when>
                            <xsl:when test="//tei:address[@place='back' and @type='addressee']">                            
                                <div class="row">                                
                                    <div class="large-10 large-centered columns adresse">
                                        <i>(destinataire) :</i>                                                                                                           
                                        <br/>                                                                                    
                                        <xsl:apply-templates select="(//tei:address[@type='addressee' and @place='back'])[1]" mode="affichage"/>
                                    </div>                                        
                                </div>                                
                            </xsl:when>                            
                            <xsl:otherwise/>                            
                        </xsl:choose>                                                                                                                             
                        <div class="row">                               
                            <div class="large-12">                            
                                <xsl:apply-templates select="//tei:div[@type='letter']"/>                                                                            
                                <xsl:apply-templates select="//tei:add[@type='closer']" mode="ordreLecture"/>
                                <xsl:apply-templates select="//tei:add[@type='postscript']" mode="ordreLecture"/>   <!-- todo note pour les add type postscript -->                             
                            </div>
                            </div><!-- ajouter xsl if note closer et / ou tei:back [@note] -->                            
                        <div class="row">                                                 
                            <dir class="large-12">                             
                                <hr/>                                                                                  
                                <xsl:apply-templates select="//tei:add[@type='closer']" mode="note"/>
                            </dir>                                           
                        </div>                       
                    </div>                                            
                    <div class="medium-3 large-3 columns" style="text-align:left;">                       
                        <xsl:apply-templates select="//tei:teiHeader" mode="aside"/>                      
                        <xsl:apply-templates select="//tei:pb" mode="affichage"/>                                                                                                            
                    </div>                                       
                </div>                                                                                        
                <!--Permettent aux listes de se dérouler automatiquement + menu adaptatif (doivent être placés en bas de page)-->    
                <script src="../../STYLE/foundation/js/vendor/jquery.js">//</script>
                <script src="../../STYLE/foundation/js/foundation.min.js">//</script>
                <script>$(document).foundation();</script>
            </body>
        </html>
    </xsl:template>
    <!--TEIHEADER-->
    <xsl:template match="tei:teiHeader">
        <xsl:apply-templates select="tei:fileDesc"/>
        <xsl:apply-templates select="tei:encodingDesc"/>
        <xsl:apply-templates select="tei:profileDesc"/>
    </xsl:template>
    <xsl:template match="tei:teiHeader" mode="aside">
        <b>
            <xsl:apply-templates select="//tei:title[1]"/>
        </b>
        <hr/>
        <xsl:text>cote : </xsl:text><xsl:apply-templates select="//tei:idno"/>
        <br/>
        <xsl:apply-templates select="//tei:repository"/>   
    </xsl:template>
    
    <xsl:template match="tei:fileDesc">
        <xsl:apply-templates select="tei:titleStmt"/>
        <xsl:apply-templates select="tei:publicationStmt"/>
    </xsl:template>
    
    <xsl:template match="tei:titleStmt">
        <xsl:apply-templates select="tei:title[1]"/>
    </xsl:template>
    
    <xsl:template match="tei:publicationStmt"/>
    
    <xsl:template match="tei:profileDesc">
        <xsl:apply-templates select="tei:correspDesc"/>        
    </xsl:template>
    
    <xsl:template match="tei:correspDesc">
        <xsl:for-each select="tei:correspAction[@type='sent']">
            <xsl:text>Correspondance envoyée par </xsl:text>
            <xsl:value-of select="tei:persName"/>
            <xsl:text> à partir de </xsl:text>
            <xsl:value-of select="tei:placeName"/>
            <xsl:text> le </xsl:text>
            <xsl:value-of select="tei:date"/>
        </xsl:for-each>
        <xsl:text> à </xsl:text>
        <xsl:for-each select="tei:correspAction[@type='received']">
            <xsl:value-of select="tei:persName"/>
        </xsl:for-each>
        <xsl:text>.</xsl:text>
        <br/>        
    </xsl:template>
    <xsl:template match="tei:correspDesc//tei:ref" mode="lien">
        <xsl:variable name="lien" select="replace(@target,'xml','html')"/>
        <xsl:choose>
            <xsl:when test="@type='previous'">
                <a name="precedent" href="{$lien}">Précédente</a>
            </xsl:when>
            <xsl:when test="@type='next'">
                <a name="suivant" href="{$lien}">Suivante</a>
            </xsl:when>
            <xsl:when test="@type='context'">
                <xsl:for-each select=".">
                    <li><a style="font-size:9pt;" name="suivant" href="{$lien}"><xsl:value-of select="tei:date"/></a></li>
                </xsl:for-each>
            </xsl:when>
        </xsl:choose>                    
    </xsl:template>
    <!-- Voir pour faire un lien avec les correspContext -->
    
    <!-- BODY -->
    <xsl:template match="tei:div[@type='letter']">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <!-- supprime toutes les figures enfants de letter (pour les cartes postales) -->
    <xsl:template match="tei:div[@type='letter']/tei:figure"/>
    <xsl:template match="tei:div[@type='letter']/tei:pb" mode="affichage">
        <xsl:for-each select=".">
            <xsl:variable name="image" select="@facs"/>
            <img src="{$image}" alt="image" class="img-responsive center-block"/>
        </xsl:for-each>
    </xsl:template>
    <!-- Opener -->
    <xsl:template match="tei:opener/tei:dateline">
        <p style="text-align:right;">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="tei:opener/tei:salute">
        <p style="text-align:center">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <!-- Closer / Postscript / add@type='closer' -->
    <xsl:template match="tei:closer/tei:salute">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="tei:signed">
        <p style="text-align:center">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <xsl:template match="tei:postscript[position()=1]">
        <p>                
            <xsl:text>[PS:]</xsl:text>             
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="tei:postscript[position()!=1]">                
        <p>            
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <xsl:template match="tei:text//tei:add[@type='closer']"/>
    
    <xsl:template match="tei:text//tei:add[@type='closer']" mode="ordreLecture">
        <xsl:variable name="pos">
            <xsl:number count="tei:add[@type='closer']" level="any" from="tei:div[@type='letter']" format="a"/>
        </xsl:variable>
        <xsl:variable name="infobulle" select="normalize-space(.)"/>
        <p>
            <xsl:apply-templates select="tei:add[not(@type='signed')]"/>        
            <a name="appelnote{$pos}" href="#textenote{$pos}" title="{$infobulle}">            
                <sup>                
                    <xsl:value-of select="$pos"/>            
                </sup>            
            </a>
        </p>
        <xsl:if test="tei:add[@type='signed']">
            <p class="signed">
                <xsl:apply-templates select="tei:add[@type='signed']/tei:persName"/> <!-- todo ajouter ce qui vient après la signature ex A horel "toujours la même adresse." -->
            </p>           
        </xsl:if>
    </xsl:template>
    <xsl:template match="tei:text//tei:add[@type='postscript']"/>
    <xsl:template match="tei:text//tei:add[@type='postscript']" mode="ordreLecture">
        <xsl:variable name="pos">
            <xsl:number count="tei:add[@type='postscript']" level="any" from="tei:div[@type='letter']" format="a"/>
        </xsl:variable>
        <xsl:variable name="infobulle" select="normalize-space(.)"/>
        <p>
            <xsl:apply-templates/>        
            <a name="appelnote{$pos}" href="#textenote{$pos}" title="{$infobulle}">            
                <sup>                
                    <xsl:value-of select="$pos"/>            
                </sup>            
            </a>
        </p>
    </xsl:template>
    
    <xsl:template match="tei:text//tei:add[@type='closer']" mode="note">
        <xsl:choose>
            <xsl:when test="parent::tei:sic | parent::tei:orig | parent::tei:surplus"/>
            <xsl:otherwise>
                <xsl:variable name="pos">
                    <!--<xsl:number count="tei:add[@type='closer'] | tei:add[@type='normal'] | tei:postscript//tei:add | tei:closer//tei:add" level="any" from="tei:div[@type='letter']" format="a"/>-->
                    <xsl:number count="tei:add[@type='closer']" level="any" from="tei:div[@type='letter']" format="a"/>
                </xsl:variable>
                <xsl:choose>
                    <xsl:when test="@place='margin-top'">
                        <xsl:variable name="note">
                            <xsl:text>
                                Texte ajouté à la verticale dans la marge droite de la carte :
                            </xsl:text>
                            <xsl:value-of select="@n"/>
                        </xsl:variable>
                        <a name="textenote{$pos}" href="#appelnote{$pos}">  
                            <xsl:value-of select="$pos"/>
                        </a>
                        <xsl:value-of select="$note"/>
                        <br/>
                    </xsl:when>
                    <xsl:when test="@place='margin-right' and @rend='vertical'">
                        <xsl:variable name="note">
                            <xsl:text>
                                Texte ajouté à la verticale dans la marge droite de la carte :
                            </xsl:text>
                            <xsl:value-of select="@n"/>
                        </xsl:variable>
                        <a name="textenote{$pos}" href="#appelnote{$pos}">  
                            <xsl:value-of select="$pos"/>
                        </a>
                        <xsl:value-of select="$note"/>
                        <br/>
                    </xsl:when>
                    <xsl:when test="@place='margin-top' and @rend='rotate'">
                        <xsl:variable name="note">
                            <xsl:text>
                                Texte ajouté à l'envers en haut de carte :
                            </xsl:text>
                            <xsl:value-of select="@n"/>
                        </xsl:variable>
                        <a name="textenote{$pos}" href="#appelnote{$pos}">  
                            <xsl:value-of select="$pos"/>
                        </a>
                        <xsl:value-of select="$note"/>
                        <br/>
                    </xsl:when>
                    <xsl:when test="@place='margin-left' and @rend='vertical'">
                        <xsl:variable name="note">
                            <xsl:text>
                                Texte ajouté à la verticale dans la marge gauche de la carte :
                            </xsl:text>
                            <xsl:value-of select="@n"/>
                        </xsl:variable>
                        <a name="textenote{$pos}" href="#appelnote{$pos}">  
                            <xsl:value-of select="$pos"/>
                        </a>
                        <xsl:value-of select="$note"/>
                        <br/>
                    </xsl:when>
                    <xsl:when test="@place='margin-bottom' and @rend='rotate'">
                        <xsl:variable name="note">
                            <xsl:text>
                                Texte ajouté à l'envers en bas de carte :
                            </xsl:text>
                            <xsl:value-of select="@n"/>
                        </xsl:variable>
                        <a name="textenote{$pos}" href="#appelnote{$pos}">  
                            <xsl:value-of select="$pos"/>
                        </a>
                        <xsl:value-of select="$note"/>
                        <br/>
                    </xsl:when>
                    <!--<xsl:when test="@place='above'">
                        <xsl:variable name="note">
                            <xsl:text>
                                Texte ajouter dans l'interligne.
                            </xsl:text>
                        </xsl:variable>
                        <a name="textenote{$pos}" href="#appelnote{$pos}">  
                            <xsl:value-of select="$pos"/>                            
                        </a>
                        <xsl:value-of select="$note"/>
                        <br/>
                    </xsl:when>-->
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="tei:pb[@type='postcardBreak']">
        <hr/>        
    </xsl:template>
    
    <xsl:template match="tei:div[@type='letter']/tei:p[position()!=last()]">   <!-- TODO -->
        <p>
            <xsl:apply-templates/>            
        </p>                    
    </xsl:template>
    <xsl:template match="tei:div[@type='letter']/tei:p[position()=last()]">  
        <p>
            <xsl:apply-templates/>            
        </p>          
    </xsl:template>
    <!--<xsl:template match="tei:text//tei:pb[following::tei:p[1]]">
        <hr/>
    </xsl:template>-->
    <!--
    expression xpath tous les p qui suivent un pb //pb/following::p[1] => 
    le faire avec les p -->
    
    <xsl:template match="tei:div[@type='enveloppe']">        
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <xsl:template match="tei:div[@type='enveloppe']//tei:address">
        <xsl:for-each select="tei:addrLine | tei:persName">
            <xsl:apply-templates/>
            <xsl:for-each select="tei:del">
                <span style="text-decoration:line-through;"><xsl:value-of select="."/></span>
            </xsl:for-each>
            <xsl:choose>
                <xsl:when test="position()!= last()">
                    <xsl:text>,</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>.</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <br/>
        </xsl:for-each>        
    </xsl:template>
    
    <xsl:template match="tei:div[@type='letter']//tei:persName | tei:div[@type='letter']//tei:placeName | tei:div[@type='letter']//tei:name">
        <xsl:variable name="ref">
            <xsl:value-of select="concat('../projet/glossaire.html',@ref)"/>
        </xsl:variable>
        <xsl:variable name="id"><!-- todo Pose faire xsl choose pose problème lors que répétition des noms avec absence xml id l'idi n'a pas de valeur -->
            <xsl:value-of select="@xml:id"/>
        </xsl:variable>
        <xsl:variable name="def" select="replace(@ref,'#','')"/>
        <xsl:variable name="defi">
            <xsl:apply-templates select="//tei:person[@xml:id=$def]/tei:persName | //tei:item[@xml:id=$def]//tei:label" mode="survol"/>
        </xsl:variable>
        
        <a href="{$ref}" id="{$id}" title="{$defi}" class="glossary"><xsl:apply-templates/><span><xsl:value-of select="$defi"></xsl:value-of></span></a>
    </xsl:template> 
    
    <xsl:template match="//tei:list[@xml:id='glossaire']//tei:label" mode="survol">
        <xsl:choose>                        
            <xsl:when test="tei:name[@type='navire']">
                <xsl:text>&#171; </xsl:text><xsl:apply-templates select="tei:name"/><xsl:text> &#187;</xsl:text><xsl:text> (</xsl:text><xsl:apply-templates select="tei:w"></xsl:apply-templates><xsl:text>), </xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="tei:name"/><xsl:text>, </xsl:text>
            </xsl:otherwise>
        </xsl:choose>
        <small>
            <xsl:apply-templates select="tei:state/tei:p"/>
            <xsl:if test="tei:state/tei:p/tei:date">
                <xsl:text> (</xsl:text>                        
                <xsl:value-of select="tei:state/tei:p/tei:date/@from"/>                        
                <xsl:text> &#x2014; </xsl:text>                        
                <xsl:value-of select="tei:state/tei:p/tei:date/@to"/>                        
                <xsl:text>).</xsl:text>
            </xsl:if>
        </small>
    </xsl:template>
    
    <xsl:template match="//tei:listPerson[@xml:id='person']/tei:person/tei:persName" mode="survol">
        <xsl:choose>
            <xsl:when test="@type='normal'">
                <xsl:apply-templates select="tei:surname"/>
                <xsl:text> (</xsl:text>
                <xsl:apply-templates select="tei:forename"/>
                <xsl:text>)</xsl:text>
                <small>
                    <xsl:if test="../tei:birth">
                        <xsl:text>, </xsl:text>
                        <xsl:apply-templates select="../tei:birth"/>
                        <xsl:text> - </xsl:text>
                        <xsl:apply-templates select="../tei:death"/>
                    </xsl:if>
                    <xsl:if test="tei:roleName">
                        <xsl:text>, </xsl:text>                            
                        <xsl:for-each select="tei:roleName">
                            <xsl:choose>
                                <xsl:when test="position() = last()">
                                    <xsl:apply-templates select="."/>                            
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:apply-templates select="."/>
                                    <xsl:text>, </xsl:text>
                                </xsl:otherwise>
                            </xsl:choose>                                        
                        </xsl:for-each>                
                    </xsl:if>
                    <xsl:if test="../tei:state">
                        <xsl:text>, </xsl:text>    
                        <xsl:apply-templates select="../tei:state"/>                        
                    </xsl:if>
                </small>
            </xsl:when>
            <xsl:when test="@type='nobility'">
                <xsl:apply-templates select="tei:forename"/>        
                <xsl:if test="tei:genName">
                    <xsl:text> </xsl:text>
                    <xsl:apply-templates select="tei:genName"/>           
                </xsl:if>
                <xsl:if test="tei:nameLink">
                    <xsl:text> </xsl:text>
                    <xsl:apply-templates select="tei:nameLink"/>
                </xsl:if>
                <xsl:if test="tei:placeName">
                    <xsl:text> </xsl:text>
                    <xsl:apply-templates select="tei:placeName"/>            
                </xsl:if>
                <xsl:if test="../tei:birth">
                    <small>
                        <xsl:text>, </xsl:text>
                        <xsl:apply-templates select="../tei:birth"/>
                        <xsl:text> - </xsl:text>
                        <xsl:apply-templates select="../tei:death"/>
                        <xsl:text>,</xsl:text>
                    </small>
                </xsl:if>
                <xsl:if test="tei:roleName">
                    <small>                        
                        <xsl:text> </xsl:text>            
                        <xsl:apply-templates select="tei:roleName"/>            
                    </small>        
                </xsl:if>
            </xsl:when>
            <xsl:when test="@type='pseudo'">
                <xsl:apply-templates select="tei:name[@type='pseudo']/tei:surname"/>
                <xsl:text> (</xsl:text>
                <xsl:apply-templates select="tei:name[@type='pseudo']/tei:forename"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="../tei:birth">
                    <xsl:text>, </xsl:text>
                    <small>                
                        <xsl:apply-templates select="../tei:birth"/>
                        <xsl:text> - </xsl:text>
                        <xsl:apply-templates select="../tei:death"/>
                    </small>
                </xsl:if>
                <xsl:if test="tei:name[@type='young']">
                    <small>
                        <xsl:text>, dite </xsl:text>
                        <xsl:apply-templates select="tei:name[@type='young']/tei:surname"/>
                        <xsl:text> </xsl:text>
                        <xsl:apply-templates select="tei:name[@type='young']/tei:forename"/>
                        <xsl:text> </xsl:text>
                        <xsl:apply-templates select="tei:name[@type='young']/tei:nameLink"/>
                    </small>
                </xsl:if>
                <xsl:if test="tei:name[@type='nobility']">
                    <small>
                        <xsl:text>, dite </xsl:text>
                        <xsl:apply-templates select="tei:name[@type='nobility']/tei:roleName"/>
                        <xsl:text> </xsl:text>
                        <xsl:apply-templates select="tei:name[@type='nobility']/tei:surname"/>
                    </small>
                </xsl:if>   
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
 

    
    <xsl:template match="tei:div[@type='enveloppe']/tei:p[1]">
        <div class="row">
            <xsl:choose>
                <xsl:when test="tei:address[@type='addressee' and @place='envelope'] and tei:stamp">
                    <div class="large-6 columns">                                                         
                            <i>(Destinataire :)</i>                            
                            <br/>                            
                        <xsl:apply-templates select="tei:address[@type='addressee' and @place='envelope']"/>                
                            <br/>                    
                            <xsl:if test="tei:add[@hand='#other']">
                                <i>(D'une autre main :)</i>
                                <br/>
                                <xsl:apply-templates select="tei:add[@hand='#other']"/>
                            </xsl:if>                                        
                    </div>        
                    <div class="large-6 columns">            
                        <xsl:apply-templates select="tei:stamp"/>        
                    </div>
                </xsl:when>
                <xsl:otherwise>
                    <div class="large-12">                                        
                            <i>(Destinataire :)</i>                            
                            <br/>                            
                        <xsl:apply-templates select="tei:address[@type='addressee' and @place='envelope']"/>                
                            <br/>                    
                            <xsl:if test="tei:add[@hand='other']">
                                <i>(D'une autre main :)</i>
                                <br/>
                                <xsl:apply-templates select="tei:add[@hand='other']"/>
                            </xsl:if>                
                        
                    </div>
                </xsl:otherwise>
            </xsl:choose>            
        </div>
    </xsl:template>
    <xsl:template match="tei:div[@type='enveloppe']/tei:pb">
        <div class="row">        
            <div class="large-12 columns"><i>(Au dos :)</i></div>
        </div>
    </xsl:template>
    <xsl:template match="tei:div[@type='enveloppe']/tei:p[2]">
        <div class="row">        
            <xsl:choose>            
                <xsl:when test="tei:address[@type='sender' and @place='envelope'] and tei:stamp">                
                    <div class="large-6 columns">                    
                        <i>(Expéditeur :)</i>                    
                        <br/>                    
                        <xsl:apply-templates select="tei:address[@type='sender' and @place='envelope']"/>                
                    </div>                
                    <div class="large-6 columns">                    
                        <xsl:apply-templates select="tei:stamp"/>                
                    </div>            
                </xsl:when>            
                <xsl:otherwise>                
                    <div class="large-12 columns">                    
                        <xsl:apply-templates select="tei:address[@type='sender' and @place='envelope']"/>                
                    </div>            
                </xsl:otherwise> 
            </xsl:choose>                        
        </div>
    </xsl:template>
    <xsl:template match="tei:div[@type='enveloppe']//tei:stamp">
        <xsl:choose>
            <xsl:when test="@type='armee'">              
                <i>(Cachet militaire :)</i>
                <br/>
                <xsl:apply-templates/>
                <br/>
            </xsl:when>
            <xsl:when test="@type='postmark'">
                <i>(Cachet postal :)</i>
                <br/>
                <xsl:apply-templates/>
                <br/>
            </xsl:when>
            <xsl:otherwise>
                <i>(cachet :)</i>
                <br/>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="tei:div[@type='letter']//tei:address[@type='sender' and @place='envelope']"/>
    <xsl:template match="tei:div[@type='letter']//tei:address[@type='addressee' and @place='envelope']"/>
    <xsl:template match="tei:div[@type='letter']//tei:address[@type='addressee' and @place='back']"/>
    <xsl:template match="tei:div[@type='letter']//tei:address[@type='sender' and @place='back']"/>
    <xsl:template match="tei:div[@type='letter']//tei:address[@type='addressee' and @place='postcard']"/>
    <xsl:template match="tei:div[@type='letter']//tei:closer//tei:address[@type='sender']//tei:addrLine"/>
    <xsl:template match="tei:div[@type='letter']//tei:address[@type]" mode="affichage">
        <xsl:for-each select="tei:addrLine | tei:persName">
            <xsl:apply-templates/>
            <xsl:for-each select="tei:del">
                <span style="text-decoration:line-through;"><xsl:value-of select="."/></span>
            </xsl:for-each>
            <xsl:choose>
                <xsl:when test="position()!= last()">
                    <xsl:text>,</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>.</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <br/>
        </xsl:for-each>        
    </xsl:template>    
    <xsl:template match="tei:text//tei:choice">
        <xsl:apply-templates select="tei:reg | tei:corr | tei:expan"/>
    </xsl:template>
   
    <xsl:template match="tei:w[@rend='hyphen']">
        <xsl:apply-templates/>
        <xsl:text>-</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:w[@rend='aggl']">
        <xsl:apply-templates/>
        <xsl:text> </xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:hi">
        <xsl:choose>
            <xsl:when test="@rend='capitalize'">
                <xsl:value-of select="upper-case(.)"/>        
            </xsl:when>
            <xsl:when test="@rend='super'">
                <sup style="vertical-align:super; font-size:50%">
                    <xsl:apply-templates/>
                </sup>
            </xsl:when>
            <xsl:when test="@rend='minimize'">
                <xsl:value-of select="lower-case(.)"/>                
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="tei:text//tei:del"/>    
    
    <xsl:template match="tei:text//tei:unclear"> 
        <xsl:apply-templates/>
        <i><xsl:text>(?)</xsl:text></i> 
    </xsl:template>
    
    <xsl:template match="tei:text//tei:sic">
        <xsl:apply-templates/>
        <i>(sic)</i>
    </xsl:template>
    
    <xsl:template match="tei:text//tei:supplied[@reason='omitted']">
        <xsl:text>[</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>]</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:text//tei:gap">
        <xsl:choose>
            <xsl:when test="@reason='missing'">
                <p/>
                <i>[...]</i>
                <p/>
            </xsl:when>
            <xsl:when test="@reason='illegible'">
                <xsl:choose>
                    <xsl:when test="../../tei:date">
                        <i>Date illisible</i>
                    </xsl:when>
                    <xsl:otherwise>
                        <i>Illisible</i>
                    </xsl:otherwise>
                </xsl:choose>                               
            </xsl:when>                            
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="tei:text//tei:add[@type='numbering']">
        <sub>(<xsl:value-of select="@n"/>)</sub>    
    </xsl:template>

    

</xsl:stylesheet>
