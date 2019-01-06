import 'package:flutter/material.dart';
import 'dart:core';
import 'dart:convert';
//import 'package:tts/tts.dart';
import 'package:sampleapp/region_model.dart';
import 'package:sampleapp/activity_model.dart';
import 'package:sampleapp/attraction_model.dart';

class Repository {
  static String currentActivity;
  static String currentAttraction;
  static String currentRegion;
  static BuildContext context;

  static List<RegionModel> allRegions() {
    List<RegionModel> allModels = List<RegionModel>();

    Map<String, dynamic> attractions = jsonDecode(
"""{ "templateData": {
        "attractionsByRegion": [
            {
                "regionData": {
                    "id": "r1",
                    "region": "Center of the Island",
                    "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/centerisland.jpg",
                    "attractions": [
                        {
                            "id": "r1a1",
                            "name": "Vega Vieja",
                            "province": "La Vega",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/centerisland/vega-vieja.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/vega_vieja.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r1a2",
                            "name": "Plaza de la Cultura",
                            "province": "Bonao",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/centerisland/plaza-de-la-cultura.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/plaza_de_la_cultura.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r1a3",
                            "name": "Carnaval Bonao",
                            "province": "Bonao",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/centerisland/carnaval-bonao.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/carnaval_bonao.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r1a4",
                            "name": "Santo Cerro",
                            "province": "La Vega",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/centerisland/santo-cerro.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/santo_cerro.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r1a5",
                            "name": "Pico Duarte",
                            "province": "La Vega",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/centerisland/pico-duarte.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/pico_duarte.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r1a6",
                            "name": "Carnaval Vegano",
                            "province": "La Vega",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/centerisland/carnaval-vegano.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/carnaval_vegano.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r1a7",
                            "name": "Monumento a los Heroes",
                            "province": "Santiago",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/centerisland/monumento-heroes.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/monumento_santiago.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r1a8",
                            "name": "Museo del Tabaco",
                            "province": "Santiago",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/centerisland/museo-del-tabaco.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/museo_cigarro.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r1a9",
                            "name": "Carnaval de Santiago",
                            "province": "Santiago",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/centerisland/carnaval-santiago.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/carnaval_santiago.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r1a10",
                            "name": "Piramides de Valle Nuevo",
                            "province": "Constanza",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/centerisland/las-piramides-de-valle-nuevo.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/piramide_valle_nuevo.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r1a11",
                            "name": "Parque Nacional Los Haitises",
                            "province": "Monte Plata",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/centerisland/los-haitises.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/los_haitises.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r1a12",
                            "name": "Salto Alto de Bayaguana",
                            "province": "Monte Plata",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/centerisland/salto-de-comatillo.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/salto_bayaguana.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        }
                    ]
                }
            },
            {
                "regionData": {
                    "id": "r2",
                    "region": "Border Region",
                    "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/frontier.jpg",
                    "attractions": [
                        {
                            "id": "r2a1",
                            "name": "Balneario Loma de Cabrera",
                            "province": "Dajabón",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/frontier/balneario-loma-de-cabrera.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/balneario_loma_de_cabrera.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r2a2",
                            "name": "Monumento de la Restauracion Capotillo",
                            "province": "Dajabón",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/frontier/monumento_a_la_restauracion.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/monumento_capotillo.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r2a3",
                            "name": "El Morro",
                            "province": "Montecristi",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/frontier/el-morro.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/morro_montecristi.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r2a4",
                            "name": "El Reloj Público",
                            "province": "Montecristi",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/frontier/el-reloj-publico.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/reloj_publico_montecristi.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r2a5",
                            "name": "Scuba Diving",
                            "province": "Montecristi",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/frontier/scuba-montecristi.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/scuba_montecristi.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r2a6",
                            "name": "Parque Nacional Montecristi",
                            "province": "Montecristi",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/frontier/parque-nacional-montecristi.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/parque_nacional_montecristi.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        }
                    ]
                }
            },
            {
                "regionData": {
                    "id": "r3",
                    "region": "North Region",
                    "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/north.jpg",
                    "attractions": [
                        {
                            "id": "r3a1",
                            "name": "27 Charcos de Damajagua",
                            "province": "Puerto Plata",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/north/charcos-damajagua.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/charcos_damajagua.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r3a2",
                            "name": "Teleférico",
                            "province": "Loma Isabel de Torres, Puerto Plata",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/north/teleferico-puerto-plata.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/teleferico_puertoplata.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r3a3",
                            "name": "El Cristo",
                            "province": "Loma Isabel de Torres, Puerto Plata",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/north/cristo-loma-isabel.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/el_cristo_puertoplata.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r3a4",
                            "name": "Museo del Ambar",
                            "province": "Puerto Plata",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/north/museo-del-ambar.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/museo_del_ambar_puertoplata.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r3a5",
                            "name": "Ruinas de La Isabela",
                            "province": "Puerto Plata",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/north/ruinas-la-isabela.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/ruinas_la_isabela.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r3a6",
                            "name": "Fortaleza San Felipe",
                            "province": "Puerto Plata",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/north/fortaleza-san-felipe.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/fortaleza_san_felipe.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r3a7",
                            "name": "Cayo Arena Beach",
                            "province": "Punta Rucia / Puerto Plata",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/north/cayo-arena.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/cayo_arena_beach.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        }
                    ]
                }
            },
            {
                "regionData": {
                    "id": "r4",
                    "region": "Northeast Region",
                    "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/northeast.jpg",
                    "attractions": [
                        {
                            "id": "r4a1",
                            "name": "Cayo Levantado",
                            "province": "Samaná",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/northeast/cayo-levantado.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/cayo_levantado.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r4a2",
                            "name": "Bahía Príncipe",
                            "province": "Samaná",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/northeast/bahia-principe.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/bahia_principe_samana.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r4a3",
                            "name": "Observacion de Ballenas Jorobadas",
                            "province": "Samaná",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/northeast/ballenas-jorobadas.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/ballenas_jorobadas_samana.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r4a4",
                            "name": "Salto El Limón",
                            "province": "Samaná",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/northeast/salto-el-limon.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/salto_el_limon_samana.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r4a5",
                            "name": "Carnaval de Salcedo",
                            "province": "Salcedo",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/northeast/carnaval-salcedo.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/carnaval_salcedo.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r4a6",
                            "name": "Museo de las Hermanas Mirabal",
                            "province": "Salcedo",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/northeast/museo-hermanas-mirabal.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/museo_hermanas_mirabal.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r4a7",
                            "name": "Mirador de La Cumbre",
                            "province": "Espaillat",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/northeast/mirador-la-cumbre.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/mirador_la_cumbre.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        }
                    ]
                }
            },
            {
                "regionData": {
                    "id": "r5",
                    "region": "Southeast Region",
                    "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/east.jpg",
                    "attractions": [
                        {
                            "id": "r5a1",
                            "name": "Zona Colonial",
                            "province": "Distrito Nacional",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/south-southeast/zona-colonial.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/zona_colonial.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r5a2",
                            "name": "Museo del Ambar",
                            "province": "Distrito Nacional",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/south-southeast/museo-del-ambar-santo-domingo.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/museo_del_ambar_santo_domingo.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r5a3",
                            "name": "Acuario Nacional",
                            "province": "Distrito Nacional",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/south-southeast/acuario-nacional-santo-domingo.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/acuario_santo_domingo.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r5a4",
                            "name": "Faro a Colón",
                            "province": "Distrito Nacional",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/south-southeast/faro-a-colon.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/faro_a_colon.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r5a5",
                            "name": "Jardin Botánico",
                            "province": "Distrito Nacional",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/south-southeast/jardin-botanico-santo-domingo.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/jardin_botanico_santo_domingo.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r5a6",
                            "name": "Los Tres Ojos",
                            "province": "Distrito Nacional",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/south-southeast/los-tres-ojos.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/los_tres_ojos.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r5a7",
                            "name": "Desfile Nacional del Carnaval",
                            "province": "Distrito Nacional",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/south-southeast/carnaval-santo-domingo.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/carnaval_santo_domingo.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r5a8",
                            "name": "Parque Nacional Submarino La Caleta",
                            "province": "Distrito Nacional",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/south-southeast/parque-submarino-la-caleta.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/parque_submarino_la_caleta.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r5a9",
                            "name": "Los Guloyas",
                            "province": "San Pedro de Macorís",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/east/los-guloyas.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/guloyas_spm.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r5a10",
                            "name": "Caverna de las Maravillas",
                            "province": "San Pedro de Macorís",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/east/cueva-las-maravillas.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/cueva_las_maravillas.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r5a11",
                            "name": "Altos de Chavón",
                            "province": "La Romana",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/east/altos-de-chavon.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/altos_de_chavon.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r5a12",
                            "name": "Isla Catalina",
                            "province": "La Romana",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/east/isla-catalina.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/isla_catalina.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r5a13",
                            "name": "Scuba Diving in La Romana",
                            "province": "La Romana",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/east/scuba-diving-la-romana.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/scuba_diving_la_romana.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r5a14",
                            "name": "Punta Cana",
                            "province": "La Altagracia",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/east/punta-cana.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/punta_cana.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r5a15",
                            "name": "Isla Saona",
                            "province": "La Altagracia",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/east/isla-saona.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/isla_saona.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r5a16",
                            "name": "Hoyo Azul Cap Cana",
                            "province": "Punta Cana / La Altagracia",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/east/hoyo-azul.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/hoyo_azul_punta_cana.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r5a17",
                            "name": "Laguna de Bávaro",
                            "province": "La Altagracia",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/east/laguna-bavaro.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/laguna_bavaro.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r5a18",
                            "name": "Basilica Nuestra Señora de la Altagracia",
                            "province": "La Altagracia",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/east/basilica-higuey.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/basilica_higuey.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r5a19",
                            "name": "Museo Colonial Ponce de León",
                            "province": "La Altagracia",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/east/museo-ponce-de-leon.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/museo_ponce_de_leon.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r5a20",
                            "name": "Parque Nacional del Limón",
                            "province": "El Seibo",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/east/parque-nacional-del-limon.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/parque_nacional_del_limon.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        }
                    ]
                }
            },
            {
                "regionData": {
                    "id": "r6",
                    "region": "Southwest Region",
                    "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/southwest.jpg",
                    "attractions": [
                        {
                            "id": "r6a1",
                            "name": "Ruinas de Ingenios Azucareros del siglo XVI (Boca de Nigua)",
                            "province": "San Cristóbal",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/south-southeast/ruinas-ingenios.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/ruinas_ingenio_boca_de_nigua.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r6a2",
                            "name": "Complejo de Cavernas del Pomier",
                            "province": "San Cristóbal",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/south-southeast/cuevas-pomier.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/cuevas_del_pomier.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r6a3",
                            "name": "Balneario de La Toma",
                            "province": "San Cristóbal",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/south-southeast/balneario-la-toma.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/toma_de_san_cristobal.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r6a4",
                            "name": "Murales de Vela Zanetti",
                            "province": "San Cristóbal",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/south-southeast/murales-vela-zanetti.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/murales_vela_zanetti.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r6a5",
                            "name": "Playa de Palenque",
                            "province": "San Cristobal",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/south-southeast/playa-de-palenque.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/playa_palenque.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r6a6",
                            "name": "Las Dunas",
                            "province": "Peravia",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/south-southeast/las-dunas-bani.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/las_dunas_bani.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r6a7",
                            "name": "Templo de Piedra de Las Tablas",
                            "province": "Peravia",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/south-southeast/templo-de-piedra-las-tablas.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/templo_de_piedra_las_tablas.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r6a8",
                            "name": "Las Salinas",
                            "province": "Peravia",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/south-southeast/las-salinas-peravia.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/las_salinas_bani.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r6a9",
                            "name": "Playa Blanca",
                            "province": "Peravia",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/south-southeast/playa-blanca.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/playa_blanca_bani.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r6a10",
                            "name": "Aguas Termales de la Sierra de Martín García",
                            "province": "Peravia",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/south-southeast/aguas-termales-peravia.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/aguas_termales_peravia.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r6a11",
                            "name": "Snorkeling in Peravia",
                            "province": "Peravia",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/south-southeast/snorkeling-peravia.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/snorkeling_peravia.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r6a12",
                            "name": "Polo Magnético",
                            "province": "Barahona",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/south-southeast/polo-magnetico-barahona.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/polo_magnetico_barahona.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r6a13",
                            "name": "Laguna de Cabral",
                            "province": "Barahona",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/south-southeast/laguna-de-cabral.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/laguna_de_cabral.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r6a14",
                            "name": "Carnaval de las Cachúas",
                            "province": "Barahona",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/south-southeast/carnaval-cachuas-barahona.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/carnaval_cachuas_barahona.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r6a15",
                            "name": "Balneario Los Patos",
                            "province": "Barahona",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/south-southeast/balneario-los-patos.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/balneario_los_patos_barahona.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r6a16",
                            "name": "Balneario San Rafael",
                            "province": "Barahona",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/south-southeast/balneario-san-rafael.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/balneario_san_rafael.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r6a17",
                            "name": "Minas de Larimar",
                            "province": "Barahona",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/south-southeast/minas-de-larimar.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/minas_de_larimar.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r6a18",
                            "name": "Sierra de Baoruco",
                            "province": "Baoruco",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/south-southeast/sierra-de-bahoruco.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/sierra_de_baoruco.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r6a19",
                            "name": "Lago Enriquillo",
                            "province": "Baoruco",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/south-southeast/lago-enriquillo.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/lago_enriquillo.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r6a20",
                            "name": "Balneario de Las Marías",
                            "province": "Baoruco",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/south-southeast/balneario-las-marias.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/balneario_las_marias.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r6a21",
                            "name": "Parque Nacional Isla Cabritos",
                            "province": "Independencia",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/south-southeast/parque-nacional-isla-cabritos.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/parque_nacional_isla_cabritos.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r6a22",
                            "name": "Las Caritas de Los Indios",
                            "province": "Independencia",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/south-southeast/las-caritas-de-los-indios.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/las_caritas_de_los_indios.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r6a23",
                            "name": "Balneario Las Barías",
                            "province": "Independencia",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/south-southeast/balneario-las-barias.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/balneario_las_barias.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r6a24",
                            "name": "Parque Nacional Jaragua",
                            "province": "Pedernales",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/south-southeast/parque-nacional-jaragua.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/parque_nacional_jaragua.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r6a25",
                            "name": "Laguna de Oviedo",
                            "province": "Pedernales",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/south-southeast/laguna-de-oviedo.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/laguna_de_oviedo.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r6a26",
                            "name": "Isla Beata",
                            "province": "Pedernales",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/south-southeast/isla-beata.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/isla_beata.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r6a27",
                            "name": "Isla Alto Velo",
                            "province": "Pedernales",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/south-southeast/isla-alto-velo.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/isla_alto_velo.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r6a28",
                            "name": "Bahía de Las Aguilas",
                            "province": "Pedernales",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/south-southeast/bahia-de-las-aguilas.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/bahia_de_las_aguilas.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        },
                        {
                            "id": "r6a29",
                            "name": "Cabo Rojo El Acetillar",
                            "province": "Pedernales",
                            "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/south-southeast/cabo-rojo-acetillar.jpg",
                            "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/cabo_rojo_pedernales.mp4",
                            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
                        }
                    ]
                }
            }
        ]
    }
}""");

    for(var region in attractions['templateData']['attractionsByRegion']){
      allModels.add(RegionModel.fromJSON(region['regionData']));
    }

    return allModels;
  }

