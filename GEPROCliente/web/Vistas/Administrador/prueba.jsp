<%-- 
    Document   : prueba
    Created on : 14/03/2019, 06:26:25 PM
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
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    </head>
    <body>
        <form class="modal multi-step" id="demo-modal-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title step-1" data-step="1">Step 1</h4>
                        <h4 class="modal-title step-2" data-step="2">Step 2</h4>
                    </div>
                    <div class="modal-body step step-1">
                        This is step 1.
                    </div>
                    <div class="modal-body step step-2">
                        This is the final step
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary step step-1" data-step="1" onclick="sendEvent('#demo-modal-1', 2)">Continue</button>
                    </div>
                </div>
            </div>
        </form>
        <form class="modal multi-step" id="demo-modal-2">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title step-1" data-step="1">Step 1</h4>
                        <h4 class="modal-title step-2" data-step="2">Step 2</h4>
                        <h4 class="modal-title step-3" data-step="3">Final Step</h4>
                        <div class="m-progress">
                            <div class="m-progress-bar-wrapper">
                                <div class="m-progress-bar">
                                </div>
                            </div>
                            <div class="m-progress-stats">
                                <span class="m-progress-current">
                                </span>
                                /
                                <span class="m-progress-total">
                                </span>
                            </div>
                            <div class="m-progress-complete">
                                Completed
                            </div>
                        </div>
                    </div>
                    <div class="modal-body step-1" data-step="1">
                        This is step 1.
                    </div>
                    <div class="modal-body step-2" data-step="3">
                        This is the second step.
                    </div>
                    <div class="modal-body step-3" data-step="3">
                        This is the final step.
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary step step-1" data-step="1" onclick="sendEvent('#demo-modal-2', 2)">Continue</button>
                        <button type="button" class="btn btn-primary step step-2" data-step="2" onclick="sendEvent('#demo-modal-2', 3)">Continue</button>
                    </div>
                </div>
            </div>
        </form>
        <form class="modal multi-step" id="demo-modal-3">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title step-1" data-step="1">Step 1</h4>
                        <h4 class="modal-title step-2" data-step="2">Step 2</h4>
                        <h4 class="modal-title step-3" data-step="3">Final Step</h4>
                        <div class="m-progress">
                            <div class="m-progress-bar-wrapper">
                                <div class="m-progress-bar">
                                </div>
                            </div>
                            <div class="m-progress-stats">
                                <span class="m-progress-current">
                                </span>
                                /
                                <span class="m-progress-total">
                                </span>
                            </div>
                            <div class="m-progress-complete">
                                Completed
                            </div>
                        </div>
                    </div>
                    <div class="modal-body step-1" data-step="1">
                        This is step 1.
                    </div>
                    <div class="modal-body step-2" data-step="2">
                        This is the second step.
                    </div>
                    <div class="modal-body step-3" data-step="3">
                        This is the final step.
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary step step-2" data-step="2" onclick="sendEvent('#demo-modal-3', 1)">Back</button>
                        <button type="button" class="btn btn-primary step step-1" data-step="1" onclick="sendEvent('#demo-modal-3', 2)">Continue</button>
                        <button type="button" class="btn btn-primary step step-3" data-step="3" onclick="sendEvent('#demo-modal-3', 2)">Back</button>
                        <button type="button" class="btn btn-primary step step-2" data-step="2" onclick="sendEvent('#demo-modal-3', 3)">Continue</button>
                    </div>
                </div>
            </div>
        </form>
        <div class="container">
            <div class="row">
                <h1>
                    Simple Multi-step modal
                </h1>
                <button class="btn btn-default" data-toggle="modal" data-target="#demo-modal-1">Show</button>
            </div>
            <div class="row">
                <h1>
                    Progress bar and text  Multi-step modal
                </h1>
                <button class="btn btn-default" data-toggle="modal" data-target="#demo-modal-2">Show</button>
            </div>
            <div class="row">
                <h1>
                    Progress bar with back buttons
                </h1>
                <button class="btn btn-default" data-toggle="modal" data-target="#demo-modal-3">Show</button>
            </div>
        </div>
        <script src="<%=context%>//multi-step-modal.js"></script>
        <script>
                            sendEvent = function (sel, step) {
                                $(sel).trigger('next.m.' + step);
                            }
        </script>
    </body>
</html>
