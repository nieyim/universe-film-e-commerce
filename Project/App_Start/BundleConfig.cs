using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;

namespace Project.App_Start
{
    public class BundleConfig
    {
        public static void RegisterBundle(BundleCollection bundle)
        {
            //-- Bundle for Public Pages CSS --
            bundle.Add(new StyleBundle("~/bundles/css1").Include("~/Content/bootstrap.min.css",
                                                                 "~/Content/font-awesome.min.css",
                                                                 "~/Content/elegant-icons.css",
                                                                 "~/Content/plyr.css",
                                                                 "~/Content/nice-select.css",
                                                                 "~/Content/owl.carousel.min.css",
                                                                 "~/Content/slicknav.min.css",
                                                                 "~/Content/style.css"));
            //-- Bundle for Private Pages CSS --
            bundle.Add(new StyleBundle("~/bundles/css2").Include("~/Media/vendors/bootstrap/dist/css/bootstrap.min.css",
                                                                 "~/Media/vendors/font-awesome/css/font-awesome.min.css",
                                                                 "~/Media/vendors/nprogress/nprogress.css",
                                                                 "~/Media/vendors/iCheck/skins/flat/green.css",
                                                                 "~/Media/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css",
                                                                 "~/Media/vendors/jqvmap/dist/jqvmap.min.css",
                                                                 "~/Media/vendors/bootstrap-daterangepicker/daterangepicker.css",
                                                                 "~/Media/vendors/bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.css",
                                                                 "~/Media/build/css/custom.min.css",
                                                                 "~/Media/vendors/dropzone/dist/min/dropzone.min.css",
                                                                 "~/Media/vendors/google-code-prettify/bin/prettify.min.css",
                                                                 "~/Media/vendors/datatables.net-bs/css/dataTables.bootstrap.min.css",
                                                                 "~/Media/vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css",
                                                                 "~/Media/vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css",
                                                                 "~/Media/vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css",
                                                                 "~/Media/vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css"));
            //-- Bundle for Public Pages Scripts --
            bundle.Add(new ScriptBundle("~/bundles/scripts1").Include("~/Scripts/jquery-3.3.1.min.js",
                                                                 "~/Scripts/bootstrap.min.js",
                                                                 "~/Scripts/player.js",
                                                                 "~/Scripts/jquery.nice-select.min.js",
                                                                 "~/Scripts/mixitup.min.js",
                                                                 "~/Scripts/jquery.slicknav.js",
                                                                 "~/Scripts/owl.carousel.min.js",
                                                                 "~/Scripts/main.js"));
            //-- Bundle for Private Pages Scripts --
            bundle.Add(new ScriptBundle("~/bundles/scripts2").Include("~/Media/vendors/jquery/dist/jquery.min.js",
                                                                      "~/Media/vendors/bootstrap/dist/js/bootstrap.min.js",
                                                                      "~/Media/vendors/fastclick/lib/fastclick.js",
                                                                      "~/Media/vendors/nprogress/nprogress.js",
                                                                      "~/Media/vendors/Chart.js/dist/Chart.min.js",
                                                                      "~/Media/vendors/gauge.js/dist/gauge.min.js",
                                                                      "~/Media/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js",
                                                                      "~/Media/vendors/iCheck/icheck.min.js",
                                                                      "~/Media/vendors/skycons/skycons.js",
                                                                      "~/Media/vendors/Flot/jquery.flot.js",
                                                                      "~/Media/vendors/Flot/jquery.flot.pie.js",
                                                                      "~/Media/vendors/Flot/jquery.flot.time.js",
                                                                      "~/Media/vendors/Flot/jquery.flot.stack.js",
                                                                      "~/Media/vendors/Flot/jquery.flot.resize.js",
                                                                      "~/Media/vendors/flot.orderbars/js/jquery.flot.orderBars.js",
                                                                      "~/Media/vendors/flot-spline/js/jquery.flot.spline.min.js",
                                                                      "~/Media/vendors/flot.curvedlines/curvedLines.js",
                                                                      "~/Media/vendors/DateJS/build/date.js",
                                                                      "~/Media/vendors/jqvmap/dist/jquery.vmap.js",
                                                                      "~/Media/vendors/jqvmap/dist/maps/jquery.vmap.world.js",
                                                                      "~/Media/vendors/jqvmap/examples/js/jquery.vmap.sampledata.js",
                                                                      "~/Media/vendors/moment/min/moment.min.js",
                                                                      "~/Media/vendors/bootstrap-daterangepicker/daterangepicker.js",
                                                                      "~/Media/vendors/bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js",
                                                                      "~/Media/build/js/custom.min.js",
                                                                      "~/Media/vendors/dropzone/dist/min/dropzone.min.js",
                                                                      "~/Media/vendors/bootstrap-wysiwyg/js/bootstrap-wysiwyg.min.js",
                                                                      "~/Media/vendors/jquery.hotkeys/jquery.hotkeys.js",
                                                                      "~/Media/vendors/google-code-prettify/src/prettify.js",
                                                                      "~/Media/vendors/datatables.net/js/jquery.dataTables.min.js",
                                                                      "~/Media/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js",
                                                                      "~/Media/vendors/datatables.net-buttons/js/dataTables.buttons.min.js",
                                                                      "~/Media/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js",
                                                                      "~/Media/vendors/datatables.net-buttons/js/buttons.flash.min.js",
                                                                      "~/Media/vendors/datatables.net-buttons/js/buttons.html5.min.js",
                                                                      "~/Media/vendors/datatables.net-buttons/js/buttons.print.min.js",
                                                                      "~/Media/vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js",
                                                                      "~/Media/vendors/datatables.net-keytable/js/dataTables.keyTable.min.js",
                                                                      "~/Media/vendors/datatables.net-responsive/js/dataTables.responsive.min.js",
                                                                      "~/Media/vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js",
                                                                      "~/Media/vendors/datatables.net-scroller/js/dataTables.scroller.min.js",
                                                                      "~/Media/vendors/jszip/dist/jszip.min.js",
                                                                      "~/Media/vendors/pdfmake/build/pdfmake.min.js",
                                                                      "~/Media/vendors/pdfmake/build/vfs_fonts.js"));
        }
    }
}