  static List<ActivityModel> allActivities() {
    var allActivities = List<ActivityModel>();

    Map<String, dynamic> allActivitiesJSON = jsonDecode(
      '''
{
    "templateData": {
        "attractionsByActivity": [
            {
                "activityData": {
                    "id": "a1",
                    "name": "Snorkeling / Scuba Diving",
                    "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/frontier/scuba-montecristi.jpg",
                    "attractions": [
                        "r5a8",
                        "r5a13",
                        "r6a11"
                    ]
                }
            },
            {
                "activityData": {
                    "id": "a2",
                    "name": "Hiking",
                    "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/centerisland/pico-duarte.jpg",
                    "attractions": [
                        "r1a5",
                        "r1a11",
                        "r6a21",
                        "r6a24"
                    ]
                }
            },
            {
                "activityData": {
                    "id": "a3",
                    "name": "Sightseeing",
                    "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/centerisland/monumento-heroes.jpg",
                    "attractions": [
                        "r1a7",
                        "r1a10",
                        "r3a2",
                        "r3a3",
                        "r3a6",
                        "r5a1",
                        "r5a4",
                        "r5a11"
                    ]
                }
            },
            {
                "activityData": {
                    "id": "a4",
                    "name": "Outdoors",
                    "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/centerisland/salto-de-comatillo.jpg",
                    "attractions": [
                        "r1a12",
                        "r3a1",
                        "r4a3",
                        "r4a4",
                        "r5a16",
                        "r6a19",
                        "r6a25"
                    ]
                }
            },
            {
                "activityData": {
                    "id": "a5",
                    "name": "Vacation Retreat",
                    "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/north/cayo-arena.jpg",
                    "attractions": [
                        "r3a7",
                        "r4a1",
                        "r4a2",
                        "r5a12",
                        "r5a14",
                        "r5a15",
                        "r6a5",
                        "r6a26",
                        "r6a28"
                    ]
                }
            },
            {
                "activityData": {
                    "id": "a6",
                    "name": "Festivities",
                    "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/centerisland/carnaval-bonao.jpg",
                    "attractions": [
                        "r1a3",
                        "r1a6",
                        "r1a9",
                        "r4a5",
                        "r5a7",
                        "r5a9",
                        "r6a14"
                    ]
                }
            }
        ]
    }
}
      '''
    );
  
    for(var activity in allActivitiesJSON['templateData']['attractionsByActivity'])
    {
      allActivities.add(ActivityModel.fromJSON(activity['activityData']));
    }

    return allActivities;
  }
  
