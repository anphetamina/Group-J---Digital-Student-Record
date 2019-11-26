<?php
require_once("../../config.php");

$teacher = new teacher();

$site = new csite();
initialize_site($site);
$page = new cpage("Teacher");
$site->setPage($page);

if (!$teacher->is_logged() || $teacher->get_teacher_ID() == -1) {
    $content = '
    <div class="alert alert-warning" role="warning">
        You are not authorized. If you are in a hurry <a href="./index.php" class="alert-link">just click here!</a>
    </div> ';
    $content .= "<meta http-equiv='refresh' content='2; url=" . PLATFORM_PATH . "' />";
    $page->setContent($content);
    $site->render();
    exit();
}

if(isset($_GET['operation_result'])){
    switch ($_GET['operation_result']){
        case 1:
            $content.= <<<OUT
<div class="alert alert-success" role="alert">
  Grades successfully registered. <a href="insertGrades.php" class="alert-link">Keep registering grades</a> or <a href="../teacher/index.php" class="alert-link">back to your homepage.</a>
</div>
OUT;
            break;
        case 0:
            $content.= <<<OUT
<div class="alert alert-danger" role="alert">
 Error in uploading students' grades. <a href="insertGrades.php" class="alert-link">Retry </a> or <a href="../teacher/index.php" class="alert-link">back to your homepage.</a>
</div>
OUT;
            break;
        case -1:
            $content.= <<<OUT
<div class="alert alert-danger" role="alert">
 PATATE <a href="insertGrades.php" class="alert-link">Retry </a> or <a href="../teacher/index.php" class="alert-link">back to your homepage.</a>
</div>
OUT;
            break;
        default:
            $content.=<<<OUT
<div class="alert alert-dark" role="alert">
  Operation not allowed.
</div>
OUT;
    }


} else {

    $classes = $teacher->get_assigned_classes();
    $drop_down = "";
    for ($i = 0; $i < sizeof($classes); $i++) {
        $classID = $classes[$i]['ClassID'];
        $yearSection = $classes[$i]['YearClass'] . " " . $classes[$i]['Section'];
        $drop_down .= <<<OUT
                    <a class="dropdown-item" href="insertGrades.php?classID=$classID">$yearSection</a>
OUT;
    }
    if (!isset($_GET['classID']) && empty($_POST)) {

        $content = <<<OUT
                <div class="card text-center">
                  <div class="card-header">
                    Choose a class :
                    <div class="btn-group">
                  <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Class
                  </button>
                  <div class="dropdown-menu">
                    $drop_down
                  </div>
                </div>
                  </div>
                  <div class="card-body">
                    <p class="card-text">Select a class to insert a new grade.</p>
                  </div>
                </div>
                
OUT;
    } else if (isset($_GET['classID'])) {
        $students_info = $teacher->get_students_by_class_id($_GET['classID']);
        //$classID = $_GET['classID'];
        $subject_info = $teacher->get_topics($classID);
        $select_content = "";
        /*foreach($subject_info as $subject){

        }*/

        for ($i = 0; $i < sizeof($subject_info); $i++) {
            $subjectID = $subject_info[$i]['TopicID'];
            $subjectName = $subject_info[$i]['TopicName'];
            $select_content .= "<option value='$subjectID'>$subjectName</option>";
        }


        $table_content = '<div class="card-body">
                      <form method="post" class="form-inline" style="color:#757575" action="insertGrades.php">
                        <table class="table table-striped">
                      <thead>
                        <tr>
                          <th scope="col">#</th>
                          <th scope="col">Last Name</th>
                          <th scope="col">First Name</th>
                          <th scope="col">Insert Grade</th>
                        </tr>
                      </thead>
                      <tbody>';

        for ($i = 0; $i < sizeof($students_info); $i++) {
            $name = $students_info[$i]['Name'];
            $surname = $students_info[$i]['Surname'];
            $id = $students_info[$i]['ID'];
            $table_content .= <<<OUT
                            <tr>
                                <th scope="row">$i</th>
                                  <td>$surname</td>
                                  <td>$name</td>
                                  <td>
                                  <div class="form-group row">
                                  <div class="col-xs-2">
                                    <input type="number" id="materialRegisterFormGradeStudent$id" placeholder="grade" name="grade_$id" class="form-control" step="0.25" min="0" max="10">
                                  </div>
                                  <div class="col-xs-3">
                                    <select class='mdb-select md-form' name='subjectID_$id'>
                                    <option value="" disabled selected>Choose a subject</option>
                                    $select_content;
                                    </select>
                                  </div>
                                  
                                  <div class="col-xs-2">
                                   
                                    <label class="form-check-label" for="exampleCheck1">Laude:  <input type="checkbox" class="form-check-input" name="laude_$id" value="yes"></label>
                                  </div>
                                  </div>
                            </td>
                            </tr>
OUT;
        }

        $table_content .= '</tbody>
                        </table>
                        <button class="btn btn-outline-info btn-rounded btn-block my-4 waves-effect z-depth-0" type="submit">Submit</button>
                        </form>
                          </div>
                        </div>';
        $content = <<<OUT
                <div class="card text-center">
                  <div class="card-header">
                    You're in class $yearSection.
                    <div class="btn-group">
                      <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Change class
                      </button>
                      <div class="dropdown-menu">
                        $drop_down
                      </div>
                    </div>
                  </div>
                  <div class="card-body">
                  $table_content
OUT;
    } else if (!empty($_POST)) {
        $students_info = $teacher->get_students_by_class_id($classID);
        if(sizeof($students_info) == 0){
            header("Location: insertGrades.php?operation_result=-1");
            die();
        }
        for ($i = 0; $i < sizeof($students_info); $i++) {
            $id = $students_info[$i]['ID'];
            if(isset($_POST["subjectID_$id"]) && isset($_POST["grade_$id"])) {
                $now = date("Y-m-d H:i:s");
                $laude = false;
                $subID = (int)$_POST["subjectID_$id"];
                $grade = (int)$_POST["grade_$id"];
                if (isset($_POST["laude_$id"])) {
                    if ($_POST["laude_$id"] == 'yes')
                        $laude = true;
                }
                if (isset($_POST["grade_$id"])) {
                    $res = $teacher->insert_grade($id, $classID, $subID, $grade, $laude, $now);
                    if (!$res) {
                        header("Location: insertGrades.php?operation_result=0");
                        die();
                    }
                    header("Location: insertGrades.php?operation_result=1");
                    die();
                }
            }
        }
    }
}
$page->setContent($content);
$site->render();
