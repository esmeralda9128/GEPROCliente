<%-- 
    Document   : inicioAdministrador
    Created on : 4/03/2019, 08:11:02 PM
    Author     : horo_
--%>

<%
    String context = request.getContextPath();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio Administrador-GEPRO</title>
        <link rel="shortcut icon" href="<%=context%>/imagenes/geprologo.ico"/>
        <link rel="stylesheet" href="<%=context%>/css/sweetalert2.min.css">
        <link rel="stylesheet" href="<%=context%>/css/style.css">
        <script src="<%=context%>/js/sweetalert/sweetalert2.all.min.js"></script>
        <script type="text/javascript" src="<%=context%>/js/jqBootstrapValidation.js"></script> 
        <style>
            .jumbotron { padding-left: 2em; padding-right: 2em; }
            .container { margin-top: 70px; text-align: center; }
        </style>
    </head>

    <body>
        <div class="container">
            <h1>jQuery modal-steps.js: Wizard Modal Demo</h1>
            <div class="jquery-script-ads" align="center" style="margin:50px auto;">
    <script type="text/javascript"><!--
                        google_ad_client = "ca-pub-278304452          0727903";
        /* jQuer          y_demo */
        google_ad_slot = "278          0937993";
                google_ad_wid          th = 728;
                google_ad_hei          ght = 90;
        //-->
</script>
                    <script type="text/javascript"
src="https://pagead2.googlesyndication.com/pagead/show _ads.js">
</script></div>
                <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
                    Launch demo modal
                </button>
            </div>
            <!-- Modal -->
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" ar                    ia-labelledby="myModalLabel">
                <div class="m                        odal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="js-title-step"></h4>
                        </div>
                        <div class="modal-body">
                            <div class="row hide" data-step="1" data-tit                                    le="This is the first step!">
                                <div class="jumbotron">                                This is t                                he first step!</div>
                            </div>
                            <div class="row hide" data-step="2" data-titl                                    e="This is the second step!">
                                <div class="jumbotron">T                                his is th                                e second step!</div>
                            </div>
                            <div class="row hide" data-step="3" data-ti                                    tle="This is the last step!">
                                <div class="jumbotron">This is                             the las                            t step!</div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default js-btn-step pull-left" data-orientation="cancel" d                                ata-dismiss="modal"></button>
                            <button type="button" class="btn btn-warning js-btn-step" data-ori                                entation="previous"></button>
                            <button type="button" class="btn btn-success js-btn-step" data                            -orientation=                        "next"></bu                    tton>
                                    </div>
                    </div>
                </div>
            </div>
            <script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" cros                sorigin="anonymous"></script>
            <script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.7/j                s/bootstrap.min.js"></script>
            <script src="dist/                modal-ste                  ps.min.js"></script>
<script>
        $('#myMo                    dal').modalSteps();
</script>
<script type="text/javascript">

    var _gaq = _gaq || [];
    _gaq.push(['_setAccount', 'UA-36251023-1']);
    _gaq.push(['_setDomainName', 'jqueryscript.net']);
    _gaq.push(['_trackPageview']);

    (function () {
        var ga = document.createElement('script');
        ga.type = 'text/javascript';
        ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0];
                s.parentNode.insertBefo                re(ga, s);
    })();

                </script>
        </body>
    </html>