  static List<AttractionModel> topAttractions() {
    var allModels = List<AttractionModel>();

    Map<String, dynamic> topAttractions = jsonDecode(
      '''{
  "templateData": {
    "attractions": [
      {
        "attractionData": {
          "id": "top101",
          "province": "Samaná",
          "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/las_terrenas.mp4",
          "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/top10/img10_lasterrenas.jpg",
          "name": "Las Terrenas",
          "description": "Las Terrenas is a growing tourist destination known for its pretty landscapes, white sand beaches and clear ocean water.",
          "fullDescription": "Las Terrenas, on the north coast of the Dominican Republic, was once a small fishing village. But that all changed in 1946 when the country’s president ordered rural residents from Santo Domingo to settle here as farmers and fishermen. Today, Las Terrenas is a growing tourist destination known for its pretty landscapes, white sand beaches and clear ocean water. It’s popular with foreigners and Santo Dominicans since it’s only a two-hour drive from the capital. Top beaches include Playas el Portillo and Las Ballenas. Las Terrenas also is a good place to go dolphin and whale watching."
        }
      },
      {
        "attractionData": {
          "id": "top102",
          "province": "La Vega",
          "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/jarabacoa.mp4",
          "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/top10/img9_jarabacoa.jpg",
          "name": "Jarabacoa",
          "description": "Because of its tropical climate, Jarabacoa is frequently called the city of everlasting spring.",
          "fullDescription": "Because of its tropical climate, Jarabacoa is frequently called the city of everlasting spring. The area is known for its mountains and scenic beauty, including the Jimenoa and Baiguate waterfalls, and the Ebano Verde Scientific Reserve. If you’re an adventuresome visitor, you might try crossing the Jimenoa River on a wood and rope footbridge. More timid travelers may opt for a round of golf on a nine-hole course or a visit to the Cistercian monastery of Santa Maria del Evangelio. Come February, Jarabacoa hosts one of the most famous Carnivals in the country."
        }
      },
      {
        "attractionData": {
          "id": "top103",
          "province": "Samaná",
          "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/playa_rincon_samana.mp4",
          "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/top10/img8_playarincon.jpg",
          "name": "Playa Rincón",
          "description": "You’ll enjoy strolling on the soft sandy beach, which, at nearly two miles long means there’s room for everyone. ",
          "fullDescription": "You may be walking on history as you beach comb on Playa Rincon: It’s one of two places in the Dominican Republic rumored to be THE spot where Spanish explorer Christopher Columbus first touched land in 1492. But even if it’s not, you’ll enjoy strolling on the soft sandy beach, which, at nearly two miles long means there’s room for everyone, though you may have to share the beach with stuff the ocean washed in. Still, Playa Rincon is considered one of the most beautiful beaches in the Caribbean. You can get there via a 20-minute boat ride from Las Galeras."
        }
      },
      {
        "attractionData": {
          "id": "top104",
          "province": "Samaná",
          "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/salto_el_limon_samana.mp4",
          "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/top10/img7_ellimon.jpg",
          "name": "Salto El Limón",
          "description": "El Limon is a spectacular waterfall that drops 50 mt. (170 ft.) near the Atlantic Coast side of the Dominican Republic. ",
          "fullDescription": "El Limon waterfall definitely doesn’t live up to its name, The Lemon. Instead, El Limon is a spectacular waterfall that drops 50 meters (170 fee)t near the Atlantic Coast side of the Dominican Republic. Getting there can be a sweaty and wet ordeal since you’ll cross several rivers on horseback (the main way to get there), but once there, you can cool off in the spectacular swimming hole at the bottom of the falls. You may need the dip even more if you’ve opted to walk the 40-minute trail over sometimes steep terrain."
        }
      },
      {
        "attractionData": {
          "id": "top105",
          "province": "Santo Domingo",
          "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/santo_domingo.mp4",
          "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/top10/img6_santodomingo.jpg",
          "name": "Santo Domingo",
          "description": "Santo Domingo is the capital of the Dominican Republic and its largest city. ",
          "fullDescription": "Santo Domingo is the capital of the Dominican Republic and its largest city – indeed, it has the largest metropolitan area in the Caribbean. Founded in 1496 on the Ozama River, it is the oldest European settlement in the Americas. It also holds a number of other New World firsts: capital of the Spanish empire, castle (Alcazar de Colon), monastery, cathedral (Cathedral Santa Maria la Menor) and university. The best place to take in this rich history is, of course, the historic district where you’ll find majestic buildings reflecting Middle Ages architecture. You can also see the Fortaleza Ozama, the oldest fortress in the Americas. "
        }
      },
      {
        "attractionData": {
          "id": "top106",
          "province": "Puerto Plata",
          "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/cabarete_puerto_plata.mp4",
          "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/top10/img5_cabarete.jpg",
          "name": "Cabarete",
          "description": "If you’re into adventure sports, Cabarete is a good place to indulge yourself. ",
          "fullDescription": "If you’re into adventure sports, Cabarete is a good place to indulge yourself. Founded in 1835 by former slave owner, this once quiet fishing village is now a kite-surfer’s dream, hosting many international competitions. It’s one of the most popular surfing spots in the Caribbean. Cabarete has a good infrastructure for tourism, with top hotels and eateries, all of which are easy to find, since the village has only one main street. Cabarete has pretty beaches, but if you get tired of them you can explore nearby caves or go kayaking, snorkeling or scuba diving."
        }
      },
      {
        "attractionData": {
          "id": "top107",
          "province": "Samaná",
          "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/samana.mp4",
          "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/top10/img4_samana.jpg",
          "name": "Samaná",
          "description": "Thousands of humpback whales head to the Samana Bay to give birth between January and March. ",
          "fullDescription": "Samana, capital of the province with the same name, is a pretty, historic town located on northern Samana Bay. Its main claim to fame is that it’s the last stop Christopher Columbus made the New World in 1493 before heading back to Spain. In more modern times, it’s a great place to go whale-watching, since thousands of humpback whales head to the bay to give birth between January and March. During these months, Samana is the tourism capital of the Dominican Republic. It may interest baseball fans to know that several notable pitchers, including Wily Peralta, grew up here."
        }
      },
      {
        "attractionData": {
          "id": "top108",
          "province": "La Altagracia",
          "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/bayahibe_la_altagracia.mp4",
          "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/top10/img3_bayahibe.jpg",
          "name": "Bayahíbe",
          "description": "The former fishing village is now one of the top places to visit in the Dominican Republic.",
          "fullDescription": "In a country that is known for its beach destinations, the resort town of Bayahibe is no exception. The former fishing village is now one of the top places to visit in the Dominican Republic. Bayahibe Beach is located less than a mile from town, but you’re more likely to visit here to catch a boat to Saona and its fabulous beaches located within a national park. Bayahibe also is the best scuba diving locations in the country, with more than 20 dive sites. Don’t scuba dive? How about stand-up paddle boarding or snorkeling?"
        }
      },
      {
        "attractionData": {
          "id": "top109",
          "province": "Puerto Plata",
          "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/sosua_puerto_plata.mp4",
          "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/top10/img2_sosua.jpg",
          "name": "Sosúa",
          "description": "Sosua is a popular destination for diving enthusiasts who like the calm waters and reef structures.",
          "fullDescription": "In 1938, long before the Dominican Republic became a top tourist destination, its president offered safe haven to 100,000 Jewish refugees. About 800 settled in Sosua and were given land where they started a dairy and cheese factory. You can eat products from Productos Sosua today. Sosua is a popular destination for diving enthusiasts who like the calm waters, reef structures and the many varieties of fish they’ll see. Sosua is a place where nature is still making beaches, some naturally and others by storms. By day, Sosua is a typical beach resort; by night, it’s a haven for party animals."
        }
      },
      {
        "attractionData": {
          "id": "top1010",
          "province": "La Altagracia",
          "video": "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/punta_cana.mp4",
          "img": "http://api.drcoderz.com/aws_drtourismskill_imgs/top10/img1_puntacana.jpg",
          "name": "Punta Cana",
          "description": "One of the most popular resort destinations in the Caribbean. Located on the eastern tip of the Dominican Republic.",
          "fullDescription": "Thousands of tourists flock the beaches of Punta Cana, one of the most popular resort destinations in the Caribbean. Located on the eastern tip of the Dominican Republic, Punta Cana’s public beach is also popular for water sports including surfing and kayaking. The area is served by an airstrip with regular flights and charters bringing pleasure-seekers to its world-class golf courses and the nearby Scape Park where adventure seekers can enjoy a zipline tour, dune buggies, and visit the refreshing Hoyo Azul Lagoon."
        }
      }
    ]
  }
}'''
    );
    
    for(var jsonAttraction in topAttractions['templateData']['attractions'])
    {
      allModels.add(AttractionModel.fromJSON(jsonAttraction['attractionData']));
    }
    return allModels;
  }

