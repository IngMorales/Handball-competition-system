<!DOCTYPE html>
<html lang="es-CO">
<?php
include 'frontend/head.php';
?>

<body class="hold-transition sidebar-mini layout-fixed">
  <div class="wrapper">
    <?php
    include 'frontend/nav.php';
    include 'frontend/menu.php';
    ?>

    <div class="content-wrapper">
      <div class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1 class="m-0 text-dark">Principal</h1>
            </div>
          </div>
        </div>
      </div>

      <section class="content">

        <?php
        //CONTENIDO
        include 'frontend/barra_superior.php';
        include 'vistas/vista_principal.php';
        ?>
      </section>
    </div>
      
  </div>

  <?php
  include 'frontend/footer.php';
  ?>

  <aside class="control-sidebar control-sidebar-dark"></aside>

  <?php
  include 'frontend/scripts.php';
  ?>
</body>
</html>