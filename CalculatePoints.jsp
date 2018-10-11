<%-- 
    Document   : CalculatePoints
    Created on : Jul 18, 2018, 9:24:52 AM
    Author     : Janaka_5977
--%>

<%@include file="../Common/Header.jsp" %>

<div class="w3-container" style="margin-left:18%">
    <h2>Calculate</h2>
    <p>To highlight the current tab/page the user is on, add a color class, and use JavaScript to update the active link.</p>
</div>

<div class="w3-container" style="margin-left:18%">

    

    <section class="content">
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <form class="form-horizontal" method="POST"  action="CalculatePointsController" enctype="multipart/form-data" style="padding-left: 20px">
                        <div class="box-body">
                            <div class="form-group">
                                <label for="exampleInputFile">Employees Cross Selling Target Values File input</label>
                                <input type="file" id="targetValues" name="targetValues" accept=".csv">
                                <input type="text" id="yearMonthFrom" name="yearMonthFrom" value="201802">
                                <input type="text" id="yearMonthTo" name="yearMonthTo" value="201810">
                                <p class="help-block">Pick the holiday file for upload</p>
                            </div>
                        </div><!-- /.box-body -->
                        <div class="box-footer">
                            <button type="submit" class="btn btn-info pull-right" style="width: 100px" id="btn_holiday_clear">Cancel</button>
                            <button type="submit" class="btn btn-info pull-right" id="form_submit_button" style="width: 100px">Submit</button>
                        </div><!-- /.box-footer -->
                    </form>
                </div><!-- /.box -->


            </div><!-- /.box -->
        </div>


    </section>
</div>

<script>


</script>

<%@include file="../Common/Footer.jsp" %>