  static List<AttractionModel> getAttractionsFromActivity(List<String> attractionIds) {

    List<AttractionModel> activityAttractions = List<AttractionModel>();

    for(var id in attractionIds) {
      for(var region in allRegions()) {
        
        for(var attraction in region.attractions) {
          if (attraction.id == id) {
            activityAttractions.add(attraction);
            break;
          }
        }
      }
    }

    return activityAttractions;
  }
  
  static AttractionModel getCurrentAttraction() {
    AttractionModel model;
    
    for(var b in topAttractions()) {
      if (b.id == currentAttraction)
      {
        model = b;
        break;
      }
    }

    if (model == null) {
      for(var a in allActivities()) {
        for(var b in a.attractions) {
          if (b.id == currentAttraction)
          {
            model = b;
            break;
          }
        }
      }
    }

    if (model == null) {
      for(var r in allRegions()) {
        for(var b in r.attractions) {
          if (b.id == currentAttraction)
          {
            model = b;
            break;
          }
        }
      }
    }
    
    return model;
  }

  static void textToSpeech({String textToSpeech = ''}){
    //Tts.setLanguage('es-MX');
    //Tts.speak(textToSpeech);
  }

  static Widget getCarouselCard({BuildContext context, String topLabel,String bottomLabel,String imgPath, Function onTap}) {
    return Container(
        padding: EdgeInsets.only(left: 2.0, right: 2.0),
        margin: EdgeInsets.only(top: 20.0, left: 5.0, right: 5.0, bottom: 60.0),
        child: GestureDetector(
          child: Container(
          decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.4),
                blurRadius: 20.0,
                spreadRadius: 4.0,
                offset: Offset(0.0, 30.0)
              )
            ]
          ),
          child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Image.asset('assets/placeholder.jpg',
                fit: BoxFit.cover,
                  width: 600.0,
                  height: 900.0
                ),
                Image.network(imgPath,
                  fit: BoxFit.cover,
                  width: 600.0,
                  height: 900.0
                ),
                Container(
                  height: 100.0,
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Color.fromRGBO(0, 0, 0, 0.8), Colors.transparent], // whitish to gray
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(topLabel,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Color.fromRGBO(255, 255, 255, 1.0),
                        fontWeight: FontWeight.bold)),
                      Text(bottomLabel, 
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Color.fromRGBO(255, 255, 255, 1.0),
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.italic))
                    ],
                  ),
                )
              ],
            ),
        ),
        ),
        onTap: onTap,
        )
      );
  }

  static Widget getCard({BuildContext context, String topLabel,String bottomLabel,String imgPath, Function onTap}){
    return Container(
          padding: EdgeInsets.all(10.0),
            child: GestureDetector(
              child: Card(
            elevation: 4.0,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            margin: EdgeInsets.all(10.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ) ,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Image.asset('assets/placeholder.jpg'),
                Image.network(imgPath),
                Positioned(
                  child: Row(children: <Widget>[
                    Icon(
                      Icons.favorite,
                      color: Colors.transparent,
                    )
                  ],),
                  top: 10, right: 10,),
                Container(
                  height: 100.0,
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Color.fromRGBO(0, 0, 0, 0.8), Colors.transparent], // whitish to gray
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(topLabel,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Color.fromRGBO(255, 255, 255, 1.0),
                        fontWeight: FontWeight.bold)),
                      Text(bottomLabel, 
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Color.fromRGBO(255, 255, 255, 1.0),
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.italic))
                    ],
                  ),
                )
              ],
            )),
            onTap: onTap,
            )
          );
  }
}
