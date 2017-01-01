
                        var map = L.map('mapid').setView([41.508577297439324, 15.64453125], 6);
                        var base1 = L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpandmbXliNDBjZWd2M2x6bDk3c2ZtOTkifQ._QA7i5Mpkd_m30IGElHziw', {
                        minZoom: 5, maxZoom: 17, attribution: 'Map data ©; OpenStreetMap contributors, ' +
                        'CC-BY-SA, ' +
                        'Imagery © Mapbox',
                        id: 'mapbox.streets'
                        }).addTo(map);
                        
                        var greenIcon = L.icon({
                        iconUrl: 'images/icon/envelope.png',
                        //shadowUrl: 'leaf-shadow.png', 
                        //iconRetinaUrl: "marker-icon-2x.png", 
                        //shadowUrl: "marker-shadow.png", 
                        //iconSize:[25, 41],
                        iconSize:[40, 26],
                        //iconAnchor:[12, 41], 
                        popupAnchor:[1, -34], 
                        tooltipAnchor:[16, -28], 
                        //shadowSize:[41, 41]
                        });
                        
                        var popupLocation1 = new L.LatLng(41.508577297439324, 15.64453125);
                        
                        var popupContent1 = "Sur cette carte, chaque lettre est géolocalisée en fonction de son lieu d'envoi. Cliquez sur les vignettes pour accéder à la correspondance.",
                        popup1 = new L.Popup();
                        
                        popup1.setLatLng(popupLocation1);
                        popup1.setContent(popupContent1);
                        
                        map.addLayer(popup1);
                        
                        var markerToulon = L.marker([43.1166667, 5.933333333333334], {icon: greenIcon}).addTo(map);markerToulon.bindPopup('<span>Toulon</span><hr/><ul class="no-bullet"><li><a href="F_delta_1854_20_1_Toulon_8-08-1915.html">Armand Horel à la comtesse de La Forêst, le 08 août 1915</a></li><li><a href="F_delta_1854_20_1_Toulon_29-08-1915.html">Armand Horel à la comtesse de La Forêst, le 29 août 1915</a></li></ul>', {maxWidth: 500, minWidth: 400, maxHeight: 260, autoPan: true, closeButton: true, autoPanPadding:[5, 5]});var markerSasoge = L.marker([47.122125, 4.528813], {icon: greenIcon}).addTo(map);markerSasoge.bindPopup('<span>Hameau de Sasoge</span><hr/><ul class="no-bullet"><li><a href="F_delta_1854_20_3_Sasoge_12-07-1917.html">Louis Horel à la comtesse de La Forêst, le 12 juillet 1917</a></li></ul>', {maxWidth: 500, minWidth: 400, maxHeight: 260, autoPan: true, closeButton: true, autoPanPadding:[5, 5]});var markerMoudros = L.marker([39.8747222, 25.270833333333332], {icon: greenIcon}).addTo(map);markerMoudros.bindPopup('<span>Moudros</span><hr/><ul class="no-bullet"><li><a href="F_delta_1854_20_1_Moudros_03-09-1915.html">Armand Horel à la comtesse de La Forêst, le 03 septembre 1915</a></li></ul>', {maxWidth: 500, minWidth: 400, maxHeight: 260, autoPan: true, closeButton: true, autoPanPadding:[5, 5]});var markerImbros = L.marker([40.1608, 25.8444], {icon: greenIcon}).addTo(map);markerImbros.bindPopup('<span>Imbros</span><hr/><ul class="no-bullet"><li><a href="F_delta_1854_20_1_Imbros_23-09-1915.html">Armand Horel à la comtesse de La Forêst, le 23 septembre 1915</a></li></ul>', {maxWidth: 500, minWidth: 400, maxHeight: 260, autoPan: true, closeButton: true, autoPanPadding:[5, 5]});var markerMytilene = L.marker([39.11, 26.554722222222225], {icon: greenIcon}).addTo(map);markerMytilene.bindPopup('<span>Mytilène</span><hr/><ul class="no-bullet"><li><a href="F_delta_1854_20_1_Mytilene_06-10-1915.html">Armand Horel à la comtesse de La Forêst, le 06 octobre 1915</a></li></ul>', {maxWidth: 500, minWidth: 400, maxHeight: 260, autoPan: true, closeButton: true, autoPanPadding:[5, 5]});var markerPort_Iero = L.marker([39.0883333, 26.48611111111111], {icon: greenIcon}).addTo(map);markerPort_Iero.bindPopup('<span>Port Iéro</span><hr/><ul class="no-bullet"><li><a href="F_delta_1854_20_1_Port_Iero_09-10-1915.html">Armand Horel à la comtesse de La Forêst, le 09 octobre 1915</a></li><li><a href="F_delta_1854_20_1_Port_Iero_20-10-1915.html">Armand Horel à la comtesse de La Forêst, le 20 octobre 1915</a></li><li><a href="F_delta_1854_20_1_Port_Iero_27-10-1915.html">Armand Horel à la comtesse de La Forêst, le 27 octobre 1915</a></li><li><a href="F_delta_1854_20_1_Port_Iero_03-11-1915.html">Armand Horel à la comtesse de La Forêst, le 03 novembre 1915</a></li><li><a href="F_delta_1854_20_1_Port_Iero_10-11-1915.html">Armand Horel à la comtesse de La Forêst, le 10 novembre 1915</a></li><li><a href="F_delta_1854_20_1_Port_Iero_dateUnk_a27-10_b3-11.html">Armand Horel à la comtesse de La Forêst, date inconnue</a></li></ul>', {maxWidth: 500, minWidth: 400, maxHeight: 260, autoPan: true, closeButton: true, autoPanPadding:[5, 5]});var markerSalonique = L.marker([40.6436111, 22.930833333333336], {icon: greenIcon}).addTo(map);markerSalonique.bindPopup('<span>Salonique</span><hr/><ul class="no-bullet"><li><a href="F_delta_1854_20_1_Salonique_15-05-1915.html">Armand Horel à la comtesse de La Forêst, le 15 mai 1915</a></li><li><a href="F_delta_1854_20_1_Salonique_16-11-1915.html">Armand Horel à la comtesse de La Forêst, le 16 novembre 1915</a></li><li><a href="F_delta_1854_20_1_Salonique_23-11-1915.html">Armand Horel à la comtesse de La Forêst, le 23 novembre 1915</a></li><li><a href="F_delta_1854_20_1_Salonique_30-11-1915.html">Armand Horel à la comtesse de La Forêst, le 30 novembre 1915</a></li><li><a href="F_delta_1854_20_1_Salonique_14-12-1915.html">Armand Horel à la comtesse de La Forêst, le 14 décembre 1915</a></li><li><a href="F_delta_1854_20_1_Salonique_17-12-1915.html">Armand Horel à la comtesse de La Forêst, le 17 décembre 1915</a></li><li><a href="F_delta_1854_20_1_Salonique_19-01-1916.html">Armand Horel à la comtesse de La Forêst, le 19 janvier 1916</a></li><li><a href="F_delta_1854_20_1_Salonique_24-01-1916.html">Armand Horel à la comtesse de La Forêst, le 24 janvier 1916</a></li><li><a href="F_delta_1854_20_1_Salonique_25-01-1916.html">Armand Horel à la comtesse de La Forêst, le 25 janvier 1916</a></li><li><a href="F_delta_1854_20_1_Salonique_31-01-1916.html">Armand Horel à la comtesse de La Forêst, le 31 janvier 1916</a></li><li><a href="F_delta_1854_20_1_Salonique_05-02-1916.html">Armand Horel à la comtesse de La Forêst, le 05 février 1916</a></li><li><a href="F_delta_1854_20_1_Salonique_21-02-1916.html">Armand Horel à la comtesse de La Forêst, le 21 février 1916</a></li><li><a href="F_delta_1854_20_1_Salonique_10-03-1916.html">Armand Horel à la comtesse de La Forêst, le 10 mars 1916</a></li><li><a href="F_delta_1854_20_1_Salonique_16-03-1916.html">Armand Horel à la comtesse de La Forêst, le 16 mars 1916</a></li><li><a href="F_delta_1854_20_1_Salonique_17-03-1916.html">Armand Horel à la comtesse de La Forêst, le 17 mars 1916</a></li><li><a href="F_delta_1854_20_1_Salonique_22-03-1916.html">Armand Horel à la comtesse de La Forêst, le 22 mars 1916</a></li><li><a href="F_delta_1854_20_1_Salonique_28-03-1916.html">Armand Horel à la comtesse de La Forêst, le 28 mars 1916</a></li><li><a href="F_delta_1854_20_1_Salonique_03-04-1916.html">Armand Horel à la comtesse de La Forêst, le 03 avril 1916</a></li><li><a href="F_delta_1854_20_1_Salonique_09-04-1916.html">Armand Horel à la comtesse de La Forêst, le 09 avril 1916</a></li><li><a href="F_delta_1854_20_1_Salonique_15-04-1916.html">Armand Horel à la comtesse de La Forêst, le 15 avril 1916</a></li><li><a href="F_delta_1854_20_1_Salonique_21-04-1916.html">Armand Horel à la comtesse de La Forêst, le 21 avril 1916</a></li><li><a href="F_delta_1854_20_1_Salonique_27-04-1916.html">Armand Horel à la comtesse de La Forêst, le 27 avril 1916</a></li></ul>', {maxWidth: 500, minWidth: 400, maxHeight: 260, autoPan: true, closeButton: true, autoPanPadding:[5, 5]});var markerCorfou = L.marker([39.5980556, 19.852222222222224], {icon: greenIcon}).addTo(map);markerCorfou.bindPopup('<span>Corfou</span><hr/><ul class="no-bullet"><li><a href="F_delta_1854_20_1_Corfou_04-11-1916.html">Armand Horel à la comtesse de La Forêst, le 04 novembre 1916</a></li></ul>', {maxWidth: 500, minWidth: 400, maxHeight: 260, autoPan: true, closeButton: true, autoPanPadding:[5, 5]});
                        /*ajouter pour ouvrir une popup automatique au chargement de la carte ".openPopup()";*/
                    