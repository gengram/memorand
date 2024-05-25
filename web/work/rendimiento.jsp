<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    
    <!-- HEAD -->
    <head>
        
        <jsp:include page="../XM-Resources/pages/imports.jspf"/>
        <link rel="stylesheet" href="../XM-Resources/styles/bootstrap.css">
        <link rel="stylesheet" href="../XM-Resources/styles/styless.css">
        <link rel="shortcut icon" href="../XM-Resources/vector/memorand-bee.svg">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.5.0/echarts.min.js"></script>

        <title>Memorand | Rendimiento</title>

    </head>
    
    <body>

        <jsp:include page="../XM-Resources/pages/elements/navbar_work.jspf"/>
        
        <div class="container">
            <div class="row mt-4">
                <div class="col-1"></div>
                <div class="col-4 mt-2">
                    <a href="home.jsp" id="backL">
                        <div class="card border border-1" style="max-height: 50px;">
                            <div class="row g-0">
                                <div class="col-md-2 rounded-start" style="background-color: #000000; max-height: 47px; max-width: 40px">
                                    <i class="bi bi-chevron-left ms-1" style="color: #2A2927; font-size: 30px"></i>
                                </div>
                                <div class="col-md-10 ">
                                    <div class="card-header" style="background-color: transparent;">
                                        <p class="titulo" style="color: #2A2927; font-size: 20px;">
                                            <b style="color: #2A2927" class="ms-4 mb-0"></b>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                                        
                <div class="col-2 d-flex justify-content-center align-items-center text-center">
                    <i class="bi bi-chevron-right" style="font-size: 40px; color: #AFB2B3"></i>
                </div>
                <div class="col-4 mt-2">
                    <div class="card border border-1" style="max-height: 50px;">
                        <div class="row g-0">
                            <div class="col-md-2 rounded-start" style="background-color: #000000; max-height: 47px; max-width: 40px"></div>
                            <div class="col-md-10 ">
                                <div class="card-header" style="background-color: transparent;">
                                    <p class="titulo ali" style="color: #2A2927; font-size: 20px;">
                                        <b style="color: #2A2927" class="ms-4 mb-0"></b>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>                                        
                </div>
                <div class="col-1"></div>
            </div>
            <div class="row">
                <div class="col-1"></div>
                <div class="col-10">
                    <hr class="mt-4">
                </div>
                <div class="col-1"></div>
            </div>
            <div class="row mt-3">
                <div class="col-1"></div>
                <div class="col-10">
                    <div id="main" style="width: 100%; height: 500px;"></div>
                </div>
                <div class="col-1"></div>
            </div>
        </div>
                
        

        <script>
            var chartDom = document.getElementById('main');
            var myChart = echarts.init(chartDom);
            var option;
            // Schema:
            // cada var es un proyecto
            // [index, tareas completadas, tareas incompletas, prioridad, dificultad, dias necesarios]
            var progra1 = [
              [1, 1, 55, 39, 16, 0.46],
              [1, 13, 85, 27, 21, 0.65],
              [1, 10, 56, 15, 63, 0.3],

            ];

            var progra2 = [
              [2, 25, 26, 37, 27, 0.463],
                [2, 17, 85, 22, 31, 0.695],
                [2, 29, 78, 38, 44, 0.363],
            ];
            var progra3 = [
                [3, 15, 91, 35, 25, 0.52],
                [3, 20, 65, 27, 8, 0.56],
                [3, 3, 83, 10, 4, 0.39],
                [3, 15, 91, 4, 25, 0.52],
                [3, 20, 65, 3, 8, 0.56],
                [3, 3, 83, 1, 4, 0.39],
            ];
            var schema = [
                {name: 'tc', index: 0, text: 'tareas completadas'},
                {name: 'ti', index: 1, text: 'tareas incompletas'},
                {name: 'pr', index: 2, text: 'prioridad'},
                {name: 'dif', index: 3, text: 'dificultad'},
                {name: 'dn', index: 4, text: ' dias necesarios'}

            ];
            var lineStyle = {
                width: 1,
                opacity: 0.5
            };
            option = {
                backgroundColor: '#333',
                legend: {
                    bottom: 30,
                    // [arreglo de proyectos]
                    data: ['progra1', 'progra2', 'progra3'],
                    itemGap: 20,
                    textStyle: {
                        color: '#fff',
                        fontSize: 14
                    }
                },
                tooltip: {
                    padding: 10,
                    backgroundColor: '#222',
                    borderColor: '#777',
                    borderWidth: 1
                },
                parallelAxis: [
                    {
                        dim: 1,
                        name: schema[0].text,
                        inverse: true,
                        max: 31,
                        nameLocation: 'start'
                    },
                    {dim: 2,
                        max: 120,
                        splitNumber: 10,
                        name: schema[1].text},
                    {dim: 3,
                        name: schema[2].text},
                    {dim: 4,
                        name: schema[3].text},
                    {dim: 5,
                        name: schema[4].text}
                ],
                visualMap: {
                    show: true,
                    min: 0,
                    max: 150,
                    dimension: 2,
                    inRange: {
                        color: ['#d94e5d', '#eac736', '#50a3ba'].reverse()
                                // colorAlpha: [0, 1]
                    }
                },
                parallel: {
                    left: '5%',
                    right: '18%',
                    bottom: 100,
                    parallelAxisDefault: {
                        type: 'value',
                        name: 'AQI指数',
                        nameLocation: 'end',
                        nameGap: 20,
                        nameTextStyle: {
                            color: '#fff',
                            fontSize: 12
                        },
                        axisLine: {
                            lineStyle: {
                                color: '#aaa'
                            }
                        },
                        axisTick: {
                            lineStyle: {
                                color: '#777'
                            }
                        },
                        splitLine: {
                            show: false
                        },
                        axisLabel: {
                            color: '#fff'
                        }
                    }
                },
                series: [
                    {
                        // name y data son el nombre de cada proyecto   
                        name: 'progra1',
                        type: 'parallel',
                        lineStyle: lineStyle,
                        data: progra1
                    },
                    {
                        name: 'progra2',
                        type: 'parallel',
                        lineStyle: lineStyle,
                        data: progra2
                    },
                    {
                        name: 'progra3',
                        type: 'parallel',
                        lineStyle: lineStyle,
                        data: progra3
                    }
                ]
            };
            option && myChart.setOption(option);
        </script>

    </body>
    
</html>